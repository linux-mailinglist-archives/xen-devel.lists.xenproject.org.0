Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8340A3BC1DC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 18:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150554.278349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Rto-0000R9-TU; Mon, 05 Jul 2021 16:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150554.278349; Mon, 05 Jul 2021 16:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Rto-0000OY-QU; Mon, 05 Jul 2021 16:56:48 +0000
Received: by outflank-mailman (input) for mailman id 150554;
 Mon, 05 Jul 2021 16:56:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N9Vt=L5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m0Rtn-0000OS-V8
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 16:56:48 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.23])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00e83910-cf0f-40df-8119-3c5889dd5ed3;
 Mon, 05 Jul 2021 16:56:46 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx65GuaNMk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 5 Jul 2021 18:56:36 +0200 (CEST)
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
X-Inumbo-ID: 00e83910-cf0f-40df-8119-3c5889dd5ed3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625504197;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=Mg3ZxD/weT27RJx0X7iaS0El9eK7YQOQCRWos8cAcXc=;
    b=dEzj3Qtvn666vHRbUzM6KBVRBmvb4LZFZslO7nzJiwQTzKmpGBDftAhkL6JizinN1O
    au8onwDtDsCbF8RS37jF2PJ8yutw3SQ2ewM1TCATLGfE2xtl5k7vuciQt4exjA5BEmpL
    tqdvNWGjlE5n0q42j0mPMlQeBZ+X0Avrff0RMgneJUqCkdPjlhyxiqSiMF68NvTFEDYP
    xAd498ZjZXfJH/E586bept3BF9J23hpSwaT9UYE83eYjgi4TscfCOtWn1pS1jpOCMJiR
    vC8QwZ/W6ArXLARpnVJfj7Pd5zU8NDhiLJQv7aJVJtCLSag9KoLaSXKRhevvcK+HfnA9
    j1LQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgs3rVb2Qcstn6hLmi/A5ONQi+eEunNNoWD5g0T8"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v3] tools: unify page type checking in save/restore
Date: Mon,  5 Jul 2021 18:56:33 +0200
Message-Id: <20210705165633.26077-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Users of xc_get_pfn_type_batch may want to sanity check the data
returned by Xen. Add helpers for this purpose:

is_known_page_type verifies the type returned by Xen on the saving
side, or the incoming type for a page on the restoring side, is known
by the save/restore code.

page_type_to_populate decides if a page with the given known type
needs to be populated on the restoring side.

page_type_has_stream_data decides if a page with the given known type
needs to be send, or if the stream on the restoring side contains a
data page.

While touching the code, simplify the logic check in populate_pfns.

No change in behavior intended.

Signed-off-by: Olaf Hering <olaf@aepfle.de>

v03:
- fold all three helpers into a single patch
v02:
- rename xc_is_known_page_type to sr_is_known_page_type
- move from ctrl/xc_private.h to saverestore/common.h (jgross)
---
 tools/libs/saverestore/common.h  | 86 ++++++++++++++++++++++++++++++++
 tools/libs/saverestore/restore.c | 38 +++-----------
 tools/libs/saverestore/save.c    | 18 +++----
 3 files changed, 99 insertions(+), 43 deletions(-)

compile-tested only

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index ca2eb47a4f..283d3c7213 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -467,6 +467,92 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 /* Handle a STATIC_DATA_END record. */
 int handle_static_data_end(struct xc_sr_context *ctx);
 
+/* Sanitiy check for types returned by Xen */
+static inline bool is_known_page_type(uint32_t type)
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
+
+    case XEN_DOMCTL_PFINFO_XTAB:
+    case XEN_DOMCTL_PFINFO_XALLOC: /* Synthetic type in Xen 4.2 - 4.5 */
+    case XEN_DOMCTL_PFINFO_BROKEN:
+        return true;
+    default:
+        break;
+    }
+    return false;
+}
+
+static inline bool page_type_to_populate(uint32_t type)
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
+
+    case XEN_DOMCTL_PFINFO_XALLOC:
+        return true;
+
+    case XEN_DOMCTL_PFINFO_XTAB:
+    case XEN_DOMCTL_PFINFO_BROKEN:
+    default:
+        break;
+    }
+    return false;
+}
+
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
+        break;
+    }
+
+    return false;
+}
 #endif
 /*
  * Local variables:
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index be259a1c6b..23ed359e4e 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -152,9 +152,7 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 
     for ( i = 0; i < count; ++i )
     {
-        if ( (!types || (types &&
-                         (types[i] != XEN_DOMCTL_PFINFO_XTAB &&
-                          types[i] != XEN_DOMCTL_PFINFO_BROKEN))) &&
+        if ( (!types || page_type_to_populate(types[i])) &&
              !pfn_is_populated(ctx, original_pfns[i]) )
         {
             rc = pfn_set_populated(ctx, original_pfns[i]);
@@ -233,25 +231,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
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
@@ -271,14 +252,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 
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
@@ -406,15 +381,14 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         }
 
         type = (pages->pfn[i] & PAGE_DATA_TYPE_MASK) >> 32;
-        if ( ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) >= 5) &&
-             ((type >> XEN_DOMCTL_PFINFO_LTAB_SHIFT) <= 8) )
+        if ( !is_known_page_type(type) )
         {
-            ERROR("Invalid type %#"PRIx32" for pfn %#"PRIpfn" (index %u)",
+            ERROR("Unknown type %#"PRIx32" for pfn %#"PRIpfn" (index %u)",
                   type, pfn, i);
             goto err;
         }
 
-        if ( type < XEN_DOMCTL_PFINFO_BROKEN )
+        if ( page_type_has_stream_data(type) )
             /* NOTAB and all L1 through L4 tables (including pinned) should
              * have a page worth of data in the record. */
             pages_of_data++;
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index 9540c93cde..fe3a7b3994 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
@@ -147,14 +147,15 @@ static int write_batch(struct xc_sr_context *ctx)
 
     for ( i = 0; i < nr_pfns; ++i )
     {
-        switch ( types[i] )
+        if ( !is_known_page_type(types[i]) )
         {
-        case XEN_DOMCTL_PFINFO_BROKEN:
-        case XEN_DOMCTL_PFINFO_XALLOC:
-        case XEN_DOMCTL_PFINFO_XTAB:
-            continue;
+            ERROR("Unknown type %#"PRIpfn" for pfn %#"PRIpfn, types[i], mfns[i]);
+            goto err;
         }
 
+        if ( !page_type_has_stream_data(types[i]) )
+            continue;
+
         mfns[nr_pages++] = mfns[i];
     }
 
@@ -171,13 +172,8 @@ static int write_batch(struct xc_sr_context *ctx)
 
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

