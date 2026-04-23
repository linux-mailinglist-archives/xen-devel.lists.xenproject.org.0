Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Jt6CF176mm6zwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 22:04:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34BB4571D4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 22:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292629.1570999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wG0He-0007zJ-7m; Thu, 23 Apr 2026 20:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292629.1570999; Thu, 23 Apr 2026 20:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wG0He-0007wC-3D; Thu, 23 Apr 2026 20:04:22 +0000
Received: by outflank-mailman (input) for mailman id 1292629;
 Thu, 23 Apr 2026 20:04:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wG0Hd-0007ic-3T
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 20:04:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wG0Hc-008AbV-GX
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 22:04:20 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ea7b23-bab6-0a2a0a5309dd-0a2a4507ec64-26
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 22:04:20 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ea7b44-229c-0a2a45070019-d155dd2aa98d-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 22:04:20 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-43d75312379so5163604f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 13:04:20 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a341sm60065442f8f.24.2026.04.23.13.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 13:04:18 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776974660; x=1777579460; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0sgCfk1ugKuxjrB/yyEc4hgcj8W8SrxyN2ccMLOE0JE=;
        b=e8vzlf144FcZgCJw25hC3LekHi/M5vQK86eIo+5Ri5J6+ZM/NOq1EniM9CWWcjsYNI
         +nVwxnbQgxBf+KPIObPrP4hwiabdxob7ckTt05ft+hFga4Wrc6s6vgCv75fgH/Jn7kAA
         spjpWblnr3F4qqaLsLMxnswOvlJNm7P/onx1zvlYUkXZ5KMSdGAadhM6k0Mvx5fTqusO
         Mr4QLHYJaGmi0t8mlaphAPlGQSs2MGmshM5bWh0Z7lpfOHd2kNjwHV+5vZfAdK4F6pNO
         Av5tQ9zivigeTfyuU/o48UwgegZzB3s5wTCjei3HLRl7kWg0Ed2zc31lajadmFIw4bvZ
         LDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776974660; x=1777579460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0sgCfk1ugKuxjrB/yyEc4hgcj8W8SrxyN2ccMLOE0JE=;
        b=ZuX4xW/SVb7+mgiu9KAEwLiQjMmeJsuAxeD9LMuW/SVJ4SgZEdv4bHLU/+8luhuaV/
         bHhAdMFI7TvKv1dCObbubfByvAxXIKHMqOtmsF+snCi5dxUBWNtLUttWjWnEWeXmBe41
         0Q1OPEjahUR70ClIJg3Sgu41qwdBSgDfjFqeFaIs06hvrEMP+BabBzCXi0SPRF49HRBn
         AEqAevJR9aLkGECdC7PMlz6zT2NoQNJVH4CGbtK5tVn7fY/sc47J2S3rPrM+ujdW7HR4
         Rz7lug1LjnSx9ZRDzLmW+4RFoKiV1bQgOriuBEUoptDNl0gk4QBEbbpJywDmUmuPsCWH
         7b/g==
X-Gm-Message-State: AOJu0YxGdtmx/8cF0hUq5+10+l2Fm6/fzmrYgYtzqcfvKmXi/KH3D92a
	wTn08L6hq5VymhR6DQBNYUr3J0rbWtawqjy4wmremxXdnQY1DJ2l7Db1N6X6P9i9
X-Gm-Gg: AeBDietqcK95+pCC/g74Hlqo89Y43VRwPp28seX7joM69D56wQoQtQFqzNrD3JEFQ9W
	fVYEnnlOof9JTyrNRSn1vpziX35n/4MSGIVah2dJ6UQDvznmleF0BjWqLRuUTxZ4qwHFFl9mAwe
	ne++QlWDeNE03WPVvYUSQ0Iki7T7iC5Szi9UvY2WhlDPiyZo+eutW7vlUiOl+JKmdMoZH0U3snR
	713wz9aNCkWLCBTajfOQbIDyVBfraM2Ik2coh3VD/hHcjYk6CsCGkOrQQJ8etc/VQ4UN91WpkiW
	zQTxqVrV6XvkNhDIUSWbfgI00ST/e/vDKZXJjYhGbCUU0CCyacIcdedLJ3RcRoKLN/5AGoEnpiK
	OvkOyJ/ccUgYl+5YWgXHOYd6usVU0+T5p854yETyRO3drX41CQzW+8aDIV0RbhEviT6NvWaAIdb
	LiIIonoCSXmtzUwI5TB0Z7mMHtJq9kHl3mWCRmJpdN+ZKV8Qa8hYfQdepXf/2Em6VIiuA5z0PuI
	XxeI8AVnnAWfb4=
X-Received: by 2002:a05:6000:471a:b0:441:30d8:f023 with SMTP id ffacd0b85a97d-44130d8f040mr2937021f8f.6.1776974659411;
        Thu, 23 Apr 2026 13:04:19 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH 4/4] tools/libs/guest: allocate various migration arrays just once
Date: Thu, 23 Apr 2026 21:03:59 +0100
Message-ID: <20260423200406.28178-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423200406.28178-1-frediano.ziglio@cloud.com>
References: <20260423200406.28178-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1776974660-2BD7FC48-7DD3B721/0/0
X-purgate-type: clean
X-purgate-size: 6401
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B34BB4571D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Edwin Török <edwin.torok@citrix.com>

