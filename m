Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 766FA3C7621
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155545.287204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnn-0005pU-Mb; Tue, 13 Jul 2021 18:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155545.287204; Tue, 13 Jul 2021 18:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnn-0005jo-Eo; Tue, 13 Jul 2021 18:06:39 +0000
Received: by outflank-mailman (input) for mailman id 155545;
 Tue, 13 Jul 2021 18:06:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mnl-0002kr-TS
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:37 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.80])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05524e77-e405-11eb-8793-12813bfff9fa;
 Tue, 13 Jul 2021 18:06:20 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6EtAp
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
X-Inumbo-ID: 05524e77-e405-11eb-8793-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199574;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=LtyVn9iWhbeG3QGf2nqJ2jlqNwljeyLy9bqS6muxnCY=;
    b=TwKmNEFGrByXOUSKlKyVErjP2hkP9l9R4JHcqbeop4rPR+2Ihe1ItAOP8mHGOSz2zw
    msCAcjiJ8UYk8Srchu1mPulRWdnpVi2SGwA1pKEFiNnnM6FdYn1ZkSz13UqG4RJJfHvl
    1yTz1mqfJU69hYPBsujLWN0cCDqCI2bZ4RF9XDQptM84w9+buvB4PuCBfUkSwchaI9Li
    umqESpwS+me9yWnyMdmQk9qenWTiCWtD8ffiPQuE7ZxE4wsnkgxhG71YVHINCSfT3ES1
    v3Xe5Stifm8ZMJFPcFUk1NqWHbCrFc4Sc1yNjkmT79ZiNsgxkM98YoniQMOP7kCscPa5
    n8sw==
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
Subject: [PATCH v20210713 08/31] tools: save: preallocate types array
Date: Tue, 13 Jul 2021 20:05:42 +0200
Message-Id: <20210713180605.12096-9-olaf@aepfle.de>
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
 tools/libs/guest/xg_sr_save.c   | 28 +++++++++++++---------------
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index fc403adc64..d80de6e7da 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -245,6 +245,7 @@ struct xc_sr_context
 
             xen_pfn_t *batch_pfns;
             xen_pfn_t *mfns;
+            xen_pfn_t *types;
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 0abe63a377..29a5fe82f0 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -88,7 +88,6 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *types = NULL;
     void *guest_mapping = NULL;
     void **guest_data = NULL;
     void **local_pages = NULL;
@@ -105,8 +104,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Types of the batch pfns. */
-    types = malloc(nr_pfns * sizeof(*types));
     /* Errors from attempting to map the gfns. */
     errors = malloc(nr_pfns * sizeof(*errors));
     /* Pointers to page data to send.  Mapped gfns or local allocations. */
@@ -116,7 +113,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !types || !errors || !guest_data || !local_pages || !iov )
+    if ( !errors || !guest_data || !local_pages || !iov )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -125,7 +122,7 @@ static int write_batch(struct xc_sr_context *ctx)
 
     for ( i = 0; i < nr_pfns; ++i )
     {
-        types[i] = ctx->save.mfns[i] = ctx->save.ops.pfn_to_gfn(ctx,
+        ctx->save.types[i] = ctx->save.mfns[i] = ctx->save.ops.pfn_to_gfn(ctx,
                                                       ctx->save.batch_pfns[i]);
 
         /* Likely a ballooned page. */
@@ -136,7 +133,7 @@ static int write_batch(struct xc_sr_context *ctx)
         }
     }
 
-    rc = xc_get_pfn_type_batch(xch, ctx->domid, nr_pfns, types);
+    rc = xc_get_pfn_type_batch(xch, ctx->domid, nr_pfns, ctx->save.types);
     if ( rc )
     {
         PERROR("Failed to get types for pfn batch");
@@ -146,14 +143,14 @@ static int write_batch(struct xc_sr_context *ctx)
 
     for ( i = 0; i < nr_pfns; ++i )
     {
-        if ( !is_known_page_type(types[i]) )
+        if ( !is_known_page_type(ctx->save.types[i]) )
         {
             ERROR("Unknown type %#"PRIpfn" for pfn %#"PRIpfn,
-                  types[i], ctx->save.mfns[i]);
+                  ctx->save.types[i], ctx->save.mfns[i]);
             goto err;
         }
 
-        if ( !page_type_has_stream_data(types[i]) )
+        if ( !page_type_has_stream_data(ctx->save.types[i]) )
             continue;
 
         ctx->save.mfns[nr_pages++] = ctx->save.mfns[i];
@@ -172,7 +169,7 @@ static int write_batch(struct xc_sr_context *ctx)
 
         for ( i = 0, p = 0; i < nr_pfns; ++i )
         {
-            if ( !page_type_has_stream_data(types[i]) )
+            if ( !page_type_has_stream_data(ctx->save.types[i]) )
                 continue;
 
             if ( errors[p] )
@@ -183,7 +180,7 @@ static int write_batch(struct xc_sr_context *ctx)
             }
 
             orig_page = page = guest_mapping + (p * PAGE_SIZE);
-            rc = ctx->save.ops.normalise_page(ctx, types[i], &page);
+            rc = ctx->save.ops.normalise_page(ctx, ctx->save.types[i], &page);
 
             if ( orig_page != page )
                 local_pages[i] = page;
@@ -194,7 +191,7 @@ static int write_batch(struct xc_sr_context *ctx)
                 {
                     set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
                     ++ctx->save.nr_deferred_pages;
-                    types[i] = XEN_DOMCTL_PFINFO_XTAB;
+                    ctx->save.types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
                 }
                 else
@@ -223,7 +220,7 @@ static int write_batch(struct xc_sr_context *ctx)
     rec.length += nr_pages * PAGE_SIZE;
 
     for ( i = 0; i < nr_pfns; ++i )
-        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
+        rec_pfns[i] = ((uint64_t)(ctx->save.types[i]) << 32) | ctx->save.batch_pfns[i];
 
     iov[0].iov_base = &rec.type;
     iov[0].iov_len = sizeof(rec.type);
@@ -275,7 +272,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(local_pages);
     free(guest_data);
     free(errors);
-    free(types);
 
     return rc;
 }
@@ -850,9 +846,10 @@ static int setup(struct xc_sr_context *ctx)
     ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
                                   sizeof(*ctx->save.batch_pfns));
     ctx->save.mfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.mfns));
+    ctx->save.types = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.types));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
 
-    if ( !ctx->save.batch_pfns || !ctx->save.mfns ||
+    if ( !ctx->save.batch_pfns || !ctx->save.mfns || !ctx->save.types ||
          !dirty_bitmap || !ctx->save.deferred_pages )
     {
         ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
@@ -884,6 +881,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
+    free(ctx->save.types);
     free(ctx->save.mfns);
     free(ctx->save.batch_pfns);
 }

