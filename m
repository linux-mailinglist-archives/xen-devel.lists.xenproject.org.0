Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL3pNgxYGGoQjQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 16:58:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80ED05F40A5
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2026 16:58:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321304.1588198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScBX-0003dL-Gv; Thu, 28 May 2026 14:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321304.1588198; Thu, 28 May 2026 14:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wScBX-0003aw-Dh; Thu, 28 May 2026 14:58:11 +0000
Received: by outflank-mailman (input) for mailman id 1321304;
 Thu, 28 May 2026 14:58:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wScBV-0003Wu-NY
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 14:58:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wScBV-00AwUB-4C
 for xen-devel@lists.xenproject.org; Thu, 28 May 2026 16:58:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a1857ec-2eae-0a2a0a5409dd-0a2a450be03e-36
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:58:09 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a185800-212f-0a2a450b0019-a065830891c0-3
 for <xen-devel@lists.xenproject.org>; Thu, 28 May 2026 16:58:08 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id D1E6F4336E49;
 Thu, 28 May 2026 10:57:03 -0400 (EDT)
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
Subject: [PATCH 2/2] xen/mm: Fix off-by-one stopping tail merge in reserve_offlined_page
Date: Thu, 28 May 2026 15:55:55 +0100
Message-Id: <b177222a50bb11647589f3143b8ba9771535b7d9.1779980089.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1779980089.git.bernhard.kaindl@citrix.com>
References: <cover.1779980089.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1779980289-2007BF3B-218EF66C/0/0
X-purgate-type: clean
X-purgate-size: 4855
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.992];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: 80ED05F40A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

reserve_offlined_page() reserves pages marked for offlining and
returns free buddies from the remaining healthy tail pages back
to the free list.

Consider an order-2 buddy (4 pages) with the following layout:
+---------------+---------------+---------------+---------------+
| head page       tail page 1,    tail page 2     tail page 3   |
| PFN_ORDER(pg)   marked as to                                  |
| == 2            be offlined                                   |
+---------------+---------------+---------------+---------------+

The expected result after removing tail page 1 and returning the
remaining healthy pages to the free list would be:

+---------------+               +---------------+---------------+
| single page   | offlined page | head page       tail page     |
| PFN_ORDER(pg) | not returned  | PFN_ORDER(pg)                 |
| == 0          | to the heap   | == 1                          |
+---------------+               +---------------+---------------+

A trivial off-by-one error in the growth loop stops the growth loop
early before the tail end of the original buddy and we end up with:

+---------------+               +---------------+---------------+
| single page   | offlined page | single page   | single page   |
| PFN_ORDER(pg) | not returned  | PFN_ORDER(pg) | PFN_ORDER(pg) |
| == 0          | to the heap   | == 0          | == 0          |
+---------------+               +---------------+---------------+

If the offlined page was in a much larger buddy, this would lead
to much more memory not available for higher order allocations
requiring the full tail end of the original buddy for allocation.

Fix the growth loop to correctly grow the buddy to the tail end
to make the full allocation unit available for future allocation
and update the test case to confirm the expected result and to
prevent regressions in the future.

Update the test case to verify the fix and prevent future regressions.

Fixes: e4865c2315 ('Page offline support in Xen side')
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/tests/native/offline-merge-tail.c | 8 +-------
 xen/common/page_alloc.c                 | 4 +++-
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/tools/tests/native/offline-merge-tail.c b/tools/tests/native/offline-merge-tail.c
index 11c79e3ecc1b..1893b23c7249 100644
--- a/tools/tests/native/offline-merge-tail.c
+++ b/tools/tests/native/offline-merge-tail.c
@@ -53,11 +53,7 @@ static void test_merge_tail_pair(int start_mfn)
      * Offlining page 1 results in splitting the original order-2 buddy into:
      * - pages[0] as an order-0 buddy
      * - pages[1] is the offlined page, removed from the free list
-     * - pages[2] as an order-0 buddy
-     * - pages[3] as an order-0 buddy:
-     * +---------------+               +---------------+---------------+
-     * | single page   | offlined page | single page   | single page   |
-     * +---------------+               +---------------+---------------+
+     * - pages[2] and pages[3] as an unaligned order-1 buddy
      *
      * Tail 2 & 3 are aligned, so they should be merged into an order-1 buddy:
      * +---------------+               +---------------+---------------+
@@ -71,14 +67,12 @@ static void test_merge_tail_pair(int start_mfn)
     ASSERT(pages[1].u.free.first_dirty == INVALID_DIRTY_IDX);
 
     /* The tail pair is expected to be merged into one order-1 buddy. */
-    EXPECT_FAIL_BEGIN();
     CHECK(PFN_ORDER(&pages[2]) == 1,
           "The pair of tail pages should be merged into an order-1 buddy");
     CHECK(pages[2].u.free.first_dirty == 1, "In tail buddy, the 2nd is dirty");
     /* The tail page of the merged buddy does not use first_dirty. */
     CHECK(pages[3].u.free.first_dirty == INVALID_DIRTY_IDX,
           "Tail page of the merged buddy should not set first_dirty");
-    EXPECT_FAIL_END(3);
 }
 
 int main(int argc, char *argv[])
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index d923ae02ade0..dd0b7c67008d 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1427,11 +1427,13 @@ static int reserve_offlined_page(struct page_info *head)
 
         next_order = cur_order = 0;
 
+        /* Attempt to grow the order (size) of the buddy as much as possible. */
         while ( cur_order < head_order )
         {
             next_order = cur_order + 1;
 
-            if ( (cur_head + (1 << next_order)) >= (head + ( 1 << head_order)) )
+            /* Do not grow to next_order if it would go beyond the buddy. */
+            if ( (cur_head + (1 << next_order)) > (head + ( 1 << head_order)) )
                 goto merge;
 
             /* Do not grow to next_order if cur_head is not aligned to it. */
-- 
2.39.5


