Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fgScET/QLWrqkQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC99067FD05
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="FB7z/d0R";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1337558.1598881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDB-0002bN-IC; Sat, 13 Jun 2026 21:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337558.1598881; Sat, 13 Jun 2026 21:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWDB-0002V3-Bg; Sat, 13 Jun 2026 21:48:17 +0000
Received: by outflank-mailman (input) for mailman id 1337558;
 Sat, 13 Jun 2026 21:48:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWDA-0002Fc-06
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWD9-008PGn-DM
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:15 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd008-5cb7-0a2a0a5109dd-0a2a4503cafc-10
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:15 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd01f-672d-0a2a45030019-d155802fcd23-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:15 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490aaeabdb4so13454655e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:15 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387295; x=1781992095; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UNO2xI/wOnyoP+fG/GB8NiqXOoc6f8puz6dKt7oyRY=;
        b=FB7z/d0Rl5zZzspY/NwsGBFMNJU3eyRQUQl05HoEb3F4KvfPb/iOGJE2U0a9wMtqAK
         HcUbL+Injiggz2zSkkVrivx7dxhmvA1GnZJc+HIYgpQkVLjSTSQ7lj4xXEF8fOrK1rIE
         BwkUK97TSF/1OnJri+GWuQ/3VYYFxgPaFIsQqllx9FaTDTN9xqI6FAXSsOMspyC9vfZ9
         dhrAwXpghxjPlfT1iuEOIBWwOUXId99vyiY7hlZjzyHAix5z/R3xVqTl/kVkS2AWqkpD
         38IEMN55HkFZeVt0pzNJKHpVCAX9B0H5ws9od7F6p6+PgMaACZNJ7c6c+0+RKL2+8n0F
         n5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387295; x=1781992095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9UNO2xI/wOnyoP+fG/GB8NiqXOoc6f8puz6dKt7oyRY=;
        b=nPlsWg8eA/mS8qy8y+PFxN+AutJrge+GwuVDQSCO7acyrNM0I+/foyM4zq380oV2dF
         FSDYT8SlpNBmg3keCwDoL7V1MPGb1VmqjaYOlOAw3vZsi1MS3DkqDpxjZ6TBm+L/eNRV
         plXAvJMbpfADAWrXy8bJKqWEHC4DggO8Z6uuXDi+U3B7k3PNv9sbi0+vPI9AuoXCMxgl
         PHzQc8Xs+Oa0izVqV0yy4ZjFuiFkHGANcwYZjHahN7EyJY1X6KXeG0w8XEKfmWm8jbbj
         8qQSEcZdugUrKO5Z6XxdMDfYs3+PQNVBb/UCYSwCtM2HX8q9ELUovFxjnnaQjiuUE+qm
         2bHQ==
X-Gm-Message-State: AOJu0Yxf09d9UCkuzq8nPuD7vpHQ3yzkMiimJtz63rxYm0xQF32kFWl3
	hMzgD5dGDGqoamUFLpRtNo6abONb5N/D0HHk287if0qNLOMjYW6/F7OE4Kc6a34Mcu8=
X-Gm-Gg: Acq92OEf2b0FZUEllk10sKMVv3zf56ORnh0CFVVm5VhEsRcDRjBv3yh4n1uby5xTFNe
	ioqx8yzE5Jqc27Z38SdFE67+BkJEKQTvbMrLs1vLzrRdeGgi/KEijTSdg0vL7glecXEaaghKx50
	fo7DsyRzFSPZKlb7SWe0EmVU7TPcszkIJ1U3Snwsh3ehY6GnBkLqkIgB2ZYbKKQMGmpvoiywgbf
	9/Ek1D9/Vu0xfwYr0fiZuVGrE7n/zVRYQhTxei4RWzw4vAnKyE4fh41RI4LJpEVy2u+gtpjGdsE
	2goN/PtFLVsCnh7id9d0ceWt48ollh6ZA3ng2gUW4faLo9djlpTn3voVsqOan1g+Xec2ZybKwSd
	Ffqd/TBlRMhl0SGULx1Qqr3PzGdP/jQbgW96Z4jlkQNWCAkp4V/fjGcLqsbyMxRkALCNMDG4ode
	5pyPwNwYWEVachoU9uIpximrd989UYQRIcJhD26h0XA46bp/JDRYAZCrG8fEj+0J+9pKHM2wO9y
	LysgI5FCXJs1r/2h+HwBLQKFQ==
X-Received: by 2002:a05:600c:17d5:b0:490:b4e5:ce7e with SMTP id 5b1f17b1804b1-49220104e46mr35997485e9.25.1781387294695;
        Sat, 13 Jun 2026 14:48:14 -0700 (PDT)
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
Subject: [PATCH v5 07/16] libs/guest: avoids using 2 indexes
Date: Sat, 13 Jun 2026 22:47:40 +0100
Message-ID: <20260613214749.20620-8-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1781387295-3957F938-350FC35E/0/0
X-purgate-type: clean
X-purgate-size: 2785
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,cloud.com:mid];
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
X-Rspamd-Queue-Id: CC99067FD05

From: Frediano Ziglio <frediano.ziglio@citrix.com>

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


