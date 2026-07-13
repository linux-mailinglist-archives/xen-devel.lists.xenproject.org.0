Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YAxcCTZPVWqNmgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 22:48:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F1374F220
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 22:48:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Lfpyq0fG;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1361928.1613963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjNZV-0005TT-O5; Mon, 13 Jul 2026 20:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361928.1613963; Mon, 13 Jul 2026 20:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjNZV-0005Od-Kv; Mon, 13 Jul 2026 20:48:13 +0000
Received: by outflank-mailman (input) for mailman id 1361928;
 Mon, 13 Jul 2026 20:48:12 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wjNZT-0005Ch-RS
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:48:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjNZS-00EnAW-RK
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 22:48:10 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a554ec9-2eae-0a2a0a5409dd-0a2a45048844-44
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 22:48:10 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <freddy77@gmail.com>)
 id 6a554f0a-b1e5-0a2a45040019-d155802ccc2c-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 22:48:10 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493ec555a26so23344065e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 13:48:10 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49508724786sm23924255e9.3.2026.07.13.13.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 13:48:09 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783975690; x=1784580490; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVzljfbFKFoNV9C92LIEgW8vPbCFaLYksP7zU4eJtPg=;
        b=Lfpyq0fGX2JbH3BvmU6VFdcBYCw1eUxmF9Kzk2HN1OmikL9mOzmtBCR0ExXFEfujYs
         jBFpYt8VXWI9HqZkp651BREYvfKWIWb1eJk2NS+U8RWdCjXuD1xrNpM5ZCykrvclC0LB
         8dVAGqhygtiJ2DDJFD2Ds5xUMi2KJRTMJA9KIpYKy6d4RNY7jsXSF/pLfRYzJnuRGp/d
         MJBSwRN4yqTLCgrxXg/zRLy1Iogr7KSNsYHG/N0vMcuoVYuIOOR0Bk0lxvOh7+CzS9Jf
         MfBl00jH7gS2AX1lorr4HO/8kVceP1bjwczl3wztCVQaYpr7FAuhPOwWWrl8hjfECOno
         lLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783975690; x=1784580490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVzljfbFKFoNV9C92LIEgW8vPbCFaLYksP7zU4eJtPg=;
        b=emsP145JUMrID6oFJP8xow1dkLbPbPGUQ7WSHJnCpkbdDCK/6ROQJFOkkxP255m5lC
         Ocrb4qIjbEpVBQ8X3TC4dxEGpz6zDIK9thchWYuEGQ4Ct64ZwuS7RHvynYRTp/dmfKFe
         q3PyWHYZ8tcjO/MrB5nQAA5e5qiFFE42IhHy8eQvk/p1+zlYDuTSbnl2n6StpmBxKaBS
         7VtvlxYVYebuQlJo/o2pUswF8Uv0vJDSrtJvPd1EcKFjFVwjAoSZMYDa8vOoYWKmkSjB
         gMrniLHeGCEw/8ZGcWoc159zN9ZLbdtRBbXdJ4mKAn1avtZDOEcktGVX6ksIUQhtkhPf
         4HLw==
X-Gm-Message-State: AOJu0YyUvlwfE8KzvYe5fML2kUtTMNuVc6jt1FUef6YU01NahzGkxXUW
	qEd44Mn1irypBRDEReQjg+SDHVypQeI2kj5g1OoLcrf8Qw5l1pLC7Cn1F8ladf18WJaABw==
X-Gm-Gg: AfdE7cnmrsunqDpp8QVFHV9A7Pdc14PpT2BYQxj6DFggTwro3HPJH963tTB35cB4NbP
	dTLu8b3dC41hKxjCjR3Z9Z0Q2AEXLxfkQ8mFnGCURXLxPoXjJIutEAw2LEON/DrVmKHeCkIVwMM
	aSdiiwjjYTxCA2/JGrxorerXw5h6NbdJ9Fmw8CLI5RDCw1SPaeKM89SjTABrhP2QBYpfkXw/hRR
	VSeJ3vLWGI2K5UKp58Dku5VUMBUaT0YSyj3mdlTRnZLgAwMK9kJwaQs8aETwaV5Sxo5cbwWcfrh
	W5yBlkP8/xGoZywZM+4yPvx+kYrqtwNzfV/IAyufr52skpAh6RQuhYYlN4xVbQWGkqp8m+o+7Y8
	ayXsk+V/v3lpk7cueVTJUg3i7vzZtknG5bCbm3DCTsBoWWQOeykxopXendCiS1qY3HzHhnCfL8d
	OFH5yhN8JFGO1ufYcKM4XZ4T+e45jdu9A8E716s3IQ3es6a3yiKSaKdyRhy55pAuCwuaTcsq3mM
	+IkFzj7EVTqA5CW507NKYBEFahv7Q==
X-Received: by 2002:a05:600c:3d8b:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-493f8818e5dmr116948595e9.20.1783975690107;
        Mon, 13 Jul 2026 13:48:10 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v9 2/4] libs/guest: move batch_pfns into a separate structure
Date: Mon, 13 Jul 2026 21:48:00 +0100
Message-ID: <20260713204802.105115-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713204802.105115-1-frediano.ziglio@citrix.com>
References: <20260713204802.105115-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1783975690-75E53FE7-6214D1A6/0/0
X-purgate-type: clean
X-purgate-size: 6125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7F1374F220

