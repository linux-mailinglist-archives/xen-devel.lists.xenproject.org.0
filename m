Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9859A4867AB
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 17:30:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254161.435747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5VeR-0005kG-42; Thu, 06 Jan 2022 16:30:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254161.435747; Thu, 06 Jan 2022 16:30:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5VeQ-0005hs-WB; Thu, 06 Jan 2022 16:30:06 +0000
Received: by outflank-mailman (input) for mailman id 254161;
 Thu, 06 Jan 2022 16:30:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiBy=RW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1n5VeP-0005c2-Jb
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 16:30:05 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6d667ca-6f0d-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 17:30:04 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id o12so6155035lfk.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jan 2022 08:30:04 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q125sm224862ljq.77.2022.01.06.08.30.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 08:30:03 -0800 (PST)
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
X-Inumbo-ID: e6d667ca-6f0d-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=UllSuNJvEOMxJSNUISXI/xT9nV9RGkc86WUay+pnuRQ=;
        b=cEebJXWvxAYn6G0qcJ8aQAJdmLgYtEfERm8xXDlig00u/jj4KutatyXW1dtomqiZLX
         gxl3jjw5HSrxRTuiyD0ohyRKHTtxyUy7kOpm9DbARwgt95dWH8aenH4i+yhwlNAiBRGJ
         2ngA3Is3MNNi5wt90dgzdiNmX8KlsC67x5Q9O7weHSURZ+TcpuXj3KBXQ1mEb80ZYTY4
         ByalnZ+8IdRgC6kG81e+xMom6tCkD2p9NkkbD/Nly0hMaZrkIhp/hKimRGwjGiLg6lgO
         +vjp5AZKjbcDHJJck1DBI6NJPCByCPPCVtR/O0yRxxUt2hHlyhnLVb+avMSLb4NOqjPs
         8k5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=UllSuNJvEOMxJSNUISXI/xT9nV9RGkc86WUay+pnuRQ=;
        b=n2cFiBkOa04fC0c7WPmh2eGv7A1vmDQ7n3WPyy6k2u0HFgIu9qXu7VtESyN2uQEqek
         +QHFKva+wZWwZ6fDeAySgWvGzM97bk2zZadsEVP8DKiIEX8At2F7vGfNzek/MKhheBoh
         Dzv68brZXjTGZTtmR8dXe1X3g4sb8haOACmwtvZnFg8u/eN2YxNc1TTkfTc/lEd7HPyN
         43g9vx01bPHJhIz4l8ixOINI1kecxyclpTv4qf4nCJ48iEuVJA836/x9P6+iLAkh4v3N
         2A0cBTb0e5a/W3E9L+7wfmxhRj1I1iZVXSDcI8PsWHqsdL2mBSXSx196KmKIYtt43gF9
         e7wg==
X-Gm-Message-State: AOAM531h7nUPYxyZVGEunYecEYSUPPAIwwoOtXrQsBzlEhiI6O0Qcgbu
	a3SS+xdG3rYgoxFJWWGBmNC58lXPOEs=
X-Google-Smtp-Source: ABdhPJxbpMYC5YYfKVsfiiLvBIIedqZenlgThI9Up7VXciwOJ7ipFIrFKqfQgbnuQZSw6pWWEIFH8g==
X-Received: by 2002:a05:6512:220b:: with SMTP id h11mr52762003lfu.427.1641486603320;
        Thu, 06 Jan 2022 08:30:03 -0800 (PST)
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a7a905fe-3feb-507a-7ce4-ed7dce78de86@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <aeba1af9-8386-3bca-dfbd-1c9110ae09de@gmail.com>
Date: Thu, 6 Jan 2022 18:30:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a7a905fe-3feb-507a-7ce4-ed7dce78de86@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 06.01.22 16:20, Jan Beulich wrote:


Hi Jan

> On 06.01.2022 00:11, Oleksandr Tyshchenko wrote:
>> --- a/xen/arch/x86/include/asm/mm.h
>> +++ b/xen/arch/x86/include/asm/mm.h
>> @@ -57,6 +57,9 @@
>>   #define PGT_count_width   PG_shift(8)
>>   #define PGT_count_mask    ((1UL<<PGT_count_width)-1)
>>   
>> +/* No arch-specific initialization pattern is needed for the type_info field. */
>> +#define PGT_TYPE_INFO_INIT_PATTERN   0
> I think this should be inside an #ifndef in page_alloc.c.


ok, will do.

I hope you meant the following:

#ifndef PGT_TYPE_INFO_INIT_PATTERN
#define PGT_TYPE_INFO_INIT_PATTERN 0
#endif


>
> Also the name suggests usage for all kinds of pages, as you did
> outline on the v4 thread. Yet ...
>
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -2159,6 +2159,7 @@ void init_xenheap_pages(paddr_t ps, paddr_t pe)
>>   void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>>   {
>>       struct page_info *pg;
>> +    unsigned int i;
>>   
>>       ASSERT(!in_irq());
>>   
>> @@ -2167,6 +2168,9 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>>       if ( unlikely(pg == NULL) )
>>           return NULL;
>>   
>> +    for ( i = 0; i < (1u << order); i++ )
>> +        pg[i].u.inuse.type_info |= PGT_TYPE_INFO_INIT_PATTERN;
>> +
>>       return page_to_virt(pg);
>>   }
>>   
>> @@ -2214,7 +2218,10 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>>           return NULL;
>>   
>>       for ( i = 0; i < (1u << order); i++ )
>> +    {
>>           pg[i].count_info |= PGC_xen_heap;
>> +        pg[i].u.inuse.type_info |= PGT_TYPE_INFO_INIT_PATTERN;
>> +    }
>>   
>>       return page_to_virt(pg);
>>   }
> ... you now only use it in alloc_xenheap_pages().

Yes, I decided to go with your initial suggestion to OR the pattern here.


>
> Further, did you check that when the value is 0 the compiler would
> fully eliminate the new code in both flavors of the function?


No, I didn't. But I have just rechecked on Arm64 
(!CONFIG_SEPARATE_XENHEAP) and Arm32 (CONFIG_SEPARATE_XENHEAP).
If I remove PGT_TYPE_INFO_INIT_PATTERN definition from Arm's header I 
don't see any assembler output generated for following expression in 
both cases:
pg[i].u.inuse.type_info |= PGT_TYPE_INFO_INIT_PATTERN;
where PGT_TYPE_INFO_INIT_PATTERN is 0


>
> Finally, leaving aside the aspect of where the value should be used,
> and also leaving aside the fact that the T in PGT is redundant with
> TYPE_INFO, I think something like PGT_TYPE_INFO_INITIALIZER would be
> better than having "pattern" in the name. But this may just be me ...

I am perfectly fine with new name.


In case you don't have any other objections shall I re-push v5.1 with 
proposed adjustments now?


Thank you.


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


