Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIF0JEAp5mnesgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:25:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A57842BAA7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 15:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285852.1567071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEocc-00067J-Ky; Mon, 20 Apr 2026 13:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285852.1567071; Mon, 20 Apr 2026 13:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEocc-00064o-HA; Mon, 20 Apr 2026 13:25:06 +0000
Received: by outflank-mailman (input) for mailman id 1285852;
 Mon, 20 Apr 2026 13:25:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wEocb-00064F-Eh
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 13:25:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEocZ-008Kfe-A0
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 15:25:04 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e62930-5cb7-0a2a0a5109dd-0a2a450cc1ba-2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:25:04 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e6292f-62f1-0a2a450c0019-a0658309874a-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 15:25:04 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 7C0E68185110;
 Mon, 20 Apr 2026 09:24:07 -0400 (EDT)
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
Subject: [PATCH v2 2/4] tools/tests/alloc: Add integration test suite to for NUMA memory claims
Date: Mon, 20 Apr 2026 14:19:42 +0100
Message-Id: <079417bb90481b5212b8c7081d0e32f90d0df127.1776690702.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1776690702.git.bernhard.kaindl@citrix.com>
References: <cover.1776690702.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1776691504-F5E0ECF5-7EBEBB8D/0/0
X-purgate-type: clean
X-purgate-size: 12487
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.589];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 1A57842BAA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Test claims behaviour of the page allocator with global claims using
domain_set_outstanding_pages() and the new API and test multi-node claims.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/alloc/test-claims-basic.c       | 108 ++++++++++++
 tools/tests/alloc/test-claims-numa-redeem.c | 172 ++++++++++++++++++++
 2 files changed, 280 insertions(+)
 create mode 100644 tools/tests/alloc/test-claims-basic.c
 create mode 100644 tools/tests/alloc/test-claims-numa-redeem.c

