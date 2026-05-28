Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHGvE9hWGGoQjQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 16:53:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2E25F3F96
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 16:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321250.1588161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSc6W-0001eK-5y; Thu, 28 May 2026 14:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321250.1588161; Thu, 28 May 2026 14:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSc6W-0001bl-3L; Thu, 28 May 2026 14:53:00 +0000
Received: by outflank-mailman (input) for mailman id 1321250;
 Thu, 28 May 2026 14:52:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wSc6U-0001bf-IW
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 14:52:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSc6T-00H4IE-VL
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 16:52:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1856ac-2eae-0a2a0a5409dd-0a2a450bbcac-44
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:52:57 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1856c8-212f-0a2a450b0019-a0658308803c-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:52:57 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 2D12B4325930;
 Thu, 28 May 2026 10:51:53 -0400 (EDT)
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
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 1/2] tools/tests/native: Test for Xen Panic after memory offlining
Date: Thu, 28 May 2026 15:47:49 +0100
Message-Id: <54c4b9e8c6561e897dec44d61a7315e899741397.1779979589.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1779979589.git.bernhard.kaindl@citrix.com>
References: <cover.1779979589.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1779979977-1B979F3B-35CBAE84/0/0
X-purgate-type: clean
X-purgate-size: 12710
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.984];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: DC2E25F3F96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a test case testing for heap corruption bug caused by reserving
offlined pages from partially healthy buddies without alignment check.

For example, due to bad RAM, an MCE could cause pages marked as offline.
When a buddy containing offlined pages is freed, those pages
are moved to dedicated isolated page lists.

reserve_offline_page() lacks alignment checks and may grow adjacent
healthy spans into unaligned buddies that violate the fundamental buddy
invariant: buddies of a given order must be aligned to their size.

Consider a valid order-2 buddy (4 pages) with this layout:

   +---------------+-----------------+-----------------+----------------+
   |   head page   |   tail page 1   |   tail page 2   |   tail page 3  |
   +---------------+-----------------+-----------------+----------------+

reserve_offline_page() then merges unaligned tail pages:

   +---------------+-----------------+-----------------+----------------+
   | offlined page |     head page with a tail page    | single page    |
   +---------------+-----------------+-----------------+----------------+

This leads to a Xen panic, demonstrated by the test case:

1. When a single page is allocated from this buddy, MFN 7 is allocated:

        MFN 4             MFN 5             MFN 6             MFN 7
  +---------------+-----------------+-----------------+----------------+
  | offlined page |    head page        tail page     | allocated page |
  |               |       Unaligned buddies are       |                |
  |               |      an invariant violation!      |                |
  +---------------+-----------------+-----------------+----------------+

2. When MFN 7 is freed, the predecessor merge in free_heap_pages()
   kicks in, merging MFN 7 with its naturally aligned predecessor MFN 6:

        MFN 4             MFN 5             MFN 6            MFN 7
  +---------------+-----------------+-----------------+
  | offlined page |    head page         tail page    |
  |               |       Unaligned buddies are       |
  |               |      an invariant violation!      |
  +---------------+-----------------+-----------------+----------------+
                                    |    head page        tail page    |
                                    +-----------------+----------------+

  As shown, MFN 6 is double-freed. It is in two buddies:
  - As the tail page of the unaligned order-1 buddy starting at MFN 5.
  - As the head page of the aligned order-1 buddy starting at MFN 6.

3. The next allocations would allocate MFN 7 again, and MFN 6 as well:

   Due to the double-free, after the first allocation, MFN 6 remains on
   the free list even though its PGC_status is set to in-use.

        MFN 4             MFN 5             MFN 6            MFN 7
  +---------------+-----------------+-----------------+
  | offlined page |    head page         tail page    |
  |               |       Unaligned buddies are       |
  |               |      an invariant violation!      |
  +---------------+-----------------+-----------------+----------------+
                                    |   in-use page   |   in-use page  |
                                    +-----------------+----------------+

4. When the next page from this buddy is allocated, get_free_page()
   returns the buddy head MFN 5.  If the allocation is for order-0,
   alloc_heap_pages() splits page 6; otherwise, it keeps the buddy.
   Either way, the allocator checks the pages' PGC_status values and
   expects them not to be in-use. Because MFN 6 is already in-use,
   Xen panics (example panic log):

   pg[0] MFN 842adc c=0x4000000000000000 o=0 v=0 t=0
   Xen BUG at common/page_alloc.c:1324

