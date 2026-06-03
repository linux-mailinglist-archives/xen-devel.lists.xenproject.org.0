Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0qF5N9wmIGqkxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 932C4637DC7
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=B6KWT8YY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326230.1591717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIh-0006hA-PN; Wed, 03 Jun 2026 13:06:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326230.1591717; Wed, 03 Jun 2026 13:06:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlIh-0006bl-KP; Wed, 03 Jun 2026 13:06:27 +0000
Received: by outflank-mailman (input) for mailman id 1326230;
 Wed, 03 Jun 2026 13:06:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIf-0006FT-WF
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIf-00Fz4z-Cy
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:25 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026cf-5cb7-0a2a0a5109dd-0a2a4502ac02-4
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:25 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026d1-af86-0a2a45020019-d155dd2bd859-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:25 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-460166910e6so1763531f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:25 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491985; x=1781096785; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6wvxilFElIaNb/mhD1JtaMC/n+2767zKlkc9WwKCUs=;
        b=B6KWT8YYvNT/86fFNBxYbgpp+DIjAS7E4DZTxmmn2VZeupP2hB8teYDo2zwRcXN8AN
         Jd6tpCrfs/H4/pZ+w2cL4McH3TDQ/CDvUElwbmAZ/bp5ZRhg1i4p3FtN0gE4sCiRMhoS
         7ud9KqzPpojWHo9olAoVwaqKp1cCxq1gCRavThRKe2Jx20qZdlYQXh/1pa7qedN9FgEx
         Cta/ecM7QEtlWDD/x81UNurIlED515KvSLl2fOVwjXz2K8lG2F3nLJL2zzciGzWUeHWY
         jSBA6K+q7ypkJSohpyVk3ieJkkKwgCIClJML58MKl2pJM0CMj1L1nDDRLLV79oeeum9f
         AyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491985; x=1781096785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6wvxilFElIaNb/mhD1JtaMC/n+2767zKlkc9WwKCUs=;
        b=nnHla83vIvwz4Y/IhXpsTEOarB1ssH0YfK7y37gERoixdnqpC+bmbvnLl3uIROcHlM
         L2jmy4Gmmm0O4b9RBVLX3Nhm9j0hVe5d1otaTV2VhHnlYKgtna55YQLUBWAi/wIHdEjF
         +4ckTxkVOeu4kaOq5Fr3oDnVrrqkDJo19DN0yUJMrSjg9kCT9b1mRi85kIy4RG2TZLrr
         Xj1TG4gp+7PFXk/kcuJ9TTF12CxMZKfhKSYuzsoGJYNRHkj1dIRbeAhU7lPfp8L3Qf8c
         hJFSEEjiXU9WmcJqrTLXNoGP/v9UNo27u9PWdEjNRn6BfNKt0dLU8LriegZOz0yvjHTh
         8bvg==
X-Gm-Message-State: AOJu0YwDLPH0jUkXvbmyM7ED5CzEMWO12JPyX6cPW7uEGBlNVXHmN0RS
	T+QvkenckMsu9aoBqZ3NrT67g84RqBgq/dp1x/wrQ0OnezCoiit+pf2TKpKlJ+F6
X-Gm-Gg: Acq92OG2UYCw9AYx3+wj7HWxS+EuOZr3tYoPSnZh/MCgT6nYpX1VUekrdyYXomlrx7g
	73NISl0RzeHm3OtD3NhbmzhMHpobXd9eqN/jM3J1k4GTa6wLibn/M8uMPzxgIp1YhUMY0HIILTQ
	6p/OCsBkELbb3kekHrgKAF76WrEusDmhfmydy0NijtNSBvRRNzoYM9x8sM2cN5W9KFxj2oPF4Be
	HajTAea+GM1BoDStF1QtawAey17Z8C8dDmOnMhpDQpv51Q6b1peIuEwnIIYmVZ+YL0YkNqC3bK0
	Fgh8AQHShLYp+/wA139442Ru1bv+Ti/b4owMpXCFOj4ND4LjWDF3OBzW+En1rrMKooWGhkmd8Rn
	FDRxlvayaZYyDI7Q3w08aVd6Q1t0ppaHVN69l04ig/kG3/O2COGaHwZyanixk+Ag6ZeEFxhTw9P
	MQVlS8tAydHwsSTg+FSdtmsHNOILvPodAUHrR4Ul/DWewe2fq5+XXBUmzpOKLf8g/1fUr/jW5zz
	S8IFeBU5w9KMM0zmFTkCZRDSIu6SOxTCvFpKl3Q83LyjO4=
X-Received: by 2002:a05:600c:154f:b0:490:af90:f9c2 with SMTP id 5b1f17b1804b1-490b5eae33dmr56963585e9.12.1780491984397;
        Wed, 03 Jun 2026 06:06:24 -0700 (PDT)
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
Subject: [PATCH v4 07/16] libs/guest: avoids using 2 indexes
Date: Wed,  3 Jun 2026 14:05:54 +0100
Message-ID: <20260603130603.776452-8-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1780491985-A8B78161-F865556A/0/0
X-purgate-type: clean
X-purgate-size: 2684
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email];
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
X-Rspamd-Queue-Id: 932C4637DC7

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Simplify code, after the first scan of the various arrays we don't need to
keep original types and PFNs but only the ones having data.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
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
2.54.0


