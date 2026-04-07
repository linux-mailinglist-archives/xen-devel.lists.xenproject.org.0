Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UASvODLW1GnuxwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:02:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE63AC774
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274742.1560753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3GA-0007x0-RU; Tue, 07 Apr 2026 10:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274742.1560753; Tue, 07 Apr 2026 10:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3GA-0007ue-Oa; Tue, 07 Apr 2026 10:02:14 +0000
Received: by outflank-mailman (input) for mailman id 1274742;
 Tue, 07 Apr 2026 10:02:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wA3G9-0007uW-Sc
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:02:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3G9-001uQb-8T
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:02:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69d4d61f-2eae-0a2a0a5409dd-0a2a450cba62-46
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:02:13 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69d4d624-f40c-0a2a450c0019-a0658309a622-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:02:12 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id A2FC0818BA72;
 Tue,  7 Apr 2026 06:01:21 -0400 (EDT)
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
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marcus Granado <marcus.granado@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH 5/5] xen/mm: Introduce Claim Sets for multiple NUMA nodes
Date: Tue,  7 Apr 2026 10:54:30 +0100
Message-Id: <4af33fea53f1956155cca7d5ea74c0802e6ae4d8.1775505670.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1775505670.git.bernhard.kaindl@citrix.com>
References: <cover.1775505670.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1775556133-83348A3D-325C9D5B/0/0
X-purgate-type: clean
X-purgate-size: 28557
X-Spamd-Result: default: False [2.51 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marcus.granado@citrix.com,m:alejandro.vallejo@cloud.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.904];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[bernhard.kaindl@citrix.com,xen-devel-bounces@lists.xenproject.org];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:mid,suse.com:email,bernhardk-xen-review.readthedocs.io:url,xenproject.org:url]
X-Rspamd-Queue-Id: 5ADE63AC774
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch extends Xen's memory claim handling to support claim sets
spanning multiple NUMA nodes.

Earlier review raised the concern that claims would need to evolve from a
single claim into a multi-node model. Roger Pau Monné described the core
requirement well:

  >  Ideally, we would need to introduce a new hypercall that allows
  >  making claims from multiple nodes in a single locked region,
  >  as to ensure success or failure in an atomic way.

      -- Roger Pau Monné

This patch implements that model.

A claim set can contain multiple node-specific claims and an optional
global claim for memory that may come from any NUMA node. The new domctl
installs the full claim set atomically, and the allocator is updated so
that claim checks and claim consumption follow the new semantics.

This patch adds:

1. Atomic installation of multi-node claim sets with a domctl.
2. Allocation-time claim checks.
3. Claim retirement on successful allocation using claims.
4. Retention of the legacy claim interface without functional change.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Suggested-by: Marcus Granado <marcus.granado@citrix.com>
Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

---
The design document submitted ahead of this series may help with review.
 It explains the background, design rationale, and implementation details.

Rendered version:
https://bernhardk-xen-review.readthedocs.io/node-claims-v5/designs/claims/

Posted version:
https://lists.xenproject.org/archives/html/xen-devel/2026-04/msg00108.html

Many thanks to everyone who contributed to the earlier work and review,
especially Alejandro Vallejo, Jan Beulich, Andrew Cooper, Roger Pau
Monné, Marcus Granado, and Edwin Török.

Many thanks to everyone who contributed to the previous work, reviews,
and implementation of this feature.

Thanks,

  Bernhard
---
 tools/include/xenctrl.h             |   4 +
 tools/libs/ctrl/xc_domain.c         |  38 ++++
 xen/common/domctl.c                 |  54 ++++++
 xen/common/page_alloc.c             | 279 +++++++++++++++++++++++++++-
 xen/include/public/domctl.h         |  32 ++++
 xen/include/public/memory.h         |   9 +
 xen/include/xen/mm.h                |   3 +
 xen/include/xen/sched.h             |   6 +
 xen/xsm/flask/hooks.c               |   1 +
 xen/xsm/flask/policy/access_vectors |   1 +
 10 files changed, 422 insertions(+), 5 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index d5dbf69c8968..a0a9f2143b32 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2659,6 +2659,10 @@ int xc_domain_set_llc_colors(xc_interface *xch, uint32_t domid,
                              const uint32_t *llc_colors,
                              uint32_t num_llc_colors);
 
