Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCEZACJcoGm3igQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:43:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5737A1A7CA0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Feb 2026 15:43:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241908.1542750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcaL-0006hO-J5; Thu, 26 Feb 2026 14:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241908.1542750; Thu, 26 Feb 2026 14:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvcaL-0006eR-El; Thu, 26 Feb 2026 14:43:25 +0000
Received: by outflank-mailman (input) for mailman id 1241908;
 Thu, 26 Feb 2026 14:43:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgwr=A6=citrix.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1vvcaK-0006eL-7v
 for xen-devel@lists.xenproject.org; Thu, 26 Feb 2026 14:43:24 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b97fbed-1321-11f1-9ccf-f158ae23cfc8;
 Thu, 26 Feb 2026 15:43:16 +0100 (CET)
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 4A509428FD66;
 Thu, 26 Feb 2026 09:42:54 -0500 (EST)
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
X-Inumbo-ID: 7b97fbed-1321-11f1-9ccf-f158ae23cfc8
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
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Marcus Granado <marcus.granado@citrix.com>
Subject: [PATCH v4 03/10] xen/page_alloc: Implement NUMA-node-specific claims
Date: Thu, 26 Feb 2026 14:29:17 +0000
Message-Id: <6927e45bf7c2ce56b8849c16a2024edb86034358.1772098423.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1772098423.git.bernhard.kaindl@citrix.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:alejandro.vallejo@cloud.com,m:marcus.granado@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER_FORWARDING(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.990];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,cloud.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 5737A1A7CA0
X-Rspamd-Action: no action

Extend the domain memory claims infrastructure to optionally target
a NUMA node, preserving backward compatibility for existing callers.

Based on the design by Alejandro Vallejo with critical design changes
by Roger Pau Monné and me, including suggestions by Marcus Granado.

Overview:

- Add tracking of per-node claims
- Add tracking of the node of a claim in d->claim_node
- Add per-node claims to domain_set_outstanding_pages()
- Add per-node claims to consume_outstanding_claims()
- Add per-node claims to release_outstanding_claims()
- Add protecting per-node claims to get_free_buddy()
- Update host claim protection to include both claimed and free pages

Helper functions for claims:

- available_after_claims() gives the pages avaiable after outstanding claims

- host_allocatable_request() updates the check for globale memory to combine
  d->outstanding_claims with the free pages when permittign an allocation.

- node_allocatable_request() is used in get_free_buddy() to enforce
  per-node claim protection and skip to the next node if insufficient.

Cross-node claim preservation (alloc_node != d->claim_node):

- When allocating with alloc_node != d->claim_node, preserve the claim
  unless d would exceed d->max_pages, in which case consume just enough
  to stay within d->max_pages to not book excess memory to the domain.

Update the existing callers of domain_set_outstanding_pages() (domain_kill
and XENMEM_claim_pages) to pass NUMA_NO_NODE for backward compatibility.

This lays the groundwork for a NUMA claims hypercall.

