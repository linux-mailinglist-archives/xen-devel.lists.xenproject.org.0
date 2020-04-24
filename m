Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B746D1B780B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 16:09:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRz1E-0002rf-Ja; Fri, 24 Apr 2020 14:09:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OF9t=6I=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jRz1D-0002rK-EY
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 14:09:27 +0000
X-Inumbo-ID: 331297e4-8635-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 331297e4-8635-11ea-b4f4-bc764e2007e4;
 Fri, 24 Apr 2020 14:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ni2X3IEF9bCOanK+t7F3wzlp0i4MbnPB9Hxj61sNivc=; b=d+Fp4d1aL9GH1b3g4j4+rxL4ta
 TwDbaZHa37u7Cvuv2wcy8UtKJJMDFugu8NFHLAxy/k9CU0SD3KOBeWLqGIouWz6vVQ5eTWGt2fPne
 s/JpPeUmH+d6fXquyu+urRL0yPmmt5TamkuRdRisSkt7w60t+Vt369HR3slwOVysMg3g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jRz19-0001gr-F8; Fri, 24 Apr 2020 14:09:23 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jRz18-0001fN-Vw; Fri, 24 Apr 2020 14:09:23 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 03/15] x86/mm: rewrite virt_to_xen_l*e
Date: Fri, 24 Apr 2020 15:08:54 +0100
Message-Id: <949d2dc54fd7d3230db6a0934d73668a9999eb1a.1587735799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
In-Reply-To: <cover.1587735799.git.hongyxia@amazon.com>
References: <cover.1587735799.git.hongyxia@amazon.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

Rewrite those functions to use the new APIs. Modify its callers to unmap
the pointer returned.

Note that the change of virt_to_xen_l1e() also requires vmap_to_mfn() to
unmap the page, which requires domain_page.h header in vmap.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/arch/x86/domain_page.c | 11 +++--
 xen/arch/x86/mm.c          | 85 +++++++++++++++++++++++++++-----------
 xen/common/vmap.c          |  1 +
 xen/include/asm-x86/page.h |  8 +++-
 4 files changed, 76 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index dd32712d2f..3a244bb500 100644
--- a/xen/arch/x86/domain_page.c
+++ b/xen/arch/x86/domain_page.c
@@ -333,21 +333,24 @@ void unmap_domain_page_global(const void *ptr)
 mfn_t domain_page_map_to_mfn(const void *ptr)
 {
     unsigned long va = (unsigned long)ptr;
-    const l1_pgentry_t *pl1e;
+    l1_pgentry_t l1e;
 
     if ( va >= DIRECTMAP_VIRT_START )
         return _mfn(virt_to_mfn(ptr));
 
     if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
     {
-        pl1e = virt_to_xen_l1e(va);
+        const l1_pgentry_t *pl1e = virt_to_xen_l1e(va);
+
         BUG_ON(!pl1e);
+        l1e = *pl1e;
+        unmap_domain_page(pl1e);
     }
     else
     {
         ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
-        pl1e = &__linear_l1_table[l1_linear_offset(va)];
+        l1e = __linear_l1_table[l1_linear_offset(va)];
     }
 
-    return l1e_get_mfn(*pl1e);
+    return l1e_get_mfn(l1e);
 }
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 13a34a8d57..3328d887c4 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4955,6 +4955,10 @@ void free_xen_pagetable_new(mfn_t mfn)
 
 static DEFINE_SPINLOCK(map_pgdir_lock);
 
