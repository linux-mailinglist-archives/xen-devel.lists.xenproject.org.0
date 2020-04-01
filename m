Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9406F19AAFC
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 13:42:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJbiq-0006pY-08; Wed, 01 Apr 2020 11:39:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJbio-0006pP-J4
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 11:39:50 +0000
X-Inumbo-ID: 7e6f9096-740d-11ea-baa1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e6f9096-740d-11ea-baa1-12813bfff9fa;
 Wed, 01 Apr 2020 11:39:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BDB0DACCA;
 Wed,  1 Apr 2020 11:39:48 +0000 (UTC)
Subject: [PATCH 3/5] x86/p2m: make p2m_remove_page()'s parameters type-safe
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3fbe1d2e-034a-31d7-7207-52ef8b335529@suse.com>
Message-ID: <858f22e3-0f4f-08f0-ef67-b8ce67146537@suse.com>
Date: Wed, 1 Apr 2020 13:39:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <3fbe1d2e-034a-31d7-7207-52ef8b335529@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Also add a couple of blank lines.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -768,11 +768,10 @@ void p2m_final_teardown(struct domain *d
 }
 
 static int __must_check
-p2m_remove_page(struct p2m_domain *p2m, unsigned long gfn_l, unsigned long mfn,
+p2m_remove_page(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                 unsigned int page_order)
 {
     unsigned long i;
-    gfn_t gfn = _gfn(gfn_l);
     p2m_type_t t;
     p2m_access_t a;
 
@@ -781,7 +780,7 @@ p2m_remove_page(struct p2m_domain *p2m,
         return 0;
 
     ASSERT(gfn_locked_by_me(p2m, gfn));
-    P2M_DEBUG("removing gfn=%#lx mfn=%#lx\n", gfn_l, mfn);
+    P2M_DEBUG("removing gfn=%#lx mfn=%#lx\n", gfn_x(gfn), mfn_x(mfn));
 
     for ( i = 0; i < (1UL << page_order); )
     {
@@ -790,21 +789,23 @@ p2m_remove_page(struct p2m_domain *p2m,
                                           &cur_order, NULL);
 
         if ( p2m_is_valid(t) &&
-             (!mfn_valid(_mfn(mfn)) || mfn + i != mfn_x(mfn_return)) )
+             (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)) )
             return -EILSEQ;
 
-        i += (1UL << cur_order) - ((gfn_l + i) & ((1UL << cur_order) - 1));
+        i += (1UL << cur_order) -
+             (gfn_x(gfn_add(gfn, i)) & ((1UL << cur_order) - 1));
     }
 
-    if ( mfn_valid(_mfn(mfn)) )
+    if ( mfn_valid(mfn) )
     {
         for ( i = 0; i < (1UL << page_order); i++ )
         {
             p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
             if ( !p2m_is_grant(t) && !p2m_is_shared(t) && !p2m_is_foreign(t) )
-                set_gpfn_from_mfn(mfn+i, INVALID_M2P_ENTRY);
+                set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
         }
     }
+
     return p2m_set_entry(p2m, gfn, INVALID_MFN, page_order, p2m_invalid,
                          p2m->default_access);
 }
@@ -815,9 +816,11 @@ guest_physmap_remove_page(struct domain
 {
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc;
+
     gfn_lock(p2m, gfn, page_order);
-    rc = p2m_remove_page(p2m, gfn_x(gfn), mfn_x(mfn), page_order);
+    rc = p2m_remove_page(p2m, gfn, mfn, page_order);
     gfn_unlock(p2m, gfn, page_order);
+
     return rc;
 }
 
@@ -983,7 +986,7 @@ guest_physmap_add_entry(struct domain *d
                 P2M_DEBUG("old gfn=%#lx -> mfn %#lx\n",
                           gfn_x(ogfn) , mfn_x(omfn));
                 if ( mfn_eq(omfn, mfn_add(mfn, i)) &&
-                     (rc = p2m_remove_page(p2m, gfn_x(ogfn), mfn_x(omfn), 0)) )
+                     (rc = p2m_remove_page(p2m, ogfn, omfn, 0)) )
                     goto out;
             }
         }
@@ -2716,7 +2719,7 @@ int p2m_change_altp2m_gfn(struct domain
     {
         mfn = ap2m->get_entry(ap2m, old_gfn, &t, &a, 0, NULL, NULL);
         rc = mfn_valid(mfn)
-             ? p2m_remove_page(ap2m, gfn_x(old_gfn), mfn_x(mfn), PAGE_ORDER_4K)
+             ? p2m_remove_page(ap2m, old_gfn, mfn, PAGE_ORDER_4K)
              : 0;
         goto out;
     }


