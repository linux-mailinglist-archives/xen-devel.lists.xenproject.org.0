Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF42482FC
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 12:31:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7ytJ-00068v-TX; Tue, 18 Aug 2020 10:30:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pr8P=B4=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k7ytI-0005zI-G8
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 10:30:52 +0000
X-Inumbo-ID: f17407ad-409f-4325-8f5f-79208b53798c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f17407ad-409f-4325-8f5f-79208b53798c;
 Tue, 18 Aug 2020 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=uCNYjocIfT1Bb/G3WJgONNuto9xcJ5WXtW2Z0YXVZkM=; b=1GCGsik4dClZ70iV2HUTJN3FXP
 zfqy9RHrLV3fNf33PTGeaVli3BY7UlacJPRQRKdrljetQrrG1jG0QryJFlE94ezYma91bypKiqrlP
 tENNnU00C/3CbSbQp8GUz8XXp8zlC1Cy+57zD7SJba142GdiPhcPO37hotTu9bZ9orAc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k7ytC-00014x-TE; Tue, 18 Aug 2020 10:30:46 +0000
Received: from host31-48-92-96.range31-48.btcentralplus.com ([31.48.92.96]
 helo=u2f063a87eabd5f.home) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k7ytC-0003Rw-LK; Tue, 18 Aug 2020 10:30:46 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v7 9/9] tools/libxc: add DOMAIN_CONTEXT records to the
 migration stream...
Date: Tue, 18 Aug 2020 11:30:32 +0100
Message-Id: <20200818103032.3050-10-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200818103032.3050-1-paul@xen.org>
References: <20200818103032.3050-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

... and bump the version.

This patch implements version 4 of the migration stream by adding the code
necessary to save and restore DOMAIN_CONTEXT records, and removing the code
to save the SHARED_INFO and TSC_INFO records (as these are deprecated in
version 4).

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wl@xen.org>

v7:
 - New in v7
---
 tools/libxc/xc_sr_common.h       |  3 ++
 tools/libxc/xc_sr_common_x86.c   | 20 ------------
 tools/libxc/xc_sr_common_x86.h   |  6 ----
 tools/libxc/xc_sr_restore.c      | 45 +++++++++++++++++++++++++--
 tools/libxc/xc_sr_save.c         | 52 +++++++++++++++++++++++++++++++-
 tools/libxc/xc_sr_save_x86_hvm.c |  5 ---
 tools/libxc/xc_sr_save_x86_pv.c  | 22 --------------
 7 files changed, 97 insertions(+), 56 deletions(-)

diff --git a/tools/libxc/xc_sr_common.h b/tools/libxc/xc_sr_common.h
index f3bdea8006..91ba918b32 100644
--- a/tools/libxc/xc_sr_common.h
+++ b/tools/libxc/xc_sr_common.h
@@ -298,6 +298,9 @@ struct xc_sr_context
 
             /* Sender has invoked verify mode on the stream. */
             bool verify;
+
+            /* Domain context blob. */
+            struct xc_sr_blob context;
         } restore;
     };
 
diff --git a/tools/libxc/xc_sr_common_x86.c b/tools/libxc/xc_sr_common_x86.c
index 77ea044a74..dda8e1053c 100644
--- a/tools/libxc/xc_sr_common_x86.c
+++ b/tools/libxc/xc_sr_common_x86.c
@@ -1,25 +1,5 @@
 #include "xc_sr_common_x86.h"
 
