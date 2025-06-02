Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D13BACAB1F
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002952.1382457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16S-0002A1-NP; Mon, 02 Jun 2025 09:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002952.1382457; Mon, 02 Jun 2025 09:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16S-00021S-Fl; Mon, 02 Jun 2025 09:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1002952;
 Mon, 02 Jun 2025 09:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM16Q-00081k-4b
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:05:06 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aca78b68-3f90-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 11:05:05 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55329bd977aso5224207e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:05:05 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cdc3sm1507541e87.176.2025.06.02.02.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:05:03 -0700 (PDT)
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
X-Inumbo-ID: aca78b68-3f90-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748855105; x=1749459905; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bD1e3cReyKifgfKVVK1ivsJtIILbWIwhcDmXv0PowdU=;
        b=aqU9jxcieiQz9hYAEEwZt2MFz4xNK1EvE5cUp5vCASp1MUDMaJ1AvfUTBjaEb80wyd
         +r9t4lIld9HOv+3l8UzM/pf6uXIRj62T2pUKyHr+QGl+6snbVs72vTT2JRX662x954kp
         PwmmzhbCJH7Ks0sRBWuLzicerVKm4oMKi0HzxaQzQBHBtZ+0MbIcEZxHeWc4cQe5xAg2
         p6BDfgrvJYa9yBzfynVqJY5lF4Lk2oavIJwFIt/RmZ2JKWfxfJEsGelsq7ALq9BtxAyY
         cwJRT5bWZnHOaK9LYBpsJyXYFbpY9RnzYESwlfwsUCSZ5RLSn5Wdt69nMEb7ORXIpqt2
         LiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855105; x=1749459905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bD1e3cReyKifgfKVVK1ivsJtIILbWIwhcDmXv0PowdU=;
        b=NSL8C/5yCaladbBY6T4zXXPOsIeDrEpw3k/USDYV2b0TAUFndc83F2ql7T9YPV2EBP
         VoFlwGPujmE+ennOY5yysIoiwcDw0ye86uGwZuILkjg6Y8zvpBVOhGGNnDTpBjLEgLlm
         8lbkCQBykkMzhe7FxOHXXI7YGuyzo3ckje9xKsKlNGQLw1C5r+oeLMTKv3/J/eQO0n2m
         KcCRBO3Z1ZQ7VCSRLnydDlN+3S5DeV1tSIG2AG9hAC1BxGgdyg4SrWvXstMcgJzVhxJT
         4ia4tD+3LEbc84twuYmvbNWYbdtL+QKEjd1oA9K5Epa+3ojyduprcwZf9VcgSM1AObeQ
         Zzlw==
X-Gm-Message-State: AOJu0YynydaVDej2eOUO5FL78/RJBnvW8CPL4SKNF2Q7xxoYiMqgKi8/
	Kcu+nHTFGBEd7MK9ta/l0bHfUENMprTYKIXKOe5h7Bzwnu3YcE0eQobFN7O++WZ1
X-Gm-Gg: ASbGncuoLwDiNz8VRqy0zgRb1TwMy9TsponFm4voNadTq9RiKnZpMwjieuM5FIhukR4
	zalGoBILXi/b3ec6jun66U/fQUSBqvm6h/IpeJ0jpKEnTq4W356mplmfFFXXanB8G/P2yuUbu5h
	0X2nuA5/hM/IS9JtkpFnhJ+2dQ2z4r3Fiks84oJ5469EZ8eTxeYXJpmNbkiHM4MHEO99m5cR5Vk
	g0triTtWOiyjo37cX2Gjzzoiq1RjP3AdsohAV9zd5GydWnVkRvdOu9rMgQX8T4J//CxBYwoNeXD
	Kp086njUD33n2p6Ugf1NH67QlIVVO3UNra3kFqpgFd/J4TNKc2WZjgNBom3ARHUGDTpw9kMYbjn
	D71IApzUVBaAOhIzOmLI194Ljmg==
