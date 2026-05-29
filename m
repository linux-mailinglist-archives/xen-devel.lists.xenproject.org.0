Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5S/YIcaKGWosxggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 14:47:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BF36026C0
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2026 14:47:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1321952.1588378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwbl-0000SF-0c; Fri, 29 May 2026 12:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1321952.1588378; Fri, 29 May 2026 12:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wSwbk-0000Qc-T3; Fri, 29 May 2026 12:46:36 +0000
Received: by outflank-mailman (input) for mailman id 1321952;
 Fri, 29 May 2026 12:46:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <bernhard.kaindl@citrix.com>) id 1wSwbj-0000Q0-4W
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 12:46:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wSwbi-00B4Cd-HR
 for xen-devel@lists.xenproject.org; Fri, 29 May 2026 14:46:34 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198aa0-e002-0a2a0a5209dd-0a2a4507aa80-20
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:46:34 +0200
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <bernhard.kaindl@citrix.com>)
 id 6a198aa9-229c-0a2a45070019-a065830980c0-3
 for <xen-devel@lists.xenproject.org>; Fri, 29 May 2026 14:46:34 +0200
Received: from debian.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 3DAF88275E96;
 Fri, 29 May 2026 08:45:18 -0400 (EDT)
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
	Tim Deegan <tim@xen.org>
Subject: [PATCH 2/7] x86/mm: Normalize X86 per-domain page counters to unsigned long
Date: Fri, 29 May 2026 13:43:56 +0100
Message-Id: <21fa13ba303f59f14ace46cd0715b07f8ae99468.1780058608.git.bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1780058608.git.bernhard.kaindl@citrix.com>
References: <cover.1780058608.git.bernhard.kaindl@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780058794-23979C48-7BB0F2A9/0/0
X-purgate-type: clean
X-purgate-size: 16494
X-Spamd-Result: default: False [3.01 / 15.00];
	DMARC_POLICY_REJECT(2.00)[citrix.com : SPF not aligned (relaxed), No valid DKIM,reject];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:bernhard.kaindl@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:tim@xen.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel]
X-Rspamd-Queue-Id: 10BF36026C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Prepare x86 for >16 TiB domains by normalizing the per-domain page counts
in paging_domain (total_pages, free_pages, p2m_pages) to unsigned long
and widen page counts in related x86 allocation functions accordingly:

- paging_domain.{total,free,p2m}_pages: unsigned int -> unsigned long
- x86/mm/shadow/common.c:
  - unsigned long sh_min_allocation(d)
  - unsigned long shadow_min_acceptable_pages(d)
  - unsigned long shadow_get_allocation(d)
  - shadow_set_allocation(unsigned long pages)
  - shadow_enable(): fix narrowing from d->arch.paging.total_pages to
    unsigned int
- x86/mm/hap/hap.c:
  - unsigned long hap_get_allocation(d)
  - hap_set_allocation(unsigned long pages)
  - hap_enable(): fix narrowing from d->arch.paging.total_pages to
    unsigned int
- x86/mm/paging.c:
  - paging_set_allocation(unsigned long pages)
  - arch_set_paging_mempool_size() don't truncate pages

Note: pages in _shadow_prealloc(), shadow_alloc(), shadow_free() and
shadow_prealloc() is intentionally kept as unsigned int.  It carries
the per-shadow-entry page count from shadow_size() (uint8_t-backed,
max 4), not the pool allocation count.

