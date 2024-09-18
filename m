Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED46197BA10
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 11:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800212.1210130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqqty-0001sC-H7; Wed, 18 Sep 2024 09:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800212.1210130; Wed, 18 Sep 2024 09:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqqty-0001l9-BS; Wed, 18 Sep 2024 09:23:10 +0000
Received: by outflank-mailman (input) for mailman id 800212;
 Wed, 18 Sep 2024 09:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PNE=QQ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sqqtw-0001Ui-Ch
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 09:23:08 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d442966-759f-11ef-a0b8-8be0dac302b0;
 Wed, 18 Sep 2024 11:23:07 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c25f01879fso7987047a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2024 02:23:07 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a906109718bsm559125666b.34.2024.09.18.02.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 02:23:05 -0700 (PDT)
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
X-Inumbo-ID: 9d442966-759f-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726651386; x=1727256186; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r01uCFOVhRmbJDw3bVCuq7NRFDQWjnUurZDGXfwV2lk=;
        b=ajVzej22duliM6qC9zye6SSulkWhsJrSDFKyP1wFpDifd1idF/qAheruDsYgy5VK7J
         6G1HJzRe+kXaDbStn+624K9VVIEIrn9AIMl3x/1l8LQyKYY6DndxC2uewYUokY2TF6tK
         A4alOAoqfOyh9Zy3PvLXesRBmtfRifvuivOdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726651386; x=1727256186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r01uCFOVhRmbJDw3bVCuq7NRFDQWjnUurZDGXfwV2lk=;
        b=DqOV//NeSwEhD7+YMH91l7CjfD1Kp7ZgSGbkisO0vDrINOmhhMEwX6eQPgq/sJkkiP
         gmyRNOQlllRXwxr6XQIgNI+fOBVmvFEAWa4hPqHCGQvxP1PcZjJqZYxipwrHp59wgOTK
         3uaB03ymxLfTrElLtVX+Gpm4T2rCetYmAjXkBwoidBr761HpRq5GVp4ms76QuGb5HcoX
         xNd70UVrg5Nyh4lCITGeyxCp+WBl5pKoqa5aQNzZewnPS3ydhqubjwbmf0mEIpCmh96W
         GCGCk0maIC8DLCXhihHwsDf37WT+oFK/PFIeVU5khpGX0lFVohnShHzyyZoaYk8S5hSQ
         iC5g==
X-Gm-Message-State: AOJu0YwRgGBqFpUk4fiS0qqLrlmPOpUp9y0RX3r1BAxLBmKuReo3fkMw
	CmMCk5i+t43yHuHdfbJ/7V4MMJWB3iEk1IWK9pQpGKoBIWEsfiOKetwOhJFGLyI3t9SYsWqDQvJ
	R
X-Google-Smtp-Source: AGHT+IHPinPyYO6ZCTy5tvfrTnyPhdSSEqD+0CygaRoCx04yxCB7QsROO+h2sp0aKDEsU3DFy7IXDA==
X-Received: by 2002:a17:907:868e:b0:a86:743a:a716 with SMTP id a640c23a62f3a-a902966bc54mr2122605366b.53.1726651386194;
        Wed, 18 Sep 2024 02:23:06 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/4] x86/boot: Refactor BIOS/PVH start
Date: Wed, 18 Sep 2024 10:22:53 +0100
Message-Id: <20240918092255.13527-3-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918092255.13527-1-frediano.ziglio@cloud.com>
References: <20240918092255.13527-1-frediano.ziglio@cloud.com>
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
---
 xen/arch/x86/boot/head.S | 118 +++++++++++++++------------------------
 1 file changed, 45 insertions(+), 73 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 182b74e53f..f18c15c666 100644
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
@@ -409,17 +412,31 @@ cs32_switch:
 ELFNOTE(Xen, XEN_ELFNOTE_PHYS32_ENTRY, .long sym_offs(__pvh_start))
 
 __pvh_start:
-        cld
+        mov     $BOOT_TYPE_PVH, %dl
+        jmp     .Lcommon_bios_pvh
+#endif /* CONFIG_PVH_GUEST */
+
+__start:
+        mov     $BOOT_TYPE_BIOS, %dl
+
+.Lcommon_bios_pvh:
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
-        mov     (%ebx), %edx
+        mov     (%ebx), %ecx
         lea     4(%ebx), %esp
 
         /* Calculate the load base address. */
@@ -428,19 +445,12 @@ __pvh_start:
         sub     $sym_offs(1b), %esi
 
         /* Restore the clobbered field. */
-        mov     %edx, (%ebx)
+        mov     %ecx, (%ebx)
 
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
 
@@ -449,67 +459,44 @@ __pvh_start:
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
+        /* Load null selector to unused segment registers. */
+        xor     %ecx, %ecx
+        mov     %ecx, %fs
+        mov     %ecx, %gs
 
-.Linitialise_bss:
         /*
          * Initialise the BSS.
          *
          * !!! WARNING - also zeroes the current stack !!!
          */
-        pop     %ebp
-        mov     %eax, %edx
-
+        mov     %eax, %ebp
         lea     sym_esi(__bss_start), %edi
         lea     sym_esi(__bss_end), %ecx
         sub     %edi, %ecx
         xor     %eax, %eax
         shr     $2, %ecx
         rep stosl
+        mov     %ebp, %eax
 
-        mov     %edx, %eax
-        jmp     *%ebp
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
-
-        /* Preserve the field we're about to clobber. */
-        mov     (%ebx), %edx
-        lea     4(%ebx), %esp
+#ifdef CONFIG_PVH_GUEST
+        cmp     $BOOT_TYPE_PVH, %dl
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
@@ -568,22 +555,7 @@ __start:
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


