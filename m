Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFEFHsaKGWoJxggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 14:47:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FACB6026BF
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 14:47:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321936.1588368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwbU-0008P6-OW; Fri, 29 May 2026 12:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321936.1588368; Fri, 29 May 2026 12:46:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwbU-0008MG-LU; Fri, 29 May 2026 12:46:20 +0000
Received: by outflank-mailman (input) for mailman id 1321936;
 Fri, 29 May 2026 12:46:19 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wSwbT-0008Lb-6s
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 12:46:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSwbS-00B4Cd-Ju
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:46:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198a86-e002-0a2a0a5209dd-0a2a4507e3ba-40
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:46:18 +0200
Received: from [160.101.131.8] (helo=na1pdmzitismtp01.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198a99-229c-0a2a45070019-a06583089fb8-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:46:18 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id BFEBA439EC2B;
 Fri, 29 May 2026 08:45:12 -0400 (EDT)
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
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tim Deegan <tim@xen.org>
Subject: [PATCH 1/7] xen/mm: Normalize common per-domain page counters to unsigned long
Date: Fri, 29 May 2026 13:43:55 +0100
Message-Id: <2a2bb3c2f32a82e722cf2e912f8b71443f67fd9b.1780058608.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780058608.git.bernhard.kaindl@citrix.com>
References: <cover.1780058608.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780058778-20D67C48-3BAB7ABE/0/0
X-purgate-type: clean
X-purgate-size: 8007
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:mid,citrix.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.993];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: 0FACB6026BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Prepare common code for >16 TiB domains by normalizing the per-domain
page counts in struct domain (tot_pages, xenheap_pages, extra_pages,
outstanding_pages, max_pages, node_claims and claims[MAX_NUMNODES])
to unsigned long and update related code accordingly:

- Update format specifiers for widened types across affected files. NB:
  - shr_pages and paged_pages are atomic_t; their formats are %d.
  - pod.entry_count in p2m-pod.c is unsigned long; %lu is correct.

Updates for domain_tot_pages():
- unsigned int domain_tot_pages(d) -> unsigned long domain_tot_pages(d).
- assign_pages(): Assign domain_tot_pages(d) to unsigned long likewise.
- sh_min_allocation(): 0U -> 0UL for unsigned long domain_tot_pages().

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/arch/x86/mm/p2m-pod.c       |  2 +-
 xen/arch/x86/mm/shadow/common.c |  2 +-
 xen/common/grant_table.c        |  2 +-
 xen/common/keyhandler.c         |  8 ++++----
 xen/common/numa.c               |  2 +-
 xen/common/page_alloc.c         |  8 ++++----
 xen/include/xen/sched.h         | 16 ++++++++--------
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 7a0bebd2d3b5..14d18b726e80 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -1270,7 +1270,7 @@ p2m_pod_demand_populate(struct p2m_domain *p2m, gfn_t gfn,
 out_of_memory:
     pod_unlock_and_flush(p2m);
 
-    printk("%s: Dom%d out of PoD memory! (tot=%"PRIu32" ents=%ld dom%d)\n",
+    printk("%s: Dom%d out of PoD memory! (tot=%lu ents=%lu dom%d)\n",
            __func__, d->domain_id, domain_tot_pages(d),
            p2m->pod.entry_count, current->domain->domain_id);
     domain_crash(d);
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index ed698fa90bc7..e300898fe789 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -768,7 +768,7 @@ static unsigned int sh_min_allocation(const struct domain *d)
      * up of slot zero and an LAPIC page), plus one for HVM's 1-to-1 pagetable.
      */
     unsigned int extra = max(domain_tot_pages(d) / 256,
-                             is_hvm_domain(d) ? CONFIG_PAGING_LEVELS + 2 : 0U) +
+                             is_hvm_domain(d) ? CONFIG_PAGING_LEVELS + 2 : 0UL) +
                          is_hvm_domain(d);
 
     return shadow_min_acceptable_pages(d) +
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ac9fed600101..3c1f8876da22 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2396,7 +2396,7 @@ gnttab_transfer(
                          e->domain_id);
             else
                 gdprintk(XENLOG_INFO,
-                         "Transferee %pd has no headroom (tot %u, max %u, ex %u)\n",
+                         "Transferee %pd has no headroom (tot %lu, max %lu, ex %lu)\n",
                          e, domain_tot_pages(e), e->max_pages, e->extra_pages);
 
             gop.status = GNTST_general_error;
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index cb6df2823b00..b1cb9e7ba8d9 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -278,14 +278,14 @@ static void cf_check dump_domains(unsigned char key)
         printk("    refcnt=%d dying=%d pause_count=%d\n",
                atomic_read(&d->refcnt), d->is_dying,
                atomic_read(&d->pause_count));
