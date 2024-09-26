Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162E0986C08
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 07:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.804853.1215831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sth3Y-00052W-0S; Thu, 26 Sep 2024 05:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 804853.1215831; Thu, 26 Sep 2024 05:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sth3X-0004v9-QB; Thu, 26 Sep 2024 05:28:47 +0000
Received: by outflank-mailman (input) for mailman id 804853;
 Thu, 26 Sep 2024 05:28:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GedV=QY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sth3W-0004tQ-Rm
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 05:28:46 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32b2c8e4-7bc8-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 07:28:44 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d2b4a5bf1so70206866b.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 22:28:44 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f34086sm304441766b.41.2024.09.25.22.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 22:28:43 -0700 (PDT)
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
X-Inumbo-ID: 32b2c8e4-7bc8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727328524; x=1727933324; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwofjj50ltUTOVZzBfIluKeOIBBnzcztZu6c+9OHO8Q=;
        b=eQAtuX+TMAXCEnRZiVhsH6ndbTDud0ZSD+80ORiKwHUTwybfbXGGIKTFTh6GB71rz0
         ktgfySKFoyqcPRvmY2MzRKsgiY/3nbRQ7PjlsdAy1DJFkqAU31Vw9olY1UjU8uQLG/ah
         E8/GLKO7+MkD73c0Et7Z2WXm/BQz0xKdP+D9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727328524; x=1727933324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwofjj50ltUTOVZzBfIluKeOIBBnzcztZu6c+9OHO8Q=;
        b=ecCZR/QWMcO4UbAqYwZzaY7bhHaIFUgLuZCo6q/0uRWQIKWoL0Q1ng4cuq+IvI3KI0
         siDq9DIIY916+c4vAYpA2lh3mBVXOsAqkJZ0LH3uW7pmc+r58LxnYUIpJAwGB5OxP5zm
         zLZB1Jp4MJInGiEzgHzzgMrfTJ/qCSRTaeQuR7x8vHJRsbYRcY3y0ONEYkUyTJjjK3W8
         ZwNsfYKccbCSAWdAK4IvbqSm/l3FjX7/+C7qjxKXGsYB7mX07niQpi17Y1dkPrxEBN6k
         h4Ffz367o17ehf96RsDeTyBSMEGoW7rlVTuWxYIKvs15ia+Lmx1ONXg2BkgWw5p6AYql
         J3Hw==
X-Gm-Message-State: AOJu0Yxw88kkzwoTGzGgQlrTWyVe8KErHgCo8nebnTinH0uFIiPONldj
	wJeKJEDSXxZk2ce06N0M2akibfdUxSN6SKcfcImGTKdloGnKySXQEzrV41t1nzIH4F2D6mxqJdB
	M
X-Google-Smtp-Source: AGHT+IH/iVb6/rDUZRj9PZVEp2ihvQl8ItVyJ3KNwD+XK9ogA7JPKJ9FZlmT6loRZvmwAJzVrXAaxw==
X-Received: by 2002:a17:907:ea8:b0:a8b:154b:7643 with SMTP id a640c23a62f3a-a93a03abebamr406650866b.28.1727328523883;
        Wed, 25 Sep 2024 22:28:43 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v5 1/3] x86/boot: Refactor BIOS/PVH start
Date: Thu, 26 Sep 2024 06:28:31 +0100
Message-Id: <20240926052833.465510-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926052833.465510-1-frediano.ziglio@cloud.com>
References: <20240926052833.465510-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2 code paths were sharing quite some common code, reuse it instead
of having duplications.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- use %dl instead of %ebp to reduce code size;
- fold cli instruction;
- update some comments.

Changes since v3:
- dropped %dl and constant, distinguish entry by magic.

Changes since v4:
- remove old sentence from commit message;
- fixed a typo;
- load XEN_HVM_START_MAGIC_VALUE constant directly;
- set %fs and %gs as other segment registers;
- remove some spurious line changes.
---
 xen/arch/x86/boot/head.S | 104 ++++++++++++++-------------------------
 1 file changed, 37 insertions(+), 67 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 267207e5a2..6e3f791248 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -25,6 +25,8 @@
 #define MB2_HT(name)      (MULTIBOOT2_HEADER_TAG_##name)
 #define MB2_TT(name)      (MULTIBOOT2_TAG_TYPE_##name)
 
+#define XEN_HVM_START_MAGIC_VALUE 0x336ec578
+
         .macro mb2ht_args arg:req, args:vararg
         .long \arg
         .ifnb \args
@@ -409,13 +411,27 @@ cs32_switch:
 ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .long sym_offs(__pvh_start))
 
 __pvh_start:
-        cld
+        mov     $XEN_HVM_START_MAGIC_VALUE, %eax
+        /*
+         * Fall through into BIOS code.
+         * We will use %eax to distinguish we came from PVH entry point.
+         */
+#endif /* CONFIG_PVH_GUEST */
+
+__start:
         cli
