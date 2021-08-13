Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991B63EB575
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 14:27:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166777.304418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWHR-00053g-RA; Fri, 13 Aug 2021 12:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166777.304418; Fri, 13 Aug 2021 12:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEWHR-00051X-Ng; Fri, 13 Aug 2021 12:27:21 +0000
Received: by outflank-mailman (input) for mailman id 166777;
 Fri, 13 Aug 2021 12:27:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mEWHQ-00051R-Qv
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 12:27:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEWHQ-0005bc-Km; Fri, 13 Aug 2021 12:27:20 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mEWHQ-0007yr-F3; Fri, 13 Aug 2021 12:27:20 +0000
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
	bh=Co6/rkCbXULJ+8XHyOWhAfFATVkJb4c83OusJy+XS44=; b=MjlleSLSqftwLrFCHHXgUmXJln
	ALNeuHv9I+j1ob3VpA4oxWB3245Q4nVuSoreYJzhtVoYqmbjoAB7rK+X7shzTC5cURT/Sqie4ICaY
	d+Y03nRKNtvpK/3N7y/GBBwrD4RPuFzrpE8c/FIKNGFZ8/YACRgGCN9zO3gbKBxMHIxU=;
Subject: Re: [PATCH V4 07/10] xen: re-define assign_pages and introduce
 assign_page
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-8-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <58be6daa-d8d1-1907-c549-585f56075a99@xen.org>
Date: Fri, 13 Aug 2021 13:27:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728102758.3269446-8-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 28/07/2021 11:27, Penny Zheng wrote:
> In order to deal with the trouble of count-to-order conversion when page number
> is not in a power-of-two, this commit re-define assign_pages for nr pages and
> assign_page for original page with a single order.
> 
> Backporting confusion could be helped by altering the order of assign_page
> parameters, such that the compiler would point out that adjustments at call
> sites are needed.

