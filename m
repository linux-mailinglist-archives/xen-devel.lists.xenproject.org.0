Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3745B78E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 10:33:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230237.398026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpoek-0006Mq-4g; Wed, 24 Nov 2021 09:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230237.398026; Wed, 24 Nov 2021 09:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpoek-0006KD-0j; Wed, 24 Nov 2021 09:33:34 +0000
Received: by outflank-mailman (input) for mailman id 230237;
 Wed, 24 Nov 2021 09:33:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMcq=QL=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1mpoei-0006K7-3j
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 09:33:32 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96045850-4d09-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 10:33:31 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id t5so7704170edd.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Nov 2021 01:33:31 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v3sm7791278edc.69.2021.11.24.01.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 01:33:30 -0800 (PST)
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
X-Inumbo-ID: 96045850-4d09-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=cSNNRcieP5ju9aQgWK0zyOFIYILsPgHyWBzWie+ehYs=;
        b=hVpOt6SB+ssOWSxwaqcmhruUrd4GuNleWu1/GgDkh2yvPkXB05eakDJAZK8GmypjnH
         VPLIBqIxYeQ1lwzKf3TUDnQaVU1o3Vmgi1oO3ahT5aJe/bjgbFiFjdq3+vlCkbp2tb5z
         0/svEpIaR03VpWLWVnR2mGVpsPREAVWmIGipMJSQYVB5/ADAWiVfLcqHAq11JXgXRnVw
         4ValZQVSsDnO01rDPedxxRl8e334Z2G+pY5QWe+bi4qs8BAGO97a149+GyUuUh4e7NGt
         xb1MS0/wMd7cPulhd5obfP+ljbgG3wDupTPB1WURhrwwDTQnK9SQBFAQzwN1nUcWe2nc
         X6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=cSNNRcieP5ju9aQgWK0zyOFIYILsPgHyWBzWie+ehYs=;
        b=H2O+gK+9besTZaKwRI4mvT4zb/9aSZUg2lYQ3DfkfRs0owqssH4bzCsW5qrLmpt4PT
         ptZlw8VII70bIVwUpB/wiD85LYANAo6ZGz6w56tLpzMypOakaooD9DJrBdDJhvsbBjjc
         +DAqvUM8UIKsJejRVt9QkPxOEZUIEyus0J/Ss57ddWKQohiVFZw8dlAGRZp/8dXVx8ac
         N/0AknoyzbPSKdSFmcZl6SKvkwarsLgptFJQxngFEvWbqiS4zqBOm5mvGQXcC8uw69Qo
         jLtmsan/6skcHLoLFZeW64y0lGfi+fKOt3/bIzHUYxlCXhCC3TNO2ju+pspBPfKrAw4L
         N4OA==
X-Gm-Message-State: AOAM530uoC55v4AQ28Z/Vmf/hyOkQsz2OVQA0gW15Oef2KXyh2xqs5N1
	x3VqPELEd+P/naf15jrizHE=
X-Google-Smtp-Source: ABdhPJw6pkTZDxbys2xLzDoGwiiUe7wMUw+BIsIv/bL3/BCYNJYdQbDef7wSSu/XwhlJX8EZWGvjvg==
X-Received: by 2002:aa7:cada:: with SMTP id l26mr22409901edt.376.1637746410555;
        Wed, 24 Nov 2021 01:33:30 -0800 (PST)
Subject: Re: [PATCH V2 3/4] xen/unpopulated-alloc: Add mechanism to use Xen
 resource
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Julien Grall <julien@xen.org>
References: <1635264312-3796-1-git-send-email-olekstysh@gmail.com>
 <1635264312-3796-4-git-send-email-olekstysh@gmail.com>
 <alpine.DEB.2.21.2110280920110.20134@sstabellini-ThinkPad-T480s>
 <1d122e60-df9c-2ac6-8148-f6a836b9e51d@gmail.com>
 <alpine.DEB.2.22.394.2111181642340.1412361@ubuntu-linux-20-04-desktop>
 <f1f1025b-911d-3d27-f408-9c042bc4fca4@gmail.com>
 <alpine.DEB.2.22.394.2111191809100.1412361@ubuntu-linux-20-04-desktop>
 <76163855-c5eb-05db-2f39-3c6bfee46345@gmail.com>
 <alpine.DEB.2.22.394.2111231312310.1412361@ubuntu-linux-20-04-desktop>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <32521815-d932-7ba6-bfab-a47596d23713@gmail.com>
