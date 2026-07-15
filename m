Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DJqsIyAnV2owGQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:22:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5AD75AF12
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2026 08:22:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="NypO/5ki";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1362690.1614470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjt0b-0001jl-Br; Wed, 15 Jul 2026 06:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362690.1614470; Wed, 15 Jul 2026 06:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjt0b-0001hU-8H; Wed, 15 Jul 2026 06:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1362690;
 Wed, 15 Jul 2026 06:22:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wjt0Z-0001XS-HW
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 06:22:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjt0Y-00ABip-UG
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2026 08:22:14 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a57270d-5cb7-0a2a0a5109dd-0a2a4503c806-40
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:22:14 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a572716-fae8-0a2a45030019-d155802dc801-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jul 2026 08:22:14 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-493c19bad03so44737985e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 23:22:14 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f4635a63esm14336663f8f.9.2026.07.14.23.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 23:22:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784096534; x=1784701334; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FqYWTs8G33kIjfb7qWPUTwZdIykiHkYIeo/EcHEwy6s=;
        b=NypO/5kiEm9EPx0O6E88q3JFxnfLEXdtyOvodX49omRbWRr6EUP6CTLWq/EWMWTvXH
         0wACMIK2x6/IqxtYIO2PnO7N2mFIoUjoLLXbezqZXrSAhxCMMzKzG2szodAE/KvB6F13
         gWsGQInEd+BBCwEn74abNTwyHPV6jDlWYi3n38CNUV/M95VsmORFhImTHKp+TWMRPtxe
         8cyJzrIL1V0OHy9csmtayAMj/7ijZqzQwTl9jdUKOsUVilRMlHsxJJBHGyhqdTXsn9PW
         o6KNeQxWcR7ebS/zfKmvAeUjFi/h4Ufkm5gxJJRMxTmV8VefB3wDaIut87Ho4/Voua+g
         u+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096534; x=1784701334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FqYWTs8G33kIjfb7qWPUTwZdIykiHkYIeo/EcHEwy6s=;
        b=b6uhaJmjj7cbZpMVTOmvvSvq5mF2sZw08tDj/DZT3Tho5aqzelXTFHxXvb1AYQoW6b
         ZKWmt2y9YRuIL3K6kf1bHBG0SXVvSgiVxNVIsKkeL1Ybl67NHNdrhc6rUxl6C4U8+jPh
         1mCNxhKwQlE4ngtG08XJkWP6KJg8QWoclc+bXC5BaLA8eux4RJLZxLA6JxXhnN2gL38V
         DhApAhZdZbxPby2x1hoo4ItPkx6vqyTxvZu3JwAUFqpjFF1dYlHNKHJabANUfNvE1eQr
         2f22ORz/3guCYouHFKtRehcpTg5CfS4FILVTvQvk9AuBQroxT5QblK14AQRna/Vl5bJK
         5nTw==
X-Gm-Message-State: AOJu0YxN2xW/PsLh27tQDSMbGmwMwsAtj0X5LXd6JI0EIOT++UVOetXk
	Ke8eo5xqFsFOCyL7oV5aKEnBrrBn5Hc13U+3KBEuv9j0ZcgUN2EyPbruBmov14l45QssWQ==
X-Gm-Gg: AfdE7cln1TnzNOcyOXnDoU8vOoS0sE3JS4iJT1ynrOLnbevvJAWMskagQpzKLJ23EiV
	MMm9Xq4zohhRoiJvdyJmbmJAhBQFgeBd8UriLFbEQYbAyhHHJszDpqScjToTdwx5ZVt7CQ37LMu
	HtOZCli5mWtrM1IqjbFyqgLfbfLGkr84HELqIujMJbXLvjSHS7Eg0Q17kygJeSbMwsI8HDmath1
	Y9d/1dyQzCGdmwP1j5zNnoUpy4+pXnfzNCD8RcPJSYq1bRXpK0kObvfPI5eof6j5Nt123DegKuW
	6e8zjn+3pYONfHda9a8UNG/tq3UrhXT4fe35Hlq4IlYT39idn6YH2XXeka63GDL4jfUp0m330kr
	ehZGuo3Fy1Gf2B/QviQlpUGd2uaROxH/bxV28ApGdJ8mJXH5Wzd56s3nXSocmMu4Ba7///e85r6
	t3uNdp33f8Yj/FscfsV81EUe4+T7Lb/yBDYRyn7Jr4eweDwAEp2TnAJ4X2sDlQDQa4CYW+QsRL1
	45hpzgsWF4EW5mO5mU=
