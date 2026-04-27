Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHCvOnFA72lP/QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC84714FA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294782.1571525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbO-0006te-14; Mon, 27 Apr 2026 10:54:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294782.1571525; Mon, 27 Apr 2026 10:54:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbN-0006qH-TA; Mon, 27 Apr 2026 10:54:09 +0000
Received: by outflank-mailman (input) for mailman id 1294782;
 Mon, 27 Apr 2026 10:54:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wHJbM-0006Ur-QL
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 10:54:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHJbM-00FJ4k-6s
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 12:54:08 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef404d-2eae-0a2a0a5409dd-0a2a4506aba4-14
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:08 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef404f-7371-0a2a45060019-d155802fe164-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:08 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso140739775e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 03:54:08 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5c4b9e8dsm116133355e9.7.2026.04.27.03.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 03:54:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777287247; x=1777892047; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7dVoM67UHYTIleORpVUCsCVE7I/cjwGpwM6+OI25+A=;
        b=O2rnqAWdKbFKwIeA8WjhUKDFjzkRxAGGse/kuXy5huC4XLI8xHYXYA5A68Ylf5pmXC
         Txi2k4hxkfUjZpp7T8gT02vZ9FRQWEYyEVjHw83MVZOxNnIHXp0k8Fe3gsA0cJG0UrfQ
         vn8mmfUWZ+aAZy3PCpdYCLg7okOLvONpE9RF/tB2pQ2RQT9XlWjjUxMAMEkMwqNGlqZe
         S0894gZhsPJe039MSdvws8LV4mm7ECwn0m9+DosLx9p1V+/WOZJYGIghYAS9yv6viF/w
         QShD2cWB7LLn1UatQG646lV4iCnmwLOm/595CrRLVvsuaWWLo0hs/JJHAO+hwiiO1lDQ
         zwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287247; x=1777892047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R7dVoM67UHYTIleORpVUCsCVE7I/cjwGpwM6+OI25+A=;
        b=OUKthnCNA7f4qsJVdjz5l3Y4HS0Zyq0lu6gKzONAaK6Cuf+rWi9FnNPGlfA7nx9pnU
         Qs5lg1l0KNeJycxYxfByFp22fXn4kBsE1pj0VJgY0vmj/7oeasVeGDMVAr4NFL14NrII
         zEWqIBUOA6GLVde5H3NK65KVnZRpewTfPsw8n6cEm2PccAhxJGSIBvMrgTzx/fzNo+Q5
         RuPl9UO5QYdzTatUVKx/9hhFVINkfMRmZghhesHn3huEsFL4McEv3p5hSB0Yt0WAmitu
         j/dos2T8AIpGXb5RaFHwClkbh93MBPAwYno4J5l+HgqDROKZMFrBGJcwsbOMiHDdFb20
         RmsA==
X-Gm-Message-State: AOJu0YxmC0heCEzdG/dd3xc7JN1bLWLtDm0QxVRpviVajll2eiSYkEUO
	qhxSzZxJ+Tnqbg+nIaHqQFCZRuRBEsjdVUV5BVYfy4WirycyNnaHeYDaGxXebf2/
X-Gm-Gg: AeBDiet4XLjgoFDbX/oGRUMvld+bzVFNlJdHH7bqxHppAHuOcVWCH1vjTQw9LZYpDEU
	x5x+Uu7ECK+53u4AYIojRKfSeYnQFWLtm+PjZZMn9Ch9IUacVue7jvJ9oSbiCpGAhoRHr8CHH5k
	PdAMl39ZvnFcCZr2Y6rT+r4HuSgyGbKqb8GS4vMpLF2BNgsnXDBrrKR3uQlwQAwX1/nG6GVg2Ej
	g1tcMKcxCnTmhkDDGuzA1iqjh5wHKr9GpP6myA2tJ136IGGCcCw9tY9+t+BEAmQGmUcqjuilUQ7
	0VhBL4PrsYsRvOjieLGeWe9xsUzL/23T2fzPPnV7Zrz7i6xncwK35acMWZZEGeuBucew4E3gg+m
	lc1Ni/oOEzyY74sEkUP2yhjzivjS0r9P9dZuTlfKRJ3UR1Mrx2YEL6aN4JkSAhAlEAQtRW35CvK
	q+FO+08yvwnMNMSc+6ZJBGnn9g5Qi2QO15OB0K8bDI3X5YcxbPzauUiW+sUw6ZFylKVXZtTIVvG
	emQ
X-Received: by 2002:a05:600c:1da1:b0:488:f453:b976 with SMTP id 5b1f17b1804b1-488fb7844c5mr648731355e9.27.1777287246992;
        Mon, 27 Apr 2026 03:54:06 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v2 6/7] tools/libs/guest: allocate various migration arrays just once
Date: Mon, 27 Apr 2026 11:53:31 +0100
Message-ID: <20260427105338.99792-7-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427105338.99792-1-frediano.ziglio@cloud.com>
References: <20260427105338.99792-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1777287248-52974D75-3D252544/0/0
X-purgate-type: clean
X-purgate-size: 6409
X-Rspamd-Queue-Id: A2BC84714FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
index ec42b4a9e535..f84c47800098 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -211,6 +211,18 @@ static inline int update_blob(struct xc_sr_blob *blob,
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
@@ -246,6 +258,7 @@ struct xc_sr_context
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
+            struct xc_sr_context_save_buffers *buffers;
         } save;
 
         struct /* Restore data. */
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 8c4e760f8d0a..7d8055a3f9e8 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -86,16 +86,16 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
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
@@ -105,26 +105,24 @@ static int write_batch(struct xc_sr_context *ctx)
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
@@ -210,14 +208,6 @@ static int write_batch(struct xc_sr_context *ctx)
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
@@ -267,17 +257,13 @@ static int write_batch(struct xc_sr_context *ctx)
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
@@ -805,18 +791,18 @@ static int setup(struct xc_sr_context *ctx)
 
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
 
@@ -840,7 +826,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
-    free(ctx->save.batch_pfns);
+    free(ctx->save.buffers);
 }
 
 /*
-- 
2.53.0


