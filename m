Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A388CB6F2F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 19:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184630.1507077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlhR-0001PP-L7; Thu, 11 Dec 2025 18:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184630.1507077; Thu, 11 Dec 2025 18:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTlhR-0001NV-Gp; Thu, 11 Dec 2025 18:47:37 +0000
Received: by outflank-mailman (input) for mailman id 1184630;
 Thu, 11 Dec 2025 18:47:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWGN=6R=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vTlfy-0003I8-9B
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 18:46:06 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4d50f04-d6c1-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 19:46:03 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-64979bee42aso645479a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 10:46:03 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d0b0dsm345870466b.67.2025.12.11.10.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 10:46:01 -0800 (PST)
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
X-Inumbo-ID: a4d50f04-d6c1-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765478762; x=1766083562; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHRMDHeaPCNuYKtmY3W4kszvrqWpbqarndet93/8qB0=;
        b=EwzoleVNbhAM9jSH607I+GHKlq3z7YtVxbQJVYnqYZTENvDTPpWGxtLYlfDSu73/6h
         zJ8POyKGDzgT1BOLPb5/d64gMEIcQ3/n2z/QCcFjak5vlp7Qu6ozMMBdf/3NuvqG7BwV
         dcNjzMzVE2orQAKq3UTLwRXApDYPD+8Mf64SNpxGRTsGLg16iibZ/Uy5VnGEYBHasUBs
         0p8K/U2Ig4nhrKT5Xv2Fvo0l+YExKNz1/jR324hfMIvjem6i6v84ItLCNubgyFpRvZiu
         bl9ZPy8C+DZYDkx8dZL/w2ISKjRgW68yRKNPnPbRC5aOc4Gj0TEPAdHgQBAz4KXdqNGv
         KLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765478762; x=1766083562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RHRMDHeaPCNuYKtmY3W4kszvrqWpbqarndet93/8qB0=;
        b=oZtLcDvK9jsXHSB6qOTNw2/GiGrRhpSXNvjkhUhn0SB4akdSyrIoEF1FSzDW8y3JHg
         vhvIQMwTjVuNvQXrEBVk3n0AmHEkm0RIU2sAbnSGpd290QeycxQ6EX0pTY6uFggws96M
         uK/Ql+DEqdBcmdVi87Yry5cbyF1gIK9/kpAEl4r4hzj/15ebBIbUyd/NHmOcyQkvRPqD
         V4oHWILfNdJ6ESCntBlPx765SRiyB39JI6cwFgRvoMo1ckLUTnahX+oy3D3pNrH1RcTk
         Z4TPvKNb4GHSPq310pbv/jvt+23Go+8AQd6K/+NxXNnhiX/soA580IJZbCiNSML2TS2o
         xZlA==
X-Gm-Message-State: AOJu0YwhwKaAp5/QMHBLoNINiBt73U0IuvrZlflftbc8dku6iS2A8Iuf
	Qu4d8qLwXztzQgAkl6Bf5ErLkPGvbvhL+AFb+0MRAUyoplc8JyIXW68aj9mDLuMe
X-Gm-Gg: AY/fxX6an+i/JMPTbjGGfnvsiqkkDrk4suiXUXY2bmaNnjdn6VV6bUwyMKLb8G+dFXE
	w4W02rpjOZ+3/LRqPR+qgIJRXGljybb9MFuo56QIHO+fvy1wwdFnOqqKTDS3KAEcfD3Wjp66crY
	XHep2TDS5lWVeUDgqWMf2gJ+ARq2PJY1qOtd5apxPRb1kW3P4tQyZS1qZhemnZcEKzkQItqSKbV
	UEmAC54BxMXPGq5/oha1Hhrz0Iet2lrywRm8zHLYvR+uqW77s+hINgeYGiziRcnvemHEi4MgKql
	VNh3Cg6bOVF3iq+d7tPcK9eGF7bGfcrnV0YOR2OTEeJyR9mBj9R2Lp/GIKT0MUnq3VrICbCyS34
	03Xfhj+fTF1i6F2LZ+mRWH1DHTfA785HzXBhK+4JlkYCPdLBW18+YZwe+ko+nK3gmIyNgnGa8Rt
	m6fhqJPo4upN/LQoAQG8YIFY/mvBO5igAFP3tITmR3
