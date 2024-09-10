Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A923973D0C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 18:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795866.1205356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3XY-0007ca-Lj; Tue, 10 Sep 2024 16:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795866.1205356; Tue, 10 Sep 2024 16:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so3XY-0007Uw-Gw; Tue, 10 Sep 2024 16:16:28 +0000
Received: by outflank-mailman (input) for mailman id 795866;
 Tue, 10 Sep 2024 16:16:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQ+P=QI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1so3XX-000753-4P
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 16:16:27 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 079b582a-6f90-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 18:16:26 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f75aaaade6so37623781fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 09:16:26 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd468a1sm4397405a12.26.2024.09.10.09.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 09:16:24 -0700 (PDT)
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
X-Inumbo-ID: 079b582a-6f90-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1725984986; x=1726589786; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgQOCHdSoX47Ypi7lpWXHIrSV2P92tiUaQrbWBnKQ1o=;
        b=RBArRvcZqCNnlWjYLY15SNDmrVVujoeaFzpIJUegcmDouh431q2QirYFW+4eOxGcek
         SGPuPMvvlR2qdMEzKIvUtNpJovoL8v++bGDm8junaNAgj5DgkM11cnPJgUzYEqjcaGWJ
         YjGdkVvBEwqqUEHT3B2CuQdBFYIqDA2GPABqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725984986; x=1726589786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgQOCHdSoX47Ypi7lpWXHIrSV2P92tiUaQrbWBnKQ1o=;
        b=hEO0rwLwOV+mY/bCt9cCbcz097wm4ZMcqikplzVxeyk+7z+gi7dyyEwZ/3letQil4E
         gFpyKB3MSq/5NEdfu2TxBZqzEYGPaxVqhS4eF46IbB30IKOWS39kz3Jx2NakrCqa9sGc
         diDiFev43e7SzvwMv1eUlaWhVFyAzTat7EXoOsk9BGk2ZeYKRanD+YxIUFSwgw42FXQ3
         tJnJ74YxXPxauHRj4lw+balGzr/93avaniWfXW1n2uFA7leMmTwmJ0Xx1of2EFMD9Oad
         o5MbagHW+CQzcjR8MW28K1QNURR0cTM2z/Cq7kCP3LNtKWRgLI5N4A2c09X6VMWZiCXE
         ealQ==
X-Gm-Message-State: AOJu0Ywk35EaRYpsjxMt0BfkNL0eHHMR8WsH963shCjX8Hc1FiRHSsS1
	nU+n5dhKaTXqFuJnQLTCCJsyyALuoAS12yzND/RP/7n4W7Fz+CgKneCWrQGa7Ep9IgHoVvFVJ5P
	D
X-Google-Smtp-Source: AGHT+IG2zm0KGDoqTA19TMPtgJHt/51E1qM8dOhsMJpNzhN3JTkcBJeSrq5plY45m8ccf2spruZBQg==
X-Received: by 2002:a2e:812:0:b0:2f6:5f7b:e5cf with SMTP id 38308e7fff4ca-2f751edfebbmr64251151fa.14.1725984985324;
        Tue, 10 Sep 2024 09:16:25 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 3/3] x86/boot: Rewrite EFI start part in C
Date: Tue, 10 Sep 2024 17:16:12 +0100
Message-Id: <20240910161612.242702-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910161612.242702-1-frediano.ziglio@cloud.com>
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need to have it coded in assembly.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/head.S      | 131 ++++++----------------------------
 xen/arch/x86/efi/Makefile     |   1 +
 xen/arch/x86/efi/parse-mbi2.c |  54 ++++++++++++++
 xen/arch/x86/efi/stub.c       |   3 +-
 4 files changed, 80 insertions(+), 109 deletions(-)
 create mode 100644 xen/arch/x86/efi/parse-mbi2.c

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index a91413184c..4b05b564a0 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -122,8 +122,6 @@ multiboot2_header:
 .Lbad_cpu_msg: .asciz "ERR: Not a 64-bit CPU!"
 .Lbad_ldr_msg: .asciz "ERR: Not a Multiboot bootloader!"
 .Lbad_ldr_nbs: .asciz "ERR: Bootloader shutdown EFI x64 boot services!"
-.Lbad_ldr_nst: .asciz "ERR: EFI SystemTable is not provided by bootloader!"
-.Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
 .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
 .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
 .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
@@ -162,17 +160,6 @@ early_error: /* Here to improve the disassembly. */
         mov     $sym_offs(.Lno_nx_msg), %ecx
         jmp     .Lget_vtb
 #endif
