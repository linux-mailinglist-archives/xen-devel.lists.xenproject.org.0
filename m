Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPt+BV176mmqzwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 22:04:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A171B4571D3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 22:04:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292627.1570982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wG0Hc-0007Xi-IM; Thu, 23 Apr 2026 20:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292627.1570982; Thu, 23 Apr 2026 20:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wG0Hc-0007Tz-Du; Thu, 23 Apr 2026 20:04:20 +0000
Received: by outflank-mailman (input) for mailman id 1292627;
 Thu, 23 Apr 2026 20:04:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wG0Hb-0007Le-Cq
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 20:04:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wG0Ha-008AbV-Pj
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 22:04:18 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ea7b42-bab6-0a2a0a5309dd-0a2a4506bad4-0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 22:04:18 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ea7b42-7371-0a2a45060019-d155dd2bf07e-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 22:04:18 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43d73422431so6043904f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 13:04:18 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a341sm60065442f8f.24.2026.04.23.13.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 13:04:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776974658; x=1777579458; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVGY1T6hm0/7+FJT6srnaIkpU7DrhVy9HgeD1DDoZUc=;
        b=T4zu/hn2SFtlgE2Up/0X7YzE/jxSHDdB47UA9+e5ysZ6+hV/es7vH0dbFsn3QJFP4m
         q0eiBebPWVIlrPITkRQ3BrdNR5Lu7S3QOILkALHprljTjCVbHLs3nUcYCi7ithhmf4GC
         dEjUvoYu8iDGJyKvhO7QY7UCqlyRROCE/Yfrz+NWG9JEkVZTxiyB2aRkAjRsPZkKtxwG
         Q7lL074ih4vXCf2Sl8CMTTVZXSwUCbK+ADirt+5kMTNwH2KJJN+8J02BU+TT5T9okzfy
         SF3LebeSUwNRT0SX1IDMK3etGD98QiPX2fvoG041jc6f+WK9YmXN7LmfdI9OzCCainUz
         VKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776974658; x=1777579458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVGY1T6hm0/7+FJT6srnaIkpU7DrhVy9HgeD1DDoZUc=;
        b=IvE6oagXgE0cfqC+4u6ij2ZPEkt348bQoRUpSNpW/WXx2TynYP48NBpI7moy3I+Ydp
         wAw5Sij/zSJZ/vF76onscfVL5lN0WYE2KDNe7WyiVnmMZQH1pxUJUu1QzXS0U5VxOI5C
         /TWZ3ZkJp7BY1xuYIOfnVxrOBAclHSMq4DFVwYE0N6olrfu6GZ47yOHSFMdv6nljxEtj
         W56iIWmtb+Mj8ncKBBQxXTzo9NAJYFHPeMW/TZH2ZRL7q34n8p5A4Qp1dkgw2UVtlPpV
         BrA4eJAMJzD4tfzkRSlRZu5Ku56gVtWNgBFmoZCX/WxRF2CVg9079OlYPyqFy8GrK2+F
         ynVw==
X-Gm-Message-State: AOJu0YyLqziOJOt5Idsb7MPPkSIKdPrt4JbpQZdEZ7PKbUOmd686ZFgO
	uitlhvHfRE1IJHImsL9wJ50soh51Ai8+xuIvig+SvKjjwTFYanqWJanZXSLwW0f6
X-Gm-Gg: AeBDievuBla+9X0Ho6A9Q+VFV6T89ZiQEQYgAzFNs99LoA25PV9UuiE5HQlRHKJPCV3
	vKuXIfn64YZFlh2+H30KyGuFsnjmLIHRVp0VjTxDHlXxLIF1EjeBRuyhECuoR5CYe5Tj7zoVT29
	uFPcSvn561FU377cb2M3HkbtNY4sAs9GV7045QFlQyrvg0ZAXpqn58d/bkKLUZQRcLqdYpyA8xB
	g0dl5WvWOxjTVlYJ6gPmqAgxGmRr5h5e5SKoB+h3xgCt6NGXTV7rUk+dDQgFfZL6TnNRyDgZrLE
	DiGVN1xYoHc3HpQ13zjmaenyK7zr4PA4OVPSzECx8oxzQHGxbU5elNqEsXJ2rfZMj+BL4Rgu8W2
	gxl97pi9Wt5/ROH6nWCD8Zn7PygMtrz8vTiUNScSEjPFR1W8Ld4Yo+UtDCPPYWYCxHWXto0WAFk
	wkB+BQlTSE7Em/LXIe/ECfJHA3fK/LEy2hdxG7yCyXNbKooSuZ6zVxMAJoOWCiHzhDsq6UlBHWF
	R6Y
X-Received: by 2002:a05:6000:240e:b0:43d:714:34e5 with SMTP id ffacd0b85a97d-43fe3e0d2e3mr44148983f8f.24.1776974657709;
        Thu, 23 Apr 2026 13:04:17 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/4] xenguest: Reduce number of I/O vectors in write_batch
Date: Thu, 23 Apr 2026 21:03:57 +0100
Message-ID: <20260423200406.28178-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423200406.28178-1-frediano.ziglio@cloud.com>
References: <20260423200406.28178-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1776974658-52369D75-4AF4319C/0/0
X-purgate-type: clean
X-purgate-size: 2569
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:mid];
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
X-Rspamd-Queue-Id: A171B4571D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Small optimization.
Reduce number of pieces passed to writev.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_save.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 3b2c5222e4..1700d81905 100644
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
2.43.0


