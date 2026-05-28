Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCC8BL9YGGoQjQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 17:01:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30FC5F4127
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 17:01:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321372.1588216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScEN-00060v-5E; Thu, 28 May 2026 15:01:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321372.1588216; Thu, 28 May 2026 15:01:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScEN-0005yG-24; Thu, 28 May 2026 15:01:07 +0000
Received: by outflank-mailman (input) for mailman id 1321372;
 Thu, 28 May 2026 15:01:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wScEL-0005xo-J0
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 15:01:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wScEK-002dXk-W0
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 17:01:04 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1858a3-e002-0a2a0a5209dd-0a2a450ad99c-40
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 17:01:04 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1858b0-56b3-0a2a450a0019-a0658308c180-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 17:01:04 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id C43A04347081;
 Thu, 28 May 2026 10:59:59 -0400 (EDT)
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
Subject: [PATCH 2/2] xen/mm: reset PFN_ORDER for offlined buddy heads
Date: Thu, 28 May 2026 15:58:21 +0100
Message-Id: <9ffee13184b4499218fc80544bd3ee1a06aa2898.1779980244.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1779980244.git.bernhard.kaindl@citrix.com>
References: <cover.1779980244.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779980464-729768B7-38A19B42/0/0
X-purgate-type: clean
X-purgate-size: 2985
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[citrix.com:query timed out];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: F30FC5F4127
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure offlined buddy head pages are annotated as order-0 pages.

When a buddy containing pages marked for offlining is processed,
reserve_offlined_page() rebuilds any surviving healthy buddies
and moves the offlined subpages onto the offlined lists.

If the buddy head itself is offlined it was previously left
annotated with the original buddy order even though it has
been split into a single page.

This has no functional impact as the order of an offlined
page is not used for any decision making and onlining, but
it is misleading when inspecting the page's metadata.

Reset PFN_ORDER(cur_head) to 0 for an offlined buddy head
when moving it to the offlined list so the page's stored
order reflects its actual size.

Also update the regression test to assert the consistent
behavior.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/native/offline-head-order.c | 8 --------
 xen/common/page_alloc.c                 | 7 +++++++
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/tools/tests/native/offline-head-order.c b/tools/tests/native/offline-head-order.c
index 5c666a319523..5239fc34518f 100644
--- a/tools/tests/native/offline-head-order.c
+++ b/tools/tests/native/offline-head-order.c
@@ -40,9 +40,7 @@ static void test_offline_head_order(int start_mfn)
     ASSERT(status == PG_OFFLINE_STATUS_OFFLINED);
 
     /* Check the order of the offlined head page. */
-    EXPECT_FAIL_BEGIN(); /* PFN_ORDER(page) should 0, but is still 1 */
     ASSERT(PFN_ORDER(page) == 0);
-    EXPECT_FAIL_END(1);
 
     /*
      * Allocate the successor page of the offlined page. This prevents
@@ -52,12 +50,6 @@ static void test_offline_head_order(int start_mfn)
     ASSERT(pg == page + 1);
     ASSERT(FREE_PAGES == 0);
 
-    /*
-     * The order of the split head page is still 1. Online the page again to
-     * confirm that onlining it causes the order to be corrected to 0.
-     */
-    ASSERT(PFN_ORDER(page) == 1);
-
     /* Online the offlined former head page. */
     ASSERT(online_page(page_to_mfn(page), &status) == 0);
     ASSERT(status & PG_ONLINE_ONLINED);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index dd0b7c67008d..1801afc96a0a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1485,6 +1485,13 @@ static int reserve_offlined_page(struct page_info *head)
         ASSERT(node_avail_pages[node] > 0);
         node_avail_pages[node]--;
 
+        /*
+         * All offlined pages are standalone pages: If this offlined page was
+         * the head of a higher-order buddy, we need to reset its order to 0:
+         */
+        if ( cur_head == head && head_order != 0 )
+            PFN_ORDER(cur_head) = 0;
+
         page_list_add_tail(cur_head,
                            test_bit(_PGC_broken, &cur_head->count_info) ?
                            &page_broken_list : &page_offlined_list);
-- 
2.39.5


