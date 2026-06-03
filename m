Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QC2XOdsmIGqgxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90459637DC3
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gbcqRJTb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326228.1591699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIf-0006Aw-LP; Wed, 03 Jun 2026 13:06:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326228.1591699; Wed, 03 Jun 2026 13:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIf-00068o-Fi; Wed, 03 Jun 2026 13:06:25 +0000
Received: by outflank-mailman (input) for mailman id 1326228;
 Wed, 03 Jun 2026 13:06:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlId-0005fU-Ft
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIc-007IYC-St
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026c8-bab6-0a2a0a5309dd-0a2a4509cd16-40
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:22 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026ce-2497-0a2a45090019-d155dd31e4ad-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:22 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45ef372c58aso2818108f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:22 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:21 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491982; x=1781096782; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngHaiXVcIZgsSzheol0Gqpgp4lQa4ltKlhodC4+DNtk=;
        b=gbcqRJTbXZ/KrrbJsX0qctBQVUa8KUGVs4wXZ9ZbMcWuCz+Nut92FaxVXL9lF3F2K3
         yo7kQfqE8W2Ck8NqiFlvfhaIi+xVs0G5lAd++Gqr3l00nTJuuyYXJHIiwi3XFdJtsZGK
         FgXJ/dp7yliq8W07cWeeiCQYujwwaDn1VlgViLGt6eOd6cLyO6evO8B4yJ+cWQoMXaMX
         AmW6Mj2TWiRGtHbQrr6t5VHigP7P9Ue/o6uNp3Pu/+DGACyo9cJdndQ3gPL20UpF3yVK
         cVry8ddG3E2+UtUi13HrsOn/STW00AIOHIVOb1T9JwV//9iOA7gpDFa63CJ++PoRGWj/
         HE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491982; x=1781096782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngHaiXVcIZgsSzheol0Gqpgp4lQa4ltKlhodC4+DNtk=;
        b=TXW7IglQiFOjji7KvQwyudstIBndwHX3f5Y/0pxGCGeGWFfeWPZhssdDrB2TWRtEo1
         vKRDSy3Lf13uB5gwuf80CtJdBUwjdCCLytWYa0N7ziFGIynCKqE9B6ZCgXG4HYKaHtF/
         6Ve8Tyg3rSlq9rpM33iBV4aR8bytK7uSZv7EF/1Tm/BSdgaUUEtxFrvHo9S7HYVNLqMg
         KBrIp5/caRfzVPb/u5/W1GL9cl4Jcq1o4GVUnBBiQLHwsKNt0KiO0PZeT+8L9sKo/Y8+
         ZuSifTB24wMMHiTFA2yT3zRvW/0impAjYpTy8l0ZUxwIBNHFCxAgWlj3rV9OyINmtKJ/
         MoQQ==
X-Gm-Message-State: AOJu0YxzUneePm39btn0yT12YS2rFOIR3n+/sGFT9H97/kC4GW8sGloP
	G+mA9EQmCtqPcQmatevEoARILCnOxchTlAu1k2jt466MVwTOqxvYmvYLgXIXcK5t
X-Gm-Gg: Acq92OE+mf5Ggrwfy5jeZTnrS/fogo1YUzhjE09RtOWGk0azIuYmf/qx/Y4FRoD8Zfq
	cWnuJbeOGXHBkzPjsVFLgVvk8zxFj2p00YnKRvaa+hfGqfsBPjRoqp//h7gaaYS7dN1h87lfUyB
	Pksglqh6t9Lf0QE1oj8ua020jSpA4FRU8iudVN0tyfuCSn+lYVFE67sWhRZJ8TZF/IpGWSfk9vL
	A7mveFu/JvK5HMUBPBYmOVXEiEtOe3sqXpB8Tfwc3M41jFXo6R3VaJhv5odZhQBlsCUU1V2haID
	SqdNPH30KY25Fw4Tc86BBBPjSXUBPn7YYU5IqinlEBxGPh+ivORIsOEJMSWbqskPytzmrZ2JwXG
	k8kKpoqA8U3q+F7U/9hpDgt59/zmyAsxYd/U7hCmwJWIIDxBeZSMwGFquFnyIxWD0CKOWlu+lZj
	IzlrqEpWiRzO1lPXgtzDNJOZWXbHPMK3336b8IfrrZ1kQm1x+W9/50Ys5Ge08vhjNs2aio1aiPD
	CzD2vuWAGs1ujzdvbEH6DiYIgGrxJCCY5JK
X-Received: by 2002:a5d:5989:0:b0:45e:eef5:b51e with SMTP id ffacd0b85a97d-4602181fafdmr5032385f8f.23.1780491981925;
        Wed, 03 Jun 2026 06:06:21 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v4 05/16] libs/guest: allocate various migration arrays just once
Date: Wed,  3 Jun 2026 14:05:52 +0100
Message-ID: <20260603130603.776452-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780491982-89D85A53-6F8A59D2/0/0
X-purgate-type: clean
X-purgate-size: 6496
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
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
X-Rspamd-Queue-Id: 90459637DC3

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
---
 tools/libs/guest/xg_sr_common.h | 13 +++++++
 tools/libs/guest/xg_sr_save.c   | 66 +++++++++++++--------------------
 2 files changed, 39 insertions(+), 40 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index f1573aefcb..82549b5589 100644
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
+    struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
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
index 8c4e760f8d..7d8055a3f9 100644
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
2.54.0


