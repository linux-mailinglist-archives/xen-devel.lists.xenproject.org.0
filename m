Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D63EB5E8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 15:01:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166798.304462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWnM-0002Lx-9i; Fri, 13 Aug 2021 13:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166798.304462; Fri, 13 Aug 2021 13:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWnM-0002K7-60; Fri, 13 Aug 2021 13:00:20 +0000
Received: by outflank-mailman (input) for mailman id 166798;
 Fri, 13 Aug 2021 13:00:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mEWnK-0002K1-5U
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 13:00:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEWnJ-0006Bi-U0; Fri, 13 Aug 2021 13:00:17 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEWnJ-0002zq-OU; Fri, 13 Aug 2021 13:00:17 +0000
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
	bh=sM7KzT7uLNBnwlR0FRwHL60SEQ0ToAb23Qnxy1hEr/g=; b=iL8Ci6PGasC3mboFox+TA0gp1H
	QKWxH0mFNuYZzhPDRrHY7c07gEM0gTNeEMRT8anRk05nSA766JW3MiqEA0q+WMpvCdNQ7chTpWbYb
	KcernmS8NiAphWlKqVjT5Bh7RI2k3clpEGiFT2KCxuhivFY30z7q7FRIDYSXswfhmlTk=;
Subject: Re: [PATCH V4 08/10] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-9-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <611fc504-c866-647e-01f3-0614238c3aca@xen.org>
Date: Fri, 13 Aug 2021 14:00:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728102758.3269446-9-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 28/07/2021 11:27, Penny Zheng wrote:
> alloc_staticmem_pages aims to acquire nr_mfns contiguous pages of
> static memory. And it is the equivalent of alloc_heap_pages for static
> memory. Here only covers acquiring pre-configured static memory.
> 
> For each page, it shall check if the page is reserved(PGC_reserved)
> and free. It shall also do a set of necessary initialization, which are
> mostly the same ones in alloc_heap_pages, like, following the same
> cache-coherency policy and turning page status into PGC_state_inuse, etc.
> 
> acquire_domstatic_pages is the equivalent of alloc_domheap_pages for
> static memory, and it is to acquire nr_mfns contiguous pages of static memory
> and assign them to one specific domain.
> 
> It uses acquire_staticmem_pages to acquire nr_mfns pre-configured pages of
> static memory, then on success, it will use assign_pages to assign those pages
> to one specific domain.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v4 change:
> - moving tlb/cache flush outside of the locked region, considering XSA-364
> and reducing the amount of work happening with the heap_lock held
> - remove MEMF_no_refcount case
> - make acquire_staticmem_pages/acquire_domstatic_pages being __init
> ---
>   xen/common/page_alloc.c | 108 +++++++++++++++++++++++++++++++++++++++-
>   xen/include/xen/mm.h    |   3 ++
>   2 files changed, 109 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index e279c6f713..b0edaf12b3 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -151,6 +151,10 @@
>   #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>   #endif
>   
> +#ifndef CONFIG_STATIC_MEMORY
> +#define PGC_reserved 0
> +#endif
> +
>   /*
>    * Comma-separated list of hexadecimal page numbers containing bad bytes.
>    * e.g. 'badpage=0x3f45,0x8a321'.
> @@ -1065,6 +1069,73 @@ static struct page_info *alloc_heap_pages(
>       return pg;
>   }
>   
> +#ifdef CONFIG_STATIC_MEMORY

Rather than having multiple #ifdef in the code. Could we bundle all the 
functions for static allocation in a single place?

> +/*
> + * Acquire nr_mfns contiguous reserved pages, starting at #smfn, of
> + * static memory.
> + */
> +static struct page_info * __init acquire_staticmem_pages(unsigned long nr_mfns,
> +                                                         mfn_t smfn,
> +                                                         unsigned int memflags)

NIT: I find more intuitive if we pass the start MFN first and then the 
number of pages. So this can be seen as a range.

If you agree with that, then the caller would also have to be changed.

