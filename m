Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E1D1ADFC9
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 16:27:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPRxs-0007sE-Sw; Fri, 17 Apr 2020 14:27:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPRxr-0007s0-8s
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 14:27:31 +0000
X-Inumbo-ID: 91a4a7ee-80b7-11ea-8d02-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91a4a7ee-80b7-11ea-8d02-12813bfff9fa;
 Fri, 17 Apr 2020 14:27:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B00A3AB5F;
 Fri, 17 Apr 2020 14:27:28 +0000 (UTC)
Subject: [PATCH 05/10] x86/mm: monitor table is HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Message-ID: <e175a985-bdb9-d8e6-2f84-76abdcc24188@suse.com>
Date: Fri, 17 Apr 2020 16:27:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <65bfcd6a-2bb0-da6f-9e85-39f224bd81fb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Move the per-vCPU field to the HVM sub-structure.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -545,7 +545,7 @@ void write_ptbase(struct vcpu *v)
  * Should be called after CR3 is updated.
  *
  * Uses values found in vcpu->arch.(guest_table and guest_table_user), and
- * for HVM guests, arch.monitor_table and hvm's guest CR3.
+ * for HVM guests, arch.hvm.monitor_table and hvm's guest CR3.
  *
  * Update ref counts to shadow tables appropriately.
  */
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -393,7 +393,7 @@ static mfn_t hap_make_monitor_table(stru
     l4_pgentry_t *l4e;
     mfn_t m4mfn;
 
-    ASSERT(pagetable_get_pfn(v->arch.monitor_table) == 0);
+    ASSERT(pagetable_get_pfn(v->arch.hvm.monitor_table) == 0);
 
     if ( (pg = hap_alloc(d)) == NULL )
         goto oom;
@@ -579,10 +579,10 @@ void hap_teardown(struct domain *d, bool
         {
             if ( paging_get_hostmode(v) && paging_mode_external(d) )
             {
-                mfn = pagetable_get_mfn(v->arch.monitor_table);
+                mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
                 if ( mfn_valid(mfn) && (mfn_x(mfn) != 0) )
                     hap_destroy_monitor_table(v, mfn);
-                v->arch.monitor_table = pagetable_null();
+                v->arch.hvm.monitor_table = pagetable_null();
             }
         }
     }
@@ -758,10 +758,10 @@ static void hap_update_paging_modes(stru
 
     v->arch.paging.mode = hap_paging_get_mode(v);
 
-    if ( pagetable_is_null(v->arch.monitor_table) )
+    if ( pagetable_is_null(v->arch.hvm.monitor_table) )
     {
         mfn_t mmfn = hap_make_monitor_table(v);
-        v->arch.monitor_table = pagetable_from_mfn(mmfn);
+        v->arch.hvm.monitor_table = pagetable_from_mfn(mmfn);
         make_cr3(v, mmfn);
         hvm_update_host_cr3(v);
     }
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2465,10 +2465,10 @@ static void sh_update_paging_modes(struc
                 &SHADOW_INTERNAL_NAME(sh_paging_mode, 2);
         }
 
-        if ( pagetable_is_null(v->arch.monitor_table) )
+        if ( pagetable_is_null(v->arch.hvm.monitor_table) )
         {
             mfn_t mmfn = v->arch.paging.mode->shadow.make_monitor_table(v);
-            v->arch.monitor_table = pagetable_from_mfn(mmfn);
+            v->arch.hvm.monitor_table = pagetable_from_mfn(mmfn);
             make_cr3(v, mmfn);
             hvm_update_host_cr3(v);
         }
@@ -2502,10 +2502,10 @@ static void sh_update_paging_modes(struc
                     return;
                 }
 
-                old_mfn = pagetable_get_mfn(v->arch.monitor_table);
-                v->arch.monitor_table = pagetable_null();
+                old_mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
+                v->arch.hvm.monitor_table = pagetable_null();
                 new_mfn = v->arch.paging.mode->shadow.make_monitor_table(v);
-                v->arch.monitor_table = pagetable_from_mfn(new_mfn);
+                v->arch.hvm.monitor_table = pagetable_from_mfn(new_mfn);
                 SHADOW_PRINTK("new monitor table %"PRI_mfn "\n",
                                mfn_x(new_mfn));
 
@@ -2724,11 +2724,11 @@ void shadow_teardown(struct domain *d, b
 #ifdef CONFIG_HVM
                 if ( shadow_mode_external(d) )
                 {
-                    mfn_t mfn = pagetable_get_mfn(v->arch.monitor_table);
+                    mfn_t mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
 
                     if ( mfn_valid(mfn) && (mfn_x(mfn) != 0) )
                         v->arch.paging.mode->shadow.destroy_monitor_table(v, mfn);
-                    v->arch.monitor_table = pagetable_null();
+                    v->arch.hvm.monitor_table = pagetable_null();
                 }
 #endif /* CONFIG_HVM */
             }
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1521,7 +1521,7 @@ sh_make_monitor_table(struct vcpu *v)
 {
     struct domain *d = v->domain;
 
-    ASSERT(pagetable_get_pfn(v->arch.monitor_table) == 0);
+    ASSERT(pagetable_get_pfn(v->arch.hvm.monitor_table) == 0);
 
     /* Guarantee we can get the memory we need */
     shadow_prealloc(d, SH_type_monitor_table, CONFIG_PAGING_LEVELS);
@@ -3708,7 +3708,7 @@ sh_update_linear_entries(struct vcpu *v)
 
     /* Don't try to update the monitor table if it doesn't exist */
     if ( !shadow_mode_external(d) ||
-         pagetable_get_pfn(v->arch.monitor_table) == 0 )
+         pagetable_get_pfn(v->arch.hvm.monitor_table) == 0 )
         return;
 
 #if SHADOW_PAGING_LEVELS == 4
@@ -3726,7 +3726,7 @@ sh_update_linear_entries(struct vcpu *v)
     {
         l4_pgentry_t *ml4e;
 
-        ml4e = map_domain_page(pagetable_get_mfn(v->arch.monitor_table));
+        ml4e = map_domain_page(pagetable_get_mfn(v->arch.hvm.monitor_table));
         ml4e[l4_table_offset(SH_LINEAR_PT_VIRT_START)] =
             l4e_from_pfn(pagetable_get_pfn(v->arch.shadow_table[0]),
                          __PAGE_HYPERVISOR_RW);
@@ -3761,7 +3761,7 @@ sh_update_linear_entries(struct vcpu *v)
             l4_pgentry_t *ml4e;
             l3_pgentry_t *ml3e;
             int linear_slot = shadow_l4_table_offset(SH_LINEAR_PT_VIRT_START);
-            ml4e = map_domain_page(pagetable_get_mfn(v->arch.monitor_table));
+            ml4e = map_domain_page(pagetable_get_mfn(v->arch.hvm.monitor_table));
 
             ASSERT(l4e_get_flags(ml4e[linear_slot]) & _PAGE_PRESENT);
             l3mfn = l4e_get_mfn(ml4e[linear_slot]);
@@ -4096,7 +4096,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
     ///
     if ( shadow_mode_external(d) )
     {
-        make_cr3(v, pagetable_get_mfn(v->arch.monitor_table));
+        make_cr3(v, pagetable_get_mfn(v->arch.hvm.monitor_table));
     }
 #if SHADOW_PAGING_LEVELS == 4
     else // not shadow_mode_external...
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -581,7 +581,6 @@ struct arch_vcpu
     /* guest_table holds a ref to the page, and also a type-count unless
      * shadow refcounts are in use */
     pagetable_t shadow_table[4];        /* (MFN) shadow(s) of guest */
-    pagetable_t monitor_table;          /* (MFN) hypervisor PT (for HVM) */
     unsigned long cr3;                  /* (MA) value to install in HW CR3 */
 
     /*
--- a/xen/include/asm-x86/hvm/vcpu.h
+++ b/xen/include/asm-x86/hvm/vcpu.h
@@ -176,6 +176,9 @@ struct hvm_vcpu {
         uint16_t p2midx;
     } fast_single_step;
 
+    /* (MFN) hypervisor page table */
+    pagetable_t         monitor_table;
+
     struct hvm_vcpu_asid n1asid;
 
     u64                 msr_tsc_adjust;


