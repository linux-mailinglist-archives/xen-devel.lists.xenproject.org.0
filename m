Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1FE80E81D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:48:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652855.1018959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzN5-0001Gv-0U; Tue, 12 Dec 2023 09:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652855.1018959; Tue, 12 Dec 2023 09:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzN4-0001DA-Sr; Tue, 12 Dec 2023 09:48:10 +0000
Received: by outflank-mailman (input) for mailman id 652855;
 Tue, 12 Dec 2023 09:48:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCzN3-0007Gv-8n
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:48:09 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dd442f4-98d3-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 10:48:08 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C2043224B1;
 Tue, 12 Dec 2023 09:48:07 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 58BD2139E9;
 Tue, 12 Dec 2023 09:48:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id NAJtFFcseGXXfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 09:48:07 +0000
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
X-Inumbo-ID: 8dd442f4-98d3-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuJajbW3/YYf0ZwXbPmGfzAVaQMwEgrS+mxOKjY7JuM=;
	b=I//7pvG9dUu5sVhpJO82/Y8e3y3JxDVHBkG7EqHvpH/sISE2vyx6KBnEzb1kCFZw/jB9y6
	r9IhKDRf/hf7XHt/noqg0QxGzlDOw5Oh7788PsVXcw7TQ62U06hSHRnP1up+qWsW9ZGhcM
	FJUwbegaGNEfb9lVibgJ238F9EAuB98=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuJajbW3/YYf0ZwXbPmGfzAVaQMwEgrS+mxOKjY7JuM=;
	b=I//7pvG9dUu5sVhpJO82/Y8e3y3JxDVHBkG7EqHvpH/sISE2vyx6KBnEzb1kCFZw/jB9y6
	r9IhKDRf/hf7XHt/noqg0QxGzlDOw5Oh7788PsVXcw7TQ62U06hSHRnP1up+qWsW9ZGhcM
	FJUwbegaGNEfb9lVibgJ238F9EAuB98=
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
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>
Subject: [PATCH v4 07/12] xen/spinlock: add explicit non-recursive locking functions
Date: Tue, 12 Dec 2023 10:47:20 +0100
Message-Id: <20231212094725.22184-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231212094725.22184-1-jgross@suse.com>
References: <20231212094725.22184-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: 10.00
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ********
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
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_TWELVE(0.00)[16];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

