Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HPyELbQ+NWqOpwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FF66A5F47
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 15:05:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RH5ZaNnX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1342204.1602470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuP-0001zk-N3; Fri, 19 Jun 2026 13:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1342204.1602470; Fri, 19 Jun 2026 13:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waYuP-0001ud-Fa; Fri, 19 Jun 2026 13:05:21 +0000
Received: by outflank-mailman (input) for mailman id 1342204;
 Fri, 19 Jun 2026 13:05:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1waYuN-0001Wt-U6
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 13:05:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waYuN-00D4ah-Ac
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 15:05:19 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e89-2eae-0a2a0a5409dd-0a2a450ba98e-22
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:19 +0200
Received: from [209.85.208.50] (helo=mail-ed1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <freddy77@gmail.com>)
 id 6a353e8f-5e53-0a2a450b0019-d155d032bc5e-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 15:05:19 +0200
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-69532288224so3950688a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 06:05:19 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4650bc428d9sm7960088f8f.27.2026.06.19.06.05.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2026 06:05:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781874319; x=1782479119; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZidMZWTCYLyL5ufIMI3PcR9yOlOw9e9GMi8xqFKVOr8=;
        b=RH5ZaNnXnutl+59wVjGfXnwseXaNH71z440zvKQe11I1Lh6XZQdY+3K2Nvd94978YG
         SXJa/a6Z86ruc2KHdI9Uaivgf8YWIvPi+u/8CM14RJk80l+XnSPSPonntrqi8pxjCja7
         Co4WqUPxztOfngUlFWLOIX0xaDPOy+Zf7JzImoM7N1LSFybwTUMj8/fnbaFwLYyqD1gP
         K82oqUl2vaz2VjhFTZEa3PxVf4zafFB3bszCLG3WmGwfVmcmQ4OHUi4p0lkRtCwjvSSC
         vVaepIkR8CUNXEm+BC9D7nq/sJfHa25c63BXK8cqxvD2PaMsJ7oCp8Fb9t0UIGSEClMs
         xCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781874319; x=1782479119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZidMZWTCYLyL5ufIMI3PcR9yOlOw9e9GMi8xqFKVOr8=;
        b=gflDynSKdOYtRT8mDCn9MIENdrTeZerJ+U21n40haK/VNuWS4wsAyOCozEVuPZthXY
         LUK8rqO6PVUDxVwaVni4mapLBbfDqaoR+bOIr4gTTRBcdm1EzEUgt1zUX+u+R3dnxsH4
         /Dam9QhtOz4QJvIi9bUW/rOeYsTQm1dFbiG0KdD+3Aa0rKEIh7HFdKqdUgIe4H3piZAr
         wfhpcu0jxYdE/z4RPrZ0mZhAnH59Qg5l9DEw87X8EBNsYyPEhAbgYCMXg9hJ5cZ6XBBq
         kLv3QFigNJm57X+AnCdiCpcp3xPUMGzdkGqjB4TKlSNqR3oZ7S1ooKOBblVSqRDiSj9v
         i4lA==
X-Gm-Message-State: AOJu0Yx4lJt5vJI9t5LNj0KaJlJzIZkzLRDAk7FAFxSvxHgjfjiRrfCG
	hqJKjhyZkNhm/tiOIRY3RBqS7vN5ne7MafoW0Pqd2/l5ExP7mv32O4KMX634FT6jMgI=
