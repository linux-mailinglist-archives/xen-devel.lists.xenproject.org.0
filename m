Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 899D35B4762
	for <lists+xen-devel@lfdr.de>; Sat, 10 Sep 2022 17:50:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404808.647410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX2kF-0004uh-Oz; Sat, 10 Sep 2022 15:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404808.647410; Sat, 10 Sep 2022 15:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX2kF-0004sD-Kw; Sat, 10 Sep 2022 15:50:11 +0000
Received: by outflank-mailman (input) for mailman id 404808;
 Sat, 10 Sep 2022 15:50:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oX2kE-0004rT-GV
 for xen-devel@lists.xenproject.org; Sat, 10 Sep 2022 15:50:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ee2666c-3120-11ed-a31c-8f8a9ae3403f;
 Sat, 10 Sep 2022 17:50:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2231222004;
 Sat, 10 Sep 2022 15:50:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF63D13441;
 Sat, 10 Sep 2022 15:50:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W3KQKS+yHGNiZAAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 10 Sep 2022 15:50:07 +0000
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
X-Inumbo-ID: 3ee2666c-3120-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662825008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YX7767BRvnYvt1UK4p6BHY9ImMXrDao1VWeozDcVM6o=;
	b=EniQIcBXKrVNcpGY7A9pztSJt35WlnHvbP9WEHwcy0OZSRVKQE+h0qbbvU3IF6SdLxDFsa
	jOXrljql5m9vh2GcHmaxbPDZJorzhVhkXGNcFddz6jDOLzMftnaLTaepOUNCIlgxtoeADg
	a1GSxerLR0XXoV90nvp+7rcskbzLONE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [RFC PATCH 1/3] xen/spinlock: add explicit non-recursive locking functions
Date: Sat, 10 Sep 2022 17:49:57 +0200
Message-Id: <20220910154959.15971-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220910154959.15971-1-jgross@suse.com>
References: <20220910154959.15971-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to prepare a type-safe recursive spinlock structure, add
explicitly non-recursive locking functions to be used for non-recursive
locking of spinlocks, which are use recursively, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/arm/mm.c             |  4 ++--
 xen/arch/x86/domain.c         | 12 ++++++------
 xen/arch/x86/mm.c             | 12 ++++++------
 xen/arch/x86/mm/mem_sharing.c |  8 ++++----
 xen/arch/x86/mm/p2m-pod.c     |  4 ++--
 xen/arch/x86/mm/p2m.c         |  4 ++--
 xen/arch/x86/numa.c           |  4 ++--
 xen/arch/x86/tboot.c          |  4 ++--
 xen/common/domain.c           |  4 ++--
 xen/common/domctl.c           |  4 ++--
 xen/common/grant_table.c      | 10 +++++-----
 xen/common/ioreq.c            |  2 +-
 xen/common/memory.c           |  4 ++--
 xen/common/page_alloc.c       | 18 +++++++++---------
 xen/drivers/char/console.c    | 24 ++++++++++++------------
 xen/drivers/passthrough/pci.c |  4 ++--
 xen/include/xen/spinlock.h    | 17 ++++++++++++++++-
 17 files changed, 77 insertions(+), 62 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 11ee49598b..bf88d2cab8 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1284,7 +1284,7 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
     if ( page_get_owner(page) == d )
         return;
 
