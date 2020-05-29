Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 353871E7BCB
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:29:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedCk-0007fp-8t; Fri, 29 May 2020 11:29:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5BQD=7L=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jedCj-0007fZ-He
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:29:37 +0000
X-Inumbo-ID: aa7f56ca-a19f-11ea-8993-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa7f56ca-a19f-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YEyP3e+saUdHL++my7j7Pco1QGzdKCrNuWAbFZKB+YE=; b=Hg5LjaMQaMU/5alHCjUNBW7F+B
 hF58DQTvFPakeGUaZ7p4xWQLjenzZepZ/PuKHRBfHRwgu1wBOpcH5a2L3CvoNemSTLjGT0Cauq27i
 9kXu+IyZTmStxI/LWBrvBJD22cRE4IvRf9aLGoYsIQ0UX1liBHttDaGcbli7LCi2gx7o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jedCd-0002TA-MX; Fri, 29 May 2020 11:29:31 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1jecwC-0006tM-5z; Fri, 29 May 2020 11:12:32 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 15/15] x86/mm: drop _new suffix for page table APIs
Date: Fri, 29 May 2020 12:11:59 +0100
Message-Id: <5f4c9dddc7f34228d348d3d445e754fe0b59d269.1590750232.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590750232.git.hongyxia@amazon.com>
References: <cover.1590750232.git.hongyxia@amazon.com>
In-Reply-To: <cover.1590750232.git.hongyxia@amazon.com>
References: <cover.1590750232.git.hongyxia@amazon.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

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
index 16f1aa3344..bf35a1a998 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -356,7 +356,7 @@ void __init arch_init_memory(void)
             ASSERT(root_pgt_pv_xen_slots < ROOT_PAGETABLE_PV_XEN_SLOTS);
             if ( l4_table_offset(split_va) == l4_table_offset(split_va - 1) )
             {
-                mfn_t l3mfn = alloc_xen_pagetable_new();
+                mfn_t l3mfn = alloc_xen_pagetable();
 
                 if ( !mfn_eq(l3mfn, INVALID_MFN) )
                 {
@@ -4914,7 +4914,7 @@ int mmcfg_intercept_write(
  * them. The caller must check whether the allocation has succeeded, and only
  * pass valid MFNs to map_domain_page().
  */
-mfn_t alloc_xen_pagetable_new(void)
+mfn_t alloc_xen_pagetable(void)
 {
     if ( system_state != SYS_STATE_early_boot )
     {
@@ -4929,7 +4929,7 @@ mfn_t alloc_xen_pagetable_new(void)
 }
 
 /* mfn can be INVALID_MFN */
-void free_xen_pagetable_new(mfn_t mfn)
+void free_xen_pagetable(mfn_t mfn)
 {
     if ( system_state != SYS_STATE_early_boot && !mfn_eq(mfn, INVALID_MFN) )
         free_domheap_page(mfn_to_page(mfn));
@@ -4937,7 +4937,7 @@ void free_xen_pagetable_new(mfn_t mfn)
 
 void *alloc_map_clear_xen_pt(mfn_t *pmfn)
 {
-    mfn_t mfn = alloc_xen_pagetable_new();
+    mfn_t mfn = alloc_xen_pagetable();
     void *ret;
 
     if ( mfn_eq(mfn, INVALID_MFN) )
@@ -4983,7 +4983,7 @@ static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l3mfn);
+        free_xen_pagetable(l3mfn);
     }
 
     return map_l3t_from_l4e(*pl4e) + l3_table_offset(v);
@@ -5018,7 +5018,7 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l2mfn);
+        free_xen_pagetable(l2mfn);
     }
 
     BUG_ON(l3e_get_flags(*pl3e) & _PAGE_PSE);
@@ -5057,7 +5057,7 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
         }
         if ( locking )
             spin_unlock(&map_pgdir_lock);
-        free_xen_pagetable_new(l1mfn);
+        free_xen_pagetable(l1mfn);
     }
 
     BUG_ON(l2e_get_flags(*pl2e) & _PAGE_PSE);
