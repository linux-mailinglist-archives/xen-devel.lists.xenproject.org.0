Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EABFB3C7622
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155544.287193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnl-0005M2-4g; Tue, 13 Jul 2021 18:06:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155544.287193; Tue, 13 Jul 2021 18:06:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnk-0005JJ-Tp; Tue, 13 Jul 2021 18:06:36 +0000
Received: by outflank-mailman (input) for mailman id 155544;
 Tue, 13 Jul 2021 18:06:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mni-0002UL-GY
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:34 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b4da61c-8660-40a3-9938-c1ee21a1e524;
 Tue, 13 Jul 2021 18:06:21 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6EtAq
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:14 +0200 (CEST)
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
X-Inumbo-ID: 7b4da61c-8660-40a3-9938-c1ee21a1e524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199575;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=JHY4TWvZbK0Ujx5K1FzKpVZtdjbItuCiEYMs+LDvHbM=;
    b=ljQs4jTzCjTxtbdo8sA7N9xF0Frzyd3ti0GAU/YGeaD7VRXzfPhSOkiqaYr2A0oUEi
    2FmWlhYXYGqpOgyoA+xVhj8VwyraZda50fG1ARqL4PwvAFBcL9o366CrhXst+Wh1fMCA
    2KyCI+nIy2UERtzUCcbR83PRD8/Z6hP9HZI3SY5+vYNJG+lXVj3c95LxB+pEdx3rdgEE
    ZIiN80EuBYQ0UjKaR7E+yP5rGq720osynus+Jzlgp8ZRr0lpaKpJ3UsttsWSkW6XD+JR
    JAjNy9txaZCln6fLDH1BQ5jDWhBBlC5yY1488B9HlueYEMGAI7MMY0yZhytJpLEfSjty
    VgEg==
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
Subject: [PATCH v20210713 09/31] tools: save: preallocate errors array
Date: Tue, 13 Jul 2021 20:05:43 +0200
Message-Id: <20210713180605.12096-10-olaf@aepfle.de>
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
 tools/libs/guest/xg_sr_save.c   | 20 ++++++++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index d80de6e7da..d2b838ed33 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -246,6 +246,7 @@ struct xc_sr_context
             xen_pfn_t *batch_pfns;
             xen_pfn_t *mfns;
             xen_pfn_t *types;
+            int *errors;
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 29a5fe82f0..5b416fda60 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -91,7 +91,7 @@ static int write_batch(struct xc_sr_context *ctx)
     void *guest_mapping = NULL;
     void **guest_data = NULL;
     void **local_pages = NULL;
-    int *errors = NULL, rc = -1;
+    int rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     void *page, *orig_page;
@@ -104,8 +104,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Errors from attempting to map the gfns. */
-    errors = malloc(nr_pfns * sizeof(*errors));
     /* Pointers to page data to send.  Mapped gfns or local allocations. */
     guest_data = calloc(nr_pfns, sizeof(*guest_data));
     /* Pointers to locally allocated pages.  Need freeing. */
@@ -113,7 +111,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !errors || !guest_data || !local_pages || !iov )
+    if ( !guest_data || !local_pages || !iov )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -158,8 +156,8 @@ static int write_batch(struct xc_sr_context *ctx)
 
     if ( nr_pages > 0 )
     {
-        guest_mapping = xenforeignmemory_map(
-            xch->fmem, ctx->domid, PROT_READ, nr_pages, ctx->save.mfns, errors);
+        guest_mapping = xenforeignmemory_map(xch->fmem, ctx->domid, PROT_READ,
+            nr_pages, ctx->save.mfns, ctx->save.errors);
         if ( !guest_mapping )
         {
             PERROR("Failed to map guest pages");
@@ -172,10 +170,11 @@ static int write_batch(struct xc_sr_context *ctx)
             if ( !page_type_has_stream_data(ctx->save.types[i]) )
                 continue;
 
-            if ( errors[p] )
+            if ( ctx->save.errors[p] )
             {
                 ERROR("Mapping of pfn %#"PRIpfn" (mfn %#"PRIpfn") failed %d",
-                      ctx->save.batch_pfns[i], ctx->save.mfns[p], errors[p]);
+                      ctx->save.batch_pfns[i], ctx->save.mfns[p],
+                      ctx->save.errors[p]);
                 goto err;
             }
 
@@ -271,7 +270,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(iov);
     free(local_pages);
     free(guest_data);
-    free(errors);
 
     return rc;
 }
@@ -847,10 +845,11 @@ static int setup(struct xc_sr_context *ctx)
                                   sizeof(*ctx->save.batch_pfns));
     ctx->save.mfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.mfns));
     ctx->save.types = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.types));
+    ctx->save.errors = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.errors));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
 
     if ( !ctx->save.batch_pfns || !ctx->save.mfns || !ctx->save.types ||
-         !dirty_bitmap || !ctx->save.deferred_pages )
+         !ctx->save.errors || !dirty_bitmap || !ctx->save.deferred_pages )
     {
         ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
               " deferred pages");
@@ -881,6 +880,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
+    free(ctx->save.errors);
     free(ctx->save.types);
     free(ctx->save.mfns);
     free(ctx->save.batch_pfns);

