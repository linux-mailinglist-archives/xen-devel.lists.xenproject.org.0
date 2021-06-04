Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3EF39B256
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 08:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136691.253361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp2uc-0003P6-Ad; Fri, 04 Jun 2021 06:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136691.253361; Fri, 04 Jun 2021 06:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp2uc-0003M7-29; Fri, 04 Jun 2021 06:02:30 +0000
Received: by outflank-mailman (input) for mailman id 136691;
 Fri, 04 Jun 2021 06:02:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x6aI=K6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lp2ua-00029c-CE
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 06:02:28 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dfc2046a-8261-4160-b6d7-d3a1b537cd64;
 Fri, 04 Jun 2021 06:02:17 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2375B21A09;
 Fri,  4 Jun 2021 06:02:17 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id DA946118DD;
 Fri,  4 Jun 2021 06:02:16 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 6Jg7NOjBuWCyGwAALh3uQQ
 (envelope-from <jgross@suse.com>); Fri, 04 Jun 2021 06:02:16 +0000
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
X-Inumbo-ID: dfc2046a-8261-4160-b6d7-d3a1b537cd64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622786537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isgrr2CDNqvffqwRlBKSl7qzhM9b8t1JhZ+3heZNMCc=;
	b=sUAmI//60kTaXOn6AY4IceYBFhGxX7lavmSv7qagAijQs3IOOcvv5Nfo+bfH7tUS8HzZSY
	2tcteC707wNGr67m4I6R2Dywco3AMlboOQZufig/4sI+R5cXm+wk6WMlyxhsAndifNKIyH
	gi9AXLn8Sn92r/uaqrcb02Y6bYmg+jE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622786537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=isgrr2CDNqvffqwRlBKSl7qzhM9b8t1JhZ+3heZNMCc=;
	b=sUAmI//60kTaXOn6AY4IceYBFhGxX7lavmSv7qagAijQs3IOOcvv5Nfo+bfH7tUS8HzZSY
	2tcteC707wNGr67m4I6R2Dywco3AMlboOQZufig/4sI+R5cXm+wk6WMlyxhsAndifNKIyH
	gi9AXLn8Sn92r/uaqrcb02Y6bYmg+jE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>
Subject: [PATCH v2 3/6] tools/libs/ctrl: use common p2m mapping code in xc_domain_resume_any()
Date: Fri,  4 Jun 2021 08:02:11 +0200
Message-Id: <20210604060214.14924-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210604060214.14924-1-jgross@suse.com>
References: <20210604060214.14924-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of open coding the mapping of the p2m list use the already
existing xc_core_arch_map_p2m() call, especially as the current code
does not support guests with the linear p2m map. It should be noted
that this code is needed for colo/remus only.

Switching to xc_core_arch_map_p2m() drops the need to bail out for
bitness of tool stack and guest differing.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Christian Lindig <christian.lindig@citrix.com>
Acked-by: Wei Liu <wl@xen.org>
---
This might be a backport candidate
V2:
- add missing #include in ocaml stub (Andrew Cooper)
---
 tools/libs/ctrl/xc_resume.c         | 66 +++++++++--------------------
 tools/ocaml/libs/xc/xenctrl_stubs.c |  1 +
 2 files changed, 22 insertions(+), 45 deletions(-)

diff --git a/tools/libs/ctrl/xc_resume.c b/tools/libs/ctrl/xc_resume.c
index 94c6c9fb31..e3c8e83aa9 100644
--- a/tools/libs/ctrl/xc_resume.c
+++ b/tools/libs/ctrl/xc_resume.c
@@ -20,6 +20,7 @@
 #include <xen/foreign/x86_32.h>
 #include <xen/foreign/x86_64.h>
 #include <xen/hvm/params.h>
+#include "xc_core.h"
 
 static int modify_returncode(xc_interface *xch, uint32_t domid)
 {
@@ -137,12 +138,10 @@ static int xc_domain_resume_any(xc_interface *xch, uint32_t domid)
     struct domain_info_context _dinfo = { .guest_width = 0,
                                           .p2m_size = 0 };
     struct domain_info_context *dinfo = &_dinfo;
-    unsigned long mfn;
+    xen_pfn_t mfn, store_mfn, console_mfn;
     vcpu_guest_context_any_t ctxt;
-    start_info_t *start_info;
-    shared_info_t *shinfo = NULL;
-    xen_pfn_t *p2m_frame_list_list = NULL;
-    xen_pfn_t *p2m_frame_list = NULL;
+    start_info_any_t *start_info;
+    shared_info_any_t *shinfo = NULL;
     xen_pfn_t *p2m = NULL;
 #endif
 
@@ -164,11 +163,6 @@ static int xc_domain_resume_any(xc_interface *xch, uint32_t domid)
         PERROR("Could not get domain width");
         return rc;
     }
