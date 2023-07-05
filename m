Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19877480FD
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 11:35:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558883.873388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyux-0006Mj-Dc; Wed, 05 Jul 2023 09:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558883.873388; Wed, 05 Jul 2023 09:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGyux-0006Kq-8p; Wed, 05 Jul 2023 09:35:23 +0000
Received: by outflank-mailman (input) for mailman id 558883;
 Wed, 05 Jul 2023 09:35:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hy0b=CX=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qGyuv-0005bC-NG
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 09:35:21 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41e81fc1-1b17-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 11:35:20 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b6ff1a637bso6931261fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 02:35:19 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 q22-20020a2e84d6000000b002b6d8cfb6d2sm2910625ljh.140.2023.07.05.02.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 02:35:18 -0700 (PDT)
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
X-Inumbo-ID: 41e81fc1-1b17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688549719; x=1691141719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPB2Dc6t3Zgd1EEjPsex1QWFM8C9VFNKedpjWqBxO5k=;
        b=KzmaQV2K2xH/7mILxkUyQHMyBQr51bl76tMoOkpR5LmbxOQfz2xmwZBtC098B47iRY
         Rr0Yisz6v5tz+R77+f565Y5X9/t2IHXMg/NVgP116iy/fLK1RhGmhvCbTcG5z9qfXUGK
         EKb4jKN+wZO0/qbli2qAs/bNUm3JbW9ZfrBbyKgYVlCbQWzQPNj9v3SK0lu0xWtFF3KC
         qmsQHMm3+Vr4X5HC+yNSZFPM7a6lEFS+AFosXOtEjQb8R3pGT1/bVLL5dhjRp+26KqpQ
         zw/PTEdIWaDjg1GWXwQ9xIBMkp+Z+01H3gyBm5JidRoCQ9TqLggDBct21iX3JUWJOPRL
         1Qtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688549719; x=1691141719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPB2Dc6t3Zgd1EEjPsex1QWFM8C9VFNKedpjWqBxO5k=;
        b=ApwQFEnzOBfFqmqz2ubAkFyV2I8WLapvHPlq17mQWAjjFbsA4pSA+w93iC+pNtlY7h
         Xsq0xqKSJoeFIqHUPrfL+kdWefP91DoPRtoR4eh/xAbnNjztatOsDktt7pgxnCcqIwGi
         LbvLrWfUf6ALeNmIx4YiSYiko5zfCxfouV70EZd5R8hDc2XjILFf7A7fC1SJTjf0Vo/L
         L51ablVKowl3VlGVgwnFkc49suXKuM0PW+sqhorbXXMnuBzunGnRKWX6b6ms+pJEzKta
         ++KHGc3BobQ4twbHBdGTizcW3UDaTvknLAQtR9OeKAbc2O/KXHq9VSLVAvojaBARmBXw
         X5eA==
X-Gm-Message-State: ABy/qLYz5zS6CeanCDg2JH92O2swTRBQqy8sNYzb9bjtI7i3SNOmyfKU
	2RYdVBQKeHCBwZ2dTDYIE1njd49SF3AAeRR/HFw=
X-Google-Smtp-Source: APBJJlG2atj/pftIqyUxkI68m2T9ZWgQ4liE5nTUqR4RHRlqXrJJbO8QtoL2Mc+TBw3H4UBwqyxZxw==
X-Received: by 2002:a2e:b0d2:0:b0:2b6:d9dd:f65f with SMTP id g18-20020a2eb0d2000000b002b6d9ddf65fmr8142657ljl.17.1688549719284;
        Wed, 05 Jul 2023 02:35:19 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [XEN PATCH v9 03/24] xen/arm: smccc: add support for SMCCCv1.2 extended input/output registers
Date: Wed,  5 Jul 2023 11:34:12 +0200
Message-Id: <20230705093433.2514898-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705093433.2514898-1-jens.wiklander@linaro.org>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SMCCC v1.2 [1] AArch64 allows x0-x17 to be used as both parameter
registers and result registers for the SMC and HVC instructions.

Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
parameter and result registers.

Let us add new interface to support this extended set of input/output
registers.

This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
extended input/output registers") by Sudeep Holla from the Linux kernel

The SMCCC version reported to the VM is bumped to 1.2 in order to support
handling FF-A messages.

[1] https://developer.arm.com/documentation/den0028/c/?lang=en

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm64/asm-offsets.c |  9 +++++++
 xen/arch/arm/arm64/smc.S         | 42 ++++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/smccc.h | 40 ++++++++++++++++++++++++++++++
 xen/arch/arm/vsmc.c              |  2 +-
 4 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
index 7226cd9b2eb0..7adb67a1b81a 100644
--- a/xen/arch/arm/arm64/asm-offsets.c
+++ b/xen/arch/arm/arm64/asm-offsets.c
@@ -57,6 +57,15 @@ void __dummy__(void)
    BLANK();
    OFFSET(SMCCC_RES_a0, struct arm_smccc_res, a0);
    OFFSET(SMCCC_RES_a2, struct arm_smccc_res, a2);
