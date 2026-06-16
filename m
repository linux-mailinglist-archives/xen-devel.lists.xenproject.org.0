Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pV2qAeshMWoVcQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:14:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC1868E0F0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:14:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Tvxrh8lc;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339037.1600160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQnl-0003oU-RQ; Tue, 16 Jun 2026 10:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339037.1600160; Tue, 16 Jun 2026 10:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQnl-0003kH-ON; Tue, 16 Jun 2026 10:13:49 +0000
Received: by outflank-mailman (input) for mailman id 1339037;
 Tue, 16 Jun 2026 10:13:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZQnk-0003Vl-2y
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:13:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQnj-009AuV-G2
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:13:47 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3121ce-e002-0a2a0a5209dd-0a2a450ce268-32
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:13:47 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3121db-62f1-0a2a450c0019-d1558036b8b8-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:13:47 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490b7866869so44860905e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 03:13:47 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea94f5b0sm295160265e9.1.2026.06.16.03.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 03:13:46 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781604827; x=1782209627; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOWAHlvQ+YJJWAhAsIp9IubNkCtKgClYad2d4nRRdf8=;
        b=Tvxrh8lc3i2W8ouLvmQOav4at5VaSlwtgAUOF0PoJgSgaosnsMUkpa6GdxkbxF6HvB
         b29+astsAAICWPaARk2khz/jy82tYVaYtwWkzPT1hvRgO9OGmURR/R1aiMAF59F7AjYp
         ZTxAavcb9TGrtHCr01v6XuOQLUMAha/nPZdpYUyaYm8x+BTlWW0cKDzvktcMs+Hs6PxN
         1fl16YcyLkBS42uR1YauxuEI95rM4gUnlx4Y90TfIulh6ouLBFeXzVSh/rPDwRCBV7Dv
         MqongXKBKJATu9ElfHmd6ELVa1sNW+yf2Ix+JeYvq5jkz/+jLPCaHVCb48f85E2au/1/
         qFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604827; x=1782209627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOWAHlvQ+YJJWAhAsIp9IubNkCtKgClYad2d4nRRdf8=;
        b=FEmZpdPsrW5kgwwIyFAhsqKgoKdBk1tAuUiWkOA0gQRfl2gwR3m72/r7K+h/7UwPgp
         mL/ELCs/a6TCDChb4Q8QjRPyVamB0L+NcU2tMEll0Yc7KkMxda9hPmDJhBAYZ9g1RuUH
         iRLdIoVPPcAWTtpYDA3+xOZqtMfP7VTINEIYOYSqzOeT4fkVq0vv38wqYB7JyaJu9/o3
         luJB6rr5MIwWjX67BKLgXQs9BnkbDrkvypQnUlNEG+QT3qjJak9iaJaFxASyyw3EtSWN
         1fsqZptzkbsl2HTHpsJqAjCul3z4eMgLJ7+RRBqrm24bavyGtwggrhCNv1RZe0uk9UYQ
         ApLw==
X-Gm-Message-State: AOJu0YzIBWARU24eaD+ysi4XYSMFQPyzlrKzK5eWR/+aphqjfftk6xpz
	G/jJaYntUi9na4MNooaFhToU/W+Gqba3UsY1Ldv0LFMplFieij4wrbFNjliAMV5zWkU=
