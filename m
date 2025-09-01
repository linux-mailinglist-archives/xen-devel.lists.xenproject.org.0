Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76441B3F0E2
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 00:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105410.1456429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjX-0007z4-Iy; Mon, 01 Sep 2025 22:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105410.1456429; Mon, 01 Sep 2025 22:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utCjX-0007ui-4v; Mon, 01 Sep 2025 22:10:39 +0000
Received: by outflank-mailman (input) for mailman id 1105410;
 Mon, 01 Sep 2025 22:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pPXY=3M=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utCjV-00055o-Sr
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 22:10:37 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c5a7763-8780-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 00:10:36 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-55f7cd8ec2cso1473228e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 15:10:36 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608279307asm123038e87.75.2025.09.01.15.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 15:10:34 -0700 (PDT)
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
X-Inumbo-ID: 7c5a7763-8780-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764635; x=1757369435; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGzUVANbBHVQm2yt+EaiKz11N+mMUBJTMXRpUM7rLq4=;
        b=buVqwQTpFdnxff4F5Wq6sWoIKb28FFtDIx5qMbh2rU2EdfrDLp5TzhE6F2TYzEsZNR
         Rzw3EC0Qg5WZiOqskgeiSWbCGAUqJyjuxGKSfSKCNRLjLssAUPPzkrvUZugnViljDoA5
         jiiP8iV+xJPBs5wuzkhpu0HkgI2CW2OhrIjlqiPJ3+HyZwpokDZYxGIk4a3LgF+GzrZ0
         ieuuKLqn32tDylrUEL0SZP5RqqNQiYVNXBH6KAe2cSJY+vp6V+8KunSzgdRehhXfd03f
         QNstpsq+zMc9vNgAFeEoOJTBZxDs8tg90rhNaGC1h0A9D0HEDmD0om7F299EVCE0kvkI
         s6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764635; x=1757369435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGzUVANbBHVQm2yt+EaiKz11N+mMUBJTMXRpUM7rLq4=;
        b=f85O8GxyC3Z/pZQOuT4fhbXX4qv6WQBi/HapHy3WjQDSvjktUB+uJVs1JSifIKcHdV
         OS/2xM6lL6EiYFJlo2Sdmqc++0U2td+uh3EFxYhKmWqEh1iJUo/uPUTs0U/ZT1twsxgf
         bfHoqfJyTQw6vMwSVFmjIDUNANBvPlCe9b+XTtThUd3KMh5AXWnAIz7IH7iyl+4TJ30R
         V13FxAlsqnfShfVlnFeeFrvYDiA+T7x1YWivDEAh6y0SlWWe0EM5iJAeWq6dIgEfWgD4
         Uyi5vsc2rO3+itSJywHwVIfI/x+yd3AoquPBQJAlE1cuH8M+ZzLPqxzRf4klWRFLnt+i
         bL/w==
X-Gm-Message-State: AOJu0YzsP9GCbabLjgyU2+pUAgCUOqrPC4De3uS8cUdlPwBTU+/noK6I
	XN51rKdB6T53BrQweltl7gdbNdK5Z/KtCdIzaJ/4Zkzyeyh5NbTTx06IceT7ZbcL
X-Gm-Gg: ASbGncvvFoycXGyKoyAqStFofUUkvTQ96b5+6c08JrUZ3XjuP29jQKp7DD4y8kNL43F
	CGaVELZoX4ujh/3JzBlTYms5GIH+I/W/Qz7ZLlvijiuVwU4+oLlkyvExt7EweQKgRpGPGv15CWm
	wbXJO2XcySsaI36FFgS06mwgHulB+yIO1jZFGlrBtbHiWEfCU1l2+8oVE5AjmQnDOtsqkb998Vw
	ojIm1ZZsjZGIfAm8nontl05uwgbghfr6slrdixIoPMVCcYcZe3D3Xk3hwsmo75bH/0h3FcVrVZR
	SmYaTKr/Wg/9IMmjLNvyZ1uZ91oPcVNuCvhf0h9t9T7wvu7b5BZ39syUTeRA8tM5wMmg2qRnSn7
	r/gDzPkOEKJGsnOXGVa2ddSaJVkRyqpDo1mJNG5Jvwg/SULNCa53yKxNwByYKCg==
X-Google-Smtp-Source: AGHT+IH+YIb5/EiRCiek3MEhwqufDEz2NkLHmu/RcFSNtgnxC2gM0m7/gUw3Q4lC0sULlGwUgJZ6ng==
X-Received: by 2002:a05:6512:691:b0:55f:56db:7648 with SMTP id 2adb3069b0e04-55f708b6be9mr2634797e87.19.1756764635113;
        Mon, 01 Sep 2025 15:10:35 -0700 (PDT)
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
Subject: [PATCH v6 11/13] xen/arm: Add support for system suspend triggered by hardware domain
Date: Tue,  2 Sep 2025 01:10:15 +0300
Message-ID: <547196292a007ec2bbedd52036e8f8a0cc69c4ea.1756763487.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756763487.git.mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
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
 - suspend and resume the GIC, timer, iommu and console
 - maintain system state before and after suspend

On boot, init_ttbr is normally initialized during secondary CPU hotplug.
On uniprocessor systems, this would leave init_ttbr uninitialized,
causing resume to fail. To address this, the boot CPU now sets init_ttbr
during suspend.