-        printk("    nr_pages=%u xenheap_pages=%u"
+        printk("    nr_pages=%lu xenheap_pages=%lu"
 #ifdef CONFIG_MEM_SHARING
-               " shared_pages=%u"
+               " shared_pages=%d"
 #endif
 #ifdef CONFIG_MEM_PAGING
-               " paged_pages=%u"
+               " paged_pages=%d"
 #endif
-               " dirty_cpus={%*pbl} max_pages=%u\n",
+               " dirty_cpus={%*pbl} max_pages=%lu\n",
                domain_tot_pages(d), d->xenheap_pages,
 #ifdef CONFIG_MEM_SHARING
                atomic_read(&d->shr_pages),
diff --git a/xen/common/numa.c b/xen/common/numa.c
index ad75955a1622..8c561578615c 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -743,7 +743,7 @@ static void cf_check dump_numa(unsigned char key)
 
         process_pending_softirqs();
 
-        printk("%pd (total: %u):\n", d, domain_tot_pages(d));
+        printk("%pd (total: %lu):\n", d, domain_tot_pages(d));
 
         memset(page_num_node, 0, sizeof(page_num_node));
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1801afc96a0a..3f8b300d8c29 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2892,11 +2892,11 @@ int assign_pages(
     }
     else if ( !(memflags & MEMF_no_refcount) )
     {
-        unsigned int tot_pages = domain_tot_pages(d);
+        unsigned long tot_pages = domain_tot_pages(d);
 
         if ( unlikely(tot_pages > d->max_pages) )
         {
-            gprintk(XENLOG_INFO, "Inconsistent allocation for %pd: %u > %u\n",
+            gprintk(XENLOG_INFO, "Inconsistent allocation for %pd: %lu > %lu\n",
                     d, tot_pages, d->max_pages);
             rc = -EPERM;
             goto out;
@@ -2904,7 +2904,7 @@ int assign_pages(
 
         if ( unlikely(nr > d->max_pages - tot_pages) )
         {
-            gprintk(XENLOG_INFO, "Over-allocation for %pd: %Lu > %u\n",
+            gprintk(XENLOG_INFO, "Over-allocation for %pd: %Lu > %lu\n",
                     d, tot_pages + 0ULL + nr, d->max_pages);
             rc = -E2BIG;
             goto out;
@@ -2916,7 +2916,7 @@ int assign_pages(
         if ( unlikely(d->tot_pages + nr < nr) )
         {
             gprintk(XENLOG_INFO,
-                    "Excess allocation for %pd: %Lu (%u extra)\n",
+                    "Excess allocation for %pd: %Lu (%lu extra)\n",
                     d, d->tot_pages + 0ULL + nr, d->extra_pages);
             if ( pg[0].count_info & PGC_extra )
                 d->extra_pages -= nr;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index f671e0c4c7b3..ee9d4a7ff9e3 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -414,17 +414,17 @@ struct domain
      * This field should only be directly accessed by domain_adjust_tot_pages()
      * and the domain_tot_pages() helper function defined below.
      */
-    unsigned int     tot_pages;
+    unsigned long    tot_pages;
 
-    unsigned int     xenheap_pages;     /* pages allocated from Xen heap */
+    unsigned long    xenheap_pages;     /* pages allocated from Xen heap */
     /* Pages claimed but not possessed, protected by global heap_lock. */
-    unsigned int     outstanding_pages;
-    unsigned int     node_claims;       /* Sum of per-node claims. */
+    unsigned long    outstanding_pages;
+    unsigned long    node_claims;       /* Sum of per-node claims. */
     /* Domain objects use dedicated pages, leaving room for per-node claims. */
-    unsigned int     claims[MAX_NUMNODES]; /* Per-NUMA-node claims. */
+    unsigned long    claims[MAX_NUMNODES]; /* Per-NUMA-node claims. */
 
-    unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
-    unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
+    unsigned long    max_pages;         /* maximum value for domain_tot_pages() */
+    unsigned long    extra_pages;       /* pages not included in domain_tot_pages() */
 
 #ifdef CONFIG_MEM_SHARING
     atomic_t         shr_pages;         /* shared pages */
@@ -691,7 +691,7 @@ static inline struct page_list_head *page_to_list(
 }
 
 /* Return number of pages currently posessed by the domain */
-static inline unsigned int domain_tot_pages(const struct domain *d)
+static inline unsigned long domain_tot_pages(const struct domain *d)
 {
     ASSERT(d->extra_pages <= d->tot_pages);
 
-- 
2.39.5


