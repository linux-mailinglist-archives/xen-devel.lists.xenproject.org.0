Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEC398B980
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 12:23:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807973.1219756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sva1u-000263-Na; Tue, 01 Oct 2024 10:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807973.1219756; Tue, 01 Oct 2024 10:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sva1u-00020W-J6; Tue, 01 Oct 2024 10:22:54 +0000
Received: by outflank-mailman (input) for mailman id 807973;
 Tue, 01 Oct 2024 10:22:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i7H1=Q5=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sva1s-0001jj-MN
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 10:22:52 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cb7d0aa-7fdf-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 12:22:50 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a90188ae58eso680523466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 03:22:50 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297bceesm681772966b.187.2024.10.01.03.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 03:22:49 -0700 (PDT)
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
X-Inumbo-ID: 1cb7d0aa-7fdf-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727778170; x=1728382970; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTCCxi5lp62S3XySu5dYlMTj/vcJapNsffY+wfD9Y/0=;
        b=dKoVZNozfr9ttB5h8Wk5ULQdyOFEUIEG9FnYIothl75Sljl2e7hPc+ybOL7sXjYovh
         jE1vdIY7rEDaaxKnpRVO8wcn5QOCPQ5AdoC9ajHlRCqerYuS43EumBiIXtzdrSMddxeO
         kKClzYoMPtSU1Pu/goKcDDMEb7IdRcKb1wnrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727778170; x=1728382970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTCCxi5lp62S3XySu5dYlMTj/vcJapNsffY+wfD9Y/0=;
        b=my+dLFpi5NvSbWTCJYK5foCd0+3wZJMMAhkMgsslcpFD/lNsj3+LRf66dCZKKUlRc5
         Jb8/RR6QJ00I+GkRubThSUNtXFVT45NDT6U01kP7rfgleTURjYFPZ1UJUsGV5CP/NGmO
         r+wqHOY208RxDpJpHbwTTr0sGl9YYTnqED759ksyA+oIjJE0lgwTBJgjyOi8sG6FmOYC
         P5IjA7Z5WOA9x7iZdl2U6hW8wDESj34TRA4eqYfwN/gMUxQ3qjI5llxY5QlZ8fHNZdFf
         SKCztIeG45/zA7xb1PTCZxYMRRwdgx8EMEwm6zL3dEQaelbs67Dj2qvH4QSTqj83t3WS
         ev3g==
X-Gm-Message-State: AOJu0YxzZ7ZTSr76m0LPSvYf0iNi55nHiAPRXxThPan5EQueftrLPqZ+
	hkvu64r/Ku2n82CO20iUzoYSy5kkoW+jfZv3eg7oONEMb+B/2Umky4DAvOU6diTcmF+uM+Ozebz
	w
X-Google-Smtp-Source: AGHT+IEJzjomJ7TXIa8pMgT5wn4fX+8bCCU+rjdDRd03cYaNUD2VVXqiNC2wZYvke8YoPlTPNq0AVA==
X-Received: by 2002:a17:906:dac3:b0:a8a:5bfb:7d1a with SMTP id a640c23a62f3a-a93c4946e47mr1516302666b.35.1727778169915;
        Tue, 01 Oct 2024 03:22:49 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v7 1/2] x86/boot: Rewrite EFI/MBI2 code partly in C
Date: Tue,  1 Oct 2024 11:22:38 +0100
Message-Id: <20241001102239.2609631-2-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No need to have it coded in assembly.
Declare efi_multiboot2 in a new header to reuse between implementations
and caller.

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

Changes since v3:
- rename new function to efi_multiboot2_prelude;
- declare efi_multiboot2 in a separate header.

Changes since v4:
- fix some style and space;
- fix MISRA requirement.

