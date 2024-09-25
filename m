Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F489852BF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 08:02:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803446.1214004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stL5T-0002iS-Vl; Wed, 25 Sep 2024 06:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803446.1214004; Wed, 25 Sep 2024 06:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stL5T-0002fG-ST; Wed, 25 Sep 2024 06:01:19 +0000
Received: by outflank-mailman (input) for mailman id 803446;
 Wed, 25 Sep 2024 06:01:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N7N=QX=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stL5S-0002f4-DH
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 06:01:18 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93d9c229-7b03-11ef-a0ba-8be0dac302b0;
 Wed, 25 Sep 2024 08:01:17 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c2561e8041so8723927a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 23:01:16 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf49de00sm1498937a12.55.2024.09.24.23.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 23:01:14 -0700 (PDT)
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
X-Inumbo-ID: 93d9c229-7b03-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727244075; x=1727848875; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMG64X3mGJaWpXbh6pb/sJ7+eBsDVLEV1JYMeayeiaU=;
        b=OapMj+7LW0vRmwRhKkWfRRxTXr7qetLhCF1T1FXpkgFYhY2oh42Ox0eOKtJckttaku
         ny2YmZIn6vZQsGZkJIz0TIk+0Z5GwwKkxrhS9Gp4dxZgPodGItpbvBSruauE0KRKtIP3
         09VCZk7l1vhbyWSx69LtHMYtPkORdq0O0sE6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727244075; x=1727848875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMG64X3mGJaWpXbh6pb/sJ7+eBsDVLEV1JYMeayeiaU=;
        b=JgtaOfwVf9N+Mt+WrXnb20vR0nVrxYH4eIJlKCiVW7e8xRq0lY3y3SPf/0c+Gj5Xzh
         BzLoR8mKN+GuK3jFY29zBhdb8/fsJh4w9vwI1HBoG3QC5O9WK2TY8wX/bAOxfBqPoi+o
         w2UgSDYAllcZjefYzpuOXQ7ejuZd5u4KXV/7i7NEVFbQqVZWo4ZcEA/VxHZmxaDn2G+J
         M+iYassgNBdUDuIw8yK6nOA4rbAcOFQ4DXQO6JTO9Cx8AF28iIbrSy0vaHpwacmeJxVd
         MaAObS7qN1i5cJuJbWgO5T+QrnKX3FkSy5dUGKL/qvpIcE99xKcUi2GgPAosi6W8Zp9q
         EzGQ==
X-Gm-Message-State: AOJu0Yxms3tGZGwx+1KWavxkIor2grUm7IzW6lEfWuERyqwT+0NVYR31
	O+JJ7rgLBNQpwhLlEGD5QUIzA0KI9HZdJqQvYp8Uiu3y+g7t9lRC/rvxd/ovJinQL5h/bE7yAp4
	a
X-Google-Smtp-Source: AGHT+IGaiik3wO5yXHiW2A7GgsgCLSXHRDsnxs6vG8aPj6Uho48WYhVMhoOtM0QBwH9VlQlAAnyc/A==
X-Received: by 2002:a05:6402:500a:b0:5c3:d18e:fc27 with SMTP id 4fb4d7f45d1cf-5c720750e89mr984809a12.33.1727244075460;
        Tue, 24 Sep 2024 23:01:15 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 1/4] x86/boot: Initialise BSS sooner
Date: Wed, 25 Sep 2024 07:00:58 +0100
Message-Id: <20240925060101.259244-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925060101.259244-1-frediano.ziglio@cloud.com>
References: <20240925060101.259244-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows to call C code earlier.
In order to safely call C code we need to setup stack, selectors and BSS.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
- improve commit message;
- improve some comments;
- fix some code style (spacing);
- set trampoline_phys as 32 bit value;
- use PAGE_SIZE mnemonic instead of 0x1000;
- use local label.

Changes since v3:
- improved comment;
- fixed indentation.
---
 xen/arch/x86/boot/head.S | 77 ++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 38 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index cfc5a7b47d..267207e5a2 100644
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
+        /* Initialise the BSS.  Preserve %eax (BOOTLOADER_MAGIC). */
+        mov     %eax, %ebp
+
+        lea     sym_esi(__bss_start), %edi
+        lea     sym_esi(__bss_end), %ecx
+        sub     %edi, %ecx
+        xor     %eax, %eax
+        shr     $2, %ecx
+        rep stosl
+
+        mov     %ebp, %eax
+        ret
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


