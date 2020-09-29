Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868CF27C095
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 11:11:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNBfA-00046a-UY; Tue, 29 Sep 2020 09:11:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4Fm=DG=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kNBf8-00046V-SK
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 09:11:06 +0000
X-Inumbo-ID: 6ed164d2-976a-4446-9f44-462ced0e6849
Received: from out30-43.freemail.mail.aliyun.com (unknown [115.124.30.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ed164d2-976a-4446-9f44-462ced0e6849;
 Tue, 29 Sep 2020 09:11:03 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=17; SR=0;
 TI=SMTPD_---0UATjY34_1601370658; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0UATjY34_1601370658) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 29 Sep 2020 17:10:58 +0800
Date: Tue, 29 Sep 2020 17:10:58 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Mike Rapoport <rppt@kernel.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 2/5] mm/page_alloc: place pages to tail in
 __putback_isolated_page()
Message-ID: <20200929091058.GA36904@L-31X9LVDL-1304.local>
References: <20200928182110.7050-1-david@redhat.com>
 <20200928182110.7050-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200928182110.7050-3-david@redhat.com>
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

On Mon, Sep 28, 2020 at 08:21:07PM +0200, David Hildenbrand wrote:
>__putback_isolated_page() already documents that pages will be placed to
>the tail of the freelist - this is, however, not the case for
>"order >= MAX_ORDER - 2" (see buddy_merge_likely()) - which should be
>the case for all existing users.
>
>This change affects two users:
>- free page reporting
>- page isolation, when undoing the isolation (including memory onlining).
>
>This behavior is desireable for pages that haven't really been touched
>lately, so exactly the two users that don't actually read/write page
>content, but rather move untouched pages.
>
>The new behavior is especially desirable for memory onlining, where we
>allow allocation of newly onlined pages via undo_isolate_page_range()
>in online_pages(). Right now, we always place them to the head of the
>free list, resulting in undesireable behavior: Assume we add
>individual memory chunks via add_memory() and online them right away to
>the NORMAL zone. We create a dependency chain of unmovable allocations
>e.g., via the memmap. The memmap of the next chunk will be placed onto
>previous chunks - if the last block cannot get offlined+removed, all
>dependent ones cannot get offlined+removed. While this can already be
>observed with individual DIMMs, it's more of an issue for virtio-mem
>(and I suspect also ppc DLPAR).
>
>Document that this should only be used for optimizations, and no code
>should realy on this for correction (if the order of freepage lists
>ever changes).
>
>We won't care about page shuffling: memory onlining already properly
>shuffles after onlining. free page reporting doesn't care about
>physically contiguous ranges, and there are already cases where page
>isolation will simply move (physically close) free pages to (currently)
>the head of the freelists via move_freepages_block() instead of
>shuffling. If this becomes ever relevant, we should shuffle the whole
>zone when undoing isolation of larger ranges, and after
>free_contig_range().
>
>Reviewed-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
>Reviewed-by: Oscar Salvador <osalvador@suse.de>
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

Reviewed-by: Wei Yang <richard.weiyang@linux.alibaba.com>

>---
> mm/page_alloc.c | 18 ++++++++++++++++--
> 1 file changed, 16 insertions(+), 2 deletions(-)
>
>diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>index daab90e960fe..9e3ed4a6f69a 100644
>--- a/mm/page_alloc.c
>+++ b/mm/page_alloc.c
>@@ -89,6 +89,18 @@ typedef int __bitwise fop_t;
>  */
> #define FOP_SKIP_REPORT_NOTIFY	((__force fop_t)BIT(0))
> 
>+/*
>+ * Place the (possibly merged) page to the tail of the freelist. Will ignore
>+ * page shuffling (relevant code - e.g., memory onlining - is expected to
>+ * shuffle the whole zone).
>+ *
>+ * Note: No code should rely onto this flag for correctness - it's purely
>+ *       to allow for optimizations when handing back either fresh pages
>+ *       (memory onlining) or untouched pages (page isolation, free page
>+ *       reporting).
>+ */
>+#define FOP_TO_TAIL		((__force fop_t)BIT(1))
>+
> /* prevent >1 _updater_ of zone percpu pageset ->high and ->batch fields */
> static DEFINE_MUTEX(pcp_batch_high_lock);
> #define MIN_PERCPU_PAGELIST_FRACTION	(8)
>@@ -1038,7 +1050,9 @@ static inline void __free_one_page(struct page *page, unsigned long pfn,
> done_merging:
> 	set_page_order(page, order);
> 
>-	if (is_shuffle_order(order))
>+	if (fop_flags & FOP_TO_TAIL)
>+		to_tail = true;
>+	else if (is_shuffle_order(order))
> 		to_tail = shuffle_pick_tail();
> 	else
> 		to_tail = buddy_merge_likely(pfn, buddy_pfn, page, order);
>@@ -3300,7 +3314,7 @@ void __putback_isolated_page(struct page *page, unsigned int order, int mt)
> 
> 	/* Return isolated page to tail of freelist. */
> 	__free_one_page(page, page_to_pfn(page), zone, order, mt,
>-			FOP_SKIP_REPORT_NOTIFY);
>+			FOP_SKIP_REPORT_NOTIFY | FOP_TO_TAIL);
> }
> 
> /*
>-- 
>2.26.2

-- 
Wei Yang
Help you, Help me

