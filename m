Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8F635C846
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109170.208348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxD4-0004cC-PP; Mon, 12 Apr 2021 14:06:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109170.208348; Mon, 12 Apr 2021 14:06:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxD4-0004bp-MA; Mon, 12 Apr 2021 14:06:38 +0000
Received: by outflank-mailman (input) for mailman id 109170;
 Mon, 12 Apr 2021 14:06:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxD2-0004bj-Kp
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:06:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2c8750e-5202-4437-a2e3-2945403f8ef4;
 Mon, 12 Apr 2021 14:06:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16245AF95;
 Mon, 12 Apr 2021 14:06:35 +0000 (UTC)
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
X-Inumbo-ID: f2c8750e-5202-4437-a2e3-2945403f8ef4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8uQ/wa7eMeHMjVMRgN6IKy+IwI8MpBIUTSpk+7O8K0I=;
	b=RB5oQlm4pj3/Bdb62wLXgfUZbOofUqr8OW8w78UzEsCkMZubMlRn0MEqOsXfOV0YY1LFf0
	Q3pmhjXDgEheMBg2++lQAPmd2NVPotlg1OwdQYHxddHU528ISkLTwI/2vWYRuko4JEVazE
	r+mpp5BuIRaA7PV+juDfpkwS67EouoM=
Subject: [PATCH v2 02/12] x86/p2m: {,un}map_mmio_regions() are HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <7f8ca70d-8bbe-bd5d-533a-c5ea81dc91a2@suse.com>
Date: Mon, 12 Apr 2021 16:06:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Mirror the "translated" check the functions do to do_domctl(), allowing
the calls to be DCEd by the compiler. Add ASSERT_UNREACHABLE() to the
original checks.

Also arrange for {set,clear}_mmio_p2m_entry() and
{set,clear}_identity_p2m_entry() to respectively live next to each
other, such that clear_mmio_p2m_entry() can also be covered by the
#ifdef already covering set_mmio_p2m_entry().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Fix build.
---
Arguably the original checks, returning success, could also be dropped
at this point.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1352,52 +1352,6 @@ int set_mmio_p2m_entry(struct domain *d,
                                p2m_get_hostp2m(d)->default_access);
 }
 