+/*
+ * For virt_to_xen_lXe() functions, they take a virtual address and return a
+ * pointer to Xen's LX entry. Caller needs to unmap the pointer.
+ */
 static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
 {
     l4_pgentry_t *pl4e;
@@ -4963,33 +4967,36 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
     if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
     {
         bool locking = system_state > SYS_STATE_boot;
-        l3_pgentry_t *l3t = alloc_xen_pagetable();
+        l3_pgentry_t *l3t;
+        mfn_t l3mfn = alloc_xen_pagetable_new();
 
-        if ( !l3t )
+        if ( mfn_eq(l3mfn, INVALID_MFN) )
             return NULL;
+        l3t = map_domain_page(l3mfn);
         clear_page(l3t);
+        UNMAP_DOMAIN_PAGE(l3t);
         if ( locking )
             spin_lock(&map_pgdir_lock);
         if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
         {
-            l4_pgentry_t l4e = l4e_from_paddr(__pa(l3t), __PAGE_HYPERVISOR);
+            l4_pgentry_t l4e = l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR);
 
             l4e_write(pl4e, l4e);
             efi_update_l4_pgtable(l4_table_offset(v), l4e);
-            l3t = NULL;
+            l3mfn = INVALID_MFN;
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        if ( l3t )
-            free_xen_pagetable(l3t);
+        free_xen_pagetable_new(l3mfn);
     }
 
-    return l4e_to_l3e(*pl4e) + l3_table_offset(v);
+    return map_l3t_from_l4e(*pl4e) + l3_table_offset(v);
 }
 
 static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
 {
     l3_pgentry_t *pl3e;
+    l2_pgentry_t *pl2e;
 
     pl3e = virt_to_xen_l3e(v);
     if ( !pl3e )
@@ -4998,31 +5005,40 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
     if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
     {
         bool locking = system_state > SYS_STATE_boot;
-        l2_pgentry_t *l2t = alloc_xen_pagetable();
+        l2_pgentry_t *l2t;
+        mfn_t l2mfn = alloc_xen_pagetable_new();
 
-        if ( !l2t )
+        if ( mfn_eq(l2mfn, INVALID_MFN) )
+        {
+            UNMAP_DOMAIN_PAGE(pl3e);
             return NULL;
+        }
+        l2t = map_domain_page(l2mfn);
         clear_page(l2t);
+        UNMAP_DOMAIN_PAGE(l2t);
         if ( locking )
             spin_lock(&map_pgdir_lock);
         if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
         {
-            l3e_write(pl3e, l3e_from_paddr(__pa(l2t), __PAGE_HYPERVISOR));
-            l2t = NULL;
+            l3e_write(pl3e, l3e_from_mfn(l2mfn, __PAGE_HYPERVISOR));
+            l2mfn = INVALID_MFN;
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        if ( l2t )
-            free_xen_pagetable(l2t);
+        free_xen_pagetable_new(l2mfn);
     }
 
     BUG_ON(l3e_get_flags(*pl3e) & _PAGE_PSE);
-    return l3e_to_l2e(*pl3e) + l2_table_offset(v);
+    pl2e = map_l2t_from_l3e(*pl3e) + l2_table_offset(v);
+    unmap_domain_page(pl3e);
+
+    return pl2e;
 }
 
 l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
 {
     l2_pgentry_t *pl2e;
+    l1_pgentry_t *pl1e;
 
     pl2e = virt_to_xen_l2e(v);
     if ( !pl2e )
@@ -5031,26 +5047,34 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
     if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
     {
         bool locking = system_state > SYS_STATE_boot;
-        l1_pgentry_t *l1t = alloc_xen_pagetable();
+        l1_pgentry_t *l1t;
+        mfn_t l1mfn = alloc_xen_pagetable_new();
 
-        if ( !l1t )
+        if ( mfn_eq(l1mfn, INVALID_MFN) )
+        {
+            UNMAP_DOMAIN_PAGE(pl2e);
             return NULL;
+        }
+        l1t = map_domain_page(l1mfn);
         clear_page(l1t);
+        UNMAP_DOMAIN_PAGE(l1t);
         if ( locking )
             spin_lock(&map_pgdir_lock);
         if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
         {
-            l2e_write(pl2e, l2e_from_paddr(__pa(l1t), __PAGE_HYPERVISOR));
-            l1t = NULL;
+            l2e_write(pl2e, l2e_from_mfn(l1mfn, __PAGE_HYPERVISOR));
+            l1mfn = INVALID_MFN;
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        if ( l1t )
-            free_xen_pagetable(l1t);
+        free_xen_pagetable_new(l1mfn);
     }
 
     BUG_ON(l2e_get_flags(*pl2e) & _PAGE_PSE);
-    return l2e_to_l1e(*pl2e) + l1_table_offset(v);
+    pl1e = map_l1t_from_l2e(*pl2e) + l1_table_offset(v);
+    unmap_domain_page(pl2e);
+
+    return pl1e;
 }
 
 /* Convert to from superpage-mapping flags for map_pages_to_xen(). */
@@ -5073,8 +5097,8 @@ int map_pages_to_xen(
     unsigned int flags)
 {
     bool locking = system_state > SYS_STATE_boot;
-    l3_pgentry_t *pl3e, ol3e;
-    l2_pgentry_t *pl2e, ol2e;
+    l3_pgentry_t *pl3e = NULL, ol3e;
+    l2_pgentry_t *pl2e = NULL, ol2e;
     l1_pgentry_t *pl1e, ol1e;
     unsigned int  i;
     int rc = -ENOMEM;
@@ -5095,6 +5119,10 @@ int map_pages_to_xen(
 
     while ( nr_mfns != 0 )
     {
+        /* Clean up mappings mapped in the previous iteration. */
+        UNMAP_DOMAIN_PAGE(pl3e);
+        UNMAP_DOMAIN_PAGE(pl2e);
+
         pl3e = virt_to_xen_l3e(virt);
 
         if ( !pl3e )
@@ -5260,9 +5288,12 @@ int map_pages_to_xen(
             /* Normal page mapping. */
             if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
             {
+                /* This forces the mapping to be populated. */
                 pl1e = virt_to_xen_l1e(virt);
                 if ( pl1e == NULL )
                     goto out;
+
+                UNMAP_DOMAIN_PAGE(pl1e);
             }
             else if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
             {
@@ -5439,6 +5470,8 @@ int map_pages_to_xen(
     rc = 0;
 
  out:
+    UNMAP_DOMAIN_PAGE(pl2e);
+    UNMAP_DOMAIN_PAGE(pl3e);
     return rc;
 }
 
@@ -5462,7 +5495,7 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 {
     bool locking = system_state > SYS_STATE_boot;
-    l3_pgentry_t *pl3e;
+    l3_pgentry_t *pl3e = NULL;
     l2_pgentry_t *pl2e;
     l1_pgentry_t *pl1e;
     unsigned int  i;
@@ -5478,6 +5511,9 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
     while ( v < e )
     {
+        /* Clean up mappings mapped in the previous iteration. */
+        UNMAP_DOMAIN_PAGE(pl3e);
+
         pl3e = virt_to_xen_l3e(v);
 
         if ( !pl3e || !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
@@ -5706,6 +5742,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
     rc = 0;
 
  out:
+    UNMAP_DOMAIN_PAGE(pl3e);
     return rc;
 }
 
diff --git a/xen/common/vmap.c b/xen/common/vmap.c
index faebc1ddf1..9964ab2096 100644
--- a/xen/common/vmap.c
+++ b/xen/common/vmap.c
@@ -1,6 +1,7 @@
 #ifdef VMAP_VIRT_START
 #include <xen/bitmap.h>
 #include <xen/cache.h>
+#include <xen/domain_page.h>
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
diff --git a/xen/include/asm-x86/page.h b/xen/include/asm-x86/page.h
index 5acf3d3d5a..8f711f4992 100644
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -291,7 +291,13 @@ void copy_page_sse2(void *, const void *);
 #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
 #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
 #define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
-#define vmap_to_mfn(va)     _mfn(l1e_get_pfn(*virt_to_xen_l1e((unsigned long)(va))))
+
+#define vmap_to_mfn(va) ({                                                  \
+        const l1_pgentry_t *pl1e_ = virt_to_xen_l1e((unsigned long)(va));   \
+        unsigned long pfn_ = l1e_get_pfn(*pl1e_);                           \
+        unmap_domain_page(pl1e_);                                           \
+        _mfn(pfn_); })
+
 #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
 #endif /* !defined(__ASSEMBLY__) */
-- 
2.24.1.AMZN


