Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA6F8C5610
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 14:36:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721474.1124914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rNp-00067e-Qq; Tue, 14 May 2024 12:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721474.1124914; Tue, 14 May 2024 12:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6rNp-00065H-Ns; Tue, 14 May 2024 12:35:53 +0000
Received: by outflank-mailman (input) for mailman id 721474;
 Tue, 14 May 2024 12:35:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6rNo-00065B-Pj
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 12:35:52 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fd8e58f-11ee-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 14:35:51 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59c5c9c6aeso1984066b.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 05:35:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781ce3fsm719053266b.4.2024.05.14.05.35.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 05:35:51 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7fd8e58f-11ee-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715690151; x=1716294951; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ytjp0ZQ9pzO1BDsCUdFRdYK9I9TqClMxI7mpuhutEEM=;
        b=On1MbY3TXKGuUl0DoSItSB+G6av4MGnk55DC0jfUTbeqmQqMNUTBqtcY8TxtB7Y1WI
         gIZI3X4jj0rvmJntlDES/pPzaeTHTBEYBy0wi9HkZ/5REFypm7ZD32yqy6ihbtzTNRyb
         RYouGZn5gatT5+gLWuwIQQPiwVKBTK7yJYjZTBKkovvioxc6hBInLBC6PnM3kVwSbr+f
         C/mGvvoNqk9AKnKOozwB/Ogngs+Toq0PEWlPxCA5b3LC+avv2sPL1DUt+dncXpCTXK7X
         jNbtUEEnUkGjsvIjGXArYem9t34DhUzoRrmQUrY0vWMCKex1o/havrh1IUjWQybmxOaf
         rKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715690151; x=1716294951;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ytjp0ZQ9pzO1BDsCUdFRdYK9I9TqClMxI7mpuhutEEM=;
        b=c/s6mQajOb9vDc+/iDrGJlqfwfsNdLL9Bg0zCT/YyLUlxn+ayXTBEd5awP5+7tY/+z
         7Y3UJzE4Kzh9Hgk8cmyVhk0JRAShtY2rub45gZHFR2y2XeVpDXoR2xygmQgAFveHJm4u
         ErGnM0Gs3K/BV8nw47QmUs86u7VjNog9VaydFLR5Q+eavdxpWjuzrzLOLKA7STAiCJW/
         fP6G4X5PUm9b4lPoCxevckV8mnylq/Mm8GiadiwyfxsrMNy4qyZW2KtNa2ixf9HryxWW
         0n2ixA0RHlSo663SUncT64NKqVaDvTfuvQof5tXIvgep9Rh2OGhGyGuEEY+Btka4giGg
         UM7w==
X-Forwarded-Encrypted: i=1; AJvYcCUaJOkEVStlG5LY1sHaD/+Usa+0krrX+AcghTTJndpr2pRZybVAxv9sG77iAdlMoN/tUth6Lr7X/pxrHdkH4HjlTFjv80s2Wlxbgg6+eOc=
X-Gm-Message-State: AOJu0YwhSxZRt7AnCr54/qbuV90t11J5JbSD1/Ms/AK+zFARyI64hem4
	DidfGGERwqZAs6GPA7P7VA/PWygqmNtPM8cOQYlX7Pg196RZReRHQHWQ3APZQg==
X-Google-Smtp-Source: AGHT+IGw4qWfr6bW+gfEvm0osWRfcCN5FzTJu8ZFOzZUg2q5PaHpBIkkTEBuiD944N7NXpAJOlDk2w==
X-Received: by 2002:a17:907:7da3:b0:a58:e3d9:e2d6 with SMTP id a640c23a62f3a-a5a2d672f76mr1089417566b.56.1715690151295;
        Tue, 14 May 2024 05:35:51 -0700 (PDT)
Message-ID: <c39e3c5b-1b6b-447e-93a9-46457535436b@suse.com>
Date: Tue, 14 May 2024 14:35:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] tools/xentop: fix cpu% sort order
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20240514081344.4499-1-leigh@solinno.co.uk>
 <195184dd-46e3-4bd0-b82b-cf41000e4db1@citrix.com>
Cc: Leigh Brown <leigh@solinno.co.uk>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <195184dd-46e3-4bd0-b82b-cf41000e4db1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.05.2024 14:07, Andrew Cooper wrote:
> On 14/05/2024 9:13 am, Leigh Brown wrote:
>> Although using integer comparison to compare doubles kind of
>> works, it's annoying to see domains slightly out of order when
>> sorting by cpu%.
>>
>> Add a compare_dbl() function and update compare_cpu_pct() to
>> call it.
>>
>> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
>> ---
>>  tools/xentop/xentop.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
>> index 545bd5e96d..99199caec9 100644
>> --- a/tools/xentop/xentop.c
>> +++ b/tools/xentop/xentop.c
>> @@ -85,6 +85,7 @@ static void set_delay(const char *value);
>>  static void set_prompt(const char *new_prompt, void (*func)(const char *));
>>  static int handle_key(int);
>>  static int compare(unsigned long long, unsigned long long);
>> +static int compare_dbl(double, double);
>>  static int compare_domains(xenstat_domain **, xenstat_domain **);
>>  static unsigned long long tot_net_bytes( xenstat_domain *, int);
>>  static bool tot_vbd_reqs(xenstat_domain *, int, unsigned long long *);
>> @@ -422,6 +423,16 @@ static int compare(unsigned long long i1, unsigned long long i2)
>>  	return 0;
>>  }
>>  
>> +/* Compares two double precision numbers, returning -1,0,1 for <,=,> */
>> +static int compare_dbl(double d1, double d2)
>> +{
>> +	if(d1 < d2)
>> +		return -1;
>> +	if(d1 > d2)
>> +		return 1;
>> +	return 0;
>> +}
>> +
>>  /* Comparison function for use with qsort.  Compares two domains using the
>>   * current sort field. */
>>  static int compare_domains(xenstat_domain **domain1, xenstat_domain **domain2)
>> @@ -523,7 +534,7 @@ static double get_cpu_pct(xenstat_domain *domain)
>>  
>>  static int compare_cpu_pct(xenstat_domain *domain1, xenstat_domain *domain2)
>>  {
>> -	return -compare(get_cpu_pct(domain1), get_cpu_pct(domain2));
>> +	return -compare_dbl(get_cpu_pct(domain1), get_cpu_pct(domain2));
> 
> Oh, we were doing an implicit double->unsigned long long conversion. 
> Over the range 0.0 to 100.0, that ought to work as expected.  What kind
> of out-of-order are you seeing?
> 
> Nevertheless, this should comparison should clearly be done using
> doubles.  AFACT, get_cpu_pct() shouldn't ever return a NaN, so I think
> this simple form is fine.

Just for completeness: INF would be similarly an issue, but hopefully cannot
come back from get_cpu_pct() either.

Jan

