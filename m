Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87836220959
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 11:59:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveCc-0004hs-7z; Wed, 15 Jul 2020 09:59:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveCb-0004hh-2D
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 09:59:49 +0000
X-Inumbo-ID: ea7e66f7-c681-11ea-93a9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea7e66f7-c681-11ea-93a9-12813bfff9fa;
 Wed, 15 Jul 2020 09:59:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5FAABB02A;
 Wed, 15 Jul 2020 09:59:50 +0000 (UTC)
Subject: [PATCH 4/5] x86/shadow: have just a single instance of
 sh_set_toplevel_shadow()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a4dc8db4-0388-a922-838e-42c6f4635639@suse.com>
Message-ID: <a9308564-be9e-8112-8ca6-499a7501cfa7@suse.com>
Date: Wed, 15 Jul 2020 11:59:47 +0200
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

The only guest/shadow level dependent piece here is the call to
sh_make_shadow(). Make a pointer to the respective function an
argument of sh_set_toplevel_shadow(), allowing it to be moved to
common.c.

This implies making get_shadow_status() available to common.c; its set
and delete counterparts are moved along with it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Besides reducing compiled code size, this also avoids the function
becoming unused in !HVM builds (in two out of the three objects built)
in a subsequent change.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2560,6 +2560,80 @@ void shadow_update_paging_modes(struct v
     paging_unlock(v->domain);
 }
 
+/* Set up the top-level shadow and install it in slot 'slot' of shadow_table */
+void sh_set_toplevel_shadow(struct vcpu *v,
+                            unsigned int slot,
+                            mfn_t gmfn,
+                            unsigned int root_type,
+                            mfn_t (*make_shadow)(struct vcpu *v,
+                                                 mfn_t gmfn,
+                                                 uint32_t shadow_type))
+{
+    mfn_t smfn;
+    pagetable_t old_entry, new_entry;
+    struct domain *d = v->domain;
+
+    /* Remember the old contents of this slot */
+    old_entry = v->arch.paging.shadow.shadow_table[slot];
+
+    /* Now figure out the new contents: is this a valid guest MFN? */
+    if ( !mfn_valid(gmfn) )
+    {
+        new_entry = pagetable_null();
+        goto install_new_entry;
+    }
+
+    /* Guest mfn is valid: shadow it and install the shadow */
+    smfn = get_shadow_status(d, gmfn, root_type);
+    if ( !mfn_valid(smfn) )
+    {
+        /* Make sure there's enough free shadow memory. */
+        shadow_prealloc(d, root_type, 1);
+        /* Shadow the page. */
+        smfn = make_shadow(v, gmfn, root_type);
+    }
+    ASSERT(mfn_valid(smfn));
+
+    /* Take a ref to this page: it will be released in sh_detach_old_tables()
+     * or the next call to set_toplevel_shadow() */
+    if ( sh_get_ref(d, smfn, 0) )
+    {
+        /* Pin the shadow and put it (back) on the list of pinned shadows */
+        sh_pin(d, smfn);
+
+        new_entry = pagetable_from_mfn(smfn);
+    }
+    else
+    {
+        printk(XENLOG_G_ERR "can't install %"PRI_mfn" as toplevel shadow\n",
+               mfn_x(smfn));
+        domain_crash(d);
+        new_entry = pagetable_null();
+    }
+
+ install_new_entry:
+    /* Done.  Install it */
+    SHADOW_PRINTK("%u [%u] gmfn %#"PRI_mfn" smfn %#"PRI_mfn"\n",
+                  v->arch.paging.mode->shadow.shadow_levels, slot,
+                  mfn_x(gmfn), mfn_x(pagetable_get_mfn(new_entry)));
+    v->arch.paging.shadow.shadow_table[slot] = new_entry;
+
+    /* Decrement the refcount of the old contents of this slot */
+    if ( !pagetable_is_null(old_entry) )
+    {
+        mfn_t old_smfn = pagetable_get_mfn(old_entry);
+        /* Need to repin the old toplevel shadow if it's been unpinned
+         * by shadow_prealloc(): in PV mode we're still running on this
+         * shadow and it's not safe to free it yet. */
+        if ( !mfn_to_page(old_smfn)->u.sh.pinned && !sh_pin(d, old_smfn) )
+        {
+            printk(XENLOG_G_ERR "can't re-pin %"PRI_mfn"\n", mfn_x(old_smfn));
+            domain_crash(d);
+        }
+        sh_put_ref(d, old_smfn, 0);
+    }
+}
+
 /**************************************************************************/
 /* Turning on and off shadow features */
 
