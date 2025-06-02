Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED293ACAB28
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 11:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1002948.1382430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16P-0001UC-Ql; Mon, 02 Jun 2025 09:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1002948.1382430; Mon, 02 Jun 2025 09:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM16P-0001Pu-LR; Mon, 02 Jun 2025 09:05:05 +0000
Received: by outflank-mailman (input) for mailman id 1002948;
 Mon, 02 Jun 2025 09:05:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qKV=YR=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uM16N-0007kh-BE
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 09:05:03 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa775ed5-3f90-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 11:05:01 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-553280c345cso5290525e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 02:05:01 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533791cdc3sm1507541e87.176.2025.06.02.02.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 02:04:59 -0700 (PDT)
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
X-Inumbo-ID: aa775ed5-3f90-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748855101; x=1749459901; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NXZs6M8P80Im90jJSBLKCDHJny8JfIVqdVI3nVOxBmE=;
        b=kUKBdBHmu47ZOW8rZpCaqSNoS2j1Ly1SKnz5MyfJBUgaE+F9ZxGtfjfEoF7nIgcljN
         Dx+iu2Kk6SRD+WY+uVbdm9cDN6ZwfNSL6Cc4GcmbGcpZDHrvmr2Ffl17fOrUpu1UEQL0
         eKiPEN3IlFrnxy5ZtOisjvW/op4oM7T1hPMfr1PMN4Q3V8fawXc7UOBx/VzDWol6MlFH
         DlC+mwSQOqGdeXwNwpIPAsiBJRV9I9dykcyzCY7vmBp7+CoqEP3WfRzbqDmwr/egXxzn
         pr8cgup0VWKC3VRWL8Z/Kfu5IhCsImRwEZby0qUU1p4hYtLwB0JLbA3ebMtKhc9d452K
         mYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748855101; x=1749459901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXZs6M8P80Im90jJSBLKCDHJny8JfIVqdVI3nVOxBmE=;
        b=ANEP71lLSlm8PaObWIVoqytAf9EU0Je2aewD6PixAPQSpiEDysM94S8Ka+o+6nZxCp
         Y4sW28icVwf82R71h0578bL7B26+5WlMAMBStpc9aurLxAS1eW+SWIbN22EKUpECL1wN
         +5PA2+dB7DA394OwsqS+rC6wQbsLPJXySu9ebG+PQHZWT7ZFL5XKNfdGkbDY7p7YVwkr
         b2Mu8FyXslf2vbeIbidcJQPsiZxfEM3USL9f2jEVatXItS9shrtO+0Dm/iIGZbkS8FOA
         maSavfUYlrxb4RYnJTYIvqR82UUc0IGDGNMxf80dbVV5zV4d9tt49uDYdbFloVX3a8fv
         ByTQ==
X-Gm-Message-State: AOJu0YwvfMErhR1vUTjs1Ei/OoiFv33bSuLQzsnMvJWGI9fj+dDTcogT
	idn3uHJik4vMeFL4Bkftnvw+cRcS0U1Sl6f21ipQwMCRb3lFfgZZBG6TovHmJagAK9o=
X-Gm-Gg: ASbGncsER2rWTvBEY+isQnsuWJ5Yk60pQMkPEmt7WmGKagIZNgR5HIfR3bWoa2fbz7R
	2+afRq5K7FadrWfsTA4UAK/tj+WSCbAgxisyyyUUK9BpDYAcxCizEzrYgFN6Y38v7CMsY9d9LyB
	8q+iYzcustv/YTIyRO0LRYI8mKNsztPikbS+ixo02SooMJbVwYey2X2onUHF1/tbWCWOL/2y3OZ
	O/3kmYmN88ukfiPrRfdE1DV6wjb3m7E+FAfoWy6f+8pKVONqYCe6Db/Gi87ehF42kpEQMeZC8ZS
	QFquvUMItrfxmYXUL1FGQXyaL0wLhuPsSvoYvhx/qFgQl9bBGZNdWVcYRQSPAru9hVJErFZs99s
	hQJ7Rh2m3XFTzPm9JGpsfhXd9fA==
X-Google-Smtp-Source: AGHT+IEuTNPnBUZrCCHATRKgs5I7i+11AlP+JJAf9fOMKvbdRpaN5dntYb1dXqpKLf04epIJMtzGHw==
X-Received: by 2002:a05:6512:3352:b0:553:50c6:b86c with SMTP id 2adb3069b0e04-55350c6b915mr46633e87.57.1748855100526;
        Mon, 02 Jun 2025 02:05:00 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: xakep.amatop@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4][PART 2 07/10] xen/arm: Add support for system suspend triggered by hardware domain
Date: Mon,  2 Jun 2025 12:04:18 +0300
Message-ID: <7bd75ecfff5b0a75ea5abd7cc4934582d7e1250c.1748848482.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748848482.git.mykola_kvach@epam.com>
References: <cover.1748848482.git.mykola_kvach@epam.com>
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

Extend arch_domain_shutdown to return a status code and integrate
system_suspend into the ARM-specific path. Update stub implementations
and function signatures across other architectures (x86, riscv, ppc)
for consistency.

Remove the restriction in the PSCI interface preventing suspend from the
hardware domain.

