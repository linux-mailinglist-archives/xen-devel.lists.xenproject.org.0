Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7620F973D0A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 18:16:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795864.1205343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3XX-0007Mb-RX; Tue, 10 Sep 2024 16:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795864.1205343; Tue, 10 Sep 2024 16:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3XX-0007JM-O6; Tue, 10 Sep 2024 16:16:27 +0000
Received: by outflank-mailman (input) for mailman id 795864;
 Tue, 10 Sep 2024 16:16:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQ+P=QI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1so3XW-000753-2g
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 16:16:26 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 063e9062-6f90-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 18:16:24 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c3ca32974fso6509442a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 09:16:24 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd468a1sm4397405a12.26.2024.09.10.09.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 09:16:22 -0700 (PDT)
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
X-Inumbo-ID: 063e9062-6f90-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725984983; x=1726589783; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=batcHmj1wvcKkQ68lq1V9VDYqmGzG5ewJQtSr+95acw=;
        b=DR+MYK+XrRmLtVjfIAekFKdnJgf0oQ/Ev7hpdkMIlNv37PHQJXKiTYqM6SHH6xFbIz
         /js8oqEMVvUO0LkpThC0QpVo0Gw+Sykbgl6cKPXo19Wmqn03APQj2VvAIV1iGfeggFJs
         PeGNynjmXfuhTXICKaiG6IVhHu7fnSsBtr6XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725984983; x=1726589783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=batcHmj1wvcKkQ68lq1V9VDYqmGzG5ewJQtSr+95acw=;
        b=QcThqueovCDdJHb7Mj+Q8LnKlSpM22zuORULNEG7bKtogrt5bWV6gq4OaxhS7zmiQF
         6P1EMX5M0hRApSDfZMH983LXr/ZIQXaUfgiouGjerEO/JSwQlji6Xrqjx5OrEZ9ryLnv
         e8XfEsJmo7JdPya2/Affsr4W4DwVBfCZ0JakdyjYzqUdyp+b0r/YRytroqKZKgFn+VlV
         MrYpUPrAoTbb+PpNvSqz9qlL9WK1M73e23CB3h71pJ58tyq4skx3V2mZr67v4EV7U8eh
         2DTplL4X9XVyciNlGPu6/yaGgJeN4gXTeVNzzivtTcAJxnaoVaDdCrH/moZvJOQi842T
         MdVg==
X-Gm-Message-State: AOJu0Yz8iiQvkOETw/ig8bBDbyfH65dtYD+xGjTfDqkBizIYB7wJSEIj
	rFDxRw7uZZgyDowstvfIhYY2YOZ252PSdLEF6+vQX4zTFkz8oqFQSuC4nxt0Cm/lFu80mFYBYqI
	t
X-Google-Smtp-Source: AGHT+IEueQV9OX917xYDvnV0h8yUCQls0OMJUKdHXADMz84yuF3Ja+eIi+9A++nbtuFbN0V27ThAtA==
X-Received: by 2002:a05:6402:3884:b0:5c2:6343:8ddf with SMTP id 4fb4d7f45d1cf-5c3dc7c4eedmr9685586a12.33.1725984983385;
        Tue, 10 Sep 2024 09:16:23 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86/boot: Initialise BSS as soon as possible
Date: Tue, 10 Sep 2024 17:16:10 +0100
Message-Id: <20240910161612.242702-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910161612.242702-1-frediano.ziglio@cloud.com>
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows to call C code earlier.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S | 86 ++++++++++++++++++++--------------------
 1 file changed, 44 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 12bbb97f33..de118d72f2 100644
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
+        and     $~15,%rsp
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
 
+        call    initialise_bss
+
         mov     %ebx, sym_esi(pvh_start_info_pa)
 
         /* Force xen console.  Will revert to user choice in init code. */
@@ -459,6 +460,25 @@ __pvh_start:
 
 #endif /* CONFIG_PVH_GUEST */
 
+initialise_bss:
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
 
+        call    initialise_bss
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


