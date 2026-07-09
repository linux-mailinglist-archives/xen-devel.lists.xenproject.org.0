Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id exOpDHpRT2poeQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 09:44:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9572DE56
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 09:44:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=G98FWxkP;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357593.1611998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjQr-0007tc-Ao; Thu, 09 Jul 2026 07:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357593.1611998; Thu, 09 Jul 2026 07:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whjQr-0007rA-7U; Thu, 09 Jul 2026 07:44:29 +0000
Received: by outflank-mailman (input) for mailman id 1357593;
 Thu, 09 Jul 2026 07:44:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1whjQp-0007bd-N5
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 07:44:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whjQp-002ZqU-0O
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:44:27 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f5151-5cb7-0a2a0a5109dd-0a2a4508d66a-12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:44:26 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4f515a-edec-0a2a45080019-d1558034f152-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 09:44:26 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493ba701891so10932755e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 00:44:26 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3b85sm69114695e9.2.2026.07.09.00.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2026 00:44:25 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783583066; x=1784187866; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SbsTLttx8i+LOt+EpVY9O+4mn+TTqNBKH43++Zu9LAk=;
        b=G98FWxkPF9XajoO7l9WWP6odvxwlkZv1TjCALS/yuAinL7d3BTgnrxUDFu8d84cmUU
         jLxU+GR14/O+/QxaK+zmEcIeOKgARE6zV9PsV5gGW8UdqWM/8XT8cteR0TSlaLKsSkIU
         PYI7V0RaRvnBAJ1ZVViW91Z+BrIOAT8Q5WtdaiLepu3tHof0pDKyzl7fWa2bJw8ZoA6D
         bbQwFDPQNJeLd5k21kbYHQ6Uys8XbdEbUy0AstHuGkBRg6wQfjWj6G47Xi9X71VynK5x
         BHuBPBw8jyAs1+N72RkhYMbAbPOpJMtY4i5PrmsMoDDGAqHc7NetP3WJtuyK9rYZwdF4
         6gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783583066; x=1784187866;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbsTLttx8i+LOt+EpVY9O+4mn+TTqNBKH43++Zu9LAk=;
        b=j8xM6Ws39RDCqkz0la4+hFQtBUEXMobezpxrUsrYts09Dcm0d6YS0LEI3dxeuEW0Cy
         ct59nao2vLVHaRfaJo5KQ4YNWO2bEw64fQ2ssc5BXiT5EuGwwlMGJ+zv1e1NeU9kcMoc
         SQMY3UFBSfsim9MREvN2W1ZGdgD4bzCuhDtt/nuBdtJSFcXB1a2AShQ845PuQoHD9Nac
         QJEjiZFAV1wMJ9FtJmFM46IyrnhxmTfzfHBbR73f1aKyBDVWzO5boe5E5ugBeutOvlt4
         eVqvkIhwx/jqfa9z14kIP6EN1T3trc1BD4BTPtohUnRkwDv9Xrj5tujCr5O8slmyFGxG
         62Pw==
X-Gm-Message-State: AOJu0YwuHKrc3pc708uVroB4HEv7Uy1NVLXQTYpv6aJ2s+uDkaEb+/fB
	k2T0u1lhRCdHrm4pYYh3MhlUrn+y1AfMaBfdrnPIHANHkmYBxVsJxuwKN+tyok9uoXQ=
X-Gm-Gg: AfdE7clBbRkAl6PgXxp7pjFc/moQRdJUF0LE49K3/BAMbwhTulhbvXjWQL6Jjn8ZVsX
	rqxWJ8EscmbT3FPYhTnZM0p5d5bHrEZZhsqTwY1jQ7rLshyfl0ZB+OLgQpb1YWfPT0ib1IOGk7t
	87jMBPkFWXZIkiFYXTMVyttdctAeJKqZhS1NCNtR5D5s2Xhm8kHk7V35jlKTZI35dKawEts4djv
	kUsnNrAX5Sh9Rm7m7rUiOpTvBAT2TTRlFog4VybPN44r3bX+zOwMeFEF5wOStQ+0vlp5wrGse/y
	suPsFCmffMdQ2UYGi8gcmQGj41L/Qftb8E23F2ZIb51bGRA7+8U57MbqxdFq1O1r0dP+hP9mrA1
	2+zyWfSP+xriwmmLCiECJhDnEQt8f74B8snIbQ1p/4hQC6zTMVvKUGvQEDSQuelFK564/bInSsH
	khU/QmWGIqfzH181PN0+8vJufj2CpWP7bUydudDsZJYLTbBKCkBub9UCAdv5LyeXTMNy+8U5bh+
	OsI48HbDx9RgE6+HDw=