Update Kconfig and Makefile to support conditional inclusion of the new
suspend.c implementation.Limit SYSTEM_SUSPEND support to ARM64 with
UNSUPPORTED enabled and LLC_COLORING disabled.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
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
 xen/arch/arm/domain.c              |  21 ++++-
 xen/arch/arm/include/asm/suspend.h |  22 +++++
 xen/arch/arm/suspend.c             | 143 +++++++++++++++++++++++++++++
 xen/arch/arm/vpsci.c               |   4 -
 xen/arch/ppc/stubs.c               |   2 +-
 xen/arch/riscv/stubs.c             |   2 +-
 xen/arch/x86/domain.c              |   4 +-
 xen/common/domain.c                |   9 +-
 xen/include/xen/domain.h           |   2 +-
 11 files changed, 200 insertions(+), 11 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/arch/arm/suspend.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 57919d8b3a..80d0a6bf54 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -19,6 +19,7 @@ config ARM
 	select HAS_DOM0LESS
 	select HAS_GRANT_CACHE_FLUSH if GRANT_TABLE
 	select HAS_STACK_PROTECTOR
+	select HAS_SYSTEM_SUSPEND if ARM_64 && !LLC_COLORING && UNSUPPORTED
 	select HAS_UBSAN
 
 config ARCH_DEFCONFIG
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index eeeac4e653..381969dd90 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -53,6 +53,7 @@ obj-y += smp.o
 obj-y += smpboot.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
+obj-$(CONFIG_SYSTEM_SUSPEND) += suspend.o
 obj-y += sysctl.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 45aeb8bddc..75092a997f 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -24,11 +24,14 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/suspend.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
 #include <asm/vtimer.h>
 
+#include <public/sched.h>
+
 #include "vpci.h"
 #include "vuart.h"
 
@@ -857,8 +860,24 @@ void arch_domain_destroy(struct domain *d)
     domain_io_free(d);
 }
 
-void arch_domain_shutdown(struct domain *d)
+int arch_domain_shutdown(struct domain *d)
 {
+    switch ( d->shutdown_code )
+    {
+    case SHUTDOWN_suspend:
+#ifdef CONFIG_SYSTEM_SUSPEND
+        if ( !is_hardware_domain(d) )
+            break;
+
+        return host_system_suspend();
+#else
+        break;
+#endif
+    default:
+        break;
+    }
+
+    return 0;
 }
 
 void arch_domain_pause(struct domain *d)
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
index 0000000000..13e59015c0
--- /dev/null
+++ b/xen/arch/arm/suspend.c
@@ -0,0 +1,143 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/sched.h>
+
+/*
+ * TODO list:
+ *  - Test system suspend with LLC_COLORING enabled and verify functionality
+ *  - Implement IOMMU suspend/resume handlers and integrate them
+ *    into the suspend/resume path
+ *  - Add GICv3 suspend/resume support if required
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
index 87a63b0a94..27e413b1fb 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -202,10 +202,6 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     struct vcpu *v;
     struct domain *d = current->domain;
 
-    /* Drop this check once SYSTEM_SUSPEND is supported in hardware domain */
-    if ( is_hardware_domain(d) )
-        return PSCI_NOT_SUPPORTED;
-
     /* Ensure that all CPUs other than the calling one are offline */
     for_each_vcpu ( d, v )
     {
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index 671e71aa0a..5bb08dcd95 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -219,7 +219,7 @@ void arch_domain_destroy(struct domain *d)
     BUG_ON("unimplemented");
 }
 
-void arch_domain_shutdown(struct domain *d)
+int arch_domain_shutdown(struct domain *d)
 {
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 83416d3350..e2cb6c2579 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -204,7 +204,7 @@ void arch_domain_destroy(struct domain *d)
     BUG_ON("unimplemented");
 }
 
-void arch_domain_shutdown(struct domain *d)
+int arch_domain_shutdown(struct domain *d)
 {
     BUG_ON("unimplemented");
 }
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7536b6c871..ab4b54fc3c 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -951,10 +951,12 @@ void arch_domain_destroy(struct domain *d)
     psr_domain_free(d);
 }
 
-void arch_domain_shutdown(struct domain *d)
+int arch_domain_shutdown(struct domain *d)
 {
     if ( is_viridian_domain(d) )
         viridian_time_domain_freeze(d);
+
+    return 0;
 }
 
 void arch_domain_pause(struct domain *d)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 58c5ffc466..6a3140561e 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1276,6 +1276,7 @@ void __domain_crash(struct domain *d)
 int domain_shutdown(struct domain *d, u8 reason)
 {
     struct vcpu *v;
+    int ret;
 
 #ifdef CONFIG_X86
     if ( pv_shim )
@@ -1288,7 +1289,11 @@ int domain_shutdown(struct domain *d, u8 reason)
         d->shutdown_code = reason;
     reason = d->shutdown_code;
 
+#if defined(CONFIG_SYSTEM_SUSPEND) && defined(CONFIG_ARM)
+    if ( reason != SHUTDOWN_suspend && is_hardware_domain(d) )
+#else
     if ( is_hardware_domain(d) )
+#endif
         hwdom_shutdown(reason);
 
     if ( d->is_shutting_down )
@@ -1311,13 +1316,13 @@ int domain_shutdown(struct domain *d, u8 reason)
         v->paused_for_shutdown = 1;
     }
 
-    arch_domain_shutdown(d);
+    ret = arch_domain_shutdown(d);
 
     __domain_finalise_shutdown(d);
 
     spin_unlock(&d->shutdown_lock);
 
-    return 0;
+    return ret;
 }
 
 void domain_resume(struct domain *d)
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index e10baf2615..c0cbbd808f 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -101,7 +101,7 @@ int arch_domain_create(struct domain *d,
 int arch_domain_teardown(struct domain *d);
 void arch_domain_destroy(struct domain *d);
 
-void arch_domain_shutdown(struct domain *d);
+int arch_domain_shutdown(struct domain *d);
 void arch_domain_pause(struct domain *d);
 void arch_domain_unpause(struct domain *d);
 
-- 
2.48.1