Changes since v6:
- include new header to get common declaration;
- add a comment in assembly code;
- rename parse-mbi2.c to mbi2.c.
---
 xen/arch/x86/boot/head.S       | 146 +++++++--------------------------
 xen/arch/x86/efi/Makefile      |   1 +
 xen/arch/x86/efi/efi-boot.h    |   7 +-
 xen/arch/x86/efi/mbi2.c        |  63 ++++++++++++++
 xen/arch/x86/efi/stub.c        |  10 +--
 xen/arch/x86/include/asm/efi.h |  18 ++++
 6 files changed, 120 insertions(+), 125 deletions(-)
 create mode 100644 xen/arch/x86/efi/mbi2.c
 create mode 100644 xen/arch/x86/include/asm/efi.h

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index e0901ee400..987345fa34 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -121,8 +121,6 @@ multiboot2_header:
 .Lbad_cpu_msg: .asciz "ERR: Not a 64-bit CPU!"
 .Lbad_ldr_msg: .asciz "ERR: Not a Multiboot bootloader!"
 .Lbad_ldr_nbs: .asciz "ERR: Bootloader shutdown EFI x64 boot services!"
-.Lbad_ldr_nst: .asciz "ERR: EFI SystemTable is not provided by bootloader!"
-.Lbad_ldr_nih: .asciz "ERR: EFI ImageHandle is not provided by bootloader!"
 .Lbad_efi_msg: .asciz "ERR: EFI IA-32 platforms are not supported!"
 .Lbag_alg_msg: .asciz "ERR: Xen must be loaded at a 2Mb boundary!"
 .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
@@ -161,17 +159,6 @@ early_error: /* Here to improve the disassembly. */
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
@@ -189,6 +176,10 @@ early_error: /* Here to improve the disassembly. */
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
@@ -235,53 +226,49 @@ __efi64_mb2_start:
 
         /*
          * Align the stack as UEFI spec requires. Keep it aligned
-         * before efi_multiboot2() call by pushing/popping even
+         * before efi_multiboot2_prelude() call by pushing/popping even
          * numbers of items on it.
          */
         and     $~15, %rsp
 
+        /* Save magic number, we need it later but we need to use %eax. */
+        mov     %eax, %edx
+
         /*
          * Initialize BSS (no nasty surprises!).
          * It must be done earlier than in BIOS case
-         * because efi_multiboot2() touches it.
+         * because efi_multiboot2_prelude() touches it.
          */
-        mov     %eax, %edx
         lea     __bss_start(%rip), %edi
         lea     __bss_end(%rip), %ecx
         sub     %edi, %ecx
         shr     $3, %ecx
         xor     %eax, %eax
         rep stosq
-        mov     %edx, %eax
-
-        /* Check for Multiboot2 bootloader. */
-        cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
-        je      .Lefi_multiboot2_proto
-
-        /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode. */
-        lea     .Lnot_multiboot(%rip), %r15
-        jmp     x86_32_switch
 
-.Lefi_multiboot2_proto:
-        /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
-        xor     %esi,%esi
-        xor     %edi,%edi
-        xor     %edx,%edx
-
-        /* Skip Multiboot2 information fixed part. */
-        lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%rbx),%ecx
-        and     $~(MULTIBOOT2_TAG_ALIGN-1),%ecx
-
-.Lefi_mb2_tsize:
-        /* Check Multiboot2 information total size. */
-        mov     %ecx,%r8d
-        sub     %ebx,%r8d
-        cmp     %r8d,MB2_fixed_total_size(%rbx)
-        jbe     .Lrun_bs
+        /*
+         * Spill MB2 magic.
+         * Spill the pointer too, to keep the stack aligned.
+         */
+        push    %rdx
+        push    %rbx
 
-        /* Are EFI boot services available? */
-        cmpl    $MULTIBOOT2_TAG_TYPE_EFI_BS,MB2_tag_type(%rcx)
-        jne     .Lefi_mb2_st
+        /*
+         * efi_multiboot2_prelude() is called according to System V AMD64 ABI:
+         *   - IN:  %edi - Multiboot2 magic,
+         *          %rsi - Multiboot2 pointer.
+         *   - OUT: %rax - error string.
+         */
+        mov     %edx, %edi
+        mov     %rbx, %rsi
+        call    efi_multiboot2_prelude
+        lea     .Ldirect_error(%rip), %r15
+        test    %rax, %rax
+        jnz     x86_32_switch
+
+        /* Restore Multiboot2 pointer and magic. */
+        pop     %rbx
+        pop     %rax
 
         /* We are on EFI platform and EFI boot services are available. */
         incb    efi_platform(%rip)
