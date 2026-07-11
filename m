Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5QHnNgu0Umr0SQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2026 23:22:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87769742EDE
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jul 2026 23:22:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=e8mt0cYJ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1360643.1613401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wif8n-0007w3-4L; Sat, 11 Jul 2026 21:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1360643.1613401; Sat, 11 Jul 2026 21:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wif8n-0007uQ-0v; Sat, 11 Jul 2026 21:21:41 +0000
Received: by outflank-mailman (input) for mailman id 1360643;
 Sat, 11 Jul 2026 21:21:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wif8l-0007bl-4N
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 21:21:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wif8k-00AIiB-HP
 for xen-devel@lists.xenproject.org; Sat, 11 Jul 2026 23:21:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a52b3e2-e002-0a2a0a5209dd-0a2a4509cca6-0
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 23:21:38 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <freddy77@gmail.com>)
 id 6a52b3e2-b440-0a2a45090019-d155dd34a4d7-3
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 23:21:38 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso1326947f8f.0
 for <xen-devel@lists.xenproject.org>; Sat, 11 Jul 2026 14:21:38 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d8cdsm74809460f8f.1.2026.07.11.14.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 14:21:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783804898; x=1784409698; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLlv2l5waNuak4AeyH2dZJf/IpZoXiiZH4C/lX/O+/Y=;
        b=e8mt0cYJlp5mqJLBR1UcyjmHZxykk3FdZX6EKcYvwukASf1kHtAzwR6+88qwbILcyX
         YtydG7MB6TgV4gA2hgwgBjN1s3uGcWVQdWLgeBJR9SKgn+Dg6OtUeSrcwfZFZUbbTjaN
         LCyo7HCrcxu070sNbkHRdBNey4e+Fj4pYk8S337eCwuG3JCfL19MTImqtEa57IRYIP+t
         oVq4RlwWSc2byMPoDyuPzERCwqOh86yOjQtczYmjG6vC+SY7dIKXyKalAfXGdRfimijY
         5Q3XlULo42rWFP3qy7O9JRn4KWuIFwf24YluZeuGYu3TM7KLoyvRUVOfUqaNQ4uQkfvq
         hGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783804898; x=1784409698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLlv2l5waNuak4AeyH2dZJf/IpZoXiiZH4C/lX/O+/Y=;
        b=Ds1IJWl1QeX11XzxldnxndzXCUzQamyAmYoasp6Ukx3kPonu1Fk4e+0bJAwK56GRPB
         QQJ5FDRdpBW8NzFCYtEEwvjGUEUeVPGVZ0Gr/7sUkYv+ulpoLs4rc6sZxWdplo/2lLca
         yqj8o83iPnq7UZZVgYAbR3C0pRgmYwn2kIMYM+R7l5CJyfl/eTLd4GCx0aHHIlpSZmmf
         rniwTNtKQeXuUEAKDRQpFEigijqYlfjNk/kXOsad6FA9PCs0jqOX10mvpt28FcCddna7
         ptK1V3X1gQiyV1f5cH0fmq4n5rJzjIfr1pNc2H0wAs4jd9YPI88ZwyKBBHhvDfXsEQ3q
         k6Ug==
X-Gm-Message-State: AOJu0YxYs+2uHJzIKOokwZpunnHVJl02lLvtDHvQ9fg/l8xCKCqIgYXu
	kWcP5JbOLgqD5q8jF3LPq+Bx7A2QTzkKeWueOhRgqNzLmyD0gCRT3DlqBmEemRhkMWE=
X-Gm-Gg: AfdE7cke8Wk9Dh9t8kfbGiQZlzefS+vB/1QVXUA5GazTitzAZwZsOJzq5E7vlk6zNVd
	xeumYrTKjFCqhFdmJc8b5A3qXKAgG11vqEJbCiNUGbWTusuH+JgT+gMYGGxoIZIr1kch9bkCUMe
	yhFThsTxyJJW0Kl2XFM0Go/DC7okMIxzJ2xaY/pX0P/mZfmcglkJQl+406Nz0y/Dj3l6Oq7xv6R
	+5mR6QGJ4blT15lcS/JiIGTVvGFegmxBpm+wLa1Q5JPcNc0xDH4SrjAWDJB6gPGe1V/8RtF///K
	yQ5k/uxPivSU0fKU4YZNI7G1cjeFkuF8CLvJHtWqukJPpVctHepkYtNzLX0lIz9xD0BsWEy9x/x
	awDtUOut0Gnm3wXgWifynxPil52U7q9qG766sPrwow0nGWW1kF1gZrpQVBH5/0JOpSVu6GnWzXN
	cXXptzfWbmt9mzxuFzp16TMxYXjU32dpsw55Retsm3na5ftwfJz7Z5TrX/je+4rKGQyGRULmOah
	qiKxX5P0hGvE90LgHUneH1IZKTneA==
