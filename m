Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 780FF26ED03
	for <lists+xen-devel@lfdr.de>; Fri, 18 Sep 2020 04:17:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kJ5xT-0005ps-1P; Fri, 18 Sep 2020 02:17:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UN7C=C3=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kJ5xR-0005pn-JG
 for xen-devel@lists.xenproject.org; Fri, 18 Sep 2020 02:17:05 +0000
X-Inumbo-ID: 971e7b5d-3edb-407c-a663-8eedd9af5068
Received: from out30-130.freemail.mail.aliyun.com (unknown [115.124.30.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 971e7b5d-3edb-407c-a663-8eedd9af5068;
 Fri, 18 Sep 2020 02:17:01 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R271e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=17; SR=0;
 TI=SMTPD_---0U9GXwrg_1600395414; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0U9GXwrg_1600395414) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 18 Sep 2020 10:16:55 +0800
Date: Fri, 18 Sep 2020 10:16:54 +0800
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
Subject: Re: [PATCH RFC 2/4] mm/page_alloc: place pages to tail in
 __putback_isolated_page()
Message-ID: <20200918021654.GC54754@L-31X9LVDL-1304.local>
References: <20200916183411.64756-1-david@redhat.com>
 <20200916183411.64756-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916183411.64756-3-david@redhat.com>
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

On Wed, Sep 16, 2020 at 08:34:09PM +0200, David Hildenbrand wrote:
>__putback_isolated_page() already documents that pages will be placed to
>the tail of the freelist - this is, however, not the case for
>"order >= MAX_ORDER - 2" (see buddy_merge_likely()) - which should be
>the case for all existing users.
>
>This change affects two users:
>- free page reporting
>- page isolation, when undoing the isolation.
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
>Note: If we observe a degradation due to the changed page isolation
>behavior (which I doubt), we can always make this configurable by the
>instance triggering undo of isolation (e.g., alloc_contig_range(),
>memory onlining, memory offlining).
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
> mm/page_alloc.c | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>index 91cefb8157dd..bba9a0f60c70 100644
>--- a/mm/page_alloc.c
>+++ b/mm/page_alloc.c
>@@ -89,6 +89,12 @@ typedef int __bitwise fop_t;
>  */
> #define FOP_SKIP_REPORT_NOTIFY	((__force fop_t)BIT(0))
> 
>+/*
>+ * Place the freed page to the tail of the freelist after buddy merging. Will
>+ * get ignored with page shuffling enabled.
>+ */
>+#define FOP_TO_TAIL		((__force fop_t)BIT(1))
>+
> /* prevent >1 _updater_ of zone percpu pageset ->high and ->batch fields */
> static DEFINE_MUTEX(pcp_batch_high_lock);
> #define MIN_PERCPU_PAGELIST_FRACTION	(8)
>@@ -1040,6 +1046,8 @@ static inline void __free_one_page(struct page *page, unsigned long pfn,
> 
> 	if (is_shuffle_order(order))
> 		to_tail = shuffle_pick_tail();
>+	else if (fop_flags & FOP_TO_TAIL)
>+		to_tail = true;

Take another look into this part. Maybe we can move this check at top?

For online_page case, currently we have following call flow:

    online_page
        online_pages_range
	shuffle_zone

This means we would always shuffle the newly added pages. Maybe we don't need
to do the shuffle when adding them to the free_list?

> 	else
> 		to_tail = buddy_merge_likely(pfn, buddy_pfn, page, order);
> 
>@@ -3289,7 +3297,7 @@ void __putback_isolated_page(struct page *page, unsigned int order, int mt)
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