+        cld
 
         /*
-         * We need one call (i.e. push) to determine the load address.  See
-         * __start for a discussion on how to do this safely using the PVH
-         * info structure.
+         * Multiboot (both 1 and 2) and PVH specify the stack pointer as
+         * undefined.  This is unhelpful for relocatable images, where one
+         * call (i.e. push) is required to calculate the image's load address.
+         *
+         * Durig BIOS boot, there is one area of memory we know about with
+         * reasonable confidence that it isn't overlapped by Xen, and that's
+         * the Multiboot info structure in %ebx.  Use it as a temporary stack.
+         *
+         * During PVH boot use info structure in %ebx.
          */
 
         /* Preserve the field we're about to clobber. */
@@ -433,14 +449,7 @@ __pvh_start:
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 
-        call    .Linitialise_bss
-
-        mov     %ebx, sym_esi(pvh_start_info_pa)
-
-        /* Force xen console.  Will revert to user choice in init code. */
-        movb    $-1, sym_esi(opt_console_xen)
-
-        /* Prepare gdt and segments */
+        /* Initialize GDTR and basic data segments. */
         add     %esi, sym_esi(gdt_boot_base)
         lgdt    sym_esi(gdt_boot_descr)
 
@@ -448,19 +457,9 @@ __pvh_start:
         mov     %ecx, %ds
         mov     %ecx, %es
         mov     %ecx, %ss
+        mov     %ecx, %fs
+        mov     %ecx, %gs
 
-        /* Skip bootloader setup and bios setup, go straight to trampoline */
-        movb    $1, sym_esi(pvh_boot)
-        movb    $1, sym_esi(skip_realmode)
-
-        /* Set trampoline_phys to use mfn 1 to avoid having a mapping at VA 0 */
-        movw    $0x1000, sym_esi(trampoline_phys)
-        mov     (%ebx), %eax /* mov $XEN_HVM_START_MAGIC_VALUE, %eax */
-        jmp     trampoline_setup
-
-#endif /* CONFIG_PVH_GUEST */
-
-.Linitialise_bss:
         /* Initialise the BSS.  Preserve %eax (BOOTLOADER_MAGIC). */
         mov     %eax, %ebp
 
@@ -472,39 +471,25 @@ __pvh_start:
         rep stosl
 
         mov     %ebp, %eax
-        ret
-
-__start:
-        cld
-        cli
-
-        /*
-         * Multiboot (both 1 and 2) specify the stack pointer as undefined
-         * when entering in BIOS circumstances.  This is unhelpful for
-         * relocatable images, where one call (i.e. push) is required to
-         * calculate the image's load address.
-         *
-         * This early in boot, there is one area of memory we know about with
-         * reasonable confidence that it isn't overlapped by Xen, and that's
-         * the Multiboot info structure in %ebx.  Use it as a temporary stack.
-         */
 
-        /* Preserve the field we're about to clobber. */
-        mov     (%ebx), %edx
-        lea     4(%ebx), %esp
+#ifdef CONFIG_PVH_GUEST
+        cmp     $XEN_HVM_START_MAGIC_VALUE, %eax
+        jne     1f
 
-        /* Calculate the load base address. */
-        call    1f
-1:      pop     %esi
-        sub     $sym_offs(1b), %esi
+        mov     %ebx, sym_esi(pvh_start_info_pa)
 
-        /* Restore the clobbered field. */
-        mov     %edx, (%ebx)
+        /* Force xen console.  Will revert to user choice in init code. */
+        movb    $-1, sym_esi(opt_console_xen)
 
-        /* Set up stack. */
-        lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
+        /* Skip bootloader setup and bios setup, go straight to trampoline */
+        movb    $1, sym_esi(pvh_boot)
+        movb    $1, sym_esi(skip_realmode)
 
-        call    .Linitialise_bss
+        /* Set trampoline_phys to use mfn 1 to avoid having a mapping at VA 0 */
+        movl    $PAGE_SIZE, sym_esi(trampoline_phys)
+        jmp     trampoline_setup
+1:
+#endif /* CONFIG_PVH_GUEST */
 
         /* Bootloaders may set multiboot{1,2}.mem_lower to a nonzero value. */
         xor     %edx,%edx
@@ -563,22 +548,7 @@ __start:
 trampoline_bios_setup:
         /*
          * Called on legacy BIOS platforms only.
-         *
-         * Initialize GDTR and basic data segments.
          */
-        add     %esi,sym_esi(gdt_boot_base)
-        lgdt    sym_esi(gdt_boot_descr)
-
-        mov     $BOOT_DS,%ecx
-        mov     %ecx,%ds
-        mov     %ecx,%es
-        mov     %ecx,%ss
-        /* %esp is initialized later. */
-
-        /* Load null descriptor to unused segment registers. */
-        xor     %ecx,%ecx
-        mov     %ecx,%fs
-        mov     %ecx,%gs
 
         /* Set up trampoline segment 64k below EBDA */
         movzwl  0x40e,%ecx          /* EBDA segment */
-- 
2.34.1


