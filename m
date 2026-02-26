Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACjBOWVboGm3igQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:40:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 999BF1A7BED
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:40:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241883.1542739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcXP-00068z-57; Thu, 26 Feb 2026 14:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241883.1542739; Thu, 26 Feb 2026 14:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcXP-00066k-21; Thu, 26 Feb 2026 14:40:23 +0000
Received: by outflank-mailman (input) for mailman id 1241883;
 Thu, 26 Feb 2026 14:40:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvcXN-00066e-Bc
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 14:40:21 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b3f6573-1321-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 15:40:15 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id CAC93428FD52;
 Thu, 26 Feb 2026 09:39:24 -0500 (EST)
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
X-Inumbo-ID: 0b3f6573-1321-11f1-9ccf-f158ae23cfc8
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
Subject: [PATCH v4 02/10] xen/page_alloc: Optimize getting per-NUMA-node free page counts
Date: Thu, 26 Feb 2026 14:29:16 +0000
Message-Id: <c56658d1248660543fdba162810b0629c081bd94.1772098423.git.bernhard.kaindl@citrix.com>
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
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:alejandro.vallejo@cloud.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.980];
	RCVD_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: 999BF1A7BED
X-Rspamd-Action: no action

From: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Add per-node free page counters (node_avail_pages[]), protected by
heap_lock, updated in real-time in lockstep with total_avail_pages
as pages are allocated and freed.

This replaces the avail_heap_pages() loop over all online nodes and
zones in avail_node_heap_pages() with a direct O(1) array lookup,
making it efficient to get the total free pages for a given NUMA node.

The per-node counts are currently provided using sysctl for NUMA
placement decisions of domain builders and monitoring, and for
debugging with the debug-key 'u' to print NUMA info to the printk buffer.

They will also be used for checking if a NUMA node may be able to
satisfy a NUMA-node-specific allocation by comparing node availability
against node-specific claims before looking for pages in the zones
of the node.

Also change total_avail_pages and outstanding_claims to unsigned long:

Those never become negative (we protect that with ASSERT/BUG_ON already),
and converting them to unsigned long makes that explicit, and also
fixes signed/unsigned comparison warnings.

This only needs moving the ASSERT to before the subtraction.
See the previous commit moving the BUG_ON for outstanding_claims.

This lays the groundwork for implementing per-node claims.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/page_alloc.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 6f7f30c64605..2176cb113fe2 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -483,11 +483,32 @@ static heap_by_zone_and_order_t *_heap[MAX_NUMNODES];
 
 static unsigned long node_need_scrub[MAX_NUMNODES];
 
+/* avail[node][zone] is the number of free pages on that node and zone. */
 static unsigned long *avail[MAX_NUMNODES];
-static long total_avail_pages;
+/* Global available pages, updated in real-time, protected by heap_lock */
+static unsigned long total_avail_pages;
 
+/* The global heap lock, protecting access to the heap and related structures */
 static DEFINE_SPINLOCK(heap_lock);
-static long outstanding_claims; /* total outstanding claims by all domains */
+
+/*
+ * Per-node count of available pages, protected by heap_lock, updated in
+ * lockstep with total_avail_pages as pages are allocated and freed.
+ *
+ * Each entry holds the sum of avail[node][zone] across all zones, used for
+ * efficiently checking node-local availability for allocation requests.
+ * Also provided via sysctl for NUMA placement decisions of domain builders
+ * and monitoring, and logged with debug-key 'u' for NUMA debugging.
+ *
+ * Maintaining this under heap_lock does not reduce scalability, as the
+ * allocator is already serialized on it. The accessor macro abstracts the
+ * storage to ease future changes (e.g. moving to per-node lock granularity).
+ */
+#define node_avail_pages(node) (node_avail_pages[node])
+static unsigned long node_avail_pages[MAX_NUMNODES];
+
+/* total outstanding claims by all domains */
+static unsigned long outstanding_claims;
 
 static unsigned long avail_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi, unsigned int node)
@@ -1072,8 +1093,10 @@ static struct page_info *alloc_heap_pages(
 
     ASSERT(avail[node][zone] >= request);
     avail[node][zone] -= request;
+    ASSERT(node_avail_pages(node) >= request);
+    node_avail_pages(node) -= request;
+    ASSERT(total_avail_pages >= request);
     total_avail_pages -= request;
-    ASSERT(total_avail_pages >= 0);
 
     if ( !(memflags & MEMF_no_refcount) )
         consume_outstanding_claims(d, request);
@@ -1235,8 +1258,10 @@ static int reserve_offlined_page(struct page_info *head)
             continue;
 
         avail[node][zone]--;
+        ASSERT(node_avail_pages(node) > 0);
+        node_avail_pages(node)--;
+        ASSERT(total_avail_pages > 0);
         total_avail_pages--;
-        ASSERT(total_avail_pages >= 0);
 
         page_list_add_tail(cur_head,
                            test_bit(_PGC_broken, &cur_head->count_info) ?
@@ -1559,6 +1584,7 @@ static void free_heap_pages(
     }
 
     avail[node][zone] += 1 << order;
+    node_avail_pages(node) += 1 << order;
     total_avail_pages += 1 << order;
     if ( need_scrub )
     {
@@ -2816,7 +2842,7 @@ unsigned long avail_domheap_pages_region(
 
 unsigned long avail_node_heap_pages(unsigned int nodeid)
 {
-    return avail_heap_pages(MEMZONE_XEN, NR_ZONES -1, nodeid);
+    return node_avail_pages(nodeid);
 }
 
 
-- 
2.39.5


