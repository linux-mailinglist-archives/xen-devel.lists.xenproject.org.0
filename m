Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 59ncHZSHS2oaUwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 12:46:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0415270F702
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 12:46:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bL2qnVfw;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355305.1610102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wggq3-0003Jy-Ia; Mon, 06 Jul 2026 10:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355305.1610102; Mon, 06 Jul 2026 10:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wggq3-0003HZ-Ej; Mon, 06 Jul 2026 10:46:11 +0000
Received: by outflank-mailman (input) for mailman id 1355305;
 Mon, 06 Jul 2026 10:46:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wggq2-0002ch-0b
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 10:46:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wggq1-00HA6J-DT
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 12:46:09 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b876b-e002-0a2a0a5209dd-0a2a4501c908-14
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 12:46:09 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b8771-400f-0a2a45010019-d1558032e1f4-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 12:46:09 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493c83474ddso26424155e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 03:46:09 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63ba97csm349823985e9.12.2026.07.06.03.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 03:46:08 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783334769; x=1783939569; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ia93IaiRGnVFsVP6/iZrBYXvaYw/rZ06cLV16cU84oM=;
        b=bL2qnVfwcZJ+nmzugoVfEsDe0ytVgSdT0xg9GvcGl02/kuvCWbGAczdqU0p1XTfrI8
         ApwuedtLgDV9Toyx6imse19CxjRwwp/4nmz54BxvK/pEH58i0v+p0vihyXUQqBTF9v20
         KvBy7QaojIsyY3TABb3qsftPpkbQ9TKTY0sueEqxa3wJAMGQ79XA5q6WR0EhTY3kQtT9
         wP/K2bI78VDV0+QvJZdoZ862wZ4VymTBe4LFYI98qeX5/o7d6cmuMzV/76QwFKeipiPg
         PsBlW1MelgsWLgmvwg6+H4IYfgc1MSgZzVTCLeHDAiXH+qR51ZYxLi1RKJH7kGZVEnYf
         KrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334769; x=1783939569;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ia93IaiRGnVFsVP6/iZrBYXvaYw/rZ06cLV16cU84oM=;
        b=b/Id4pi2U/je3R8Id6vZ2PkyLoizxVkQOHaQJHVpGrySfOcpTV5UpT7mbtKsP6fp0C
         3QXBWzU3+ipkteAP3HDKCkng4zuqWTuBJy+TMpnn8WQoPYM2XNs09MTqdfZFuuzUFjNh
         E211riUHHm6NCjAUGpl4usDxqmXSUM/XTRoeVLIGLt6NCc6S7gheh9XMHfwA0PP5hroi
         soYwRYmF3nlYdmC5IZX53F5QvWggXztNr2yGyf92PcX6mJnhBS5JNhDqk+fNu9EGtfVz
         y8D1zIMId8xFB82Zh9vGN5W20I1sQkEFTOH0vD8Ob1GAUeBt6XVwXRyh62XM3YSTmO1S
         L1fQ==
X-Gm-Message-State: AOJu0YyHN8w0BLRSVhVIDB5dp7vBt7AYTrvffniIc6grvNSwTId1YUuz
	sCXRNaL3KUO3dalcARQ8mOiqpC1GE2n9Jn+wuPwumylHW7J4wzY81UB7Ly0BO94dBDY=
X-Gm-Gg: AfdE7clpLDTlgz2zlMKGYSxQHseczWymL7Ei/jVqxUTuwsWfHtXXaDVUtoos7Qd0+9c
	kYGEw3PyfLPtm+rqh2VhvRsE5pcVriqL69q560umetucflF11IAPV+rz+64kkAdUpUjXE3MnQ2E
	G91AyTVRA2Z1nOF+82DZqhK5E5wuwYlEtk7exdNXR+I64qzlRHTGnQ/ts9eNmq+dDVZgJALjvC9
	P9f0spSlPCWk8DVxznaHT/cew4o9NHnIZDzAbyeoghV2e1/JY13sdRWJeB6CK8QsAV/DNJ9T4Bx
	SSPSvmd0f1pfrWk3KpMY2DnBnFFin20Qt7+ujfCLVcx48ZgrJe+7RruslbvMNQYzRTAWBDaQlqC
	yiM+U30/tWwV2XMDgAY8tTmaTN13F1MZWwoFc+K/q7GCL/HOBsZq+1Ga2rVCp2/uf804YfhDLg9
	pVjSr01qFwAd0cQFvHT2puZB23v6+y/xHE7zyk63gOxmY3npAjVY1PQLsgN7DV2ijEWGnlj8gHO
	Z/YVFCBsWne3zEsCs0=
X-Received: by 2002:a05:600c:2282:b0:492:5bb6:6d4b with SMTP id 5b1f17b1804b1-493d11fb775mr86459585e9.34.1783334768506;
        Mon, 06 Jul 2026 03:46:08 -0700 (PDT)
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
Subject: [PATCH v7 4/4] x86: Split .init section to satisfy UEFI CA memory mitigation
Date: Mon,  6 Jul 2026 11:45:57 +0100
Message-ID: <20260706104557.430097-5-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706104557.430097-1-frediano.ziglio@citrix.com>
References: <20260706104557.430097-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1783334769-82CC61E0-829AF86F/0/0
X-purgate-type: clean
X-purgate-size: 1957
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
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
X-Rspamd-Queue-Id: 0415270F702

From: Frediano Ziglio <frediano.ziglio@cloud.com>

Currently .init section is both writeable and executable, split data and code
to have 2 sections satisfying W^X rule.

It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
in the pagetables.

NX_COMPAT is a requirement from shim-review,
https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Change since v1:
- update comment style.

Changes since v3:
- Added Acked-by.

Changes since v4:
- Added Acked-by.
---
 xen/arch/x86/xen.lds.S | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 4ed1d2bec1..e26e37db13 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -193,11 +193,7 @@ SECTIONS
   __2M_init_start = .;         /* Start of 2M superpages, mapped RWX (boot only). */
   . = ALIGN(PAGE_SIZE);             /* Init code and data */
   __init_begin = .;
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-  DECL_SECTION(.init) {
-#else
   DECL_SECTION(.init.text) {
-#endif
        _sinittext = .;
        *(.init.multiboot)
        *(.init.text)
@@ -210,12 +206,12 @@ SECTIONS
         */
        *(.altinstr_replacement)
 
-#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
-       . = ALIGN(SMP_CACHE_BYTES);
-#else
   } PHDR(text)
-  DECL_SECTION(.init.data) {
+#ifdef EFI
+  /* Align to satisfy UEFI CA memory mitigation. */
+  . = ALIGN(SECTION_ALIGN);
 #endif
+  DECL_SECTION(.init.data) {
        *(.init.bss.stack_aligned)
        *(.init.data.page_aligned)
 
-- 
2.43.0


