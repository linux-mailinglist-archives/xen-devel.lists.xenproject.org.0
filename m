Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C0C35C86B
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109207.208443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxJb-0006IL-DX; Mon, 12 Apr 2021 14:13:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109207.208443; Mon, 12 Apr 2021 14:13:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxJb-0006I1-9y; Mon, 12 Apr 2021 14:13:23 +0000
Received: by outflank-mailman (input) for mailman id 109207;
 Mon, 12 Apr 2021 14:13:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxJZ-0006Hs-MB
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:13:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e732afb0-b721-44b7-97b4-18aede15e640;
 Mon, 12 Apr 2021 14:13:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1FDB5AF95;
 Mon, 12 Apr 2021 14:13:20 +0000 (UTC)
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
X-Inumbo-ID: e732afb0-b721-44b7-97b4-18aede15e640
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618236800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gYXEbMRpB/ru7Klc+cGqatrS8eIXTxopFHC0OSl4Opk=;
	b=d9Yaxg/9DIR+lgT8j3ISwrPUmAYtKR94BCxdhLTprHSq8AeK42dUhE4sT4+vOq+dBwhuQP
	TnpTb4VAW6Ae8TAnQPFl3sWWHak2kDB7z2vafKC9AjszdLsq5TdA/fX6FBUvXSkTuzmv+g
	YKBt6dfCjXM+9cPq8YmbYOFByT7YjII=
Subject: [PATCH v2 10/12] x86/p2m: {get,set}_entry hooks and p2m-pt.c are
 HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Message-ID: <fdcdb91f-87ee-084a-da55-b6ef560d5508@suse.com>
Date: Mon, 12 Apr 2021 16:13:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3cf73378-b9d6-0eca-12b6-0f628518bebf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

With the hooks no longer needing setting, p2m_pt_init() degenerates to
(about) nothing when !HVM. As a result, p2m-pt.c doesn't need building
anymore in this case, as long as p2m_pt_init() has proper surrogates put
in place.

Unfortunately this means some new #ifdef-ary in p2m.c, but the mid-term
plan there is to get rid of (almost) all of it by splitting out the then
hopefully very few remaining non-HVM pieces.

While the movement of the paging_mode_translate() check from
p2m_remove_page() to guest_physmap_remove_page() may not be strictly
necessary anymore (it was in an early version of this change), it looks
more logical to live in the latter function, allowing to avoid acquiring
the lock in the PV case. All other callers of p2m_remove_page() already
have such a check anyway (in the altp2m case up the call stack).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -7,8 +7,8 @@ obj-$(CONFIG_SHADOW_PAGING) += guest_wal
 obj-$(CONFIG_MEM_ACCESS) += mem_access.o
 obj-$(CONFIG_MEM_PAGING) += mem_paging.o
 obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
-obj-y += p2m.o p2m-pt.o
-obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o
+obj-y += p2m.o
+obj-$(CONFIG_HVM) += p2m-ept.o p2m-pod.o p2m-pt.o
 obj-y += paging.o
 
 guest_walk_%.o: guest_walk.c Makefile
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -494,8 +494,10 @@ mfn_t __get_gfn_type_access(struct p2m_d
                     p2m_type_t *t, p2m_access_t *a, p2m_query_t q,
                     unsigned int *page_order, bool_t locked)
 {
+#ifdef CONFIG_HVM
     mfn_t mfn;
     gfn_t gfn = _gfn(gfn_l);
+#endif
 
     /* Unshare makes no sense withuot populate. */
     if ( q & P2M_UNSHARE )
@@ -509,6 +511,7 @@ mfn_t __get_gfn_type_access(struct p2m_d
         return _mfn(gfn_l);
     }
 
+#ifdef CONFIG_HVM
     if ( locked )
         /* Grab the lock here, don't release until put_gfn */
         gfn_lock(p2m, gfn, 0);
@@ -542,6 +545,7 @@ mfn_t __get_gfn_type_access(struct p2m_d
     }
 
     return mfn;
+#endif
 }
 
 void __put_gfn(struct p2m_domain *p2m, unsigned long gfn)
