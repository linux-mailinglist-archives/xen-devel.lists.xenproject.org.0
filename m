Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vODvNUDQLWrzkQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 897F767FD28
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DG1wKx5w;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1337562.1598913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDF-0003Pp-Az; Sat, 13 Jun 2026 21:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337562.1598913; Sat, 13 Jun 2026 21:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDF-0003MW-36; Sat, 13 Jun 2026 21:48:21 +0000
Received: by outflank-mailman (input) for mailman id 1337562;
 Sat, 13 Jun 2026 21:48:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWDD-00035f-NU
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWDD-002Ajp-3y
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:19 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dcfda-bab6-0a2a0a5309dd-0a2a4505b0c0-6
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:19 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd022-aaa8-0a2a45050019-d155802fedbf-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:19 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so19282735e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:19 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387298; x=1781992098; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZbBEu1yumZubA+jdFXfLBNW/6vA9c6a3PhaM+0TpSU=;
        b=DG1wKx5wywRyDi8ltJZbwsQGb/HK8goSFrgxp7B8qTiv2XBicu5LCL87Srj2pQfi3X
         Ico3ay0rxPrH0PT+9E1frSXSEkipsSMfExwa4FCo3v+IQ26DTaLx8wMMFzdRCQpUOE7Z
         DNejBxCYlvwJt4K2f4bif2kghXK3WmELXJzkohV3KUShZw0EDl332KdWEDkWpvZDISal
         7rFRGtV/MVOHc7+pfIIl4dvfnGG+cb6GkqxxcMfSerTVprLQq1hiVM2VfLOWyODWD4fH
         gqvqON4HhY7iGy6tdxHrmFCgPx+WzCqDXKUgBnFCOFF1QcAaCWaPC0KiFvTWU4dZ3XH1
         NWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387298; x=1781992098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZbBEu1yumZubA+jdFXfLBNW/6vA9c6a3PhaM+0TpSU=;
        b=ZteSnkiSW93kQ5BuaiFcwjZmS7CtZAubE7JAPHz47ji2+1vU7XngONl9pgfAhfT/fj
         890KewlHreyIgwzcR3R+BhD4kQimY9nKUZFaq5kh8hb5mM19WygTIfDa7eDRP3OLRzM9
         3QNcF8Q6Mx0bYwintLbid3O4y1G2DZlaz1PhDzxpag1XctAE82RoULSlcF3Qb4gbL1Db
         Z46L9myxxz0MQ34US3KSB12JJnTQBe29GHi3O7MQmvlf0uUiZjm8M7CvzWQHokIkW2nF
         2TdPV40dl9Esh2/ExzxXlNIm0q8AD5xcJ/lnx2VTHSlxlndXmHtaaMjLUs/d7z3P3c3p
         X3Xw==
X-Gm-Message-State: AOJu0YxKvxr9vZEMcg/ihqX9URZR2iId1OkTINvMX9iqkt5S1kNDY4yx
	ZMjTsDN69gaVFE0ttQ/3LLNAjnAGrej6UBLqm3KGxpI3FCk6eXA1qlOkvsdbksx4HwU=
X-Gm-Gg: Acq92OGDRvg+RUxDWrjcvmJLrGX7xtVXI2nAlQJOWsCTJ0Wr1OmyKoRbqR1DSITJKu3
	hRRcj4StRE94QOwSiX1U/RNPY6Rk4m4bOOMfBoaxYWJ6o+gyVcN+MpXnQWlx2ItAtofrRtlLcpL
	ZzC/JJcFienuy5DsQ1gZwAxPHWXzq5zGj9Nmds4wDf0wqpH3AAL+5/yIhW3nV8Y3f+U3KTTUyH4
	jh7yw37IWQALbp9pIew13xlGBoXOaBSvcPY7slz1sTtdN9HQkpt7gHE2dOWUrkG7YcOWBKtolAF
	+8XQyr5gLdxzzRbycWHsz/R4ZP82+mhnidVtwZbaD5uvBWld+sKWX8rO1OkKshkrpdan2RwgIfP
	YavosMifNKUgi6lz16Om8gA+Rf/aOw33+uzEhEgFVQCiqZB/I2CfwrFbl8cCf4hCU3IB2vPjOO2
	eZt5azxOPv/WaMjU/eLqbr/S27EigWBy/gwIS67i1xL1YzOOVJ3Y6BF7UK1glga9qpECIUu/CrA
	tFchCNhJCXauXfQPzpXiGP0GCP/oDlEfQUB
