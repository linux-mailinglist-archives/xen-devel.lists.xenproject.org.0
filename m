Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A3A3B9020
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148356.274264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRa-0000Ux-4Y; Thu, 01 Jul 2021 09:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148356.274264; Thu, 01 Jul 2021 09:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lytRZ-0000ME-Na; Thu, 01 Jul 2021 09:57:13 +0000
Received: by outflank-mailman (input) for mailman id 148356;
 Thu, 01 Jul 2021 09:57:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lytRY-0004r4-GD
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:57:12 +0000
Received: from mo4-p02-ob.smtp.rzone.de (unknown [81.169.146.170])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a52234a9-c9c2-4701-8d14-db772e6547a8;
 Thu, 01 Jul 2021 09:56:53 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx619uk5N2
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 11:56:46 +0200 (CEST)
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
X-Inumbo-ID: a52234a9-c9c2-4701-8d14-db772e6547a8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625133406;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=6RnKPQsH20PdbTfVhW2egX9qSzfuCkrvoyMFtE/0GwA=;
    b=cquN494lrm7ljI6MEKPtT9XjxAa3kyMZOzySwPXws847LMv75F/o/r3Bcv9727yP7h
    9I+k2OiyQPa3l0jMlVeudm7hB1ShHv9IygEH4da018Z4/dEr55bbxrEedIQcXpvc3qQX
    Bvd5Ezbc7s/qvIfQR1dsm9PbM5Z3+0B8zWdcLUR9I5oHUbfffnbfSrLrGkk8W7Wix4cm
    3hbzvHBNlHvjHB1M7VWiamhHsXshQi8u7CPBj+2VGjr+OuGj1sTloYnFmhfamf7Hhsxz
    SLQ0KTybcvu+tan3ojBvYivYKkqJ31UrEhYFXXKB3EslYuxwRJ7GhbWtAZXmKw61HWoV
    2a+w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg5lqlz7EsstGyDcxK3Mbajr+SQKopp1Cb0CyyaZQQ=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v20210701 15/40] tools: prepare to allocate saverestore arrays once
Date: Thu,  1 Jul 2021 11:56:10 +0200
Message-Id: <20210701095635.15648-16-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210701095635.15648-1-olaf@aepfle.de>
References: <20210701095635.15648-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hotpath 'send_dirty_pages' is supposed to do just one thing: sending.
The other end 'handle_page_data' is supposed to do just receiving.

But instead both do other costly work like memory allocations and data moving.
Do the allocations once, the array sizes are a compiletime constant.
Avoid unneeded copying of data by receiving data directly into mapped guest memory.

This patch is just prepartion, subsequent changes will populate the arrays.

Once all changes are applied, migration of a busy HVM domU changes like that:

Without this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a20963b3 xen_testing):
2020-10-29 10:23:10.711+0000: xc: show_transfer_rate: 23663128 bytes + 2879563 pages in 55.324905335 sec, 203 MiB/sec: Internal error
2020-10-29 10:23:35.115+0000: xc: show_transfer_rate: 16829632 bytes + 2097552 pages in 24.401179720 sec, 335 MiB/sec: Internal error
2020-10-29 10:23:59.436+0000: xc: show_transfer_rate: 16829032 bytes + 2097478 pages in 24.319025928 sec, 336 MiB/sec: Internal error
2020-10-29 10:24:23.844+0000: xc: show_transfer_rate: 16829024 bytes + 2097477 pages in 24.406992500 sec, 335 MiB/sec: Internal error
2020-10-29 10:24:48.292+0000: xc: show_transfer_rate: 16828912 bytes + 2097463 pages in 24.446489027 sec, 335 MiB/sec: Internal error
2020-10-29 10:25:01.816+0000: xc: show_transfer_rate: 16836080 bytes + 2098356 pages in 13.447091818 sec, 609 MiB/sec: Internal error

With this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a20963b3 xen_unstable):
2020-10-28 21:26:05.074+0000: xc: show_transfer_rate: 23663128 bytes + 2879563 pages in 52.564054368 sec, 213 MiB/sec: Internal error
2020-10-28 21:26:23.527+0000: xc: show_transfer_rate: 16830040 bytes + 2097603 pages in 18.450592015 sec, 444 MiB/sec: Internal error
2020-10-28 21:26:41.926+0000: xc: show_transfer_rate: 16830944 bytes + 2097717 pages in 18.397862306 sec, 445 MiB/sec: Internal error
2020-10-28 21:27:00.339+0000: xc: show_transfer_rate: 16829176 bytes + 2097498 pages in 18.411973339 sec, 445 MiB/sec: Internal error
2020-10-28 21:27:18.643+0000: xc: show_transfer_rate: 16828592 bytes + 2097425 pages in 18.303326695 sec, 447 MiB/sec: Internal error
2020-10-28 21:27:26.289+0000: xc: show_transfer_rate: 16835952 bytes + 2098342 pages in 7.579846749 sec, 1081 MiB/sec: Internal error

