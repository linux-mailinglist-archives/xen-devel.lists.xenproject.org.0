Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C2A284B74
	for <lists+xen-devel@lfdr.de>; Tue,  6 Oct 2020 14:12:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3244.9438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPlpX-0003Mt-Oc; Tue, 06 Oct 2020 12:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3244.9438; Tue, 06 Oct 2020 12:12:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPlpX-0003MU-LT; Tue, 06 Oct 2020 12:12:31 +0000
Received: by outflank-mailman (input) for mailman id 3244;
 Tue, 06 Oct 2020 12:12:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2wnd=DN=suse.com=mhocko@srs-us1.protection.inumbo.net>)
 id 1kPlpW-0003MO-5Z
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 12:12:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e505fe30-1833-4b10-a6ff-f4ebc5802110;
 Tue, 06 Oct 2020 12:12:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B8F2FAB95;
 Tue,  6 Oct 2020 12:12:26 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2wnd=DN=suse.com=mhocko@srs-us1.protection.inumbo.net>)
	id 1kPlpW-0003MO-5Z
	for xen-devel@lists.xenproject.org; Tue, 06 Oct 2020 12:12:30 +0000
X-Inumbo-ID: e505fe30-1833-4b10-a6ff-f4ebc5802110
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e505fe30-1833-4b10-a6ff-f4ebc5802110;
	Tue, 06 Oct 2020 12:12:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601986346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mAU57Ek0qHw3pvzhn1nGqMRGEvP+BHT9YA55QmaOE0c=;
	b=PfznraKzbDoQ+43ul+fCEC6Ow3fb+GPiDyy0YheRdIEd5y093LGzF7+HryEbkAFwWyjGkf
	3zKDdTUHNT8nvpwqTgFG24rVLdFSOubG2Rg7qJL6FAxG7SZPG47/y6+D3GDFw0LRMABnKQ
	ReFcS00OGqBMBevTFcg7tcZbt8VllnQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B8F2FAB95;
	Tue,  6 Oct 2020 12:12:26 +0000 (UTC)
Date: Tue, 6 Oct 2020 14:12:24 +0200
From: Michal Hocko <mhocko@suse.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Wei Yang <richard.weiyang@linux.alibaba.com>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Dave Hansen <dave.hansen@intel.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Scott Cheloha <cheloha@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 3/5] mm/page_alloc: move pages to tail in
 move_to_free_list()
Message-ID: <20201006121224.GE29020@dhcp22.suse.cz>
References: <20201005121534.15649-1-david@redhat.com>
 <20201005121534.15649-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005121534.15649-4-david@redhat.com>

On Mon 05-10-20 14:15:32, David Hildenbrand wrote:
> Whenever we move pages between freelists via move_to_free_list()/
> move_freepages_block(), we don't actually touch the pages:
> 1. Page isolation doesn't actually touch the pages, it simply isolates
>    pageblocks and moves all free pages to the MIGRATE_ISOLATE freelist.
>    When undoing isolation, we move the pages back to the target list.
> 2. Page stealing (steal_suitable_fallback()) moves free pages directly
>    between lists without touching them.
> 3. reserve_highatomic_pageblock()/unreserve_highatomic_pageblock() moves
>    free pages directly between freelists without touching them.
> 
> We already place pages to the tail of the freelists when undoing isolation
> via __putback_isolated_page(), let's do it in any case (e.g., if order <=
> pageblock_order) and document the behavior. To simplify, let's move the
> pages to the tail for all move_to_free_list()/move_freepages_block() users.
> 
> In 2., the target list is empty, so there should be no change. In 3.,
> we might observe a change, however, highatomic is more concerned about
> allocations succeeding than cache hotness - if we ever realize this
> change degrades a workload, we can special-case this instance and add a
> proper comment.
> 
> This change results in all pages getting onlined via online_pages() to
> be placed to the tail of the freelist.
> 
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Acked-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Cc: Mel Gorman <mgorman@techsingularity.net>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Dave Hansen <dave.hansen@intel.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Scott Cheloha <cheloha@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Much simpler!
Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!

> ---
>  mm/page_alloc.c     | 10 +++++++---
>  mm/page_isolation.c |  5 +++++
>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index df5ff0cd6df1..b187e46cf640 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -901,13 +901,17 @@ static inline void add_to_free_list_tail(struct page *page, struct zone *zone,
>  	area->nr_free++;
>  }
>  
> -/* Used for pages which are on another list */
> +/*
> + * Used for pages which are on another list. Move the pages to the tail
> + * of the list - so the moved pages won't immediately be considered for
> + * allocation again (e.g., optimization for memory onlining).
> + */
>  static inline void move_to_free_list(struct page *page, struct zone *zone,
>  				     unsigned int order, int migratetype)
>  {
>  	struct free_area *area = &zone->free_area[order];
>  
> -	list_move(&page->lru, &area->free_list[migratetype]);
> +	list_move_tail(&page->lru, &area->free_list[migratetype]);
>  }
>  
>  static inline void del_page_from_free_list(struct page *page, struct zone *zone,
> @@ -2340,7 +2344,7 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
>  #endif
>  
>  /*
> - * Move the free pages in a range to the free lists of the requested type.
> + * Move the free pages in a range to the freelist tail of the requested type.
>   * Note that start_page and end_pages are not aligned on a pageblock
>   * boundary. If alignment is required, use move_freepages_block()
>   */
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index abfe26ad59fd..83692b937784 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -106,6 +106,11 @@ static void unset_migratetype_isolate(struct page *page, unsigned migratetype)
>  	 * If we isolate freepage with more than pageblock_order, there
>  	 * should be no freepage in the range, so we could avoid costly
>  	 * pageblock scanning for freepage moving.
> +	 *
> +	 * We didn't actually touch any of the isolated pages, so place them
> +	 * to the tail of the freelist. This is an optimization for memory
> +	 * onlining - just onlined memory won't immediately be considered for
> +	 * allocation.
>  	 */
>  	if (!isolated_page) {
>  		nr_pages = move_freepages_block(zone, page, migratetype, NULL);
> -- 
> 2.26.2

-- 
Michal Hocko
SUSE Labs

