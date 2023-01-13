Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E38668B70
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476540.738851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCig-0005Jx-Op; Fri, 13 Jan 2023 05:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476540.738851; Fri, 13 Jan 2023 05:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCig-0005ET-Fs; Fri, 13 Jan 2023 05:35:14 +0000
Received: by outflank-mailman (input) for mailman id 476540;
 Fri, 13 Jan 2023 05:35:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCf8-0005sP-Hv
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 89986dc7-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:31:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DDCEFEC;
 Thu, 12 Jan 2023 21:32:14 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4FAFA3F587;
 Thu, 12 Jan 2023 21:31:29 -0800 (PST)
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
X-Inumbo-ID: 89986dc7-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 36/40] xen/mpu: Use secure hypervisor timer for AArch64v8R
Date: Fri, 13 Jan 2023 13:29:09 +0800
Message-Id: <20230113052914.3845596-37-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As AArch64v8R only has one secure state, we have to use secure EL2 hypervisor
timer for Xen in secure EL2.

In this patch, we introduce a Kconfig option ARM_SECURE_STATE.
With this new Kconfig option, we can re-define the timer's
system register name in different secure state, but keep the
timer code flow unchanged.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Kconfig                     |  7 +++++++
 xen/arch/arm/include/asm/arm64/sysregs.h | 21 ++++++++++++++++++++-
 xen/arch/arm/include/asm/cpregs.h        |  4 ++--
 xen/arch/arm/time.c                      | 14 +++++++-------
 4 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 91491341c4..ee942a33bc 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -47,6 +47,13 @@ config ARM_EFI
 	  be booted as an EFI application. This is only useful for
 	  Xen that may run on systems that have UEFI firmware.
 
+config ARM_SECURE_STATE
+	bool "Xen will run in Arm Secure State"
+	depends on ARM_V8R
+	help
+	  In this state, a Processing Element (PE) can access the secure
+	  physical address space, and the secure copy of banked registers.
+
 config GICV3
 	bool "GICv3 driver"
 	depends on !NEW_VGIC
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index c46daf6f69..9546e8e3d0 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -458,7 +458,6 @@
 #define ZCR_ELx_LEN_SIZE             9
 #define ZCR_ELx_LEN_MASK             0x1ff
 
-/* System registers for Armv8-R AArch64 */
 #ifdef CONFIG_HAS_MPU
 
 /* EL2 MPU Protection Region Base Address Register encode */
@@ -510,6 +509,26 @@
 
 #endif
 
+#ifdef CONFIG_ARM_SECURE_STATE
+/*
+ * The Armv8-R AArch64 architecture always executes code in Secure
+ * state with EL2 as the highest Exception.
+ *
+ * Hypervisor timer registers for Secure EL2.
+ */
+#define CNTHPS_TVAL_EL2  S3_4_C14_C5_0
+#define CNTHPS_CTL_EL2   S3_4_C14_C5_1
+#define CNTHPS_CVAL_EL2  S3_4_C14_C5_2
+#define CNTHPx_TVAL_EL2  CNTHPS_TVAL_EL2
+#define CNTHPx_CTL_EL2   CNTHPS_CTL_EL2
+#define CNTHPx_CVAL_EL2  CNTHPS_CVAL_EL2
+#else
+/* Hypervisor timer registers for Non-Secure EL2. */
+#define CNTHPx_TVAL_EL2  CNTHP_TVAL_EL2
+#define CNTHPx_CTL_EL2   CNTHP_CTL_EL2
+#define CNTHPx_CVAL_EL2  CNTHP_CVAL_EL2
+#endif /* CONFIG_ARM_SECURE_STATE */
+
 /* Access to system registers */
 
 #define WRITE_SYSREG64(v, name) do {                    \
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index 6b083de204..a704677fbc 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -374,8 +374,8 @@
 #define CLIDR_EL1               CLIDR
 #define CNTFRQ_EL0              CNTFRQ
 #define CNTHCTL_EL2             CNTHCTL
-#define CNTHP_CTL_EL2           CNTHP_CTL
-#define CNTHP_CVAL_EL2          CNTHP_CVAL
+#define CNTHPx_CTL_EL2          CNTHP_CTL
+#define CNTHPx_CVAL_EL2         CNTHP_CVAL
 #define CNTKCTL_EL1             CNTKCTL
 #define CNTPCT_EL0              CNTPCT
 #define CNTP_CTL_EL0            CNTP_CTL
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 433d7be909..3bba733b83 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -196,13 +196,13 @@ int reprogram_timer(s_time_t timeout)
 
     if ( timeout == 0 )
     {
-        WRITE_SYSREG(0, CNTHP_CTL_EL2);
+        WRITE_SYSREG(0, CNTHPx_CTL_EL2);
         return 1;
     }
 
     deadline = ns_to_ticks(timeout) + boot_count;
-    WRITE_SYSREG64(deadline, CNTHP_CVAL_EL2);
-    WRITE_SYSREG(CNTx_CTL_ENABLE, CNTHP_CTL_EL2);
+    WRITE_SYSREG64(deadline, CNTHPx_CVAL_EL2);
+    WRITE_SYSREG(CNTx_CTL_ENABLE, CNTHPx_CTL_EL2);
     isb();
 
     /* No need to check for timers in the past; the Generic Timer fires
@@ -213,7 +213,7 @@ int reprogram_timer(s_time_t timeout)
 /* Handle the firing timer */
 static void htimer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
 {
-    if ( unlikely(!(READ_SYSREG(CNTHP_CTL_EL2) & CNTx_CTL_PENDING)) )
+    if ( unlikely(!(READ_SYSREG(CNTHPx_CTL_EL2) & CNTx_CTL_PENDING)) )
         return;
 
     perfc_incr(hyp_timer_irqs);
@@ -222,7 +222,7 @@ static void htimer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
     raise_softirq(TIMER_SOFTIRQ);
 
     /* Disable the timer to avoid more interrupts */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);
+    WRITE_SYSREG(0, CNTHPx_CTL_EL2);
 }
 
 static void vtimer_interrupt(int irq, void *dev_id, struct cpu_user_regs *regs)
@@ -281,7 +281,7 @@ void init_timer_interrupt(void)
     /* Do not let the VMs program the physical timer, only read the physical counter */
     WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
     WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
+    WRITE_SYSREG(0, CNTHPx_CTL_EL2);   /* Hypervisor's timer disabled */
     isb();
 
     request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
@@ -301,7 +301,7 @@ void init_timer_interrupt(void)
 static void deinit_timer_interrupt(void)
 {
     WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Disable physical timer */
-    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
+    WRITE_SYSREG(0, CNTHPx_CTL_EL2);   /* Disable hypervisor's timer */
     isb();
 
     release_irq(timer_irq[TIMER_HYP_PPI], NULL);
-- 
2.25.1


