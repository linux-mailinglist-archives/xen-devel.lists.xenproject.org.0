Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D190426EAB3
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 03:53:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJ5aj-0003YA-Ob; Fri, 18 Sep 2020 01:53:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UN7C=C3=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kJ5ai-0003Y1-EC
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 01:53:36 +0000
X-Inumbo-ID: bb5c55b8-bf28-4d74-9b16-5c2ef9aeef37
Received: from out30-43.freemail.mail.aliyun.com (unknown [115.124.30.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb5c55b8-bf28-4d74-9b16-5c2ef9aeef37;
 Fri, 18 Sep 2020 01:53:32 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
 TI=SMTPD_---0U9GXrdc_1600394005; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0U9GXrdc_1600394005) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 18 Sep 2020 09:53:26 +0800
Date: Fri, 18 Sep 2020 09:53:25 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH RFC 1/4] mm/page_alloc: convert "report" flag of
 __free_one_page() to a proper flag
Message-ID: <20200918015325.GA54754@L-31X9LVDL-1304.local>
References: <20200916183411.64756-1-david@redhat.com>
 <20200916183411.64756-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916183411.64756-2-david@redhat.com>
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

On Wed, Sep 16, 2020 at 08:34:08PM +0200, David Hildenbrand wrote:
>Let's prepare for additional flags and avoid long parameter lists of bools.
>Follow-up patches will also make use of the flags in __free_pages_ok(),
>however, I wasn't able to come up with a better name for the type - should
>be good enough for internal purposes.
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
>Signed-off-by: David Hildenbrand <david@redhat.com>
>---
> mm/page_alloc.c | 28 ++++++++++++++++++++--------
> 1 file changed, 20 insertions(+), 8 deletions(-)
>
>diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>index 6b699d273d6e..91cefb8157dd 100644
>--- a/mm/page_alloc.c
>+++ b/mm/page_alloc.c
>@@ -77,6 +77,18 @@
> #include "shuffle.h"
> #include "page_reporting.h"
> 
>+/* Free One Page flags: for internal, non-pcp variants of free_pages(). */
>+typedef int __bitwise fop_t;
>+
>+/* No special request */
>+#define FOP_NONE		((__force fop_t)0)
>+
>+/*
>+ * Skip free page reporting notification after buddy merging (will *not* mark

__free_one_page() may not merge buddy when its buddy is not available.

Would this comment be a little confusing?

>+ * the page reported, only skip the notification).
>+ */
>+#define FOP_SKIP_REPORT_NOTIFY	((__force fop_t)BIT(0))
>+
> /* prevent >1 _updater_ of zone percpu pageset ->high and ->batch fields */
> static DEFINE_MUTEX(pcp_batch_high_lock);
> #define MIN_PERCPU_PAGELIST_FRACTION	(8)
>@@ -948,10 +960,9 @@ buddy_merge_likely(unsigned long pfn, unsigned long buddy_pfn,
>  * -- nyc
>  */
> 
>-static inline void __free_one_page(struct page *page,
>-		unsigned long pfn,
>-		struct zone *zone, unsigned int order,
>-		int migratetype, bool report)
>+static inline void __free_one_page(struct page *page, unsigned long pfn,
>+				   struct zone *zone, unsigned int order,
>+				   int migratetype, fop_t fop_flags)
> {
> 	struct capture_control *capc = task_capc(zone);
> 	unsigned long buddy_pfn;
>@@ -1038,7 +1049,7 @@ static inline void __free_one_page(struct page *page,
> 		add_to_free_list(page, zone, order, migratetype);
> 
> 	/* Notify page reporting subsystem of freed page */
>-	if (report)
>+	if (!(fop_flags & FOP_SKIP_REPORT_NOTIFY))
> 		page_reporting_notify_free(order);
> }
> 
>@@ -1368,7 +1379,7 @@ static void free_pcppages_bulk(struct zone *zone, int count,
> 		if (unlikely(isolated_pageblocks))
> 			mt = get_pageblock_migratetype(page);
> 
>-		__free_one_page(page, page_to_pfn(page), zone, 0, mt, true);
>+		__free_one_page(page, page_to_pfn(page), zone, 0, mt, FOP_NONE);
> 		trace_mm_page_pcpu_drain(page, 0, mt);
> 	}
> 	spin_unlock(&zone->lock);
>@@ -1384,7 +1395,7 @@ static void free_one_page(struct zone *zone,
> 		is_migrate_isolate(migratetype))) {
> 		migratetype = get_pfnblock_migratetype(page, pfn);
> 	}
>-	__free_one_page(page, pfn, zone, order, migratetype, true);
>+	__free_one_page(page, pfn, zone, order, migratetype, FOP_NONE);
> 	spin_unlock(&zone->lock);
> }
> 
>@@ -3277,7 +3288,8 @@ void __putback_isolated_page(struct page *page, unsigned int order, int mt)
> 	lockdep_assert_held(&zone->lock);
> 
> 	/* Return isolated page to tail of freelist. */
>-	__free_one_page(page, page_to_pfn(page), zone, order, mt, false);
>+	__free_one_page(page, page_to_pfn(page), zone, order, mt,
>+			FOP_SKIP_REPORT_NOTIFY);
> }
> 
> /*
>-- 
>2.26.2

-- 
Wei Yang
Help you, Help me

