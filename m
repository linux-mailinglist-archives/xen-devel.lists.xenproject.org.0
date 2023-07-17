Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A11AC755CB1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jul 2023 09:22:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564175.881477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXw-0005v4-Fi; Mon, 17 Jul 2023 07:21:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564175.881477; Mon, 17 Jul 2023 07:21:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLIXw-0005t8-9P; Mon, 17 Jul 2023 07:21:28 +0000
Received: by outflank-mailman (input) for mailman id 564175;
 Mon, 17 Jul 2023 07:21:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xV9D=DD=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qLIXu-0005A9-2B
 for xen-devel@lists.xenproject.org; Mon, 17 Jul 2023 07:21:26 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 893edf61-2472-11ee-8611-37d641c3527e;
 Mon, 17 Jul 2023 09:21:24 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b946602d64so2673711fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jul 2023 00:21:24 -0700 (PDT)
Received: from rayden.urgonet (h-46-59-78-111.A175.priv.bahnhof.se.
 [46.59.78.111]) by smtp.gmail.com with ESMTPSA id
 l10-20020ac24a8a000000b004f846cd74bcsm2658938lfp.245.2023.07.17.00.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jul 2023 00:21:23 -0700 (PDT)
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
X-Inumbo-ID: 893edf61-2472-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689578483; x=1692170483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPB2Dc6t3Zgd1EEjPsex1QWFM8C9VFNKedpjWqBxO5k=;
        b=V22QfuOvnrz2ZMKPpbLsf8tnrMXE/ezbAbUc/m06Cfu+FlBDYuKhrFWUmPQzq+dZ+L
         MjZvwlwKX9kFQgiRGpCTXW9Ktlg/ENe4UWhgG97/bIeTGYjq66G6spi/fJUoUVZGqc6G
         tLornI/HoFmZiT0pbSi6gArdQ/8KcGvA4i2UP19q+xdbdSEbpBrsavA7uXbELffRWHQy
         Md31Mg3Ahr+xfa55TjhIRH4lEtjisRGQR62i2gr8CxunH6mfHGev6HDjjLdzyjF7mlN7
         qWR20e5InWoPW+vI6vghNKxyxbF2rpiz0KWfbbvW3h9oJthJzwr7YIUiOsa4xAXByOXX
         ID/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689578483; x=1692170483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPB2Dc6t3Zgd1EEjPsex1QWFM8C9VFNKedpjWqBxO5k=;
        b=LV8OpPcw6LIyk1Kw1NWQ0D0RflrG64ncr96YveWwLjnaVUX8Z0VEvbGF+JHvn9DCCc
         YPoMiL/Ztp8zq14VgQiBYw+xGIPDbT7fKSWsGnvA1V7SDyrptsxSGxEKyP30cT3rcsUb
         ALyB0/cKK3KYn1bLg3foSxKUSzKcYBHa7gbmSdr+OPw8EQRfxN1TFVwRQjnsSGGOYUbD
         Jx4ZrgqB3SKDqhaGbjZ9BtO3JaqeYM9SWo5GKkT2/sd3SQyuAVMahLFAIdP/hGUOrCD5
         a6NfpsV55Fo7oWV5NENZXX9hASUbvupyVkAmgbN1rYLTp7uGoLQ1543wdRcBZ9PIkdKm
         dlDw==
X-Gm-Message-State: ABy/qLaRNQDFwyHMk5UOSj7R/MiEa2ypvJ8TdV938KwSIX0c5ph57nBm
	MnTgdNFqwocxB0DhRjp5UbkI7vVDwUGPG2F6Do0=
X-Google-Smtp-Source: APBJJlFhv/HAHZq3LJyFZmgq1sZPcwSSK8rc5jEZbHc6Bywkzh9GPJhEqSyHRRnZWHklGW1ywNcTxQ==
X-Received: by 2002:a05:6512:2313:b0:4f9:51b7:a19c with SMTP id o19-20020a056512231300b004f951b7a19cmr9120809lfu.19.1689578483607;
        Mon, 17 Jul 2023 00:21:23 -0700 (PDT)
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
Subject: [XEN PATCH v10 03/24] xen/arm: smccc: add support for SMCCCv1.2 extended input/output registers
Date: Mon, 17 Jul 2023 09:20:46 +0200
Message-Id: <20230717072107.753304-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717072107.753304-1-jens.wiklander@linaro.org>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
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


