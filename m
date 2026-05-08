Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJVzE3pJ/mllowAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:37:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02EE4FB87B
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 22:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304146.1577266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLRwV-0002fK-IA; Fri, 08 May 2026 20:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304146.1577266; Fri, 08 May 2026 20:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLRwV-0002cq-EQ; Fri, 08 May 2026 20:37:03 +0000
Received: by outflank-mailman (input) for mailman id 1304146;
 Fri, 08 May 2026 20:37:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wLRwT-0002ck-4h
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 20:37:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLRwS-00Aq1l-EX
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 22:37:00 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fe4906-2eae-0a2a0a5409dd-0a2a4506dc28-46
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:37:00 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69fe496b-7371-0a2a45060019-a0658309d4c2-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 22:37:00 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 972C78245F8E;
 Fri,  8 May 2026 16:35:53 -0400 (EDT)
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
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v7 2/3] xen/mm: Introduce NUMA-aware memory claim sets
Date: Fri,  8 May 2026 21:27:58 +0100
Message-Id: <ddcc692d642aaf6dec84dcdb17ebaf2b8c09c7b0.1778272036.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1778272036.git.bernhard.kaindl@citrix.com>
References: <cover.1778272036.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1778272620-7F77FD75-8A8972F8/0/0
X-purgate-type: clean
X-purgate-size: 31474
X-Rspamd-Queue-Id: C02EE4FB87B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.476];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:mid,kaindl.dev:url]
X-Rspamd-Action: no action

This commit extends Xen's memory claim design to support installing claim
sets spanning multiple NUMA nodes atomically. As Roger Pau Monné suggested:

  Ideally, we would need to introduce a new hypercall that allows
  making claims from multiple nodes in a single locked region, as to
  ensure success or failure in an atomic way.

A claim set can contain multiple node-specific claims and a host-wide
claim for memory that may come from any NUMA node. The new domctl
installs the full claim set atomically, and the allocator is updated
so that claim checks and claim consumption follow the new semantics.

This adds:

1. installing multi-node claim sets atomically,
2. protecting claimed pages from other claim requests and allocations, and
3. redeeming held claims when satisfying allocations.

Legacy XENMEM_claim_pages behaviour is preserved; the interface is
deprecated and superseded by XEN_DOMCTL_claim_memory.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

---
The v7 design document submitted ahead of this series may help with review.
It explains the background, design rationale, and implementation details.

Rendered version: https://xen.kaindl.dev/claims-v7-design/designs/claims

Many thanks to everyone who contributed to the earlier work and review:
especially Roger Pau Monné, Alejandro Vallejo, Jan Beulich, Andrew Cooper,
Marcus Granado, and Edwin Török.

Thanks,
Bernhard
---
 tools/include/xenctrl.h             |  11 +
 tools/libs/ctrl/xc_domain.c         |  28 ++
 xen/common/domain.c                 |   5 +-
 xen/common/domctl.c                 |  57 ++++
 xen/common/memory.c                 |   5 +-
 xen/common/page_alloc.c             | 410 +++++++++++++++++++++++-----
 xen/include/public/domctl.h         |  38 +++
 xen/include/public/memory.h         |   2 +
 xen/include/xen/mm.h                |   6 +-
 xen/include/xen/sched.h             |   4 +
 xen/xsm/flask/hooks.c               |   1 +
 xen/xsm/flask/policy/access_vectors |   1 +
 12 files changed, 493 insertions(+), 75 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index d5dbf69c8968..fffa4d3b9c09 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2659,6 +2659,17 @@ int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
                              const uint32_t *llc_colors,
                              uint32_t num_llc_colors);
 
