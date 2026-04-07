Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCx3G8vV1GnuxwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:00:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050B83AC711
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:00:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274692.1560734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3EZ-0006sw-76; Tue, 07 Apr 2026 10:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274692.1560734; Tue, 07 Apr 2026 10:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3EZ-0006qa-3t; Tue, 07 Apr 2026 10:00:35 +0000
Received: by outflank-mailman (input) for mailman id 1274692;
 Tue, 07 Apr 2026 10:00:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wA3EX-0006qU-Fv
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 10:00:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3EW-00BX2n-S5
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 12:00:32 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69d4d5bc-5cb7-0a2a0a5109dd-0a2a4508c27c-36
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:00:32 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 69d4d5bf-fab6-0a2a45080019-a065830986ba-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 12:00:32 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id A239A818B931;
 Tue,  7 Apr 2026 05:59:41 -0400 (EDT)
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
Subject: [PATCH 4/5] xen/mm: Split d->outstanding_pages to global_claims & node_claims
Date: Tue,  7 Apr 2026 10:54:29 +0100
Message-Id: <e79c792ca8e624f49a74f98539cbe6e1272f96ff.1775505670.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1775505670.git.bernhard.kaindl@citrix.com>
References: <cover.1775505670.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1775556032-F694D497-7F31FCBA/0/0
X-purgate-type: clean
X-purgate-size: 6932
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:mid];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.793];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: 050B83AC711
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In preparation for extending claims, rename d->outstanding_pages
to d->global_claims to keep the naming easy to reason about with
the addition of NUMA node claims.

Add d->node_claims as the aggregate of the domain's node claims
for the hot path of the allocator and include it together with
d->global_claims when reporting the total claims state of d.

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/common/domctl.c     |  2 +-
 xen/common/page_alloc.c | 33 +++++++++++++++------------------
 xen/include/xen/sched.h |  7 +++++--
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 93738931c575..2cc5a4ff32fd 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -97,7 +97,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info)
 
     info->tot_pages         = domain_tot_pages(d);
     info->max_pages         = d->max_pages;
-    info->outstanding_pages = d->outstanding_pages;
+    info->outstanding_pages = d->global_claims + d->node_claims;
 #ifdef CONFIG_MEM_SHARING
     info->shr_pages         = atomic_read(&d->shr_pages);
 #endif
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 95bae26d1c1f..a4d71f844889 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -540,12 +540,12 @@ static unsigned long claims_retire_global(struct domain *d,
     ASSERT(spin_is_locked(&heap_lock));
 
     /* If the withdrawal is larger than the claims, don't withdraw beyond */
-    retired = min(d->outstanding_pages + 0UL, pages_to_retire);
+    retired = min(d->global_claims + 0UL, pages_to_retire);
 
     /* Assert the invariant of outstanding_claims not going negative */
     ASSERT(retired <= outstanding_claims);
     outstanding_claims -= retired;
-    d->outstanding_pages -= retired;
+    d->global_claims -= retired;
     return retired;
 }
 
@@ -557,8 +557,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
     /*
      * Two locks are needed here:
      *  - d->page_alloc_lock: protects accesses to d->{tot,max,extra}_pages.
-     *  - heap_lock: protects accesses to d->outstanding_pages, total_avail_pages
-     *    and outstanding_claims.
+     *  - heap_lock: Protects accesses to the claims and avail_pages state.
      */
     nrspin_lock(&d->page_alloc_lock);
     spin_lock(&heap_lock);
@@ -566,13 +565,13 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
     /* pages==0 means "unset" the claim. */
     if ( pages == 0 )
     {
-        claims_retire_global(d, d->outstanding_pages);
+        claims_retire_global(d, d->global_claims);
         ret = 0;
         goto out;
     }
 
-    /* only one active claim per domain please */
-    if ( d->outstanding_pages )
+    /* Reject updating global claims and we can't update node claims */
+    if ( d->global_claims || d->node_claims )
     {
         ret = -EINVAL;
         goto out;
@@ -599,8 +598,8 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
         goto out;
 
     /* yay, claim fits in available memory, stake the claim, success! */
-    d->outstanding_pages = claim;
-    outstanding_claims += d->outstanding_pages;
+    d->global_claims = claim;
+    outstanding_claims += claim;
     ret = 0;
 
 out:
@@ -896,7 +895,7 @@ static bool claims_permit_request(const struct domain *d,
                                   unsigned int memflags,
                                   unsigned long requested_pages)
 {
-    unsigned long unclaimed_pages;
+    unsigned long unclaimed_pages, applicable_claims;
 
     ASSERT(spin_is_locked(&heap_lock));
     ASSERT(avail_pages >= competing_claims);
@@ -919,7 +918,7 @@ static bool claims_permit_request(const struct domain *d,
      * Allow the request to proceed when combination of unclaimed pages and the
      * claims held by the domain cover the shortfall for the requested_pages.
      */
-    return requested_pages <= unclaimed_pages + d->outstanding_pages;
+    return requested_pages <= unclaimed_pages + d->global_claims;
 }
 
 static struct page_info *get_free_buddy(unsigned int zone_lo,
@@ -1067,7 +1066,7 @@ static struct page_info *alloc_heap_pages(
      * is made by a domain with sufficient unclaimed pages.
      */
     if ( !claims_permit_request(d, total_avail_pages, outstanding_claims,
-                                memflags, request) )
+                                memflags, request, NUMA_NO_NODE) )
     {
         spin_unlock(&heap_lock);
         return NULL;
@@ -1117,18 +1116,16 @@ static struct page_info *alloc_heap_pages(
     total_avail_pages -= request;
     ASSERT(total_avail_pages >= 0);
 
-    if ( d && d->outstanding_pages && !(memflags & MEMF_no_refcount) )
+    if ( d && d->global_claims && !(memflags & MEMF_no_refcount) )
     {
         /*
          * Adjust claims in the same locked region where total_avail_pages is
          * adjusted, not doing so would lead to a window where the amount of
          * free memory (avail - claimed) would be incorrect.
          *
-         * Note that by adjusting the claimed amount here it's possible for
-         * pages to fail to be assigned to the claiming domain while already
-         * having been subtracted from d->outstanding_pages.  Such claimed
-         * amount is then lost, as the pages that fail to be assigned to the
-         * domain are freed without replenishing the claim.  This is fine given
+         * Note, after retiring claims for the allocation here, assign_pages()
+         * could fail. The domain looses The retired claims as the not assigned
+         * pages are freed without replenishing the claim.  This is fine given
          * claims are only to be used during physmap population as part of
          * domain build, and any failure in assign_pages() there will result in
          * the domain being destroyed before creation is finished.  Losing part
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 212c7d765c3e..2995c99aa34a 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -413,8 +413,11 @@ struct domain
     unsigned int     tot_pages;
 
     unsigned int     xenheap_pages;     /* pages allocated from Xen heap */
-    /* Pages claimed but not possessed, protected by global heap_lock. */
-    unsigned int     outstanding_pages;
+
+    /* All claims are protected by the heap_lock */
+    unsigned int     global_claims;     /* Global Host-level claims */
+    unsigned int     node_claims;       /* Sum of the Node-specific claims */
+
     unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
 
-- 
2.39.5


