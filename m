Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fSM+DIhyPmosGQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:37:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE616CD0EF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 14:37:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=rfE+i4Xe;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346122.1604658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5nw-0004Z1-J5; Fri, 26 Jun 2026 12:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346122.1604658; Fri, 26 Jun 2026 12:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd5nw-0004WI-Dw; Fri, 26 Jun 2026 12:37:08 +0000
Received: by outflank-mailman (input) for mailman id 1346122;
 Fri, 26 Jun 2026 12:37:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wd5nu-0004E8-LG
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 12:37:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd5nu-008IO7-1x
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 14:37:06 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e7269-5cb7-0a2a0a5109dd-0a2a450ccebe-28
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:37:06 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3e7271-f399-0a2a450c0019-d1558035a4cf-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 14:37:05 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4926046fbc5so10113955e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 05:37:05 -0700 (PDT)
Received: from localhost.localdomain (8.17.6.51.dyn.plus.net. [51.6.17.8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268ff1be9sm76578835e9.8.2026.06.26.05.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 05:37:04 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782477425; x=1783082225; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAKNT6XO/y4NOFGKf9ZV2Q/su24+5X1SoV17cy5xU9U=;
        b=rfE+i4Xee6iNgtnYSJNHj8wLuRy8rhUiO0jkiOzkZlZibRLTsOIx4Jlq9Fp8jAcMWp
         Q1GyT7sNElz/P3LD3kAEL9u7ewg7XTswwj1u9yj8u4p91CzeTAarDlobIJltpJmAvddn
         2vd5yPMvyIy81mX8LBYbx9lkndZiErQRzR768Z0C7dzqzhrk4m1H54e0XV78TyP8T5w7
         uGMCUYbZ4a4dgokjykoVNzDUOzxn1iNKUebDmcTZzYNwm1TiGsbbW8SreHB+Z6TQCbjD
         pOQ79SESEDGD+J1avSjBb9NpO+rcPq1qCnLgbVICK7LqBp7czTPFlIaUpP0/J6nO7YZz
         QptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477425; x=1783082225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sAKNT6XO/y4NOFGKf9ZV2Q/su24+5X1SoV17cy5xU9U=;
        b=RS3pKXTFJFH7sY4p2uiltfkY5SL01rFheyd0yWtYL165iMmKAlIc/UOP1IpLktrmoG
         TF8hoIrbZotfiTeNdKsirTaQn3tD8LNkmS8BxA7hw/XclRoPjuxPO2FT0Li49z9tqpdm
         SiloX+28ycrAp2f1v1F71BkrzJT3rMwBnS4RTfFOG1MnPWVplLQ7i3O9DAFWUtUiz6lR
         HYow9Jiw9J1zAT5gaAHYBykQAioZ81tyDOPPiDsnQivlH6t5MiJLc//hw50Aqu5Qfxav
         O3XJ6pbJ3fcCBxmZp46gyHdLUffZjaSVCeGxAAyR+ru1KHUxmP2ftVMuwpTwmaZkSwdz
         JPCA==
X-Gm-Message-State: AOJu0YxB8IxaFjLLVS0xDnu7+vIyXKuucmLffDNMwgEut42g31K+cWyQ
	+SqKRMNUCpRt/0gfU7MMNfc2BTUnNdRHngWkRC4JHBeJ3aDO6gxj92YoyTi5a4/+04w=
X-Gm-Gg: AfdE7ckYiDNelulpje4Oz5flheB6HcE/NOvR5WGIpmwugwVkrqQq0+kj34YLz4gzGRg
	80mx97X5KousKp+5PQgPWHbnHZRfDVeNrNIRzso2CIbpi32fXfWrKV+s1fMLpuUIMMgTcDDA0xj
	DBhUCROlSrGstEfOtL1aVWNzbqYs0PT7Ck6dqX9J2kqVxLlRRzdIduFK09PN0OYsmvre3CTgAg+
	/h0N2hHj4hxFxlhjPQh0VlzZGGQFk88mjhZprO8ppa4Y0VLi2eaz9+oZxFk4mutkb7xf38K+CCY
	5HLq/+Lc4yZZpYpqoOn5ZTF0phJ1Vc+wOOAxb/UDKTQjQf4TPsafJPVxMDs//WNo2B3FbA4fjW4
	4MSr48M4rfMAjfqFa2dSvoDeGwhqit8vQViiNZDUXEv4Lau/WH0f0Mu7hdcJGeQ8G6VtQ5Qr+Jg
	d2WJc7Eu8o67dWGqDTKWoY4aEezbIQfTesqofblX7h2gCK+jDirvQ5sWQyqCutWWmHo86TeNMP5
	HwmiwTg
X-Received: by 2002:a05:600d:8497:20b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-492663e5d71mr67315365e9.7.1782477424840;
        Fri, 26 Jun 2026 05:37:04 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v5 2/5] x86/efi: discard multiboot and PVH support for PE binary
Date: Fri, 26 Jun 2026 13:36:42 +0100
Message-ID: <20260626123645.229375-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626123645.229375-1-frediano.ziglio@citrix.com>
References: <20260626123645.229375-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1782477425-91329D51-71170222/0/0
X-purgate-type: clean
X-purgate-size: 4292
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:email];
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
X-Rspamd-Queue-Id: 9DE616CD0EF

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

