Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC1B7F42D6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:52:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638586.995319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jte-0002mt-Dr; Wed, 22 Nov 2023 09:51:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638586.995319; Wed, 22 Nov 2023 09:51:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jte-0002kq-Aj; Wed, 22 Nov 2023 09:51:50 +0000
Received: by outflank-mailman (input) for mailman id 638586;
 Wed, 22 Nov 2023 09:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vowI=HD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r5jtc-0002Gw-TK
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:51:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0c47e92-891c-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 10:51:48 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.203.136])
 by support.bugseng.com (Postfix) with ESMTPSA id 820B74EE0C92;
 Wed, 22 Nov 2023 10:51:46 +0100 (CET)
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
X-Inumbo-ID: c0c47e92-891c-11ee-98e1-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v4 2/2] xen/mm: address violations of MISRA C:2012 Rules 8.2 and 8.3
Date: Wed, 22 Nov 2023 10:51:29 +0100
Message-Id: <9a73c479f3a9b2a3f796f8f65de3b3feb735c56d.1700645120.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700645120.git.federico.serafini@bugseng.com>
References: <cover.1700645120.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names and uniform the interfaces of
modify_xen_mappings() and modify_xen_mappings_lite().

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
This patch depends on patch 1/2 of the same series.
---
 xen/arch/arm/mmu/pt.c   |  4 ++--
 xen/arch/ppc/mm-radix.c |  2 +-
 xen/arch/x86/mm.c       |  4 ++--
 xen/include/xen/mm.h    | 16 +++++++++-------
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index e6fc5ed45a..a7755728ae 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -718,12 +718,12 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
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
 
 /*
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
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 42c957c40e..0a66db10b9 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5901,14 +5901,14 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
  * a problem.
  */
 void init_or_livepatch modify_xen_mappings_lite(
-    unsigned long s, unsigned long e, unsigned int _nf)
+    unsigned long s, unsigned long e, unsigned int nf)
 {
     unsigned long v = s, fm, flags;
 
     /* Set of valid PTE bits which may be altered. */
 #define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
     fm = put_pte_flags(FLAGS_MASK);
-    flags = put_pte_flags(_nf & FLAGS_MASK);
+    flags = put_pte_flags(nf & FLAGS_MASK);
 #undef FLAGS_MASK
 
     ASSERT(flags & _PAGE_PRESENT);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 8b9618609f..d0682c9da5 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -71,9 +71,10 @@
 
 struct page_info;
 
-void put_page(struct page_info *);
-bool __must_check get_page(struct page_info *, const struct domain *);
-struct domain *__must_check page_get_owner_and_reference(struct page_info *);
+void put_page(struct page_info *page);
+bool __must_check get_page(struct page_info *page,
+                           const struct domain *domain);
+struct domain *__must_check page_get_owner_and_reference(struct page_info *page);
 
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


