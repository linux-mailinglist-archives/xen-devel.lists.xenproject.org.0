Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W+oMA+kmIGqyxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A12637DEC
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OobR68dV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326245.1591781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIt-0000WZ-9M; Wed, 03 Jun 2026 13:06:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326245.1591781; Wed, 03 Jun 2026 13:06:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIs-0000Mk-QC; Wed, 03 Jun 2026 13:06:38 +0000
Received: by outflank-mailman (input) for mailman id 1326245;
 Wed, 03 Jun 2026 13:06:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIp-00088p-6X
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIo-006lUv-Ib
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:34 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d9-5cb7-0a2a0a5109dd-0a2a450cb872-10
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:34 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026da-62f1-0a2a450c0019-d155dd2dd117-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:34 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-46019b190b6so1727727f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:34 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:33 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491994; x=1781096794; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rW1WV99Hkic2EY+4V0AfPPFzJ+ncY9UKbR4cY6w6JcU=;
        b=OobR68dVHycE5zvua5oij7gGnac7TNZr2QbBuRZE8A5vpdLo7udrk8byiNDyR2zU5W
         fc0929oSAUrDrzB9eEe/5et8M56qU1QTxdlwUUTvNwP6/7/9ic7uNALaRs1NPTSQ3rnH
         2io6ICApuy4YhRVAhnx3Dw+ubDzH1eUoXYKcwOBxlLDSEhiChKSpCIj4CddjTcO48bi1
         FDavynaN/EzTgzSuVXdFWKt/gRo2o2Nmt8a+AVjU7nTfobI+t0FEs+fLVAtphVINWbTG
         7XIsYKXA481YmOWsW0pdOackAR/wSfwEADPe1rwwp3/pOUkMgAIbgaaW5kGVOxmgcuxL
         +lhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491994; x=1781096794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rW1WV99Hkic2EY+4V0AfPPFzJ+ncY9UKbR4cY6w6JcU=;
        b=oc3eMMGZ2K8HicI9xwinpX5BehgiDKD5u9SPYU7foUMVV2pxYzyjD+2DvL2LX8RcIY
         hoGCP4CdsNe0JsdLX4Uj+9Rn7ApJH68mTIJtvpyVDnZMtdwlZtT9so7wEsHSGnAVq6XI
         6AuIwo9g6M7SEyPkmvwnQKv87obuz12LYTxMhrbSWL8JXeUVmWuKQ65/IYb8mQ8+FlmC
         leGi1pArztaJx97ORVclRcRHolcQukQ8DIMroLOOpMhG9YdYIBns3XWjD4S7BWo0krrX
         IA9zlUacVlgExj/JeCPl6iNKIBUMp6FfSyTkXgYaBU6roiSrPymMXIy4aMmGtbvdsBvy
         BLHA==
X-Gm-Message-State: AOJu0YxFQCw6lK73kjH01yJD2CotpMSTh8TJGJSaZxV4UUPRBaDeh1BK
	rP51dL8B6A+8wKGcpaxUozHGMupP2D5w8E2UfH5EhqGUf3pTBfohUdYpuQcGjkWe
X-Gm-Gg: Acq92OF/fpa7Tejv5DM0BNuneMajkEAW39mjpTOGTkgnIU7oFoAcCCa4pNj4tQVZoeF
	Ni6CMKCsy9jhWf+5msoX6TUdyjnyHn6QFVFaW9pfaN3t5yYUF8q11y1fn79Vn8M6eLmfYWk7FHw
	EjrMF+QUhNPTfN4wSTHVPkbBEcj7FusmVsMa+YQqfRZ4DUB8T1SeiaGtZvGMcAx9+CTJUSXUkKW
	To29mY6jQY0MAoop2L9OLq4gw4tJRC1lHUiMEoAzAg6tlOotCXSLLj80Rfi3CfkVYKuvf+pjyQx
	KLPUYvaAlas9X1b8GfnmB5Rw7ArYXNuy/OIcwmKtCJwb4//pHEwmpZe/6+cRdrwBLdpiFNm5yuK
	emyZyW0NzR7iXKaDMfnGZ3wkLQyTo2dZaq0RxJttedCuoom6yZ5JRX4+xmlaQ9Z0I29FeeeQBar
	FsVe0O5lhnO0jNe8+o5weNWAYvjCBtfcPph3WJIDv36QtP86IvRrhM7vTktVhZO74rTQqmx3BIf
	FxiOseyJL6L1Xv9/WwDXd7FC9jc714sBp1q
X-Received: by 2002:a05:6000:41e6:b0:45e:739b:3e43 with SMTP id ffacd0b85a97d-46021808437mr4787756f8f.0.1780491993808;
        Wed, 03 Jun 2026 06:06:33 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 15/16] libs/guest: finalize PoC
