Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIb2CHZA72lP/QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE13F471525
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2026 12:54:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1294781.1571513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbM-0006X0-QZ; Mon, 27 Apr 2026 10:54:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1294781.1571513; Mon, 27 Apr 2026 10:54:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wHJbM-0006S6-LQ; Mon, 27 Apr 2026 10:54:08 +0000
Received: by outflank-mailman (input) for mailman id 1294781;
 Mon, 27 Apr 2026 10:54:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wHJbL-0006HQ-OI
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 10:54:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wHJbL-004Ir6-5F
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2026 12:54:07 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef404f-5cb7-0a2a0a5109dd-0a2a4502c732-0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:07 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 69ef404e-af86-0a2a45020019-d155802eb0af-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 12:54:07 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-483487335c2so98602365e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2026 03:54:07 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a5c4b9e8dsm116133355e9.7.2026.04.27.03.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2026 03:54:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1777287246; x=1777892046; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4AU8wNCg4sNfAG0KEAAxVIbQZGrr/jQDed1Iwzn940=;
        b=LaqaedwaC8kPp/+SJUGO//T/3kYevf1jawMYsUTozvz8hsdITx9KeITmNR6d5LNnvs
         +fM7H5EnjNsBCZRmKYSaW8SnH6foHEY9RpU7lwv5n+Xi2FI8jrZU6wmVleI3Q2fquxau
         6IVkpZgAAdbTzR0oEBaCu923DoNw/66UsurVvfSo8FCubdC0cOKGrmpLblaR3bQc8tcR
         BVLO8+EH2Us38OpZ/QpxTZcAD7Ri3Eq5khxCo3L65v+vB4/wzjR3UJeU0p6744ZvQ9I8
         5LwVRQB0LODWrYeqVz5IMgRErYisn/Ju+FDvy/LUHapPywys0d5MIysAG25i94Ubm3Ja
         jDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777287246; x=1777892046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p4AU8wNCg4sNfAG0KEAAxVIbQZGrr/jQDed1Iwzn940=;
        b=f+6/D2eMjOh2sIIoJnkdW+YkUrsnJP0eUqPhILQsvNSceeexUUWmBpBZKJ1DWeMcG0
         gLRRSNcDJ7pWWGTCI7HUnAOlwEoKkcB+nzVA5/HnFHFMAbsMRpbBeOLlZtth7sgEXWJb
         OoGXEku52subUpadVt78xzi4CQVYV3OdlXng+qoPSA7TP8fP9vaAqrZ4CaBPc1RhkFn+
         p6qq6fiH070KUjfjaTlsZmKwa8+TgaB+8oo+X3ANipcF9K+SgBtB6lTnssGgo/DlACYY
         6RZYwIzHPRE0PGJ/EcQgkcEeWU5CkO2rRj5+Cpe9c6gilflWj5cP6NemM0weV5wt/8kX
         AEnQ==
X-Gm-Message-State: AOJu0YwAfkhH3Xs1m8/TeGReVpHTJZAU/YqgzYYhb6KUjI2HoxqEDQNr
	OB4GsDf5NGAV0avWtMWf/ROH9vyVp+q3nYvDnnPNb3bP3E8X0uSCh712mvwLPirf
X-Gm-Gg: AeBDieufWazTMn05yMAQrnMjJqxyTMBWQSZoDwl2ISMuosyN4A3sl9l2fChvwbLGxBF
	8w5Ue3PVaX6kaadhA9TQZ8BWuMPaKHl1VQuRd16pBR5FPZEymBYxma6wW9mr5394t4QIzb+Ij7Z
	R+a+Vnm27/mA6pWZFzUjYFnbF9lbjBPINBnCQmN3VpDatr2WjvBoTgILH76CKY8oVU3El8Q4/bb
	R3qnFcZFb6phf7NWvSHGIlWI4R8G4NCE39lxSikBjm3NZxpY3Bh3ThfUUsQRzwXXO3BhLRmfqj0
	LPH6lkesGwB6FY+Oqspw99GGUq0i8cyNwDXLnTMKdttpUbijVQLFV+dQsDT3Pn3oh/frsVRfJQY
	r3RuisUkqrUsRns74dv7JUnagikai3FcLaPgxwBKeZ2buVGx3pgUmQpyQQFts/tEPsQimcYfMAc
	SXwfF5KeeuN2AMXCS1aeoRVIVFTJJQIx2fFTUiu6fDpAsRS2RcZ/rLtIaxBRcnh+7b4ZWXc2wO9
	BjA
X-Received: by 2002:a05:600c:3b9b:b0:489:fec9:a17e with SMTP id 5b1f17b1804b1-489fec9a322mr440855345e9.12.1777287245938;
        Mon, 27 Apr 2026 03:54:05 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 5/7] xenguest: Use a single write_exact in write_headers
Date: Mon, 27 Apr 2026 11:53:30 +0100
Message-ID: <20260427105338.99792-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427105338.99792-1-frediano.ziglio@cloud.com>
References: <20260427105338.99792-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1777287247-88CC9161-6415FC08/0/0
X-purgate-type: clean
X-purgate-size: 2202
X-Rspamd-Queue-Id: CE13F471525
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

Reduce number of syscalls.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
 tools/libs/guest/xg_sr_save.c | 37 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 62a39dfecc7a..8c4e760f8d0a 100644
--- a/tools/libs/guest/xg_sr_save.c
+++ b/tools/libs/guest/xg_sr_save.c
@@ -10,17 +10,22 @@ static int write_headers(struct xc_sr_context *ctx, uint16_t guest_type)
 {
     xc_interface *xch = ctx->xch;
     int32_t xen_version = xc_version(xch, XENVER_version, NULL);
-    struct xc_sr_ihdr ihdr = {
-        .marker  = IHDR_MARKER,
-        .id      = htonl(IHDR_ID),
-        .version = htonl(3),
-        .options = htons(IHDR_OPT_LITTLE_ENDIAN),
-    };
-    struct xc_sr_dhdr dhdr = {
-        .type       = guest_type,
-        .page_shift = XC_PAGE_SHIFT,
-        .xen_major  = (xen_version >> 16) & 0xffff,
-        .xen_minor  = (xen_version)       & 0xffff,
+    struct {
+        struct xc_sr_ihdr ihdr;
+        struct xc_sr_dhdr dhdr;
+    } hdrs = {
+        {
+            .marker  = IHDR_MARKER,
+            .id      = htonl(IHDR_ID),
+            .version = htonl(3),
+            .options = htons(IHDR_OPT_LITTLE_ENDIAN),
+        },
+        {
+            .type       = guest_type,
+            .page_shift = XC_PAGE_SHIFT,
+            .xen_major  = (xen_version >> 16) & 0xffff,
+            .xen_minor  = (xen_version)       & 0xffff,
+        },
     };
 
     if ( xen_version < 0 )
@@ -29,15 +34,9 @@ static int write_headers(struct xc_sr_context *ctx, uint16_t guest_type)
         return -1;
     }
 
-    if ( write_exact(ctx->fd, &ihdr, sizeof(ihdr)) )
-    {
-        PERROR("Unable to write Image Header to stream");
-        return -1;
-    }
-
-    if ( write_exact(ctx->fd, &dhdr, sizeof(dhdr)) )
+    if ( write_exact(ctx->fd, &hdrs, sizeof(hdrs)) )
     {
-        PERROR("Unable to write Domain Header to stream");
+        PERROR("Unable to write Headers to stream");
         return -1;
     }
 
-- 
2.53.0


