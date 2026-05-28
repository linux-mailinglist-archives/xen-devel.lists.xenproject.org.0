Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AIy3KsJYGGoQjQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 17:01:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D50E5F4120
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 17:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321371.1588206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScE8-0005jS-Sn; Thu, 28 May 2026 15:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321371.1588206; Thu, 28 May 2026 15:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScE8-0005gu-QH; Thu, 28 May 2026 15:00:52 +0000
Received: by outflank-mailman (input) for mailman id 1321371;
 Thu, 28 May 2026 15:00:51 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wScE7-0005go-A5
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 15:00:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wScE6-008W3a-My
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 17:00:50 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a185891-5cb7-0a2a0a5109dd-0a2a450aebd6-30
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 17:00:50 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1858a1-56b3-0a2a450a0019-a0658309e4a4-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 17:00:50 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 53CEC82553ED;
 Thu, 28 May 2026 10:59:35 -0400 (EDT)
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
Subject: [PATCH 1/2] tools/tests/native: Add test for offlined buddy head PFN_ORDER
Date: Thu, 28 May 2026 15:58:20 +0100
Message-Id: <347e2d21f12b3cd7b3fa6204cad978e4cf375bf3.1779980244.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1779980244.git.bernhard.kaindl@citrix.com>
References: <cover.1779980244.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779980450-6FB5F8B7-9BA205A8/0/0
X-purgate-type: clean
X-purgate-size: 4958
X-Spamd-Result: default: False [3.02 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:query timed out];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[bernhard.kaindl.citrix.com:query timed out];
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Queue-Id: 5D50E5F4120
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a regression test that reproduces and documents an inconsistent
PFN_ORDER observed when the head page of a free buddy is offlined.

When the head of a free buddy is offlined it remains annotated with its
original PFN_ORDER while offline, even though the buddy has been split
into single pages. This mismatch is surprising and can hinder debugging,
although it does not currently cause functional failures.

What the test does:
- Seed a single order-1 buddy on the heap and offline the head page.
- Document the current failing behaviour by asserting (EXPECT_FAIL)
  that the offlined head's PFN_ORDER is (not) 0.
- Allocate the successor to prevent a merge, online the page, and
  verify that onlining restores the PFN_ORDER to 0.

How to run:
    make -C tools/tests/native TARGETS=offline-head-order test

Example failing output (current behaviour):
- Test assertion failed as expected at offline-head-order.c:40:
  Offlined former buddy head should be order0

This test is intended as a regression test and should be updated
with the same commit that resets the PFN_ORDER to 0 on offlining.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/native/offline-head-order.c | 87 +++++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 tools/tests/native/offline-head-order.c

diff --git a/tools/tests/native/offline-head-order.c b/tools/tests/native/offline-head-order.c
new file mode 100644
index 000000000000..5c666a319523
--- /dev/null
+++ b/tools/tests/native/offline-head-order.c
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Tests using offline_page() to verify reserve_offlined_page()
+ *
+ * The workflow tested here is offlining a free page:
+ *
+ * 1. offline_page() calls mark_page_offlined() to mark the page.
+ * 2. It calls reserve_heap_page() to find the containing buddy.
+ * 3. It calls reserve_offlined_page() to reserve the marked pages within
+ *    that buddy.
+ *
+ * reserve_offlined_page() then:
+ *
+ * 1. Removes the buddy, a 2^order group of pages, from the free list.
+ * 2. Finds size-aligned spans of healthy pages within it.
+ * 3. Rebuilds healthy buddies from those spans and
+ *    adds them back to the free list via page_list_add_scrub().
+ * 4. Moves offlined subpages to the offlined page lists.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#define TEST_ENABLE_XC_DOMAIN_C
+#include "harness/native.h"
+
+static void test_offline_head_order(int start_mfn)
+{
+    struct page_info *page = frame_table + start_mfn;
+    uint32_t status = 0;
+
+    /* Seed a single order-1 buddy onto the heap. */
+    test_page_list_add_buddy(page, order1);
+    ASSERT(PFN_ORDER(page) == 1);
+    /* Offline the head page. */
+    ASSERT(offline_page(page_to_mfn(page), 0, &status) == 0);
+    ASSERT(status == PG_OFFLINE_OFFLINED);
+
+    /* Confirm the status of the page as status offlined. */
+    status = 0;
+    ASSERT(query_page_offline(page_to_mfn(page), &status) == 0);
+    ASSERT(status == PG_OFFLINE_STATUS_OFFLINED);
+
+    /* Check the order of the offlined head page. */
+    EXPECT_FAIL_BEGIN(); /* PFN_ORDER(page) should 0, but is still 1 */
+    ASSERT(PFN_ORDER(page) == 0);
+    EXPECT_FAIL_END(1);
+
+    /*
+     * Allocate the successor page of the offlined page. This prevents
+     * the normal successor page merge when the page is re-onlined below.
+     */
+    struct page_info *pg = alloc_domheap_pages(dom1, order0, 0);
+    ASSERT(pg == page + 1);
+    ASSERT(FREE_PAGES == 0);
+
+    /*
+     * The order of the split head page is still 1. Online the page again to
+     * confirm that onlining it causes the order to be corrected to 0.
+     */
+    ASSERT(PFN_ORDER(page) == 1);
+
+    /* Online the offlined former head page. */
+    ASSERT(online_page(page_to_mfn(page), &status) == 0);
+    ASSERT(status & PG_ONLINE_ONLINED);
+    ASSERT(FREE_PAGES == 1);
+
+    /*
+     * Confirm the order of the onlined former head page is 0, independently
+     * of the order returned by PFN_ORDER() for the offlined page. This should
+     * always be successful because page_offlined_list only contains single
+     * pages and online_page() ignores PFN_ORDER(pg) of the page. It calls
+     * free_heap_pages() passing the order hardcoded to 0. This causes it to
+     * pass the given order 0 to page_list_add_scrub(). This causes it to set
+     * the order of the page to 0 before it adds the page to the free list.
+     */
+    ASSERT(PFN_ORDER(page) == 0);
+}
+
+int main(int argc, char *argv[])
+{
+    const char *topic = "Test offlined head page to be updated to PFN_ORDER 0";
+    if ( !parse_args(argc, argv, topic) )
+        return EXIT_FAILURE;
+
+    init_page_alloc_tests();
+    RUN_TESTCASE("TOHP", test_offline_head_order, 2);
+    return test_complete();
+}
-- 
2.39.5