Remove the restriction in the vPSCI interface preventing suspend from the
hardware domain.

Select HAS_SYSTEM_SUSPEND for ARM_64.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v6:
- Minor changes in comments.
- The implementation now uses own tasklet instead of continue_hypercall_on_cpu,
  as the latter rewrites user registers and would tie system suspend status
  to guest suspend status.
- The order of calls when suspending devices has been updated.

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
 xen/arch/arm/include/asm/mm.h      |   2 +
 xen/arch/arm/include/asm/suspend.h |   2 +
 xen/arch/arm/mmu/smpboot.c         |   2 +-
 xen/arch/arm/suspend.c             | 150 +++++++++++++++++++++++++++++
 xen/arch/arm/vpsci.c               |   9 +-
 xen/common/domain.c                |   4 +
 7 files changed, 168 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 5355534f3d..fdad53fd68 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -8,6 +8,7 @@ config ARM_64
 	depends on !ARM_32
 	select 64BIT
 	select HAS_FAST_MULTIPLY
+	select HAS_SYSTEM_SUSPEND if UNSUPPORTED
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
 
 config ARM
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 7a93dad2ed..61e211d087 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -365,6 +365,8 @@ static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
     } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
 }
 
+void set_init_ttbr(lpae_t *root);
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 29eed4ee7f..8d30b01b7c 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -29,6 +29,8 @@ extern struct cpu_context cpu_context;
 void hyp_resume(void);
 int prepare_resume_ctx(struct cpu_context *ptr);
 
+void host_system_suspend(void);
+
 #endif /* CONFIG_SYSTEM_SUSPEND */
 
 #endif /* __ASM_ARM_SUSPEND_H__ */
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
index 5093f1bf3d..35b20581f1 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,9 +1,159 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/psci.h>
 #include <asm/suspend.h>
 
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/llc-coloring.h>
+#include <xen/sched.h>
+#include <xen/tasklet.h>
+
+/*
+ * TODO list:
+ *  - Decide which domain will trigger system suspend ctl or hw ?
+ *  - Test system suspend with LLC_COLORING enabled and verify functionality
+ *  - Implement IOMMU suspend/resume handlers and integrate them
+ *    into the suspend/resume path (SMMU)
+ *  - Enable "xl suspend" support on ARM architecture
+ *  - Properly disable Xen timer watchdog from relevant services (init.d left)
+ *  - Add suspend/resume CI test for ARM (QEMU if feasible)
+ *  - Investigate feasibility and need for implementing system suspend on ARM32
+ */
+
 struct cpu_context cpu_context;
 
+/* Xen suspend. Note: data is not used (suspend is the suspend to RAM) */
+static void cf_check system_suspend(void *data)
+{
+    int status;
+    unsigned long flags;
+    /* TODO: drop check after verification that features can work together */
+    if ( llc_coloring_enabled )
+    {
+        dprintk(XENLOG_ERR,
+                "System suspend is not supported with LLC_COLORING enabled\n");
+        status = -ENOSYS;
+        goto dom_resume;
+    }
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
+    console_start_sync();
+    status = console_suspend();
+    if ( status )
+    {
+        dprintk(XENLOG_ERR, "Failed to suspend the console, err=%d\n", status);
+        system_state = SYS_STATE_resume;
+        goto resume_console;
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
+ resume_console:
+    console_resume();
+    console_end_sync();
+
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
+ dom_resume:
+    /* The resume of hardware domain should always follow Xen's resume. */
+    domain_resume(hardware_domain);
+}
+
+static DECLARE_TASKLET(system_suspend_tasklet, system_suspend, NULL);
+
+void host_system_suspend(void)
+{
+    /*
+     * system_suspend should be called when hardware domain finalizes the
+     * suspend procedure from its boot core (VCPU#0). However, Dom0's vCPU#0
+     * could be mapped to any pCPU. The suspend procedure has to be finalized
+     * by the pCPU#0 (non-boot pCPUs will be disabled during the suspend).
+     */
+    tasklet_schedule_on_cpu(&system_suspend_tasklet, 0);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 22c3a5f544..2f52aba48d 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -4,6 +4,7 @@
 #include <xen/types.h>
 
 #include <asm/current.h>
+#include <asm/suspend.h>
 #include <asm/vgic.h>
 #include <asm/vpsci.h>
 #include <asm/event.h>
@@ -221,9 +222,10 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     if ( is_64bit_domain(d) && is_thumb )
         return PSCI_INVALID_ADDRESS;
 
-    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
+#ifndef CONFIG_SYSTEM_SUSPEND
     if ( is_hardware_domain(d) )
         return PSCI_NOT_SUPPORTED;
+#endif
 
     /* Ensure that all CPUs other than the calling one are offline */
     domain_lock(d);
@@ -249,6 +251,11 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
             "SYSTEM_SUSPEND requested, epoint=0x%"PRIregister", cid=0x%"PRIregister"\n",
             epoint, cid);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+    if ( is_hardware_domain(d) )
+        host_system_suspend();
+#endif
+
     return rc;
 }
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 667017c5e1..5e224740d3 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1317,7 +1317,11 @@ int domain_shutdown(struct domain *d, u8 reason)
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