@@ -5166,10 +5166,10 @@ int map_pages_to_xen(
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
 
@@ -5208,7 +5208,7 @@ int map_pages_to_xen(
                 continue;
             }
 
-            l2mfn = alloc_xen_pagetable_new();
+            l2mfn = alloc_xen_pagetable();
             if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
@@ -5236,7 +5236,7 @@ int map_pages_to_xen(
                 spin_unlock(&map_pgdir_lock);
             flush_area(virt, flush_flags);
 
-            free_xen_pagetable_new(l2mfn);
+            free_xen_pagetable(l2mfn);
         }
 
         pl2e = virt_to_xen_l2e(virt);
@@ -5270,7 +5270,7 @@ int map_pages_to_xen(
                         flush_flags(l1e_get_flags(l1t[i]));
                     flush_area(virt, flush_flags);
                     unmap_domain_page(l1t);
-                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
+                    free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
             }
 
@@ -5315,7 +5315,7 @@ int map_pages_to_xen(
                     goto check_l3;
                 }
 
-                l1mfn = alloc_xen_pagetable_new();
+                l1mfn = alloc_xen_pagetable();
                 if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
 
@@ -5342,7 +5342,7 @@ int map_pages_to_xen(
                     spin_unlock(&map_pgdir_lock);
                 flush_area(virt, flush_flags);
 
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
 
             pl1e  = map_l1t_from_l2e(*pl2e) + l1_table_offset(virt);
@@ -5408,7 +5408,7 @@ int map_pages_to_xen(
                     flush_area(virt - PAGE_SIZE,
                                FLUSH_TLB_GLOBAL |
                                FLUSH_ORDER(PAGETABLE_ORDER));
-                    free_xen_pagetable_new(l2e_get_mfn(ol2e));
+                    free_xen_pagetable(l2e_get_mfn(ol2e));
                 }
                 else if ( locking )
                     spin_unlock(&map_pgdir_lock);
@@ -5459,7 +5459,7 @@ int map_pages_to_xen(
                 flush_area(virt - PAGE_SIZE,
                            FLUSH_TLB_GLOBAL |
                            FLUSH_ORDER(2*PAGETABLE_ORDER));
-                free_xen_pagetable_new(l3e_get_mfn(ol3e));
+                free_xen_pagetable(l3e_get_mfn(ol3e));
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5548,7 +5548,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             }
 
             /* PAGE1GB: shatter the superpage and fall through. */
-            l2mfn = alloc_xen_pagetable_new();
+            l2mfn = alloc_xen_pagetable();
             if ( mfn_eq(l2mfn, INVALID_MFN) )
                 goto out;
 
@@ -5572,7 +5572,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             if ( locking )
                 spin_unlock(&map_pgdir_lock);
 
-            free_xen_pagetable_new(l2mfn);
+            free_xen_pagetable(l2mfn);
         }
 
         /*
@@ -5608,7 +5608,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
             {
                 l1_pgentry_t *l1t;
                 /* PSE: shatter the superpage and try again. */
-                mfn_t l1mfn = alloc_xen_pagetable_new();
+                mfn_t l1mfn = alloc_xen_pagetable();
 
                 if ( mfn_eq(l1mfn, INVALID_MFN) )
                     goto out;
@@ -5632,7 +5632,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
 
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
         }
         else
@@ -5699,7 +5699,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable_new(l1mfn);
+                free_xen_pagetable(l1mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
@@ -5744,7 +5744,7 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
                 if ( locking )
                     spin_unlock(&map_pgdir_lock);
                 flush_area(NULL, FLUSH_TLB_GLOBAL); /* flush before free */
-                free_xen_pagetable_new(l2mfn);
+                free_xen_pagetable(l2mfn);
             }
             else if ( locking )
                 spin_unlock(&map_pgdir_lock);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 9cdf198fd6..a20540e36a 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -901,15 +901,15 @@ static void cleanup_cpu_root_pgt(unsigned int cpu)
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
index cfc3de9091..91d7b24da8 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -621,7 +621,7 @@ void __init paging_init(void)
     UNMAP_DOMAIN_PAGE(l3_ro_mpt);
 
     /* Create user-accessible L2 directory to map the MPT for compat guests. */
-    l2_ro_mpt_mfn = alloc_xen_pagetable_new();
+    l2_ro_mpt_mfn = alloc_xen_pagetable();
     if ( mfn_eq(l2_ro_mpt_mfn, INVALID_MFN) )
         goto nomem;
     compat_idle_pg_table_l2 = map_domain_page_global(l2_ro_mpt_mfn);
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index 2ac0cdab83..482fbd9d39 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -583,8 +583,8 @@ int vcpu_destroy_pagetables(struct vcpu *);
 void *do_page_walk(struct vcpu *v, unsigned long addr);
 
 /* Allocator functions for Xen pagetables. */
-mfn_t alloc_xen_pagetable_new(void);
-void free_xen_pagetable_new(mfn_t mfn);
+mfn_t alloc_xen_pagetable(void);
+void free_xen_pagetable(mfn_t mfn);
 void *alloc_map_clear_xen_pt(mfn_t *pmfn);
 
 l1_pgentry_t *virt_to_xen_l1e(unsigned long v);
-- 
2.24.1.AMZN


