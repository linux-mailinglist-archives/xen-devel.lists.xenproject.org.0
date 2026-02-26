Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GzbLZ1ioGk0jAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 16:11:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE6F1A84AF
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 16:11:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242088.1542820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvd0y-0004xu-TZ; Thu, 26 Feb 2026 15:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242088.1542820; Thu, 26 Feb 2026 15:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvd0y-0004vT-QO; Thu, 26 Feb 2026 15:10:56 +0000
Received: by outflank-mailman (input) for mailman id 1242088;
 Thu, 26 Feb 2026 15:10:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvd0x-0004vN-BE
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 15:10:55 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54d120c2-1325-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 16:10:49 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 14EE8429064D;
 Thu, 26 Feb 2026 10:10:28 -0500 (EST)
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
X-Inumbo-ID: 54d120c2-1325-11f1-9ccf-f158ae23cfc8
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 09/10] tools/tests: Update the claims test to test claim_memory hypercall
Date: Thu, 26 Feb 2026 14:29:23 +0000
Message-Id: <bda9076991cc2d3f22d1a971998783125c7bcb80.1772098423.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1772098423.git.bernhard.kaindl@citrix.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 4AE6F1A84AF
X-Rspamd-Action: no action

Extend the existing mem-claim test to verify both the legacy
XENMEM_claim_pages and the new XEN_DOMCTL_claim_memory hypercalls.

It tests both host-wide claims (NUMA_NO_NODE) and node-specific
claims (assuming at least a single NUMA node, node 0 is provided)
to ensure the new infrastructure works correctly.

It also checks the protection of host- and node-claims against
allocations without sufficient, specific claims.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/mem-claim/test-mem-claim.c | 277 +++++++++++++++++++++++--
 1 file changed, 254 insertions(+), 23 deletions(-)

diff --git a/tools/tests/mem-claim/test-mem-claim.c b/tools/tests/mem-claim/test-mem-claim.c
index ad038e45d188..a98d3e43ff54 100644
--- a/tools/tests/mem-claim/test-mem-claim.c
+++ b/tools/tests/mem-claim/test-mem-claim.c
@@ -2,6 +2,7 @@
 #include <err.h>
 #include <errno.h>
 #include <inttypes.h>
+#include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
 #include <sys/mman.h>
@@ -20,10 +21,13 @@ static unsigned int nr_failures;
 
 #define MB_PAGES(x) (MB(x) / XC_PAGE_SIZE)
 
+#define CLAIM_TEST_ORDER 9 /* 2M */
+
 static xc_interface *xch;
 static uint32_t domid = DOMID_INVALID;
 
 static xc_physinfo_t physinfo;
+static unsigned int claim_test_node;
 
 static struct xen_domctl_createdomain create = {
     .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
@@ -38,10 +42,138 @@ static struct xen_domctl_createdomain create = {
     },
 };
 
