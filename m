Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OBcE+xWGGoQjQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 16:53:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4DA5F3FB5
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 16:53:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321260.1588171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSc6v-000266-Dv; Thu, 28 May 2026 14:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321260.1588171; Thu, 28 May 2026 14:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSc6v-00023S-Ad; Thu, 28 May 2026 14:53:25 +0000
Received: by outflank-mailman (input) for mailman id 1321260;
 Thu, 28 May 2026 14:53:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wSc6t-00023K-J7
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 14:53:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSc6s-002cET-W6
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 16:53:23 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1856d9-bab6-0a2a0a5309dd-0a2a450183b4-20
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:53:22 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1856e1-c1f2-0a2a45010019-a0658308a4aa-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:53:22 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id AA5E6432A65A;
 Thu, 28 May 2026 10:52:17 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] xen/mm: Fix offlining pages only make aligned buddies, fixes Xen crash
Date: Thu, 28 May 2026 15:47:50 +0100
Message-Id: <cdaec995676e17f0943cb921eb5ad9f87b96526c.1779979589.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1779979589.git.bernhard.kaindl@citrix.com>
References: <cover.1779979589.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1779980002-AE342FF4-08704CCB/0/0
X-purgate-type: clean
X-purgate-size: 7170
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: DE4DA5F3FB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

reserve_offline_pages() is missing an alignment check and thus
has a relatively high probability of growing unaligned buddies.

Fix this by checking alignment before growing spans to the next order.
Update the test case to verify the fix and prevent future regressions.

Fixes: e4865c2315 ('Page offline support in Xen side')
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/native/offline-unaligned.c | 92 --------------------------
 xen/common/page_alloc.c                |  5 ++
 2 files changed, 5 insertions(+), 92 deletions(-)

diff --git a/tools/tests/native/offline-unaligned.c b/tools/tests/native/offline-unaligned.c
index 1186b1763bef..593135722a3f 100644
--- a/tools/tests/native/offline-unaligned.c
+++ b/tools/tests/native/offline-unaligned.c
@@ -17,38 +17,6 @@
  *
  * Copyright (C) 2026 Cloud Software Group
  */
-#include "harness/common.h"
-
-/* test_bss_start must be first in the BSS segment */
-void __aligned(PAGE_SIZE) *test_bss_start;
-
-/* Include xen/mm.h so we can wrap page_list_del() to assert the corruption. */
-#define TEST_WRAP_XEN_INCLUDE_XEN_MM_H
-#include "harness/mm-wrapper.h"
-
-static bool expect_free_list_corruption;
-
-/*
- * Wrap page_list_del() to not fail the test by virtue of the prepared
- * free list state but continue the test like a running Xen instance
- * would in many cases. Assert and expect the corruption, and continue.
- */
-static inline void wrap_page_list_del(struct page_info *page,
-                                      struct page_list_head *head)
-{
-    printf("page_list_del: page MFN %lu, order %u\n",
-           mfn_x(page_to_mfn(page)), PFN_ORDER(page));
-
-    if ( expect_free_list_corruption )
-        EXPECT_FAIL_BEGIN();
-    CHECK(page->list.next && page->list.prev, "The free list is corrupt now!");
-    if ( expect_free_list_corruption )
-        EXPECT_FAIL_END(1);
-
-    if ( page->list.next && page->list.prev )
-        page_list_del(page, head);
-}
-#define page_list_del(page, head) wrap_page_list_del(page, head)
 
 /*
  * Include the main test library that sets up scenarios, asserts
@@ -84,78 +52,18 @@ static void test_unaligned_buddy_merge(int start_mfn)
      * | offlined page | single page     |    head page with a tail page    |
      * +---------------+-----------------+-----------------+----------------+
      */
-    EXPECT_FAIL_BEGIN();
-    /*
-     * Due to a bug in reserve_offlined_page(), we get an unaligned buddy:
-     * +---------------+-----------------+-----------------+----------------+
-     * | offlined page |     head page with a tail page    | single page    |
-     * +---------------+-----------------+-----------------+----------------+
-     */
     CHECK(page_aligned(pg + 1), "The buddy #%lu is not aligned to order-%d",
           mfn_x(page_to_mfn(pg + 1)), PFN_ORDER(pg + 1));