@@ -291,77 +278,6 @@ __efi64_mb2_start:
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
index 24dfecfad1..7e2b5c07de 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -14,5 +14,6 @@ $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary := $(cflags-stack-bounda
 obj-y := common-stub.o stub.o
 obj-$(XEN_BUILD_EFI) := $(filter-out %.init.o,$(EFIOBJ-y))
 obj-bin-$(XEN_BUILD_EFI) := $(filter %.init.o,$(EFIOBJ-y))
+obj-bin-y += mbi2.o
 extra-$(XEN_BUILD_EFI) += buildid.o relocs-dummy.o
 nocov-$(XEN_BUILD_EFI) += stub.o
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 7aa55e7aaf..94f3443364 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -10,6 +10,7 @@
 #include <asm/msr.h>
 #include <asm/setup.h>
 #include <asm/trampoline.h>
+#include <asm/efi.h>
 
 static struct file __initdata ucode;
 static multiboot_info_t __initdata mbi = {
@@ -816,9 +817,9 @@ static const char *__init get_option(const char *cmd, const char *opt)
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
diff --git a/xen/arch/x86/efi/mbi2.c b/xen/arch/x86/efi/mbi2.c
new file mode 100644
index 0000000000..55a1777483
--- /dev/null
+++ b/xen/arch/x86/efi/mbi2.c
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/efi.h>
+#include <xen/init.h>
+#include <xen/multiboot2.h>
+#include <asm/asm_defns.h>
+#include <asm/efi.h>
+
+const char * asmlinkage __init
+efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
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
+    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size &&
+            tag->type != MULTIBOOT2_TAG_TYPE_END;
+          tag = _p(ROUNDUP((unsigned long)tag + tag->size,
+                   MULTIBOOT2_TAG_ALIGN)) )
+    {
+        switch ( tag->type )
+        {
+        case MULTIBOOT2_TAG_TYPE_EFI_BS:
+            have_bs = true;
+            break;
+
+        case MULTIBOOT2_TAG_TYPE_EFI64:
+            SystemTable = _p(((const multiboot2_tag_efi64_t *)tag)->pointer);
+            break;
+
+        case MULTIBOOT2_TAG_TYPE_EFI64_IH:
+            ImageHandle = _p(((const multiboot2_tag_efi64_ih_t *)tag)->pointer);
+            break;
+
+        case MULTIBOOT2_TAG_TYPE_CMDLINE:
+            cmdline = ((const multiboot2_tag_string_t *)tag)->string;
+            break;
+
+        default:
+            /* Satisfy MISRA requirement. */
+            break;
+        }
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
index 2cd5c8d4dc..7d824151a7 100644
--- a/xen/arch/x86/efi/stub.c
+++ b/xen/arch/x86/efi/stub.c
@@ -1,13 +1,8 @@
 #include <xen/efi.h>
 #include <xen/init.h>
 #include <asm/asm_defns.h>
-#include <asm/efibind.h>
+#include <asm/efi.h>
 #include <asm/page.h>
-#include <efi/efidef.h>
-#include <efi/eficapsule.h>
-#include <efi/eficon.h>
-#include <efi/efidevp.h>
-#include <efi/efiapi.h>
 
 /*
  * Here we are in EFI stub. EFI calls are not supported due to lack
@@ -17,7 +12,8 @@
  */
 
 void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
-                                    EFI_SYSTEM_TABLE *SystemTable)
+                                    EFI_SYSTEM_TABLE *SystemTable,
+                                    const char *cmdline)
 {
     static const CHAR16 __initconst err[] =
         L"Xen does not have EFI code build in!\r\nSystem halted!\r\n";
diff --git a/xen/arch/x86/include/asm/efi.h b/xen/arch/x86/include/asm/efi.h
new file mode 100644
index 0000000000..575a33e302
--- /dev/null
+++ b/xen/arch/x86/include/asm/efi.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef X86_ASM_EFI_H
+#define X86_ASM_EFI_H
+
+#include <xen/types.h>
+#include <asm/x86_64/efibind.h>
+#include <efi/efidef.h>
+#include <efi/eficapsule.h>
+#include <efi/eficon.h>
+#include <efi/efidevp.h>
+#include <efi/efiapi.h>
+
+void efi_multiboot2(EFI_HANDLE ImageHandle,
+                    EFI_SYSTEM_TABLE *SystemTable,
+                    const char *cmdline);
+
+#endif /* X86_ASM_EFI_H */
-- 
2.34.1