-int write_x86_tsc_info(struct xc_sr_context *ctx)
-{
-    xc_interface *xch = ctx->xch;
-    struct xc_sr_rec_x86_tsc_info tsc = {};
-    struct xc_sr_record rec = {
-        .type = REC_TYPE_X86_TSC_INFO,
-        .length = sizeof(tsc),
-        .data = &tsc,
-    };
-
-    if ( xc_domain_get_tsc_info(xch, ctx->domid, &tsc.mode,
-                                &tsc.nsec, &tsc.khz, &tsc.incarnation) < 0 )
-    {
-        PERROR("Unable to obtain TSC information");
-        return -1;
-    }
-
-    return write_record(ctx, &rec);
-}
-
 int handle_x86_tsc_info(struct xc_sr_context *ctx, struct xc_sr_record *rec)
 {
     xc_interface *xch = ctx->xch;
diff --git a/tools/libxc/xc_sr_common_x86.h b/tools/libxc/xc_sr_common_x86.h
index e08d81e0e7..39645d0196 100644
--- a/tools/libxc/xc_sr_common_x86.h
+++ b/tools/libxc/xc_sr_common_x86.h
@@ -3,12 +3,6 @@
 
 #include "xc_sr_common.h"
 
-/*
- * Obtains a domains TSC information from Xen and writes a X86_TSC_INFO record
- * into the stream.
- */
-int write_x86_tsc_info(struct xc_sr_context *ctx);
-
 /*
  * Parses a X86_TSC_INFO record and applies the result to the domain.
  */
diff --git a/tools/libxc/xc_sr_restore.c b/tools/libxc/xc_sr_restore.c
index bc811e6e3a..858d0c184e 100644
--- a/tools/libxc/xc_sr_restore.c
+++ b/tools/libxc/xc_sr_restore.c
@@ -35,9 +35,9 @@ static int read_headers(struct xc_sr_context *ctx)
         return -1;
     }
 
-    if ( ihdr.version < 2 || ihdr.version > 3 )
+    if ( ihdr.version < 2 || ihdr.version > 4 )
     {
-        ERROR("Invalid Version: Expected 2 <= ver <= 3, Got %d",
+        ERROR("Invalid Version: Expected 2 <= ver <= 4, Got %d",
               ihdr.version);
         return -1;
     }
@@ -529,6 +529,20 @@ static int send_checkpoint_dirty_pfn_list(struct xc_sr_context *ctx)
     return rc;
 }
 
+static int stream_complete(struct xc_sr_context *ctx)
+{
+    xc_interface *xch = ctx->xch;
+    int rc;
+
+    rc = xc_domain_setcontext(xch, ctx->domid,
+                              ctx->restore.context.ptr,
+                              ctx->restore.context.size);
+    if ( rc < 0 )
+        PERROR("Unable to restore domain context");
+
+    return rc;
+}
+
 static int process_record(struct xc_sr_context *ctx, struct xc_sr_record *rec);
 static int handle_checkpoint(struct xc_sr_context *ctx)
 {
@@ -597,6 +611,10 @@ static int handle_checkpoint(struct xc_sr_context *ctx)
         /* COLO */
 
         /* We need to resume guest */
+        rc = stream_complete(ctx);
+        if ( rc )
+            goto err;
+
         rc = ctx->restore.ops.stream_complete(ctx);
         if ( rc )
             goto err;
@@ -682,6 +700,21 @@ int handle_static_data_end(struct xc_sr_context *ctx)
     return rc;
 }
 