-    EXPECT_FAIL_END(1);
 
     /* Allocate and free a page to trigger buddy merging on free. */
-
-    /*
-     * After allocating and freeing MFN 7, we get a double-freed MFN 6 due
-     * to aligned predecessor merging in free_heap_pages():
-     *
-     *         MFN 4             MFN 5             MFN 6            MFN 7
-     *   +---------------+-----------------+-----------------+
-     *   | offlined page |    head page         tail page    |
-     *   |               |       Unaligned buddies are       |
-     *   |               |      an invariant violation!      |
-     *   +---------------+-----------------+-----------------+----------------+
-     *                                     |    head page        tail page    |
-     *                                     +-----------------+----------------+
-     */
-    expect_free_list_corruption = true;
     free_domheap_pages(alloc_domheap_pages(dom1, order0, 0), order0);
-
-    /*
-     * At this point, the free list is already corrupt. In free_heap_pages(),
-     * the tail of the unaligned buddy was added to the free list a 2nd time
-     * as the page of an overlapping aligned buddy. This is per design of the
-     * algorithm: These pages are free and thus the merging occurs as expected.
-     *
-     * The next allocation allocates the tail of the unaligned buddy, which
-     * is now, due to the merge, also the head of the new aligned buddy.
-     */
     CHECK((pg = alloc_domheap_pages(dom1, order1, 0)), "Alloc the order-1 pg");
 
     /* Inspect the predecessor (pg is the tail of the unaligned buddy) */
-    EXPECT_FAIL_BEGIN();
-    /*
-     * After allocating two more pages, MFN 6 is free AND in-use:
-     *
-     *         MFN 4             MFN 5             MFN 6            MFN 7
-     *   +---------------+-----------------+-----------------+
-     *   | offlined page |    head page         tail page    |
-     *   +---------------+-----------------+-----------------+----------------+
-     *                                     |    in-use page      in-use page  |
-     *                                     +-----------------+----------------+
-     */
     CHECK(page_aligned(pg - 1), "The buddy #%lu is not aligned to order-%d!",
           mfn_x(page_to_mfn(pg - 1)), PFN_ORDER(pg - 1));
-    EXPECT_FAIL_END(1);
 
     /* Allocate the remaining page; a clean heap should not hit BUG(). */
-    testcase_assert_expect_to_hit_bug = true;
-    /*
-     * As described above, if pg is the tail of an unaligned order-1 buddy,
-     * the unaligned buddy is still on the free list and this allocation will
-     * remove it from the free list and check alloc_heap_pages() checks the
-     * buddies to have a reference count of zero, and the already allocated
-     * page is returned as the tail of the unaligned buddy, causing the BUG().
-     *
-     *         MFN 4             MFN 5             MFN 6            MFN 7
-     *   +---------------+-----------------+-----------------+
-     *   | offlined page |    head page         tail page    | <- panic's Xen
-     *   +---------------+-----------------+-----------------+----------------+
-     *                                     |    in-use page      in-use page  |
-     *                                     +-----------------+----------------+
-     */
     alloc_domheap_pages(dom1, order0, 0); /* Triggers BUG() */
 }
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 46c01a9fca2a..d923ae02ade0 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1434,6 +1434,11 @@ static int reserve_offlined_page(struct page_info *head)
             if ( (cur_head + (1 << next_order)) >= (head + ( 1 << head_order)) )
                 goto merge;
 
+            /* Do not grow to next_order if cur_head is not aligned to it. */
+            if ( (mfn_x(page_to_mfn(cur_head)) & ((1UL << next_order) - 1)) )
+                goto merge;
+
+            /* Check if any page in the next_order range is offlined. */
             for ( i = (1 << cur_order), pg = cur_head + (1 << cur_order );
                   i < (1 << next_order);
                   i++, pg++ )
-- 
2.39.5


