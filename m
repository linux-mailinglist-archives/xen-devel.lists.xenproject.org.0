Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 354AF29F2DF
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:20:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14416.35647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbA-0003Z6-QQ; Thu, 29 Oct 2020 17:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14416.35647; Thu, 29 Oct 2020 17:20:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBbA-0003Y9-Jv; Thu, 29 Oct 2020 17:20:28 +0000
Received: by outflank-mailman (input) for mailman id 14416;
 Thu, 29 Oct 2020 17:20:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kYBb8-0003MC-LG
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:26 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.80])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 694b2120-ffda-4093-b495-670ba2163d55;
 Thu, 29 Oct 2020 17:20:18 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
 with ESMTPSA id j0b1afw9THKA3fC
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Oct 2020 18:20:10 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=u/HF=EE=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
	id 1kYBb8-0003MC-LG
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:20:26 +0000
X-Inumbo-ID: 694b2120-ffda-4093-b495-670ba2163d55
Received: from mo4-p02-ob.smtp.rzone.de (unknown [85.215.255.80])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 694b2120-ffda-4093-b495-670ba2163d55;
	Thu, 29 Oct 2020 17:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1603992017;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=s6U8mXu6k+6wrCilP+jHEKI7OfSE2V+H39V5VeQDOaY=;
	b=qh2TZXRzZOzPKSr3D4EgM+qiL5MOJM9yXCQmI5+7JzmNbWXfcgswCnujKQLgtnRP4u
	ZiE6mkGd0FGFAk3zqxXi4njEhwNugU7ZJTjMlkWzARPSNshC3JNeKSRaSMv9zgthSVwv
	gW06sSBDWgTZtg9Wtc3f8+mnfk7tlX24tvrJ0uYqGMdmLnlT3aItA4WupjhEZAS45E+K
	8Ht7fktlshpTQp5FK6614uaCuNo1AlC3ZfaE1R/BYpSePbtL4BPOZ+zn9GXy7jXG4w9x
	FUvETc8roCyzp/F2GlWiUuINx+o60tlacAMmMQWP97zMtOPxJlkMzMth/+4oZ4FxJjdx
	xp6w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3G1Jjw=="
X-RZG-CLASS-ID: mo00
Received: from sender
	by smtp.strato.de (RZmta 47.3.0 DYNA|AUTH)
	with ESMTPSA id j0b1afw9THKA3fC
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Thu, 29 Oct 2020 18:20:10 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v1 07/23] tools/guest: save: move batch_pfns
Date: Thu, 29 Oct 2020 18:19:47 +0100
Message-Id: <20201029172004.17219-8-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029172004.17219-1-olaf@aepfle.de>
References: <20201029172004.17219-1-olaf@aepfle.de>
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
index 1e3c8eff2f..597e638c59 100644
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
 

