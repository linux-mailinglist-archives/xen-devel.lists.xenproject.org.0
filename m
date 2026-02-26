Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MA2eLtNcoGm3igQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:46:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA851A7D40
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241933.1542759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcdI-0007IX-2W; Thu, 26 Feb 2026 14:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241933.1542759; Thu, 26 Feb 2026 14:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcdH-0007Gx-Vb; Thu, 26 Feb 2026 14:46:27 +0000
Received: by outflank-mailman (input) for mailman id 1241933;
 Thu, 26 Feb 2026 14:46:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvcdG-0007Gp-3O
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 14:46:26 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.corp.cloud.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e98830c5-1321-11f1-b164-2bf370ae4941;
 Thu, 26 Feb 2026 15:46:24 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 92CC0428FD7C;
 Thu, 26 Feb 2026 09:45:56 -0500 (EST)
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
X-Inumbo-ID: e98830c5-1321-11f1-b164-2bf370ae4941
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
Subject: [PATCH v4 04/10] xen/page_alloc: Consolidate per-node counters into avail[] array
Date: Thu, 26 Feb 2026 14:29:18 +0000
Message-Id: <4a5477e0ae26bb29d4814b2177cdd7ad746887cc.1772098423.git.bernhard.kaindl@citrix.com>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.981];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:email]
X-Rspamd-Queue-Id: 4FA851A7D40
X-Rspamd-Action: no action

Replace the static node_avail_pages[] and node_outstanding_claims[]
arrays with two extra entries in the per-node avail[] array:

  avail[node][AVAIL_NODE_TOTAL]  - total free pages on this node
  avail[node][AVAIL_NODE_CLAIMS] - outstanding claims on this node

This eliminates two MAX_NUMNODES-sized static arrays by extending the
dynamically allocated avail[] from NR_ZONES to NR_AVAIL_ENTRIES
(NR_ZONES + 2) per node.  The node_avail_pages() and
node_outstanding_claims() accessor macros now index into avail[],
keeping all call sites unchanged.

Placing the per-node totals and claims adjacent to the per-zone
counters also improves cache locality: the allocator already touches
avail[node][zone] in get_free_buddy(), so the node-level counters
checked by node_allocatable_request() are likely warm in the same
cache line, avoiding the extra line fetch the separate static arrays
would have required.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/page_alloc.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 6fc7d4cb9d40..e844c0ecf637 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -485,6 +485,18 @@ static unsigned long node_need_scrub[MAX_NUMNODES];
 
 /* avail[node][zone] is the number of free pages on that node and zone. */
 static unsigned long *avail[MAX_NUMNODES];
+/*
+ * The avail[] array has NR_ZONES entries for per-zone free page counts,
+ * plus two extra entries above NR_ZONES:
+ *   avail[node][AVAIL_NODE_TOTAL]  - total free pages on this node
+ *   avail[node][AVAIL_NODE_CLAIMS] - outstanding claims on this node
+ * This replaces the former static node_avail_pages[] and
+ * node_outstanding_claims[] arrays.
+ */
+#define AVAIL_NODE_TOTAL   NR_ZONES
+#define AVAIL_NODE_CLAIMS  (NR_ZONES + 1)
+#define NR_AVAIL_ENTRIES   (NR_ZONES + 2)
+
 /* Global available pages, updated in real-time, protected by heap_lock */
 static unsigned long total_avail_pages;
 
@@ -507,8 +519,7 @@ static DEFINE_SPINLOCK(heap_lock);
  * allocator is already serialized on it. The accessor macro abstracts the
  * storage to ease future changes (e.g. moving to per-node lock granularity).
  */
-#define node_avail_pages(node) (node_avail_pages[node])
-static unsigned long node_avail_pages[MAX_NUMNODES];
+#define node_avail_pages(node) (avail[node][AVAIL_NODE_TOTAL])
 
 /* total outstanding claims by all domains */
 static unsigned long outstanding_claims;
@@ -522,9 +533,7 @@ static unsigned long outstanding_claims;
  * a node, which are subtracted from the node's available pages to determine if
  * a request can be satisfied without violating the node's memory availability.
  */
-#define node_outstanding_claims(node) (node_outstanding_claims[node])
-/* total outstanding claims by all domains on node */
-static unsigned long node_outstanding_claims[MAX_NUMNODES];
+#define node_outstanding_claims(node) (avail[node][AVAIL_NODE_CLAIMS])
 
 /* Return available pages after subtracting claimed pages */
 static inline unsigned long available_after_claims(unsigned long avail_pages,
@@ -762,9 +771,9 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
 {
     /* First node to be discovered has its heap metadata statically alloced. */
     static heap_by_zone_and_order_t _heap_static;
-    static unsigned long avail_static[NR_ZONES];
+    static unsigned long avail_static[NR_AVAIL_ENTRIES];
     unsigned long needed = (sizeof(**_heap) +
-                            sizeof(**avail) * NR_ZONES +
+                            sizeof(**avail) * NR_AVAIL_ENTRIES +
                             PAGE_SIZE - 1) >> PAGE_SHIFT;
     int i, j;
 
@@ -782,7 +791,7 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
     {
         _heap[node] = mfn_to_virt(mfn + nr - needed);
         avail[node] = mfn_to_virt(mfn + nr - 1) +
-                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+                      PAGE_SIZE - sizeof(**avail) * NR_AVAIL_ENTRIES;
     }
     else if ( nr >= needed &&
               arch_mfns_in_directmap(mfn, needed) &&
@@ -791,7 +800,7 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
     {
         _heap[node] = mfn_to_virt(mfn);
         avail[node] = mfn_to_virt(mfn + needed - 1) +
-                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+                      PAGE_SIZE - sizeof(**avail) * NR_AVAIL_ENTRIES;
         *use_tail = false;
     }
     else if ( get_order_from_bytes(sizeof(**_heap)) ==
@@ -800,18 +809,18 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
         _heap[node] = alloc_xenheap_pages(get_order_from_pages(needed), 0);
         BUG_ON(!_heap[node]);
         avail[node] = (void *)_heap[node] + (needed << PAGE_SHIFT) -
-                      sizeof(**avail) * NR_ZONES;
+                      sizeof(**avail) * NR_AVAIL_ENTRIES;
         needed = 0;
     }
     else
     {
         _heap[node] = xmalloc(heap_by_zone_and_order_t);
-        avail[node] = xmalloc_array(unsigned long, NR_ZONES);
+        avail[node] = xmalloc_array(unsigned long, NR_AVAIL_ENTRIES);
         BUG_ON(!_heap[node] || !avail[node]);
         needed = 0;
     }
 
-    memset(avail[node], 0, NR_ZONES * sizeof(long));
+    memset(avail[node], 0, NR_AVAIL_ENTRIES * sizeof(long));
 
     for ( i = 0; i < NR_ZONES; i++ )
         for ( j = 0; j <= MAX_ORDER; j++ )
-- 
2.39.5


