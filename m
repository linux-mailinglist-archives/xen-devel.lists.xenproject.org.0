Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9493096233D
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 11:20:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784560.1193943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjEqb-00056x-HE; Wed, 28 Aug 2024 09:20:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784560.1193943; Wed, 28 Aug 2024 09:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjEqb-00053m-E9; Wed, 28 Aug 2024 09:20:13 +0000
Received: by outflank-mailman (input) for mailman id 784560;
 Wed, 28 Aug 2024 09:20:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rm2h=P3=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sjEqa-00052T-36
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 09:20:12 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b93be8dd-651e-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 11:20:10 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6bf6beda0c0so35099476d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 02:20:10 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c162d21710sm63763296d6.11.2024.08.28.02.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 02:20:09 -0700 (PDT)
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
X-Inumbo-ID: b93be8dd-651e-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724836809; x=1725441609; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4RGhBHc552V5isJ2kp8ZF0VtasdROqoNs8OcgQhRR7c=;
        b=OM2YtuxsRZBYxMM/2nC1oTfCSgSkVpSwrQlziQYVtKxwho5Q+WnFoc+hYdmM7THtmZ
         Hj1b6dqObWJQGbQI9pAF5m+7NL03OTyPWSoZOvzdnly0uLGgd2ZpXkANcfmo2oPJqEb8
         vnxFXCt2Z+8Scb2uJ8gyVtKPoKYL9Od75QJN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724836809; x=1725441609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4RGhBHc552V5isJ2kp8ZF0VtasdROqoNs8OcgQhRR7c=;
        b=EK+q+xIqD7is6BtPHAnBD+JbbbG02yDmpRBcpCpkvqKt+BiRH4bHpEdta5k+wPWpCh
         hLrO3H8GovFMIJh5PsLVB+RxKPrq7FsZ7JAc+/1fma08/1TON6gvHhnG3m2vsnGVLQWi
         zEYQv93UqCt4SUoegcb2ux5mDMAnzBNJHVXuZtrgWKWQvJXwVeHiaUs9fyKGHYA9UxBw
         0MYOUc+AtTSPmUbbDB0ufEQScw7PbeT5Q7WTEZqTMbeHEbcUnDdijRspAv1WVTZKvdgC
         /yUuS/6J7nYl5bVs9eV7ZD7O9As8idf9ak+qkcefYrLrc4fB4eNQFqwWRsSct07YBn/7
         WWYA==
X-Gm-Message-State: AOJu0YzAFoMcNjStMWKrWvYPAbX0O9RlzEjhFqbylJBR86gtwcAqhINJ
	9lWHYmm/5dV0mNQHafhlHtmHrBjALTX8GdNJkdwMjLNsZi32CaJ2WvjdbXTCK2Zo/HqZ+mqSzXj
	K
X-Google-Smtp-Source: AGHT+IHxRkJdClhb6Gw3jEDOTUxCeI/er0Xo4kT911pY124/51QCpurE13swPk/asc4qF65QJgh7wg==
X-Received: by 2002:a05:6214:5987:b0:6b5:e2da:8bec with SMTP id 6a1803df08f44-6c16deb85f1mr194733766d6.55.1724836809441;
        Wed, 28 Aug 2024 02:20:09 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/2] x86/boot: Avoid relocations in trampoline code to physical addresses
Date: Wed, 28 Aug 2024 10:19:53 +0100
Message-ID: <20240828091956.127760-1-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trampoline could have "manual" relocation entries (created
by assembly macros and some code to use them) and (in case of PE)
normal executable relocations.
Remove some normal executable ones. In this way we don't have to
worry about applying both correctly (they need proper order
which is hard to spot looking at the code).
Specifically in efi_arch_post_exit_boot trampoline is copied after
fixing relocations with efi_arch_relocate_image. These time dependencies
between different part of code are hard to spot making hard to change
code. In this case the copy is done in a state where code should be run
at higher locations so it would be better to reduce the code between
calling efi_arch_relocate_image and jumping to higher location.
Absolute symbols are defined by linker in order to avoid relocations.
These symbols use a "_PA" suffix to avoid possible clashes.
phys_addr macro is used to make more clear the address we want and making
symbol search easier.
sym_offs and sym_esi are undefined to avoid the usage of them which
would lead to relocations.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S       | 6 ++++--
 xen/arch/x86/boot/trampoline.S | 9 ++++++++-
 xen/arch/x86/boot/wakeup.S     | 4 ++--
 xen/arch/x86/xen.lds.S         | 9 +++++++--
 4 files changed, 21 insertions(+), 7 deletions(-)