-#endif /* CONFIG_HVM */
-
-int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
-                           p2m_access_t p2ma, unsigned int flag)
-{
-    p2m_type_t p2mt;
-    p2m_access_t a;
-    gfn_t gfn = _gfn(gfn_l);
-    mfn_t mfn;
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    int ret;
-
-    if ( !paging_mode_translate(p2m->domain) )
-    {
-        if ( !is_iommu_enabled(d) )
-            return 0;
-        return iommu_legacy_map(d, _dfn(gfn_l), _mfn(gfn_l),
-                                1ul << PAGE_ORDER_4K,
-                                IOMMUF_readable | IOMMUF_writable);
-    }
-
-    gfn_lock(p2m, gfn, 0);
-
-    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
-
-    if ( p2mt == p2m_invalid || p2mt == p2m_mmio_dm )
-        ret = p2m_set_entry(p2m, gfn, _mfn(gfn_l), PAGE_ORDER_4K,
-                            p2m_mmio_direct, p2ma);
-    else if ( mfn_x(mfn) == gfn_l && p2mt == p2m_mmio_direct && a == p2ma )
-        ret = 0;
-    else
-    {
-        if ( flag & XEN_DOMCTL_DEV_RDM_RELAXED )
-            ret = 0;
-        else
-            ret = -EBUSY;
-        printk(XENLOG_G_WARNING
-               "Cannot setup identity map d%d:%lx,"
-               " gfn already mapped to %lx.\n",
-               d->domain_id, gfn_l, mfn_x(mfn));
-    }
-
-    gfn_unlock(p2m, gfn, 0);
-    return ret;
-}
-
 /*
  * Returns:
  *    0        for success
@@ -1447,6 +1401,52 @@ int clear_mmio_p2m_entry(struct domain *
     return rc;
 }
 
+#endif /* CONFIG_HVM */
+
+int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
+                           p2m_access_t p2ma, unsigned int flag)
+{
+    p2m_type_t p2mt;
+    p2m_access_t a;
+    gfn_t gfn = _gfn(gfn_l);
+    mfn_t mfn;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int ret;
+
+    if ( !paging_mode_translate(p2m->domain) )
+    {
+        if ( !is_iommu_enabled(d) )
+            return 0;
+        return iommu_legacy_map(d, _dfn(gfn_l), _mfn(gfn_l),
+                                1ul << PAGE_ORDER_4K,
+                                IOMMUF_readable | IOMMUF_writable);
+    }
+
+    gfn_lock(p2m, gfn, 0);
+
+    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
+
+    if ( p2mt == p2m_invalid || p2mt == p2m_mmio_dm )
+        ret = p2m_set_entry(p2m, gfn, _mfn(gfn_l), PAGE_ORDER_4K,
+                            p2m_mmio_direct, p2ma);
+    else if ( mfn_x(mfn) == gfn_l && p2mt == p2m_mmio_direct && a == p2ma )
+        ret = 0;
+    else
+    {
+        if ( flag & XEN_DOMCTL_DEV_RDM_RELAXED )
+            ret = 0;
+        else
+            ret = -EBUSY;
+        printk(XENLOG_G_WARNING
+               "Cannot setup identity map d%d:%lx,"
+               " gfn already mapped to %lx.\n",
+               d->domain_id, gfn_l, mfn_x(mfn));
+    }
+
+    gfn_unlock(p2m, gfn, 0);
+    return ret;
+}
+
 int clear_identity_p2m_entry(struct domain *d, unsigned long gfn_l)
 {
     p2m_type_t p2mt;
@@ -1892,6 +1892,8 @@ void *map_domain_gfn(struct p2m_domain *
     return map_domain_page(*mfn);
 }
 
+#ifdef CONFIG_HVM
+
 static unsigned int mmio_order(const struct domain *d,
                                unsigned long start_fn, unsigned long nr)
 {
@@ -1932,7 +1934,10 @@ int map_mmio_regions(struct domain *d,
     unsigned int iter, order;
 
     if ( !paging_mode_translate(d) )
+    {
+        ASSERT_UNREACHABLE();
         return 0;
+    }
 
     for ( iter = i = 0; i < nr && iter < MAP_MMIO_MAX_ITER;
           i += 1UL << order, ++iter )
@@ -1964,7 +1969,10 @@ int unmap_mmio_regions(struct domain *d,
     unsigned int iter, order;
 
     if ( !paging_mode_translate(d) )
+    {
+        ASSERT_UNREACHABLE();
         return 0;
+    }
 
     for ( iter = i = 0; i < nr && iter < MAP_MMIO_MAX_ITER;
           i += 1UL << order, ++iter )
@@ -1986,8 +1994,6 @@ int unmap_mmio_regions(struct domain *d,
     return i == nr ? 0 : i ?: ret;
 }
 
-#ifdef CONFIG_HVM
-
 int altp2m_get_effective_entry(struct p2m_domain *ap2m, gfn_t gfn, mfn_t *mfn,
                                p2m_type_t *t, p2m_access_t *a,
                                bool prepopulate)
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -750,6 +750,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
         if ( ret )
             break;
 
+        if ( !paging_mode_translate(d) )
+            break;
+
         if ( add )
         {
             printk(XENLOG_G_DEBUG
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -678,11 +678,19 @@ int p2m_finish_type_change(struct domain
 int p2m_is_logdirty_range(struct p2m_domain *, unsigned long start,
                           unsigned long end);
 
+#ifdef CONFIG_HVM
 /* Set mmio addresses in the p2m table (for pass-through) */
 int set_mmio_p2m_entry(struct domain *d, gfn_t gfn, mfn_t mfn,
                        unsigned int order);
 int clear_mmio_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn,
                          unsigned int order);
+#else
+static inline int clear_mmio_p2m_entry(struct domain *d, unsigned long gfn,
+                                       mfn_t mfn, unsigned int order)
+{
+    return -EIO;
+}
+#endif
 
 /* Set identity addresses in the p2m table (for pass-through) */
 int set_identity_p2m_entry(struct domain *d, unsigned long gfn,


