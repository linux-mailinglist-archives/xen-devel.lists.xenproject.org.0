Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ScpaEPIcRWrb7AoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 15:58:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A656EE704
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 15:58:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=GlKi1BpX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1350000.1607584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wevRr-0007yr-QI; Wed, 01 Jul 2026 13:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350000.1607584; Wed, 01 Jul 2026 13:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wevRr-0007w7-NP; Wed, 01 Jul 2026 13:57:55 +0000
Received: by outflank-mailman (input) for mailman id 1350000;
 Wed, 01 Jul 2026 13:57:54 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wevRp-0007w1-Vv
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 13:57:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wevRo-0030IK-3w
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 15:57:52 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a451cd0-e002-0a2a0a5209dd-0a2a450bd6d4-30
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 15:57:52 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a451cdf-ac48-0a2a450b0019-d155dd2bdd3f-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 15:57:52 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4720d22c94aso625467f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 06:57:51 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be4d1f1asm84305675e9.7.2026.07.01.06.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 06:57:50 -0700 (PDT)
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
        d=citrix.com; s=google; t=1782914271; x=1783519071; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIJgGOMFkoaNlmHYqWSEkGMrKi3GrI6JuJgk0+8+tmY=;
        b=GlKi1BpXNfmsh5TXb2Duo2Mdv1teFK6sO8VLvRaa8dtb2wIyjEkY/3sd30su1d3KVy
         HwUWvuONyGQqPBPZBlR1y8Ubs8hSjcIKOD8/Us+67+kqOClOa+lIg3R38Q8xJ2NwJoER
         nPDOO3G92LscE6+Wg0LMU4+kkU58gI1fXh3bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914271; x=1783519071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIJgGOMFkoaNlmHYqWSEkGMrKi3GrI6JuJgk0+8+tmY=;
        b=exR/otGYjuPieRvrC3+ILeHPhpcVAKNBf14Ooy1T2mXlrLXSwkcph8drEoC2DDqIsq
         1xwfm21yp9IcZRnbawGW+SuvpdxuWrSpOIJFWgvclEPoDfs+MhxrC43Am+jSvUvnN6UI
         UozvCVbzJxi0JtuCTOajiy3wjIPQhxEDLarIpWpHpfgvGSUHbIli1W1lrhuYI79qKkYu
         4DwHAXktBqHteR84ujNYRHalj/GTqKaVGtkwyOqxwZOIuVFLNFWKX/1KEgvjZtdQtXDY
         jkoUNJu1E1uz33RakeGtbDKlqTGW2jrodpqpALFaBTdGNYE9tOJkVymBptS7zAXhDlz2
         luzw==
X-Gm-Message-State: AOJu0YwWJlny5/JSLZSt+8fzYrM+r528C8FWoOxeUYKJwBu18yDQmXOb
	Cy1JReA/2s6yO+t9Q52jomVDl7Tf+z6yYbpVIGiGKjIWodDfF0Nq4QIHeCItZdG7Shw82/miBZw
	wZQaP
X-Gm-Gg: AfdE7cmErdC9+xMaft4gQ2LQmi/Co13tCqFV4GS9A5wo0jhEjrSFB3nGVZb9WdjAVRt
	ajgp+6x+g0Ml+5MPdk/xL8Uh0DjuQxIG0Iur5/1MUR9whuQhCZkCTRClXhAXlxBvNMN5SA0bLW1
	9k6ussISLazP+qBWUbzDt8c7yPccFmBYOYnhr27XrW9hMr6DWRnsAmYcGbUIRk5pKtMWQsPvcHz
	l3Zc3ttYnpaLhPRaJQa+iRUst1VDetASZBru7e9fEfu57y1tjPvc2cuTG5GNNKd5JQo/mE04T4u
	JT0U6tFZjQTpHF395lOrelAB5cpyMn2mF/Zb6mMBD1yvwQTzjF7Y24IUgvY9srDKNGAEdWNXivp
	SwpKmJTXpXEgrSOVajmfT9aiPo51lz5hsZp3TVash34iWLgfg7cIE9adBDNA7I355cO04JF16JR
	Rzz/zdACkr292esY//EquTeQ+4HBFid7jdHWz1hNou+7rmcry77Z9vHo34PelLwUs0CxeV7VwFP
	g==