-    spin_lock(&d->page_alloc_lock);
+    spin_lock_nonrecursive(&d->page_alloc_lock);
 
     /*
      * The incremented type count pins as writable or read-only.
@@ -1315,7 +1315,7 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
         page_list_add_tail(page, &d->xenpage_list);
     }
 
-    spin_unlock(&d->page_alloc_lock);
+    spin_unlock_nonrecursive(&d->page_alloc_lock);
 }
 
 int xenmem_add_to_physmap_one(
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 41e1e3f272..a66846a6d1 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -213,7 +213,7 @@ void dump_pageframe_info(struct domain *d)
     {
         unsigned long total[MASK_EXTR(PGT_type_mask, PGT_type_mask) + 1] = {};
 
-        spin_lock(&d->page_alloc_lock);
+        spin_lock_nonrecursive(&d->page_alloc_lock);
         page_list_for_each ( page, &d->page_list )
         {
             unsigned int index = MASK_EXTR(page->u.inuse.type_info,
@@ -232,13 +232,13 @@ void dump_pageframe_info(struct domain *d)
                    _p(mfn_x(page_to_mfn(page))),
                    page->count_info, page->u.inuse.type_info);
         }
-        spin_unlock(&d->page_alloc_lock);
+        spin_unlock_nonrecursive(&d->page_alloc_lock);
     }
 
     if ( is_hvm_domain(d) )
         p2m_pod_dump_data(d);
 
-    spin_lock(&d->page_alloc_lock);
+    spin_lock_nonrecursive(&d->page_alloc_lock);
 
     page_list_for_each ( page, &d->xenpage_list )
     {
@@ -254,7 +254,7 @@ void dump_pageframe_info(struct domain *d)
                page->count_info, page->u.inuse.type_info);
     }
 
-    spin_unlock(&d->page_alloc_lock);
+    spin_unlock_nonrecursive(&d->page_alloc_lock);
 }
 
 void update_guest_memory_policy(struct vcpu *v,
@@ -2456,10 +2456,10 @@ int domain_relinquish_resources(struct domain *d)
         }
 #endif
 
-        spin_lock(&d->page_alloc_lock);
+        spin_lock_nonrecursive(&d->page_alloc_lock);
         page_list_splice(&d->arch.relmem_list, &d->page_list);
         INIT_PAGE_LIST_HEAD(&d->arch.relmem_list);
-        spin_unlock(&d->page_alloc_lock);
+        spin_unlock_nonrecursive(&d->page_alloc_lock);
 
     PROGRESS(xen):
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index db1817b691..e084ba04ad 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -499,7 +499,7 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
 
     set_gpfn_from_mfn(mfn_x(page_to_mfn(page)), INVALID_M2P_ENTRY);
 
-    spin_lock(&d->page_alloc_lock);
+    spin_lock_nonrecursive(&d->page_alloc_lock);
 
     /* The incremented type count pins as writable or read-only. */
     page->u.inuse.type_info =
@@ -519,7 +519,7 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
         page_list_add_tail(page, &d->xenpage_list);
     }
 
-    spin_unlock(&d->page_alloc_lock);
+    spin_unlock_nonrecursive(&d->page_alloc_lock);
 }
 
 void make_cr3(struct vcpu *v, mfn_t mfn)