X-Google-Smtp-Source: AGHT+IFaBoA7Yo/WUepczn6Qruy6S1UWK4p6ZJeemhxCrjIh1ez95m44qZ2wj4raboedU+yZ8Qfwqw==
X-Received: by 2002:a05:6512:1592:b0:553:2159:8716 with SMTP id 2adb3069b0e04-5533ba99850mr3614033e87.26.1748855104208;
        Mon, 02 Jun 2025 02:05:04 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xakep.amatop@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4][PART 2 10/10] xen/arm: Save/restore context on suspend/resume
Date: Mon,  2 Jun 2025 12:04:21 +0300
Message-ID: <8f5904bc8f4d8ee39e248b3a2213fb3ed6815aff.1748848482.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748848482.git.mykola_kvach@epam.com>
References: <cover.1748848482.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The context of CPU general purpose and system control registers
has to be saved on suspend and restored on resume. This is
implemented in hyp_suspend and before the return from hyp_resume
function. The hyp_suspend is invoked just before the PSCI system
suspend call is issued to the ATF. The hyp_suspend has to return a
non-zero value so that the calling 'if' statement evaluates to true,
causing the system suspend to be invoked. Upon the resume, context
saved on suspend will be restored, including the link register.
Therefore, after restoring the context the control flow will
return to the address pointed by the saved link register, which
is the place from which the hyp_suspend was called. To ensure
that the calling 'if' statement doesn't again evaluate to true
and initiate system suspend, hyp_resume has to return a zero value
after restoring the context.

Note that the order of saving register context into cpu_context
structure has to match the order of restoring.

Support for ARM32 is not implemented. Instead, compilation fails with a
build-time error if suspend is enabled for ARM32.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v4:
- produce build-time error for ARM32 when CONFIG_SYSTEM_SUSPEND is enabled
- use register_t instead of uint64_t in cpu_context structure
---
 xen/arch/arm/arm64/head.S          | 88 +++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/suspend.h | 20 +++++++
 xen/arch/arm/suspend.c             | 23 +++++++-
 3 files changed, 127 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 596e960152..70bb305ce3 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -562,6 +562,52 @@ END(efi_xen_start)
 #endif /* CONFIG_ARM_EFI */
 
 #ifdef CONFIG_SYSTEM_SUSPEND
+/*
+ * int hyp_suspend(struct cpu_context *ptr)
+ *
+ * x0 - pointer to the storage where callee's context will be saved
+ *
+ * CPU context saved here will be restored on resume in hyp_resume function.
+ * hyp_suspend shall return a non-zero value. Upon restoring context
+ * hyp_resume shall return value zero instead. From C code that invokes
+ * hyp_suspend, the return value is interpreted to determine whether the context
+ * is saved (hyp_suspend) or restored (hyp_resume).
+ */
+FUNC(hyp_suspend)
+        /* Store callee-saved registers */
+        stp     x19, x20, [x0], #16
+        stp     x21, x22, [x0], #16
+        stp     x23, x24, [x0], #16
+        stp     x25, x26, [x0], #16
+        stp     x27, x28, [x0], #16
+        stp     x29, lr, [x0], #16
+
+        /* Store stack-pointer */
+        mov     x2, sp
+        str     x2, [x0], #8
+
+        /* Store system control registers */
+        mrs     x2, VBAR_EL2
+        str     x2, [x0], #8
+        mrs     x2, VTCR_EL2
+        str     x2, [x0], #8
+        mrs     x2, VTTBR_EL2
+        str     x2, [x0], #8
+        mrs     x2, TPIDR_EL2
+        str     x2, [x0], #8
+        mrs     x2, MDCR_EL2
+        str     x2, [x0], #8
+        mrs     x2, HSTR_EL2
+        str     x2, [x0], #8
+        mrs     x2, CPTR_EL2
+        str     x2, [x0], #8
+        mrs     x2, HCR_EL2
+        str     x2, [x0], #8
+
+        /* hyp_suspend must return a non-zero value */
+        mov     x0, #1
+        ret
+END(hyp_suspend)
 
 FUNC(hyp_resume)
         /* Initialize the UART if earlyprintk has been enabled. */