X-Gm-Gg: AfdE7cnrUQPhU4NE1ORbLVjYO0+a4DriMFIVwM7oBPPtJgSPE7/bJJxNMI+s7FmIN0i
	sVyS+g9ffMaJSC6bwOl5lA8RvLbgBB2DXcG6Szdppk8p2trTZ5qv6NxQC5ocDuhqK1BSqcFac20
	l/6JPCliauEbPp7SfROvS5MADLKVj3bmNehplC0O6YNCrlgi0Jgu4GvBCwZqhLK7PC7YO3aQCYO
	0cRNdQRAc1CkYrYugKLwutimrAeKmh1yBup2+JxEogMDJ+aKIcu8mG/4UguXIoNLkwepZ8f8Vx7
	c41daUJ7HGZlx3gJ3ORjtT40mxMopWdYfjpFL12S+5lx9cqSiM/IKsTXQElpzQfYM6irOL/375T
	SFzmqzwEs8GcuaMfnmM4qfPFzxW1uvo7BvIkMIqdlc3OZfTm/qGM+A/B3enflEel691oW+/fTIW
	5hRtJ8PHM6cXwTG23Eyzr7Mwa2sbE3t4idOJH/nIEnzmmdADWGHIeJVaL9quvDCzuRJxKblMZaQ
	2ppBHVf
X-Received: by 2002:a17:907:724e:b0:c08:3409:b747 with SMTP id a640c23a62f3a-c0b62137c57mr133369766b.33.1781874318503;
        Fri, 19 Jun 2026 06:05:18 -0700 (PDT)
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
Subject: [PATCH v6 07/16] libs/guest: avoids using 2 indexes
Date: Fri, 19 Jun 2026 14:04:52 +0100
Message-ID: <20260619130501.272832-8-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619130501.272832-1-frediano.ziglio@citrix.com>
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781874319-45DF800E-D2DF68FF/0/0
X-purgate-type: clean
X-purgate-size: 2731
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
X-Rspamd-Queue-Id: 46FF66A5F47

Simplify code, after the first scan of the various arrays we don't need to
keep original types and PFNs but only the ones having data.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
--
Changes since v4:
- added Reviewed-by.
---
 tools/libs/guest/xg_sr_restore.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/tools/libs/guest/xg_sr_restore.c b/tools/libs/guest/xg_sr_restore.c
index e148fc594a..fb46142d87 100644
--- a/tools/libs/guest/xg_sr_restore.c
+++ b/tools/libs/guest/xg_sr_restore.c
@@ -260,9 +260,7 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
     int *map_errs = malloc(count * sizeof(*map_errs));
     int rc;
     void *mapping = NULL, *guest_page = NULL;
-    unsigned int i, /* i indexes the pfns from the record. */
-        j,          /* j indexes the subset of pfns we decide to map. */
-        nr_pages = 0;
+    unsigned nr_pages;
 
     if ( !mfns || !map_errs )
     {
@@ -279,12 +277,18 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         goto err;
     }
 
-    for ( i = 0; i < count; ++i )
+    nr_pages = 0;
+    for ( unsigned i = 0; i < count; ++i )
     {
         ctx->restore.ops.set_page_type(ctx, pfns[i], types[i]);
 
-        if ( page_type_has_stream_data(types[i]) )
-            mfns[nr_pages++] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
+        if ( !page_type_has_stream_data(types[i]) )
+            continue;
+
+        mfns[nr_pages] = ctx->restore.ops.pfn_to_gfn(ctx, pfns[i]);
+        pfns[nr_pages] = pfns[i];
+        types[nr_pages] = types[i];
+        nr_pages++;
     }
 
     /* Nothing to do? */
@@ -302,16 +306,13 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
         goto err;
     }
 
-    for ( i = 0, j = 0; i < count; ++i )
+    for ( unsigned i = 0; i < nr_pages; ++i )
     {
-        if ( !page_type_has_stream_data(types[i]) )
-            continue;
-
-        if ( map_errs[j] )
+        if ( map_errs[i] )
         {
             rc = -1;
             ERROR("Mapping pfn %#"PRIpfn" (mfn %#"PRIpfn", type %#"PRIx32") failed with %d",
-                  pfns[i], mfns[j], types[i], map_errs[j]);
+                  pfns[i], mfns[i], types[i], map_errs[i]);
             goto err;
         }
 
@@ -337,7 +338,6 @@ static int process_page_data(struct xc_sr_context *ctx, unsigned int count,
             memcpy(guest_page, page_data, PAGE_SIZE);
         }
 
-        ++j;
         guest_page += PAGE_SIZE;
         page_data += PAGE_SIZE;
     }
-- 
2.43.0