Note: xen_domctl_shadow_op.mb stays uint32_t, and the domctl ABI remains
MB-based and caps at 4 PiB, replacing the 16 TiB per-domain limit.
Casts widen the mb-to-pages arithmetic to unsigned long where needed.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 xen/arch/x86/include/asm/domain.h |  6 ++---
 xen/arch/x86/include/asm/hap.h    |  4 +--
 xen/arch/x86/include/asm/paging.h |  2 +-
 xen/arch/x86/include/asm/shadow.h |  2 +-
 xen/arch/x86/mm/hap/hap.c         | 19 +++++++-------
 xen/arch/x86/mm/paging.c          |  9 +++----
 xen/arch/x86/mm/shadow/common.c   | 42 +++++++++++++++----------------
 7 files changed, 41 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index 385a6666dafa..d3021a863353 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -221,9 +221,9 @@ struct paging_domain {
 
     /* Memory allocation (common to shadow and HAP) */
     struct page_list_head   freelist;
-    unsigned int            total_pages;  /* number of pages allocated */
-    unsigned int            free_pages;   /* number of pages on freelists */
-    unsigned int            p2m_pages;    /* number of pages allocated to p2m */
+    unsigned long           total_pages;  /* number of pages allocated */
+    unsigned long           free_pages;   /* number of pages on freelists */
+    unsigned long           p2m_pages;    /* number of pages allocated to p2m */
 
     /* log dirty support */
     struct log_dirty_domain log_dirty;
diff --git a/xen/arch/x86/include/asm/hap.h b/xen/arch/x86/include/asm/hap.h
index f01ce73fb4f3..061181724e90 100644
--- a/xen/arch/x86/include/asm/hap.h
+++ b/xen/arch/x86/include/asm/hap.h
@@ -33,8 +33,8 @@ int   hap_track_dirty_vram(struct domain *d,
                            XEN_GUEST_HANDLE(void) guest_dirty_bitmap);
 
 extern const struct paging_mode *hap_paging_get_mode(struct vcpu *v);
-int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted);
-unsigned int hap_get_allocation(struct domain *d);
+int hap_set_allocation(struct domain *d, unsigned long pages, bool *preempted);
+unsigned long hap_get_allocation(struct domain *d);
 
 #endif /* XEN_HAP_H */
 
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 291ab386e865..fd52290cfe89 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -310,7 +310,7 @@ void paging_dump_vcpu_info(struct vcpu *v);
  * Input might be rounded up to at minimum amount of pages, plus
  * space for the p2m table.
  * Returns 0 for success, non-zero for failure. */