Allocate these array just once at the start of migration,
using the maximum batch size, and free them at the end.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_common.h | 13 +++++++
 tools/libs/guest/xg_sr_save.c   | 66 +++++++++++++--------------------
 2 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index f1573aefcb..77312bae9c 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -209,6 +209,18 @@ static inline int update_blob(struct xc_sr_blob *blob,
     return 0;
 }
 
+struct xc_sr_context_save_buffers
+{
+    xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+    xen_pfn_t mfns[MAX_BATCH_SIZE];
+    xen_pfn_t types[MAX_BATCH_SIZE];
+    int errors[MAX_BATCH_SIZE];
+    void *guest_data[MAX_BATCH_SIZE];
+    void *local_pages[MAX_BATCH_SIZE];
+    struct iovec iov[MAX_BATCH_SIZE + 2]; /* headers + data */
+    uint64_t rec_pfns[MAX_BATCH_SIZE];
+};
+
 struct xc_sr_context
 {
     xc_interface *xch;
@@ -244,6 +256,7 @@ struct xc_sr_context
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
+            struct xc_sr_context_save_buffers *buffers;
         } save;
 
         struct /* Restore data. */
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 1700d81905..64014dcdbd 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -87,16 +87,16 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = NULL, *types = NULL;
+    xen_pfn_t *mfns, *types;
     void *guest_mapping = NULL;
-    void **guest_data = NULL;
-    void **local_pages = NULL;
-    int *errors = NULL, rc = -1;
+    void **guest_data;
+    void **local_pages;
+    int *errors, rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     void *page, *orig_page;
-    uint64_t *rec_pfns = NULL;
-    struct iovec *iov = NULL; int iovcnt = 0;
+    uint64_t *rec_pfns;
+    struct iovec *iov; int iovcnt = 0;
     struct {
         struct xc_sr_rhdr rec;
         struct xc_sr_rec_page_data_header page_data;
@@ -106,26 +106,24 @@ static int write_batch(struct xc_sr_context *ctx)
     };
 
     assert(nr_pfns != 0);
+    assert(nr_pfns <= MAX_BATCH_SIZE);
+    assert(ctx->save.buffers);
 
     /* Mfns of the batch pfns. */
-    mfns = malloc(nr_pfns * sizeof(*mfns));
+    mfns = ctx->save.buffers->mfns;
     /* Types of the batch pfns. */
-    types = malloc(nr_pfns * sizeof(*types));
+    types = ctx->save.buffers->types;
     /* Errors from attempting to map the gfns. */
-    errors = malloc(nr_pfns * sizeof(*errors));
+    errors = ctx->save.buffers->errors;
     /* Pointers to page data to send.  Mapped gfns or local allocations. */
-    guest_data = calloc(nr_pfns, sizeof(*guest_data));
+    guest_data = ctx->save.buffers->guest_data;
+    memset(guest_data, 0, sizeof(*guest_data) * nr_pfns);
     /* Pointers to locally allocated pages.  Need freeing. */
-    local_pages = calloc(nr_pfns, sizeof(*local_pages));
+    local_pages = ctx->save.buffers->local_pages;
+    memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
     /* iovec[] for writev(). */
-    iov = malloc((nr_pfns + 2) * sizeof(*iov));
-
-    if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov )
-    {
-        ERROR("Unable to allocate arrays for a batch of %u pages",
-              nr_pfns);
-        goto err;
-    }
+    iov = ctx->save.buffers->iov;
+    rec_pfns = ctx->save.buffers->rec_pfns;
 
     for ( i = 0; i < nr_pfns; ++i )
     {
@@ -211,14 +209,6 @@ static int write_batch(struct xc_sr_context *ctx)
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
     hdrs.rec.length = sizeof(hdrs.page_data);
     hdrs.rec.length += nr_pfns * sizeof(*rec_pfns);
     hdrs.rec.length += nr_pages * PAGE_SIZE;
@@ -261,17 +251,13 @@ static int write_batch(struct xc_sr_context *ctx)
     rc = ctx->save.nr_batch_pfns = 0;
 
  err:
-    free(rec_pfns);
     if ( guest_mapping )
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; local_pages && i < nr_pfns; ++i )
+    {
         free(local_pages[i]);
-    free(iov);
-    free(local_pages);
-    free(guest_data);
-    free(errors);
-    free(types);
-    free(mfns);
+        local_pages[i] = NULL;
+    }
 
     return rc;
 }
@@ -799,18 +785,18 @@ static int setup(struct xc_sr_context *ctx)
 
     dirty_bitmap = xc_hypercall_buffer_alloc_pages(
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
-    ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
-                                  sizeof(*ctx->save.batch_pfns));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
+    ctx->save.buffers = calloc(1, sizeof(*ctx->save.buffers));
 
-    if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !dirty_bitmap || !ctx->save.deferred_pages || !ctx->save.buffers)
     {
-        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
-              " deferred pages");
+        ERROR("Unable to allocate memory for dirty bitmaps, deferred pages"
+              " and various batch buffers");
         rc = -1;
         errno = ENOMEM;
         goto err;
     }
+    ctx->save.batch_pfns = ctx->save.buffers->batch_pfns;
 
     rc = 0;
 
@@ -834,7 +820,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
-    free(ctx->save.batch_pfns);
+    free(ctx->save.buffers);
 }
 
 /*
-- 
2.43.0