-static void run_tests(void)
+typedef int (*claim_fn_t)(xc_interface *xch, uint32_t domid,
+                          unsigned long pages);
+
+/* Wrapper function to test claiming memory using xc_domain_claim_pages. */
+static int wrap_claim_pages(xc_interface *xch,
+                            uint32_t domid,
+                            unsigned long pages)
+{
+    return xc_domain_claim_pages(xch, domid, pages);
+}
+
+/* Wrapper function to test claiming memory using xc_domain_claim_memory. */
+static int wrap_claim_memory(xc_interface *xch,
+                             uint32_t domid,
+                             unsigned long pages)
+{
+    memory_claim_t claim[] = {
+        XEN_NODE_CLAIM_INIT(pages, XEN_DOMCTL_CLAIM_MEMORY_NO_NODE)
+    };
+
+    return xc_domain_claim_memory(xch, domid, 1, claim);
+}
+
+/* Wrapper to test claiming memory using xc_domain_claim_memory on a NUMA node */
+static int wrap_claim_memory_node(xc_interface *xch,
+                                  uint32_t domid,
+                                  unsigned long pages)
 {
     int rc;
+    memory_claim_t claims[UINT8_MAX + 1] = {}; /* + 1 to test overflow check */
+
+    /* claim with a node that is not present */
+    claims[0] = (memory_claim_t)XEN_NODE_CLAIM_INIT(pages, physinfo.nr_nodes);
 
+    /* Check the return value of claiming memory on an invalid node */
+    rc = xc_domain_claim_memory(xch, domid, 1, claims);
+    if ( rc != -1 || errno != ENOENT )
+    {
+        fail("Expected claim failure on invalid node to fail with ENOENT\n");
+        return rc;
+    }
+    /*
+     * Check the return value of claiming on two nodes (not yet implemented)
+     * and that the valid claim is rejected when nr_claims > 1. We expect that
+     * the API will reject the call due exceeding nr_claims before it checks
+     * the validity of the node(s), so we expect EINVAL rather than ENOENT.
+     */
+    rc = xc_domain_claim_memory(xch, domid, 2, claims);
+    if ( rc != -1 || errno != EINVAL )
+    {
+        fail("Expected nr_claims == 2 to fail with EINVAL (for now)\n");
+        return rc;
+
+    }
+    /* Likewise check with nr_claims > MAX_UINT8 to test overflow */
+    rc = xc_domain_claim_memory(xch, domid, UINT8_MAX + 1, claims);
+    if ( rc != -1 || errno != EINVAL )
+    {
+        fail("Expected nr_claims = UINT8_MAX + 1 to fail with EINVAL\n");
+        return rc;
+    }
+    /* Likewise check with a node of MAX_UINT8 + 1 to test overflow */
+    claims[0].node = UINT8_MAX + 1;
+    rc = xc_domain_claim_memory(xch, domid, 1, claims);
+    if ( rc != -1 || errno != ENOENT )
+    {
+        fail("Expected node == UINT8_MAX + 1 to fail with ENOENT\n");
+        return rc;
+    }
+    /* Test with pages exceeding INT32_MAX to check overflow */
+    claims[0] = (memory_claim_t)XEN_NODE_CLAIM_INIT((unsigned)INT32_MAX + 1, 0);
+    rc = xc_domain_claim_memory(xch, domid, 1, claims);
+    if ( rc != -1 || errno != ENOMEM )
+    {
+        fail("Expected ENOMEM with pages > INT32_MAX\n");
+        return rc;
+    }
+    /* Test with pad not set to zero */
+    claims[0] = (memory_claim_t)XEN_NODE_CLAIM_INIT(pages, claim_test_node);
+    claims[0].pad = 1;
+    rc = xc_domain_claim_memory(xch, domid, 1, claims);
+    if ( rc != -1 || errno != EINVAL )
+    {
+        fail("Expected EINVAL with pad not set to zero\n");
+        return rc;
+    }
+
+    /* Pass a valid claim for the selected node and continue the test */
+    claims[0] = (memory_claim_t)XEN_NODE_CLAIM_INIT(pages, claim_test_node);
+    return xc_domain_claim_memory(xch, domid, 1, claims);
+}
+
+static int get_node_free_pages(unsigned int node, unsigned long *free_pages)
+{
+    int rc;
+    unsigned int num_nodes = 0;
+    xc_meminfo_t *meminfo;
+
+    rc = xc_numainfo(xch, &num_nodes, NULL, NULL);
+    if ( rc )
+        return rc;
+
+    if ( node >= num_nodes )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    meminfo = calloc(num_nodes, sizeof(*meminfo));
+    if ( !meminfo )
+        return -1;
+
+    rc = xc_numainfo(xch, &num_nodes, meminfo, NULL);
+    if ( rc )
+        goto out;
+
+    *free_pages = meminfo[node].memfree / XC_PAGE_SIZE;
+
+ out:
+    free(meminfo);
+    return rc;
+}
+
+static void run_test(claim_fn_t claim_call_wrapper, const char *claim_name,
+                     bool host_wide_claim)
+{
+    int rc;
+    uint64_t free_heap_bytes;
+    unsigned long free_pages, claim_pages;
+    const unsigned long request_pages = 1UL << CLAIM_TEST_ORDER;
+
+    printf("  Testing %s\n", claim_name);
     /*
      * Check that the system is quiescent.  Outstanding claims is a global
      * field.
@@ -51,7 +183,7 @@ static void run_tests(void)
         return fail("Failed to obtain physinfo: %d - %s\n",
                     errno, strerror(errno));
 
-    printf("Free pages: %"PRIu64", Oustanding claims: %"PRIu64"\n",
+    printf("Free pages: %"PRIu64", Outstanding claims: %"PRIu64"\n",
            physinfo.free_pages, physinfo.outstanding_pages);
 
     if ( physinfo.outstanding_pages )
@@ -98,13 +230,30 @@ static void run_tests(void)
         return fail("  Unexpected outstanding claim of %"PRIu64" pages\n",
                     physinfo.outstanding_pages);
 
-    /*
-     * Set a claim for 4M.  This should be the only claim in the system, and
-     * show up globally.
-     */
-    rc = xc_domain_claim_pages(xch, domid, MB_PAGES(4));
+    rc = xc_availheap(xch, 0, 0, host_wide_claim ? -1 : (int)claim_test_node,
+                      &free_heap_bytes);
     if ( rc )
-        return fail("  Failed to claim 4M of RAM: %d - %s\n",
+        return fail("  Failed to query available heap: %d - %s\n",
+                    errno, strerror(errno));
+
+    free_pages = free_heap_bytes / XC_PAGE_SIZE;
+    if ( !host_wide_claim )
+    {
+        rc = get_node_free_pages(claim_test_node, &free_pages);
+        if ( rc )
+            return fail("  Failed to query free pages on node %u: %d - %s\n",
+                        claim_test_node, errno, strerror(errno));
+    }
+
+    if ( free_pages <= request_pages + 1 )
+        return fail("  Not enough free pages (%lu) to test %s claim enforcement\n",
+                    free_pages, host_wide_claim ? "host-wide" : "node");
+
+    claim_pages = free_pages - request_pages + 1;
+
+    rc = claim_call_wrapper(xch, domid, claim_pages);
+    if ( rc )
+        return fail("  Failed to claim calculated RAM amount: %d - %s\n",
                     errno, strerror(errno));
 
     rc = xc_physinfo(xch, &physinfo);
@@ -112,17 +261,51 @@ static void run_tests(void)
         return fail("  Failed to obtain physinfo: %d - %s\n",
                     errno, strerror(errno));
 
-    if ( physinfo.outstanding_pages != MB_PAGES(4) )
-        return fail("  Expected claim to be 4M, got %"PRIu64" pages\n",
-                    physinfo.outstanding_pages);
+    if ( physinfo.outstanding_pages != claim_pages )
+        return fail("  Expected claim to be %lu pages, got %"PRIu64" pages\n",
+                    claim_pages, physinfo.outstanding_pages);
+
+    {
+        uint32_t other_domid = DOMID_INVALID;
+        xen_pfn_t other_ram[] = { 0 };
+        unsigned int memflags = host_wide_claim ? 0 : XENMEMF_exact_node(claim_test_node);
+
+        rc = xc_domain_create(xch, &other_domid, &create);
+        if ( rc )
+            return fail("  Second domain create failure: %d - %s\n",
+                        errno, strerror(errno));
+
+        rc = xc_domain_setmaxmem(xch, other_domid, -1);
+        if ( rc )
+        {
+            fail("  Failed to set maxmem for second domain: %d - %s\n",
+                 errno, strerror(errno));
+            goto destroy_other;
+        }
+
+        rc = xc_domain_populate_physmap_exact(
+            xch, other_domid, ARRAY_SIZE(other_ram), CLAIM_TEST_ORDER,
+            memflags, other_ram);
+        if ( rc == 0 )
+            fail("  Expected %s claim to block second-domain allocation\n",
+                 host_wide_claim ? "host-wide" : "node");
+
+ destroy_other:
+        rc = xc_domain_destroy(xch, other_domid);
+        if ( rc )
+            return fail("  Failed to destroy second domain: %d - %s\n",
+                        errno, strerror(errno));
+    }
 
     /*
-     * Allocate 2M of RAM to the domain.  This should be deducted from global
-     * claim.
+     * Allocate one CLAIM_TEST_ORDER chunk to the domain. This should reduce
+     * the outstanding claim by request_pages. For node claims, request memory
+     * from the claimed node.
      */
     xen_pfn_t ram[] = { 0 };
     rc = xc_domain_populate_physmap_exact(
-        xch, domid, ARRAY_SIZE(ram), 9 /* Order 2M */, 0, ram);
+        xch, domid, ARRAY_SIZE(ram), CLAIM_TEST_ORDER,
+        host_wide_claim ? 0 : XENMEMF_node(claim_test_node), ram);
     if ( rc )
         return fail("  Failed to populate physmap domain: %d - %s\n",
                     errno, strerror(errno));
@@ -132,9 +315,9 @@ static void run_tests(void)
         return fail("  Failed to obtain physinfo: %d - %s\n",
                     errno, strerror(errno));
 
-    if ( physinfo.outstanding_pages != MB_PAGES(2) )
-        return fail("  Expected claim to be 2M, got %"PRIu64" pages\n",
-                    physinfo.outstanding_pages);
+    if ( physinfo.outstanding_pages != claim_pages - request_pages )
+        return fail("  Expected claim to be %lu pages, got %"PRIu64" pages\n",
+                    claim_pages - request_pages, physinfo.outstanding_pages);
 
     /*
      * Destroying the domain should release the outstanding 2M claim.
@@ -161,6 +344,8 @@ static void run_tests(void)
 int main(int argc, char **argv)
 {
     int rc;
+    unsigned int num_nodes = 0;
+    xc_meminfo_t *meminfo = NULL;
 
     printf("Memory claims tests\n");
 
@@ -169,14 +354,60 @@ int main(int argc, char **argv)
     if ( !xch )
         err(1, "xc_interface_open");
 
-    run_tests();
+    rc = xc_numainfo(xch, &num_nodes, NULL, NULL);
+    if ( rc || !num_nodes )
+        err(1, "xc_numainfo");
+
+    meminfo = calloc(num_nodes, sizeof(*meminfo));
+    if ( !meminfo )
+        err(1, "calloc");
 
-    if ( domid != DOMID_INVALID )
+    rc = xc_numainfo(xch, &num_nodes, meminfo, NULL);
+    if ( rc )
+        err(1, "xc_numainfo");
+
+    claim_test_node = 0;
+    for ( unsigned int i = 1; i < num_nodes; i++ )
     {
-        rc = xc_domain_destroy(xch, domid);
-        if ( rc )
-            fail("  Failed to destroy domain: %d - %s\n",
-                 errno, strerror(errno));
+        if ( meminfo[i].memfree > meminfo[claim_test_node].memfree )
+            claim_test_node = i;
+    }
+
+    free(meminfo);
+
+    struct {
+        claim_fn_t fn;
+        const char *name;
+        bool host_wide;
+    } tests[] = {
+        {
+            .fn = wrap_claim_pages,
+            .name = "xc_domain_claim_pages",
+            .host_wide = true,
+        },
+        {
+            .fn = wrap_claim_memory,
+            .name = "xc_domain_claim_memory",
+            .host_wide = true,
+        },
+        {
+            .fn = wrap_claim_memory_node,
+            .name = "xc_domain_claim_memory_node",
+            .host_wide = false,
+        },
+    };
+    size_t num_tests = sizeof(tests) / sizeof(tests[0]);
+    for ( size_t i = 0; i < num_tests; i++ )
+    {
+        run_test(tests[i].fn, tests[i].name, tests[i].host_wide);
+        if ( domid != DOMID_INVALID )
+        {
+            rc = xc_domain_destroy(xch, domid);
+            if ( rc )
+                fail("  Failed to destroy domain: %d - %s\n",
+                     errno, strerror(errno));
+            domid = DOMID_INVALID;
+        }
     }
 
     return !!nr_failures;
-- 
2.39.5


