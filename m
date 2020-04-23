Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0827A1B574E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 10:37:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRXM7-0007Ur-4W; Thu, 23 Apr 2020 08:37:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRXM5-0007Um-PW
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 08:37:09 +0000
X-Inumbo-ID: 9e667482-853d-11ea-9336-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e667482-853d-11ea-9336-12813bfff9fa;
 Thu, 23 Apr 2020 08:37:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 63DD3AFC1;
 Thu, 23 Apr 2020 08:37:07 +0000 (UTC)
Subject: [PATCH v2 1/6] x86/mem-paging: fold p2m_mem_paging_prep()'s main
 if()-s
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
Message-ID: <cea2307f-1aae-51cb-20ac-fbaf4b945771@suse.com>
Date: Thu, 23 Apr 2020 10:37:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <b8437b1f-af58-70df-91d2-bd875912e57b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The condition of the second can be true only if the condition of the
first was met; the second half of the condition of the second then also
is redundant with an earlier check. Combine them, drop a pointless
local variable, and re-flow the affected gdprintk().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1808,6 +1808,8 @@ int p2m_mem_paging_prep(struct domain *d
     /* Allocate a page if the gfn does not have one yet */
     if ( !mfn_valid(mfn) )
     {
+        void *guest_map;
+
         /* If the user did not provide a buffer, we disallow */
         ret = -EINVAL;
         if ( unlikely(user_ptr == NULL) )
@@ -1819,22 +1821,16 @@ int p2m_mem_paging_prep(struct domain *d
             goto out;
         mfn = page_to_mfn(page);
         page_extant = 0;
-    }
-
-    /* If we were given a buffer, now is the time to use it */
-    if ( !page_extant && user_ptr )
-    {
-        void *guest_map;
-        int rc;
 
         ASSERT( mfn_valid(mfn) );
         guest_map = map_domain_page(mfn);
-        rc = copy_from_user(guest_map, user_ptr, PAGE_SIZE);
+        ret = copy_from_user(guest_map, user_ptr, PAGE_SIZE);
         unmap_domain_page(guest_map);
-        if ( rc )
+        if ( ret )
         {
-            gdprintk(XENLOG_ERR, "Failed to load paging-in gfn %lx domain %u "
-                                 "bytes left %d\n", gfn_l, d->domain_id, rc);
+            gdprintk(XENLOG_ERR,
+                     "Failed to load paging-in gfn %lx Dom%d bytes left %d\n",
+                     gfn_l, d->domain_id, ret);
             ret = -EFAULT;
             put_page(page); /* Don't leak pages */
             goto out;            


