Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6390A3C7620
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 20:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155542.287171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mng-0004V1-B6; Tue, 13 Jul 2021 18:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155542.287171; Tue, 13 Jul 2021 18:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Mnf-0004RT-VJ; Tue, 13 Jul 2021 18:06:31 +0000
Received: by outflank-mailman (input) for mailman id 155542;
 Tue, 13 Jul 2021 18:06:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W9Py=MF=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1m3Mnd-0002UL-GI
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 18:06:29 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.170])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d82de438-271f-492e-98e5-d7dd1528d28f;
 Tue, 13 Jul 2021 18:06:19 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx6DI6DtAo
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 13 Jul 2021 20:06:13 +0200 (CEST)
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
X-Inumbo-ID: d82de438-271f-492e-98e5-d7dd1528d28f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626199574;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=2FOHALqjtAayiATag1w1tv+uvw3U+jkLCXoGYWrbCds=;
    b=VO3jOq8wx19i17M6djKvvv/rVPvoCedUnBlNa2YflKQht9tDddIEXbmES7UG+Yr01N
    OTB/5NSLG+V/an6eErcPVeqqtATRJkX+NgxBqZweHpvzbjcE1ceMWIkqJZvssjYu58j8
    6QnNMi2bl8Nc6/WDFXKlh64L8jtDLezKsrE5g5rhNKa/mmaN3BvQzcW9rVisOx8n7BZz
    GvWh+EnRgbstv5CEyCzn8YgnM0aPaJahvGKajWPvkOeEYWRBEZYeeErf7/0D/te9hPF6
    u0tDjCIDx25bBjCPzyYYMF7W8qr0OXxj7pa/umD/GUjl6EILnS3fITrfEKxJ3MBXxFMB
    OSZw==
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
Subject: [PATCH v20210713 07/31] tools: save: preallocate mfns array
Date: Tue, 13 Jul 2021 20:05:41 +0200
Message-Id: <20210713180605.12096-8-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210713180605.12096-1-olaf@aepfle.de>
References: <20210713180605.12096-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove repeated allocation from migration loop. There will never be
more than MAX_BATCH_SIZE pages to process in a batch, see add_to_batch.
Allocate the space once.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h |  1 +
 tools/libs/guest/xg_sr_save.c   | 25 +++++++++++++------------
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 2e70cc6269..fc403adc64 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -244,6 +244,7 @@ struct xc_sr_context
             struct precopy_stats stats;
 
             xen_pfn_t *batch_pfns;
+            xen_pfn_t *mfns;
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 00b81033a9..0abe63a377 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -88,7 +88,7 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = NULL, *types = NULL;
+    xen_pfn_t *types = NULL;
     void *guest_mapping = NULL;
     void **guest_data = NULL;
     void **local_pages = NULL;
@@ -105,8 +105,6 @@ static int write_batch(struct xc_sr_context *ctx)
 
     assert(nr_pfns != 0);
 
-    /* Mfns of the batch pfns. */
-    mfns = malloc(nr_pfns * sizeof(*mfns));
     /* Types of the batch pfns. */
     types = malloc(nr_pfns * sizeof(*types));
     /* Errors from attempting to map the gfns. */
@@ -118,7 +116,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* iovec[] for writev(). */
     iov = malloc((nr_pfns + 4) * sizeof(*iov));
 
-    if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov )
+    if ( !types || !errors || !guest_data || !local_pages || !iov )
     {
         ERROR("Unable to allocate arrays for a batch of %u pages",
               nr_pfns);
@@ -127,11 +125,11 @@ static int write_batch(struct xc_sr_context *ctx)
 
     for ( i = 0; i < nr_pfns; ++i )
     {
-        types[i] = mfns[i] = ctx->save.ops.pfn_to_gfn(ctx,
+        types[i] = ctx->save.mfns[i] = ctx->save.ops.pfn_to_gfn(ctx,
                                                       ctx->save.batch_pfns[i]);
 
         /* Likely a ballooned page. */
-        if ( mfns[i] == INVALID_MFN )
+        if ( ctx->save.mfns[i] == INVALID_MFN )
         {
             set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
             ++ctx->save.nr_deferred_pages;
@@ -150,20 +148,21 @@ static int write_batch(struct xc_sr_context *ctx)
     {
         if ( !is_known_page_type(types[i]) )
         {
-            ERROR("Unknown type %#"PRIpfn" for pfn %#"PRIpfn, types[i], mfns[i]);
+            ERROR("Unknown type %#"PRIpfn" for pfn %#"PRIpfn,
+                  types[i], ctx->save.mfns[i]);
             goto err;
         }
 
         if ( !page_type_has_stream_data(types[i]) )
             continue;
 
-        mfns[nr_pages++] = mfns[i];
+        ctx->save.mfns[nr_pages++] = ctx->save.mfns[i];
     }
 
     if ( nr_pages > 0 )
     {
         guest_mapping = xenforeignmemory_map(
-            xch->fmem, ctx->domid, PROT_READ, nr_pages, mfns, errors);
+            xch->fmem, ctx->domid, PROT_READ, nr_pages, ctx->save.mfns, errors);
         if ( !guest_mapping )
         {
             PERROR("Failed to map guest pages");
@@ -179,7 +178,7 @@ static int write_batch(struct xc_sr_context *ctx)
             if ( errors[p] )
             {
                 ERROR("Mapping of pfn %#"PRIpfn" (mfn %#"PRIpfn") failed %d",
-                      ctx->save.batch_pfns[i], mfns[p], errors[p]);
+                      ctx->save.batch_pfns[i], ctx->save.mfns[p], errors[p]);
                 goto err;
             }
 
@@ -277,7 +276,6 @@ static int write_batch(struct xc_sr_context *ctx)
     free(guest_data);
     free(errors);
     free(types);
-    free(mfns);
 
     return rc;
 }
@@ -851,9 +849,11 @@ static int setup(struct xc_sr_context *ctx)
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
     ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
                                   sizeof(*ctx->save.batch_pfns));
+    ctx->save.mfns = malloc(MAX_BATCH_SIZE * sizeof(*ctx->save.mfns));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
 
-    if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !ctx->save.batch_pfns || !ctx->save.mfns ||
+         !dirty_bitmap || !ctx->save.deferred_pages )
     {
         ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
               " deferred pages");
@@ -884,6 +884,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
+    free(ctx->save.mfns);
     free(ctx->save.batch_pfns);
 }
 

