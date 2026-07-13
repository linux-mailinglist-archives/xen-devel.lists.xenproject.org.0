Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xB/nKjRPVWqHmgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 22:48:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F2A74F212
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 22:48:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="I/9ZbTyC";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1361930.1613972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjNZW-0005cC-8D; Mon, 13 Jul 2026 20:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361930.1613972; Mon, 13 Jul 2026 20:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjNZW-0005X5-1r; Mon, 13 Jul 2026 20:48:14 +0000
Received: by outflank-mailman (input) for mailman id 1361930;
 Mon, 13 Jul 2026 20:48:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wjNZU-0005Mj-JH
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 20:48:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjNZU-00FW63-04
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 22:48:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a554f02-bab6-0a2a0a5309dd-0a2a4503e5b2-10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 22:48:11 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <freddy77@gmail.com>)
 id 6a554f0b-f2d2-0a2a45030019-d155802cd177-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 22:48:11 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493f60208a5so31038145e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 13:48:11 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49508724786sm23924255e9.3.2026.07.13.13.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 13:48:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783975691; x=1784580491; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qGsmWUifmdUWchWcdJY2/HqBgvlxTOt3fS0Wzpm+gj8=;
        b=I/9ZbTyCXO8ypfQgF8+ZADatNTI80pexwrz9iWsUXvLO2JPWOLzzj0Iw93eDhDdkmn
         iEs336MTe2dbkNUZBGluEK7oZCcsHcujh/ATf7EVRtFnLxbC8uvulKD2rzBn5Nl2Nbal
         CvxiewbhrkH1phcHNPrkZV1oE3SmUav7uZgEXwXfXBod1ockzeOghFQqfx+JWsojbTv9
         qr/P/bwdWlHs6+Sfr+FvtTQLNFs2pjmx5ZUItCRBKvjLsVnppQLr9g/aNvuCBEgKj8Qo
         BQpUk0Jtu+wiWbapVU+zPR1O1TwyWisGXqCjVVXJ9VyWGkoWri9aeOwiAdVegOBtkynE
         gCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783975691; x=1784580491;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qGsmWUifmdUWchWcdJY2/HqBgvlxTOt3fS0Wzpm+gj8=;
        b=oLB4Eg/XbHZEmrEWCD5NOe3qqXpemZeWi8N7JFvhmv19mRTMFVxYnJal2aA2brCt0a
         hTxu2fxXMmGzU3kTCtYdQNn5bSJowCs+wP9oa6imrGgGh/8/xH5IZ+3aLXJlTPUv5794
         v0ttopHPdQ7SSiDeTZcLhe6xOKLuQPEFK7aoXcrCfq5i2Jm/bMx0RaEe7+lzESoNk3Ar
         oxReOR6fXklFmaMasrPNvOHP9xuO+rxspnvFUS44bnB321/LnmTySslN7KoL5aOcu7Zt
         Fsbtvvd0NGPUJm3d4DXYlfOMiF9qqEYNIr6Q/6eSjLseNoSwEa0qsmNOlK+nyaoz9avN
         qWgQ==
X-Gm-Message-State: AOJu0YxvHwALQ71Pi0f9xTNBBqry07Wm1IuA40pGemVQ3nEX+Yjz+vA7
	EB5v57A9JRuheUa7dTy7684X6eHGhcBAhTc8Y02qVJz5UXuK8F9vCfbgOWTHsm5vOX84Wg==
X-Gm-Gg: AfdE7cm4vWMU7obTIxkxbNazKtWJAOP7HDD1xqbMLU8E/0stMUODJVBO5KK2hTZFybh
	Tedrn/xxuOU/t2kqqVYe/4J7tq6QfzQ3zac81TOUtJfcE4pquxCsE1hmtX5flTJfU91UCEWlaWc
	IgbmzVqDFahnLNEA3WEAWxxpBDS8mM2qalTmQ2Kn4pUHQpY1aDLPwxeoKETNMqEKGU6yjQ805y1
	wMVNKwrL0kn7wwvPJTpVJmqJEBfkvHwkZmJvFXhSYZXHVy7MYCdH5wYHekGQjrECDvkyTPEqX+X
	/j70QNvX/yhF7uawQQ3REj+v2rZ8iuTV78AJU8ygf1e53conckIuEKLHYBsjbSf71+pYzPYVGIv
	bjtr6wzs1KdcaUbctsr0/Z7Be2uNfWpOZoF/Uf6M8f0Njh8LeiwMNV1zBDVHb/wr0lRhALRiLTI
	K0ozPGrjlfZoxLL6lO+88BZRm2iERoZXCFRdFhg/O3y3SbWnZD3xFtoeJbF9l7FZEpO5Q0kT55B
	sBqt9XQmTKxt0OyI7k=
X-Received: by 2002:a05:600c:468f:b0:493:df1d:7488 with SMTP id 5b1f17b1804b1-493f87e5b4cmr116516855e9.16.1783975691233;
        Mon, 13 Jul 2026 13:48:11 -0700 (PDT)
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
Subject: [PATCH v9 3/4] libs/guest: allocate various migration arrays just once
Date: Mon, 13 Jul 2026 21:48:01 +0100
Message-ID: <20260713204802.105115-4-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713204802.105115-1-frediano.ziglio@citrix.com>
References: <20260713204802.105115-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1783975691-C0B5DCF4-400B2EB9/0/0
X-purgate-type: clean
X-purgate-size: 4798
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 04F2A74F212

