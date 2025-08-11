Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F66FB216CB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077957.1439043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZS8-0008La-OM; Mon, 11 Aug 2025 20:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077957.1439043; Mon, 11 Aug 2025 20:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZS8-0008IZ-ED; Mon, 11 Aug 2025 20:49:08 +0000
Received: by outflank-mailman (input) for mailman id 1077957;
 Mon, 11 Aug 2025 20:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZS7-00063z-26
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:49:07 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e843ad0-76f4-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 22:49:05 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-61571192ba5so7526980a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:49:05 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:49:03 -0700 (PDT)
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
X-Inumbo-ID: 9e843ad0-76f4-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945344; x=1755550144; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9RalIq5/KBIQXS8hw4c9tUFcC4ZusIbNEKpuKw1Hyg=;
        b=BK+qC/4Ot6ECLlOVoJgrNb72cJbBdGLAtIxAvvQp6K0o//L0njqhG4Riabldy72E5K
         A11iM8vhpPCm9+j1znQEe6XFm31uEir0mbjO2NUtqdluyDrbrgqKF1VkcemmfS/JyQm5
         ZeDvpkE5KtQI51uSbdvIG6Bfmx9qJcQBmQhl5nJNezYqDGzXcuDgKckh3h4qQk5Zd2Ye
         YpaE6JdLUjro5VqHsmjr0rZpJr7J2WDJUfWr2LeTCTZeehpaP8pwI9Ke04SPyxMCH1JU
         FTu2VdfIkKxQm2i6InH+QxlMvWvbIJFFU8Gwme19t+nTk1/Oro4IhCJZpQoU7FyJew4W
         1Lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945344; x=1755550144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9RalIq5/KBIQXS8hw4c9tUFcC4ZusIbNEKpuKw1Hyg=;
        b=r+o+BSnqk6KK5pXeALDLt9w5JEhIrEWecI7cG7lRyPyYqA7vxRhFCXQ+viqRdQW9wC
         +ncgJqqWPFn7tdALLAXLCuNd8/dIHHxhlOXGLlnYSFpWNuNPLN1prF9g8HMX6v0LRr/c
         5UxUs33Q6PfVP7CQKae8/iudZDGf+/fQT/E2vt98CltHBPVYTCcPR9khwLwAEEut52cP
         xUgPdC3qDHF0gVNS9lPCwklsPdzYldTdNQ9UvaEpieLrQw2fBgzkVn6aC88vAm3Eg3Ml
         Nrmjlltgn2/UkKaVj3BFpzdkB6g+FFO6nZrLoxIMJTE8n1DLi9dnH4vxKmYI47EM1v3H
         LIfg==
X-Gm-Message-State: AOJu0YzFZe5QY8iipqbYFRP+dmnU13RFn1ud9xzZYMYrIk1AleRxQuJd
	7m/+mTGKjq/NtW15oN2Y32a0dA5c5L172sq7IP6fWLKkHRJ/rGevXyFhvXndzg==
X-Gm-Gg: ASbGnctD3BLm8jY3XiSae7jLv4S9mQc7SSELYNUlyFDpwO/gJzHBRjWUBYW/B7PYcWP
	kbdVKY/HZ16J3St0nZugPAdBif9NjrYa3o2pMbwyP7um8ng8Z1z5zHH2jfuLd5XfAKIaDSU1n1O
	IhlSBcLFyBg31rcTpdBJwaaHWLqX800RcI0kjo1dx9frbJeYlMtxKb/t2bKq45F+YNYnPlRn75X
	M2wZ8J7uwAUzIXtvAQxyhuQ1IEyez2ypkeCpe3R1OWVou7dUv3cI8FUxn8bI93aVuv2CyoQpbGy
	RQEb3/u8I+K4PXOWOFH9IMBajBIfBO0bVf1nhBAxrdnk59/7XhDXRohWy0Qod1t1Y8uuhme8XkN
	fOJOI5CecSIa7ziWLh+lb1cO1J/ETQgLswUADIm0ByfdZjn4FhXfAVM8ZvX5IAQCQ64g=
X-Google-Smtp-Source: AGHT+IEtFQqkM1ql8OqSxn4kTFyvYW+XZoshQH+piJx543uLlQd9H+DlAyUW1k/3V4dpjWvOZpVLzQ==
X-Received: by 2002:a17:907:2d2c:b0:ae3:8c9b:bd61 with SMTP id a640c23a62f3a-afa1dff772amr72501366b.12.1754945344280;
        Mon, 11 Aug 2025 13:49:04 -0700 (PDT)
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
Subject: [PATCH v5 10/12] xen/arm: Save/restore context on suspend/resume
Date: Mon, 11 Aug 2025 23:48:06 +0300
Message-ID: <5441d6712a4ca0e61fd066606b9a96414123aaad.1754943875.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
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
 xen/arch/arm/arm64/head.S          | 91 +++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/suspend.h | 20 +++++++
 xen/arch/arm/suspend.c             | 23 +++++++-
 3 files changed, 130 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 596e960152..ad8b48de3a 100644
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
@@ -580,7 +626,50 @@ FUNC(hyp_resume)
         b     enable_secondary_cpu_mm
 
 mmu_resumed:
-        b .
+        /*
+         * Now we can access the cpu_context, so restore the context here
+         * TODO: can we reuse __context_switch and saved_context struct here ?
+         */
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
index 08b6acaede..b5398e5ca6 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <asm/psci.h>
+#include <asm/suspend.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
 #include <xen/llc-coloring.h>
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