> +{
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +    unsigned long i;
> +    struct page_info *pg;
> +
> +    /* For now, it only supports pre-configured static memory. */

This comment doesn't seem to match the check below.

> +    if ( !mfn_valid(smfn) || !nr_mfns )

This check only guarantees that there will be a page for the first MFN. 
Shouldn't we also check for the other MFNs?

> +        return NULL;
> +
> +    spin_lock(&heap_lock);
> +
> +    pg = mfn_to_page(smfn);
> +
> +    for ( i = 0; i < nr_mfns; i++ )
> +    {
> +        /*
> +         * Reference count must continuously be zero for free pages
> +         * of static memory(PGC_reserved).
> +         */

How about: "The page should be reserved and not yet allocated"?

> +        if ( pg[i].count_info != (PGC_state_free | PGC_reserved) )
> +        {
> +            printk(XENLOG_ERR
> +                   "pg[%lu] Static MFN %"PRI_mfn" c=%#lx t=%#x\n",
> +                   i, mfn_x(page_to_mfn(pg + i)),
> +                   pg[i].count_info, pg[i].tlbflush_timestamp);
> +            BUG();

This BUG() can be easily hit by misconfiguring the Device-Tree. I think 
it would be best if we return an error and revert the changes.

> +        }
> +
> +        if ( !(memflags & MEMF_no_tlbflush) )
> +            accumulate_tlbflush(&need_tlbflush, &pg[i],
> +                                &tlbflush_timestamp);
> +
> +        /*
> +         * Preserve flag PGC_reserved and change page state
> +         * to PGC_state_inuse.
> +         */
> +        pg[i].count_info = (PGC_reserved | PGC_state_inuse);
> +        /* Initialise fields which have other uses for free pages. */
> +        pg[i].u.inuse.type_info = 0;
> +        page_set_owner(&pg[i], NULL);
> +    }
> +
> +    spin_unlock(&heap_lock);
> +
> +    if ( need_tlbflush )
> +        filtered_flush_tlb_mask(tlbflush_timestamp);
> +
> +    /*
> +     * Ensure cache and RAM are consistent for platforms where the guest
> +     * can control its own visibility of/through the cache.
> +     */
> +    for ( i = 0; i < nr_mfns; i++ )
> +        flush_page_to_ram(mfn_x(smfn) + i, !(memflags & MEMF_no_icache_flush));
> +
> +    return pg;
> +}
> +#endif
> +
>   /* Remove any offlined page in the buddy pointed to by head. */
>   static int reserve_offlined_page(struct page_info *head)
>   {
> @@ -2306,7 +2377,7 @@ int assign_pages(
>   
>           for ( i = 0; i < nr; i++ )
>           {
> -            ASSERT(!(pg[i].count_info & ~PGC_extra));
> +            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_reserved)));
>               if ( pg[i].count_info & PGC_extra )
>                   extra_pages++;
>           }
> @@ -2345,7 +2416,8 @@ int assign_pages(
>           page_set_owner(&pg[i], d);
>           smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
>           pg[i].count_info =
> -            (pg[i].count_info & PGC_extra) | PGC_allocated | 1;
> +            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
> +
>           page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
>       }
>   
> @@ -2411,6 +2483,38 @@ struct page_info *alloc_domheap_pages(
>       return pg;
>   }
>   
> +#ifdef CONFIG_STATIC_MEMORY
> +/*
> + * Acquire nr_mfns contiguous pages, starting at #smfn, of static memory,
> + * then assign them to one specific domain #d.
> + */
> +struct page_info * __init acquire_domstatic_pages(struct domain *d,
> +                                                  unsigned long nr_mfns,
> +                                                  mfn_t smfn, unsigned int memflags)
> +{
> +    struct page_info *pg = NULL;
> +
> +    ASSERT(!in_irq());
> +
> +    pg = acquire_staticmem_pages(nr_mfns, smfn, memflags);
> +    if ( !pg )
> +        return NULL;
> +
> +    /*
> +     * MEMF_no_owner/MEMF_no_refcount cases are missing here because
> +     * right now, acquired static memory is only for guest RAM.
> +     */
> +    ASSERT(d);
> +    if ( assign_pages(pg, nr_mfns, d, memflags) )
> +    {
> +        free_staticmem_pages(pg, nr_mfns, memflags & MEMF_no_scrub);
> +        return NULL;
> +    }
> +
> +    return pg;
> +}
> +#endif
> +
>   void free_domheap_pages(struct page_info *pg, unsigned int order)
>   {
>       struct domain *d = page_get_owner(pg);
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 2e75cdcbb7..62e8e2ad61 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -89,6 +89,9 @@ bool scrub_free_pages(void);
>   /* These functions are for static memory */
>   void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>                             bool need_scrub);
> +struct page_info *acquire_domstatic_pages(struct domain *d,
> +                                          unsigned long nr_mfns, mfn_t smfn,
> +                                          unsigned int memflags);
>   #endif
>   
>   /* Map machine page range in Xen virtual address space. */
> 

Cheers,

-- 
Julien Grall

