Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E412DB150
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54451.94595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD9Q-0003RX-9D; Tue, 15 Dec 2020 16:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54451.94595; Tue, 15 Dec 2020 16:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD9Q-0003R7-5q; Tue, 15 Dec 2020 16:26:12 +0000
Received: by outflank-mailman (input) for mailman id 54451;
 Tue, 15 Dec 2020 16:26:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpD9P-0003R1-Ai
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:26:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 564a43b6-9f89-49a8-816f-1b9c84fad78b;
 Tue, 15 Dec 2020 16:26:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07E8FAF73;
 Tue, 15 Dec 2020 16:26:09 +0000 (UTC)
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
X-Inumbo-ID: 564a43b6-9f89-49a8-816f-1b9c84fad78b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608049569; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2v/1RwZ/B8SXbtGwlsQ+TtN2+gyOEB1v2MbI3xzoisA=;
	b=bMTnqTO3ksXZegBmW3IDaLL3GhfI0KyqUhbeP7gOes2MIuev0Ex0TtHHi3/FxUu3oXlfj9
	o1SDqHTVN05yE4lVaYxTvpVYOZVXt5KQTOrXc6VxFNlt4Xl+JiHxNH0riofLgZzlP3oA2q
	wtf6riMIj8zof1wHQUrDMGuNboPudNs=
Subject: [PATCH 2/6] x86/mm: p2m_add_foreign() is HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
Message-ID: <cf4569c5-a9c5-7b4b-d576-d1521c369418@suse.com>
Date: Tue, 15 Dec 2020 17:26:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

This is together with its only caller, xenmem_add_to_physmap_one(). Move
the latter next to p2m_add_foreign(), allowing this one to become static
at the same time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -118,7 +118,6 @@
 #include <xen/vmap.h>
 #include <xen/xmalloc.h>
 #include <xen/efi.h>
-#include <xen/grant_table.h>
 #include <xen/hypercall.h>
 #include <xen/mm.h>
 #include <asm/paging.h>
@@ -142,10 +141,7 @@
 #include <asm/pci.h>
 #include <asm/guest.h>
 #include <asm/hvm/ioreq.h>
-
-#include <asm/hvm/grant_table.h>
 #include <asm/pv/domain.h>
-#include <asm/pv/grant_table.h>
 #include <asm/pv/mm.h>
 
 #ifdef CONFIG_PV
@@ -4591,114 +4587,6 @@ static int handle_iomem_range(unsigned l
     return err || s > e ? err : _handle_iomem_range(s, e, p);
 }
 
