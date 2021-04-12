Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BF635C596
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 13:48:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109045.208152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVv3d-00071O-6X; Mon, 12 Apr 2021 11:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109045.208152; Mon, 12 Apr 2021 11:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVv3d-000712-2W; Mon, 12 Apr 2021 11:48:45 +0000
Received: by outflank-mailman (input) for mailman id 109045;
 Mon, 12 Apr 2021 11:48:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVv3c-00070x-0P
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 11:48:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7067a87d-1c18-4f39-bd06-61a4f903cf66;
 Mon, 12 Apr 2021 11:48:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 65893AC6A;
 Mon, 12 Apr 2021 11:48:42 +0000 (UTC)
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
X-Inumbo-ID: 7067a87d-1c18-4f39-bd06-61a4f903cf66
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618228122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oLMMZLurdOShZGSmBBd6sEABJTI2Dapn7waZkVo+PAY=;
	b=RtE7xqYkwbsucNJMDikWbvY3iJYQKDO+UnIK6ZBM7RCxRc3FyRCdpCPHjEW8rrev/Xhelh
	o/khsavjVXHBjsnvCXhzZzc2CffEiOM4ValhuRlT3M9kKsMTW0Wu8DMjEU8bL7+u5NvCUI
	xtwnihfDlzkJ7WP2Qw2r6Q9KNQBd2gg=
Subject: [PATCH 2/2] x86/shadow: streamline shadow_get_page_from_l1e()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e410c8e6-351d-bd98-7485-eb57268dc378@suse.com>
Message-ID: <5473f1b2-eae7-aa57-d910-b33b5678ec06@suse.com>
Date: Mon, 12 Apr 2021 13:48:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <e410c8e6-351d-bd98-7485-eb57268dc378@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Trying get_page_from_l1e() up to three times isn't helpful; in debug
builds it may lead to log messages mking things look as if there was a
problem somewhere. And there's no need to have more than one try: The
function can only possibly succeed for one domain passed as 3rd
argument (unless the page is an MMIO one to which both have access,
but MMIO pages should be "got" by specifying the requesting domain
anyway). Re-arrange things so just the one call gets made which has a
chance of succeeding.

The code could in principle be arranged such that there's only a single
call to get_page_from_l1e(), but the conditional would become pretty
complex then and hence hard to follow / understand / adjust.

The redundant (with shadow_mode_refcounts()) shadow_mode_translate()
gets dropped.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/set.c
+++ b/xen/arch/x86/mm/shadow/set.c
@@ -112,40 +112,36 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
         return 0;
     }
 
-    res = get_page_from_l1e(sl1e, d, d);
+    if ( owner == dom_io )
+        owner = NULL;
 
     /*
      * If a privileged domain is attempting to install a map of a page it does
      * not own, we let it succeed anyway.
      */
-    if ( unlikely(res < 0) &&
-         !shadow_mode_translate(d) &&
-         owner && (d != owner) )
+    if ( owner && (d != owner) &&
+         !(res = xsm_priv_mapping(XSM_TARGET, d, owner)) )
     {
-        res = xsm_priv_mapping(XSM_TARGET, d, owner);
-        if ( !res )
-        {
-            res = get_page_from_l1e(sl1e, d, owner);
-            SHADOW_PRINTK("privileged %pd installs map of mfn %"PRI_mfn" owned by %pd: %s\n",
-                           d, mfn_x(mfn), owner,
-                           res >= 0 ? "success" : "failed");
-        }
+        res = get_page_from_l1e(sl1e, d, owner);
+        SHADOW_PRINTK("privileged %pd installs map of %pd's mfn %"PRI_mfn": %s\n",
+                      d, owner, mfn_x(mfn),
+                      res >= 0 ? "success" : "failed");
     }
-
     /* Okay, it might still be a grant mapping PTE.  Try it. */
-    if ( unlikely(res < 0) &&
-         (type == p2m_grant_map_rw ||
-          (type == p2m_grant_map_ro &&
-           !(shadow_l1e_get_flags(sl1e) & _PAGE_RW))) )
+    else if ( owner &&
+              (type == p2m_grant_map_rw ||
+               (type == p2m_grant_map_ro &&
+                !(shadow_l1e_get_flags(sl1e) & _PAGE_RW))) )
     {
         /*
          * It's a grant mapping.  The grant table implementation will
          * already have checked that we're supposed to have access, so
          * we can just grab a reference directly.
          */
-        if ( owner )
-            res = get_page_from_l1e(sl1e, d, owner);
+        res = get_page_from_l1e(sl1e, d, owner);
     }
+    else
+        res = get_page_from_l1e(sl1e, d, d);
 
     if ( unlikely(res < 0) )
     {


