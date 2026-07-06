Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +A0iOCx5S2oTSAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:45:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9575B70EB9D
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:45:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Du9o+Opo;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355211.1609974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfsY-000752-5D; Mon, 06 Jul 2026 09:44:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355211.1609974; Mon, 06 Jul 2026 09:44:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfsY-00072q-2Y; Mon, 06 Jul 2026 09:44:42 +0000
Received: by outflank-mailman (input) for mailman id 1355211;
 Mon, 06 Jul 2026 09:44:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wgfsW-00072R-PI
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:44:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgfsW-002r9l-63
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 11:44:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b78f9-5cb7-0a2a0a5109dd-0a2a4501e532-28
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:44:40 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b7907-400f-0a2a45010019-d1558032e014-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:44:40 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493d92b7db3so10932495e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 02:44:40 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccd9d620sm283605205e9.1.2026.07.06.02.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 02:44:38 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783331079; x=1783935879; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgcFpTg0M719DUSQiohUXmyN6KV71kHNHsNKWBm10go=;
        b=Du9o+Opo/JUFynOCIYBoe0aFnMF3ZylARjZetlDz5zilFHKfGg/2hSFrOhn/YKmP56
         l7XkSeFYrcV59Th6e6RO3/7BBxQIG4XogsuH4gQHs7E+lpWW5mt9ZSK7PVYT34cScnGX
         m56+gg7jtHV5B9fsznBrfIpdzIl5PtDhn9HVHKPWFVw72chzfPMcZHZ1cFJ7ojSdQ+Au
         N4DQAWZZd5098xplX2TP9Z9jM5vNiSgJ35PV9HPVZgeuMM0pBQcbt90ZUIEBy8nvLjy+
         xRe+ULuMHtVCH11MdRb+INgxUQGW4m5fyzSnCy9dBrC/xPe/8CR3CqME9B9QniBwdEjB
         tSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331079; x=1783935879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EgcFpTg0M719DUSQiohUXmyN6KV71kHNHsNKWBm10go=;
        b=lrWE0nkPsgsQLiA5ugcBMw6DZOA/z6MVrHObsqRnUDUO4Oi+6Ce/XumJO5oNrTLf/9
         FDCHpRbVOKAUVfZ2CyhXfRYRaehZ0yWw4CnwcHyiP7NQ8ly3HrZO1cbEqRyu5qhSgvDn
         zqV3LI8n0VyQOuso75lqnTim5d92LwBFX1D0oRrOsLsXXBlebCNhZWNVu2nVc0MaAenD
         VFOZNInMZ0d2IxmoPbxRmsGgRfOO0NDFGI/JNrVMAywtpM5up6vqvXuXR+dkPqHXuZHP
         6P39VW93U1uG3A6M9aTNFEPNyTiuoFF9FlAc32AYLSEcO7vjs6gVYDGyULcqvBWuWLT4
         ydSg==
X-Gm-Message-State: AOJu0Yz/lvO5HdKaMY1dHgtAK0X+LASUqw9TL/8EnI8l2Fe1K5afaEYJ
	NISQ8G93bB9osENA5AOJBTLdhZsemnx29zMxPGpRPBcvkjZh1nTXFMabC1hbhPedX2U=
X-Gm-Gg: AfdE7cn8mgqqfofz4LMRIXKRAK9MBewmdXOps0T+GFHQ7A2SpU/llkaQdpS/TpVPvPN
	n7almMx69N3YnNxRyadzY3OX6Fr+MA6CeuzrCOYpsv91YWpSMWuw8Ea5VTD93FASQCC+0772bOP
	ROzRPoiJgLmX0LFYnYZNFN/8F38RhmIbGeeFUBW7uqym6RrFbXL1DCBNxOHYIjS5nk08r8IZsOG
	No70qPXV9aDhNMFKf67XJmlRggPASEg39HJ/9K+EHaAfCVmRKTzZBcKD4RD26uAQqc3Dy6lb60C
	nwDGRNcx6ErmBZ8feSNyIiF2jgBqapTHBzVfrMt7sePkbuZ0O9Gv3Ddo5nc5a2fwGwySplNCkXV
	uYId/s54TgIi7bksFtC3V4s+kWKpkSjnjXi5xtsABhF/gEEunDJxl3Elx5k1LAO5N7JXKfSb4L3
	epQTzL7fvQp2wcRsAcbjA6+giVOtjxZ8CV2uV5erW8AJgK1DUh9ppuuivuo312MhHC269dQB1Sp
	Ca/eszd8xj6U+IfVB0=
X-Received: by 2002:a05:600d:6401:10b0:493:cd3f:d051 with SMTP id 5b1f17b1804b1-493d11f03b7mr80054245e9.25.1783331079285;
        Mon, 06 Jul 2026 02:44:39 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v6 1/4] Align relevant sections to 4KB
Date: Mon,  6 Jul 2026 10:44:27 +0100
Message-ID: <20260706094430.427155-2-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706094430.427155-1-frediano.ziglio@citrix.com>
References: <20260706094430.427155-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1783331080-818D81E0-473B6DAC/0/0
X-purgate-type: clean
X-purgate-size: 2076
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,cloud.com:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
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
X-Rspamd-Queue-Id: 9575B70EB9D

From: Frediano Ziglio <frediano.ziglio@cloud.com>

Required by UEFI CA memory mitigation.

It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
in the pagetables.

NX_COMPAT is a requirement from shim-review,
https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility

Sections with different permissions must be in separate pages.
In the case of debug sections they are contiguous and have the same
permissions, including the immediately preceding .reloc section, so it's
not an issue if they are not aligned to the page.
Before the .debug sections you could have the .reloc or the SBAT section,
either are permission-compatible.

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
- Change subject.

Changes since v2:
- Improved commit message and subject.

Changes since v3:
- Added Acked-by;
- Improved commit message.

Changes since v4:
- Added missing comment;
- Added Acked-by.
---
 xen/arch/x86/xen.lds.S | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index b9e888e596..8e63cf5bc2 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -162,8 +162,8 @@ SECTIONS
        __note_gnu_build_id_end = .;
   } PHDR(note) PHDR(text)
 #elif defined(BUILD_ID_EFI)
-  /* Workaround bug in binutils < 2.36 */
-  . = ALIGN(32);
+  /* Align to satisfy UEFI CA memory mitigation. */
+  . = ALIGN(PAGE_SIZE);
   DECL_SECTION(.buildid) {
        __note_gnu_build_id_start = .;
        *(.buildid)
@@ -330,6 +330,8 @@ SECTIONS
   __2M_rwdata_end = ALIGN(SECTION_ALIGN);
 
 #ifdef EFI
+  /* Align to satisfy UEFI CA memory mitigation. */
+  . = ALIGN(PAGE_SIZE);
   .reloc ALIGN(4) : {
     __base_relocs_start = .;
     *(.reloc)
-- 
2.43.0


