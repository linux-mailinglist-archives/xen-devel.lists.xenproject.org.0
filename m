Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C523B882F
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jun 2021 20:10:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148239.273950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyeeb-0005CJ-Uc; Wed, 30 Jun 2021 18:09:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148239.273950; Wed, 30 Jun 2021 18:09:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyeeb-00059v-RY; Wed, 30 Jun 2021 18:09:41 +0000
Received: by outflank-mailman (input) for mailman id 148239;
 Wed, 30 Jun 2021 18:09:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lyeea-00059p-BD
 for xen-devel@lists.xenproject.org; Wed, 30 Jun 2021 18:09:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyeeZ-0002zu-5b; Wed, 30 Jun 2021 18:09:39 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lyeeY-0007Cr-Vr; Wed, 30 Jun 2021 18:09:39 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=8e+FBkXevaus3nO4LlGboA9dqr8g2NQdotFQo2/WGmo=; b=ZBhH3LVIVo+ZpRL5Ff/BMEj5Rz
	rCnjrOG1rmCLkg9s/wPCXkB4lhHK/owgE9brHkoPmkhqIuqf926XXtI9NxUZzGxrgrEuuBF8v+wNx
	4UaaQK3yPaaRonRilkp1lZdfIZyQO1oksHt4T7dYcZZHhKCqi2fsafWCK0CBulblbWFY=;
Subject: Re: [PATCH 4/9] xen/arm: static memory initialization
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-5-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1c6530bf-a362-0993-c4c5-953ee2afb1bf@xen.org>
Date: Wed, 30 Jun 2021 19:09:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210607024318.3988467-5-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 07/06/2021 03:43, Penny Zheng wrote:
> This patch introduces static memory initialization, during system RAM boot up.

The word "RAM" looks spurious.

> New func init_staticmem_pages is responsible for static memory initialization.

s/New func/The new function/

> Helper free_staticmem_pages is the equivalent of free_heap_pages, to free
> nr_mfns pages of static memory.
> 
> This commit defines a new helper free_page to extract common code between
> free_heap_pages and free_staticmem_pages, like following the same cache/TLB
> coherency policy.
> 
> For each page, free_staticmem_pages includes the following extra steps to
> initialize:
> 1. change page state from inuse to free state and grant PGC_reserved.

I think you mean "set" rather than "grant".

> 2. scrub the page in need synchronously.

Can you explain why this is necessary?

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> changes v2:
> - rename to nr_mfns
> - extract common code from free_heap_pages and free_staticmem_pages
> - remove dead codes in other archs, including move some to arm-specific file,
> and put some under CONFIG_ARM
> - mark free_staticmem_pages __init
> ---
>   xen/arch/arm/setup.c    | 27 ++++++++++++++

I think it would be best to split the arm use in a separate patch.

