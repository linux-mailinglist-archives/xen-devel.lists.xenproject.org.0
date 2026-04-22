Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id l/2bM/rq6GkGRwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 17:36:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E0447F87
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 17:36:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290771.1570274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFZcI-0007do-Ki; Wed, 22 Apr 2026 15:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290771.1570274; Wed, 22 Apr 2026 15:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFZcI-0007bP-HO; Wed, 22 Apr 2026 15:35:54 +0000
Received: by outflank-mailman (input) for mailman id 1290771;
 Wed, 22 Apr 2026 15:35:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wFZcH-0007bJ-2E
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:35:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFZcG-000yiV-Ed
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 17:35:52 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e8ead4-5cb7-0a2a0a5109dd-0a2a450ccc52-2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 17:35:52 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69e8ead7-62f1-0a2a450c0019-a0658308dfdc-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 17:35:52 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 84C56429A6B6;
 Wed, 22 Apr 2026 11:35:04 -0400 (EDT)
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
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/1] xen/mm: normalize page count types to unsigned long
Date: Wed, 22 Apr 2026 16:33:23 +0100
Message-Id: <6fd2be46d934688b19b5c84c53c745230cd345d6.1776871968.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1776872152-F48F9CF5-A9757B97/0/0
X-purgate-type: clean
X-purgate-size: 2296
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.689];
	RCVD_COUNT_SEVEN(0.00)[9];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 6D2E0447F87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current use of long for total_avail_pages and outstanding_claims
creates an unnecessary mix of signed and unsigned types during page
allocation calculations. This necessitates awkward constructs
like '+ 0UL' to satisfy type matching in macros such as min().

Address this by normalizing `total_avail_pages` and `outstanding_claims`
from `long` to `unsigned long`.

As a direct consequence of making `total_avail_pages` unsigned, the
post-decrement assertions checking for `>= 0` are no longer logically
sound. Adjust those assertions to pre-decrement checks.

No functional change intended.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/page_alloc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index b1edef87124f..541a2171c4c5 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -484,10 +484,11 @@ static heap_by_zone_and_order_t *_heap[MAX_NUMNODES];
 static unsigned long node_need_scrub[MAX_NUMNODES];
 
 static unsigned long *avail[MAX_NUMNODES];
-static long total_avail_pages;
+static unsigned long total_avail_pages;
 
 static DEFINE_SPINLOCK(heap_lock);
-static long outstanding_claims; /* total outstanding claims by all domains */
+/* total outstanding claims by all domains */
+static unsigned long outstanding_claims;
 
 static unsigned long avail_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi, unsigned int node)
@@ -1047,8 +1048,8 @@ static struct page_info *alloc_heap_pages(
 
     ASSERT(avail[node][zone] >= request);
     avail[node][zone] -= request;
+    ASSERT(total_avail_pages >= request);
     total_avail_pages -= request;
-    ASSERT(total_avail_pages >= 0);
 
     if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
     {
@@ -1240,8 +1241,8 @@ static int reserve_offlined_page(struct page_info *head)
             continue;
 
         avail[node][zone]--;
+        ASSERT(total_avail_pages > 0);
         total_avail_pages--;
-        ASSERT(total_avail_pages >= 0);
 
         page_list_add_tail(cur_head,
                            test_bit(_PGC_broken, &cur_head->count_info) ?
-- 
2.39.5