Looking at the code, you don't alter the order of assign_page() 
parameters. So did you mean to refer to "assign_pages()"?

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v4 change:
> - in all cases where order-0 pages get passed, prefer using assign_pages
> to pass literal 1
> - reconstruct the order of assign_pages parameters
> - remove the unnecessary parentheses
> ---
>   xen/arch/x86/pv/dom0_build.c |  2 +-
>   xen/common/grant_table.c     |  2 +-
>   xen/common/memory.c          |  4 ++--
>   xen/common/page_alloc.c      | 23 ++++++++++++++---------
>   xen/include/xen/mm.h         |  6 ++++++
>   5 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index af47615b22..9142f359da 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -556,7 +556,7 @@ int __init dom0_construct_pv(struct domain *d,
>           else
>           {
>               while ( count-- )
> -                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
> +                if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
>                       BUG();
>           }
>           initrd->mod_end = 0;
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index fab77ab9cc..1f6b89bff4 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -2342,7 +2342,7 @@ gnttab_transfer(
>            * is respected and speculative execution is blocked accordingly
>            */
>           if ( unlikely(!evaluate_nospec(okay)) ||
> -            unlikely(assign_pages(e, page, 0, MEMF_no_refcount)) )
> +            unlikely(assign_pages(page, 1, e, MEMF_no_refcount)) )
>           {
>               bool drop_dom_ref;
>   
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index e07bd9a5ea..083e14b84f 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -728,7 +728,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>           /* Assign each output page to the domain. */
>           for ( j = 0; (page = page_list_remove_head(&out_chunk_list)); ++j )
>           {
> -            if ( assign_pages(d, page, exch.out.extent_order,
> +            if ( assign_page(d, page, exch.out.extent_order,
>                                 MEMF_no_refcount) )
>               {
>                   unsigned long dec_count;
> @@ -797,7 +797,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>        * cleared PGC_allocated.
>        */
>       while ( (page = page_list_remove_head(&in_chunk_list)) )
> -        if ( assign_pages(d, page, 0, MEMF_no_refcount) )
> +        if ( assign_pages(page, 1, d, MEMF_no_refcount) )
>           {
>               BUG_ON(!d->is_dying);
>               free_domheap_page(page);
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index f51e406401..e279c6f713 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2282,9 +2282,9 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
>   
>   
>   int assign_pages(
> -    struct domain *d,
>       struct page_info *pg,
> -    unsigned int order,
> +    unsigned long nr,
> +    struct domain *d,
>       unsigned int memflags)
>   {
>       int rc = 0;
> @@ -2304,7 +2304,7 @@ int assign_pages(
>       {
>           unsigned int extra_pages = 0;
>   
> -        for ( i = 0; i < (1ul << order); i++ )
> +        for ( i = 0; i < nr; i++ )
>           {
>               ASSERT(!(pg[i].count_info & ~PGC_extra));
>               if ( pg[i].count_info & PGC_extra )
> @@ -2313,18 +2313,18 @@ int assign_pages(
>   
>           ASSERT(!extra_pages ||
>                  ((memflags & MEMF_no_refcount) &&
> -                extra_pages == 1u << order));
> +                extra_pages == nr));
>       }
>   #endif
>   
>       if ( pg[0].count_info & PGC_extra )
>       {
> -        d->extra_pages += 1u << order;
> +        d->extra_pages += nr;
>           memflags &= ~MEMF_no_refcount;
>       }
>       else if ( !(memflags & MEMF_no_refcount) )
>       {
> -        unsigned int tot_pages = domain_tot_pages(d) + (1 << order);
> +        unsigned int tot_pages = domain_tot_pages(d) + nr;
>   
>           if ( unlikely(tot_pages > d->max_pages) )
>           {
> @@ -2336,10 +2336,10 @@ int assign_pages(
>       }
>   
>       if ( !(memflags & MEMF_no_refcount) &&
> -         unlikely(domain_adjust_tot_pages(d, 1 << order) == (1 << order)) )
> +         unlikely(domain_adjust_tot_pages(d, nr) == nr) )
>           get_knownalive_domain(d);
>   
> -    for ( i = 0; i < (1 << order); i++ )
> +    for ( i = 0; i < nr; i++ )
>       {
>           ASSERT(page_get_owner(&pg[i]) == NULL);
>           page_set_owner(&pg[i], d);
> @@ -2354,6 +2354,11 @@ int assign_pages(
>       return rc;
>   }
>   
> +int assign_page(struct domain *d, struct page_info *pg, unsigned int order,
> +                unsigned int memflags)
> +{
> +    return assign_pages(pg, 1UL << order, d, memflags);
> +}
>   
>   struct page_info *alloc_domheap_pages(
>       struct domain *d, unsigned int order, unsigned int memflags)
> @@ -2396,7 +2401,7 @@ struct page_info *alloc_domheap_pages(
>                   pg[i].count_info = PGC_extra;
>               }
>           }
> -        if ( assign_pages(d, pg, order, memflags) )
> +        if ( assign_page(d, pg, order, memflags) )
>           {
>               free_heap_pages(pg, order, memflags & MEMF_no_scrub);
>               return NULL;
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 8e8fb5a615..2e75cdcbb7 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -132,6 +132,12 @@ int query_page_offline(mfn_t mfn, uint32_t *status);
>   void heap_init_late(void);
>   
>   int assign_pages(
> +    struct page_info *pg,
> +    unsigned long nr,
> +    struct domain *d,
> +    unsigned int memflags);
> +
> +int assign_page(
>       struct domain *d,
>       struct page_info *pg,
>       unsigned int order,

I find a bit odd that the parameters are ordered differently between 
assign_pages() and assign_page(). They are similar interface after all.

I don't think it would be a problem for backporting purpose if 
assign_page() has a different order for the arguments.

Jan, what do you think?

Cheers,

-- 
Julien Grall

