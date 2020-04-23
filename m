Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A171B5F3B
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 17:31:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRdoE-0004Rv-0c; Thu, 23 Apr 2020 15:30:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1pl3=6H=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jRdoC-0004Rp-BL
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 15:30:36 +0000
X-Inumbo-ID: 5f0cea84-8577-11ea-9397-12813bfff9fa
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f0cea84-8577-11ea-9397-12813bfff9fa;
 Thu, 23 Apr 2020 15:30:33 +0000 (UTC)
IronPort-SDR: TajcVyTyurXD5NgXuYW9gSpJe6v2ZnVrBZ428hQpCskSx7luCpOCjrLIhfHXs5BC5H0ZoZFfim
 65bPhmAel3Nw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2020 08:30:31 -0700
IronPort-SDR: UPqpmh0ds16JMrdegGyL52NsidJa1OQ9CTOgRFycLgcjvHQejmILNSuTFj7o7uct+rqpgT0KY+
 JpoXWaq3RFPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,307,1583222400"; d="scan'208";a="292311789"
Received: from nsheikh-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.208.245])
 by orsmga008.jf.intel.com with ESMTP; 23 Apr 2020 08:30:30 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v17 1/2] mem_sharing: fix sharability check during fork reset
Date: Thu, 23 Apr 2020 08:30:06 -0700
Message-Id: <70ea4889e30ed35760329331ddfeb279fcd80786.1587655725.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When resetting a VM fork we ought to only remove pages that were allocated for
the fork during it's execution and the contents copied over from the parent.
This can be determined if the page is sharable as special pages used by the
fork for other purposes will not pass this test. Unfortunately during the fork
reset loop we only partially check whether that's the case. A page's type may
indicate it is sharable (pass p2m_is_sharable) but that's not a sufficient
check by itself. All checks that are normally performed before a page is
converted to the sharable type need to be performed to avoid removing pages
from the p2m that may be used for other purposes. For example, currently the
reset loop also removes the vcpu info pages from the p2m, potentially putting
the guest into infinite page-fault loops.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v17: Changes based on feedback from Roger
---
 xen/arch/x86/mm/mem_sharing.c | 83 ++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 36 deletions(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index bb74595351..344a5bfb3d 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -633,31 +633,33 @@ unsigned int mem_sharing_get_nr_shared_mfns(void)
 /* Functions that change a page's type and ownership */
 static int page_make_sharable(struct domain *d,
                               struct page_info *page,
-                              int expected_refcnt)
+                              unsigned int expected_refcnt,
+                              bool validate_only)
 {
-    bool_t drop_dom_ref;
+    int rc = 0;
+    bool drop_dom_ref = false;
 
-    spin_lock(&d->page_alloc_lock);
+    spin_lock_recursive(&d->page_alloc_lock);
 
     if ( d->is_dying )
     {
-        spin_unlock(&d->page_alloc_lock);
-        return -EBUSY;
+        rc = -EBUSY;
+        goto out;
     }
 
     /* Change page type and count atomically */
     if ( !get_page_and_type(page, d, PGT_shared_page) )
     {
-        spin_unlock(&d->page_alloc_lock);
-        return -EINVAL;
+        rc = -EINVAL;
+        goto out;
     }
 
     /* Check it wasn't already sharable and undo if it was */
     if ( (page->u.inuse.type_info & PGT_count_mask) != 1 )
     {
-        spin_unlock(&d->page_alloc_lock);
         put_page_and_type(page);
-        return -EEXIST;
+        rc = -EEXIST;
+        goto out;
     }
 
     /*
@@ -666,20 +668,26 @@ static int page_make_sharable(struct domain *d,
      */
     if ( page->count_info != (PGC_allocated | (2 + expected_refcnt)) )
     {
-        spin_unlock(&d->page_alloc_lock);
         /* Return type count back to zero */
         put_page_and_type(page);
-        return -E2BIG;
+        rc = -E2BIG;
+        goto out;
     }
 
-    page_set_owner(page, dom_cow);
-    drop_dom_ref = !domain_adjust_tot_pages(d, -1);
-    page_list_del(page, &d->page_list);
-    spin_unlock(&d->page_alloc_lock);
+    if ( !validate_only )
+    {
+        page_set_owner(page, dom_cow);
+        drop_dom_ref = !domain_adjust_tot_pages(d, -1);
+        page_list_del(page, &d->page_list);
+    }
+
+out:
+    spin_unlock_recursive(&d->page_alloc_lock);
 
     if ( drop_dom_ref )
         put_domain(d);
-    return 0;
+
+    return rc;
 }
 
 static int page_make_private(struct domain *d, struct page_info *page)
