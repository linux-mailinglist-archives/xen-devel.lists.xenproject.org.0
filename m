Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE4F9516AC
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 10:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776852.1187079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9TF-0005A0-7B; Wed, 14 Aug 2024 08:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776852.1187079; Wed, 14 Aug 2024 08:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se9TF-00057f-0s; Wed, 14 Aug 2024 08:35:05 +0000
Received: by outflank-mailman (input) for mailman id 776852;
 Wed, 14 Aug 2024 08:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jxPN=PN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1se9TD-0002t1-KE
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 08:35:03 +0000
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [2607:f8b0:4864:20::b31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 194a8861-5a18-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 10:35:02 +0200 (CEST)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e0e88873825so6295835276.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 01:35:02 -0700 (PDT)
Received: from fziglio-xenia-fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4c7e05595sm407786785a.122.2024.08.14.01.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 01:35:01 -0700 (PDT)
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
X-Inumbo-ID: 194a8861-5a18-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723624501; x=1724229301; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3RLkkdEw+WvOJ6h0uz0D93wDr/BTPYuQooWwQucVfo=;
        b=Jm05QScSbdxb7nUlMX+0piRorKZwHiGH3zsUozIEigTxKg24CVYfX9puy2e+rfBfgr
         vxQHrpzNz3fhGzbt7r2oMCI40eH1iXC08B2f8Yq1G1KHjaViIBel3/t7YPqu5BooxjTR
         gSSDH7foo7nir5C99Lg9LiefxW3ZAg9oDcCWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624501; x=1724229301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3RLkkdEw+WvOJ6h0uz0D93wDr/BTPYuQooWwQucVfo=;
        b=B49CzAUgQhsZ4GZfU8c0lKYkIIihKQseP1kI41McEm5vbLirq9h9QngYvZGmdwGOMW
         SNqiaA47XqHRii+xFEe1W7SspVaH/8NJ+FcPhanCxihX0UAUn6wSsv42JL/fp1y93CDZ
         FSBk9dREmVkyhJ+//YYoRTASVjL70jXo+gF35P/dAIq0ou+7wYDRONhaE/uJtqW8/zyP
         E1xUoiQwCDHhR+K/f66the3JsN3Q++NKppAY1aOhBmpGhZdmH2S4s9EDCH8oPbfqFFxd
         1AlB/o0pSB9rj7PvXW9yDSqX06iQ5D7lMAOuSqBCBYVOZdsFwWl4UBqHzs+l3fkTy4gy
         vutg==
X-Gm-Message-State: AOJu0YyipzgSXuD2WcTJuRzMm8aGFhuipESf5ye8D/oA8HvAr0XyNiko
	7Frq8Ke0FefR22k8NhKQd2phED2u/6wFltpKzeJRZ1ldmyhr7xkc3zpEFyyU0QQWOJHV505viXh
	v
X-Google-Smtp-Source: AGHT+IGKNHJUKcuFo4EaeLXlmE5TDLQ5CU7BIa/3jgXJownF0st8Fk8SKovg0rOsFbAmrWJAlwJQ0A==
X-Received: by 2002:a05:690c:3405:b0:62f:945a:7bb1 with SMTP id 00721157ae682-6ac9a478546mr20841897b3.42.1723624501462;
        Wed, 14 Aug 2024 01:35:01 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 5/5] x86: Rollback relocation in case of EFI multiboot
Date: Wed, 14 Aug 2024 09:34:14 +0100
Message-ID: <20240814083428.3012-6-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814083428.3012-1-frediano.ziglio@cloud.com>
References: <20240814083428.3012-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case EFI not multiboot rolling back relocation is done in
efi_arch_post_exit_boot, called by efi_start however this is
not done in multiboot code path.
Do it also for this path to make it work correctly.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/arch/x86/boot/Makefile          |  2 +-
 xen/arch/x86/boot/efi-reloc-image.c | 40 ++++++++++++++
 xen/arch/x86/boot/efi-reloc-image.h | 85 +++++++++++++++++++++++++++++
 xen/arch/x86/boot/head.S            | 44 ++++++++++++---
 xen/arch/x86/efi/efi-boot.h         | 64 ++--------------------
 5 files changed, 168 insertions(+), 67 deletions(-)
 create mode 100644 xen/arch/x86/boot/efi-reloc-image.c
 create mode 100644 xen/arch/x86/boot/efi-reloc-image.h
---
Changes since v1:
- many style updates;
- split file for 32 bit relocation;
- reuse code from header avoiding duplication;
- add some more comment to assembly code;

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 03d8ce3a9e..49792e0acf 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,6 +1,6 @@
 obj-bin-y += head.o
 
-head-bin-objs := cmdline.o reloc.o
+head-bin-objs := cmdline.o reloc.o efi-reloc-image.o
 
 nocov-y   += $(head-bin-objs)
 noubsan-y += $(head-bin-objs)
