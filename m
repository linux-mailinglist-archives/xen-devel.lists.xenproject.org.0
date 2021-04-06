Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF403551A7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 13:14:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105860.202488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjfM-0006AC-En; Tue, 06 Apr 2021 11:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105860.202488; Tue, 06 Apr 2021 11:14:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTjfM-00069N-5E; Tue, 06 Apr 2021 11:14:40 +0000
Received: by outflank-mailman (input) for mailman id 105860;
 Tue, 06 Apr 2021 11:14:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lTjfK-00068A-UM
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 11:14:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjfK-0005DB-Mq; Tue, 06 Apr 2021 11:14:38 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lTjXc-0002qD-Rp; Tue, 06 Apr 2021 11:06:41 +0000
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
	Date:Subject:Cc:To:From; bh=sBNlkWTy5F/z7jpVrLYtyYD1UdrsEQWq0TNXWq9eqMA=; b=5
	u/aLFNiJgIVn0nb6QF6Zxs0xpUSfMdldRkBykCkHMoA9uPAw8sdhvmEDgyyDqc00Je3NYAhM7MQBN
	lk3NKmfd/EdHDMHBnC0w2fb30/NmPcf6G1c454faNSyjScS21AReZI0pljFqj4ghAOSj8acKa9Qr5
	o7i4wvBcJFOcjPkA=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v9 13/13] x86/mm: drop _new suffix for page table APIs
Date: Tue,  6 Apr 2021 12:06:01 +0100
Message-Id: <c6b380a84218b473adee349b2730bc8cbc18cdaf.1617706782.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>
In-Reply-To: <cover.1617706782.git.hongyxia@amazon.com>
References: <cover.1617706782.git.hongyxia@amazon.com>

From: Wei Liu <wei.liu2@citrix.com>

No functional change.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/mm.c        | 44 ++++++++++++++++++++--------------------
 xen/arch/x86/smpboot.c   |  6 +++---
 xen/arch/x86/x86_64/mm.c |  2 +-
 xen/include/asm-x86/mm.h |  4 ++--
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 03362448bd05..b90c2d5f8911 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -369,7 +369,7 @@ void __init arch_init_memory(void)
             ASSERT(root_pgt_pv_xen_slots < ROOT_PAGETABLE_PV_XEN_SLOTS);
             if ( l4_table_offset(split_va) == l4_table_offset(split_va - 1) )
             {
-                mfn_t l3mfn = alloc_xen_pagetable_new();
+                mfn_t l3mfn = alloc_xen_pagetable();
 
                 if ( !mfn_eq(l3mfn, INVALID_MFN) )
                 {
@@ -4881,7 +4881,7 @@ int mmcfg_intercept_write(
  * them. The caller must check whether the allocation has succeeded, and only
  * pass valid MFNs to map_domain_page().
  */
-mfn_t alloc_xen_pagetable_new(void)
+mfn_t alloc_xen_pagetable(void)
 {
     if ( system_state != SYS_STATE_early_boot )
     {
@@ -4895,7 +4895,7 @@ mfn_t alloc_xen_pagetable_new(void)
 }
 
 /* mfn can be INVALID_MFN */
-void free_xen_pagetable_new(mfn_t mfn)
+void free_xen_pagetable(mfn_t mfn)
 {
     if ( system_state != SYS_STATE_early_boot && !mfn_eq(mfn, INVALID_MFN) )
         free_domheap_page(mfn_to_page(mfn));
@@ -4903,7 +4903,7 @@ void free_xen_pagetable_new(mfn_t mfn)
 
 void *alloc_map_clear_xen_pt(mfn_t *pmfn)
 {
-    mfn_t mfn = alloc_xen_pagetable_new();
+    mfn_t mfn = alloc_xen_pagetable();
     void *ret;
 
     if ( mfn_eq(mfn, INVALID_MFN) )
@@ -4949,7 +4949,7 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l3mfn);
+        free_xen_pagetable(l3mfn);
     }
 
     return map_l3t_from_l4e(*pl4e) + l3_table_offset(v);
@@ -4984,7 +4984,7 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l2mfn);
+        free_xen_pagetable(l2mfn);
     }
 
     BUG_ON(l3e_get_flags(*pl3e) & _PAGE_PSE);
@@ -5023,7 +5023,7 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l1mfn);
+        free_xen_pagetable(l1mfn);
     }
 
     BUG_ON(l2e_get_flags(*pl2e) & _PAGE_PSE);
@@ -5210,10 +5210,10 @@ int map_pages_to_xen(
                         ol2e = l2t[i];
                         if ( (l2e_get_flags(ol2e) & _PAGE_PRESENT) &&
                              !(l2e_get_flags(ol2e) & _PAGE_PSE) )
-                            free_xen_pagetable_new(l2e_get_mfn(ol2e));
+                            free_xen_pagetable(l2e_get_mfn(ol2e));
                     }
                     unmap_domain_page(l2t);