+/*
+ * Set or get memory claims for a domain.
+ *
+ * For XEN_DOMCTL_CLAIM_MEMORY_GET, callers may pass *nr_entries == 0 and
+ * claim_set == NULL to query the number of records needed. In that case the
+ * call fails with ERANGE and updates *nr_entries with the required count.
+ */
+int xc_domain_claim_memory(xc_interface *xch, uint32_t domid, uint32_t mode,
+                           uint32_t *nr_entries,
+                           xen_memory_claim_t *claim_set);
+
 #if defined(__arm__) || defined(__aarch64__)
 int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 01c0669c8863..f78e085dd700 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1070,6 +1070,34 @@ int xc_domain_remove_from_physmap(xc_interface *xch,
     return xc_memory_op(xch, XENMEM_remove_from_physmap, &xrfp, sizeof(xrfp));
 }
 
+/* Set or get memory claims for a domain. */
+int xc_domain_claim_memory(xc_interface *xch, uint32_t domid, uint32_t mode,
+                           uint32_t *nr_entries, xen_memory_claim_t *claim_set)
+{
+    struct xen_domctl domctl = {};
+    DECLARE_HYPERCALL_BOUNCE(claim_set, *nr_entries * sizeof(*claim_set),
+                             XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+    int ret;
+
+    if ( xc_hypercall_bounce_pre(xch, claim_set) )
+        return -1;
+
+    domctl.cmd = XEN_DOMCTL_claim_memory;
+    domctl.domain = domid;
+    domctl.u.claim_memory.mode = mode;
+    domctl.u.claim_memory.nr_entries = *nr_entries;
+    set_xen_guest_handle(domctl.u.claim_memory.claim_set, claim_set);
+
+    ret = do_domctl(xch, &domctl);
+
+    *nr_entries = domctl.u.claim_memory.nr_entries;
+
+    xc_hypercall_bounce_post(xch, claim_set);
+
+    return ret;
+}
+
+/* XENMEM_claim_pages is deprecated; use xc_domain_claim_memory() instead. */
 int xc_domain_claim_pages(xc_interface *xch,
                                uint32_t domid,
                                unsigned long nr_pages)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index bb9e210c2895..8cb4241b0511 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1319,7 +1319,10 @@ int domain_kill(struct domain *d)
         rspin_barrier(&d->domain_lock);
         argo_destroy(d);
         vnuma_destroy(d->vnuma);
-        domain_set_outstanding_pages(d, 0);
+        /* Release all outstanding claims of the domain. */
+        domain_set_claim_entries(d, 1, &(xen_memory_claim_t){
+            .target = XEN_DOMCTL_CLAIM_MEMORY_HOST, .pages = 0,
+        });
         /* fallthrough */
     case DOMDYING_dying:
         rc = domain_teardown(d);
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 93738931c575..391f256f013c 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -51,6 +51,57 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nodemask,
                                    MAX_NUMNODES);
 }
 
+/* Set or get memory claims for a domain. */
+static int claim_memory(struct domain *d,
+                        struct xen_domctl_claim_memory *uinfo, bool *copyback)
+{
+    xen_memory_claim_t *entries;
+    int rc = -EFAULT;
+
+    /* Reject LLC coloring; alloc_color_heap_page() does not handle claims. */
+    if ( llc_coloring_enabled )
+        return -EOPNOTSUPP;
+
+    switch ( uinfo->mode )
+    {
+    case XEN_DOMCTL_CLAIM_MEMORY_SET:
+        if ( !uinfo->nr_entries )
+            return -EINVAL;
+        if ( uinfo->nr_entries > MAX_NUMNODES + 1 )
+            return -E2BIG;
+        break;
+    case XEN_DOMCTL_CLAIM_MEMORY_GET:
+        if ( uinfo->nr_entries > MAX_NUMNODES + 1 )
+            uinfo->nr_entries = MAX_NUMNODES + 1;
+        break;
+    default:
+        return -EOPNOTSUPP;
+    }
+    if ( d->is_dying )
+        return -ESRCH;
+
+    entries = xmalloc_array(xen_memory_claim_t, uinfo->nr_entries);
+    if ( entries == NULL )
+        return -ENOMEM;
+
+    switch ( uinfo->mode )
+    {
+    case XEN_DOMCTL_CLAIM_MEMORY_SET:
+        if ( !copy_from_guest(entries, uinfo->claim_set, uinfo->nr_entries) )
+            rc = domain_set_claim_entries(d, uinfo->nr_entries, entries);
+        break;
+    case XEN_DOMCTL_CLAIM_MEMORY_GET:
+        rc = domain_get_claim_entries(d, &uinfo->nr_entries, entries);
+        *copyback = true;
+        if ( !rc && copy_to_guest(uinfo->claim_set, entries,
+                                  uinfo->nr_entries) )
+            rc = -EFAULT;
+        break;
+    }
+    xfree(entries);
+    return rc;
+}
+
 void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
     struct vcpu *v;
