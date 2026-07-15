Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KdBvFCMnV2pFGQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:22:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A7775AF57
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:22:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=FN1vGwOW;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1362692.1614488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjt0d-0002Ep-V0; Wed, 15 Jul 2026 06:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362692.1614488; Wed, 15 Jul 2026 06:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjt0d-0002C1-QJ; Wed, 15 Jul 2026 06:22:19 +0000
Received: by outflank-mailman (input) for mailman id 1362692;
 Wed, 15 Jul 2026 06:22:17 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wjt0b-0001hP-AR
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 06:22:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjt0a-00Chgm-Gk
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 08:22:16 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a572718-2eae-0a2a0a5409dd-0a2a4503edba-6
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:22:16 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a572718-fae8-0a2a45030019-d155dd2eac99-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:22:16 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47122683cf3so2817079f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:22:16 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4635a63esm14336663f8f.9.2026.07.14.23.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 23:22:15 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784096536; x=1784701336; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xqQBYkVwo2VphdJUd/assmMfM7KdXYOfGeEjL/ARnds=;
        b=FN1vGwOW9ng01iDhG3JuZsfAiN9wOZRRmYL1Os//DxCZelirAIr96D/i0Mygml3TmZ
         8CoN66gl2oOrs3ZR4L1+Uhqk9rvoYKvZwdQlFpFZsJFNKd7841f2pZ9FHvotUhq4dfI+
         dq6pVfrtmCz6SKGj4GqB0QY1C2P0pz8haSM5H7HFtlomrNM7Q1Ox2viKDAiWg93/ojN3
         JSganAN1Xqx1tsQge/4U2SMrGZNiA5JyvL+la5ULK1zTEase6U27Q+Px+xW49VDZD8sd
         G8UNmpmm4sqclDiiTRscw4L9V1r4mEKDleAptSGDy6OSX/ezGVKmFmYLXeQNdt1f/brR
         ueCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096536; x=1784701336;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqQBYkVwo2VphdJUd/assmMfM7KdXYOfGeEjL/ARnds=;
        b=DDKL6N/cUd8sNonwBqXGeuvKIOc9qVUyyAQM8MTGGI0SE6pSMo026NOkhoE4U/poJo
         /tuaElZvgLZiIK2BvQgSuUZjGvmbJw9ytUJqlFb5BswpxfHNPJ4dt6ogolDxzW8aXPi6
         To+pqQPRVHvpiBJBLSHKN0oZ8trQra26nSJaPdXtvGrKahQyLouEtoaNycrW6jy861wH
         Cq0SdlYk47IhPnm2/iXcrEoUxfBBMIw1TUavgYT46mf8bHwUDaxz/T9bvySN7GjmiedV
         wOJBsfEPO1lySLXWJZo9nKmKRvp0rnBx+Fc0qPiv2Ck17NVgxhGf2ij7Zpcj48HaZ0Az
         j9ow==
X-Gm-Message-State: AOJu0YxRrA6Z2RKtlpZ3qqz9TECMGhijk2l080Bbbnxjxp0SOWQ//J1/
	tHb1Y663CsVblkuoyKl+nFwTHaub+K8w+RZ3bPIe7AAV1mnzBTlnQnmPMcFZY+wC0Sn6Uw==
X-Gm-Gg: AfdE7clJSFoWM5FbPzvyrakr/RmeLU6bQMR1Ur1yNhDJw3WMQ5tJQ5Cr4jIZ6sYBcpi
	aNUEl+5A/wp9PZmhA2dVS2Nf9cFQs1JH/YwBQfsIdHEf3IEPkjD+gyEJIBrtOa7v0ldQu4tobZD
	jQyInkikD+uAVDBlXXAkKMnX9XPaP8HktdsBKb13pKsFC7wUuRIzTV8QlCWRBeTn7026fhVLpj4
	25ShKNnf8m5dPyWWLRbwhIZZVBy4Nv9HSbEfaQ3f0u96PuVqJDstcboUizalEShUPlijWhaY+Pn
	MvcRGiqe/CKWFOdof56qM5h4g3mtujlvM3FKBY7NhEyCd3iiIlV/ajjAuw5PwvtyiPD4faJMWGi
	Juo9ZJpXj0Jr5xNpaERb1ctrlWEZu1EgTtir27C4QK23Dwo3OJEAqPhg8macoez3zEoEv+H5Tsf
	Gn3ARJVhW8usL/dPkvPTjI7ubYBCTeClSa6XuUtOX/oWEAWUBW5eWdB0toTQCGdkKgv2PyrRGmu
	gv8q8muuSNckNauj+M=
X-Received: by 2002:a5d:6843:0:b0:475:f0f0:9ef8 with SMTP id ffacd0b85a97d-47f464a4887mr5853955f8f.61.1784096535856;
        Tue, 14 Jul 2026 23:22:15 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v8 4/4] x86: Split .init section to satisfy UEFI CA memory mitigation
Date: Wed, 15 Jul 2026 07:22:06 +0100
Message-ID: <20260715062206.328049-5-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062206.328049-1-frediano.ziglio@citrix.com>
References: <20260715062206.328049-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784096536-6FCC34E9-4FF0E265/0/0
X-purgate-type: clean
X-purgate-size: 1904
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2A7775AF57

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


