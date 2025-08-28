Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC3CB3A2C7
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 16:54:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099032.1452957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ure1B-0007Cv-31; Thu, 28 Aug 2025 14:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099032.1452957; Thu, 28 Aug 2025 14:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ure1A-00077C-Ua; Thu, 28 Aug 2025 14:54:24 +0000
Received: by outflank-mailman (input) for mailman id 1099032;
 Thu, 28 Aug 2025 14:54:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mimg=3I=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ure18-00074Y-V8
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 14:54:23 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0ef5779-841e-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 16:54:20 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-55f53efe803so1299038e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 07:54:20 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f42101509sm2635661e87.106.2025.08.28.07.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 07:54:18 -0700 (PDT)
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
X-Inumbo-ID: e0ef5779-841e-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756392860; x=1756997660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4lER6DNHsySwTielX62U8g1kuJabDKfu70gF2FH154=;
        b=QxshJCM6sEhi2A17ECx8ZlkdQeqoV/P2rR5vhvimhvfvozs5lSIsUh2v9ea/MsBUb4
         pCZw3PVJch27ZdZ0y6EEImz0CFbgrNLxBQr+ByXCUDbte+T5TA1qyl0pps1YWe+8SQOZ
         2BPL2lvYD63sP2poooEkozLdfhG2KCGxiugRBaZryqWdH9Cm7j2Ue2o8sN0Fld7qA7qp
         WHGKCg3H0AGxUdrccjmtSXB9qtjbGRVNs79gIe1VKPyGR3LZf7gf5/NbWz11lzSP4ygm
         GVM5PPYReoaxlFtFtiRrNYh/KsZCB/EixHvwxqZj2hnqgI5xZ8TX5knBzQ6c8oZOj53V
         GvBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756392860; x=1756997660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S4lER6DNHsySwTielX62U8g1kuJabDKfu70gF2FH154=;
        b=LQcq+hiICcIC6xkHJEV3D/cuRdEAL28TmOZb1MwIxswEJ6wdhk66wXXvfiyp5n3aBX
         K8vP6bIelRgL/rS3PO895mtt8nDLIKmyg5q2FA7DW9hEomOa9fdUviVkXOY70zRQvHEH
         bbfKkqORa80Me7MYmTKiuRdwRwIHkyGQEXZCgJI8JnulLAt3jTWGbxkTbL1nmZHO2hM6
         SibLGSfuOcN2iYz1hHnmi3Tqcp/D8WALvJR4FarIis1XL5kYbOB7CHLMTfa8+ZPfAPBg
         inOJhWiM7EZbwWHxmMOzyAbvMxonFJdXBOIbiGfWAgxikJQiuJ2Vbw1qQbxsr98xvwEN
         A7Vg==
X-Gm-Message-State: AOJu0YwBjWFgtk6oV+PSDhUZ1gcCM0cEwtQRgulLH2pVjHl8fRvRK31N
	XI7Ypmo8oH/iOxAsjaQBAcCAXrDILuwgq7EhdifO07pzGshZfXEoxtk3nrvIoA==
X-Gm-Gg: ASbGncuCG0Pl/zcPzy+ZfPIcz1uvP2XjrrHBkBdTL94pz4US9gp9ofHS4+cjhUaFvIM
	rI2UV22wfQ3XpxS2JmwB232CSr4fS02+VGRDBvfJ41h0uSXSU+pTdk1XPBX1Ytkrw6cGdUjH2rh
	Juv7Xp9EkKJz5NZLFj/BjkU1ilViyXs8mm4n63LlNxTxstWwRrTThH4ujjPshY78pyso2S0/GlV
	nzgf3NLYLDJmQgn6tO0fiTMcBndQDe/yunqMszYCPCzEcPfuRhfw3jqfHHZfCM4EEcKXjXKzHfQ
	vrDnRK77NyvQGUGe6RZ0LhzHqqu3kLNJBjBT0obzaDWSVSzaySZ8RelvsAVovjH0offt2HQZwOs
	zrG1LDHOw2Gu+8oojQ1SmbS+kMyXv40NKQzIqe+wJF1vp6IV8IPx9vpRQLLCbjOEcFGdJcxox