X-Received: by 2002:a05:600c:4e0d:b0:495:39dc:583d with SMTP id 5b1f17b1804b1-4953c150667mr15497415e9.6.1784096534038;
        Tue, 14 Jul 2026 23:22:14 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v8 2/4] x86/efi: discard multiboot and PVH support for PE binary
Date: Wed, 15 Jul 2026 07:22:04 +0100
Message-ID: <20260715062206.328049-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062206.328049-1-frediano.ziglio@citrix.com>
References: <20260715062206.328049-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784096534-6C6DE4E9-3504AE32/0/0
X-purgate-type: clean
X-purgate-size: 5251
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:mid,invisiblethingslab.com:email];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C5AD75AF12

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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
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

Changes since v5:
- simplify section exclusion using more wildcard;
- exclude more multiboot functions.

Changes since v7:
- added Reviewed-by.

Changes since v8:
- added Acked-by.
---
 docs/hypervisor-guide/x86/how-xen-boots.rst | 6 ------
 xen/arch/x86/boot/head.S                    | 8 ++++----
 xen/arch/x86/xen.lds.S                      | 7 +++++++
 xen/tools/combine_two_binaries.py           | 2 +-
 4 files changed, 12 insertions(+), 11 deletions(-)

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
index 68b963ce6f..981f262b5e 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -126,7 +126,7 @@ multiboot2_header:
         .size multiboot2_header, . - multiboot2_header
         .type multiboot2_header, @object
 
-        .section .init.rodata, "a", @progbits
+        .section .init.rodata.multiboot, "a", @progbits
 
 .Lbad_cpu_msg: .asciz "ERR: Not a 64-bit CPU!"
 .Lbad_ldr_msg: .asciz "ERR: Not a Multiboot bootloader!"
@@ -137,8 +137,7 @@ multiboot2_header:
 .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
 #endif
 
-        .section .init.data, "aw", @progbits
-        .subsection 1 /* Put data here after the page tables (in x86_64.S). */
+        .section .init.data.multiboot, "aw", @progbits
         .align 4
 
         .word   0
@@ -154,7 +153,7 @@ vga_text_buffer:
 efi_platform:
         .byte   0
 
-        .section .init.text, "ax", @progbits
+        .section .init.multiboot, "ax", @progbits
 
 early_error: /* Here to improve the disassembly. */
 
@@ -712,6 +711,7 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
+        .section .init.text, "ax", @progbits
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 8e63cf5bc2..4ed1d2bec1 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -57,6 +57,10 @@ SECTIONS
   __image_base__ = .;
 #else
   . = __image_base__;
+  /DISCARD/ : {
+    *(.text.header)
+    *(.init.*multiboot)
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
@@ -220,6 +225,7 @@ SECTIONS
        *(.init.rodata.cf_clobber)
        __initdata_cf_clobber_end = .;
 
+       *(.init.rodata.multiboot)
        *(.init.rodata)
        *(.init.rodata.*)
 
@@ -234,6 +240,7 @@ SECTIONS
        *(.initcall1.init)
        __initcall_end = .;
 
+       *(.init.data.multiboot)
        *(.init.data)
        *(.init.data.rel)
        *(.init.data.rel.*)
diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_binaries.py
index 581e57cbc0..5f0433dcad 100755
--- a/xen/tools/combine_two_binaries.py
+++ b/xen/tools/combine_two_binaries.py
@@ -33,7 +33,7 @@ parser.add_argument('--map', dest='mapfile',
 parser.add_argument('--exports', dest='exports',
                     help='Symbols to export')
 parser.add_argument('--section-header', dest='section_header',
-                    default='.section .init.text, "ax", @progbits',
+                    default='.section .init.multiboot, "ax", @progbits',
                     help='Section header declaration')
 parser.add_argument('-v', '--verbose',
                     action='store_true')
-- 
2.43.0


