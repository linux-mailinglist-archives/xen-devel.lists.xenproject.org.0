Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A6B3C7624
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:06:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155549.287226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mns-0006vv-VW; Tue, 13 Jul 2021 18:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155549.287226; Tue, 13 Jul 2021 18:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mns-0006sL-Jl; Tue, 13 Jul 2021 18:06:44 +0000
Received: by outflank-mailman (input) for mailman id 155549;
 Tue, 13 Jul 2021 18:06:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mnq-0002kr-To
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:42 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06d8627e-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:21 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6FtAs
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:15 +0200 (CEST)
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
X-Inumbo-ID: 06d8627e-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199575;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=XZ2E1yVunQhUbaAeVwgeHEncoGw74SQmLvitByCyUhE=;
    b=RHia578d3804xnF/HNtoZnA2X/2CGarVamyyO7j3GnUaX6TPSHvkUoZK4DBlJjFUZB
    g0x8gmoFUdYRSH6umMAoyT5JHTyV03egjJudIRQKn7B24wzYCOywDQkgjoP6exjcu+yj
    ymO6EU2PhPiiAcIdfm7PVZbfvi69FQhGKeK+fPBcdtYd35jy1vl1d9qH6bbPNceObsx9
    /0WefHFCiwMB1CCwRafv/C6SDJeoBqXdn4GX7nZCjyiS5ATOFWL9wfiLB3PzCgflbUbx
    YnmE9XevkbQlXt50QBTHjsaqpCmcliu6AD/G2JtMrhEORfuINwgA6Hi7eNb/1ZGUBxOf
    RegA==
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
Subject: [PATCH v20210713 11/31] tools: save: preallocate rec_pfns array
Date: Tue, 13 Jul 2021 20:05:45 +0200
Message-Id: <20210713180605.12096-12-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove repeated allocation from migration loop. There will never be
more than MAX_BATCH_SIZE pages to process in a batch.
Allocate the space once.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h |  1 +
 tools/libs/guest/xg_sr_save.c   | 28 +++++++++++-----------------
 2 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index e2a068bb7e..b054661897 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -248,6 +248,7 @@ struct xc_sr_context
             xen_pfn_t *types;
             int *errors;
             struct iovec *iov;
+            uint64_t *rec_pfns;
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 92eba456e6..7c417f4a2a 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -95,7 +95,6 @@ static int write_batch(struct xc_sr_context *ctx)
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     void *page, *orig_page;
-    uint64_t *rec_pfns = NULL;
     int iovcnt = 0;
     struct xc_sr_rec_page_data_header hdr = { 0 };
     struct xc_sr_record rec = {
@@ -202,22 +201,15 @@ static int write_batch(struct xc_sr_context *ctx)
         }
     }
 
-    rec_pfns = malloc(nr_pfns * sizeof(*rec_pfns));
-    if ( !rec_pfns )
-    {
-        ERROR("Unable to allocate %zu bytes of memory for page data pfn list",
-              nr_pfns * sizeof(*rec_pfns));
-        goto err;
-    }
-
     hdr.count = nr_pfns;
 
     rec.length = sizeof(hdr);
-    rec.length += nr_pfns * sizeof(*rec_pfns);
+    rec.length += nr_pfns * sizeof(*ctx->save.rec_pfns);
     rec.length += nr_pages * PAGE_SIZE;
 
     for ( i = 0; i < nr_pfns; ++i )
-        rec_pfns[i] = ((uint64_t)(ctx->save.types[i]) << 32) | ctx->save.batch_pfns[i];
+        ctx->save.rec_pfns[i] = ((uint64_t)(ctx->save.types[i]) << 32) |
+                                ctx->save.batch_pfns[i];
 
     ctx->save.iov[0].iov_base = &rec.type;
     ctx->save.iov[0].iov_len = sizeof(rec.type);
@@ -228,12 +220,13 @@ static int write_batch(struct xc_sr_context *ctx)
     ctx->save.iov[2].iov_base = &hdr;
     ctx->save.iov[2].iov_len = sizeof(hdr);
 
-    ctx->save.iov[3].iov_base = rec_pfns;
-    ctx->save.iov[3].iov_len = nr_pfns * sizeof(*rec_pfns);
+    ctx->save.iov[3].iov_base = ctx->save.rec_pfns;
+    ctx->save.iov[3].iov_len = nr_pfns * sizeof(*ctx->save.rec_pfns);
 
     iovcnt = 4;
     ctx->save.pages_sent += nr_pages;
-    ctx->save.overhead_sent += sizeof(rec) + sizeof(hdr) + nr_pfns * sizeof(*rec_pfns);
+    ctx->save.overhead_sent += sizeof(rec) + sizeof(hdr) +
+                               nr_pfns * sizeof(*ctx->save.rec_pfns);
 
     if ( nr_pages )
     {
@@ -260,7 +253,6 @@ static int write_batch(struct xc_sr_context *ctx)
     rc = ctx->save.nr_batch_pfns = 0;
 
  err:
-    free(rec_pfns);
     if ( guest_mapping )
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; local_pages && i < nr_pfns; ++i )
@@ -844,11 +836,12 @@ static int setup(struct xc_sr_context *ctx)
     ctx->save.types = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.types));
     ctx->save.errors = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.errors));
     ctx->save.iov = malloc((4 + MAX_BATCH_SIZE) * sizeof(*ctx->save.iov));
+    ctx->save.rec_pfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.rec_pfns));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
 
     if ( !ctx->save.batch_pfns || !ctx->save.mfns || !ctx->save.types ||
-         !ctx->save.errors || !ctx->save.iov || !dirty_bitmap ||
-         !ctx->save.deferred_pages )
+         !ctx->save.errors || !ctx->save.iov || !ctx->save.rec_pfns ||
+         !dirty_bitmap || !ctx->save.deferred_pages )
     {
         ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
               " deferred pages");
@@ -879,6 +872,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
+    free(ctx->save.rec_pfns);
     free(ctx->save.iov);
     free(ctx->save.errors);
     free(ctx->save.types);

