Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4437566AC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 16:41:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564651.882248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPPH-0002Dr-GG; Mon, 17 Jul 2023 14:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564651.882248; Mon, 17 Jul 2023 14:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLPPH-00025T-B9; Mon, 17 Jul 2023 14:40:59 +0000
Received: by outflank-mailman (input) for mailman id 564651;
 Mon, 17 Jul 2023 14:40:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7PMI=DD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qLPPF-0001ez-CU
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 14:40:57 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efa3b88a-24af-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 16:40:55 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso7234949e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 07:40:55 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac25ecf000000b004fa52552c7csm2836284lfq.151.2023.07.17.07.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 07:40:54 -0700 (PDT)
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
X-Inumbo-ID: efa3b88a-24af-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689604855; x=1692196855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/2F9nnRVGFmm2tz+bdsw6Ss/1KfKE3SpzTYZVGLTXE=;
        b=lqUs0GUk7T/Gmfti/vLam1duKm80RulBZAv5/pC438w509C/VdzpUtRARpk1mdtS8O
         LVVsWdNfrBqTzDiIZhfUiqE/+QyQEA4CVZuSgXUTp0BPXHTmgmEvkGcD5s26E2HfsU2k
         U6ap/WfqpbIMaazzLbi0+IRO5lGNiOYiAH0VIKFJ4f8CExAdRfEj4N87vuR41htGlOgq
         5IOt1wKxw5afMuqob/p88EbavgD70kEj1Rvhu+gGDdoMz1+4tGV1C2FyyctOGkFQ4//J
         edGoXgMPM55VcGS99TCOs8A+e4jcF8soCMKk0fyMAK60r/Un0Vc4Wasi2oPTeyA3QW6c
         vDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689604855; x=1692196855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/2F9nnRVGFmm2tz+bdsw6Ss/1KfKE3SpzTYZVGLTXE=;
        b=lSuTScOs2V+oeAeQB1MrxU0d2e+gpQ1twZ+UE7pWg/h1vyFavcl03sQS6pG8VOtCxe
         WDLW/TFgVUE5IGjOkzPwuaVdIx2aIMSlm46N26YVYDzUkPNzEIx5OwAYq9domU+2rLpg
         iJVp/O8qftu9T+9cIOSkNmfzznmm5U4T0DfJEOEUmtuSzlfhMlnItIeeIZAIxtlnSmj1
         fAEnmV0yHDiOu+RfB9wUm2c1sraLrURDfH02TUFN+kYV/ZrEBhB5wA8+NxQfyofK2/M7
         UsidH2e/33fSGygTBUIlaDXGpeawqRGzbYt5iFjUrSfeZ/ECeSi2Vh8jc5VY8Olspx8j
         lIWQ==
X-Gm-Message-State: ABy/qLYrsMY1OZmBpaNlPWMPJXlONrhRs5jhmD6ZwtiT7LZB6e2AiDB8
	FgZSUrn3FWFIbf5qq+FY1SoSbyp9dS0k0Yqv
X-Google-Smtp-Source: APBJJlFbutT6L4rml+gTbWHiN8ncHVcF6LtvPPIHXQ+IgNKQ+o4+k4iQ8zhsq57OXAtV6O45uHT+og==
X-Received: by 2002:a05:6512:b17:b0:4fb:c67e:b067 with SMTP id w23-20020a0565120b1700b004fbc67eb067mr7689109lfu.66.1689604854547;
        Mon, 17 Jul 2023 07:40:54 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 2/3] xen/riscv: introduce function for physical offset calculation
Date: Mon, 17 Jul 2023 17:40:49 +0300
Message-ID: <f86724014bf5234f22cd18e7b3da8e8aa83e1e08.1689604562.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1689604562.git.oleksii.kurochko@gmail.com>
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function was introduced to calculate and save physical
offset before MMU is enabled because access to start() is
PC-relative and in case of linker_addr != load_addr it will
result in incorrect value in phys_offset.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/riscv64/head.S   | 14 ++++++++++++++
 3 files changed, 31 insertions(+), 3 deletions(-)

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
index 2c0304646a..9015d06233 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -29,6 +29,20 @@ ENTRY(start)
 
         jal     reset_stack
 
+        /*
+         * save hart_id and dtb_base as a0 and a1 register can be used
+         * by C code ( f.e. setup_initial_pagetables will update a0 and
+         * a1 )
+         */
+        mv      s0, a0
+        mv      s1, a1
+
+        jal     calc_phys_offset
+
+        /* restore bootcpu_id and dtb address */
+        mv      a0, s0
+        mv      a1, s1
+
         tail    start_xen
 
         .section .text, "ax", %progbits
-- 
2.41.0