X-Google-Smtp-Source: AGHT+IGVitvuV8prBdOMpYKRyd/3qrDnNbonRVxqr9ZG0MV5VKtiI2D+Iln3xxDRWYgevVysh/gGSg==
X-Received: by 2002:a17:907:608c:b0:b76:f090:777b with SMTP id a640c23a62f3a-b7ce82dd99dmr760281066b.22.1765478762150;
        Thu, 11 Dec 2025 10:46:02 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Rahul Singh <rahul.singh@arm.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH v7 12/12] xen/arm: Add support for system suspend triggered by control domain
Date: Thu, 11 Dec 2025 20:43:36 +0200
Message-ID: <66fffded45f39599c62a1e4dad83c34f9de51d7d.1765472890.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765472890.git.mykola_kvach@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Trigger Xen suspend when the control domain initiates suspend via
SHUTDOWN_suspend. Redirect system suspend to CPU#0 to ensure the
suspend logic runs on the boot CPU, as required.

Introduce full suspend/resume infrastructure gated by CONFIG_SYSTEM_SUSPEND,
including logic to:
 - disable and enable non-boot physical CPUs
 - freeze and thaw domains
 - suspend and resume the GIC, timer, iommu and console
 - maintain system state before and after suspend

On boot, init_ttbr is normally initialized during secondary CPU hotplug.
On uniprocessor systems, this would leave init_ttbr uninitialized,
causing resume to fail. To address this, the boot CPU now sets init_ttbr
during suspend.

Select HAS_SYSTEM_SUSPEND for ARM_64.

Introduce CONFIG_HWDOM_SHUTDOWN_ON_SUSPEND (default y, disabled only on ARM_64
with SYSTEM_SUSPEND) so we skip hwdom_shutdown() for SHUTDOWN_suspend when the
hardware domain survives suspend. Non-ARM behaviour is unchanged, and the
ARM/system-suspend case no longer needs arch-specific checks in the code.

Note: the code is guarded by CONFIG_SYSTEM_SUSPEND, which is currently only
selected when UNSUPPORTED is set, and thus the functionality is neither enabled
by default nor even built.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V7:
- Control domain is responsible for host suspend
- Add an empty inline host_system_suspend() function when SYSTEM_SUSPEND
  config is disabled
- Use IS_ENABLED() for config checking instead of #ifdef
- Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simplify
  control flow.
- Factor hardware domain shutdown condition into a helper
  (need_hwdom_shutdown()) to avoid preprocessor directives inside the function.
- Squash with iommu suspend/resume commit
---
 xen/arch/arm/Kconfig               |   1 +
 xen/arch/arm/include/asm/mm.h      |   2 +
 xen/arch/arm/include/asm/suspend.h |   7 +-
 xen/arch/arm/mmu/smpboot.c         |   2 +-
 xen/arch/arm/suspend.c             | 139 +++++++++++++++++++++++++++++
 xen/arch/arm/vpsci.c               |  12 ++-
 xen/common/Kconfig                 |   5 ++
 xen/common/domain.c                |   7 +-
 xen/drivers/passthrough/arm/smmu.c |  10 +++
 9 files changed, 180 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index cf6af68299..86fa0b762a 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -8,6 +8,7 @@ config ARM_64
 	depends on !ARM_32
 	select 64BIT
 	select HAS_FAST_MULTIPLY
+	select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
 
 config ARM
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index ec2d2dc537..e4e795fa1f 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -364,6 +364,8 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
     } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
 }
 
+void set_init_ttbr(lpae_t *root);
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index d3a88ea979..2fb7cd8d56 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -38,7 +38,12 @@ extern struct cpu_context cpu_context;
 
 int prepare_resume_ctx(struct cpu_context *ptr);
 void hyp_resume(void);
