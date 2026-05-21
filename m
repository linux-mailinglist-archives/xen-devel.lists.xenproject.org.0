Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJGIEoRFD2qNIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D9B5AA8E0
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 19:48:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315663.1585473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VZ-0004Qf-Rr; Thu, 21 May 2026 17:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315663.1585473; Thu, 21 May 2026 17:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ7VZ-0004KX-Kq; Thu, 21 May 2026 17:48:33 +0000
Received: by outflank-mailman (input) for mailman id 1315663;
 Thu, 21 May 2026 17:48:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wQ7VV-0003Wf-8u
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:48:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ7VU-00HNFj-Ka
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 19:48:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f453f-e002-0a2a0a5209dd-0a2a450bb4b0-44
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:28 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a0f456c-212f-0a2a450b0019-d1558029d507-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 19:48:28 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48fe26a177cso48790455e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 10:48:28 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.24.36]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49033d8e24bsm74565925e9.10.2026.05.21.10.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 10:48:27 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779385708; x=1779990508; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rsbyAykeGDbUvOwTWSI9USgGEMUbfPp5YFjbccc/+1E=;
        b=Y5PkYpAua5N0V6UgrI1Yv5PErzC/00fbyRWmZFq2imnW+LRvAcVyuNOoTqzMKC0p06
         aJkN3Yl6hwm7zkSB6t88/BX1hae0geppsPsoGHp0uNHx0ho30uawOf8YQQypXE0cZ/4d
         B8l3/s7lxTEPP71rL2dPJzgjk8qUy0herLQoWQvSUEDe0jt/DQdoi9qu9URfYvw1FJFl
         NSiIG5CIuJqzW8Tm4g8NgtMHj++NefP+uz6domiXTN76uwKOfTeXVcZQF9VQmCvdlS0W
         dzrkCrFjRnw1EPKpRXbe8/N7qyaYry2RGODMBwvo2W03Ex8bPsxSs/QP3Qu/s7gzdAwo
         QTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779385708; x=1779990508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rsbyAykeGDbUvOwTWSI9USgGEMUbfPp5YFjbccc/+1E=;
        b=PoXtY86CQc4Xaugau8mn6ci8Z7lWyMUrgG3lEO+Eqe07Gj4cAOC6uF+tNLcRTzBFtz
         Ofrkf82qqwvDFNqnzrxjq7WBD1JsbVsSTPvLGpDJD5qX0mfd5+L6vH3iMmey92a1x0C2
         lkFeZj3qPZ/nSeS1JjuMnH/d8MQ1EnXZm2559cbu+eP7HtAe/Myox127V+ljvEZofdoU
         eOLjUOYHW3pWURjw7vW1xKODs1BQIH7+vC/+1UC8//fEQ7n+TKEOfHfvuj7VFPBJtv9J
         4afBMFmi0a1VZkSNNSw1KFZw3FqIcX3Wo8zrmrFstYWpmkq4Db12FZkVmK7DEomoEfoy
         0XMQ==
X-Gm-Message-State: AOJu0YwvWsxju8VFfcS8bLwau7DDewnM596cszZ6yJlp4j6fw5L2ZE1S
	46QsdU/jDAgERcFUFX0opE0coC8860ghTy+iR2ikX+7AvHQLZ4RFNJRJOgiwv955
X-Gm-Gg: Acq92OFdmFxtCktFnI+6BaH8PKPrLve7udg3mJDbdsG0wBPELJztEmna0Kv4iSInnMV
	MZNkX1EY9YyD9N32FNBeNXB5bBJImppqklkyUbFhdm+TtvKSCD1n/Qnz2ppfsvK4bA3R1tbWqoi
	qI8GiK8cqcPF+a+eI0TpZl5sHDH2Anh1ZK21sw7uNXOcVqVvLCYkYod7JK8aojZIQLLVrisXoBG
	9Y90WB+ok9Kqv4oCct/rB6fnaA3U9z+OehFID9y5jsAqSlrsygXAZ7x+AqYVBWSaqFwWxFi6PLs
	09v9gl8NEaJa2xWixI6UTcGSxd5Zmgi1tjE3XuLmTErc3f3npgFzTepU4iv1rkaLfGpjuHekQtd
	mDNNDpCbl3poklhqnN31/odwbmhYu7spu+8VcTFui35dn5p/337uyaV3J2z2x42RkolqU/etd4/
	6pE4MwnWDR9hqVGTs1Mz4UvOukJw==
X-Received: by 2002:a05:600c:4818:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-490360bac01mr39835105e9.22.1779385707903;
        Thu, 21 May 2026 10:48:27 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v10 13/13] xen/arm: Add host system suspend backend
