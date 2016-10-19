---
title: "R Project Accidents"
author: "Venkata sai"
date: "October 14, 2016"
output: word_document
---



```{r}
#Import the raw dataset
Traffic_Violations <-read.csv("C:/Users/venkat/Downloads/Traffic_Violations.csv")
#Check for missing values#
Tfv_data1=na.omit(Traffic_Violations)
library(xts)
#Change the datatype of date
Tfv_data1$Date<-strptime(Tfv_data1$Date.Of.Stop, format = '%m/%d/%Y')
datewise<-as.data.frame(table(Tfv_data1$Date.Of.Stop))
head(datewise)
datewise$date<-strptime(datewise$Var1, format = '%m/%d/%Y')
datewise<-xts(datewise,order.by = datewise$date)
library(dygraphs)
head(datewise)
datewise$date<-NULL
names(datewise)<-c("Date","No of Accidents")
dygraph(datewise, main = "Traffic Violations By Day") %>% 
  dyRangeSelector(dateWindow = c("2013-01-01", "2016-06-01")) %>%
dySeries("No of Accidents",strokeWidth = 1, col = "green")
```

