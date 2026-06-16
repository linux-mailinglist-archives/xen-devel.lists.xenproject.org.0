Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yn8fNNiHMWo1lwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:28:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625846932BF
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:28:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gFvFiyRb;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339509.1600744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXaa-0005Nm-VD; Tue, 16 Jun 2026 17:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339509.1600744; Tue, 16 Jun 2026 17:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXaa-0005F5-Pl; Tue, 16 Jun 2026 17:28:40 +0000
Received: by outflank-mailman (input) for mailman id 1339509;
 Tue, 16 Jun 2026 17:28:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZXaZ-00051J-LO
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:28:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZXaZ-00FwMQ-1S
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 19:28:39 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3187c0-2eae-0a2a0a5409dd-0a2a450cbeac-10
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:28:39 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3187c6-62f1-0a2a450c0019-d155dd33c199-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:28:38 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-461a15bb819so860527f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:28:38 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-461abb44c3dsm5012754f8f.9.2026.06.16.10.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 10:28:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781630918; x=1782235718; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBtC0geG/tAfPA7o0MJitiKqtMfuEi6dV5S/o3JXoz4=;
        b=gFvFiyRb/zSgj3MpUgRJS1rO9P7Z11MOrqO/vOoXr0EXJQVpji2Lp06lrF9wb5R3f4
         Dm8wKPVTsYMFMJYs29Fal6mgtInqwjSs2wEWO7dZq3s6DZQ4LCp55KReBcBPrT8vJXLu
         b2SSS1NRZcKq8n6gDv3tlZKsQJdM0Ws2LJih02Nu1pUal6Z6O2bbCFoXqoRjVvZYcL6+
         krR0KgNquBtdGorfGaPHZcdGkfS54VnnPc6fziUk14vFGOYZnjVDxTgKLLUlyuvc1uMy
         NZa8cWH8jcxF7pSApIxo1xChlax3yWfjysgzr1yZ3O1PZLuJVJoL/ZRq1DT1qW+1oSmw
         0Zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781630918; x=1782235718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gBtC0geG/tAfPA7o0MJitiKqtMfuEi6dV5S/o3JXoz4=;
        b=ZXpTmTuWgkAbfihCb5NPsWzfkNM/9eH+SJVdeEf7EYmse1qdDlF5vrxbV8z+a0M4UL
         vpjHEpOkDwE9p6Z7LNewqdpRz8BMOo58XXqcH7mYequSlxotLqr6bzXnu4AJ80mIG5wl
         8lEu8SjTpy0aE+phLx5EL9UK1lMceVhkA/R6hi+tU6oTm+Z+bcqEzl+m4hI8rHMRMAjx
         RRZ7dif9ja64Uebtet9EPBg/u3Q/ILCvyZbsC7w82eqeK8xwZ3icmLMm81bkQfchEQkD
         BdlVUz6bZ1T77ioYwa9R02M+m7pwrtfa8fcnWrd4S5Oej92owRa8U5maEzwcXetucCqq
         bn8Q==
X-Gm-Message-State: AOJu0YwLKbbjhf0qnPZQJxcgCHZ9I09H4PY9yFmqHjIz8rLtEJK782qB
	QcS45gj0hlXcinnlTBmm6/H8EJQVD3dFPGBElri7Jq+R03jVxuNXsiduWQARfeYo+KE=
X-Gm-Gg: Acq92OEHiFrY6OfKztjpbuUMSHUGyo9BAyMUJW/975u29CIQCSuQjywA+9nEIMvboS0
	yMiDbzAaXh/aW358FxvQv0Xda4r9YiNo6vGAhKZlVIhJnbNDyc1CRuy1ZJ7cVPUrMC32R+RqtxQ
	Jp5CNSBBXFFOjwKIP3Fyk2mvOv10pTwY7ARn1rcyTHcaU7c+8yqlaeZpETueScLVUOMkdsecIxn
	TQFnhfXCSOKD5OYB4vUYRBTvG/WGMDm5u10zBFXBsApT3GtgRbAB1gIfRvc5Sba17s1SF4DYDyp
	CbW+HkzZftk3hOwzIKDNy3m9iW2wqL0LeHLedJjuG/rmgjlYVIduUavziD5zyX4UbgHudFgiNbX
	yCdBi3wmoZVK1MsTHDlpjIY1ADQGntooh0qYqzmjEUjgNojnwzhomaFDFCPXVCOnmRqCTHykeGy
	6gh+07N//uymVIWf20n7l/njtOhnAjfgS2F4wqhFO17sOKsRyd1kgZeWPV4tXFHCFrRfwYOBAGQ
	xfDCJSP/VwtQc7wkOxyGddvv6k=
X-Received: by 2002:a05:6000:41e3:b0:461:9459:874c with SMTP id ffacd0b85a97d-4623fe7ddfdmr468263f8f.19.1781630918303;
        Tue, 16 Jun 2026 10:28:38 -0700 (PDT)
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
Subject: [PATCH v4 4/4] x86: Split .init section to satisfy UEFI CA memory mitigation
Date: Tue, 16 Jun 2026 18:28:30 +0100
Message-ID: <20260616172830.111393-5-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616172830.111393-1-frediano.ziglio@citrix.com>
References: <20260616172830.111393-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781630919-F5983CF5-CBD32945/0/0
X-purgate-type: clean
X-purgate-size: 1873
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,invisiblethingslab.com:email];
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
X-Rspamd-Queue-Id: 625846932BF

From: Frediano Ziglio <frediano.ziglio@cloud.com>

Currently .init section is both writeable and executable, split data and code
to have 2 sections satisfying W^X rule.

It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
in the pagetables.

NX_COMPAT is a requirement from shim-review,
https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility

Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
--
Change since v1:
- update comment style.

Changes since v3:
- Added Acked-by.
---
 xen/arch/x86/xen.lds.S | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 749d9719cc..8fefda1816 100644
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


