Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0B576B77C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 16:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574251.899535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQqOu-0007mM-CR; Tue, 01 Aug 2023 14:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574251.899535; Tue, 01 Aug 2023 14:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQqOu-0007jn-9D; Tue, 01 Aug 2023 14:31:04 +0000
Received: by outflank-mailman (input) for mailman id 574251;
 Tue, 01 Aug 2023 14:31:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zpAT=DS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qQqOt-0007Uu-3I
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 14:31:03 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09c80964-3078-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 16:31:01 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe383c1a26so3449395e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Aug 2023 07:31:01 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q28-20020ac24a7c000000b004fbac025223sm2568051lfp.22.2023.08.01.07.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 07:30:59 -0700 (PDT)
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
X-Inumbo-ID: 09c80964-3078-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690900261; x=1691505061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUja0JE13agYREw0RGgZhxeHvXKg+830hNOPqDqfhTY=;
        b=lge5p9xcmTfGaaGQ9e+A3K37zgrGb+t6wHM2SMcJH9QbU4IA5XlRRCfPTnAIsvW4mF
         JgpW7dHuhDQxD2c/cIDllrqrAhUl7w7vQ53pNxm6Ljjnd8LivKvPyVpQGEgKzuhydLb6
         7oPX3ubeKxz0paEonowdWqHxFImRnmWOOzbev1ltDVEUNiYbreclfHvj5WmtNePeRFcK
         tmb8DVWDkNei1woNbJdydIIbbIgfP5xiN90IPlBS/XeXyL5KoivLQpg5Lm4j0H0xUb+J
         LaqSxQExSFgnJ+RQtk2GMwLIXOL4P0x8iA/s6WV6t3Vr/KXfFl0qkTrCqojNY3yqW/9j
         f3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690900261; x=1691505061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUja0JE13agYREw0RGgZhxeHvXKg+830hNOPqDqfhTY=;
        b=ceyuystbpNTg2pfJ0dSvZbDJrGGpOiUJ4+iIm9B/KusRZ4QrD/jGKaYvAfJ1G6ANxB
         bghtMJABDD8Lp6OcJu5R0cEXFGBQszUZaSoUJ71bAZIbJxCup28fQotZSD0DUlvnv2KL
         jb6HLeSLfQOtJtU/HwPbM+uNpt87YYopW8EkZXo5SQ11y81sfafSKD+HSSNoZo/MX6Xk
         tw28IQyoWVSOzavXqW+ZfcnQ0uVRGVLz7oZxP4RcHATIdLf2mEoh+npT9fTqq/tcWYJp
         3AYsTUVeX7/VzVY54QDhMAixPJR9YnocuVkBNMpuKbHcOPtH8RQvNKiuarTpe0S/fp5+
         OE6w==
X-Gm-Message-State: ABy/qLajBrM3wweIXnQi0k1a2HkXai/cP3qItrWf/9MRCY2UpAFK4S57
	yX1yNV0aoiAQq95E3Hi7z7rnZQpaGxY=
X-Google-Smtp-Source: APBJJlEENUeOEhAG0XHIXrMsupEp7O2idyzLkgPM2oOVWGd5xuYU/qcvAPm1rLiXLiQqEmRk7lFLdQ==
X-Received: by 2002:ac2:4d19:0:b0:4f8:6625:f2ca with SMTP id r25-20020ac24d19000000b004f86625f2camr2382262lfi.61.1690900260555;
        Tue, 01 Aug 2023 07:31:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v6 1/2] xen/riscv: introduce function for physical offset calculation
Date: Tue,  1 Aug 2023 17:30:49 +0300
Message-ID: <1efa59f7296bd7b36f6c118b71180d86e89c72b1.1690899325.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1690899325.git.oleksii.kurochko@gmail.com>
References: <cover.1690899325.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function was introduced to calculate and save physical
offset before MMU is enabled because access to start() is
PC-relative and in case of linker_addr != load_addr it will
result in incorrect value in phys_offset.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - After 9380f06fe8("xen: Drop the (almost) unused extern start[]")
   an update of calc_phys_offset() was needed:
   - change start to _start.
   - add local volatile variable load_start to get properly Xens' load address.
     Otherwise compile thinks that (start - XEN_VIRT_START) is equal to 0.
---
Changes in V5:
 - update prototype of calc_phys_offset(). now it returns phys_offset.
 - declare phys_offset as static.
 - save returned value of calc_phys_offset to register s2.
---
Changes in V4:
 - update the comment messages in head.S related to save/restore of a0/a1 regs.
---
Changes in V3:
 - save/restore of a0/a1 registers before C first function call.
---
Changes in V2:
  - add __ro_after_init for phys_offset variable.
  - remove double blank lines.
  - add __init for calc_phys_offset().
  - update the commit message.
  - declaring variable phys_off as non static as it will be used in head.S.
---
 xen/arch/riscv/include/asm/mm.h |  2 ++
 xen/arch/riscv/mm.c             | 21 ++++++++++++++++++---
 xen/arch/riscv/riscv64/head.S   | 14 ++++++++++++++
 3 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 5e3ac5cde3..7b94cbadd7 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -15,4 +15,6 @@ void setup_initial_pagetables(void);
 void enable_mmu(void);
 void cont_after_mmu_is_enabled(void);
 
+unsigned long calc_phys_offset(void);
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 99ed5e9623..a73f135a3c 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/cache.h>
 #include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
@@ -19,9 +20,10 @@ struct mmu_desc {
     pte_t *pgtbl_base;
 };
 
-#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
-#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
-#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
+static unsigned long __ro_after_init phys_offset;
+
+#define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
+#define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
 
 /*
  * It is expected that Xen won't be more then 2 MB.
@@ -273,3 +275,16 @@ void __init noreturn noinline enable_mmu()
     switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
                           cont_after_mmu_is_enabled);
 }
+
+/*
+ * calc_phys_offset() should be used before MMU is enabled because access to
+ * start() is PC-relative and in case when load_addr != linker_addr phys_offset
+ * will have an incorrect value
+ */
+unsigned long __init calc_phys_offset(void)
+{
+    volatile unsigned long load_start = (unsigned long)_start;
+
+    phys_offset = load_start - XEN_VIRT_START;
+    return phys_offset;
+}
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 2c0304646a..ae194bb099 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -29,6 +29,20 @@ ENTRY(start)
 
         jal     reset_stack
 
+        /*
+         * save hart_id ( bootcpu_id ) and dtb_base as a0 and a1 register can
+         * be used by C code
+         */
+        mv      s0, a0
+        mv      s1, a1
+
+        jal     calc_phys_offset
+        mv      s2, a0
+
+        /* restore hart_id ( bootcpu_id ) and dtb address */
+        mv      a0, s0
+        mv      a1, s1
+
         tail    start_xen
 
         .section .text, "ax", %progbits
-- 
2.41.0


