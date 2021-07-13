Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6D53C7652
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:16:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155619.287372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mx9-0000gr-GA; Tue, 13 Jul 2021 18:16:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155619.287372; Tue, 13 Jul 2021 18:16:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mx9-0000dN-BN; Tue, 13 Jul 2021 18:16:19 +0000
Received: by outflank-mailman (input) for mailman id 155619;
 Tue, 13 Jul 2021 18:16:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3MoK-0002kr-Um
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:07:12 +0000
Received: from mo4-p03-ob.smtp.rzone.de (unknown [85.215.255.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08fbe437-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:25 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6JtB1
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:19 +0200 (CEST)
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
X-Inumbo-ID: 08fbe437-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199579;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=wFaHjRr5CaNl9QDq6ACoz1L0ZIK5luGgqWXq90MCCnY=;
    b=iGZkvu+nFDp2Qi9G/qyWxe53jJ5q5rpan1wOShcflsFO4qJkJDt19PiA+mHfcbxnDs
    4mKieBHWjIJld2E6m1z3zkX0P1f2F/tai4zZufT5ngAXAf8KCRR/cHZxFmJlHu4++E3n
    dhiiXQ9bwccdaAdpCH/AW8A8S11ZhevYyoLSiGWNYYy2IiNVzs1XCd1Ss2hSPpzp6ru3
    aBlrRnhBGBHTGRGyQZYB6y4lgxvGrHIWeQ8vFB/tbSC/+Z9kHznU2lnKiy7nk5nVueJc
    2emK1CkzG69D1aj0YCdSBQ5yNRMH2LZvquqR5o/yQdUmrYekoYi4rgOZvtRGLjVaDbpe
    1kMA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgthqlagRsstpH9XYEN5v9xf7dypFU9ge5p0Oi0V"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210713 19/31] tools: restore: preallocate populate_pfns mfns array
Date: Tue, 13 Jul 2021 20:05:53 +0200
Message-Id: <20210713180605.12096-20-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove repeated allocation from migration loop. There will never be
more than MAX_BATCH_SIZE pages to process in an incoming batch.
Allocate the space once.

Use some prefix to avoid conflict with an array used in handle_page_data.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  |  1 +
 tools/libs/guest/xg_sr_restore.c | 23 ++++++++---------------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index ca44e59382..c6c6a31dc6 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -261,6 +261,7 @@ struct xc_sr_context
             xen_pfn_t *mfns;
             int *map_errs;
             xen_pfn_t *pp_pfns;
+            xen_pfn_t *pp_mfns;
 
             int send_back_fd;
             unsigned long p2m_size;
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index caac4bb5fa..2734ef06fd 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -138,17 +138,9 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
                   const xen_pfn_t *original_pfns, const uint32_t *types)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = malloc(count * sizeof(*mfns));
     unsigned int i, nr_pfns = 0;
     int rc = -1;
 
-    if ( !mfns )
-    {
-        ERROR("Failed to allocate %zu bytes for populating the physmap",
-              2 * count * sizeof(*mfns));
-        goto err;
-    }
-
     for ( i = 0; i < count; ++i )
     {
         if ( (!types || page_type_to_populate(types[i])) &&
@@ -157,7 +149,7 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
             rc = pfn_set_populated(ctx, original_pfns[i]);
             if ( rc )
                 goto err;
-            ctx->restore.pp_pfns[nr_pfns] = mfns[nr_pfns] = original_pfns[i];
+            ctx->restore.pp_pfns[nr_pfns] = ctx->restore.pp_mfns[nr_pfns] = original_pfns[i];
             ++nr_pfns;
         }
     }
@@ -165,7 +157,7 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
     if ( nr_pfns )
     {
         rc = xc_domain_populate_physmap_exact(
-            xch, ctx->domid, nr_pfns, 0, 0, mfns);
+            xch, ctx->domid, nr_pfns, 0, 0, ctx->restore.pp_mfns);
         if ( rc )
         {
             PERROR("Failed to populate physmap");
@@ -174,22 +166,20 @@ int populate_pfns(struct xc_sr_context *ctx, unsigned int count,
 
         for ( i = 0; i < nr_pfns; ++i )
         {
-            if ( mfns[i] == INVALID_MFN )
+            if ( ctx->restore.pp_mfns[i] == INVALID_MFN )
             {
                 ERROR("Populate physmap failed for pfn %u", i);
                 rc = -1;
                 goto err;
             }
 
-            ctx->restore.ops.set_gfn(ctx, ctx->restore.pp_pfns[i], mfns[i]);
+            ctx->restore.ops.set_gfn(ctx, ctx->restore.pp_pfns[i], ctx->restore.pp_mfns[i]);
         }
     }
 
     rc = 0;
 
  err:
-    free(mfns);
-
     return rc;
 }
 
@@ -706,8 +696,10 @@ static int setup(struct xc_sr_context *ctx)
     ctx->restore.mfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.mfns));
     ctx->restore.map_errs = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.map_errs));
     ctx->restore.pp_pfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.pp_pfns));
+    ctx->restore.pp_mfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.pp_mfns));
     if ( !ctx->restore.pfns || !ctx->restore.types || !ctx->restore.mfns ||
-         !ctx->restore.map_errs || !ctx->restore.pp_pfns )
+         !ctx->restore.map_errs || !ctx->restore.pp_pfns ||
+         !ctx->restore.pp_mfns )
     {
         ERROR("Unable to allocate memory");
         rc = -1;
@@ -744,6 +736,7 @@ static void cleanup(struct xc_sr_context *ctx)
 
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
+    free(ctx->restore.pp_mfns);
     free(ctx->restore.pp_pfns);
     free(ctx->restore.map_errs);
     free(ctx->restore.mfns);

