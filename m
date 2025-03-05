Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41604A4FA21
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:32:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901993.1309969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl6O-0002JJ-ON; Wed, 05 Mar 2025 09:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901993.1309969; Wed, 05 Mar 2025 09:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl6O-0002H5-Lm; Wed, 05 Mar 2025 09:31:44 +0000
Received: by outflank-mailman (input) for mailman id 901993;
 Wed, 05 Mar 2025 09:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknX-0006ev-TC
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:15 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edb2acaf-f9a1-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:12:14 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-307bc125e2eso72811531fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:14 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:12:13 -0800 (PST)
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
X-Inumbo-ID: edb2acaf-f9a1-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165934; x=1741770734; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMUxuA0p+11DhmKCRgLrkhcrfUHcDebAliUl05KMaQU=;
        b=TXdyyusktPZRDqBC4ux8P8YgZEYrOa8xUDvmXwD1fLDpVh3OGUvqH0l+m+2nJqyAPa
         sZe2xFzWGIN1wk0wVx9H1qT2JlXcSWdEWdDBscgKJ6O4TnE4q08K9RGUkXugz89CmtCW
         3m5m5eMCGkzMa1crNULJi0yMpH23PtNqC5y4C05GFNEjhKF+c6LjbhWpcgRM+adSMJmh
         SnPQE0nCdiFgnR0rL0IV1BAOcrWr/l36sk8a90KeCIdouM5asa1GpPzTIaUjvD80yFhi
         jfXiRwdgCS3W/tjlj8Ebl0r0zokHOAciRu71FATKTd3MAoK14zijJ4ijj+Vy+ljJ+vys
         yTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165934; x=1741770734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMUxuA0p+11DhmKCRgLrkhcrfUHcDebAliUl05KMaQU=;
        b=MLv6OrHdtoRWOZ66iiFTkBbnLTbDZIbrgqTDk2oNgXOgvlYrMj0Q9+6RIXMS4gfvTT
         fvyLVt8FAiXho9gtSsh14gRjkknhGLUnrsRwVy4pnXTCtbtb3fRY8borwCLGgbcoZCZ0
         UopguvHnK885xnWoxv5713eLoGAEufY4hs2tWONOQHklYM2+4x9NK6f+XRK0QNSFbsOr
         5cZge+w1JprDxDExFLiS2wwVeYCbq2F8aNt7Ljkrs1XiI7lf1uyOPnozLHkhNu3GIxqc
         ODQvIJAu5cQ4RlJ3UcJdczQeAdH6G9BWeJypeJLMwdEqWkPacVg6EwYPC6qedHWkrmUx
         G6TA==
X-Gm-Message-State: AOJu0Yyz9MF+ZOsrMieFu0Uj0dkxHgWppgKGUcVyJVgHYqSfujT9xZ6Y
	FKIRa8HjYTVII4Ecv960uaPLsCrRkfJ4KZD5H6cn3DpVCcOEYgOHzBG73UYF
X-Gm-Gg: ASbGncu8BdkvySvlz5rB2U2+nMVTFEuQTTTZldBlDlFtpjb/zXmP2uppURTAfAND9tZ
	v4d4ybaHOfp+zSeei+ZBNoKn/5nu8ADVMpQIcrL2/31H2UujDvgf2qZVReG+5uTGUnkDwDmRye+
	yqHmBXoFAiYLKlDMhabjXsp/zrmLWJuS5SCjYxZREphh/eCdnap9V7+AuhYj6wXwOHQmj/PfTMG
	8cs133UFDX/ahRk6W2j5LOx0zrwbCfSEfCHtPD0MVxS9T/a4mMTX4NrvlyyDGjf2FmSF0Whfhf5
	+rp8403SmzqGTc8cutnsldO5anYppH6V06iR4y4p/twR02zJHw==
X-Google-Smtp-Source: AGHT+IHb/F3dGwdiDc0xz14jw9QlV1aW1ohSHUl1Ftqtj20uvoGdOJV7UQWSLRrX+Ioc3/KL3aA6Sg==
X-Received: by 2002:a05:6512:2308:b0:545:df9:5bb5 with SMTP id 2adb3069b0e04-5497d37e3c9mr829458e87.45.1741165933584;
        Wed, 05 Mar 2025 01:12:13 -0800 (PST)
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
Subject: [PATCH 15/16] xen/arm: Save/restore context on suspend/resume
Date: Wed,  5 Mar 2025 11:11:23 +0200
Message-ID: <8a3c38a9db28cfe6303ef150c269232f611c6371.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
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
Since the suspend/resume is supported only for arm64, we define
a null cpu_context structure so arm32 could compile.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/arch/arm/arm64/head.S          | 88 +++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/suspend.h | 22 ++++++++
 xen/arch/arm/suspend.c             | 22 +++++++-
 3 files changed, 128 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index fab2812e54..c10eec751b 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -562,6 +562,52 @@ END(efi_xen_start)
 #endif /* CONFIG_ARM_EFI */
 
 #ifdef CONFIG_SYSTEM_SUSPEND
+/*
+ * int32_t hyp_suspend(struct cpu_context *ptr)
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
         msr   DAIFSet, 0xf           /* Disable all interrupts */
@@ -587,7 +633,47 @@ FUNC(hyp_resume)
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
index 0d2f0da0ad..1d98acacc6 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -3,8 +3,30 @@
 #ifndef __ASM_ARM_SUSPEND_H__
 #define __ASM_ARM_SUSPEND_H__
 
+#ifdef CONFIG_ARM_64
+struct cpu_context {
+    uint64_t callee_regs[12];
+    uint64_t sp;
+    uint64_t vbar_el2;
+    uint64_t vtcr_el2;
+    uint64_t vttbr_el2;
+    uint64_t tpidr_el2;
+    uint64_t mdcr_el2;
+    uint64_t hstr_el2;
+    uint64_t cptr_el2;
+    uint64_t hcr_el2;
+} __aligned(16);
+#else
+struct cpu_context {
+    uint8_t pad;
+};
+#endif
+
+extern struct cpu_context cpu_context;
+
 int32_t domain_suspend(register_t epoint, register_t cid);
 void hyp_resume(void);
+int32_t hyp_suspend(struct cpu_context *ptr);
 
 #endif
 
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index ac88faee2e..72eeca3fdf 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -11,6 +11,8 @@
 #include <asm/platform.h>
 #include <public/sched.h>
 
+struct cpu_context cpu_context;
+
 /* Reset values of VCPU architecture specific registers */
 static void vcpu_arch_reset(struct vcpu *v)
 {
@@ -170,9 +172,23 @@ static long system_suspend(void *data)
      */
     update_boot_mapping(true);
 
-    status = call_psci_system_suspend();
-    if ( status )
-        dprintk(XENLOG_ERR, "PSCI system suspend failed, err=%d\n", status);
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
+            dprintk(XENLOG_ERR, "PSCI system suspend failed, err=%d\n", status);
+    }
 
     system_state = SYS_STATE_resume;
     update_boot_mapping(false);
-- 
2.43.0