@@ -865,6 +916,12 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             copyback = true;
         break;
 
+    case XEN_DOMCTL_claim_memory:
+        ret = xsm_claim_pages(XSM_PRIV, d);
+        if ( !ret )
+            ret = claim_memory(d, &op->u.claim_memory, &copyback);
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 1ad4b51c5b02..d7515da28fe3 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -1805,7 +1805,10 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             rc = -EINVAL;
 
         if ( !rc )
-            rc = domain_set_outstanding_pages(d, reservation.nr_extents);
+            rc = domain_set_claim_entries(d, 1, &(xen_memory_claim_t){
+                .target = XEN_DOMCTL_CLAIM_MEMORY_LEGACY,
+                .pages = reservation.nr_extents,
+            });
 
         rcu_unlock_domain(d);
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 7e17bafa1e45..46c01a9fca2a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -477,6 +477,11 @@ mfn_t __init alloc_boot_pages(unsigned long nr_pfns, unsigned long pfn_align)
 #define page_to_zone(pg) (is_xen_heap_page(pg) ? MEMZONE_XEN :  \
                           (flsl(mfn_x(page_to_mfn(pg))) ? : 1))
 
+/*
+ * The heap, page, and claim counters below, and all claim counters
+ * in struct domain, are protected by heap_lock. The lock order with
+ * d->page_alloc_lock is d->page_alloc_lock first, then heap_lock.
+ */
 typedef struct page_list_head heap_by_zone_and_order_t[NR_ZONES][MAX_ORDER+1];
 static heap_by_zone_and_order_t *_heap[MAX_NUMNODES];
 #define heap(node, zone, order) ((*_heap[node])[zone][order])
@@ -491,6 +496,9 @@ static DEFINE_SPINLOCK(heap_lock);
 /* Total outstanding claims by all domains */
 static unsigned long outstanding_claims;
 
+/* Sum of the outstanding claims of all domains per node */
+static unsigned long claimed_pages[MAX_NUMNODES];
+
 static unsigned long avail_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi, unsigned int node)
 {
@@ -520,67 +528,6 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
     return d->tot_pages;
 }
 
-int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
-{
-    int ret = -ENOMEM;
-    unsigned long claim, avail_pages;
-
-    /*
-     * Two locks are needed here:
-     *  - d->page_alloc_lock: protects accesses to d->{tot,max,extra}_pages.
-     *  - heap_lock: protects accesses to d->outstanding_pages, total_avail_pages
-     *    and outstanding_claims.
-     */
-    nrspin_lock(&d->page_alloc_lock);
-    spin_lock(&heap_lock);
-
-    /* pages==0 means "unset" the claim. */
-    if ( pages == 0 )
-    {
-        outstanding_claims -= d->outstanding_pages;
-        d->outstanding_pages = 0;
-        ret = 0;
-        goto out;
-    }
-
-    /* only one active claim per domain please */
-    if ( d->outstanding_pages )
-    {
-        ret = -EINVAL;
-        goto out;
-    }
-
-    /* disallow a claim not exceeding domain_tot_pages() or above max_pages */
-    if ( (pages <= domain_tot_pages(d)) || (pages > d->max_pages) )
-    {
-        ret = -EINVAL;
-        goto out;
-    }
-
-    /* how much memory is available? */
-    avail_pages = total_avail_pages;
-
-    avail_pages -= outstanding_claims;
-
-    /*
-     * Note, if domain has already allocated memory before making a claim
-     * then the claim must take domain_tot_pages() into account
-     */
-    claim = pages - domain_tot_pages(d);
-    if ( claim > avail_pages )
-        goto out;
-
-    /* yay, claim fits in available memory, stake the claim, success! */
-    d->outstanding_pages = claim;
-    outstanding_claims += d->outstanding_pages;
-    ret = 0;
-
-out:
-    spin_unlock(&heap_lock);
-    nrspin_unlock(&d->page_alloc_lock);
-    return ret;
-}
-
 #ifdef CONFIG_SYSCTL
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
 {
@@ -858,6 +805,253 @@ static void check_and_stop_scrub(struct page_info *head)
     }
 }
 
