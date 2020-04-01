Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3780619AAF6
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 13:41:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJbhZ-0006hC-Ci; Wed, 01 Apr 2020 11:38:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJbhY-0006h5-AG
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 11:38:32 +0000
X-Inumbo-ID: 4f901d9a-740d-11ea-baa1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f901d9a-740d-11ea-baa1-12813bfff9fa;
 Wed, 01 Apr 2020 11:38:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 607E7ACCA;
 Wed,  1 Apr 2020 11:38:30 +0000 (UTC)
Subject: [PATCH 1/5] x86/p2m: don't ignore p2m_remove_page()'s return value
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3fbe1d2e-034a-31d7-7207-52ef8b335529@suse.com>
Message-ID: <88aa25d4-9772-8a2b-48c4-c0138ef000b9@suse.com>
Date: Wed, 1 Apr 2020 13:38:26 +0200
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

It's not very nice to return from guest_physmap_add_entry() after
perhaps already having made some changes to the P2M, but this is pre-
existing practice in the function, and imo better than ignoring errors.

Take the liberty and replace an mfn_add() instance with a local variable
already holding the result (as proven by the check immediately ahead).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul.durrant@citrix.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -767,8 +767,7 @@ void p2m_final_teardown(struct domain *d
     p2m_teardown_hostp2m(d);
 }
 
-
-static int
+static int __must_check
 p2m_remove_page(struct p2m_domain *p2m, unsigned long gfn_l, unsigned long mfn,
                 unsigned int page_order)
 {
@@ -973,9 +972,9 @@ guest_physmap_add_entry(struct domain *d
                 ASSERT(mfn_valid(omfn));
                 P2M_DEBUG("old gfn=%#lx -> mfn %#lx\n",
                           gfn_x(ogfn) , mfn_x(omfn));
-                if ( mfn_eq(omfn, mfn_add(mfn, i)) )
-                    p2m_remove_page(p2m, gfn_x(ogfn), mfn_x(mfn_add(mfn, i)),
-                                    0);
+                if ( mfn_eq(omfn, mfn_add(mfn, i)) &&
+                     (rc = p2m_remove_page(p2m, gfn_x(ogfn), mfn_x(omfn), 0)) )
+                    goto out;
             }
         }
     }
@@ -997,6 +996,7 @@ guest_physmap_add_entry(struct domain *d
         }
     }
 
+out:
     p2m_unlock(p2m);
 
     return rc;
@@ -2705,9 +2705,9 @@ int p2m_change_altp2m_gfn(struct domain
     if ( gfn_eq(new_gfn, INVALID_GFN) )
     {
         mfn = ap2m->get_entry(ap2m, old_gfn, &t, &a, 0, NULL, NULL);
-        if ( mfn_valid(mfn) )
-            p2m_remove_page(ap2m, gfn_x(old_gfn), mfn_x(mfn), PAGE_ORDER_4K);
-        rc = 0;
+        rc = mfn_valid(mfn)
+             ? p2m_remove_page(ap2m, gfn_x(old_gfn), mfn_x(mfn), PAGE_ORDER_4K)
+             : 0;
         goto out;
     }
 