Date: Thu, 21 May 2026 20:45:31 +0300
Message-ID: <199d18fdaf027c2df14c4946df1ec98f42c31c70.1779385072.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779385072.git.mykola_kvach@epam.com>
References: <cover.1779385072.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1779385708-2087FF3B-CB26C90E/0/0
X-purgate-type: clean
X-purgate-size: 13984
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:luca.fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xilinx.com:email,system_suspend_tasklet.data:url];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B7D9B5AA8E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Add the Xen-wide suspend/resume backend used after a control-domain
vPSCI SYSTEM_SUSPEND request has been accepted. The vPSCI policy,
runtime driver blockers and control-domain sequencing checks are handled
by the preceding commit; this change adds the code that actually drives
the host suspend attempt.

The backend runs from a tasklet scheduled on pCPU0, because non-boot CPUs
are disabled during suspend. It freezes domains, disables the scheduler
and then disables non-boot CPUs.

Host-side suspend participants are handled in phases. IOMMU and console
state are suspended first. Local IRQs are then disabled before suspending
timer and GIC state. On resume or failure, the completed suspend phases
are unwound in reverse: GIC and timer state are restored while IRQs are
still disabled, local IRQs are restored, and then console and IOMMU state
are restored.

On boot, init_ttbr is normally initialized during secondary CPU hotplug.
On uniprocessor systems this can leave init_ttbr uninitialized, so set it
from the boot CPU before entering suspend.

Note: the code is behind CONFIG_SYSTEM_SUSPEND. On ARM64 this is currently
only available when HAS_SYSTEM_SUSPEND is selected, which requires
UNSUPPORTED to be set and MPU to be unset.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V10:
- Re-apply boot CPU local errata/workaround handling after SYSTEM_SUSPEND,
  before resuming the rest of the host suspend path.
- Move set_init_ttbr() declaration to asm/mmu/mm.h, since it is
  MMU-specific.

Changes in V9:
- Split vPSCI availability policy, runtime host-suspend blockers and the
  domain-readiness precheck into the preceding commit.
- Trigger the host suspend backend from the control-domain SYSTEM_SUSPEND
  path.
- Reorder the host suspend/resume phases so the timer is suspended with
  local IRQs disabled and local IRQs are restored after the GIC and timer
  resume paths, before the console and IOMMU resume paths.
- Move HAS_HWDOM_SYSTEM_SUSPEND and related logic to policy patch.

Changes in V8:
- Add a pre-suspend check in system_suspend() after scheduler_disable() to
  require all domains to be in the shut down state with SHUTDOWN_suspend
  before proceeding with the global suspend flow.
- Drop the common-level depends on !ARM_64 || !SYSTEM_SUSPEND from
  CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND and model the ARM64 suspend case
  with an arch-selected capability instead.
- Rename CONFIG_HAS_HWDOM_SHUTDOWN_ON_SUSPEND to
  CONFIG_HAS_HWDOM_SYSTEM_SUSPEND.
- Rename need_hwdom_shutdown() to want_hwdom_shutdown().

Changes in V7:
- Control domain is responsible for host suspend.
- Add an empty inline host_system_suspend() function when SYSTEM_SUSPEND
  config is disabled.
- Use IS_ENABLED() for config checking instead of #ifdef.
- Replace #ifdef checks in domain_shutdown() with IS_ENABLED() to simplify
  control flow.
- Factor hardware domain shutdown condition into a helper
  (need_hwdom_shutdown()) to avoid preprocessor directives inside the
  function.
- Squash with iommu suspend/resume commit.
---
 xen/arch/arm/Kconfig                 |   1 +
 xen/arch/arm/cpuerrata.c             |   7 +-
 xen/arch/arm/include/asm/cpuerrata.h |   1 +
 xen/arch/arm/include/asm/mmu/mm.h    |   2 +
 xen/arch/arm/include/asm/suspend.h   |   2 +
 xen/arch/arm/mmu/smpboot.c           |   2 +-
 xen/arch/arm/suspend.c               | 156 +++++++++++++++++++++++++++
 xen/arch/arm/vpsci.c                 |  10 +-
 8 files changed, 177 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 54a5bfb9ae..119bc00674 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -9,6 +9,7 @@ config ARM_64
 	select 64BIT
 	select HAS_DOMAIN_TYPE
 	select HAS_FAST_MULTIPLY
+	select HAS_SYSTEM_SUSPEND if !MPU && UNSUPPORTED
 	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
 
 config ARM
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index 17cf134f1b..dd3394345c 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -696,6 +696,11 @@ void check_local_cpu_errata(void)
     update_cpu_capabilities(arm_errata, "enabled workaround for");
 }
 
