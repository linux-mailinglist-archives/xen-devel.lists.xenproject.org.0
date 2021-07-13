Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5E3C7628
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:07:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155554.287269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mo2-0000mF-Gm; Tue, 13 Jul 2021 18:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155554.287269; Tue, 13 Jul 2021 18:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mo2-0000cb-6i; Tue, 13 Jul 2021 18:06:54 +0000
Received: by outflank-mailman (input) for mailman id 155554;
 Tue, 13 Jul 2021 18:06:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mo0-0002kr-UC
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:52 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06e2c55e-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:21 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6GtAt
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:16 +0200 (CEST)
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
X-Inumbo-ID: 06e2c55e-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199576;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=OMEAEb7NX4AU8uov75H5dJFOZP1BqztZJlpHGBMjQLg=;
    b=P2TG24K45DBPU/4N7u49xflxJX+B0lyYYFgOgIBOmGVMdlb0dVr84dZ9mWSph+fTyF
    mzJEQoShbw4m6PiJ4WwXpmUyL5rDVA4Js8B6BBnBiqGBVoC+eX8h64fQPiFnnzJOJYZD
    fzIPs+UpX0H1cHBM7qWA9xbB4WQW515+K7T8EGTica5RINupOdTnjkrbGfx4veOtYzmJ
    uv5BrYrOXfPQbilpjmrWzum/+jXMyyaLXvnjpM0XN26aqnWm3Ep6wpeTE1YvAv5nvgMy
    FHlIpgYkIUnbvYaA8a0qO8uhP/+2UONtGF6K6HO5cTmhoEax+iaRbrNkSx0R+tLBxy9x
    0qAw==
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
Subject: [PATCH v20210713 12/31] tools: save: preallocate guest_data array
Date: Tue, 13 Jul 2021 20:05:46 +0200
Message-Id: <20210713180605.12096-13-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove repeated allocation from migration loop. There will never be
more than MAX_BATCH_SIZE pages to process in a batch.
Allocate the space once.

Because this was allocated with calloc:
Adjust the loop to clear unused entries as needed.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h |  1 +
 tools/libs/guest/xg_sr_save.c   | 20 +++++++++++---------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index b054661897..b90b35e564 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -249,6 +249,7 @@ struct xc_sr_context
             int *errors;
             struct iovec *iov;
             uint64_t *rec_pfns;
+            void **guest_data;
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 7c417f4a2a..0ab8b7205c 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -89,7 +89,6 @@ static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
     void *guest_mapping = NULL;
-    void **guest_data = NULL;
     void **local_pages = NULL;
     int rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
@@ -103,12 +102,10 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Pointers to page data to send.  Mapped gfns or local allocations. */
-    guest_data = calloc(nr_pfns, sizeof(*guest_data));
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
 
-    if ( !guest_data || !local_pages )
+    if ( !local_pages )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -165,7 +162,10 @@ static int write_batch(struct xc_sr_context *ctx)
         for ( i = 0, p = 0; i < nr_pfns; ++i )
         {
             if ( !page_type_has_stream_data(ctx->save.types[i]) )
+            {
+                ctx->save.guest_data[i] = NULL;
                 continue;
+            }
 
             if ( ctx->save.errors[p] )
             {
@@ -183,6 +183,7 @@ static int write_batch(struct xc_sr_context *ctx)
 
             if ( rc )
             {
+                ctx->save.guest_data[i] = NULL;
                 if ( rc == -1 && errno == EAGAIN )
                 {
                     set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
@@ -194,7 +195,7 @@ static int write_batch(struct xc_sr_context *ctx)
                     goto err;
             }
             else
-                guest_data[i] = page;
+                ctx->save.guest_data[i] = page;
 
             rc = -1;
             ++p;
@@ -232,9 +233,9 @@ static int write_batch(struct xc_sr_context *ctx)
     {
         for ( i = 0; i < nr_pfns; ++i )
         {
-            if ( guest_data[i] )
+            if ( ctx->save.guest_data[i] )
             {
-                ctx->save.iov[iovcnt].iov_base = guest_data[i];
+                ctx->save.iov[iovcnt].iov_base = ctx->save.guest_data[i];
                 ctx->save.iov[iovcnt].iov_len = PAGE_SIZE;
                 iovcnt++;
                 --nr_pages;
@@ -258,7 +259,6 @@ static int write_batch(struct xc_sr_context *ctx)
     for ( i = 0; local_pages && i < nr_pfns; ++i )
         free(local_pages[i]);
     free(local_pages);
-    free(guest_data);
 
     return rc;
 }
@@ -837,11 +837,12 @@ static int setup(struct xc_sr_context *ctx)
     ctx->save.errors = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.errors));
     ctx->save.iov = malloc((4 + MAX_BATCH_SIZE) * sizeof(*ctx->save.iov));
     ctx->save.rec_pfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.rec_pfns));
+    ctx->save.guest_data = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.guest_data));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
 
     if ( !ctx->save.batch_pfns || !ctx->save.mfns || !ctx->save.types ||
          !ctx->save.errors || !ctx->save.iov || !ctx->save.rec_pfns ||
-         !dirty_bitmap || !ctx->save.deferred_pages )
+         !ctx->save.guest_data ||!dirty_bitmap || !ctx->save.deferred_pages )
     {
         ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
               " deferred pages");
@@ -872,6 +873,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
+    free(ctx->save.guest_data);
     free(ctx->save.rec_pfns);
     free(ctx->save.iov);
     free(ctx->save.errors);