+int xc_domain_claim_memory(xc_interface *xch, uint32_t domid,
+                           uint32_t nr_claims,
+                           memory_claim_t *claims);
+
 #if defined(__arm__) || defined(__aarch64__)
 int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
                   uint32_t overlay_fdt_size, uint8_t overlay_op);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 01c0669c8863..32cd91187d44 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -1070,6 +1070,44 @@ int xc_domain_remove_from_physmap(xc_interface *xch,
     return xc_memory_op(xch, XENMEM_remove_from_physmap, &xrfp, sizeof(xrfp));
 }
 
+/* Claim the guest memory for a domain before starting the domain build */
+int xc_domain_claim_memory(xc_interface *xch,
+                           uint32_t domid,
+                           uint32_t nr_claims,
+                           memory_claim_t *claims)
+{
+    struct xen_domctl domctl = {};
+    DECLARE_HYPERCALL_BOUNCE(claims, sizeof(*claims) * nr_claims,
+                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
+    int ret;
+
+    if ( xc_hypercall_bounce_pre(xch, claims) )
+        return -1;
+
+    domctl.cmd = XEN_DOMCTL_claim_memory;
+    domctl.domain = domid;
+    domctl.u.claim_memory.nr_claims = nr_claims;
+    set_xen_guest_handle(domctl.u.claim_memory.claims, claims);
+
+    ret = do_domctl(xch, &domctl);
+
+    xc_hypercall_bounce_post(xch, claims);
+
+    return ret;
+}
+
+/*
+ * Legacy API for claiming pages, replaced by xc_domain_claim_memory()
+ *
+ * Note: This hypercall is deprecated by xc_domain_claim_memory()
+ * which provides the same claim semantics described above, and thus can be
+ * used as drop-in replacement and is extended for NUMA-node-specific claims.
+ * This hypercall should not be used by new code.
+ *
+ * See the following documentation pages for more information:
+ * docs/guest-guide/dom/DOMCTL_claim_memory.rst
+ * docs/guest-guide/mem/XENMEM_claim_pages.rst
+ */
 int xc_domain_claim_pages(xc_interface *xch,
                                uint32_t domid,
                                unsigned long nr_pages)
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 2cc5a4ff32fd..16d239c75bde 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -51,6 +51,51 @@ static int xenctl_bitmap_to_nodemask(nodemask_t *nodemask,
                                    MAX_NUMNODES);
 }
 
