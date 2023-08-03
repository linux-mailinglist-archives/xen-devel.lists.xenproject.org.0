Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6029D76E7CB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 14:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576306.902293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX59-0003N6-Da; Thu, 03 Aug 2023 12:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576306.902293; Thu, 03 Aug 2023 12:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX59-0003I4-8K; Thu, 03 Aug 2023 12:05:31 +0000
Received: by outflank-mailman (input) for mailman id 576306;
 Thu, 03 Aug 2023 12:05:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEIV=DU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qRX57-0002sb-BB
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 12:05:29 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0996ed66-31f6-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 14:05:28 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe28e4671dso1586007e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Aug 2023 05:05:28 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 e22-20020ac25476000000b004fdfefdf4acsm3304557lfn.39.2023.08.03.05.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 05:05:27 -0700 (PDT)
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
X-Inumbo-ID: 0996ed66-31f6-11ee-b268-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691064328; x=1691669128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXuF1AtcaFIuqh3RnuzjKGdWBJliPJb+moN2Ah/LYz8=;
        b=gRt8bvU/HD2PsiCRodzS3I+Wd6vdyLIiKQ6TVGm0bEIXxGG/YxYsgpadjNhjJFOHZc
         boEcOY8/NMbjRv9OB3eOWkZKhJqR745V4uG2e1gF/zcas7vS3B7rDMzjFgAxL3ZHte/A
         7uquNO9uO4p6HiEwGAoCbd/W/vIPXgNn24ofvgvyIPCUrO1quJwWzv6DnjO5LhL9kJj8
         TWN+jPlzEcQJjI/Pt9fDkR3m4By3xjDcD2TOExycv5qSsbU3jS2/UphfWu5Sg+pDaheV
         Y23fPNM55yuLmMC2PsUSd7Y8DRR/JJ/KLsQU3myo7bjQ6rv5j2EGOgvnxxz/L0VYGj/2
         69TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064328; x=1691669128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXuF1AtcaFIuqh3RnuzjKGdWBJliPJb+moN2Ah/LYz8=;
        b=XZDJotmPe95E1m7X177znlv36qoCeatTRWekwe4BUNxWpAuMRtv7ql9m0RFfPF03Re
         2NmU7pJvVTIKjqZtDzUNvNShugsBUVcjN+gidYVkkyTbdaWtwPp83PE1bcvLTsRp0iVH
         Hc47DwRtbPPWo0Gys9Agj7KyRgFS4Y76unxmCgzzWkAIftucESg5PAmf1RL+vt+S9MuG
         XC4Z9KByepRD7KUIXgv0jM20B3MEFovMSIKRtAEoRCZUgpq8maID3WyDWeVt5DrV9Vfe
         VJ505zxuwxFIY5i6I+2REIPBWef1j77OLU9ZjY8dpRDYUQgWQRDhxTw0Z7JDOiOAym+B
         e0ZQ==
X-Gm-Message-State: ABy/qLZwUEmlKa8t1lTfsv8R1eW2A6HCd6KRKptfDjbtfQnMahwKEjyh
	727pqh01mYLI3wJFxepFo/QeMO6fpIk=
X-Google-Smtp-Source: APBJJlEYKsvurp295A8fafMIlO/Ww5a4Tb9xWwALkTdp3vT1IkXrzdcwiuV8Q5VT2RegS9LqjAY/fQ==
X-Received: by 2002:a19:ab09:0:b0:4fe:1ecf:8ab4 with SMTP id u9-20020a19ab09000000b004fe1ecf8ab4mr6014686lfe.18.1691064328125;
        Thu, 03 Aug 2023 05:05:28 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 4/6] xen/riscv: introduce trap_init()
Date: Thu,  3 Aug 2023 15:05:20 +0300
Message-ID: <921ea81d2571ce3103336cd2bf6619b8a8a6751c.1691063432.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691063432.git.oleksii.kurochko@gmail.com>
References: <cover.1691063432.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V7:
 - #define cast_to_bug_frame(addr) ((const struct bug_frame *)(addr)).
 - remove unnecessary comments in trap_init() function.
---
Changes in V6:
 - trap_init() is now called after enabling the MMU.
 - Add additional explanatory comments.
---
Changes in V5:
  - Nothing changed
---
Changes in V4:
  - Nothing changed
---
Changes in V3:
  - Nothing changed
---
Changes in V2:
  - Rename setup_trap_handler() to trap_init().
  - Add Reviewed-by to the commit message.
---
 xen/arch/riscv/include/asm/traps.h |  1 +
 xen/arch/riscv/setup.c             |  3 +++
 xen/arch/riscv/traps.c             | 12 ++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index 3fef318478..c30118e095 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -9,6 +9,7 @@
 
 void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
+void trap_init(void);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 6593f601c1..abdd1669c6 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -5,6 +5,7 @@
 
 #include <asm/early_printk.h>
 #include <asm/mm.h>
+#include <asm/traps.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
@@ -15,6 +16,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     remove_identity_mapping();
 
+    trap_init();
+
     early_printk("Hello from C env\n");
 
     early_printk("All set up\n");
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index ea1012e83e..3e08ec44f7 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -12,6 +12,18 @@
 #include <asm/processor.h>
 #include <asm/traps.h>
 
+/*
+ * Initialize the trap handling.
+ *
+ * The function is called after MMU is enabled.
+ */
+void trap_init(void)
+{
+    unsigned long addr = (unsigned long)&handle_trap;
+
+    csr_write(CSR_STVEC, addr);
+}
+
 static const char *decode_trap_cause(unsigned long cause)
 {
     static const char *const trap_causes[] = {
-- 
2.41.0


