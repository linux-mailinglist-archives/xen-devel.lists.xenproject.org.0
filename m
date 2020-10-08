Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE7D287C6C
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 21:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4612.12174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbVG-00023I-7b; Thu, 08 Oct 2020 19:23:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4612.12174; Thu, 08 Oct 2020 19:23:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbVG-00022t-4O; Thu, 08 Oct 2020 19:23:02 +0000
Received: by outflank-mailman (input) for mailman id 4612;
 Thu, 08 Oct 2020 19:22:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kQbVD-00022n-0J
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:22:59 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ca40446-ffd0-4a4d-8213-18c2ccb5eaf2;
 Thu, 08 Oct 2020 19:22:58 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQbVA-0004dz-OJ; Thu, 08 Oct 2020 19:22:56 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6t-0002P9-WA; Thu, 08 Oct 2020 18:57:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kQbVD-00022n-0J
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:22:59 +0000
X-Inumbo-ID: 5ca40446-ffd0-4a4d-8213-18c2ccb5eaf2
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5ca40446-ffd0-4a4d-8213-18c2ccb5eaf2;
	Thu, 08 Oct 2020 19:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=Ci9ElP7+t6nSyjJlvsrEVOvf1v3Xr2+ABAE93SLLx1k=; b=df3O5q3+SZF71Hv5AwwF8CGSdI
	wpSBcvUqgbAeFlsZ3g1+teZRisgnU6KTJuwHTayscSaZuy/sNf4CoFaHS19JHzR1+9LijZ/RL61d5
	b4azNpI0UfcLk7/yCx98fieKlZW8hjhZwvfylZag2Qun96m+8xX+BW85SeahnMilBHns=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQbVA-0004dz-OJ; Thu, 08 Oct 2020 19:22:56 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6t-0002P9-WA; Thu, 08 Oct 2020 18:57:52 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 10/11] tools/libs/guest: add code to restore a v4 libxc stream
Date: Thu,  8 Oct 2020 19:57:34 +0100
Message-Id: <20201008185735.29875-11-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008185735.29875-1-paul@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This patch adds the necessary code to accept a v4 stream, and to recognise and
restore a REC_TYPE_DOMAIN_CONTEXT record.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>

v10:
 - New in v10
 - Derived from patch #8 of the v9 series
 - Fix memory leak
---
 tools/libs/guest/xg_sr_common.c          |  1 +
 tools/libs/guest/xg_sr_common.h          |  3 +++
 tools/libs/guest/xg_sr_restore.c         | 24 ++++++++++++++++++++++--
 tools/libs/guest/xg_sr_restore_x86_hvm.c |  9 +++++++++
 tools/libs/guest/xg_sr_restore_x86_pv.c  |  9 +++++++++
 5 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 17567ab133..f813320202 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -39,6 +39,7 @@ static const char *const mandatory_rec_types[] =
     [REC_TYPE_STATIC_DATA_END]              = "Static data end",
     [REC_TYPE_X86_CPUID_POLICY]             = "x86 CPUID policy",
     [REC_TYPE_X86_MSR_POLICY]               = "x86 MSR policy",
+    [REC_TYPE_DOMAIN_CONTEXT]               = "Domain context",
 };
 
 const char *rec_type_to_str(uint32_t type)
diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index cc3ad1c394..ba9e5b0a84 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -297,6 +297,9 @@ struct xc_sr_context
 
             /* Sender has invoked verify mode on the stream. */
             bool verify;
+
+            /* Domain context blob. */
+            struct xc_sr_blob dom_ctx;
         } restore;
     };
 
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index b57a787519..9d2bbdfaa3 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
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
@@ -682,6 +682,21 @@ int handle_static_data_end(struct xc_sr_context *ctx)
     return rc;
 }
 
+/*
+ * Process a DOMAIN_CONTEXT record from the stream.
+ */
+static int handle_domain_context(struct xc_sr_context *ctx,
+                                 struct xc_sr_record *rec)
+{
+    xc_interface *xch = ctx->xch;
+    int rc = update_blob(&ctx->restore.dom_ctx, rec->data, rec->length);
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
@@ -709,6 +724,10 @@ static int process_record(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         rc = handle_static_data_end(ctx);
         break;
 
+    case REC_TYPE_DOMAIN_CONTEXT:
+        rc = handle_domain_context(ctx, rec);
+        break;
+
     default:
         rc = ctx->restore.ops.process_record(ctx, rec);
         break;
@@ -784,6 +803,7 @@ static void cleanup(struct xc_sr_context *ctx)
 
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
+    free(ctx->restore.dom_ctx.ptr);
 
     if ( ctx->restore.ops.cleanup(ctx) )
         PERROR("Failed to clean up");
diff --git a/tools/libs/guest/xg_sr_restore_x86_hvm.c b/tools/libs/guest/xg_sr_restore_x86_hvm.c
index d6ea6f3012..6bb164b9f0 100644
--- a/tools/libs/guest/xg_sr_restore_x86_hvm.c
+++ b/tools/libs/guest/xg_sr_restore_x86_hvm.c
@@ -225,6 +225,15 @@ static int x86_hvm_stream_complete(struct xc_sr_context *ctx)
         return rc;
     }
 
+    rc = xc_domain_set_context(xch, ctx->domid,
+                               ctx->restore.dom_ctx.ptr,
+                               ctx->restore.dom_ctx.size);
+    if ( rc )
+    {
+        PERROR("Unable to restore Domain context");
+        return rc;
+    }
+
     rc = xc_dom_gnttab_seed(xch, ctx->domid, true,
                             ctx->restore.console_gfn,
                             ctx->restore.xenstore_gfn,
diff --git a/tools/libs/guest/xg_sr_restore_x86_pv.c b/tools/libs/guest/xg_sr_restore_x86_pv.c
index dc50b0f5a8..2dafad7b83 100644
--- a/tools/libs/guest/xg_sr_restore_x86_pv.c
+++ b/tools/libs/guest/xg_sr_restore_x86_pv.c
@@ -1134,6 +1134,15 @@ static int x86_pv_stream_complete(struct xc_sr_context *ctx)
     if ( rc )
         return rc;
 
+    rc = xc_domain_set_context(xch, ctx->domid,
+                               ctx->restore.dom_ctx.ptr,
+                               ctx->restore.dom_ctx.size);
+    if ( rc )
+    {
+        PERROR("Unable to restore Domain context");
+        return rc;
+    }
+
     rc = xc_dom_gnttab_seed(xch, ctx->domid, false,
                             ctx->restore.console_gfn,
                             ctx->restore.xenstore_gfn,
-- 
2.20.1