Date: Wed, 24 Nov 2021 11:33:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2111231312310.1412361@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 23.11.21 23:25, Stefano Stabellini wrote:

Hi Stefano

> On Tue, 23 Nov 2021, Oleksandr wrote:
>>> Actually after reading your replies and explanation I changed opinion: I
>>> think we do need the fallback because Linux cannot really assume that
>>> it is running on "new Xen" so it definitely needs to keep working if
>>> CONFIG_XEN_UNPOPULATED_ALLOC is enabled and the extended regions are not
>>> advertised.
>>>
>>> I think we'll have to roll back some of the changes introduced by
>>> 121f2faca2c0a. That's because even if CONFIG_XEN_UNPOPULATED_ALLOC is
>>> enabled we cannot know if we can use unpopulated-alloc or whether we
>>> have to use alloc_xenballooned_pages until we parse the /hypervisor node
>>> in device tree at runtime.
>> Exactly!
>>
>>
>>> In short, we cannot switch between unpopulated-alloc and
>>> alloc_xenballooned_pages at build time, we have to do it at runtime
>>> (boot time).
>> +1
>>
>>
>> I created a patch to partially revert 121f2faca2c0a "xen/balloon: rename
>> alloc/free_xenballooned_pages".
>>
>> If there is no objections I will add it to V3 (which is almost ready, except
>> the fallback bits). Could you please tell me what do you think?
>   
> It makes sense to me. You can add my Reviewed-by.

Great, thank you!