Suggested-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Suggested-by: Marcus Granado <marcus.granado@citrix.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/domain.c     |   3 +-
 xen/common/memory.c     |   3 +-
 xen/common/page_alloc.c | 147 ++++++++++++++++++++++++++++++++++++----
 xen/include/xen/mm.h    |   4 +-
 xen/include/xen/sched.h |   1 +
 5 files changed, 140 insertions(+), 18 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 2e46207d2db0..e7861259a2b3 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -944,6 +944,7 @@ struct domain *domain_create(domid_t domid,
     spin_lock_init(&d->node_affinity_lock);
     d->node_affinity = NODE_MASK_ALL;
     d->auto_node_affinity = 1;
+    d->claim_node = NUMA_NO_NODE;
 
     spin_lock_init(&d->shutdown_lock);
     d->shutdown_code = SHUTDOWN_CODE_INVALID;
@@ -1311,7 +1312,7 @@ int domain_kill(struct domain *d)
         rspin_barrier(&d->domain_lock);
         argo_destroy(d);
         vnuma_destroy(d->vnuma);
-        domain_set_outstanding_pages(d, 0);
+        domain_set_outstanding_pages(d, 0, NUMA_NO_NODE);
         /* fallthrough */
     case DOMDYING_dying:
         rc = domain_teardown(d);
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 918510f287a0..85e242ad9e61 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1798,7 +1798,8 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             rc = -EINVAL;
 
         if ( !rc )
-            rc = domain_set_outstanding_pages(d, reservation.nr_extents);
+            rc = domain_set_outstanding_pages(d, reservation.nr_extents,
+                                              NUMA_NO_NODE);
 
         rcu_unlock_domain(d);
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2176cb113fe2..6fc7d4cb9d40 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -488,7 +488,10 @@ static unsigned long *avail[MAX_NUMNODES];
 /* Global available pages, updated in real-time, protected by heap_lock */
 static unsigned long total_avail_pages;
 
-/* The global heap lock, protecting access to the heap and related structures */
+/*
+ * The global heap lock, protecting access to the heap and related structures
+ * It protects the heap and claims, d->outstanding_pages and d->claim_node
+ */
 static DEFINE_SPINLOCK(heap_lock);
 
 /*
@@ -510,6 +513,71 @@ static unsigned long node_avail_pages[MAX_NUMNODES];
 /* total outstanding claims by all domains */
 static unsigned long outstanding_claims;
 
+/*
+ * Per-node accessor for outstanding claims, protected by heap_lock, updated
+ * in lockstep with the global outstanding_claims and d->outstanding_pages
+ * in domain_set_outstanding_pages() and release_outstanding_claims().
+ *
+ * node_outstanding_claims(node) is used to determine the outstanding claims on
+ * a node, which are subtracted from the node's available pages to determine if
+ * a request can be satisfied without violating the node's memory availability.
+ */
+#define node_outstanding_claims(node) (node_outstanding_claims[node])
+/* total outstanding claims by all domains on node */
+static unsigned long node_outstanding_claims[MAX_NUMNODES];
+
+/* Return available pages after subtracting claimed pages */
+static inline unsigned long available_after_claims(unsigned long avail_pages,
+                                                   unsigned long claims)
+{
+    BUG_ON(claims > avail_pages);
+    return avail_pages - claims; /* Due to the BUG_ON, it cannot be negative */
+}
+
+/* Answer if host-level memory and claims permit this request to proceed */
+static inline bool host_allocatable_request(const struct domain *d,
+                                            unsigned int memflags,
+                                            unsigned long request)
+{
+    unsigned long allocatable_pages;
+
+    ASSERT(spin_is_locked(&heap_lock));
+
+    allocatable_pages = available_after_claims(total_avail_pages,
+                                               outstanding_claims);
+    if ( allocatable_pages >= request )
+        return true; /* The not claimed pages are enough to proceed */
+
+    if ( !d || (memflags & MEMF_no_refcount) )
+        return false; /* Claims are not available for this allocation */
+
+    /* The domain's claims are available, return true if sufficient */
+    return request <= allocatable_pages + d->outstanding_pages;
+}
+
+/* Answer if node-level memory and claims permit this request to proceed */
+static inline bool node_allocatable_request(const struct domain *d,
+                                            unsigned int memflags,
+                                            unsigned long request,
+                                            nodeid_t node)
+{
+    unsigned long allocatable_pages;
+
+    ASSERT(spin_is_locked(&heap_lock));
+    ASSERT(node < MAX_NUMNODES);
+
+    allocatable_pages = available_after_claims(node_avail_pages(node),
+                                               node_outstanding_claims(node));
+    if ( allocatable_pages >= request )
+        return true; /* The not claimed pages are enough to proceed */
+
+    if ( !d || (memflags & MEMF_no_refcount) || (node != d->claim_node) )
+        return false; /* Claims are not available for this allocation */
+
+    /* The domain's claims are available, return true if sufficient */
+    return request <= allocatable_pages + d->outstanding_pages;
+}
+
 static unsigned long avail_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi, unsigned int node)
 {
@@ -539,14 +607,23 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
     return d->tot_pages;
 }
 
-/* Release outstanding claims on the domain, host and later also node */
+/* Release outstanding claims on the domain, host and node */
 static inline
 void release_outstanding_claims(struct domain *d, unsigned long release)
 {
     ASSERT(spin_is_locked(&heap_lock));
     BUG_ON(outstanding_claims < release);
     outstanding_claims -= release;
+
+    if ( d->claim_node != NUMA_NO_NODE )
+    {
+        BUG_ON(node_outstanding_claims(d->claim_node) < release);
+        node_outstanding_claims(d->claim_node) -= release;
+    }
     d->outstanding_pages -= release;
+
+    if ( d->outstanding_pages == 0 )
+        d->claim_node = NUMA_NO_NODE; /* Clear if no outstanding pages left */
 }
 
 /*
@@ -556,7 +633,8 @@ void release_outstanding_claims(struct domain *d, unsigned long release)
  * domain build and d is destroyed if the build fails, this has no significance.
  */
 static inline
-void consume_outstanding_claims(struct domain *d, unsigned long allocation)
+void consume_outstanding_claims(struct domain *d, unsigned long allocation,
+                                nodeid_t alloc_node)
 {
     if ( !d || !d->outstanding_pages )
         return;
@@ -564,14 +642,41 @@ void consume_outstanding_claims(struct domain *d, unsigned long allocation)
 
     /* Of course, the domain can only release up its outstanding claims */
     allocation = min(allocation, d->outstanding_pages + 0UL);
+
+    if ( d->claim_node != NUMA_NO_NODE && d->claim_node != alloc_node )
+    {
+        /*
+         * The domain has a claim on a node, but the alloc is on a different
+         * node. If it would exceed the domain's max_pages, reduce the claim
+         * up to the excess over max_pages so we don't reduce the claim more
+         * than we have to to honor the max_pages limit.
+         */
+        unsigned long booked_pages = domain_tot_pages(d) + allocation +
+                                     d->outstanding_pages;
+        if ( booked_pages <= d->max_pages )
+            return; /* booked is within max_pages, no excess, keep the claim */
+
+        /* Excess detected, release the exceeding pages from the claimed node */
+        allocation = min(allocation, booked_pages - d->max_pages);
+    }
     release_outstanding_claims(d, allocation);
 }
 
