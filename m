Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705B71B2E8F
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 19:48:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQwzp-0006vd-IX; Tue, 21 Apr 2020 17:47:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=90sK=6F=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jQwzn-0006vT-Qz
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 17:47:43 +0000
X-Inumbo-ID: 31087b56-83f8-11ea-83d8-bc764e2007e4
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31087b56-83f8-11ea-83d8-bc764e2007e4;
 Tue, 21 Apr 2020 17:47:40 +0000 (UTC)
IronPort-SDR: JE9TpcU4QlJWKqwxr3OFG/YzqwowviewmsH2SbADTjAZr9GfmOh29EKEvNX6DkctmvSHHrwjbk
 1qASJl1YjMGA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 10:47:36 -0700
IronPort-SDR: wBVR3z0/sLsC3KSTsMXGmFRUIaGWcXVxAM9deXXi52CWdyeipYad+yI1YjlN/yyoemnBubAEqu
 cC+rF4Uig2GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,411,1580803200"; d="scan'208";a="300680740"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.17.85])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2020 10:47:35 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v16 1/3] mem_sharing: fix sharability check during fork reset
Date: Tue, 21 Apr 2020 10:47:23 -0700
Message-Id: <8eb756357cb6d9222ed7ec4c0af58473160361a1.1587490511.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1587490511.git.tamas.lengyel@intel.com>
References: <cover.1587490511.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

For this we extend the existing nominate_page and page_make_sharable functions
to perform a validation-only run without actually converting the page.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
 xen/arch/x86/mm/mem_sharing.c | 79 ++++++++++++++++++++++-------------
 1 file changed, 50 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index e572e9e39d..d8ed660abb 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -633,31 +633,35 @@ unsigned int mem_sharing_get_nr_shared_mfns(void)
 /* Functions that change a page's type and ownership */
 static int page_make_sharable(struct domain *d,
                               struct page_info *page,
-                              int expected_refcnt)
+                              int expected_refcnt,
+                              bool validate_only)
 {
-    bool_t drop_dom_ref;
+    int rc;
+    bool drop_dom_ref = false;
 
-    spin_lock(&d->page_alloc_lock);
+    /* caller already has the lock when validating only */
+    if ( !validate_only )
+        spin_lock(&d->page_alloc_lock);
 
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
@@ -666,20 +670,31 @@ static int page_make_sharable(struct domain *d,
      */
     if ( page->count_info != (PGC_allocated | (2 + expected_refcnt)) )
     {
-        spin_unlock(&d->page_alloc_lock);
         /* Return type count back to zero */
         put_page_and_type(page);
-        return -E2BIG;
+        rc = -E2BIG;
+        goto out;
+    }
+
+    rc = 0;
+
+    if ( validate_only )
+    {
+        put_page_and_type(page);
+        goto out;
     }
 
     page_set_owner(page, dom_cow);
     drop_dom_ref = !domain_adjust_tot_pages(d, -1);
     page_list_del(page, &d->page_list);
-    spin_unlock(&d->page_alloc_lock);
 
+out:
+    if ( !validate_only )
+        spin_unlock(&d->page_alloc_lock);
     if ( drop_dom_ref )
         put_domain(d);
-    return 0;
+
+    return rc;
 }
 
 static int page_make_private(struct domain *d, struct page_info *page)
@@ -809,8 +824,8 @@ static int debug_gref(struct domain *d, grant_ref_t ref)
     return debug_gfn(d, gfn);
 }
 
-static int nominate_page(struct domain *d, gfn_t gfn,
-                         int expected_refcnt, shr_handle_t *phandle)
+static int nominate_page(struct domain *d, gfn_t gfn, int expected_refcnt,
+                         bool validate_only, shr_handle_t *phandle)
 {
     struct p2m_domain *hp2m = p2m_get_hostp2m(d);
     p2m_type_t p2mt;
@@ -879,8 +894,8 @@ static int nominate_page(struct domain *d, gfn_t gfn,
     }
 
     /* Try to convert the mfn to the sharable type */
-    ret = page_make_sharable(d, page, expected_refcnt);
-    if ( ret )
+    ret = page_make_sharable(d, page, expected_refcnt, validate_only);
+    if ( ret || validate_only )
         goto out;
 
     /*
@@ -1392,13 +1407,13 @@ static int range_share(struct domain *d, struct domain *cd,
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
 
@@ -1476,7 +1491,7 @@ int mem_sharing_fork_page(struct domain *d, gfn_t gfn, bool unsharing)
         /* For read-only accesses we just add a shared entry to the physmap */
         while ( parent )
         {
-            if ( !(rc = nominate_page(parent, gfn, 0, &handle)) )
+            if ( !(rc = nominate_page(parent, gfn, 0, false, &handle)) )
                 break;
 
             parent = parent->parent;
@@ -1773,16 +1788,22 @@ static int mem_sharing_fork_reset(struct domain *d, struct domain *pd)
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
 
         /* take an extra reference or just skip if can't for whatever reason */
@@ -1836,7 +1857,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
     {
         shr_handle_t handle;
 
-        rc = nominate_page(d, _gfn(mso.u.nominate.u.gfn), 0, &handle);
+        rc = nominate_page(d, _gfn(mso.u.nominate.u.gfn), 0, false, &handle);
         mso.u.nominate.handle = handle;
     }
     break;
@@ -1851,7 +1872,7 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
         if ( rc < 0 )
             goto out;
 
-        rc = nominate_page(d, gfn, 3, &handle);
+        rc = nominate_page(d, gfn, 3, false, &handle);
         mso.u.nominate.handle = handle;
     }
     break;
-- 
2.20.1


