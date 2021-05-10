Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FED37975D
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 21:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125496.236237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgBCJ-0003FB-Ej; Mon, 10 May 2021 19:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125496.236237; Mon, 10 May 2021 19:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgBCJ-0003Cy-Aj; Mon, 10 May 2021 19:04:07 +0000
Received: by outflank-mailman (input) for mailman id 125496;
 Mon, 10 May 2021 19:04:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nDnD=KF=gmail.com=f.fainelli@srs-us1.protection.inumbo.net>)
 id 1lgBCH-0003BL-BX
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 19:04:05 +0000
Received: from mail-pf1-x42f.google.com (unknown [2607:f8b0:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ad01582-94e5-46c3-bad9-720e96ba5b3c;
 Mon, 10 May 2021 19:04:04 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id v191so14258452pfc.8
 for <xen-devel@lists.xenproject.org>; Mon, 10 May 2021 12:04:04 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id p19sm11552318pff.206.2021.05.10.12.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 12:04:03 -0700 (PDT)
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
X-Inumbo-ID: 3ad01582-94e5-46c3-bad9-720e96ba5b3c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WQ3UlPMi8iO1JweMxxShHAfYCCuhz0sN8zAS6TXgeZ8=;
        b=vd4BMadKXX2VYgCwHP2rz/WhOyv8UV+3Nk1yGWi1MWwBuhF4Mb4GRq5sxXn4AEuYdL
         dLlUqxkd1lWXDByZ2We6cegOkUUHrhOH5WFhT/RnRyS9O9Ma2v674hwJ2hbrWTiO0Mjw
         ny/SeUMfYOLdb3OSL9sDDLLyfsgNEU2inDnK2LmM6HmtSLKhrxmST9EVM8PtIP57ze7e
         0gFip1GIGoXL9gpDsnDbeyh7x8uqVeW4m8YXy3Pjh79KTVGWJRDitG6EjQXkm0j3vOGN
         UUGKo2g7dnwrzaPC8gzO4YFIBXKvsREJrkxf0gSESM3qCHywcPiSFYG34qYlPYQbZ+T3
         Gb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WQ3UlPMi8iO1JweMxxShHAfYCCuhz0sN8zAS6TXgeZ8=;
        b=D659gopH5+SwcUQZSE/36L8zgrYdCKSC+3EZ/7V0mywbOXIlXTfrd3g7xnfwdhbB1a
         3N8TuCB13C9MYKWXxaVaAX495wpTzd/BPvQ/jkeNKZpYZoUoFRbx9d0PIXZiIqYKdWLN
         EyFUNxUohrFi6IdYhDFJzn3mz2iShnQpbKVBSJ3BZR1cTb5NxTG//7OGqv2LyON2xv89
         ZEB1hDFsCvc2XM98cfQbUg9xE9dwatT2lDY6PKtKIhS71VcH4iUDyETUlwF8cyO/JqGo
         f6SwLOyQFLbUS6pV/4aT5u5SorpAJ2JXK9zBnJ9oqGkn1B3L8gOXST9Exhj4BKJnaXHB
         Sbuw==
X-Gm-Message-State: AOAM533W8ob0ZPemHjD0m8L3Y2BXBlxPyKhPIIhVLWPOfeTB7ElSeUqy
	UaKGxDgQDxAgUpV0q5sxqnI=
X-Google-Smtp-Source: ABdhPJyfcWJULySA3pD+719piBeBcWvrLBFc8WnyM7QHhcOIc5yXuHy57rzrSbcSkDQFpBH4yBwBvw==
X-Received: by 2002:a63:e30d:: with SMTP id f13mr22059947pgh.201.1620673443541;
        Mon, 10 May 2021 12:04:03 -0700 (PDT)
Subject: Re: Regression when booting 5.15 as dom0 on arm64 (WAS: Re:
 [linux-linus test] 161829: regressions - FAIL)
To: Julien Grall <julien@xen.org>, Christoph Hellwig <hch@lst.de>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 linux-kernel@vger.kernel.org,
 osstest service owner <osstest-admin@xenproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 iommu@lists.linux-foundation.org
References: <osstest-161829-mainreport@xen.org>
 <4ea1e89f-a7a0-7664-470c-b3cf773a1031@xen.org> <20210510084057.GA933@lst.de>
 <8b851596-acf7-9d3b-b08a-848cae5adada@xen.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <2c19af0b-e4c1-4f57-19cd-a86b4dc18c35@gmail.com>
Date: Mon, 10 May 2021 12:04:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8b851596-acf7-9d3b-b08a-848cae5adada@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 5/10/2021 11:15 AM, Julien Grall wrote:
> Hi Christoph,
> 
> On 10/05/2021 09:40, Christoph Hellwig wrote:
>> On Sat, May 08, 2021 at 12:32:37AM +0100, Julien Grall wrote:
>>> The pointer dereferenced seems to suggest that the swiotlb hasn't been
>>> allocated. From what I can tell, this may be because swiotlb_force is
>>> set
>>> to SWIOTLB_NO_FORCE, we will still enable the swiotlb when running on
>>> top
>>> of Xen.
>>>
>>> I am not entirely sure what would be the correct fix. Any opinions?
>>
>> Can you try something like the patch below (not even compile tested, but
>> the intent should be obvious?
>>
>>
>> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
>> index 16a2b2b1c54d..7671bc153fb1 100644
>> --- a/arch/arm64/mm/init.c
>> +++ b/arch/arm64/mm/init.c
>> @@ -44,6 +44,8 @@
>>   #include <asm/tlb.h>
>>   #include <asm/alternative.h>
>>   +#include <xen/arm/swiotlb-xen.h>
>> +
>>   /*
>>    * We need to be able to catch inadvertent references to memstart_addr
>>    * that occur (potentially in generic code) before
>> arm64_memblock_init()
>> @@ -482,7 +484,7 @@ void __init mem_init(void)
>>       if (swiotlb_force == SWIOTLB_FORCE ||
>>           max_pfn > PFN_DOWN(arm64_dma_phys_limit))
>>           swiotlb_init(1);
>> -    else
>> +    else if (!IS_ENABLED(CONFIG_XEN) || !xen_swiotlb_detect())
>>           swiotlb_force = SWIOTLB_NO_FORCE;
>>         set_max_mapnr(max_pfn - PHYS_PFN_OFFSET);
> 
> I have applied the patch on top of 5.13-rc1 and can confirm I am able to
> boot dom0. Are you going to submit the patch?

Sorry about that Julien and thanks Christoph!
-- 
Florian

