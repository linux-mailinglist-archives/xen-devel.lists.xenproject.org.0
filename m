Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF936E0788
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 09:16:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520461.808049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBM-0001ma-4w; Thu, 13 Apr 2023 07:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520461.808049; Thu, 13 Apr 2023 07:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmrBL-0001jz-VV; Thu, 13 Apr 2023 07:15:47 +0000
Received: by outflank-mailman (input) for mailman id 520461;
 Thu, 13 Apr 2023 07:15:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UVxt=AE=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pmrBL-0001gq-0O
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 07:15:47 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0182c663-d9cb-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 09:15:44 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id d7so28946280lfj.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Apr 2023 00:15:44 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 n12-20020ac2490c000000b004dc83d04840sm181354lfi.79.2023.04.13.00.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 00:15:43 -0700 (PDT)
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
X-Inumbo-ID: 0182c663-d9cb-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681370144; x=1683962144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPB2Dc6t3Zgd1EEjPsex1QWFM8C9VFNKedpjWqBxO5k=;
        b=EvXtGtaw0BIV2NMQMuY4QKgGrDz+ryd3caJ2Qw+PTBLFkehwADpIx1R7gReCRzoJSa
         b9GnenXOP5EM0wQM9GtwCIVbCQVRv5eFGLfAAzn6BCYX3JXdJd3ToNbJvllEJix8BfkT
         78PwvoaHZJ9jgydmRYGzedCTgOy0WXpUtRL3IpOTCFIn/muvvbfEaLdaUZh0qkhTt85R
         4Zb3B15KDi7OexYQdYu9LpG7IOcibytoXe5KyvfN0ImMCWmMAN4aTGiKD25jO2GzYanX
         tNdGds9mCtnYQpPXmGHJkPYZONy6ckogZ0sGx6ZJ7G5meQb/vvFNiKZ9ySAUmfF3b/G7
         M2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681370144; x=1683962144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPB2Dc6t3Zgd1EEjPsex1QWFM8C9VFNKedpjWqBxO5k=;
        b=WMNZCr1AwrZdzSJwgGucafP4Ziy35GmvplfFfPKHP+fDJKpMBodMa763rCm/AWsp6y
         0LL+0iCGO7v15bYVRrqgtdtcw+fEPup70xryzuwz5u+D9F0K5E1/Gar5nkc5h7U+vj/o
         PgwrDPcISgzLlzkmbqI5iZtOpE9HzVJX/T+XMYXW5TPy/KH7KYI/7UpGmVBW47X39dpW
         vrbgM+E/UKdlnEZoYiYdu2otchQ2BUUVBu6PSxwvbIbXKgIG3l7dAPq4FexTc3qC2Gjm
         CFvMunxmiebkdBUU8CQWZBnaxE2ikW/LzfGm9Zypwc80n9K3iVQJE7QwmOhVFOWFOZaY
         eI9g==
X-Gm-Message-State: AAQBX9fbolx1CHYv6xOX9aQ/sqm9DIDSVRurBE8FprGSQchSKKtkWduX
	NJPZKlPA3TQQGAcAhqC1Lpe2O8qy+nMnIjHOXCk=
X-Google-Smtp-Source: AKy350ahhVJexmXN4HqaSvh9J9OfzgvqpB3LvRahdZVySM2Hj7+tIQKdZi3psAdn0wNK35trjyeemQ==
X-Received: by 2002:ac2:4946:0:b0:4c0:2ddc:4559 with SMTP id o6-20020ac24946000000b004c02ddc4559mr489919lfi.69.1681370143951;
        Thu, 13 Apr 2023 00:15:43 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	Marc Bonnici <marc.bonnici@arm.com>,
	Achin Gupta <achin.gupta@arm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [XEN PATCH v8 01/22] xen/arm: smccc: add support for SMCCCv1.2 extended input/output registers
Date: Thu, 13 Apr 2023 09:14:03 +0200
Message-Id: <20230413071424.3273490-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413071424.3273490-1-jens.wiklander@linaro.org>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
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