-.Lmb2_no_st:
-        /*
-         * Here we are on EFI platform. vga_text_buffer was zapped earlier
-         * because there is pretty good chance that VGA is unavailable.
-         */
-        mov     $sym_offs(.Lbad_ldr_nst), %ecx
-        jmp     .Lget_vtb
-.Lmb2_no_ih:
-        /* Ditto. */
-        mov     $sym_offs(.Lbad_ldr_nih), %ecx
-        jmp     .Lget_vtb
 .Lmb2_no_bs:
         /*
          * Ditto. Additionally, here there is a chance that Xen was started
@@ -190,6 +177,10 @@ early_error: /* Here to improve the disassembly. */
         mov     $sym_offs(.Lbad_efi_msg), %ecx
         xor     %edi,%edi                       # No VGA text buffer
         jmp     .Lprint_err
+.Ldirect_error:
+        mov     sym_esi(vga_text_buffer), %edi
+        mov     %eax, %esi
+        jmp     1f
 .Lget_vtb:
         mov     sym_esi(vga_text_buffer), %edi
 .Lprint_err:
@@ -255,34 +246,29 @@ __efi64_mb2_start:
         rep stosq
         mov     %edx, %eax
 
-        /* Check for Multiboot2 bootloader. */
-        cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
-        je      .Lefi_multiboot2_proto
-
-        /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode. */
-        lea     .Lnot_multiboot(%rip), %r15
-        jmp     x86_32_switch
+        /* Save Multiboot2 magic on the stack. */
+        push    %rax
 
-.Lefi_multiboot2_proto:
-        /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
-        xor     %esi,%esi
-        xor     %edi,%edi
-        xor     %edx,%edx
+        /* Save Multiboot2 pointer on the stack. */
+        push    %rbx
 
-        /* Skip Multiboot2 information fixed part. */
-        lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%rbx),%ecx
-        and     $~(MULTIBOOT2_TAG_ALIGN-1),%ecx
+        /*
+         * efi_parse_mbi2() is called according to System V AMD64 ABI:
+         *   - IN:  %edi - Multiboot2 magic, %rsi - Multiboot2 pointer.
+         *   - OUT: %eax - error string.
+         */
+        mov     %eax, %edi
+        mov     %ebx, %esi
+        call    efi_parse_mbi2
+        test    %rax, %rax
+        lea     .Ldirect_error(%rip), %r15
+        jnz     x86_32_switch
 
-.Lefi_mb2_tsize:
-        /* Check Multiboot2 information total size. */
-        mov     %ecx,%r8d
-        sub     %ebx,%r8d
-        cmp     %r8d,MB2_fixed_total_size(%rbx)
-        jbe     .Lrun_bs
+        /* Restore Multiboot2 pointer. */
+        pop     %rbx
 
-        /* Are EFI boot services available? */
-        cmpl    $MULTIBOOT2_TAG_TYPE_EFI_BS,MB2_tag_type(%rcx)
-        jne     .Lefi_mb2_st
+        /* Restore Multiboot2 magic. */
+        pop     %rax
 
         /* We are on EFI platform and EFI boot services are available. */
         incb    efi_platform(%rip)
@@ -292,77 +278,6 @@ __efi64_mb2_start:
          * be run on EFI platforms.
          */
         incb    skip_realmode(%rip)
-        jmp     .Lefi_mb2_next_tag
-
-.Lefi_mb2_st:
-        /* Get EFI SystemTable address from Multiboot2 information. */
-        cmpl    $MULTIBOOT2_TAG_TYPE_EFI64,MB2_tag_type(%rcx)
-        cmove   MB2_efi64_st(%rcx),%rsi
-        je      .Lefi_mb2_next_tag
-
-        /* Get EFI ImageHandle address from Multiboot2 information. */
-        cmpl    $MULTIBOOT2_TAG_TYPE_EFI64_IH,MB2_tag_type(%rcx)
-        cmove   MB2_efi64_ih(%rcx),%rdi
-        je      .Lefi_mb2_next_tag
-
-        /* Get command line from Multiboot2 information. */
-        cmpl    $MULTIBOOT2_TAG_TYPE_CMDLINE, MB2_tag_type(%rcx)
-        jne     .Lno_cmdline
-        lea     MB2_tag_string(%rcx), %rdx
-        jmp     .Lefi_mb2_next_tag
-.Lno_cmdline:
-
-        /* Is it the end of Multiboot2 information? */
-        cmpl    $MULTIBOOT2_TAG_TYPE_END,MB2_tag_type(%rcx)
-        je      .Lrun_bs
-
-.Lefi_mb2_next_tag:
-        /* Go to next Multiboot2 information tag. */
-        add     MB2_tag_size(%rcx),%ecx
-        add     $(MULTIBOOT2_TAG_ALIGN-1),%ecx
-        and     $~(MULTIBOOT2_TAG_ALIGN-1),%ecx
-        jmp     .Lefi_mb2_tsize
-
-.Lrun_bs:
-        /* Are EFI boot services available? */
-        cmpb    $0,efi_platform(%rip)
-
-        /* Jump to .Lmb2_no_bs after switching CPU to x86_32 mode. */
-        lea     .Lmb2_no_bs(%rip),%r15
-        jz      x86_32_switch
-
-        /* Is EFI SystemTable address provided by boot loader? */
-        test    %rsi,%rsi
-
-        /* Jump to .Lmb2_no_st after switching CPU to x86_32 mode. */
-        lea     .Lmb2_no_st(%rip),%r15
-        jz      x86_32_switch
-
-        /* Is EFI ImageHandle address provided by boot loader? */
-        test    %rdi,%rdi
-
-        /* Jump to .Lmb2_no_ih after switching CPU to x86_32 mode. */
-        lea     .Lmb2_no_ih(%rip),%r15
-        jz      x86_32_switch
-
-        /* Save Multiboot2 magic on the stack. */
-        push    %rax
-
-        /* Save EFI ImageHandle on the stack. */
-        push    %rdi
-
-        /*
-         * efi_multiboot2() is called according to System V AMD64 ABI:
-         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
-         *          %rdx - MB2 cmdline
-         */
-        call    efi_multiboot2
-
-        /* Just pop an item from the stack. */
-        pop     %rax
-
-        /* Restore Multiboot2 magic. */
-        pop     %rax
 
         /* Jump to trampoline_setup after switching CPU to x86_32 mode. */
         lea     trampoline_setup(%rip),%r15
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index 24dfecfad1..0bbb29dc0e 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -13,6 +13,7 @@ $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-bounda
 
 obj-y := common-stub.o stub.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