diff --git a/xen/arch/x86/boot/efi-reloc-image.c b/xen/arch/x86/boot/efi-reloc-image.c
new file mode 100644
index 0000000000..b103e37cd7
--- /dev/null
+++ b/xen/arch/x86/boot/efi-reloc-image.c
@@ -0,0 +1,40 @@
+/*
+ * efi-reloc-image.c
+ *
+ * 32-bit flat memory-map routines for relocating back PE executable.
+ * This is done with paging disabled to avoid permission issues.
+ *
+ * Copyright (c) 2024, Citrix Systems, Inc.
+ */
+
+/*
+ * This entry point is entered from xen/arch/x86/boot/head.S with:
+ *   - 0x04(%esp) = __XEN_VIRT_START - xen_phys_start
+ *   - 0x0c(%esp) = xen_phys_start
+ *   - 0x10(%esp) = __base_relocs_start
+ *   - 0x14(%esp) = __base_relocs_end
+ */
+asm (
+    "    .text                         \n"
+    "    .globl _start                 \n"
+    "_start:                           \n"
+    "    jmp    reloc_pe_back          \n"
+    );
+
+#include "defs.h"
+
+/* Do not patch page tables. */
+#define in_page_tables(v) false
+
+#define EFI_RELOC_IMAGE_EARLY 1
+#include "efi-reloc-image.h"
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/boot/efi-reloc-image.h b/xen/arch/x86/boot/efi-reloc-image.h
new file mode 100644
index 0000000000..999dd2d2c8
--- /dev/null
+++ b/xen/arch/x86/boot/efi-reloc-image.h
@@ -0,0 +1,85 @@
+/*
+ * efi-reloc-image.h
+ *
+ * Code for relocating back PE executable.
+ * This code is common between 64 bit and 32 bit.
+ *
+ * Copyright (c) 2024, Citrix Systems, Inc.
+ */
+
+#if EFI_RELOC_IMAGE_EARLY != 0 && EFI_RELOC_IMAGE_EARLY != 1
+#error EFI_RELOC_IMAGE_EARLY must be defined either 0 or 1
+#endif
+
+typedef struct pe_base_relocs {
+    uint32_t rva;
+    uint32_t size;
+    uint16_t entries[];
+} pe_base_relocs;
+
+#define PE_BASE_RELOC_ABS      0
+#define PE_BASE_RELOC_HIGHLOW  3
+#define PE_BASE_RELOC_DIR64   10
+
+#if EFI_RELOC_IMAGE_EARLY
+bool __stdcall
+#else
+static bool
+#endif
+reloc_pe_back(long long delta,
+              unsigned long xen_phys_start,
+              const pe_base_relocs *__base_relocs_start,
+              const pe_base_relocs *__base_relocs_end)
+{
+    const struct pe_base_relocs *base_relocs;
+
+    for ( base_relocs = __base_relocs_start; base_relocs < __base_relocs_end; )
+    {
+        unsigned int i = 0, n;
+
+        n = (base_relocs->size - sizeof(*base_relocs)) /
+            sizeof(*base_relocs->entries);
+
+        for ( ; i < n; ++i )
+        {
+            unsigned long addr = xen_phys_start + base_relocs->rva +
+                                 (base_relocs->entries[i] & 0xfff);
+
+            switch ( base_relocs->entries[i] >> 12 )
+            {
+            case PE_BASE_RELOC_ABS:
+                break;
+            case PE_BASE_RELOC_HIGHLOW:
+                if ( delta )
+                {
+                    *(uint32_t *)addr += delta;
+                    if ( in_page_tables(addr) )
+                        *(uint32_t *)addr += xen_phys_start;
+                }
+                break;
+            case PE_BASE_RELOC_DIR64:
+                if ( delta )
+                {
+                    *(uint64_t *)addr += delta;
+                    if ( in_page_tables(addr) )
+                        *(uint64_t *)addr += xen_phys_start;
+                }
+                break;
+            default:
+                return false;
+            }
+        }
+        base_relocs = (const void *)(base_relocs->entries + i + (i & 1));
+    }
+    return true;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 86805389f9..dd3600c14b 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -332,7 +332,8 @@ __efi64_mb2_start:
          */
         and     $~15,%rsp
 
-        /* Save Multiboot2 magic on the stack. */
+        /* Save Multiboot2 magic on the stack for a later 32bit call */
+        shl     $32, %rax
         push    %rax
 
         /* Save EFI ImageHandle on the stack. */
@@ -363,11 +364,25 @@ __efi64_mb2_start:
         /* Just pop an item from the stack. */
         pop     %rax
 
-        /* Restore Multiboot2 magic. */
-        pop     %rax
+        /*
+         * Prepare stack for relocation call.
+         * Note that we are in 64bit mode but we are going to call a
+         * function in 32bit mode so the stack is not written with
+         * push instructions.
+         */
+        sub     $16, %rsp
+        lea     __base_relocs_end(%rip), %ecx
+        mov     %ecx, 16(%rsp)
+        lea     __base_relocs_start(%rip), %ecx
+        mov     %ecx, 12(%rsp)
+        lea     __image_base__(%rip), %esi
+        mov     %esi, 8(%rsp)
+        movabs  $__XEN_VIRT_START, %rcx
+        sub     %rsi, %rcx
+        mov     %rcx, (%rsp)
 
-        /* Jump to trampoline_setup after switching CPU to x86_32 mode. */
-        lea     trampoline_setup(%rip),%r15
+        /* Jump to trampoline_efi_setup after switching CPU to x86_32 mode. */
+        lea     trampoline_efi_setup(%rip), %r15
 
 x86_32_switch:
         mov     %r15,%rdi
@@ -539,6 +554,17 @@ __start:
         and     $~(MULTIBOOT2_TAG_ALIGN-1),%ecx
         jmp     .Lmb2_tsize
 
+trampoline_efi_setup:
+        call    reloc_pe_back
+        pop     %eax
+
+        /* Calculate the load base address again, adjusting to sym_esi needs */
+        call    1f
+1:      pop     %esi
+        sub     $sym_offs(1b), %esi
+
+        jmp     trampoline_setup
+
 trampoline_bios_setup:
         /*
          * Called on legacy BIOS platforms only.
@@ -867,8 +893,8 @@ trampoline_setup:
         lret
 
         /*
-         * cmdline and reloc are written in C, and linked to be 32bit PIC with
-         * entrypoints at 0 and using the stdcall convention.
+         * cmdline, reloc and reloc_pe_back are written in C, and linked to be
+         * 32bit PIC with entrypoints at 0 and using the stdcall convention.
          */
         ALIGN
 cmdline_parse_early:
@@ -878,6 +904,10 @@ cmdline_parse_early:
 reloc:
         .incbin "reloc.bin"
 
+        ALIGN
+reloc_pe_back:
+        .incbin "efi-reloc-image.bin"
+
         .section .init.data, "aw", @progbits
 
 ENTRY(trampoline_start)
diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index f282358435..4f473a287e 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -36,69 +36,15 @@ extern const intpte_t __page_tables_start[], __page_tables_end[];
 #define in_page_tables(v) ((intpte_t *)(v) >= __page_tables_start && \
                            (intpte_t *)(v) < __page_tables_end)
 