-    if ( dinfo->guest_width != sizeof(long) )
-    {
-        ERROR("Cannot resume uncooperative cross-address-size guests");
-        return rc;
-    }
 
     /* Map the shared info frame */
     shinfo = xc_map_foreign_range(xch, domid, PAGE_SIZE,
@@ -179,34 +173,8 @@ static int xc_domain_resume_any(xc_interface *xch, uint32_t domid)
         goto out;
     }
 
-    dinfo->p2m_size = shinfo->arch.max_pfn;
-
-    p2m_frame_list_list =
-        xc_map_foreign_range(xch, domid, PAGE_SIZE, PROT_READ,
-                             shinfo->arch.pfn_to_mfn_frame_list_list);
-    if ( p2m_frame_list_list == NULL )
-    {
-        ERROR("Couldn't map p2m_frame_list_list");
-        goto out;
-    }
-
-    p2m_frame_list = xc_map_foreign_pages(xch, domid, PROT_READ,
-                                          p2m_frame_list_list,
-                                          P2M_FLL_ENTRIES);
-    if ( p2m_frame_list == NULL )
-    {
-        ERROR("Couldn't map p2m_frame_list");
-        goto out;
-    }
-
-    /* Map all the frames of the pfn->mfn table. For migrate to succeed,
-       the guest must not change which frames are used for this purpose.
-       (its not clear why it would want to change them, and we'll be OK
-       from a safety POV anyhow. */
-    p2m = xc_map_foreign_pages(xch, domid, PROT_READ,
-                               p2m_frame_list,
-                               P2M_FL_ENTRIES);
-    if ( p2m == NULL )
+    /* Map the p2m list */
+    if ( xc_core_arch_map_p2m(xch, dinfo, &info, shinfo, &p2m) )
     {
         ERROR("Couldn't map p2m table");
         goto out;
@@ -228,8 +196,20 @@ static int xc_domain_resume_any(xc_interface *xch, uint32_t domid)
         goto out;
     }
 
-    start_info->store_mfn        = p2m[start_info->store_mfn];
-    start_info->console.domU.mfn = p2m[start_info->console.domU.mfn];
+    store_mfn = GET_FIELD(start_info, store_mfn, dinfo->guest_width);
+    console_mfn = GET_FIELD(start_info, console.domU.mfn, dinfo->guest_width);
+    if ( dinfo->guest_width == 4 )
+    {
+        store_mfn = ((uint32_t *)p2m)[store_mfn];
+        console_mfn = ((uint32_t *)p2m)[console_mfn];
+    }
+    else
+    {
+        store_mfn = ((uint64_t *)p2m)[store_mfn];
+        console_mfn = ((uint64_t *)p2m)[console_mfn];
+    }
+    SET_FIELD(start_info, store_mfn, store_mfn, dinfo->guest_width);
+    SET_FIELD(start_info, console.domU.mfn, console_mfn, dinfo->guest_width);
 
     munmap(start_info, PAGE_SIZE);
 #endif /* defined(__i386__) || defined(__x86_64__) */
@@ -250,11 +230,7 @@ static int xc_domain_resume_any(xc_interface *xch, uint32_t domid)
 out:
 #if defined(__i386__) || defined(__x86_64__)
     if (p2m)
-        munmap(p2m, P2M_FL_ENTRIES*PAGE_SIZE);
-    if (p2m_frame_list)
-        munmap(p2m_frame_list, P2M_FLL_ENTRIES*PAGE_SIZE);
-    if (p2m_frame_list_list)
-        munmap(p2m_frame_list_list, PAGE_SIZE);
+        munmap(p2m, dinfo->p2m_frames * PAGE_SIZE);
     if (shinfo)
         munmap(shinfo, PAGE_SIZE);
 #endif
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index d05d7bb30e..6e4bc567f5 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -32,6 +32,7 @@
 
 #define XC_WANT_COMPAT_MAP_FOREIGN_API
 #include <xenctrl.h>
+#include <xenguest.h>
 #include <xen-tools/libs.h>
 
 #include "mmap_stubs.h"
-- 
2.26.2