+obj-y += parse-mbi2.o
 obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
 extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
 nocov-$(XEN_BUILD_EFI) += stub.o
diff --git a/xen/arch/x86/efi/parse-mbi2.c b/xen/arch/x86/efi/parse-mbi2.c
new file mode 100644
index 0000000000..4dfcac326e
--- /dev/null
+++ b/xen/arch/x86/efi/parse-mbi2.c
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <xen/efi.h>
+#include <xen/init.h>
+#include <xen/multiboot2.h>
+#include <asm/asm_defns.h>
+#include <asm/efibind.h>
+#include <efi/efidef.h>
+#include <efi/eficapsule.h>
+#include <efi/eficon.h>
+#include <efi/efidevp.h>
+#include <efi/efiapi.h>
+
+void asmlinkage __init efi_multiboot2(EFI_HANDLE ImageHandle,
+                                      EFI_SYSTEM_TABLE *SystemTable,
+                                      const char *cmdline);
+
+const char *__init efi_parse_mbi2(uint32_t magic, const multiboot2_fixed_t *mbi)
+{
+    const multiboot2_tag_t *tag;
+    EFI_HANDLE ImageHandle = NULL;
+    EFI_SYSTEM_TABLE *SystemTable = NULL;
+    const char *cmdline = NULL;
+    bool have_bs = false;
+
+    if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
+        return "ERR: Not a Multiboot bootloader!";
+
+    /* Skip Multiboot2 information fixed part. */
+    for ( tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
+          (void *)tag - (void *)mbi < mbi->total_size && tag->type != MULTIBOOT2_TAG_TYPE_END;
+          tag = _p(ROUNDUP((unsigned long)((void *)tag + tag->size), MULTIBOOT2_TAG_ALIGN)) )
+    {
+        if ( tag->type == MULTIBOOT2_TAG_TYPE_EFI_BS )
+            have_bs = true;
+        else if ( tag->type == MULTIBOOT2_TAG_TYPE_EFI64 )
+            SystemTable = _p(((const multiboot2_tag_efi64_t *)tag)->pointer);
+        else if ( tag->type == MULTIBOOT2_TAG_TYPE_EFI64_IH )
+            ImageHandle = _p(((const multiboot2_tag_efi64_ih_t *)tag)->pointer);
+        else if ( tag->type == MULTIBOOT2_TAG_TYPE_CMDLINE )
+            cmdline = ((const multiboot2_tag_string_t *)tag)->string;
+    }
+
+    if ( !have_bs )
+        return "ERR: Bootloader shutdown EFI x64 boot services!";
+    if ( !SystemTable )
+        return "ERR: EFI SystemTable is not provided by bootloader!";
+    if ( !ImageHandle )
+        return "ERR: EFI ImageHandle is not provided by bootloader!";
+
+    efi_multiboot2(ImageHandle, SystemTable, cmdline);
+
+    return NULL;
+}
diff --git a/xen/arch/x86/efi/stub.c b/xen/arch/x86/efi/stub.c
index 2cd5c8d4dc..27d40964d5 100644
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.c
@@ -17,7 +17,8 @@
  */
 
 void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
-                                    EFI_SYSTEM_TABLE *SystemTable)
+                                    EFI_SYSTEM_TABLE *SystemTable,
+                                    const char *cmdline)
 {
     static const CHAR16 __initconst err[] =
         L"Xen does not have EFI code build in!\r\nSystem halted!\r\n";
-- 
2.34.1


