Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847CB968C74
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 18:55:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788293.1197783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAJv-0007oE-M6; Mon, 02 Sep 2024 16:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788293.1197783; Mon, 02 Sep 2024 16:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAJv-0007mj-J7; Mon, 02 Sep 2024 16:54:27 +0000
Received: by outflank-mailman (input) for mailman id 788293;
 Mon, 02 Sep 2024 16:54:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slAJu-0007md-DY
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 16:54:26 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0279f304-694c-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 18:54:25 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c26815e174so783647a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 09:54:25 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988fef5acsm581125466b.4.2024.09.02.09.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 09:54:23 -0700 (PDT)
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
X-Inumbo-ID: 0279f304-694c-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725296064; x=1725900864; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDa0tJuZ6Pk5PfjJticTZGaLwjDkHQC5N99vb7lGyOU=;
        b=R7Spm4IupHbTneGd6S25zQhmtOELeF+A4M5H4wWDJQNviQ8jIjARKgM5cyhK5xXO9x
         h2v0nAlgd6XbSben7qj+ThCtezRDraNIeMOnmnqYJ3pxq8+m75NrHnni/5s2fn8jI4Gd
         2JRaOekLPzcXC/64g3i0ezLc1HNzjAPrRplYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296064; x=1725900864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDa0tJuZ6Pk5PfjJticTZGaLwjDkHQC5N99vb7lGyOU=;
        b=vPQaNv9FhWlMhwlBCuM//My33tiW5X/GFE2pIIHp8lZjxkIl4mmFWpkcZ8nFj02rVY
         FxJqdtakqwCL5gN9A9fc/NUKcYZR+FeEBSOsWc9IqPGo6f6t1XBw1bGDV70VovVvo/9V
         s6czHDFMUuF1L8pCC6vZkH7kzYYqez4pH+USdRYoi3/byCEs8aQ2BT0kWG00QmY49iI3
         ce9EKoP9c/dSIx8h14cOEbNgqymDt4zENLvsBy79R22MMxUJIMP+5flO+VB4vuHLn83y
         7ew8KX18MdLKKVl8+cvhxqi+iNVCnHqCpCmdjFxJNd8Gl94XyAnRhyt+bf8GneWYEt59
         PDPA==
X-Gm-Message-State: AOJu0YwfEWwKCW6Z0bGHhpD/bxb5pxFp3Ptm82c0TgITdEdOfJUhR7TM
	CdPOk9Ag+IBPG1hfGi4Qyv26BIqSrYdVXVZW7z1w6WNITvnzxvdGJ/JPdFJF/H7yCQLEjevkp0F
	m
X-Google-Smtp-Source: AGHT+IEkq1QNSoy4uTpaS1fGGwV5hyOxXhVH8hZwIEFfWCKVN5ncTjWpms9bmlUGZ9A+6/l36z3UFA==
X-Received: by 2002:a17:907:12cd:b0:a89:f171:8dc0 with SMTP id a640c23a62f3a-a89f171926fmr233264066b.11.1725296063821;
        Mon, 02 Sep 2024 09:54:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH v2] x86/boot: Use fastcall for 32bit code
Date: Mon,  2 Sep 2024 17:54:21 +0100
Message-Id: <20240902165421.3429603-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902133232.3302839-5-andrew.cooper3@citrix.com>
References: <20240902133232.3302839-5-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is marginally more efficient, but is mostly to get rid of the use of
stdcall in cmdline.c and reloc.c

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>

v2:
 * Fixed up to work properly.

I'm tempted to rebase this ahead of "[PATCH 3/4] x86/boot: Use
<xen/compiler.h>" and remove the transatory opencoding of __stdcall.

With some manual ELF annotations around the incbin's, this is the marginal
delta:

  $ ../scripts/bloat-o-meter xen-syms-before xen-syms-after
  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-188 (-188)
  Function                                     old     new   delta
  reloc                                       2352    2328     -24
  cmdline_parse_early                         2699    2535    -164
---
 xen/arch/x86/boot/Makefile  |  2 +-
 xen/arch/x86/boot/cmdline.c |  7 +++----
 xen/arch/x86/boot/head.S    | 15 ++++++++-------
 xen/arch/x86/boot/reloc.c   | 12 ++++++------
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 03d8ce3a9e48..b327663fba94 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -13,7 +13,7 @@ $(obj)/head.o: $(head-bin-objs:.o=.bin)
 
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
-CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
+CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
 ifneq ($(abs_objtree),$(abs_srctree))
 CFLAGS_x86_32 += -I$(objtree)/include
 endif
