Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7A02DB152
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:27:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54459.94620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDAB-0003gW-VZ; Tue, 15 Dec 2020 16:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54459.94620; Tue, 15 Dec 2020 16:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDAB-0003g4-Re; Tue, 15 Dec 2020 16:26:59 +0000
Received: by outflank-mailman (input) for mailman id 54459;
 Tue, 15 Dec 2020 16:26:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpDA9-0003fc-IV
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:26:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de65e034-7a0b-4ccd-ba60-e84954bbfca2;
 Tue, 15 Dec 2020 16:26:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B780BAC7F;
 Tue, 15 Dec 2020 16:26:55 +0000 (UTC)
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
X-Inumbo-ID: de65e034-7a0b-4ccd-ba60-e84954bbfca2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608049615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kaeqho8fy5FXxUiWuLYiGf7U8sN4JWrQrpqcg1h2skY=;
	b=K9lxTqpKguORYQXiBxUwhPQZGrvIIxkDYyJk4gyoviYtra9LInEBSrYOIDlutm8e2eieOS
	jHaOad42v+3nmmbihmFKMOP4K9Mx86qeQF3uypgGm41x7Pe49nBvEO9cu78QVF4t7QZU+L
	PQdYOrouu7YcmzzZGqtYadXnwtn3soY=
Subject: [PATCH 4/6] x86/p2m: {,un}map_mmio_regions() are HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
Message-ID: <84bd7740-39f5-fb2a-aeec-4ce1cfba631c@suse.com>
Date: Tue, 15 Dec 2020 17:26:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
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
Arguably the original checks, returning success, could also be dropped
at this point.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1344,52 +1344,6 @@ int set_mmio_p2m_entry(struct domain *d,
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
@@ -1439,6 +1393,52 @@ int clear_mmio_p2m_entry(struct domain *
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
@@ -1868,6 +1868,8 @@ void *map_domain_gfn(struct p2m_domain *
     return map_domain_page(*mfn);
 }
 
+#ifdef CONFIG_HVM
+
 static unsigned int mmio_order(const struct domain *d,
                                unsigned long start_fn, unsigned long nr)
 {
@@ -1908,7 +1910,10 @@ int map_mmio_regions(struct domain *d,
     unsigned int iter, order;
 
     if ( !paging_mode_translate(d) )
+    {
+        ASSERT_UNREACHABLE();
         return 0;
+    }
 
     for ( iter = i = 0; i < nr && iter < MAP_MMIO_MAX_ITER;
           i += 1UL << order, ++iter )
@@ -1940,7 +1945,10 @@ int unmap_mmio_regions(struct domain *d,
     unsigned int iter, order;
 
     if ( !paging_mode_translate(d) )
+    {
+        ASSERT_UNREACHABLE();
         return 0;
+    }
 
     for ( iter = i = 0; i < nr && iter < MAP_MMIO_MAX_ITER;
           i += 1UL << order, ++iter )
@@ -1962,8 +1970,6 @@ int unmap_mmio_regions(struct domain *d,
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


