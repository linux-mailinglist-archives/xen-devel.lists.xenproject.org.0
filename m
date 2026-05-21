Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACU3HIQuD2r+HQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 18:10:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0570B5A8F2B
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 18:10:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315496.1585313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5ym-0005TG-DM; Thu, 21 May 2026 16:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315496.1585313; Thu, 21 May 2026 16:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5ym-0005Qy-9p; Thu, 21 May 2026 16:10:36 +0000
Received: by outflank-mailman (input) for mailman id 1315496;
 Thu, 21 May 2026 16:10:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wQ5yk-0005QK-C7
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 16:10:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5yj-003Zqu-OX
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 18:10:33 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a0f2e68-e002-0a2a0a5209dd-0a2a4504a856-20
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:10:33 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a0f2e78-1dec-0a2a45040019-a06583099528-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 18:10:33 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 962C48242087;
 Thu, 21 May 2026 12:09:21 -0400 (EDT)
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
Subject: [PATCH v3 2/2] tests/native: Add native tests for NUMA claim sets
Date: Thu, 21 May 2026 17:08:08 +0100
Message-Id: <ebafa1b46ff792d728a316ac920dbfa7965d0cb8.1779379609.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1779379609.git.bernhard.kaindl@citrix.com>
References: <cover.1779379609.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1779379833-28D743FF-75B8AFE9/0/0
X-purgate-type: clean
X-purgate-size: 21358
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 0570B5A8F2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Test the page allocator's claim behaviour using:

- the legacy xc_domain_claim_pages() call, and
- the new xc_domain_claim_memory() call of the claim-set API,

exercising both host-wide and NUMA node-specific multi-node claims.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/native/host-claims.c | 248 +++++++++++++++++++++++++++++++
 tools/tests/native/node-claims.c | 230 ++++++++++++++++++++++++++++
 2 files changed, 478 insertions(+)
 create mode 100644 tools/tests/native/host-claims.c
 create mode 100644 tools/tests/native/node-claims.c

