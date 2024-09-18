Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E093C97BA13
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 11:23:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800211.1210124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqqty-0001lJ-5e; Wed, 18 Sep 2024 09:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800211.1210124; Wed, 18 Sep 2024 09:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqqty-0001j8-0K; Wed, 18 Sep 2024 09:23:10 +0000
Received: by outflank-mailman (input) for mailman id 800211;
 Wed, 18 Sep 2024 09:23:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PNE=QQ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sqqtv-0001Ui-UP
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 09:23:07 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cfd1f7d-759f-11ef-a0b8-8be0dac302b0;
 Wed, 18 Sep 2024 11:23:06 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c24c92f699so7028651a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2024 02:23:06 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a906109718bsm559125666b.34.2024.09.18.02.23.04
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
X-Inumbo-ID: 9cfd1f7d-759f-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726651386; x=1727256186; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiqJyrFMaC770o/mcU/mGV/x9SPshXQY9Acm8HRzZDM=;
        b=HtolMe8kph3J9rBNu6i6X62frhe9f/ROs8cXEST2k+tjYvt9UG92PzNqapB/CWKwnz
         H2lWOt6gRNDF8Z/7U2JvLJus2GnjSS2O1SWCmw52r32d7cW4UFz+bF3EflZhW9fZ9M+H
         xDtyv/3vfins0DM47ddJW107IsiExMRQ8qzuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726651386; x=1727256186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GiqJyrFMaC770o/mcU/mGV/x9SPshXQY9Acm8HRzZDM=;
        b=OuzQghXVAbuxM5CLTqQKQWHrF5a8EwtrwL+wPpq/prBgxh75fybtRPCgvDWsqr1Cvf
         6qUX8vTvZqXsnGMcsUy0USIDfd0W5SsKdXx0JAOrxhOC7Dn0aH2d+usP7VK4hxBUS/2b
         3rsw55lWikm5NVVsLzi3yie/bAXY4xPKvLi8iiGXCybdlFjgGOusVhmPaM7gOz9xcDbs
         gfycjtpCCYLpuSPLjw25yaokL2seUDEnIFHZbLYoLLxdNJWK05yAKD58aLHpojNDMAMw
         E5wt50E7f6WQ4SM4noOqy9UQ7Qo3R76dwHe0ZaxlrQJ/r/7wyoZK122BZbuX9QemaXQI
         C8dw==
X-Gm-Message-State: AOJu0YxaNgAATlUYUTgAyOYLDy6G7iluVV16y1AwEk/VnkLjuy7Kf8xg
	3/qtL3SQuMLoj5YPL+NsvlnZTch3GXM+Royo5csaMfZ3zwk2cyPuRqo/jJM9vBlmudtvIIbAGyG
	4
X-Google-Smtp-Source: AGHT+IGc5vre66vZUMWNspvmHfkOcMk9rCWuOrlth9OUNq0QoNaOKn1bvXqjbsoBeHYO28/9MPkxWg==
X-Received: by 2002:a17:907:f14a:b0:a86:9ba1:639e with SMTP id a640c23a62f3a-a9029486e83mr2050128266b.26.1726651385486;
        Wed, 18 Sep 2024 02:23:05 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 1/4] x86/boot: Initialise BSS sooner
Date: Wed, 18 Sep 2024 10:22:52 +0100
Message-Id: <20240918092255.13527-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918092255.13527-1-frediano.ziglio@cloud.com>
References: <20240918092255.13527-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows to call C code earlier.
In order to safely call C code we need to setup stack, selectors and BSS.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- improve commit message;
- improve some comments;
- fix some code style (spacing);
- set trampoline_phys as 32 bit value;
- use PAGE_SIZE mnemonic instead of 0x1000;
- use local label.
---
 xen/arch/x86/boot/head.S | 86 ++++++++++++++++++++--------------------
 1 file changed, 44 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 12bbb97f33..182b74e53f 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -231,6 +231,27 @@ __efi64_mb2_start:
         /* VGA is not available on EFI platforms. */
         movl   $0,vga_text_buffer(%rip)
 
