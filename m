Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F639EE51F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 12:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.855825.1268629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhSQ-0000EG-PO; Thu, 12 Dec 2024 11:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 855825.1268629; Thu, 12 Dec 2024 11:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLhSQ-0000BW-M9; Thu, 12 Dec 2024 11:34:14 +0000
Received: by outflank-mailman (input) for mailman id 855825;
 Thu, 12 Dec 2024 11:34:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLhSP-0000BQ-Al
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 11:34:13 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdd17a70-b87c-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 12:34:04 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa1e6ecd353so67015566b.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 03:34:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa674a112c7sm691758866b.147.2024.12.12.03.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 03:34:08 -0800 (PST)
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
X-Inumbo-ID: fdd17a70-b87c-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734003249; x=1734608049; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tgZ+WFUVZlvnULNLaYqU6aMaHAUoT5n16fVxjwQ2LIM=;
        b=KUoiLWUWS4aNQ44ZlHJ5+7Wb9r3bul77Pseo50lR9pfAxwSgOUb4r+bBD0UUYWocaR
         h91AbgyBT0HTrXmdOhty3lkw0GNILY5orxGVDCQclXGdaxkIN5R9UGgy7hAztJVoFaOK
         YoBHk+71yzwLDvzoYukZrq4SDV6xTCO6ioKgfjG2bMECNKWJNlscGIEU/cUWETgH6/yd
         zhvzoPpWR7s1zjY0CZPadQU5TSHXeZxSpQRl1o0jfIoG9opvdUfcHEb7nr+A8SesqcjN
         ZFymEUDyUNpW4xGkkRlasqvuAxxj3RMzZJc7tvb/jB9g9Kfsp+Vy13hu/htoyyHed7Y4
         u+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734003249; x=1734608049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgZ+WFUVZlvnULNLaYqU6aMaHAUoT5n16fVxjwQ2LIM=;
        b=XBRQsIDN+6+DYu/27fJC90NtGMIFMj/MBMIaL3s5uGHHfCdJD+gRgAq8rvrqDRxJ7Y
         FCARP2+wCDxTAj346lrsqfODrBWj3iGjg9QacBn2JHCjL/D9gzELbGMkozvmedptCtpr
         Lyr19/sk0DbAI9KQlgCLJZDk160GE4UMf7AvJSWRhH/R7B1eBWeh8uYkMeDPtQmo0bPy
         9MWygnDMjXFD9Z6QYysU3DZv7fewm3wXi3c6szwG3nyj9Yhugan8iuZnnLXYmuWp7w9S
         V5evAeIrnucDqp+ec9lnOSC9q0oBJN02VhCa4NL1ayfQakmxYpiGOz7I9VDKfkx+zQEq
         E2Dg==
X-Forwarded-Encrypted: i=1; AJvYcCULx68CMxur+KcMilBkU7i4ZB33k5eRM1JfFp0fyulewLZuDbO2kQCtsCQ1HwfNDlxbuYEHrqIfzNs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypWyn8aHEtJE3C06iMaiRQSl6AzvToVAy+GOO8QtMZSP/8JqP5
	WkwWbBUt8qbgoxIbxUEWYi9tZzUrCl81KO66ajeOKoWMbdhNiU2Z0IPYil6JMg==
X-Gm-Gg: ASbGnct3HLs1notWss97WwfHshmdfbKrDzNfjlctLQcxdmKmHVk0Qh57QRt5b8iHiba
	fGQugtcWT7TMYZbkFWot4oIuRK7a395AH+GF7fTU7zzhq7RJGyYY9753peuhwgMlw0A3+9f66eE
	bzpeTlo4wtM5DskEPxSeYi3ad0mat9HSWFD9FCKkUts9YNlHK5zRlrdbmtJJF7nawRGgrnx1M5N
	r0RAxFvDThKA4MWgkHDaL+StuBplp+H+gg/T30h4WBBLy3YglbUGJZjqfykDWDKf4lhG18y6i9x
	54XjW0k9AGSMUE9Fzhsph3ZU4dSf4JbuhpOxMWduXw==
X-Google-Smtp-Source: AGHT+IEDHJFE18dKzfxJ9I1X5eFqw1+YMqGW5/slpwSAE/Pm44xDDJRaiONeVdYUmP/9Vd2wWNfFWQ==
X-Received: by 2002:a05:6402:2809:b0:5d3:da65:ff26 with SMTP id 4fb4d7f45d1cf-5d4fa1b29a2mr1585631a12.31.1734003249080;
        Thu, 12 Dec 2024 03:34:09 -0800 (PST)
Message-ID: <70463137-e91d-4a81-a946-e44425275922@suse.com>
Date: Thu, 12 Dec 2024 12:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/15] x86/hyperlaunch: add memory parsing to domain
 config
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-14-dpsmith@apertussolutions.com>
 <e01af196-9f6d-4fde-a118-2875744d5865@suse.com>
 <0e68ddfe-6736-4abe-b139-acd80a4bdedc@apertussolutions.com>
Content-Language: en-US
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
In-Reply-To: <0e68ddfe-6736-4abe-b139-acd80a4bdedc@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2024 19:02, Daniel P. Smith wrote:
> On 12/2/24 07:14, Jan Beulich wrote:
>> On 23.11.2024 19:20, Daniel P. Smith wrote:
>>> @@ -160,6 +161,42 @@ static int __init process_domain_node(
>>>               else
>>>                   printk("PV\n");
>>>           }
>>> +        if ( match_fdt_property(fdt, prop, "memory" ) )
>>> +        {
>>> +            uint64_t kb;
>>> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
>>> +            {
>>> +                printk("  failed processing memory for domain %s\n",
>>> +                       name == NULL ? "unknown" : name);
>>> +                return -EINVAL;
>>> +            }
>>> +            bd->mem_pages = PFN_DOWN(kb * SZ_1K);
>>> +            printk("  memory: %ld\n", bd->mem_pages << PAGE_SHIFT);
>>> +        }
>>> +        if ( match_fdt_property(fdt, prop, "mem-min" ) )
>>> +        {
>>> +            uint64_t kb;
>>> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
>>> +            {
>>> +                printk("  failed processing memory for domain %s\n",
>>> +                       name == NULL ? "unknown" : name);
>>> +                return -EINVAL;
>>> +            }
>>> +            bd->min_pages = PFN_DOWN(kb * SZ_1K);
>>> +            printk("  min memory: %ld\n", bd->min_pages << PAGE_SHIFT);
>>> +        }
>>> +        if ( match_fdt_property(fdt, prop, "mem-max" ) )
>>> +        {
>>> +            uint64_t kb;
>>> +            if ( fdt_prop_as_u64(prop, &kb) != 0 )
>>> +            {
>>> +                printk("  failed processing memory for domain %s\n",
>>> +                       name == NULL ? "unknown" : name);
>>> +                return -EINVAL;
>>> +            }
>>> +            bd->max_pages = PFN_DOWN(kb * SZ_1K);
>>> +            printk("  max memory: %ld\n", bd->max_pages << PAGE_SHIFT);
>>> +        }
>>
>> Since the values logged are all multiples of 1k, why make reading the logs
>> more complicated by logging byte-granular values? I instead wonder whether
>> converting to more coarse grained values (leaving, say, between 4 and 6
>> significant digits while using kb, Mb, Gb, etc) wouldn't be yet better.
> 
> Sure we can make it report in a friendlier format. To support dynamic 
> sizing, is there already an existing formatter, I would hate to 
> re-invent the wheel on this, or I could just statically report in kb.

I don't recall use having any formatter for this, so for now I'd just report
kb values.

Jan