diff --git a/tools/tests/native/host-claims.c b/tools/tests/native/host-claims.c
new file mode 100644
index 000000000000..8286fc586282
--- /dev/null
+++ b/tools/tests/native/host-claims.c
@@ -0,0 +1,248 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Test basic host-wide functionality of memory claims, including
+ * installing and redeeming claims, and that claims are respected
+ * by allocations and protected against other allocations.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#define TEST_ENABLE_XC_DOMAIN_C /* Enable xc_domain.c APIs */
+#include "harness/native.h"
+
+typedef int (*set_global_claims)(struct domain *d, unsigned long pages);
+set_global_claims install_host_claims;
+
+/* Install a host-wide claim using the legacy xc_domain_claim_pages() call */
+int install_host_claims_legacy(struct domain *d, unsigned long pages)
+{
+    if (pages == 0)
+        return xc_domain_claim_pages(xch, d->domain_id, 0);
+
+    /* The legacy call need resetting claims before claims can be set again */
+    xc_domain_claim_pages(xch, d->domain_id, 0);
+
+    /* The argument of the legacy call includes the domain's existing pages */
+    pages += domain_tot_pages(d);
+
+    return xc_domain_claim_pages(xch, d->domain_id, pages);
+}
+
+/* Install a host-wide claim set using the xc_domain.c hypercall API */
+int xc_domain_claim_memory_host(struct domain *d, unsigned long pages)
+{
+    xen_memory_claim_t claim_set[] = {
+        { .target = XEN_DOMCTL_CLAIM_MEMORY_HOST, .pages = pages },
+    };
+    uint32_t nr_entries = ARRAY_SIZE(claim_set);
+
+    return xc_domain_claim_memory(xch, d->domain_id,
+        XEN_DOMCTL_CLAIM_MEMORY_SET, &nr_entries, claim_set);
+}
+
+static void test_alloc_domheap_redeems_claims(int start_mfn)
+{
+    int ret;
+    struct page_info *pages = frame_table + start_mfn, *pg;
+
+    test_page_list_add_buddy(pages, order2);
+    ASSERT(!install_host_claims(dom1, 3));
+    ASSERT(alloc_domheap_pages(dom1, order1, 0) == pages + 2);
+    ASSERT(alloc_domheap_pages(dom1, order0, 0) == pages + 1);
+    CHECK(TOTAL_CLAIMS == 0, "Expect all claims consumed after allocations");
+    CHECK(FREE_PAGES == 1, "Expect one free page after allocations");
+
+    ASSERT(!install_host_claims(dom2, FREE_PAGES));
+
+    /* Claim more than dom1 already has fails with ENOMEM (claimed by dom2) */
+    ret = install_host_claims(dom1, domain_tot_pages(dom1) + 1);
+    CHECK(ret == -ENOMEM, "dom 1 claim +1 fails due to insufficient pages");
+
+    /* Claim more than dom1's d->max_pages fails with EINVAL */
+    ret = install_host_claims(dom1, dom1->max_pages + 1);
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
+ * Test that memory claims can be cancelled by setting the claim count to 0,
+ * and that cancelled claims are freed up for other domains to claim.
+ *
+ * This is important for domain_kill() to be able to cancel claims of a dying
+ * domain and free up the pages for other domains to claim and free, otherwise
+ * the host might run out of free pages due to claims that are not released.
+ *
+ * - Test that after claiming pages for a domain, allocations redeem a portion
+ *   of those claims.
+ *
+ * - Test that other domains cannot claim more pages than the unclaimed free
+ *   pages, and that cancelled claims are no longer present after cancellation.
+ *
+ * - Test that after cancelling claims for a domain, other domains can claim
+ *   and allocate all remaining free pages.
+ */
+static void test_claim_alloc_cancel(int start_mfn)
+{
+    struct page_info *expected, *page = frame_table + start_mfn;
+    unsigned long heap_pages, claims;
+    unsigned int alloc_order;
+
+    /* Create a buddy of order 2 (4 pages) and add it to the heap. */
+    test_page_list_add_buddy(page, order3);
+    heap_pages = FREE_PAGES;
+    claims = heap_pages / 2;
+
+    /* Claim half of the free pages for domain 1 */
+    ASSERT(install_host_claims(dom1, claims) == 0);
+    ASSERT(TOTAL_CLAIMS == claims);
+
+    /* Allocate an order 1 page for domain 1 */
+    alloc_order = order1;
+    /* Expect the highest available page to be allocated */
+    expected = page + FREE_PAGES - (1UL << alloc_order);
+    ASSERT(alloc_domheap_pages(dom1, alloc_order, 0) == expected);
+    ASSERT(TOTAL_CLAIMS == (claims -= 1UL << alloc_order, claims));
+
+    /* Allocate an order 0 page for domain 1 */
+    alloc_order = order0;
+    /* Expect the highest available page to be allocated */
+    expected = page + FREE_PAGES - (1UL << alloc_order);
+    ASSERT(alloc_domheap_pages(dom1, alloc_order, 0) == expected);
+    ASSERT(TOTAL_CLAIMS == (claims -= 1UL << alloc_order, claims));
+
+    /* Claiming more than unclaimed for domain 2 should fail */
+    ASSERT(install_host_claims(dom2, heap_pages - claims + 1) == -ENOMEM);
+    /* Claiming all free pages for domain 2 should fail (dom1 has a claim) */
+    ASSERT(install_host_claims(dom2, FREE_PAGES) == -ENOMEM);
+    ASSERT(TOTAL_CLAIMS == claims);
+
+    /*
+     * Cancelling claims needs to always work, the checks in place for
+     * installing claims should not prevent cancelling claims, which is
+     * important for domain_kill() to be able to cancel claims of a dying
+     * domain regardless of the state of the domain's configuration.
+     *
+     * An important check that cancelling claims needs to bypass is the
+     * max_pages check, as a domain's max_pages can be set to a low value
+     * due to a toolstack process (Xapi's "squeezed" squeezing the domain
+     * can set its max_pages to a lower value than domain_tot_pages() by
+     * invoking do_domctl(XEN_DOMCTL_max_mem).
+     *
+     * This should not prevent the claims from being cancelled as required.
+     */
+    dom1->max_pages = domain_tot_pages(dom1) - 1;
+
+    /* Cancel all remaining claims for domain 1 */
+    ASSERT(install_host_claims(dom1, 0) == 0);
+    ASSERT(TOTAL_CLAIMS == 0);
+
+    /* Claim all free pages for domain 2, should work */
+    claims = FREE_PAGES;
+    ASSERT(install_host_claims(dom2, claims) == 0);
+    ASSERT(TOTAL_CLAIMS == claims);
+
+    /* Claiming for domain 1 should fail with EINVAL due to max_pages = 0 */
+    ASSERT(install_host_claims(dom1, 1) == -EINVAL);
+
+    /* With d->max_pages > domain_tot_pages(), dom1 claims fails with -ENOMEM */
+    dom1->max_pages = heap_pages;
+    ASSERT(install_host_claims(dom1, 1) == -ENOMEM);
+
+    /* Attempting to allocate a page for domain 1 should likewise fail now */
+    ASSERT(alloc_domheap_pages(dom1, order0, 0) == NULL);
+
+    /* Allocating a page for domain 2 still work as it has the claims */
+    alloc_order = order0;
+    /* Expect the highest available page to be allocated */
+    expected = page + FREE_PAGES - (1UL << alloc_order);
+    ASSERT(alloc_domheap_pages(dom2, alloc_order, 0) == expected);
+    ASSERT(TOTAL_CLAIMS == (claims -= 1UL << alloc_order, claims));
+
+    /* Even allocating the remaining order 2 buddy for domain 2 works */
+    alloc_order = order2;
+    /* Expect the highest available page to be allocated */
+    expected = page + FREE_PAGES - (1UL << alloc_order);
+    ASSERT(alloc_domheap_pages(dom2, alloc_order, 0) == expected);
+    ASSERT(TOTAL_CLAIMS == (claims -= 1UL << alloc_order, claims));
+}
+
+/* Test offlining free pages outside and inside the claimed pages pool */
+static void test_offlining_host_claims(int start_mfn)
+{
+    struct page_info *pages = frame_table + start_mfn;
+    unsigned long heap_size, claims;
+
+    test_page_list_add_buddy(pages, order2);
+
+    heap_size = FREE_PAGES;
+    claims = heap_size - 1; /* Claim all but one page */
+    ASSERT(!install_host_claims(dom1, claims));
+
+    /* Mark a first page as offline */
+
+    mark_page_offline(pages + 3, 0);
+    ASSERT(page_state_is(pages + 3, offlined));
+
+    /* Due to the single unclaimed page, the claims should remain unchanged */
+    ASSERT(FREE_PAGES == heap_size);
+    ASSERT(TOTAL_CLAIMS == heap_size - 1);
+    ASSERT(reserve_offlined_page(pages) == 1);
+    ASSERT(FREE_PAGES == heap_size - 1); /* One free page is offlined */
+    ASSERT(TOTAL_CLAIMS == heap_size - 1);
+
+    /* Offline a second page. Offlines a portion of the claimed pages pool. */
+
+    mark_page_offline(pages + 1, 0);
+    ASSERT(page_state_is(pages + 1, offlined));
+
+    /* Assert the effect of offlining a portion of the claimed pages pool */
+    ASSERT(FREE_PAGES == heap_size - 1);
+    ASSERT(TOTAL_CLAIMS == heap_size - 1);
+    ASSERT(reserve_offlined_page(pages) == 1);
+    ASSERT(FREE_PAGES == heap_size - 2); /* Two pages are offlined */
+    ASSERT(TOTAL_CLAIMS == heap_size - 2); /* One claim is be released */
+}
+
+int main(int argc, char *argv[])
+{
+    const char *topic = "Test host-wide claims with old and new interfaces";
+
+    if ( !parse_args(argc, argv, topic) )
+        return EXIT_FAILURE;
+
+    init_page_alloc_tests();
+
+    /*
+     * Run the tests on all levels of the claims interface:
+     *
+     * 1. Direct page_alloc function call used by other code in the hypervisor,
+     *    which needs to support claim cancellation, needed by domain_kill().
+     *
+     * 2. The domctl helper for the hypercall, which is used by the hypercall
+     *    handler itself to parse the hypercall arguments before calling the
+     *    page_allocator functions.
+     *
+     * 3. The real DOMCTL handler, do_domctl(), which is the actual handler
+     *    function called when invoking the real hypercall.
+     */
+
+    /* Test using the direct claim function call used inside the hypervisor */
+    install_host_claims = install_host_claims_legacy;
+    RUN_TESTCASE("TCCD", test_claim_alloc_cancel, 8);
+    RUN_TESTCASE("DCGD", test_alloc_domheap_redeems_claims, 4);
+
+    /* Test claims setup using the actual DOMCTL handler itself, do_domctl() */
+    install_host_claims = xc_domain_claim_memory_host;
+    RUN_TESTCASE("TCCH", test_claim_alloc_cancel, 8);
+    RUN_TESTCASE("DCGH", test_alloc_domheap_redeems_claims, 4);
+
+    /* Test offlining free pages outside and inside the claimed pages pool */
+    RUN_TESTCASE("OHCH", test_offlining_host_claims, 4);
+
+    return test_complete();
+}
diff --git a/tools/tests/native/node-claims.c b/tools/tests/native/node-claims.c
new file mode 100644
index 000000000000..aa736f325f6b
--- /dev/null
+++ b/tools/tests/native/node-claims.c
@@ -0,0 +1,230 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Integration tests for NUMA-aware memory claims.
+ *
+ * The install test verifies that when a domain has a claim set installed
+ * with host-wide and per-NUMA-node claims, allocations that specify NUMA
+ * node affinity will redeem the appropriate claims (same-node first,
+ * host-wide fallback claim next, then other nodes, to not exceed page
+ * limits). It also verifies that the aggregate claim counters are updated
+ * correctly after each allocation.
+ *
+ * The get test verifies that callers can query the required number of
+ * claim records by passing a count of 0 and a NULL claim set buffer.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+#ifdef __x86_64__
+#define CONFIG_NUMA 1 /* Enable NUMA support in the test environment. */
+#define TEST_ENABLE_XC_DOMAIN_C /* Enable xc_domain.c wrapper */
+#include "harness/native.h"
+
+typedef int (*set_numa_claims)
+    (struct domain *d, uint32_t entries, const xen_memory_claim_t *claim_set);
+set_numa_claims install_numa_claims;
+
+/*
+ * Test redeeming NUMA memory claims in exchange for allocations,
+ * where the redeemed claims are correctly reflected in the domain's
+ * claim state and the aggregate claim counters.
+ */
+static void test_claims_numa_install(int start_mfn)
+{
+    test_page_list_add_node_buddy(node0, start_mfn, order2);
+    test_page_list_add_node_buddy(node1, start_mfn, order2);
+
+    /* Install a claim set with host-wide + per-NUMA-node claims. */
+    xen_memory_claim_t claim_set[3] = {
+        { .target = XEN_DOMCTL_CLAIM_MEMORY_HOST, .pages = 2 },
+        { .target = node0, .pages = 2 },
+        { .target = node1, .pages = 2 },
+    };
+    int install = install_numa_claims(dom1, ARRAY_SIZE(claim_set), claim_set);
+
+    ASSERT(install == 0);
+    CHECK(TOTAL_CLAIMS == 6, "Expect 6 total claims after installation");
+    CLAIMS(dom1, claim_set);
+
+    ASSERT(alloc_domheap_pages(dom1, order0, MEMF_node(node0)));
+    CHECK(TOTAL_CLAIMS == 5, "Expect 5 total claims left after allocation");
+    CHECK(FREE_PAGES == 7, "Expect 7 free pages left after allocation");
+    ASSERT(claim_set[1].target == node0);
+    claim_set[1].pages--; /* Expect the allocation redeemed from node 0 */
+    CLAIMS(dom1, claim_set);
+
+    /* An allocation on node 1 redeems a claim from node 1 */
+    ASSERT(alloc_domheap_pages(dom1, order0, MEMF_node(node1)));
+    CHECK(TOTAL_CLAIMS == 4, "Expect 4 total claims left after allocation");
+    CHECK(FREE_PAGES == 6, "Expect 6 free pages left after allocation");
+    ASSERT(claim_set[2].target == node1);
+    claim_set[2].pages--; /* Expect the allocation redeemed from node 1 */
+    CLAIMS(dom1, claim_set);
+
+    /* An allocation on node 1 redeems the last claim from node 1 */
+    ASSERT(alloc_domheap_pages(dom1, order1, MEMF_node(node1)));
+    CHECK(TOTAL_CLAIMS == 2, "Expect 2 total claims left after allocation");
+    CHECK(FREE_PAGES == 4, "Expect 4 free pages left after allocation");
+    xen_memory_claim_t claim_set2[2] = {
+        claim_set[0], /* The Host-wide claim should still be present. */
+        claim_set[1], /* Claim from node 0 should still be present. */
+        /* The claim from node 1 is consumed, not part of the claim set. */
+    };
+    claim_set2[0].pages--; /* The 2nd page is redeemed from host-wide claim */
+    CLAIMS(dom1, claim_set2);
+
+    /* An allocation on node 1 falls back to the host-wide claim */
+    ASSERT(alloc_domheap_pages(dom1, order0, MEMF_node(node1)));
+    CHECK(TOTAL_CLAIMS == 1, "Expect 1 total claims left after allocation");
+    CHECK(FREE_PAGES == 3, "Expect 3 free pages left after allocation");
+    claim_set2[0].pages--; /* The 2nd page is redeemed from host-wide claim */
+    CLAIMS(dom1, claim_set2);
+
+    /* An allocation on node 1 falls back to node 0 */
+    ASSERT(alloc_domheap_pages(dom1, order0, MEMF_node(node1)));
+    CHECK(TOTAL_CLAIMS == 0, "Expect 0 total claims left after allocation");
+    CHECK(FREE_PAGES == 2, "Expect 2 free pages left after allocation");
+    CLAIMS(dom1, /* All claims should be consumed */
+           ((xen_memory_claim_t[]){
+                { .target = XEN_DOMCTL_CLAIM_MEMORY_HOST, .pages = 0 },
+            }));
+}
+
+/* Test getting the current claim set for a domain. */
+static void test_claims_numa_get(int start_mfn)
+{
+    test_page_list_add_node_buddy(node0, start_mfn, order2);
+    test_page_list_add_node_buddy(node1, start_mfn, order2);
+
+    /* Install a claim set with host-wide + per-NUMA-node claims. */
+    const xen_memory_claim_t claim_set[3] = {
+        { .target = XEN_DOMCTL_CLAIM_MEMORY_HOST, .pages = 2 },
+        { .target = node0, .pages = 2 },
+        { .target = node1, .pages = 2 },
+    };
+    int install = install_numa_claims(dom1, ARRAY_SIZE(claim_set), claim_set);
+
+    ASSERT(install == 0);
+
+    /*
+     * Assert that the direct call can get the number of claim records by
+     * passing a count of 0 and NULL for the claim set buffer.
+     */
+    uint32_t records = 0, expected_records = ARRAY_SIZE(claim_set);
+
+    ASSERT(domain_get_claim_entries(dom1, &records, NULL) == -ERANGE);
+    ASSERT(records == expected_records);
+
+    /*
+     * Assert that the libxc wrapper can get the number of claim records for
+     * a domain by passing a count of 0 and NULL for the claim set buffer.
+     */
+    records = 0;
+    ASSERT(xc_domain_claim_memory(&test_xc_handle, dom1->domain_id,
+                                  XEN_DOMCTL_CLAIM_MEMORY_GET,
+                                  &records, NULL) == -ERANGE);
+    ASSERT(records == expected_records);
+
+    /* Assert the libxc wrapper returning the expected claim set contents */
+    CLAIMS(dom1,
+           ((xen_memory_claim_t[]){
+                { .target = XEN_DOMCTL_CLAIM_MEMORY_HOST, .pages = 2 },
+                { .target = node0, .pages = 2 },
+                { .target = node1, .pages = 2 }
+            }));
+}
+
+/* Test offlining free pages outside and inside the claimed pages pool */
+static void test_offlining_node_claims(int start_mfn)
+{
+    struct page_info *pages = test_get_node_page(node0, start_mfn);
+    unsigned long heap_size, claims, host;
+
+    test_page_list_add_node_buddy(node0, start_mfn, order2);
+    test_page_list_add_node_buddy(node1, start_mfn, order2);
+    heap_size = FREE_PAGES;
+    claims = heap_size / 2 - 1; /* Claim all but 1 page on each node*/
+    host = heap_size - 2 * claims; /* Claim the rest host-wide */
+
+    /* Install a claim set with host-wide + per-NUMA-node claims. */
+    xen_memory_claim_t claim_set[] = {
+        { .target = XEN_DOMCTL_CLAIM_MEMORY_HOST, .pages = host },
+        { .target = node0, .pages = claims },
+        { .target = node1, .pages = claims },
+    };
+    ASSERT(install_numa_claims(dom1, ARRAY_SIZE(claim_set), claim_set) == 0);
+
+    /* Mark a first page as offline */
+
+    mark_page_offline(pages + 3, 0);
+    ASSERT(page_state_is(pages + 3, offlined));
+
+    /* The 1st page was not in a node's claims pool, but in the host pool */
+    ASSERT(FREE_PAGES == heap_size);
+    ASSERT(TOTAL_CLAIMS == heap_size);
+    ASSERT(reserve_offlined_page(pages) == 1);
+    ASSERT(FREE_PAGES == heap_size - 1); /* One free page is offlined */
+    ASSERT(TOTAL_CLAIMS == heap_size - 1);
+
+    /* Expect the pool of host-wide claims to be reduced by 1 page */
+    xen_memory_claim_t claim_set1[] = {
+        { .target = XEN_DOMCTL_CLAIM_MEMORY_HOST, .pages = host - 1 },
+        { .target = node0, .pages = claims },
+        { .target = node1, .pages = claims }
+    };
+    CLAIMS(dom1, claim_set1);
+
+    /* Offline a second page. Offlines a portion of the claimed pages pool. */
+
+    mark_page_offline(pages + 1, 0);
+    ASSERT(page_state_is(pages + 1, offlined));
+
+    /* Assert the effect of offlining a portion of the claimed pages pool */
+    ASSERT(FREE_PAGES == heap_size - 1);
+    ASSERT(TOTAL_CLAIMS == heap_size - 1);
+    ASSERT(reserve_offlined_page(pages) == 1);
+    ASSERT(FREE_PAGES == heap_size - 2); /* Two pages are offlined */
+    ASSERT(TOTAL_CLAIMS == heap_size - 2); /* One claim is be released */
+
+    /* The 2nd page was in the claims pool on node0, it should be released */
+    xen_memory_claim_t claim_set2[] = {
+                { .target = XEN_DOMCTL_CLAIM_MEMORY_HOST, .pages = host - 1 },
+                { .target = node0, .pages = claims - 1 },
+                { .target = node1, .pages = claims }
+            };
+    CLAIMS(dom1, claim_set2);
+}
+
+int main(int argc, char *argv[])
+{
+    const char *topic = "Test NUMA-aware claims with allocation from the heap";
+
+    if ( !parse_args(argc, argv, topic) )
+        return EXIT_FAILURE;
+
+    init_page_alloc_tests();
+
+    /* Run test cases with different NUMA claim installation methods */
+
+    /* Run the test with a direct call to domain_set_claim_entries() */
+    install_numa_claims = domain_set_claim_entries;
+    RUN_TESTCASE("CNIS", test_claims_numa_install, 4);
+
+    /* Run the test for getting the current claim set for a domain */
+    install_numa_claims = domain_set_claim_entries;
+    RUN_TESTCASE("CNGS", test_claims_numa_get, 4);
+
+    RUN_TESTCASE("ONCS", test_offlining_node_claims, 4);
+
+    return test_complete();
+}
+#else
+#include <stdio.h>
+int main(int argc, char *argv[])
+{
+    (void)argc;
+    (void)argv;
+    printf("This test requires NUMA, which is only available on x86_64.\n");
+    return 0;
+}
+#endif
-- 
2.39.5


