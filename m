Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ACAbIdmHMWo2lwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:28:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 179F66932C6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 19:28:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OAqTQU+H;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339507.1600732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXaa-00058o-8I; Tue, 16 Jun 2026 17:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339507.1600732; Tue, 16 Jun 2026 17:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZXaa-00057O-2e; Tue, 16 Jun 2026 17:28:40 +0000
Received: by outflank-mailman (input) for mailman id 1339507;
 Tue, 16 Jun 2026 17:28:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wZXaX-0004hP-UY
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:28:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZXaX-00FwMQ-BU
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 19:28:37 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a318794-2eae-0a2a0a5409dd-0a2a450ae170-40
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:28:37 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a3187c5-56b3-0a2a450a0019-d155dd2ca9a6-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 19:28:37 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45ee5cdbd28so57857f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:28:37 -0700 (PDT)
Received: from localhost.localdomain (5.116.208.46.dyn.plus.net.
 [46.208.116.5]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-461abb44c3dsm5012754f8f.9.2026.06.16.10.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 10:28:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781630917; x=1782235717; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59pkg3zSgN49JGtId9KEQHL8kPDSpSqdyB2+a04J4NI=;
        b=OAqTQU+HxiuNVB9Oo2EoEDXCndEyokgxjdsmHp9QfJbEzn7T/XDG9SngmeMvE+EdbU
         w5JcdaB0FwwThuO/gzZRSDmKoEIIOEnCkbLzcs8Mod7HonMaQldMAbQKyo1VfYApUtjh
         +jYSJJjakrmPE1JWG5vdISu06GgDA9qwMFwnvdll+2rnSph6uf5aobwrBpVHTM5u0lpb
         1dtp8i/tOzoSrwWek0LODVPnkihYqEsgQQEE3JoPp6ZH896IDZKkxFyfa5+jJ81tXjy0
         BCq8esypq0xwniUj1sAIh/Sr/qs0xDMR9Mz6TvPhllNJfbLea+OPyDXlUY+MB9kjjrj7
         aE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781630917; x=1782235717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=59pkg3zSgN49JGtId9KEQHL8kPDSpSqdyB2+a04J4NI=;
        b=Dg87dMh5sOC0dL3kpWD2Oa4crUJfpRZcBEzT2C3/nIyEh/c9VgsbODtc2LgGCFSrSn
         P0VwtnsCoAAN4/BopyE7AlRdQUunsbyGNCUl8bG/8JBphhbvgeu7BzaDw1VxaM7OkvdH
         SoooYsAyd5f5/zaJijmKxJJ6W1a/HrwnqPa7AdaBieDTipg1igBpm+CcTUwPZfp/enSw
         ecr27TZpbPyZKmTjGWeILUJDTMss9RDnwdNXFWOA12+73tjOqFyFL9ImMcJPmXuvqGuD
         C9UoY3J+2rZQv9ROPT/UAS5/G/wsyxhKzCFFVDGt0AY7ySLaqQ8Wjk0qWrqP9hsD2ccD
         otcw==
X-Gm-Message-State: AOJu0YzRL0wwKjkkgWi5Yg03+MMCdZko9yDlt/uO7x9A7T/J9KmLDm69
	D5xNzJhdvZAWdjbJY9VVciM3DpgphPdBBSUwUJQBSCBzrAH2nH+DixIXhCsjGHbKlUs=
X-Gm-Gg: Acq92OGtBvukgfyEXO9HnNwKm0P8VzJVf0mTvxttXEou+0sa3obOyLbVSMHa7YmnPVj
	S0IJVNyf6UoZUZFAoeutj9iJSnNvLJw3vKjnbyPjeXGrYD/pd7TzK/GsH9ctdxon8/1s9sLmhOj
	80aWxCt5qvB8U0+VPadoB53v1+5evuyyFf0aF0CBNHxUxEOVr30o/1MHdJe+Lv8OYouTK/ObaZP
	7nrlxS5SyHeCMwEYNkQle4xp2j4wTiKKhd6vP/iTcS3JeGW1YMnWL8RfTQ1RMgdSzxbEO0Dmsqc
	wQx27GJAsdExfZY3+gwSGB+RKVEU6sxulJKLE4wiM2wAJnjYYcuQkIoOsPHb7R+Vm+vzwKkFv7s
	H9WR833IHtej/CHaUuwH1vES1rKnSaagdxg+GsEp9TpE/cvwIz8lcbl7OVgDgJleZPzQwzjC6Ju
	70bZ0cinlfY7WVCDRHOofNIOZx3J1KTloBMMZA7v7xdQTp9UincLJTvYaB0B0ziy6JUZAe0Tjr3
	LC2xoDm5dG2eXK42Omb10F9h4E=
X-Received: by 2002:a05:6000:4313:b0:452:bc74:b129 with SMTP id ffacd0b85a97d-4622d0504d5mr1149300f8f.16.1781630916713;
        Tue, 16 Jun 2026 10:28:36 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v4 2/4] x86/efi: discard multiboot support for PE binary
Date: Tue, 16 Jun 2026 18:28:28 +0100
Message-ID: <20260616172830.111393-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616172830.111393-1-frediano.ziglio@citrix.com>
References: <20260616172830.111393-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1781630917-7196E8B7-40CB9574/0/0
X-purgate-type: clean
X-purgate-size: 3030
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:mid,citrix.com:email,invisiblethingslab.com:email];
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
X-Rspamd-Queue-Id: 179F66932C6

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
Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
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


