Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27F4287C6D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 21:23:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4613.12186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQbVJ-00025L-K3; Thu, 08 Oct 2020 19:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4613.12186; Thu, 08 Oct 2020 19:23:05 +0000
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
	id 1kQbVJ-00024k-Du; Thu, 08 Oct 2020 19:23:05 +0000
Received: by outflank-mailman (input) for mailman id 4613;
 Thu, 08 Oct 2020 19:23:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kQbVH-00022n-V7
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:23:03 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15f5fd7e-b207-46b1-9f4d-2ad76c0f10ab;
 Thu, 08 Oct 2020 19:22:58 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQbVA-0004dx-MV; Thu, 08 Oct 2020 19:22:56 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kQb6u-0002P9-W8; Thu, 08 Oct 2020 18:57:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=3RzB=DP=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kQbVH-00022n-V7
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 19:23:03 +0000
X-Inumbo-ID: 15f5fd7e-b207-46b1-9f4d-2ad76c0f10ab
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 15f5fd7e-b207-46b1-9f4d-2ad76c0f10ab;
	Thu, 08 Oct 2020 19:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=NK7CpHuHkdziWvYnINTC4RC1wRqkyK5TJ03pOR95Gpw=; b=fgPKe+f5yoRg42ttK4I/VvlcO9
	UL8ifZWH2gcHck4+lsRqprbrM2r3/gvTAUXtNiIAkxciGsycfdWXQTjkpSHKRWfLz6wTUCXuciwlE
	3wHOrcUtitTYdZV5X6p+fKxDMCKykIx4oSE0RhMlA3sVcp5BvXsJ+ExhhwkfkPmJg1c8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQbVA-0004dx-MV; Thu, 08 Oct 2020 19:22:56 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kQb6u-0002P9-W8; Thu, 08 Oct 2020 18:57:53 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 11/11] tools/libs/guest: add code to save a v4 libxc stream
Date: Thu,  8 Oct 2020 19:57:35 +0100
Message-Id: <20201008185735.29875-12-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201008185735.29875-1-paul@xen.org>
References: <20201008185735.29875-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This patch adds the necessary code to save a REC_TYPE_DOMAIN_CONTEXT record,
and stop saving the now obsolete REC_TYPE_SHARED_INFO and REC_TYPE_TSC_INFO
records for PV guests.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>

v10:
 - New in v10
 - Derived from patch #8 of the v9 series
---
 tools/libs/guest/xg_sr_common_x86.c   | 20 -----------
 tools/libs/guest/xg_sr_common_x86.h   |  6 ----
 tools/libs/guest/xg_sr_save.c         | 52 ++++++++++++++++++++++++++-
 tools/libs/guest/xg_sr_save_x86_hvm.c |  5 ---
 tools/libs/guest/xg_sr_save_x86_pv.c  | 22 ------------
 5 files changed, 51 insertions(+), 54 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
index 6f12483907..10a35b998e 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/guest/xg_sr_common_x86.c
@@ -1,25 +1,5 @@
 #include "xg_sr_common_x86.h"
 
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
diff --git a/tools/libs/guest/xg_sr_common_x86.h b/tools/libs/guest/xg_sr_common_x86.h
index b55758c96d..e504169705 100644
--- a/tools/libs/guest/xg_sr_common_x86.h
+++ b/tools/libs/guest/xg_sr_common_x86.h
@@ -3,12 +3,6 @@
 
 #include "xg_sr_common.h"
 
-/*
- * Obtains a domains TSC information from Xen and writes a X86_TSC_INFO record
- * into the stream.
- */
-int write_x86_tsc_info(struct xc_sr_context *ctx);
-
 /*
  * Parses a X86_TSC_INFO record and applies the result to the domain.
  */
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 2ba7c3200c..3eecc3e987 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
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
+    rc = xc_domain_get_context(xch, ctx->domid, NULL, &len);
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
+    rc = xc_domain_get_context(xch, ctx->domid, rec.data, &len);
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
diff --git a/tools/libs/guest/xg_sr_save_x86_hvm.c b/tools/libs/guest/xg_sr_save_x86_hvm.c
index 1634a7bc43..d44fb3fc4f 100644
--- a/tools/libs/guest/xg_sr_save_x86_hvm.c
+++ b/tools/libs/guest/xg_sr_save_x86_hvm.c
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
diff --git a/tools/libs/guest/xg_sr_save_x86_pv.c b/tools/libs/guest/xg_sr_save_x86_pv.c
index 4964f1f7b8..3de7b19f54 100644
--- a/tools/libs/guest/xg_sr_save_x86_pv.c
+++ b/tools/libs/guest/xg_sr_save_x86_pv.c
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


