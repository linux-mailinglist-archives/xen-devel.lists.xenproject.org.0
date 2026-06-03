Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mtVjEtI6IGqtywAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:31:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D08616389CE
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 16:31:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=citrix.com (policy=reject)
Received: from list by lists.xenproject.org with outflank-mailman.1326633.1592039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmcz-0000f2-JD; Wed, 03 Jun 2026 14:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326633.1592039; Wed, 03 Jun 2026 14:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUmcz-0000cd-GI; Wed, 03 Jun 2026 14:31:29 +0000
Received: by outflank-mailman (input) for mailman id 1326633;
 Wed, 03 Jun 2026 14:31:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wUmcy-0000cL-3G
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 14:31:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUmcx-00GGcV-G6
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 16:31:27 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203abf-2eae-0a2a0a5409dd-0a2a45098992-0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:31:27 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a203abe-2497-0a2a45090019-a0658308e88c-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 16:31:27 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id CB9E14346019;
 Wed,  3 Jun 2026 10:30:19 -0400 (EDT)
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
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v2 2/2] tools/tests: Add regression test for tail buddy growth
Date: Wed,  3 Jun 2026 15:27:22 +0100
Message-Id: <5a6cbf1024f39ac625309009564dbda8f8adb43f.1780496798.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780496798.git.bernhard.kaindl@citrix.com>
References: <cover.1780496798.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780497087-88F71A53-216DF101/0/0
X-purgate-type: clean
X-purgate-size: 4134
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:from_mime,citrix.com:email];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D08616389CE

Add a regression test covering reserve_offlined_page() to verify
that, when composing healthy buddies between offlined pages,
healthy spans at the tail of the containing buddy are promoted to
larger-order buddies as expected.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/native/offline-merge-tail.c | 81 +++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 tools/tests/native/offline-merge-tail.c

diff --git a/tools/tests/native/offline-merge-tail.c b/tools/tests/native/offline-merge-tail.c
new file mode 100644
index 000000000000..217595e70ece
--- /dev/null
+++ b/tools/tests/native/offline-merge-tail.c
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Test merging a surviving tail pair into an order-1 buddy.
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
+#include "harness/native.h"
+
+/* Test merging a surviving tail pair into an order-1 buddy. */
+static void test_merge_tail_pair(int start_mfn)
+{
+    struct page_info *pages = frame_table + start_mfn;
+    uint32_t status = 0;
+
+    /*
+     * Prepare a valid order-2 buddy (4 pages) with this layout:
+     * +-------------+-------------+-------------+-------------+
+     * |  head page  | tail page 1 | tail page 2 | tail page 3 |
+     * +-------------+-------------+-------------+-------------+
+     */
+    test_page_list_add_buddy(pages, order2);
+
+    /* Mark the tail page 3 dirty to verify dirty-state preservation. */
+    pages[3].count_info |= PGC_need_scrub;
+    pages[0].u.free.first_dirty = 3;
+
+    /* Act: Offline the second page. */
+    ASSERT(offline_page(page_to_mfn(pages + 1), 0, &status) == 0);
+    ASSERT(status & PG_OFFLINE_OFFLINED);
+    ASSERT(FREE_PAGES == 3);
+
+    /*
+     * Offlining page 1 results in splitting the original order-2 buddy into:
+     * - pages[0] as an order-0 buddy
+     * - pages[1] is the offlined page, removed from the free list
+     * Tail 2 & 3 are aligned, so they should be merged into an order-1 buddy:
+     * +-------------+               +-------------+--------------+
+     * | single page | offlined page | head page with a tail page |
+     * +-------------+               +-------------+--------------+
+     */
+    CHECK(PFN_ORDER(&pages[0]) == 0, "Former head page, now order-0");
+    CHECK(PFN_ORDER(&pages[1]) == 0, "Offlined page should be order-0");
+    /* pages[0] and pages[1] were prepared as clean pages and still are. */
+    ASSERT(pages[0].u.free.first_dirty == INVALID_DIRTY_IDX);
+    ASSERT(pages[1].u.free.first_dirty == INVALID_DIRTY_IDX);
+
+    /* The tail pair is expected to be merged into one order-1 buddy. */
+    CHECK(PFN_ORDER(&pages[2]) == 1,
+          "The pair of tail pages should be merged into an order-1 buddy");
+    CHECK(pages[2].u.free.first_dirty == 1, "In tail buddy, the 2nd is dirty");
+    /* The tail page of the merged buddy does not use first_dirty. */
+    CHECK(pages[3].u.free.first_dirty == INVALID_DIRTY_IDX,
+          "Tail page of the merged buddy should not set first_dirty");
+}
+
+int main(int argc, char *argv[])
+{
+    const char *topic = "Test offlining to merge tails into an order-1 buddy";
+
+    if ( !parse_args(argc, argv, topic) )
+        return EXIT_FAILURE;
+
+    init_page_alloc_tests();
+    RUN_TESTCASE("TMTP", test_merge_tail_pair, 4);
+    return test_complete();
+}
-- 
2.39.5


