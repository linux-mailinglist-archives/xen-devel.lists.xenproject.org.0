Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297D2366DEB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114543.218327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDe0-0007pX-7N; Wed, 21 Apr 2021 14:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114543.218327; Wed, 21 Apr 2021 14:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDe0-0007oz-1j; Wed, 21 Apr 2021 14:15:56 +0000
Received: by outflank-mailman (input) for mailman id 114543;
 Wed, 21 Apr 2021 14:15:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lZDdx-0007my-I6
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:15:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZDdx-0000xG-9a; Wed, 21 Apr 2021 14:15:53 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZDdw-00045m-SR; Wed, 21 Apr 2021 14:15:53 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:References:In-Reply-To:Message-Id:
	Date:Subject:Cc:To:From; bh=wzlCagLjSrFeG2Z7JvIUbKAYuqEvCwPwhzznOHco8PU=; b=L
	glFcDjqWdWTjpqKlBZc99ji95vJWuW0VFBfREunRQFhDz8xWbjOMWAVm5I8IdJGwysdgPy+NxNqBe
	Szda3hMbMc/U0raTgxfHcp22i9Z7qmrgJ60MNHlj+Ar0SWbclAkZTO/GxY/HZiy748wMs4PPK7GhH
	LwNrG//NPcNjZTvk=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 01/13] x86/mm: rewrite virt_to_xen_l*e
Date: Wed, 21 Apr 2021 15:15:29 +0100
Message-Id: <0ccd3883b0ec2e05d600bb593f8f0afd058adc43.1619014052.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619014052.git.hongyxia@amazon.com>
References: <cover.1619014052.git.hongyxia@amazon.com>
In-Reply-To: <cover.1619014052.git.hongyxia@amazon.com>
References: <cover.1619014052.git.hongyxia@amazon.com>

From: Wei Liu <wei.liu2@citrix.com>

Rewrite those functions to use the new APIs. Modify its callers to unmap
the pointer returned. Since alloc_xen_pagetable_new() is almost never
useful unless accompanied by page clearing and a mapping, introduce a
helper alloc_map_clear_xen_pt() for this sequence.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

---
Changed in v10:
- remove stale include.
- s/alloc_map_clear_xen_pt/alloc_mapped_pagetable/g.
- fix mis-hunks.

Changed in v9:
- use domain_page_map_to_mfn() around the L3 table locking logic.
- remove vmap_to_mfn() changes since we now use xen_map_to_mfn().

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
 xen/arch/x86/mm.c        | 102 +++++++++++++++++++++++++++------------
 xen/include/asm-x86/mm.h |   1 +
 2 files changed, 72 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b7a10bbdd401..5944ef19dc50 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4931,8 +4931,28 @@ void free_xen_pagetable_new(mfn_t mfn)
         free_xenheap_page(mfn_to_virt(mfn_x(mfn)));
 }
 
+void *alloc_mapped_pagetable(mfn_t *pmfn)
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
@@ -4941,33 +4961,33 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
     if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
     {
         bool locking = system_state > SYS_STATE_boot;
-        l3_pgentry_t *l3t = alloc_xen_pagetable();
+        mfn_t l3mfn;
+        l3_pgentry_t *l3t = alloc_mapped_pagetable(&l3mfn);
 
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
@@ -4976,31 +4996,37 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
     if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
     {
         bool locking = system_state > SYS_STATE_boot;
-        l2_pgentry_t *l2t = alloc_xen_pagetable();
+        mfn_t l2mfn;
+        l2_pgentry_t *l2t = alloc_mapped_pagetable(&l2mfn);
 
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
@@ -5009,26 +5035,32 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
     if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
     {
         bool locking = system_state > SYS_STATE_boot;
-        l1_pgentry_t *l1t = alloc_xen_pagetable();
+        mfn_t l1mfn;
+        l1_pgentry_t *l1t = alloc_mapped_pagetable(&l1mfn);
 
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
@@ -5085,7 +5117,7 @@ mfn_t xen_map_to_mfn(unsigned long va)
 
     L3T_INIT(l3page);
     CHECK_MAPPED(pl3e);
-    l3page = virt_to_page(pl3e);
+    l3page = mfn_to_page(domain_page_map_to_mfn(pl3e));
     L3T_LOCK(l3page);
 
     CHECK_MAPPED(l3e_get_flags(*pl3e) & _PAGE_PRESENT);
@@ -5124,7 +5156,8 @@ int map_pages_to_xen(
     unsigned int flags)
 {
     bool locking = system_state > SYS_STATE_boot;
-    l2_pgentry_t *pl2e, ol2e;
+    l3_pgentry_t *pl3e = NULL, ol3e;
+    l2_pgentry_t *pl2e = NULL, ol2e;
     l1_pgentry_t *pl1e, ol1e;
     unsigned int  i;
     int rc = -ENOMEM;
@@ -5148,15 +5181,16 @@ int map_pages_to_xen(
 
     while ( nr_mfns != 0 )
     {
-        l3_pgentry_t *pl3e, ol3e;
-
+        /* Clean up the previous iteration. */
         L3T_UNLOCK(current_l3page);
+        UNMAP_DOMAIN_PAGE(pl3e);
+        UNMAP_DOMAIN_PAGE(pl2e);
 
         pl3e = virt_to_xen_l3e(virt);
         if ( !pl3e )
             goto out;
 
-        current_l3page = virt_to_page(pl3e);
+        current_l3page = mfn_to_page(domain_page_map_to_mfn(pl3e));
         L3T_LOCK(current_l3page);
         ol3e = *pl3e;
 
@@ -5321,6 +5355,8 @@ int map_pages_to_xen(
                 pl1e = virt_to_xen_l1e(virt);
                 if ( pl1e == NULL )
                     goto out;
+
+                UNMAP_DOMAIN_PAGE(pl1e);
             }
             else if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
             {
@@ -5498,6 +5534,8 @@ int map_pages_to_xen(
 
  out:
     L3T_UNLOCK(current_l3page);
+    unmap_domain_page(pl3e);
+    unmap_domain_page(pl2e);
     return rc;
 }
 
@@ -5521,6 +5559,7 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 {
     bool locking = system_state > SYS_STATE_boot;
+    l3_pgentry_t *pl3e = NULL;
     l2_pgentry_t *pl2e;
     l1_pgentry_t *pl1e;
     unsigned int  i;
@@ -5539,15 +5578,15 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
     while ( v < e )
     {
-        l3_pgentry_t *pl3e;
-
+        /* Clean up the previous iteration. */
         L3T_UNLOCK(current_l3page);
+        UNMAP_DOMAIN_PAGE(pl3e);
 
         pl3e = virt_to_xen_l3e(v);
         if ( !pl3e )
             goto out;
 
-        current_l3page = virt_to_page(pl3e);
+        current_l3page = mfn_to_page(domain_page_map_to_mfn(pl3e));
         L3T_LOCK(current_l3page);
 
         if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
@@ -5777,6 +5816,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
  out:
     L3T_UNLOCK(current_l3page);
+    unmap_domain_page(pl3e);
     return rc;
 }
 
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index 041c158f03f6..111754675cbf 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -577,6 +577,7 @@ void *alloc_xen_pagetable(void);
 void free_xen_pagetable(void *v);
 mfn_t alloc_xen_pagetable_new(void);
 void free_xen_pagetable_new(mfn_t mfn);
+void *alloc_mapped_pagetable(mfn_t *pmfn);
 
 l1_pgentry_t *virt_to_xen_l1e(unsigned long v);
 
-- 
2.23.4


