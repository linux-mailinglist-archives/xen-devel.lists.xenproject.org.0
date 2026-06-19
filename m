Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YgiaM7I+NWqLpwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB136A5F39
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OoMvaPy+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342202.1602453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuO-0001ZR-1U; Fri, 19 Jun 2026 13:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342202.1602453; Fri, 19 Jun 2026 13:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuN-0001Wj-Rv; Fri, 19 Jun 2026 13:05:19 +0000
Received: by outflank-mailman (input) for mailman id 1342202;
 Fri, 19 Jun 2026 13:05:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuL-000193-Lm
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuL-002SWY-2V
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:17 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e8c-e002-0a2a0a5209dd-0a2a4503d912-8
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:17 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e8c-a3da-0a2a45030019-d155dd29bdb9-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:17 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso1163686f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:16 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:15 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781874316; x=1782479116; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDpOdhu2pX3r4tDQzsxVRLFNGhGBpjSsL2fSh51Ah0k=;
        b=OoMvaPy+r5KQU10hGeOBLQ2OcyB7PQesJW1S0QFhZOW1NFXlytoa8+z0buRhYpOyk2
         4ALW/4l1cVg/Dc/7BJ4v/aEcunQkS6DCL6srtziD2649FI4yrQRJmsbrBCsOgvrliz09
         qBf/7P0cB7+pr+pdx6ejZLAXwj+jwe5IuKEW5fV7cADidRgFiX3474/lyJFjFpTYCDiR
         d15xDjbWOXZ+ZKQI5r1hSdTGx1ViPiJw3FuzqVIpqK7Iz7PfjI7LJ3H3+eo5DSz/q8oa
         1YGXyt5c2ZTfZEQeMAojdiE3uUzAmwXu9p0AyrX3H0D+w+b1g81bjRsRVLOalxN3IaIv
         egFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874316; x=1782479116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDpOdhu2pX3r4tDQzsxVRLFNGhGBpjSsL2fSh51Ah0k=;
        b=YMP+HoitVa3f7ovgDyOVhqiyI1nr9tNNNM8IYOS9D5hjU/sETuCmgS2lrfY1DuVfW7
         0CZrkmfCB6Gc0//zJG10++PlI14F6oMqdD+JWMPLIMIVmp/FQ/Lvz1AKw8NDT04lAK7q
         Bjva92ZHGCyJs8JPqDfPdDtjgOZ5jm8q6xSYpylQSF1QU3P9toVcSYVEGgV5rFsFIkvr
         TYikmlHOFDKeCBxVtb66z2h3ZZlko8IyAhzNZUG6I1EdaIpdT4/NVMbbW5Qeaft0bX54
         MD6zRZzcmdHPH7Isx92c11HvfyzDKm243Va+LcfFTNaoJ1k4jj+/xObEmxyxXumdfxPl
         LsaQ==
X-Gm-Message-State: AOJu0Ywgn7AKzuJs2gyT4MK886pN5iFJX9gwsFY3mk1QU5pnZJswdccP
	7ejUltwygoKde4YgjHNyaDyWFRmmJnD+dvt+UM4Inp4KYQULpoo4A3CI9zrbTHW26mg=
X-Gm-Gg: AfdE7ckDbYm2/eo0Izmklok/Rlw1YJE8HpuuadBLxWPk5C09Miq8DQ8LAW/h5csI6mm
	IXv1lMeLph5W0RaNpBW5p5kk3s18NhAByGcnOIGGswVRRDHo/izgqevhLU237Hzc/qNcU+bKoEK
	IeN9j+8eMF/pOUNrNxSFLP0u+oRZe11rWTZl9gOqDRjCVS1B2+D6OMjAGD10RRNeLW+NAfaOSNG
	Mzyzs+wNErxrFjQ6ef8daAnwWox1ZLLlCulkUvFySYvYa17xKfPz7YwvbhrFTidXGecCpnZlAtS
	dtctD5iw+R7zx/etd61NkHKYdA6ASG2/n416GCtPGazxLSEtYXeBE/6dcc8DB09oZUbD4bAkUfv
	oY5+1yelFAVIlZyVQTnp2ESmY72ZVr9fky5DRbt4pOUNwmfmusrUjRbDGJJfan+JtyK+EhWL7aY
	x8l948sFmSyEGylVgbqcpjeiVMP21upjXXoiOV+n0edf5BflnZTbXWKhdjA+LqWHtcNXoGtyYg/
	J3/HoDsJb+WlSG9+D4=
X-Received: by 2002:a05:6000:1888:b0:45e:df46:ba30 with SMTP id ffacd0b85a97d-4656fe28662mr3677057f8f.34.1781874316343;
        Fri, 19 Jun 2026 06:05:16 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v6 05/16] libs/guest: allocate various migration arrays just once
Date: Fri, 19 Jun 2026 14:04:50 +0100
Message-ID: <20260619130501.272832-6-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1781874317-E31DDD84-B3F682C0/0/0
X-purgate-type: clean
X-purgate-size: 6557
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7AB136A5F39

From: Edwin Török <edwin.torok@citrix.com>

Allocate these array just once at the start of migration,
using the maximum batch size, and free them at the end.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- change prefix in subject.

Changes since v3:
- fix comment style

Changes since v4:
- change order of fields in structure.
---
 tools/libs/guest/xg_sr_common.h | 13 +++++++
 tools/libs/guest/xg_sr_save.c   | 66 +++++++++++++--------------------
 2 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index f1573aefcb..95b0564e5c 100644
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
+    void *guest_data[MAX_BATCH_SIZE];
+    void *local_pages[MAX_BATCH_SIZE];
+    struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
+    uint64_t rec_pfns[MAX_BATCH_SIZE];
+    int errors[MAX_BATCH_SIZE];
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
index 8c31f9f86c..4988d8040b 100644
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
@@ -104,26 +104,24 @@ static int write_batch(struct xc_sr_context *ctx)
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
@@ -209,14 +207,6 @@ static int write_batch(struct xc_sr_context *ctx)
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
@@ -806,18 +792,18 @@ static int setup(struct xc_sr_context *ctx)
 
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
 
@@ -841,7 +827,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
-    free(ctx->save.batch_pfns);
+    free(ctx->save.buffers);
 }
 
 /*
-- 
2.43.0