+/* Release claims from the host-wide claims pool of the domain. */
+static unsigned long domain_release_host_claims(struct domain *d,
+                                                unsigned long release)
+{
+    unsigned long host_wide_claims;
+
+    ASSERT(d->outstanding_pages >= d->node_claims);
+    host_wide_claims = d->outstanding_pages - d->node_claims;
+
+    if ( release > host_wide_claims )
+        release = host_wide_claims;
+
+    ASSERT(release <= outstanding_claims);
+
+    outstanding_claims -= release;
+    d->outstanding_pages -= release;
+
+    return release;
+}
+
+/* Release claims from the node-specific claims pool of the domain. */
+static unsigned long domain_release_node_claims(
+    struct domain *d, nodeid_t node, unsigned long release)
+{
+    if ( !d->claims[node] )
+        return 0;
+
+    if ( release > d->claims[node] )
+        release = d->claims[node];
+
+    ASSERT(claimed_pages[node] >= release);
+    ASSERT(d->node_claims >= release);
+    ASSERT(d->outstanding_pages >= release);
+    ASSERT(outstanding_claims >= release);
+
+    claimed_pages[node] -= release;
+    d->claims[node] -= release;
+    d->node_claims -= release;
+    d->outstanding_pages -= release;
+    outstanding_claims -= release;
+
+    return release;
+}
+
+/*
+ * Recall node-specific claims from a domain until either the specified number
+ * of pages has been recalled, or all node-specific claims have been exhausted.
+ */
+static void domain_recall_node_claims(struct domain *d, unsigned long recall)
+{
+    nodeid_t node;
+
+    /*
+     * When NUMA node offlining is implemented, it will be responsible for
+     * recalling or moving claims off a node before offlining it. Therefore,
+     * offline nodes are not iterated here.
+     */
+    for_each_online_node ( node )
+    {
+        if ( !recall || !d->node_claims )
+            break;
+        recall -= domain_release_node_claims(d, node, recall);
+    }
+}
+
+/* Get claim entries for the outstanding claims of a domain. */
+int domain_get_claim_entries(struct domain *d, uint32_t *nr_entries,
+                             xen_memory_claim_t *entries)
+{
+    unsigned int needed_entries = 1, max_entries = *nr_entries;
+    nodeid_t node;
+
+    /* If max_entries is 0, only the number of needed entries is returned. */
+    if ( max_entries )
+    {
+        memset(entries, 0, sizeof(*entries) * max_entries);
+        entries[0].target = XEN_DOMCTL_CLAIM_MEMORY_HOST;
+    }
+
+    spin_lock(&heap_lock);
+    if ( max_entries )
+    {
+        ASSERT(d->outstanding_pages >= d->node_claims);
+        entries[0].pages = d->outstanding_pages - d->node_claims;
+    }
+
+    for_each_online_node ( node )
+    {
+        if ( !d->claims[node] )
+            continue;
+
+        if ( needed_entries < max_entries )
+        {
+            entries[needed_entries].target = node;
+            entries[needed_entries].pages = d->claims[node];
+        }
+        needed_entries++;
+    }
+    spin_unlock(&heap_lock);
+    *nr_entries = needed_entries;
+    return needed_entries <= max_entries ? 0 : -ERANGE;
+}
+
+/* Validate a set of claim records and install it if valid. */
+int domain_set_claim_entries(struct domain *d, uint32_t nr_entries,
+                             const xen_memory_claim_t *claim_set)
+{
+    uint64_t avail_pages, request, node_requests = 0, host_requests = 0;
+    nodemask_t nodes;
+    uint32_t node;
+    int ret = -EINVAL;
+    bool host_request_seen = false, legacy_semantics = false;
+
+    /*
+     * Two locks are needed here:
+     *  - d->page_alloc_lock: protects accesses to d->{tot,max,extra}_pages.
+     *  - heap_lock: protects accesses to total_avail_pages, node_avail_pages,
+     *    avail[], scrub state and all total and node-specific claim counters.
+     */
+    nrspin_lock(&d->page_alloc_lock);
+    spin_lock(&heap_lock);
+
+    /*
+     * Phase 1: Check and process the individual claim entries. Check
+     * the node-specific claim requests, and validate them against the
+     * available memory. Track legacy and host-wide claim requests and
+     * prepare validation of the combined claims in Phase 2.
+     */
+    nodes_clear(nodes);
+    for ( uint32_t i = 0; i < nr_entries; i++ )
+    {
+        node = claim_set[i].target;
+        request = claim_set[i].pages;
+
+        if ( claim_set[i].cmd ) /* Reserved for possible future use. */
+            goto out;
+
+        switch ( node )
+        {
+        case XEN_DOMCTL_CLAIM_MEMORY_LEGACY:
+            legacy_semantics = true;
+            fallthrough;
+        case XEN_DOMCTL_CLAIM_MEMORY_HOST:
+            if ( host_request_seen ) /* Only one host-wide request allowed. */
+                goto out;
+
+            host_request_seen = true;
+            host_requests = request;
+            continue;
+        }
+
+        /* Node-specific claim. */
+        if ( node >= MAX_NUMNODES || !node_online(node) )
+        {
+            ret = -ENOENT; /* Node not valid or not online. */
+            goto out;
+        }
+
+        if ( nodemask_test(node, &nodes) ) /* Only one request per node. */
+            goto out;
+        node_set(node, nodes);
+
+        ASSERT(node_avail_pages[node] >= claimed_pages[node]);
+        avail_pages = node_avail_pages[node] - claimed_pages[node];
+
+        if ( request > avail_pages + d->claims[node] )
+        {
+            ret = -ENOMEM; /* Request exceeds available memory on node. */
+            goto out;
+        }
+        node_requests += request; /* The combined total is checked below. */
+    }
+
+    /*
+     * Phase 2: Validate the combined claim set.
+     * Apply legacy semantics if needed, then check that the total fits
+     * within d->max_pages and within the available unclaimed heap memory.
+     * A zero new-claim request is a pure release; skip validation entirely.
+     */
+    if ( legacy_semantics )
+    {
+        if ( node_requests )
+            goto out;
+
+        if ( !host_requests )
+            goto release_existing;
+
+        /*
+         * Legacy semantics require the request to exceed the current
+         * allocation; the request is then reduced by the current allocation.
+         * Existing outstanding claims are not allowed.
+         */
+        if ( d->outstanding_pages ||
+             host_requests <= domain_tot_pages(d) )
+            goto out;
+
+        host_requests -= domain_tot_pages(d);
+    }
+    else if ( !host_requests && !node_requests )
+        goto release_existing;
+
+    /* Ensure new claims plus domain_tot_pages() fit into d->max_pages. */
+    if ( host_requests > d->max_pages ||
+         node_requests > d->max_pages - host_requests ||
+         node_requests + host_requests + domain_tot_pages(d) > d->max_pages )
+        goto out;
+
+    /* Ensure new claims fit in the total unclaimed heap memory. */
+    ASSERT(total_avail_pages >= outstanding_claims);
+    if ( node_requests + host_requests >
+         (total_avail_pages - outstanding_claims) + d->outstanding_pages )
+    {
+        /* New claims would exceed available unclaimed memory. */
+        ret = -ENOMEM;
+        goto out;
+    }
+
+ release_existing:
+    /* Phase 3: Remove the old claims before installing the new claims. */
+    domain_recall_node_claims(d, d->node_claims);
+    domain_release_host_claims(d, d->outstanding_pages);
+    ASSERT(!d->node_claims && !d->outstanding_pages);
+
+    /* Phase 4: Install new node-specific and host-wide claims. */
+    d->node_claims = node_requests;
+    d->outstanding_pages = host_requests + node_requests;
+    outstanding_claims += d->outstanding_pages;
+
+    /* Phase 5: Install the individual node claims. */
+    for ( uint32_t i = 0; i < nr_entries; i++ )
+    {
+        node = claim_set[i].target;
+        request = claim_set[i].pages;
+        if ( node >= MAX_NUMNODES ) /* Skip non-node claim targets. */
+            continue;
+
+        ASSERT(!d->claims[node]);
+        d->claims[node] = request;
+        claimed_pages[node] += request;
+    }
+    ret = 0;
+ out:
+    spin_unlock(&heap_lock);
+    nrspin_unlock(&d->page_alloc_lock);
+    return ret;
+}
+
 static struct page_info *get_free_buddy(unsigned int zone_lo,
                                         unsigned int zone_hi,
                                         unsigned int order, unsigned int memflags,
@@ -907,6 +1101,18 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
      */
     for ( ; ; )
     {
+        unsigned long avail_pages;
+
+        ASSERT(node_avail_pages[node] >= claimed_pages[node]);
+        avail_pages = node_avail_pages[node] - claimed_pages[node];
+
+        if ( d && !(memflags & MEMF_no_refcount) )
+            avail_pages += d->claims[node];
+
+        /* Skip this node if memory and claims do not permit this request. */
+        if ( avail_pages < (1UL << order) )
+            goto next_node;
+
         zone = zone_hi;
         do {
             /* Check if target node can support the allocation. */
@@ -936,6 +1142,7 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
             }
         } while ( zone-- > zone_lo ); /* careful: unsigned zone may wrap */
 
+ next_node:
         if ( (memflags & MEMF_exact_node) && req_node != NUMA_NO_NODE )
             return NULL;
 
@@ -1047,13 +1254,13 @@ static struct page_info *alloc_heap_pages(
         }
     }
 
