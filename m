Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F48415C1D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:41:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193647.344941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMAg-0003vF-9e; Thu, 23 Sep 2021 10:41:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193647.344941; Thu, 23 Sep 2021 10:41:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMAg-0003ss-6F; Thu, 23 Sep 2021 10:41:42 +0000
Received: by outflank-mailman (input) for mailman id 193647;
 Thu, 23 Sep 2021 10:41:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES3T=ON=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mTMAe-0003sm-Pj
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:41:40 +0000
Received: from mail-lf1-x134.google.com (unknown [2a00:1450:4864:20::134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af60a608-fdcb-4a8d-9e26-b6a1c63334c0;
 Thu, 23 Sep 2021 10:41:39 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i25so25036866lfg.6
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 03:41:39 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id e28sm581123ljo.63.2021.09.23.03.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 03:41:37 -0700 (PDT)
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
X-Inumbo-ID: af60a608-fdcb-4a8d-9e26-b6a1c63334c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kLw0CGs448/djjAYxedYF/ESH4j1jZJzDssPc1coj74=;
        b=lolFy9reeK3R7+zLNy4DJi9pJy8L9LWtfRg2M9taCBAOPjzS0xLgkozyChs/zawY/L
         4BYCES3JjiSOhhbi/f8UnOciBSrMDsdmppTIuqMj4qijSXzjFHm68p+BEYjZv5iPnL2L
         lbEUlUzYdOjhoaBkYGyQ1u0EGUYr4wecjN2X8bGuvJYENnfe0yTnvyFWEiRxNfES00nC
         hzwDR1nfApklFJO9YC0tqMInXd4SXN5KNLY+lfWt/SEgcYjcPy2HDNmO2nOdSYYArrFs
         ha7CLyVWB4kjBLf1pRlqwJiKv9JV8NaI9XxEgtjnjhQQmb1nrnIwbyH++F8QJ5QeVUYH
         lWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kLw0CGs448/djjAYxedYF/ESH4j1jZJzDssPc1coj74=;
        b=lpCpCIh1V0hLflo9O9VQXkAnTgwSEM3wWXdzj33owbQF3jvYa9ozNX28XeA1FBPUGr
         CC8x6MEBtXiMRXSAhcsjfkXkYsfXH6gJHCj2CBx+wfpM+Y9VUMOXqwhxSDEJVQHeb8Un
         uVe7Oh8kXRoNKG072bxcIPLU6mGzbhxSo1EzczPrwV24AJkbh8x4dlWeGcodGlrjco0x
         u0/zO2KXoIXWMMswwO+cDORtB2PCGNvg/A5TTWt3hc0mZg78KgB+TmhnLncSD+U+xWho
         mHvxujGUGLxSs9wTwHrrxxvXv/Tbd3lbKIRXqyK1MVpBVFW+Ge4f1WC+fH/269sdhho7
         oIsg==
X-Gm-Message-State: AOAM5304/+nYjCy/DtBTtoqLBviuiMl9ybkA/t3nwMVBXsZahXD2U1jk
	juQ5N6dJpJUZVxI2O5SumKw=
X-Google-Smtp-Source: ABdhPJzSnTAvJrb/JengHJ1dzNzATaxINBJ0gLTZPoe3qW9tdia9iFWbXtJFSX4S4/C2yhU5Vl9TCg==
X-Received: by 2002:a05:6512:12c8:: with SMTP id p8mr3481462lfg.40.1632393697874;
        Thu, 23 Sep 2021 03:41:37 -0700 (PDT)
Subject: Re: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
From: Oleksandr <olekstysh@gmail.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <Henry.Wang@arm.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
 <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
 <0a72559e-5742-dc33-1c8f-5903c50b27be@xen.org>
 <08294c53-109a-8544-3a23-85e034d2992d@gmail.com>
 <cc5ee8cc-84ac-a27f-af99-ac0ba3ab8d68@gmail.com>
Message-ID: <8665a10b-60b1-1551-0aab-e6725f4c6ff1@gmail.com>
Date: Thu, 23 Sep 2021 13:41:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cc5ee8cc-84ac-a27f-af99-ac0ba3ab8d68@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Stefano, Julien


On 18.09.21 19:59, Oleksandr wrote:
>
> Hi Julien.
>
>
> [snip]
>
>
>>>
>>>
>>>> +#define EXT_REGION_END 0x80003fffffffULL
>>>> +
>>>> +static int __init find_unallocated_memory(const struct kernel_info 
>>>> *kinfo,
>>>> +                                          struct meminfo 
>>>> *ext_regions)
>>>> +{
>>>> +    const struct meminfo *assign_mem = &kinfo->mem;
>>>> +    struct rangeset *unalloc_mem;
>>>> +    paddr_t start, end;
>>>> +    unsigned int i;
>>>> +    int res;
>>>
>>> We technically already know which range of memory is unused. This is 
>>> pretty much any region in the freelist of the page allocator. So how 
>>> about walking the freelist instead?
>>
>> ok, I will investigate the page allocator code (right now I have no 
>> understanding of how to do that). BTW, I have just grepped "freelist" 
>> through the code and all page context related appearances are in x86 
>> code only.
>>
>>>
>>> The advantage is we don't need to worry about modifying the function 
>>> when adding new memory type.
>>>
>>> One disavantage is this will not cover *all* the unused memory as 
>>> this is doing. But I think this is an acceptable downside.
>
> I did some investigations and create test patch. Although, I am not 
> 100% sure this is exactly what you meant, but I will provide results 
> anyway.
>
> 1. Below the extended regions (unallocated memory, regions >=64MB ) 
> calculated by my initial method (bootinfo.mem - kinfo->mem - 
> bootinfo.reserved_mem - kinfo->gnttab):
>
> (XEN) Extended region 0: 0x48000000->0x54000000
> (XEN) Extended region 1: 0x57000000->0x60000000
> (XEN) Extended region 2: 0x70000000->0x78000000
> (XEN) Extended region 3: 0x78200000->0xc0000000
> (XEN) Extended region 4: 0x500000000->0x580000000
> (XEN) Extended region 5: 0x600000000->0x680000000
> (XEN) Extended region 6: 0x700000000->0x780000000
>
> 2. Below the extended regions (unallocated memory, regions >=64MB) 
> calculated by new method (free memory in page allocator):
>
> (XEN) Extended region 0: 0x48000000->0x54000000
> (XEN) Extended region 1: 0x58000000->0x60000000
> (XEN) Extended region 2: 0x70000000->0x78000000
> (XEN) Extended region 3: 0x78200000->0x84000000
> (XEN) Extended region 4: 0x86000000->0x8a000000
> (XEN) Extended region 5: 0x8c200000->0xc0000000
> (XEN) Extended region 6: 0x500000000->0x580000000
> (XEN) Extended region 7: 0x600000000->0x680000000
> (XEN) Extended region 8: 0x700000000->0x765e00000
>
> Some thoughts regarding that.
>
> 1. A few ranges below 4GB are absent in resulting extended regions. I 
> assume, this is because of the modules:
>
> (XEN) Checking for initrd in /chosen
> (XEN) Initrd 0000000084000040-0000000085effc48
> (XEN) RAM: 0000000048000000 - 00000000bfffffff
> (XEN) RAM: 0000000500000000 - 000000057fffffff
> (XEN) RAM: 0000000600000000 - 000000067fffffff
> (XEN) RAM: 0000000700000000 - 000000077fffffff
> (XEN)
> (XEN) MODULE[0]: 0000000078080000 - 00000000781d74c8 Xen
> (XEN) MODULE[1]: 0000000057fe7000 - 0000000057ffd080 Device Tree
> (XEN) MODULE[2]: 0000000084000040 - 0000000085effc48 Ramdisk
> (XEN) MODULE[3]: 000000008a000000 - 000000008c000000 Kernel
> (XEN) MODULE[4]: 000000008c000000 - 000000008c010000 XSM
> (XEN)  RESVD[0]: 0000000084000040 - 0000000085effc48
> (XEN)  RESVD[1]: 0000000054000000 - 0000000056ffffff
>
> 2. Also, it worth mentioning that relatively large chunk (~417MB) of 
> memory above 4GB is absent (to be precise, at the end of last RAM 
> bank), which I assume, used for Xen internals.
> We could really use it for extended regions.
> Below free regions in the heap (for last RAM bank) just in case:
>
> (XEN) heap[node=0][zone=23][order=5] 0x00000765ec0000-0x00000765ee0000
> (XEN) heap[node=0][zone=23][order=6] 0x00000765e80000-0x00000765ec0000
> (XEN) heap[node=0][zone=23][order=7] 0x00000765e00000-0x00000765e80000
> (XEN) heap[node=0][zone=23][order=9] 0x00000765c00000-0x00000765e00000
> (XEN) heap[node=0][zone=23][order=10] 0x00000765800000-0x00000765c00000
> (XEN) heap[node=0][zone=23][order=11] 0x00000765000000-0x00000765800000
> (XEN) heap[node=0][zone=23][order=12] 0x00000764000000-0x00000765000000
> (XEN) heap[node=0][zone=23][order=14] 0x00000760000000-0x00000764000000
> (XEN) heap[node=0][zone=23][order=17] 0x00000740000000-0x00000760000000
> (XEN) heap[node=0][zone=23][order=18] 0x00000540000000-0x00000580000000
> (XEN) heap[node=0][zone=23][order=18] 0x00000500000000-0x00000540000000
> (XEN) heap[node=0][zone=23][order=18] 0x00000640000000-0x00000680000000
> (XEN) heap[node=0][zone=23][order=18] 0x00000600000000-0x00000640000000
> (XEN) heap[node=0][zone=23][order=18] 0x00000700000000-0x00000740000000
>
> Yes, you already pointed out this disadvantage, so if it is an 
> acceptable downside, I am absolutely OK.
>
>
> 3. Common code updates. There is a question how to properly make a 
> connection between common allocator internals and Arm's code for 
> creating DT. I didn’t come up with anything better
> than creating for_each_avail_page() for invoking a callback with page 
> and its order.
>
> **********
>
> Below the proposed changes on top of the initial patch, would this be 
> acceptable in general?
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 523eb19..1e58fc5 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -753,16 +753,33 @@ static int __init add_ext_regions(unsigned long 
> s, unsigned long e, void *data)
>      return 0;
>  }
>
> +static int __init add_unalloc_mem(struct page_info *page, unsigned 
> int order,
> +                                  void *data)
> +{
> +    struct rangeset *unalloc_mem = data;
> +    paddr_t start, end;
> +    int res;
> +
> +    start = page_to_maddr(page);
> +    end = start + pfn_to_paddr(1UL << order);
> +    res = rangeset_add_range(unalloc_mem, start, end - 1);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
> +               start, end);
> +        return res;
> +    }
> +
> +    return 0;
> +}
> +
>  #define EXT_REGION_START   0x40000000ULL
>  #define EXT_REGION_END     0x80003fffffffULL
>
> -static int __init find_unallocated_memory(const struct kernel_info 
> *kinfo,
> -                                          struct meminfo *ext_regions)
> +static int __init find_unallocated_memory(struct meminfo *ext_regions)
>  {
> -    const struct meminfo *assign_mem = &kinfo->mem;
>      struct rangeset *unalloc_mem;
>      paddr_t start, end;
> -    unsigned int i;
>      int res;
>
>      dt_dprintk("Find unallocated memory for extended regions\n");
> @@ -771,59 +788,9 @@ static int __init find_unallocated_memory(const 
> struct kernel_info *kinfo,
>      if ( !unalloc_mem )
>          return -ENOMEM;
>
> -    /* Start with all available RAM */
> -    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
> -    {
> -        start = bootinfo.mem.bank[i].start;
> -        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size;
> -        res = rangeset_add_range(unalloc_mem, start, end - 1);
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
> -                   start, end);
> -            goto out;
> -        }
> -    }
> -
> -    /* Remove RAM assigned to Dom0 */
> -    for ( i = 0; i < assign_mem->nr_banks; i++ )
> -    {
> -        start = assign_mem->bank[i].start;
> -        end = assign_mem->bank[i].start + assign_mem->bank[i].size;
> -        res = rangeset_remove_range(unalloc_mem, start, end - 1);
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "Failed to remove: 
> %#"PRIx64"->%#"PRIx64"\n",
> -                   start, end);
> -            goto out;
> -        }
> -    }
> -
> -    /* Remove reserved-memory regions */
> -    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
> -    {
> -        start = bootinfo.reserved_mem.bank[i].start;
> -        end = bootinfo.reserved_mem.bank[i].start +
> -            bootinfo.reserved_mem.bank[i].size;
> -        res = rangeset_remove_range(unalloc_mem, start, end - 1);
> -        if ( res )
> -        {
> -            printk(XENLOG_ERR "Failed to remove: 
> %#"PRIx64"->%#"PRIx64"\n",
> -                   start, end);
> -            goto out;
> -        }
> -    }
> -
> -    /* Remove grant table region */
> -    start = kinfo->gnttab_start;
> -    end = kinfo->gnttab_start + kinfo->gnttab_size;
> -    res = rangeset_remove_range(unalloc_mem, start, end - 1);
> +    res = for_each_avail_page(add_unalloc_mem, unalloc_mem);
>      if ( res )
> -    {
> -        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
> -               start, end);
>          goto out;
> -    }
>
>      start = EXT_REGION_START;
>      end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
> @@ -840,8 +807,7 @@ out:
>      return res;
>  }
>
> -static int __init find_memory_holes(const struct kernel_info *kinfo,
> -                                    struct meminfo *ext_regions)
> +static int __init find_memory_holes(struct meminfo *ext_regions)
>  {
>      struct dt_device_node *np;
>      struct rangeset *mem_holes;
> @@ -961,9 +927,9 @@ static int __init make_hypervisor_node(struct 
> domain *d,
>      else
>      {
>          if ( !is_iommu_enabled(d) )
> -            res = find_unallocated_memory(kinfo, ext_regions);
> +            res = find_unallocated_memory(ext_regions);
>          else
> -            res = find_memory_holes(kinfo, ext_regions);
> +            res = find_memory_holes(ext_regions);
>
>          if ( res )
>              printk(XENLOG_WARNING "Failed to allocate extended 
> regions\n");
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 8fad139..7cd1020 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1572,6 +1572,40 @@ static int reserve_heap_page(struct page_info *pg)
>
>  }
>
> +/* TODO heap_lock? */
> +int for_each_avail_page(int (*cb)(struct page_info *, unsigned int, 
> void *),
> +                        void *data)
> +{
> +    unsigned int node, zone, order;
> +    int ret;
> +
> +    for ( node = 0; node < MAX_NUMNODES; node++ )
> +    {
> +        if ( !avail[node] )
> +            continue;
> +
> +        for ( zone = 0; zone < NR_ZONES; zone++ )
> +        {
> +            for ( order = 0; order <= MAX_ORDER; order++ )
> +            {
> +                struct page_info *head, *tmp;
> +
> +                if ( page_list_empty(&heap(node, zone, order)) )
> +                    continue;
> +
> +                page_list_for_each_safe ( head, tmp, &heap(node, 
> zone, order) )
> +                {
> +                    ret = cb(head, order, data);
> +                    if ( ret )
> +                        return ret;
> +                }
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  int offline_page(mfn_t mfn, int broken, uint32_t *status)
>  {
>      unsigned long old_info = 0;
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 667f9da..64dd3e2 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -123,6 +123,9 @@ unsigned int online_page(mfn_t mfn, uint32_t 
> *status);
>  int offline_page(mfn_t mfn, int broken, uint32_t *status);
>  int query_page_offline(mfn_t mfn, uint32_t *status);
>
> +int for_each_avail_page(int (*cb)(struct page_info *, unsigned int, 
> void *),
> +                        void *data);
> +
>  void heap_init_late(void);
>
>  int assign_pages(


I am sorry, but may I please clarify regarding that? Whether we will go 
this new direction (free memory in page allocator) or leave things as 
they are (bootinfo.mem - kinfo->mem - bootinfo.reserved_mem - 
kinfo->gnttab). This is only one still unclear moment to me in current 
patch before preparing V3.


-- 
Regards,

Oleksandr Tyshchenko


