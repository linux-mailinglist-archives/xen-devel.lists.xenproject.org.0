Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA984164A0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 19:45:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194530.346555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTSlw-0007S0-2o; Thu, 23 Sep 2021 17:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194530.346555; Thu, 23 Sep 2021 17:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTSlv-0007PL-VU; Thu, 23 Sep 2021 17:44:35 +0000
Received: by outflank-mailman (input) for mailman id 194530;
 Thu, 23 Sep 2021 17:44:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES3T=ON=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mTSlu-0007PF-Qu
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 17:44:34 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 593cd0ad-cd1a-4b8a-a5cc-d7116ffeadee;
 Thu, 23 Sep 2021 17:44:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i25so29499090lfg.6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 10:44:32 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 9sm513691lfp.129.2021.09.23.10.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 10:44:31 -0700 (PDT)
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
X-Inumbo-ID: 593cd0ad-cd1a-4b8a-a5cc-d7116ffeadee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/TedQXzo+rAZLoCGqN7JBHlekw4ScOZMoMKHvF3rAPo=;
        b=LMyrSpoNYv8F2MAY4H9az4Pixvp4jDdBVajpfAMd6MAVYUyTEtHV/RIhVy0YgGr9SZ
         qZMdaDCXkBIS77i+JKl+NZKgRRZVCHJSTH3LbpfXD6if7eaYsSBrRL1BHRVIYy3sTSks
         2i9V2khnMTiN3+HupGjNFDNA+YxrdSs7D9gs9y91fv/+SViE4YSL0q43r87Zh8GX1fFE
         3GRhXcWfqPX67yO2n/ELHAW1CKyDuxTSVKjtKPfYPTDfY4dRdsTVl40Bov1B9nqjS+7e
         QGTFSUMrUgKQbAbWpRctJxwWwqFZ+axAA+Wetel5eR1djvpuXrhlU1mJD1Fy8ig9GrLG
         LKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/TedQXzo+rAZLoCGqN7JBHlekw4ScOZMoMKHvF3rAPo=;
        b=5ao0u5le8iPoiE39hOuVZcZBbsIC0Y3UcUGUh8rvHzOCTzVkrV0u1cAQe+ZzsI3hs6
         qhfQ3rDy+ojWImwrTDNHder8jInQd7qGyS3dA7+IxCR5bcVfzJ6oxgTfie5bJ0EMWDkD
         d3Qh/YfxNl1dd68iQpM5B3BWjJeQytV5MBrIOaUNzz9Hsow3v4lPzzuuWeauLtOrAJW4
         kSMrW13uMhRWcj21bZDAZaw8T3ZtWJ6PYo4ZJTkvGrzu7JxMvMJD0wzKlWwxU+Bqdu9W
         JjipI81Ca/Xh2MiRyYDX5FZSxWAv2f7okqHXgriZFNAD5D1u3Nq5y4TagNvzX533DKW0
         28rQ==
X-Gm-Message-State: AOAM531i939aH2CEYZH7Cc/XVe0wURyUVNin38cKJshmx9d9N9JXpg2h
	9MiGS4VZIlsdO7mV6ssE2xc=
X-Google-Smtp-Source: ABdhPJwhbl7y9LTxQHm0Z3DzsGmUsl2SaCPyZH/gO1rACGJhbgwtZuPHxQjqhNnhoSzJ0oz+GroJrg==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr5517622lfr.266.1632419071561;
        Thu, 23 Sep 2021 10:44:31 -0700 (PDT)
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
 <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org>
 <08294c53-109a-8544-3a23-85e034d2992d@gmail.com>
 <cc5ee8cc-84ac-a27f-af99-ac0ba3ab8d68@gmail.com>
 <8665a10b-60b1-1551-0aab-e6725f4c6ff1@gmail.com>
 <alpine.DEB.2.21.2109230931110.17979@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <28503e09-44c3-f623-bb8d-8778bb94225f@gmail.com>
Date: Thu, 23 Sep 2021 20:44:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109230931110.17979@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 23.09.21 19:38, Stefano Stabellini wrote:

Hi Stefano