X-Gm-Gg: Acq92OGsyQHnAPD/Y4eEW4kg9vAMb8QBuc9JC1W7IteTcTLRYlFPgijOzScNSBXl5Y/
	zl/dm08taMEGImBIz95GzoUdLem29HagoWCVaOGzDot8/7rBsAI9SYn1V6loXmKZUEhhKgi4/Xi
	dorij7dROEhbRQSgs1dEilx9KwpzlXuoTa7cgXlwXaMKHiSFAVBfRYU2OMxqPeLcvdPrQbDR/Xi
	wkG3+ijcaP3w5PiifnV/y57kJZpjNlZIBxQ/bk0Wy4OYUkPzl2HAcc+hC+jrMKlAXGHTpv8K1j0
	DiEcAhMqC3jur2lIBEYTlpm2+jDacOAVfTGaXlbtyYp2Yzcm9b/TuODLfNTnqxm34eNxO83hNCT
	Ibr8OIccVYn/45xWBMRH3leuKZQotc/oyylXj0hlHBFC54ap04TmOFz25egUh/RVzjkCvcGxHq1
	P7lLngOOEtfgxjUexGlcWBK92TBoTNmmUNn7N16Ych0LzkPQmL7s2G1bU3nPTa9jVjRX77Hj65o
	7EjApAsGE92Ya4BJJjH5Q+AxfE=
X-Received: by 2002:a05:600c:8b86:b0:491:91cc:d12d with SMTP id 5b1f17b1804b1-49191ccd322mr215094085e9.25.1781604826714;
        Tue, 16 Jun 2026 03:13:46 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v3 2/4] x86/efi: discard multiboot support for PE binary
Date: Tue, 16 Jun 2026 11:13:34 +0100
Message-ID: <20260616101336.44009-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616101336.44009-1-frediano.ziglio@citrix.com>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781604827-E1161CF5-6BC97658/0/0
X-purgate-type: clean
X-purgate-size: 2917
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 8FC1868E0F0

From: Roger Pau Monné <roger.pau@citrix.com>

Multiboot and PVH booting are not supported for PE, hence discards them
in the linker script when doing a PE build.

That removes some relocations that otherwise appear due to the usage of the
start and __efi64_mb2_start symbols in the multiboot2 header.

Section discarding is not done updating DISCARD_SECTIONS definition as the
change is specific for x86.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
--
Changes since v1:
- improve commit message;
- change section orders to avoid changing code order in final executable;
- merge 2 commits;
- removed deprecated documentation section.

Changes since v2:
- Update commit message, join 2 sentences together.
---
 docs/hypervisor-guide/x86/how-xen-boots.rst | 6 ------
 xen/arch/x86/boot/head.S                    | 3 ++-
 xen/arch/x86/xen.lds.S                      | 5 +++++
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/docs/hypervisor-guide/x86/how-xen-boots.rst b/docs/hypervisor-guide/x86/how-xen-boots.rst
index 8b3229005c..b6d852050a 100644
--- a/docs/hypervisor-guide/x86/how-xen-boots.rst
+++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
@@ -82,12 +82,6 @@ When a PEI-capable toolchain is found, the objects are linked together and a
 PE32+ binary is created.  It can be run directly from the EFI shell, and has
 ``efi_start`` as its entry symbol.
 
-.. note::
-
-   xen.efi does contain all MB1/MB2/PVH tags included in the rest of the
-   build.  However, entry via anything other than the EFI64 protocol is
-   unsupported, and won't work.
-
 
 Boot
 ----
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 77bb7a9e21..90faf411b9 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -152,7 +152,7 @@ vga_text_buffer:
 efi_platform:
         .byte   0
 
-        .section .init.text, "ax", @progbits
+        .section .init.multiboot, "ax", @progbits
 
 early_error: /* Here to improve the disassembly. */
 
@@ -710,6 +710,7 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
+        .section .init.text, "ax", @progbits
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index f758940674..749d9719cc 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -57,6 +57,10 @@ SECTIONS
   __image_base__ = .;
 #else
   . = __image_base__;
+  /DISCARD/ : {
+    *(.text.header)
+    *(.init.multiboot)
+  }
 #endif
 
 #if 0
@@ -195,6 +199,7 @@ SECTIONS
   DECL_SECTION(.init.text) {
 #endif
        _sinittext = .;
+       *(.init.multiboot)
        *(.init.text)
        *(.text.startup)
        _einittext = .;
-- 
2.43.0


