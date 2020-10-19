Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFCD2923DE
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 10:45:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8667.23219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUQmu-0005sC-D2; Mon, 19 Oct 2020 08:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8667.23219; Mon, 19 Oct 2020 08:45:04 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUQmu-0005rm-98; Mon, 19 Oct 2020 08:45:04 +0000
Received: by outflank-mailman (input) for mailman id 8667;
 Mon, 19 Oct 2020 08:45:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUQmt-0005re-Bq
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 08:45:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13766e3a-8a20-45ae-8533-faba3f602fd7;
 Mon, 19 Oct 2020 08:45:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EAD76AC19;
 Mon, 19 Oct 2020 08:45:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUQmt-0005re-Bq
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 08:45:03 +0000
X-Inumbo-ID: 13766e3a-8a20-45ae-8533-faba3f602fd7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 13766e3a-8a20-45ae-8533-faba3f602fd7;
	Mon, 19 Oct 2020 08:45:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603097101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0wq4/U2npj/ohoEwA/sWA4Jd1CxybC1RMbF7I0BG8rk=;
	b=D+IIQ7/BACLyKcfr6fujM8A5D1rK1yNb0h6lYf2Py990qHKg67uB8COCnrA0fCysGoUgrK
	tZOCMDDuZ5uZPSnMOGYf3HP/MKgvU42Mb7e0l4UEpTZjR192tfrHT2Nqp3kEoFLFRls4Tu
	Kd1O7eqRJrqd3TzAePlq8VH1j2EV+Bc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EAD76AC19;
	Mon, 19 Oct 2020 08:45:00 +0000 (UTC)
Subject: [PATCH v3 3/3] x86/shadow: sh_{make,destroy}_monitor_table() are
 "even more" HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
Message-ID: <cd39abe3-5a5c-6ebc-a11e-3d4ed1d74907@suse.com>
Date: Mon, 19 Oct 2020 10:45:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <d09b0690-c5e0-a90b-b4c0-4396a5f62c59@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

With them depending on just the number of shadow levels, there's no need
for more than one instance of them, and hence no need for any hook (IOW
452219e24648 ["x86/shadow: monitor table is HVM-only"] didn't go quite
far enough). Move the functions to hvm.c while dropping the dead
is_pv_32bit_domain() code paths.

While moving the code, replace a stale comment reference to
sh_install_xen_entries_in_l4(). Doing so made me notice the function
also didn't have its prototype dropped in 8d7b633adab7 ("x86/mm:
Consolidate all Xen L4 slot writing into init_xen_l4_slots()"), which
gets done here as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.
---
TBD: In principle both functions could have their first parameter
     constified. In fact, "destroy" doesn't depend on the vCPU at all
     and hence could be passed a struct domain *. Not sure whether such
     an asymmetry would be acceptable.
     In principle "make" would also not need passing of the number of
     shadow levels (can be derived from v), which would result in yet
     another asymmetry.
     If these asymmetries were acceptable, "make" could then also update
     v->arch.hvm.monitor_table, instead of doing so at both call sites.
