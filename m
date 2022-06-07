Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2C153FAE7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 12:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.343104.568271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyWAV-0008PY-4H; Tue, 07 Jun 2022 10:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 343104.568271; Tue, 07 Jun 2022 10:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyWAV-0008NH-0t; Tue, 07 Jun 2022 10:10:35 +0000
Received: by outflank-mailman (input) for mailman id 343104;
 Tue, 07 Jun 2022 10:10:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y3MX=WO=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1nyWAT-00087m-OF
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 10:10:33 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 107c546b-e64a-11ec-b605-df0040e90b76;
 Tue, 07 Jun 2022 12:10:32 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id c2so8097342lfk.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jun 2022 03:10:32 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 e2-20020ac24e02000000b0047900e9a9d2sm3209841lfr.266.2022.06.07.03.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 03:10:30 -0700 (PDT)
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
X-Inumbo-ID: 107c546b-e64a-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dQPXxDCut3Pua0qNAEZ53+VJvVFB7ixy0a17hUj7Md8=;
        b=Fugla0OF7AXkPjag2WeGbVplXjA4J1zsQJSn7tsDIKGDPijAAgkyc9GcBpYn1OPbE0
         w7kMLlK9s9qo6ixuiLECcwE0qiHJH43ey+FGSKhs7I4dqiIqQFZYAVOr8+J6rUla6uXy
         ulvR4OCC11PBc2qfGD7Jn9BHiOo8Qb7bwY7/2pb8dFdgT/9EpWWIdzJKTYBdn83xBkkb
         1yaFCa9hDjRR1QWO3k13TE20JzNdYdQ26DAZZVgIXL8my1UwOAw0K/2NsOwvFJZTD3sS
         KY5Umr9dEhbI890IIMYrlGZHALZRSOWKGVfJRyJ8xmdntSFSLKObMPxYEx73BwUNG1EH
         r6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQPXxDCut3Pua0qNAEZ53+VJvVFB7ixy0a17hUj7Md8=;
        b=1DlS/2fQX5VXEoHWdABZnhOzeFXBLfFf9Gh9lF+YBFDc99QTcjp+Wfcd1BYHg5+jFD
         bBI8rxk+NFsQK70k83F1r0Pwg667lf3J4zjRMWsKFhP0xSqoOELetOjYcyUW/EUe6/hv
         U0LTMXm5yzp2GrmK71lJ5hiNjLIYSWatGNILQtNRu/WWfLbPWe++1izbAHsarRDSQrOs
         AyYfylfq//EUYbQzYRbT7UrUaqJ77wG76cU7EM5b3XVSaeSBYmdVK2sEztVC17WXm4kJ
         Pq+sTi5mdzdzPRYzsTHQ2K/qq8/mYfx8y0ydcfqYuS2GW2V3a7dGpFCLopNODgX+vyFS
         T1QQ==
X-Gm-Message-State: AOAM533Kcn4uGkYmRjMEpPxkp0jJiGc3Wqi0TBlAWOtGIdSUimAyiPvD
	8r96LE3D1Iiv0lGI4M1aHJ09sNy7a+F2Sw==
X-Google-Smtp-Source: ABdhPJz4saHK0vOfKS2cDVhY1Iv++cAEl9n/zRndcN6Hyt9Zlj+OcsqsEEoVMG/9LKHx8hEj+lQRiw==
X-Received: by 2002:ac2:5f92:0:b0:479:112e:76d7 with SMTP id r18-20020ac25f92000000b00479112e76d7mr16665941lfe.189.1654596631464;
        Tue, 07 Jun 2022 03:10:31 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended input/output registers
Date: Tue,  7 Jun 2022 12:10:09 +0200
Message-Id: <20220607101010.3136600-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220607101010.3136600-1-jens.wiklander@linaro.org>
References: <20220607101010.3136600-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SMCCC v1.2 AArch64 allows x0-x17 to be used as both parameter registers
and result registers for the SMC and HVC instructions.

Arm Firmware Framework for Armv8-A specification makes use of x0-x7 as
parameter and result registers.

Let us add new interface to support this extended set of input/output
registers.

