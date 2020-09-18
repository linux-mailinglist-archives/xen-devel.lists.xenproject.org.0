Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2556326EEA8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 04:30:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJ69L-0006m5-8e; Fri, 18 Sep 2020 02:29:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UN7C=C3=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kJ69J-0006m0-Oa
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 02:29:21 +0000
X-Inumbo-ID: 63c40ed0-297a-407a-950a-19be94b6b9f2
Received: from out4436.biz.mail.alibaba.com (unknown [47.88.44.36])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63c40ed0-297a-407a-950a-19be94b6b9f2;
 Fri, 18 Sep 2020 02:29:17 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R301e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=17; SR=0;
 TI=SMTPD_---0U9GoJOP_1600396142; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0U9GoJOP_1600396142) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 18 Sep 2020 10:29:02 +0800
Date: Fri, 18 Sep 2020 10:29:02 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Scott Cheloha <cheloha@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH RFC 3/4] mm/page_alloc: always move pages to the tail of
 the freelist in unset_migratetype_isolate()
Message-ID: <20200918022902.GD54754@L-31X9LVDL-1304.local>
References: <20200916183411.64756-1-david@redhat.com>
 <20200916183411.64756-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916183411.64756-4-david@redhat.com>
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
Reply-To: Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Sep 16, 2020 at 08:34:10PM +0200, David Hildenbrand wrote:
>Page isolation doesn't actually touch the pages, it simply isolates
>pageblocks and moves all free pages to the MIGRATE_ISOLATE freelist.
>
>We already place pages to the tail of the freelists when undoing
>isolation via __putback_isolated_page(), let's do it in any case
>(e.g., if order == pageblock_order) and document the behavior.
>
>This change results in all pages getting onlined via online_pages() to
>be placed to the tail of the freelist.

I am sorry to not follow again. unset_migratetype_isolate() is used in
__offline_pages if my understanding is correct. How does it contribute on
online_pages? 

