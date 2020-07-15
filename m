Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9C22095B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:00:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveCx-0005UX-HV; Wed, 15 Jul 2020 10:00:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveCw-0005UJ-28
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:00:10 +0000
X-Inumbo-ID: f7122cb8-c681-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7122cb8-c681-11ea-bb8b-bc764e2007e4;
 Wed, 15 Jul 2020 10:00:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78DE6B02A;
 Wed, 15 Jul 2020 10:00:11 +0000 (UTC)
Subject: [PATCH 5/5] x86/shadow: l3table[] and gl3e[] are HVM only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
Message-ID: <a3b9b496-e860-e657-2afc-c0658871fa3f@suse.com>
Date: Wed, 15 Jul 2020 12:00:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

... by the very fact that they're 3-level specific, while PV always gets
run in 4-level mode. This requires adding some seemingly redundant
#ifdef-s - some of them will be possible to drop again once 2- and
3-level guest code doesn't get built anymore in !HVM configs, but I'm
afraid there's still quite a bit of disentangling work to be done to
make this possible.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -150,10 +150,7 @@ sh_walk_guest_tables(struct vcpu *v, uns
                           ? cr3_pa(v->arch.hvm.guest_cr[3]) >> PAGE_SHIFT
                           : pagetable_get_pfn(v->arch.guest_table));
 
-#if GUEST_PAGING_LEVELS == 3 /* PAE */
-    return guest_walk_tables(v, p2m_get_hostp2m(v->domain), va, gw, pfec,
-                             root_gfn, INVALID_MFN, v->arch.paging.shadow.gl3e);
-#else /* 32 or 64 */
+#if GUEST_PAGING_LEVELS != 3 /* 32 or 64 */
     const struct domain *d = v->domain;
     mfn_t root_mfn = (v->arch.flags & TF_kernel_mode
                       ? pagetable_get_mfn(v->arch.guest_table)
@@ -165,6 +162,13 @@ sh_walk_guest_tables(struct vcpu *v, uns
     unmap_domain_page(root_map);
 
     return ok;
+#elif !defined(CONFIG_HVM)
+    (void)root_gfn;
+    memset(gw, 0, sizeof(*gw));
+    return false;
+#else /* PAE */
+    return guest_walk_tables(v, p2m_get_hostp2m(v->domain), va, gw, pfec,
+                             root_gfn, INVALID_MFN, v->arch.paging.shadow.gl3e);
 #endif
 }
 
@@ -211,7 +215,7 @@ shadow_check_gwalk(struct vcpu *v, unsig
     l3p = map_domain_page(gw->l3mfn);
     mismatch |= (gw->l3e.l3 != l3p[guest_l3_table_offset(va)].l3);
     unmap_domain_page(l3p);
-#else
+#elif defined(CONFIG_HVM)
     mismatch |= (gw->l3e.l3 !=
                  v->arch.paging.shadow.gl3e[guest_l3_table_offset(va)].l3);
 #endif
@@ -1693,6 +1697,8 @@ static shadow_l2e_t * shadow_get_and_cre
     }
     /* Now follow it down a level.  Guaranteed to succeed. */
     return sh_linear_l2_table(v) + shadow_l2_linear_offset(gw->va);
+#elif !defined(CONFIG_HVM)
+    return NULL;
 #elif GUEST_PAGING_LEVELS == 3 /* PAE... */
     /* We never demand-shadow PAE l3es: they are only created in
      * sh_update_cr3().  Check if the relevant sl3e is present. */
@@ -3526,6 +3532,8 @@ static bool sh_invlpg(struct vcpu *v, un
         if ( !(shadow_l3e_get_flags(sl3e) & _PAGE_PRESENT) )
             return false;
     }
+#elif !defined(CONFIG_HVM)
+    return false;
 #else /* SHADOW_PAGING_LEVELS == 3 */
     if ( !(l3e_get_flags(v->arch.paging.shadow.l3table[shadow_l3_linear_offset(linear)])
            & _PAGE_PRESENT) )
@@ -3679,7 +3687,9 @@ sh_update_linear_entries(struct vcpu *v)
          pagetable_get_pfn(v->arch.hvm.monitor_table) == 0 )
         return;
 
-#if SHADOW_PAGING_LEVELS == 4
+#if !defined(CONFIG_HVM)
+    return;
+#elif SHADOW_PAGING_LEVELS == 4
 
     /* For HVM, just need to update the l4e that points to the shadow l4. */
 
