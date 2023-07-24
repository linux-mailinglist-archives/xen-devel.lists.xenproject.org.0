Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E7775EF51
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:43:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568525.887915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNs5Z-0005kM-WC; Mon, 24 Jul 2023 09:42:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568525.887915; Mon, 24 Jul 2023 09:42:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNs5Z-0005iM-TO; Mon, 24 Jul 2023 09:42:49 +0000
Received: by outflank-mailman (input) for mailman id 568525;
 Mon, 24 Jul 2023 09:42:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6P8=DK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qNs5Y-0005hi-ST
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:42:48 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7176ec9a-2a06-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 11:42:45 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fb5bcb9a28so6189322e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 02:42:46 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k10-20020aa7c04a000000b0050488d1d376sm6020958edo.0.2023.07.24.02.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:42:44 -0700 (PDT)
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
X-Inumbo-ID: 7176ec9a-2a06-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690191765; x=1690796565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nfcp7c7c/3n6CY6kNcbVjdnQ1GyqRTk1VyoAU9RnpnM=;
        b=Csan28GVnhjQUoXT1yMjYnfboJRQfsiggTVzjPbFpapz3fKWnv0vzSmzUc1EY+7oOC
         z36BGfFwcPVee9rEWkh0XaYxpIUKr5VUvvynqB3z+fYIa9YsDbuRFX4x+1LCFW4TXs+Z
         PGJred5yGMjnEoUZS0HJt8dOl8koS/OccWvg6rkbl5cKXvtYFc76seXYsHB2RgyfjadE
         0qajHsS31XBdhlaV728LcMV3i8G2NmYNG2kUal+HCLYqgfxOFco/8cE3xlFuyTMzy4rG
         mhliVvUtHjMCAumQuvXOVRIlyEx6WKRd0V8sl/HReYBb07J5uVwYMCuChvoFu9jlQYGj
         HHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690191765; x=1690796565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nfcp7c7c/3n6CY6kNcbVjdnQ1GyqRTk1VyoAU9RnpnM=;
        b=bTDYkjoJuAitv2H7e+MpbtsL4WiFGyEWYoTdX77sCREyiwvjl+Vi51JK4T/bWCJrsw
         Cfj24sGein3StDCTzcMOzN4gyddNlg8gpv/B081beRHYHfiM9rGS7yN+0lVCAHD887xT
         K21qnJn6X1FtUlmqgl6P1op7JXxS3zVar6OQEEdmC4G3ezRlyrQMlvYKZXMw5fDzR1ep
         0mefr5wvdm865Wf3Jy37dqD7QBftxDr1O7dVFJR4j6B9DXSRnCbvK9yvYzU7GkdDU/se
         8FqpSYlJoTKfqaT6jbKBsP2KP/cJjm8BqVMVm2QMZrKHwe1cApXtVEc3YrDTC4VDvOcR
         iFaQ==
X-Gm-Message-State: ABy/qLbzVe+PSyOa5IcyCRgSXBAjjQdA7JzfZZdtXTOLUWfomde3ppKS
	yEZw9J2idpyDQyVjr7FfBhAChosfJAA=
X-Google-Smtp-Source: APBJJlFtnpAKSRB9j61eraO6i0crSM/fmYILB1TIwDXPOcVEiyOaXs5GHgpCMPJAokcnijBiK865xQ==
X-Received: by 2002:a05:6512:23a5:b0:4fd:d517:fbd8 with SMTP id c37-20020a05651223a500b004fdd517fbd8mr6682242lfv.9.1690191765227;
        Mon, 24 Jul 2023 02:42:45 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 1/2] xen/riscv: introduce function for physical offset calculation
Date: Mon, 24 Jul 2023 12:42:40 +0300
Message-ID: <19817eca0b7d4e8dee7eb5d5e7d3812133925eb3.1690191480.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1690191480.git.oleksii.kurochko@gmail.com>
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function was introduced to calculate and save physical
offset before MMU is enabled because access to start() is
PC-relative and in case of linker_addr != load_addr it will
result in incorrect value in phys_offset.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/mm.c             | 18 +++++++++++++++---
 xen/arch/riscv/riscv64/head.S   | 13 +++++++++++++
 3 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 5e3ac5cde3..d9c4205103 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -15,4 +15,6 @@ void setup_initial_pagetables(void);
 void enable_mmu(void);
 void cont_after_mmu_is_enabled(void);
 
+void calc_phys_offset(void);
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index fddb3cd0bd..c84a8a7c3c 100644
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
+unsigned long __ro_after_init phys_offset;
+
+#define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
+#define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
 
 /*
  * It is expected that Xen won't be more then 2 MB.
@@ -273,3 +275,13 @@ void __init noreturn noinline enable_mmu()
     switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
                           cont_after_mmu_is_enabled);
 }
+
+/*
+ * calc_phys_offset() should be used before MMU is enabled because access to
+ * start() is PC-relative and in case when load_addr != linker_addr phys_offset
+ * will have an incorrect value
+ */
+void __init calc_phys_offset(void)
+{
+    phys_offset = (unsigned long)start - XEN_VIRT_START;
+}
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 2c0304646a..a28714e0ef 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -29,6 +29,19 @@ ENTRY(start)
 
         jal     reset_stack
 
+        /*
+         * save hart_id ( bootcpu_id ) and dtb_base as a0 and a1 register can
+         * be used by C code
+         */
+        mv      s0, a0
+        mv      s1, a1
+
+        jal     calc_phys_offset
+
+        /* restore hart_id ( bootcpu_id ) and dtb address */
+        mv      a0, s0
+        mv      a1, s1
+
         tail    start_xen
 
         .section .text, "ax", %progbits
-- 
2.41.0