+        /*
+         * Align the stack as UEFI spec requires. Keep it aligned
+         * before efi_multiboot2() call by pushing/popping even
+         * numbers of items on it.
+         */
+        and     $~15, %rsp
+
+        /*
+         * Initialize BSS (no nasty surprises!).
+         * It must be done earlier than in BIOS case
+         * because efi_multiboot2() touches it.
+         */
+        mov     %eax, %edx
+        lea     __bss_start(%rip), %edi
+        lea     __bss_end(%rip), %ecx
+        sub     %edi, %ecx
+        shr     $3, %ecx
+        xor     %eax, %eax
+        rep stosq
+        mov     %edx, %eax
+
         /* Check for Multiboot2 bootloader. */
         cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
         je      .Lefi_multiboot2_proto
@@ -321,34 +342,12 @@ __efi64_mb2_start:
         lea     .Lmb2_no_ih(%rip),%r15
         jz      x86_32_switch
 
-        /*
-         * Align the stack as UEFI spec requires. Keep it aligned
-         * before efi_multiboot2() call by pushing/popping even
-         * numbers of items on it.
-         */
-        and     $~15,%rsp
-
         /* Save Multiboot2 magic on the stack. */
         push    %rax
 
         /* Save EFI ImageHandle on the stack. */
         push    %rdi
 
-        /*
-         * Initialize BSS (no nasty surprises!).
-         * It must be done earlier than in BIOS case
-         * because efi_multiboot2() touches it.
-         */
-        lea     __bss_start(%rip),%edi
-        lea     __bss_end(%rip),%ecx
-        sub     %edi,%ecx
-        shr     $3,%ecx
-        xor     %eax,%eax
-        rep stosq
-
-        /* Keep the stack aligned. Do not pop a single item off it. */
-        mov     (%rsp),%rdi
-
         /*
          * efi_multiboot2() is called according to System V AMD64 ABI:
          *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
@@ -434,6 +433,8 @@ __pvh_start:
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 
+        call    .Linitialise_bss
+
         mov     %ebx, sym_esi(pvh_start_info_pa)
 
         /* Force xen console.  Will revert to user choice in init code. */
@@ -459,6 +460,25 @@ __pvh_start:
 
 #endif /* CONFIG_PVH_GUEST */
 
+.Linitialise_bss:
+        /*
+         * Initialise the BSS.
+         *
+         * !!! WARNING - also zeroes the current stack !!!
+         */
+        pop     %ebp
+        mov     %eax, %edx
+
+        lea     sym_esi(__bss_start), %edi
+        lea     sym_esi(__bss_end), %ecx
+        sub     %edi, %ecx
+        xor     %eax, %eax
+        shr     $2, %ecx
+        rep stosl
+
+        mov     %edx, %eax
+        jmp     *%ebp
+
 __start:
         cld
         cli
@@ -489,6 +509,8 @@ __start:
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 
+        call    .Linitialise_bss
+
         /* Bootloaders may set multiboot{1,2}.mem_lower to a nonzero value. */
         xor     %edx,%edx
 
@@ -645,26 +667,6 @@ trampoline_setup:
          * reserved for trampoline code and data.
          */
 
-        /*
-         * Do not zero BSS on EFI platform here.
-         * It was initialized earlier.
-         */
-        cmpb    $0, sym_esi(efi_platform)
-        jnz     1f
-
-        /*
-         * Initialise the BSS.
-         *
-         * !!! WARNING - also zeroes the current stack !!!
-         */
-        lea     sym_esi(__bss_start), %edi
-        lea     sym_esi(__bss_end), %ecx
-        sub     %edi,%ecx
-        xor     %eax,%eax
-        shr     $2,%ecx
-        rep stosl
-
-1:
         /* Interrogate CPU extended features via CPUID. */
         mov     $1, %eax
         cpuid
-- 
2.34.1


