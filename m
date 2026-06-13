Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iBIUCEPQLWr5kQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F8567FD45
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VgZ3Kp2B;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1337559.1598893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDD-0002xc-1v; Sat, 13 Jun 2026 21:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337559.1598893; Sat, 13 Jun 2026 21:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDC-0002vV-To; Sat, 13 Jun 2026 21:48:18 +0000
Received: by outflank-mailman (input) for mailman id 1337559;
 Sat, 13 Jun 2026 21:48:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWDB-0002Zz-Iv
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWDA-008PGn-Vy
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd008-5cb7-0a2a0a5109dd-0a2a4503cafc-14
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:16 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd020-672d-0a2a45030019-d1558033c11e-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:16 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49222b6e871so6073465e9.3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:16 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387296; x=1781992096; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlYBrPHimuR3p/Sg0YcSFuof0r06EXv6/scdT04tUH0=;
        b=VgZ3Kp2B3lPAfjILM8ZA1bRzi6dd2UYOp76SRqMyJxComo4gfbb2Gt6i/LH67tbGW2
         XF9gvojQ9a0XH0D6N2i8Wfrhfz2DrwGXgeqfCcosnZVldWuusGOOzu3SKQLqSRpxA6EA
         KjAV1W/EokYl/5sBOltvzFc6keeL1wqpuXaYD4c5/5MiEXLRtVg84n5edMf0lXHQ+Wki
         2LiO1o3nipj4Qo8EkhQQ+25Si07A6Q5E/iLYFSzBP6OLfIUmafclth4WLr+ETWragyPW
         52+dC0Vxxt1mIiXvlJ0V7fSzE5jITPjHYN9nxqW+WGXsipBWXOLlfvecI/vxD6DSB71H
         lGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387296; x=1781992096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MlYBrPHimuR3p/Sg0YcSFuof0r06EXv6/scdT04tUH0=;
        b=AKxtZUnhBX9L/3TZXdj92TZcU91ExP4R2v0EwdEzsVcNCuwgD7c/ookMNL43w3tJgu
         SOtWCiIoSU7fZxkQ9jq8ujQNou37Ur3MU2vWcagITSI8uphlDOjxjwJGHVBE6fRh6w+B
         kfG/GmBpLqZHxl6NNmdN89tjlCxoLTLyEDjiUrDhnyJCHYapI+r7M2HjK9R5Ub/LlpB+
         am5RYkLOQgnhhqhIDm2XDyjJYxFNyA2D6cdZj8iLvU5r0Q4g0TLX9Bq6Ja/KJ16Qdv+k
         CSYUE54LacQ4EwAsfvY4zfYp9a+0GBiGydGcyVIx1bOnns2CL6xX4UCQdnW4IqVOayF+
         odMw==
X-Gm-Message-State: AOJu0YyluiBuILgMkZu341EvvGJHa8m7ZBNyg0t+oYzd8OZNfQwegQ/X
	qDjD9NPMbMeuo3g8XQRBn96qsqUib75VzksmUzJtXCbyx6EngSRT4HoMJbeEGCFsSKs=
X-Gm-Gg: Acq92OFqWxBg4A2SDj6wv5nKhhWpCxLmqdrUwllkiL2RjBwnj3oK6XiRiQ6WtsLegV3
	2542kUtUy9sYLE4c2g90NgYDCIBVOYgg52hPW/wp8ST/DimaKtHe0MXsQu7PAG1eH5eP61g3xV2
	+ObAV1QoJWIHSzkMPGsBA6q8d2F+6yFeJcvRWYCCQWx6K1zTc3x+2RXJeqxksbhH8+ErJ6qdylp
	Vv5JsYiIR/ziHyoItO79dhdTP1LPWwKwyn0yc2+jEMUJa60zuNSSWO7zWqF/eByXxaxxRKjQYMx
	s9aPXSqIu0QGDoKWXYmQ1Xc/5LubYGF7dce7FRUitTjW5n6Lr8PEq6gDBcKD1rcTppdu0GBVH1V
	/uyYGWfIaaqupQ9YGHLZMDimQA+W2JzlYbwb/J99tr0XP9F9daRLTG7P9ksPyyVozmjM94CDrPA
	E5pBy5UTv1G+MglPM/1Ugje5a1OAhJuS8X1VXdh9XLfJZeMG6WULVtR+/6zq9lUe9AeHpd4bZ+9
	eyRpaF61+oD2STDR7D2V1PyJGqaYsrsIAPo
