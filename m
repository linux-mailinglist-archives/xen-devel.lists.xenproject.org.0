Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D7F3C7625
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:06:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155550.287236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnv-0007U9-9r; Tue, 13 Jul 2021 18:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155550.287236; Tue, 13 Jul 2021 18:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnv-0007PD-3Z; Tue, 13 Jul 2021 18:06:47 +0000
Received: by outflank-mailman (input) for mailman id 155550;
 Tue, 13 Jul 2021 18:06:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mns-0002UL-Gq
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:44 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.170])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c567cd93-a813-4192-b89f-81bbb939ef08;
 Tue, 13 Jul 2021 18:06:24 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6HtAy
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:17 +0200 (CEST)
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
X-Inumbo-ID: c567cd93-a813-4192-b89f-81bbb939ef08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199578;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=YRVl0CnaOM9g6RFoif4tiboPYUw5yevknXWVbW/ME0k=;
    b=Zs0Xodk75jN9h8CKY05mz+GWB0Wz5eCjvywwarFzGRPrEFHLwAHucVDm8au4Ux6H66
    GtTv3WTWHmD6XQYoLcwZZ+W9ijQz/8VpWCoNBjpKy1l+MOiWvdpHruGmTbOC7UrD697J
    lXG3wzeply4r3vA6GZWact/xyfIx++IO0LgqWmcpoXUd4QsjjOxMuXS1o2aa+kjwkAm6
    G3ZsvgM4Q9zIlbyUtyEpVID6ePweIT0UOaxldvdb9kT9CuYZbKxdiu143sYRMjssmgJe
    e6OzjVAhuGbh1iZzr8BPPBw4ZRdnU240FHtjHybfjY28FwtgT+rVXZCVAwfJr1w3y331
    6M8g==
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
Subject: [PATCH v20210713 16/31] tools: restore: preallocate mfns array
Date: Tue, 13 Jul 2021 20:05:50 +0200
Message-Id: <20210713180605.12096-17-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove repeated allocation from migration loop. There will never be
more than MAX_BATCH_SIZE pages to process in an incoming batch.
Allocate the space once.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h  |  1 +
 tools/libs/guest/xg_sr_restore.c | 16 ++++++++--------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index bd2027ba5d..11e45dbdc5 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -258,6 +258,7 @@ struct xc_sr_context
             struct restore_callbacks *callbacks;
             xen_pfn_t *pfns;
             uint32_t *types;
+            xen_pfn_t *mfns;
 
             int send_back_fd;
             unsigned long p2m_size;
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index bbb55b6844..24cd8c6a07 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -204,7 +204,6 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
                              xen_pfn_t *pfns, uint32_t *types, void *page_data)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = malloc(count * sizeof(*mfns));
     int *map_errs = malloc(count * sizeof(*map_errs));
     int rc;
     void *mapping = NULL, *guest_page = NULL;
@@ -212,11 +211,11 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         j,          /* j indexes the subset of pfns we decide to map. */
         nr_pages = 0;
 
-    if ( !mfns || !map_errs )
+    if ( !map_errs )
     {
         rc = -1;
         ERROR("Failed to allocate %zu bytes to process page data",
-              count * (sizeof(*mfns) + sizeof(*map_errs)));
+              count * sizeof(*map_errs));
         goto err;
     }
 
@@ -232,7 +231,7 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         ctx->restore.ops.set_page_type(ctx, pfns[i], types[i]);
 
         if ( page_type_has_stream_data(types[i]) )
-            mfns[nr_pages++] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
+            ctx->restore.mfns[nr_pages++] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
     }
 
     /* Nothing to do? */
@@ -241,7 +240,7 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 
     mapping = guest_page = xenforeignmemory_map(
         xch->fmem, ctx->domid, PROT_READ | PROT_WRITE,
-        nr_pages, mfns, map_errs);
+        nr_pages, ctx->restore.mfns, map_errs);
     if ( !mapping )
     {
         rc = -1;
@@ -259,7 +258,7 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         {
             rc = -1;
             ERROR("Mapping pfn %#"PRIpfn" (mfn %#"PRIpfn", type %#"PRIx32") failed with %d",
-                  pfns[i], mfns[j], types[i], map_errs[j]);
+                  pfns[i], ctx->restore.mfns[j], types[i], map_errs[j]);
             goto err;
         }
 
@@ -298,7 +297,6 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         xenforeignmemory_unmap(xch->fmem, mapping, nr_pages);
 
     free(map_errs);
-    free(mfns);
 
     return rc;
 }
@@ -718,7 +716,8 @@ static int setup(struct xc_sr_context *ctx)
 
     ctx->restore.pfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.pfns));
     ctx->restore.types = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.types));
-    if ( !ctx->restore.pfns  || !ctx->restore.types )
+    ctx->restore.mfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.mfns));
+    if ( !ctx->restore.pfns || !ctx->restore.types || !ctx->restore.mfns )
     {
         ERROR("Unable to allocate memory");
         rc = -1;
@@ -755,6 +754,7 @@ static void cleanup(struct xc_sr_context *ctx)
 
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
+    free(ctx->restore.mfns);
     free(ctx->restore.types);
     free(ctx->restore.pfns);
 