X-Google-Smtp-Source: AGHT+IHtUeIVd/8Nbo5GH96HIPV40RpO2yd2qVsB7lrX/xGBFur/Av92L5jW1fRdTQ/fydSa8/ibPA==
X-Received: by 2002:a05:6512:3d87:b0:55f:3d7c:387b with SMTP id 2adb3069b0e04-55f3d7c3badmr5706905e87.12.1756392859434;
        Thu, 28 Aug 2025 07:54:19 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
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
Subject: [PATCH v11 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
Date: Thu, 28 Aug 2025 17:54:04 +0300
Message-ID: <bb53d9911b00879c7b25f5258d0e3e48005671f9.1756392094.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756392094.git.mykola_kvach@epam.com>
References: <cover.1756392094.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
allowing guests to request suspend via the PSCI v1.0 SYSTEM_SUSPEND call
(both 32-bit and 64-bit variants).

Implementation details:
- Add SYSTEM_SUSPEND function IDs to PSCI definitions
- Trap and handle SYSTEM_SUSPEND in vPSCI
- Allow only non-hardware domains to invoke SYSTEM_SUSPEND; return
  PSCI_NOT_SUPPORTED for the hardware domain to avoid halting the system
  in hwdom_shutdown() via domain_shutdown
- Require all secondary VCPUs of the calling domain to be offline before
  suspend, as mandated by the PSCI specification

The arch_domain_resume() function is an architecture-specific hook that is
invoked during domain resume to perform any necessary setup or restoration
steps required by the platform.

The new vpsci_vcpu_up_prepare() helper is called on the resume path to set up
the vCPU context (such as entry point, some system regs and context ID) before
resuming a suspended guest. This keeps ARM/vPSCI-specific logic out of common
code and avoids intrusive changes to the generic resume flow.

Usage:

For Linux-based guests, suspend can be initiated with:
    echo mem > /sys/power/state
or via:
    systemctl suspend

Resuming the guest is performed from control domain using:
      xl resume <domain>

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V11:
- introduce arch_domain_resume() and vpsci_vcpu_up_prepare(), which are now
called on the resume path to avoid extra modifications to common code.
The vCPU context is now updated during domain resume.

Changes in V10:
- small changes to the commit message reflect updates introduced in this
  version of the patch.
- Comments are improved, clarified, and expanded, especially regarding PSCI
  requirements and context handling.
- An ARM-specific helper (domain_resume_nopause_helper)
- gprintk() and PRIregister are used for logging in vPSCI code.
- An isb() is added before p2m_save_state
- The is_64bit_domain check is dropped when masking the upper part of entry
  point and cid for SMC32 SYSTEM_SUSPEND PSCI calls

Changes in V9:
- no functional changes
- cosmetic chnages after review
- enhance commit message and add extra comment to the code after review

Changes in V8:
- GIC and virtual timer context must be saved when the domain suspends
- rework locking
- minor changes after code review

Changes in V7:
- add proper locking
- minor changes after code review

Changes in V6:
- skip execution of ctxt_switch_from for vcpu that is in paused domain
- add implementation of domain_resume without domain_pause
- add helper function to determine if vcpu is suspended or not
- ignore upper 32 bits of argument values when the domain is 64-bit
  and calls the SMC32 SYSTEM_SUSPEND function
- cosmetic changes after review

Changes in V5:
- don't use standby mode, restore execution in a provided by guest point
- move checking that all CPUs, except current one, are offline to after
  pausing the vCPUs
- provide ret status from arch_domain_shutdown and handle it in
  domain_shutdown
- adjust VPSCI_NR_FUNCS to reflect the number of newly added PSCI functions

Changes in V4:
Dropped all changes related to watchdog, domain is marked as shutting
down in domain_shutdown and watchdog timeout handler won't trigger
because of it.

Previous versions included code to manage Xen watchdog timers during suspend,
but this was removed. When a guest OS starts the Xen watchdog (either via the
kernel driver or xenwatchdogd), it is responsible for managing that state
across suspend/resume. On Linux, the Xen kernel driver properly stops the
watchdog during suspend. However, when xenwatchdogd is used instead, suspend
handling is incomplete, potentially leading to watchdog-triggered resets on
resume. Xen leaves watchdog handling to the guest OS and its services.

Dropped all changes related to VCPU context, because instead domain_shutdown
is used, so we don't need any extra changes for suspending domain.

Changes in V3:
Dropped all domain flags and related code (which touched common functions like
vcpu_unblock), keeping only the necessary changes for Xen suspend/resume, i.e.
suspend/resume is now fully supported only for the hardware domain.
Proper support for domU suspend/resume will be added in a future patch.
This patch does not yet include VCPU context reset or domain context
restoration in VCPU.
---
 xen/arch/arm/domain.c                 |  22 +++++
 xen/arch/arm/include/asm/domain.h     |   6 ++
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/vpsci.h      |   5 +-
 xen/arch/arm/vpsci.c                  | 114 +++++++++++++++++++++-----
 xen/arch/ppc/stubs.c                  |   5 ++
 xen/arch/riscv/stubs.c                |   5 ++
 xen/arch/x86/domain.c                 |   5 ++
 xen/common/domain.c                   |   9 ++
 xen/include/xen/domain.h              |   2 +
 11 files changed, 156 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 863ae18157..6fd73eedde 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -12,6 +12,8 @@
 #include <xen/softirq.h>
 #include <xen/wait.h>
 
+#include <public/sched.h>
+
 #include <asm/arm64/sve.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
@@ -27,6 +29,7 @@
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
+#include <asm/vpsci.h>
 #include <asm/vtimer.h>
 
 #include "vpci.h"
@@ -880,6 +883,25 @@ void arch_domain_creation_finished(struct domain *d)
     p2m_domain_creation_finished(d);
 }
 
