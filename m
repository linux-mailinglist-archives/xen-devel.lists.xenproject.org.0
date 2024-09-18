Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B3297BA11
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 11:23:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800213.1210138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqqtz-000211-0R; Wed, 18 Sep 2024 09:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800213.1210138; Wed, 18 Sep 2024 09:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqqty-0001uO-RX; Wed, 18 Sep 2024 09:23:10 +0000
Received: by outflank-mailman (input) for mailman id 800213;
 Wed, 18 Sep 2024 09:23:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PNE=QQ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sqqtx-0001Ui-Cz
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 09:23:09 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9df06ad2-759f-11ef-a0b8-8be0dac302b0;
 Wed, 18 Sep 2024 11:23:08 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8ce5db8668so59136566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Sep 2024 02:23:08 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a906109718bsm559125666b.34.2024.09.18.02.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2024 02:23:06 -0700 (PDT)
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
X-Inumbo-ID: 9df06ad2-759f-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726651387; x=1727256187; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ui1cggI59NaiSofWslRY4D04lkLcdTxHVYAhI74Y5M=;
        b=AAjhFr/7z24io8HN/VBclSWwcEgvVpKbXbiMMRnxUziAT+GgVgZBrjeaHx8KSvqfEk
         4uolLd/XhFhDCpvlP9eI0Q78Q83eZcwg8NZvIElzAj/W2qkf5fCsBIsrNv7J1liavSMg
         BFysuI6wgczM4XK2ZlqFDd7rG7a0/x62/gQGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726651387; x=1727256187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ui1cggI59NaiSofWslRY4D04lkLcdTxHVYAhI74Y5M=;
        b=GmgpHjKTwNtslQ617vIBtjS8weekecxKBriz54lQDx0GMma3o0riKHSmGpk9T702kK
         P2hvAqRlBowCHrVQWF6MaKtXtIZ7v0CIWM/LVNK3spchW0wAex0Cfb1PaPQvcxS/0K78
         5kfTderxn/fSzmiAlmamWXa6Ddl8jq3EFYf3bonpNRxq/rtL19zrbJqZ2NQvQBPWpH0w
         gFJroC1y2hNGY2ljKAJRTihYRJJN3nEN8xuLJK6LRT+FaiKD9uIjwR7rY5qXzvKN9ytJ
         KBru/db/7DYhSYMbH0hmCpRJ+gwwU08kH7Jb3m9Tt+h26JR3y1iu3DVUJWCpTmMy+qiQ
         D8qg==
X-Gm-Message-State: AOJu0YxgyPvJhn/Sni5T/A+pSc1gKwjJIRgtFFGSt8Jll1FP403CoeM/
	jxwhKb7P3N+5mnEXFpZqK/GrwQohUd1PSqpXW5AqSoFMTUKFaAs7UVGWaLP/Rbu9W0XVdujvNNq
	J
X-Google-Smtp-Source: AGHT+IGjZx4zoQ/6n68ITL6lJjNTaqv4+mbRP+e4NqqKtrUd9mXaP9LaapcYW4PWWz0Mb3t5sBF/tA==
X-Received: by 2002:a17:907:f72a:b0:a80:7193:bd93 with SMTP id a640c23a62f3a-a9029447148mr2251621066b.25.1726651387097;
        Wed, 18 Sep 2024 02:23:07 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 3/4] x86/boot: Rewrite EFI/MBI2 code partly in C
Date: Wed, 18 Sep 2024 10:22:54 +0100
Message-Id: <20240918092255.13527-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918092255.13527-1-frediano.ziglio@cloud.com>
References: <20240918092255.13527-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need to have it coded in assembly.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
Changes since v1:
- update some comments;
- explain why %ebx is saved before calling efi_parse_mbi2;
- move lea before test instruction;
- removed asmlinkage from efi_multiboot2 and add to efi_parse_mbi2;
- fix line length;
- update an error message specifying "Multiboot2" instead of "Multiboot";
- use obj-bin-X instead of obj-X in Makefile;
- avoid restoring %eax (MBI magic).
---
 xen/arch/x86/boot/head.S      | 136 +++++++---------------------------
 xen/arch/x86/efi/Makefile     |   1 +
 xen/arch/x86/efi/efi-boot.h   |   6 +-
 xen/arch/x86/efi/parse-mbi2.c |  58 +++++++++++++++
 xen/arch/x86/efi/stub.c       |   3 +-
 5 files changed, 89 insertions(+), 115 deletions(-)
 create mode 100644 xen/arch/x86/efi/parse-mbi2.c

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index f18c15c666..30fbacf709 100644
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
@@ -236,7 +227,7 @@ __efi64_mb2_start:
 
         /*
          * Align the stack as UEFI spec requires. Keep it aligned
-         * before efi_multiboot2() call by pushing/popping even
+         * before efi_parse_mbi2() call by pushing/popping even
          * numbers of items on it.
          */
         and     $~15, %rsp
