Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8002DB14E
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:25:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54447.94584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD8z-0003Li-WA; Tue, 15 Dec 2020 16:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54447.94584; Tue, 15 Dec 2020 16:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD8z-0003LJ-Sx; Tue, 15 Dec 2020 16:25:45 +0000
Received: by outflank-mailman (input) for mailman id 54447;
 Tue, 15 Dec 2020 16:25:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpD8y-0003L9-Lk
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:25:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d13375f4-8631-4eb2-83f0-59f856ac2ed3;
 Tue, 15 Dec 2020 16:25:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 343D8AF73;
 Tue, 15 Dec 2020 16:25:42 +0000 (UTC)
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
X-Inumbo-ID: d13375f4-8631-4eb2-83f0-59f856ac2ed3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608049542; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6glsRD1ghJhnGmjeRLQn2qIkW/U42ztTAyyz7PIAryU=;
	b=TTNJOZUzfjsIdlSJDhVTKKJppaBx5uqFSdfRUHeAgnxo4U7fzQa/oiCjuoTpsaQEqdorAG
	wF3KaObBtNd4yJ+hvOA5Bn+nScXJmlJID4plCFA3QFs6IgaC6XwAmoW/ddV0DNEi1Y8Dv3
	C8MXKNEL2QlMnMTF2e9sOMJ9qvqZiLc=
Subject: [PATCH 1/6] x86/p2m: tidy p2m_add_foreign() a little
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
Message-ID: <8b70c26e-7ae6-8438-67a3-99cef338ba52@suse.com>
Date: Tue, 15 Dec 2020 17:25:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Drop a bogus ASSERT() - we don't typically assert incoming domain
pointers to be non-NULL, and there's no particular reason to do so here.

Replace the open-coded DOMID_SELF check by use of
rcu_lock_remote_domain_by_id(), at the same time covering the request
being made with the current domain's actual ID.

Move the "both domains same" check into just the path where it really
is meaningful.

Swap the order of the two puts, such that
- the p2m lock isn't needlessly held across put_page(),
- a separate put_page() on an error path can be avoided,
- they're inverse to the order of the respective gets.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The DOMID_SELF check being converted also suggests to me that there's an
implication of tdom == current->domain, which would in turn appear to
mean the "both domains same" check could as well be dropped altogether.

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2560,9 +2560,6 @@ int p2m_add_foreign(struct domain *tdom,
     int rc;
     struct domain *fdom;
 
-    ASSERT(tdom);
-    if ( foreigndom == DOMID_SELF )
-        return -EINVAL;
     /*
      * hvm fixme: until support is added to p2m teardown code to cleanup any
      * foreign entries, limit this to hardware domain only.
@@ -2573,13 +2570,15 @@ int p2m_add_foreign(struct domain *tdom,
     if ( foreigndom == DOMID_XEN )
         fdom = rcu_lock_domain(dom_xen);
     else
-        fdom = rcu_lock_domain_by_id(foreigndom);
-    if ( fdom == NULL )
-        return -ESRCH;
+    {
+        rc = rcu_lock_remote_domain_by_id(foreigndom, &fdom);
+        if ( rc )
+            return rc;
 
-    rc = -EINVAL;
-    if ( tdom == fdom )
-        goto out;
+        rc = -EINVAL;
+        if ( tdom == fdom )
+            goto out;
+    }
 
     rc = xsm_map_gmfn_foreign(XSM_TARGET, tdom, fdom);
     if ( rc )
@@ -2593,10 +2592,8 @@ int p2m_add_foreign(struct domain *tdom,
     if ( !page ||
          !p2m_is_ram(p2mt) || p2m_is_shared(p2mt) || p2m_is_hole(p2mt) )
     {
-        if ( page )
-            put_page(page);
         rc = -EINVAL;
-        goto out;
+        goto put_one;
     }
     mfn = page_to_mfn(page);
 
@@ -2625,8 +2622,6 @@ int p2m_add_foreign(struct domain *tdom,
                  gpfn, mfn_x(mfn), fgfn, tdom->domain_id, fdom->domain_id);
 
  put_both:
-    put_page(page);
-
     /*
      * This put_gfn for the above get_gfn for prev_mfn.  We must do this
      * after set_foreign_p2m_entry so another cpu doesn't populate the gpfn
@@ -2634,9 +2629,13 @@ int p2m_add_foreign(struct domain *tdom,
      */
     put_gfn(tdom, gpfn);
 
-out:
+ put_one:
+    put_page(page);
+
+ out:
     if ( fdom )
         rcu_unlock_domain(fdom);
+
     return rc;
 }
 


