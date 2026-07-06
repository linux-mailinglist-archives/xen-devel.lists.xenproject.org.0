Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zg9DAS95S2oVSAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:45:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D0B70EBA7
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 11:45:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=gxLVbjao;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355212.1609983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfsZ-0007Ho-EG; Mon, 06 Jul 2026 09:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355212.1609983; Mon, 06 Jul 2026 09:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgfsZ-0007Fl-Ai; Mon, 06 Jul 2026 09:44:43 +0000
Received: by outflank-mailman (input) for mailman id 1355212;
 Mon, 06 Jul 2026 09:44:41 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wgfsX-00072g-MS
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 09:44:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgfsX-009Ezx-39
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 11:44:41 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b78fb-e002-0a2a0a5209dd-0a2a450ced64-18
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:44:40 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b7908-f399-0a2a450c0019-d1558032e427-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 11:44:40 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493bc8fda98so30747405e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 02:44:40 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccd9d620sm283605205e9.1.2026.07.06.02.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 02:44:39 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783331080; x=1783935880; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X0/pd4NebReOi1u00xuUMPx7iuXllyYVM7OCMuJ2B44=;
        b=gxLVbjaoP1nvM08a3Tkn/vbEdEo62hMZNk5KT/KIl4WFy6ha978VbICWx3ssc530/U
         FBC15pxCAUQt02u+fWAYQVNPVflokp3XYhrox9WtMjOHO+ETvoA671ZceKWkYD0uJaoy
         ypnr51NhNy77uAZ/8JoVVIu/A2IC8HMabFxZQyfAw8cYE53PlmO+GKBwbmtH8rvYJf/d
         YW+E8ofk2j/32f2BFuSCSpr7LObh2ida/VVUVQpuyAxrOq2pspXGCyB9f7dJrLmaV1DB
         4INgpLZBsggB3QTq5Q26Rk+pKy49Q/xBL2NQFU2t8ePa0e7ttLAY7t61DQOzqR6IS2na
         mRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331080; x=1783935880;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0/pd4NebReOi1u00xuUMPx7iuXllyYVM7OCMuJ2B44=;
        b=iIhXS165uqY6Kdnzh/9+UPOCnKCxVyrXMROH49u5lgixZVQugYF9/CegJmAJQhifL8
         oRnV9hBjULd+1XPpBiGCX8PGSx0b8zFmSUp4uf+Mxcl40EnG+vI0lF//Ug0FIWPQ/VLa
         ut0rH8cT2De1zU2zCt3CTmhIA0wLInu/9Z4NcPojftZuD3lDBHJojdz6pxZ+0rCBM9WW
         w1588/rMOYBbDwb1RUjhXdws3z5IS3K5otw42xh294sXXz63E2zDHZMATBcs8ydrs+HY
         15ocu1DH77rEfhdLOwup3wstpiao7RTnrWap/iQVdlB+pscGEptOu1UOJX5ocpNE7vEJ
         NXpw==
X-Gm-Message-State: AOJu0YxllqD1HZPZADVuyJqhObEUYSgbsFVHPI6BeEptrVlRObnSA87u
	lOpeHhS6g7yCV/0St1AGy1RNVf1HELFZZs+M8Sdf/BQHCLjMr6OFfVHjFx90wgn0EVk=
X-Gm-Gg: AfdE7cmoJ56mAnNJchQw7MCmd6apTtzOuUH+tFkHVxG78RTTRAEcj+FzqnorOJ2BMsq
	YnsPRg61+S5grjvD/h95AJDCLIk/HebquT8BWmQ98IgOpG9RbI8zR7AvcDMWIPaw8pRNHCAR3Yk
	TFYMhThoUGtbL5ZESu9oyDcUFYtVAADP0yMFYGIoEJAKHdB+fxf4b6hhYTBAaiRKumrV4jyRnr/
	HaNvD+WDI09/F63dthD7A6ulbjI9a9Khqd/xxAiiEVp5CizToVXapiZrXv9X6zepuVUhO181B+V
	OTQMdpdD8j4rKJVmBfntWcSl32huhD8y16QDOYmHlgHYpMXVJpsD/A4sKaUMG8WfL5stEWibI+Q
	FmoCorlLlqd+F0TiP89fFbOCrXKlA2GoxQAMCKOUQdx9AnNvj5SEGOiscutPv1Y+qeTTIF2SdAl
	RJlFQQmnBhKJgsjkyoGofZSNsRcjotGpZnRg+v5vJT6Yg+2Fsd9+VE0phb4aTxbok9sNNFpxiZ5
	28UddNEPF+TTOHte/g=
X-Received: by 2002:a05:600c:3554:b0:493:a5d0:d1a1 with SMTP id 5b1f17b1804b1-493d11f6bf5mr115083975e9.31.1783331080005;
        Mon, 06 Jul 2026 02:44:40 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v6 2/4] x86/efi: discard multiboot and PVH support for PE binary
Date: Mon,  6 Jul 2026 10:44:28 +0100
Message-ID: <20260706094430.427155-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706094430.427155-1-frediano.ziglio@citrix.com>
References: <20260706094430.427155-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1783331080-0F138D51-188A3276/0/0
X-purgate-type: clean
X-purgate-size: 5049
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: A5D0B70EBA7

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


