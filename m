Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 096BE35C86E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:14:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109212.208456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxK8-0006Q2-RI; Mon, 12 Apr 2021 14:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109212.208456; Mon, 12 Apr 2021 14:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxK8-0006Pd-O3; Mon, 12 Apr 2021 14:13:56 +0000
Received: by outflank-mailman (input) for mailman id 109212;
 Mon, 12 Apr 2021 14:13:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxK7-0006PW-Mt
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:13:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c1d2933-e52a-4c63-987b-ad3c2b09877f;
 Mon, 12 Apr 2021 14:13:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CAFCB02C;
 Mon, 12 Apr 2021 14:13:53 +0000 (UTC)
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
X-Inumbo-ID: 8c1d2933-e52a-4c63-987b-ad3c2b09877f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GsWv5qIefEQzmwBFM73qXNflItcakFdzhM28hDFIMf8=;
	b=fvSItehCc4KJs8O8ZDrOIC72OVn3C9H4BedBWsLp43lQHeoI6SsLezvCQUxx4ZbcGe0Jsj
	1kgegP+2Rwz7GJ9OCYeyc3OXdKOOj1ePNRSwkB6vQmIohdjORJZfosbw8UbMYz5oRRNjct
	EYdlicQituweMUMC8GxZLbN5bPvX1NA=
Subject: [PATCH v2 11/12] x86/p2m: write_p2m_entry_{pre,post} hooks are
 HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <507182a8-38c3-cda3-d921-7494a5df63a7@suse.com>
Date: Mon, 12 Apr 2021 16:13:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Move respective shadow code to its HVM-only source file, thus making it
possible to exclude the hooks as well. This then shows that
shadow_p2m_init() also isn't needed in !HVM builds.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2327,22 +2327,6 @@ void shadow_prepare_page_type_change(str
     shadow_remove_all_shadows(d, page_to_mfn(page));
 }
 
-static void
-sh_remove_all_shadows_and_parents(struct domain *d, mfn_t gmfn)
-/* Even harsher: this is a HVM page that we thing is no longer a pagetable.
- * Unshadow it, and recursively unshadow pages that reference it. */
-{
-    sh_remove_shadows(d, gmfn, 0, 1);
-    /* XXX TODO:
-     * Rework this hashtable walker to return a linked-list of all
-     * the shadows it modified, then do breadth-first recursion
-     * to find the way up to higher-level tables and unshadow them too.
-     *
-     * The current code (just tearing down each page's shadows as we
-     * detect that it is not a pagetable) is correct, but very slow.
-     * It means extra emulated writes and slows down removal of mappings. */
-}
-
 /**************************************************************************/
 
 /* Reset the up-pointers of every L3 shadow to 0.
@@ -3086,126 +3070,6 @@ static int shadow_test_disable(struct do
 }
 
 /**************************************************************************/
