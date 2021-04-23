Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CD43690A3
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 12:53:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116149.221739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtR9-0003yG-MP; Fri, 23 Apr 2021 10:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116149.221739; Fri, 23 Apr 2021 10:53:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtR9-0003xs-JT; Fri, 23 Apr 2021 10:53:27 +0000
Received: by outflank-mailman (input) for mailman id 116149;
 Fri, 23 Apr 2021 10:53:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZtR8-0003xd-0P
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 10:53:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e0f1d37-1d03-4cf3-acfd-84135c3bb88f;
 Fri, 23 Apr 2021 10:53:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5DF4DB05D;
 Fri, 23 Apr 2021 10:53:24 +0000 (UTC)
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
X-Inumbo-ID: 8e0f1d37-1d03-4cf3-acfd-84135c3bb88f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619175204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oo1/XTyys+4AMwPBg+4apC2PyGiHm7JIfunlGllfB28=;
	b=SwpxV/hzcMlbMTpBYIWcnUMWSkoATeEy4BcOU4v1PPN4SDWPyT4+1c2ljejP5bqJZLXtJN
	M4DyyXXDJ5VAqV0U9bHLO6V/1Cm391oLlXydDfUGNvNT1yZ3LBMCsR72QYzdme9a2tRgyY
	IusHiwVWVlWEgNyWpZpOb/DDzIElLx4=
Subject: [PATCH v4 2/3] x86/shadow: re-use variables in
 shadow_get_page_from_l1e()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <3e7ad009-f062-d58a-9380-103ce1573a73@suse.com>
Message-ID: <a7817f29-9a07-ab20-2224-999e75537fe3@suse.com>
Date: Fri, 23 Apr 2021 12:53:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3e7ad009-f062-d58a-9380-103ce1573a73@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's little point in doing multiple mfn_to_page() or page_get_owner()
on all the same MFN. Calculate them once at the start of the function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Tim Deegan <tim@xen.org>
---
v5: Integrate into series. Re-base.
v2: Re-base.

--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -88,19 +88,25 @@ static int inline
 shadow_get_page_from_l1e(shadow_l1e_t sl1e, struct domain *d, p2m_type_t type)
 {
     int res;
-    mfn_t mfn;
-    struct domain *owner;
+    mfn_t mfn = shadow_l1e_get_mfn(sl1e);
+    const struct page_info *pg = NULL;
+    struct domain *owner = NULL;
 
     ASSERT(!sh_l1e_is_magic(sl1e));
     ASSERT(shadow_mode_refcounts(d));
 
+    if ( mfn_valid(mfn) )
+    {
+        pg = mfn_to_page(mfn);
+        owner = page_get_owner(pg);
+    }
+
     /*
      * Check whether refcounting is suppressed on this page. For example,
      * VMX'es APIC access MFN is just a surrogate page.  It doesn't actually
      * get accessed, and hence there's no need to refcount it.
      */
-    mfn = shadow_l1e_get_mfn(sl1e);
-    if ( mfn_valid(mfn) && page_refcounting_suppressed(mfn_to_page(mfn)) )
+    if ( pg && page_refcounting_suppressed(pg) )
         return 0;
 
     res = get_page_from_l1e(sl1e, d, d);
@@ -111,9 +117,7 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
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
@@ -136,9 +140,8 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
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


