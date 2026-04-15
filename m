Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL4ZG73P32m4ZAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 19:49:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 173ED406E7C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 19:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282759.1565245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4Ms-0002aG-Ce; Wed, 15 Apr 2026 17:49:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282759.1565245; Wed, 15 Apr 2026 17:49:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD4Ms-0002Xr-9Q; Wed, 15 Apr 2026 17:49:38 +0000
Received: by outflank-mailman (input) for mailman id 1282759;
 Wed, 15 Apr 2026 17:49:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wD4Mr-0002Xj-5i
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 17:49:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD4Mp-00BPMT-0q
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 19:49:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69dfcfab-2eae-0a2a0a5409dd-0a2a450a9636-6
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:49:36 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69dfcfaf-ee98-0a2a450a0019-a0658309cb08-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 19:49:36 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 063EE81BB9DF;
 Wed, 15 Apr 2026 13:48:41 -0400 (EDT)
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
Subject: [PATCH 3/4] tools/tests/alloc: Add tests for offlining with claims present
Date: Wed, 15 Apr 2026 18:34:58 +0100
Message-Id: <84f126a27ba8035601777e8cdb0d5d0a6a337c51.1776273656.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1776273656.git.bernhard.kaindl@citrix.com>
References: <cover.1776273656.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1776275376-C461F0B1-D5967C0C/0/0
X-purgate-type: clean
X-purgate-size: 4750
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
	NEURAL_HAM(-0.00)[-0.658];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_FORWARDING(0.00)[]
X-Rspamd-Queue-Id: 173ED406E7C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add an integration test for offlining pages with outstanding claims.
The test offlines two pages, with the second offline operation
recalling one claim to prevent over-claiming beyond the available
memory. Due to missing checks in the offlining code, there are
expected failures which will be fixed in a test-driven manner.

Run this test with both global claims and node-local claims.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/alloc/test-offlining-claims.c | 106 ++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 tools/tests/alloc/test-offlining-claims.c

diff --git a/tools/tests/alloc/test-offlining-claims.c b/tools/tests/alloc/test-offlining-claims.c
new file mode 100644
index 000000000000..d22d270ceeb4
--- /dev/null
+++ b/tools/tests/alloc/test-offlining-claims.c
@@ -0,0 +1,106 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Integration test for offlining pages with outstanding claims in page_alloc.c.
+ *
+ * Copyright (C) 2026 Cloud Software Group
+ */
+
+/* Enable sysctl support in page_alloc.c for testing get_outstanding_claims() */
+#define CONFIG_SYSCTL
+#define CONFIG_NUMA
+#include "libtest-page_alloc.h"
+
+/*
+ * Claim 3 of 4 pages globally, offline two pages, and the 2nd offline should
+ * recall one claim to prevent over-claiming beyond the available memory.
+ *
+ * As part of offline_page(), reserve_offlined_page() should recall the
+ * needed claims to not exceed the number of pages that are are remaining.
+ */
+static void test_offlining_with_global_claims(int mfn)
+{
+    struct page_info *page = test_pages + mfn;
+    uint32_t status = 0;
+    memory_claim_t claims[1] = {
+        {.pages = 3, .target = XEN_DOMCTL_CLAIM_MEMORY_GLOBAL}
+    };
+
+    /* PREPARE */
+    test_page_list_add_buddy(page, order2); /* Add a buddy with 4 free pages*/
+    ASSERT(domain_install_claim_set(dom1, ARRAY_SIZE(claims), claims) == 0);
+    offline_page(mfn + 3, 0, &status); /* Offline the 1st page */
+    ASSERT(status & PG_OFFLINE_OFFLINED);
+    CHECK(TOTAL_CLAIMS == 3, "Still 3 claims before offlining the 2nd page");
+
+    /* ACT */
+    /* Offlining the 2nd page must reduce the free pages and claims to 2 */
+    status = 0;
+    offline_page(mfn + 1, 0, &status); /* Offline the 2nd page */
+    ASSERT(status & PG_OFFLINE_OFFLINED);
+
+    /* ASSERT */
+    CHECK_BUDDY(page, "After offlining the 2nd page");
+    CHECK(FREE_PAGES == 2, "Expect 2 free pages after offlining two pages");
+    EXPECTED_TO_FAIL_BEGIN();
+    CHECK(TOTAL_CLAIMS == 2, "Expect 2 claims after offlining two pages");
+    EXPECTED_TO_FAIL_END(1);
+}
+
+
+/*
+ * Claim 3 of 4 pages on node0, offline two pages, and the 2nd offline should
+ * recall one claim to prevent over-claiming beyond the available memory.
+ *
+ * As part of offline_page(), reserve_offlined_page() should recall the
+ * needed claims to not exceed the number of pages that are are remaining.
+ */
+static void test_offlining_with_node_claims(int mfn)
+{
+    struct page_info *page = test_pages + mfn;
+    uint32_t status = 0;
+    memory_claim_t claims[1] = { {.pages = 3, .target = node0} };
+
+    /* PREPARE */
+    test_page_list_add_buddy(page, order2); /* Add a buddy with 4 free pages*/
+    ASSERT(domain_install_claim_set(dom1, ARRAY_SIZE(claims), claims) == 0);
+    ASSERT(offline_page(mfn + 3, 0, &status) == 0); /* Offline the 1st page */
+    ASSERT(status & PG_OFFLINE_OFFLINED);
+    CHECK(TOTAL_CLAIMS == 3, "Still 3 claims before offlining the 2nd page");
+
+    /* ACT */
+    /* Offlining the 2nd page must reduce the free pages and claims to 2 */
+    ASSERT(offline_page(mfn + 1, 0, &status) == 0); /* Offline the 2nd page */
+    ASSERT(status & PG_OFFLINE_OFFLINED);
+
+    /* ASSERT */
+    CHECK_BUDDY(page, "After offlining the 2nd page");
+    CHECK(FREE_PAGES == 2, "Expect 2 free pages after offlining two pages");
+    EXPECTED_TO_FAIL_BEGIN();
+    CHECK(TOTAL_CLAIMS == 2, "Expect 2 claims after offlining two pages");
+    EXPECTED_TO_FAIL_END(1);
+}
+
+int main(int argc, char *argv[])
+{
+    const char *topic = "Test offlining with memory claims";
+    const char *program_name = parse_args(argc, argv, topic);
+
+    if ( !program_name )
+        return EXIT_FAILURE;
+
+    init_page_alloc_tests();
+
+    RUN_TESTCASE(OWGC, test_offlining_with_global_claims, 0);
+    RUN_TESTCASE(OWNC, test_offlining_with_node_claims, 0);
+
+    return testcase_print_summary(program_name);
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