-/* P2M map manipulations */
-
-/* shadow specific code which should be called when P2M table entry is updated
- * with new content. It is responsible for update the entry, as well as other
- * shadow processing jobs.
- */
-
-static void sh_unshadow_for_p2m_change(struct domain *d, unsigned long gfn,
-                                       l1_pgentry_t old, l1_pgentry_t new,
-                                       unsigned int level)
-{
-    mfn_t omfn = l1e_get_mfn(old);
-    unsigned int oflags = l1e_get_flags(old);
-    p2m_type_t p2mt = p2m_flags_to_type(oflags);
-    bool flush = false;
-
-    /*
-     * If there are any shadows, update them.  But if shadow_teardown()
-     * has already been called then it's not safe to try.
-     */
-    if ( unlikely(!d->arch.paging.shadow.total_pages) )
-        return;
-
-    switch ( level )
-    {
-    default:
-        /*
-         * The following assertion is to make sure we don't step on 1GB host
-         * page support of HVM guest.
-         */
-        ASSERT(!((oflags & _PAGE_PRESENT) && (oflags & _PAGE_PSE)));
-        break;
-
-    /* If we're removing an MFN from the p2m, remove it from the shadows too */
-    case 1:
-        if ( (p2m_is_valid(p2mt) || p2m_is_grant(p2mt)) && mfn_valid(omfn) )
-        {
-            sh_remove_all_shadows_and_parents(d, omfn);
-            if ( sh_remove_all_mappings(d, omfn, _gfn(gfn)) )
-                flush = true;
-        }
-        break;
-
-    /*
-     * If we're removing a superpage mapping from the p2m, we need to check
-     * all the pages covered by it.  If they're still there in the new
-     * scheme, that's OK, but otherwise they must be unshadowed.
-     */
-    case 2:
-        if ( !(oflags & _PAGE_PRESENT) || !(oflags & _PAGE_PSE) )
-            break;
-
-        if ( p2m_is_valid(p2mt) && mfn_valid(omfn) )
-        {
-            unsigned int i;
-            mfn_t nmfn = l1e_get_mfn(new);
-            l1_pgentry_t *npte = NULL;
-
-            /* If we're replacing a superpage with a normal L1 page, map it */
-            if ( (l1e_get_flags(new) & _PAGE_PRESENT) &&
-                 !(l1e_get_flags(new) & _PAGE_PSE) &&
-                 mfn_valid(nmfn) )
-                npte = map_domain_page(nmfn);
-
-            gfn &= ~(L1_PAGETABLE_ENTRIES - 1);
-
-            for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
-            {
-                if ( !npte ||
-                     !p2m_is_ram(p2m_flags_to_type(l1e_get_flags(npte[i]))) ||
-                     !mfn_eq(l1e_get_mfn(npte[i]), omfn) )
-                {
-                    /* This GFN->MFN mapping has gone away */
-                    sh_remove_all_shadows_and_parents(d, omfn);
-                    if ( sh_remove_all_mappings(d, omfn, _gfn(gfn + i)) )
-                        flush = true;
-                }
-                omfn = mfn_add(omfn, 1);
-            }
-
-            if ( npte )
-                unmap_domain_page(npte);
-        }
-
-        break;
-    }
-
-    if ( flush )
-        guest_flush_tlb_mask(d, d->dirty_cpumask);
-}
-
-#if (SHADOW_OPTIMIZATIONS & SHOPT_FAST_FAULT_PATH)
-static void
-sh_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
-{
-    struct domain *d = p2m->domain;
-
-    /* If we're doing FAST_FAULT_PATH, then shadow mode may have
-       cached the fact that this is an mmio region in the shadow
-       page tables.  Blow the tables away to remove the cache.
-       This is pretty heavy handed, but this is a rare operation
-       (it might happen a dozen times during boot and then never
-       again), so it doesn't matter too much. */
-    if ( d->arch.paging.shadow.has_fast_mmio_entries )
-    {
-        shadow_blow_tables(d);
-        d->arch.paging.shadow.has_fast_mmio_entries = false;
-    }
-}
-#else
-# define sh_write_p2m_entry_post NULL
-#endif
-
-void shadow_p2m_init(struct p2m_domain *p2m)
-{
-    p2m->write_p2m_entry_pre  = sh_unshadow_for_p2m_change;
-    p2m->write_p2m_entry_post = sh_write_p2m_entry_post;
-}
-
-/**************************************************************************/
 /* Log-dirty mode support */
 
 /* Shadow specific code which is called in paging_log_dirty_enable().
--- a/xen/arch/x86/mm/shadow/hvm.c
+++ b/xen/arch/x86/mm/shadow/hvm.c
@@ -774,6 +774,142 @@ void sh_destroy_monitor_table(const stru
 }
 
 /**************************************************************************/