I reproduced this while running intensive NUMA claim tests combined
with page offlining. The test case in this series demonstrates the
cascading corruption that leads to the panic without intentionally
having to crash a Xen instance to test for the bug.

Using the test case, the final lines are:

$ make -C tools/tests/native test TARGETS=offline-unaligned|grep -v ' xen/'
|   The buddy #5 is not aligned to order-1!
| <0>pg[0] MFN 00006 c=0x8000000000000001 o=1213 v=0 t=0
| xen/common/page_alloc.c:1324: WE INVOKED a XEN BUG in alloc_heap_pages()

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/native/offline-unaligned.c | 171 +++++++++++++++++++++++++
 1 file changed, 171 insertions(+)
 create mode 100644 tools/tests/native/offline-unaligned.c

diff --git a/tools/tests/native/offline-unaligned.c b/tools/tests/native/offline-unaligned.c
new file mode 100644
index 000000000000..1186b1763bef
--- /dev/null
+++ b/tools/tests/native/offline-unaligned.c
@@ -0,0 +1,171 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Test that offlining a predecessor of pages that must not be merged
+ * into an unaligned buddy is handled correctly. Specifically, verify
+ * that the Xen page allocator does not merge such unaligned buddies
+ * back onto the free list, which can produce a chain of events that
+ * leads to a Xen panic after a few allocations and frees.
+ *
+ * This test reproduces the scenario in isolation by offlining a page
+ * with an even MFN that has more than two following tail pages.
+ *
+ * If an unaligned buddy is returned to the free list, a sequence of
+ * allocations and a subsequent free can corrupt the free list state
+ * so that a later allocation triggers BUG() and crashes the instance.
+ * The test checks the free list behavior and, if the bug is present,
+ * confirms the resulting BUG().
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#include "harness/common.h"
+
+/* test_bss_start must be first in the BSS segment */
+void __aligned(PAGE_SIZE) *test_bss_start;
+
+/* Include xen/mm.h so we can wrap page_list_del() to assert the corruption. */
+#define TEST_WRAP_XEN_INCLUDE_XEN_MM_H
+#include "harness/mm-wrapper.h"
+
+static bool expect_free_list_corruption;
+
+/*
+ * Wrap page_list_del() to not fail the test by virtue of the prepared
+ * free list state but continue the test like a running Xen instance
+ * would in many cases. Assert and expect the corruption, and continue.
+ */
+static inline void wrap_page_list_del(struct page_info *page,
+                                      struct page_list_head *head)
+{
+    printf("page_list_del: page MFN %lu, order %u\n",
+           mfn_x(page_to_mfn(page)), PFN_ORDER(page));
+
+    if ( expect_free_list_corruption )
+        EXPECT_FAIL_BEGIN();
+    CHECK(page->list.next && page->list.prev, "The free list is corrupt now!");
+    if ( expect_free_list_corruption )
+        EXPECT_FAIL_END(1);
+
+    if ( page->list.next && page->list.prev )
+        page_list_del(page, head);
+}
+#define page_list_del(page, head) wrap_page_list_del(page, head)
+
+/*
+ * Include the main test library that sets up scenarios, asserts
+ * allocator state, and provides the definitions and shims needed
+ * to call the Xen page allocator code in this test program.
+ */
+#define TEST_ENABLE_XC_DOMAIN_C
+#include "harness/native.h"
+
+/* Verify the behavior of buddy merging after offlining a page */
+static void test_unaligned_buddy_merge(int start_mfn)
+{
+    struct page_info *pg = frame_table + start_mfn;
+    uint32_t status = 0;
+
+    /*
+     * Prepare a valid order-2 buddy (4 pages) with this layout:
+     * +---------------+-----------------+-----------------+----------------+
+     * | head page     | tail page 1     | tail page 2     | tail page 3    |
+     * +---------------+-----------------+-----------------+----------------+
+     */
+    test_page_list_add_buddy(pg, order2); /* Seed the heap with this buddy */
+
+    /* Act */
+    offline_page(page_to_mfn(pg), 0, &status);
+    CHECK(status & PG_OFFLINE_OFFLINED, "Page should be offlined");
+
+    /*
+     * The correct free list state after offlining the head page of the buddy
+     * is the the healthy pages are merged back onto the free list using a
+     * single page and a size-aligned buddy of the remaining pages:
+     * +---------------+-----------------+-----------------+----------------+
+     * | offlined page | single page     |    head page with a tail page    |
+     * +---------------+-----------------+-----------------+----------------+
+     */
+    EXPECT_FAIL_BEGIN();
+    /*
+     * Due to a bug in reserve_offlined_page(), we get an unaligned buddy:
+     * +---------------+-----------------+-----------------+----------------+
+     * | offlined page |     head page with a tail page    | single page    |
+     * +---------------+-----------------+-----------------+----------------+
+     */
+    CHECK(page_aligned(pg + 1), "The buddy #%lu is not aligned to order-%d",
+          mfn_x(page_to_mfn(pg + 1)), PFN_ORDER(pg + 1));
+    EXPECT_FAIL_END(1);
+
+    /* Allocate and free a page to trigger buddy merging on free. */
+
+    /*
+     * After allocating and freeing MFN 7, we get a double-freed MFN 6 due
+     * to aligned predecessor merging in free_heap_pages():
+     *
+     *         MFN 4             MFN 5             MFN 6            MFN 7
+     *   +---------------+-----------------+-----------------+
+     *   | offlined page |    head page         tail page    |
+     *   |               |       Unaligned buddies are       |
+     *   |               |      an invariant violation!      |
+     *   +---------------+-----------------+-----------------+----------------+
+     *                                     |    head page        tail page    |
+     *                                     +-----------------+----------------+
+     */
+    expect_free_list_corruption = true;
+    free_domheap_pages(alloc_domheap_pages(dom1, order0, 0), order0);
+
+    /*
+     * At this point, the free list is already corrupt. In free_heap_pages(),
+     * the tail of the unaligned buddy was added to the free list a 2nd time
+     * as the page of an overlapping aligned buddy. This is per design of the
+     * algorithm: These pages are free and thus the merging occurs as expected.
+     *
+     * The next allocation allocates the tail of the unaligned buddy, which
+     * is now, due to the merge, also the head of the new aligned buddy.
+     */
+    CHECK((pg = alloc_domheap_pages(dom1, order1, 0)), "Alloc the order-1 pg");
+
+    /* Inspect the predecessor (pg is the tail of the unaligned buddy) */
+    EXPECT_FAIL_BEGIN();
+    /*
+     * After allocating two more pages, MFN 6 is free AND in-use:
+     *
+     *         MFN 4             MFN 5             MFN 6            MFN 7
+     *   +---------------+-----------------+-----------------+
+     *   | offlined page |    head page         tail page    |
+     *   +---------------+-----------------+-----------------+----------------+
+     *                                     |    in-use page      in-use page  |
+     *                                     +-----------------+----------------+
+     */
+    CHECK(page_aligned(pg - 1), "The buddy #%lu is not aligned to order-%d!",
+          mfn_x(page_to_mfn(pg - 1)), PFN_ORDER(pg - 1));
+    EXPECT_FAIL_END(1);
+
+    /* Allocate the remaining page; a clean heap should not hit BUG(). */
+    testcase_assert_expect_to_hit_bug = true;
+    /*
+     * As described above, if pg is the tail of an unaligned order-1 buddy,
+     * the unaligned buddy is still on the free list and this allocation will
+     * remove it from the free list and check alloc_heap_pages() checks the
+     * buddies to have a reference count of zero, and the already allocated
+     * page is returned as the tail of the unaligned buddy, causing the BUG().
+     *
+     *         MFN 4             MFN 5             MFN 6            MFN 7
+     *   +---------------+-----------------+-----------------+
+     *   | offlined page |    head page         tail page    | <- panic's Xen
+     *   +---------------+-----------------+-----------------+----------------+
+     *                                     |    in-use page      in-use page  |
+     *                                     +-----------------+----------------+
+     */
+    alloc_domheap_pages(dom1, order0, 0); /* Triggers BUG() */
+}
+
+int main(int argc, char *argv[])
+{
+    if ( !parse_args(argc, argv, "Test not growing unaligned buddies") )
+        return EXIT_FAILURE;
+
+    init_page_alloc_tests();
+    RUN_TESTCASE("TUBM", test_unaligned_buddy_merge, 4);
+
+    return test_complete();
+}
-- 
2.39.5