-#endif /* CONFIG_SYSTEM_SUSPEND */
+void host_system_suspend(struct domain *d);
+
+#else /* !CONFIG_SYSTEM_SUSPEND */
+
+static inline void host_system_suspend(struct domain *d) { (void)d; }
+#endif
 
 #endif /* ARM_SUSPEND_H */
 
diff --git a/xen/arch/arm/mmu/smpboot.c b/xen/arch/arm/mmu/smpboot.c
index 37e91d72b7..ff508ecf40 100644
--- a/xen/arch/arm/mmu/smpboot.c
+++ b/xen/arch/arm/mmu/smpboot.c
@@ -72,7 +72,7 @@ static void clear_boot_pagetables(void)
     clear_table(boot_third);
 }
 
-static void set_init_ttbr(lpae_t *root)
+void set_init_ttbr(lpae_t *root)
 {
     /*
      * init_ttbr is part of the identity mapping which is read-only. So
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index e38566b0b7..c34b578e18 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,9 +1,148 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/psci.h>
 #include <asm/suspend.h>
 
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/iommu.h>
+#include <xen/llc-coloring.h>
+#include <xen/sched.h>
+#include <xen/tasklet.h>
+
 struct cpu_context cpu_context = {};
 
+/* Xen suspend. data identifies the domain that initiated suspend. */
+static void system_suspend(void *data)
+{
+    int status;
+    unsigned long flags;
+    struct domain *d = (struct domain *)data;
+
+    BUG_ON(system_state != SYS_STATE_active);
+
+    system_state = SYS_STATE_suspend;
+
+    printk("Xen suspending...\n");
+
+    freeze_domains();
+    scheduler_disable();
+
+    /*
+     * Non-boot CPUs have to be disabled on suspend and enabled on resume
+     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to PSCI
+     * CPU_OFF to be called by each non-boot CPU. Depending on the underlying
+     * platform capabilities, this may lead to the physical powering down of
+     * CPUs.
+     */
+    status = disable_nonboot_cpus();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_nonboot_cpus;
+    }
+
+    time_suspend();
+
+    status = iommu_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_time;
+    }
+
+    console_start_sync();
+    status = console_suspend();
+    if ( status )
+    {
+        dprintk(XENLOG_ERR, "Failed to suspend the console, err=%d\n", status);
+        system_state = SYS_STATE_resume;
+        goto resume_end_sync;
+    }
+
+    local_irq_save(flags);
+    status = gic_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_irqs;
+    }
+
+    set_init_ttbr(xen_pgtable);
+
+    /*
+     * Enable identity mapping before entering suspend to simplify
+     * the resume path
+     */
+    update_boot_mapping(true);
+
+    if ( prepare_resume_ctx(&cpu_context) )
+    {
+        status = call_psci_system_suspend();
+        /*
+         * If suspend is finalized properly by above system suspend PSCI call,
+         * the code below in this 'if' branch will never execute. Execution
+         * will continue from hyp_resume which is the hypervisor's resume point.
+         * In hyp_resume CPU context will be restored and since link-register is
+         * restored as well, it will appear to return from prepare_resume_ctx.
+         * The difference in returning from prepare_resume_ctx on system suspend
+         * versus resume is in function's return value: on suspend, the return
+         * value is a non-zero value, on resume it is zero. That is why the
+         * control flow will not re-enter this 'if' branch on resume.
+         */
+        if ( status )
+            dprintk(XENLOG_WARNING, "PSCI system suspend failed, err=%d\n",
+                    status);
+    }
+
+    system_state = SYS_STATE_resume;
+    update_boot_mapping(false);
+
+    gic_resume();
+
+ resume_irqs:
+    local_irq_restore(flags);
+
+    console_resume();
+ resume_end_sync:
+    console_end_sync();
+
+    iommu_resume();
+
+ resume_time:
+    time_resume();
+
+ resume_nonboot_cpus:
+    /*
+     * The rcu_barrier() has to be added to ensure that the per cpu area is
+     * freed before a non-boot CPU tries to initialize it (_free_percpu_area()
+     * has to be called before the init_percpu_area()). This scenario occurs
+     * when non-boot CPUs are hot-unplugged on suspend and hotplugged on resume.
+     */
+    rcu_barrier();
+    enable_nonboot_cpus();
+    scheduler_enable();
+    thaw_domains();
+
+    system_state = SYS_STATE_active;
+
+    printk("Resume (status %d)\n", status);
+
+    domain_resume(d);
+}
+
+static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL);
+
+void host_system_suspend(struct domain *d)
+{
+    system_suspend_tasklet.data = (void *)d;
+    /*
+     * The suspend procedure has to be finalized by the pCPU#0 (non-boot pCPUs
+     * will be disabled during the suspend).
+     */
+    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index c4d616ec68..891d9f2cb9 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -4,6 +4,7 @@
 #include <xen/types.h>
 
 #include <asm/current.h>
+#include <asm/suspend.h>
 #include <asm/vgic.h>
 #include <asm/vpsci.h>
 #include <asm/event.h>
@@ -210,6 +211,11 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
 
+static bool can_trigger_host_suspend(struct domain *d)
+{
+    return is_control_domain(d);
+}
+
 static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
 {
     int32_t rc;
@@ -221,8 +227,7 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     if ( is_64bit_domain(d) && is_thumb )
         return PSCI_INVALID_ADDRESS;
 
-    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
-    if ( is_hardware_domain(d) )
+    if ( !IS_ENABLED(CONFIG_SYSTEM_SUSPEND) && can_trigger_host_suspend(d) )
         return PSCI_NOT_SUPPORTED;
 
     /* Ensure that all CPUs other than the calling one are offline */
@@ -249,6 +254,9 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
             "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
             epoint, cid);
 
+    if ( can_trigger_host_suspend(d) )
+        host_system_suspend(d);
+
     return rc;
 }
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 401d5046f6..31f54def0b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -137,6 +137,11 @@ config HAS_EX_TABLE
 config HAS_FAST_MULTIPLY
 	bool
 