--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -103,7 +103,7 @@ static void sh_flush_local(const struct
 /**************************************************************************/
 /* Hash table mapping from guest pagetables to shadows
  *
- * Normal case: maps the mfn of a guest page to the mfn of its shadow page.
+ * normal case: see private.h.
  * FL1's:       maps the *gfn* of the start of a superpage to the mfn of a
  *              shadow L1 which maps its "splinters".
  */
@@ -117,16 +117,6 @@ get_fl1_shadow_status(struct domain *d,
     return smfn;
 }
 
-static inline mfn_t
-get_shadow_status(struct domain *d, mfn_t gmfn, u32 shadow_type)
-/* Look for shadows in the hash table */
-{
-    mfn_t smfn = shadow_hash_lookup(d, mfn_x(gmfn), shadow_type);
-    ASSERT(!mfn_valid(smfn) || mfn_to_page(smfn)->u.sh.head);
-    perfc_incr(shadow_get_shadow_status);
-    return smfn;
-}
-
 static inline void
 set_fl1_shadow_status(struct domain *d, gfn_t gfn, mfn_t smfn)
 /* Put an FL1 shadow into the hash table */
@@ -139,27 +129,6 @@ set_fl1_shadow_status(struct domain *d,
 }
 
 static inline void
-set_shadow_status(struct domain *d, mfn_t gmfn, u32 shadow_type, mfn_t smfn)
-/* Put a shadow into the hash table */
-{
-    int res;
-
-    SHADOW_PRINTK("d%d gmfn=%lx, type=%08x, smfn=%lx\n",
-                  d->domain_id, mfn_x(gmfn), shadow_type, mfn_x(smfn));
-
-    ASSERT(mfn_to_page(smfn)->u.sh.head);
-
-    /* 32-bit PV guests don't own their l4 pages so can't get_page them */
-    if ( !is_pv_32bit_domain(d) || shadow_type != SH_type_l4_64_shadow )
-    {
-        res = get_page(mfn_to_page(gmfn), d);
-        ASSERT(res == 1);
-    }
-
-    shadow_hash_insert(d, mfn_x(gmfn), shadow_type, smfn);
-}
-
-static inline void
 delete_fl1_shadow_status(struct domain *d, gfn_t gfn, mfn_t smfn)
 /* Remove a shadow from the hash table */
 {
@@ -169,19 +138,6 @@ delete_fl1_shadow_status(struct domain *
     shadow_hash_delete(d, gfn_x(gfn), SH_type_fl1_shadow, smfn);
 }
 
-static inline void
-delete_shadow_status(struct domain *d, mfn_t gmfn, u32 shadow_type, mfn_t smfn)
-/* Remove a shadow from the hash table */
-{
-    SHADOW_PRINTK("d%d gmfn=%"PRI_mfn", type=%08x, smfn=%"PRI_mfn"\n",
-                  d->domain_id, mfn_x(gmfn), shadow_type, mfn_x(smfn));
-    ASSERT(mfn_to_page(smfn)->u.sh.head);
-    shadow_hash_delete(d, mfn_x(gmfn), shadow_type, smfn);
-    /* 32-bit PV guests don't own their l4 pages; see set_shadow_status */
-    if ( !is_pv_32bit_domain(d) || shadow_type != SH_type_l4_64_shadow )
-        put_page(mfn_to_page(gmfn));
-}
-
 
 /**************************************************************************/
 /* Functions for walking the guest page tables */
@@ -3845,78 +3801,6 @@ sh_detach_old_tables(struct vcpu *v)
     }
 }
 
