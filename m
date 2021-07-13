Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C72C3C7627
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155552.287256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnz-00007D-MT; Tue, 13 Jul 2021 18:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155552.287256; Tue, 13 Jul 2021 18:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnz-0008Ln-Fq; Tue, 13 Jul 2021 18:06:51 +0000
Received: by outflank-mailman (input) for mailman id 155552;
 Tue, 13 Jul 2021 18:06:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mnx-0002UL-Gz
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:49 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.171])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7527314-1255-4f65-8912-cbbd84ac5443;
 Tue, 13 Jul 2021 18:06:24 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6ItAz
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:18 +0200 (CEST)
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
X-Inumbo-ID: a7527314-1255-4f65-8912-cbbd84ac5443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199578;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mxNpwWOhZuO/yAfsj1BhbOC7Eeea1lW7O20Bo/SSJmE=;
    b=HbNTpUkaCGH7smmG0mRQLhqgGG/1A9vgPoaBIZvvS0ju1bTcHhjH8bJgkThGS+5kj8
    Vw7H9McJFKbB9GEXnNxveKT5SETAMzjYr49v6Kc514vP/JsCqEs0MwnmQ3pRbopO1w1V
    66eiIFywf3sEEsjffgaqezJ8UAfuuOSDF3/FmW/O29dAe0p2e1fbkAUB88eFaQBneVmd
    O8X3VLh2RlkPObAi+kI7ivGHR0A0Sv08BX/gpSMLv3M0W2/X1VpC7JwfVHu4ohGRlsqX
    s9obyuUsrbhve2kMKU4nQ8owzFf/SAkXGWv6HdtumjWT4/HVHVnCXS7O3c9R1QMBP5W2
    0IBQ==
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
Subject: [PATCH v20210713 17/31] tools: restore: preallocate map_errs array
Date: Tue, 13 Jul 2021 20:05:51 +0200
Message-Id: <20210713180605.12096-18-olaf@aepfle.de>
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
 tools/libs/guest/xg_sr_restore.c | 22 +++++++---------------
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 11e45dbdc5..336be98c93 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -259,6 +259,7 @@ struct xc_sr_context
             xen_pfn_t *pfns;
             uint32_t *types;
             xen_pfn_t *mfns;
+            int *map_errs;
 
             int send_back_fd;
             unsigned long p2m_size;
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index 24cd8c6a07..866a7c86cd 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -204,21 +204,12 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
                              xen_pfn_t *pfns, uint32_t *types, void *page_data)
 {
     xc_interface *xch = ctx->xch;
-    int *map_errs = malloc(count * sizeof(*map_errs));
     int rc;
     void *mapping = NULL, *guest_page = NULL;
     unsigned int i, /* i indexes the pfns from the record. */
         j,          /* j indexes the subset of pfns we decide to map. */
         nr_pages = 0;
 
-    if ( !map_errs )
-    {
-        rc = -1;
-        ERROR("Failed to allocate %zu bytes to process page data",
-              count * sizeof(*map_errs));
-        goto err;
-    }
-
     rc = populate_pfns(ctx, count, pfns, types);
     if ( rc )
     {
@@ -240,7 +231,7 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 
     mapping = guest_page = xenforeignmemory_map(
         xch->fmem, ctx->domid, PROT_READ | PROT_WRITE,
-        nr_pages, ctx->restore.mfns, map_errs);
+        nr_pages, ctx->restore.mfns, ctx->restore.map_errs);
     if ( !mapping )
     {
         rc = -1;
@@ -254,11 +245,11 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         if ( !page_type_has_stream_data(types[i]) )
             continue;
 
-        if ( map_errs[j] )
+        if ( ctx->restore.map_errs[j] )
         {
             rc = -1;
             ERROR("Mapping pfn %#"PRIpfn" (mfn %#"PRIpfn", type %#"PRIx32") failed with %d",
-                  pfns[i], ctx->restore.mfns[j], types[i], map_errs[j]);
+                  pfns[i], ctx->restore.mfns[j], types[i], ctx->restore.map_errs[j]);
             goto err;
         }
 
@@ -296,8 +287,6 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     if ( mapping )
         xenforeignmemory_unmap(xch->fmem, mapping, nr_pages);
 
-    free(map_errs);
-
     return rc;
 }
 
@@ -717,7 +706,9 @@ static int setup(struct xc_sr_context *ctx)
     ctx->restore.pfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.pfns));
     ctx->restore.types = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.types));
     ctx->restore.mfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.mfns));
-    if ( !ctx->restore.pfns || !ctx->restore.types || !ctx->restore.mfns )
+    ctx->restore.map_errs = malloc(MAX_BATCH_SIZE * sizeof(*ctx->restore.map_errs));
+    if ( !ctx->restore.pfns || !ctx->restore.types || !ctx->restore.mfns ||
+         !ctx->restore.map_errs )
     {
         ERROR("Unable to allocate memory");
         rc = -1;
@@ -754,6 +745,7 @@ static void cleanup(struct xc_sr_context *ctx)
 
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
+    free(ctx->restore.map_errs);
     free(ctx->restore.mfns);
     free(ctx->restore.types);
     free(ctx->restore.pfns);

