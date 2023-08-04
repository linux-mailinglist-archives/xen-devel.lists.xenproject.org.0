Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9323376FCD2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 11:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577002.903772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRqkr-0000gs-Vr; Fri, 04 Aug 2023 09:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577002.903772; Fri, 04 Aug 2023 09:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRqkr-0000eb-S5; Fri, 04 Aug 2023 09:05:53 +0000
Received: by outflank-mailman (input) for mailman id 577002;
 Fri, 04 Aug 2023 09:05:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HS9z=DV=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qRqkq-0000eV-Po
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 09:05:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c1d1c3e-32a6-11ee-b26b-6b7b168915f2;
 Fri, 04 Aug 2023 11:05:51 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-35-203-138.retail.telecomitalia.it [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id A9A974EE0737;
 Fri,  4 Aug 2023 11:05:50 +0200 (CEST)
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
X-Inumbo-ID: 1c1d1c3e-32a6-11ee-b26b-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] x86/mm: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Fri,  4 Aug 2023 11:05:41 +0200
Message-Id: <7f4d7be410aecaab6e356947bb79e703037f4101.1691139867.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Give a name to unnamed parameters to address violations of
MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
named parameters").
Keep consistency between parameter names used in function
declarations and the ones used in the corresponding function
definitions, thus addressing violations of MISRA C:2012 Rule 8.3
("All declarations of an object or function shall use the same names
and type qualifiers").

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/mm.h | 20 ++++++++++----------
 xen/arch/x86/mm.c             | 33 ++++++++++++++++++---------------
 xen/include/xen/mm.h          |  2 +-
 3 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index db29e3e205..1e2d8c1a65 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -408,7 +408,7 @@ void put_page_type(struct page_info *page);
 int  get_page_type(struct page_info *page, unsigned long type);
 int  put_page_type_preemptible(struct page_info *page);
 int  get_page_type_preemptible(struct page_info *page, unsigned long type);
-int  put_old_guest_table(struct vcpu *);
+int  put_old_guest_table(struct vcpu *v);
 int  get_page_from_l1e(
     l1_pgentry_t l1e, struct domain *l1e_owner, struct domain *pg_owner);
 void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner);
@@ -559,7 +559,7 @@ void audit_domains(void);
 
 void make_cr3(struct vcpu *v, mfn_t mfn);
 void update_cr3(struct vcpu *v);
-int vcpu_destroy_pagetables(struct vcpu *);
+int vcpu_destroy_pagetables(struct vcpu *v);
 void *do_page_walk(struct vcpu *v, unsigned long addr);
 
 /* Allocator functions for Xen pagetables. */
@@ -574,20 +574,20 @@ int __sync_local_execstate(void);
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 long subarch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void));
-int compat_subarch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void));
+int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
+int compat_subarch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
 
 #define NIL(type) ((type *)-sizeof(type))
 #define IS_NIL(ptr) (!((uintptr_t)(ptr) + sizeof(*(ptr))))
 
