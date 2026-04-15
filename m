Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sG11JnPP32m4ZAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 19:48:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5A9406E6C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 19:48:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282742.1565236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4Lh-00023g-3M; Wed, 15 Apr 2026 17:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282742.1565236; Wed, 15 Apr 2026 17:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4Lh-00021k-0i; Wed, 15 Apr 2026 17:48:25 +0000
Received: by outflank-mailman (input) for mailman id 1282742;
 Wed, 15 Apr 2026 17:48:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wD4Lf-00021e-0r
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:48:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD4Le-00Dvub-Dz
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 19:48:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69dfcf53-e002-0a2a0a5209dd-0a2a450bd8f2-14
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:48:22 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69dfcf65-bca8-0a2a450b0019-a0658308ba10-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:48:22 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 37E1F4203287;
 Wed, 15 Apr 2026 13:47:38 -0400 (EDT)
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
Subject: [PATCH 2/4] tools/tests/alloc: Add integration test suite for memory claims
Date: Wed, 15 Apr 2026 18:34:57 +0100
Message-Id: <355d67b11c88695bec517a16d88b696a96ed0e5f.1776273656.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1776273656.git.bernhard.kaindl@citrix.com>
References: <cover.1776273656.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776275302-1734C2A1-D9852D6D/0/0
X-purgate-type: clean
X-purgate-size: 18715
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.680];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 0B5A9406E6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a host-side integration test suite for memory claims, including
NUMA-aware claim sets.

This complements the functional system tests submitted as part of the
NUMA-aware claims series.

It verifies the behaviour of the page allocator when multi-node claim
sets are present in situations that are easier to create and validate
in isolation, with full control over a synthetic Xen heap state and
visibility into the claim state of domains as claims are made and
redeemed through heap allocation.

The included tests cover a range of claim-related scenarios to ensure
that the Xen page allocator behaves as expected.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/alloc/test-claims_basic.c       | 230 ++++++++++++++++++++
 tools/tests/alloc/test-claims_numa_redeem.c | 201 +++++++++++++++++
 2 files changed, 431 insertions(+)
 create mode 100644 tools/tests/alloc/test-claims_basic.c
 create mode 100644 tools/tests/alloc/test-claims_numa_redeem.c

