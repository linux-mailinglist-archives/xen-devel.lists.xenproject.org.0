Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EEF28359D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 14:16:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2991.8574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPPPV-0006hg-JD; Mon, 05 Oct 2020 12:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2991.8574; Mon, 05 Oct 2020 12:16:09 +0000
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
	id 1kPPPV-0006hD-FC; Mon, 05 Oct 2020 12:16:09 +0000
Received: by outflank-mailman (input) for mailman id 2991;
 Mon, 05 Oct 2020 12:16:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c+yv=DM=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1kPPPT-0006gw-SM
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 12:16:07 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 39a9e146-f421-44ff-b35f-6cb9296d79f3;
 Mon, 05 Oct 2020 12:16:05 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-Y1IAhXxZNuKk3UjduWcrDg-1; Mon, 05 Oct 2020 08:16:01 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B695D107ACF5;
 Mon,  5 Oct 2020 12:15:58 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-222.ams2.redhat.com [10.36.114.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F7A01A913;
 Mon,  5 Oct 2020 12:15:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=c+yv=DM=redhat.com=david@srs-us1.protection.inumbo.net>)
	id 1kPPPT-0006gw-SM
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 12:16:07 +0000
X-Inumbo-ID: 39a9e146-f421-44ff-b35f-6cb9296d79f3
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 39a9e146-f421-44ff-b35f-6cb9296d79f3;
	Mon, 05 Oct 2020 12:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601900165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jnWAK3O4yILdw4ZP0mQyIXKP0/Hh52uEJ+0mn35WIQ=;
	b=FaCqxhCKW1Gu1JSOMoatETAbCAz+HmGzA5k6KPvnhCKRg3jgAPZSIdQLhzddxm61xQPW9w
	r/u/Z3Ie8zGqhH78rKHcy8VB4PSntlLaGMpMFeRvOe0RbygCJ1X5k7pw+dTP7q+USi2syz
	Z9m328UQPpa+AiKh2PzZAY1rDVKs04Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-Y1IAhXxZNuKk3UjduWcrDg-1; Mon, 05 Oct 2020 08:16:01 -0400
X-MC-Unique: Y1IAhXxZNuKk3UjduWcrDg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B695D107ACF5;
	Mon,  5 Oct 2020 12:15:58 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-222.ams2.redhat.com [10.36.114.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F7A01A913;
	Mon,  5 Oct 2020 12:15:51 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-hyperv@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Oscar Salvador <osalvador@suse.de>,
	Wei Yang <richard.weiyang@linux.alibaba.com>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Michal Hocko <mhocko@suse.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Michal Hocko <mhocko@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v2 1/5] mm/page_alloc: convert "report" flag of __free_one_page() to a proper flag
Date: Mon,  5 Oct 2020 14:15:30 +0200
Message-Id: <20201005121534.15649-2-david@redhat.com>
In-Reply-To: <20201005121534.15649-1-david@redhat.com>
References: <20201005121534.15649-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

Let's prepare for additional flags and avoid long parameter lists of bools.
Follow-up patches will also make use of the flags in __free_pages_ok().

Reviewed-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Acked-by: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Mel Gorman <mgorman@techsingularity.net>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Wei Yang <richard.weiyang@linux.alibaba.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 7012d67a302d..2bf235b1953f 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -78,6 +78,22 @@
 #include "shuffle.h"
 #include "page_reporting.h"
 
+/* Free Page Internal flags: for internal, non-pcp variants of free_pages(). */
+typedef int __bitwise fpi_t;
+
+/* No special request */
+#define FPI_NONE		((__force fpi_t)0)
+
+/*
+ * Skip free page reporting notification for the (possibly merged) page.
+ * This does not hinder free page reporting from grabbing the page,
+ * reporting it and marking it "reported" -  it only skips notifying
+ * the free page reporting infrastructure about a newly freed page. For
+ * example, used when temporarily pulling a page from a freelist and
+ * putting it back unmodified.
+ */
+#define FPI_SKIP_REPORT_NOTIFY	((__force fpi_t)BIT(0))
+
 /* prevent >1 _updater_ of zone percpu pageset ->high and ->batch fields */
 static DEFINE_MUTEX(pcp_batch_high_lock);
 #define MIN_PERCPU_PAGELIST_FRACTION	(8)
@@ -952,7 +968,7 @@ buddy_merge_likely(unsigned long pfn, unsigned long buddy_pfn,
 static inline void __free_one_page(struct page *page,
 		unsigned long pfn,
 		struct zone *zone, unsigned int order,
-		int migratetype, bool report)
+		int migratetype, fpi_t fpi_flags)
 {
 	struct capture_control *capc = task_capc(zone);
 	unsigned long buddy_pfn;
@@ -1039,7 +1055,7 @@ static inline void __free_one_page(struct page *page,
 		add_to_free_list(page, zone, order, migratetype);
 
 	/* Notify page reporting subsystem of freed page */
-	if (report)
+	if (!(fpi_flags & FPI_SKIP_REPORT_NOTIFY))
 		page_reporting_notify_free(order);
 }
 
@@ -1380,7 +1396,7 @@ static void free_pcppages_bulk(struct zone *zone, int count,
 		if (unlikely(isolated_pageblocks))
 			mt = get_pageblock_migratetype(page);
 
-		__free_one_page(page, page_to_pfn(page), zone, 0, mt, true);
+		__free_one_page(page, page_to_pfn(page), zone, 0, mt, FPI_NONE);
 		trace_mm_page_pcpu_drain(page, 0, mt);
 	}
 	spin_unlock(&zone->lock);
@@ -1396,7 +1412,7 @@ static void free_one_page(struct zone *zone,
 		is_migrate_isolate(migratetype))) {
 		migratetype = get_pfnblock_migratetype(page, pfn);
 	}
-	__free_one_page(page, pfn, zone, order, migratetype, true);
+	__free_one_page(page, pfn, zone, order, migratetype, FPI_NONE);
 	spin_unlock(&zone->lock);
 }
 
@@ -3289,7 +3305,8 @@ void __putback_isolated_page(struct page *page, unsigned int order, int mt)
 	lockdep_assert_held(&zone->lock);
 
 	/* Return isolated page to tail of freelist. */
-	__free_one_page(page, page_to_pfn(page), zone, order, mt, false);
+	__free_one_page(page, page_to_pfn(page), zone, order, mt,
+			FPI_SKIP_REPORT_NOTIFY);
 }
 
 /*
-- 
2.26.2


