Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 684F2355187
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 13:06:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105801.202383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXK-0004GN-4v; Tue, 06 Apr 2021 11:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105801.202383; Tue, 06 Apr 2021 11:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjXK-0004Fa-0K; Tue, 06 Apr 2021 11:06:22 +0000
Received: by outflank-mailman (input) for mailman id 105801;
 Tue, 06 Apr 2021 11:06:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lTjXI-0004ES-Lx
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:06:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXI-000530-Dl; Tue, 06 Apr 2021 11:06:20 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXI-0002qD-0j; Tue, 06 Apr 2021 11:06:20 +0000
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
	Date:Subject:Cc:To:From; bh=e8oDiNP5pPlJ0YBPEORyPfE5UKBo6Kl37Wzeoi7OFlc=; b=4
	zOw9QBWIZ5jZZKSSqPbTPJabxVY7pIhoFudwK+X782axj8X/1zKvoLHC+IEpmyqpBSjZ6a22NNNw0
	QQCrIsad3bFSgukiNkZdhn9SbbJ90nDKLVWyZyof53dAc8Hzcc0+tF9w9VHkzWbDpOLYfJ9PhzqIL
	Pzb5jU5BTc7o+jAI=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v9 03/13] x86/mm: switch to new APIs in modify_xen_mappings
Date: Tue,  6 Apr 2021 12:05:51 +0100
Message-Id: <4d45d83f7c4578647180baa0e7850ec3fa37de9e.1617706782.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>

From: Wei Liu <wei.liu2@citrix.com>

Page tables allocated in that function should be mapped and unmapped
now.

Note that pl2e now maybe mapped and unmapped in different iterations, so
we need to add clean-ups for that.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v7:
- use normal unmap in the error path.
---
 xen/arch/x86/mm.c | 57 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index c49e8554f9f7..ababfffb3afc 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5530,6 +5530,7 @@ int map_pages_to_xen(
 
  out:
     L3T_UNLOCK(current_l3page);
+    unmap_domain_page(pl2e);
     unmap_domain_page(pl3e);
     return rc;
 }