diff --git a/tools/tests/alloc/test-claims-basic.c b/tools/tests/alloc/test-claims-basic.c
new file mode 100644
index 000000000000..ef02ca449023
--- /dev/null
+++ b/tools/tests/alloc/test-claims-basic.c
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2026 Cloud Software Group
+ */
+#include "libtest-page-alloc.h"
+
+int test_set_global_claims(struct domain *d, unsigned long pages)
+{
+    memory_claim_t claim_set[] = {
+        {.target = XEN_DOMCTL_CLAIM_MEMORY_GLOBAL, .pages = pages},
+    };
+
+    return domain_install_claim_set(d, ARRAY_SIZE(claim_set), claim_set);
+}
+typedef int (*set_global_claims)(struct domain *d, unsigned long pages);
+
+set_global_claims install_global_claims = test_set_global_claims;
+
+static void test_alloc_domheap_redeems_claims(int start_mfn)
+{
+    int ret;
+    struct page_info *pages = test_pages + start_mfn, *pg;
+
+    test_page_list_add_buddy(pages, order2);
+    ASSERT(!test_set_global_claims(dom1, 3));
+    ASSERT(alloc_domheap_pages(dom1, order1, 0) == pages + 2);
+    ASSERT(alloc_domheap_pages(dom1, order0, 0) == pages + 1);
+    CHECK(TOTAL_CLAIMS == 0, "Expect all claims consumed after allocations");
+    CHECK(FREE_PAGES == 1, "Expect one free page after allocations");
+
+    ASSERT(!test_set_global_claims(dom2, FREE_PAGES));
+
+    /* Claim more than dom1 already has fails with ENOMEM (claimed by dom2) */
+    ret = test_set_global_claims(dom1, domain_tot_pages(dom1) + 1);
+    CHECK(ret == -ENOMEM, "dom 1 claim +1 fails due to insufficient pages");
+
+    /* Claim more than dom1's d->max_pages fails with EINVAL */
+    ret = test_set_global_claims(dom1, dom1->max_pages + 1);
+    CHECK(ret == -EINVAL, "dom 1 claim fails due to exceeding max_pages");
+
+    /* Attempt to allocate an order-0 page with a foreign claim present */
+    pg = alloc_domheap_pages(dom1, order0, 0);
+    CHECK(pg == NULL, "dom 1 allocation fails because of domain 2's claim");
+    CHECK(TOTAL_CLAIMS == 1, "Expect domain 2's claim to be still present");
+    CHECK(FREE_PAGES == 1, "Expect one free page after failed alloc");
+}
+
+/*
+ * Test that memory claims are consumed correctly during allocations.
+ */
+static void test_cancel_claims(int start_mfn)
+{
+    struct page_info *page = test_pages + start_mfn;
+    unsigned long claims;
+
+    /* Create a buddy of order 2 (4 pages) and add it to the heap. */
+    test_page_list_add_buddy(page, order2);
+    claims = FREE_PAGES / 2;
+
+    /* Claim half of the free pages for dom1 */
+    ASSERT(test_set_global_claims(dom1, claims) == 0);
+    ASSERT(TOTAL_CLAIMS == claims);
+
+    /* Act + Assert 2: Claim all free pages for dom2, should fail */
+    ASSERT(test_set_global_claims(dom2, FREE_PAGES) == -ENOMEM);
+    ASSERT(TOTAL_CLAIMS == claims);
+
+    /* Act + Assert 1: Cancel all claims for dom1 */
+    ASSERT(test_set_global_claims(dom1, 0) == 0);
+    ASSERT(TOTAL_CLAIMS == 0);
+
+    /* Act + Assert 2: Claim all free pages for dom2, should work */
+    ASSERT(test_set_global_claims(dom2, FREE_PAGES) == 0);
+    ASSERT(TOTAL_CLAIMS == FREE_PAGES);
+}
+
+int main(int argc, char *argv[])
+{
+    const char *topic = "Test global claims with old and new interfaces";
+    const char *program_name = parse_args(argc, argv, topic);
+
+    if ( !program_name )
+        return EXIT_FAILURE;
+
+    init_page_alloc_tests();
+
+    RUN_TESTCASE(TCCL, test_cancel_claims, 4);
+
+    /* Confirm the baseline of using domain_set_outstanding_pages() */
+    install_global_claims = domain_set_outstanding_pages;
+    RUN_TESTCASE(ADCL, test_alloc_domheap_redeems_claims, 4);
+
+    /* Repeat the same test case using test_set_global_claims() */
+    install_global_claims = test_set_global_claims;
+    RUN_TESTCASE(ADCG, test_alloc_domheap_redeems_claims, 4);
+
+    testcase_print_summary(program_name);
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/tools/tests/alloc/test-claims-numa-redeem.c b/tools/tests/alloc/test-claims-numa-redeem.c
new file mode 100644
index 000000000000..aaa1a5b6af5c
--- /dev/null
+++ b/tools/tests/alloc/test-claims-numa-redeem.c
@@ -0,0 +1,172 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Integration tests for redeeming NUMA memory claim set as implemented
+ * in xen/common/page_alloc.c's redeem_claims_for_allocation() and
+ * related functions.
+ *
+ * redeem_claims_for_allocation() is exercised indirectly through
+ * alloc_domheap_pages() which is the primary interface for allocating
+ * pages from a domain's heap.
+ *
+ * By means of domain_install_claim_set(), a claim set with global and
+ * per-NUMA-node claims is installed for a dummy domain, and then
+ * allocations with NUMA node affinity are performed to verify that the
+ * appropriate claims are redeemed (same-node first, global fallback next,
+ * then other nodes to not exceed page limits). The test also verifies that
+ * aggregate counters are updated correctly after each allocation.
+ *
+ * The test verifies that when a domain has a claim set installed with
+ * global and per-NUMA-node claims, allocations that specify NUMA node
+ * affinity will redeem the appropriate claims (same-node first, global
+ * fallback claim next, then other nodes to not exceed page limits).
+ * It also verifies that the aggregate claim counters are updated
+ * correctly after each allocation.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#define CONFIG_NUMA   1
+#define CONFIG_SYSCTL 1
+#include "libtest-page-alloc.h"
+
+/*
+ * Test redeeming NUMA memory claims in exchange for allocations,
+ * and the redeemed claims are correctly reflected in the domain's
+ * claim state and the aggregate claim counters.
+ */
+static void test_claims_numa_install(int start_mfn)
+{
+    int zone, ret;
+    struct page_info *pages = test_pages + start_mfn, *allocated;
+
+    /*
+     * PREPARE
+     */
+
+    /*
+     * Node 1's pages start at the pfn set by init_numa_node_data():
+     * node_data[node1].node_start_pfn = start_mfn + 8 (8 MFNs per node with
+     * memnode_shift=3). The order-2 buddy (4 pages) placed there satisfies
+     * the 2-page node1 claim and provides enough total pages for the
+     * 2 global + 2 node0 + 2 node1 = 6-page claim set (2 + 4 = 6 total).
+     */
+    struct page_info *pages_node1 =
+        test_pages + node_data[node1].node_start_pfn;
+
+    /* Create an order-1 buddy (2 pages) for node 0 and add it to the heap. */
+    zone = test_page_list_add_buddy(pages, order1);
+
+    /* Create an order-2 buddy (4 pages) for node 1 and add it to the heap. */
+    test_page_list_add_buddy(pages_node1, order2);
+
+    /* Install a claim set with global + per-NUMA-node claims. */
+    memory_claim_t claim_set[] = {
+        {.target = XEN_DOMCTL_CLAIM_MEMORY_GLOBAL, .pages = 2},
+        {.target = node0,                          .pages = 2},
+        {.target = node1,                          .pages = 2},
+    };
+    ret = domain_install_claim_set(dom1, ARRAY_SIZE(claim_set), claim_set);
+    CHECK(ret == 0, "domain_install_claim_set should succeed: %d", ret);
+
+    /* Assert dom1's claims */
+    CHECK(TOTAL_CLAIMS == 6, "Expect 6 total claims after installation");
+    CHECK(DOM_GLOBAL_CLAIMS(dom1) == 2,
+          "Expect dom1 having 2 global claims after installation");
+    CHECK(DOM_NODE_CLAIMS(dom1, node0) == 2,
+          "Expect dom1 having 2 claims for node0 after installation");
+    CHECK(DOM_NODE_CLAIMS(dom1, node1) == 2,
+          "Expect dom1 having 2 claims for node1 after installation");
+
+    /* Allocate an order-0 page from node 0 for the dummy domain. */
+    allocated = alloc_domheap_pages(dom1, order0, MEMF_node(node0));
+    CHECK(allocated != NULL, "alloc_domheap_pages should succeed");
+
+    /* Verify the state of the aggregate counters after allocation. */
+    CHECK(TOTAL_CLAIMS == 5, "Expect 5 total claims left after allocation");
+    CHECK(FREE_PAGES == 5, "Expect 5 free pages left after allocation");
+
+    /* Assert dom1's claims after the allocation from node0 */
+    CHECK(DOM_GLOBAL_CLAIMS(dom1) == 2,
+          "Expect dom1 still having 2 global claims after allocation");
+    CHECK(DOM_NODE_CLAIMS(dom1, node0) == 1,
+          "Expect dom1 having 1 claim for node0 after allocation");
+    CHECK(DOM_NODE_CLAIMS(dom1, node1) == 2,
+          "Expect dom1 still having 2 claims for node1 after allocation");
+
+    /* Allocate an order-0 page from node 1 for the dummy domain. */
+    allocated = alloc_domheap_pages(dom1, order0, MEMF_node(node1));
+    CHECK(allocated != NULL, "order-0 alloc from node1");
+
+    /* Assert dom1's claims after the allocation from node1 */
+    CHECK(DOM_GLOBAL_CLAIMS(dom1) == 2,
+          "Expect dom1 still having 2 global claims after allocation");
+    CHECK(DOM_NODE_CLAIMS(dom1, node0) == 1,
+          "Expect dom1 having 1 claim for node0 after allocation");
+    CHECK(DOM_NODE_CLAIMS(dom1, node1) == 1,
+          "Expect dom1 having 1 claim for node1 after allocation");
+
+    /* Allocate an order-1 page from node 1 for the dummy domain. */
+    allocated = alloc_domheap_pages(dom1, order1, MEMF_node(node1));
+    CHECK(allocated != NULL, "order-1 alloc from node1");
+
+    /* Assert dom1's claims after the allocation from node1 */
+    CHECK(DOM_GLOBAL_CLAIMS(dom1) == 1,
+          "Expect dom1 having redeemed one global claim after allocation");
+    CHECK(DOM_NODE_CLAIMS(dom1, node0) == 1,
+          "Expect dom1 having 1 claim for node0 after allocation");
+    CHECK(DOM_NODE_CLAIMS(dom1, node1) == 0,
+          "Expect dom1 having 0 claims for node1 after allocation");
+
+    /* Allocate an order-0 page from node 1 for the dummy domain. */
+    allocated = alloc_domheap_pages(dom1, order0, MEMF_node(node1));
+    CHECK(allocated != NULL, "order-0 alloc from node1");
+
+    /* Assert dom1's claims after the allocation from node1 */
+    CHECK(DOM_GLOBAL_CLAIMS(dom1) == 0,
+          "Expect dom1 having redeemed one global claim after allocation");
+    CHECK(DOM_NODE_CLAIMS(dom1, node0) == 1,
+          "Expect dom1 having 1 claim for node0 after allocation");
+    CHECK(DOM_NODE_CLAIMS(dom1, node1) == 0,
+          "Expect dom1 having 0 claims for node1 after allocation");
+
+    /* Allocate an order-0 page from node 1 for the dummy domain. */
+    allocated = alloc_domheap_pages(dom1, order0, MEMF_node(node1));
+    CHECK(allocated != NULL, "order-0 alloc from node1");
+
+    /* Assert dom1's claims after the allocation from node1 */
+    CHECK(DOM_GLOBAL_CLAIMS(dom1) == 0,
+          "Expect dom1 having redeemed one global claim after allocation");
+    CHECK(DOM_NODE_CLAIMS(dom1, node0) == 0,
+          "Expect dom1 having 0 claims for node0 after allocation");
+    CHECK(DOM_NODE_CLAIMS(dom1, node1) == 0,
+          "Expect dom1 having 0 claims for node1 after allocation");
+}
+
+int main(int argc, char *argv[])
+{
+    const char *topic = "Test legacy claims with allocation from the heap";
+    const char *program_name = parse_args(argc, argv, topic);
+
+    if ( !program_name )
+        return EXIT_FAILURE;
+
+    init_page_alloc_tests();
+    /*
+     * Use test_set_global_claims() which is a wrapper around
+     * domain_install_claim_set() to check ensure consistent
+     * behavior with domain_set_outstanding_pages().
+     */
+    RUN_TESTCASE(CNI0, test_claims_numa_install, 0);
+
+    testcase_print_summary(program_name);
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.39.5


