Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HPbLnFA72le/AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598184714F7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294778.1571489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbK-0005zB-PS; Mon, 27 Apr 2026 10:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294778.1571489; Mon, 27 Apr 2026 10:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbK-0005x7-L2; Mon, 27 Apr 2026 10:54:06 +0000
Received: by outflank-mailman (input) for mailman id 1294778;
 Mon, 27 Apr 2026 10:54:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wHJbJ-0005sG-28
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 10:54:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHJbI-00FJ4k-FM
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 12:54:04 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef4034-2eae-0a2a0a5409dd-0a2a4504918c-46
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:04 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef404c-1dec-0a2a45040019-d155802dd452-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:04 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so92918585e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 03:54:04 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5c4b9e8dsm116133355e9.7.2026.04.27.03.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 03:54:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777287244; x=1777892044; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5ou0MaWeF1QaqgGjfxneV8ESfLfmJPSRFjrAyNPQHE=;
        b=IeEE8Pr3Xk3o/Aca+3DeBcJAuoa4/UJRsw+hETocJYULKwT5EH5uCUhgcf7XYIF/rk
         06OlGSusuJ3gv4eeQJzfUaCR8vqra+3Yt4GDHgvS3A1cSaaK4b5D8hAtjmEOj2josjsI
         VDemOfwPZ3YJ3KaNEY6Csiv0ls3tJGhZPlm3TEdLIj/lQJQucaazFOLUkmL6cjhki+Qi
         r01DFfchQeFcGdsS2iTqMb2oY+X2z0dBIftEaIkVrxBpFgcpJz2AFpOwcrO7Ij9PA2pW
         Cn94CroDBx76kenrGWHXIe1WL4T7zqJ3NX/7UMqhcydAU6ZoGLEBW+qRO8+Z6IYeuLHx
         QWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287244; x=1777892044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A5ou0MaWeF1QaqgGjfxneV8ESfLfmJPSRFjrAyNPQHE=;
        b=apbm9Wa5dFyno7UZtxk8ttgLuH67MJzNJE2irTf4klLpuOWQiRQ948gD2XLzrog1/z
         iEnYWdd2+ZiIqmIw25/xLXGZj+xL1Cu8kncsv+Z6DlESwYUDp2EzHdTtzaOI54j6fhCg
         1tbetqTFoN6WuOJlgZFHW1rBqX0Su4kzr6OgfCqZpe455CWZoriLwt8lQAJh10NpnJW0
         yxIYn0jNxhu2mviWLEhTprc/Tdpt4hsaMi17rN41BZn/dJrV48xeYqKy8tYLKZ4sjYUv
         Z/niJU04dkSwaIA4UVAl59lfcxoacSdPqIJpcvbfL3+8pO+f8ZQhavdTakYb9mpKg182
         iZbA==
X-Gm-Message-State: AOJu0Yxe49nnvK9hIyMNMQ1xHceCvoD+MmGArQeTgGthJ3j5zI7OJ010
	4VoqaWjAwRyXVYxhGAbfN7dmDCnirWSMk+3eYtcDM0oGFNR+gJWNFz99uNURe8A8
X-Gm-Gg: AeBDies3GIORC4W/kxz9WWFbafpNZIQNbjrlKK0rMfPnRAsNC2DytECcX6YOILbbO8X
	ZVkKBROkVlvBCGBpnExqeBi9HVuAE46ndqxRydb7vScHLFHF2M0ESJiwfEu5FXFbpj42oMKSIgl
	ZHTfHqc6Y+S6PEwF1kD0E+M5S9CJkeMrOZoCXQ+4fb0IX30KW5ck+5uX9F5D2qrRVk04vkU3EQ0
	lHfN3VR43iPvBBwXm01omuLz/IU1tuaPaxPhDF2/Hv62cJCBDANgVQXLDKS4iADFfuTqnq/qIWA
	XWQn7ajjydBkj0ITYXup0hC46irPhvtfdQQ27Qo3u9vHdBzjZ3P4tiSgOeZIfAxIsa0I6sD0GIF
	lB76QxG56vUnQHcl18bsx7NqKubu+ZKXwENPGSCL+Z3V9Iawjt6spEf1EN2juSvEoBIcYko4imw
	6Khy3TLj9tNwaWOjy1xFjzilsLyDP9ym/jvPaDjTT3w/DUuq5Vg96G7Jn2eYgMOcKZRImi+dAFq
	d6U
X-Received: by 2002:a05:600c:46cb:b0:488:a723:ea53 with SMTP id 5b1f17b1804b1-488fb744fbemr610461055e9.7.1777287243489;
        Mon, 27 Apr 2026 03:54:03 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 2/7] xenguest: Reduce number of I/O vectors in write_batch
Date: Mon, 27 Apr 2026 11:53:27 +0100
Message-ID: <20260427105338.99792-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427105338.99792-1-frediano.ziglio@cloud.com>
References: <20260427105338.99792-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1777287244-32E743FF-D0655396/0/0
X-purgate-type: clean
X-purgate-size: 2573
X-Rspamd-Queue-Id: 598184714F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Small optimization.
Reduce number of pieces passed to writev.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_save.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 3b2c5222e429..1700d819051a 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -97,9 +97,12 @@ static int write_batch(struct xc_sr_context *ctx)
     void *page, *orig_page;
     uint64_t *rec_pfns = NULL;
     struct iovec *iov = NULL; int iovcnt = 0;
-    struct xc_sr_rec_page_data_header hdr = { 0 };
-    struct xc_sr_record rec = {
-        .type = REC_TYPE_PAGE_DATA,
+    struct {
+        struct xc_sr_rhdr rec;
+        struct xc_sr_rec_page_data_header page_data;
+    } hdrs = {
+        { .type = REC_TYPE_PAGE_DATA },
+        { 0 },
     };
 
     assert(nr_pfns != 0);
@@ -115,7 +118,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
     /* iovec[] for writev(). */
-    iov = malloc((nr_pfns + 4) * sizeof(*iov));
+    iov = malloc((nr_pfns + 2) * sizeof(*iov));
 
     if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov )
     {
@@ -216,28 +219,22 @@ static int write_batch(struct xc_sr_context *ctx)
         goto err;
     }
 
-    hdr.count = nr_pfns;
+    hdrs.rec.length = sizeof(hdrs.page_data);
+    hdrs.rec.length += nr_pfns * sizeof(*rec_pfns);
+    hdrs.rec.length += nr_pages * PAGE_SIZE;
 
-    rec.length = sizeof(hdr);
-    rec.length += nr_pfns * sizeof(*rec_pfns);
-    rec.length += nr_pages * PAGE_SIZE;
+    hdrs.page_data.count = nr_pfns;
 
     for ( i = 0; i < nr_pfns; ++i )
         rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
 
-    iov[0].iov_base = &rec.type;
-    iov[0].iov_len = sizeof(rec.type);
+    iov[0].iov_base = &hdrs;
+    iov[0].iov_len = sizeof(hdrs);
 
-    iov[1].iov_base = &rec.length;
-    iov[1].iov_len = sizeof(rec.length);
+    iov[1].iov_base = rec_pfns;
+    iov[1].iov_len = nr_pfns * sizeof(*rec_pfns);
 
-    iov[2].iov_base = &hdr;
-    iov[2].iov_len = sizeof(hdr);
-
-    iov[3].iov_base = rec_pfns;
-    iov[3].iov_len = nr_pfns * sizeof(*rec_pfns);
-
-    iovcnt = 4;
+    iovcnt = 2;
 
     if ( nr_pages )
     {
-- 
2.53.0