>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>Cc: Mel Gorman <mgorman@techsingularity.net>
>Cc: Michal Hocko <mhocko@kernel.org>
>Cc: Dave Hansen <dave.hansen@intel.com>
>Cc: Vlastimil Babka <vbabka@suse.cz>
>Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: Mike Rapoport <rppt@kernel.org>
>Cc: Scott Cheloha <cheloha@linux.ibm.com>
>Cc: Michael Ellerman <mpe@ellerman.id.au>
>Signed-off-by: David Hildenbrand <david@redhat.com>
>---
> include/linux/page-isolation.h |  2 ++
> mm/page_alloc.c                | 36 +++++++++++++++++++++++++++++-----
> mm/page_isolation.c            |  8 ++++++--
> 3 files changed, 39 insertions(+), 7 deletions(-)
>
>diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
>index 572458016331..a36be2cf4dbb 100644
>--- a/include/linux/page-isolation.h
>+++ b/include/linux/page-isolation.h
>@@ -38,6 +38,8 @@ struct page *has_unmovable_pages(struct zone *zone, struct page *page,
> void set_pageblock_migratetype(struct page *page, int migratetype);
> int move_freepages_block(struct zone *zone, struct page *page,
> 				int migratetype, int *num_movable);
>+int move_freepages_block_tail(struct zone *zone, struct page *page,
>+			      int migratetype);
> 
> /*
>  * Changes migrate type in [start_pfn, end_pfn) to be MIGRATE_ISOLATE.
>diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>index bba9a0f60c70..75b0f49b4022 100644
>--- a/mm/page_alloc.c
>+++ b/mm/page_alloc.c
>@@ -899,6 +899,15 @@ static inline void move_to_free_list(struct page *page, struct zone *zone,
> 	list_move(&page->lru, &area->free_list[migratetype]);
> }
> 
>+/* Used for pages which are on another list */
>+static inline void move_to_free_list_tail(struct page *page, struct zone *zone,
>+					  unsigned int order, int migratetype)
>+{
>+	struct free_area *area = &zone->free_area[order];
>+
>+	list_move_tail(&page->lru, &area->free_list[migratetype]);
>+}
>+
> static inline void del_page_from_free_list(struct page *page, struct zone *zone,
> 					   unsigned int order)
> {
>@@ -2323,7 +2332,7 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
>  */
> static int move_freepages(struct zone *zone,
> 			  struct page *start_page, struct page *end_page,
>-			  int migratetype, int *num_movable)
>+			  int migratetype, int *num_movable, bool to_tail)
> {
> 	struct page *page;
> 	unsigned int order;
>@@ -2354,7 +2363,10 @@ static int move_freepages(struct zone *zone,
> 		VM_BUG_ON_PAGE(page_zone(page) != zone, page);
> 
> 		order = page_order(page);
>-		move_to_free_list(page, zone, order, migratetype);
>+		if (to_tail)
>+			move_to_free_list_tail(page, zone, order, migratetype);
>+		else
>+			move_to_free_list(page, zone, order, migratetype);
> 		page += 1 << order;
> 		pages_moved += 1 << order;
> 	}
>@@ -2362,8 +2374,9 @@ static int move_freepages(struct zone *zone,
> 	return pages_moved;
> }
> 
>-int move_freepages_block(struct zone *zone, struct page *page,
>-				int migratetype, int *num_movable)
>+static int __move_freepages_block(struct zone *zone, struct page *page,
>+				  int migratetype, int *num_movable,
>+				  bool to_tail)
> {
> 	unsigned long start_pfn, end_pfn;
> 	struct page *start_page, *end_page;
>@@ -2384,7 +2397,20 @@ int move_freepages_block(struct zone *zone, struct page *page,
> 		return 0;
> 
> 	return move_freepages(zone, start_page, end_page, migratetype,
>-								num_movable);
>+			      num_movable, to_tail);
>+}
>+
>+int move_freepages_block(struct zone *zone, struct page *page,
>+			 int migratetype, int *num_movable)
>+{
>+	return __move_freepages_block(zone, page, migratetype, num_movable,
>+				      false);
>+}
>+
>+int move_freepages_block_tail(struct zone *zone, struct page *page,
>+			      int migratetype)
>+{
>+	return __move_freepages_block(zone, page, migratetype, NULL, true);
> }
> 
> static void change_pageblock_range(struct page *pageblock_page,
>diff --git a/mm/page_isolation.c b/mm/page_isolation.c
>index abfe26ad59fd..84aa1d14751d 100644
>--- a/mm/page_isolation.c
>+++ b/mm/page_isolation.c
>@@ -83,7 +83,7 @@ static void unset_migratetype_isolate(struct page *page, unsigned migratetype)
> 	 * Because freepage with more than pageblock_order on isolated
> 	 * pageblock is restricted to merge due to freepage counting problem,
> 	 * it is possible that there is free buddy page.
>-	 * move_freepages_block() doesn't care of merge so we need other
>+	 * move_freepages_block*() don't care about merging, so we need another
> 	 * approach in order to merge them. Isolation and free will make
> 	 * these pages to be merged.
> 	 */
>@@ -106,9 +106,13 @@ static void unset_migratetype_isolate(struct page *page, unsigned migratetype)
> 	 * If we isolate freepage with more than pageblock_order, there
> 	 * should be no freepage in the range, so we could avoid costly
> 	 * pageblock scanning for freepage moving.
>+	 *
>+	 * We didn't actually touch any of the isolated pages, so place them
>+	 * to the tail of the freelists. This is especially relevant during
>+	 * memory onlining.
> 	 */
> 	if (!isolated_page) {
>-		nr_pages = move_freepages_block(zone, page, migratetype, NULL);
>+		nr_pages = move_freepages_block_tail(zone, page, migratetype);
> 		__mod_zone_freepage_state(zone, nr_pages, migratetype);
> 	}
> 	set_pageblock_migratetype(page, migratetype);
>-- 
>2.26.2

-- 
Wei Yang
Help you, Help me

