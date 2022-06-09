Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0DB5443AA
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 08:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344661.570224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzBUr-0005xC-VA; Thu, 09 Jun 2022 06:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344661.570224; Thu, 09 Jun 2022 06:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzBUr-0005tg-Rt; Thu, 09 Jun 2022 06:18:21 +0000
Received: by outflank-mailman (input) for mailman id 344661;
 Thu, 09 Jun 2022 06:18:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ts8Y=WQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1nzBUp-0005eB-VB
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 06:18:20 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f48dfa39-e7bb-11ec-b605-df0040e90b76;
 Thu, 09 Jun 2022 08:18:19 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id b12so14035871ljq.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jun 2022 23:18:19 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 u20-20020ac248b4000000b00478d24ad1basm4061130lfg.307.2022.06.08.23.18.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 23:18:17 -0700 (PDT)
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
X-Inumbo-ID: f48dfa39-e7bb-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ri0u6xOBjOiuO3HIUy3d1X4f5KfG9398JmyGMTYIkKk=;
        b=OZJUhsCXnnFB7y6quvN4Q282K/DVrYsoz2N4EAyYNX7gGu/glzLsKAUpoz3j1hr0LL
         ydCoSJRn7nm+TpyF7ukZm1S+4T/ahh0tC6GlrOl7Yx1HmPoxZIVPAG2QGDX1PYpaRHUD
         B5+8YPJPH6ckdHS0jwAhmCT0Ge/gQCR9AoDku847gv41zYzzH595DQ5yw46rF5KDGSxV
         AoQF3FlhQkh/ETCaiKrExDHBNFKrHQxWnnrNR2lQRGvT51lgNd8GRR8UBROZaHgLbpSL
         PHS7HpCpOoCsakA2SG/DT3I5JL0gp6PC913Tqr1eoIxQWzS0EiIVN2Rs4CPELWuGWZBS
         WNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ri0u6xOBjOiuO3HIUy3d1X4f5KfG9398JmyGMTYIkKk=;
        b=JyV28ytMCLFaPoB90sQbfdhLGJynwIm8eK5MmyBC980YDfost63ma7+on3ZwxcscPE
         OS7sDQ7qf9PoboJsOfIfmQc7tZT7+zknEoxc5K77cjSQ7I2jEotZ4U4m5GoCrkcX8Dzg
         HEgwJXv0l9jxZx7zGB2ZFTY4rFZlUYizDFMJyykcBeKUzz4g6F02OB+MNCBqTar4IfZp
         24b+/A0powVSywlMSBkCyqBJICzKtDkbsHi5rAzfA8RUeFhty3T3LIhlvvEcEmDJyMFt
         fMIb25fDaeFrK/ripOW5QocvLslweGr5pdkpJBYd45qbxialWxu5hzjnT1gvVMIldd/v
         tzQw==
X-Gm-Message-State: AOAM531N5CKZL8w/cD1UImuOxKb/tv2O1CGMIu4k3ZhC+uhpT9G8QZOZ
	E8Udc987sJIQYvQ5NXEV08mZnVIS4N9oNw==
X-Google-Smtp-Source: ABdhPJw540PSLNtEStMCasgsWgpyR8rfrBeo7Upyseh9LJipbBEAaC7sQVmQ5z103Y3w6Y9d7ZTmGw==
X-Received: by 2002:a05:651c:1a0d:b0:255:bf5a:3445 with SMTP id by13-20020a05651c1a0d00b00255bf5a3445mr4641115ljb.285.1654755498307;
        Wed, 08 Jun 2022 23:18:18 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v2 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended input/output registers
Date: Thu,  9 Jun 2022 08:18:11 +0200
Message-Id: <20220609061812.422130-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220609061812.422130-1-jens.wiklander@linaro.org>
References: <20220609061812.422130-1-jens.wiklander@linaro.org>
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
 xen/arch/arm/arm64/smc.S         | 43 ++++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/smccc.h | 42 +++++++++++++++++++++++++++++++
 xen/arch/arm/vsmc.c              |  2 +-
 3 files changed, 86 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
index 91bae62dd4d2..1570bc8eb9d4 100644
--- a/xen/arch/arm/arm64/smc.S
+++ b/xen/arch/arm/arm64/smc.S
@@ -27,3 +27,46 @@ ENTRY(__arm_smccc_1_0_smc)
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
diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
index b3dbeecc90ad..316adf968e74 100644
--- a/xen/arch/arm/include/asm/smccc.h
+++ b/xen/arch/arm/include/asm/smccc.h
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
diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
index 676740ef1520..6f90c08a6304 100644
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
-- 
2.31.1


