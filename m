Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A545588E894
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 16:23:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698601.1090491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV6v-0007if-Li; Wed, 27 Mar 2024 15:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698601.1090491; Wed, 27 Mar 2024 15:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV6v-0007gA-H9; Wed, 27 Mar 2024 15:22:41 +0000
Received: by outflank-mailman (input) for mailman id 698601;
 Wed, 27 Mar 2024 15:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rpV6u-0007fn-EF
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 15:22:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d84f055e-ec4d-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 16:22:38 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CFEAA5FF5A;
 Wed, 27 Mar 2024 15:22:37 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 53EBB13215;
 Wed, 27 Mar 2024 15:22:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id enLTEr05BGZqfQAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 27 Mar 2024 15:22:37 +0000
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
X-Inumbo-ID: d84f055e-ec4d-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HU+H+gC+IivP7v8BYwH4cbldKan0Qm9QDP70wtFCLOI=;
	b=MN9eZgY0qfMPhdRF/3BSZq9YkhkZG0013tMUplr8gu1JpUrBOvBmaGHCLJw/h3WsumyCJo
	DZGhOhlbKuzzRq98jkshXqFQramFzRda6bT67UfGuqUM9IdzkHEZoA1DFph2BwYSl3xKJK
	zQXPYE8kYC090+9hzeTantVavEd2kKs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552957; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HU+H+gC+IivP7v8BYwH4cbldKan0Qm9QDP70wtFCLOI=;
	b=MN9eZgY0qfMPhdRF/3BSZq9YkhkZG0013tMUplr8gu1JpUrBOvBmaGHCLJw/h3WsumyCJo
	DZGhOhlbKuzzRq98jkshXqFQramFzRda6bT67UfGuqUM9IdzkHEZoA1DFph2BwYSl3xKJK
	zQXPYE8kYC090+9hzeTantVavEd2kKs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [PATCH v6 1/8] xen/spinlock: add explicit non-recursive locking functions
Date: Wed, 27 Mar 2024 16:22:22 +0100
Message-Id: <20240327152229.25847-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240327152229.25847-1-jgross@suse.com>
References: <20240327152229.25847-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 8.80
X-Spamd-Result: default: False [8.80 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 RCPT_COUNT_TWELVE(0.00)[15];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: ********
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Flag: NO

In order to prepare a type-safe recursive spinlock structure, add
explicitly non-recursive locking functions to be used for non-recursive
locking of spinlocks, which are used recursively, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- rename functions (Jan Beulich)
- get rid of !! in pcidevs_locked() (Jan Beulich)
V5:
- remove spurious change (Julien Grall)
- add nrspin_lock() description (Julien Grall)
---
 xen/arch/arm/mm.c             |  4 ++--
 xen/arch/x86/domain.c         | 12 ++++++------
 xen/arch/x86/mm.c             | 12 ++++++------
 xen/arch/x86/mm/mem_sharing.c |  8 ++++----
 xen/arch/x86/mm/p2m-pod.c     |  4 ++--
 xen/arch/x86/mm/p2m.c         |  4 ++--
 xen/arch/x86/tboot.c          |  4 ++--
 xen/common/domctl.c           |  4 ++--
 xen/common/grant_table.c      | 10 +++++-----
 xen/common/memory.c           |  4 ++--
 xen/common/numa.c             |  4 ++--
 xen/common/page_alloc.c       | 16 ++++++++--------
 xen/drivers/char/console.c    | 16 ++++++++--------
 xen/include/xen/spinlock.h    | 29 +++++++++++++++++++++++------
 14 files changed, 74 insertions(+), 57 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b15a18a494..def939172c 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -105,7 +105,7 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
     if ( page_get_owner(page) == d )
         return;
 
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
 
     /*
      * The incremented type count pins as writable or read-only.
@@ -136,7 +136,7 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
         page_list_add_tail(page, &d->xenpage_list);
     }
 
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
 }
 
 int xenmem_add_to_physmap_one(
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index a11c55f921..33a2830d9d 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -212,7 +212,7 @@ void dump_pageframe_info(struct domain *d)
     {
         unsigned long total[MASK_EXTR(PGT_type_mask, PGT_type_mask) + 1] = {};
 
-        spin_lock(&d->page_alloc_lock);
+        nrspin_lock(&d->page_alloc_lock);
         page_list_for_each ( page, &d->page_list )
         {
             unsigned int index = MASK_EXTR(page->u.inuse.type_info,
@@ -231,13 +231,13 @@ void dump_pageframe_info(struct domain *d)
                    _p(mfn_x(page_to_mfn(page))),
                    page->count_info, page->u.inuse.type_info);
         }
-        spin_unlock(&d->page_alloc_lock);
+        nrspin_unlock(&d->page_alloc_lock);
     }
 
     if ( is_hvm_domain(d) )
         p2m_pod_dump_data(d);
 
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
 
     page_list_for_each ( page, &d->xenpage_list )
     {
@@ -253,7 +253,7 @@ void dump_pageframe_info(struct domain *d)
                page->count_info, page->u.inuse.type_info);
     }
 
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
 }
 
 void update_guest_memory_policy(struct vcpu *v,
@@ -2448,10 +2448,10 @@ int domain_relinquish_resources(struct domain *d)
             d->arch.auto_unmask = 0;
         }
 
-        spin_lock(&d->page_alloc_lock);
+        nrspin_lock(&d->page_alloc_lock);
         page_list_splice(&d->arch.relmem_list, &d->page_list);
         INIT_PAGE_LIST_HEAD(&d->arch.relmem_list);
-        spin_unlock(&d->page_alloc_lock);
+        nrspin_unlock(&d->page_alloc_lock);
 
     PROGRESS(xen):
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 62f5b811bb..b4d125db39 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -482,7 +482,7 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
 
     set_gpfn_from_mfn(mfn_x(page_to_mfn(page)), INVALID_M2P_ENTRY);
 
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
 
     /* The incremented type count pins as writable or read-only. */
     page->u.inuse.type_info =
@@ -502,7 +502,7 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
         page_list_add_tail(page, &d->xenpage_list);
     }
 
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
 }
 
 void make_cr3(struct vcpu *v, mfn_t mfn)
