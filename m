Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5204198439B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 12:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802567.1212864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st2mS-0007Xl-Q5; Tue, 24 Sep 2024 10:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802567.1212864; Tue, 24 Sep 2024 10:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st2mS-0007Vw-MA; Tue, 24 Sep 2024 10:28:28 +0000
Received: by outflank-mailman (input) for mailman id 802567;
 Tue, 24 Sep 2024 10:28:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CoXS=QW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1st2mR-0007VZ-Vm
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 10:28:27 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb92f643-7a5f-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 12:28:26 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-535be093a43so6540553e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 03:28:26 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf4c5081sm591002a12.64.2024.09.24.03.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 03:28:23 -0700 (PDT)
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
X-Inumbo-ID: bb92f643-7a5f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727173705; x=1727778505; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTvh5FpP24GQ5u9Y0eyXVqqFokFOyTySxqZLzVzv6YU=;
        b=M2SUXuAW9EztmjcD9uvLzWt99vCZLnREhHssYPIMHEK3NfMe3Uv3apgfnIZcjjI3Mq
         grt9kGozpzOmG5QqSjISWC54cYj79Sn+ZPRr47XiQKAfG2Dxn73710lZ33f/kk5szIYM
         ATNygzdi3lnxbF0pvDxAq5e8OEOCDXcHPGEwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727173705; x=1727778505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTvh5FpP24GQ5u9Y0eyXVqqFokFOyTySxqZLzVzv6YU=;
        b=ksUupvJ/cJZSEzZqKEML4HFnZ9d0ofspBA8GtIU8lG+IPO0fPf24QK36+DjkPI6LYl
         Ll2gHHgyvwP3Vgx/eO2QTw8HTLEJjXPc8QLhXAIiiG2Bugqu/J1ofSkOWd25tZZj0MAC
         jFcH/i4PVfKaBHApLbd5LLSQb/rbuSpTe8g8vhH56+EkLMmsq6nFrxfQyFjIhf/nCpGX
         W+7FPTDDAqTAhgO/kXeaLq+seJN7Gb8O8nrJVZJIT2aw5Ci+qA7XeCbds0215Swbc/LP
         et0NgzKpPee1P13BnYK6aydibeoY2JgDahqSyE4Pz9I7XYCI0H42er3lWUA8f4+lOkBi
         DIlQ==
X-Gm-Message-State: AOJu0YwMz//oBq42ZR6hrnJXilKp6butLuw5KxYmxg/+wi/JGC+gT58P
	LPLJTp4XK3/AXe/x2XObQk2/wzBG0SQdS/+5DB0Z5waT0JNQet/+SR6MPacvACPRckThMkQjzpm
	D
X-Google-Smtp-Source: AGHT+IFCiUPYg2O6rtsQasACw8/OXkWmucHNFBulSRtkW+sl+RytQsrUepo2qwqxeUk7rDwa4nOXcQ==
X-Received: by 2002:a05:6512:e94:b0:533:45dc:d2f0 with SMTP id 2adb3069b0e04-536ac320123mr7917766e87.46.1727173705033;
        Tue, 24 Sep 2024 03:28:25 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 1/4] x86/boot: Initialise BSS sooner
Date: Tue, 24 Sep 2024 11:28:08 +0100
Message-Id: <20240924102811.86884-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240924102811.86884-1-frediano.ziglio@cloud.com>
References: <20240924102811.86884-1-frediano.ziglio@cloud.com>
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
 xen/arch/x86/boot/head.S | 77 ++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index cfc5a7b47d..fa21024042 100644
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
@@ -459,6 +460,20 @@ __pvh_start:
 
 #endif /* CONFIG_PVH_GUEST */
 
+.Linitialise_bss:
+	/* Initialise the BSS. */
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
+	ret
+
 __start:
         cld
         cli
@@ -489,6 +504,8 @@ __start:
         /* Set up stack. */
         lea     STACK_SIZE - CPUINFO_sizeof + sym_esi(cpu0_stack), %esp
 
+        call    .Linitialise_bss
+
         /* Bootloaders may set multiboot{1,2}.mem_lower to a nonzero value. */
         xor     %edx,%edx
 
@@ -645,22 +662,6 @@ trampoline_setup:
          * reserved for trampoline code and data.
          */
 
-        /*
-         * Do not zero BSS on EFI platform here.
-         * It was initialized earlier.
-         */
-        cmpb    $0, sym_esi(efi_platform)
-        jnz     1f
-
-        /* Initialise the BSS. */
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


