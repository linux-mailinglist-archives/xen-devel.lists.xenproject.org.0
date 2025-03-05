Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E472DA4F99F
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:12:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901883.1309900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknW-0001N2-Ov; Wed, 05 Mar 2025 09:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901883.1309900; Wed, 05 Mar 2025 09:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknW-0001Gw-9x; Wed, 05 Mar 2025 09:12:14 +0000
Received: by outflank-mailman (input) for mailman id 901883;
 Wed, 05 Mar 2025 09:12:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknT-0006ev-Sd
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:11 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebabc915-f9a1-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:12:11 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-549490e290dso5158117e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:11 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:12:09 -0800 (PST)
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
X-Inumbo-ID: ebabc915-f9a1-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165930; x=1741770730; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vRDesRQb/Nxhcf66JbLCYMstts9xs0Oaigt+qqhPzM=;
        b=ESjib+ijtuRtIkop52jBXTWP/vZdjuq1LbSSb1bzrDHb3gXFQvmlqL9guzkqGVBYzY
         kXmsuGEREScjkGdZzXQtstSaLfSTpsPPIOsaShYoB5cDsIJIejMfwPrSgTvjjenMQgxn
         okmqnTMvIJiDB30DhXA2ScJ1PFz/hWHT/NM8hsEvVIOnmL9yqzkfaiCv27IADyWiAxGX
         +4KVOspvBB5lgawJUJ86izoHwHQ9v6Rj2tOwI77qYT5H4sXwFUOXxfPRWRonq9ABPg38
         pnDIJ8IdlOIMv4gntyNvcopOjaPJr2l3twfNzUI8Q35vlykHTvuRZRh0J86LON0mXj8R
         n7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165930; x=1741770730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vRDesRQb/Nxhcf66JbLCYMstts9xs0Oaigt+qqhPzM=;
        b=G1EdZXq4Gtqq0NaL8HczTcVS0TUT5RhtSeHQz6CVvXQtKpOyQAjDtK0DJtxGvxk5LT
         etGTEqjEBKwJ4q5q/aZj+qhGb6vdH75W8mBZ+Zyyrk1/lG3BvKK/YHHppGpQHks9RAEx
         Iy4thdXDOus/BxGEByueTs8y+uucdqMQdsHtD21vIx4RCbj864vsglzWoMI5MmjjkvWO
         m0rE/vLgpqcb+HlBFoKZUVn57A9Iz9tzjjpZd25JU47DZ7Caz90guGYtW4yE3M/yxmCA
         0lq4gTcvliiQJZeeam3gIbOAXBBdjmbl/CMU7VBKi76Y21uZTa+ZrUO4Eh7+j4S5NztN
         7MKg==
X-Gm-Message-State: AOJu0Yzk+dHKtN38TaKQXyBCVoZgVGWaAJ9XKkvLJTSLEtfjhleQwocW
	PU2oFZBH7+MkkKY79r3SY/ZWqWr7UNZr5dbUAoCghrvnj6xQ5gRgML8Bi/oE
X-Gm-Gg: ASbGncthnCbAeb7lEf/HqdFWt5PXIlfMzUobZJAjSbz1RkVV3Gb2skFwL646vvWNzDl
	S+L0nkGROS976xt8RpV30LBgpU7M3ZBRrwBsZsNVu6VPnYYWSsOt6UHIOzANGFOaYkaFHfA0DtH
	U59K6mR+hUuOM2g7+LcOa45AgwBqF0kaMlKFU2XC1IsQ/VykoFUzLp/PJZzYSM3m6A4Kpf1dAjL
	1CauwSTKd5UO6xmLBhHTPE6jzZqDoAnvOLRYpdiyqJwqLAjr9JNapghFLF1tkU89n8a9oZ0BWVS
	bL1BYdNAn0oJu2Uhocp0Yn1gc8pC9n7ELD2yPImRfLV05PCTVA==
X-Google-Smtp-Source: AGHT+IGgw7tZ/KupAA7aqLgKd7RgPJr1KdPD7ZGpud0YGWY6QTwxlrBZ7x7v9bHnysTCB2vsApcPRQ==
X-Received: by 2002:a05:6512:3e1a:b0:545:1082:91a1 with SMTP id 2adb3069b0e04-5497d32f7bamr789411e87.7.1741165929631;
        Wed, 05 Mar 2025 01:12:09 -0800 (PST)
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
Subject: [PATCH 12/16] xen/arm: Trigger Xen suspend when hardware domain completes suspend
Date: Wed,  5 Mar 2025 11:11:20 +0200
Message-ID: <ff5da2f2bc2210bcb2133749591ea01114391173.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