@@ -3597,11 +3597,11 @@ long do_mmuext_op(
             {
                 bool drop_ref;
 
-                spin_lock(&pg_owner->page_alloc_lock);
+                nrspin_lock(&pg_owner->page_alloc_lock);
                 drop_ref = (pg_owner->is_dying &&
                             test_and_clear_bit(_PGT_pinned,
                                                &page->u.inuse.type_info));
-                spin_unlock(&pg_owner->page_alloc_lock);
+                nrspin_unlock(&pg_owner->page_alloc_lock);
                 if ( drop_ref )
                 {
         pin_drop:
@@ -4424,7 +4424,7 @@ int steal_page(
      * that it might be upon return from alloc_domheap_pages with
      * MEMF_no_owner set.
      */
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
 
     BUG_ON(page->u.inuse.type_info & (PGT_count_mask | PGT_locked |
                                       PGT_pinned));
@@ -4436,7 +4436,7 @@ int steal_page(
     if ( !(memflags & MEMF_no_refcount) && !domain_adjust_tot_pages(d, -1) )
         drop_dom_ref = true;
 
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
 
     if ( unlikely(drop_dom_ref) )
         put_domain(d);
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index f58576c702..da28266ef0 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -740,11 +740,11 @@ static int page_make_private(struct domain *d, struct page_info *page)
     if ( !get_page(page, dom_cow) )
         return -EINVAL;
 
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
 
     if ( d->is_dying )
     {
-        spin_unlock(&d->page_alloc_lock);
+        nrspin_unlock(&d->page_alloc_lock);
         put_page(page);
         return -EBUSY;
     }
@@ -752,7 +752,7 @@ static int page_make_private(struct domain *d, struct page_info *page)
     expected_type = (PGT_shared_page | PGT_validated | PGT_locked | 2);
     if ( page->u.inuse.type_info != expected_type )
     {
-        spin_unlock(&d->page_alloc_lock);
+        nrspin_unlock(&d->page_alloc_lock);
         put_page(page);
         return -EEXIST;
     }
@@ -769,7 +769,7 @@ static int page_make_private(struct domain *d, struct page_info *page)
     if ( domain_adjust_tot_pages(d, 1) == 1 )
         get_knownalive_domain(d);
     page_list_add_tail(page, &d->page_list);
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
 
     put_page(page);
 
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 674f321cf6..c48ea169b7 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -27,7 +27,7 @@
 static always_inline void lock_page_alloc(struct p2m_domain *p2m)
 {
     page_alloc_mm_pre_lock(p2m->domain);
-    spin_lock(&(p2m->domain->page_alloc_lock));
+    nrspin_lock(&(p2m->domain->page_alloc_lock));
     page_alloc_mm_post_lock(p2m->domain,
                             p2m->domain->arch.page_alloc_unlock_level);
 }
@@ -35,7 +35,7 @@ static always_inline void lock_page_alloc(struct p2m_domain *p2m)
 static inline void unlock_page_alloc(struct p2m_domain *p2m)
 {
     page_alloc_mm_unlock(p2m->domain->arch.page_alloc_unlock_level);
-    spin_unlock(&(p2m->domain->page_alloc_lock));
+    nrspin_unlock(&(p2m->domain->page_alloc_lock));
 }
 
 /*
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 4c5a79eb53..ce742c12e0 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2234,7 +2234,7 @@ void audit_p2m(struct domain *d,
 
     /* Audit part two: walk the domain's page allocation list, checking
      * the m2p entries. */
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
     page_list_for_each ( page, &d->page_list )
     {
         mfn = mfn_x(page_to_mfn(page));
@@ -2286,7 +2286,7 @@ void audit_p2m(struct domain *d,
         P2M_PRINTK("OK: mfn=%#lx, gfn=%#lx, p2mfn=%#lx\n",
                    mfn, gfn, mfn_x(p2mfn));
     }
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
 
     pod_unlock(p2m);
     p2m_unlock(p2m);
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index 4c254b4e34..ba0700d2d5 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -205,14 +205,14 @@ static void tboot_gen_domain_integrity(const uint8_t key[TB_KEY_SIZE],
             continue;
         printk("MACing Domain %u\n", d->domain_id);
 
-        spin_lock(&d->page_alloc_lock);
+        nrspin_lock(&d->page_alloc_lock);
         page_list_for_each(page, &d->page_list)
         {
             void *pg = __map_domain_page(page);
             vmac_update(pg, PAGE_SIZE, &ctx);
             unmap_domain_page(pg);
         }
-        spin_unlock(&d->page_alloc_lock);
+        nrspin_unlock(&d->page_alloc_lock);
 
         if ( is_iommu_enabled(d) && is_vtd )
         {
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index d94a9dae91..17d67651a7 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -621,14 +621,14 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     {
         uint64_t new_max = op->u.max_mem.max_memkb >> (PAGE_SHIFT - 10);
 
-        spin_lock(&d->page_alloc_lock);
+        nrspin_lock(&d->page_alloc_lock);
         /*
          * NB. We removed a check that new_max >= current tot_pages; this means
          * that the domain will now be allowed to "ratchet" down to new_max. In
          * the meantime, while tot > max, all new allocations are disallowed.
          */
         d->max_pages = min(new_max, (uint64_t)(typeof(d->max_pages))-1);
-        spin_unlock(&d->page_alloc_lock);
+        nrspin_unlock(&d->page_alloc_lock);
         break;
     }
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 7708930882..e98e9da520 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2376,7 +2376,7 @@ gnttab_transfer(
             mfn = page_to_mfn(page);
         }
 
-        spin_lock(&e->page_alloc_lock);
+        nrspin_lock(&e->page_alloc_lock);
 
         /*
          * Check that 'e' will accept the page and has reservation
@@ -2387,7 +2387,7 @@ gnttab_transfer(
              unlikely(domain_tot_pages(e) >= e->max_pages) ||
              unlikely(!(e->tot_pages + 1)) )
         {
-            spin_unlock(&e->page_alloc_lock);
+            nrspin_unlock(&e->page_alloc_lock);
 
             if ( e->is_dying )
                 gdprintk(XENLOG_INFO, "Transferee d%d is dying\n",
@@ -2411,7 +2411,7 @@ gnttab_transfer(
          * safely drop the lock and re-aquire it later to add page to the
          * pagelist.
          */
-        spin_unlock(&e->page_alloc_lock);
+        nrspin_unlock(&e->page_alloc_lock);
         okay = gnttab_prepare_for_transfer(e, d, gop.ref);
 
         /*
@@ -2427,9 +2427,9 @@ gnttab_transfer(
              * Need to grab this again to safely free our "reserved"
              * page in the page total
              */
-            spin_lock(&e->page_alloc_lock);
+            nrspin_lock(&e->page_alloc_lock);
             drop_dom_ref = !domain_adjust_tot_pages(e, -1);
-            spin_unlock(&e->page_alloc_lock);
+            nrspin_unlock(&e->page_alloc_lock);
 
             if ( okay /* i.e. e->is_dying due to the surrounding if() */ )
                 gdprintk(XENLOG_INFO, "Transferee d%d is now dying\n",
diff --git a/xen/common/memory.c b/xen/common/memory.c
index b3b05c2ec0..b4593f5f45 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -770,10 +770,10 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
                               (1UL << in_chunk_order)) -
                              (j * (1UL << exch.out.extent_order)));
 
-                spin_lock(&d->page_alloc_lock);
+                nrspin_lock(&d->page_alloc_lock);
                 drop_dom_ref = (dec_count &&
                                 !domain_adjust_tot_pages(d, -dec_count));
-                spin_unlock(&d->page_alloc_lock);
+                nrspin_unlock(&d->page_alloc_lock);
 
                 if ( drop_dom_ref )
                     put_domain(d);
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 6374ba1721..28a09766fa 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -719,13 +719,13 @@ static void cf_check dump_numa(unsigned char key)
 
         memset(page_num_node, 0, sizeof(page_num_node));
 
-        spin_lock(&d->page_alloc_lock);
+        nrspin_lock(&d->page_alloc_lock);
         page_list_for_each ( page, &d->page_list )
         {
             i = page_to_nid(page);
             page_num_node[i]++;
         }
-        spin_unlock(&d->page_alloc_lock);
+        nrspin_unlock(&d->page_alloc_lock);
 
         for_each_online_node ( i )
             printk("    Node %u: %u\n", i, page_num_node[i]);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index c94834d71b..4d6ce726e3 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -516,7 +516,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
      * must always take the global heap_lock rather than only in the much
      * rarer case that d->outstanding_pages is non-zero
      */
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
     spin_lock(&heap_lock);
 
     /* pages==0 means "unset" the claim. */
@@ -562,7 +562,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
 
 out:
     spin_unlock(&heap_lock);
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
     return ret;
 }
 
@@ -2348,7 +2348,7 @@ int assign_pages(
     int rc = 0;
     unsigned int i;
 
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
 
     if ( unlikely(d->is_dying) )
     {
@@ -2430,7 +2430,7 @@ int assign_pages(
     }
 
  out:
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
     return rc;
 }
 
@@ -2909,9 +2909,9 @@ mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
     ASSERT_ALLOC_CONTEXT();
 
     /* Acquire a page from reserved page list(resv_page_list). */
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
     page = page_list_remove_head(&d->resv_page_list);
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
     if ( unlikely(!page) )
         return INVALID_MFN;
 
@@ -2930,9 +2930,9 @@ mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
      */
     unprepare_staticmem_pages(page, 1, false);
  fail:
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
     page_list_add_tail(page, &d->resv_page_list);
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
     return INVALID_MFN;
 }
 #endif
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ccd5f8cc14..22f50fc617 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -368,9 +368,9 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 
     if ( op->clear )
     {
-        spin_lock_irq(&console_lock);
+        nrspin_lock_irq(&console_lock);
         conringc = p - c > conring_size ? p - conring_size : c;
-        spin_unlock_irq(&console_lock);
+        nrspin_unlock_irq(&console_lock);
     }
 
     op->count = sofar;
@@ -638,7 +638,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( is_hardware_domain(cd) )
         {
             /* Use direct console output as it could be interactive */
-            spin_lock_irq(&console_lock);
+            nrspin_lock_irq(&console_lock);
 
             console_serial_puts(kbuf, kcount);
             video_puts(kbuf, kcount);
@@ -659,7 +659,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
                 tasklet_schedule(&notify_dom0_con_ring_tasklet);
             }
 
-            spin_unlock_irq(&console_lock);
+            nrspin_unlock_irq(&console_lock);
         }
         else
         {
@@ -1026,9 +1026,9 @@ void __init console_init_preirq(void)
     pv_console_set_rx_handler(serial_rx);
 
     /* HELLO WORLD --- start-of-day banner text. */
-    spin_lock(&console_lock);
+    nrspin_lock(&console_lock);
     __putstr(xen_banner());
-    spin_unlock(&console_lock);
+    nrspin_unlock(&console_lock);
     printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
            xen_major_version(), xen_minor_version(), xen_extra_version(),
            xen_compile_by(), xen_compile_domain(), xen_compiler(),
@@ -1065,13 +1065,13 @@ void __init console_init_ring(void)
     }
     opt_conring_size = PAGE_SIZE << order;
 
-    spin_lock_irqsave(&console_lock, flags);
+    nrspin_lock_irqsave(&console_lock, flags);
     for ( i = conringc ; i != conringp; i++ )
         ring[i & (opt_conring_size - 1)] = conring[i & (conring_size - 1)];
     conring = ring;
     smp_wmb(); /* Allow users of console_force_unlock() to see larger buffer. */
     conring_size = opt_conring_size;
-    spin_unlock_irqrestore(&console_lock, flags);
+    nrspin_unlock_irqrestore(&console_lock, flags);
 
     printk("Allocated console ring of %u KiB.\n", opt_conring_size >> 10);
 }
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 593cba640e..53a33653f9 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -102,6 +102,9 @@ struct lock_profile_qhead {
 };
 
 #define LOCK_PROFILE_(lockname) { .name = #lockname, .ptr.lock = &(lockname), }
+#define RLOCK_PROFILE_(lockname) { .name = #lockname,                         \
+                                   .ptr.rlock = &(lockname),                  \
+                                   .is_rlock = true, }
 #define LOCK_PROFILE_PTR_(name)                                               \
     static struct lock_profile * const lock_profile__##name                   \
     __used_section(".lockprofile.data") =                                     \
@@ -118,10 +121,10 @@ struct lock_profile_qhead {
     LOCK_PROFILE_PTR_(l)
 #define DEFINE_RSPINLOCK(l)                                                   \
     rspinlock_t l = SPIN_LOCK_UNLOCKED_(NULL);                                \
-    static struct lock_profile lock_profile_data__##l = LOCK_PROFILE_(l);     \
+    static struct lock_profile lock_profile_data__##l = RLOCK_PROFILE_(l);    \
     LOCK_PROFILE_PTR_(l)
 
-#define spin_lock_init_prof__(s, l, locktype)                                 \
+#define spin_lock_init_prof__(s, l, lockptr, locktype, isr)                   \
     do {                                                                      \
         struct lock_profile *prof;                                            \
         prof = xzalloc(struct lock_profile);                                  \
@@ -134,13 +137,16 @@ struct lock_profile_qhead {
             break;                                                            \
         }                                                                     \
         prof->name = #l;                                                      \
-        prof->ptr.lock = &(s)->l;                                             \
+        prof->ptr.lockptr = &(s)->l;                                          \
+        prof->is_rlock = isr;                                                 \
         prof->next = (s)->profile_head.elem_q;                                \
         (s)->profile_head.elem_q = prof;                                      \
     } while( 0 )
 
-#define spin_lock_init_prof(s, l) spin_lock_init_prof__(s, l, spinlock_t)
-#define rspin_lock_init_prof(s, l) spin_lock_init_prof__(s, l, rspinlock_t)
+#define spin_lock_init_prof(s, l)                                             \
+    spin_lock_init_prof__(s, l, lock, spinlock_t, false)
+#define rspin_lock_init_prof(s, l)                                            \
+    spin_lock_init_prof__(s, l, rlock, rspinlock_t, true)
 
 void _lock_profile_register_struct(
     int32_t type, struct lock_profile_qhead *qhead, int32_t idx);
@@ -274,7 +280,10 @@ static always_inline void spin_lock_if(bool condition, spinlock_t *l)
  * reentered recursively on the same CPU. All critical regions that may form
  * part of a recursively-nested set must be protected by these forms. If there
  * are any critical regions that cannot form part of such a set, they can use
- * standard spin_[un]lock().
+ * nrspin_[un]lock().
+ * The nrspin_[un]lock() forms act the same way as normal spin_[un]lock()
+ * calls, but operate on rspinlock_t locks. nrspin_lock() and rspin_lock()
+ * calls are blocking to each other for a specific lock even on the same cpu.
  */
 bool _rspin_trylock(rspinlock_t *lock);
 void _rspin_lock(rspinlock_t *lock);
@@ -298,4 +307,12 @@ static always_inline void rspin_lock(rspinlock_t *lock)
 #define rspin_unlock(l)               _rspin_unlock(l)
 #define rspin_unlock_irqrestore(l, f) _rspin_unlock_irqrestore(l, f)
 
+#define nrspin_trylock(l)    spin_trylock(l)
+#define nrspin_lock(l)       spin_lock(l)
+#define nrspin_unlock(l)     spin_unlock(l)
+#define nrspin_lock_irq(l)   spin_lock_irq(l)
+#define nrspin_unlock_irq(l) spin_unlock_irq(l)
+#define nrspin_lock_irqsave(l, f)      spin_lock_irqsave(l, f)
+#define nrspin_unlock_irqrestore(l, f) spin_unlock_irqrestore(l, f)
+
 #endif /* __SPINLOCK_H__ */
-- 
2.35.3


