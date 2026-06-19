Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bTqLKLQ+NWqNpwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529656A5F48
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=M+9bZ9dF;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342219.1602536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYua-00047i-Av; Fri, 19 Jun 2026 13:05:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342219.1602536; Fri, 19 Jun 2026 13:05:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuZ-0003vZ-OB; Fri, 19 Jun 2026 13:05:31 +0000
Received: by outflank-mailman (input) for mailman id 1342219;
 Fri, 19 Jun 2026 13:05:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuX-0003ba-Lv
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuX-002qp2-2J
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:29 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e87-5cb7-0a2a0a5109dd-0a2a450a86f4-30
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:29 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e98-93a5-0a2a450a0019-d155802ba851-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:29 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-490b8ac62baso30807175e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:28 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874328; x=1782479128; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Ff5kZpJnZoWVUEHvo6/yv/R6ViOZwYTEyBjzyp1uSE=;
        b=M+9bZ9dFnC/aotkPpIaQ1S4sdXPxRunS+rfJMaTzmKItzK5xrOLCnYMsGSqOW+KTYj
         A1fdLytdOpDoHnxgQeAVZl4R5gA4VxZDNul5cy427tiol9CxMViIOM/5GUL2q+q2Sf/d
         Mn6f766VoL2/kFy3ZuqzbPQUlAnBM8ltNrq/6oDs09ZlwIw8VaczrS5Zpy5FUPrio4AG
         tX0Wa7ksOmHIWZD+R2QzK9OwLRvj3fzhoHJ31vKm/vUfToifVJhU40sIIs5V8LtuoCYk
         k5Kqtq2Y7bHxeOko0zk4TT3tSLzLSZgtnX5/oyLYSi0iKwMz1IrmX1jRDcOrbB9RUIvO
         /ztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874328; x=1782479128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Ff5kZpJnZoWVUEHvo6/yv/R6ViOZwYTEyBjzyp1uSE=;
        b=c/HCH3tOTBmAkMX1RDhjG0QLf1QWGiubreidA279+uvkk/o3mZkoO6D78tMJkFC7Ve
         PjUiYzD9a9/H+x+MurItNNHrdsW8tsZklH83wFtADnASWiBp2yNDRxllDl8dlEZxLSTt
         sBfkXA1pEwayJnt+9y5XrVYJVReMr8L3Hp4tIGXOYKuJ8y029dqaLLZ+Mj14OZDFwHaH
         ZH2L4P/R+HsvOSbzDNnEjSeuonTJccJnZLrXAyMNChUT6LZGs6ZkmmKaglCkZoWdcFnZ
         wUJopPxBtM3Q3DJ9jM22A9Bek6CpTnlaWH9K2Jo92yOwIE8ufKpUhxmb45y9e5YbmsG3
         1rMA==
X-Gm-Message-State: AOJu0YzLHHFwcFmxOiReVO2ajGVG3YguudPNVrg8OV6fF6mjes1IdXsO
	rLjYEPqDZCmBRJG0ygP2dIaLEs8GaDB76M7sMtd5LFhEcgrJdZFiyjiEEPLVnfQFjHg=
X-Gm-Gg: AfdE7clI5yvliIWvvP8MWzSYUaQfS/yvt2ViiH1T/zi32YUnGHUkcjSqgm9O6H8uTgJ
	+Cp42ePA6+tHIv8RPr7LD8oM4Z2B5zughRSZTCTL0XP0XFWzCyOvGWJGkN2ACDL5lhvfrHwZAdZ
	zYyw0KShAZKnMPp9bkHB2I7CzFxU53ayrLI5TylxZNKLvfOKS3JRnqrKqls42k/48sY8dxqPBAl
	MCBVo+pBPIEGocVdzxbz8KRIIQvanhpJ7+w0tu6630ygm74ovzDzMvaw6OU4zpsRkAhayhHQYs1
	pDeAKl3bFaaoowpk3bGC5JcYnE8QP6JXdNA0XU2cEQxvs0r8TnFCD0Xl8vk4UfNHgXcXZymGJCV
	004rd3vG2sPzQ0HNQXqjeNawP2inCMC7DRi2MI1pRbGtAGIDgQURXjGmj0rU+W5yeiUaQHkhr14
	YVuQ1+BOCzXigz4I9hzm2S0qLMJyY5VOhnNofenOeWnzhPp0sR6sXY3h89IkD1OO27N9ToDvztb
	hAe6DRn