-    ASSERT(avail[node][zone] >= request);
-    avail[node][zone] -= request;
-    ASSERT(total_avail_pages >= request);
-    total_avail_pages -= request;
-    ASSERT(node_avail_pages[node] >= request);
-    node_avail_pages[node] -= request;
-
+    /*
+     * Ensure the domain's claims are fully redeemed before deducting
+     * the allocation from the page counters, otherwise the host or the
+     * node might be left with more claims than available pages. This would
+     * break the invariants claimed_pages[node] <= node_avail_pages[node]
+     * and outstanding_claims <= total_avail_pages.
+     */
     if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
     {
         /*
@@ -1071,13 +1278,34 @@ static struct page_info *alloc_heap_pages(
          * the domain being destroyed before creation is finished.  Losing part
          * of the claim makes no difference.
          */
-        unsigned long outstanding = min(d->outstanding_pages + 0UL, request);
+        unsigned long redeem = min(d->outstanding_pages + 0UL, request);
+
+        BUG_ON(redeem > outstanding_claims);
+
+        /* Maintain invariant: claimed_pages[node] <= node_avail_pages[node] */
+        redeem -= domain_release_node_claims(d, node, redeem);
 
-        BUG_ON(outstanding > outstanding_claims);
-        outstanding_claims -= outstanding;
-        d->outstanding_pages -= outstanding;
+        if ( redeem )
+        {
+            /*
+             * Maintain the invariant outstanding_claims <= total_avail_pages:
+             * Redeem from the host-wide claims pool and if needed from other
+             * nodes' claims pools to maintain that outstanding_claims do not
+             * exceed total_avail_pages after deducting the allocation.
+             */
+            redeem -= domain_release_host_claims(d, redeem);
+            domain_recall_node_claims(d, redeem);
+        }
     }
 
