Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7E6554B90
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 15:43:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.353888.580895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o40cr-0002Yl-CI; Wed, 22 Jun 2022 13:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 353888.580895; Wed, 22 Jun 2022 13:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o40cr-0002Wg-8d; Wed, 22 Jun 2022 13:42:33 +0000
Received: by outflank-mailman (input) for mailman id 353888;
 Wed, 22 Jun 2022 13:42:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4T0g=W5=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1o40cp-0002HE-Ng
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 13:42:31 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29aec4b5-f231-11ec-bd2d-47488cf2e6aa;
 Wed, 22 Jun 2022 15:42:30 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id i18so14214089lfu.8
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jun 2022 06:42:30 -0700 (PDT)
Received: from jade.urgonet (h-79-136-84-253.A175.priv.bahnhof.se.
 [79.136.84.253]) by smtp.gmail.com with ESMTPSA id
 p5-20020ac24ec5000000b0047f666011e4sm1523292lfr.26.2022.06.22.06.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 06:42:29 -0700 (PDT)
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
X-Inumbo-ID: 29aec4b5-f231-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K3/VT3Y9oOhER9vVT3TVNVa0siiJyunGdW85AfZUMjo=;
        b=uy2h+Yh/FPR7Ao08uURaLGllmWPGZXKyimqkEJSBrOeoD3osOJ0ytzHni49lp+7Xjq
         W9Z2J8tmjJh+6FkvwGJIGx80HlHnVQB/ChtoU4uDWrDUhjmNyKti4gpqwmwhCHeU1yhI
         L+4L62p8uFnAyJ2YCQB8VZ13uAwcOmT79VgfuJEZo4Y7FNV/5qax8r/LK642CsksR8fU
         dsSHNCT+WH2G0AMjE8c6Jr1LSwALU9c5T8+JwPM8+YBeq8F8LWwsCgcTmQi/W3Lmu6jh
         AlDu8wKTa1wEctbFX21TEUAGG5/sLOhxu9csFNEysS9VH42p9xALaSr2AdpVWygF02uw
         m1ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K3/VT3Y9oOhER9vVT3TVNVa0siiJyunGdW85AfZUMjo=;
        b=7pJv8acgpdVqEp87lIZYY3oqYtXrgGbwOhlZa6E/pmm6QasUWQsKKLUaSJvcd08rJR
         xNRIkwrGjBj0Bfr+zvOh+AbRd2fngfQhMbF03xAAY0G/yWkaUJXrv2tgxCeCnaE4/k2P
         ZWipJz90Ob7W37DglMpzQHluhmEKZZxqNFGgA2FocTnJVrxYVhwoBrwWx+5iPImEkNcf
         hq6THdAlR0xM48RSnWxPosjkUNKS0bkK64deaeuTi43Lq2i21LFwh2gXFyCn9wOrufAT
         B/MCv26gKHo4JP+2coBvNHSBia+tnDUHVHrL5jYl2tQQegjeb+T/j0rwHqe32zEaLDFz
         syHg==
X-Gm-Message-State: AJIora/him6UU9DxSXFivaHjTvvBe0ayxnaJheHpQyQKZzkiBxabVcRZ
	c83yzX6EGZsTJ/7jq0tBSZuJt0mCazzOgA==
X-Google-Smtp-Source: AGRyM1szUTxnhQl+IgX6yfjuKDsYGN6dbV57I65NHHvZcFIvRoxeFZsuWUNP8afpuqNLdY22Vd0t8w==
X-Received: by 2002:a05:6512:110f:b0:47f:985c:e010 with SMTP id l15-20020a056512110f00b0047f985ce010mr1828359lfg.390.1655905350212;
        Wed, 22 Jun 2022 06:42:30 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand.Marquis@arm.com,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v4 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended input/output registers
Date: Wed, 22 Jun 2022 15:42:18 +0200
Message-Id: <20220622134219.1596613-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220622134219.1596613-1-jens.wiklander@linaro.org>
References: <20220622134219.1596613-1-jens.wiklander@linaro.org>
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

The SMCCC version reported to the VM is bumped to 1.2 in order to support
handling FF-A messages.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/arm64/asm-offsets.c |  9 +++++++
 xen/arch/arm/arm64/smc.S         | 43 ++++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/smccc.h | 40 +++++++++++++++++++++++++++++
 xen/arch/arm/vsmc.c              |  2 +-
 4 files changed, 93 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm64/asm-offsets.c b/xen/arch/arm/arm64/asm-offsets.c
index 280ddb55bfd4..1721e1ed26e1 100644
--- a/xen/arch/arm/arm64/asm-offsets.c
+++ b/xen/arch/arm/arm64/asm-offsets.c
@@ -56,6 +56,15 @@ void __dummy__(void)
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
index 91bae62dd4d2..c546192e7f2d 100644
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
index b3dbeecc90ad..b5e3f67eb34e 100644
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
+
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
 #endif /* CONFIG_ARM_64 */
 
 #endif /* __ASSEMBLY__ */
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