Preparation for a followup patch "libs/guest: allocate various migration
arrays just once".

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
---
Changes since v6:
- split from "libs/guest: allocate various migration arrays just once".

Changes since v7:
- initialize "batch_pfns" on declaration.

Changes since v8:
- remove useless check;
- added Reviewed-by.
---
 tools/libs/guest/xg_sr_common.h |  5 ++++-
 tools/libs/guest/xg_sr_save.c   | 28 ++++++++++++++--------------
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index f1573aefcb..7574c9f5b6 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -239,11 +239,14 @@ struct xc_sr_context
 
             struct precopy_stats stats;
 
-            xen_pfn_t *batch_pfns;
             unsigned int nr_batch_pfns;
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
+            struct xc_sr_context_save_buffers
+            {
+                xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+            } *buffers;
         } save;
 
         struct /* Restore data. */
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 84fdbe4140..22348db445 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -75,7 +75,7 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 
 /*
  * Writes a batch of memory as a PAGE_DATA record into the stream.  The batch
- * is constructed in ctx->save.batch_pfns.
+ * is constructed in ctx->save.buffers->batch_pfns.
  *
  * This function:
  * - gets the types for each pfn in the batch.
@@ -95,6 +95,7 @@ static int write_batch(struct xc_sr_context *ctx)
     void *page, *orig_page;
     uint64_t *rec_pfns = NULL;
     struct iovec *iov = NULL; int iovcnt = 0;
+    xen_pfn_t *const batch_pfns = ctx->save.buffers->batch_pfns;
     struct {
         struct xc_sr_rhdr rec;
         struct xc_sr_rec_page_data_header page_data;
@@ -110,6 +111,7 @@ static int write_batch(struct xc_sr_context *ctx)
     };
 
     assert(nr_pfns != 0);
+    assert(nr_pfns <= MAX_BATCH_SIZE);
 
     /* Mfns of the batch pfns. */
     mfns = malloc(nr_pfns * sizeof(*mfns));
@@ -141,13 +143,12 @@ static int write_batch(struct xc_sr_context *ctx)
 
     for ( i = 0; i < nr_pfns; ++i )
     {
-        types[i] = mfns[i] = ctx->save.ops.pfn_to_gfn(ctx,
-                                                      ctx->save.batch_pfns[i]);
+        types[i] = mfns[i] = ctx->save.ops.pfn_to_gfn(ctx, batch_pfns[i]);
 
         /* Likely a ballooned page. */
         if ( mfns[i] == INVALID_MFN )
         {
-            set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
+            set_bit(batch_pfns[i], ctx->save.deferred_pages);
             ++ctx->save.nr_deferred_pages;
         }
     }
@@ -193,7 +194,7 @@ static int write_batch(struct xc_sr_context *ctx)
             if ( errors[p] )
             {
                 ERROR("Mapping of pfn %#"PRIpfn" (mfn %#"PRIpfn") failed %d",
-                      ctx->save.batch_pfns[i], mfns[p], errors[p]);
+                      batch_pfns[i], mfns[p], errors[p]);
                 goto err;
             }
 
@@ -207,7 +208,7 @@ static int write_batch(struct xc_sr_context *ctx)
             {
                 if ( rc == -1 && errno == EAGAIN )
                 {
-                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
+                    set_bit(batch_pfns[i], ctx->save.deferred_pages);
                     ++ctx->save.nr_deferred_pages;
                     types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
@@ -235,7 +236,7 @@ static int write_batch(struct xc_sr_context *ctx)
     hdrs.rec.length += nr_pages * PAGE_SIZE;
 
     for ( i = 0; i < nr_pfns; ++i )
-        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
+        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | batch_pfns[i];
 
     if ( writev_exact(ctx->fd, iov, iovcnt) )
     {
@@ -274,9 +275,9 @@ static int flush_batch(struct xc_sr_context *ctx)
 
     if ( !rc )
     {
-        VALGRIND_MAKE_MEM_UNDEFINED(ctx->save.batch_pfns,
+        VALGRIND_MAKE_MEM_UNDEFINED(ctx->save.buffers->batch_pfns,
                                     MAX_BATCH_SIZE *
-                                    sizeof(*ctx->save.batch_pfns));
+                                    sizeof(*ctx->save.buffers->batch_pfns));
     }
 
     return rc;
@@ -293,7 +294,7 @@ static int add_to_batch(struct xc_sr_context *ctx, xen_pfn_t pfn)
         rc = flush_batch(ctx);
 
     if ( rc == 0 )
-        ctx->save.batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
+        ctx->save.buffers->batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
 
     return rc;
 }
@@ -784,11 +785,10 @@ static int setup(struct xc_sr_context *ctx)
 
     dirty_bitmap = xc_hypercall_buffer_alloc_pages(
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
-    ctx->save.batch_pfns = malloc(MAX_BATCH_SIZE *
-                                  sizeof(*ctx->save.batch_pfns));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
+    ctx->save.buffers = calloc(1, sizeof(*ctx->save.buffers));
 
-    if ( !ctx->save.batch_pfns || !dirty_bitmap || !ctx->save.deferred_pages )
+    if ( !ctx->save.buffers || !dirty_bitmap || !ctx->save.deferred_pages )
     {
         ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
               " deferred pages");
@@ -819,7 +819,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
-    free(ctx->save.batch_pfns);
+    free(ctx->save.buffers);
 }
 
 /*
-- 
2.43.0