Changes since v3:
- Added Acked-by.

Changes since v4:
- more clear subject;
- removed more code/data from EFI output;
- removed Acked-by.
---
 docs/hypervisor-guide/x86/how-xen-boots.rst | 6 ------
 xen/arch/x86/boot/head.S                    | 8 ++++----
 xen/arch/x86/xen.lds.S                      | 9 +++++++++
 3 files changed, 13 insertions(+), 10 deletions(-)

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
index 77bb7a9e21..ebdc562207 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -126,7 +126,7 @@ multiboot2_header:
         .size multiboot2_header, . - multiboot2_header
         .type multiboot2_header, @object
 
-        .section .init.rodata, "a", @progbits
+        .section .init.rodata.multiboot, "a", @progbits
 
 .Lbad_cpu_msg: .asciz "ERR: Not a 64-bit CPU!"
 .Lbad_ldr_msg: .asciz "ERR: Not a Multiboot bootloader!"
@@ -135,8 +135,7 @@ multiboot2_header:
 .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
 .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
 
-        .section .init.data, "aw", @progbits
-        .subsection 1 /* Put data here after the page tables (in x86_64.S). */
+        .section .init.data.multiboot, "aw", @progbits
         .align 4
 
         .word   0
@@ -152,7 +151,7 @@ vga_text_buffer:
 efi_platform:
         .byte   0
 
-        .section .init.text, "ax", @progbits
+        .section .init.multiboot, "ax", @progbits
 
 early_error: /* Here to improve the disassembly. */
 
@@ -710,6 +709,7 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
+        .section .init.text, "ax", @progbits
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 8e63cf5bc2..88553513a9 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -57,6 +57,12 @@ SECTIONS
   __image_base__ = .;
 #else
   . = __image_base__;
+  /DISCARD/ : {
+    *(.text.header)
+    *(.init.multiboot)
+    *(.init.data.multiboot)
+    *(.init.rodata.multiboot)
+  }
 #endif
 
 #if 0
@@ -195,6 +201,7 @@ SECTIONS
   DECL_SECTION(.init.text) {
 #endif
        _sinittext = .;
+       *(.init.multiboot)
        *(.init.text)
        *(.text.startup)
        _einittext = .;
@@ -220,6 +227,7 @@ SECTIONS
        *(.init.rodata.cf_clobber)
        __initdata_cf_clobber_end = .;
 
+       *(.init.rodata.multiboot)
        *(.init.rodata)
        *(.init.rodata.*)
 
@@ -234,6 +242,7 @@ SECTIONS
        *(.initcall1.init)
        __initcall_end = .;
 
+       *(.init.data.multiboot)
        *(.init.data)
        *(.init.data.rel)
        *(.init.data.rel.*)
-- 
2.43.0