+/* P2M map manipulations */
+
+/* shadow specific code which should be called when P2M table entry is updated
+ * with new content. It is responsible for update the entry, as well as other
+ * shadow processing jobs.
+ */
+
+static void
+sh_remove_all_shadows_and_parents(struct domain *d, mfn_t gmfn)
+/* Even harsher: this is a HVM page that we thing is no longer a pagetable.
+ * Unshadow it, and recursively unshadow pages that reference it. */
+{
+    sh_remove_shadows(d, gmfn, 0, 1);
+    /* XXX TODO:
+     * Rework this hashtable walker to return a linked-list of all
+     * the shadows it modified, then do breadth-first recursion
+     * to find the way up to higher-level tables and unshadow them too.
+     *
+     * The current code (just tearing down each page's shadows as we
+     * detect that it is not a pagetable) is correct, but very slow.
+     * It means extra emulated writes and slows down removal of mappings. */
+}
+
+static void sh_unshadow_for_p2m_change(struct domain *d, unsigned long gfn,
+                                       l1_pgentry_t old, l1_pgentry_t new,
+                                       unsigned int level)
+{
+    mfn_t omfn = l1e_get_mfn(old);
+    unsigned int oflags = l1e_get_flags(old);
+    p2m_type_t p2mt = p2m_flags_to_type(oflags);
+    bool flush = false;
+
+    /*
+     * If there are any shadows, update them.  But if shadow_teardown()
+     * has already been called then it's not safe to try.
+     */
+    if ( unlikely(!d->arch.paging.shadow.total_pages) )
+        return;
+
+    switch ( level )
+    {
+    default:
+        /*
+         * The following assertion is to make sure we don't step on 1GB host
+         * page support of HVM guest.
+         */
+        ASSERT(!((oflags & _PAGE_PRESENT) && (oflags & _PAGE_PSE)));
+        break;
+
+    /* If we're removing an MFN from the p2m, remove it from the shadows too */
+    case 1:
+        if ( (p2m_is_valid(p2mt) || p2m_is_grant(p2mt)) && mfn_valid(omfn) )
+        {
+            sh_remove_all_shadows_and_parents(d, omfn);
+            if ( sh_remove_all_mappings(d, omfn, _gfn(gfn)) )
+                flush = true;
+        }
+        break;
+
+    /*
+     * If we're removing a superpage mapping from the p2m, we need to check
+     * all the pages covered by it.  If they're still there in the new
+     * scheme, that's OK, but otherwise they must be unshadowed.
+     */
+    case 2:
+        if ( !(oflags & _PAGE_PRESENT) || !(oflags & _PAGE_PSE) )
+            break;
+
+        if ( p2m_is_valid(p2mt) && mfn_valid(omfn) )
+        {
+            unsigned int i;
+            mfn_t nmfn = l1e_get_mfn(new);
+            l1_pgentry_t *npte = NULL;
+
+            /* If we're replacing a superpage with a normal L1 page, map it */
+            if ( (l1e_get_flags(new) & _PAGE_PRESENT) &&
+                 !(l1e_get_flags(new) & _PAGE_PSE) &&
+                 mfn_valid(nmfn) )
+                npte = map_domain_page(nmfn);
+
+            gfn &= ~(L1_PAGETABLE_ENTRIES - 1);
+
+            for ( i = 0; i < L1_PAGETABLE_ENTRIES; i++ )
+            {
+                if ( !npte ||
+                     !p2m_is_ram(p2m_flags_to_type(l1e_get_flags(npte[i]))) ||
+                     !mfn_eq(l1e_get_mfn(npte[i]), omfn) )
+                {
+                    /* This GFN->MFN mapping has gone away */
+                    sh_remove_all_shadows_and_parents(d, omfn);
+                    if ( sh_remove_all_mappings(d, omfn, _gfn(gfn + i)) )
+                        flush = true;
+                }
+                omfn = mfn_add(omfn, 1);
+            }
+
+            if ( npte )
+                unmap_domain_page(npte);
+        }
+
+        break;
+    }
+
+    if ( flush )
+        guest_flush_tlb_mask(d, d->dirty_cpumask);
+}
+
+#if (SHADOW_OPTIMIZATIONS & SHOPT_FAST_FAULT_PATH)
+static void
+sh_write_p2m_entry_post(struct p2m_domain *p2m, unsigned int oflags)
+{
+    struct domain *d = p2m->domain;
+
+    /* If we're doing FAST_FAULT_PATH, then shadow mode may have
+       cached the fact that this is an mmio region in the shadow
+       page tables.  Blow the tables away to remove the cache.
+       This is pretty heavy handed, but this is a rare operation
+       (it might happen a dozen times during boot and then never
+       again), so it doesn't matter too much. */
+    if ( d->arch.paging.shadow.has_fast_mmio_entries )
+    {
+        shadow_blow_tables(d);
+        d->arch.paging.shadow.has_fast_mmio_entries = false;
+    }
+}
+#else
+# define sh_write_p2m_entry_post NULL
+#endif
+
+void shadow_p2m_init(struct p2m_domain *p2m)
+{
+    p2m->write_p2m_entry_pre  = sh_unshadow_for_p2m_change;
+    p2m->write_p2m_entry_post = sh_write_p2m_entry_post;
+}
+
+/**************************************************************************/
 /* VRAM dirty tracking support */
 int shadow_track_dirty_vram(struct domain *d,
                             unsigned long begin_pfn,
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -278,7 +278,6 @@ struct p2m_domain {
                                                   unsigned long first_gfn,
                                                   unsigned long last_gfn);
     void               (*memory_type_changed)(struct p2m_domain *p2m);
-#endif
     void               (*write_p2m_entry_pre)(struct domain *d,
                                               unsigned long gfn,
                                               l1_pgentry_t old,
@@ -286,6 +285,7 @@ struct p2m_domain {
                                               unsigned int level);
     void               (*write_p2m_entry_post)(struct p2m_domain *p2m,
                                                unsigned int oflags);
+#endif
 #if P2M_AUDIT
     long               (*audit_p2m)(struct p2m_domain *p2m);
 #endif
@@ -788,8 +788,6 @@ int __must_check p2m_set_entry(struct p2
 #if defined(CONFIG_HVM)
 /* Set up function pointers for PT implementation: only for use by p2m code */
 extern void p2m_pt_init(struct p2m_domain *p2m);
-#elif defined(CONFIG_SHADOW_PAGING)
-# define p2m_pt_init shadow_p2m_init
 #else
 static inline void p2m_pt_init(struct p2m_domain *p2m) {}
 #endif


