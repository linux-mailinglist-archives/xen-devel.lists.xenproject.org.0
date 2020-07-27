Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690E622F030
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 16:22:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k041P-00079M-0E; Mon, 27 Jul 2020 14:22:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM/5=BG=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1k041N-00075u-Oc
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 14:22:29 +0000
X-Inumbo-ID: 96193afe-d014-11ea-a7d9-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96193afe-d014-11ea-a7d9-12813bfff9fa;
 Mon, 27 Jul 2020 14:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ocpaxy196EOPlPXfon4lDI7Bm2winkx9grPvtKNISJ4=; b=r5vQueOv2ciYdgPxMTLL62sfnp
 hv08MX1PHrv9hFQlKg1nbz0GAKsyhciJr1IGTPDlh9dduSPXruXh1Cy9s1/fDCXrJ1wDKKczVtyar
 9YxcWFNnVVGS0HTiZit0XyVSlbX/N2ehkyMFW1B543LPhBbgi6Qddmzksvhh/GgZYAAM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041F-0001NS-Sb; Mon, 27 Jul 2020 14:22:21 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1k041F-0002w6-Em; Mon, 27 Jul 2020 14:22:21 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v8 03/15] x86/mm: rewrite virt_to_xen_l*e
Date: Mon, 27 Jul 2020 15:21:53 +0100
Message-Id: <e7963f6d8cab8e4d5d4249b12a8175405d888bba.1595857947.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
In-Reply-To: <cover.1595857947.git.hongyxia@amazon.com>
References: <cover.1595857947.git.hongyxia@amazon.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 jgrall@amazon.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Wei Liu <wei.liu2@citrix.com>

Rewrite those functions to use the new APIs. Modify its callers to unmap
the pointer returned. Since alloc_xen_pagetable_new() is almost never
useful unless accompanied by page clearing and a mapping, introduce a
helper alloc_map_clear_xen_pt() for this sequence.

Note that the change of virt_to_xen_l1e() also requires vmap_to_mfn() to
unmap the page, which requires domain_page.h header in vmap.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v8:
- s/virtual address/linear address/.
- BUG_ON() on NULL return in vmap_to_mfn().

Changed in v7:
- remove a comment.
- use l1e_get_mfn() instead of converting things back and forth.
- add alloc_map_clear_xen_pt().
- unmap before the next mapping to reduce mapcache pressure.
- use normal unmap calls instead of the macro in error paths because
  unmap can handle NULL now.
---
 xen/arch/x86/domain_page.c | 11 ++++--
 xen/arch/x86/mm.c          | 96 +++++++++++++++++++++++++++++++++-------------
 xen/common/vmap.c          |  1 +
 xen/include/asm-x86/mm.h   |  1 +
 xen/include/asm-x86/page.h | 10 ++++-
 5 files changed, 88 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
index b03728e18e..dc8627c1b5 100644
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
index 7a11d022c9..fd416c0282 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4965,8 +4965,28 @@ void free_xen_pagetable_new(mfn_t mfn)
         free_xenheap_page(mfn_to_virt(mfn_x(mfn)));
 }
 
+void *alloc_map_clear_xen_pt(mfn_t *pmfn)
+{
+    mfn_t mfn = alloc_xen_pagetable_new();
+    void *ret;
+
+    if ( mfn_eq(mfn, INVALID_MFN) )
+        return NULL;
+
+    if ( pmfn )
+        *pmfn = mfn;
+    ret = map_domain_page(mfn);
+    clear_page(ret);
+
+    return ret;
+}
+
 static DEFINE_SPINLOCK(map_pgdir_lock);
 