---
Changes since v1:
- add subject prefix to commit messages;
- more explanation of the improvement;
- use upper case for suffix to avoid clashes;
- undefine some macros to avoid usage of them;
- use some macros to make code more clear;
- use hidden symbols;
- split change in 2 commits.

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index d8ac0f0494..a8a14060b6 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -870,8 +870,10 @@ cmdline_parse_early:
 reloc:
         .incbin "reloc.bin"
 
+#include "x86_64.S"
+
+        .section .init.text, "ax", @progbits
+
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
-
-#include "x86_64.S"
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index b8ab0ffdcb..3a6eb942a7 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -16,6 +16,11 @@
  * not guaranteed to persist.
  */
 
+/* We don't want relocation in the trampoline.
+ * Undefine some macros generating relocations. */
+#undef sym_offs
+#undef sym_esi
+
 /* NB. bootsym() is only usable in real mode, or via BOOT_PSEUDORM_DS. */
 #undef bootsym
 #define bootsym(s) ((s)-trampoline_start)
@@ -34,6 +39,8 @@
         .long 111b - (off) - .;            \
         .popsection
 
+#define phys_addr(sym) sym ## _PA
+
 /* Start of the permanent trampoline code. */
 
         .code16
@@ -73,7 +80,7 @@ trampoline_protmode_entry:
         mov     %ecx,%cr4
 
         /* Load pagetable base register. */
-        mov     $sym_offs(idle_pg_table),%eax
+        mov     $phys_addr(idle_pg_table), %eax
         add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
         mov     %eax,%cr3
 
diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
index 08447e1934..ae4dd5eb40 100644
--- a/xen/arch/x86/boot/wakeup.S
+++ b/xen/arch/x86/boot/wakeup.S
@@ -99,7 +99,7 @@ wakeup_32:
         mov     $bootsym_rel(wakeup_stack, 4, %esp)
 
         # check saved magic again
-        mov     $sym_offs(saved_magic),%eax
+        mov     $phys_addr(saved_magic), %eax
         add     bootsym_rel(trampoline_xen_phys_start, 4, %eax)
         mov     (%eax), %eax
         cmp     $0x9abcdef0, %eax
@@ -112,7 +112,7 @@ wakeup_32:
         mov     %ecx, %cr4
 
         /* Load pagetable base register */
-        mov     $sym_offs(idle_pg_table),%eax
+        mov     $phys_addr(idle_pg_table), %eax
         add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
         mov     %eax,%cr3
 
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 9a1dfe1b34..5cfbd2524a 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -22,7 +22,7 @@ ENTRY(efi_start)
 
 #define FORMAT "elf64-x86-64"
 
-ENTRY(start_pa)
+ENTRY(start_PA)
 
 #endif /* EFI */
 
@@ -71,7 +71,12 @@ SECTIONS
   __2M_text_start = .;         /* Start of 2M superpages, mapped RX. */
 #endif
 
-  start_pa = ABSOLUTE(start - __XEN_VIRT_START);
+#define DEFINE_PA_ADDRESS(sym) \
+  HIDDEN(sym ## _PA = ABSOLUTE(sym - __XEN_VIRT_START))
+
+  DEFINE_PA_ADDRESS(start);
+  DEFINE_PA_ADDRESS(saved_magic);
+  DEFINE_PA_ADDRESS(idle_pg_table);
 
   . = __XEN_VIRT_START + XEN_IMG_OFFSET;
   _start = .;
-- 
2.46.0