In order to prepare a type-safe recursive spinlock structure, add
explicitly non-recursive locking functions to be used for non-recursive
locking of spinlocks, which are used recursively, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- rename functions (Jan Beulich)
- get rid of !! in pcidevs_locked() (Jan Beulich)
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
 xen/include/xen/spinlock.h    | 24 +++++++++++++++++++-----
 14 files changed, 70 insertions(+), 56 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index eeb65ca6bb..7466d12b0c 100644
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
index 69ce1fd5cf..998cb53a58 100644
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
@@ -2446,10 +2446,10 @@ int domain_relinquish_resources(struct domain *d)
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
index 0a66db10b9..c35a68fbd5 100644
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
@@ -3584,11 +3584,11 @@ long do_mmuext_op(
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
@@ -4411,7 +4411,7 @@ int steal_page(
      * that it might be upon return from alloc_domheap_pages with
      * MEMF_no_owner set.
      */
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
 
     BUG_ON(page->u.inuse.type_info & (PGT_count_mask | PGT_locked |
                                       PGT_pinned));
@@ -4423,7 +4423,7 @@ int steal_page(
     if ( !(memflags & MEMF_no_refcount) && !domain_adjust_tot_pages(d, -1) )
         drop_dom_ref = true;
 
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
 
     if ( unlikely(drop_dom_ref) )
         put_domain(d);
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 1720079fd9..fa4e56a4df 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -746,11 +746,11 @@ static int page_make_private(struct domain *d, struct page_info *page)
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
@@ -758,7 +758,7 @@ static int page_make_private(struct domain *d, struct page_info *page)
     expected_type = (PGT_shared_page | PGT_validated | PGT_locked | 2);
     if ( page->u.inuse.type_info != expected_type )
     {
-        spin_unlock(&d->page_alloc_lock);
+        nrspin_unlock(&d->page_alloc_lock);
         put_page(page);
         return -EEXIST;
     }
@@ -775,7 +775,7 @@ static int page_make_private(struct domain *d, struct page_info *page)
     if ( domain_adjust_tot_pages(d, 1) == 1 )
         get_knownalive_domain(d);
     page_list_add_tail(page, &d->page_list);
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
 
     put_page(page);
 
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 9e5ad68df2..61a91f5a94 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -27,7 +27,7 @@
 static inline void lock_page_alloc(struct p2m_domain *p2m)
 {
     page_alloc_mm_pre_lock(p2m->domain);
-    spin_lock(&(p2m->domain->page_alloc_lock));
+    nrspin_lock(&(p2m->domain->page_alloc_lock));
     page_alloc_mm_post_lock(p2m->domain,
                             p2m->domain->arch.page_alloc_unlock_level);
 }
@@ -35,7 +35,7 @@ static inline void lock_page_alloc(struct p2m_domain *p2m)
 static inline void unlock_page_alloc(struct p2m_domain *p2m)
 {
     page_alloc_mm_unlock(p2m->domain->arch.page_alloc_unlock_level);
-    spin_unlock(&(p2m->domain->page_alloc_lock));
+    nrspin_unlock(&(p2m->domain->page_alloc_lock));
 }
 
 /*
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 6eb446e437..f188f09b8e 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2226,7 +2226,7 @@ void audit_p2m(struct domain *d,
 
     /* Audit part two: walk the domain's page allocation list, checking
      * the m2p entries. */
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
     page_list_for_each ( page, &d->page_list )
     {
         mfn = mfn_x(page_to_mfn(page));
@@ -2278,7 +2278,7 @@ void audit_p2m(struct domain *d,
         P2M_PRINTK("OK: mfn=%#lx, gfn=%#lx, p2mfn=%#lx\n",
                        mfn, gfn, mfn_x(p2mfn));
     }
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
 
     pod_unlock(p2m);
     p2m_unlock(p2m);
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index 86c4c22cac..5b33a1bf9d 100644
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
index f5a71ee5f7..cb62b18a9d 100644
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
index 5721eab225..54163d51ea 100644
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
index f454c4d894..47b1d0b5a8 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -718,13 +718,13 @@ static void cf_check dump_numa(unsigned char key)
 
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
index 8c6a3d9274..a25c00a7d4 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -515,7 +515,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
      * must always take the global heap_lock rather than only in the much
      * rarer case that d->outstanding_pages is non-zero
      */
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
     spin_lock(&heap_lock);
 
     /* pages==0 means "unset" the claim. */
@@ -561,7 +561,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
 
 out:
     spin_unlock(&heap_lock);
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
     return ret;
 }
 
@@ -2343,7 +2343,7 @@ int assign_pages(
     int rc = 0;
     unsigned int i;
 
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
 
     if ( unlikely(d->is_dying) )
     {
@@ -2425,7 +2425,7 @@ int assign_pages(
     }
 
  out:
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
     return rc;
 }
 
@@ -2906,9 +2906,9 @@ mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
     ASSERT_ALLOC_CONTEXT();
 
     /* Acquire a page from reserved page list(resv_page_list). */
-    spin_lock(&d->page_alloc_lock);
+    nrspin_lock(&d->page_alloc_lock);
     page = page_list_remove_head(&d->resv_page_list);
-    spin_unlock(&d->page_alloc_lock);
+    nrspin_unlock(&d->page_alloc_lock);
     if ( unlikely(!page) )
         return INVALID_MFN;
 
@@ -2927,9 +2927,9 @@ mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
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
index 1db2bbdb6a..8d05c57f69 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -369,9 +369,9 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 
     if ( op->clear )
     {
-        spin_lock_irq(&console_lock);
+        nrspin_lock_irq(&console_lock);
         conringc = p - c > conring_size ? p - conring_size : c;
-        spin_unlock_irq(&console_lock);
+        nrspin_unlock_irq(&console_lock);
     }
 
     op->count = sofar;
@@ -639,7 +639,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( is_hardware_domain(cd) )
         {
             /* Use direct console output as it could be interactive */
-            spin_lock_irq(&console_lock);
+            nrspin_lock_irq(&console_lock);
 
             console_serial_puts(kbuf, kcount);
             video_puts(kbuf, kcount);
@@ -660,7 +660,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
                 tasklet_schedule(&notify_dom0_con_ring_tasklet);
             }
 
-            spin_unlock_irq(&console_lock);
+            nrspin_unlock_irq(&console_lock);
         }
         else
         {
@@ -1027,9 +1027,9 @@ void __init console_init_preirq(void)
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
@@ -1066,13 +1066,13 @@ void __init console_init_ring(void)
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
index ac3bef267a..82ef99d3b6 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -101,6 +101,8 @@ struct lock_profile_qhead {
 };
 
 #define _LOCK_PROFILE(lockname) { .name = #lockname, .lock = &lockname, }
+#define _RLOCK_PROFILE(lockname) { .name = #lockname, .rlock = &lockname,     \
+    .is_rlock = 1, }
 #define _LOCK_PROFILE_PTR(name)                                               \
     static struct lock_profile * const __lock_profile_##name                  \
     __used_section(".lockprofile.data") =                                     \
@@ -117,10 +119,10 @@ struct lock_profile_qhead {
     _LOCK_PROFILE_PTR(l)
 #define DEFINE_RSPINLOCK(l)                                                   \
     rspinlock_t l = _SPIN_LOCK_UNLOCKED(NULL);                                \
-    static struct lock_profile __lock_profile_data_##l = _LOCK_PROFILE(l);    \
+    static struct lock_profile __lock_profile_data_##l = _RLOCK_PROFILE(l);   \
     _LOCK_PROFILE_PTR(l)
 
-#define __spin_lock_init_prof(s, l, locktype)                                 \
+#define __spin_lock_init_prof(s, l, lockptr, locktype, isr)                   \
     do {                                                                      \
         struct lock_profile *prof;                                            \
         prof = xzalloc(struct lock_profile);                                  \
@@ -133,13 +135,16 @@ struct lock_profile_qhead {
             break;                                                            \
         }                                                                     \
         prof->name = #l;                                                      \
-        prof->lock = &(s)->l;                                                 \
+        prof->lockptr = &(s)->l;                                              \
+        prof->is_rlock = isr;                                                 \
         prof->next = (s)->profile_head.elem_q;                                \
         (s)->profile_head.elem_q = prof;                                      \
     } while( 0 )
 
-#define spin_lock_init_prof(s, l) __spin_lock_init_prof(s, l, spinlock_t)
-#define rspin_lock_init_prof(s, l) __spin_lock_init_prof(s, l, rspinlock_t)
+#define spin_lock_init_prof(s, l)                                             \
+    __spin_lock_init_prof(s, l, lock, spinlock_t, 0)
+#define rspin_lock_init_prof(s, l)                                            \
+    __spin_lock_init_prof(s, l, rlock, rspinlock_t, 1)
 
 void _lock_profile_register_struct(
     int32_t type, struct lock_profile_qhead *qhead, int32_t idx);
@@ -174,6 +179,7 @@ struct lock_profile_qhead { };
 
 #endif
 
+
 typedef union {
     uint32_t head_tail;
     struct {
@@ -261,4 +267,12 @@ void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
 /* Ensure a lock is quiescent between two critical operations. */
 #define spin_barrier(l)               _spin_barrier(l)
 
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