X-Received: by 2002:a05:600c:42d3:b0:48e:8eb0:4957 with SMTP id 5b1f17b1804b1-49240a00dacmr34007335e9.2.1781874328194;
        Fri, 19 Jun 2026 06:05:28 -0700 (PDT)
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
Subject: [PATCH v6 15/16] libs/guest: finalize PoC
Date: Fri, 19 Jun 2026 14:05:00 +0100
Message-ID: <20260619130501.272832-16-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1781874329-B05F8DB8-08FF7610/0/0
X-purgate-type: clean
X-purgate-size: 10539
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email];
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
X-Rspamd-Queue-Id: 529656A5F48

Remove now unused map_errs array.
Test and restore verification code.
Report correctly errors from writev_exact.
Allocate verification buffer using hypercall buffer to avoid errors
using hypercall.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_common.h  |  4 +-
 tools/libs/guest/xg_sr_restore.c | 45 +++++++++++++++--
 tools/libs/guest/xg_sr_save.c    | 83 +++++++++++++++++++++-----------
 3 files changed, 98 insertions(+), 34 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index d8d8a0f9f7..cd562f028a 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -217,7 +217,6 @@ struct xc_sr_context_save_buffers
     void *local_pages[MAX_BATCH_SIZE];
     struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
     uint64_t rec_pfns[MAX_BATCH_SIZE];
-    int errors[MAX_BATCH_SIZE];
 };
 
 struct xc_sr_context
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
index ff27560ff7..b2df36c6f6 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -257,16 +257,15 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
 {
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns = malloc(count * sizeof(*mfns));
-    int *map_errs = malloc(count * sizeof(*map_errs));
     int rc;
     unsigned nr_pages;
     void *const source = page_data;
 
-    if ( !mfns || !map_errs )
+    if ( !mfns )
     {
         rc = -1;
         ERROR("Failed to allocate %zu bytes to process page data",
-              count * (sizeof(*mfns) + sizeof(*map_errs)));
+              count * sizeof(*mfns));
         goto err;
     }
 
@@ -314,13 +313,33 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
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
@@ -710,6 +729,18 @@ static int setup(struct xc_sr_context *ctx)
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
@@ -758,6 +789,8 @@ static void cleanup(struct xc_sr_context *ctx)
     unsigned int i;
     DECLARE_HYPERCALL_BUFFER_SHADOW(unsigned long, dirty_bitmap,
                                     &ctx->restore.dirty_bitmap_hbuf);
+    DECLARE_HYPERCALL_BUFFER_SHADOW(uint8_t, verify_buf,
+                                    &ctx->restore.verify_buf);
 
     for ( i = 0; i < ctx->restore.buffered_rec_num; i++ )
         free(ctx->restore.buffered_records[i].data);
@@ -766,6 +799,8 @@ static void cleanup(struct xc_sr_context *ctx)
         xc_hypercall_buffer_free_pages(
             xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->restore.p2m_size)));
 
+    xc_hypercall_buffer_free_pages(xch, verify_buf, MAX_BATCH_SIZE);
+
     free(ctx->restore.buffered_records);
     free(ctx->restore.populated_pfns);
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 7a48f6b0a3..f6ada3152d 100644
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
@@ -108,8 +108,6 @@ static int write_batch(struct xc_sr_context *ctx)
     mfns = ctx->save.buffers->mfns;
     /* Types of the batch pfns. */
     types = ctx->save.buffers->types;
-    /* Errors from attempting to map the gfns. */
-    errors = ctx->save.buffers->errors;
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = ctx->save.buffers->local_pages;
     memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
@@ -165,18 +163,54 @@ static int write_batch(struct xc_sr_context *ctx)
 
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
@@ -187,6 +221,7 @@ static int write_batch(struct xc_sr_context *ctx)
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
2.43.0


