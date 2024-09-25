Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DA29852C1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 08:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803448.1214024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stL5W-00039k-Fo; Wed, 25 Sep 2024 06:01:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803448.1214024; Wed, 25 Sep 2024 06:01:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stL5W-00037h-C1; Wed, 25 Sep 2024 06:01:22 +0000
Received: by outflank-mailman (input) for mailman id 803448;
 Wed, 25 Sep 2024 06:01:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N7N=QX=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stL5T-0002f4-Vx
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 06:01:19 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 955e1273-7b03-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 08:01:19 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5356bb55224so8557881e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 23:01:19 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf49de00sm1498937a12.55.2024.09.24.23.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 23:01:15 -0700 (PDT)
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
X-Inumbo-ID: 955e1273-7b03-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727244078; x=1727848878; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPTBonMqIKr1Gh1WSmKkngmOhz6efABUMJImPAurUOk=;
        b=aXLjztczSTa3ba2gYWA7jzQvb/f8e3Gcrna5kr87EffZUZD5lUvhxzK5SSx0mHx1YK
         trvN4H6W9BYsL33YDEu3NlRv+IZ3S53XvuSrkEJV8G3/04zfXnFm5fXGXkZouxpQjVT4
         iLf+zKqdJWXXKVd0rcnMMkARYjsheCE1CFc7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727244078; x=1727848878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kPTBonMqIKr1Gh1WSmKkngmOhz6efABUMJImPAurUOk=;
        b=TLcWrbnEin53ffjXlYi9v5C1Lp4ecqS0bbjg3n5YaS/7T77ALwb8TnPS6dCit7CTPU
         JwzYETD+R8EHeTJ0juH51AxuERSpvWLGOd16HP1tVgnnlE5kG4C2Y3TxjxGoAvL0M5W4
         OFrnh7TU1AD04xm3gcoAp8I4QIcah/6YvKdyiDbck9jf/DgpoIlFrdY/ppAZflrFXEpE
         GNxUoYw3PRa5zVDYdyGbEfSzlJC97MfGqROGB9uZ7BdRSmwMz599FOtN6pii23NITC8n
         Mx7yokQ/YcwCCKDYmaBXG7oLCNIUyh3+skY1agd65suihcDj/ySzW8RJspn3d7BZP1BG
         ziuQ==
X-Gm-Message-State: AOJu0YxX7nN6XBTybmlumtFbKd0UBrTKNxNzteqXLcGcu8/GTpZTbX8k
	LYvLOKtrNqduei8IyU6yiu3A5vnxdgzkoaD2zs7ZoL88RbO4PAI8mnSHhujWkzudbuh8G1hrzh6
	p
X-Google-Smtp-Source: AGHT+IGfxAPkHF82/MgXoJ0SIUMRhoH0ZoSo/6R1zTW8wQLGgoZoF07X2qgHKuSEX7bfmgdR477DDg==
X-Received: by 2002:a05:6512:e8c:b0:533:4817:7280 with SMTP id 2adb3069b0e04-53877537533mr856227e87.35.1727244077586;
        Tue, 24 Sep 2024 23:01:17 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 2/4] x86/boot: Refactor BIOS/PVH start
Date: Wed, 25 Sep 2024 07:00:59 +0100
Message-Id: <20240925060101.259244-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925060101.259244-1-frediano.ziglio@cloud.com>
References: <20240925060101.259244-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2 code paths were sharing quite some common code, reuse it instead
of having duplications.
Use %dl register to store boot type before running common code.
Using a 8 bit register reduces code size.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- use %dl instead of %ebp to reduce code size;
- fold cli instruction;
- update some comments.

Changes since v3:
- dropped %dl and constant, distinguish entry by magic.
---
 xen/arch/x86/boot/head.S | 108 +++++++++++++++------------------------
 1 file changed, 40 insertions(+), 68 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 267207e5a2..2d2f56ad22 100644
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
+        mov     (%ebx), %eax /* mov $XEN_HVM_START_MAGIC_VALUE, %eax */
+        /*
+         * Fall through into BIOS code.
+         * We will use %eax to distinguish we came from PHV entry point.
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
 
@@ -449,62 +458,40 @@ __pvh_start:
         mov     %ecx, %es
         mov     %ecx, %ss
 
-        /* Skip bootloader setup and bios setup, go straight to trampoline */
-        movb    $1, sym_esi(pvh_boot)
-        movb    $1, sym_esi(skip_realmode)
+        /* Load null selector to unused segment registers. */
+        xor     %ecx, %ecx
+        mov     %ecx, %fs
+        mov     %ecx, %gs
 
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
-
         lea     sym_esi(__bss_start), %edi
         lea     sym_esi(__bss_end), %ecx
         sub     %edi, %ecx
         xor     %eax, %eax
         shr     $2, %ecx
         rep stosl
-
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
+        mov     (%ebx), %eax /* mov $XEN_HVM_START_MAGIC_VALUE, %eax */
+        jmp     trampoline_setup
+1:
+#endif /* CONFIG_PVH_GUEST */
 
         /* Bootloaders may set multiboot{1,2}.mem_lower to a nonzero value. */
         xor     %edx,%edx
@@ -563,22 +550,7 @@ __start:
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