-#define PE_BASE_RELOC_ABS      0
-#define PE_BASE_RELOC_HIGHLOW  3
-#define PE_BASE_RELOC_DIR64   10
+#define EFI_RELOC_IMAGE_EARLY 0
+#include "../boot/efi-reloc-image.h"
 
-extern const struct pe_base_relocs {
-    u32 rva;
-    u32 size;
-    u16 entries[];
-} __base_relocs_start[], __base_relocs_end[];
+extern pe_base_relocs __base_relocs_start[], __base_relocs_end[];
 
 static void __init efi_arch_relocate_image(unsigned long delta)
 {
-    const struct pe_base_relocs *base_relocs;
-
-    for ( base_relocs = __base_relocs_start; base_relocs < __base_relocs_end; )
-    {
-        unsigned int i = 0, n;
-
-        n = (base_relocs->size - sizeof(*base_relocs)) /
-            sizeof(*base_relocs->entries);
-
-        /*
-         * Relevant l{2,3}_bootmap entries get initialized explicitly in
-         * efi_arch_memory_setup(), so we must not apply relocations there.
-         * l2_directmap's first slot, otoh, should be handled normally, as
-         * efi_arch_memory_setup() won't touch it (xen_phys_start should
-         * never be zero).
-         */
-        if ( xen_phys_start + base_relocs->rva == (unsigned long)l3_bootmap ||
-             xen_phys_start + base_relocs->rva == (unsigned long)l2_bootmap )
-            i = n;
-
-        for ( ; i < n; ++i )
-        {
-            unsigned long addr = xen_phys_start + base_relocs->rva +
-                                 (base_relocs->entries[i] & 0xfff);
-
-            switch ( base_relocs->entries[i] >> 12 )
-            {
-            case PE_BASE_RELOC_ABS:
-                break;
-            case PE_BASE_RELOC_HIGHLOW:
-                if ( delta )
-                {
-                    *(u32 *)addr += delta;
-                    if ( in_page_tables(addr) )
-                        *(u32 *)addr += xen_phys_start;
-                }
-                break;
-            case PE_BASE_RELOC_DIR64:
-                if ( delta )
-                {
-                    *(u64 *)addr += delta;
-                    if ( in_page_tables(addr) )
-                        *(u64 *)addr += xen_phys_start;
-                }
-                break;
-            default:
-                blexit(L"Unsupported relocation type");
-            }
-        }
-        base_relocs = (const void *)(base_relocs->entries + i + (i & 1));
-    }
+    if (!reloc_pe_back(delta, xen_phys_start, __base_relocs_start, __base_relocs_end))
+        blexit(L"Unsupported relocation type");
 }
 
 extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];
-- 
2.45.2