Note: the performance improvement depends on the used network cards,
wirespeed and the host:
- No improvement is expected with a 1G link.
- Improvement can be seen as shown above on a 10G link.
- Just a slight improvment can be seen on a 100G link.

This change also populates sr_save_arrays with "batch_pfns", and
sr_restore_arrays with "pfns" to make sure malloc is always called
with a non-zero value.

Signed-off-by: Olaf Hering <olaf@aepfle.de>

v02:
- rename xc_sr_save_arrays to sr_save_arrays
- rename xc_sr_restore_arrays to sr_restore_arrays
- merge handling of "batch_pfns" and "pfns" to make sure malloc is
  called with a non-zero size value (jgross)
---
 tools/libs/saverestore/common.h  | 12 +++++++++++-
 tools/libs/saverestore/restore.c | 14 ++++++++++----
 tools/libs/saverestore/save.c    | 27 +++++++++++++--------------
 3 files changed, 34 insertions(+), 19 deletions(-)

diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/common.h
index 252076cf51..968bb8af13 100644
--- a/tools/libs/saverestore/common.h
+++ b/tools/libs/saverestore/common.h
@@ -223,6 +223,15 @@ static inline int update_blob(struct xc_sr_blob *blob,
     return 0;
 }
 
+struct sr_save_arrays {
+    xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+};
+
+struct sr_restore_arrays {
+    /* handle_page_data */
+    xen_pfn_t pfns[MAX_BATCH_SIZE];
+};
+
 struct xc_sr_context
 {
     xc_interface *xch;
@@ -255,11 +264,11 @@ struct xc_sr_context
 
             struct precopy_stats stats;
 
-            xen_pfn_t *batch_pfns;
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
+            struct sr_save_arrays *m;
         } save;
 
         struct /* Restore data. */
@@ -311,6 +320,7 @@ struct xc_sr_context
 
             /* Sender has invoked verify mode on the stream. */
             bool verify;
+            struct sr_restore_arrays *m;
         } restore;
     };
 
diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/restore.c
index 799170c7a1..c203ce503d 100644
--- a/tools/libs/saverestore/restore.c
+++ b/tools/libs/saverestore/restore.c
@@ -315,7 +315,7 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
     unsigned int i, pages_of_data = 0;
     int rc = -1;
 
-    xen_pfn_t *pfns = NULL, pfn;
+    xen_pfn_t *pfns = ctx->restore.m->pfns, pfn;
     uint32_t *types = NULL, type;
 
     /*
@@ -363,9 +363,8 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
         goto err;
     }
 
-    pfns = malloc(pages->count * sizeof(*pfns));
     types = malloc(pages->count * sizeof(*types));
-    if ( !pfns || !types )
+    if ( !types )
     {
         ERROR("Unable to allocate enough memory for %u pfns",
               pages->count);
@@ -412,7 +411,6 @@ static int handle_page_data(struct xc_sr_context *ctx, struct xc_sr_record *rec)
                            &pages->pfn[pages->count]);
  err:
     free(types);
-    free(pfns);
 
     return rc;
 }
@@ -739,6 +737,13 @@ static int setup(struct xc_sr_context *ctx)
     }
     ctx->restore.allocated_rec_num = DEFAULT_BUF_RECORDS;
 
+    ctx->restore.m = malloc(sizeof(*ctx->restore.m));
+    if ( !ctx->restore.m ) {
+        ERROR("Unable to allocate memory for arrays");
+        rc = -1;
+        goto err;
+    }
+
  err:
     return rc;
 }
@@ -757,6 +762,7 @@ static void cleanup(struct xc_sr_context *ctx)
         xc_hypercall_buffer_free_pages(
             xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->restore.p2m_size)));
 
+    free(ctx->restore.m);
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
 
diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.c
index f8fbe7a742..e29b6e1d66 100644
--- a/tools/libs/saverestore/save.c
+++ b/tools/libs/saverestore/save.c
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
@@ -849,13 +849,12 @@ static int setup(struct xc_sr_context *ctx)
 
     dirty_bitmap = xc_hypercall_buffer_alloc_pages(
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
-    ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
-                                  sizeof(*ctx->save.batch_pfns));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
+    ctx->save.m = malloc(sizeof(*ctx->save.m));
 
-    if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !ctx->save.m || !dirty_bitmap || !ctx->save.deferred_pages )
     {
-        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
+        ERROR("Unable to allocate memory for dirty bitmaps and"
               " deferred pages");
         rc = -1;
         errno = ENOMEM;
@@ -884,7 +883,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
-    free(ctx->save.batch_pfns);
+    free(ctx->save.m);
 }
 
 /*