X-Received: by 2002:a05:600c:c093:b0:493:bb4d:4dfe with SMTP id 5b1f17b1804b1-493c3cf0d10mr11552475e9.23.1782914270976;
        Wed, 01 Jul 2026 06:57:50 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Frediano Ziglio <freddy77@gmail.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v6.1 02/16] libs/guest: Reduce number of iovecs in write_batch()
Date: Wed,  1 Jul 2026 14:57:47 +0100
Message-Id: <20260701135747.797083-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260619130501.272832-3-frediano.ziglio@citrix.com>
References: <20260619130501.272832-3-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1782914272-A673A220-E3FC135F/0/0
X-purgate-type: clean
X-purgate-size: 3256
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:freddy77@gmail.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:email,citrix.com:mid,citrix.com:from_mime];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96A656EE704

From: Frediano Ziglio <freddy77@gmail.com>

Construct all of the headers together in one block, rather than a field at a
time.  Initialise as many of the fields as possible at declaration time.

Start filling in iov[] earlier, to allow for future simplifications.

No practical change.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_save.c | 45 +++++++++++++++++------------------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 69fe991a8113..7736f4a055e0 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -97,9 +97,18 @@ static int write_batch(struct xc_sr_context *ctx)
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
+        .rec = {
+            .type = REC_TYPE_PAGE_DATA,
+            .length = offsetof(struct xc_sr_rec_page_data_header,
+                               pfn[nr_pfns]), /* + the pages to send */
+        },
+        .page_data = {
+            .count = nr_pfns,
+        },
     };
 
     assert(nr_pfns != 0);
@@ -115,7 +124,7 @@ static int write_batch(struct xc_sr_context *ctx)
     /* Pointers to locally allocated pages.  Need freeing. */
     local_pages = calloc(nr_pfns, sizeof(*local_pages));
     /* iovec[] for writev(). */
-    iov = malloc((nr_pfns + 4) * sizeof(*iov));
+    iov = malloc((nr_pfns + 2) * sizeof(*iov));
     /* page_data record PFNs list */
     rec_pfns = malloc(nr_pfns * sizeof(*rec_pfns));
 
@@ -126,6 +135,14 @@ static int write_batch(struct xc_sr_context *ctx)
         goto err;
     }
 
+    iov[0].iov_base = &hdrs;
+    iov[0].iov_len = sizeof(hdrs);
+
+    iov[1].iov_base = rec_pfns;
+    iov[1].iov_len = nr_pfns * sizeof(*rec_pfns);
+
+    iovcnt = 2;
+
     for ( i = 0; i < nr_pfns; ++i )
     {
         types[i] = mfns[i] = ctx->save.ops.pfn_to_gfn(ctx,
@@ -210,29 +227,11 @@ static int write_batch(struct xc_sr_context *ctx)
         }
     }
 
-    hdr.count = nr_pfns;
-
-    rec.length = sizeof(hdr);
-    rec.length += nr_pfns * sizeof(*rec_pfns);
-    rec.length += nr_pages * PAGE_SIZE;
+    hdrs.rec.length += nr_pages * PAGE_SIZE;
 
     for ( i = 0; i < nr_pfns; ++i )
         rec_pfns[i] = ((uint64_t)(types[i]) << 32) | ctx->save.batch_pfns[i];
 
-    iov[0].iov_base = &rec.type;
-    iov[0].iov_len = sizeof(rec.type);
-
-    iov[1].iov_base = &rec.length;
-    iov[1].iov_len = sizeof(rec.length);
-
-    iov[2].iov_base = &hdr;
-    iov[2].iov_len = sizeof(hdr);
-
-    iov[3].iov_base = rec_pfns;
-    iov[3].iov_len = nr_pfns * sizeof(*rec_pfns);
-
-    iovcnt = 4;
-
     if ( nr_pages )
     {
         for ( i = 0; i < nr_pfns; ++i )
-- 
2.39.5


