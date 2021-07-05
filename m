Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5063BC306
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 21:11:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150634.278529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tzp-00044H-2N; Mon, 05 Jul 2021 19:11:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150634.278529; Mon, 05 Jul 2021 19:11:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tzo-00041F-Ud; Mon, 05 Jul 2021 19:11:08 +0000
Received: by outflank-mailman (input) for mailman id 150634;
 Mon, 05 Jul 2021 19:11:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0Tzn-0003HJ-VP
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 19:11:07 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87e402e1-75f0-4030-a371-3c0f098e4869;
 Mon, 05 Jul 2021 19:11:03 +0000 (UTC)
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
X-Inumbo-ID: 87e402e1-75f0-4030-a371-3c0f098e4869
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625512263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=CuqCxukAEpPEZu8tBseimenOnd4UdwA3oGVYBaKS/xI=;
  b=fkMu09vEWcwInWDIZsXOfmQKXrLAYqtayIUXN2/72ZwXONSHgXsp/sF2
   Wpo/YZfa+CQ6hpOHhxNR0FBrsljgW3Tn23RNef6YJF+iDwhlN6kgq+sUp
   5Aa9WHNK1m9LW97zYBauMB+mbE3BOJSIAV7oTmxAw9lQ859qB+Zm5WGrf
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jiN/OOdM2xnlx3gY/d/CG7XM8wTwfwWvWPS+MAsXL7Gm3No1PHOeUaWSWb0Mq1AOpYGW8rSTSl
 msxvTpSLcyY1biRw+UdnZRFI8AoDD/OdqXqEwz119JxX/VeoSXOLDBzrhiar5/IU62az87wY7Z
 /Jf5HLScEpAuACqzJESHnjK7f/jIWlIFYyO3vVVFCR3UjDBPCB2jqw1vU8briqHE+95FZjCOXz
 Fkx81lk7h8Hpb2hyc9V1mhDx1Rl6ve09aZ/iGqCts+NOsjvSTxMuIEM2skmnvZSGLnn+Y4zods
 XW4=
X-SBRS: 5.1
X-MesageID: 47973428
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:3JsuValfXQZvYwm7I6hXzZdos+/pDfIo3DAbv31ZSRFFG/Fxl6
 iV/cjztCWE8Ar5N0tQ+uxoVJPufZqYz+8Q3WBzB8baYOCFghrLEGgK1+KLqFeMdxEWtNQtsp
 uIG5IObuEYZmIbsS+V2meF+q4bsby6zJw=
X-IronPort-AV: E=Sophos;i="5.83,326,1616472000"; 
   d="scan'208";a="47973428"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Olaf Hering <olaf@aepfle.de>, "Juergen
 Gross" <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 5/5] tools/migration: unify type checking for data pfns in migration stream
Date: Mon, 5 Jul 2021 20:10:27 +0100
Message-ID: <20210705191027.15107-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210705191027.15107-1-andrew.cooper3@citrix.com>
References: <20210705191027.15107-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Olaf Hering <olaf@aepfle.de>

Introduce a helper which decides if a given pfn type has data
in the migration stream.

No change in behaviour intended, except for invalid page types which now
have a safer default.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  | 27 +++++++++++++++++++++++++++
 tools/libs/guest/xg_sr_restore.c | 29 +++--------------------------
 tools/libs/guest/xg_sr_save.c    | 14 ++------------
 3 files changed, 32 insertions(+), 38 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 7f4b0439f6bd..36d45ef56fb8 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -513,6 +513,33 @@ static inline bool page_type_to_populate(uint32_t type)
     }
 }
 
