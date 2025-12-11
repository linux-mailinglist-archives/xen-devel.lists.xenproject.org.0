Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D055ECB6F1D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184556.1507055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfv-0005oZ-Nq; Thu, 11 Dec 2025 18:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184556.1507055; Thu, 11 Dec 2025 18:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlfv-0005gO-Fw; Thu, 11 Dec 2025 18:46:03 +0000
Received: by outflank-mailman (input) for mailman id 1184556;
 Thu, 11 Dec 2025 18:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfu-0003I9-Eg
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:46:02 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a334c430-d6c1-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 19:46:00 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-64198771a9bso828802a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:46:00 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:45:58 -0800 (PST)
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
X-Inumbo-ID: a334c430-d6c1-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478760; x=1766083560; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OaZfuWRbnwPcnW+s48rbWKO1grkPvQJtBoI9rAf5Hcg=;
        b=C52yXMweSmOi7jHTFVsaG73CghSzs8FSjnivaGCnP3l+7OSj5weXg0khpS8ukU2zfZ
         qW632MP+HhJ2r6lqcq4E57g3TwtjNYVdzcg1lj8PK2o/wFH0hgVU7mh/WXpaew93YKiY
         Ie2ZbYcWO43g62MlkQuyHotyzvs0dBk0kcgG87d8iz9WIZFS3PCnnsohOtFk0ffjPTHe
         F5gh/7xTPntknn5A/9J3u4fQ2sL5GxZKPW53Nbfog7IlH24QyJcrf+rcF3nwo3aXAd3g
         vO3WSzMJe3QduB51qR/ceq6SWY/bSmUO790eqH/+g3TaeVtQyrSnn6j7YJvpGbSgpY4f
         Xg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478760; x=1766083560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OaZfuWRbnwPcnW+s48rbWKO1grkPvQJtBoI9rAf5Hcg=;
        b=d4XnlUPbEyPvZY9JUxUt+hJXd6pa+MR5zEOaoaRx9ugYn+M3vbuD3pO8wRUMMm4E59
         EXAEXaT/sG9EyzdAdD6MNMaKp1+HDcqrTAP2WMpXkyqpIP8q3kMFKnVYxBb9zQhK4FVA
         z5oI+6nioDiYXW+0JbTelbNpMgmadh3ok57JcFHB9Huj1MnfdKShqKNTZ3suNXggP4eG
         qjJb3d0ISK+lQbT1MJsIfAfBzXQ4dZ77L4IYfN7LPu00fgWRaadA9upFyeZ4VVFCrghy
         bOQl07/5/rhEbDWo70J57YI057vcT3SFSRCZlbXqXg7tTS3vX2dLo1CC3eQPqHLpgDE3
         X6pg==
X-Gm-Message-State: AOJu0YyoMWHl512sC4tv3c54pi+rSm7W6LtpdFA+/0f6lLXsHUGW+i5c
	+fjiYw+hSq2q8TvCOqrXN01jwYBl7/dV+sOHGOyBg9nDOKMBv1LrAHRJpCTaQZJu
X-Gm-Gg: AY/fxX5VyGaLQ3ufu/gDihPZIqZJaYr4pB2sA7XR1EPKeYu0GYKMe7j+R665L4JDaVo
	IZUCjo9d4T/ezqJjwCegPgfXvxPpqk8v7YN/+5aHqPpN7IL3tv4VLwWcOUwGkHa14lQ4np9nJ0s
	qsmx/r9L/AziSAIp7KagoUW+/havVOUG5uZSkhQ/bGWe3Ac9wif0fvJEGGKjP74qWpvMJaZzszR
	K5SCC5R0iglHT9+QQ7zWK8xq9qDjyaunWr4N1ekUtJy8rkyC3FQeyh3il0xDucngCkzVRb8skhd
	vqkhK2XWT+USQCToG54R+yK41qD5a1PKBWYUplkY6LawoiGpdo+XNzpsCXVjs9T+6ciecYVYqkg
	FMNMTiLIxOgwiMzRBDEfh9l5vnIxGykyq80Yip0WazmpQA8M2vG4SpNOGTEHAfWGB95K9nHO0Dw
	qGc+m3KveXc0zRqPN6/lzwa8OPK2dCr094lqRsg+3h
X-Google-Smtp-Source: AGHT+IFhllThVrkjPTfuO84mpaywMKGq1Skw0Lhon1pOtwVx4+wXl4IJijzRncp8fHZyY+VLi8RDGQ==
X-Received: by 2002:a17:907:940e:b0:b71:29f7:47dd with SMTP id a640c23a62f3a-b7ce8476094mr829779766b.46.1765478759399;
        Thu, 11 Dec 2025 10:45:59 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH v7 10/12] xen/arm: Save/restore context on suspend/resume
Date: Thu, 11 Dec 2025 20:43:34 +0200
Message-ID: <0dd3c42e1801674e19d2b3b3ca834b7bab62ca3f.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765472890.git.mykola_kvach@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
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
Changes in v7:
- no changes
---
 xen/arch/arm/Makefile              |  1 +
 xen/arch/arm/arm64/head.S          | 90 +++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/suspend.h | 26 +++++++++
 xen/arch/arm/suspend.c             | 14 +++++
 4 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/suspend.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7494a0f926..4a549a1ac0 100644
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
index 313d03ea59..d3a88ea979 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -3,6 +3,8 @@
 #ifndef ARM_SUSPEND_H
 #define ARM_SUSPEND_H
 
+#include <asm/types.h>
+
 struct domain;
 struct vcpu;
 
@@ -14,6 +16,30 @@ struct resume_info {
 
 int arch_domain_resume(struct domain *d);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
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
+int prepare_resume_ctx(struct cpu_context *ptr);
+void hyp_resume(void);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 #endif /* ARM_SUSPEND_H */
 
 /*
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
new file mode 100644
index 0000000000..e38566b0b7
--- /dev/null
+++ b/xen/arch/arm/suspend.c
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/suspend.h>
+
+struct cpu_context cpu_context = {};
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
2.43.0