+config HAS_HWDOM_SHUTDOWN_ON_SUSPEND
+	bool
+	default y
+	depends on !ARM_64 || !SYSTEM_SUSPEND
+
 config HAS_IOPORTS
 	bool
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8f895108fd..b8a8c68428 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1324,6 +1324,11 @@ void __domain_crash(struct domain *d)
     domain_shutdown(d, SHUTDOWN_crash);
 }
 
+static inline bool need_hwdom_shutdown(uint8_t reason)
+{
+    return IS_ENABLED(CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND) ||
+           reason != SHUTDOWN_suspend;
+}
 
 int domain_shutdown(struct domain *d, u8 reason)
 {
@@ -1340,7 +1345,7 @@ int domain_shutdown(struct domain *d, u8 reason)
         d->shutdown_code = reason;
     reason = d->shutdown_code;
 
-    if ( is_hardware_domain(d) )
+    if ( is_hardware_domain(d) && need_hwdom_shutdown(reason) )
         hwdom_shutdown(reason);
 
     if ( d->is_shutting_down )
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 22d306d0cb..45f29ef8ec 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2947,6 +2947,13 @@ static void arm_smmu_iommu_domain_teardown(struct domain *d)
 	xfree(xen_domain);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+static int arm_smmu_suspend(void)
+{
+	return -ENOSYS;
+}
+#endif
+
 static const struct iommu_ops arm_smmu_iommu_ops = {
     .page_sizes = PAGE_SIZE_4K,
     .init = arm_smmu_iommu_domain_init,
@@ -2960,6 +2967,9 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .map_page = arm_iommu_map_page,
     .unmap_page = arm_iommu_unmap_page,
     .dt_xlate = arm_smmu_dt_xlate_generic,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend = arm_smmu_suspend,
+#endif
 };
 
 static struct arm_smmu_device *find_smmu(const struct device *dev)
-- 
2.43.0


