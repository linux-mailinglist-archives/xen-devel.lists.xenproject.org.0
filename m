Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Bg02IUHQLWr1kQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3511F67FD35
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 23:48:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TKYyiPfE;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1337555.1598844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWD8-0001bB-IU; Sat, 13 Jun 2026 21:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337555.1598844; Sat, 13 Jun 2026 21:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYWD8-0001UA-DE; Sat, 13 Jun 2026 21:48:14 +0000
Received: by outflank-mailman (input) for mailman id 1337555;
 Sat, 13 Jun 2026 21:48:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wYWD6-0001By-R5
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 21:48:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYWD6-008PGn-8A
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 23:48:12 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd008-5cb7-0a2a0a5109dd-0a2a4503cafc-6
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:12 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2dd01c-672d-0a2a45030019-d1558036c0a3-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 23:48:12 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490c1915793so17459295e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 14:48:12 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492202edf89sm113877065e9.1.2026.06.13.14.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2026 14:48:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781387292; x=1781992092; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4nbEc3Hba3N2KI3dfDDijdsISWgf8o8baaY4LyLZGQ=;
        b=TKYyiPfEpiOm1eXe2WqqNcTigQxahHZW5RUxQZC7S6C1E0LPVmUn7ILQ+lZaAFhhTM
         Xq/lYPY2xxRO2GVYZDSlR5+aIy3rbjVlxawcSs66X0/jU2HxCmCGK8TiaccSL320jTV3
         QjRzGMRazvHVUyPQD41G+HBRrlZOVIb/cHxnfYNc/LrUPn7rW3q+GQvPujgu1ord8Bbv
         Nh5MvHYrBQSnDD4tOE5MEV0E7wL7DSKos3OtoWL3pFewREYprE5tgLIZYylsorSGU0X3
         YLhmOFbheW6+99OxJIfqkGO4Mffrb0xOK9hmPslXbTNWaMh2a1IOV1TiX2sK3gMgqCe7
         Ck/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781387292; x=1781992092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D4nbEc3Hba3N2KI3dfDDijdsISWgf8o8baaY4LyLZGQ=;
        b=CR/LllSrXC2RhOqO9iiR3f8KBaQKj7db4uPes6az2RXnTSPW2xNH4jS8jz5MhVVgEl
         khT0nzaRVvSzvGetq+vPhoavTxpNjSYXawzjcE0cOrnlKuExb5HLsM5RT+KX80KeVytg
         rWIWoIlJpSCeAbbIrzCVmN1Y8ZWG4U0iDzErK8LNHyx+8jEpL61q9Mvk0RfmBuMsvdbL
         8SvFSpzfgdLcA9pNv9ostsI+JgSkdW1jjTfQDAa1toJeusqGg+liRpR2VAwFzm2UYOJe
         qBuBXR93b34ZyJ2vAb5pnK4HOMXKq/iXxNsH4lWvtW/Jvjf/V/rorjcK4RAKrQxUK4Ok
         DVsQ==
X-Gm-Message-State: AOJu0YxwydD7i/r/uFbPCyTzoqgUw0p3il7/ZUkYcQiCRu5ExCr8Y1TP
	MmTefZlgfBjIZx+WIiJBoVg/7OgcLeCoGQEzmL8gNYb/3D3/gC8KvAIH+nIIIzEHsE4=
X-Gm-Gg: Acq92OEp5r4i3siKypzU/5F33jC6ftsQ5XOKi3eSx+a9P+QWJSPTQDKMVnoEzMxpCs4
	v4p9yEHzgLFFLQAuJIaWgAjBvvrXR+sfr3tSUZXUmHPo61hUX0/3/Lx3jLeQ/SDxtlA0enHLy8v
	bvWF2ulIdqf4+FX8L2fy/vSQknCYFmfCuyUlZJh5A1O5R8gva9e1yuhZ1v46ptbUXilfcPRHALI
	eM19oKyQ0sEh09O3PPs3twwCTeBBRG4TATxzp0HwOMjjX4RCFK+3g2202toswD+UoNiX2HXt0wg
	QY9Jv5VLzB+RE6UmtsFCaQHHw7qDzh6v81P3vDwTCWDPCbE2ODNRNsGNuFvaNb0ml+KCGHJdxFa
	Jy8vbUbRQdXO9ogf6lAeHnzYrRWUBIhfuz/ZTH3j6cL8puh48LwA9mI1RcrvZN67J2umuD7eF8q
	y5uvPaFBMkqFeKjRncicJOodHPTahSrQuATXxYzuupY4I7wzmeRPDMxKixvp0vTPtxVaUZlUuca
	DvySXK378U1NaF0HyoTMgjetQ==
X-Received: by 2002:a05:600c:3585:b0:490:b642:ce29 with SMTP id 5b1f17b1804b1-490ec4d4f71mr110120395e9.8.1781387291641;
        Sat, 13 Jun 2026 14:48:11 -0700 (PDT)
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
Subject: [PATCH v5 04/16] libs/guest: Use a single write_exact in write_headers
Date: Sat, 13 Jun 2026 22:47:37 +0100
Message-ID: <20260613214749.20620-5-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613214749.20620-1-frediano.ziglio@cloud.com>
References: <20260613214749.20620-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1781387292-40E68938-4E91282B/0/0
X-purgate-type: clean
X-purgate-size: 2454
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
X-Rspamd-Queue-Id: 3511F67FD35

From: Frediano Ziglio <frediano.ziglio@citrix.com>

Reduce number of syscalls by coalescing the image and the domain headers
into a single I/O vector array.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
--
Changes since v2:
- change prefix in subject.

Changes since v4:
- added Reviewed-by;
- improved commit message.
---
 tools/libs/guest/xg_sr_save.c | 37 +++++++++++++++++------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
index eba33f861a..8c31f9f86c 100644
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
2.43.0