Date: Wed,  3 Jun 2026 14:06:02 +0100
Message-ID: <20260603130603.776452-16-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1780491994-F4E78CF5-98893108/0/0
X-purgate-type: clean
X-purgate-size: 10902
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
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
X-Rspamd-Queue-Id: A9A12637DEC

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Remove now unused map_errs array.
Test and restore verification code.
Report correctly errors from writev_exact.
Allocate verification buffer using hypercall buffer to avoid errors
using hypercall.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_common.h  |  4 +-
 tools/libs/guest/xg_sr_restore.c | 48 +++++++++++++++---
 tools/libs/guest/xg_sr_save.c    | 83 +++++++++++++++++++++-----------
 3 files changed, 100 insertions(+), 35 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 0e0e279ae1..cd562f028a 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -214,7 +214,6 @@ struct xc_sr_context_save_buffers
     xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     xen_pfn_t types[MAX_BATCH_SIZE];
-    int errors[MAX_BATCH_SIZE];
     void *local_pages[MAX_BATCH_SIZE];
     struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
     uint64_t rec_pfns[MAX_BATCH_SIZE];
@@ -255,8 +254,8 @@ struct xc_sr_context
             unsigned long *deferred_pages;
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
+            xc_hypercall_buffer_t dest_buf;
             struct xc_sr_context_save_buffers *buffers;
-            void *dest_buf;
         } save;
 
         struct /* Restore data. */
@@ -267,6 +266,7 @@ struct xc_sr_context
             int send_back_fd;
             unsigned long p2m_size;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
+            xc_hypercall_buffer_t verify_buf;
 
             /* From Image Header. */
             uint32_t format_version;
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index b589f0397d..b2df36c6f6 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -257,15 +257,15 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = malloc(count * sizeof(*mfns));
-    int *map_errs = malloc(count * sizeof(*map_errs));
     int rc;
     unsigned nr_pages;
+    void *const source = page_data;
 
-    if ( !mfns || !map_errs )
+    if ( !mfns )
     {
         rc = -1;
         ERROR("Failed to allocate %zu bytes to process page data",
-              count * (sizeof(*mfns) + sizeof(*map_errs)));
+              count * sizeof(*mfns));
         goto err;
     }
 
@@ -309,17 +309,37 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     }
     if ( !ctx->restore.verify )
     {
-        rc = xg_foreignmemory_copy_to(xch, ctx->domid, nr_pages, mfns, page_data);
+        rc = xg_foreignmemory_copy_to(xch, ctx->domid, nr_pages, mfns, source);
         if ( rc < 0 )
             goto err;
     }
+    else
+    {
+        DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, verify_buf,
+                                        &ctx->restore.verify_buf);
+
+        rc = xg_foreignmemory_copy_from(xch, ctx->domid, nr_pages, verify_buf, mfns);
+        if ( rc < 0 )
+            goto err;
+
+        void *guest_page = verify_buf;
+        page_data = source;
+        for ( unsigned i = 0; i < nr_pages; ++i )
+        {
+            /* Verify mode - compare incoming data to what we already have. */
+            if ( memcmp(guest_page, page_data, PAGE_SIZE) )
+                ERROR("verify pfn %#"PRIpfn" failed (type %#"PRIx32")",
+                      pfns[i], types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
+
+            guest_page += PAGE_SIZE;
+            page_data += PAGE_SIZE;
+        }
+    }
 
  done:
     rc = 0;
 
  err:
-
-    free(map_errs);
     free(mfns);
 
     return rc;
@@ -709,6 +729,18 @@ static int setup(struct xc_sr_context *ctx)
     int rc;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->restore.dirty_bitmap_hbuf);
+    DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, verify_buf,
+                                    &ctx->restore.verify_buf);
+
+    verify_buf = xc_hypercall_buffer_alloc_pages(
+        xch, verify_buf, MAX_BATCH_SIZE);
+
+    if ( !verify_buf )
+    {
+        ERROR("Unable to allocate memory for test buffer");
+        rc = -1;
+        goto err;
+    }
 
     if ( ctx->stream_type == XC_STREAM_COLO )
     {
@@ -757,6 +789,8 @@ static void cleanup(struct xc_sr_context *ctx)
     unsigned int i;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->restore.dirty_bitmap_hbuf);
+    DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, verify_buf,
+                                    &ctx->restore.verify_buf);
 
     for ( i = 0; i < ctx->restore.buffered_rec_num; i++ )
         free(ctx->restore.buffered_records[i].data);
@@ -765,6 +799,8 @@ static void cleanup(struct xc_sr_context *ctx)
         xc_hypercall_buffer_free_pages(
             xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->restore.p2m_size)));
 