+    /* Having redeemed claims, deduct the allocation from the page counters. */
+    ASSERT(total_avail_pages >= request);
+    total_avail_pages -= request;
+    ASSERT(node_avail_pages[node] >= request);
+    node_avail_pages[node] -= request;
+    ASSERT(avail[node][zone] >= request);
+    avail[node][zone] -= request;
+
     check_low_mem_virq();
 
     if ( d != NULL )
@@ -1166,6 +1394,7 @@ static int reserve_offlined_page(struct page_info *head)
     unsigned int node = page_to_nid(head);
     int zone = page_to_zone(head), i, head_order = PFN_ORDER(head), count = 0;
     struct page_info *cur_head;
+    struct domain *d;
     unsigned int cur_order, first_dirty;
 
     ASSERT(spin_is_locked(&heap_lock));
@@ -1256,6 +1485,43 @@ static int reserve_offlined_page(struct page_info *head)
         count++;
     }
 
+    /* Offlining pages may violate claim invariants; restore them if needed. */
+    if ( claimed_pages[node] > node_avail_pages[node] ||
+         outstanding_claims > total_avail_pages )
+    {
+        rcu_read_lock(&domlist_read_lock);
+
+        if ( claimed_pages[node] > node_avail_pages[node] )
+        {
+            unsigned long overclaim = claimed_pages[node] -
+                                      node_avail_pages[node];
+
+            for_each_domain ( d )
+            {
+                overclaim -= domain_release_node_claims(d, node, overclaim);
+                if ( !overclaim )
+                    break;
+            }
+        }
+
+        if ( outstanding_claims > total_avail_pages )
+        {
+            unsigned long overclaim = outstanding_claims - total_avail_pages;
+
+            for_each_domain ( d )
+            {
+                overclaim -= domain_release_host_claims(d, overclaim);
+                if ( !overclaim )
+                    break;
+            }
+        }
+
+        rcu_read_unlock(&domlist_read_lock);
+
+        ASSERT(claimed_pages[node] <= node_avail_pages[node]);
+        ASSERT(outstanding_claims <= total_avail_pages);
+    }
+
     return count;
 }
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 8f6708c0a7cd..352d7095c944 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1276,6 +1276,42 @@ struct xen_domctl_get_domain_state {
     uint64_t unique_id;      /* Unique domain identifier. */
 };
 