From: Edwin Török <edwin.torok@citrix.com>

Allocate these array just once at the start of migration,
using the maximum batch size, and free them at the end.

Signed-off-by: Edwin Török <edwin.torok@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v2:
- change prefix in subject.

Changes since v3:
- fix comment style

Changes since v4:
- change order of fields in structure.

Changes since v6:
- split preparation commit.

Changes since v8:
- remove useless memset;
- initialize variables while declaring them.
---
 tools/libs/guest/xg_sr_common.h |  6 +++++
 tools/libs/guest/xg_sr_save.c   | 45 ++++++++++++---------------------
 2 files changed, 22 insertions(+), 29 deletions(-)

diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
index 7574c9f5b6..c07c6db59e 100644
--- a/tools/libs/guest/xg_sr_common.h
+++ b/tools/libs/guest/xg_sr_common.h
@@ -246,6 +246,12 @@ struct xc_sr_context
             struct xc_sr_context_save_buffers
             {
                 xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
+                xen_pfn_t mfns[MAX_BATCH_SIZE];
+                xen_pfn_t types[MAX_BATCH_SIZE];
+                void *local_pages[MAX_BATCH_SIZE];
+                struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
+                uint64_t rec_pfns[MAX_BATCH_SIZE];
+                int errors[MAX_BATCH_SIZE];
             } *buffers;
         } save;
 
diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 22348db445..6a77e33a47 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -86,15 +86,12 @@ static int write_checkpoint_record(struct xc_sr_context *ctx)
 static int write_batch(struct xc_sr_context *ctx)
 {
     xc_interface *xch = ctx->xch;
-    xen_pfn_t *mfns = NULL, *types = NULL;
     void *guest_mapping = NULL;
-    void **local_pages = NULL;
-    int *errors = NULL, rc = -1;
+    int rc = -1;
     unsigned int i, p, nr_pages = 0, nr_pages_mapped = 0;
     unsigned int nr_pfns = ctx->save.nr_batch_pfns;
     void *page, *orig_page;
-    uint64_t *rec_pfns = NULL;
-    struct iovec *iov = NULL; int iovcnt = 0;
+    int iovcnt = 0;
     xen_pfn_t *const batch_pfns = ctx->save.buffers->batch_pfns;
     struct {
         struct xc_sr_rhdr rec;
@@ -110,28 +107,21 @@ static int write_batch(struct xc_sr_context *ctx)
         },
     };
 
-    assert(nr_pfns != 0);
-    assert(nr_pfns <= MAX_BATCH_SIZE);
-
     /* Mfns of the batch pfns. */
-    mfns = malloc(nr_pfns * sizeof(*mfns));
+    xen_pfn_t *const mfns = ctx->save.buffers->mfns;
     /* Types of the batch pfns. */
-    types = malloc(nr_pfns * sizeof(*types));
+    xen_pfn_t *const types = ctx->save.buffers->types;
     /* Errors from attempting to map the gfns. */
-    errors = malloc(nr_pfns * sizeof(*errors));
+    int *const errors = ctx->save.buffers->errors;
     /* Pointers to locally allocated pages.  Need freeing. */
-    local_pages = calloc(nr_pfns, sizeof(*local_pages));
+    void **const local_pages = ctx->save.buffers->local_pages;
     /* iovec[] for writev(). */
-    iov = malloc((nr_pfns + 2) * sizeof(*iov));
+    struct iovec *const iov = ctx->save.buffers->iov;
     /* page_data record PFNs list */
-    rec_pfns = malloc(nr_pfns * sizeof(*rec_pfns));
+    uint64_t *const rec_pfns = ctx->save.buffers->rec_pfns;
 
-    if ( !mfns || !types || !errors || !local_pages || !iov || !rec_pfns )
-    {
-        ERROR("Unable to allocate arrays for a batch of %u pages",
-              nr_pfns);
-        goto err;
-    }
+    assert(nr_pfns != 0);
+    assert(nr_pfns <= MAX_BATCH_SIZE);
 
     iov[0].iov_base = &hdrs;
     iov[0].iov_len = sizeof(hdrs);
@@ -249,14 +239,11 @@ static int write_batch(struct xc_sr_context *ctx)
  err:
     if ( guest_mapping )
         xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapped);
-    for ( i = 0; local_pages && i < nr_pfns; ++i )
+    for ( i = 0; i < nr_pfns; ++i )
+    {
         free(local_pages[i]);
-    free(rec_pfns);
-    free(iov);
-    free(local_pages);
-    free(errors);
-    free(types);
-    free(mfns);
+        local_pages[i] = NULL;
+    }
 
     return rc;
 }
@@ -790,8 +777,8 @@ static int setup(struct xc_sr_context *ctx)
 
     if ( !ctx->save.buffers || !dirty_bitmap || !ctx->save.deferred_pages )
     {
-        ERROR("Unable to allocate memory for dirty bitmaps, batch pfns and"
-              " deferred pages");
+        ERROR("Unable to allocate memory for dirty bitmaps, deferred pages"
+              " and various batch buffers");
         rc = -1;
         errno = ENOMEM;
         goto err;
-- 
2.43.0