>
>   
>>  From dc79bcd425358596d95e715a8bd8b81deaaeb703 Mon Sep 17 00:00:00 2001
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Date: Tue, 23 Nov 2021 18:14:41 +0200
>> Subject: [PATCH] xen/balloon: Bring alloc(free)_xenballooned_pages helpers
>>   back
>>
>> This patch rolls back some of the changes introduced by commit
>> 121f2faca2c0a "xen/balloon: rename alloc/free_xenballooned_pages"
>> in order to make possible to still allocate xenballooned pages
>> if CONFIG_XEN_UNPOPULATED_ALLOC is enabled.
>>
>> On Arm the unpopulated pages will be allocated on top of extended
>> regions provided by Xen via device-tree (the subsequent patches
>> will add required bits to support unpopulated-alloc feature on Arm).
>> The problem is that extended regions feature has been introduced
>> into Xen quite recently (during 4.16 release cycle). So this
>> effectively means that Linux must only use unpopulated-alloc on Arm
>> if it is running on "new Xen" which advertises these regions.
>> But, it will only be known after parsing the "hypervisor" node
>> at boot time, so before doing that we cannot assume anything.
>>
>> In order to keep working if CONFIG_XEN_UNPOPULATED_ALLOC is enabled
>> and the extended regions are not advertised (Linux is running on
>> "old Xen", etc) we need the fallback to alloc_xenballooned_pages().
>>
>> This way we wouldn't reduce the amount of memory usable (wasting
>> RAM pages) for any of the external mappings anymore (and eliminate
>> XSA-300) with "new Xen", but would be still functional ballooning
>> out RAM pages with "old Xen".
>>
>> Also rename alloc(free)_xenballooned_pages to xen_alloc(free)_ballooned_pages.
>>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> ---
>>   drivers/xen/balloon.c | 20 +++++++++-----------
>>   include/xen/balloon.h |  3 +++
>>   include/xen/xen.h     |  6 ++++++
>>   3 files changed, 18 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
>> index ba2ea11..a2c4fc49 100644
>> --- a/drivers/xen/balloon.c
>> +++ b/drivers/xen/balloon.c
>> @@ -581,7 +581,6 @@ void balloon_set_new_target(unsigned long target)
>>   }
>>   EXPORT_SYMBOL_GPL(balloon_set_new_target);
>>
>> -#ifndef CONFIG_XEN_UNPOPULATED_ALLOC
>>   static int add_ballooned_pages(unsigned int nr_pages)
>>   {
>>       enum bp_state st;
>> @@ -610,12 +609,12 @@ static int add_ballooned_pages(unsigned int nr_pages)
>>   }
>>
>>   /**
>> - * xen_alloc_unpopulated_pages - get pages that have been ballooned out
>> + * xen_alloc_ballooned_pages - get pages that have been ballooned out
>>    * @nr_pages: Number of pages to get
>>    * @pages: pages returned
>>    * @return 0 on success, error otherwise
>>    */
>> -int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages)
>> +int xen_alloc_ballooned_pages(unsigned int nr_pages, struct page **pages)
>>   {
>>       unsigned int pgno = 0;
>>       struct page *page;
>> @@ -652,23 +651,23 @@ int xen_alloc_unpopulated_pages(unsigned int nr_pages,
>> struct page **pages)
>>       return 0;
>>    out_undo:
>>       mutex_unlock(&balloon_mutex);
>> -    xen_free_unpopulated_pages(pgno, pages);
>> +    xen_free_ballooned_pages(pgno, pages);
>>       /*
>> -     * NB: free_xenballooned_pages will only subtract pgno pages, but since
>> +     * NB: xen_free_ballooned_pages will only subtract pgno pages, but since
>>        * target_unpopulated is incremented with nr_pages at the start we need
>>        * to remove the remaining ones also, or accounting will be screwed.
>>        */
>>       balloon_stats.target_unpopulated -= nr_pages - pgno;
>>       return ret;
>>   }
>> -EXPORT_SYMBOL(xen_alloc_unpopulated_pages);
>> +EXPORT_SYMBOL(xen_alloc_ballooned_pages);
>>
>>   /**
>> - * xen_free_unpopulated_pages - return pages retrieved with
>> get_ballooned_pages
>> + * xen_free_ballooned_pages - return pages retrieved with get_ballooned_pages
>>    * @nr_pages: Number of pages
>>    * @pages: pages to return
>>    */
>> -void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages)
>> +void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pages)
>>   {
>>       unsigned int i;
>>
>> @@ -687,9 +686,9 @@ void xen_free_unpopulated_pages(unsigned int nr_pages,
>> struct page **pages)
>>
>>       mutex_unlock(&balloon_mutex);
>>   }
>> -EXPORT_SYMBOL(xen_free_unpopulated_pages);
>> +EXPORT_SYMBOL(xen_free_ballooned_pages);
>>
>> -#if defined(CONFIG_XEN_PV)
>> +#if defined(CONFIG_XEN_PV) && !defined(CONFIG_XEN_UNPOPULATED_ALLOC)
>>   static void __init balloon_add_region(unsigned long start_pfn,
>>                         unsigned long pages)
>>   {
>> @@ -712,7 +711,6 @@ static void __init balloon_add_region(unsigned long
>> start_pfn,
>>       balloon_stats.total_pages += extra_pfn_end - start_pfn;
>>   }
>>   #endif
>> -#endif
>>
>>   static int __init balloon_init(void)
>>   {
>> diff --git a/include/xen/balloon.h b/include/xen/balloon.h
>> index e93d4f0..f78a6cc 100644
>> --- a/include/xen/balloon.h
>> +++ b/include/xen/balloon.h
>> @@ -26,6 +26,9 @@ extern struct balloon_stats balloon_stats;
>>
>>   void balloon_set_new_target(unsigned long target);
>>
>> +int xen_alloc_ballooned_pages(unsigned int nr_pages, struct page **pages);
>> +void xen_free_ballooned_pages(unsigned int nr_pages, struct page **pages);
>> +
>>   #ifdef CONFIG_XEN_BALLOON
>>   void xen_balloon_init(void);
>>   #else
>> diff --git a/include/xen/xen.h b/include/xen/xen.h
>> index 9f031b5..410e3e4 100644
>> --- a/include/xen/xen.h
>> +++ b/include/xen/xen.h
>> @@ -52,7 +52,13 @@ bool xen_biovec_phys_mergeable(const struct bio_vec *vec1,
>>   extern u64 xen_saved_max_mem_size;
>>   #endif
>>
>> +#ifdef CONFIG_XEN_UNPOPULATED_ALLOC
>>   int xen_alloc_unpopulated_pages(unsigned int nr_pages, struct page **pages);
>>   void xen_free_unpopulated_pages(unsigned int nr_pages, struct page **pages);
>> +#else
>> +#define xen_alloc_unpopulated_pages xen_alloc_ballooned_pages
>> +#define xen_free_unpopulated_pages xen_free_ballooned_pages
>> +#include <xen/balloon.h>
>> +#endif
>>
>>   #endif    /* _XEN_XEN_H */

-- 
Regards,

Oleksandr Tyshchenko