X-Received: by 2002:a05:600d:8497:20b0:493:b55f:bca4 with SMTP id 5b1f17b1804b1-493e68cec61mr42867035e9.29.1783583066271;
        Thu, 09 Jul 2026 00:44:26 -0700 (PDT)
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
Subject: [PATCH v7 4/6] libs/guest: move batch_pfns into a separate structure
Date: Thu,  9 Jul 2026 08:43:55 +0100
Message-ID: <20260709074358.256084-5-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709074358.256084-1-frediano.ziglio@citrix.com>
References: <20260709074358.256084-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1783583066-413283FC-20146C73/0/0
X-purgate-type: clean
X-purgate-size: 5973
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CD9572DE56

From: Edwin Török <edwin.torok@citrix.com>

Prepare for following change.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v6:
- split from "libs/guest: allocate various migration arrays just once".
---
 tools/libs/guest/xg_sr_common.h |  5 ++++-
 tools/libs/guest/xg_sr_save.c   | 31 +++++++++++++++++--------------
 2 files changed, 21 insertions(+), 15 deletions(-)

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
index 84fdbe4140..8956f4260d 100644
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
+    xen_pfn_t *batch_pfns;
     struct {
         struct xc_sr_rhdr rec;
         struct xc_sr_rec_page_data_header page_data;
@@ -110,6 +111,10 @@ static int write_batch(struct xc_sr_context *ctx)
     };
 
     assert(nr_pfns != 0);
+    assert(nr_pfns <= MAX_BATCH_SIZE);
+    assert(ctx->save.buffers);
+
+    batch_pfns = ctx->save.buffers->batch_pfns;
 
     /* Mfns of the batch pfns. */
     mfns = malloc(nr_pfns * sizeof(*mfns));
@@ -141,13 +146,12 @@ static int write_batch(struct xc_sr_context *ctx)
 
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
@@ -193,7 +197,7 @@ static int write_batch(struct xc_sr_context *ctx)
             if ( errors[p] )
             {
                 ERROR("Mapping of pfn %#"PRIpfn" (mfn %#"PRIpfn") failed %d",
-                      ctx->save.batch_pfns[i], mfns[p], errors[p]);
+                      batch_pfns[i], mfns[p], errors[p]);
                 goto err;
             }
 
@@ -207,7 +211,7 @@ static int write_batch(struct xc_sr_context *ctx)
             {
                 if ( rc == -1 && errno == EAGAIN )
                 {
-                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
+                    set_bit(batch_pfns[i], ctx->save.deferred_pages);
                     ++ctx->save.nr_deferred_pages;
                     types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
@@ -235,7 +239,7 @@ static int write_batch(struct xc_sr_context *ctx)
     hdrs.rec.length += nr_pages * PAGE_SIZE;
 
     for ( i = 0; i < nr_pfns; ++i )
-        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
+        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | batch_pfns[i];
 
     if ( writev_exact(ctx->fd, iov, iovcnt) )
     {
@@ -274,9 +278,9 @@ static int flush_batch(struct xc_sr_context *ctx)
 
     if ( !rc )
     {
-        VALGRIND_MAKE_MEM_UNDEFINED(ctx->save.batch_pfns,
+        VALGRIND_MAKE_MEM_UNDEFINED(ctx->save.buffers->batch_pfns,
                                     MAX_BATCH_SIZE *
-                                    sizeof(*ctx->save.batch_pfns));
+                                    sizeof(*ctx->save.buffers->batch_pfns));
     }
 
     return rc;
@@ -293,7 +297,7 @@ static int add_to_batch(struct xc_sr_context *ctx, xen_pfn_t pfn)
         rc = flush_batch(ctx);
 
     if ( rc == 0 )
-        ctx->save.batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
+        ctx->save.buffers->batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
 
     return rc;
 }
@@ -784,11 +788,10 @@ static int setup(struct xc_sr_context *ctx)
 
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
@@ -819,7 +822,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
-    free(ctx->save.batch_pfns);
+    free(ctx->save.buffers);
 }
 
 /*
-- 
2.43.0