X-Received: by 2002:a05:600c:8716:b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-490ec4c3582mr93913715e9.11.1781387298380;
        Sat, 13 Jun 2026 14:48:18 -0700 (PDT)
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
Subject: [PATCH v5 11/16] PoC: libs/guest: use foreign copy during migration
Date: Sat, 13 Jun 2026 22:47:44 +0100
Message-ID: <20260613214749.20620-12-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1781387299-D9D77443-5CED8513/0/0
X-purgate-type: clean
X-purgate-size: 8610
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
X-Rspamd-Queue-Id: 897F767FD28

From: Edwin Török <edwin.torok@citrix.com>

ministat confirms the improvement:

```
x baseline
+ foreigncopy
    N           Min           Max        Median           Avg        Stddev
x  20     1.1306997     1.1447931     1.1356569     1.1365742   0.003242175
+  20     0.4311504    0.44180303    0.43616705    0.43600089  0.0031094689
Difference at 95.0% confidence
	-0.700573 +/- 0.00203311
	-61.639% +/- 0.133355%
	(Student's t, pooled s = 0.00317652)
```

The tests pass too, which means that it has correctly migrated all guest
memory.

Frediano: This PoC was adapted to be included in a final series.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_common.h  |  1 +
 tools/libs/guest/xg_sr_restore.c | 43 +++--------------
 tools/libs/guest/xg_sr_save.c    | 82 +++++++++-----------------------
 3 files changed, 31 insertions(+), 95 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index e37f805240..d8d8a0f9f7 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -256,6 +256,7 @@ struct xc_sr_context
             unsigned long nr_deferred_pages;
             xc_hypercall_buffer_t dirty_bitmap_hbuf;
             struct xc_sr_context_save_buffers *buffers;
+            void *dest_buf;
         } save;
 
         struct /* Restore data. */
diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index fb46142d87..ff27560ff7 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -259,8 +259,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     xen_pfn_t *mfns = malloc(count * sizeof(*mfns));
     int *map_errs = malloc(count * sizeof(*map_errs));
     int rc;
-    void *mapping = NULL, *guest_page = NULL;
     unsigned nr_pages;
+    void *const source = page_data;
 
     if ( !mfns || !map_errs )
     {
@@ -295,27 +295,8 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     if ( nr_pages == 0 )
         goto done;
 
-    mapping = guest_page = xenforeignmemory_map(
-        xch->fmem, ctx->domid, PROT_READ | PROT_WRITE,
-        nr_pages, mfns, map_errs);
-    if ( !mapping )
-    {
-        rc = -1;
-        PERROR("Unable to map %u mfns for %u pages of data",
-               nr_pages, count);
-        goto err;
-    }
-
     for ( unsigned i = 0; i < nr_pages; ++i )
     {
-        if ( map_errs[i] )
-        {
-            rc = -1;
-            ERROR("Mapping pfn %#"PRIpfn" (mfn %#"PRIpfn", type %#"PRIx32") failed with %d",
-                  pfns[i], mfns[i], types[i], map_errs[i]);
-            goto err;
-        }
-
         /* Undo page normalisation done by the saver. */
         rc = ctx->restore.ops.localise_page(ctx, types[i], page_data);
         if ( rc )
@@ -325,29 +306,19 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
             goto err;
         }
 
-        if ( ctx->restore.verify )
-        {
-            /* Verify mode - compare incoming data to what we already have. */
-            if ( memcmp(guest_page, page_data, PAGE_SIZE) )
-                ERROR("verify pfn %#"PRIpfn" failed (type %#"PRIx32")",
-                      pfns[i], types[i] >> XEN_DOMCTL_PFINFO_LTAB_SHIFT);
-        }
-        else
-        {
-            /* Regular mode - copy incoming data into place. */
-            memcpy(guest_page, page_data, PAGE_SIZE);
-        }
-
-        guest_page += PAGE_SIZE;
         page_data += PAGE_SIZE;
     }
+    if ( !ctx->restore.verify )
+    {
+        rc = xg_foreignmemory_copy_to(xch, ctx->domid, nr_pages, mfns, source);
+        if ( rc < 0 )
+            goto err;
+    }
 
  done:
     rc = 0;
 
  err:
