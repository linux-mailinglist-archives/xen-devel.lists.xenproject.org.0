Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E33DBAADBB7
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 11:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978418.1365232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbJ5-0006XY-E3; Wed, 07 May 2025 09:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978418.1365232; Wed, 07 May 2025 09:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCbJ5-0006Ur-9L; Wed, 07 May 2025 09:43:15 +0000
Received: by outflank-mailman (input) for mailman id 978418;
 Wed, 07 May 2025 09:43:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCvR=XX=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1uCbJ2-00062T-SK
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 09:43:12 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b04d5aec-2b27-11f0-9ffb-bf95429c2676;
 Wed, 07 May 2025 11:43:11 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43edecbfb46so38224605e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 02:43:11 -0700 (PDT)
Received: from localhost.localdomain (172.74.6.51.dyn.plus.net. [51.6.74.172])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b16f00sm16051290f8f.84.2025.05.07.02.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 02:43:09 -0700 (PDT)
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
X-Inumbo-ID: b04d5aec-2b27-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746610990; x=1747215790; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oe/MYIRtB4rlJzUi92AgVF2o13CiBT7GoXGbiEvmSqY=;
        b=CeiKakjF0bHVxKkAH6G2Fu0zmOjxXdp6gxBmbTeDdPrpANN0dy1x8M51AU79invQkz
         G2aOEE/IV+Fwjd78XDJnJOcwrYNkxzIEO03eufw+ITSmtTocKuu5n5229Y+9YsVNWPFP
         d7jHsgR10DXpNqWPqKqcFqeJXPIDFteGPLzUlfRrYAw/vCj58uHq53NJW2eXL5fS7jwI
         EHhl+UH6BaZIDoUVg5snZhJMc74jIH3R6Z/42AsMl+hlAKudzauo3UMUzaIlztexYJz/
         lc4CMW5+ssQr9GW5H5bQRIxJ44iExkS3uWwFFbkm6ueXOhce3Z/Bv7JgVSnvAipv7y8l
         vlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746610990; x=1747215790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oe/MYIRtB4rlJzUi92AgVF2o13CiBT7GoXGbiEvmSqY=;
        b=FCHgupVt+eSLS8hD3DlhfskG6PC0yJCYc7VZtu/tG14cBXCUSg/xMTp0b3ZumYEYl5
         GJUc65vik3zPmD/XW/LhS5acfwV64EumLCVEaIhN+G8TUtbsvoXTHf9EbA2/85+6BE5B
         Gzo1Hb5ElRJzIxRlt6LbDc0JMA6SyzHVIwgbBsyYVE1nNfZ+zeUEZbxWpEp91i5G/HEL
         6Pjr5NZ5psNBlEO09Rq88yskOe6Hrn1nqpGkkgwCcoY61rfTXmrR2Dcob8yuvuvksR/S
         UkZxOYHfTkUJOtXhLYwx2eR/lLP3O5aF8/mPgVOu4Mggf7AnlhGgxrklx8VdHIVCqZJ8
         FBKg==
X-Gm-Message-State: AOJu0YzFYD+dO+BfRTZXC/P6Gq8BSlXhJN5w8TPV2NC4wSqlrO/riKN7
	94pVfjtm0SjG//wh5giFBP/Tavxf3hgm95v9fw+qtIWlKJ0ZO/5nGeC+HefV4kQ=
X-Gm-Gg: ASbGncvaFcJ5/a832DqTCM6oqT5LWsLAFso6jhaCDz99MN3Eq7uMRiYxsU5t6DfBseH
	uD4dahR6cl5qAL84JwcLxTfQYymaQWKnVXP/5z7v0wsx3Pc3QZNj40IxARDNMjo4QXaOWcTfwtI
	0apevf+PtiR3qsuQGcbA6T2UoN7Wt6lIkm7jg4YEcDmHXHsFU/Dq3EOA5UeInxIcjt3xQIYXGVt
	vOq6v+g0Gd54jXpiVhD3KSuIweg4d46ycXmLWIaTpM5+irwT4nkb4IYFouddZe/6fyJiJgBqUQk
	fqZurXVXR6rLUB+Vx6l/2l+evOhf2zHOyGfAl+wgv5WWaKGsuVzvRbWXAiFmQvSV43X/KTRZ