+struct xen_memory_claim {
+    uint64_aligned_t pages; /* Number of pages to claim. */
+    uint32_t target;        /* NUMA node or special target constant. */
+    uint32_t cmd;           /* Reserved, must be zero. */
+};
+typedef struct xen_memory_claim xen_memory_claim_t;
+DEFINE_XEN_GUEST_HANDLE(xen_memory_claim_t);
+
+/* Special claim targets for the target field of xen_memory_claim_t. */
+#define XEN_DOMCTL_CLAIM_MEMORY_HOST     0x80000000U /* Host-wide claims. */
+#define XEN_DOMCTL_CLAIM_MEMORY_LEGACY   0x40000000U /* Legacy semantics. */
+
+/*
+ * XEN_DOMCTL_claim_memory
+ *
+ * Install or query a domain memory claim set. A SET operation replaces the
+ * existing claim set atomically. Claims are redeemed by later allocations to
+ * the domain. A SET request whose entries all have pages == 0 releases any
+ * existing claims.
+ *
+ * For GET, callers may pass nr_entries == 0 and claim_set == NULL to query the
+ * number of records needed. Xen returns -ERANGE and updates nr_entries. If the
+ * supplied array is too small, Xen returns -ERANGE and updates nr_entries
+ * without copying partial records.
+ */
+struct xen_domctl_claim_memory {
+    /* IN/OUT: Array of struct xen_memory_claim. */
+    XEN_GUEST_HANDLE_64(xen_memory_claim_t) claim_set;
+    /* IN/OUT: Number of records in the claim_set array. */
+    uint32_t nr_entries;
+    /* IN: Operation to perform on the claim set (GET or SET). */
+    uint32_t mode;
+#define XEN_DOMCTL_CLAIM_MEMORY_SET 0U /* Set the claim set for the domain. */
+#define XEN_DOMCTL_CLAIM_MEMORY_GET 1U /* Get the claim set of the domain. */
+};
+
 struct xen_domctl {
 /* Stable domctl ops: interface_version is required to be 0.  */
     uint32_t cmd;
@@ -1368,6 +1404,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_set_llc_colors                89
 #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
+#define XEN_DOMCTL_claim_memory                  91
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1436,6 +1473,7 @@ struct xen_domctl {
 #endif
         struct xen_domctl_set_llc_colors    set_llc_colors;
         struct xen_domctl_get_domain_state  get_domain_state;
+        struct xen_domctl_claim_memory      claim_memory;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index bd9fc37b5297..086334af051b 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -569,6 +569,8 @@ DEFINE_XEN_GUEST_HANDLE(xen_mem_sharing_op_t);
  * for 10, only 7 additional pages are claimed.
  *
  * Caller must be privileged or the hypercall fails.
+ *
+ * Note: This hypercall is superseded by XEN_DOMCTL_claim_memory.
  */
 #define XENMEM_claim_pages                  24
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b80bec00c124..b3a35c4bc8d6 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -72,6 +72,7 @@
 #include <public/memory.h>
 
 struct page_info;
+struct xen_memory_claim;
 
 extern bool using_static_heap;
 
@@ -131,7 +132,10 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
 /* Claim handling */
 unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
     long pages);
-int domain_set_outstanding_pages(struct domain *d, unsigned long pages);
+int domain_set_claim_entries(struct domain *d, uint32_t nr_entries,
+                             const struct xen_memory_claim *claim_set);
+int domain_get_claim_entries(struct domain *d, uint32_t *nr_entries,
+                             struct xen_memory_claim *claim_set);
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
 
 /* Domain suballocator. These functions are *not* interrupt-safe.*/
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 00db1da12f21..f671e0c4c7b3 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -419,6 +419,10 @@ struct domain
     unsigned int     xenheap_pages;     /* pages allocated from Xen heap */
     /* Pages claimed but not possessed, protected by global heap_lock. */
     unsigned int     outstanding_pages;
+    unsigned int     node_claims;       /* Sum of per-node claims. */
+    /* Domain objects use dedicated pages, leaving room for per-node claims. */
+    unsigned int     claims[MAX_NUMNODES]; /* Per-NUMA-node claims. */
+
     unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
 
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index 28522dcbd271..9e999ac1ba73 100644
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -651,6 +651,7 @@ static int cf_check flask_domctl(struct domain *d, unsigned int cmd,
 
     /* These have individual XSM hooks (common/domctl.c) */
     case XEN_DOMCTL_getdomaininfo:
+    case XEN_DOMCTL_claim_memory:
     case XEN_DOMCTL_scheduler_op:
     case XEN_DOMCTL_irq_permission:
     case XEN_DOMCTL_iomem_permission:
diff --git a/xen/xsm/flask/policy/access_vectors b/xen/xsm/flask/policy/access_vectors
index bbb9c117ec4a..e7defa117a16 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -216,6 +216,7 @@ class domain2
 # XEN_DOMCTL_scheduler_op with XEN_DOMCTL_SCHEDOP_putinfo
     setscheduler
 # XENMEM_claim_pages
+# XEN_DOMCTL_claim_memory
     setclaim
 # XEN_DOMCTL_cacheflush
     cacheflush
-- 
2.39.5