@@ -810,7 +818,8 @@ static int debug_gref(struct domain *d, grant_ref_t ref)
 }
 
 static int nominate_page(struct domain *d, gfn_t gfn,
-                         int expected_refcnt, shr_handle_t *phandle)
+                         unsigned int expected_refcnt, bool validate_only,
+                         shr_handle_t *phandle)
 {
     struct p2m_domain *hp2m = p2m_get_hostp2m(d);
     p2m_type_t p2mt;
@@ -879,8 +888,8 @@ static int nominate_page(struct domain *d, gfn_t gfn,
     }
 
     /* Try to convert the mfn to the sharable type */
-    ret = page_make_sharable(d, page, expected_refcnt);
-    if ( ret )
+    ret = page_make_sharable(d, page, expected_refcnt, validate_only);
+    if ( ret || validate_only )
         goto out;
 
     /*
@@ -1392,13 +1401,13 @@ static int range_share(struct domain *d, struct domain *cd,
          * We only break out if we run out of memory as individual pages may
          * legitimately be unsharable and we just want to skip over those.
          */
-        rc = nominate_page(d, _gfn(start), 0, &sh);
+        rc = nominate_page(d, _gfn(start), 0, false, &sh);
         if ( rc == -ENOMEM )
             break;
 
         if ( !rc )
         {
-            rc = nominate_page(cd, _gfn(start), 0, &ch);
+            rc = nominate_page(cd, _gfn(start), 0, false, &ch);
             if ( rc == -ENOMEM )
                 break;
 
@@ -1478,7 +1487,7 @@ int mem_sharing_fork_page(struct domain *d, gfn_t gfn, bool unsharing)
         /* For read-only accesses we just add a shared entry to the physmap */
         while ( parent )
         {
-            if ( !(rc = nominate_page(parent, gfn, 0, &handle)) )
+            if ( !(rc = nominate_page(parent, gfn, 0, false, &handle)) )
                 break;
 
             parent = parent->parent;
@@ -1775,20 +1784,22 @@ static int mem_sharing_fork_reset(struct domain *d, struct domain *pd)
     spin_lock_recursive(&d->page_alloc_lock);
     page_list_for_each_safe(page, tmp, &d->page_list)
     {
-        p2m_type_t p2mt;
-        p2m_access_t p2ma;
+        shr_handle_t sh;
         mfn_t mfn = page_to_mfn(page);
         gfn_t gfn = mfn_to_gfn(d, mfn);
 
-        mfn = __get_gfn_type_access(p2m, gfn_x(gfn), &p2mt, &p2ma,
-                                    0, NULL, false);
-
-        /* only reset pages that are sharable */
-        if ( !p2m_is_sharable(p2mt) )
-            continue;
-
-        /* take an extra reference or just skip if can't for whatever reason */
-        if ( !get_page(page, d) )
+        /*
+         * We only want to remove pages from the fork here that were copied
+         * from the parent but could be potentially re-populated using memory
+         * sharing after the reset. These pages all must be regular pages with
+         * no extra reference held to them, thus should be possible to make
+         * them sharable. Unfortunately p2m_is_sharable check is not sufficient
+         * to test this as it doesn't check the page's reference count. We thus
+         * check whether the page is convertable to the shared type using
+         * nominate_page. In case the page is already shared (ie. a share
+         * handle is returned) then we don't remove it.
+         */
+        if ( (rc = nominate_page(d, gfn, 0, true, &sh)) || sh )
             continue;
 
         /* forked memory is 4k, not splitting large pages so this must work */
@@ -1797,7 +1808,7 @@ static int mem_sharing_fork_reset(struct domain *d, struct domain *pd)
         ASSERT(!rc);
 
         put_page_alloc_ref(page);
-        put_page(page);
+        put_page_and_type(page);
     }
     spin_unlock_recursive(&d->page_alloc_lock);
 
@@ -1839,7 +1850,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
     {
         shr_handle_t handle;
 
-        rc = nominate_page(d, _gfn(mso.u.nominate.u.gfn), 0, &handle);
+        rc = nominate_page(d, _gfn(mso.u.nominate.u.gfn), 0, false, &handle);
         mso.u.nominate.handle = handle;
     }
     break;
@@ -1854,7 +1865,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         if ( rc < 0 )
             goto out;
 
-        rc = nominate_page(d, gfn, 3, &handle);
+        rc = nominate_page(d, gfn, 3, false, &handle);
         mso.u.nominate.handle = handle;
     }
     break;
-- 
2.20.1