-int create_perdomain_mapping(struct domain *, unsigned long va,
-                             unsigned int nr, l1_pgentry_t **,
-                             struct page_info **);
-void destroy_perdomain_mapping(struct domain *, unsigned long va,
+int create_perdomain_mapping(struct domain *d, unsigned long va,
+                             unsigned int nr, l1_pgentry_t **pl1tab,
+                             struct page_info **ppg);
+void destroy_perdomain_mapping(struct domain *d, unsigned long va,
                                unsigned int nr);
-void free_perdomain_mappings(struct domain *);
+void free_perdomain_mappings(struct domain *d);
 
-void __iomem *ioremap_wc(paddr_t, size_t);
+void __iomem *ioremap_wc(paddr_t pa, size_t len);
 
 extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
 
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index be2b10a391..e1d9b94007 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5591,7 +5591,7 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
  *
  * It is an error to call with present flags over an unpopulated range.
  */
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
+int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
 {
     bool locking = system_state > SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL;
@@ -5604,7 +5604,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
     /* Set of valid PTE bits which may be altered. */
 #define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
-    nf &= FLAGS_MASK;
+    flags &= FLAGS_MASK;
 
     ASSERT(IS_ALIGNED(s, PAGE_SIZE));
     ASSERT(IS_ALIGNED(e, PAGE_SIZE));
@@ -5628,7 +5628,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
         if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
         {
             /* Confirm the caller isn't trying to create new mappings. */
-            ASSERT(!(nf & _PAGE_PRESENT));
+            ASSERT(!(flags & _PAGE_PRESENT));
 
             v += 1UL << L3_PAGETABLE_SHIFT;
             v &= ~((1UL << L3_PAGETABLE_SHIFT) - 1);
@@ -5645,9 +5645,10 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                  ((e - v) >= (1UL << L3_PAGETABLE_SHIFT)) )
             {
                 /* PAGE1GB: whole superpage is modified. */
-                l3_pgentry_t nl3e = !(nf & _PAGE_PRESENT) ? l3e_empty()
+                l3_pgentry_t nl3e = !(flags & _PAGE_PRESENT) ? l3e_empty()
                     : l3e_from_pfn(l3e_get_pfn(*pl3e),
-                                   (l3e_get_flags(*pl3e) & ~FLAGS_MASK) | nf);
+                                   (l3e_get_flags(*pl3e) & ~FLAGS_MASK) |
+                                    flags);
 
                 l3e_write_atomic(pl3e, nl3e);
                 v += 1UL << L3_PAGETABLE_SHIFT;
@@ -5691,7 +5692,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
         if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
         {
             /* Confirm the caller isn't trying to create new mappings. */
-            ASSERT(!(nf & _PAGE_PRESENT));
+            ASSERT(!(flags & _PAGE_PRESENT));
 
             v += 1UL << L2_PAGETABLE_SHIFT;
             v &= ~((1UL << L2_PAGETABLE_SHIFT) - 1);
@@ -5704,9 +5705,10 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                  ((e-v) >= (1UL << L2_PAGETABLE_SHIFT)) )
             {
                 /* PSE: whole superpage is modified. */
-                l2_pgentry_t nl2e = !(nf & _PAGE_PRESENT) ? l2e_empty()
+                l2_pgentry_t nl2e = !(flags & _PAGE_PRESENT) ? l2e_empty()
                     : l2e_from_pfn(l2e_get_pfn(*pl2e),
-                                   (l2e_get_flags(*pl2e) & ~FLAGS_MASK) | nf);
+                                   (l2e_get_flags(*pl2e) & ~FLAGS_MASK) |
+                                    flags);
 
                 l2e_write_atomic(pl2e, nl2e);
                 v += 1UL << L2_PAGETABLE_SHIFT;
@@ -5756,11 +5758,11 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
             /* Confirm the caller isn't trying to create new mappings. */
             if ( !(l1e_get_flags(*pl1e) & _PAGE_PRESENT) )
-                ASSERT(!(nf & _PAGE_PRESENT));
+                ASSERT(!(flags & _PAGE_PRESENT));
 
-            nl1e = !(nf & _PAGE_PRESENT) ? l1e_empty()
+            nl1e = !(flags & _PAGE_PRESENT) ? l1e_empty()
                 : l1e_from_pfn(l1e_get_pfn(*pl1e),
-                               (l1e_get_flags(*pl1e) & ~FLAGS_MASK) | nf);
+                               (l1e_get_flags(*pl1e) & ~FLAGS_MASK) | flags);
 
             l1e_write_atomic(pl1e, nl1e);
             UNMAP_DOMAIN_PAGE(pl1e);
@@ -5770,7 +5772,8 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
              * If we are not destroying mappings, or not done with the L2E,
              * skip the empty&free check.
              */
-            if ( (nf & _PAGE_PRESENT) || ((v != e) && (l1_table_offset(v) != 0)) )
+            if ( (flags & _PAGE_PRESENT) ||
+                 ((v != e) && (l1_table_offset(v) != 0)) )
                 continue;
             if ( locking )
                 spin_lock(&map_pgdir_lock);
@@ -5817,7 +5820,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
          * If we are not destroying mappings, or not done with the L3E,
          * skip the empty&free check.
          */
-        if ( (nf & _PAGE_PRESENT) ||
+        if ( (flags & _PAGE_PRESENT) ||
              ((v != e) && (l2_table_offset(v) + l1_table_offset(v) != 0)) )
             continue;
         if ( locking )
@@ -5892,14 +5895,14 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
  * a problem.
  */
 void init_or_livepatch modify_xen_mappings_lite(
-    unsigned long s, unsigned long e, unsigned int _nf)
+    unsigned long s, unsigned long e, unsigned int flags)
 {
     unsigned long v = s, fm, nf;
 
     /* Set of valid PTE bits which may be altered. */
 #define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
     fm = put_pte_flags(FLAGS_MASK);
-    nf = put_pte_flags(_nf & FLAGS_MASK);
+    nf = put_pte_flags(flags & FLAGS_MASK);
 #undef FLAGS_MASK
 
     ASSERT(nf & _PAGE_PRESENT);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 962ef216fd..4ed5fc4230 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -549,7 +549,7 @@ union add_to_physmap_extra {
 
 int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
                               union add_to_physmap_extra extra,
-                              unsigned long idx, gfn_t gfn);
+                              unsigned long idx, gfn_t gpfn);
 
 int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
                           unsigned int start);
-- 
2.34.1