@@ -244,7 +235,7 @@ __efi64_mb2_start:
         /*
          * Initialize BSS (no nasty surprises!).
          * It must be done earlier than in BIOS case
-         * because efi_multiboot2() touches it.
+         * because efi_parse_mbi2() touches it.
          */
         mov     %eax, %edx
         lea     __bss_start(%rip), %edi
@@ -253,36 +244,30 @@ __efi64_mb2_start:
         shr     $3, %ecx
         xor     %eax, %eax
         rep stosq
-        mov     %edx, %eax
 
-        /* Check for Multiboot2 bootloader. */
-        cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
-        je      .Lefi_multiboot2_proto
-
-        /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode. */
-        lea     .Lnot_multiboot(%rip), %r15
-        jmp     x86_32_switch
+        /* Save Multiboot2 magic on the stack. */
+        push    %rdx
 
-.Lefi_multiboot2_proto:
-        /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
-        xor     %esi,%esi
-        xor     %edi,%edi
-        xor     %edx,%edx
+        /* Save Multiboot2 pointer on the stack, keep the stack aligned. */
+        push    %rbx
 
-        /* Skip Multiboot2 information fixed part. */
-        lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%rbx),%ecx
-        and     $~(MULTIBOOT2_TAG_ALIGN-1),%ecx
+        /*
+         * efi_parse_mbi2() is called according to System V AMD64 ABI:
+         *   - IN:  %edi - Multiboot2 magic, %rsi - Multiboot2 pointer.
+         *   - OUT: %rax - error string.
+         */
+        mov     %edx, %edi
+        mov     %rbx, %rsi
+        call    efi_parse_mbi2
+        lea     .Ldirect_error(%rip), %r15
+        test    %rax, %rax
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
@@ -292,77 +277,6 @@ __efi64_mb2_start:
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
index 24dfecfad1..51140061fc 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -14,5 +14,6 @@ $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-bounda
 obj-y := common-stub.o stub.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
 obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
+obj-bin-y += parse-mbi2.o
 extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
 nocov-$(XEN_BUILD_EFI) += stub.o
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 7aa55e7aaf..859c01c13f 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -816,9 +816,9 @@ static const char *__init get_option(const char *cmd, const char *opt)
     return o;
 }
 
-void asmlinkage __init efi_multiboot2(EFI_HANDLE ImageHandle,
-                                      EFI_SYSTEM_TABLE *SystemTable,
-                                      const char *cmdline)
+void __init efi_multiboot2(EFI_HANDLE ImageHandle,
+                           EFI_SYSTEM_TABLE *SystemTable,
+                           const char *cmdline)
 {
     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop;
     EFI_HANDLE gop_handle;
diff --git a/xen/arch/x86/efi/parse-mbi2.c b/xen/arch/x86/efi/parse-mbi2.c
new file mode 100644
index 0000000000..6038f35b16
--- /dev/null
+++ b/xen/arch/x86/efi/parse-mbi2.c
@@ -0,0 +1,58 @@
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
+void __init efi_multiboot2(EFI_HANDLE ImageHandle,
+                           EFI_SYSTEM_TABLE *SystemTable,
+                           const char *cmdline);
+
+const char * asmlinkage __init
+efi_parse_mbi2(uint32_t magic, const multiboot2_fixed_t *mbi)
+{
+    const multiboot2_tag_t *tag;
+    EFI_HANDLE ImageHandle = NULL;
+    EFI_SYSTEM_TABLE *SystemTable = NULL;
+    const char *cmdline = NULL;
+    bool have_bs = false;
+
+    if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
+        return "ERR: Not a Multiboot2 bootloader!";
+
+    /* Skip Multiboot2 information fixed part. */
+    tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
+
+    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size
+            && tag->type != MULTIBOOT2_TAG_TYPE_END;
+          tag = _p(ROUNDUP((unsigned long)((const void *)tag + tag->size),
+                   MULTIBOOT2_TAG_ALIGN)) )
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


