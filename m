Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id En3hNT/QLWrukQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFFB67FD11
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="AGOLf/ZL";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1337551.1598825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWD7-0001Et-II; Sat, 13 Jun 2026 21:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337551.1598825; Sat, 13 Jun 2026 21:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWD7-0001C5-C4; Sat, 13 Jun 2026 21:48:13 +0000
Received: by outflank-mailman (input) for mailman id 1337551;
 Sat, 13 Jun 2026 21:48:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWD5-0001Bc-QP
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWD4-00DVVl-Cj
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dcf9c-2eae-0a2a0a5409dd-0a2a4507e990-34
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:10 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd01a-229c-0a2a45070019-d155802ad0b6-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:10 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso26447545e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:10 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:09 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387290; x=1781992090; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBOu2SGy5SEMj/LwC45bjJ4tbAJiMm9h5HCYGlaqv40=;
        b=AGOLf/ZLvAHsmFgXExBZ0B+cg3h3l2EUW4MVpS0Ylff0GYr4001WberXK+ybHsS81t
         2AKW2trREj5/8qukzJW/HQfp5iw6RrukPIYofsuvyZ7dVYYccYMe3qMPBmxaXeD+W9o2
         E4l4Ir4S5PY0yK3VgLVkdYmxumBrJHOUdRdjuoHWwESjCHuXK76kmEjqmg707KWxW+mc
         m4CqyFvjSOuJPMVISTCfjDSo0YTgipejOQuaT1BAsfu5JqMQjY0SV3cxdr5H3JlMXP4/
         0ZnUNP4DXYSXbGGnJhqVNK1xzUaCNpdH0DpZyoFKADuXdiCiq+qWqAJeaHEvqXUQvQ4Z
         bTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387290; x=1781992090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eBOu2SGy5SEMj/LwC45bjJ4tbAJiMm9h5HCYGlaqv40=;
        b=Y8pY8fHB2IMszSy2WpnalvsvmdwSO0laloqJcAGwdTyMU/tgDwP0Fi/ueBzqcmJUIb
         NxWDDvlGrZqX0+sAnoZkXNYyBHAk0I2Mi2yr+2M22yPFZd7bkWtK2xm0d4XafK2hQysV
         PhCfxsnxM7XdVluIK9lI9zoZbVtMExFEKQW9csiws0X+K/hms2sAfYwweBgiOCDc4JNA
         1rwoDLOfRLyNK7JheDref68bML4deX0fB44xuz6EdO+3RKUxp8IapQ4PZOc60npnaEd6
         gipi4YGqddPFYj7/qs+uwrlqThhTmJnp/NlV1iRgI/W4EvpCVwePQSOSEo28aHRnpEbM
         +37g==
X-Gm-Message-State: AOJu0YyyvxPY9Bf9U4R0mGVoEdXSa5sENl4CKOXGmYkkznIlo6SdHv7M
	Rif2rZUjsZCXDGtcdZqQ5x2DrnlVhkAp82sEi6xfxvHoib8z/SMMD9ClJh45ZFXWRd0=
X-Gm-Gg: Acq92OH74X1HKB+UT8Wsiybpp3OpdUGlBi/e7ST5F8LdMGnGMcJ5liwBWN3ZxVvPuaW
	sHVi7rg3AsYcpfPUAuUEAgtOWHkB6ZzdXICHdXb+8x1utoEQfmrFWFw7o/3yblObAqsr5c+upJ7
	1ABEZ7iT5Io/d/r7eUJ9eHFICRCj95gZE7J4LCRoqLnNuQ19i97DaJvZsREmI+zjEdhg0Pes/R7
	EfkaCWsaLMagEEOu/ms4jLr+EZzYpmfPl8w6Jk2DuLzREoYm6Dnh05oVB8Up9k7s6LN7ZDfICZj
	ZOijKZ7MVw554eMQhUKLsjT6jB6JTlU1hNQMitnvCx4RzGw6cMPFM3MAgUQn4cJbbWkgz55Dmx0
	hGX9PqyAk/Xvr9zqNnFa3Pgvrhr2fp/Ldl6sFzYy1cDLY4MHayjiPvt7ae5ZB0GTfP/PWIRjg02
	nwQXs4ABZqANw7BcTsu6jKOJw1pGUllsi99+zso/Me0tiq/KLevS/jBzfxOqw7YXCSHkyM7z/W+
	nmtqhKC+z0A2I7c8LJoV4fXFQ==
X-Received: by 2002:a05:600c:695:b0:490:bd1d:4732 with SMTP id 5b1f17b1804b1-492200dcaebmr34522575e9.23.1781387289825;
        Sat, 13 Jun 2026 14:48:09 -0700 (PDT)
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
Subject: [PATCH v5 02/16] libs/guest: Reduce number of I/O vectors in write_batch
Date: Sat, 13 Jun 2026 22:47:35 +0100
Message-ID: <20260613214749.20620-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1781387290-2216DC48-B05047EE/0/0
X-purgate-type: clean
X-purgate-size: 2700
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BFFB67FD11

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Small optimization.
Reduce number of pieces passed to writev.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
--
Changes since v2:
- change prefix in subject.

Changes since v4:
- added Reviewed-by.
---
 tools/libs/guest/xg_sr_save.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index fdbceab52e..68ce1aeb98 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -97,9 +97,11 @@ static int write_batch(struct xc_sr_context *ctx)
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
     };
 
     assert(nr_pfns != 0);
@@ -115,7 +117,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
     /* iovec[] for writev(). */
-    iov = malloc((nr_pfns + 4) * sizeof(*iov));
+    iov = malloc((nr_pfns + 2) * sizeof(*iov));
 
     if ( !mfns || !types || !errors || !guest_data || !local_pages || !iov )
     {
@@ -216,28 +218,22 @@ static int write_batch(struct xc_sr_context *ctx)
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


