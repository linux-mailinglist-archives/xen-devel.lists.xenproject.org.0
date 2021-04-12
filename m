Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75BD35C595
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 13:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109042.208141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVv3C-0006vx-S4; Mon, 12 Apr 2021 11:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109042.208141; Mon, 12 Apr 2021 11:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVv3C-0006vY-Ou; Mon, 12 Apr 2021 11:48:18 +0000
Received: by outflank-mailman (input) for mailman id 109042;
 Mon, 12 Apr 2021 11:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVv3B-0006vS-EJ
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 11:48:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20c674ae-4072-4863-a91a-f87ee2a263eb;
 Mon, 12 Apr 2021 11:48:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB506AC6A;
 Mon, 12 Apr 2021 11:48:15 +0000 (UTC)
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
X-Inumbo-ID: 20c674ae-4072-4863-a91a-f87ee2a263eb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618228096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=efXFBmOcOFrcWbNhfJK8dazr1JEkvwc/LrJUCkX1xVY=;
	b=QMnerBIMAOm5HtjfFstMrAbuygTmvJ7GjjlpMYjnUGlPmkK0WCrvHvvjU+kgSGaF1cBDrm
	Z0+TncfxuWhuiW7s7dR3UB8Z2joRR4tLi8sfhz8LZ090L4AxvGEupWV5gWpeKuJ8m0xJGd
	7wwNJNevnYpIaf+ydeYd1nDI3+woD60=
Subject: [PATCH 1/2] x86/shadow: re-use variables in
 shadow_get_page_from_l1e()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e410c8e6-351d-bd98-7485-eb57268dc378@suse.com>
Message-ID: <cc6cdf83-295d-19a2-99d6-163e69f0d67f@suse.com>
Date: Mon, 12 Apr 2021 13:48:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <e410c8e6-351d-bd98-7485-eb57268dc378@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's little point in doing multiple mfn_to_page() or page_get_owner()
on all the same MFN. Calculate them once at the start of the function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -89,25 +89,27 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
 {
     int res;
     mfn_t mfn;
-    struct domain *owner;
+    const struct page_info *pg = NULL;
+    struct domain *owner = NULL;
 
     ASSERT(!sh_l1e_is_magic(sl1e));
     ASSERT(shadow_mode_refcounts(d));
 
+    if ( mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) )
+    {
+        pg = mfn_to_page(mfn);
+        owner = page_get_owner(pg);
+    }
+
     /*
      * VMX'es APIC access MFN is just a surrogate page.  It doesn't actually
      * get accessed, and hence there's no need to refcount it (and refcounting
      * would fail, due to the page having no owner).
      */
-    if ( mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) )
+    if ( pg && !owner && (pg->count_info & PGC_extra) )
     {
-        const struct page_info *pg = mfn_to_page(mfn);
-
-        if ( !page_get_owner(pg) && (pg->count_info & PGC_extra) )
-        {
-            ASSERT(type == p2m_mmio_direct);
-            return 0;
-        }
+        ASSERT(type == p2m_mmio_direct);
+        return 0;
     }
 
     res = get_page_from_l1e(sl1e, d, d);
@@ -118,9 +120,7 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
      */
     if ( unlikely(res < 0) &&
          !shadow_mode_translate(d) &&
-         mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) &&
-         (owner = page_get_owner(mfn_to_page(mfn))) &&
-         (d != owner) )
+         owner && (d != owner) )
     {
         res = xsm_priv_mapping(XSM_TARGET, d, owner);
         if ( !res )
@@ -143,9 +143,8 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
          * already have checked that we're supposed to have access, so
          * we can just grab a reference directly.
          */
-        mfn = shadow_l1e_get_mfn(sl1e);
-        if ( mfn_valid(mfn) )
-            res = get_page_from_l1e(sl1e, d, page_get_owner(mfn_to_page(mfn)));
+        if ( owner )
+            res = get_page_from_l1e(sl1e, d, owner);
     }
 
     if ( unlikely(res < 0) )