X-Received: by 2002:adf:e19a:0:b0:47e:96f2:52ab with SMTP id ffacd0b85a97d-47f2dc85da3mr4414795f8f.7.1783804897779;
        Sat, 11 Jul 2026 14:21:37 -0700 (PDT)
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
Subject: [PATCH v8 2/4] libs/guest: move batch_pfns into a separate structure
Date: Sat, 11 Jul 2026 22:21:26 +0100
Message-ID: <20260711212128.505727-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711212128.505727-1-frediano.ziglio@citrix.com>
References: <20260711212128.505727-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1783804898-5E56BA0B-A32ED01D/0/0
X-purgate-type: clean
X-purgate-size: 5971
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87769742EDE

Prepare for following change.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v6:
- split from "libs/guest: allocate various migration arrays just once".

Changes since v7:
- initialize "batch_pfns" on declaration.
---
 tools/libs/guest/xg_sr_common.h |  5 ++++-
 tools/libs/guest/xg_sr_save.c   | 29 +++++++++++++++--------------
 2 files changed, 19 insertions(+), 15 deletions(-)

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
index 84fdbe4140..e7c22e6500 100644
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
@@ -110,6 +111,8 @@ static int write_batch(struct xc_sr_context *ctx)
     };
 
     assert(nr_pfns != 0);
+    assert(nr_pfns <= MAX_BATCH_SIZE);
+    assert(ctx->save.buffers);
 
     /* Mfns of the batch pfns. */
     mfns = malloc(nr_pfns * sizeof(*mfns));
@@ -141,13 +144,12 @@ static int write_batch(struct xc_sr_context *ctx)
 
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
@@ -193,7 +195,7 @@ static int write_batch(struct xc_sr_context *ctx)
             if ( errors[p] )
             {
                 ERROR("Mapping of pfn %#"PRIpfn" (mfn %#"PRIpfn") failed %d",
-                      ctx->save.batch_pfns[i], mfns[p], errors[p]);
+                      batch_pfns[i], mfns[p], errors[p]);
                 goto err;
             }
 
@@ -207,7 +209,7 @@ static int write_batch(struct xc_sr_context *ctx)
             {
                 if ( rc == -1 && errno == EAGAIN )
                 {
-                    set_bit(ctx->save.batch_pfns[i], ctx->save.deferred_pages);
+                    set_bit(batch_pfns[i], ctx->save.deferred_pages);
                     ++ctx->save.nr_deferred_pages;
                     types[i] = XEN_DOMCTL_PFINFO_XTAB;
                     --nr_pages;
@@ -235,7 +237,7 @@ static int write_batch(struct xc_sr_context *ctx)
     hdrs.rec.length += nr_pages * PAGE_SIZE;
 
     for ( i = 0; i < nr_pfns; ++i )
-        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
+        rec_pfns[i] = ((uint64_t)(types[i]) << 32) | batch_pfns[i];
 
     if ( writev_exact(ctx->fd, iov, iovcnt) )
     {
@@ -274,9 +276,9 @@ static int flush_batch(struct xc_sr_context *ctx)
 
     if ( !rc )
     {
-        VALGRIND_MAKE_MEM_UNDEFINED(ctx->save.batch_pfns,
+        VALGRIND_MAKE_MEM_UNDEFINED(ctx->save.buffers->batch_pfns,
                                     MAX_BATCH_SIZE *
-                                    sizeof(*ctx->save.batch_pfns));
+                                    sizeof(*ctx->save.buffers->batch_pfns));
     }
 
     return rc;
@@ -293,7 +295,7 @@ static int add_to_batch(struct xc_sr_context *ctx, xen_pfn_t pfn)
         rc = flush_batch(ctx);
 
     if ( rc == 0 )
-        ctx->save.batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
+        ctx->save.buffers->batch_pfns[ctx->save.nr_batch_pfns++] = pfn;
 
     return rc;
 }
@@ -784,11 +786,10 @@ static int setup(struct xc_sr_context *ctx)
 
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
@@ -819,7 +820,7 @@ static void cleanup(struct xc_sr_context *ctx)
     xc_hypercall_buffer_free_pages(xch, dirty_bitmap,
                                    NRPAGES(bitmap_size(ctx->save.p2m_size)));
     free(ctx->save.deferred_pages);
-    free(ctx->save.batch_pfns);
+    free(ctx->save.buffers);
 }
 
 /*
-- 
2.43.0