-int xenmem_add_to_physmap_one(
-    struct domain *d,
-    unsigned int space,
-    union add_to_physmap_extra extra,
-    unsigned long idx,
-    gfn_t gpfn)
-{
-    struct page_info *page = NULL;
-    unsigned long gfn = 0 /* gcc ... */, old_gpfn;
-    mfn_t prev_mfn;
-    int rc = 0;
-    mfn_t mfn = INVALID_MFN;
-    p2m_type_t p2mt;
-
-    switch ( space )
-    {
-        case XENMAPSPACE_shared_info:
-            if ( idx == 0 )
-                mfn = virt_to_mfn(d->shared_info);
-            break;
-        case XENMAPSPACE_grant_table:
-            rc = gnttab_map_frame(d, idx, gpfn, &mfn);
-            if ( rc )
-                return rc;
-            break;
-        case XENMAPSPACE_gmfn:
-        {
-            p2m_type_t p2mt;
-
-            gfn = idx;
-            mfn = get_gfn_unshare(d, gfn, &p2mt);
-            /* If the page is still shared, exit early */
-            if ( p2m_is_shared(p2mt) )
-            {
-                put_gfn(d, gfn);
-                return -ENOMEM;
-            }
-            page = get_page_from_mfn(mfn, d);
-            if ( unlikely(!page) )
-                mfn = INVALID_MFN;
-            break;
-        }
-        case XENMAPSPACE_gmfn_foreign:
-            return p2m_add_foreign(d, idx, gfn_x(gpfn), extra.foreign_domid);
-        default:
-            break;
-    }
-
-    if ( mfn_eq(mfn, INVALID_MFN) )
-    {
-        rc = -EINVAL;
-        goto put_both;
-    }
-
-    /* Remove previously mapped page if it was present. */
-    prev_mfn = get_gfn(d, gfn_x(gpfn), &p2mt);
-    if ( mfn_valid(prev_mfn) )
-    {
-        if ( is_special_page(mfn_to_page(prev_mfn)) )
-            /* Special pages are simply unhooked from this phys slot. */
-            rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
-        else if ( !mfn_eq(mfn, prev_mfn) )
-            /* Normal domain memory is freed, to avoid leaking memory. */
-            rc = guest_remove_page(d, gfn_x(gpfn));
-    }
-    /* In the XENMAPSPACE_gmfn case we still hold a ref on the old page. */
-    put_gfn(d, gfn_x(gpfn));
-
-    if ( rc )
-        goto put_both;
-
-    /* Unmap from old location, if any. */
-    old_gpfn = get_gpfn_from_mfn(mfn_x(mfn));
-    ASSERT(!SHARED_M2P(old_gpfn));
-    if ( space == XENMAPSPACE_gmfn && old_gpfn != gfn )
-    {
-        rc = -EXDEV;
-        goto put_both;
-    }
-    if ( old_gpfn != INVALID_M2P_ENTRY )
-        rc = guest_physmap_remove_page(d, _gfn(old_gpfn), mfn, PAGE_ORDER_4K);
-
-    /* Map at new location. */
-    if ( !rc )
-        rc = guest_physmap_add_page(d, gpfn, mfn, PAGE_ORDER_4K);
-
- put_both:
-    /*
-     * In the XENMAPSPACE_gmfn case, we took a ref of the gfn at the top.
-     * We also may need to transfer ownership of the page reference to our
-     * caller.
-     */
-    if ( space == XENMAPSPACE_gmfn )
-    {
-        put_gfn(d, gfn);
-        if ( !rc && extra.ppage )
-        {
-            *extra.ppage = page;
-            page = NULL;
-        }
-    }
-
-    if ( page )
-        put_page(page);
-
-    return rc;
-}
-
 int arch_acquire_resource(struct domain *d, unsigned int type,
                           unsigned int id, unsigned long frame,
                           unsigned int nr_frames, xen_pfn_t mfn_list[])
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -27,6 +27,7 @@
 #include <xen/mem_access.h>
 #include <xen/vm_event.h>
 #include <xen/event.h>
+#include <xen/grant_table.h>
 #include <xen/param.h>
 #include <public/vm_event.h>
 #include <asm/domain.h>
@@ -42,6 +43,10 @@
 
 #include "mm-locks.h"
 
+/* Override macro from asm/page.h to make work with mfn_t */
+#undef virt_to_mfn
+#define virt_to_mfn(v) _mfn(__virt_to_mfn(v))
+
 /* Turn on/off host superpage page table support for hap, default on. */
 bool_t __initdata opt_hap_1gb = 1, __initdata opt_hap_2mb = 1;
 boolean_param("hap_1gb", opt_hap_1gb);
@@ -2535,6 +2540,8 @@ out_p2m_audit:
 }
 #endif /* P2M_AUDIT */
 
+#ifdef CONFIG_HVM
+
 /*
  * Add frame from foreign domain to target domain's physmap. Similar to
  * XENMAPSPACE_gmfn but the frame is foreign being mapped into current,
@@ -2551,8 +2558,8 @@ out_p2m_audit:
  *
  * Returns: 0 ==> success
  */
