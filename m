Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08007B07C9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 17:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609090.947951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWB5-0002xt-GV; Wed, 27 Sep 2023 15:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609090.947951; Wed, 27 Sep 2023 15:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWB5-0002vs-DF; Wed, 27 Sep 2023 15:10:15 +0000
Received: by outflank-mailman (input) for mailman id 609090;
 Wed, 27 Sep 2023 15:10:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XInx=FL=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qlWB4-0002vm-Js
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 15:10:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f47f8452-5d47-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 17:10:12 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-11-204-216.retail.telecomitalia.it [87.11.204.216])
 by support.bugseng.com (Postfix) with ESMTPSA id 5FDC04EE0738;
 Wed, 27 Sep 2023 17:10:11 +0200 (CEST)
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
X-Inumbo-ID: f47f8452-5d47-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Henry Wang <henry.wang@arm.com>
Subject: [XEN PATCH] x86/domain_page: address violations of MISRA C:2012 Rule 8.3
Date: Wed, 27 Sep 2023 17:09:34 +0200
Message-Id: <6f3538a91f719611e719066237568163ae90c95e.1695827160.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function declarations and definitions consistent.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/domain_page.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index eac5e3304f..1cfa992a02 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -173,18 +173,18 @@ void *map_domain_page(mfn_t mfn)
     return (void *)MAPCACHE_VIRT_START + pfn_to_paddr(idx);
 }
 
-void unmap_domain_page(const void *ptr)
+void unmap_domain_page(const void *va)
 {
     unsigned int idx;
     struct vcpu *v;
     struct mapcache_domain *dcache;
-    unsigned long va = (unsigned long)ptr, mfn, flags;
+    unsigned long addr = (unsigned long)va, mfn, flags;
     struct vcpu_maphash_entry *hashent;
 
-    if ( !va || va >= DIRECTMAP_VIRT_START )
+    if ( !addr || addr >= DIRECTMAP_VIRT_START )
         return;
 
-    ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
+    ASSERT(addr >= MAPCACHE_VIRT_START && addr < MAPCACHE_VIRT_END);
 
     v = mapcache_current_vcpu();
     ASSERT(v && is_pv_vcpu(v));
@@ -192,7 +192,7 @@ void unmap_domain_page(const void *ptr)
     dcache = &v->domain->arch.pv.mapcache;
     ASSERT(dcache->inuse);
 
-    idx = PFN_DOWN(va - MAPCACHE_VIRT_START);
+    idx = PFN_DOWN(addr - MAPCACHE_VIRT_START);
     mfn = l1e_get_pfn(MAPCACHE_L1ENT(idx));
     hashent = &v->arch.pv.mapcache.hash[MAPHASH_HASHFN(mfn)];
 
@@ -317,30 +317,30 @@ void *map_domain_page_global(mfn_t mfn)
     return vmap(&mfn, 1);
 }
 
-void unmap_domain_page_global(const void *ptr)
+void unmap_domain_page_global(const void *va)
 {
-    unsigned long va = (unsigned long)ptr;
+    unsigned long addr = (unsigned long)va;
 
-    if ( va >= DIRECTMAP_VIRT_START )
+    if ( addr >= DIRECTMAP_VIRT_START )
         return;
 
-    ASSERT(va >= VMAP_VIRT_START && va < VMAP_VIRT_END);
+    ASSERT(addr >= VMAP_VIRT_START && addr < VMAP_VIRT_END);
 
-    vunmap(ptr);
+    vunmap(va);
 }
 
 /* Translate a map-domain-page'd address to the underlying MFN */
-mfn_t domain_page_map_to_mfn(const void *ptr)
+mfn_t domain_page_map_to_mfn(const void *va)
 {
-    unsigned long va = (unsigned long)ptr;
+    unsigned long addr = (unsigned long)va;
 
-    if ( va >= DIRECTMAP_VIRT_START )
-        return _mfn(virt_to_mfn(ptr));
+    if ( addr >= DIRECTMAP_VIRT_START )
+        return _mfn(virt_to_mfn(va));
 
-    if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
-        return vmap_to_mfn(va);
+    if ( addr >= VMAP_VIRT_START && addr < VMAP_VIRT_END )
+        return vmap_to_mfn(addr);
 
-    ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
+    ASSERT(addr >= MAPCACHE_VIRT_START && addr < MAPCACHE_VIRT_END);
 
-    return l1e_get_mfn(__linear_l1_table[l1_linear_offset(va)]);
+    return l1e_get_mfn(__linear_l1_table[l1_linear_offset(addr)]);
 }
-- 
2.34.1