When hardware domain finalizes its suspend procedure the suspend of Xen
is triggered by calling system_suspend(). Hardware domain finalizes the
suspend from its boot core (VCPU#0), which could be mapped to any physical
CPU, i.e. the system_suspend() function could be executed by any physical
CPU. Since Xen suspend procedure has to be run by the boot CPU
(non-boot CPUs will be disabled at some point in suspend procedure),
system_suspend() execution has to continue on CPU#0.

When the system_suspend() returns 0, it means that the system was
suspended and it is coming out of the resume procedure. Regardless
of the system_suspend() return value, after this function returns
Xen is fully functional, and its state, including all devices and data
structures, matches the state prior to calling system_suspend().
The status is returned by system_suspend() for debugging/logging
purposes and function prototype compatibility.

This patch also introduces some state changes in peripherals and CPUs
during suspend/resume. Specifically, it:
  - disable/enable non-boot physical CPUs, freeze/thaw domains;
  - suspend/resume the timer, GIC, console, IOMMU, and hardware domain.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes introduced in V3:
 Merged changes from other commits into this one (stashed changes):
  - disabled/enabled non-boot physical CPUs and froze/thawed domains;
  - suspended/resumed the timer, GIC, console, IOMMU, and hardware domain.
---
 xen/arch/arm/suspend.c | 233 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
index 27fab8c999..fa81be5a4f 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,6 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/sched.h>
+#include <xen/cpu.h>
+#include <xen/console.h>
+#include <xen/iommu.h>
 #include <asm/cpufeature.h>
 #include <asm/event.h>
 #include <asm/psci.h>
@@ -8,6 +11,210 @@
 #include <asm/platform.h>
 #include <public/sched.h>
 
+/* Reset values of VCPU architecture specific registers */
+static void vcpu_arch_reset(struct vcpu *v)
+{
+    v->arch.ttbr0 = 0;
+    v->arch.ttbr1 = 0;
+    v->arch.ttbcr = 0;
+
+    v->arch.csselr = 0;
+    v->arch.cpacr = 0;
+    v->arch.contextidr = 0;
+    v->arch.tpidr_el0 = 0;
+    v->arch.tpidrro_el0 = 0;
+    v->arch.tpidr_el1 = 0;
+    v->arch.vbar = 0;
+    v->arch.dacr = 0;
+    v->arch.par = 0;
+#if defined(CONFIG_ARM_32)
+    v->arch.mair0 = 0;
+    v->arch.mair1 = 0;
+    v->arch.amair0 = 0;
+    v->arch.amair1 = 0;
+#else
+    v->arch.mair = 0;
+    v->arch.amair = 0;
+#endif
+    /* Fault Status */
+#if defined(CONFIG_ARM_32)
+    v->arch.dfar = 0;
+    v->arch.ifar = 0;
+    v->arch.dfsr = 0;
+#elif defined(CONFIG_ARM_64)
+    v->arch.far = 0;
+    v->arch.esr = 0;
+#endif
+
+    v->arch.ifsr  = 0;
+    v->arch.afsr0 = 0;
+    v->arch.afsr1 = 0;
+
+#ifdef CONFIG_ARM_32
+    v->arch.joscr = 0;
+    v->arch.jmcr = 0;
+#endif
+
+    v->arch.teecr = 0;
+    v->arch.teehbr = 0;
+}
+
+/*
+ * This function sets the context of current VCPU to the state which is expected
+ * by the guest on resume. The expected VCPU state is:
+ * 1) pc to contain resume entry point (1st argument of PSCI SYSTEM_SUSPEND)
+ * 2) r0/x0 to contain context ID (2nd argument of PSCI SYSTEM_SUSPEND)
+ * 3) All other general purpose and system registers should have reset values
+ */
+static void vcpu_resume(struct vcpu *v)
+{
+
+    struct vcpu_guest_context ctxt;
+
+    /* Make sure that VCPU guest regs are zeroed */
+    memset(&ctxt, 0, sizeof(ctxt));
+
+    /* Set non-zero values to the registers prior to copying */
+    ctxt.user_regs.pc64 = (u64)v->arch.suspend_ep;
+
+    /* TODO: test changes on 32-bit domain */
+    if ( is_32bit_domain(v->domain) )
+    {
+        ctxt.user_regs.r0_usr = v->arch.suspend_cid;
+        ctxt.user_regs.cpsr = PSR_GUEST32_INIT;
+
+        /* Thumb set is allowed only for 32-bit domain */
+        if ( v->arch.suspend_ep & 1 )
+        {
+            ctxt.user_regs.cpsr |= PSR_THUMB;
+            ctxt.user_regs.pc64 &= ~(u64)1;
+        }
+    }
+#ifdef CONFIG_ARM_64
+    else
+    {
+        ctxt.user_regs.x0 = v->arch.suspend_cid;
+        ctxt.user_regs.cpsr = PSR_GUEST64_INIT;
+    }
+#endif
+    ctxt.sctlr = SCTLR_GUEST_INIT;
+    ctxt.flags = VGCF_online;
+
+    /* Reset architecture specific registers */
+    vcpu_arch_reset(v);
+
+    /* Initialize VCPU registers */
+    domain_lock(v->domain);
+    arch_set_info_guest(v, &ctxt);
+    domain_unlock(v->domain);
+    watchdog_domain_resume(v->domain);
+}
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
+    console_start_sync();
+
+    status = console_suspend();
+    if ( status )
+    {
+        dprintk(XENLOG_ERR, "Failed to suspend the console, err=%d\n", status);
+        system_state = SYS_STATE_resume;
+        goto resume_console;
+    }
+
+    status = iommu_suspend();
+    if ( status )
+    {
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
+    iommu_resume();
+
+resume_console:
+    console_resume();
+
+    gic_resume();
+
+resume_irqs:
+    local_irq_restore(flags);
+
+    time_resume();
+
+resume_nonboot_cpus:
+    /*
+     * The rcu_barrier() has to be added to ensure that the per cpu area is
+     * freed before a non-boot CPU tries to initialize it (_free_percpu_area()
+     * has to be called before the init_percpu_area()). This scenario occurs
+     * when non-boot CPUs are hot-unplugged on suspend and hotplugged on resume.
+     */
+    rcu_barrier();
+    enable_nonboot_cpus();
+    thaw_domains();
+    system_state = SYS_STATE_active;
+
+    /*
+     * The hardware domain owns most of the devices and may be part of the
+     * suspend/resume path. Since the hardware domain suspend is tied to
+     * the host suspend, it makes sense to resume it at the same time,
+     * i.e. after host resumes.
+     */
+    vcpu_resume(hardware_domain->vcpu[0]);
+    /*
+     * The resume of hardware domain should always follow Xen's resume.
+     * This is done by unblocking the first vCPU of Dom0.
+     */
+    vcpu_unblock(hardware_domain->vcpu[0]);
+
+    printk("Resume (status %d)\n", status);
+
+    return status;
+}
+
 static void vcpu_suspend_prepare(register_t epoint, register_t cid)
 {
     struct vcpu *v = current;
@@ -21,6 +228,7 @@ int32_t domain_suspend(register_t epoint, register_t cid)
     struct vcpu *v;
     struct domain *d = current->domain;
     bool is_thumb = epoint & 1;
+    int status;
 
     dprintk(XENLOG_DEBUG,
             "Dom%d suspend: epoint=0x%"PRIregister", cid=0x%"PRIregister"\n",
@@ -54,6 +262,31 @@ int32_t domain_suspend(register_t epoint, register_t cid)
      */
     vcpu_block_unless_event_pending(current);
 
+    /* If this was dom0 the whole system should suspend: trigger Xen suspend */
+    if ( is_hardware_domain(d) )
+    {
+        /*
+         * system_suspend should be called when Dom0 finalizes the suspend
+         * procedure from its boot core (VCPU#0). However, Dom0's VCPU#0 could
+         * be mapped to any PCPU (this function could be executed by any PCPU).
+         * The suspend procedure has to be finalized by the PCPU#0 (non-boot
+         * PCPUs will be disabled during the suspend).
+         */
+        status = continue_hypercall_on_cpu(0, system_suspend, NULL);
+        /*
+         * If an error happened, there is nothing that needs to be done here
+         * because the system_suspend always returns in fully functional state
+         * no matter what the outcome of suspend procedure is. If the system
+         * suspended successfully the function will return 0 after the resume.
+         * Otherwise, if an error is returned it means Xen did not suspended,
+         * but it is still in the same state as if the system_suspend was never
+         * called. We dump a debug message in case of an error for debugging/
+         * logging purpose.
+         */
+        if ( status )
+            dprintk(XENLOG_ERR, "Failed to suspend, errno=%d\n", status);
+    }
+
     return PSCI_SUCCESS;
 }
 
-- 
2.43.0