+int arch_domain_resume(struct domain *d)
+{
+    int rc;
+    typeof(d->arch.resume_ctx) *ctx = &d->arch.resume_ctx;
+
+    if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
+    {
+        dprintk(XENLOG_WARNING,
+                "%pd: Invalid domain state for resume: is_shutting_down=%d, shutdown_code=%d\n",
+                d, d->is_shutting_down, d->shutdown_code);
+        return -EINVAL;
+    }
+
+    rc = vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
+    memset(ctx, 0, sizeof(*ctx));
+
+    return rc;
+}
+
 static int is_guest_pv32_psr(uint32_t psr)
 {
     switch (psr & PSR_MODE_MASK)
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index a3487ca713..68185fc4d6 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -121,6 +121,12 @@ struct arch_domain
     void *tee;
 #endif
 
+    struct resume_info {
+        register_t ep;
+        register_t cid;
+        struct vcpu *wake_cpu;
+    } resume_ctx;
+
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
index effd25b69e..8dfcac7e3b 100644
--- a/xen/arch/arm/include/asm/perfc_defn.h
+++ b/xen/arch/arm/include/asm/perfc_defn.h
@@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_reset")
 PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
 PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
 PERFCOUNTER(vpsci_features,            "vpsci: features")
+PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
 
 PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
 
diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index 4780972621..48a93e6b79 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -47,10 +47,12 @@ void call_psci_system_reset(void);
 #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
 #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
 #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
+#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
 
 #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
 #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
 #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
+#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
 
 /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
 #define PSCI_0_2_AFFINITY_LEVEL_ON      0
diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/vpsci.h
index 0cca5e6830..d790ab3715 100644
--- a/xen/arch/arm/include/asm/vpsci.h
+++ b/xen/arch/arm/include/asm/vpsci.h
@@ -23,12 +23,15 @@
 #include <asm/psci.h>
 
 /* Number of function implemented by virtual PSCI (only 0.2 or later) */
-#define VPSCI_NR_FUNCS  12
+#define VPSCI_NR_FUNCS  14
 
 /* Functions handle PSCI calls from the guests */
 bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
 bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid);
 
+int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
+                          register_t context_id);
+
 #endif /* __ASM_VPSCI_H__ */
 
 /*
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 7ba9ccd94b..50cf5fd96c 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -10,30 +10,16 @@
 
 #include <public/sched.h>
 
-static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
-                            register_t context_id)
+int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
+                   register_t context_id)
 {
-    struct vcpu *v;
-    struct domain *d = current->domain;
-    struct vcpu_guest_context *ctxt;
     int rc;
+    struct domain *d = current->domain;
     bool is_thumb = entry_point & 1;
-    register_t vcpuid;
-
-    vcpuid = vaffinity_to_vcpuid(target_cpu);
-
-    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
-        return PSCI_INVALID_PARAMETERS;
-
-    /* THUMB set is not allowed with 64-bit domain */
-    if ( is_64bit_domain(d) && is_thumb )
-        return PSCI_INVALID_ADDRESS;
-
-    if ( !test_bit(_VPF_down, &v->pause_flags) )
-        return PSCI_ALREADY_ON;
+    struct vcpu_guest_context *ctxt;
 
     if ( (ctxt = alloc_vcpu_guest_context()) == NULL )
-        return PSCI_DENIED;
+        return -ENOMEM;
 
     vgic_clear_pending_irqs(v);
 
@@ -76,8 +62,37 @@ static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
     free_vcpu_guest_context(ctxt);
 
     if ( rc < 0 )
