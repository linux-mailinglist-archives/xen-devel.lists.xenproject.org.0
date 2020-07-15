Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B0E220955
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 11:58:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveBX-0004Xr-Fl; Wed, 15 Jul 2020 09:58:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveBV-0004Xh-Kt
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 09:58:41 +0000
X-Inumbo-ID: c15f22d8-c681-11ea-93a9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c15f22d8-c681-11ea-93a9-12813bfff9fa;
 Wed, 15 Jul 2020 09:58:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 61C38AF95;
 Wed, 15 Jul 2020 09:58:41 +0000 (UTC)
Subject: [PATCH 2/5] x86/shadow: shadow_table[] needs only one entry for
 PV-only configs
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
Message-ID: <6d93b35d-3d9a-a5e8-7e7c-9fcd2b930ced@suse.com>
Date: Wed, 15 Jul 2020 11:58:39 +0200
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

Furthermore the field isn't needed at all with shadow support disabled -
move it into struct shadow_vcpu.

Introduce for_each_shadow_table(), shortening loops for the 4-level case
at the same time.

Adjust loop variables and a function parameter to be "unsigned int"
where applicable at the same time. Also move a comment that ended up
misplaced due to incremental additions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -959,13 +959,15 @@ static void _shadow_prealloc(struct doma
     perfc_incr(shadow_prealloc_2);
 
     for_each_vcpu(d, v)
-        for ( i = 0 ; i < 4 ; i++ )
+        for ( i = 0; i < ARRAY_SIZE(v->arch.paging.shadow.shadow_table); i++ )
         {
-            if ( !pagetable_is_null(v->arch.shadow_table[i]) )
+            if ( !pagetable_is_null(v->arch.paging.shadow.shadow_table[i]) )
             {
                 TRACE_SHADOW_PATH_FLAG(TRCE_SFLAG_PREALLOC_UNHOOK);
-                shadow_unhook_mappings(d,
-                               pagetable_get_mfn(v->arch.shadow_table[i]), 0);
+                shadow_unhook_mappings(
+                    d,
+                    pagetable_get_mfn(v->arch.paging.shadow.shadow_table[i]),
+                    0);
 
                 /* See if that freed up enough space */
                 if ( d->arch.paging.shadow.free_pages >= pages )
@@ -1018,10 +1020,12 @@ void shadow_blow_tables(struct domain *d
 
     /* Second pass: unhook entries of in-use shadows */
     for_each_vcpu(d, v)
-        for ( i = 0 ; i < 4 ; i++ )
-            if ( !pagetable_is_null(v->arch.shadow_table[i]) )
-                shadow_unhook_mappings(d,
-                               pagetable_get_mfn(v->arch.shadow_table[i]), 0);
+        for ( i = 0; i < ARRAY_SIZE(v->arch.paging.shadow.shadow_table); i++ )
+            if ( !pagetable_is_null(v->arch.paging.shadow.shadow_table[i]) )
+                shadow_unhook_mappings(
+                    d,
+                    pagetable_get_mfn(v->arch.paging.shadow.shadow_table[i]),
+                    0);
 
     /* Make sure everyone sees the unshadowings */
     guest_flush_tlb_mask(d, d->dirty_cpumask);
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -85,6 +85,15 @@ const char *const fetch_type_names[] = {
 };
 #endif
 
+#if SHADOW_PAGING_LEVELS == 3
+# define for_each_shadow_table(v, i) \
+    for ( (i) = 0; \
+          (i) < ARRAY_SIZE((v)->arch.paging.shadow.shadow_table); \
+          ++(i) )
+#else
+# define for_each_shadow_table(v, i) for ( (i) = 0; (i) < 1; ++(i) )
+#endif
+
 /* Helper to perform a local TLB flush. */
 static void sh_flush_local(const struct domain *d)
 {
@@ -1624,7 +1633,7 @@ static shadow_l4e_t * shadow_get_and_cre
                                                 mfn_t *sl4mfn)
 {
     /* There is always a shadow of the top level table.  Get it. */
-    *sl4mfn = pagetable_get_mfn(v->arch.shadow_table[0]);
+    *sl4mfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]);
     /* Reading the top level table is always valid. */
     return sh_linear_l4_table(v) + shadow_l4_linear_offset(gw->va);
 }
@@ -1740,7 +1749,7 @@ static shadow_l2e_t * shadow_get_and_cre
     return sh_linear_l2_table(v) + shadow_l2_linear_offset(gw->va);
 #else /* 32bit... */
     /* There is always a shadow of the top level table.  Get it. */
-    *sl2mfn = pagetable_get_mfn(v->arch.shadow_table[0]);
+    *sl2mfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]);
     /* This next line is important: the guest l2 has a 16k
      * shadow, we need to return the right mfn of the four. This
      * call will set it for us as a side-effect. */