diff --git a/tools/tests/alloc/test-claims_basic.c b/tools/tests/alloc/test-claims_basic.c
new file mode 100644
index 000000000000..f81e75876d30
--- /dev/null
+++ b/tools/tests/alloc/test-claims_basic.c
@@ -0,0 +1,230 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Unit tests for memory claims in xen/common/page_alloc.c.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+/* Enable sysctl support in page_alloc.c for testing get_outstanding_claims() */
+#define CONFIG_NUMA   1
+#define CONFIG_SYSCTL 1
+#include "libtest-page_alloc.h"
+
+/*
+ * Wrapper for domain_install_claim_set() with the function signature as
+ * domain_set_outstanding_pages() to test both domain_install_claim_set()
+ * and domain_set_outstanding_pages() by using a function pointer for
+ * setting claims to check feature parity and consistent behavior.
+ */
+
+int test_set_global_claims(struct domain *d, unsigned long pages)
+{
+    memory_claim_t claim_set[] = {
+        {.target = XEN_DOMCTL_CLAIM_MEMORY_GLOBAL, .pages = pages},
+    };
+    return domain_install_claim_set(d, ARRAY_SIZE(claim_set), claim_set);
+}
+typedef int (*set_global_claims)(struct domain *d, unsigned long pages);
+
+/*
+ * Function pointer to test both domain_install_claim_set() and
+ * domain_set_outstanding_pages() interchangeably in the test
+ * scenarios for feature parity and consistent behaviour.
+ */
+set_global_claims install_global_claims = test_set_global_claims;
+
+/*
+ * Test that memory claims are consumed correctly during allocations.
+ */
+static void test_alloc_domheap_consumes_claims(int start_mfn)
+{
+    unsigned long avail_pages_zone;
+    int zone, ret;
+    struct page_info *pages = test_pages + start_mfn, *allocated;
+
+    /*
+     * PREPARE
+     */
+
+    /* Create a buddy of order 2 (4 pages) and add it to the heap. */
+    zone = test_page_list_add_buddy(pages, order2);
+
+    /* Verify the initial state of the heap */
+    ASSERT_LIST_EQUAL(&heap(node, zone, order2), pages);
+    ASSERT(page_list_empty(&heap(node, zone, order1)));
+    ASSERT(page_list_empty(&heap(node, zone, order0)));
+    CHECK_BUDDY(pages, "Order-2 buddy prepared on the heap");
+
+    /*
+     * ACT 1
+     */
+
+    /* Claim 3 out of the 4 pages for the dummy domain */
+    ret = test_set_global_claims(dom1, 3);
+    ASSERT(ret == 0);
+
+    /* Allocate an order-1 page for the dummy domain */
+    allocated = alloc_domheap_pages(dom1, order1, 0);
+    CHECK(allocated == &pages[2], "Expect allocation start at 3rd page");
+
+    /*
+     * ASSERT 1
+     *
+     * The allocation is expected to split the order-2 buddy and allocate
+     * an order-1 chunk from it, leaving the remaining order-1 chunk as a free
+     * available pages, and the claim should have been consumed accordingly.
+     */
+
+    /* Verify the state of the heap after allocation */
+    ASSERT(page_list_empty(&heap(node, zone, order2)));
+    ASSERT(page_list_empty(&heap(node, zone, order0)));
+    /* The remaining order-1 chunk should be the first page */
+    ASSERT_LIST_EQUAL(&heap(node, zone, order1), pages);
+    CHECK_BUDDY(pages, "Buddy after order-1 allocation");
+
+    /* Verify the state of the aggregate counters */
+    CHECK(TOTAL_CLAIMS == 1, "Expect 1 claims left after allocation");
+    CHECK(FREE_PAGES == 2, "Expect 2 available after allocation");
+    CHECK(avail_heap_pages(zone, zone, node) == 2, "Expect 2 in zone");
+
+    /*
+     * ACT 2
+     */
+
+    /* Allocate one of the two remaining order-0 pages for the dummy domain */
+    allocated = alloc_domheap_pages(dom1, order0, 0);
+    CHECK(allocated == &pages[1], "alloc_domheap_pages returned the 2nd page");
+
+    /*
+     * ASSERT 2
+     *
+     * The allocation is expected to split the remaining order-1
+     * buddy and allocate an order-0 page from it, leaving the
+     * remaining order-0 page as a free available page, and the
+     * claim should have been consumed accordingly.
+     */
+
+    /* Verify the state of the heap after allocation */
+    ASSERT(page_list_empty(&heap(node, zone, order2)));
+    ASSERT(page_list_empty(&heap(node, zone, order1)));
+    /* The remaining order-0 page should be the only free page we've left */
+    ASSERT_LIST_EQUAL(&heap(node, zone, order0), pages);
+
+    /* Verify the state of the aggregate counters */
+    CHECK(TOTAL_CLAIMS == 0, "Expect all claims consumed after allocation");
+    CHECK(FREE_PAGES == 1, "Expect one free page after allocation");
+
+    avail_pages_zone = avail_heap_pages(zone, zone, node);
+    CHECK(avail_pages_zone == 1, "Expect one page in zone after allocation");
+
+    /*
+     * PREPARE 3
+     */
+
+    /* Claim all free memory from another domain to block allocations */
+    ret = test_set_global_claims(dom2, FREE_PAGES);
+    ASSERT(ret == 0);
+
+    /*
+     * ACT 3
+     */
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
+    allocated = alloc_domheap_pages(dom1, order0, 0);
+    CHECK(allocated == NULL, "dom 1 alloc fails b/c domain 2's claim");
+
+    /*
+     * ASSERT 3
+     */
+
+    /* Verify the state of the heap after failed allocation (no changes) */
+    ASSERT(page_list_empty(&heap(node, zone, order2)));
+    ASSERT(page_list_empty(&heap(node, zone, order1)));
+    /* Due to the foreign claim, the remaining page should still be free */
+    ASSERT_LIST_EQUAL(&heap(node, zone, order0), pages);
+
+    /* Verify the state of the aggregate counters (no changes expected) */
+    CHECK(TOTAL_CLAIMS == 1, "Expect domain 2's claim to be still present");
+    CHECK(FREE_PAGES == 1, "Expect one free page after failed alloc");
+
+    avail_pages_zone = avail_heap_pages(zone, zone, node);
+    CHECK(avail_pages_zone == 1, "Expect one page in zone after allocation");
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
+    /* Claim half of the free pages for dom1 */
+    ASSERT(test_set_global_claims(dom1, claims) == 0);
+    ASSERT(TOTAL_CLAIMS == claims);
+
+    /*
+     * Act: Cancel the claims for the dummy domain and verify that the
+     * claim counts are updated and the free pages are available again.
+     */
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
+    const char *topic = "Test legacy claims with allocation from the heap";
+    const char *program_name = parse_args(argc, argv, topic);
+
+    if ( !program_name )
+        return EXIT_FAILURE;
+
+    init_page_alloc_tests();
+
+    /* Use domain_set_outstanding_pages() for staking claims */
+    install_global_claims = domain_set_outstanding_pages;
+    RUN_TESTCASE(ADCL, test_alloc_domheap_consumes_claims, 0);
+
+    /*
+     * Use test_set_global_claims() which is a wrapper around
+     * domain_install_claim_set() to check ensure consistent
+     * behavior with domain_set_outstanding_pages().
+     */
+    install_global_claims = test_set_global_claims;
+    RUN_TESTCASE(ADCG, test_alloc_domheap_consumes_claims, 4);
+
+    RUN_TESTCASE(TCCL, test_cancel_claims, 0);
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
diff --git a/tools/tests/alloc/test-claims_numa_redeem.c b/tools/tests/alloc/test-claims_numa_redeem.c
new file mode 100644
index 000000000000..61bec12be1c0
--- /dev/null
+++ b/tools/tests/alloc/test-claims_numa_redeem.c
@@ -0,0 +1,201 @@
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
+#include "libtest-page_alloc.h"
+
+/*
+ * Test redeeming NUMA memory claims in exchange for allocations,
+ * and the redeemed claims are correctly reflected in the domain's
+ * claim state and the aggregate claim counters.
+ */
+static void test_claims_numa_install(int start_mfn)
+{
+    unsigned long avail_pages_zone;
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
+    /* Verify the initial state of node 0's heap. */
+    ASSERT_LIST_EQUAL(&heap(node0, zone, order1), pages);
+    ASSERT(page_list_empty(&heap(node0, zone, order0)));
+    CHECK_BUDDY(pages, "Order-1 buddy on node 0 prepared");
+
+    /* Create an order-2 buddy (4 pages) for node 1 and add it to the heap. */
+    test_page_list_add_buddy(pages_node1, order2);
+    CHECK_BUDDY(pages_node1, "Order-2 buddy on node 1 prepared");
+
+    /*
+     * ACT 1
+     */
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
+    /*
+     * ASSERT 1
+     *
+     * The order-0 allocation from node 0 splits the node 0 order-1 buddy:
+     * - The lower half (pages[0]) stays on node 0's order-0 heap.
+     * - The upper half (pages[1]) is returned as the allocated page.
+     * One node 0 claim is consumed by the allocation.
+     */
+    CHECK_BUDDY(pages, "Buddy after order-0 allocation");
+    /* Verify the state of node 0's heap after allocation. */
+    ASSERT(page_list_empty(&heap(node0, zone, order2)));
+    ASSERT(page_list_empty(&heap(node0, zone, order1)));
+    /* The lower half (pages[0]) remains as the sole order-0 buddy on node 0. */
+    ASSERT_LIST_EQUAL(&heap(node0, zone, order0), pages);
+
+    avail_pages_zone = avail_heap_pages(zone, zone, node0);
+    CHECK(avail_pages_zone == 1, "Expect one page in node0 after allocation");
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


