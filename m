Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E907B28359E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 14:16:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2992.8586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPPPj-0006nS-Sv; Mon, 05 Oct 2020 12:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2992.8586; Mon, 05 Oct 2020 12:16:23 +0000
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
	id 1kPPPj-0006ms-Ov; Mon, 05 Oct 2020 12:16:23 +0000
Received: by outflank-mailman (input) for mailman id 2992;
 Mon, 05 Oct 2020 12:16:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c+yv=DM=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1kPPPh-0006mJ-Ib
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 12:16:21 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 12eb9e65-9c79-4b0b-b19c-23bbb64c80a9;
 Mon, 05 Oct 2020 12:16:20 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-a6njIh0COVKiFYMipVIPug-1; Mon, 05 Oct 2020 08:16:16 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13F738030AA;
 Mon,  5 Oct 2020 12:16:13 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-222.ams2.redhat.com [10.36.114.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B73DF27CC6;
 Mon,  5 Oct 2020 12:15:59 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=c+yv=DM=redhat.com=david@srs-us1.protection.inumbo.net>)
	id 1kPPPh-0006mJ-Ib
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 12:16:21 +0000
X-Inumbo-ID: 12eb9e65-9c79-4b0b-b19c-23bbb64c80a9
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 12eb9e65-9c79-4b0b-b19c-23bbb64c80a9;
	Mon, 05 Oct 2020 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601900180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tgT/XV/JOTuCj2JcNLuFxyO0AHRuTyQafR/eZPht6eo=;
	b=X00Ze5uW7fEZc9MPbuvq1LLwxa6i91hwBHi/1sxEuQb9sufA5EAIkQlzm10bFpH+RC+E+C
	SB5DADdctN9JNu7kNydQsv7ShdtD6yXWWyx/uy0tX+XqjAXiVjFtwHFoeeITK/KvQtisd2
	BoGX5R/s+hpPKZHHZueVqD0zgbdaucc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-a6njIh0COVKiFYMipVIPug-1; Mon, 05 Oct 2020 08:16:16 -0400
X-MC-Unique: a6njIh0COVKiFYMipVIPug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13F738030AA;
	Mon,  5 Oct 2020 12:16:13 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-222.ams2.redhat.com [10.36.114.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B73DF27CC6;
	Mon,  5 Oct 2020 12:15:59 +0000 (UTC)
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
	Oscar Salvador <osalvador@suse.de>,
	Wei Yang <richard.weiyang@linux.alibaba.com>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Michal Hocko <mhocko@suse.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	Michal Hocko <mhocko@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Scott Cheloha <cheloha@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/5] mm/page_alloc: place pages to tail in __putback_isolated_page()
Date: Mon,  5 Oct 2020 14:15:31 +0200
Message-Id: <20201005121534.15649-3-david@redhat.com>
In-Reply-To: <20201005121534.15649-1-david@redhat.com>
References: <20201005121534.15649-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23

__putback_isolated_page() already documents that pages will be placed to
the tail of the freelist - this is, however, not the case for
"order >= MAX_ORDER - 2" (see buddy_merge_likely()) - which should be
the case for all existing users.

This change affects two users:
- free page reporting
- page isolation, when undoing the isolation (including memory onlining).

This behavior is desireable for pages that haven't really been touched
lately, so exactly the two users that don't actually read/write page
content, but rather move untouched pages.

The new behavior is especially desirable for memory onlining, where we
allow allocation of newly onlined pages via undo_isolate_page_range()
in online_pages(). Right now, we always place them to the head of the
freelist, resulting in undesireable behavior: Assume we add
individual memory chunks via add_memory() and online them right away to
the NORMAL zone. We create a dependency chain of unmovable allocations
e.g., via the memmap. The memmap of the next chunk will be placed onto
previous chunks - if the last block cannot get offlined+removed, all
dependent ones cannot get offlined+removed. While this can already be
observed with individual DIMMs, it's more of an issue for virtio-mem
(and I suspect also ppc DLPAR).

Document that this should only be used for optimizations, and no code
should rely on this behavior for correction (if the order of the
freelists ever changes).

We won't care about page shuffling: memory onlining already properly
shuffles after onlining. free page reporting doesn't care about
physically contiguous ranges, and there are already cases where page
isolation will simply move (physically close) free pages to (currently)
the head of the freelists via move_freepages_block() instead of
shuffling. If this becomes ever relevant, we should shuffle the whole
zone when undoing isolation of larger ranges, and after
free_contig_range().

Reviewed-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
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
Cc: Scott Cheloha <cheloha@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_alloc.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 2bf235b1953f..df5ff0cd6df1 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -94,6 +94,18 @@ typedef int __bitwise fpi_t;
  */
 #define FPI_SKIP_REPORT_NOTIFY	((__force fpi_t)BIT(0))
 
+/*
+ * Place the (possibly merged) page to the tail of the freelist. Will ignore
+ * page shuffling (relevant code - e.g., memory onlining - is expected to
+ * shuffle the whole zone).
+ *
+ * Note: No code should rely on this flag for correctness - it's purely
+ *       to allow for optimizations when handing back either fresh pages
+ *       (memory onlining) or untouched pages (page isolation, free page
+ *       reporting).
+ */
+#define FPI_TO_TAIL		((__force fpi_t)BIT(1))
+
 /* prevent >1 _updater_ of zone percpu pageset ->high and ->batch fields */
 static DEFINE_MUTEX(pcp_batch_high_lock);
 #define MIN_PERCPU_PAGELIST_FRACTION	(8)
@@ -1044,7 +1056,9 @@ static inline void __free_one_page(struct page *page,
 done_merging:
 	set_page_order(page, order);
 
-	if (is_shuffle_order(order))
+	if (fpi_flags & FPI_TO_TAIL)
+		to_tail = true;
+	else if (is_shuffle_order(order))
 		to_tail = shuffle_pick_tail();
 	else
 		to_tail = buddy_merge_likely(pfn, buddy_pfn, page, order);
@@ -3306,7 +3320,7 @@ void __putback_isolated_page(struct page *page, unsigned int order, int mt)
 
 	/* Return isolated page to tail of freelist. */
 	__free_one_page(page, page_to_pfn(page), zone, order, mt,
-			FPI_SKIP_REPORT_NOTIFY);
+			FPI_SKIP_REPORT_NOTIFY | FPI_TO_TAIL);
 }
 
 /*
-- 
2.26.2


