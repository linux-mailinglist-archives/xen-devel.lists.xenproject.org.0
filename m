Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200F973D0B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 18:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795865.1205349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3XY-0007Uf-9W; Tue, 10 Sep 2024 16:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795865.1205349; Tue, 10 Sep 2024 16:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3XY-0007PK-61; Tue, 10 Sep 2024 16:16:28 +0000
Received: by outflank-mailman (input) for mailman id 795865;
 Tue, 10 Sep 2024 16:16:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQ+P=QI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1so3XW-00073b-Tw
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 16:16:26 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06ac1364-6f90-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 18:16:25 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so7151690a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 09:16:25 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd468a1sm4397405a12.26.2024.09.10.09.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 09:16:23 -0700 (PDT)
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
X-Inumbo-ID: 06ac1364-6f90-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725984984; x=1726589784; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=733LuTti2vz+EFR0bf9WFVrkc1aXhrThkAewtQ4pEBM=;
        b=fFND9lh1eonI7MVJk7KSL+jucQB/1024/f0poR1BVZ1mR3MYpe8xkSiGe6ShJraipO
         GV7pineQyB6i1B6HKh+vd/MrdFjRCwjSzN2MR72tWSfVbybYAfO2XYh34A1OX4jHLEKc
         H0uj2dNfkI/NhSkuUk2xaJgMqDfExfAZaqODo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725984984; x=1726589784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=733LuTti2vz+EFR0bf9WFVrkc1aXhrThkAewtQ4pEBM=;
        b=lU8e03ZW0pbjfbVNJ68JD/7JiSCw8qaEdaFHqsTjvq8vjRmOKaCIwLCp9FqpEpHPRK
         b9YFOnmOTaca9++3Q57QHksqNilliYV6WBdM3YwE1jZrZsAhIWkbfprRp5oPc0rGXP5w
         Z364ds4zsOvkTsfsM1cN0wi3IJ10yq8DWWwoHIaE/jRVvNZUfwd7Z7KYoOBFxkYMYXsF
         tz/ECHHUrEmcXucvzhZkIRB+JjuwkP86vbei1b7idpxPbRLckvfdiJMJI2iqNWM8W6dz
         P3JejkhLhLQetHWAEHleTew9P0RzwTkwOWyLs8it5gfciBIt85KSK20zeMXnEH+Zbk14
         NnlQ==
X-Gm-Message-State: AOJu0Yy7k1A49St+sM+dQW2wP9ja0wsbKtLKgNDbjO/sLe0ymwf6l+eD
	+jQWARoS+sq7ftjQXAAXvdL+Thm0U3wSipUONdVmk1MzyEmHChDUqdp/iNoaHdaT7sUOZd8DzS9
	D
X-Google-Smtp-Source: AGHT+IH161caz/hrEEDmu9rbaORyuKaIBN8RaZW2Jp2SQC5GDgiJwwYUecWOIrC97hdu248Z+GXJJQ==
X-Received: by 2002:a05:6402:5254:b0:5c2:caf6:64d4 with SMTP id 4fb4d7f45d1cf-5c3dc78dbaamr10636424a12.12.1725984984320;
        Tue, 10 Sep 2024 09:16:24 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/3] x86/boot: Refactor BIOS/PVH start
Date: Tue, 10 Sep 2024 17:16:11 +0100
Message-Id: <20240910161612.242702-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910161612.242702-1-frediano.ziglio@cloud.com>
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2 code paths were sharing quite some common code, reuse it instead
of having duplications.
Use %ebp register to store boot type before running common code.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 113 +++++++++++++++------------------------
 1 file changed, 44 insertions(+), 69 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index de118d72f2..a91413184c 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -25,6 +25,9 @@
 #define MB2_HT(name)      (MULTIBOOT2_HEADER_TAG_##name)
 #define MB2_TT(name)      (MULTIBOOT2_TAG_TYPE_##name)
 
+#define BOOT_TYPE_BIOS 1
+#define BOOT_TYPE_PVH 2
+
         .macro mb2ht_args arg:req, args:vararg
         .long \arg
         .ifnb \args
@@ -409,13 +412,28 @@ cs32_switch:
 ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .long sym_offs(__pvh_start))
 
 __pvh_start:
-        cld
         cli
+        mov     $BOOT_TYPE_PVH, %ebp
+        jmp     common_bios_pvh
+#endif /* CONFIG_PVH_GUEST */
+
+__start:
+        cli
+        mov     $BOOT_TYPE_BIOS, %ebp
+
+common_bios_pvh:
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
@@ -433,14 +451,9 @@ __pvh_start:
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 
-        call    initialise_bss
-
-        mov     %ebx, sym_esi(pvh_start_info_pa)
-
-        /* Force xen console.  Will revert to user choice in init code. */
-        movb    $-1, sym_esi(opt_console_xen)
-
-        /* Prepare gdt and segments */
+        /*
+         * Initialize GDTR and basic data segments.
+         */
         add     %esi, sym_esi(gdt_boot_base)
         lgdt    sym_esi(gdt_boot_descr)
 
@@ -449,67 +462,44 @@ __pvh_start:
         mov     %ecx, %es
         mov     %ecx, %ss
 
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
+        /* Load null descriptor to unused segment registers. */
+        xor     %ecx, %ecx
+        mov     %ecx, %fs
+        mov     %ecx, %gs
 
-initialise_bss:
         /*
          * Initialise the BSS.
          *
          * !!! WARNING - also zeroes the current stack !!!
          */
-        pop     %ebp
         mov     %eax, %edx
-
         lea     sym_esi(__bss_start), %edi
         lea     sym_esi(__bss_end), %ecx
         sub     %edi, %ecx
         xor     %eax, %eax
         shr     $2, %ecx
         rep stosl
-
         mov     %edx, %eax
-        jmp     *%ebp
-
-__start:
-        cld
-        cli
 
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
-
-        /* Preserve the field we're about to clobber. */
-        mov     (%ebx), %edx
-        lea     4(%ebx), %esp
+#ifdef CONFIG_PVH_GUEST
+        cmp     $BOOT_TYPE_PVH, %ebp
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
 
-        call    initialise_bss
+        /* Set trampoline_phys to use mfn 1 to avoid having a mapping at VA 0 */
+        movw    $0x1000, sym_esi(trampoline_phys)
+        mov     (%ebx), %eax /* mov $XEN_HVM_START_MAGIC_VALUE, %eax */
+        jmp     trampoline_setup
+1:
+#endif /* CONFIG_PVH_GUEST */
 
         /* Bootloaders may set multiboot{1,2}.mem_lower to a nonzero value. */
         xor     %edx,%edx
@@ -568,22 +558,7 @@ __start:
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


