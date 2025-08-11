Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60405B216C8
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 22:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077952.1439018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZS3-0007T2-8h; Mon, 11 Aug 2025 20:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077952.1439018; Mon, 11 Aug 2025 20:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulZS2-0007Mq-Vh; Mon, 11 Aug 2025 20:49:02 +0000
Received: by outflank-mailman (input) for mailman id 1077952;
 Mon, 11 Aug 2025 20:49:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=21ui=2X=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ulZS1-0005co-IM
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 20:49:01 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b8932a9-76f4-11f0-a327-13f23c93f187;
 Mon, 11 Aug 2025 22:49:00 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af96524c5a9so630348466b.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 13:49:00 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.Dlink ([77.52.179.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0a3bd2sm2065710466b.54.2025.08.11.13.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 13:48:58 -0700 (PDT)
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
X-Inumbo-ID: 9b8932a9-76f4-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754945339; x=1755550139; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGMaJnHIHucvLaFfdzAI/fXgS3JEgG5T2t9Vqll28+g=;
        b=Fk1uKYmhbp6Dt1kvzLlTWihbBXBs50l41FisAEc9+Cm1Q5om4TbfD0BSrea67Rqa5G
         urRWtINuccn7gEDz9Nu4X/y7Mtxhw2ougyGD5q5NFSOoW4UwGABhNPjm1cnTerGdoA6s
         uD0Ljdv0cG9kkm/GOi43WjrLizJEtfIhM7GP+S5QFqQSRvGjoSQWQOGGp9q9EgoCu9gt
         OEdwYLE3mp7BB8K+ZoyJCLsQoao/FaCpdkBvhfoeEvLbPfn1sjxqpJKjtDh8Nu14Xq+K
         lVevb2FjgVty0nqOcyiZSU2tF2vgJHGE3YrXMrVuImqhRViViOYRRR4QfkhtIj80hTF9
         h8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754945339; x=1755550139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGMaJnHIHucvLaFfdzAI/fXgS3JEgG5T2t9Vqll28+g=;
        b=Sw34vgm4HVd1t5sxqPVcefWXICzECjgGcfKYtRa2stE8ztCBDqd56639flBXxCvF7R
         Dmf81AILBLMsM2m3byMWAMGtWOl/JuHxc23m6/IsiiGE6FOAi4+KDtPGZWM30ShCnWCC
         alYwz0o3lpL45gca7w8JSv6oG/2YX3NFxpcTUu+B8BKGyRg+eWebSe71rTBIxdI3ojs6
         t6a3hWnnWeCxoVG8mrbpXAWo2vAOIPNaPJVIjSDFOPWRO+SosbZ/7WhNEiR6ndExflWq
         tFWyyPAgsh6Z7y32Zdl8/m9zruEKA2x6jLd72VuzjHiOqjl//3vvD4ELLfMWw+ovEmot
         GAdw==
X-Gm-Message-State: AOJu0Yw0tB9FqFVuNXlkK0kYEwsCBE0pLkn7T6ZfdZRXQ0AXUl5mtprk
	2ZCS2nlcitHO870TyjR9Ja93JIS0PrmP6YWO796bwCaqkSLuHEoFLbD9bD2hYA==
X-Gm-Gg: ASbGncsmwXEOHFC6swQ9Np27wmPEHcRuQiFdDLeyYATDGLfdJ4QYBpjfYSjjIXEZqgf
	MOOjWrbhfk4elerU9Zv/jy1cNP9zrPXcnCsWa8/b1qRaxaUesayPW5GsYwELV/+zIGAWdwdnkoL
	8pzQ3lTOT7tgxve4eNz3eQ/5dgB/QaBqrC+ckfjw+kTWfvBtOceqIFM9D2EoknPN6lY3Ngn4GoF
	+JEzJVqDq22HZbTpYto+oiduwV+MtEtpvff8orQepieibCW8KiCh/gRJuEX+YEUDEURvGyalPFi
	djcXVVhMB1jSZs7mLsVa/6kzC+M5zjut+/aQHA5LS2VPCrZ35htybrKsAGazG4Xq1/0s2Bw9t2F
	1uJKMqx0SyGrEpjijXLbMJSAEl2Py7dsIF7kScD9xJ1OT0WvfxsAYA3/wLORm4nMcc2c=
X-Google-Smtp-Source: AGHT+IEot2xPeTED6Qm4nrzq5Fo3yY//aC2fJh6j7EGTtl8PuKddoJ3YUpgLNtMQdKNmOPlPQZkJsQ==
X-Received: by 2002:a17:907:7ba2:b0:af9:3e23:831 with SMTP id a640c23a62f3a-af9c64d40a3mr1241421266b.39.1754945339166;
        Mon, 11 Aug 2025 13:48:59 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v5 07/12] xen/arm: Add support for system suspend triggered by hardware domain
Date: Mon, 11 Aug 2025 23:48:03 +0300
Message-ID: <c995126a9a61aecff7cb9a7c6fd28f091a332443.1754943875.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754943874.git.mykola_kvach@epam.com>
References: <cover.1754943874.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Trigger Xen suspend when the hardware domain initiates suspend via
SHUTDOWN_suspend. Redirect system suspend to CPU#0 to ensure the
suspend logic runs on the boot CPU, as required.

Introduce full suspend/resume infrastructure gated by CONFIG_SYSTEM_SUSPEND,
including logic to:
 - disable and enable non-boot physical CPUs
 - freeze and thaw domains
 - suspend and resume the GIC, timer and console
 - maintain system state before and after suspend

Remove the restriction in the PSCI interface preventing suspend from the
hardware domain.

Select HAS_SYSTEM_SUSPEND for ARM_64.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v5:
- select HAS_SYSTEM_SUSPEND in ARM_64 instead of ARM
- check llc_coloring_enabled instead of LLC_COLORING during the selection
  of HAS_SYSTEM_SUSPEND config
- call host_system_suspend from guest PSCI system suspend instead of
  arch_domain_shutdown, reducing the complexity of the new code
- update some comments

Changes introduced in V4:
  - drop code for saving and restoring VCPU context (for more information
    refer part 1 of patch series)
  - remove IOMMU suspend and resume calls until they will be implemented
  - move system suspend logic to arch_domain_shutdown, invoked from
    domain_shutdown
  - apply minor fixes such as renaming functions, updating comments, and
    modifying the commit message to reflect these changes
  - add console_end_sync to resume path after system suspend

Changes introduced in V3:
  - merge changes from other commits into this patch (previously stashed):
    1) disable/enable non-boot physical CPUs and freeze/thaw domains during
       suspend/resume
    2) suspend/resume the timer, GIC, console, IOMMU, and hardware domain