-    if ( mapping )
-        xenforeignmemory_unmap(xch->fmem, mapping, nr_pages);
 
     free(map_errs);
     free(mfns);
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 8a22267fdf..7a48f6b0a3 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -87,12 +87,10 @@ static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns, *types;
-    void *guest_mapping = NULL;
     void **local_pages;
     int *errors, rc = -1;
-    unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
+    unsigned int i, nr_pages = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
-    void *page, *orig_page;
     uint64_t *rec_pfns;
     struct iovec *iov; int iovcnt = 0;
     struct {
@@ -167,62 +165,18 @@ static int write_batch(struct xc_sr_context *ctx)
 
     iovcnt = 2;
 
-    if ( nr_pages > 0 )
+    rc = xg_foreignmemory_copy_from(xch, ctx->domid, nr_pages, ctx->save.dest_buf, mfns);
+    if ( rc < 0 )
     {
-        guest_mapping = xenforeignmemory_map(
-            xch->fmem, ctx->domid, PROT_READ, nr_pages, mfns, errors);
-        if ( !guest_mapping )
-        {
-            PERROR("Failed to map guest pages");
-            goto err;
-        }
-        nr_pages_mapped = nr_pages;
-
-        for ( i = 0, p = 0; i < nr_pfns; ++i )
-        {
-            if ( !page_type_has_stream_data(types[i]) )
-                continue;
-
-            if ( errors[p] )
-            {
-                ERROR("Mapping of pfn %#"PRIpfn" (mfn %#"PRIpfn") failed %d",
-                      ctx->save.batch_pfns[i], mfns[p], errors[p]);
-                goto err;
-            }
-
-            orig_page = page = guest_mapping + (p * PAGE_SIZE);
-            rc = ctx->save.ops.normalise_page(ctx, types[i], &page);
-
-            if ( orig_page != page )
-                local_pages[i] = page;
-
-            if ( rc )
-            {
-                if ( rc == -1 && errno == EAGAIN )
-                {
-                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
-                    ++ctx->save.nr_deferred_pages;
-                    types[i] = XEN_DOMCTL_PFINFO_XTAB;
-                    --nr_pages;
-                }
-                else
-                    goto err;
-            }
-            else if ( iov[iovcnt - 1].iov_base + iov[iovcnt - 1].iov_len !=
-                      page )
-            {
-                iov[iovcnt].iov_base = page;
-                iov[iovcnt].iov_len = PAGE_SIZE;
-                iovcnt++;
-            }
-            else
-            {
-                iov[iovcnt - 1].iov_len += PAGE_SIZE;
-            }
+        ERROR("xg_foreignmemory_copy_from failed");
+        goto err;
+    }
 
-            rc = -1;
-            ++p;
-        }
+    if ( nr_pages )
+    {
+        iov[iovcnt].iov_base = ctx->save.dest_buf;
+        iov[iovcnt].iov_len = nr_pages << XC_PAGE_SHIFT;
+        iovcnt++;
     }
 
     hdrs.rec.length += nr_pages * PAGE_SIZE;
@@ -239,8 +193,6 @@ static int write_batch(struct xc_sr_context *ctx)
     rc = ctx->save.nr_batch_pfns = 0;
 
  err:
-    if ( guest_mapping )
-        xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
     for ( i = 0; local_pages && i < nr_pfns; ++i )
     {
         free(local_pages[i]);
@@ -765,6 +717,7 @@ static int setup(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
     int rc;
+    const unsigned dest_buf_len = MAX_BATCH_SIZE * XC_PAGE_SIZE;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->save.dirty_bitmap_hbuf);
 
@@ -776,6 +729,16 @@ static int setup(struct xc_sr_context *ctx)
         xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
     ctx->save.deferred_pages = bitmap_alloc(ctx->save.p2m_size);
     ctx->save.buffers = calloc(1, sizeof(*ctx->save.buffers));
+    ctx->save.dest_buf = NULL;
+
+    rc = posix_memalign(&ctx->save.dest_buf, XC_PAGE_SIZE, dest_buf_len);
+    if ( rc )
+    {
+        ERROR("Unable to allocate %u bytes of buffer", dest_buf_len);
+        errno = rc;
+        rc = -1;
+        goto err;
+    }
 
     if ( !dirty_bitmap || !ctx->save.deferred_pages || !ctx->save.buffers)
     {
@@ -810,6 +773,7 @@ static void cleanup(struct xc_sr_context *ctx)
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
     free(ctx->save.buffers);
+    free(ctx->save.dest_buf);
 }
 
 /*
-- 
2.43.0