+/*
+ * For virt_to_xen_lXe() functions, they take a linear address and return a
+ * pointer to Xen's LX entry. Caller needs to unmap the pointer.
+ */
 static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
 {
     l4_pgentry_t *pl4e;
@@ -4975,33 +4995,33 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
     if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
     {
         bool locking = system_state > SYS_STATE_boot;
-        l3_pgentry_t *l3t = alloc_xen_pagetable();
+        mfn_t l3mfn;
+        l3_pgentry_t *l3t = alloc_map_clear_xen_pt(&l3mfn);
 
         if ( !l3t )
             return NULL;
-        clear_page(l3t);
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
-    l3_pgentry_t *pl3e;
+    l3_pgentry_t *pl3e, l3e;
 
     pl3e = virt_to_xen_l3e(v);
     if ( !pl3e )
@@ -5010,31 +5030,37 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
     if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
     {
         bool locking = system_state > SYS_STATE_boot;
-        l2_pgentry_t *l2t = alloc_xen_pagetable();
+        mfn_t l2mfn;
+        l2_pgentry_t *l2t = alloc_map_clear_xen_pt(&l2mfn);
 
         if ( !l2t )
+        {
+            unmap_domain_page(pl3e);
             return NULL;
-        clear_page(l2t);
+        }
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
+    l3e = *pl3e;
+    unmap_domain_page(pl3e);
+
+    return map_l2t_from_l3e(l3e) + l2_table_offset(v);
 }
 
 l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
 {
-    l2_pgentry_t *pl2e;
+    l2_pgentry_t *pl2e, l2e;
 
     pl2e = virt_to_xen_l2e(v);
     if ( !pl2e )
@@ -5043,26 +5069,32 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
     if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
     {
         bool locking = system_state > SYS_STATE_boot;
-        l1_pgentry_t *l1t = alloc_xen_pagetable();
+        mfn_t l1mfn;
+        l1_pgentry_t *l1t = alloc_map_clear_xen_pt(&l1mfn);
 
         if ( !l1t )
+        {
+            unmap_domain_page(pl2e);
             return NULL;
-        clear_page(l1t);
+        }
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
+    l2e = *pl2e;
+    unmap_domain_page(pl2e);
+
+    return map_l1t_from_l2e(l2e) + l1_table_offset(v);
 }
 
 /* Convert to from superpage-mapping flags for map_pages_to_xen(). */
@@ -5085,8 +5117,8 @@ int map_pages_to_xen(
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
@@ -5107,6 +5139,10 @@ int map_pages_to_xen(
 
     while ( nr_mfns != 0 )
     {
+        /* Clean up mappings mapped in the previous iteration. */
+        UNMAP_DOMAIN_PAGE(pl3e);
+        UNMAP_DOMAIN_PAGE(pl2e);
+
         pl3e = virt_to_xen_l3e(virt);
 
         if ( !pl3e )
@@ -5275,6 +5311,8 @@ int map_pages_to_xen(
                 pl1e = virt_to_xen_l1e(virt);
                 if ( pl1e == NULL )
                     goto out;
+
+                UNMAP_DOMAIN_PAGE(pl1e);
             }
             else if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
             {
@@ -5451,6 +5489,8 @@ int map_pages_to_xen(
     rc = 0;
 
  out:
+    unmap_domain_page(pl2e);
+    unmap_domain_page(pl3e);
     return rc;
 }
 
@@ -5474,7 +5514,7 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 {
     bool locking = system_state > SYS_STATE_boot;
-    l3_pgentry_t *pl3e;
+    l3_pgentry_t *pl3e = NULL;
     l2_pgentry_t *pl2e;
     l1_pgentry_t *pl1e;
     unsigned int  i;
@@ -5490,6 +5530,9 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
     while ( v < e )
     {
+        /* Clean up mappings mapped in the previous iteration. */
+        UNMAP_DOMAIN_PAGE(pl3e);
+
         pl3e = virt_to_xen_l3e(v);
 
         if ( !pl3e || !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
@@ -5718,6 +5761,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
     rc = 0;
 
  out:
+    unmap_domain_page(pl3e);
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
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index 7e74996053..5b76308948 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -586,6 +586,7 @@ void *alloc_xen_pagetable(void);
 void free_xen_pagetable(void *v);
 mfn_t alloc_xen_pagetable_new(void);
 void free_xen_pagetable_new(mfn_t mfn);
+void *alloc_map_clear_xen_pt(mfn_t *pmfn);
 
 l1_pgentry_t *virt_to_xen_l1e(unsigned long v);
 
diff --git a/xen/include/asm-x86/page.h b/xen/include/asm-x86/page.h
index f632affaef..608a048c28 100644
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -291,7 +291,15 @@ void copy_page_sse2(void *, const void *);
 #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
 #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
 #define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
-#define vmap_to_mfn(va)     _mfn(l1e_get_pfn(*virt_to_xen_l1e((unsigned long)(va))))
+
+#define vmap_to_mfn(va) ({                                                  \
+        const l1_pgentry_t *pl1e_ = virt_to_xen_l1e((unsigned long)(va));   \
+        mfn_t mfn_;                                                         \
+        BUG_ON(!pl1e_);                                                     \
+        mfn_ = l1e_get_mfn(*pl1e_);                                         \
+        unmap_domain_page(pl1e_);                                           \
+        mfn_; })
+
 #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
 #endif /* !defined(__ASSEMBLY__) */
-- 
2.16.6