@@ -620,6 +624,7 @@ struct page_info *p2m_get_page_from_gfn(
     return page;
 }
 
+#ifdef CONFIG_HVM
 /* Returns: 0 for success, -errno for failure */
 int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                   unsigned int page_order, p2m_type_t p2mt, p2m_access_t p2ma)
@@ -659,6 +664,7 @@ int p2m_set_entry(struct p2m_domain *p2m
 
     return rc;
 }
+#endif
 
 mfn_t p2m_alloc_ptp(struct p2m_domain *p2m, unsigned int level)
 {
@@ -777,6 +783,8 @@ void p2m_final_teardown(struct domain *d
     p2m_teardown_hostp2m(d);
 }
 
+#ifdef CONFIG_HVM
+
 static int __must_check
 p2m_remove_page(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                 unsigned int page_order)
@@ -785,10 +793,6 @@ p2m_remove_page(struct p2m_domain *p2m,
     p2m_type_t t;
     p2m_access_t a;
 
-    /* IOMMU for PV guests is handled in get_page_type() and put_page(). */
-    if ( !paging_mode_translate(p2m->domain) )
-        return 0;
-
     ASSERT(gfn_locked_by_me(p2m, gfn));
     P2M_DEBUG("removing gfn=%#lx mfn=%#lx\n", gfn_x(gfn), mfn_x(mfn));
 
@@ -829,6 +833,10 @@ guest_physmap_remove_page(struct domain
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
 
+    /* IOMMU for PV guests is handled in get_page_type() and put_page(). */
+    if ( !paging_mode_translate(d) )
+        return 0;
+
     gfn_lock(p2m, gfn, page_order);
     rc = p2m_remove_page(p2m, gfn, mfn, page_order);
     gfn_unlock(p2m, gfn, page_order);
@@ -836,6 +844,8 @@ guest_physmap_remove_page(struct domain
     return rc;
 }
 
+#endif /* CONFIG_HVM */
+
 int
 guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
                        unsigned int page_order)
@@ -1400,14 +1410,16 @@ int clear_mmio_p2m_entry(struct domain *
 int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
                            p2m_access_t p2ma, unsigned int flag)
 {
+#ifdef CONFIG_HVM
     p2m_type_t p2mt;
     p2m_access_t a;
     gfn_t gfn = _gfn(gfn_l);
     mfn_t mfn;
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int ret;
+#endif
 
-    if ( !paging_mode_translate(p2m->domain) )
+    if ( !paging_mode_translate(d) )
     {
         if ( !is_iommu_enabled(d) )
             return 0;
@@ -1416,6 +1428,7 @@ int set_identity_p2m_entry(struct domain
                                 IOMMUF_readable | IOMMUF_writable);
     }
 
+#ifdef CONFIG_HVM
     gfn_lock(p2m, gfn, 0);
 
     mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
@@ -1439,16 +1452,19 @@ int set_identity_p2m_entry(struct domain
 
     gfn_unlock(p2m, gfn, 0);
     return ret;
+#endif
 }
 
 int clear_identity_p2m_entry(struct domain *d, unsigned long gfn_l)
 {
+#ifdef CONFIG_HVM
     p2m_type_t p2mt;
     p2m_access_t a;
     gfn_t gfn = _gfn(gfn_l);
     mfn_t mfn;
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int ret;
+#endif
 
     if ( !paging_mode_translate(d) )
     {
@@ -1457,6 +1473,7 @@ int clear_identity_p2m_entry(struct doma
         return iommu_legacy_unmap(d, _dfn(gfn_l), 1ul << PAGE_ORDER_4K);
     }
 
+#ifdef CONFIG_HVM
     gfn_lock(p2m, gfn, 0);
 
     mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
@@ -1476,6 +1493,7 @@ int clear_identity_p2m_entry(struct doma
     }
 
     return ret;
+#endif
 }
 
 #ifdef CONFIG_MEM_SHARING
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -324,7 +324,6 @@ p2m_next_level(struct p2m_domain *p2m, v
     return rc;
 }
 
-#ifdef CONFIG_HVM
 /*
  * Mark (via clearing the U flag) as needing P2M type re-calculation all valid
  * present entries at the targeted level for the passed in GFN range, which is
@@ -393,7 +392,6 @@ static int p2m_pt_set_recalc_range(struc
 
     return err;
 }
-#endif /* CONFIG_HVM */
 
 /*
  * Handle possibly necessary P2M type re-calculation (U flag clear for a
@@ -932,8 +930,6 @@ pod_retry_l1:
     return (p2m_is_valid(*t) || p2m_is_any_ram(*t)) ? mfn : INVALID_MFN;
 }
 
-#ifdef CONFIG_HVM
-
 static void p2m_pt_change_entry_type_global(struct p2m_domain *p2m,
                                             p2m_type_t ot, p2m_type_t nt)
 {
@@ -1015,8 +1011,6 @@ static int p2m_pt_change_entry_type_rang
     return err;
 }
 
-#endif /* CONFIG_HVM */
-
 #if P2M_AUDIT
 static long p2m_pt_audit_p2m(struct p2m_domain *p2m)
 {
@@ -1173,11 +1167,9 @@ void p2m_pt_init(struct p2m_domain *p2m)
 {
     p2m->set_entry = p2m_pt_set_entry;
     p2m->get_entry = p2m_pt_get_entry;
-#ifdef CONFIG_HVM
     p2m->recalc = do_recalc;
     p2m->change_entry_type_global = p2m_pt_change_entry_type_global;
     p2m->change_entry_type_range = p2m_pt_change_entry_type_range;
-#endif
 
     /* Still too early to use paging_mode_hap(). */
     if ( hap_enabled(p2m->domain) )
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -251,6 +251,7 @@ struct p2m_domain {
     /* Pages used to construct the p2m */
     struct page_list_head pages;
 
+#ifdef CONFIG_HVM
     int                (*set_entry)(struct p2m_domain *p2m,
                                     gfn_t gfn,
                                     mfn_t mfn, unsigned int page_order,
@@ -264,7 +265,6 @@ struct p2m_domain {
                                     p2m_query_t q,
                                     unsigned int *page_order,
                                     bool_t *sve);
-#ifdef CONFIG_HVM
     int                (*recalc)(struct p2m_domain *p2m,
                                  unsigned long gfn);
     void               (*enable_hardware_log_dirty)(struct p2m_domain *p2m);
@@ -785,8 +785,14 @@ int __must_check p2m_set_entry(struct p2
                                unsigned int page_order, p2m_type_t p2mt,
                                p2m_access_t p2ma);
 
+#if defined(CONFIG_HVM)
 /* Set up function pointers for PT implementation: only for use by p2m code */
 extern void p2m_pt_init(struct p2m_domain *p2m);
+#elif defined(CONFIG_SHADOW_PAGING)
+# define p2m_pt_init shadow_p2m_init
+#else
+static inline void p2m_pt_init(struct p2m_domain *p2m) {}
+#endif
 
 void *map_domain_gfn(struct p2m_domain *p2m, gfn_t gfn, mfn_t *mfn,
                      p2m_query_t q, uint32_t *pfec);
--- a/xen/include/xen/p2m-common.h
+++ b/xen/include/xen/p2m-common.h
@@ -8,9 +8,18 @@ int set_foreign_p2m_entry(struct domain
                           unsigned long gfn, mfn_t mfn);
 
 /* Remove a page from a domain's p2m table */
+#ifdef CONFIG_HVM
 int __must_check
 guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
                           unsigned int page_order);
+#else
+static inline int
+guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
+                          unsigned int page_order)
+{
+    return 0;
+}
+#endif
 
 /* Map MMIO regions in the p2m: start_gfn and nr describe the range in
  *  * the guest physical address space to map, starting from the machine


