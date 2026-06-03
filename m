Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h6sYM9UmIGqSxgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6CB637DA3
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 15:06:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QnBhjFEk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1326227.1591683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlId-0005fp-En; Wed, 03 Jun 2026 13:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1326227.1591683; Wed, 03 Jun 2026 13:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUlId-0005Z4-7M; Wed, 03 Jun 2026 13:06:23 +0000
Received: by outflank-mailman (input) for mailman id 1326227;
 Wed, 03 Jun 2026 13:06:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wUlIc-0005NC-0J
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 13:06:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUlIb-00Fz1h-Cq
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 15:06:21 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026cc-5cb7-0a2a0a5109dd-0a2a45078556-8
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:21 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2026cd-229c-0a2a45070019-d155dd33b0e8-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 15:06:21 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-45ef4223be7so3230548f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 06:06:21 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2ec711sm7254825f8f.12.2026.06.03.06.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2026 06:06:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780491981; x=1781096781; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spxFWbMOGnCr2GX6kZF6sxvh96pd56+K0G0G5gXpfUs=;
        b=QnBhjFEkDWqOVpaED0ZYZslpN+wG86yQtnJ12fUWNvxz00W7FqzkAWLVr8c2LA0qUG
         KAcUpJ1ThT6DghAOkfqa82mSu4UsZxHOMcZmEgbrp57kmm+ewW9fhnICWPn2yV4wzFcV
         rgQ8R70MEZ2mZcbRHAr07ZPWx/FDd9ReRAz1sHSAitMpKPbqcTuSZ3OGeTczSOFvXmlP
         rer0LBU0RMSx06e8fZTd3RfTy/CYl+HLe3LaFQfgM7t+QFGuzO4MU17jG1vP3GGerB3E
         73X/nta6aZE1tSgv8/tg0pjLS4D8y3Ipr70nx2BNGhHeFRpvvfrShsa2Y8X5l4XuX5WU
         A9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780491981; x=1781096781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=spxFWbMOGnCr2GX6kZF6sxvh96pd56+K0G0G5gXpfUs=;
        b=W16ewW9uLXGkJST+EchZrsmuYDdCGkga+IIgL6Onk+2lN6yMiTj930CdsGLqR8qeWR
         X+6w6pEhxGpsB69IHy9XWQibwvXAP2VYIWQ45zIDKTp59SXn+sEnJhTdXSoOZ9XyZ/L7
         fzC09pM0cMzkGXn1kecvSWhrGhkZD7gKJuxmi7Csf20AMil5B3WQ1LXwQ90Zr2cdwSGk
         Ek8GWy8n9stEW82ewP2K1pzZGAXhHUyVRXtV5VCn9grykRHarbvzzlbXnv1l7GhpmYdt
         OQcVYSJxx3uDf6O5zak+AMmwPxxWp5VxX/PJhmpxdlWZjUIakLapKmwO22zwZ+rl15Yq
         +t8A==
X-Gm-Message-State: AOJu0YwMY3YAiP14aL1HYNzoH4ItCSU4Q4HFlc7EvinwdORTQZ4qCZ3e
	pOGLufg552lryJ/w46LeCIR8HzBYa6qyqR4+/vaMwCjW3RjYEIECEn1GQIdxABty
X-Gm-Gg: Acq92OENraSQefWv3hV0Wt7P3OPNt753L7VGkaW/zls29vpCeJ1foD/oFzStq9NqCac
	2Q3WBJ2lTkqNSp8m2vxha52puDIZVkIvjmAmGtUYs6YStethT9mi4MfnObg9Ox8U2JvXYtaX5nE
	2d7QO6ix9UceVLNaAOHBsvPX3SJNH2wFXcNCp5xR9XyzTm/gYYkA9qwOH/AELxF1yyoovWxPzBH
	IcNdzEAGo3Ekm2Nb3/ttuf2yAN3PKcNK2So1kVJbrIUplcK159FhmW5fsTh1ySX5hYrTeIpM//R
	l4G5i9hlv3Rx83nvVP5dU+ncrMMRYZn9MlzF2t0vOs+V9Pg9P4tLPJRPgLYkGp0ckQsLx02s24x
	4u0vG52tbT8NzIVlSLxKy5PcbyYXp84VjFvpkgnnKauegUsolSzCdp4yY1fK6ZocYiVBRQ5mdMa
	KheFNsmnd2lmrMtb7kPly0+TYuZU44t6+LetfP/+O3AJ0LZJMQfUgVM1zXanMyBf0+0Sh0PGJdR
	BtEVsc8C/K/Mno5S7HiT+CI0NSM36whaZRZ
X-Received: by 2002:adf:f202:0:b0:460:18cb:8f9e with SMTP id ffacd0b85a97d-460217a78acmr3663962f8f.12.1780491980670;
        Wed, 03 Jun 2026 06:06:20 -0700 (PDT)
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
Subject: [PATCH v4 04/16] libs/guest: Use a single write_exact in write_headers
Date: Wed,  3 Jun 2026 14:05:51 +0100
Message-ID: <20260603130603.776452-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603130603.776452-1-frediano.ziglio@cloud.com>
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1780491981-2887FC48-E54190EC/0/0
X-purgate-type: clean
X-purgate-size: 2250
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
X-Rspamd-Queue-Id: 7E6CB637DA3

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Reduce number of syscalls.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v2:
- change prefix in subject.
---
 tools/libs/guest/xg_sr_save.c | 37 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index 62a39dfecc..8c4e760f8d 100644
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
2.54.0


