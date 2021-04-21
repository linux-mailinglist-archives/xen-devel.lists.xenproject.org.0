Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E347F366E58
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114738.218707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDxn-0004xa-2Z; Wed, 21 Apr 2021 14:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114738.218707; Wed, 21 Apr 2021 14:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDxm-0004wx-Ul; Wed, 21 Apr 2021 14:36:22 +0000
Received: by outflank-mailman (input) for mailman id 114738;
 Wed, 21 Apr 2021 14:36:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lZDxl-0004wE-0j
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:36:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZDxk-0001QV-RP; Wed, 21 Apr 2021 14:36:20 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZDeF-00045m-V0; Wed, 21 Apr 2021 14:16:12 +0000
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
	Date:Subject:Cc:To:From; bh=SJCh26GgdFA/kv16v156akfhVn9AnfwpsP4zDNephzc=; b=I
	zLSbH1V3vOrQ1wMcL8aShhbD0qs4nMAr6Wg954ZBAW7WRoGB6j+WZxjU2XfFG4DXIJhAeyzxtxCGy
	IfvZ2lFRiqN7mvJxBXwJvz2jt1iDfsVSytDlzxLHc3ljN7ZG6n0eRjsf9vkdm6wZpiqMmlZy4b2Ws
	JnSOq9ajVYLvDbrg=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 13/13] x86/mm: drop _new suffix for page table APIs
Date: Wed, 21 Apr 2021 15:15:41 +0100
Message-Id: <be0a6471a2932e7157fd088d70a2140e551af4aa.1619014052.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619014052.git.hongyxia@amazon.com>
References: <cover.1619014052.git.hongyxia@amazon.com>
In-Reply-To: <cover.1619014052.git.hongyxia@amazon.com>
References: <cover.1619014052.git.hongyxia@amazon.com>

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
index 604f83c3837e..709686701388 100644
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
@@ -4897,7 +4897,7 @@ int mmcfg_intercept_write(
  * them. The caller must check whether the allocation has succeeded, and only
  * pass valid MFNs to map_domain_page().
  */
-mfn_t alloc_xen_pagetable_new(void)
+mfn_t alloc_xen_pagetable(void)
 {
     if ( system_state != SYS_STATE_early_boot )
     {
@@ -4911,7 +4911,7 @@ mfn_t alloc_xen_pagetable_new(void)
 }
 
 /* mfn can be INVALID_MFN */
-void free_xen_pagetable_new(mfn_t mfn)
+void free_xen_pagetable(mfn_t mfn)
 {
     if ( system_state != SYS_STATE_early_boot && !mfn_eq(mfn, INVALID_MFN) )
         free_domheap_page(mfn_to_page(mfn));
@@ -4919,7 +4919,7 @@ void free_xen_pagetable_new(mfn_t mfn)
 
 void *alloc_mapped_pagetable(mfn_t *pmfn)
 {
-    mfn_t mfn = alloc_xen_pagetable_new();
+    mfn_t mfn = alloc_xen_pagetable();
     void *ret;
 
     if ( mfn_eq(mfn, INVALID_MFN) )
@@ -4965,7 +4965,7 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l3mfn);
+        free_xen_pagetable(l3mfn);
     }
 
     return map_l3t_from_l4e(*pl4e) + l3_table_offset(v);
@@ -5000,7 +5000,7 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l2mfn);
+        free_xen_pagetable(l2mfn);
     }
 
     BUG_ON(l3e_get_flags(*pl3e) & _PAGE_PSE);
@@ -5039,7 +5039,7 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l1mfn);
+        free_xen_pagetable(l1mfn);
     }
 
     BUG_ON(l2e_get_flags(*pl2e) & _PAGE_PSE);
@@ -5226,10 +5226,10 @@ int map_pages_to_xen(
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
 
@@ -5268,7 +5268,7 @@ int map_pages_to_xen(
                 continue;
             }
 
-            l2mfn = alloc_xen_pagetable_new();
+            l2mfn = alloc_xen_pagetable();
             if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
@@ -5296,7 +5296,7 @@ int map_pages_to_xen(
                 spin_unlock(&map_pgdir_lock);
             flush_area(virt, flush_flags);
 
-            free_xen_pagetable_new(l2mfn);
+            free_xen_pagetable(l2mfn);
         }
 
         pl2e = virt_to_xen_l2e(virt);
@@ -5330,7 +5330,7 @@ int map_pages_to_xen(
                         flush_flags(l1e_get_flags(l1t[i]));
                     flush_area(virt, flush_flags);
                     unmap_domain_page(l1t);
-                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
+                    free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
             }
 
@@ -5374,7 +5374,7 @@ int map_pages_to_xen(
                     goto check_l3;
                 }
 
-                l1mfn = alloc_xen_pagetable_new();
+                l1mfn = alloc_xen_pagetable();
                 if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
 
@@ -5401,7 +5401,7 @@ int map_pages_to_xen(
                     spin_unlock(&map_pgdir_lock);
                 flush_area(virt, flush_flags);
 
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
 
             if ( !pl1e )
@@ -5468,7 +5468,7 @@ int map_pages_to_xen(
                     flush_area(virt - PAGE_SIZE,
                                FLUSH_TLB_GLOBAL |
                                FLUSH_ORDER(PAGETABLE_ORDER));
-                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
+                    free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
                 else if ( locking )
                     spin_unlock(&map_pgdir_lock);
@@ -5519,7 +5519,7 @@ int map_pages_to_xen(
                 flush_area(virt - PAGE_SIZE,
                            FLUSH_TLB_GLOBAL |
                            FLUSH_ORDER(2*PAGETABLE_ORDER));
-                free_xen_pagetable_new(l3e_get_mfn(ol3e));
+                free_xen_pagetable(l3e_get_mfn(ol3e));
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5619,7 +5619,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             }
 
             /* PAGE1GB: shatter the superpage and fall through. */
-            l2mfn = alloc_xen_pagetable_new();
+            l2mfn = alloc_xen_pagetable();
             if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
@@ -5643,7 +5643,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             if ( locking )
                 spin_unlock(&map_pgdir_lock);
 
-            free_xen_pagetable_new(l2mfn);
+            free_xen_pagetable(l2mfn);
         }
 
         /*
@@ -5679,7 +5679,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             {
                 l1_pgentry_t *l1t;
                 /* PSE: shatter the superpage and try again. */
-                mfn_t l1mfn = alloc_xen_pagetable_new();
+                mfn_t l1mfn = alloc_xen_pagetable();
 
                 if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
@@ -5703,7 +5703,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
 
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
         }
         else
@@ -5770,7 +5770,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5815,7 +5815,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable_new(l2mfn);
+                free_xen_pagetable(l2mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index ad878d8aebca..0dce1ae87210 100644
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
index c625075695e0..c41ce847b36e 100644
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
index 0a72fa7a26c3..56d7a71a24a4 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -573,8 +573,8 @@ int vcpu_destroy_pagetables(struct vcpu *);
 void *do_page_walk(struct vcpu *v, unsigned long addr);
 
 /* Allocator functions for Xen pagetables. */
-mfn_t alloc_xen_pagetable_new(void);
-void free_xen_pagetable_new(mfn_t mfn);
+mfn_t alloc_xen_pagetable(void);
+void free_xen_pagetable(mfn_t mfn);
 void *alloc_mapped_pagetable(mfn_t *pmfn);
 
 l1_pgentry_t *virt_to_xen_l1e(unsigned long v);
-- 
2.23.4