-/* Set up the top-level shadow and install it in slot 'slot' of shadow_table */
-static void
-sh_set_toplevel_shadow(struct vcpu *v,
-                       unsigned int slot,
-                       mfn_t gmfn,
-                       unsigned int root_type)
-{
-    mfn_t smfn;
-    pagetable_t old_entry, new_entry;
-    struct domain *d = v->domain;
-
-    /* Remember the old contents of this slot */
-    old_entry = v->arch.paging.shadow.shadow_table[slot];
-
-    /* Now figure out the new contents: is this a valid guest MFN? */
-    if ( !mfn_valid(gmfn) )
-    {
-        new_entry = pagetable_null();
-        goto install_new_entry;
-    }
-
-    /* Guest mfn is valid: shadow it and install the shadow */
-    smfn = get_shadow_status(d, gmfn, root_type);
-    if ( !mfn_valid(smfn) )
-    {
-        /* Make sure there's enough free shadow memory. */
-        shadow_prealloc(d, root_type, 1);
-        /* Shadow the page. */
-        smfn = sh_make_shadow(v, gmfn, root_type);
-    }
-    ASSERT(mfn_valid(smfn));
-
-    /* Take a ref to this page: it will be released in sh_detach_old_tables()
-     * or the next call to set_toplevel_shadow() */
-    if ( sh_get_ref(d, smfn, 0) )
-    {
-        /* Pin the shadow and put it (back) on the list of pinned shadows */
-        sh_pin(d, smfn);
-
-        new_entry = pagetable_from_mfn(smfn);
-    }
-    else
-    {
-        printk(XENLOG_G_ERR "can't install %"PRI_mfn" as toplevel shadow\n",
-               mfn_x(smfn));
-        domain_crash(d);
-        new_entry = pagetable_null();
-    }
-
- install_new_entry:
-    /* Done.  Install it */
-    SHADOW_PRINTK("%u/%u [%u] gmfn %#"PRI_mfn" smfn %#"PRI_mfn"\n",
-                  GUEST_PAGING_LEVELS, SHADOW_PAGING_LEVELS, slot,
-                  mfn_x(gmfn), mfn_x(pagetable_get_mfn(new_entry)));
-    v->arch.paging.shadow.shadow_table[slot] = new_entry;
-
-    /* Decrement the refcount of the old contents of this slot */
-    if ( !pagetable_is_null(old_entry) ) {
-        mfn_t old_smfn = pagetable_get_mfn(old_entry);
-        /* Need to repin the old toplevel shadow if it's been unpinned
-         * by shadow_prealloc(): in PV mode we're still running on this
-         * shadow and it's not safe to free it yet. */
-        if ( !mfn_to_page(old_smfn)->u.sh.pinned && !sh_pin(d, old_smfn) )
-        {
-            printk(XENLOG_G_ERR "can't re-pin %"PRI_mfn"\n", mfn_x(old_smfn));
-            domain_crash(d);
-        }
-        sh_put_ref(d, old_smfn, 0);
-    }
-}
-
-
 static void
 sh_update_cr3(struct vcpu *v, int do_locking, bool noflush)
 /* Updates vcpu->arch.cr3 after the guest has changed CR3.
@@ -4014,7 +3898,7 @@ sh_update_cr3(struct vcpu *v, int do_loc
 #if GUEST_PAGING_LEVELS == 2
     if ( sh_remove_write_access(d, gmfn, 2, 0) != 0 )
         guest_flush_tlb_mask(d, d->dirty_cpumask);
-    sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l2_shadow);
+    sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l2_shadow, sh_make_shadow);
 #elif GUEST_PAGING_LEVELS == 3
     /* PAE guests have four shadow_table entries, based on the
      * current values of the guest's four l3es. */
@@ -4048,18 +3932,20 @@ sh_update_cr3(struct vcpu *v, int do_loc
                 if ( p2m_is_ram(p2mt) )
                     sh_set_toplevel_shadow(v, i, gl2mfn, (i == 3)
                                            ? SH_type_l2h_shadow
-                                           : SH_type_l2_shadow);
+                                           : SH_type_l2_shadow,
+                                           sh_make_shadow);
                 else
-                    sh_set_toplevel_shadow(v, i, INVALID_MFN, 0);
+                    sh_set_toplevel_shadow(v, i, INVALID_MFN, 0,
+                                           sh_make_shadow);
             }
             else