>   xen/common/page_alloc.c | 78 +++++++++++++++++++++++++++++++++--------
>   xen/include/xen/mm.h    |  6 ++++
>   3 files changed, 97 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 00aad1c194..daafea0abb 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -611,6 +611,30 @@ static void __init init_pdx(void)
>       }
>   }
>   
> +/* Static memory initialization */
> +static void __init init_staticmem_pages(void)
> +{
> +    int bank;
> +
> +    /*
> +     * TODO: Considering NUMA-support scenario.
> +     */
> +    for ( bank = 0 ; bank < bootinfo.static_mem.nr_banks; bank++ )
> +    {
> +        paddr_t bank_start = bootinfo.static_mem.bank[bank].start;
> +        paddr_t bank_size = bootinfo.static_mem.bank[bank].size;
> +        paddr_t bank_end = bank_start + bank_size;
> +
> +        bank_start = round_pgup(bank_start);
> +        bank_end = round_pgdown(bank_end);
> +        if ( bank_end <= bank_start )
> +            return;
> +
> +        free_staticmem_pages(maddr_to_page(bank_start),
> +                            (bank_end - bank_start) >> PAGE_SHIFT, false);
> +    }
> +}
> +
>   #ifdef CONFIG_ARM_32
>   static void __init setup_mm(void)
>   {
> @@ -872,6 +896,9 @@ void __init start_xen(unsigned long boot_phys_offset,
>       cmdline_parse(cmdline);
>   
>       setup_mm();
> +    /* If exists, Static Memory Initialization. */
> +    if ( bootinfo.static_mem.nr_banks > 0 )

This check seems a pointless because init_staticmem_pages() is already 
able to cope with nr_banks == 0.

> +        init_staticmem_pages();
I would prefer if this is folded in setup_mm().

>   
>       /* Parse the ACPI tables for possible boot-time configuration */
>       acpi_boot_table_init();
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 958ba0cd92..8c00262c04 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1376,6 +1376,37 @@ bool scrub_free_pages(void)
>       return node_to_scrub(false) != NUMA_NO_NODE;
>   }
>   
> +static void free_page(struct page_info *pg, bool need_scrub)
> +{
> +    mfn_t mfn = page_to_mfn(pg);
> +
> +    /* If a page has no owner it will need no safety TLB flush. */
> +    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
> +    if ( pg->u.free.need_tlbflush )
> +        page_set_tlbflush_timestamp(pg);
> +
> +    /* This page is not a guest frame any more. */
> +    page_set_owner(pg, NULL); /* set_gpfn_from_mfn snoops pg owner */
> +    set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
> +
> +#ifdef CONFIG_ARM

To echo what Jan already wrote, I am not in favor of adding new #ifdef 
CONFIG_<arch> in common code. I would expect the logic for static memory 
to be the same for each arch, so this should be protected with a generic 
Kconfig.

> +    if ( pg->count_info & PGC_reserved )
> +    {
> +        /* TODO: asynchronous scrubbing. */
> +        if ( need_scrub )
> +            scrub_one_page(pg);
> +        return;
> +    }
> +#endif
> +    if ( need_scrub )
> +    {
> +        pg->count_info |= PGC_need_scrub;
> +        poison_one_page(pg);
> +    }
> +
> +    return;
> +}
> +
>   /* Free 2^@order set of pages. */
>   static void free_heap_pages(
>       struct page_info *pg, unsigned int order, bool need_scrub)
> @@ -1425,20 +1456,7 @@ static void free_heap_pages(
>               BUG();
>           }
>   
> -        /* If a page has no owner it will need no safety TLB flush. */
> -        pg[i].u.free.need_tlbflush = (page_get_owner(&pg[i]) != NULL);
> -        if ( pg[i].u.free.need_tlbflush )
> -            page_set_tlbflush_timestamp(&pg[i]);
> -
> -        /* This page is not a guest frame any more. */
> -        page_set_owner(&pg[i], NULL); /* set_gpfn_from_mfn snoops pg owner */
> -        set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
> -
> -        if ( need_scrub )
> -        {
> -            pg[i].count_info |= PGC_need_scrub;
> -            poison_one_page(&pg[i]);
> -        }
> +        free_page(&pg[i], need_scrub);
>       }
>   
>       avail[node][zone] += 1 << order;
> @@ -1512,6 +1530,38 @@ static void free_heap_pages(
>       spin_unlock(&heap_lock);
>   }
>   
> +#ifdef CONFIG_STATIC_ALLOCATION
> +/* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
> +void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                                 bool need_scrub)
> +{
> +    mfn_t mfn = page_to_mfn(pg);
> +    unsigned long i;
> +
> +    for ( i = 0; i < nr_mfns; i++ )
> +    {
> +        switch ( pg[i].count_info & PGC_state )
> +        {
> +        case PGC_state_inuse:
> +            BUG_ON(pg[i].count_info & PGC_broken);
> +            /* Mark it free and reserved. */
> +            pg[i].count_info = PGC_state_free | PGC_reserved;
> +            break;
> +
> +        default:
> +            printk(XENLOG_ERR
> +                   "Page state shall be only in PGC_state_inuse. "
> +                   "pg[%lu] MFN %"PRI_mfn" count_info=%#lx tlbflush_timestamp=%#x.\n",
> +                   i, mfn_x(mfn) + i,
> +                   pg[i].count_info,
> +                   pg[i].tlbflush_timestamp);
> +            BUG();
> +        }
> +
> +        free_page(&pg[i], need_scrub);
> +    }
> +}
> +#endif
>   
>   /*
>    * Following rules applied for page offline:
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 667f9dac83..df25e55966 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -85,6 +85,12 @@ bool scrub_free_pages(void);
>   } while ( false )
>   #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>   
> +#ifdef CONFIG_ARM
> +/* Static Allocation */
> +void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                          bool need_scrub);
> +#endif
> +
>   /* Map machine page range in Xen virtual address space. */
>   int map_pages_to_xen(
>       unsigned long virt,
> 

-- 
Julien Grall