+int enable_local_cpu_errata_workarounds(void)
+{
+    return enable_nonboot_cpu_caps(arm_errata);
+}
+
 void __init enable_errata_workarounds(void)
 {
     enable_cpu_capabilities(arm_errata);
@@ -732,7 +737,7 @@ static int cpu_errata_callback(struct notifier_block *nfb,
          * fixed to expect an error at CPU_STARTING phase.
          */
         ASSERT(system_state != SYS_STATE_boot);
-        rc = enable_nonboot_cpu_caps(arm_errata);
+        rc = enable_local_cpu_errata_workarounds();
         break;
     default:
         break;
diff --git a/xen/arch/arm/include/asm/cpuerrata.h b/xen/arch/arm/include/asm/cpuerrata.h
index 1799a16d7e..b93521326f 100644
--- a/xen/arch/arm/include/asm/cpuerrata.h
+++ b/xen/arch/arm/include/asm/cpuerrata.h
@@ -5,6 +5,7 @@
 #include <asm/alternative.h>
 
 void check_local_cpu_errata(void);
+int enable_local_cpu_errata_workarounds(void);
 void enable_errata_workarounds(void);
 
 #define CHECK_WORKAROUND_HELPER(erratum, feature, arch)         \
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index 7f4d59137d..ee73a77777 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -110,6 +110,8 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 extern void switch_ttbr(uint64_t ttbr);
 extern void relocate_and_switch_ttbr(uint64_t ttbr);
 
+void set_init_ttbr(lpae_t *root);
+
 #endif /* __ARM_MMU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
index 50dc6e9fdf..889a6509d9 100644
--- a/xen/arch/arm/include/asm/suspend.h
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -41,11 +41,13 @@ int prepare_resume_ctx(void);
 void hyp_resume(void);
 bool host_system_suspend_allowed(void);
 void host_system_suspend_disable(const char *reason);
+void host_system_suspend(struct domain *d);
 
 #else /* !CONFIG_SYSTEM_SUSPEND */
 
 static inline bool host_system_suspend_allowed(void) { return false; }
 static inline void host_system_suspend_disable(const char *reason) {}
+static inline void host_system_suspend(struct domain *d) {}
 
 #endif
 
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
index 98ddd46a47..2e0833a13c 100644
--- a/xen/arch/arm/suspend.c
+++ b/xen/arch/arm/suspend.c
@@ -1,10 +1,18 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <asm/cpuerrata.h>
+#include <asm/cpufeature.h>
+#include <asm/gic.h>
 #include <asm/psci.h>
 #include <asm/suspend.h>
 
+#include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/iommu.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/serial.h>
+#include <xen/tasklet.h>
 
 struct resume_cpu_context resume_cpu_context;
 
@@ -44,6 +52,154 @@ void host_system_suspend_disable(const char *reason)
            reason ? reason : "unsupported suspend/resume path");
 }
 
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
+    console_start_sync();
+    status = iommu_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_end_sync;
+    }
+
+    status = console_suspend();
+    if ( status )
+    {
+        dprintk(XENLOG_ERR, "Failed to suspend the console, err=%d\n", status);
+        system_state = SYS_STATE_resume;
+        goto resume_iommu;
+    }
+
+    local_irq_save(flags);
+
+    time_suspend();
+
+    status = gic_suspend();
+    if ( status )
+    {
+        system_state = SYS_STATE_resume;
+        goto resume_time;
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
+    if ( prepare_resume_ctx() )
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
+
+        system_state = SYS_STATE_resume;
+    }
+    else
+    {
+        system_state = SYS_STATE_resume;
+
+        /*
+         * CPU0 resumes directly from hyp_resume(), bypassing the CPU hotplug
+         * path that re-checks and re-enables errata workarounds for secondary
+         * CPUs.
+         */
+        check_local_cpu_errata();
+        check_local_cpu_features();
+        BUG_ON(enable_local_cpu_errata_workarounds());
+    }
+
+    update_boot_mapping(false);
+
+    gic_resume();
+
+ resume_time:
+    time_resume();
+
+    local_irq_restore(flags);
+
+    console_resume();
+
+ resume_iommu:
+    iommu_resume();
+
+ resume_end_sync:
+    console_end_sync();
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
+
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
index 0bae42c1bd..6e332d6a12 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -237,7 +237,8 @@ static bool domain_in_suspend_state(struct domain *d)
     return suspended;
 }
 
-static int32_t domain_psci_system_suspend_policy(struct domain *d)
+static int32_t domain_psci_system_suspend_policy(struct domain *d,
+                                                 bool *host_suspend)
 {
     struct domain *other;
     bool last_awake_control_domain = true;
@@ -300,6 +301,7 @@ static int32_t domain_psci_system_suspend_policy(struct domain *d)
     if ( !host_system_suspend_allowed() )
         return PSCI_DENIED;
 
+    *host_suspend = true;
     return 0;
 }
 
@@ -310,6 +312,7 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
     struct vcpu *v;
     struct domain *d = current->domain;
     bool is_thumb = epoint & 1;
+    bool host_suspend = false;
     struct resume_info *rctx = &d->arch.resume_ctx;
 
     /* THUMB set is not allowed with 64-bit domain */
@@ -334,7 +337,7 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
 
     spin_lock(&vpsci_system_suspend_lock);
 
-    rc = domain_psci_system_suspend_policy(d);
+    rc = domain_psci_system_suspend_policy(d, &host_suspend);
     if ( !rc )
     {
         rc = domain_shutdown(d, SHUTDOWN_suspend);
@@ -359,6 +362,9 @@ static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
             "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
             epoint, cid);
 
+    if ( host_suspend )
+        host_system_suspend(d);
+
     return rc;
 }
 
-- 
2.43.0