@@ -5555,7 +5556,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 {
     bool locking = system_state > SYS_STATE_boot;
     l3_pgentry_t *pl3e = NULL;
-    l2_pgentry_t *pl2e;
+    l2_pgentry_t *pl2e = NULL;
     l1_pgentry_t *pl1e;
     unsigned int  i;
     unsigned long v = s;
@@ -5575,6 +5576,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
     {
         /* Clean up the previous iteration. */
         L3T_UNLOCK(current_l3page);
+        UNMAP_DOMAIN_PAGE(pl2e);
         UNMAP_DOMAIN_PAGE(pl3e);
 
         pl3e = virt_to_xen_l3e(v);
@@ -5597,6 +5599,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
         if ( l3e_get_flags(*pl3e) & _PAGE_PSE )
         {
             l2_pgentry_t *l2t;
+            mfn_t l2mfn;
 
             if ( l2_table_offset(v) == 0 &&
                  l1_table_offset(v) == 0 &&
@@ -5613,35 +5616,38 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             }
 
             /* PAGE1GB: shatter the superpage and fall through. */
-            l2t = alloc_xen_pagetable();
-            if ( !l2t )
+            l2mfn = alloc_xen_pagetable_new();
+            if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
+            l2t = map_domain_page(l2mfn);
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                 l2e_write(l2t + i,
                           l2e_from_pfn(l3e_get_pfn(*pl3e) +
                                        (i << PAGETABLE_ORDER),
                                        l3e_get_flags(*pl3e)));
+            UNMAP_DOMAIN_PAGE(l2t);
+
             if ( locking )
                 spin_lock(&map_pgdir_lock);
             if ( (l3e_get_flags(*pl3e) & _PAGE_PRESENT) &&
                  (l3e_get_flags(*pl3e) & _PAGE_PSE) )
             {
-                l3e_write_atomic(pl3e, l3e_from_mfn(virt_to_mfn(l2t),
-                                                    __PAGE_HYPERVISOR));
-                l2t = NULL;
+                l3e_write_atomic(pl3e,
+                                 l3e_from_mfn(l2mfn, __PAGE_HYPERVISOR));
+                l2mfn = INVALID_MFN;
             }
             if ( locking )
                 spin_unlock(&map_pgdir_lock);
-            if ( l2t )
-                free_xen_pagetable(l2t);
+
+            free_xen_pagetable_new(l2mfn);
         }
 
         /*
          * The L3 entry has been verified to be present, and we've dealt with
          * 1G pages as well, so the L2 table cannot require allocation.
          */
-        pl2e = l3e_to_l2e(*pl3e) + l2_table_offset(v);
+        pl2e = map_l2t_from_l3e(*pl3e) + l2_table_offset(v);
 
         if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
         {
@@ -5669,41 +5675,45 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             else
             {
                 l1_pgentry_t *l1t;
-
                 /* PSE: shatter the superpage and try again. */
-                l1t = alloc_xen_pagetable();
-                if ( !l1t )
+                mfn_t l1mfn = alloc_xen_pagetable_new();
+
+                if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
 
+                l1t = map_domain_page(l1mfn);
                 for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                     l1e_write(&l1t[i],
                               l1e_from_pfn(l2e_get_pfn(*pl2e) + i,
                                            l2e_get_flags(*pl2e) & ~_PAGE_PSE));
+                UNMAP_DOMAIN_PAGE(l1t);
+
                 if ( locking )
                     spin_lock(&map_pgdir_lock);
                 if ( (l2e_get_flags(*pl2e) & _PAGE_PRESENT) &&
                      (l2e_get_flags(*pl2e) & _PAGE_PSE) )
                 {
-                    l2e_write_atomic(pl2e, l2e_from_mfn(virt_to_mfn(l1t),
+                    l2e_write_atomic(pl2e, l2e_from_mfn(l1mfn,
                                                         __PAGE_HYPERVISOR));
-                    l1t = NULL;
+                    l1mfn = INVALID_MFN;
                 }
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
-                if ( l1t )
-                    free_xen_pagetable(l1t);
+
+                free_xen_pagetable_new(l1mfn);
             }
         }
         else
         {
             l1_pgentry_t nl1e, *l1t;
+            mfn_t l1mfn;
 
             /*
              * Ordinary 4kB mapping: The L2 entry has been verified to be
              * present, and we've dealt with 2M pages as well, so the L1 table
              * cannot require allocation.
              */
-            pl1e = l2e_to_l1e(*pl2e) + l1_table_offset(v);
+            pl1e = map_l1t_from_l2e(*pl2e) + l1_table_offset(v);
 
             /* Confirm the caller isn't trying to create new mappings. */
             if ( !(l1e_get_flags(*pl1e) & _PAGE_PRESENT) )
@@ -5714,6 +5724,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                                (l1e_get_flags(*pl1e) & ~FLAGS_MASK) | nf);
 
             l1e_write_atomic(pl1e, nl1e);
+            UNMAP_DOMAIN_PAGE(pl1e);
             v += PAGE_SIZE;
 
             /*
@@ -5743,10 +5754,12 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 continue;
             }
 
-            l1t = l2e_to_l1e(*pl2e);
+            l1mfn = l2e_get_mfn(*pl2e);
+            l1t = map_domain_page(l1mfn);
             for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
                 if ( l1e_get_intpte(l1t[i]) != 0 )
                     break;
+            UNMAP_DOMAIN_PAGE(l1t);
             if ( i == L1_PAGETABLE_ENTRIES )
             {
                 /* Empty: zap the L2E and free the L1 page. */
@@ -5754,7 +5767,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable(l1t);
+                free_xen_pagetable_new(l1mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5785,11 +5798,13 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 
         {
             l2_pgentry_t *l2t;
+            mfn_t l2mfn = l3e_get_mfn(*pl3e);
 
-            l2t = l3e_to_l2e(*pl3e);
+            l2t = map_domain_page(l2mfn);
             for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++ )
                 if ( l2e_get_intpte(l2t[i]) != 0 )
                     break;
+            UNMAP_DOMAIN_PAGE(l2t);
             if ( i == L2_PAGETABLE_ENTRIES )
             {
                 /* Empty: zap the L3E and free the L2 page. */
@@ -5797,7 +5812,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable(l2t);
+                free_xen_pagetable_new(l2mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
-- 
2.23.3