X-Google-Smtp-Source: AGHT+IHX2EGNIBKnFFgCqJpTyBEHK31aOzzismyK3ci2pQZLueaBc2npHo9DOYf2wTY4GpKQsusXmg==
X-Received: by 2002:a05:600c:a409:b0:441:d4e8:76cd with SMTP id 5b1f17b1804b1-441d4e877e1mr15195655e9.29.1746610990080;
        Wed, 07 May 2025 02:43:10 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/4] kexec: Include purgatory in Xen
Date: Wed,  7 May 2025 10:42:47 +0100
Message-ID: <20250507094253.10395-3-freddy77@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507094253.10395-1-freddy77@gmail.com>
References: <20250507094253.10395-1-freddy77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Lagerwall <ross.lagerwall@citrix.com>

Purgatory is a binary that runs between two kernels during kexec. When Secure
Boot is enabled, it should be signed and verified before being loaded and
executed.

Currently, purgatory is built as part of kexec-tools and dynamically modified
before being loaded. This prevents signing it at build time. To fix this, build
purgatory as a separate object in Xen and modify it at load time in Xen itself.
This is the same approach used by Linux.

No behavioural change with this patch other than the puratory binary being
included in Xen.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/Makefile                 |   1 +
 xen/arch/x86/purgatory/.gitignore     |   3 +
 xen/arch/x86/purgatory/Makefile       |  64 +++++++++++++++
 xen/arch/x86/purgatory/config.h       |  37 +++++++++
 xen/arch/x86/purgatory/entry64.S      | 108 ++++++++++++++++++++++++++
 xen/arch/x86/purgatory/purgatory.c    |  59 ++++++++++++++
 xen/arch/x86/purgatory/setup-x86_64.S |  63 +++++++++++++++
 xen/arch/x86/purgatory/stack.S        |  21 +++++
 xen/lib/sha2-256.c                    |   2 +-
 9 files changed, 357 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/x86/purgatory/.gitignore
 create mode 100644 xen/arch/x86/purgatory/Makefile
 create mode 100644 xen/arch/x86/purgatory/config.h
 create mode 100644 xen/arch/x86/purgatory/entry64.S
 create mode 100644 xen/arch/x86/purgatory/purgatory.c
 create mode 100644 xen/arch/x86/purgatory/setup-x86_64.S
 create mode 100644 xen/arch/x86/purgatory/stack.S

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index c2f1dcf301..b3ee871ba1 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -1,6 +1,7 @@
 obj-y += acpi/
 obj-y += boot/
 obj-y += cpu/
+obj-$(CONFIG_KEXEC) += purgatory/
 obj-y += efi/
 obj-y += genapic/
 obj-$(CONFIG_GUEST) += guest/
