Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C76D19AB01
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 13:43:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJbjq-0007e8-OM; Wed, 01 Apr 2020 11:40:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJbjp-0007dw-9s
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 11:40:53 +0000
X-Inumbo-ID: a3f626fe-740d-11ea-baad-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3f626fe-740d-11ea-baad-12813bfff9fa;
 Wed, 01 Apr 2020 11:40:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E60F0AD33;
 Wed,  1 Apr 2020 11:40:51 +0000 (UTC)
Subject: [PATCH 5/5] x86/p2m: use available local variable in
 guest_physmap_add_entry()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3fbe1d2e-034a-31d7-7207-52ef8b335529@suse.com>
Message-ID: <3a8a7eb3-4822-0234-47de-c83973b4b5eb@suse.com>
Date: Wed, 1 Apr 2020 13:40:51 +0200
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

The domain is being passed in - no need to obtain it from p2m->domain.
Also drop a pointless cast while touching this code anyway.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -905,7 +905,7 @@ guest_physmap_add_entry(struct domain *d
         if ( p2m_is_shared(ot) )
         {
             /* Do an unshare to cleanly take care of all corner cases. */
-            rc = mem_sharing_unshare_page(p2m->domain, gfn_x(gfn_add(gfn, i)));
+            rc = mem_sharing_unshare_page(d, gfn_x(gfn_add(gfn, i)));
             if ( rc )
             {
                 p2m_unlock(p2m);
@@ -922,8 +922,7 @@ guest_physmap_add_entry(struct domain *d
                  * Foreign domains are okay to place an event as they
                  * won't go to sleep.
                  */
-                (void)mem_sharing_notify_enomem(p2m->domain,
-                                                gfn_x(gfn_add(gfn, i)), false);
+                mem_sharing_notify_enomem(d, gfn_x(gfn_add(gfn, i)), false);
                 return rc;
             }
             omfn = p2m->get_entry(p2m, gfn_add(gfn, i),