This is based on 3fdc0cb59d97 ("arm64: smccc: Add support for SMCCCv1.2
extended input/output registers") by Sudeep Holla from the Linux kernel

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/arm64/smc.S    | 43 +++++++++++++++++++++++++++++++++++++
 xen/arch/arm/vsmc.c         |  2 +-
 xen/include/asm-arm/smccc.h | 42 ++++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
index b0752be57e8f..e024fa4d44d1 100644
--- a/xen/arch/arm/arm64/smc.S
+++ b/xen/arch/arm/arm64/smc.S
@@ -30,3 +30,46 @@ ENTRY(__arm_smccc_1_0_smc)
         stp     x2, x3, [x4, #SMCCC_RES_a2]
 1:
         ret
+
+
+/*
+ * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
+ *                        struct arm_smccc_1_2_regs *res)
+ */
+ENTRY(arm_smccc_1_2_smc)
+    /* Save `res` and free a GPR that won't be clobbered */
+    stp     x1, x19, [sp, #-16]!
+
+    /* Ensure `args` won't be clobbered while loading regs in next step */
+    mov	x19, x0
+
+    /* Load the registers x0 - x17 from the struct arm_smccc_1_2_regs */
+    ldp	x0, x1, [x19, #0]
+    ldp	x2, x3, [x19, #16]
+    ldp	x4, x5, [x19, #32]
+    ldp	x6, x7, [x19, #48]
+    ldp	x8, x9, [x19, #64]
+    ldp	x10, x11, [x19, #80]
+    ldp	x12, x13, [x19, #96]
+    ldp	x14, x15, [x19, #112]
+    ldp	x16, x17, [x19, #128]
+
+    smc #0
+
+    /* Load the `res` from the stack */
+    ldr	x19, [sp]
+
+    /* Store the registers x0 - x17 into the result structure */
+    stp	x0, x1, [x19, #0]
+    stp	x2, x3, [x19, #16]
+    stp	x4, x5, [x19, #32]
+    stp	x6, x7, [x19, #48]
+    stp	x8, x9, [x19, #64]
+    stp	x10, x11, [x19, #80]
+    stp	x12, x13, [x19, #96]
+    stp	x14, x15, [x19, #112]
+    stp	x16, x17, [x19, #128]
+
+    /* Restore original x19 */
+    ldp     xzr, x19, [sp], #16
+    ret
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index a36db15fffc0..33b0ddc634da 100644
--- a/xen/arch/arm/vsmc.c
+++ b/xen/arch/arm/vsmc.c
@@ -93,7 +93,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
     switch ( fid )
     {
     case ARM_SMCCC_VERSION_FID:
-        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_1);
+        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_2);
         return true;
 
     case ARM_SMCCC_ARCH_FEATURES_FID:
diff --git a/xen/include/asm-arm/smccc.h b/xen/include/asm-arm/smccc.h
index 9d94beb3df2d..8128283bc7b6 100644
--- a/xen/include/asm-arm/smccc.h
+++ b/xen/include/asm-arm/smccc.h
@@ -33,6 +33,7 @@
 
 #define ARM_SMCCC_VERSION_1_0   SMCCC_VERSION(1, 0)
 #define ARM_SMCCC_VERSION_1_1   SMCCC_VERSION(1, 1)
+#define ARM_SMCCC_VERSION_1_2   SMCCC_VERSION(1, 2)
 
 /*
  * This file provides common defines for ARM SMC Calling Convention as
@@ -217,6 +218,7 @@ struct arm_smccc_res {
 #ifdef CONFIG_ARM_32
 #define arm_smccc_1_0_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
 #define arm_smccc_smc(...) arm_smccc_1_1_smc(__VA_ARGS__)
+
 #else
 
 void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
@@ -265,8 +267,48 @@ void __arm_smccc_1_0_smc(register_t a0, register_t a1, register_t a2,
         else                                                    \
             arm_smccc_1_0_smc(__VA_ARGS__);                     \
     } while ( 0 )
+
+/**
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
 #endif /* CONFIG_ARM_64 */
 
+/**
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
+
+
 #endif /* __ASSEMBLY__ */
 
 /*
-- 
2.31.1