+    xc_hypercall_buffer_free_pages(xch, verify_buf, MAX_BATCH_SIZE);
+
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index ae61f97a47..514ca4be63 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -88,7 +88,7 @@ static int write_batch(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns, *types;
     void **local_pages;
-    int *errors, rc = -1;
+    int rc = -1;
     unsigned int i, nr_pages = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     uint64_t *rec_pfns;
@@ -109,8 +109,6 @@ static int write_batch(struct xc_sr_context *ctx)
     mfns = ctx->save.buffers->mfns;
     /* Types of the batch pfns. */
     types = ctx->save.buffers->types;
-    /* Errors from attempting to map the gfns. */
-    errors = ctx->save.buffers->errors;
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = ctx->save.buffers->local_pages;
     memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
@@ -166,18 +164,54 @@ static int write_batch(struct xc_sr_context *ctx)
 
     iovcnt = 2;
 
-    rc = xg_foreignmemory_copy_from(xch, ctx->domid, nr_pages, ctx->save.dest_buf, mfns);
-    if ( rc < 0 )
-    {
-        ERROR("xg_foreignmemory_copy_from failed");
-        goto err;
-    }
-
     if ( nr_pages )
     {
-        iov[iovcnt].iov_base = ctx->save.dest_buf;
-        iov[iovcnt].iov_len = nr_pages << XC_PAGE_SHIFT;
-        iovcnt++;
+        int p;
+        void *page, *orig_page;
+
+        DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, dest_buf,
+                                        &ctx->save.dest_buf);
+
+        rc = xg_foreignmemory_copy_from(xch, ctx->domid, nr_pages, dest_buf, mfns);
+        if ( rc < 0 )
+        {
+            ERROR("xg_foreignmemory_copy_from failed");
+            goto err;
+        }
+
+        for ( i = 0, p = 0; i < nr_pfns; ++i )
+        {
+            if ( !page_type_has_stream_data(types[i]) )
+                continue;
+
+            orig_page = page = dest_buf + (p * PAGE_SIZE);
+            rc = ctx->save.ops.normalise_page(ctx, types[i], &page);
+
+            if ( orig_page != page )
+                local_pages[i] = page;
+
+            if ( rc )
+            {
+                if ( rc != -1 || errno != EAGAIN )
+                    goto err;
+
+                set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
+                ++ctx->save.nr_deferred_pages;
+                types[i] = XEN_DOMCTL_PFINFO_XTAB;
+                --nr_pages;
+            }
+            else if ( iov[iovcnt-1].iov_base + iov[iovcnt-1].iov_len == page )
+            {
+                iov[iovcnt-1].iov_len += PAGE_SIZE;
+            }
+            else
+            {
+                iov[iovcnt].iov_base = page;
+                iov[iovcnt].iov_len = PAGE_SIZE;
+                iovcnt++;
+            }
+            ++p;
+        }
     }
 
     hdrs.rec.length += nr_pages * PAGE_SIZE;
@@ -188,6 +222,7 @@ static int write_batch(struct xc_sr_context *ctx)
     if ( writev_exact(ctx->fd, iov, iovcnt) )
     {
         PERROR("Failed to write page data to stream");
+        rc = -1;
         goto err;
     }
 
@@ -717,30 +752,23 @@ static int setup(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
     int rc;
-    const unsigned dest_buf_len = MAX_BATCH_SIZE * XC_PAGE_SIZE;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
+    DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, dest_buf,
+                                    &ctx->save.dest_buf);
 
     rc = ctx->save.ops.setup(ctx);
     if ( rc )
         goto err;
 
+    dest_buf = xc_hypercall_buffer_alloc_pages(
+        xch, dest_buf, MAX_BATCH_SIZE);
     dirty_bitmap = xc_hypercall_buffer_alloc_pages(
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
     ctx->save.buffers = calloc(1, sizeof(*ctx->save.buffers));
-    ctx->save.dest_buf = NULL;
-
-    rc = posix_memalign(&ctx->save.dest_buf, XC_PAGE_SIZE, dest_buf_len);
-    if ( rc )
-    {
-        ERROR("Unable to allocate %u bytes of buffer", dest_buf_len);
-        errno = rc;
-        rc = -1;
-        goto err;
-    }
 
-    if ( !dirty_bitmap || !ctx->save.deferred_pages || !ctx->save.buffers)
+    if ( !dirty_bitmap || !ctx->save.deferred_pages || !ctx->save.buffers || !dest_buf )
     {
         ERROR("Unable to allocate memory for dirty bitmaps, deferred pages"
               " and various batch buffers");
@@ -761,7 +789,8 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
-
+    DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, dest_buf,
+                                    &ctx->save.dest_buf);
 
     xc_shadow_control(xch, ctx->domid, XEN_DOMCTL_SHADOW_OP_OFF,
                       NULL, 0);
@@ -771,9 +800,9 @@ static void cleanup(struct xc_sr_context *ctx)
 
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
+    xc_hypercall_buffer_free_pages(xch, dest_buf, MAX_BATCH_SIZE);
     free(ctx->save.deferred_pages);
     free(ctx->save.buffers);
-    free(ctx->save.dest_buf);
 }
 
 /*
-- 
2.54.0


