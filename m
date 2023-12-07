Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DCD808389
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 09:48:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649610.1014339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBA3I-0005V4-5s; Thu, 07 Dec 2023 08:48:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649610.1014339; Thu, 07 Dec 2023 08:48:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBA3I-0005Q8-1o; Thu, 07 Dec 2023 08:48:12 +0000
Received: by outflank-mailman (input) for mailman id 649610;
 Thu, 07 Dec 2023 08:48:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZB3o=HS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rBA3G-0004rG-5x
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 08:48:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58bddff4-94dd-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 09:48:09 +0100 (CET)
Received: from Dell.bugseng.com (unknown [78.210.131.21])
 by support.bugseng.com (Postfix) with ESMTPSA id D048C4EE0741;
 Thu,  7 Dec 2023 09:48:07 +0100 (CET)
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
X-Inumbo-ID: 58bddff4-94dd-11ee-98e7-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 4/5] x86/mm: address violations of MISRA C:2012 Rule 8.2
Date: Thu,  7 Dec 2023 09:47:53 +0100
Message-Id: <428b868a2b1aec2b50ccbe510bc3089203ac9c7b.1701936906.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701936906.git.federico.serafini@bugseng.com>
References: <cover.1701936906.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
  - do not add parameters to compat_subarch_memory_op() (removed).
---
 xen/arch/x86/include/asm/mm.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 639163948e..7d26d9cd2f 100644
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
@@ -572,19 +572,19 @@ int __sync_local_execstate(void);
 /* Arch-specific portion of memory_op hypercall. */
 long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 long subarch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
-int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void));
+int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
 
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
 
-- 
2.34.1


