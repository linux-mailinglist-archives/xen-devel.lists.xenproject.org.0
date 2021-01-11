Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B082F1CC3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 18:43:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65114.115342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1Da-0003Dq-0j; Mon, 11 Jan 2021 17:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65114.115342; Mon, 11 Jan 2021 17:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz1DZ-0003CQ-OZ; Mon, 11 Jan 2021 17:43:01 +0000
Received: by outflank-mailman (input) for mailman id 65114;
 Mon, 11 Jan 2021 17:43:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CE/i=GO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kz1DY-0002a6-0E
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 17:43:00 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.84])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb7c0705-8c69-4061-af84-6a296210bd43;
 Mon, 11 Jan 2021 17:42:41 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0BHgXM3U
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 11 Jan 2021 18:42:33 +0100 (CET)
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
X-Inumbo-ID: eb7c0705-8c69-4061-af84-6a296210bd43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610386961;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
	Subject:Sender;
	bh=yGM4Ylq9mNJe65tHC5tVWCrTtZ32dnAW0lvCoHmOzFA=;
	b=WwEY4RQI6qjYiaZgvFQ8bVXPD5CbYvIQPOezITL8d5SwUfQQKdLuF5F/v2lsLaRlsH
	lEq5R18fCgfBvKVP3KWCM5gXmxYZasc712JTep9rxFv09X+YDlGW5xNO6dzygKbZpVUr
	YPZMTM0R/jCgj0LzZPV0wT0oqEa/gbErEO5ifq0u29Vr83LVl/TNepK27mfD8gW7hd1j
	mJiuNpJ6COf6W1LjITnaaGz6klwq5FOPlG/P2hxYk6oY/rHqm80KTMBJmB12u/Ca0Kmx
	2xa+odcLGzHrKECYtAzSuO+RmOfZgjzKyjju0GBQE/vbjca+p1Y1WX1TBTzvIZYQSTYe
	MSuQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS2W0g"
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v20210111 15/39] tools/guest: save: move batch_pfns
Date: Mon, 11 Jan 2021 18:42:00 +0100
Message-Id: <20210111174224.24714-16-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111174224.24714-1-olaf@aepfle.de>
References: <20210111174224.24714-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The batch_pfns array is already allocated in advance.
Move it into the preallocated area.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 tools/libs/guest/xg_sr_common.h |  2 +-
 tools/libs/guest/xg_sr_save.c   | 25 +++++++++++--------------
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 62bc87b5f4..c78a07b8f8 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -212,6 +212,7 @@ static inline int update_blob(struct xc_sr_blob *blob,
 }
 
 struct xc_sr_save_arrays {
+    xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_restore_arrays {
@@ -249,7 +250,6 @@ struct xc_sr_context
 
             struct precopy_stats stats;
 
-            xen_pfn_t *batch_pfns;
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index baaeb12762..700344b6b6 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -77,7 +77,7 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 
 /*
  * Writes a batch of memory as a PAGE_DATA record into the stream.  The batch
- * is constructed in ctx->save.batch_pfns.
+ * is constructed in ctx->save.m->batch_pfns.
  *
  * This function:
  * - gets the types for each pfn in the batch.
@@ -128,12 +128,12 @@ static int write_batch(struct xc_sr_context *ctx)
     for ( i = 0; i < nr_pfns; ++i )
     {
         types[i] = mfns[i] = ctx->save.ops.pfn_to_gfn(ctx,
-                                                      ctx->save.batch_pfns[i]);
+                                                      ctx->save.m->batch_pfns[i]);
 
         /* Likely a ballooned page. */
         if ( mfns[i] == INVALID_MFN )
         {
-            set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
+            set_bit(ctx->save.m->batch_pfns[i], ctx->save.deferred_pages);
             ++ctx->save.nr_deferred_pages;
         }
     }
@@ -179,7 +179,7 @@ static int write_batch(struct xc_sr_context *ctx)
             if ( errors[p] )
             {
                 ERROR("Mapping of pfn %#"PRIpfn" (mfn %#"PRIpfn") failed %d",
-                      ctx->save.batch_pfns[i], mfns[p], errors[p]);
+                      ctx->save.m->batch_pfns[i], mfns[p], errors[p]);
                 goto err;
             }
 
@@ -193,7 +193,7 @@ static int write_batch(struct xc_sr_context *ctx)
             {
                 if ( rc == -1 && errno == EAGAIN )
                 {
-                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
+                    set_bit(ctx->save.m->batch_pfns[i], ctx->save.deferred_pages);
                     ++ctx->save.nr_deferred_pages;
                     types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
@@ -224,7 +224,7 @@ static int write_batch(struct xc_sr_context *ctx)
     rec.length += nr_pages * PAGE_SIZE;
 
     for ( i = 0; i < nr_pfns; ++i )
-        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
+        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.m->batch_pfns[i];
 
     iov[0].iov_base = &rec.type;
     iov[0].iov_len = sizeof(rec.type);
@@ -296,9 +296,9 @@ static int flush_batch(struct xc_sr_context *ctx)
 
     if ( !rc )
     {
-        VALGRIND_MAKE_MEM_UNDEFINED(ctx->save.batch_pfns,
+        VALGRIND_MAKE_MEM_UNDEFINED(ctx->save.m->batch_pfns,
                                     MAX_BATCH_SIZE *
-                                    sizeof(*ctx->save.batch_pfns));
+                                    sizeof(*ctx->save.m->batch_pfns));
     }
 
     return rc;
@@ -315,7 +315,7 @@ static int add_to_batch(struct xc_sr_context *ctx, xen_pfn_t pfn)
         rc = flush_batch(ctx);
 
     if ( rc == 0 )
-        ctx->save.batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
+        ctx->save.m->batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
 
     return rc;
 }
@@ -850,14 +850,12 @@ static int setup(struct xc_sr_context *ctx)
 
     dirty_bitmap = xc_hypercall_buffer_alloc_pages(
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
-    ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
-                                  sizeof(*ctx->save.batch_pfns));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
     ctx->save.m = malloc(sizeof(*ctx->save.m));
 
-    if ( !ctx->save.m || !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !ctx->save.m || !dirty_bitmap || !ctx->save.deferred_pages )
     {
-        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
+        ERROR("Unable to allocate memory for dirty bitmaps and"
               " deferred pages");
         rc = -1;
         errno = ENOMEM;
@@ -886,7 +884,6 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
-    free(ctx->save.batch_pfns);
     free(ctx->save.m);
 }
 