+        return rc;
+
+    return 0;
+}
+
+static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
+                            register_t context_id)
+{
+    struct vcpu *v;
+    struct domain *d = current->domain;
+    int rc;
+    bool is_thumb = entry_point & 1;
+    register_t vcpuid;
+
+    vcpuid = vaffinity_to_vcpuid(target_cpu);
+
+    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
+        return PSCI_INVALID_PARAMETERS;
+
+    /* THUMB set is not allowed with 64-bit domain */
+    if ( is_64bit_domain(d) && is_thumb )
+        return PSCI_INVALID_ADDRESS;
+
+    if ( !test_bit(_VPF_down, &v->pause_flags) )
+        return PSCI_ALREADY_ON;
+
+    rc = vpsci_vcpu_up_prepare(v, entry_point, context_id);
+    if ( rc )
         return PSCI_DENIED;
 
+    vgic_clear_pending_irqs(v);
     vcpu_wake(v);
 
     return PSCI_SUCCESS;
@@ -197,6 +212,48 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
 
+static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
+{
+    int32_t rc;
+    struct vcpu *v;
+    struct domain *d = current->domain;
+    bool is_thumb = epoint & 1;
+
+    /* THUMB set is not allowed with 64-bit domain */
+    if ( is_64bit_domain(d) && is_thumb )
+        return PSCI_INVALID_ADDRESS;
+
+    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
+    if ( is_hardware_domain(d) )
+        return PSCI_NOT_SUPPORTED;
+
+    /* Ensure that all CPUs other than the calling one are offline */
+    domain_lock(d);
+    for_each_vcpu ( d, v )
+    {
+        if ( v != current && is_vcpu_online(v) )
+        {
+            domain_unlock(d);
+            return PSCI_DENIED;
+        }
+    }
+    domain_unlock(d);
+
+    rc = domain_shutdown(d, SHUTDOWN_suspend);
+    if ( rc )
+        return PSCI_DENIED;
+
+    d->arch.resume_ctx.ep = epoint;
+    d->arch.resume_ctx.cid = cid;
+    d->arch.resume_ctx.wake_cpu = current;
+
+    gprintk(XENLOG_DEBUG,
+            "SYSTEM_SUSPEND requested, epoint=0x%"PRIregister", cid=0x%"PRIregister,
+            epoint, cid);
+
+    return rc;
+}
+
 static int32_t do_psci_1_0_features(uint32_t psci_func_id)
 {
     /* /!\ Ordered by function ID and not name */
@@ -214,6 +271,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
     case PSCI_0_2_FN32_SYSTEM_OFF:
     case PSCI_0_2_FN32_SYSTEM_RESET:
     case PSCI_1_0_FN32_PSCI_FEATURES:
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
     case ARM_SMCCC_VERSION_FID:
         return 0;
     default:
@@ -344,6 +403,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
         return true;
     }
 
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
+    {
+        register_t epoint = PSCI_ARG(regs, 1);
+        register_t cid = PSCI_ARG(regs, 2);
+
+        if ( fid == PSCI_1_0_FN32_SYSTEM_SUSPEND )
+        {
+            epoint &= GENMASK(31, 0);
+            cid &= GENMASK(31, 0);
+        }
+
+        perfc_incr(vpsci_system_suspend);
+        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
+        return true;
+    }
+
     default:
         return false;
     }
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index bdaf474c5c..0db0627b5c 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -224,6 +224,11 @@ void arch_domain_creation_finished(struct domain *d)
     BUG_ON("unimplemented");
 }
 
+int arch_domain_resume(struct domain *d)
+{
+    return 0;
+}
+
 int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 1a8c86cd8d..52532ae14d 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -198,6 +198,11 @@ void arch_domain_creation_finished(struct domain *d)
     BUG_ON("unimplemented");
 }
 
+int arch_domain_resume(struct domain *d)
+{
+    return 0;
+}
+
 int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 19fd86ce88..94a06bc697 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1138,6 +1138,11 @@ void arch_domain_creation_finished(struct domain *d)
         hvm_domain_creation_finished(d);
 }
 
+int arch_domain_resume(struct domain *d)
+{
+    return 0;
+}
+
 #ifdef CONFIG_COMPAT
 #define xen_vcpu_guest_context vcpu_guest_context
 #define fpu_ctxt fpu_ctxt.x
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 104e917f07..d73a88ced5 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1352,6 +1352,7 @@ int domain_shutdown(struct domain *d, u8 reason)
 void domain_resume(struct domain *d)
 {
     struct vcpu *v;
+    int rc;
 
     /*
      * Some code paths assume that shutdown status does not get reset under
@@ -1359,6 +1360,14 @@ void domain_resume(struct domain *d)
      */
     domain_pause(d);
 
+    rc = arch_domain_resume(d);
+    if ( rc )
+    {
+        domain_unpause(d);
+        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
+        return;
+    }
+
     spin_lock(&d->shutdown_lock);
 
     d->is_shutting_down = d->is_shut_down = 0;
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index e10baf2615..5f77ffadf1 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -109,6 +109,8 @@ int arch_domain_soft_reset(struct domain *d);
 
 void arch_domain_creation_finished(struct domain *d);
 
+int arch_domain_resume(struct domain *d);
+
 void arch_p2m_set_access_required(struct domain *d, bool access_required);
 
 int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c);
-- 
2.48.1


