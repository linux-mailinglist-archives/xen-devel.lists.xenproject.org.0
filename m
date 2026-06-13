Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vm1aK0DQLWrykQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3C467FD1F
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XK54b7VK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1337556.1598867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWD9-0002G2-TP; Sat, 13 Jun 2026 21:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337556.1598867; Sat, 13 Jun 2026 21:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWD9-0002Ck-Pb; Sat, 13 Jun 2026 21:48:15 +0000
Received: by outflank-mailman (input) for mailman id 1337556;
 Sat, 13 Jun 2026 21:48:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWD7-0001F7-N6
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWD7-00DVVl-3I
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:13 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dcf18-2eae-0a2a0a5409dd-0a2a450bc4b2-28
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:13 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd01c-212f-0a2a450b0019-d155802ba569-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:13 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490b3e03939so16301845e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:13 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387292; x=1781992092; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDpOdhu2pX3r4tDQzsxVRLFNGhGBpjSsL2fSh51Ah0k=;
        b=XK54b7VKjEMIbTH28aN8AuBcp2Y0NKIMry5JrJ2oQvFGwQ/5Yi+g/fbuOnWmfO3Yo7
         P3KOOpXL+36LHzgrmLivPdVvJJvhoSb81B52UozAwsVFaneUlynnCCBvJrsLeoG5GxWs
         usC2CTsjHPYDrfazfUAW3bJSbL/aoDWNMbw/HhrYKyUA5JA15ByUnfyTvyZbUdTyz3U+
         U4aKqjnQXU9SHn33aJgQSbx5GYIRmCYNsAsmWX3jHlpShCYVW/kPuTiEgvyLc/t1rstq
         Bvni69xVNlD6SrFoTC6Fj68W+iq/XpSZpbxW0gXjqmSQSzKmnLOySYKatxhnEfwbARzx
         aaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387292; x=1781992092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDpOdhu2pX3r4tDQzsxVRLFNGhGBpjSsL2fSh51Ah0k=;
        b=BYRVprisdZgo+Ut0ovjxukA5ZvQJ478Zo20v5NYT3KAp9OAN0ITwc9cZS2VUK01I/B
         PQjzdfnpKuMtyxb9Owl+HETvOFdt+7hUc1ohm6wIDUJagz2coQfTLOYNIbIlyVMjLU5r
         OYY1wFb+murzAC+++auBqoo+g2ZEErrYzvdWCXB/knBcqVFAQSRKNtdqXM11Dd35nFUa
         KU+uUwj6QIwK/Q99TgLrxaa/YWELM+Q8dXTQWpGtWQGOT1ZeJBxZjEezFQdssOvEwSBg
         ZpjccZaDFE63C4geo7y6PtGS8nTeqCr/ulNw5H6BW5AQv4pDSxJLCfBsdxlDQmK9EgXt
         JLRw==
X-Gm-Message-State: AOJu0Yxsxw6z6kx7PrhR0FLzg2KWSrRaIUTwDLE1cXPccPqrYC/SN2Hw
	A+ipgYSCr8MlID58LMjYEJKi9MWiNaUmK9C55o6KFnhUE92JSi3B3WCJFah6lOhwK+8=
X-Gm-Gg: Acq92OErA8rAZlIlb7m1aaRM7kBVc0VYaUTeZxIFd0/+7xrBrkOAYbG4nm/vQUPHu/l
	mFu4FmRDFQc2PtMdUJAd/RSb2FigqvS0Yv/LBAf6nis8im6pUx954IGFhFAN9ZJmOkkEWrqKJRo
	VpbF/L1YNyz6R7y2qF4VUzizF2lI0+iMMa/E9/F+1ePGD133fpmWQ3yfJAGvLL2vQL79ljR+D5w
	r9GKUeuRNjxn+Pa7QoFHl9TUkoDlgG1o/zHwplsHsiS27Tj9mqUCNa8vQSp8rzCEw0ip8q/V6Fh
	Xz40NR5J7MHbvGaa6gIsayuDkY9/+nYFI5tEow1oaclqOmaMQbkwB+vkf54KR1pFFDC7lxbh0/P
	5r68XWMImX4F0HE3NwQOM4RnW1xjU6XF+/Z+jlz077plWeBSWjRiXwNeQYbgzYQnCwmZKardwk7
	BHqXKuSNgPK9odHRs34HHpVResHVKOtetfyP3Dd2H+Elqdu3BO0k1UqfVNrRN/k9CVfzrtrKRg3
	m98tFqyEZu2rNYrNwLFbl+sWA==
X-Received: by 2002:a05:600c:698c:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-490ec4e9147mr79639675e9.16.1781387292459;
        Sat, 13 Jun 2026 14:48:12 -0700 (PDT)
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
Subject: [PATCH v5 05/16] libs/guest: allocate various migration arrays just once
Date: Sat, 13 Jun 2026 22:47:38 +0100
Message-ID: <20260613214749.20620-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781387293-1A36CF3B-6CE8E2E1/0/0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:mid,citrix.com:email];
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
X-Rspamd-Queue-Id: 5E3C467FD1F

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


