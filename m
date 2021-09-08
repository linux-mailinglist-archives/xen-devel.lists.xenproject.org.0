Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E410F4041F9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 01:58:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182499.330089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO7Rm-0000sa-HA; Wed, 08 Sep 2021 23:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182499.330089; Wed, 08 Sep 2021 23:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO7Rm-0000pt-E4; Wed, 08 Sep 2021 23:57:42 +0000
Received: by outflank-mailman (input) for mailman id 182499;
 Wed, 08 Sep 2021 23:57:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IK88=N6=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mO7Rl-0000pn-0P
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 23:57:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7eb6c99-57b2-41dc-8324-868a8e5f3e28;
 Wed, 08 Sep 2021 23:57:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3CBE61078;
 Wed,  8 Sep 2021 23:57:38 +0000 (UTC)
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
X-Inumbo-ID: e7eb6c99-57b2-41dc-8324-868a8e5f3e28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631145459;
	bh=m4x1Nut6of6QS3jxMRWIT4+lBYGXEaekkeZtJr0tZ4I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KuVx1yRXtaDH1dsUKiXmAeQGDTfN4//4+iJOmvbxk36NG/jP1isDQeA7Wj7ffDy4t
	 gtjGV9XfpCK2GIoYkO5ZRZxGJQjLZPx5GLahtD1R1R39U/JK+PeovKfTMN+jNI6Hnh
	 lsFTW0bpB8VeQL1guEi65ocaggdNsPS0Qkw0VDKu4HMXxA4EhmRGY59gUS942yj+11
	 3K4M0ED1LHj399naElpq7m9cjzB6fC0sPS6F5+0WDVrR21KhA8pLPjeKsmaKvto8/m
	 /fxnEZ/xbkmX7B6wPFZAH9MSXzo27jH2HDWazcVVALfGe44r/9Z9u7m+ctoQto76f8
	 phc8Bvgpbb3tQ==
Date: Wed, 8 Sep 2021 16:57:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Penny Zheng <penny.zheng@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, Wei.Chen@arm.com, jbeulich@suse.com
Subject: Re: [PATCH v6 5/7] xen: re-define assign_pages and introduce a new
 function assign_page
In-Reply-To: <20210908095248.545981-6-penny.zheng@arm.com>
Message-ID: <alpine.DEB.2.21.2109081654290.10523@sstabellini-ThinkPad-T480s>
References: <20210908095248.545981-1-penny.zheng@arm.com> <20210908095248.545981-6-penny.zheng@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 8 Sep 2021, Penny Zheng wrote:
> In order to deal with the trouble of count-to-order conversion when page number
> is not in a power-of-two, this commit re-define assign_pages for nr pages and
> introduces a new helper assign_page for original page with a single order.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

The patch looks correct to me, however I don't think I understood Jan's
request to the previous version of this patch, so I can't tell if you
addressed his concerns.