@@ -3586,11 +3586,11 @@ long do_mmuext_op(
             {
                 bool drop_ref;
 
-                spin_lock(&pg_owner->page_alloc_lock);
+                spin_lock_nonrecursive(&pg_owner->page_alloc_lock);
                 drop_ref = (pg_owner->is_dying &&
                             test_and_clear_bit(_PGT_pinned,
                                                &page->u.inuse.type_info));
-                spin_unlock(&pg_owner->page_alloc_lock);
+                spin_unlock_nonrecursive(&pg_owner->page_alloc_lock);
                 if ( drop_ref )
                 {
         pin_drop:
@@ -4413,7 +4413,7 @@ int steal_page(
      * that it might be upon return from alloc_domheap_pages with
      * MEMF_no_owner set.
      */
-    spin_lock(&d->page_alloc_lock);
+    spin_lock_nonrecursive(&d->page_alloc_lock);
 
     BUG_ON(page->u.inuse.type_info & (PGT_count_mask | PGT_locked |
                                       PGT_pinned));
@@ -4425,7 +4425,7 @@ int steal_page(
     if ( !(memflags & MEMF_no_refcount) && !domain_adjust_tot_pages(d, -1) )
         drop_dom_ref = true;
 
-    spin_unlock(&d->page_alloc_lock);
+    spin_unlock_nonrecursive(&d->page_alloc_lock);
 
     if ( unlikely(drop_dom_ref) )
         put_domain(d);
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 649d93dc54..89817dc427 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -758,11 +758,11 @@ static int page_make_private(struct domain *d, struct page_info *page)
     if ( !get_page(page, dom_cow) )
         return -EINVAL;
 
-    spin_lock(&d->page_alloc_lock);
+    spin_lock_nonrecursive(&d->page_alloc_lock);
 
     if ( d->is_dying )
     {
-        spin_unlock(&d->page_alloc_lock);
+        spin_unlock_nonrecursive(&d->page_alloc_lock);
         put_page(page);
         return -EBUSY;
     }
@@ -770,7 +770,7 @@ static int page_make_private(struct domain *d, struct page_info *page)
     expected_type = (PGT_shared_page | PGT_validated | PGT_locked | 2);
     if ( page->u.inuse.type_info != expected_type )
     {
-        spin_unlock(&d->page_alloc_lock);
+        spin_unlock_nonrecursive(&d->page_alloc_lock);
         put_page(page);
         return -EEXIST;
     }
@@ -787,7 +787,7 @@ static int page_make_private(struct domain *d, struct page_info *page)
     if ( domain_adjust_tot_pages(d, 1) == 1 )
         get_knownalive_domain(d);
     page_list_add_tail(page, &d->page_list);
-    spin_unlock(&d->page_alloc_lock);
+    spin_unlock_nonrecursive(&d->page_alloc_lock);
 
     put_page(page);
 
diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index fc110506dc..deab55648c 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -39,7 +39,7 @@
 static inline void lock_page_alloc(struct p2m_domain *p2m)
 {
     page_alloc_mm_pre_lock(p2m->domain);
-    spin_lock(&(p2m->domain->page_alloc_lock));
+    spin_lock_nonrecursive(&(p2m->domain->page_alloc_lock));
     page_alloc_mm_post_lock(p2m->domain,
                             p2m->domain->arch.page_alloc_unlock_level);
 }
@@ -47,7 +47,7 @@ static inline void lock_page_alloc(struct p2m_domain *p2m)
 static inline void unlock_page_alloc(struct p2m_domain *p2m)
 {
     page_alloc_mm_unlock(p2m->domain->arch.page_alloc_unlock_level);
-    spin_unlock(&(p2m->domain->page_alloc_lock));
+    spin_unlock_nonrecursive(&(p2m->domain->page_alloc_lock));
 }
 
 /*
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index a405ee5fde..30bc248f72 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2245,7 +2245,7 @@ void audit_p2m(struct domain *d,
 
     /* Audit part two: walk the domain's page allocation list, checking
      * the m2p entries. */
-    spin_lock(&d->page_alloc_lock);
+    spin_lock_nonrecursive(&d->page_alloc_lock);
     page_list_for_each ( page, &d->page_list )
     {
         mfn = mfn_x(page_to_mfn(page));
@@ -2297,7 +2297,7 @@ void audit_p2m(struct domain *d,
         P2M_PRINTK("OK: mfn=%#lx, gfn=%#lx, p2mfn=%#lx\n",
                        mfn, gfn, mfn_x(p2mfn));
     }
-    spin_unlock(&d->page_alloc_lock);
+    spin_unlock_nonrecursive(&d->page_alloc_lock);
 
     pod_unlock(p2m);
     p2m_unlock(p2m);
diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 627ae8aa95..90fbfdcb31 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -425,13 +425,13 @@ static void cf_check dump_numa(unsigned char key)
         for_each_online_node ( i )
             page_num_node[i] = 0;
 
-        spin_lock(&d->page_alloc_lock);
+        spin_lock_nonrecursive(&d->page_alloc_lock);
         page_list_for_each(page, &d->page_list)
         {
             i = phys_to_nid(page_to_maddr(page));
             page_num_node[i]++;
         }
-        spin_unlock(&d->page_alloc_lock);
+        spin_unlock_nonrecursive(&d->page_alloc_lock);
 
         for_each_online_node ( i )
             printk("    Node %u: %u\n", i, page_num_node[i]);
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index fe1abfdf08..93e8e3e90f 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -215,14 +215,14 @@ static void tboot_gen_domain_integrity(const uint8_t key[TB_KEY_SIZE],
             continue;
         printk("MACing Domain %u\n", d->domain_id);
 
-        spin_lock(&d->page_alloc_lock);
+        spin_lock_nonrecursive(&d->page_alloc_lock);
         page_list_for_each(page, &d->page_list)
         {
             void *pg = __map_domain_page(page);
             vmac_update(pg, PAGE_SIZE, &ctx);
             unmap_domain_page(pg);
         }
-        spin_unlock(&d->page_alloc_lock);
+        spin_unlock_nonrecursive(&d->page_alloc_lock);
 
         if ( !is_idle_domain(d) )
         {
diff --git a/xen/common/domain.c b/xen/common/domain.c
index c23f449451..51160a4b5c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -598,8 +598,8 @@ struct domain *domain_create(domid_t domid,
 
     atomic_set(&d->refcnt, 1);
     RCU_READ_LOCK_INIT(&d->rcu_lock);
-    spin_lock_init_prof(d, domain_lock);
-    spin_lock_init_prof(d, page_alloc_lock);
+    spin_lock_recursive_init_prof(d, domain_lock);
+    spin_lock_recursive_init_prof(d, page_alloc_lock);
     spin_lock_init(&d->hypercall_deadlock_mutex);
     INIT_PAGE_LIST_HEAD(&d->page_list);
     INIT_PAGE_LIST_HEAD(&d->extra_page_list);
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 452266710a..09870c87e0 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -651,14 +651,14 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     {
         uint64_t new_max = op->u.max_mem.max_memkb >> (PAGE_SHIFT - 10);
 
-        spin_lock(&d->page_alloc_lock);
+        spin_lock_nonrecursive(&d->page_alloc_lock);
         /*
          * NB. We removed a check that new_max >= current tot_pages; this means
          * that the domain will now be allowed to "ratchet" down to new_max. In
          * the meantime, while tot > max, all new allocations are disallowed.
          */
         d->max_pages = min(new_max, (uint64_t)(typeof(d->max_pages))-1);
-        spin_unlock(&d->page_alloc_lock);
+        spin_unlock_nonrecursive(&d->page_alloc_lock);
         break;
     }
 
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ad773a6996..7acf8a9f6c 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2349,7 +2349,7 @@ gnttab_transfer(
             mfn = page_to_mfn(page);
         }
 
-        spin_lock(&e->page_alloc_lock);
+        spin_lock_nonrecursive(&e->page_alloc_lock);
 
         /*
          * Check that 'e' will accept the page and has reservation
@@ -2360,7 +2360,7 @@ gnttab_transfer(
              unlikely(domain_tot_pages(e) >= e->max_pages) ||
              unlikely(!(e->tot_pages + 1)) )
         {
-            spin_unlock(&e->page_alloc_lock);
+            spin_unlock_nonrecursive(&e->page_alloc_lock);
 
             if ( e->is_dying )
                 gdprintk(XENLOG_INFO, "Transferee d%d is dying\n",
@@ -2384,7 +2384,7 @@ gnttab_transfer(
          * safely drop the lock and re-aquire it later to add page to the
          * pagelist.
          */
-        spin_unlock(&e->page_alloc_lock);
+        spin_unlock_nonrecursive(&e->page_alloc_lock);
         okay = gnttab_prepare_for_transfer(e, d, gop.ref);
 
         /*
@@ -2400,9 +2400,9 @@ gnttab_transfer(
              * Need to grab this again to safely free our "reserved"
              * page in the page total
              */
-            spin_lock(&e->page_alloc_lock);
+            spin_lock_nonrecursive(&e->page_alloc_lock);
             drop_dom_ref = !domain_adjust_tot_pages(e, -1);
-            spin_unlock(&e->page_alloc_lock);
+            spin_unlock_nonrecursive(&e->page_alloc_lock);
 
             if ( okay /* i.e. e->is_dying due to the surrounding if() */ )
                 gdprintk(XENLOG_INFO, "Transferee d%d is now dying\n",
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 4617aef29b..c46a5d70e6 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -1329,7 +1329,7 @@ unsigned int ioreq_broadcast(ioreq_t *p, bool buffered)
 
 void ioreq_domain_init(struct domain *d)
 {
-    spin_lock_init(&d->ioreq_server.lock);
+    spin_lock_recursive_init(&d->ioreq_server.lock);
 
     arch_ioreq_domain_init(d);
 }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index ae8163a738..0b4313832e 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -769,10 +769,10 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
                               (1UL << in_chunk_order)) -
                              (j * (1UL << exch.out.extent_order)));
 
-                spin_lock(&d->page_alloc_lock);
+                spin_lock_nonrecursive(&d->page_alloc_lock);
                 drop_dom_ref = (dec_count &&
                                 !domain_adjust_tot_pages(d, -dec_count));
-                spin_unlock(&d->page_alloc_lock);
+                spin_unlock_nonrecursive(&d->page_alloc_lock);
 
                 if ( drop_dom_ref )
                     put_domain(d);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 62afb07bc6..35e6015ce2 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -469,7 +469,7 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
 {
     long dom_before, dom_after, dom_claimed, sys_before, sys_after;
 
-    ASSERT(spin_is_locked(&d->page_alloc_lock));
+    ASSERT(spin_recursive_is_locked(&d->page_alloc_lock));
     d->tot_pages += pages;
 
     /*
@@ -508,7 +508,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
      * must always take the global heap_lock rather than only in the much
      * rarer case that d->outstanding_pages is non-zero
      */
-    spin_lock(&d->page_alloc_lock);
+    spin_lock_nonrecursive(&d->page_alloc_lock);
     spin_lock(&heap_lock);
 
     /* pages==0 means "unset" the claim. */
@@ -554,7 +554,7 @@ int domain_set_outstanding_pages(struct domain *d, unsigned long pages)
 
 out:
     spin_unlock(&heap_lock);
-    spin_unlock(&d->page_alloc_lock);
+    spin_unlock_nonrecursive(&d->page_alloc_lock);
     return ret;
 }
 
@@ -2328,7 +2328,7 @@ int assign_pages(
     int rc = 0;
     unsigned int i;
 
-    spin_lock(&d->page_alloc_lock);
+    spin_lock_nonrecursive(&d->page_alloc_lock);
 
     if ( unlikely(d->is_dying) )
     {
@@ -2410,7 +2410,7 @@ int assign_pages(
     }
 
  out:
-    spin_unlock(&d->page_alloc_lock);
+    spin_unlock_nonrecursive(&d->page_alloc_lock);
     return rc;
 }
 
@@ -2891,9 +2891,9 @@ mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
     ASSERT_ALLOC_CONTEXT();
 
     /* Acquire a page from reserved page list(resv_page_list). */
-    spin_lock(&d->page_alloc_lock);
+    spin_lock_nonrecursive(&d->page_alloc_lock);
     page = page_list_remove_head(&d->resv_page_list);
-    spin_unlock(&d->page_alloc_lock);
+    spin_unlock_nonrecursive(&d->page_alloc_lock);
     if ( unlikely(!page) )
         return INVALID_MFN;
 
@@ -2912,9 +2912,9 @@ mfn_t acquire_reserved_page(struct domain *d, unsigned int memflags)
      */
     unprepare_staticmem_pages(page, 1, false);
  fail:
-    spin_lock(&d->page_alloc_lock);
+    spin_lock_nonrecursive(&d->page_alloc_lock);
     page_list_add_tail(page, &d->resv_page_list);
-    spin_unlock(&d->page_alloc_lock);
+    spin_unlock_nonrecursive(&d->page_alloc_lock);
     return INVALID_MFN;
 }
 #endif
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index e8468c121a..2e861ad9d6 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -120,7 +120,7 @@ static int __read_mostly sercon_handle = -1;
 int8_t __read_mostly opt_console_xen; /* console=xen */
 #endif
 
-static DEFINE_SPINLOCK(console_lock);
+static DEFINE_SPINLOCK_RECURSIVE(console_lock);
 
 /*
  * To control the amount of printing, thresholds are added.
@@ -328,7 +328,7 @@ static void cf_check do_dec_thresh(unsigned char key, struct cpu_user_regs *regs
 
 static void conring_puts(const char *str, size_t len)
 {
-    ASSERT(spin_is_locked(&console_lock));
+    ASSERT(spin_recursive_is_locked(&console_lock));
 
     while ( len-- )
         conring[CONRING_IDX_MASK(conringp++)] = *str++;
@@ -369,9 +369,9 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 
     if ( op->clear )
     {
-        spin_lock_irq(&console_lock);
+        spin_lock_nonrecursive_irq(&console_lock);
         conringc = p - c > conring_size ? p - conring_size : c;
-        spin_unlock_irq(&console_lock);
+        spin_unlock_nonrecursive_irq(&console_lock);
     }
 
     op->count = sofar;
@@ -612,7 +612,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
         if ( is_hardware_domain(cd) )
         {
             /* Use direct console output as it could be interactive */
-            spin_lock_irq(&console_lock);
+            spin_lock_nonrecursive_irq(&console_lock);
 
             console_serial_puts(kbuf, kcount);
             video_puts(kbuf, kcount);
@@ -633,7 +633,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
                 tasklet_schedule(&notify_dom0_con_ring_tasklet);
             }
 
-            spin_unlock_irq(&console_lock);
+            spin_unlock_nonrecursive_irq(&console_lock);
         }
         else
         {
@@ -739,7 +739,7 @@ static void __putstr(const char *str)
 {
     size_t len = strlen(str);
 
-    ASSERT(spin_is_locked(&console_lock));
+    ASSERT(spin_recursive_is_locked(&console_lock));
 
     console_serial_puts(str, len);
     video_puts(str, len);
@@ -1000,9 +1000,9 @@ void __init console_init_preirq(void)
     pv_console_set_rx_handler(serial_rx);
 
     /* HELLO WORLD --- start-of-day banner text. */
-    spin_lock(&console_lock);
+    spin_lock_nonrecursive(&console_lock);
     __putstr(xen_banner());
-    spin_unlock(&console_lock);
+    spin_unlock_nonrecursive(&console_lock);
     printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
            xen_major_version(), xen_minor_version(), xen_extra_version(),
            xen_compile_by(), xen_compile_domain(), xen_compiler(),
@@ -1039,13 +1039,13 @@ void __init console_init_ring(void)
     }
     opt_conring_size = PAGE_SIZE << order;
 
-    spin_lock_irqsave(&console_lock, flags);
+    spin_lock_nonrecursive_irqsave(&console_lock, flags);
     for ( i = conringc ; i != conringp; i++ )
         ring[i & (opt_conring_size - 1)] = conring[i & (conring_size - 1)];
     conring = ring;
     smp_wmb(); /* Allow users of console_force_unlock() to see larger buffer. */
     conring_size = opt_conring_size;
-    spin_unlock_irqrestore(&console_lock, flags);
+    spin_unlock_nonrecursive_irqrestore(&console_lock, flags);
 
     printk("Allocated console ring of %u KiB.\n", opt_conring_size >> 10);
 }
@@ -1151,7 +1151,7 @@ void console_force_unlock(void)
 {
     watchdog_disable();
     spin_debug_disable();
-    spin_lock_init(&console_lock);
+    spin_lock_recursive_init(&console_lock);
     serial_force_unlock(sercon_handle);
     console_locks_busted = 1;
     console_start_sync();
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index cdaf5c247f..c86b11be10 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -50,7 +50,7 @@ struct pci_seg {
     } bus2bridge[MAX_BUSES];
 };
 
-static spinlock_t _pcidevs_lock = SPIN_LOCK_UNLOCKED;
+static DEFINE_SPINLOCK_RECURSIVE(_pcidevs_lock);
 
 void pcidevs_lock(void)
 {
@@ -64,7 +64,7 @@ void pcidevs_unlock(void)
 
 bool_t pcidevs_locked(void)
 {
-    return !!spin_is_locked(&_pcidevs_lock);
+    return !!spin_recursive_is_locked(&_pcidevs_lock);
 }
 
 static struct radix_tree_root pci_segments;
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 961891bea4..20f64102c9 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -40,7 +40,7 @@ union lock_debug { };
     lock profiling on:
 
     Global locks which should be subject to profiling must be declared via
-    DEFINE_SPINLOCK.
+    DEFINE_SPINLOCK[_RECURSIVE].
 
     For locks in structures further measures are necessary:
     - the structure definition must include a profile_head with exactly this
@@ -146,6 +146,8 @@ struct lock_profile_qhead { };
 
 #endif
 
+#define DEFINE_SPINLOCK_RECURSIVE(l) DEFINE_SPINLOCK(l)
+
 typedef union {
     u32 head_tail;
     struct {
@@ -171,6 +173,8 @@ typedef struct spinlock {
 
 
 #define spin_lock_init(l) (*(l) = (spinlock_t)SPIN_LOCK_UNLOCKED)
+#define spin_lock_recursive_init(l) (*(l) = (spinlock_t)SPIN_LOCK_UNLOCKED)
+#define spin_lock_recursive_init_prof(s, l) spin_lock_init_prof(s, l)
 
 void _spin_lock(spinlock_t *lock);
 void _spin_lock_cb(spinlock_t *lock, void (*cond)(void *), void *data);
@@ -223,9 +227,20 @@ void _spin_unlock_recursive(spinlock_t *lock);
  * part of a recursively-nested set must be protected by these forms. If there
  * are any critical regions that cannot form part of such a set, they can use
  * standard spin_[un]lock().
+ * The related spin_[un]lock_nonrecursive() variants should be used when no
+ * recursion of locking is needed for locks, which might be taken recursively.
  */
 #define spin_trylock_recursive(l)     _spin_trylock_recursive(l)
 #define spin_lock_recursive(l)        _spin_lock_recursive(l)
 #define spin_unlock_recursive(l)      _spin_unlock_recursive(l)
+#define spin_recursive_is_locked(l)   spin_is_locked(l)
+
+#define spin_trylock_nonrecursive(l)     spin_trylock(l)
+#define spin_lock_nonrecursive(l)        spin_lock(l)
+#define spin_unlock_nonrecursive(l)      spin_unlock(l)
+#define spin_lock_nonrecursive_irq(l)    spin_lock_irq(l)
+#define spin_unlock_nonrecursive_irq(l)  spin_unlock_irq(l)
+#define spin_lock_nonrecursive_irqsave(l, f)      spin_lock_irqsave(l, f)
+#define spin_unlock_nonrecursive_irqrestore(l, f) spin_unlock_irqrestore(l, f)
 
 #endif /* __SPINLOCK_H__ */
-- 
2.35.3