+   OFFSET(ARM_SMCCC_1_2_REGS_X0_OFFS, struct arm_smccc_1_2_regs, a0);
+   OFFSET(ARM_SMCCC_1_2_REGS_X2_OFFS, struct arm_smccc_1_2_regs, a2);
+   OFFSET(ARM_SMCCC_1_2_REGS_X4_OFFS, struct arm_smccc_1_2_regs, a4);
+   OFFSET(ARM_SMCCC_1_2_REGS_X6_OFFS, struct arm_smccc_1_2_regs, a6);
+   OFFSET(ARM_SMCCC_1_2_REGS_X8_OFFS, struct arm_smccc_1_2_regs, a8);
+   OFFSET(ARM_SMCCC_1_2_REGS_X10_OFFS, struct arm_smccc_1_2_regs, a10);
+   OFFSET(ARM_SMCCC_1_2_REGS_X12_OFFS, struct arm_smccc_1_2_regs, a12);
+   OFFSET(ARM_SMCCC_1_2_REGS_X14_OFFS, struct arm_smccc_1_2_regs, a14);
+   OFFSET(ARM_SMCCC_1_2_REGS_X16_OFFS, struct arm_smccc_1_2_regs, a16);
 }
 
 /*
diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
index 91bae62dd4d2..fc6b676e2ee3 100644
--- a/xen/arch/arm/arm64/smc.S
+++ b/xen/arch/arm/arm64/smc.S
@@ -27,3 +27,45 @@ ENTRY(__arm_smccc_1_0_smc)
         stp     x2, x3, [x4, #SMCCC_RES_a2]
 1:
         ret
+
+/*
+ * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
+ *                        struct arm_smccc_1_2_regs *res)
+ */
+ENTRY(arm_smccc_1_2_smc)
+    /* Save `res` and free a GPR that won't be clobbered by SMC call */
+    stp     x1, x19, [sp, #-16]!
+
+    /* Ensure `args` won't be clobbered while loading regs in next step */
+    mov	x19, x0
+
+    /* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
+    ldp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
+    ldp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
+    ldp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
+    ldp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
+    ldp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
+    ldp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
+    ldp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
+    ldp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
+    ldp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
+
+    smc #0
+
+    /* Load the `res` from the stack */
+    ldr	x19, [sp]
+
+    /* Store the registers x0 - x17 into the result structure */
+    stp	x0, x1, [x19, #ARM_SMCCC_1_2_REGS_X0_OFFS]
+    stp	x2, x3, [x19, #ARM_SMCCC_1_2_REGS_X2_OFFS]
+    stp	x4, x5, [x19, #ARM_SMCCC_1_2_REGS_X4_OFFS]
+    stp	x6, x7, [x19, #ARM_SMCCC_1_2_REGS_X6_OFFS]
+    stp	x8, x9, [x19, #ARM_SMCCC_1_2_REGS_X8_OFFS]
+    stp	x10, x11, [x19, #ARM_SMCCC_1_2_REGS_X10_OFFS]
+    stp	x12, x13, [x19, #ARM_SMCCC_1_2_REGS_X12_OFFS]
+    stp	x14, x15, [x19, #ARM_SMCCC_1_2_REGS_X14_OFFS]
+    stp	x16, x17, [x19, #ARM_SMCCC_1_2_REGS_X16_OFFS]
+
+    /* Restore original x19 */
+    ldp     xzr, x19, [sp], #16
+    ret
diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index b3dbeecc90ad..1adcd37443c7 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
@@ -33,6 +33,7 @@
 
 #define ARM_SMCCC_VERSION_1_0   SMCCC_VERSION(1, 0)
 #define ARM_SMCCC_VERSION_1_1   SMCCC_VERSION(1, 1)
+#define ARM_SMCCC_VERSION_1_2   SMCCC_VERSION(1, 2)
 
 /*
  * This file provides common defines for ARM SMC Calling Convention as
@@ -265,6 +266,45 @@ void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
         else                                                    \
             arm_smccc_1_0_smc(__VA_ARGS__);                     \
     } while ( 0 )
+
+/*
+ * struct arm_smccc_1_2_regs - Arguments for or Results from SMC call
+ * @a0-a17 argument values from registers 0 to 17
+ */
+struct arm_smccc_1_2_regs {
+    unsigned long a0;
+    unsigned long a1;
+    unsigned long a2;
+    unsigned long a3;
+    unsigned long a4;
+    unsigned long a5;
+    unsigned long a6;
+    unsigned long a7;
+    unsigned long a8;
+    unsigned long a9;
+    unsigned long a10;
+    unsigned long a11;
+    unsigned long a12;
+    unsigned long a13;
+    unsigned long a14;
+    unsigned long a15;
+    unsigned long a16;
+    unsigned long a17;
+};
+
+/*
+ * arm_smccc_1_2_smc() - make SMC calls
+ * @args: arguments passed via struct arm_smccc_1_2_regs
+ * @res: result values via struct arm_smccc_1_2_regs
+ *
+ * This function is used to make SMC calls following SMC Calling Convention
+ * v1.2 or above. The content of the supplied param are copied from the
+ * structure to registers prior to the SMC instruction. The return values
+ * are updated with the content from registers on return from the SMC
+ * instruction.
+ */
+void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
+                       struct arm_smccc_1_2_regs *res);
 #endif /* CONFIG_ARM_64 */
 
 #endif /* __ASSEMBLY__ */
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 7335276f3fa1..cd68fa80e98a 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -85,7 +85,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
     switch ( fid )
     {
     case ARM_SMCCC_VERSION_FID:
-        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_1);
+        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_2);
         return true;
 
     case ARM_SMCCC_ARCH_FEATURES_FID:
-- 
2.34.1