+/* Claim memory for a domain (or if a claim exists, release the claim) */
+static int claim_memory(struct domain *d,
+    const struct xen_domctl_claim_memory *uinfo)
+{
+    memory_claim_t *claims;
+    int rc = -EFAULT;
+
+    /* alloc_color_heap_page() does not handle claims, reject LLC coloring. */
+    if ( llc_coloring_enabled )
+        return -EOPNOTSUPP;
+
+    if ( !uinfo->nr_claims || uinfo->pad )
+        return -EINVAL;
+
+    /* Only calls for the supported number of nodes + a global claim can pass */
+    if ( uinfo->nr_claims > MAX_NUMNODES + 1 )
+        return -E2BIG;
+
+    /*
+     * Under domctl_lock, domain_kill() sets d->is_dying and retires claims.
+     * If it set, this is in the past and we should reject the claim request.
+     */
+    if ( d->is_dying )
+        return -ESRCH;
+
+    claims = xmalloc_array(memory_claim_t, uinfo->nr_claims);
+    if ( claims == NULL )
+        return -ENOMEM;
+
+    if ( copy_from_guest(claims, uinfo->claims, uinfo->nr_claims) )
+        goto out;
+
+    rc = -EINVAL; /* Default error code for invalid claim args */
+    if ( claims[0].target == XEN_DOMCTL_CLAIM_MEMORY_LEGACY &&
+         uinfo->nr_claims == 1 )
+        /* Implement installing a legacy claim for backwards compatibility */
+        rc = domain_set_outstanding_pages(d, claims[0].pages);
+    else
+        /* domain_install_claim_set() performs validation of the claim set */
+        rc = domain_install_claim_set(d, uinfo->nr_claims, claims);
+ out:
+    xfree(claims);
+    return rc;
+}
+
 void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 {
     struct vcpu *v;
@@ -865,6 +910,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             copyback = true;
         break;
 
+    case XEN_DOMCTL_claim_memory:
+        /* Use the same XSM hook as XENMEM_claim_pages */
+        ret = xsm_claim_pages(XSM_PRIV, d);
+        if ( ret )
+            break;
+
+        ret = claim_memory(d, &op->u.claim_memory);
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index a4d71f844889..2b32b1aa8fba 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -502,6 +502,9 @@ static long node_avail_pages[MAX_NUMNODES];
 static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
 
+/* Sum of the outstanding claims of all domains on that node. */
+static long node_outstanding_claims[MAX_NUMNODES];
+
 static unsigned long avail_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi, unsigned int node)
 {
@@ -549,6 +552,164 @@ static unsigned long claims_retire_global(struct domain *d,
     return retired;
 }
 
+/* Release outstanding claims on a specific node */
+static unsigned long claims_retire_node(struct domain *d, nodeid_t node,
+                                        unsigned long release)
+{
+    unsigned long consumed = 0;
+
+    ASSERT(spin_is_locked(&heap_lock));
+
+    /* If the allocation was larger than the claims, do not release beyond it */
+    if ( d->claims[node] ) /* Release the claims for this node */
+    {
+        /* Use min_t for clarity to make the comparison type explicit */
+        consumed = min_t(unsigned long, release, d->claims[node]);
+        d->claims[node] -= consumed;
+
+        ASSERT(consumed <= outstanding_claims);
+        outstanding_claims -= consumed;
+
+        ASSERT(consumed <= node_outstanding_claims[node]);
+        node_outstanding_claims[node] -= consumed;
+
+        ASSERT(consumed <= d->node_claims);
+        d->node_claims -= consumed;
+    }
+    return consumed;
+}
+
+/* Release all outstanding claims on all online nodes */
+static void claims_retire_nodes(struct domain *d)
+{
+    nodeid_t node;
+
+    for_each_online_node ( node )
+    {
+        claims_retire_node(d, node, d->claims[node]);
+    }
+    ASSERT(d->node_claims == 0);
+}
+
+/* Validate a claim set and install it if valid. */
+int domain_install_claim_set(struct domain *d, unsigned int nr_claims,
+                             memory_claim_t *claim_set)
+{
+    nodemask_t nodes;
+    uint32_t target;
+    uint64_t pages, tot_pages, max_pages, node_requests = 0, global_request = 0;
+    bool global_target_seen = false;
+    int ret = -EINVAL;
+
+    nrspin_lock(&d->page_alloc_lock);
+    spin_lock(&heap_lock);
+
+    /*
+     * Phase 1: Check and process the individual claim entries.
+     * Result: Extracted global claims and the sum of the node-local claims.
+     */
+    nodes_clear(nodes);
+    for ( int i = 0; i < nr_claims; i++ )
+    {
+        target = claim_set[i].target;
+        pages = claim_set[i].pages;
+        if ( claim_set[i].pad ) /* Check before handling global claims */
+            goto out;
+
+        if ( target == XEN_DOMCTL_CLAIM_MEMORY_GLOBAL )
+        {
+            if ( global_target_seen ) /* Only one global target allowed */
+                goto out;
+
+            global_request = pages; /* Will be checked with the total claims */
+            global_target_seen = true;
+            continue;
+        }
+
+        if ( target >= MAX_NUMNODES || !node_online(target) )
+        {
+            ret = -ENOENT; /* Node not valid or not online */
+            goto out;
+        }
+        if ( nodemask_test(target, &nodes) || /* Duplicate node in claim set */
+             /* Check for overflow before we add the pages to node_requests */
+             pages > ((typeof(d->node_claims))-1) - node_requests )
+            goto out;
+        node_set(target, nodes);
+
+        ASSERT(node_outstanding_claims[target] >= 0 &&
+               node_avail_pages[target] >= node_outstanding_claims[target]);
+        if ( pages > (uint64_t)(node_avail_pages[target] -
+                                node_outstanding_claims[target]) +
+                         d->claims[target] ) /* current claim deduction */
+        {
+            ret = -ENOMEM; /* Claim exceeds available memory on node */
+            goto out;
+        }
+        node_requests += pages; /* Will be checked with the total claims */
+    }
+
+    max_pages = d->max_pages;
+    tot_pages = domain_tot_pages(d);
+    /*
+     * Check that the total of claims and current pages fits in d->max_pages.
+     * Subtract sequentially from max_pages instead of adding the claims:
+     * each subtraction is safe because the prior comparison guarantees
+     * the subtrahend doesn't exceed the remaining budget. This avoids
+     * overflow regardless of the type widths of the claims and max_pages,
+     * as long as the claims are non-negative (which they are, as unsigned)
+     * and max_pages is not negative, which we check as well here.
+     */
+    if ( global_request > max_pages ||
+         node_requests > max_pages - global_request ||
+         tot_pages > max_pages - global_request - node_requests )
+        goto out; /* claims + domain_tot_pages exceeds max_pages: EINVAL */
+
+    /*
+     * Check that replacing the domain's current claims with the new claim set
+     * fits within the system-wide unclaimed memory.
+     *
+     * The right-hand side subtracts all outstanding claims from the total
+     * available memory, then adds this domain's current claims back because
+     * phase 3 retires them before installing the replacement claims.
+     */
+    ASSERT(outstanding_claims >= 0 && total_avail_pages >= outstanding_claims);
+    if ( global_request + node_requests >
+         (uint64_t)(total_avail_pages - outstanding_claims) + d->global_claims +
+         d->node_claims )
+    {
+        ret = -ENOMEM;
+        goto out; /* Total claim exceeds available unclaimed memory: ENOMEM */
+    }
+
+    /* Phase 3: Recall the domain's current claims */
+    claims_retire_global(d, d->global_claims);
+    claims_retire_nodes(d);
+
+    /* Phase 4: Install claim set: Global claims and overall node claims */
+    outstanding_claims += global_request + node_requests;
+    d->global_claims = global_request;
+    d->node_claims = node_requests;
+
+    /* Phase 5: Install the individual node claims */
+    for ( int i = 0; i < nr_claims; i++ )
+    {
+        target = claim_set[i].target;
+        pages = claim_set[i].pages;
+        if ( target >= MAX_NUMNODES ) /* Skip non-node claim targets */
+            continue;
+
+        /* Install the node claim and update the node's total claims claims. */
+        d->claims[target] = pages;
+        node_outstanding_claims[target] += pages;
+    }
+    ret = 0;
+out:
+    spin_unlock(&heap_lock);
+    nrspin_unlock(&d->page_alloc_lock);
+    return ret;
+}
+
 int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
 {
     int ret = -ENOMEM;
@@ -565,6 +726,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
     /* pages==0 means "unset" the claim. */
     if ( pages == 0 )
     {
+        claims_retire_nodes(d);
         claims_retire_global(d, d->global_claims);
         ret = 0;
         goto out;
@@ -608,6 +770,87 @@ out:
     return ret;
 }
 
+/*
+ * Retire the claims to cover a successful allocation.
+ *
+ * The claims for an allocation are retired in order of specificity:
+ *
+ * 1.) Firstly, the claim for the node the allocation was from (if any),
+ * 2.) Secondly, followed by global claims as a fallback (if any), and
+ * 3.) Finally, other remaining node claims from other nodes (if any).
+ *
+ * This order ensures that the most specific claims are retired first,
+ * and that the global claim is only used as a fallback if the node-specific
+ * claim is insufficient to cover the allocation or non-existant in case
+ * the domain doesn't have a claim on the alloc_node. This preserves the
+ * intent of the claims system to allow domains to reserve memory on
+ * specific nodes and only use global claims as a fallback when necessary.
+ *
+ * Finally, if the domain doesn't have sufficient claims on the alloc_node
+ * and the global fallback claim doesn't cover the remains of the allocation,
+ * but as the domain still has other claims, retire the remaining portion
+ * of the allocation from those claims.
+ *
+ * This final step ensures that the domain's total claims (global + node
+ * claims) are always retired to cover the allocation, which in turn
+ * prevents domain_tot_pages(d) + d->global_claims + d->node_claims
+ * from exceeding the domain's d->max_pages limit.
+ *
+ * If this final step was not taken, then it would be possible for a domain to
+ * block off more than its share of system memory as defined by d->max_pages.
+ *
+ * Note: We can't reliably check d->max_pages here, at least not under the
+ * d->page_alloc_lock as taking it here would violate the locking order,
+ * but we can ensure that the domain's claims are always retired to cover
+ * the allocation, which is sufficient to preserve the intent of d->max_pages
+ * cap the domain's memory usage and claims to d->max_pages. While we could
+ * add checking it without lock as a best effort check, a domain builder is
+ * not supposed to claim memory on one set of nodes and then allocate from
+ * another set of nodes, so it would not be meaningful to add such a check,
+ * and the final check covers our bases to handle such misbehaviour anyway.
+ */
+static void claims_retire_allocation(struct domain *d,
+                                     unsigned long allocated_pages,
+                                     nodeid_t alloc_node)
+{
+    unsigned long pages_to_retire = allocated_pages;
+
+    ASSERT(spin_is_locked(&heap_lock));
+
+    /* 1.) Retire the allocation from the alloc_node's claim insofar possible */
+    if ( d->claims[alloc_node] )
+    {
+        pages_to_retire -= claims_retire_node(d, alloc_node, pages_to_retire);
+        if ( pages_to_retire == 0 )
+            return; /* The allocation is fully consumed by alloc_node claim */
+    }
+
+    /* 2.) Retire remains of the allocation from the global / fallback claims */
+    pages_to_retire -= claims_retire_global(d, pages_to_retire);
+
+    if ( pages_to_retire == 0 || !d->node_claims )
+        return; /* Allocation fully consumed or the domain has no claims left */
+
+    /*
+     * 3.) Finally, if the domain doesn't have sufficient claims on alloc_node
+     * and the global fallback claim didn't cover the remains of the allocation,
+     * consume the remaining portion of the allocation from the domain's other
+     * node claims. See the function comment for the details behind this step.
+     */
+    pages_to_retire = min(pages_to_retire, d->node_claims + 0UL);
+    if ( pages_to_retire )
+    {
+        nodeid_t node;
+
+        for_each_online_node ( node )
+        {
+            pages_to_retire -= claims_retire_node(d, node, pages_to_retire);
+            if ( pages_to_retire == 0 )
+                break;
+        }
+    }
+}
+
 #ifdef CONFIG_SYSCTL
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
 {
@@ -893,7 +1136,7 @@ static bool claims_permit_request(const struct domain *d,
                                   unsigned long avail_pages,
                                   unsigned long competing_claims,
                                   unsigned int memflags,
-                                  unsigned long requested_pages)
+                                  unsigned long requested_pages, nodeid_t node)
 {
     unsigned long unclaimed_pages, applicable_claims;
 
@@ -918,7 +1161,25 @@ static bool claims_permit_request(const struct domain *d,
      * Allow the request to proceed when combination of unclaimed pages and the
      * claims held by the domain cover the shortfall for the requested_pages.
      */
-    return requested_pages <= unclaimed_pages + d->global_claims;
+    if ( node == NUMA_NO_NODE )
+        /*
+         * We are checking global claims: For the global claims check,
+         * we apply the domain's global claims and node claims: The domain
+         * can use any of its claims to allow the global check to proceed.
+         *
+         * get_free_buddy() will repeat this check using a node which
+         * will check if either the node has enough unclaimed pages
+         * or the domain enough claims for the node (see below).
+         */
+        applicable_claims = d->node_claims + d->global_claims;
+    else
+        /*
+         * We are checking node-specific claims: For the node-specific claims
+         * check, we may only apply the domain's claim on that specific node.
+         */
+        applicable_claims = d->claims[node];
+
+    return requested_pages <= unclaimed_pages + applicable_claims;
 }
 
 static struct page_info *get_free_buddy(unsigned int zone_lo,
@@ -970,9 +1231,15 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
      */
     for ( ; ; )
     {
+        /* Ensure the target node and the claims permit this allocation */
+        if ( !claims_permit_request(d, node_avail_pages[node],
+                                    node_outstanding_claims[node], memflags,
+                                    1UL << order, node) )
+            goto try_next_node;
+
         zone = zone_hi;
         do {
-            /* Check if target node can support the allocation. */
+            /* Check if this target zone on node can support the allocation. */
             if ( !avail[node] || (avail[node][zone] < (1UL << order)) )
                 continue;
 
@@ -999,6 +1266,8 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
             }
         } while ( zone-- > zone_lo ); /* careful: unsigned zone may wrap */
 
+    try_next_node:
+        /* If MEMF_exact_node was passed, we may not skip to a different node */
         if ( (memflags & MEMF_exact_node) && req_node != NUMA_NO_NODE )
             return NULL;
 
@@ -1116,7 +1385,7 @@ static struct page_info *alloc_heap_pages(
     total_avail_pages -= request;
     ASSERT(total_avail_pages >= 0);
 
-    if ( d && d->global_claims && !(memflags & MEMF_no_refcount) )
+    if ( d && !(memflags & MEMF_no_refcount) )
     {
         /*
          * Adjust claims in the same locked region where total_avail_pages is
@@ -1131,7 +1400,7 @@ static struct page_info *alloc_heap_pages(
          * the domain being destroyed before creation is finished.  Losing part
          * of the claim makes no difference.
          */
-        claims_retire_global(d, request);
+        claims_retire_allocation(d, request, node);
     }
 
     check_low_mem_virq();
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 8f6708c0a7cd..a4f08248e6ee 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1276,6 +1276,36 @@ struct xen_domctl_get_domain_state {
     uint64_t unique_id;      /* Unique domain identifier. */
 };
 
+struct xen_memory_claim {
+    uint64_aligned_t pages; /* Number of pages to claim */
+    uint32_t target; /* Node and/or claim type like legacy or a global claim */
+    uint32_t pad;    /* Explicit padding: Reserved, initialize to 0 on input */
+};
+typedef struct xen_memory_claim memory_claim_t;
+DEFINE_XEN_GUEST_HANDLE(memory_claim_t);
+
+/* Special claim targets for the target field of memory_claim_t */
+#define XEN_DOMCTL_CLAIM_MEMORY_LEGACY 0x40000000U /* No node, legacy claim */
+#define XEN_DOMCTL_CLAIM_MEMORY_GLOBAL 0x80000000U /* No node, global claim */
+
+/*
+ * XEN_DOMCTL_claim_memory
+ *
+ * Claim memory for a guest domain. It sets aside an amount of memory
+ * (it is not pre-allocated) for the purpose of satisfying future memory
+ * allocation requests for building the guest's physical address space.
+ * Memory can be claimed on a set of nodes, or globally (without node
+ * affinity), or with legacy behavior. The set of claims is a claim set. See
+ * docs/guest-guide/dom/DOMCTL_claim_memory.rsti and docs/designs/claims/.
+ */
+struct xen_domctl_claim_memory {
+    /* IN: Array of struct xen_memory_claim */
+    XEN_GUEST_HANDLE_64(memory_claim_t) claims;
+    /* IN: Number of claims in the claims array handle. */
+    uint32_t nr_claims;
+    uint32_t pad;  /* Explicit padding: Reserved, initialize to 0 on input */
+};
+
 struct xen_domctl {
 /* Stable domctl ops: interface_version is required to be 0.  */
     uint32_t cmd;
@@ -1368,6 +1398,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_gsi_permission                88
 #define XEN_DOMCTL_set_llc_colors                89
 #define XEN_DOMCTL_get_domain_state              90 /* stable interface */
+#define XEN_DOMCTL_claim_memory                  91
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1436,6 +1467,7 @@ struct xen_domctl {
 #endif
         struct xen_domctl_set_llc_colors    set_llc_colors;
         struct xen_domctl_get_domain_state  get_domain_state;
+        struct xen_domctl_claim_memory      claim_memory;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index bd9fc37b5297..ccec095f8660 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -569,6 +569,15 @@ DEFINE_XEN_GUEST_HANDLE(xen_mem_sharing_op_t);
  * for 10, only 7 additional pages are claimed.
  *
  * Caller must be privileged or the hypercall fails.
+ *
+ * Note: This hypercall is deprecated by XEN_DOMCTL_claim_memory
+ * which provides the same claim semantics described above, and thus can be
+ * used as drop-in replacement and is extended for NUMA-node-specific claims.
+ * This hypercall should not be used by new code.
+ *
+ * See the following documentation pages for more information:
+ * docs/guest-guide/dom/DOMCTL_claim_memory.rst
+ * docs/guest-guide/mem/XENMEM_claim_pages.rst
  */
 #define XENMEM_claim_pages                  24
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index b80bec00c124..b2d6a6f266ba 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -69,6 +69,7 @@
 #include <xen/list.h>
 #include <xen/spinlock.h>
 #include <xen/perfc.h>
+#include <public/domctl.h>
 #include <public/memory.h>
 
 struct page_info;
@@ -131,6 +132,8 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
 /* Claim handling */
 unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
     long pages);
+int domain_install_claim_set(struct domain *d, unsigned int nr_claims,
+                             memory_claim_t *claims);
 int domain_set_outstanding_pages(struct domain *d, unsigned long pages);
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 2995c99aa34a..d31f4546e3b0 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -417,6 +417,12 @@ struct domain
     /* All claims are protected by the heap_lock */
     unsigned int     global_claims;     /* Global Host-level claims */
     unsigned int     node_claims;       /* Sum of the Node-specific claims */
+    /*
+     * struct domain is allocated in a dedicated page with more than enough
+     * spare capacity. It's efficient to use that page to store the
+     * per-node claims in it instead allocating a separate array for it.
+     */
+    unsigned int     claims[MAX_NUMNODES]; /* Array of per-NUMA-node claims */
 
     unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
diff --git a/xen/xsm/flask/hooks.c b/xen/xsm/flask/hooks.c
index b250b2706535..adfcf081a33c 100644
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
index ce907d50a45e..77db6f4cb38e 100644
--- a/xen/xsm/flask/policy/access_vectors
+++ b/xen/xsm/flask/policy/access_vectors
@@ -218,6 +218,7 @@ class domain2
 # XEN_DOMCTL_scheduler_op with XEN_DOMCTL_SCHEDOP_putinfo
     setscheduler
 # XENMEM_claim_pages
+# XEN_DOMCTL_claim_memory
     setclaim
 # XEN_DOMCTL_cacheflush
     cacheflush
-- 
2.39.5


