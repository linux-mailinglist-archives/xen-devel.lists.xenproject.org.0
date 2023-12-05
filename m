Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450FF805399
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647698.1011239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAU22-0008Lb-D5; Tue, 05 Dec 2023 11:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647698.1011239; Tue, 05 Dec 2023 11:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAU22-0008F7-8f; Tue, 05 Dec 2023 11:56:06 +0000
Received: by outflank-mailman (input) for mailman id 647698;
 Tue, 05 Dec 2023 11:56:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDPQ=HQ=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rAU21-0008Co-8n
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:56:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44096803-9365-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 12:56:03 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-79-46-48-173.retail.telecomitalia.it [79.46.48.173])
 by support.bugseng.com (Postfix) with ESMTPSA id 64D884EE074C;
 Tue,  5 Dec 2023 12:56:03 +0100 (CET)
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
X-Inumbo-ID: 44096803-9365-11ee-98e5-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/6] x86/mm: address violations of MISRA C:2012 Rule 8.2
Date: Tue,  5 Dec 2023 12:55:51 +0100
Message-Id: <461a97a14a530286a8b8d0d30a1a8ed63690bc26.1701764980.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701764980.git.federico.serafini@bugseng.com>
References: <cover.1701764980.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/mm.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

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
 
-- 
2.34.1


