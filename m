Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 172A1404207
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 02:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182505.330100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO7XQ-0003Cq-Mj; Thu, 09 Sep 2021 00:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182505.330100; Thu, 09 Sep 2021 00:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO7XQ-0003AE-JY; Thu, 09 Sep 2021 00:03:32 +0000
Received: by outflank-mailman (input) for mailman id 182505;
 Thu, 09 Sep 2021 00:03:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArGz=N7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mO7XO-0003A8-9X
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 00:03:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68c6bc64-aebf-4700-b3d0-84ca59c6351b;
 Thu, 09 Sep 2021 00:03:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1633060F6C;
 Thu,  9 Sep 2021 00:03:28 +0000 (UTC)
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
X-Inumbo-ID: 68c6bc64-aebf-4700-b3d0-84ca59c6351b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631145808;
	bh=O5g3IT1QAlttxYH6hZmifAew4o0sOSkg0hnR7Y7Iwa4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uAYBDyb4fhs4fS/FwHkp1mD/q33Do2tnSbZ3saXmwJNtCuPO+bwJalzqtL+dmLsIh
	 myzqHPVRZ2ICmS/cZjz3MPH5UetPbCgfNNDnJ7gQYvjvtSWkkwi2n3fwcUk45B6HtG
	 GViqaSkfG7NgzAXJUE4DPrHIqU1D5rWXraA7IUPSf6kDysVge343Aoi/ntF3bjGN46
	 1DALdapGlFWotUXYH/YQ/X2YEJIIC1x8vEJKYnfaD3UWo3/pzG13Qbhl97Fx2vu9rg
	 s3q39D542lWhrITGLQj1E0nChAnlFQA1nV5NUUI5BnexS5AHjKtL2nCdVfNbILJDVH
	 HiRZlWFPuFMsw==
