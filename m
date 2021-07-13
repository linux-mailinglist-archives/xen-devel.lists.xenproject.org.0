Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFA83C7626
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:06:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155551.287248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnx-00085I-VY; Tue, 13 Jul 2021 18:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155551.287248; Tue, 13 Jul 2021 18:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnx-0007z7-Lt; Tue, 13 Jul 2021 18:06:49 +0000
Received: by outflank-mailman (input) for mailman id 155551;
 Tue, 13 Jul 2021 18:06:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mnv-0002kr-Tv
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:47 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.83])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06e2c55c-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:21 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6FtAr
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
X-Inumbo-ID: 06e2c55c-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199575;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=VixOpRBMsoM0fDQKIvQSxrobwoztUo22eEi66PpWlks=;
    b=AVCvEuKrE0LIt1SG29Y5us1wSfMsF0h+fPKTaGaZ1W8adH59yDqT9H6WSPjLOeG3d6
    rpKNTUQpwPwQFnoJZHAe244nYJVrojPKzFNAQ+YM9gIwKf0BLXXS69yePFMivqBapQvD
    FKUhywPEjBhWuktE5tXwjuXXApsN/7w17X4mYRITmpgVLOnSM4+IB+y4tpauw6n9gSQH
    vdDl7o/FHRHemtvrfZ+6ihl4scNghZeomLPtMWfgUuwPvRHn+oh29q4gJCMchZh5HDHm
    tou+a0RAQAobxOmqomf0F9VqqfKznq7KPffA66if6z4aQqCaX55dtnXyg0QR4ub1N6q5
    LDRQ==
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
Subject: [PATCH v20210713 10/31] tools: save: preallocate iov array
Date: Tue, 13 Jul 2021 20:05:44 +0200
Message-Id: <20210713180605.12096-11-olaf@aepfle.de>
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
 tools/libs/guest/xg_sr_save.c   | 34 ++++++++++++++++-----------------
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index d2b838ed33..e2a068bb7e 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -247,6 +247,7 @@ struct xc_sr_context
             xen_pfn_t *mfns;
             xen_pfn_t *types;
             int *errors;
+            struct iovec *iov;
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 5b416fda60..92eba456e6 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -96,7 +96,7 @@ static int write_batch(struct xc_sr_context *ctx)
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     void *page, *orig_page;
     uint64_t *rec_pfns = NULL;
-    struct iovec *iov = NULL; int iovcnt = 0;
+    int iovcnt = 0;
     struct xc_sr_rec_page_data_header hdr = { 0 };
     struct xc_sr_record rec = {
         .type = REC_TYPE_PAGE_DATA,
@@ -108,10 +108,8 @@ static int write_batch(struct xc_sr_context *ctx)
     guest_data = calloc(nr_pfns, sizeof(*guest_data));
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
-    /* iovec[] for writev(). */
-    iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !guest_data || !local_pages || !iov )
+    if ( !guest_data || !local_pages )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -221,17 +219,17 @@ static int write_batch(struct xc_sr_context *ctx)
     for ( i = 0; i < nr_pfns; ++i )
         rec_pfns[i] = ((uint64_t)(ctx->save.types[i]) << 32) | ctx->save.batch_pfns[i];
 
-    iov[0].iov_base = &rec.type;
-    iov[0].iov_len = sizeof(rec.type);
+    ctx->save.iov[0].iov_base = &rec.type;
+    ctx->save.iov[0].iov_len = sizeof(rec.type);
 
-    iov[1].iov_base = &rec.length;
-    iov[1].iov_len = sizeof(rec.length);
+    ctx->save.iov[1].iov_base = &rec.length;
+    ctx->save.iov[1].iov_len = sizeof(rec.length);
 
-    iov[2].iov_base = &hdr;
-    iov[2].iov_len = sizeof(hdr);
+    ctx->save.iov[2].iov_base = &hdr;
+    ctx->save.iov[2].iov_len = sizeof(hdr);
 
-    iov[3].iov_base = rec_pfns;
-    iov[3].iov_len = nr_pfns * sizeof(*rec_pfns);
+    ctx->save.iov[3].iov_base = rec_pfns;
+    ctx->save.iov[3].iov_len = nr_pfns * sizeof(*rec_pfns);
 
     iovcnt = 4;
     ctx->save.pages_sent += nr_pages;
@@ -243,15 +241,15 @@ static int write_batch(struct xc_sr_context *ctx)
         {
             if ( guest_data[i] )
             {
-                iov[iovcnt].iov_base = guest_data[i];
-                iov[iovcnt].iov_len = PAGE_SIZE;
+                ctx->save.iov[iovcnt].iov_base = guest_data[i];
+                ctx->save.iov[iovcnt].iov_len = PAGE_SIZE;
                 iovcnt++;
                 --nr_pages;
             }
         }
     }
 
-    if ( writev_exact(ctx->fd, iov, iovcnt) )
+    if ( writev_exact(ctx->fd, ctx->save.iov, iovcnt) )
     {
         PERROR("Failed to write page data to stream");
         goto err;
@@ -267,7 +265,6 @@ static int write_batch(struct xc_sr_context *ctx)
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; local_pages && i < nr_pfns; ++i )
         free(local_pages[i]);
-    free(iov);
     free(local_pages);
     free(guest_data);
 
@@ -846,10 +843,12 @@ static int setup(struct xc_sr_context *ctx)
     ctx->save.mfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.mfns));
     ctx->save.types = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.types));
     ctx->save.errors = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.errors));
+    ctx->save.iov = malloc((4 + MAX_BATCH_SIZE) * sizeof(*ctx->save.iov));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
 
     if ( !ctx->save.batch_pfns || !ctx->save.mfns || !ctx->save.types ||
-         !ctx->save.errors || !dirty_bitmap || !ctx->save.deferred_pages )
+         !ctx->save.errors || !ctx->save.iov || !dirty_bitmap ||
+         !ctx->save.deferred_pages )
     {
         ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
               " deferred pages");
@@ -880,6 +879,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
+    free(ctx->save.iov);
     free(ctx->save.errors);
     free(ctx->save.types);
     free(ctx->save.mfns);

