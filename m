Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG37MJlA3mlvpwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 15:26:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E873FA7AE
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 15:26:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281823.1564660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCdmn-00025R-3O; Tue, 14 Apr 2026 13:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281823.1564660; Tue, 14 Apr 2026 13:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCdmn-00023z-0N; Tue, 14 Apr 2026 13:26:37 +0000
Received: by outflank-mailman (input) for mailman id 1281823;
 Tue, 14 Apr 2026 13:26:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wCdml-00023r-K7
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 13:26:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCdmk-00GLlP-Ve
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 15:26:35 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69de407e-bab6-0a2a0a5309dd-0a2a4506d774-42
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 15:26:34 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69de4089-0df0-0a2a45060019-a06583088930-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 15:26:34 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 9FBB6424A7AA;
 Tue, 14 Apr 2026 09:25:50 -0400 (EDT)
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v6 3/7] xen/mm: Optimise getting free page counts per NUMA node
Date: Tue, 14 Apr 2026 14:22:47 +0100
Message-Id: <a205d6fbffca96889e63f3359e8d86eba3fd667d.1776172526.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1776172526.git.bernhard.kaindl@citrix.com>
References: <cover.1776172526.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1776173194-5DB2B3D8-A3F06007/0/0
X-purgate-type: clean
X-purgate-size: 3131
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:alejandro.vallejo@cloud.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.912];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: 77E873FA7AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Introduce per-node free page counters to improve the efficiency of
avail_node_heap_pages():

- It no longer needs to iterate over all zones in a node.

- It is used by the numainfo hypercall and the debug key 'u' to display
  NUMA information in the printk buffer.

- It will also be needed by node-specific claims to determine the
  number of free pages in a node in the hot path of get_free_buddy()
  without looping over all zones.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

---

Applied Jan's review:
https://lists.xenproject.org/archives/html/xen-devel/2026-03/msg00144.html

Changes:
- Removed accessor macro
- Abandoned conversion to unsigned long
---
 xen/common/page_alloc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index a67839413319..28c424072d25 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -485,7 +485,20 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
 
 static unsigned long *avail[MAX_NUMNODES];
 static long total_avail_pages;
+/*
+ * Sum of the free pages in all zones of that node.
+ * Provided via sysctl by NUMA node placement decisions of domain builders and
+ * for monitoring. It is also logged with debug-key 'u' for NUMA debugging.
+ */
+static long node_avail_pages[MAX_NUMNODES];
 
+/*
+ * The global heap lock, protecting access to the heap and related structures.
+ * It protects the heap and claims of the buddy allocator and d->*claims.
+ * The locking order is: d->page_alloc_lock (optional) -> heap_lock
+ * - Numerous external callers holding d->page_alloc_lock call functions
+ *   taking the heap_lock. Note: Violating it would cause an ABBA deadlock.
+ */
 static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
 
@@ -1092,6 +1105,8 @@ static struct page_info *alloc_heap_pages(
         }
     }
 
+    ASSERT(node_avail_pages[node] >= request);
+    node_avail_pages[node] -= request;
     ASSERT(avail[node][zone] >= request);
     avail[node][zone] -= request;
     total_avail_pages -= request;
@@ -1282,6 +1297,7 @@ static int reserve_offlined_page(struct page_info *head)
         if ( !page_state_is(cur_head, offlined) )
             continue;
 
+        node_avail_pages[node]--;
         avail[node][zone]--;
         total_avail_pages--;
         ASSERT(total_avail_pages >= 0);
@@ -1606,6 +1622,7 @@ static void free_heap_pages(
         }
     }
 
+    node_avail_pages[node] += 1 << order;
     avail[node][zone] += 1 << order;
     total_avail_pages += 1 << order;
     if ( need_scrub )
@@ -2873,7 +2890,7 @@ unsigned long avail_domheap_pages_region(
 
 unsigned long avail_node_heap_pages(unsigned int nodeid)
 {
-    return avail_heap_pages(MEMZONE_XEN, NR_ZONES -1, nodeid);
+    return node_avail_pages[nodeid];
 }
 
 
-- 
2.39.5