+static inline bool page_type_has_stream_data(uint32_t type)
+{
+    switch ( type )
+    {
+    case XEN_DOMCTL_PFINFO_NOTAB:
+
+    case XEN_DOMCTL_PFINFO_L1TAB:
+    case XEN_DOMCTL_PFINFO_L1TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_L2TAB:
+    case XEN_DOMCTL_PFINFO_L2TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_L3TAB:
+    case XEN_DOMCTL_PFINFO_L3TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+
+    case XEN_DOMCTL_PFINFO_L4TAB:
+    case XEN_DOMCTL_PFINFO_L4TAB | XEN_DOMCTL_PFINFO_LPINTAB:
+        return true;
+
+    case XEN_DOMCTL_PFINFO_XTAB:
+    case XEN_DOMCTL_PFINFO_BROKEN:
+    case XEN_DOMCTL_PFINFO_XALLOC:
+    default:
+        return false;
+    }
+}
+
 #endif
 /*
  * Local variables:
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 3d63442d4537..aa4113d7f679 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -231,25 +231,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     {
         ctx->restore.ops.set_page_type(ctx, pfns[i], types[i]);
 
-        switch ( types[i] )
-        {
-        case XEN_DOMCTL_PFINFO_NOTAB:
-
-        case XEN_DOMCTL_PFINFO_L1TAB:
-        case XEN_DOMCTL_PFINFO_L1TAB | XEN_DOMCTL_PFINFO_LPINTAB:
-
-        case XEN_DOMCTL_PFINFO_L2TAB:
-        case XEN_DOMCTL_PFINFO_L2TAB | XEN_DOMCTL_PFINFO_LPINTAB:
-
-        case XEN_DOMCTL_PFINFO_L3TAB:
-        case XEN_DOMCTL_PFINFO_L3TAB | XEN_DOMCTL_PFINFO_LPINTAB:
-
-        case XEN_DOMCTL_PFINFO_L4TAB:
-        case XEN_DOMCTL_PFINFO_L4TAB | XEN_DOMCTL_PFINFO_LPINTAB:
-
+        if ( page_type_has_stream_data(types[i]) )
             mfns[nr_pages++] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
-            break;
-        }
     }
 
     /* Nothing to do? */
@@ -269,14 +252,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 
     for ( i = 0, j = 0; i < count; ++i )
     {
-        switch ( types[i] )
-        {
-        case XEN_DOMCTL_PFINFO_XTAB:
-        case XEN_DOMCTL_PFINFO_BROKEN:
-        case XEN_DOMCTL_PFINFO_XALLOC:
-            /* No page data to deal with. */
+        if ( !page_type_has_stream_data(types[i]) )
             continue;
-        }
 
         if ( map_errs[j] )
         {
@@ -411,7 +388,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
             goto err;
         }
 
-        if ( type < XEN_DOMCTL_PFINFO_BROKEN )
+        if ( page_type_has_stream_data(type) )
             /* NOTAB and all L1 through L4 tables (including pinned) should
              * have a page worth of data in the record. */
             pages_of_data++;
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index c84a073e86f4..3fce41b6cfff 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -153,13 +153,8 @@ static int write_batch(struct xc_sr_context *ctx)
             goto err;
         }
 
-        switch ( types[i] )
-        {
-        case XEN_DOMCTL_PFINFO_BROKEN:
-        case XEN_DOMCTL_PFINFO_XALLOC:
-        case XEN_DOMCTL_PFINFO_XTAB:
+        if ( !page_type_has_stream_data(types[i]) )
             continue;
-        }
 
         mfns[nr_pages++] = mfns[i];
     }
@@ -177,13 +172,8 @@ static int write_batch(struct xc_sr_context *ctx)
 
         for ( i = 0, p = 0; i < nr_pfns; ++i )
         {
-            switch ( types[i] )
-            {
-            case XEN_DOMCTL_PFINFO_BROKEN:
-            case XEN_DOMCTL_PFINFO_XALLOC:
-            case XEN_DOMCTL_PFINFO_XTAB:
+            if ( !page_type_has_stream_data(types[i]) )
                 continue;
-            }
 
             if ( errors[p] )
             {
-- 
2.11.0