@@ -2333,6 +2342,7 @@ int sh_safe_not_to_sync(struct vcpu *v,
     struct domain *d = v->domain;
     struct page_info *sp;
     mfn_t smfn;
+    unsigned int i;
 
     if ( !sh_type_has_up_pointer(d, SH_type_l1_shadow) )
         return 0;
@@ -2365,14 +2375,10 @@ int sh_safe_not_to_sync(struct vcpu *v,
     ASSERT(mfn_valid(smfn));
 #endif
 
-    if ( pagetable_get_pfn(v->arch.shadow_table[0]) == mfn_x(smfn)
-#if (SHADOW_PAGING_LEVELS == 3)
-         || pagetable_get_pfn(v->arch.shadow_table[1]) == mfn_x(smfn)
-         || pagetable_get_pfn(v->arch.shadow_table[2]) == mfn_x(smfn)
-         || pagetable_get_pfn(v->arch.shadow_table[3]) == mfn_x(smfn)
-#endif
-        )
-        return 0;
+    for_each_shadow_table(v, i)
+        if ( pagetable_get_pfn(v->arch.paging.shadow.shadow_table[i]) ==
+             mfn_x(smfn) )
+            return 0;
 
     /* Only in use in one toplevel shadow, and it's not the one we're
      * running on */
@@ -3287,10 +3293,12 @@ static int sh_page_fault(struct vcpu *v,
         for_each_vcpu(d, tmp)
         {
 #if GUEST_PAGING_LEVELS == 3
-            int i;
-            for ( i = 0; i < 4; i++ )
+            unsigned int i;
+
+            for_each_shadow_table(v, i)
             {
-                mfn_t smfn = pagetable_get_mfn(v->arch.shadow_table[i]);
+                mfn_t smfn = pagetable_get_mfn(
+                                 v->arch.paging.shadow.shadow_table[i]);
 
                 if ( mfn_valid(smfn) && (mfn_x(smfn) != 0) )
                 {
@@ -3707,7 +3715,7 @@ sh_update_linear_entries(struct vcpu *v)
      *
      * Because HVM guests run on the same monitor tables regardless of the
      * shadow tables in use, the linear mapping of the shadow tables has to
-     * be updated every time v->arch.shadow_table changes.
+     * be updated every time v->arch.paging.shadow.shadow_table changes.
      */
 
     /* Don't try to update the monitor table if it doesn't exist */
@@ -3723,8 +3731,9 @@ sh_update_linear_entries(struct vcpu *v)
     if ( v == current )
     {
         __linear_l4_table[l4_linear_offset(SH_LINEAR_PT_VIRT_START)] =
-            l4e_from_pfn(pagetable_get_pfn(v->arch.shadow_table[0]),
-                         __PAGE_HYPERVISOR_RW);
+            l4e_from_pfn(
+                pagetable_get_pfn(v->arch.paging.shadow.shadow_table[0]),
+                __PAGE_HYPERVISOR_RW);
     }
     else
     {
@@ -3732,8 +3741,9 @@ sh_update_linear_entries(struct vcpu *v)
 
         ml4e = map_domain_page(pagetable_get_mfn(v->arch.hvm.monitor_table));
         ml4e[l4_table_offset(SH_LINEAR_PT_VIRT_START)] =
-            l4e_from_pfn(pagetable_get_pfn(v->arch.shadow_table[0]),
-                         __PAGE_HYPERVISOR_RW);
+            l4e_from_pfn(
+                pagetable_get_pfn(v->arch.paging.shadow.shadow_table[0]),
+                __PAGE_HYPERVISOR_RW);
         unmap_domain_page(ml4e);
     }
 
@@ -3812,7 +3822,7 @@ sh_update_linear_entries(struct vcpu *v)
 
 
 /*
- * Removes vcpu->arch.shadow_table[].
+ * Removes v->arch.paging.shadow.shadow_table[].
  * Does all appropriate management/bookkeeping/refcounting/etc...
  */
 static void
@@ -3820,38 +3830,34 @@ sh_detach_old_tables(struct vcpu *v)
 {
     struct domain *d = v->domain;
     mfn_t smfn;
-    int i = 0;
+    unsigned int i;
 
     ////
-    //// vcpu->arch.shadow_table[]
+    //// vcpu->arch.paging.shadow.shadow_table[]
     ////
 
-#if GUEST_PAGING_LEVELS == 3
-    /* PAE guests have four shadow_table entries */
-    for ( i = 0 ; i < 4 ; i++ )
-#endif
+    for_each_shadow_table(v, i)
     {
-        smfn = pagetable_get_mfn(v->arch.shadow_table[i]);
+        smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[i]);
         if ( mfn_x(smfn) )
             sh_put_ref(d, smfn, 0);
-        v->arch.shadow_table[i] = pagetable_null();
+        v->arch.paging.shadow.shadow_table[i] = pagetable_null();
     }
 }
 
 /* Set up the top-level shadow and install it in slot 'slot' of shadow_table */
 static void
 sh_set_toplevel_shadow(struct vcpu *v,
-                       int slot,
+                       unsigned int slot,
                        mfn_t gmfn,
                        unsigned int root_type)
 {
     mfn_t smfn;
     pagetable_t old_entry, new_entry;
-
     struct domain *d = v->domain;
 
     /* Remember the old contents of this slot */
-    old_entry = v->arch.shadow_table[slot];
+    old_entry = v->arch.paging.shadow.shadow_table[slot];
 
     /* Now figure out the new contents: is this a valid guest MFN? */
     if ( !mfn_valid(gmfn) )
@@ -3893,7 +3899,7 @@ sh_set_toplevel_shadow(struct vcpu *v,
     SHADOW_PRINTK("%u/%u [%u] gmfn %#"PRI_mfn" smfn %#"PRI_mfn"\n",
                   GUEST_PAGING_LEVELS, SHADOW_PAGING_LEVELS, slot,
                   mfn_x(gmfn), mfn_x(pagetable_get_mfn(new_entry)));
-    v->arch.shadow_table[slot] = new_entry;
+    v->arch.paging.shadow.shadow_table[slot] = new_entry;
 
     /* Decrement the refcount of the old contents of this slot */
     if ( !pagetable_is_null(old_entry) ) {
@@ -3999,7 +4005,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
 
 
     ////
-    //// vcpu->arch.shadow_table[]
+    //// vcpu->arch.paging.shadow.shadow_table[]
     ////
 
     /* We revoke write access to the new guest toplevel page(s) before we
@@ -4056,7 +4062,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
     sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l4_shadow);
     if ( !shadow_mode_external(d) && !is_pv_32bit_domain(d) )
     {
-        mfn_t smfn = pagetable_get_mfn(v->arch.shadow_table[0]);
+        mfn_t smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]);
 
         if ( !(v->arch.flags & TF_kernel_mode) && VM_ASSIST(d, m2p_strict) )
             zap_ro_mpt(smfn);
@@ -4074,9 +4080,10 @@ sh_update_cr3(struct vcpu *v, int do_loc
     ///
 #if SHADOW_PAGING_LEVELS == 3
         {
-            mfn_t smfn = pagetable_get_mfn(v->arch.shadow_table[0]);
-            int i;
-            for ( i = 0; i < 4; i++ )
+            mfn_t smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]);
+            unsigned int i;
+
+            for_each_shadow_table(v, i)
             {
 #if GUEST_PAGING_LEVELS == 2
                 /* 2-on-3: make a PAE l3 that points at the four-page l2 */
@@ -4084,7 +4091,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
                     smfn = sh_next_page(smfn);
 #else
                 /* 3-on-3: make a PAE l3 that points at the four l2 pages */
-                smfn = pagetable_get_mfn(v->arch.shadow_table[i]);
+                smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[i]);
 #endif
                 v->arch.paging.shadow.l3table[i] =
                     (mfn_x(smfn) == 0)
@@ -4108,7 +4115,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
         /* We don't support PV except guest == shadow == config levels */
         BUILD_BUG_ON(GUEST_PAGING_LEVELS != SHADOW_PAGING_LEVELS);
         /* Just use the shadow top-level directly */
-        make_cr3(v, pagetable_get_mfn(v->arch.shadow_table[0]));
+        make_cr3(v, pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]));
     }
 #endif
 
@@ -4124,7 +4131,8 @@ sh_update_cr3(struct vcpu *v, int do_loc
         v->arch.hvm.hw_cr[3] = virt_to_maddr(&v->arch.paging.shadow.l3table);
 #else
         /* 4-on-4: Just use the shadow top-level directly */
-        v->arch.hvm.hw_cr[3] = pagetable_get_paddr(v->arch.shadow_table[0]);
+        v->arch.hvm.hw_cr[3] =
+            pagetable_get_paddr(v->arch.paging.shadow.shadow_table[0]);
 #endif
         hvm_update_guest_cr3(v, noflush);
     }
@@ -4443,7 +4451,7 @@ static void sh_pagetable_dying(paddr_t g
 {
     struct vcpu *v = current;
     struct domain *d = v->domain;
-    int i = 0;
+    unsigned int i;
     int flush = 0;
     int fast_path = 0;
     paddr_t gcr3 = 0;
@@ -4474,15 +4482,16 @@ static void sh_pagetable_dying(paddr_t g
         gl3pa = map_domain_page(l3mfn);
         gl3e = (guest_l3e_t *)(gl3pa + ((unsigned long)gpa & ~PAGE_MASK));
     }
-    for ( i = 0; i < 4; i++ )
+    for_each_shadow_table(v, i)
     {
         mfn_t smfn, gmfn;
 
-        if ( fast_path ) {
-            if ( pagetable_is_null(v->arch.shadow_table[i]) )
+        if ( fast_path )
+        {
+            if ( pagetable_is_null(v->arch.paging.shadow.shadow_table[i]) )
                 smfn = INVALID_MFN;
             else
-                smfn = pagetable_get_mfn(v->arch.shadow_table[i]);
+                smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[i]);
         }
         else
         {
--- a/xen/include/asm-x86/domain.h
+++ b/xen/include/asm-x86/domain.h
@@ -135,6 +135,14 @@ struct shadow_vcpu {
     l3_pgentry_t l3table[4] __attribute__((__aligned__(32)));
     /* PAE guests: per-vcpu cache of the top-level *guest* entries */
     l3_pgentry_t gl3e[4] __attribute__((__aligned__(32)));
+
+    /* shadow(s) of guest (MFN) */
+#ifdef CONFIG_HVM
+    pagetable_t shadow_table[4];
+#else
+    pagetable_t shadow_table[1];
+#endif
+
     /* Last MFN that we emulated a write to as unshadow heuristics. */
     unsigned long last_emulated_mfn_for_unshadow;
     /* MFN of the last shadow that we shot a writeable mapping in */
@@ -576,6 +584,10 @@ struct arch_vcpu
         struct hvm_vcpu hvm;
     };
 
+    /*
+     * guest_table{,_user} hold a ref to the page, and also a type-count
+     * unless shadow refcounts are in use
+     */
     pagetable_t guest_table_user;       /* (MFN) x86/64 user-space pagetable */
     pagetable_t guest_table;            /* (MFN) guest notion of cr3 */
     struct page_info *old_guest_table;  /* partially destructed pagetable */
@@ -583,9 +595,7 @@ struct arch_vcpu
                                         /* former, if any */
     bool old_guest_table_partial;       /* Are we dropping a type ref, or just
                                          * finishing up a partial de-validation? */
-    /* guest_table holds a ref to the page, and also a type-count unless
-     * shadow refcounts are in use */
-    pagetable_t shadow_table[4];        /* (MFN) shadow(s) of guest */
+
     unsigned long cr3;                  /* (MA) value to install in HW CR3 */
 
     /*