diff --git a/xen/arch/x86/boot/cmdline.c b/xen/arch/x86/boot/cmdline.c
index bdd5b95c224b..fc9241ede9a0 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -20,8 +20,8 @@
 
 /*
  * This entry point is entered from xen/arch/x86/boot/head.S with:
- *   - 0x4(%esp) = &cmdline,
- *   - 0x8(%esp) = &early_boot_opts.
+ *   - %eax      = &cmdline,
+ *   - %edx      = &early_boot_opts.
  */
 asm (
     "    .text                         \n"
@@ -347,8 +347,7 @@ static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
 #endif
 
 /* SAF-1-safe */
-void __attribute__((__stdcall__))
-cmdline_parse_early(const char *cmdline, early_boot_opts_t *ebo)
+void cmdline_parse_early(const char *cmdline, early_boot_opts_t *ebo)
 {
     if ( !cmdline )
         return;
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 3c0346016ce8..f7497bce393c 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -613,10 +613,11 @@ trampoline_setup:
 
         /* Save Multiboot / PVH info struct (after relocation) for later use. */
         push    %edx                /* Boot video info to be filled from MB2. */
-        push    %ecx                /* Bottom-most low-memory stack address. */
-        push    %ebx                /* Multiboot / PVH information address. */
-        push    %eax                /* Magic number. */
+        mov     %ebx, %edx          /* Multiboot / PVH information address. */
+        /*      reloc(magic/eax, info/edx, trampoline/ecx, video/stk) using fastcall. */
         call    reloc
+        add     $4, %esp
+
 #ifdef CONFIG_PVH_GUEST
         cmpb    $0, sym_esi(pvh_boot)
         je      1f
@@ -848,9 +849,9 @@ trampoline_setup:
         testl   $MBI_CMDLINE,MB_flags(%ebx)
         jz      1f
 
-        lea     sym_esi(early_boot_opts),%eax
-        push    %eax
-        pushl   MB_cmdline(%ebx)
+        lea     sym_esi(early_boot_opts), %edx
+        mov     MB_cmdline(%ebx), %eax
+        /*      cmdline_parse_early(cmdline/eax, opts/edx) using fastcall. */
         call    cmdline_parse_early
 
 1:
@@ -871,7 +872,7 @@ trampoline_setup:
 
         /*
          * cmdline and reloc are written in C, and linked to be 32bit PIC with
-         * entrypoints at 0 and using the stdcall convention.
+         * entrypoints at 0 and using the fastcall convention.
          */
 FUNC(cmdline_parse_early)
         .incbin "cmdline.bin"
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 1e3a30fab0c6..201e38d5445d 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -14,10 +14,10 @@
 
 /*
  * This entry point is entered from xen/arch/x86/boot/head.S with:
- *   - 0x04(%esp) = MAGIC,
- *   - 0x08(%esp) = INFORMATION_ADDRESS,
- *   - 0x0c(%esp) = TOPMOST_LOW_MEMORY_STACK_ADDRESS.
- *   - 0x10(%esp) = BOOT_VIDEO_INFO_ADDRESS.
+ *   - %eax       = MAGIC,
+ *   - %edx       = INFORMATION_ADDRESS,
+ *   - %ecx       = TOPMOST_LOW_MEMORY_STACK_ADDRESS.
+ *   - 0x04(%esp) = BOOT_VIDEO_INFO_ADDRESS.
  */
 asm (
     "    .text                         \n"
@@ -353,8 +353,8 @@ static multiboot_info_t *mbi2_reloc(uint32_t mbi_in, uint32_t video_out)
 }
 
 /* SAF-1-safe */
-void *__attribute__((__stdcall__))
-reloc(uint32_t magic, uint32_t in, uint32_t trampoline, uint32_t video_info)
+void *reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
+            uint32_t video_info)
 {
     alloc = trampoline;
 

base-commit: e884903ec56be8b0cc658cc5ba7c1cb70f25208d
prerequisite-patch-id: eb50bac1dc5f4cec5653dfe46bb2c714035c8235
prerequisite-patch-id: f08a81c17bc5d1fbc73ad681dd834e077929fbd4
prerequisite-patch-id: ee066a61cacb309e0a9a186051a380ab985e7d63
prerequisite-patch-id: 78e4e47fd945ab266604b208a735601eed301017
-- 
2.39.2