> ---
>  xen/arch/x86/pv/dom0_build.c |  2 +-
>  xen/common/grant_table.c     |  2 +-
>  xen/common/memory.c          |  6 +++---
>  xen/common/page_alloc.c      | 21 +++++++++++++--------
>  xen/include/xen/mm.h         |  6 ++++++
>  5 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index d7f9e04b28..7787cc8fca 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -568,7 +568,7 @@ int __init dom0_construct_pv(struct domain *d,
>          else
>          {
>              while ( count-- )
> -                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
> +                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 1, 0) )
>                      BUG();
>          }
>          initrd->mod_end = 0;
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index ee61603a97..50f5f83023 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -2358,7 +2358,7 @@ gnttab_transfer(
>           * is respected and speculative execution is blocked accordingly
>           */
>          if ( unlikely(!evaluate_nospec(okay)) ||
> -            unlikely(assign_pages(e, page, 0, MEMF_no_refcount)) )
> +            unlikely(assign_pages(e, page, 1, MEMF_no_refcount)) )
>          {
>              bool drop_dom_ref;
>  
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 74babb0bd7..9cef8790ff 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -728,8 +728,8 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>          /* Assign each output page to the domain. */
>          for ( j = 0; (page = page_list_remove_head(&out_chunk_list)); ++j )
>          {
> -            if ( assign_pages(d, page, exch.out.extent_order,
> -                              MEMF_no_refcount) )
> +            if ( assign_page(page, exch.out.extent_order, d,
> +                             MEMF_no_refcount) )
>              {
>                  unsigned long dec_count;
>                  bool_t drop_dom_ref;
> @@ -797,7 +797,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>       * cleared PGC_allocated.
>       */
>      while ( (page = page_list_remove_head(&in_chunk_list)) )
> -        if ( assign_pages(d, page, 0, MEMF_no_refcount) )
> +        if ( assign_pages(d, page, 1, MEMF_no_refcount) )
>          {
>              BUG_ON(!d->is_dying);
>              free_domheap_page(page);
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index ba7adc80db..bb19bb10ff 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2261,7 +2261,7 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
>  int assign_pages(
>      struct domain *d,
>      struct page_info *pg,
> -    unsigned int order,
> +    unsigned long nr,
>      unsigned int memflags)
>  {
>      int rc = 0;
> @@ -2281,7 +2281,7 @@ int assign_pages(
>      {
>          unsigned int extra_pages = 0;
>  
> -        for ( i = 0; i < (1ul << order); i++ )
> +        for ( i = 0; i < nr; i++ )
>          {
>              ASSERT(!(pg[i].count_info & ~PGC_extra));
>              if ( pg[i].count_info & PGC_extra )
> @@ -2290,18 +2290,18 @@ int assign_pages(
>  
>          ASSERT(!extra_pages ||
>                 ((memflags & MEMF_no_refcount) &&
> -                extra_pages == 1u << order));
> +                extra_pages == nr));
>      }
>  #endif
>  
>      if ( pg[0].count_info & PGC_extra )
>      {
> -        d->extra_pages += 1u << order;
> +        d->extra_pages += nr;
>          memflags &= ~MEMF_no_refcount;
>      }
>      else if ( !(memflags & MEMF_no_refcount) )
>      {
> -        unsigned int tot_pages = domain_tot_pages(d) + (1 << order);
> +        unsigned int tot_pages = domain_tot_pages(d) + nr;
>  
>          if ( unlikely(tot_pages > d->max_pages) )
>          {
> @@ -2313,10 +2313,10 @@ int assign_pages(
>      }
>  
>      if ( !(memflags & MEMF_no_refcount) &&
> -         unlikely(domain_adjust_tot_pages(d, 1 << order) == (1 << order)) )
> +         unlikely(domain_adjust_tot_pages(d, nr) == nr) )
>          get_knownalive_domain(d);
>  
> -    for ( i = 0; i < (1 << order); i++ )
> +    for ( i = 0; i < nr; i++ )
>      {
>          ASSERT(page_get_owner(&pg[i]) == NULL);
>          page_set_owner(&pg[i], d);
> @@ -2331,6 +2331,11 @@ int assign_pages(
>      return rc;
>  }
>  
> +int assign_page(struct page_info *pg, unsigned int order, struct domain *d,
> +                unsigned int memflags)
> +{
> +    return assign_pages(d, pg, 1UL << order, memflags);
> +}
>  
>  struct page_info *alloc_domheap_pages(
>      struct domain *d, unsigned int order, unsigned int memflags)
> @@ -2373,7 +2378,7 @@ struct page_info *alloc_domheap_pages(
>                  pg[i].count_info = PGC_extra;
>              }
>          }
> -        if ( assign_pages(d, pg, order, memflags) )
> +        if ( assign_page(pg, order, d, memflags) )
>          {
>              free_heap_pages(pg, order, memflags & MEMF_no_scrub);
>              return NULL;
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index 8e8fb5a615..a74e93eba8 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -133,8 +133,14 @@ void heap_init_late(void);
>  
>  int assign_pages(
>      struct domain *d,
> +    struct page_info *pg,
> +    unsigned long nr,
> +    unsigned int memflags);
> +
> +int assign_page(
>      struct page_info *pg,
>      unsigned int order,
> +    struct domain *d,
>      unsigned int memflags);
>  
>  /* Dump info to serial console */
> -- 
> 2.25.1
> 