diff --git a/xen/arch/x86/purgatory/.gitignore b/xen/arch/x86/purgatory/.gitignore
new file mode 100644
index 0000000000..9353e3ff26
--- /dev/null
+++ b/xen/arch/x86/purgatory/.gitignore
@@ -0,0 +1,3 @@
+purgatory.chk
+kexec-purgatory.S
+purgatory.ro
diff --git a/xen/arch/x86/purgatory/Makefile b/xen/arch/x86/purgatory/Makefile
new file mode 100644
index 0000000000..211264e4da
--- /dev/null
+++ b/xen/arch/x86/purgatory/Makefile
@@ -0,0 +1,64 @@
+cc_common_flags = -Wall -Os -g0                                \
+                    -nostdinc                                  \
+                    -mcmodel=large                             \
+                    -fno-builtin                               \
+                    -ffreestanding                             \
+                    -fno-zero-initialized-in-bss               \
+                    -fno-stack-protector                       \
+                    -fno-PIC                                   \
+                    -fno-PIE                                   \
+                    -fno-tree-vectorize                        \
+                    -D__XEN__                                  \
+                    -D__PURGATORY__                            \
+                    -include $(srctree)/include/xen/config.h   \
+                    -I$(srctree)/$(src)                        \
+                    -I$(objtree)/include                       \
+                    -I$(srctree)/include                       \
+                    -I$(objtree)/arch/x86/include              \
+                    -I$(srctree)/arch/x86/include              \
+                    -I$(objtree)/arch/x86/include/generated
+
+cmd_cc_purg = $(CC) $(cc_common_flags)               \
+                  -c $< -o $@
+
+cmd_cc_as_purg = $(CC) $(cc_common_flags)            \
+		     -D__ASSEMBLY__                  \
+                     -c $< -o $@
+
+cmd_ld_purg = $(LD) --no-undefined               \
+                -z nodefaultlib                  \
+                -z noexecstack                   \
+                -e purgatory_start               \
+                -S $(real-prereqs) -o $@
+
+cmd_ldr_purg = $(cmd_ld_purg) -r
+
+purgatory-y := purgatory.o stack.o setup-x86_64.o sha2-256.o entry64.o memcmp.o
+PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
+
+$(obj)/%.o: $(src)/%.c $(src)/config.h
+	$(call if_changed,cc_purg)
+
+$(obj)/%.o: $(src)/%.S $(src)/config.h
+	$(call if_changed,cc_as_purg)
+
+$(obj)/sha2-256.o: $(srctree)/lib/sha2-256.c $(src)/config.h
+	$(call if_changed,cc_purg)
+
+$(obj)/memcmp.o: $(srctree)/lib/memcmp.c $(src)/config.h
+	$(call if_changed,cc_purg)
+
+$(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
+		$(call if_changed,ldr_purg)
+
+$(obj)/purgatory.chk: $(obj)/purgatory.ro FORCE
+		$(call if_changed,ld_purg)
+
+$(obj)/kexec-purgatory.o: $(obj)/purgatory.ro $(obj)/purgatory.chk
+
+$(obj)/kexec-purgatory.S: $(srctree)/tools/binfile FORCE
+	$(call if_changed,binfile,$(obj)/purgatory.ro kexec_purgatory)
+
+targets += kexec-purgatory.S
+
+obj-y += kexec-purgatory.o
diff --git a/xen/arch/x86/purgatory/config.h b/xen/arch/x86/purgatory/config.h
new file mode 100644
index 0000000000..f1f9f41aad
--- /dev/null
+++ b/xen/arch/x86/purgatory/config.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ *
+ * Copyright (C) 2025  Cloud Software Group Inc.
+ */
+
+#ifndef __PURGATORY_CONFIG_H__
+#define __PURGATORY_CONFIG_H__
+
+#define BALIGN(size) .balign size
+
+#undef ENTRY
+#define ENTRY(name)         \
+    name:
+
+#define END(name)           \
+    name##_end:
+
+#undef GLOBAL
+#define GLOBAL(name)        \
+    .globl name;            \
+    ENTRY(name)
+
+#define GLOBAL_END(name)    \
+    .globl name##_end;      \
+    END(name)
+
+#define SYM_T_DATA 1
+
+#define ASM_INT(name, val)  \
+    .type name, SYM_T_DATA; \
+    BALIGN(4);              \
+    .hidden name;           \
+    GLOBAL(name)            \
+    .long (val);            \
+    .size name, . - name
+
+#endif // __PURGATORY_CONFIG_H__
diff --git a/xen/arch/x86/purgatory/entry64.S b/xen/arch/x86/purgatory/entry64.S
new file mode 100644
index 0000000000..7256cb6a91
--- /dev/null
+++ b/xen/arch/x86/purgatory/entry64.S
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2003,2004  Eric Biederman (ebiederm@xmission.com)
+ * Copyright (C) 2014  Red Hat Inc.
+ * Copyright (C) 2025  Cloud Software Group Inc.
+
+ * Author(s): Vivek Goyal <vgoyal@redhat.com>
+ *
+ * This code has been adapted from kexec-tools and Linux.
+ */
+
+#include "config.h"
+
+    .text
+    .code64
+
+BALIGN(16)
+GLOBAL(entry64)
+    /* Setup a gdt that should be preserved */
+    lgdt gdt(%rip)
+
+    /* load the data segments */
+    movl    $0x18, %eax     /* data segment */
+    movl    %eax, %ds
+    movl    %eax, %es
+    movl    %eax, %ss
+    movl    %eax, %fs
+    movl    %eax, %gs
+
+    /* Setup new stack */
+    leaq    stack_init(%rip), %rsp
+    pushq   $0x10 /* CS */
+    leaq    new_cs_exit(%rip), %rax
+    pushq   %rax
+    lretq
+ENTRY(new_cs_exit)
+
+    /* Load the registers */
+    movq    rax(%rip), %rax
+    movq    rbx(%rip), %rbx
+    movq    rcx(%rip), %rcx
+    movq    rdx(%rip), %rdx
+    movq    rsi(%rip), %rsi
+    movq    rdi(%rip), %rdi
+    movq    rsp(%rip), %rsp
+    movq    rbp(%rip), %rbp
+    movq    r8(%rip), %r8
+    movq    r9(%rip), %r9
+    movq    r10(%rip), %r10
+    movq    r11(%rip), %r11
+    movq    r12(%rip), %r12
+    movq    r13(%rip), %r13
+    movq    r14(%rip), %r14
+    movq    r15(%rip), %r15
+
+    /* Jump to the new code... */
+    jmpq    *rip(%rip)
+END(entry64)
+
+    .section ".rodata"
+
+BALIGN(4)
+GLOBAL(entry64_regs)
+rax:    .quad 0x0
+rbx:    .quad 0x0
+rcx:    .quad 0x0
+rdx:    .quad 0x0
+rsi:    .quad 0x0
+rdi:    .quad 0x0
+rsp:    .quad 0x0
+rbp:    .quad 0x0
+r8:     .quad 0x0
+r9:     .quad 0x0
+r10:    .quad 0x0
+r11:    .quad 0x0
+r12:    .quad 0x0
+r13:    .quad 0x0
+r14:    .quad 0x0
+r15:    .quad 0x0
+rip:    .quad 0x0
+END(entry64_regs)
+    .size entry64_regs, entry64_regs_end - entry64_regs
+
+    /* GDT */
+    .section ".rodata"
+
+BALIGN(16)
+ENTRY(gdt)
+    /*
+     * 0x00 unusable segment
+     * 0x08 unused
+     * so use them as gdt ptr
+     */
+    .word gdt_end - gdt - 1
+    .quad gdt
+    .word 0, 0, 0
+
+    /* 0x10 4GB flat code segment */
+    .word 0xFFFF, 0x0000, 0x9A00, 0x00AF
+
+    /* 0x18 4GB flat data segment */
+    .word 0xFFFF, 0x0000, 0x9200, 0x00CF
+END(gdt)
+
+ENTRY(stack)
+    .quad   0, 0
+END(stack)
+ENTRY(stack_init)
diff --git a/xen/arch/x86/purgatory/purgatory.c b/xen/arch/x86/purgatory/purgatory.c
new file mode 100644
index 0000000000..8b9a3cdb11
--- /dev/null
+++ b/xen/arch/x86/purgatory/purgatory.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * purgatory: Runs between two kernels
+ *
+ * Copyright (C) 2014 Red Hat Inc.
+ * Copyright (C) 2025  Cloud Software Group Inc.
+ *
+ * Author:
+ *       Vivek Goyal <vgoyal@redhat.com>
+ *
+ * This code has been imported from kexec-tools.
+ */
+
+#include <xen/sha2.h>
+#include <xen/string.h>
+
+struct sha256_region {
+    uint64_t start;
+    uint64_t len;
+};
+
+typedef uint8_t sha256_digest_t[SHA2_256_DIGEST_SIZE];
+
+#define SHA256_REGIONS 16
+
+struct sha256_region sha256_regions[SHA256_REGIONS] = {};
+sha256_digest_t sha256_digest = { };
+
+int verify_sha256_digest(void)
+{
+    struct sha256_region *ptr, *end;
+    sha256_digest_t digest;
+    struct sha2_256_state ctx;
+    sha2_256_init(&ctx);
+    end = &sha256_regions[sizeof(sha256_regions) / sizeof(sha256_regions[0])];
+
+    for ( ptr = sha256_regions; ptr < end; ptr++ )
+        sha2_256_update(&ctx, (uint8_t *)((uintptr_t)ptr->start), ptr->len);
+
+    sha2_256_final(&ctx, digest);
+
+    if ( memcmp(digest, sha256_digest, sizeof(digest)) != 0 )
+        return 1;
+
+    return 0;
+}
+
+void purgatory(void)
+{
+    int ret;
+
+    ret = verify_sha256_digest();
+    if ( ret )
+    {
+        /* loop forever */
+        for ( ; ; )
+            ;
+    }
+}
diff --git a/xen/arch/x86/purgatory/setup-x86_64.S b/xen/arch/x86/purgatory/setup-x86_64.S
new file mode 100644
index 0000000000..c36be25656
--- /dev/null
+++ b/xen/arch/x86/purgatory/setup-x86_64.S
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * purgatory:  setup code
+ *
+ * Copyright (C) 2003,2004  Eric Biederman (ebiederm@xmission.com)
+ * Copyright (C) 2014  Red Hat Inc.
+ * Copyright (C) 2025  Cloud Software Group Inc.
+ *
+ * This code has been adapted from kexec-tools and Linux.
+ */
+
+#include "config.h"
+
+    .text
+    .code64
+
+BALIGN(16)
+GLOBAL(purgatory_start)
+
+    /* Load a gdt so I know what the segment registers are */
+    lgdt    gdt(%rip)
+
+    /* load the data segments */
+    movl    $0x18, %eax /* data segment */
+    movl    %eax, %ds
+    movl    %eax, %es
+    movl    %eax, %ss
+    movl    %eax, %fs
+    movl    %eax, %gs
+
+    /* Setup a stack */
+    leaq    lstack_end(%rip), %rsp
+
+    /* Call the C code */
+    call purgatory
+    jmp entry64
+END(purgatory_start)
+
+    .section ".rodata"
+
+BALIGN(16)
+ENTRY(gdt)
+    /* 0x00 unusable segment
+     * 0x08 unused
+     * so use them as the gdt ptr
+     */
+    .word   gdt_end - gdt - 1
+    .quad   gdt
+    .word   0, 0, 0
+
+    /* 0x10 4GB flat code segment */
+    .word   0xFFFF, 0x0000, 0x9A00, 0x00AF
+
+    /* 0x18 4GB flat data segment */
+    .word   0xFFFF, 0x0000, 0x9200, 0x00CF
+END(gdt)
+
+    .bss
+
+BALIGN(4096)
+ENTRY(lstack)
+    .skip 4096
+END(lstack)
diff --git a/xen/arch/x86/purgatory/stack.S b/xen/arch/x86/purgatory/stack.S
new file mode 100644
index 0000000000..6ac7685cd5
--- /dev/null
+++ b/xen/arch/x86/purgatory/stack.S
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * purgatory:  stack
+ *
+ * Copyright (C) 2014 Red Hat Inc.
+ * Copyright (C) 2025 Cloud Software Group Inc.
+ *
+ *	This code has been adapted from kexec-tools and Linux.
+ */
+
+#include "config.h"
+
+	/* A stack for the loaded kernel.
+	 * Separate and in the data section so it can be prepopulated.
+	 */
+	.data
+
+BALIGN(4096)
+GLOBAL(stack)
+	.skip 4096
+GLOBAL_END(stack)
diff --git a/xen/lib/sha2-256.c b/xen/lib/sha2-256.c
index e55e297eff..09c033f97f 100644
--- a/xen/lib/sha2-256.c
+++ b/xen/lib/sha2-256.c
@@ -209,7 +209,7 @@ void sha2_256_digest(uint8_t digest[SHA2_256_DIGEST_SIZE],
     sha2_256_final(&s, digest);
 }
 
-#ifdef CONFIG_SELF_TESTS
+#if defined(CONFIG_SELF_TESTS) && !defined(__PURGATORY__)
 
 #include <xen/init.h>
 #include <xen/lib.h>
-- 
2.43.0