-int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
-                    unsigned long gpfn, domid_t foreigndom)
+static int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
+                           unsigned long gpfn, domid_t foreigndom)
 {
     p2m_type_t p2mt, p2mt_prev;
     mfn_t prev_mfn, mfn;
@@ -2639,7 +2646,114 @@ int p2m_add_foreign(struct domain *tdom,
     return rc;
 }
 
-#ifdef CONFIG_HVM
+int xenmem_add_to_physmap_one(
+    struct domain *d,
+    unsigned int space,
+    union add_to_physmap_extra extra,
+    unsigned long idx,
+    gfn_t gpfn)
+{
+    struct page_info *page = NULL;
+    unsigned long gfn = 0 /* gcc ... */, old_gpfn;
+    mfn_t prev_mfn;
+    int rc = 0;
+    mfn_t mfn = INVALID_MFN;
+    p2m_type_t p2mt;
+
+    switch ( space )
+    {
+        case XENMAPSPACE_shared_info:
+            if ( idx == 0 )
+                mfn = virt_to_mfn(d->shared_info);
+            break;
+        case XENMAPSPACE_grant_table:
+            rc = gnttab_map_frame(d, idx, gpfn, &mfn);
+            if ( rc )
+                return rc;
+            break;
+        case XENMAPSPACE_gmfn:
+        {
+            p2m_type_t p2mt;
+
+            gfn = idx;
+            mfn = get_gfn_unshare(d, gfn, &p2mt);
+            /* If the page is still shared, exit early */
+            if ( p2m_is_shared(p2mt) )
+            {
+                put_gfn(d, gfn);
+                return -ENOMEM;
+            }
+            page = get_page_from_mfn(mfn, d);
+            if ( unlikely(!page) )
+                mfn = INVALID_MFN;
+            break;
+        }
+        case XENMAPSPACE_gmfn_foreign:
+            return p2m_add_foreign(d, idx, gfn_x(gpfn), extra.foreign_domid);
+        default:
+            break;
+    }
+
+    if ( mfn_eq(mfn, INVALID_MFN) )
+    {
+        rc = -EINVAL;
+        goto put_both;
+    }
+
+    /* Remove previously mapped page if it was present. */
+    prev_mfn = get_gfn(d, gfn_x(gpfn), &p2mt);
+    if ( mfn_valid(prev_mfn) )
+    {
+        if ( is_special_page(mfn_to_page(prev_mfn)) )
+            /* Special pages are simply unhooked from this phys slot. */
+            rc = guest_physmap_remove_page(d, gpfn, prev_mfn, PAGE_ORDER_4K);
+        else if ( !mfn_eq(mfn, prev_mfn) )
+            /* Normal domain memory is freed, to avoid leaking memory. */
+            rc = guest_remove_page(d, gfn_x(gpfn));
+    }
+    /* In the XENMAPSPACE_gmfn case we still hold a ref on the old page. */
+    put_gfn(d, gfn_x(gpfn));
+
+    if ( rc )
+        goto put_both;
+
+    /* Unmap from old location, if any. */
+    old_gpfn = get_gpfn_from_mfn(mfn_x(mfn));
+    ASSERT(!SHARED_M2P(old_gpfn));
+    if ( space == XENMAPSPACE_gmfn && old_gpfn != gfn )
+    {
+        rc = -EXDEV;
+        goto put_both;
+    }
+    if ( old_gpfn != INVALID_M2P_ENTRY )
+        rc = guest_physmap_remove_page(d, _gfn(old_gpfn), mfn, PAGE_ORDER_4K);
+
+    /* Map at new location. */
+    if ( !rc )
+        rc = guest_physmap_add_page(d, gpfn, mfn, PAGE_ORDER_4K);
+
+ put_both:
+    /*
+     * In the XENMAPSPACE_gmfn case, we took a ref of the gfn at the top.
+     * We also may need to transfer ownership of the page reference to our
+     * caller.
+     */
+    if ( space == XENMAPSPACE_gmfn )
+    {
+        put_gfn(d, gfn);
+        if ( !rc && extra.ppage )
+        {
+            *extra.ppage = page;
+            page = NULL;
+        }
+    }
+
+    if ( page )
+        put_page(page);
+
+    return rc;
+}
+
 /*
  * Set/clear the #VE suppress bit for a page.  Only available on VMX.
  */
@@ -2792,7 +2906,8 @@ int p2m_set_altp2m_view_visibility(struc
 
     return rc;
 }
-#endif
+
+#endif /* CONFIG_HVM */
 
 /*
  * Local variables:
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -661,10 +661,6 @@ int set_identity_p2m_entry(struct domain
                            p2m_access_t p2ma, unsigned int flag);
 int clear_identity_p2m_entry(struct domain *d, unsigned long gfn);
 
-/* Add foreign mapping to the guest's p2m table. */
-int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
-                    unsigned long gpfn, domid_t foreign_domid);
-
 /* 
  * Populate-on-demand
  */