+/*
+ * Process a DOMAIN_CONTEXT record from the stream.
+ */
+static int handle_domain_context(struct xc_sr_context *ctx,
+                                 struct xc_sr_record *rec)
+{
+    xc_interface *xch = ctx->xch;
+    int rc = update_blob(&ctx->restore.context, rec->data, rec->length);
+
+    if ( rc )
+        ERROR("Unable to allocate %u bytes for domain context", rec->length);
+
+    return rc;
+}
+
 static int process_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
 {
     xc_interface *xch = ctx->xch;
@@ -709,6 +742,10 @@ static int process_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         rc = handle_static_data_end(ctx);
         break;
 
+    case REC_TYPE_DOMAIN_CONTEXT:
+        rc = handle_domain_context(ctx, rec);
+        break;
+
     default:
         rc = ctx->restore.ops.process_record(ctx, rec);
         break;
@@ -860,6 +897,10 @@ static int restore(struct xc_sr_context *ctx)
      * With Remus, if we reach here, there must be some error on primary,
      * failover from the last checkpoint state.
      */
+    rc = stream_complete(ctx);
+    if ( rc )
+        goto err;
+
     rc = ctx->restore.ops.stream_complete(ctx);
     if ( rc )
         goto err;
diff --git a/tools/libxc/xc_sr_save.c b/tools/libxc/xc_sr_save.c
index 80b1d5de1f..60f88d9c24 100644
--- a/tools/libxc/xc_sr_save.c
+++ b/tools/libxc/xc_sr_save.c
@@ -13,7 +13,7 @@ static int write_headers(struct xc_sr_context *ctx, uint16_t guest_type)
     struct xc_sr_ihdr ihdr = {
         .marker  = IHDR_MARKER,
         .id      = htonl(IHDR_ID),
-        .version = htonl(3),
+        .version = htonl(4),
         .options = htons(IHDR_OPT_LITTLE_ENDIAN),
     };
     struct xc_sr_dhdr dhdr = {
@@ -44,6 +44,52 @@ static int write_headers(struct xc_sr_context *ctx, uint16_t guest_type)
     return 0;
 }
 
+/*
+ * Writes a DOMAIN_CONTEXT record into the stream.
+ */
+static int write_domain_context_record(struct xc_sr_context *ctx)
+{
+    xc_interface *xch = ctx->xch;
+    struct xc_sr_record rec = {
+        .type = REC_TYPE_DOMAIN_CONTEXT,
+    };
+    size_t len = 0;
+    int rc;
+
+    rc = xc_domain_getcontext(xch, ctx->domid, NULL, &len);
+    if ( rc < 0 )
+    {
+        PERROR("can't get record length for dom %u\n", ctx->domid);
+        goto out;
+    }
+
+    rec.data = malloc(len);
+
+    rc = -1;
+    if ( !rec.data )
+    {
+        PERROR("can't allocate %lu bytes\n", len);
+        goto out;
+    }
+
+    rc = xc_domain_getcontext(xch, ctx->domid, rec.data, &len);
+    if ( rc < 0 )
+    {
+        PERROR("can't get domain record for dom %u\n", ctx->domid);
+        goto out;
+    }
+
+    rec.length = len;
+    rc = write_record(ctx, &rec);
+    if ( rc < 0 )
+        PERROR("failed to write DOMAIN_CONTEXT record");
+
+ out:
+    free(rec.data);
+
+    return rc;
+}
+
 /*
  * Writes an END record into the stream.
  */
@@ -905,6 +951,10 @@ static int save(struct xc_sr_context *ctx, uint16_t guest_type)
             goto err;
         }
 
+        rc = write_domain_context_record(ctx);
+        if ( rc )
+            goto err;
+
         rc = ctx->save.ops.end_of_checkpoint(ctx);
         if ( rc )
             goto err;
diff --git a/tools/libxc/xc_sr_save_x86_hvm.c b/tools/libxc/xc_sr_save_x86_hvm.c
index 0b2abb26bd..4c4de914c9 100644
--- a/tools/libxc/xc_sr_save_x86_hvm.c
+++ b/tools/libxc/xc_sr_save_x86_hvm.c
@@ -193,11 +193,6 @@ static int x86_hvm_end_of_checkpoint(struct xc_sr_context *ctx)
 {
     int rc;
 
-    /* Write the TSC record. */
-    rc = write_x86_tsc_info(ctx);
-    if ( rc )
-        return rc;
-
     /* Write the HVM_CONTEXT record. */
     rc = write_hvm_context(ctx);
     if ( rc )
diff --git a/tools/libxc/xc_sr_save_x86_pv.c b/tools/libxc/xc_sr_save_x86_pv.c
index c7e246ef4f..fdd2562994 100644
--- a/tools/libxc/xc_sr_save_x86_pv.c
+++ b/tools/libxc/xc_sr_save_x86_pv.c
@@ -849,20 +849,6 @@ static int write_x86_pv_p2m_frames(struct xc_sr_context *ctx)
     return rc;
 }
 
-/*
- * Writes an SHARED_INFO record into the stream.
- */
-static int write_shared_info(struct xc_sr_context *ctx)
-{
-    struct xc_sr_record rec = {
-        .type = REC_TYPE_SHARED_INFO,
-        .length = PAGE_SIZE,
-        .data = ctx->x86.pv.shinfo,
-    };
-
-    return write_record(ctx, &rec);
-}
-
 /*
  * Normalise a pagetable for the migration stream.  Performs mfn->pfn
  * conversions on the ptes.
@@ -1093,14 +1079,6 @@ static int x86_pv_end_of_checkpoint(struct xc_sr_context *ctx)
 {
     int rc;
 
-    rc = write_x86_tsc_info(ctx);
-    if ( rc )
-        return rc;
-
-    rc = write_shared_info(ctx);
-    if ( rc )
-        return rc;
-
     rc = write_all_vcpu_information(ctx);
     if ( rc )
         return rc;
-- 
2.20.1