---
 xen/arch/arm/Kconfig               |   1 +
 xen/arch/arm/Makefile              |   1 +
 xen/arch/arm/include/asm/suspend.h |  22 +++++
 xen/arch/arm/suspend.c             | 151 +++++++++++++++++++++++++++++
 xen/arch/arm/vpsci.c               |  12 ++-
 xen/common/domain.c                |   4 +
 6 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/arch/arm/suspend.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a0c8160474..ccdbaa5bc3 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -8,6 +8,7 @@ config ARM_64
 	depends on !ARM_32
 	select 64BIT
 	select HAS_FAST_MULTIPLY
+	select HAS_SYSTEM_SUSPEND if UNSUPPORTED
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
 
 config ARM
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
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
new file mode 100644
index 0000000000..78d0e2383b
--- /dev/null
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_ARM_SUSPEND_H__
+#define __ASM_ARM_SUSPEND_H__
+
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+int host_system_suspend(void);
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
+#endif /* __ASM_ARM_SUSPEND_H__ */
+
+ /*
+  * Local variables:
+  * mode: C
+  * c-file-style: "BSD"
+  * c-basic-offset: 4
+  * tab-width: 4
+  * indent-tabs-mode: nil
+  * End:
+  */
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
new file mode 100644
index 0000000000..abf4b928ce
--- /dev/null
+++ b/xen/arch/arm/suspend.c
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/llc-coloring.h>
+#include <xen/sched.h>
+
+/*
+ * TODO list:
+ *  - Test system suspend with LLC_COLORING enabled and verify functionality
+ *  - Implement IOMMU suspend/resume handlers and integrate them
+ *    into the suspend/resume path (IPMMU and SMMU)
+ *  - Enable "xl suspend" support on ARM architecture
+ *  - Properly disable Xen timer watchdog from relevant services
+ *  - Add suspend/resume CI test for ARM (QEMU if feasible)
+ *  - Investigate feasibility and need for implementing system suspend on ARM32
+ */
+
+/* Xen suspend. Note: data is not used (suspend is the suspend to RAM) */
+static long system_suspend(void *data)
+{
+    int status;
+    unsigned long flags;
+
+    BUG_ON(system_state != SYS_STATE_active);
+
+    system_state = SYS_STATE_suspend;
+    freeze_domains();
+    scheduler_disable();
+
+    /*
+     * Non-boot CPUs have to be disabled on suspend and enabled on resume
+     * (hotplug-based mechanism). Disabling non-boot CPUs will lead to PSCI
+     * CPU_OFF to be called by each non-boot CPU. Depending on the underlying
+     * platform capabilities, this may lead to the physical powering down of
+     * CPUs. Tested on Xilinx Zynq Ultrascale+ MPSoC (including power down of
+     * each non-boot CPU).
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
+    local_irq_save(flags);
+    status = gic_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_irqs;
+    }
+
+    printk("Xen suspending...\n");
+
+    console_start_sync();
+    status = console_suspend();
+    if ( status )
+    {
+        dprintk(XENLOG_ERR, "Failed to suspend the console, err=%d\n", status);
+        system_state = SYS_STATE_resume;
+        goto resume_console;
+    }
+
+    /*
+     * Enable identity mapping before entering suspend to simplify
+     * the resume path
+     */
+    update_boot_mapping(true);
+
+    system_state = SYS_STATE_resume;
+    update_boot_mapping(false);
+
+ resume_console:
+    console_resume();
+    console_end_sync();
+
+    gic_resume();
+
+ resume_irqs:
+    local_irq_restore(flags);
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
+    /* The resume of hardware domain should always follow Xen's resume. */
+    domain_resume(hardware_domain);
+
+    printk("Resume (status %d)\n", status);
+    return status;
+}
+
+int host_system_suspend(void)
+{
+    int status;
+
+    /* TODO: drop check after verification that features can work together */
+    if ( llc_coloring_enabled )
+    {
+        dprintk(XENLOG_ERR,
+                "System suspend is not supported with LLC_COLORING enabled\n");
+        return -ENOSYS;
+    }
+
+    /*
+     * system_suspend should be called when Dom0 finalizes the suspend
+     * procedure from its boot core (VCPU#0). However, Dom0's VCPU#0 could
+     * be mapped to any PCPU (this function could be executed by any PCPU).
+     * The suspend procedure has to be finalized by the PCPU#0 (non-boot
+     * PCPUs will be disabled during the suspend).
+     */
+    status = continue_hypercall_on_cpu(0, system_suspend, NULL);
+
+    /*
+     * If an error happened, there is nothing that needs to be done here
+     * because the system_suspend always returns in fully functional state
+     * no matter what the outcome of suspend procedure is. If the system
+     * suspended successfully the function will return 0 after the resume.
+     * Otherwise, if an error is returned it means Xen did not suspended,
+     * but it is still in the same state as if the system_suspend was never
+     * called. We dump a debug message in case of an error for debugging/
+     * logging purpose.
+     */
+    if ( status )
+        dprintk(XENLOG_ERR, "Failed to suspend, errno=%d\n", status);
+
+    return status;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 67d369a8a2..757e719ea7 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -4,6 +4,7 @@
 #include <xen/types.h>
 
 #include <asm/current.h>
+#include <asm/suspend.h>
 #include <asm/vgic.h>
 #include <asm/vpsci.h>
 #include <asm/event.h>
@@ -214,9 +215,10 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     struct vcpu *v;
     struct domain *d = current->domain;
 
-    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
+#ifndef CONFIG_SYSTEM_SUSPEND
     if ( is_hardware_domain(d) )
         return PSCI_NOT_SUPPORTED;
+#endif
 
     /* Ensure that all CPUs other than the calling one are offline */
     domain_lock(d);
@@ -234,6 +236,14 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     if ( rc )
         return PSCI_DENIED;
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( is_hardware_domain(d) && host_system_suspend() )
+    {
+        domain_resume_nopause(d);
+        return PSCI_DENIED;
+    }
+#endif
+
     rc = do_setup_vcpu_ctx(current, epoint, cid);
     if ( rc != PSCI_SUCCESS )
     {
diff --git a/xen/common/domain.c b/xen/common/domain.c
index c3609b0cb0..414a691242 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1311,7 +1311,11 @@ int domain_shutdown(struct domain *d, u8 reason)
         d->shutdown_code = reason;
     reason = d->shutdown_code;
 
+#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_ARM)
+    if ( reason != SHUTDOWN_suspend && is_hardware_domain(d) )
+#else
     if ( is_hardware_domain(d) )
+#endif
         hwdom_shutdown(reason);
 
     if ( d->is_shutting_down )
-- 
2.48.1