TBD: Collides with Andrew's "xen/x86: Fix memory leak in vcpu_create()
     error path".

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2467,7 +2467,9 @@ static void sh_update_paging_modes(struc
 
         if ( pagetable_is_null(v->arch.hvm.monitor_table) )
         {
-            mfn_t mmfn = v->arch.paging.mode->shadow.make_monitor_table(v);
+            mfn_t mmfn = sh_make_monitor_table(
+                             v, v->arch.paging.mode->shadow.shadow_levels);
+
             v->arch.hvm.monitor_table = pagetable_from_mfn(mmfn);
             make_cr3(v, mmfn);
             hvm_update_host_cr3(v);
@@ -2504,7 +2506,8 @@ static void sh_update_paging_modes(struc
 
                 old_mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
                 v->arch.hvm.monitor_table = pagetable_null();
-                new_mfn = v->arch.paging.mode->shadow.make_monitor_table(v);
+                new_mfn = sh_make_monitor_table(
+                              v, v->arch.paging.mode->shadow.shadow_levels);
                 v->arch.hvm.monitor_table = pagetable_from_mfn(new_mfn);
                 SHADOW_PRINTK("new monitor table %"PRI_mfn "\n",
                                mfn_x(new_mfn));
@@ -2516,7 +2519,8 @@ static void sh_update_paging_modes(struc
                 if ( v == current )
                     write_ptbase(v);
                 hvm_update_host_cr3(v);
-                old_mode->shadow.destroy_monitor_table(v, old_mfn);
+                sh_destroy_monitor_table(v, old_mfn,
+                                         old_mode->shadow.shadow_levels);
             }
         }
 
@@ -2801,7 +2805,9 @@ void shadow_teardown(struct domain *d, b
                     mfn_t mfn = pagetable_get_mfn(v->arch.hvm.monitor_table);
 
                     if ( mfn_valid(mfn) && (mfn_x(mfn) != 0) )
-                        v->arch.paging.mode->shadow.destroy_monitor_table(v, mfn);
+                        sh_destroy_monitor_table(
+                            v, mfn,
+                            v->arch.paging.mode->shadow.shadow_levels);
                     v->arch.hvm.monitor_table = pagetable_null();
                 }
 #endif /* CONFIG_HVM */
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -691,6 +691,88 @@ static void sh_emulate_unmap_dest(struct
     atomic_inc(&v->domain->arch.paging.shadow.gtable_dirty_version);
 }
 
+mfn_t sh_make_monitor_table(struct vcpu *v, unsigned int shadow_levels)
+{
+    struct domain *d = v->domain;
+    mfn_t m4mfn;
+    l4_pgentry_t *l4e;
+
+    ASSERT(!pagetable_get_pfn(v->arch.hvm.monitor_table));
+
+    /* Guarantee we can get the memory we need */
+    shadow_prealloc(d, SH_type_monitor_table, CONFIG_PAGING_LEVELS);
+    m4mfn = shadow_alloc(d, SH_type_monitor_table, 0);
+    mfn_to_page(m4mfn)->shadow_flags = 4;
+
+    l4e = map_domain_page(m4mfn);
+
+    /*
+     * Create a self-linear mapping, but no shadow-linear mapping.  A
+     * shadow-linear mapping will either be inserted below when creating
+     * lower level monitor tables, or later in sh_update_cr3().
+     */
+    init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
+
+    if ( shadow_levels < 4 )
+    {
+        mfn_t m3mfn, m2mfn;
+        l3_pgentry_t *l3e;
+
+        /*
+         * Install an l3 table and an l2 table that will hold the shadow
+         * linear map entries.  This overrides the empty entry that was
+         * installed by init_xen_l4_slots().
+         */
+        m3mfn = shadow_alloc(d, SH_type_monitor_table, 0);
+        mfn_to_page(m3mfn)->shadow_flags = 3;
+        l4e[l4_table_offset(SH_LINEAR_PT_VIRT_START)]
+            = l4e_from_mfn(m3mfn, __PAGE_HYPERVISOR_RW);
+
+        m2mfn = shadow_alloc(d, SH_type_monitor_table, 0);
+        mfn_to_page(m2mfn)->shadow_flags = 2;
+        l3e = map_domain_page(m3mfn);
+        l3e[0] = l3e_from_mfn(m2mfn, __PAGE_HYPERVISOR_RW);
+        unmap_domain_page(l3e);
+    }
+
+    unmap_domain_page(l4e);
+
+    return m4mfn;
+}
+
+void sh_destroy_monitor_table(struct vcpu *v, mfn_t mmfn,
+                              unsigned int shadow_levels)
+{
+    struct domain *d = v->domain;
+
+    ASSERT(mfn_to_page(mmfn)->u.sh.type == SH_type_monitor_table);
+
+    if ( shadow_levels < 4 )
+    {
+        mfn_t m3mfn;
+        l4_pgentry_t *l4e = map_domain_page(mmfn);
+        l3_pgentry_t *l3e;
+        unsigned int linear_slot = l4_table_offset(SH_LINEAR_PT_VIRT_START);
+
+        /*
+         * Need to destroy the l3 and l2 monitor pages used
+         * for the linear map.
+         */
+        ASSERT(l4e_get_flags(l4e[linear_slot]) & _PAGE_PRESENT);
+        m3mfn = l4e_get_mfn(l4e[linear_slot]);
+        l3e = map_domain_page(m3mfn);
+        ASSERT(l3e_get_flags(l3e[0]) & _PAGE_PRESENT);
+        shadow_free(d, l3e_get_mfn(l3e[0]));
+        unmap_domain_page(l3e);
+        shadow_free(d, m3mfn);
+
+        unmap_domain_page(l4e);
+    }
+
+    /* Put the memory back in the pool */
+    shadow_free(d, mmfn);
+}
+
 /**************************************************************************/
 /* VRAM dirty tracking support */
 int shadow_track_dirty_vram(struct domain *d,
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -1405,84 +1405,6 @@ make_fl1_shadow(struct domain *d, gfn_t
 }
 
 
-#if SHADOW_PAGING_LEVELS == GUEST_PAGING_LEVELS && defined(CONFIG_HVM)
-mfn_t
-sh_make_monitor_table(struct vcpu *v)
-{
-    struct domain *d = v->domain;
-
-    ASSERT(pagetable_get_pfn(v->arch.hvm.monitor_table) == 0);
-
-    /* Guarantee we can get the memory we need */
-    shadow_prealloc(d, SH_type_monitor_table, CONFIG_PAGING_LEVELS);
-
-    {
-        mfn_t m4mfn;
-        l4_pgentry_t *l4e;
-
-        m4mfn = shadow_alloc(d, SH_type_monitor_table, 0);
-        mfn_to_page(m4mfn)->shadow_flags = 4;
-
-        l4e = map_domain_page(m4mfn);
-
-        /*
-         * Create a self-linear mapping, but no shadow-linear mapping.  A
-         * shadow-linear mapping will either be inserted below when creating
-         * lower level monitor tables, or later in sh_update_cr3().
-         */
-        init_xen_l4_slots(l4e, m4mfn, d, INVALID_MFN, false);
-
-#if SHADOW_PAGING_LEVELS < 4
-        {
-            mfn_t m3mfn, m2mfn;
-            l3_pgentry_t *l3e;
-            /* Install an l3 table and an l2 table that will hold the shadow
-             * linear map entries.  This overrides the linear map entry that
-             * was installed by sh_install_xen_entries_in_l4. */
-
-            m3mfn = shadow_alloc(d, SH_type_monitor_table, 0);
-            mfn_to_page(m3mfn)->shadow_flags = 3;
-            l4e[shadow_l4_table_offset(SH_LINEAR_PT_VIRT_START)]
-                = l4e_from_mfn(m3mfn, __PAGE_HYPERVISOR_RW);
-
-            m2mfn = shadow_alloc(d, SH_type_monitor_table, 0);
-            mfn_to_page(m2mfn)->shadow_flags = 2;
-            l3e = map_domain_page(m3mfn);
-            l3e[0] = l3e_from_mfn(m2mfn, __PAGE_HYPERVISOR_RW);
-            unmap_domain_page(l3e);
-
-            if ( is_pv_32bit_domain(d) )
-            {
-                l2_pgentry_t *l2t;
-
-                /* For 32-bit PV guests, we need to map the 32-bit Xen
-                 * area into its usual VAs in the monitor tables */
-                m3mfn = shadow_alloc(d, SH_type_monitor_table, 0);
-                mfn_to_page(m3mfn)->shadow_flags = 3;
-                l4e[0] = l4e_from_mfn(m3mfn, __PAGE_HYPERVISOR_RW);
-
-                m2mfn = shadow_alloc(d, SH_type_monitor_table, 0);
-                mfn_to_page(m2mfn)->shadow_flags = 2;
-                l3e = map_domain_page(m3mfn);
-                l3e[3] = l3e_from_mfn(m2mfn, _PAGE_PRESENT);
-
-                l2t = map_domain_page(m2mfn);
-                init_xen_pae_l2_slots(l2t, d);
-                unmap_domain_page(l2t);
-
-                unmap_domain_page(l3e);
-            }
-
-        }
-#endif /* SHADOW_PAGING_LEVELS < 4 */
-
-        unmap_domain_page(l4e);
-
-        return m4mfn;
-    }
-}
-#endif /* SHADOW_PAGING_LEVELS == GUEST_PAGING_LEVELS */
-
 /**************************************************************************/
 /* These functions also take a virtual address and return the level-N
  * shadow table mfn and entry, but they create the shadow pagetables if
@@ -1860,50 +1782,6 @@ void sh_destroy_l1_shadow(struct domain
     shadow_free(d, smfn);
 }
 
-#if SHADOW_PAGING_LEVELS == GUEST_PAGING_LEVELS && defined(CONFIG_HVM)
-void sh_destroy_monitor_table(struct vcpu *v, mfn_t mmfn)
-{
-    struct domain *d = v->domain;
-    ASSERT(mfn_to_page(mmfn)->u.sh.type == SH_type_monitor_table);
-
-#if SHADOW_PAGING_LEVELS != 4
-    {
-        mfn_t m3mfn;
-        l4_pgentry_t *l4e = map_domain_page(mmfn);
-        l3_pgentry_t *l3e;
-        int linear_slot = shadow_l4_table_offset(SH_LINEAR_PT_VIRT_START);
-
-        /* Need to destroy the l3 and l2 monitor pages used
-         * for the linear map */
-        ASSERT(l4e_get_flags(l4e[linear_slot]) & _PAGE_PRESENT);
-        m3mfn = l4e_get_mfn(l4e[linear_slot]);
-        l3e = map_domain_page(m3mfn);
-        ASSERT(l3e_get_flags(l3e[0]) & _PAGE_PRESENT);
-        shadow_free(d, l3e_get_mfn(l3e[0]));
-        unmap_domain_page(l3e);
-        shadow_free(d, m3mfn);
-
-        if ( is_pv_32bit_domain(d) )
-        {
-            /* Need to destroy the l3 and l2 monitor pages that map the
-             * Xen VAs at 3GB-4GB */
-            ASSERT(l4e_get_flags(l4e[0]) & _PAGE_PRESENT);
-            m3mfn = l4e_get_mfn(l4e[0]);
-            l3e = map_domain_page(m3mfn);
-            ASSERT(l3e_get_flags(l3e[3]) & _PAGE_PRESENT);
-            shadow_free(d, l3e_get_mfn(l3e[3]));
-            unmap_domain_page(l3e);
-            shadow_free(d, m3mfn);
-        }
-        unmap_domain_page(l4e);
-    }
-#endif
-
-    /* Put the memory back in the pool */
-    shadow_free(d, mmfn);
-}
-#endif
-
 /**************************************************************************/
 /* Functions to destroy non-Xen mappings in a pagetable hierarchy.
  * These are called from common code when we are running out of shadow
@@ -4705,8 +4583,6 @@ const struct paging_mode sh_paging_mode
     .shadow.cmpxchg_guest_entry    = sh_cmpxchg_guest_entry,
 #endif
 #ifdef CONFIG_HVM
-    .shadow.make_monitor_table     = sh_make_monitor_table,
-    .shadow.destroy_monitor_table  = sh_destroy_monitor_table,
 #if SHADOW_OPTIMIZATIONS & SHOPT_WRITABLE_HEURISTIC
     .shadow.guess_wrmap            = sh_guess_wrmap,
 #endif
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -366,9 +366,6 @@ void sh_set_toplevel_shadow(struct vcpu
                                                  mfn_t gmfn,
                                                  uint32_t shadow_type));
 
-/* Install the xen mappings in various flavours of shadow */
-void sh_install_xen_entries_in_l4(struct domain *, mfn_t gl4mfn, mfn_t sl4mfn);
-
 /* Update the shadows in response to a pagetable write from Xen */
 int sh_validate_guest_entry(struct vcpu *v, mfn_t gmfn, void *entry, u32 size);
 
@@ -410,6 +407,14 @@ void shadow_update_paging_modes(struct v
  * With user_only == 1, unhooks only the user-mode mappings. */
 void shadow_unhook_mappings(struct domain *d, mfn_t smfn, int user_only);
 
+/*
+ * sh_{make,destroy}_monitor_table() depend only on the number of shadow
+ * levels.
+ */
+mfn_t sh_make_monitor_table(struct vcpu *v, unsigned int shadow_levels);
+void sh_destroy_monitor_table(struct vcpu *v, mfn_t mmfn,
+                              unsigned int shadow_levels);
+
 /* VRAM dirty tracking helpers. */
 void shadow_vram_get_mfn(mfn_t mfn, unsigned int l1f,
                          mfn_t sl1mfn, const void *sl1e,
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -262,15 +262,6 @@ static inline shadow_l4e_t shadow_l4e_fr
 #define sh_rm_write_access_from_sl1p INTERNAL_NAME(sh_rm_write_access_from_sl1p)
 #endif
 
-/* sh_make_monitor_table depends only on the number of shadow levels */
-#define sh_make_monitor_table \
-        SHADOW_SH_NAME(sh_make_monitor_table, SHADOW_PAGING_LEVELS)
-#define sh_destroy_monitor_table \
-        SHADOW_SH_NAME(sh_destroy_monitor_table, SHADOW_PAGING_LEVELS)
-
-mfn_t sh_make_monitor_table(struct vcpu *v);
-void sh_destroy_monitor_table(struct vcpu *v, mfn_t mmfn);
-
 #if SHADOW_PAGING_LEVELS == 3
 #define MFN_FITS_IN_HVM_CR3(_MFN) !(mfn_x(_MFN) >> 20)
 #endif
--- a/xen/include/asm-x86/paging.h
+++ b/xen/include/asm-x86/paging.h
@@ -107,8 +107,6 @@ struct shadow_paging_mode {
                                             mfn_t gmfn);
 #endif
 #ifdef CONFIG_HVM
-    mfn_t         (*make_monitor_table    )(struct vcpu *v);
-    void          (*destroy_monitor_table )(struct vcpu *v, mfn_t mmfn);
     int           (*guess_wrmap           )(struct vcpu *v, 
                                             unsigned long vaddr, mfn_t gmfn);
     void          (*pagetable_dying       )(paddr_t gpa);


