Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCDF343EA4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 11:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100146.190651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOIGr-000327-2w; Mon, 22 Mar 2021 10:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100146.190651; Mon, 22 Mar 2021 10:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOIGq-00031Q-So; Mon, 22 Mar 2021 10:58:52 +0000
Received: by outflank-mailman (input) for mailman id 100146;
 Mon, 22 Mar 2021 10:58:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx7y=IU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lOIGp-0002uK-Bq
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:58:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c14ea851-a261-40f7-a0ff-7d7be2bd9291;
 Mon, 22 Mar 2021 10:58:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7760BADD7;
 Mon, 22 Mar 2021 10:58:43 +0000 (UTC)
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
X-Inumbo-ID: c14ea851-a261-40f7-a0ff-7d7be2bd9291
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616410723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QkccH15XtocbQaI1+xCepvWqUPsOA3/9wDy4REwshYU=;
	b=tpGKTi4dWouWzumA2xQIYE4sW+/5vQYXUy1ts4cA9jaJUrF9ZuPVk3EOg0072/5XnVJGHa
	6RCixeeg6LBZHj8nhUrfJez5PITM/EWzFsIupbKL9BzYVI+MkTjA3nkTnwg6YdPBydJaZW
	NOjbq9wpXZq7ljqQt2Spd5pym4CrhyM=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/6] tools/libs/ctrl: use common p2m mapping code in xc_domain_resume_any()
Date: Mon, 22 Mar 2021 11:58:37 +0100
Message-Id: <20210322105840.11224-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322105840.11224-1-jgross@suse.com>
References: <20210322105840.11224-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of open coding the mapping of the p2m list use the already
existing xc_core_arch_map_p2m() call, especially as the current code
does not support guests with the linear p2m map. It should be noted
that this code is needed for colo/remus only.

Switching to xc_core_arch_map_p2m() drops the need to bail out for
bitness of tool stack and guest differing.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
This might be a backport candidate
---
 tools/libs/ctrl/xc_resume.c | 66 ++++++++++++-------------------------
 1 file changed, 21 insertions(+), 45 deletions(-)

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
-- 
2.26.2


