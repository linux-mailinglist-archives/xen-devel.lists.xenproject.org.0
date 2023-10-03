Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B437B6D04
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 17:24:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612271.952126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnhGK-0004te-2U; Tue, 03 Oct 2023 15:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612271.952126; Tue, 03 Oct 2023 15:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnhGJ-0004r2-V1; Tue, 03 Oct 2023 15:24:39 +0000
Received: by outflank-mailman (input) for mailman id 612271;
 Tue, 03 Oct 2023 15:24:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQkC=FR=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qnhGJ-0004qw-DJ
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 15:24:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6589b9a-6200-11ee-9b0d-b553b5be7939;
 Tue, 03 Oct 2023 17:24:37 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-11-204-216.retail.telecomitalia.it [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id C7D954EE0737;
 Tue,  3 Oct 2023 17:24:35 +0200 (CEST)
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
X-Inumbo-ID: f6589b9a-6200-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH v3] xen/mm: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Tue,  3 Oct 2023 17:24:30 +0200
Message-Id: <eedcfeb8d1c81527b7e18fcc0eca252577f00035.1696344012.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names and make function declarations and definitions
consistent. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v3:
- used "nf" as parameter name to denote "new flags".
---
Changes in v2:
- propagated changes to the arm code.
---
 xen/arch/arm/mm.c             |  4 ++--
 xen/arch/ppc/mm-radix.c       |  2 +-
 xen/arch/x86/include/asm/mm.h | 20 ++++++++++----------
 xen/arch/x86/mm.c             | 12 ++++++------
 xen/include/xen/mm.h          | 16 +++++++++-------
 5 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index c34cc94c90..484f23140e 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1246,12 +1246,12 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
 }
 
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
+int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 {
     ASSERT(IS_ALIGNED(s, PAGE_SIZE));
     ASSERT(IS_ALIGNED(e, PAGE_SIZE));
     ASSERT(s <= e);
-    return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, flags);
+    return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, nf);
 }
 
 /* Release all __init and __initdata ranges to be reused */
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index 11d0f27b60..daa411a6fa 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -271,7 +271,7 @@ void __init setup_initial_pagetables(void)
  */
 unsigned long __read_mostly frametable_base_pdx;
 
-void put_page(struct page_info *p)
+void put_page(struct page_info *page)
 {
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 05dfe35502..a270f8ddd6 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -406,7 +406,7 @@ void put_page_type(struct page_info *page);
 int  get_page_type(struct page_info *page, unsigned long type);
 int  put_page_type_preemptible(struct page_info *page);
 int  get_page_type_preemptible(struct page_info *page, unsigned long type);
-int  put_old_guest_table(struct vcpu *);
+int  put_old_guest_table(struct vcpu *v);
 int  get_page_from_l1e(
     l1_pgentry_t l1e, struct domain *l1e_owner, struct domain *pg_owner);
 void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner);
@@ -557,7 +557,7 @@ void audit_domains(void);
 
 void make_cr3(struct vcpu *v, mfn_t mfn);
 pagetable_t update_cr3(struct vcpu *v);
-int vcpu_destroy_pagetables(struct vcpu *);
+int vcpu_destroy_pagetables(struct vcpu *v);
 void *do_page_walk(struct vcpu *v, unsigned long addr);
 
 /* Allocator functions for Xen pagetables. */
@@ -572,20 +572,20 @@ int __sync_local_execstate(void);
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
index 39544bd9f9..7ae42ac59b 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5901,17 +5901,17 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
  * a problem.
  */
 void init_or_livepatch modify_xen_mappings_lite(
-    unsigned long s, unsigned long e, unsigned int _nf)
+    unsigned long s, unsigned long e, unsigned int nf)
 {
-    unsigned long v = s, fm, nf;
+    unsigned long v = s, fm, flags;
 
     /* Set of valid PTE bits which may be altered. */
 #define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
     fm = put_pte_flags(FLAGS_MASK);
-    nf = put_pte_flags(_nf & FLAGS_MASK);
+    flags = put_pte_flags(nf & FLAGS_MASK);
 #undef FLAGS_MASK
 
-    ASSERT(nf & _PAGE_PRESENT);
+    ASSERT(flags & _PAGE_PRESENT);
     ASSERT(IS_ALIGNED(s, PAGE_SIZE) && s >= XEN_VIRT_START);
     ASSERT(IS_ALIGNED(e, PAGE_SIZE) && e <= XEN_VIRT_END);
 
@@ -5925,7 +5925,7 @@ void init_or_livepatch modify_xen_mappings_lite(
 
         if ( l2e_get_flags(l2e) & _PAGE_PSE )
         {
-            l2e_write_atomic(pl2e, l2e_from_intpte((l2e.l2 & ~fm) | nf));
+            l2e_write_atomic(pl2e, l2e_from_intpte((l2e.l2 & ~fm) | flags));
 
             v += 1UL << L2_PAGETABLE_SHIFT;
             continue;
@@ -5943,7 +5943,7 @@ void init_or_livepatch modify_xen_mappings_lite(
 
                 ASSERT(l1f & _PAGE_PRESENT);
 
-                l1e_write_atomic(pl1e, l1e_from_intpte((l1e.l1 & ~fm) | nf));
+                l1e_write_atomic(pl1e, l1e_from_intpte((l1e.l1 & ~fm) | flags));
 
                 v += 1UL << L1_PAGETABLE_SHIFT;
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 8b9618609f..abd09a83d2 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -71,9 +71,10 @@
 
 struct page_info;
 
-void put_page(struct page_info *);
-bool __must_check get_page(struct page_info *, const struct domain *);
-struct domain *__must_check page_get_owner_and_reference(struct page_info *);
+void put_page(struct page_info *page);
+bool __must_check get_page(struct page_info *page, const struct domain *domain);
+struct domain *__must_check page_get_owner_and_reference(
+    struct page_info *page);
 
 /* Boot-time allocator. Turns into generic allocator after bootstrap. */
 void init_boot_pages(paddr_t ps, paddr_t pe);
@@ -110,8 +111,9 @@ int map_pages_to_xen(
     unsigned long nr_mfns,
     unsigned int flags);
 /* Alter the permissions of a range of Xen virtual address space. */
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags);
-void modify_xen_mappings_lite(unsigned long s, unsigned long e, unsigned int flags);
+int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf);
+void modify_xen_mappings_lite(unsigned long s, unsigned long e,
+                              unsigned int nf);
 int destroy_xen_mappings(unsigned long s, unsigned long e);
 /* Retrieve the MFN mapped by VA in Xen virtual address space. */
 mfn_t xen_map_to_mfn(unsigned long va);
@@ -135,7 +137,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order);
 unsigned long avail_domheap_pages_region(
     unsigned int node, unsigned int min_width, unsigned int max_width);
 unsigned long avail_domheap_pages(void);
-unsigned long avail_node_heap_pages(unsigned int);
+unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
 unsigned int online_page(mfn_t mfn, uint32_t *status);
@@ -528,7 +530,7 @@ static inline unsigned int get_order_from_pages(unsigned long nr_pages)
     return order;
 }
 
-void scrub_one_page(struct page_info *);
+void scrub_one_page(struct page_info *pg);
 
 #ifndef arch_free_heap_page
 #define arch_free_heap_page(d, pg) \
-- 
2.34.1