-int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
+/*
+ * Update outstanding claims for the domain. Note: The node is passed as an
+ * unsigned int to allow checking for overflow above the uint8_t nodeid_t limit.
+ */
+int domain_set_outstanding_pages(struct domain *d, unsigned long pages,
+                                 unsigned int node)
 {
     int ret = -ENOMEM;
     unsigned long claim, avail_pages;
 
+    /* When releasing a claim, the node must be NUMA_NO_NODE (it is not used) */
+    if ( pages == 0 && node != NUMA_NO_NODE )
+        return -EINVAL;
+    if ( node != NUMA_NO_NODE && (node >= MAX_NUMNODES || !node_online(node)) )
+        return -ENOENT;
     /*
      * Two locks are needed here:
      *  - d->page_alloc_lock: protects accesses to d->{tot,max,extra}_pages.
@@ -604,9 +709,12 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
     }
 
     /* how much memory is available? */
-    avail_pages = total_avail_pages;
-
-    avail_pages -= outstanding_claims;
+    if ( node == NUMA_NO_NODE )
+        avail_pages = available_after_claims(total_avail_pages,
+                                             outstanding_claims);
+    else
+        avail_pages = available_after_claims(node_avail_pages(node),
+                                             node_outstanding_claims(node));
 
     /*
      * Note, if domain has already allocated memory before making a claim
@@ -619,6 +727,11 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
     /* yay, claim fits in available memory, stake the claim, success! */
     d->outstanding_pages = claim;
     outstanding_claims += d->outstanding_pages;
+    if ( node != NUMA_NO_NODE )
+    {
+        node_outstanding_claims(node) += claim;
+        d->claim_node = node;
+    }
     ret = 0;
 
 out:
@@ -953,6 +1066,13 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
      */
     for ( ; ; )
     {
+        /*
+         * Claimed memory is considered unavailable unless the request
+         * is made by a domain with sufficient unclaimed pages.
+         */
+        if ( !node_allocatable_request(d, memflags, (1UL << order), node) )
+            goto try_next_node;
+
         zone = zone_hi;
         do {
             /* Check if target node can support the allocation. */
@@ -982,6 +1102,8 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
             }
         } while ( zone-- > zone_lo ); /* careful: unsigned zone may wrap */
 
+ try_next_node:
+        /* If MEMF_exact_node was passed, we may not skip to a different node */
         if ( (memflags & MEMF_exact_node) && req_node != NUMA_NO_NODE )
             return NULL;
 
@@ -1042,13 +1164,8 @@ static struct page_info *alloc_heap_pages(
 
     spin_lock(&heap_lock);
 
-    /*
-     * Claimed memory is considered unavailable unless the request
-     * is made by a domain with sufficient unclaimed pages.
-     */
-    if ( (outstanding_claims + request > total_avail_pages) &&
-          ((memflags & MEMF_no_refcount) ||
-           !d || d->outstanding_pages < request) )
+    /* Proceed if host-level memory and claims permit this request to proceed */
+    if ( !host_allocatable_request(d, memflags, request) )
     {
         spin_unlock(&heap_lock);
         return NULL;
@@ -1099,7 +1216,7 @@ static struct page_info *alloc_heap_pages(
     total_avail_pages -= request;
 
     if ( !(memflags & MEMF_no_refcount) )
-        consume_outstanding_claims(d, request);
+        consume_outstanding_claims(d, request, node);
 
     check_low_mem_virq();
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index d80bfba6d393..6e589a5b6389 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -65,6 +65,7 @@
 #include <xen/compiler.h>
 #include <xen/mm-frame.h>
 #include <xen/mm-types.h>
+#include <xen/numa.h>
 #include <xen/types.h>
 #include <xen/list.h>
 #include <xen/spinlock.h>
@@ -131,7 +132,8 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
 /* Claim handling */
 unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
     long pages);
-int domain_set_outstanding_pages(struct domain *d, unsigned long pages);
+int domain_set_outstanding_pages(struct domain *d, unsigned long pages,
+    unsigned int node);
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
 
 /* Domain suballocator. These functions are *not* interrupt-safe.*/
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 40a35fc15c65..7f1654afbc7c 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -421,6 +421,7 @@ struct domain
     unsigned int     outstanding_pages;
     unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
+    nodeid_t         claim_node;        /* NUMA_NO_NODE for host-wide claims */
 
 #ifdef CONFIG_MEM_SHARING
     atomic_t         shr_pages;         /* shared pages */
-- 
2.39.5


