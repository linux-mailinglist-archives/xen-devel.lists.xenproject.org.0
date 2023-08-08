Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82140773AE8
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 17:14:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580030.908298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOPx-0004mQ-M0; Tue, 08 Aug 2023 15:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580030.908298; Tue, 08 Aug 2023 15:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTOPx-0004jz-I8; Tue, 08 Aug 2023 15:14:41 +0000
Received: by outflank-mailman (input) for mailman id 580030;
 Tue, 08 Aug 2023 15:14:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVOA=DZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qTOPv-0004UR-KT
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 15:14:39 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aae772e-35fe-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 17:14:38 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b9e6cc93c6so88864971fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 08:14:38 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 i19-20020a2e8093000000b002ba053e1f9bsm2319794ljg.35.2023.08.08.08.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 08:14:37 -0700 (PDT)
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
X-Inumbo-ID: 4aae772e-35fe-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691507678; x=1692112478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVnapX6pJbuyIiJqPHyIE7upozAeCAUpzwk8pWdYKkk=;
        b=F45IcP//lDRI8/cXxnZYlW9HKIKiVcS2qrf7XQdv3kUb2RmiOD1XLwunLcM85kSwW5
         ECWtqCGXl8lIjZmkNXmH9oEHNoQyjG4rcNGXW0QxQgjEeZQo7EmQ19b2zzSTIb60ZBnU
         rQMG/Fhc4InsAfAOTk0aHj8NBvSCOw1O6gjk+zyLU+X11suCjrAg4IzVYcZMr9Axq9WG
         5oUYOOZoiDFSTmZddXXMtqoQF9KjGl/h0G/AMjmPFd+IlmMyXB39EOgGQ4vsTzFtVRZ+
         Qz/BiEPrIdg8cv15AyvlunAxWxHX5/uUFU9xm39qNjMxVM1sHhHcukLBtpe7qrMSAlBi
         AFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691507678; x=1692112478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XVnapX6pJbuyIiJqPHyIE7upozAeCAUpzwk8pWdYKkk=;
        b=dUPcnWPXYClKV3RsBheJ/znN/r9krvUIRwEDdsWrI728o9FjjVkU0feYctjqXVU1v9
         XmWkYER54km05OdPCN2XAsxqYLCcxJlkPWn0WYnyaY5UXEoAR1pptKIwG213u+mqH18F
         rn/SkyybyRZqZiCHyEVJSanrdHdO8bUXyP1GlIDHnZkhQeoKxOgB/dOr596gQkX7Rren
         rO7Jrl0CWPnxsWmXtQ8nXyJzXWyMvte+rO/zyCFszZnjtOYTiLiHnf6MqRlBsHNwzAbB
         9IOXeHJNED3HCrDUg3/qkm5rl8vr+fTnFY9v2XCw47+avmU1EYujKuPzpRkhOKX22ywD
         ivBQ==
X-Gm-Message-State: AOJu0YwUhfNzwZRkMcQcdkkIsVoZiM6fVCWAbZ/Rmpx+EJtOaV8IVVGj
	OUjPrNPRUN8CggVUkhfU2CEwlya7e2I=
X-Google-Smtp-Source: AGHT+IFzCBnt4pdAkSiRqtYmX3q6Mntbuz8yqFz0Mml4QXcR3rKhYsF3I0dAe5a/yBsW7Ovkm7ENOw==
X-Received: by 2002:a2e:6a11:0:b0:2b6:a6e7:5afa with SMTP id f17-20020a2e6a11000000b002b6a6e75afamr8817605ljc.12.1691507677614;
        Tue, 08 Aug 2023 08:14:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 1/2] xen/riscv: introduce function for physical offset calculation
Date: Tue,  8 Aug 2023 18:14:33 +0300
Message-ID: <53d4251e79c5b4effb3a077d1b102c57ed1a10b3.1691507564.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691507564.git.oleksii.kurochko@gmail.com>
References: <cover.1691507564.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function was introduced to calculate and save physical
offset before MMU is enabled because access to start() is
PC-relative and in case of linker_addr != load_addr it will
result in incorrect value in phys_offset.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - nothing changed. only rebase
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


