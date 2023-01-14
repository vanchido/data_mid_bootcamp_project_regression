-- 1 -- 2 Create a table house_price_data with the same columns as given in the csv file. Please make sure you use the correct data types for the columns.

use house_price_regression;

CREATE TABLE houses_price_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    bedrooms INT,
    bathrooms DECIMAL(5,2),
    sqft_living INT,
    sqft_lot INT,
    floors DECIMAL(5,2),
    waterfront INT,
    view INT,
    condition_ INT,
    grade INT,
    sqft_above INT,
    sqft_basement INT,
    yr_built INT,
    yr_renovated INT,
    zipcode INT,
    lat DECIMAL(10,8),
    long_ DECIMAL(11,8),
    sqft_living15 INT,
    sqft_lot15 INT,
    price DECIMAL(20,2)
);

select * from houses_price_data;

-- 3 didnt make the step 3 because I "Import wizard"

-- 4

select * from houses_price_data;

-- 5

Alter table houses_price_data
drop column date;

-- 6

SELECT COUNT(*) FROM houses_price_data;

-- 7

select * from houses_price_data;

select distinct bedrooms from houses_price_data;
select distinct bathrooms from houses_price_data;
select distinct foors from houses_price_data;
select distinct condition_ from houses_price_data;
select distinct grade from houses_price_data;

-- 8

select id, price from houses_price_data
order by price desc
limit 10;

-- 9

select avg(price) average_price from houses_price_data;

-- 10 in the order

select bedrooms, avg(price) avg_price from houses_price_data
group by bedrooms
order by bedrooms asc;

select bedrooms, avg(sqft_living) avg_sqft_living from houses_price_data
group by bedrooms
order by bedrooms asc;

select waterfront, avg(price) average_wtf_price from houses_price_data
group by waterfront;

select grade, avg(price) average_price from houses_price_data
group by grade
order by grade asc; -- we can see here by ordering like this that there is indeed a correlation, low grade means lower price

-- 11 

select * from houses_price_data
where (bedrooms = 3 or bedrooms = 4)
AND bathrooms > 3
AND floors = 1
AND waterfront = 0
AND condition_ >= 3
AND grade >= 5
AND price < 300000;

-- Real estate agent to the customer : "Sir you are delusionnal"

-- 12

select avg(price) from houses_price_data;

select * from houses_price_data
where price > ( 
select avg(price) * 2 from houses_price_data
);

-- 13

CREATE VIEW expensive_houses AS SELECT * FROM houses_price_data
 WHERE price > ( 
 select avg(price) * 2 from houses_price_data
 );

-- 14

SELECT AVG(CASE WHEN bedrooms = 4 THEN price END) - AVG(CASE WHEN bedrooms = 3 THEN price END) AS difference
FROM houses_price_data;

-- 15

select distinct zipcode from houses_price_data;

-- 16

select * from houses_price_data
where yr_renovated <> 0;

-- 17

SELECT * FROM houses_price_data
ORDER BY price DESC
LIMIT 10, 1;









