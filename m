Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0BDB3F0E0
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105408.1456417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjV-0007Wv-Nk; Mon, 01 Sep 2025 22:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105408.1456417; Mon, 01 Sep 2025 22:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjV-0007M9-6O; Mon, 01 Sep 2025 22:10:37 +0000
Received: by outflank-mailman (input) for mailman id 1105408;
 Mon, 01 Sep 2025 22:10:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjS-0005XP-Vp
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:34 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b522cba-8780-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 00:10:34 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55f69cf4b77so3061874e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:34 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:32 -0700 (PDT)
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
X-Inumbo-ID: 7b522cba-8780-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764634; x=1757369434; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUm3eao0nv7lQDT5rWWvwgkJGYkE0FYcno3r5As+ock=;
        b=gMC/XyEF3f85vCpaLUurs0tmK7pd5exHkoE5EKQwKE2lGnHCkfJLvkGn9S6vQlBoqU
         ty9E01XQsuqUc3UnruMF/dYVUVX/BE+Q58ArXY6MPHYXRuf9Vm9EERGD+sCbonW8EafB
         jfx3aMVaPq7zPPHIt84JlznJ9SuedQzpfhw9AXc2ji6b/RDg8/jivCWQO7cLz4s3z1HI
         E7Y1W4A8fgCs035XNPLoxV9lM9ClG+11FqlNH4A+r7WIXDDDPdqmipsp88Ek65g+T2NK
         1zffexZunfGprfoYyE01iBlEEzZ8scxO/PTwyiDGiQ2Emg4/byV7zrMGiRYdeGKAXwmi
         mrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764634; x=1757369434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUm3eao0nv7lQDT5rWWvwgkJGYkE0FYcno3r5As+ock=;
        b=riQ+hJsV8GHqJVzZF48YEaWn/4MzprJ3lAl/JX5U4uMs7WeFlC7Y3wYojFfMDyWE7A
         K/zCnZ9Fw60P8T3WOl6oSBXTDM+tyk0zjNGGoWl2iQwBfP7tOeFqyovoaJT/oKQqZzz3
         UUR8r3W3eI+u4WA8E1O73VCTbl00JMtBWo3Ol5MtGWIXRSXBzOqHF3WzmMk3+CbqGflJ
         IQS7/Tg8tmPsYOVaksadNHOK2wE6Exs8oe5AfNIt/x1r5KbXxL/wH5twh3rZVOTQYfjN
         VqvJJs27NAopjmhguDv5JKL0crH1oxB4PbR02fV+LFq8uk4c+54A9l6nlg6mFbT0l2F+
         u3yw==
X-Gm-Message-State: AOJu0Yz2CRpcDQ1ROc+jyIezzseLAsh79HcSa9hKcYTIaQOHnb8a1XHf
	2c+n7PJ7mAGGv1yPDmxiTT+GXpm650HROYYYSFnB3gv9FSx2wtV3KscBJoDE2Op4
X-Gm-Gg: ASbGncs9lGJ+pSUa9kLWkxVrDOrzraYXMF0lxZP1BfmfTbNaVBJKJoVTyxe/LmabJyl
	Rvob/a/BuECbt49f9H2bzF5nC5PAbpP7yMQuN/XYgm1rIBXPoYGOdqu+LtXCf5KWU7/jPC48h2C
	npOJMXs5jgWP1IgSgoFacqpvXru7n8l3IH6rRP2AuDb7Ujy1dbaByuhqpcX2y6cxG8yY1yuvt2w
	agArvQsi5oTNE7qaC8BZFbjVug5yjrXAl7HCfgiak7Eg4ukwfZzj80+gKo4xhrNtENjQU/UtEvZ
	aAcOMY7I3uXE0Ws2vOy6LQXNRPRqLU6xmf5W8yHqYPUNkaYITy4OZ6Wr68E/QEZhaCVGd75CH4J
	6cGv/D/2NsHqiWa8wAbA/G11cteJd1mRVoxyi6yLmfYptFDdTfL+kwoIcgchZKAT9b+WC2VvD