@@ -3816,7 +3826,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
 {
     struct domain *d = v->domain;
     mfn_t gmfn;
-#if GUEST_PAGING_LEVELS == 3
+#if GUEST_PAGING_LEVELS == 3 && defined(CONFIG_HVM)
     const guest_l3e_t *gl3e;
     unsigned int i, guest_idx;
 #endif
@@ -3867,7 +3877,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
 #endif
         gmfn = pagetable_get_mfn(v->arch.guest_table);
 
-#if GUEST_PAGING_LEVELS == 3
+#if GUEST_PAGING_LEVELS == 3 && defined(CONFIG_HVM)
     /*
      * On PAE guests we don't use a mapping of the guest's own top-level
      * table.  We cache the current state of that table and shadow that,
@@ -3895,10 +3905,22 @@ sh_update_cr3(struct vcpu *v, int do_loc
     /* We revoke write access to the new guest toplevel page(s) before we
      * replace the old shadow pagetable(s), so that we can safely use the
      * (old) shadow linear maps in the writeable mapping heuristics. */
-#if GUEST_PAGING_LEVELS == 2
-    if ( sh_remove_write_access(d, gmfn, 2, 0) != 0 )
+#if GUEST_PAGING_LEVELS == 4
+    if ( sh_remove_write_access(d, gmfn, 4, 0) != 0 )
         guest_flush_tlb_mask(d, d->dirty_cpumask);
-    sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l2_shadow, sh_make_shadow);
+    sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l4_shadow, sh_make_shadow);
+    if ( !shadow_mode_external(d) && !is_pv_32bit_domain(d) )
+    {
+        mfn_t smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]);
+
+        if ( !(v->arch.flags & TF_kernel_mode) && VM_ASSIST(d, m2p_strict) )
+            zap_ro_mpt(smfn);
+        else if ( (v->arch.flags & TF_kernel_mode) &&
+                  !VM_ASSIST(d, m2p_strict) )
+            fill_ro_mpt(smfn);
+    }
+#elif !defined(CONFIG_HVM)
+    ASSERT_UNREACHABLE();
 #elif GUEST_PAGING_LEVELS == 3
     /* PAE guests have four shadow_table entries, based on the
      * current values of the guest's four l3es. */
@@ -3907,7 +3929,8 @@ sh_update_cr3(struct vcpu *v, int do_loc
         gfn_t gl2gfn;
         mfn_t gl2mfn;
         p2m_type_t p2mt;
-        const guest_l3e_t *gl3e = v->arch.paging.shadow.gl3e;
+
+        gl3e = v->arch.paging.shadow.gl3e;
 
         /* First, make all four entries read-only. */
         for ( i = 0; i < 4; i++ )
@@ -3942,25 +3965,16 @@ sh_update_cr3(struct vcpu *v, int do_loc
                 sh_set_toplevel_shadow(v, i, INVALID_MFN, 0, sh_make_shadow);
         }
     }
-#elif GUEST_PAGING_LEVELS == 4
-    if ( sh_remove_write_access(d, gmfn, 4, 0) != 0 )
+#elif GUEST_PAGING_LEVELS == 2
+    if ( sh_remove_write_access(d, gmfn, 2, 0) != 0 )
         guest_flush_tlb_mask(d, d->dirty_cpumask);
-    sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l4_shadow, sh_make_shadow);
-    if ( !shadow_mode_external(d) && !is_pv_32bit_domain(d) )
-    {
-        mfn_t smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]);
-
-        if ( !(v->arch.flags & TF_kernel_mode) && VM_ASSIST(d, m2p_strict) )
-            zap_ro_mpt(smfn);
-        else if ( (v->arch.flags & TF_kernel_mode) &&
-                  !VM_ASSIST(d, m2p_strict) )
-            fill_ro_mpt(smfn);
-    }
+    sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l2_shadow, sh_make_shadow);
 #else
 #error This should never happen
 #endif
 
 
+#ifdef CONFIG_HVM
     ///
     /// v->arch.paging.shadow.l3table
     ///
@@ -3986,7 +4000,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
             }
         }
 #endif /* SHADOW_PAGING_LEVELS == 3 */
-
+#endif /* CONFIG_HVM */
 
     ///
     /// v->arch.cr3
@@ -4006,6 +4020,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
 #endif
 
 
+#ifdef CONFIG_HVM
     ///
     /// v->arch.hvm.hw_cr[3]
     ///
@@ -4022,6 +4037,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
 #endif
         hvm_update_guest_cr3(v, noflush);
     }
+#endif /* CONFIG_HVM */
 
     /* Fix up the linear pagetable mappings */
     sh_update_linear_entries(v);
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -131,15 +131,16 @@ struct shadow_domain {
 
 struct shadow_vcpu {
 #ifdef CONFIG_SHADOW_PAGING
+#ifdef CONFIG_HVM
     /* PAE guests: per-vcpu shadow top-level table */
     l3_pgentry_t l3table[4] __attribute__((__aligned__(32)));
     /* PAE guests: per-vcpu cache of the top-level *guest* entries */
     l3_pgentry_t gl3e[4] __attribute__((__aligned__(32)));
 
     /* shadow(s) of guest (MFN) */
-#ifdef CONFIG_HVM
     pagetable_t shadow_table[4];
 #else
+    /* shadow of guest (MFN) */
     pagetable_t shadow_table[1];
 #endif
 