-                sh_set_toplevel_shadow(v, i, INVALID_MFN, 0);
+                sh_set_toplevel_shadow(v, i, INVALID_MFN, 0, sh_make_shadow);
         }
     }
 #elif GUEST_PAGING_LEVELS == 4
     if ( sh_remove_write_access(d, gmfn, 4, 0) != 0 )
         guest_flush_tlb_mask(d, d->dirty_cpumask);
-    sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l4_shadow);
+    sh_set_toplevel_shadow(v, 0, gmfn, SH_type_l4_shadow, sh_make_shadow);
     if ( !shadow_mode_external(d) && !is_pv_32bit_domain(d) )
     {
         mfn_t smfn = pagetable_get_mfn(v->arch.paging.shadow.shadow_table[0]);
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -357,6 +357,15 @@ mfn_t shadow_alloc(struct domain *d,
                     unsigned long backpointer);
 void  shadow_free(struct domain *d, mfn_t smfn);
 
+/* Set up the top-level shadow and install it in slot 'slot' of shadow_table */
+void sh_set_toplevel_shadow(struct vcpu *v,
+                            unsigned int slot,
+                            mfn_t gmfn,
+                            unsigned int root_type,
+                            mfn_t (*make_shadow)(struct vcpu *v,
+                                                 mfn_t gmfn,
+                                                 uint32_t shadow_type));
+
 /* Install the xen mappings in various flavours of shadow */
 void sh_install_xen_entries_in_l4(struct domain *, mfn_t gl4mfn, mfn_t sl4mfn);
 
@@ -701,6 +710,58 @@ static inline void sh_unpin(struct domai
 }
 
 
+/**************************************************************************/
+/* Hash table mapping from guest pagetables to shadows
+ *
+ * Normal case: maps the mfn of a guest page to the mfn of its shadow page.
+ * FL1's:       see multi.c.
+ */
+
+static inline mfn_t
+get_shadow_status(struct domain *d, mfn_t gmfn, u32 shadow_type)
+/* Look for shadows in the hash table */
+{
+    mfn_t smfn = shadow_hash_lookup(d, mfn_x(gmfn), shadow_type);
+    ASSERT(!mfn_valid(smfn) || mfn_to_page(smfn)->u.sh.head);
+    perfc_incr(shadow_get_shadow_status);
+    return smfn;
+}
+
+static inline void
+set_shadow_status(struct domain *d, mfn_t gmfn, u32 shadow_type, mfn_t smfn)
+/* Put a shadow into the hash table */
+{
+    int res;
+
+    SHADOW_PRINTK("d%d gmfn=%lx, type=%08x, smfn=%lx\n",
+                  d->domain_id, mfn_x(gmfn), shadow_type, mfn_x(smfn));
+
+    ASSERT(mfn_to_page(smfn)->u.sh.head);
+
+    /* 32-bit PV guests don't own their l4 pages so can't get_page them */
+    if ( !is_pv_32bit_domain(d) || shadow_type != SH_type_l4_64_shadow )
+    {
+        res = get_page(mfn_to_page(gmfn), d);
+        ASSERT(res == 1);
+    }
+
+    shadow_hash_insert(d, mfn_x(gmfn), shadow_type, smfn);
+}
+
+static inline void
+delete_shadow_status(struct domain *d, mfn_t gmfn, u32 shadow_type, mfn_t smfn)
+/* Remove a shadow from the hash table */
+{
+    SHADOW_PRINTK("d%d gmfn=%"PRI_mfn", type=%08x, smfn=%"PRI_mfn"\n",
+                  d->domain_id, mfn_x(gmfn), shadow_type, mfn_x(smfn));
+    ASSERT(mfn_to_page(smfn)->u.sh.head);
+    shadow_hash_delete(d, mfn_x(gmfn), shadow_type, smfn);
+    /* 32-bit PV guests don't own their l4 pages; see set_shadow_status */
+    if ( !is_pv_32bit_domain(d) || shadow_type != SH_type_l4_64_shadow )
+        put_page(mfn_to_page(gmfn));
+}
+
+
 /**************************************************************************/
 /* PTE-write emulation. */
 


