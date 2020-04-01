Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE6719AAF7
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 13:41:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJbiL-0006mG-MT; Wed, 01 Apr 2020 11:39:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJbiJ-0006m9-Ps
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 11:39:19 +0000
X-Inumbo-ID: 6c1cd318-740d-11ea-baa1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c1cd318-740d-11ea-baa1-12813bfff9fa;
 Wed, 01 Apr 2020 11:39:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 487BAACCA;
 Wed,  1 Apr 2020 11:39:18 +0000 (UTC)
Subject: [PATCH 2/5] x86/p2m: don't assert that the passed in MFN matches for
 a remove
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3fbe1d2e-034a-31d7-7207-52ef8b335529@suse.com>
Message-ID: <da2e71b2-085b-390d-69ba-9edcbbf4fcd2@suse.com>
Date: Wed, 1 Apr 2020 13:39:16 +0200
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

guest_physmap_remove_page() gets handed an MFN from the outside, yet
takes the necessary lock to prevent further changes to the GFN <-> MFN
mapping itself. While some callers, in particular guest_remove_page()
(by way of having called get_gfn_query()), hold the GFN lock already,
various others (most notably perhaps the 2nd instance in
xenmem_add_to_physmap_one()) don't. While it also is an option to fix
all the callers, deal with the issue in p2m_remove_page() instead:
Replace the ASSERT() by a conditional and split the loop into two, such
that all checking gets done before any modification would occur.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul.durrant@citrix.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -773,7 +773,6 @@ p2m_remove_page(struct p2m_domain *p2m,
 {
     unsigned long i;
     gfn_t gfn = _gfn(gfn_l);
-    mfn_t mfn_return;
     p2m_type_t t;
     p2m_access_t a;
 
@@ -784,15 +783,26 @@ p2m_remove_page(struct p2m_domain *p2m,
     ASSERT(gfn_locked_by_me(p2m, gfn));
     P2M_DEBUG("removing gfn=%#lx mfn=%#lx\n", gfn_l, mfn);
 
+    for ( i = 0; i < (1UL << page_order); )
+    {
+        unsigned int cur_order;
+        mfn_t mfn_return = p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0,
+                                          &cur_order, NULL);
+
+        if ( p2m_is_valid(t) &&
+             (!mfn_valid(_mfn(mfn)) || mfn + i != mfn_x(mfn_return)) )
+            return -EILSEQ;
+
+        i += (1UL << cur_order) - ((gfn_l + i) & ((1UL << cur_order) - 1));
+    }
+
     if ( mfn_valid(_mfn(mfn)) )
     {
         for ( i = 0; i < (1UL << page_order); i++ )
         {
-            mfn_return = p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0,
-                                        NULL, NULL);
+            p2m->get_entry(p2m, gfn_add(gfn, i), &t, &a, 0, NULL, NULL);
             if ( !p2m_is_grant(t) && !p2m_is_shared(t) && !p2m_is_foreign(t) )
                 set_gpfn_from_mfn(mfn+i, INVALID_M2P_ENTRY);
-            ASSERT( !p2m_is_valid(t) || mfn + i == mfn_x(mfn_return) );
         }
     }
     return p2m_set_entry(p2m, gfn, INVALID_MFN, page_order, p2m_invalid,