-int paging_set_allocation(struct domain *d, unsigned int pages,
+int paging_set_allocation(struct domain *d, unsigned long pages,
                           bool *preempted);
 
 /* Is gfn within maxphysaddr for the domain? */
diff --git a/xen/arch/x86/include/asm/shadow.h b/xen/arch/x86/include/asm/shadow.h
index 60589c3cacee..8aac018132ac 100644
--- a/xen/arch/x86/include/asm/shadow.h
+++ b/xen/arch/x86/include/asm/shadow.h
@@ -91,7 +91,7 @@ void shadow_blow_tables_per_domain(struct domain *d);
  * Input will be rounded up to at least shadow_min_acceptable_pages(),
  * plus space for the p2m table.
  * Returns 0 for success, non-zero for failure. */
-int shadow_set_allocation(struct domain *d, unsigned int pages,
+int shadow_set_allocation(struct domain *d, unsigned long pages,
                           bool *preempted);
 
 /* Helper to invoke for deferred releasing of a top-level shadow's reference. */
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 5ccb80bda5d3..ccea676c361b 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -327,18 +327,18 @@ static void cf_check hap_free_p2m_page(struct domain *d, struct page_info *pg)
 }
 
 /* Return the size of the pool, rounded up to the nearest MB */
-unsigned int hap_get_allocation(struct domain *d)
+unsigned long hap_get_allocation(struct domain *d)
 {
-    unsigned int pg = d->arch.paging.total_pages
+    unsigned long pg = d->arch.paging.total_pages
         + d->arch.paging.p2m_pages;
 
     return ((pg >> (20 - PAGE_SHIFT))
-            + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
+            + ((pg & ((1UL << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
 }
 
 /* Set the pool of pages to the required number of pages.
  * Returns 0 for success, non-zero for failure. */
-int hap_set_allocation(struct domain *d, unsigned int pages, bool *preempted)
+int hap_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 {
     struct page_info *pg;
 
@@ -456,7 +456,6 @@ void hap_domain_init(struct domain *d)
 /* return 0 for success, -errno for failure */
 int hap_enable(struct domain *d, u32 mode)
 {
-    unsigned int old_pages;
     unsigned int i;
     int rv = 0;
 
@@ -469,8 +468,7 @@ int hap_enable(struct domain *d, u32 mode)
 
     domain_pause(d);
 
-    old_pages = d->arch.paging.total_pages;
-    if ( old_pages == 0 )
+    if ( d->arch.paging.total_pages == 0UL )
     {
         paging_lock(d);
         rv = hap_set_allocation(d, 256, NULL);
@@ -623,14 +621,14 @@ void hap_teardown(struct domain *d, bool *preempted)
 
     paging_lock(d); /* Keep various asserts happy */
 
-    if ( d->arch.paging.total_pages != 0 )
+    if ( d->arch.paging.total_pages != 0UL )
     {
         hap_set_allocation(d, 0, preempted);
 
         if ( preempted && *preempted )
             goto out;
 
-        ASSERT(d->arch.paging.total_pages == 0);
+        ASSERT(d->arch.paging.total_pages == 0UL);
     }
 
     d->arch.paging.mode &= ~PG_log_dirty;
@@ -651,7 +649,8 @@ int hap_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
     {
     case XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION:
         paging_lock(d);
-        rc = hap_set_allocation(d, sc->mb << (20 - PAGE_SHIFT), &preempted);
+        rc = hap_set_allocation(d, (unsigned long)sc->mb << (20 - PAGE_SHIFT),
+                                &preempted);
         paging_unlock(d);
         if ( preempted )
             /* Not finished.  Set up to re-run the call. */
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 2396f81ad54a..fa269b8cf39c 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -812,7 +812,7 @@ void paging_final_teardown(struct domain *d)
 {
     bool hap = hap_enabled(d);
 
-    PAGING_PRINTK("%pd start: total = %u, free = %u, p2m = %u\n",
+    PAGING_PRINTK("%pd start: total = %lu, free = %lu, p2m = %lu\n",
                   d, d->arch.paging.total_pages,
                   d->arch.paging.free_pages, d->arch.paging.p2m_pages);
 
@@ -834,7 +834,7 @@ void paging_final_teardown(struct domain *d)
     /* It is now safe to pull down the p2m map. */
     p2m_teardown(p2m_get_hostp2m(d), true, NULL);
 
-    PAGING_PRINTK("%pd done: total = %u, free = %u, p2m = %u\n",
+    PAGING_PRINTK("%pd done: total = %lu, free = %lu, p2m = %lu\n",
                   d, d->arch.paging.total_pages,
                   d->arch.paging.free_pages, d->arch.paging.p2m_pages);
     ASSERT(!d->arch.paging.p2m_pages);
@@ -941,7 +941,7 @@ void paging_update_nestedmode(struct vcpu *v)
     hvm_asid_flush_vcpu(v);
 }
 
-int __init paging_set_allocation(struct domain *d, unsigned int pages,
+int __init paging_set_allocation(struct domain *d, unsigned long pages,
                                  bool *preempted)
 {
     int rc;
@@ -983,8 +983,7 @@ int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
     if ( is_pv_domain(d) )                 /* TODO: Relax in due course */
         return -EOPNOTSUPP;
 
-    if ( size & ~PAGE_MASK ||              /* Non page-sized request? */
-         pages != (unsigned int)pages )    /* Overflow $X_set_allocation()? */
+    if ( size & ~PAGE_MASK )               /* Non page-sized request? */
         return -EINVAL;
 
     paging_lock(d);
diff --git a/xen/arch/x86/mm/shadow/common.c b/xen/arch/x86/mm/shadow/common.c
index e300898fe789..814907cec31e 100644
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -302,7 +302,7 @@ sh_validate_guest_entry(struct vcpu *v, mfn_t gmfn, void *entry, u32 size)
  * allow for more than ninety allocated pages per vcpu.  We round that
  * up to 128 pages, or half a megabyte per vcpu.
  */
-static unsigned int shadow_min_acceptable_pages(const struct domain *d)
+static unsigned long shadow_min_acceptable_pages(const struct domain *d)
 {
     return d->max_vcpus * 128;
 }
@@ -408,7 +408,7 @@ static bool __must_check _shadow_prealloc(struct domain *d, unsigned int pages)
     /* Nothing more we can do: all remaining shadows are of pages that
      * hold Xen mappings for some vcpu.  This can never happen. */
     printk(XENLOG_ERR "Can't pre-allocate %u shadow pages!\n"
-           "  shadow pages total = %u, free = %u, p2m=%u\n",
+           "  shadow pages total = %lu, free = %lu, p2m=%lu\n",
            pages, d->arch.paging.total_pages,
            d->arch.paging.free_pages, d->arch.paging.p2m_pages);
 
@@ -709,7 +709,7 @@ shadow_alloc_p2m_page(struct domain *d)
         {
             d->arch.paging.p2m_alloc_failed = 1;
             dprintk(XENLOG_ERR,
-                    "d%d failed to allocate from shadow pool (tot=%u p2m=%u min=%u)\n",
+                    "d%d failed to allocate from shadow pool (tot=%lu p2m=%lu min=%lu)\n",
                     d->domain_id, d->arch.paging.total_pages,
                     d->arch.paging.p2m_pages,
                     shadow_min_acceptable_pages(d));
@@ -760,22 +760,22 @@ shadow_free_p2m_page(struct domain *d, struct page_info *pg)
     paging_unlock(d);
 }
 
-static unsigned int sh_min_allocation(const struct domain *d)
+static unsigned long sh_min_allocation(const struct domain *d)
 {
     /*
      * Don't allocate less than the minimum acceptable, plus one page per
      * megabyte of RAM (for the p2m table, minimally enough for HVM's setting
      * up of slot zero and an LAPIC page), plus one for HVM's 1-to-1 pagetable.
      */
-    unsigned int extra = max(domain_tot_pages(d) / 256,
-                             is_hvm_domain(d) ? CONFIG_PAGING_LEVELS + 2 : 0UL) +
-                         is_hvm_domain(d);
+    unsigned long extra = max(domain_tot_pages(d) / 256,
+                              is_hvm_domain(d) ? CONFIG_PAGING_LEVELS + 2 : 0UL) +
+                          is_hvm_domain(d);
 
     return shadow_min_acceptable_pages(d) +
            max(extra, d->arch.paging.p2m_pages);
 }
 
-int shadow_set_allocation(struct domain *d, unsigned int pages, bool *preempted)
+int shadow_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
 {
     struct page_info *sp;
 
@@ -784,14 +784,14 @@ int shadow_set_allocation(struct domain *d, unsigned int pages, bool *preempted)
     if ( pages > 0 )
     {
         /* Check for minimum value. */
-        unsigned int lower_bound = sh_min_allocation(d);
+        unsigned long lower_bound = sh_min_allocation(d);
 
         if ( pages < lower_bound )
             pages = lower_bound;
         pages -= d->arch.paging.p2m_pages;
     }
 
-    SHADOW_PRINTK("current %i target %i\n",
+    SHADOW_PRINTK("current %lu target %lu\n",
                    d->arch.paging.total_pages, pages);
 
     for ( ; ; )
@@ -846,12 +846,12 @@ int shadow_set_allocation(struct domain *d, unsigned int pages, bool *preempted)
 }
 
 /* Return the size of the shadow pool, rounded up to the nearest MB */
-static unsigned int shadow_get_allocation(struct domain *d)
+static unsigned long shadow_get_allocation(struct domain *d)
 {
-    unsigned int pg = d->arch.paging.total_pages
+    unsigned long pg = d->arch.paging.total_pages
         + d->arch.paging.p2m_pages;
     return ((pg >> (20 - PAGE_SHIFT))
-            + ((pg & ((1 << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
+            + ((pg & ((1UL << (20 - PAGE_SHIFT)) - 1)) ? 1 : 0));
 }
 
 /**************************************************************************/
@@ -2085,7 +2085,6 @@ int shadow_enable(struct domain *d, u32 mode)
  * disabled.
  * Returns 0 for success, -errno for failure. */
 {
-    unsigned int old_pages;
     struct page_info *pg = NULL;
     uint32_t *e;
     int rv = 0;
@@ -2103,8 +2102,7 @@ int shadow_enable(struct domain *d, u32 mode)
     }
 
     /* Init the shadow memory allocation if the user hasn't done so */
-    old_pages = d->arch.paging.total_pages;
-    if ( old_pages < sh_min_allocation(d) )
+    if ( d->arch.paging.total_pages < sh_min_allocation(d) )
     {
         paging_lock(d);
         rv = shadow_set_allocation(d, 1024, NULL); /* Use at least 4MB */
@@ -2283,7 +2281,7 @@ void shadow_teardown(struct domain *d, bool *preempted)
     }
 #endif /* (SHADOW_OPTIMIZATIONS & (SHOPT_VIRTUAL_TLB|SHOPT_OUT_OF_SYNC)) */
 
-    if ( d->arch.paging.total_pages != 0 )
+    if ( d->arch.paging.total_pages != 0UL )
     {
         /* Destroy all the shadows and release memory to domheap */
         shadow_set_allocation(d, 0, preempted);
@@ -2295,7 +2293,7 @@ void shadow_teardown(struct domain *d, bool *preempted)
         if (d->arch.paging.shadow.hash_table)
             shadow_hash_teardown(d);
 
-        ASSERT(d->arch.paging.total_pages == 0);
+        ASSERT(d->arch.paging.total_pages == 0UL);
     }
 
     /* Free the non-paged-vcpus pagetable; must happen after we've
@@ -2410,7 +2408,7 @@ static int shadow_one_bit_disable(struct domain *d, u32 mode)
     {
         /* Get this domain off shadows */
         SHADOW_PRINTK("un-shadowing of domain %u starts."
-                       "  Shadow pages total = %u, free = %u, p2m=%u\n",
+                       "  Shadow pages total = %lu, free = %lu, p2m=%lu\n",
                        d->domain_id, d->arch.paging.total_pages,
                        d->arch.paging.free_pages, d->arch.paging.p2m_pages);
         for_each_vcpu(d, v)
@@ -2441,7 +2439,7 @@ static int shadow_one_bit_disable(struct domain *d, u32 mode)
             BUG(); /* In fact, we will have BUG()ed already */
         shadow_hash_teardown(d);
         SHADOW_PRINTK("un-shadowing of domain %u done."
-                       "  Shadow pages total = %u, free = %u, p2m=%u\n",
+                       "  Shadow pages total = %lu, free = %lu, p2m=%lu\n",
                        d->domain_id, d->arch.paging.total_pages,
                        d->arch.paging.free_pages, d->arch.paging.p2m_pages);
     }
@@ -2573,7 +2571,9 @@ int shadow_domctl(struct domain *d,
             paging_unlock(d);
             return -EINVAL;
         }
-        rc = shadow_set_allocation(d, sc->mb << (20 - PAGE_SHIFT), &preempted);
+        rc = shadow_set_allocation(d,
+                                   (unsigned long)sc->mb << (20 - PAGE_SHIFT),
+                                   &preempted);
         paging_unlock(d);
         if ( preempted )
             /* Not finished.  Set up to re-run the call. */
-- 
2.39.5