@@ -580,7 +626,47 @@ FUNC(hyp_resume)
         b     enable_secondary_cpu_mm
 
 mmu_resumed:
-        b .
+        /* Now we can access the cpu_context, so restore the context here */
+        ldr     x0, =cpu_context
+
+        /* Restore callee-saved registers */
+        ldp     x19, x20, [x0], #16
+        ldp     x21, x22, [x0], #16
+        ldp     x23, x24, [x0], #16
+        ldp     x25, x26, [x0], #16
+        ldp     x27, x28, [x0], #16
+        ldp     x29, lr, [x0], #16
+
+        /* Restore stack pointer */
+        ldr     x2, [x0], #8
+        mov     sp, x2
+
+        /* Restore system control registers */
+        ldr     x2, [x0], #8
+        msr     VBAR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     VTCR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     VTTBR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     TPIDR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     MDCR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     HSTR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     CPTR_EL2, x2
+        ldr     x2, [x0], #8
+        msr     HCR_EL2, x2
+        isb
+
+        /* Since context is restored return from this function will appear as
+         * return from hyp_suspend. To distinguish a return from hyp_suspend
+         * which is called upon finalizing the suspend, as opposed to return
+         * from this function which executes on resume, we need to return zero
+         * value here. */
+        mov x0, #0
+        ret
 END(hyp_resume)
 
 #endif /* CONFIG_SYSTEM_SUSPEND */
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 55041a5d06..ae71ccb87b 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -5,9 +5,29 @@
 
 #ifdef CONFIG_SYSTEM_SUSPEND
 
+#ifdef CONFIG_ARM_64
+struct cpu_context {
+    register_t callee_regs[12];
+    register_t sp;
+    register_t vbar_el2;
+    register_t vtcr_el2;
+    register_t vttbr_el2;
+    register_t tpidr_el2;
+    register_t mdcr_el2;
+    register_t hstr_el2;
+    register_t cptr_el2;
+    register_t hcr_el2;
+} __aligned(16);
+#else
+#error "Define cpu_context structure for arm32"
+#endif
+
+extern struct cpu_context cpu_context;
+
 int host_system_suspend(void);
 
 void hyp_resume(void);
+int hyp_suspend(struct cpu_context *ptr);
 
 #endif /* CONFIG_SYSTEM_SUSPEND */
 
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index f3ad8517ac..b1b8644a75 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <asm/psci.h>
+#include <asm/suspend.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
 #include <xen/sched.h>
@@ -17,6 +18,8 @@
  *  - Investigate feasibility and need for implementing system suspend on ARM32
  */
 
+struct cpu_context cpu_context;
+
 /* Xen suspend. Note: data is not used (suspend is the suspend to RAM) */
 static long system_suspend(void *data)
 {
@@ -73,9 +76,23 @@ static long system_suspend(void *data)
      */
     update_boot_mapping(true);
 
-    status = call_psci_system_suspend();
-    if ( status )
-        dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=%d\n", status);
+    if ( hyp_suspend(&cpu_context) )
+    {
+        status = call_psci_system_suspend();
+        /*
+         * If suspend is finalized properly by above system suspend PSCI call,
+         * the code below in this 'if' branch will never execute. Execution
+         * will continue from hyp_resume which is the hypervisor's resume point.
+         * In hyp_resume CPU context will be restored and since link-register is
+         * restored as well, it will appear to return from hyp_suspend. The
+         * difference in returning from hyp_suspend on system suspend versus
+         * resume is in function's return value: on suspend, the return value is
+         * a non-zero value, on resume it is zero. That is why the control flow
+         * will not re-enter this 'if' branch on resume.
+         */
+        if ( status )
+            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=%d\n", status);
+    }
 
     system_state = SYS_STATE_resume;
     update_boot_mapping(false);
-- 
2.48.1


