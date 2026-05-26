Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IuLNldrFWoBVAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:43:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 955DB5D3910
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 11:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319667.1587143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoK9-0007en-An; Tue, 26 May 2026 09:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319667.1587143; Tue, 26 May 2026 09:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRoK9-0007bP-7c; Tue, 26 May 2026 09:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1319667;
 Tue, 26 May 2026 09:43:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wRoK7-0007NG-SI
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 09:43:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRoK7-002r1O-86
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 11:43:43 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b43-5cb7-0a2a0a5109dd-0a2a450ab138-42
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:43 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a156b4f-56b3-0a2a450a0019-d1558034e988-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 11:43:43 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso49805485e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 02:43:43 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d70c51sm36522744f8f.36.2026.05.26.02.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 02:43:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1779788623; x=1780393423; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHsDpV0xKbf5s8BDyceiYE3WNS4vLthHrGXN9Aw5Zmw=;
        b=lKgZGTgVgvM0O4TdUfycV6I7gyFHE6W22dVPhdRRbDEuc71fAQAdPygqPBq3+5WRHt
         R7kLqwKnM2Nnwmj0zWdgRBpyJaJiDq6r7JmABEaTUaTqhx6tb4Xh3BIyAE3gWgPpm3lK
         IH4FGT+g+oQaQNJWEFFCBmD/CIGqA38Pg/wRASn1LCd0H2pXhVYVlxIKkYEt1CFcL4jw
         cRBZS4l51GPJzEL9flDSrfPmP87owp7A44swJYVi+1YZUz98WWTVmZN+CxTW3EPIhvSq
         JSMFD4FUaJMwKBXEirJE2u7cDFkK033DxrpfEOsmAMt6SaWx4Lny6FXbM7hBJTEV0q2N
         1+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788623; x=1780393423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hHsDpV0xKbf5s8BDyceiYE3WNS4vLthHrGXN9Aw5Zmw=;
        b=m2keRCLBNI2Fyd8Dmp+Pu0hdx2QT3qyxwPZFM+GAxOXsh+k0d9If9K0f++fx/kWkJ3
         ukEwBzxFNmgJS8nL6xc3smj0KYCJwLKaNoehd+daPU4jXmpFR3WFYpkM5tFfmqfuSdy/
         X69tqYp4hMnTuYRN7QYdTK2jH0Z5tdaHoZFzXTpHGp3JnFGfDWYC1V01ywAGCVJOIixd
         L15ZtXD13mNco9hzy5bOuEMZ4TBXHqFLd/RZCV/24bJj4FPvqUiYgit6L/SehD+EvvpN
         zLAIJhkcvXOM6iIcQDbmfrpiBK0EzpzEfCB3NWo5BtcdTlx4VqMYIBV+jQhumE6BKC/8
         xKrw==
X-Gm-Message-State: AOJu0Yyp3Zsc8GAQLohpyt8pDWrJB6fQGz4okB6DAebTvRlDcO2Vx7zr
	Jt5+PJYyNq21odzz191ddHtH/QQinGfmCxbJmMNMwjWHS54xs6tDMuTWrdKAEUpi
X-Gm-Gg: Acq92OE6UtPMxZAUVK9dKpC7x2E8o3KHYoxFW2NFhRRvb6XtUpdFXnpd4FTRG86PYwI
	8089gnABl1leUael9VgARsMX00tFVS6LeaRJGPkloJhF6cSBCXCaVzf4+diuw683WpFWsmOreQy
	fXNd/NmxhdSECw/5mjNedSmR8EV/9V3vG3ThJ5MAjwkxFuM150m5Kjz2kG2D/4g9b+1RL/hsPFn
	X7lHz96C6qVKc61+o1I/L87d2G1sEYJdbm8NPuO3zzq0e+qGh/lkOxslzEX6gAD7xwg3v86sM0m
	1TevaeYVfBJmTpEyLvkdKK5g5vOVCXKjJG5fOOEmCIYS6NfGTmApW+SS0TFJUMhSdvyCmZHnqJ9
	XUE3eWdCTLWL5PsyHQweouq9t7a/YWkQF6OBA7/1kG+SVxoijWwSb9Nxp7b/d4R04Dgal+QCFYd
	os/iH8sWtQPn11VkIPH2RONmn2FLxQQC74Hf2P5zULaYRTJENlD+LOe3/zZc255grySGzTLqH+9
	YR0srPqTj0PuRNQ6clGw2jGyQ==
X-Received: by 2002:a05:600c:4f52:b0:490:4f91:5519 with SMTP id 5b1f17b1804b1-4904f91568dmr278511135e9.18.1779788622601;
        Tue, 26 May 2026 02:43:42 -0700 (PDT)
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
Subject: [PATCH v3 2/9] libs/guest: Reduce number of I/O vectors in write_batch
Date: Tue, 26 May 2026 10:43:13 +0100
Message-ID: <20260526094324.12286-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526094324.12286-1-frediano.ziglio@cloud.com>
References: <20260526094324.12286-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779788623-7397E8B7-AAF07042/0/0
X-purgate-type: clean
X-purgate-size: 2625
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,cloud.com:mid];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 955DB5D3910
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Small optimization.
Reduce number of pieces passed to writev.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- change prefix in subject.
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
2.54.0