> On Thu, 23 Sep 2021, Oleksandr wrote:
>> On 18.09.21 19:59, Oleksandr wrote:
>>>>>> +#define EXT_REGION_END 0x80003fffffffULL
>>>>>> +
>>>>>> +static int __init find_unallocated_memory(const struct kernel_info
>>>>>> *kinfo,
>>>>>> +                                          struct meminfo
>>>>>> *ext_regions)
>>>>>> +{
>>>>>> +    const struct meminfo *assign_mem = &kinfo->mem;
>>>>>> +    struct rangeset *unalloc_mem;
>>>>>> +    paddr_t start, end;
>>>>>> +    unsigned int i;
>>>>>> +    int res;
>>>>> We technically already know which range of memory is unused. This is
>>>>> pretty much any region in the freelist of the page allocator. So how
>>>>> about walking the freelist instead?
>>>> ok, I will investigate the page allocator code (right now I have no
>>>> understanding of how to do that). BTW, I have just grepped "freelist"
>>>> through the code and all page context related appearances are in x86 code
>>>> only.
>>>>
>>>>> The advantage is we don't need to worry about modifying the function
>>>>> when adding new memory type.
>>>>>
>>>>> One disavantage is this will not cover *all* the unused memory as this
>>>>> is doing. But I think this is an acceptable downside.
>>> I did some investigations and create test patch. Although, I am not 100%
>>> sure this is exactly what you meant, but I will provide results anyway.
>>>
>>> 1. Below the extended regions (unallocated memory, regions >=64MB )
>>> calculated by my initial method (bootinfo.mem - kinfo->mem -
>>> bootinfo.reserved_mem - kinfo->gnttab):
>>>
>>> (XEN) Extended region 0: 0x48000000->0x54000000
>>> (XEN) Extended region 1: 0x57000000->0x60000000
>>> (XEN) Extended region 2: 0x70000000->0x78000000
>>> (XEN) Extended region 3: 0x78200000->0xc0000000
>>> (XEN) Extended region 4: 0x500000000->0x580000000
>>> (XEN) Extended region 5: 0x600000000->0x680000000
>>> (XEN) Extended region 6: 0x700000000->0x780000000
>>>
>>> 2. Below the extended regions (unallocated memory, regions >=64MB)
>>> calculated by new method (free memory in page allocator):
>>>
>>> (XEN) Extended region 0: 0x48000000->0x54000000
>>> (XEN) Extended region 1: 0x58000000->0x60000000
>>> (XEN) Extended region 2: 0x70000000->0x78000000
>>> (XEN) Extended region 3: 0x78200000->0x84000000
>>> (XEN) Extended region 4: 0x86000000->0x8a000000
>>> (XEN) Extended region 5: 0x8c200000->0xc0000000
>>> (XEN) Extended region 6: 0x500000000->0x580000000
>>> (XEN) Extended region 7: 0x600000000->0x680000000
>>> (XEN) Extended region 8: 0x700000000->0x765e00000
>>>
>>> Some thoughts regarding that.
>>>
>>> 1. A few ranges below 4GB are absent in resulting extended regions. I
>>> assume, this is because of the modules:
>>>
>>> (XEN) Checking for initrd in /chosen
>>> (XEN) Initrd 0000000084000040-0000000085effc48
>>> (XEN) RAM: 0000000048000000 - 00000000bfffffff
>>> (XEN) RAM: 0000000500000000 - 000000057fffffff
>>> (XEN) RAM: 0000000600000000 - 000000067fffffff
>>> (XEN) RAM: 0000000700000000 - 000000077fffffff
>>> (XEN)
>>> (XEN) MODULE[0]: 0000000078080000 - 00000000781d74c8 Xen
>>> (XEN) MODULE[1]: 0000000057fe7000 - 0000000057ffd080 Device Tree
>>> (XEN) MODULE[2]: 0000000084000040 - 0000000085effc48 Ramdisk
>>> (XEN) MODULE[3]: 000000008a000000 - 000000008c000000 Kernel
>>> (XEN) MODULE[4]: 000000008c000000 - 000000008c010000 XSM
>>> (XEN)  RESVD[0]: 0000000084000040 - 0000000085effc48
>>> (XEN)  RESVD[1]: 0000000054000000 - 0000000056ffffff
>>>
>>> 2. Also, it worth mentioning that relatively large chunk (~417MB) of memory
>>> above 4GB is absent (to be precise, at the end of last RAM bank), which I
>>> assume, used for Xen internals.
>>> We could really use it for extended regions.
>>> Below free regions in the heap (for last RAM bank) just in case:
>>>
>>> (XEN) heap[node=0][zone=23][order=5] 0x00000765ec0000-0x00000765ee0000
>>> (XEN) heap[node=0][zone=23][order=6] 0x00000765e80000-0x00000765ec0000
>>> (XEN) heap[node=0][zone=23][order=7] 0x00000765e00000-0x00000765e80000
>>> (XEN) heap[node=0][zone=23][order=9] 0x00000765c00000-0x00000765e00000
>>> (XEN) heap[node=0][zone=23][order=10] 0x00000765800000-0x00000765c00000
>>> (XEN) heap[node=0][zone=23][order=11] 0x00000765000000-0x00000765800000
>>> (XEN) heap[node=0][zone=23][order=12] 0x00000764000000-0x00000765000000
>>> (XEN) heap[node=0][zone=23][order=14] 0x00000760000000-0x00000764000000
>>> (XEN) heap[node=0][zone=23][order=17] 0x00000740000000-0x00000760000000
>>> (XEN) heap[node=0][zone=23][order=18] 0x00000540000000-0x00000580000000
>>> (XEN) heap[node=0][zone=23][order=18] 0x00000500000000-0x00000540000000
>>> (XEN) heap[node=0][zone=23][order=18] 0x00000640000000-0x00000680000000
>>> (XEN) heap[node=0][zone=23][order=18] 0x00000600000000-0x00000640000000
>>> (XEN) heap[node=0][zone=23][order=18] 0x00000700000000-0x00000740000000
>>>
>>> Yes, you already pointed out this disadvantage, so if it is an acceptable
>>> downside, I am absolutely OK.
>>>
>>>
>>> 3. Common code updates. There is a question how to properly make a
>>> connection between common allocator internals and Arm's code for creating
>>> DT. I didn’t come up with anything better
>>> than creating for_each_avail_page() for invoking a callback with page and
>>> its order.
>>>
>>> **********
>>>
>>> Below the proposed changes on top of the initial patch, would this be
>>> acceptable in general?
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 523eb19..1e58fc5 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -753,16 +753,33 @@ static int __init add_ext_regions(unsigned long s,
>>> unsigned long e, void *data)
>>>       return 0;
>>>   }
>>>
>>> +static int __init add_unalloc_mem(struct page_info *page, unsigned int
>>> order,
>>> +                                  void *data)
>>> +{
>>> +    struct rangeset *unalloc_mem = data;
>>> +    paddr_t start, end;
>>> +    int res;
>>> +
>>> +    start = page_to_maddr(page);
>>> +    end = start + pfn_to_paddr(1UL << order);
>>> +    res = rangeset_add_range(unalloc_mem, start, end - 1);
>>> +    if ( res )
>>> +    {
>>> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>>> +               start, end);
>>> +        return res;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   #define EXT_REGION_START   0x40000000ULL
>>>   #define EXT_REGION_END     0x80003fffffffULL
>>>
>>> -static int __init find_unallocated_memory(const struct kernel_info *kinfo,
>>> -                                          struct meminfo *ext_regions)
>>> +static int __init find_unallocated_memory(struct meminfo *ext_regions)
>>>   {
>>> -    const struct meminfo *assign_mem = &kinfo->mem;
>>>       struct rangeset *unalloc_mem;
>>>       paddr_t start, end;
>>> -    unsigned int i;
>>>       int res;
>>>
>>>       dt_dprintk("Find unallocated memory for extended regions\n");
>>> @@ -771,59 +788,9 @@ static int __init find_unallocated_memory(const struct
>>> kernel_info *kinfo,
>>>       if ( !unalloc_mem )
>>>           return -ENOMEM;
>>>
>>> -    /* Start with all available RAM */
>>> -    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
>>> -    {
>>> -        start = bootinfo.mem.bank[i].start;
>>> -        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size;
>>> -        res = rangeset_add_range(unalloc_mem, start, end - 1);
>>> -        if ( res )
>>> -        {
>>> -            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
>>> -                   start, end);
>>> -            goto out;
>>> -        }
>>> -    }
>>> -
>>> -    /* Remove RAM assigned to Dom0 */
>>> -    for ( i = 0; i < assign_mem->nr_banks; i++ )
>>> -    {
>>> -        start = assign_mem->bank[i].start;
>>> -        end = assign_mem->bank[i].start + assign_mem->bank[i].size;
>>> -        res = rangeset_remove_range(unalloc_mem, start, end - 1);
>>> -        if ( res )
>>> -        {
>>> -            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>>> -                   start, end);
>>> -            goto out;
>>> -        }
>>> -    }
>>> -
>>> -    /* Remove reserved-memory regions */
>>> -    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
>>> -    {
>>> -        start = bootinfo.reserved_mem.bank[i].start;
>>> -        end = bootinfo.reserved_mem.bank[i].start +
>>> -            bootinfo.reserved_mem.bank[i].size;
>>> -        res = rangeset_remove_range(unalloc_mem, start, end - 1);
>>> -        if ( res )
>>> -        {
>>> -            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>>> -                   start, end);
>>> -            goto out;
>>> -        }
>>> -    }
>>> -
>>> -    /* Remove grant table region */
>>> -    start = kinfo->gnttab_start;
>>> -    end = kinfo->gnttab_start + kinfo->gnttab_size;
>>> -    res = rangeset_remove_range(unalloc_mem, start, end - 1);
>>> +    res = for_each_avail_page(add_unalloc_mem, unalloc_mem);
>>>       if ( res )
>>> -    {
>>> -        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
>>> -               start, end);
>>>           goto out;
>>> -    }
>>>
>>>       start = EXT_REGION_START;
>>>       end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
>>> @@ -840,8 +807,7 @@ out:
>>>       return res;
>>>   }
>>>
>>> -static int __init find_memory_holes(const struct kernel_info *kinfo,
>>> -                                    struct meminfo *ext_regions)
>>> +static int __init find_memory_holes(struct meminfo *ext_regions)
>>>   {
>>>       struct dt_device_node *np;
>>>       struct rangeset *mem_holes;
>>> @@ -961,9 +927,9 @@ static int __init make_hypervisor_node(struct domain *d,
>>>       else
>>>       {
>>>           if ( !is_iommu_enabled(d) )
>>> -            res = find_unallocated_memory(kinfo, ext_regions);
>>> +            res = find_unallocated_memory(ext_regions);
>>>           else
>>> -            res = find_memory_holes(kinfo, ext_regions);
>>> +            res = find_memory_holes(ext_regions);
>>>
>>>           if ( res )
>>>               printk(XENLOG_WARNING "Failed to allocate extended regions\n");
>>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>>> index 8fad139..7cd1020 100644
>>> --- a/xen/common/page_alloc.c
>>> +++ b/xen/common/page_alloc.c
>>> @@ -1572,6 +1572,40 @@ static int reserve_heap_page(struct page_info *pg)
>>>
>>>   }
>>>
>>> +/* TODO heap_lock? */
>>> +int for_each_avail_page(int (*cb)(struct page_info *, unsigned int, void
>>> *),
>>> +                        void *data)
>>> +{
>>> +    unsigned int node, zone, order;
>>> +    int ret;
>>> +
>>> +    for ( node = 0; node < MAX_NUMNODES; node++ )
>>> +    {
>>> +        if ( !avail[node] )
>>> +            continue;
>>> +
>>> +        for ( zone = 0; zone < NR_ZONES; zone++ )
>>> +        {
>>> +            for ( order = 0; order <= MAX_ORDER; order++ )
>>> +            {
>>> +                struct page_info *head, *tmp;
>>> +
>>> +                if ( page_list_empty(&heap(node, zone, order)) )
>>> +                    continue;
>>> +
>>> +                page_list_for_each_safe ( head, tmp, &heap(node, zone,
>>> order) )
>>> +                {
>>> +                    ret = cb(head, order, data);
>>> +                    if ( ret )
>>> +                        return ret;
>>> +                }
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   int offline_page(mfn_t mfn, int broken, uint32_t *status)
>>>   {
>>>       unsigned long old_info = 0;
>>> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
>>> index 667f9da..64dd3e2 100644
>>> --- a/xen/include/xen/mm.h
>>> +++ b/xen/include/xen/mm.h
>>> @@ -123,6 +123,9 @@ unsigned int online_page(mfn_t mfn, uint32_t *status);
>>>   int offline_page(mfn_t mfn, int broken, uint32_t *status);
>>>   int query_page_offline(mfn_t mfn, uint32_t *status);
>>>
>>> +int for_each_avail_page(int (*cb)(struct page_info *, unsigned int, void
>>> *),
>>> +                        void *data);
>>> +
>>>   void heap_init_late(void);
>>>
>>>   int assign_pages(
>>
>> I am sorry, but may I please clarify regarding that? Whether we will go this
>> new direction (free memory in page allocator) or leave things as they are
>> (bootinfo.mem - kinfo->mem - bootinfo.reserved_mem - kinfo->gnttab). This is
>> only one still unclear moment to me in current patch before preparing V3.
> I think both approaches are fine. Your original approach leads to better
> results in terms of extended regions but the difference is not drastic.
> The original approach requires more code (bad) but probably less CPU
> cycles (good).
>
> Personally I am fine either way but as Julien was the one to provide
> feedback on this it would be best to get his opinion.
>
> But in the meantime I think it is OK to send a v3 so that we can review
> the rest.


OK, thank you for the clarification.

I am also fine either way, I just wanted to know which one to pick. 
Anyway, I think I will be able to make updates later on.


-- 
Regards,

Oleksandr Tyshchenko


