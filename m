Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZqMOJbA+NWp8pwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8976A5F17
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=T3QGMsHt;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342199.1602425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuK-0000tU-7h; Fri, 19 Jun 2026 13:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342199.1602425; Fri, 19 Jun 2026 13:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuK-0000rw-4f; Fri, 19 Jun 2026 13:05:16 +0000
Received: by outflank-mailman (input) for mailman id 1342199;
 Fri, 19 Jun 2026 13:05:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuI-0000Uh-Ud
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuI-00D4ah-BQ
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e89-2eae-0a2a0a5409dd-0a2a450ba98e-2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:14 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e8a-5e53-0a2a450b0019-d155dd2bc807-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:14 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-45f3cf907ceso1063197f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:14 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:12 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874314; x=1782479114; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRsqYy5FIagth3/bGJe2ZNcz/9luhK+GkHhdLVALu50=;
        b=T3QGMsHtEAeaBPGJ5cPRb3HtTnEY8GXodqE4MMKEiLV9ETuolHi2aMQWk7I+4aiGsR
         tPWVNr/4ImgYypc6LVeze3gMKH0uvJ2AGKPAITt0NTLC1sVAa9DCtEfNiG+vp4AuB98Q
         nHqI4xeLFO5jzoW4cGiTs7KF3h5ka7gUYDVBdwu3rgprdRbuaCLxwk95DLUW0g4uPn9R
         MdnPTO+FOUK96wYeFh5EBfpEY5enH+oRKrOaNt2v9pN+SXSND9YpU+VcSA5kojARGhy3
         E9xIJKOMMvs5bcZNLNY9QXFMj5K83kNrrSMv8LRSlmE+DR1c8zcrQovT871GECLQrZCs
         R4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874314; x=1782479114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KRsqYy5FIagth3/bGJe2ZNcz/9luhK+GkHhdLVALu50=;
        b=ZwDDoHaNyaHmBwJk43UJMBNtjDQ8As9L+t3Bp1CobUk/d6pWF3poDXD2COGr1wOXNs
         ygPEzbLd1kvKIA1dqzs2nQtjScYS7NqyPSdScFJJ3z5aBFpq5w7hg3AlYjC/X55N6fNT
         EF15CDh0wL+YwUnnHSqQqKJhijERQh1LbogJoO0iqpTUq9KYvxQ4S+VZjEZEkD7T4Hgc
         1vQAQTsdnqaX7McV0FiAuM2o2NCSdBo1/Qadw+6YqaQmAXh3qFhgmDKqLGDwu9M5xMG9
         1H4loOcludX0G4wgODw29VCjU+2Ipkr6FOkuazS5UJKOJKeP29+ysu8eOl4lDTEJPoGH
         tgrw==
X-Gm-Message-State: AOJu0Yw7s2MeeSq58KFnVn0BzMsJC4XgsF4qtQwCZVE6hHM3gUNHgHq8
	UUrZe7wiuFm/bwp84wF7wPTtLQXoRe5qIqSLNADNOE1rmweu+quTQhCuIDfXpittclk=
X-Gm-Gg: AfdE7cmmaTbpLSE/Hx6/qBM/8VxmvLXy9e3GMTYJPg5s71ghk0/yncfEX9O4KkKpDEM
	+uO+JmTbwfnNNqWrHcReGSEy+dGcE36Mmig3ClVwJzT9Sz0c8qdKahoaTmruk++HkxurCr1pzvd
	9jyg1EpGyNPxM5ajOjN5r/BQYXlm/Kvb27PlO3edyqwiX0rtqCcC7TMUYs1vpw9Ony4FfqzWHwY
	yyvae/zaOTFTrtvdEUAvq3cUz5iZXeCVo57T4ZUwkdORHh7W09FU67tk37OqVmMG85DQwTWE8TW
	f3oHFb/t+QDS8Q7x4zLyN7dhRplVBS2XJ+cGT/iWHLhh/EkD57sXrfT5jxQteMONr/02mS1LGBN
	UCoW43Fe5IC4AX+WdNEPQuyiN/2eyN4xtwlSD775uBGTIIKTi5YiT+gUZgBGpW514kQruLi6HJ/
	Klc17Z6iUsW5uMNT5Kb8PVUJBTDht/5DbBD3ptR1bRiMt2zOgYoBrzB2J2THrWH3cyXTcmFSvKP
	Av1geBl
X-Received: by 2002:a05:6000:2284:b0:441:1fa5:457c with SMTP id ffacd0b85a97d-464fff65dcdmr7069984f8f.5.1781874313503;
        Fri, 19 Jun 2026 06:05:13 -0700 (PDT)
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
Subject: [PATCH v6 02/16] libs/guest: Reduce number of I/O vectors in write_batch
Date: Fri, 19 Jun 2026 14:04:47 +0100
Message-ID: <20260619130501.272832-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781874314-4C1CA00E-B0ABB76E/0/0
X-purgate-type: clean
X-purgate-size: 2646
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email];
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
X-Rspamd-Queue-Id: 2D8976A5F17

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