-                    free_xen_pagetable_new(l3e_get_mfn(ol3e));
+                    free_xen_pagetable(l3e_get_mfn(ol3e));
                 }
             }
 
@@ -5252,7 +5252,7 @@ int map_pages_to_xen(
                 continue;
             }
 
-            l2mfn = alloc_xen_pagetable_new();
+            l2mfn = alloc_xen_pagetable();
             if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
@@ -5280,7 +5280,7 @@ int map_pages_to_xen(
                 spin_unlock(&map_pgdir_lock);
             flush_area(virt, flush_flags);
 
-            free_xen_pagetable_new(l2mfn);
+            free_xen_pagetable(l2mfn);
         }
 
         pl2e = virt_to_xen_l2e(virt);
@@ -5314,7 +5314,7 @@ int map_pages_to_xen(
                         flush_flags(l1e_get_flags(l1t[i]));
                     flush_area(virt, flush_flags);
                     unmap_domain_page(l1t);
-                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
+                    free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
             }
 
@@ -5359,7 +5359,7 @@ int map_pages_to_xen(
                     goto check_l3;
                 }
 
-                l1mfn = alloc_xen_pagetable_new();
+                l1mfn = alloc_xen_pagetable();
                 if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
 
@@ -5386,7 +5386,7 @@ int map_pages_to_xen(
                     spin_unlock(&map_pgdir_lock);
                 flush_area(virt, flush_flags);
 
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
 
             pl1e  = map_l1t_from_l2e(*pl2e) + l1_table_offset(virt);
@@ -5452,7 +5452,7 @@ int map_pages_to_xen(
                     flush_area(virt - PAGE_SIZE,
                                FLUSH_TLB_GLOBAL |
                                FLUSH_ORDER(PAGETABLE_ORDER));
-                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
+                    free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
                 else if ( locking )
                     spin_unlock(&map_pgdir_lock);
@@ -5503,7 +5503,7 @@ int map_pages_to_xen(
                 flush_area(virt - PAGE_SIZE,
                            FLUSH_TLB_GLOBAL |
                            FLUSH_ORDER(2*PAGETABLE_ORDER));
-                free_xen_pagetable_new(l3e_get_mfn(ol3e));
+                free_xen_pagetable(l3e_get_mfn(ol3e));
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5602,7 +5602,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             }
 
             /* PAGE1GB: shatter the superpage and fall through. */
-            l2mfn = alloc_xen_pagetable_new();
+            l2mfn = alloc_xen_pagetable();
             if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
@@ -5626,7 +5626,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             if ( locking )
                 spin_unlock(&map_pgdir_lock);
 
-            free_xen_pagetable_new(l2mfn);
+            free_xen_pagetable(l2mfn);
         }
 
         /*
@@ -5662,7 +5662,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             {
                 l1_pgentry_t *l1t;
                 /* PSE: shatter the superpage and try again. */
-                mfn_t l1mfn = alloc_xen_pagetable_new();
+                mfn_t l1mfn = alloc_xen_pagetable();
 
                 if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
@@ -5686,7 +5686,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
 
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
         }
         else
@@ -5753,7 +5753,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5798,7 +5798,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable_new(l2mfn);
+                free_xen_pagetable(l2mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index b91d1f37e223..8659220416aa 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -922,15 +922,15 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
                     continue;
 
                 ASSERT(!(l2e_get_flags(l2t[i2]) & _PAGE_PSE));
-                free_xen_pagetable_new(l2e_get_mfn(l2t[i2]));
+                free_xen_pagetable(l2e_get_mfn(l2t[i2]));
             }
 
             unmap_domain_page(l2t);
-            free_xen_pagetable_new(l2mfn);
+            free_xen_pagetable(l2mfn);
         }
 
         unmap_domain_page(l3t);
-        free_xen_pagetable_new(l3mfn);
+        free_xen_pagetable(l3mfn);
     }
 
     free_xenheap_page(rpt);
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 442f345b2a54..579ffa54c982 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -640,7 +640,7 @@ void __init paging_init(void)
     /* Create user-accessible L2 directory to map the MPT for compat guests. */
     if ( opt_pv32 )
     {
-        mfn = alloc_xen_pagetable_new();
+        mfn = alloc_xen_pagetable();
         if ( mfn_eq(mfn, INVALID_MFN) )
             goto nomem;
         compat_idle_pg_table_l2 = map_domain_page_global(mfn);
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index b05ede721377..b2580c9ad073 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -573,8 +573,8 @@ int vcpu_destroy_pagetables(struct vcpu *);
 void *do_page_walk(struct vcpu *v, unsigned long addr);
 
 /* Allocator functions for Xen pagetables. */
-mfn_t alloc_xen_pagetable_new(void);
-void free_xen_pagetable_new(mfn_t mfn);
+mfn_t alloc_xen_pagetable(void);
+void free_xen_pagetable(mfn_t mfn);
 void *alloc_map_clear_xen_pt(mfn_t *pmfn);
 
 l1_pgentry_t *virt_to_xen_l1e(unsigned long v);
-- 
2.23.3


