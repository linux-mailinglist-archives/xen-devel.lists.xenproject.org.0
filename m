Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37A7DC973
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 10:26:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625544.974914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxl0Q-0006mx-T3; Tue, 31 Oct 2023 09:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625544.974914; Tue, 31 Oct 2023 09:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxl0Q-0006ki-QN; Tue, 31 Oct 2023 09:25:50 +0000
Received: by outflank-mailman (input) for mailman id 625544;
 Tue, 31 Oct 2023 09:25:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EKKP=GN=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qxl0P-0006kc-Qj
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 09:25:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a03c143-77cf-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 10:25:48 +0100 (CET)
Received: from Dell.homenet.telecomitalia.it
 (host-87-7-132-154.retail.telecomitalia.it [87.7.132.154])
 by support.bugseng.com (Postfix) with ESMTPSA id 96AF04EE073A;
 Tue, 31 Oct 2023 10:25:47 +0100 (CET)
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
X-Inumbo-ID: 7a03c143-77cf-11ee-98d6-6d05b1d4d9a1
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
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] xen/domain_page: address violations of MISRA C:2012 Rule 8.3
Date: Tue, 31 Oct 2023 10:25:41 +0100
Message-Id: <d70e8e6b00f7b08ed4b360d38113e6a1460ed3ab.1698743361.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function defintions and declarations consistent.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- use 'ptr' do denote a const void * parameter.
---
 xen/arch/arm/domain_page.c    | 10 +++++-----
 xen/include/xen/domain_page.h | 12 ++++++------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
index b7c02c9190..3a43601623 100644
--- a/xen/arch/arm/domain_page.c
+++ b/xen/arch/arm/domain_page.c
@@ -74,9 +74,9 @@ void *map_domain_page_global(mfn_t mfn)
     return vmap(&mfn, 1);
 }
 
-void unmap_domain_page_global(const void *va)
+void unmap_domain_page_global(const void *ptr)
 {
-    vunmap(va);
+    vunmap(ptr);
 }
 
 /* Map a page of domheap memory */
@@ -149,13 +149,13 @@ void *map_domain_page(mfn_t mfn)
 }
 
 /* Release a mapping taken with map_domain_page() */
-void unmap_domain_page(const void *va)
+void unmap_domain_page(const void *ptr)
 {
     unsigned long flags;
     lpae_t *map = this_cpu(xen_dommap);
-    int slot = ((unsigned long) va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
+    int slot = ((unsigned long)ptr - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
 
-    if ( !va )
+    if ( !ptr )
         return;
 
     local_irq_save(flags);
diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
index 0ff5cdd294..e1dd24ae58 100644
--- a/xen/include/xen/domain_page.h
+++ b/xen/include/xen/domain_page.h
@@ -29,12 +29,12 @@ void *map_domain_page(mfn_t mfn);
  * Pass a VA within a page previously mapped in the context of the
  * currently-executing VCPU via a call to map_domain_page().
  */
-void unmap_domain_page(const void *va);
+void unmap_domain_page(const void *ptr);
 
-/* 
+/*
  * Given a VA from map_domain_page(), return its underlying MFN.
  */
-mfn_t domain_page_map_to_mfn(const void *va);
+mfn_t domain_page_map_to_mfn(const void *ptr);
 
 /*
  * Similar to the above calls, except the mapping is accessible in all
@@ -42,7 +42,7 @@ mfn_t domain_page_map_to_mfn(const void *va);
  * mappings can also be unmapped from any context.
  */
 void *map_domain_page_global(mfn_t mfn);
-void unmap_domain_page_global(const void *va);
+void unmap_domain_page_global(const void *ptr);
 
 #define __map_domain_page(pg)        map_domain_page(page_to_mfn(pg))
 
@@ -55,8 +55,8 @@ static inline void *__map_domain_page_global(const struct page_info *pg)
 
 #define map_domain_page(mfn)                __mfn_to_virt(mfn_x(mfn))
 #define __map_domain_page(pg)               page_to_virt(pg)
-#define unmap_domain_page(va)               ((void)(va))
-#define domain_page_map_to_mfn(va)          _mfn(__virt_to_mfn((unsigned long)(va)))
+#define unmap_domain_page(ptr)               ((void)(ptr))
+#define domain_page_map_to_mfn(ptr)          _mfn(__virt_to_mfn((unsigned long)(ptr)))
 
 static inline void *map_domain_page_global(mfn_t mfn)
 {
-- 
2.34.1


