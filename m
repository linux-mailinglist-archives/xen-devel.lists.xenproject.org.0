Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 961BE95BA3C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 17:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781923.1191419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh9lL-0008Sg-1z; Thu, 22 Aug 2024 15:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781923.1191419; Thu, 22 Aug 2024 15:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh9lK-0008Qk-Uw; Thu, 22 Aug 2024 15:30:10 +0000
Received: by outflank-mailman (input) for mailman id 781923;
 Thu, 22 Aug 2024 15:30:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkBN=PV=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sh9lK-0008Qe-1V
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 15:30:10 +0000
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [2607:f8b0:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69296f36-609b-11ef-a50a-bb4a2ccca743;
 Thu, 22 Aug 2024 17:30:08 +0200 (CEST)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-7093472356dso634401a34.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 08:30:07 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-454fe0f436dsm7786131cf.49.2024.08.22.08.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 08:30:06 -0700 (PDT)
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
X-Inumbo-ID: 69296f36-609b-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724340606; x=1724945406; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H8/O+XAPl/QbSGBgMlq8pwRffeZEEcEmslfFS5zb4s8=;
        b=AX8NugHCZScxNDibQvrPW3myN8hrtL96DRJ4odKO9w3QKPnnFC7ETXeskMar6JRV+W
         Nv08ZzpuSUq2gWbACnkm4G6HoDMxHFtBVf+A+tDNwh74HG/TZiG7uRRd748llKxr7jhF
         oXkhE7C2A0BS50wRgWHYzYLpSIoILTRxt4vLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340606; x=1724945406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8/O+XAPl/QbSGBgMlq8pwRffeZEEcEmslfFS5zb4s8=;
        b=syXFNBJfMI8Hye1FKuEmGBi35xWqc6/U/D6Ng+JU7+gVN1MafAlomOmPHbQskIC4Pb
         DJSUMn3yh+EFlopMO78K70s3pVyhSJM/+815hDaBIOfC5rk8r3T5FkowDJNVdCn0e8a/
         f401UqytBbOaM7WL0pRA141IHTkr38ws99u6FdXxBKPvjRIYL6ZP+sqLeIPEddZSeI9g
         b/FUsszyWDxNV/fOWtBOZl0j1srNxYOmKfqbxFeorBvEMXOzRGBiyicfT1GGdctlJcLc
         dlI4Y1P8NpRehC2ORokw8MlcsKH96fhSjcpdunuYTyjbVSsGQKy11YwC5QPPUqk0IrMY
         UicA==
X-Gm-Message-State: AOJu0YyFKHec7GsVstZNe8tSwrBrBQQJyNp4b57UJTkD6v9jX0HvJCv8
	rat6Kq65uwl94HD35kSDfOCHOd+dUg6tFHHZQRvObkdSE0wuaIxi5nZJt4xdduT89yuAvY/OVeO
	Q
X-Google-Smtp-Source: AGHT+IHojBVGHlDnRnHtYNhrvvyH3Ndv53rdneGOEakuYJ4P94fC6ZKkytP2uY0gFCQDmiUZkibDlA==
X-Received: by 2002:a05:6808:2226:b0:3d9:245c:4225 with SMTP id 5614622812f47-3de19c77a7fmr7450539b6e.6.1724340606557;
        Thu, 22 Aug 2024 08:30:06 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Alejandro Vallejo" <alejandro.vallejo@cloud.com>
Subject: [PATCH] Avoid additional relocations in trampoline code
Date: Thu, 22 Aug 2024 16:29:51 +0100
Message-ID: <20240822152953.489136-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trampoline could have "manual" relocation entries (created
by assembly macros and some code to use them) and (in case of PE)
normal executable relocations.
Remove all normal executable ones. In this way we don't have to
worry about applying both correctly (they need proper order
which is hard to spot looking at the code).

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/trampoline.S | 4 ++--
 xen/arch/x86/boot/wakeup.S     | 6 +++---
 xen/arch/x86/xen.lds.S         | 7 ++++++-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index b8ab0ffdcb..0724c953e2 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -73,7 +73,7 @@ trampoline_protmode_entry:
         mov     %ecx,%cr4
 
         /* Load pagetable base register. */
-        mov     $sym_offs(idle_pg_table),%eax
+        mov     $idle_pg_table_pa, %eax
         add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
         mov     %eax,%cr3
 
@@ -113,7 +113,7 @@ trampoline_protmode_entry:
         .code64
 start64:
         /* Jump to high mappings. */
-        movabs  $__high_start, %rdi
+        movabs  $__high_start_pa + __XEN_VIRT_START, %rdi
         jmpq    *%rdi
 
 #include "video.h"
diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
index 08447e1934..ebe72e1fdd 100644
--- a/xen/arch/x86/boot/wakeup.S
+++ b/xen/arch/x86/boot/wakeup.S
@@ -99,7 +99,7 @@ wakeup_32:
         mov     $bootsym_rel(wakeup_stack, 4, %esp)
 
         # check saved magic again
-        mov     $sym_offs(saved_magic),%eax
+        mov     $saved_magic_pa, %eax
         add     bootsym_rel(trampoline_xen_phys_start, 4, %eax)
         mov     (%eax), %eax
         cmp     $0x9abcdef0, %eax
@@ -112,7 +112,7 @@ wakeup_32:
         mov     %ecx, %cr4
 
         /* Load pagetable base register */
-        mov     $sym_offs(idle_pg_table),%eax
+        mov     $idle_pg_table_pa ,%eax
         add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
         mov     %eax,%cr3
 
@@ -156,7 +156,7 @@ wakeup_32:
         .code64
 wakeup_64:
         /* Jump to high mappings and the higher-level wakeup code. */
-        movabs  $s3_resume, %rbx
+        movabs  $s3_resume_pa + __XEN_VIRT_START, %rbx
         jmp     *%rbx
 
 bogus_saved_magic:
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 9a1dfe1b34..8e604dde48 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -71,7 +71,12 @@ SECTIONS
   __2M_text_start = .;         /* Start of 2M superpages, mapped RX. */
 #endif
 
-  start_pa = ABSOLUTE(start - __XEN_VIRT_START);
+#define DEFINE_PA_ADDRESS(sym) sym ## _pa = ABSOLUTE(sym - __XEN_VIRT_START)
+  DEFINE_PA_ADDRESS(start);
+  DEFINE_PA_ADDRESS(saved_magic);
+  DEFINE_PA_ADDRESS(idle_pg_table);
+  DEFINE_PA_ADDRESS(__high_start);
+  DEFINE_PA_ADDRESS(s3_resume);
 
   . = __XEN_VIRT_START + XEN_IMG_OFFSET;
   _start = .;
-- 
2.46.0