X-Google-Smtp-Source: AGHT+IH5UsKj5cGBhn+itOcgkLe6OXnp3JP492VPrs/+mbJzdvslmcWUzDDr1Sm7tPeTMH53B2gN1A==
X-Received: by 2002:a05:6512:2212:b0:55f:6649:45c5 with SMTP id 2adb3069b0e04-55f7089c32bmr2494605e87.11.1756764633457;
        Mon, 01 Sep 2025 15:10:33 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v6 10/13] xen/arm: Save/restore context on suspend/resume
Date: Tue,  2 Sep 2025 01:10:14 +0300
Message-ID: <bdb526ea0490729159aeecf154ee5d8294848a94.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The context of CPU general purpose and system control registers must be
saved on suspend and restored on resume. This is implemented in
prepare_resume_ctx and before the return from the hyp_resume function.
The prepare_resume_ctx must be invoked just before the PSCI system suspend
call is issued to the ATF. The prepare_resume_ctx must return a non-zero
value so that the calling 'if' statement evaluates to true, causing the
system suspend to be invoked. Upon resume, the context saved on suspend
will be restored, including the link register. Therefore, after
restoring the context, the control flow will return to the address
pointed to by the saved link register, which is the place from which
prepare_resume_ctx was called. To ensure that the calling 'if' statement
does not again evaluate to true and initiate system suspend, hyp_resume
must return a zero value after restoring the context.

Note that the order of saving register context into cpu_context structure
must match the order of restoring.

Support for ARM32 is not implemented. Instead, compilation fails with a
build-time error if suspend is enabled for ARM32.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v6:
- Rename hyp_suspend to prepare_resume_ctx
- moved invocation of prepare_resume_ctx to commit which
  implements system_suspend call

Changes in v4:
- Produce build-time error for ARM32 when CONFIG_SYSTEM_SUSPEND is enabled
- Use register_t instead of uint64_t in cpu_context structure
---
 xen/arch/arm/Makefile              |  1 +
 xen/arch/arm/arm64/head.S          | 90 +++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/suspend.h | 22 ++++++++
 xen/arch/arm/suspend.c             | 14 +++++
 4 files changed, 126 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/suspend.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index f833cdf207..3f6247adee 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,6 +51,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
+obj-$(CONFIG_SYSTEM_SUSPEND) += suspend.o
 obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 596e960152..c6594c0bdd 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -562,6 +562,52 @@ END(efi_xen_start)
 #endif /* CONFIG_ARM_EFI */
 
 #ifdef CONFIG_SYSTEM_SUSPEND
+/*
+ * int prepare_resume_ctx(struct cpu_context *ptr)
+ *
+ * x0 - pointer to the storage where callee's context will be saved
+ *
+ * CPU context saved here will be restored on resume in hyp_resume function.
+ * prepare_resume_ctx shall return a non-zero value. Upon restoring context
+ * hyp_resume shall return value zero instead. From C code that invokes
+ * prepare_resume_ctx, the return value is interpreted to determine whether
+ * the context is saved (prepare_resume_ctx) or restored (hyp_resume).
+ */
+FUNC(prepare_resume_ctx)
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
+        /* prepare_resume_ctx must return a non-zero value */
+        mov     x0, #1
+        ret
+END(prepare_resume_ctx)
 
 FUNC(hyp_resume)
         /* Initialize the UART if earlyprintk has been enabled. */
@@ -580,7 +626,49 @@ FUNC(hyp_resume)
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
+        /*
+         * Since context is restored return from this function will appear
+         * as return from prepare_resume_ctx. To distinguish a return from
+         * prepare_resume_ctx which is called upon finalizing the suspend,
+         * as opposed to return from this function which executes on resume,
+         * we need to return zero value here.
+         */
+        mov x0, #0
+        ret
 END(hyp_resume)
 
 #endif /* CONFIG_SYSTEM_SUSPEND */
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 7e04c6e915..29eed4ee7f 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -3,9 +3,31 @@
 #ifndef __ASM_ARM_SUSPEND_H__
 #define __ASM_ARM_SUSPEND_H__
 
+#include <asm/types.h>
+
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
 void hyp_resume(void);
+int prepare_resume_ctx(struct cpu_context *ptr);
 
 #endif /* CONFIG_SYSTEM_SUSPEND */
 
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
new file mode 100644
index 0000000000..5093f1bf3d
--- /dev/null
+++ b/xen/arch/arm/suspend.c
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/suspend.h>
+
+struct cpu_context cpu_context;
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.48.1