X-Received: by 2002:a05:600c:4685:b0:490:bad8:329c with SMTP id 5b1f17b1804b1-490ec4d4f64mr121404065e9.12.1781387296170;
        Sat, 13 Jun 2026 14:48:16 -0700 (PDT)
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
Subject: [PATCH v5 08/16] libs/guest: fill directly iov structure
Date: Sat, 13 Jun 2026 22:47:41 +0100
Message-ID: <20260613214749.20620-9-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1781387296-3A378938-1D97C0B6/0/0
X-purgate-type: clean
X-purgate-size: 4598
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:mid,citrix.com:email];
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
X-Rspamd-Queue-Id: B8F8567FD45

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Instead of storing page pointers into an array and lately adding to
iov vector add the pages directly to iov to avoid "guest_data"
array.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_common.h |  1 -
 tools/libs/guest/xg_sr_save.c   | 64 ++++++++++++---------------------
 2 files changed, 23 insertions(+), 42 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 95b0564e5c..b2c441b644 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -214,7 +214,6 @@ struct xc_sr_context_save_buffers
     xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
     xen_pfn_t mfns[MAX_BATCH_SIZE];
     xen_pfn_t types[MAX_BATCH_SIZE];
-    void *guest_data[MAX_BATCH_SIZE];
     void *local_pages[MAX_BATCH_SIZE];
     struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
     uint64_t rec_pfns[MAX_BATCH_SIZE];
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 4988d8040b..8a22267fdf 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -88,7 +88,6 @@ static int write_batch(struct xc_sr_context *ctx)
     xc_interface *xch = ctx->xch;
     xen_pfn_t *mfns, *types;
     void *guest_mapping = NULL;
-    void **guest_data;
     void **local_pages;
     int *errors, rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
@@ -113,9 +112,6 @@ static int write_batch(struct xc_sr_context *ctx)
     types = ctx->save.buffers->types;
     /* Errors from attempting to map the gfns. */
     errors = ctx->save.buffers->errors;
-    /* Pointers to page data to send.  Mapped gfns or local allocations. */
-    guest_data = ctx->save.buffers->guest_data;
-    memset(guest_data, 0, sizeof(*guest_data) * nr_pfns);
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = ctx->save.buffers->local_pages;
     memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
@@ -158,6 +154,19 @@ static int write_batch(struct xc_sr_context *ctx)
         mfns[nr_pages++] = mfns[i];
     }
 
+    hdrs.rec.length = sizeof(hdrs.page_data);
+    hdrs.rec.length += nr_pfns * sizeof(*rec_pfns);
+
+    hdrs.page_data.count = nr_pfns;
+
+    iov[0].iov_base = &hdrs;
+    iov[0].iov_len = sizeof(hdrs);
+
+    iov[1].iov_base = rec_pfns;
+    iov[1].iov_len = nr_pfns * sizeof(*rec_pfns);
+
+    iovcnt = 2;
+
     if ( nr_pages > 0 )
     {
         guest_mapping = xenforeignmemory_map(
@@ -199,61 +208,34 @@ static int write_batch(struct xc_sr_context *ctx)
                 else
                     goto err;
             }
+            else if ( iov[iovcnt - 1].iov_base + iov[iovcnt - 1].iov_len !=
+                      page )
+            {
+                iov[iovcnt].iov_base = page;
+                iov[iovcnt].iov_len = PAGE_SIZE;
+                iovcnt++;
+            }
             else
-                guest_data[i] = page;
+            {
+                iov[iovcnt - 1].iov_len += PAGE_SIZE;
+            }
 
             rc = -1;
             ++p;
         }
     }
 
-    hdrs.rec.length = sizeof(hdrs.page_data);
-    hdrs.rec.length += nr_pfns * sizeof(*rec_pfns);
     hdrs.rec.length += nr_pages * PAGE_SIZE;
 
-    hdrs.page_data.count = nr_pfns;
-
     for ( i = 0; i < nr_pfns; ++i )
         rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
 
-    iov[0].iov_base = &hdrs;
-    iov[0].iov_len = sizeof(hdrs);
-
-    iov[1].iov_base = rec_pfns;
-    iov[1].iov_len = nr_pfns * sizeof(*rec_pfns);
-
-    iovcnt = 2;
-
-    if ( nr_pages )
-    {
-        for ( i = 0; i < nr_pfns; ++i )
-        {
-            if ( !guest_data[i] )
-                continue;
-
-            if ( iov[iovcnt - 1].iov_base + iov[iovcnt - 1].iov_len !=
-                 guest_data[i] )
-            {
-                iov[iovcnt].iov_base = guest_data[i];
-                iov[iovcnt].iov_len = PAGE_SIZE;
-                iovcnt++;
-            }
-            else
-            {
-                iov[iovcnt - 1].iov_len += PAGE_SIZE;
-            }
-            --nr_pages;
-        }
-    }
-
     if ( writev_exact(ctx->fd, iov, iovcnt) )
     {
         PERROR("Failed to write page data to stream");
         goto err;
     }
 
-    /* Sanity check we have sent all the pages we expected to. */
-    assert(nr_pages == 0);
     rc = ctx->save.nr_batch_pfns = 0;
 
  err:
-- 
2.43.0