Date: Wed, 8 Sep 2021 17:03:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com, jbeulich@suse.com
Subject: Re: [PATCH v6 6/7] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
In-Reply-To: <20210908095248.545981-7-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.21.2109081703180.10523@sstabellini-ThinkPad-T480s>
References: <20210908095248.545981-1-penny.zheng@arm.com> <20210908095248.545981-7-penny.zheng@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Sep 2021, Penny Zheng wrote:
> New function acquire_staticmem_pages aims to acquire nr_mfns contiguous pages
> of static memory, starting at #smfn. And it is the equivalent of
> alloc_heap_pages for static memory.
> 
> For each page, it shall check if the page is reserved(PGC_reserved)
> and free. It shall also do a set of necessary initialization, which are
> mostly the same ones in alloc_heap_pages, like, following the same
> cache-coherency policy and turning page status into PGC_state_inuse, etc.
> 
> New function acquire_domstatic_pages is the equivalent of alloc_domheap_pages
> for static memory, and it is to acquire nr_mfns contiguous pages of
> static memory and assign them to one specific domain.
> 
> It uses acquire_staticmem_pages to acquire nr_mfns pages of static memory.
> Then on success, it will use assign_pages to assign those pages to one
> specific domain.
> 
> In order to differentiate pages of static memory from those allocated from
> heap, this patch introduces a new page flag PGC_reserved, then mark pages of
> static memory PGC_reserved when initializing them.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/page_alloc.c  | 118 ++++++++++++++++++++++++++++++++++++++-
>  xen/include/asm-arm/mm.h |   3 +
>  xen/include/xen/mm.h     |   2 +
>  3 files changed, 121 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index bb19bb10ff..59dffcfa1d 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -151,6 +151,10 @@
>  #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>  #endif
>  
> +#ifndef PGC_reserved
> +#define PGC_reserved 0
> +#endif
> +
>  /*
>   * Comma-separated list of hexadecimal page numbers containing bad bytes.
>   * e.g. 'badpage=0x3f45,0x8a321'.
> @@ -2283,7 +2287,7 @@ int assign_pages(
>  
>          for ( i = 0; i < nr; i++ )
>          {
> -            ASSERT(!(pg[i].count_info & ~PGC_extra));
> +            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_reserved)));
>              if ( pg[i].count_info & PGC_extra )
>                  extra_pages++;
>          }
> @@ -2322,7 +2326,8 @@ int assign_pages(
>          page_set_owner(&pg[i], d);
>          smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
>          pg[i].count_info =
> -            (pg[i].count_info & PGC_extra) | PGC_allocated | 1;
> +            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
> +
>          page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
>      }
>  
> @@ -2626,8 +2631,117 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>              /* TODO: asynchronous scrubbing for pages of static memory. */
>              scrub_one_page(pg);
>          }
> +
> +        /* In case initializing page of static memory, mark it PGC_reserved. */
> +        pg[i].count_info |= PGC_reserved;
>      }
>  }
> +
> +/*
> + * Acquire nr_mfns contiguous reserved pages, starting at #smfn, of
> + * static memory.
> + * This function needs to be reworked if used outside of boot.
> + */
> +static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
> +                                                         unsigned long nr_mfns,
> +                                                         unsigned int memflags)
> +{
> +    bool need_tlbflush = false;
> +    uint32_t tlbflush_timestamp = 0;
> +    unsigned long i;
> +    struct page_info *pg;
> +
> +    ASSERT(nr_mfns);
> +    for ( i = 0; i < nr_mfns; i++ )
> +        if ( !mfn_valid(mfn_add(smfn, i)) )
> +            return NULL;
> +
> +    pg = mfn_to_page(smfn);
> +
> +    spin_lock(&heap_lock);
> +
> +    for ( i = 0; i < nr_mfns; i++ )
> +    {
> +        /* The page should be reserved and not yet allocated. */
> +        if ( pg[i].count_info != (PGC_state_free | PGC_reserved) )
> +        {
> +            printk(XENLOG_ERR
> +                   "pg[%lu] Static MFN %"PRI_mfn" c=%#lx t=%#x\n",
> +                   i, mfn_x(smfn) + i,
> +                   pg[i].count_info, pg[i].tlbflush_timestamp);
> +            goto out_err;
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
> +        pg[i].count_info = PGC_reserved | PGC_state_inuse;
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
> +
> + out_err:
> +    while ( i-- )
> +        pg[i].count_info = PGC_reserved | PGC_state_free;
> +
> +    spin_unlock(&heap_lock);
> +
> +    return NULL;
> +}
> +
> +/*
> + * Acquire nr_mfns contiguous pages, starting at #smfn, of static memory,
> + * then assign them to one specific domain #d.
> + */
> +int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
> +                                   unsigned long nr_mfns, unsigned int memflags)
> +{
> +    struct page_info *pg;
> +
> +    ASSERT(!in_irq());
> +
> +    pg = acquire_staticmem_pages(smfn, nr_mfns, memflags);
> +    if ( !pg )
> +        return -ENOENT;
> +
> +    if ( !d || (memflags & (MEMF_no_owner | MEMF_no_refcount)) )
> +    {
> +        /*
> +         * Respective handling omitted here because right now
> +         * acquired static memory is only for guest RAM.
> +         */
> +        ASSERT_UNREACHABLE();
> +        return -EINVAL;
> +    }
> +
> +    if ( assign_pages(d, pg, nr_mfns, memflags) )
> +    {
> +        free_staticmem_pages(pg, nr_mfns, memflags & MEMF_no_scrub);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
>  #endif
>  
>  /*
> diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
> index ded74d29da..7b5e7b7f69 100644
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -108,6 +108,9 @@ struct page_info
>    /* Page is Xen heap? */
>  #define _PGC_xen_heap     PG_shift(2)
>  #define PGC_xen_heap      PG_mask(1, 2)
> +  /* Page is reserved */
> +#define _PGC_reserved     PG_shift(3)
> +#define PGC_reserved      PG_mask(1, 3)
>  /* ... */
>  /* Page is broken? */
>  #define _PGC_broken       PG_shift(7)
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index a74e93eba8..da1b158693 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -89,6 +89,8 @@ bool scrub_free_pages(void);
>  /* These functions are for static memory */
>  void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
>                            bool need_scrub);
> +int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned long nr_mfns,
> +                            unsigned int memflags);
>  #endif
>  
>  /* Map machine page range in Xen virtual address space. */
> -- 
> 2.25.1
> 

