Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1EC27B6BE
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 22:56:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kN0BL-0004ig-5R; Mon, 28 Sep 2020 20:55:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHa=DF=gmail.com=pankaj.gupta.linux@srs-us1.protection.inumbo.net>)
 id 1kN0BJ-0004ib-5h
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 20:55:33 +0000
X-Inumbo-ID: e8a82990-5f44-4e0d-a8de-fc6098bfa05b
Received: from mail-io1-xd42.google.com (unknown [2607:f8b0:4864:20::d42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8a82990-5f44-4e0d-a8de-fc6098bfa05b;
 Mon, 28 Sep 2020 20:55:31 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id k6so356896ior.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2020 13:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NsOk9OxZ8BNHdO4gKcSiVJH3+dCN3ajjMks7Ch1CdgY=;
 b=XS1xdg6NT8OQ7wObkko0CO3DAnJdXMIYcxLuNNXzxXmiKU/h6iVE32bIfexrd38iQy
 fKhrUkvUd0fJlDeWjVc2tF1aMI2hDCk+I3vzx755NSl597+/MP9e6DU41DioGCFP6e0D
 9/fDBNjbkkUEfs9oG1ef4WCIBBZ6t0RioO2g0EVTokJZFOT6HGwQ3TlEAMJUQjtn5miY
 FagIBMFhOa8P+iPy/I3Ts7p+TQItIg5sIo8rhwsQgHfxXZDgqhVLZkztzFshCKj1LmyI
 S81Msyw5gN1f9F2qeYX33fR7Ig9Ug9tKLjUVkQEEyD+TlySfdx5I70ytXeMyAaNg78qH
 LgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NsOk9OxZ8BNHdO4gKcSiVJH3+dCN3ajjMks7Ch1CdgY=;
 b=f3gmufF/lkSvj7IFvBzC24oA/NWDS1rDpLrcihceb17LDJMRxsSa0GcUw/nb2OZyVq
 wb/rICPm/W4p89ungBxz0wsObwf9YDMuJiaewHSUBKqm0SuiNrY5fp4t+VJEE/tpAf0L
 7yhx1HIqIpW9ogs4ueF+mH2D5x+yEAl7XFp4EpCvywtKOU/J8HJyuMuaZXgGJ5J4ZuJ/
 Db+baUEtYgIwyMmFeQeHhwwhHeAa7nyvjpGwxewZaImn2tKN7btEUhCcIl7gJLWYh42s
 GGIi2fr5UUsMONq2GKiPigSkcdzhWXAGD6rapMZY9sjGm9ySqsQazB6p1uVuCBglAs5o
 aGwg==
X-Gm-Message-State: AOAM5305Wsd5OYvuClfq9hvZzyI+IX1gGw6D5MIHWF0eN0yA/T75H43H
 AN047whwf6lx2k6g5nUVX90O8lkxLZxk/fYW0Hg=
X-Google-Smtp-Source: ABdhPJwM5FZ6WjvylJKh9Nru0zE0JHULWglj2CMB4AABZBYCjK41GCYZ11YnhubB9OhxRZy5SgxcTsc2DYatZ22HNgI=
X-Received: by 2002:a05:6638:1607:: with SMTP id
 x7mr400149jas.109.1601326531395; 
 Mon, 28 Sep 2020 13:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200928182110.7050-1-david@redhat.com>
 <20200928182110.7050-4-david@redhat.com>
In-Reply-To: <20200928182110.7050-4-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Mon, 28 Sep 2020 22:55:19 +0200
Message-ID: <CAM9Jb+jYKPOcrDT7nfy=ZnSNGuTHE_M+AxG3G4kHcjT_UDnQ3w@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] mm/page_alloc: always move pages to the tail of
 the freelist in unset_migratetype_isolate()
To: David Hildenbrand <david@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-acpi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
 Oscar Salvador <osalvador@suse.de>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>, 
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>, 
 Dave Hansen <dave.hansen@intel.com>, Vlastimil Babka <vbabka@suse.cz>, 
 Wei Yang <richard.weiyang@linux.alibaba.com>, Mike Rapoport <rppt@kernel.org>, 
 Scott Cheloha <cheloha@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Page isolation doesn't actually touch the pages, it simply isolates
> pageblocks and moves all free pages to the MIGRATE_ISOLATE freelist.
>
> We already place pages to the tail of the freelists when undoing
> isolation via __putback_isolated_page(), let's do it in any case
> (e.g., if order <= pageblock_order) and document the behavior.
>
> Add a "to_tail" parameter to move_freepages_block() but introduce a
> a new move_to_free_list_tail() - similar to add_to_free_list_tail().
>
> This change results in all pages getting onlined via online_pages() to
> be placed to the tail of the freelist.
>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
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
> ---
>  include/linux/page-isolation.h |  4 ++--
>  mm/page_alloc.c                | 35 +++++++++++++++++++++++-----------
>  mm/page_isolation.c            | 12 +++++++++---
>  3 files changed, 35 insertions(+), 16 deletions(-)
>
> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
> index 572458016331..3eca9b3c5305 100644
> --- a/include/linux/page-isolation.h
> +++ b/include/linux/page-isolation.h
> @@ -36,8 +36,8 @@ static inline bool is_migrate_isolate(int migratetype)
>  struct page *has_unmovable_pages(struct zone *zone, struct page *page,
>                                  int migratetype, int flags);
>  void set_pageblock_migratetype(struct page *page, int migratetype);
> -int move_freepages_block(struct zone *zone, struct page *page,
> -                               int migratetype, int *num_movable);
> +int move_freepages_block(struct zone *zone, struct page *page, int migratetype,
> +                        bool to_tail, int *num_movable);
>
>  /*
>   * Changes migrate type in [start_pfn, end_pfn) to be MIGRATE_ISOLATE.
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 9e3ed4a6f69a..d5a5f528b8ca 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -905,6 +905,15 @@ static inline void move_to_free_list(struct page *page, struct zone *zone,
>         list_move(&page->lru, &area->free_list[migratetype]);
>  }
>
> +/* Used for pages which are on another list */
> +static inline void move_to_free_list_tail(struct page *page, struct zone *zone,
> +                                         unsigned int order, int migratetype)
> +{
> +       struct free_area *area = &zone->free_area[order];
> +
> +       list_move_tail(&page->lru, &area->free_list[migratetype]);
> +}
> +
>  static inline void del_page_from_free_list(struct page *page, struct zone *zone,
>                                            unsigned int order)
>  {
> @@ -2338,9 +2347,9 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
>   * Note that start_page and end_pages are not aligned on a pageblock
>   * boundary. If alignment is required, use move_freepages_block()
>   */
> -static int move_freepages(struct zone *zone,
> -                         struct page *start_page, struct page *end_page,
> -                         int migratetype, int *num_movable)
> +static int move_freepages(struct zone *zone, struct page *start_page,
> +                         struct page *end_page, int migratetype,
> +                         bool to_tail, int *num_movable)
>  {
>         struct page *page;
>         unsigned int order;
> @@ -2371,7 +2380,10 @@ static int move_freepages(struct zone *zone,
>                 VM_BUG_ON_PAGE(page_zone(page) != zone, page);
>
>                 order = page_order(page);
> -               move_to_free_list(page, zone, order, migratetype);
> +               if (to_tail)
> +                       move_to_free_list_tail(page, zone, order, migratetype);
> +               else
> +                       move_to_free_list(page, zone, order, migratetype);
>                 page += 1 << order;
>                 pages_moved += 1 << order;
>         }
> @@ -2379,8 +2391,8 @@ static int move_freepages(struct zone *zone,
>         return pages_moved;
>  }
>
> -int move_freepages_block(struct zone *zone, struct page *page,
> -                               int migratetype, int *num_movable)
> +int move_freepages_block(struct zone *zone, struct page *page, int migratetype,
> +                        bool to_tail, int *num_movable)
>  {
>         unsigned long start_pfn, end_pfn;
>         struct page *start_page, *end_page;
> @@ -2401,7 +2413,7 @@ int move_freepages_block(struct zone *zone, struct page *page,
>                 return 0;
>
>         return move_freepages(zone, start_page, end_page, migratetype,
> -                                                               num_movable);
> +                             to_tail, num_movable);
>  }
>
>  static void change_pageblock_range(struct page *pageblock_page,
> @@ -2526,8 +2538,8 @@ static void steal_suitable_fallback(struct zone *zone, struct page *page,
>         if (!whole_block)
>                 goto single_page;
>
> -       free_pages = move_freepages_block(zone, page, start_type,
> -                                               &movable_pages);
> +       free_pages = move_freepages_block(zone, page, start_type, false,
> +                                         &movable_pages);
>         /*
>          * Determine how many pages are compatible with our allocation.
>          * For movable allocation, it's the number of movable pages which
> @@ -2635,7 +2647,8 @@ static void reserve_highatomic_pageblock(struct page *page, struct zone *zone,
>             && !is_migrate_cma(mt)) {
>                 zone->nr_reserved_highatomic += pageblock_nr_pages;
>                 set_pageblock_migratetype(page, MIGRATE_HIGHATOMIC);
> -               move_freepages_block(zone, page, MIGRATE_HIGHATOMIC, NULL);
> +               move_freepages_block(zone, page, MIGRATE_HIGHATOMIC, false,
> +                                    NULL);
>         }
>
>  out_unlock:
> @@ -2711,7 +2724,7 @@ static bool unreserve_highatomic_pageblock(const struct alloc_context *ac,
>                          */
>                         set_pageblock_migratetype(page, ac->migratetype);
>                         ret = move_freepages_block(zone, page, ac->migratetype,
> -                                                                       NULL);
> +                                                  false, NULL);
>                         if (ret) {
>                                 spin_unlock_irqrestore(&zone->lock, flags);
>                                 return ret;
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index abfe26ad59fd..de44e1329706 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -45,7 +45,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
>                 set_pageblock_migratetype(page, MIGRATE_ISOLATE);
>                 zone->nr_isolate_pageblock++;
>                 nr_pages = move_freepages_block(zone, page, MIGRATE_ISOLATE,
> -                                                                       NULL);
> +                                               false, NULL);
>
>                 __mod_zone_freepage_state(zone, -nr_pages, mt);
>                 spin_unlock_irqrestore(&zone->lock, flags);
> @@ -83,7 +83,7 @@ static void unset_migratetype_isolate(struct page *page, unsigned migratetype)
>          * Because freepage with more than pageblock_order on isolated
>          * pageblock is restricted to merge due to freepage counting problem,
>          * it is possible that there is free buddy page.
> -        * move_freepages_block() doesn't care of merge so we need other
> +        * move_freepages_block() don't care about merging, so we need another
>          * approach in order to merge them. Isolation and free will make
>          * these pages to be merged.
>          */
> @@ -106,9 +106,15 @@ static void unset_migratetype_isolate(struct page *page, unsigned migratetype)
>          * If we isolate freepage with more than pageblock_order, there
>          * should be no freepage in the range, so we could avoid costly
>          * pageblock scanning for freepage moving.
> +        *
> +        * We didn't actually touch any of the isolated pages, so place them
> +        * to the tail of the freelist. This is an optimization for memory
> +        * onlining - just onlined memory won't immediately be considered for
> +        * allocation.
>          */
>         if (!isolated_page) {
> -               nr_pages = move_freepages_block(zone, page, migratetype, NULL);
> +               nr_pages = move_freepages_block(zone, page, migratetype, true,
> +                                               NULL);
>                 __mod_zone_freepage_state(zone, nr_pages, migratetype);
>         }
>         set_pageblock_migratetype(page, migratetype);

Acked-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>

