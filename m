Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA592F1CC1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65110.115317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DU-000330-Ul; Mon, 11 Jan 2021 17:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65110.115317; Mon, 11 Jan 2021 17:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DU-000321-Mz; Mon, 11 Jan 2021 17:42:56 +0000
Received: by outflank-mailman (input) for mailman id 65110;
 Mon, 11 Jan 2021 17:42:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1DS-0002a6-WA
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:42:55 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 995c1bff-5d15-4f52-b935-8350b21bd9cd;
 Mon, 11 Jan 2021 17:42:40 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgWM3R
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:32 +0100 (CET)
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
X-Inumbo-ID: 995c1bff-5d15-4f52-b935-8350b21bd9cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386959;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=yv4/vNzbLjhhKaj2O8jZKB9GBNc7GvmmLKVV7dABzFU=;
	b=lF8D0wpkkGCbRjwRjGkJAZMm66oo/3sv1k9DcojkZua3fsqAQ7Mol6A0QMmeZonhnB
	/GxiQY9BfHjbAOqbgknuTAOhBfdi1jNZejJBBFodnLQaT72PZabkRCzUxwUShaem1i2c
	hKwn8bMYQ0TPYZmVTJa0PjfbBy5gijg6m2lcWzCVYwXW1yL4nj4m6wbRFYW8FCE/n52h
	a7pXx2o5rSH4gfUKcfFtKnB4EW5HQ6ajU9uov60oOHuveY/CGmKtbl6njshIzHIPfqSt
	B/zFlKS4aCj29o812q54k56XJiQuIIdUavm5AlrfAk42gqdegXOhIsPTzw3FXVXcGjIV
	8oHQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 12/39] tools: unify type checking for data pfns in migration stream
Date: Mon, 11 Jan 2021 18:41:57 +0100
Message-Id: <20210111174224.24714-13-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a helper which decides if a given pfn type has data
for the migration stream.

No change in behavior intended.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  | 17 ++++++++++++++++
 tools/libs/guest/xg_sr_restore.c | 34 +++++---------------------------
 tools/libs/guest/xg_sr_save.c    | 14 ++-----------
 3 files changed, 24 insertions(+), 41 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index cc3ad1c394..70e328e951 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -455,6 +455,23 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 /* Handle a STATIC_DATA_END record. */
 int handle_static_data_end(struct xc_sr_context *ctx);
 
+static inline bool page_type_has_stream_data(uint32_t type)
+{
+    bool ret;
+
+    switch (type)
+    {
+    case XEN_DOMCTL_PFINFO_XTAB:
+    case XEN_DOMCTL_PFINFO_XALLOC:
+    case XEN_DOMCTL_PFINFO_BROKEN:
+        ret = false;
+        break;
+    default:
+        ret = true;
+        break;
+    }
+    return ret;
+}
 #endif
 /*
  * Local variables:
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index f1c3169229..0332ae9f32 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -152,9 +152,8 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 
     for ( i = 0; i < count; ++i )
     {
-        if ( (!types || (types &&
-                         (types[i] != XEN_DOMCTL_PFINFO_XTAB &&
-                          types[i] != XEN_DOMCTL_PFINFO_BROKEN))) &&
+        if ( (!types ||
+              (types && page_type_has_stream_data(types[i]) == true)) &&
              !pfn_is_populated(ctx, original_pfns[i]) )
         {
             rc = pfn_set_populated(ctx, original_pfns[i]);
@@ -233,25 +232,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
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
+        if ( page_type_has_stream_data(types[i]) == true )
             mfns[nr_pages++] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
-            break;
-        }
     }
 
     /* Nothing to do? */
@@ -271,14 +253,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 
     for ( i = 0, j = 0; i < count; ++i )
     {
-        switch ( types[i] )
-        {
-        case XEN_DOMCTL_PFINFO_XTAB:
-        case XEN_DOMCTL_PFINFO_BROKEN:
-        case XEN_DOMCTL_PFINFO_XALLOC:
-            /* No page data to deal with. */
+        if ( page_type_has_stream_data(types[i]) == false )
             continue;
-        }
 
         if ( map_errs[j] )
         {
@@ -413,7 +389,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
             goto err;
         }
 
-        if ( type < XEN_DOMCTL_PFINFO_BROKEN )
+        if ( page_type_has_stream_data(type) == true )
             /* NOTAB and all L1 through L4 tables (including pinned) should
              * have a page worth of data in the record. */
             pages_of_data++;
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 044d0ae3aa..0546d3d9e6 100644
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
+        if ( page_type_has_stream_data(types[i]) == false )
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
+            if ( page_type_has_stream_data(types[i]) == false )
                 continue;
-            }
 
             if ( errors[p] )
             {

