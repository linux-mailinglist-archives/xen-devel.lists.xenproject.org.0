Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449212835A0
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 14:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2993.8598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPPPt-0006sV-6C; Mon, 05 Oct 2020 12:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2993.8598; Mon, 05 Oct 2020 12:16:33 +0000
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
	id 1kPPPt-0006s3-2k; Mon, 05 Oct 2020 12:16:33 +0000
Received: by outflank-mailman (input) for mailman id 2993;
 Mon, 05 Oct 2020 12:16:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c+yv=DM=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1kPPPr-0006rU-LP
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 12:16:31 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 84479ba7-e796-4cc8-b6e3-43f1748c8848;
 Mon, 05 Oct 2020 12:16:29 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-TlvT2dKcMy2qnf7NNmOSuA-1; Mon, 05 Oct 2020 08:16:25 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5087107ACF5;
 Mon,  5 Oct 2020 12:16:22 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-222.ams2.redhat.com [10.36.114.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AAF6271A3;
 Mon,  5 Oct 2020 12:16:13 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=c+yv=DM=redhat.com=david@srs-us1.protection.inumbo.net>)
	id 1kPPPr-0006rU-LP
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 12:16:31 +0000
X-Inumbo-ID: 84479ba7-e796-4cc8-b6e3-43f1748c8848
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 84479ba7-e796-4cc8-b6e3-43f1748c8848;
	Mon, 05 Oct 2020 12:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601900189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I+9FWa50a4fAVSLereFH2OCTk21D3ec5peVlRys8eQY=;
	b=RlKFUjuh8aMeDLhwWX1WZ5S0QGEVmrisUilRPf+BEJSvL7QxUs2dcau5pypzfunDA26Yqp
	nDK9t6cV+6kexLTmxZNqDXdpg4ps0xAfXnQG0umi/smAnLUuklKZYQeI5+LZydRTM2W6XR
	9UZ/PfrkJrI6b+u2LQIvHAE9xgYMstw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-TlvT2dKcMy2qnf7NNmOSuA-1; Mon, 05 Oct 2020 08:16:25 -0400
X-MC-Unique: TlvT2dKcMy2qnf7NNmOSuA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5087107ACF5;
	Mon,  5 Oct 2020 12:16:22 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-222.ams2.redhat.com [10.36.114.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8AAF6271A3;
	Mon,  5 Oct 2020 12:16:13 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-hyperv@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Wei Yang <richard.weiyang@linux.alibaba.com>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Michal Hocko <mhocko@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Scott Cheloha <cheloha@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 3/5] mm/page_alloc: move pages to tail in move_to_free_list()
Date: Mon,  5 Oct 2020 14:15:32 +0200
Message-Id: <20201005121534.15649-4-david@redhat.com>
In-Reply-To: <20201005121534.15649-1-david@redhat.com>
References: <20201005121534.15649-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

Whenever we move pages between freelists via move_to_free_list()/
move_freepages_block(), we don't actually touch the pages:
1. Page isolation doesn't actually touch the pages, it simply isolates
   pageblocks and moves all free pages to the MIGRATE_ISOLATE freelist.
   When undoing isolation, we move the pages back to the target list.
2. Page stealing (steal_suitable_fallback()) moves free pages directly
   between lists without touching them.
3. reserve_highatomic_pageblock()/unreserve_highatomic_pageblock() moves
   free pages directly between freelists without touching them.

We already place pages to the tail of the freelists when undoing isolation
via __putback_isolated_page(), let's do it in any case (e.g., if order <=
pageblock_order) and document the behavior. To simplify, let's move the
pages to the tail for all move_to_free_list()/move_freepages_block() users.

In 2., the target list is empty, so there should be no change. In 3.,
we might observe a change, however, highatomic is more concerned about
allocations succeeding than cache hotness - if we ever realize this
change degrades a workload, we can special-case this instance and add a
proper comment.

This change results in all pages getting onlined via online_pages() to
be placed to the tail of the freelist.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Acked-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Scott Cheloha <cheloha@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c     | 10 +++++++---
 mm/page_isolation.c |  5 +++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index df5ff0cd6df1..b187e46cf640 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -901,13 +901,17 @@ static inline void add_to_free_list_tail(struct page *page, struct zone *zone,
 	area->nr_free++;
 }
 
-/* Used for pages which are on another list */
+/*
+ * Used for pages which are on another list. Move the pages to the tail
+ * of the list - so the moved pages won't immediately be considered for
+ * allocation again (e.g., optimization for memory onlining).
+ */
 static inline void move_to_free_list(struct page *page, struct zone *zone,
 				     unsigned int order, int migratetype)
 {
 	struct free_area *area = &zone->free_area[order];
 
-	list_move(&page->lru, &area->free_list[migratetype]);
+	list_move_tail(&page->lru, &area->free_list[migratetype]);
 }
 
 static inline void del_page_from_free_list(struct page *page, struct zone *zone,
@@ -2340,7 +2344,7 @@ static inline struct page *__rmqueue_cma_fallback(struct zone *zone,
 #endif
 
 /*
- * Move the free pages in a range to the free lists of the requested type.
+ * Move the free pages in a range to the freelist tail of the requested type.
  * Note that start_page and end_pages are not aligned on a pageblock
  * boundary. If alignment is required, use move_freepages_block()
  */
diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index abfe26ad59fd..83692b937784 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -106,6 +106,11 @@ static void unset_migratetype_isolate(struct page *page, unsigned migratetype)
 	 * If we isolate freepage with more than pageblock_order, there
 	 * should be no freepage in the range, so we could avoid costly
 	 * pageblock scanning for freepage moving.
+	 *
+	 * We didn't actually touch any of the isolated pages, so place them
+	 * to the tail of the freelist. This is an optimization for memory
+	 * onlining - just onlined memory won't immediately be considered for
+	 * allocation.
 	 */
 	if (!isolated_page) {
 		nr_pages = move_freepages_block(zone, page, migratetype, NULL);
-- 
2.26.2


