Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9649688F1
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 15:33:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787952.1197435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7Aw-0001gs-T1; Mon, 02 Sep 2024 13:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787952.1197435; Mon, 02 Sep 2024 13:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl7Aw-0001ak-O8; Mon, 02 Sep 2024 13:32:58 +0000
Received: by outflank-mailman (input) for mailman id 787952;
 Mon, 02 Sep 2024 13:32:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl7Au-0000uL-RV
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 13:32:56 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc33a439-692f-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 15:32:55 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a868b8bb0feso514405766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 06:32:55 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196975sm562333666b.135.2024.09.02.06.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 06:32:53 -0700 (PDT)
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
X-Inumbo-ID: dc33a439-692f-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725283974; x=1725888774; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVSfpr2fa6TJfrTtjhxFl5r7Fd98sI0EkF9Wzth3+h0=;
        b=b5ilD2r6tCOeVJnHhw32XSZ1az1Zdk6Tn/TUcZcR6T2LWBjAt5B5QfEudvJgct2fVw
         PbD5NLfJNXE1fcNLfpYJzKBNoha3prTqLQibUhy2i0747QofegylK0OTNyCsHKYZUahE
         MuwkFD2Pe+9LDpOOCq/b+qIyBlnvChYVUkc/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725283974; x=1725888774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVSfpr2fa6TJfrTtjhxFl5r7Fd98sI0EkF9Wzth3+h0=;
        b=wJcnew18aCYQVxAByncqpZOQb3ppm17CE66VIp/YN0wivHPOJY+E05DDlk200qqutp
         jqPPqKYDGqrhFaBVP2qOt6I39EmBxM2qJV70ZEISr/rRuGmFyHTCwZ/JJpyXEw4leEW2
         NqMREIj09Ki6uzX1oCFAFIz8/bGMsL1Qt0Gxbg2b5ufStiqyYFEusNhR/Q5ai+Q+1Ull
         8NpcTAE8tph7JKy0SRnHVz7V0/XTg8iRpbLo+vrZnNtVGJAyAeUA7jQjnfINDQW4co0C
         ZhbkAYVBlq81hccyo2W7U16yjtKRuskfiUmAJRxJhdgZCCJvvxJK2j6fFt1+J7TqABef
         zdHQ==
X-Gm-Message-State: AOJu0YyOC7aJ6Kl8B2t+jbgQDHgjpQ9m8FsHR772PzluB0xbI2DYgKno
	wCWOIriPw8NOFW2jrydNIqKPb0ZvMMq2WuQt5wZO5HUZ2Mkm0p6IXRcBnOwzwS9hXBbmqZxWQN/
	v
X-Google-Smtp-Source: AGHT+IF8I+a5pKvl+y6zQSzuoQKoJt6tDqoETst5kvCX0Rcy+oWXb32xqp32QR6ulU2uwfWAgw8vTg==
X-Received: by 2002:a17:907:980c:b0:a86:8f57:7de0 with SMTP id a640c23a62f3a-a89a37aa9famr721201366b.49.1725283973599;
        Mon, 02 Sep 2024 06:32:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>
Subject: [PATCH 4/4] x86/boot: Use fastcall for 32bit code
Date: Mon,  2 Sep 2024 14:32:32 +0100
Message-Id: <20240902133232.3302839-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
References: <20240902133232.3302839-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>

RFC.  This doesn't boot, but I haven't quite figured out where yet.
---
 xen/arch/x86/boot/Makefile  |  2 +-
 xen/arch/x86/boot/cmdline.c |  7 +++----
 xen/arch/x86/boot/head.S    | 15 +++++++++------
 xen/arch/x86/boot/reloc.c   | 12 ++++++------
 4 files changed, 19 insertions(+), 17 deletions(-)

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
index bdd5b95c224b..6eddbb37b5b9 100644
--- a/xen/arch/x86/boot/cmdline.c
+++ b/xen/arch/x86/boot/cmdline.c
@@ -20,8 +20,8 @@
 
 /*
  * This entry point is entered from xen/arch/x86/boot/head.S with:
- *   - 0x4(%esp) = &cmdline,
- *   - 0x8(%esp) = &early_boot_opts.
+ *   - %eax      = &cmdline,
+ *   - %ecx      = &early_boot_opts.
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
index d867b015d961..b745a7cd3a26 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -613,10 +613,13 @@ trampoline_setup:
 
         /* Save Multiboot / PVH info struct (after relocation) for later use. */
         push    %edx                /* Boot video info to be filled from MB2. */
-        push    %ecx                /* Bottom-most low-memory stack address. */
-        push    %ebx                /* Multiboot / PVH information address. */
-        push    %eax                /* Magic number. */
+        mov     %ecx, %edx          /* Bottom-most low-memory stack address. */
+        mov     %ebx, %ecx          /* Multiboot / PVH information address. */
+                                    /* Magic number. */
+        /*      reloc(magic, info, trampoline, video) using fastcall(a, c, d, stk). */
         call    reloc
+        add     $4, %esp
+
 #ifdef CONFIG_PVH_GUEST
         cmpb    $0, sym_esi(pvh_boot)
         je      1f
@@ -848,9 +851,9 @@ trampoline_setup:
         testl   $MBI_CMDLINE,MB_flags(%ebx)
         jz      1f
 
-        lea     sym_esi(early_boot_opts),%eax
-        push    %eax
-        pushl   MB_cmdline(%ebx)
+        lea     sym_esi(early_boot_opts), %ecx
+        lea     MB_cmdline(%ebx), %eax
+        /*      cmdline_parse_early(cmdline, opts) using fastcall(a, c). */
         call    cmdline_parse_early
 
 1:
diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index 1e3a30fab0c6..32acded81d78 100644
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
+ *   - %ecx       = INFORMATION_ADDRESS,
+ *   - %edx       = TOPMOST_LOW_MEMORY_STACK_ADDRESS.
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
 
-- 
2.39.2


