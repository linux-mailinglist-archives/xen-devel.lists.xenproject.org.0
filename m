Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A665AEB56B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 12:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027509.1402150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV6gV-0003XV-Jv; Fri, 27 Jun 2025 10:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027509.1402150; Fri, 27 Jun 2025 10:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV6gV-0003VM-E3; Fri, 27 Jun 2025 10:51:55 +0000
Received: by outflank-mailman (input) for mailman id 1027509;
 Fri, 27 Jun 2025 10:51:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61Re=ZK=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uV6gU-0002k5-1O
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 10:51:54 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b900e327-5344-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 12:51:47 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-32b49ac6431so17205961fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jun 2025 03:51:47 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32cd2dea1c0sm5235831fa.3.2025.06.27.03.51.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 03:51:45 -0700 (PDT)
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
X-Inumbo-ID: b900e327-5344-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751021507; x=1751626307; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lovaqz97Yz4C4ZS/M20yvmKKYHwyYhdSKNbqE+LHAXs=;
        b=aIdVh9Z8xCRfZPzxbVhXl2K/FhqpuyUOaWcJGm+nbmSxtn1mhLU4dymXDyRTP4LJ2t
         1Imt5bXaVH5I7EJ84B6YmUuOdBu+jI4udrI53jNvMN5ZiHFPULFBpxnbHtDGXDRK8RZi
         X9gzE79SwMnALUmxU/60qOn7LiFQfT0FDJld/nUzHr8/8UXlNzBAz94ZoZpjwxEIS7QL
         JCAri1Nt9ksI2bDGGg3zyy5Qehl2wqznCC0oJI5im24cacOGj2WC49mOHYOv8wxjkj/0
         gOHZ2ExlTaLPXhTbhUzyO798RY1RvxYobVWRbXPy1SHbDF3HTGIfQm8gJSh1+Nffihys
         eSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751021507; x=1751626307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lovaqz97Yz4C4ZS/M20yvmKKYHwyYhdSKNbqE+LHAXs=;
        b=bNlSR2asW6HRVK2Ttbls7Zygf7SNT7cDiZFOb5uMhzHtrfq41NhwmqjnCRoBhrCMu7
         IPtTfyCMYms6VJG9YuHez/2Mxt4Jk8/L5cm/HWA1+9VBloEm8j4PgkVuT3V3YmYj04h9
         XJGcv6j9wP1Lb3jFS2hXQQqu6esV4tEgLSUPQJlNlOHteDp4fg900jQGF4YweGOfRtjt
         HAmCwj5b4+xbCIE+ysyocWO3mSfNbRH/eHe9Uc3cR7q+Pu7TUwIkgwtlfUV2oWPz9W/I
         /yq+jht/PtSv1GgXWw1cRpQPQHT1vph5IgzccoTpxqxINTqGSbNj3ttm77jrn+yT8fah
         Yyhg==
X-Gm-Message-State: AOJu0Yxi9wUb7AjFh807Rg4+1bBImXo0iLRm1ykP0iW57MPHteuoPDoA
	O8T0xebj80MObid1vlsC7W4/HUjH2j2+gwRkFB67a42C3YdekKByhm2BVMMeuM05
X-Gm-Gg: ASbGncvZHlNm5xx/KcFzFFUKLYPEnE+lGCwxOt36DO7dC0HglgIG8AIlZp2bXhudCLA
	ONVA1436zGf778V2s3M7z4JCRO3kUf9eeX7CypyHzioCilJ59oha5VsAG0RAKXmOLmNqGR+9E2/
	qgg0ak02mGE2lGuimKnLNgH0Inf4LfCHIDO0KiVITG97YJ/JcGWZdjPFlqVaa6CPbjoB00FSV1A
	JC4tqHaokybGetzwOgk1a5fPVjGETMaZuDH+p2spOOdiPuvFBFuRQFGy+U1oD80nxUE3Uqi16Fb
	6OAOKFMTPNlVb8LUaH66DCT5Y+PaZskh+zxfAV+Yz00YOWJwE0P4WwRrajKz+GNKvv3zg+6Mv7E
	GmTTntpUmxicEbBHemPW2/4lfZw==
X-Google-Smtp-Source: AGHT+IE+AWmr/h1Db222u088W/zHOH1XMPOY1hr6Gerf2Dgjl13Ny0bypbRnPn8rL5wufyNsQgk8Yg==
X-Received: by 2002:a05:651c:40d6:b0:32c:a097:41a8 with SMTP id 38308e7fff4ca-32cdc499336mr4607691fa.12.1751021506395;
        Fri, 27 Jun 2025 03:51:46 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
Date: Fri, 27 Jun 2025 13:51:30 +0300
Message-ID: <072270e0940b6bcc2743d56a336363f4719ba60a.1751020456.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1751020456.git.mykola_kvach@epam.com>
References: <cover.1751020456.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This patch adds support for the PSCI SYSTEM_SUSPEND function in the vPSCI
(virtual PSCI) interface, allowing guests to request suspend via the PSCI
v1.0 SYSTEM_SUSPEND call (both 32-bit and 64-bit variants).

The implementation:
- Adds SYSTEM_SUSPEND function IDs to PSCI definitions
- Implements trapping and handling of SYSTEM_SUSPEND in vPSCI
- Allows only non-hardware domains to invoke SYSTEM_SUSPEND; for the
  hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting the
  system in hwdom_shutdown() called from domain_shutdown
- Ensures all secondary VCPUs of the calling domain are offline before
  allowing suspend due to PSCI spec
- the domain is shut down with SHUTDOWN_suspend, and resumes execution at
  the address provided during suspend by guest

Usage:

For Linux-based guests, suspend can be initiated with:
    echo mem > /sys/power/state
or via:
    systemctl suspend

Resuming the guest is performed from control domain using:
      xl resume <domain>

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
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
 xen/arch/arm/include/asm/perfc_defn.h |  1 +
 xen/arch/arm/include/asm/psci.h       |  2 +
 xen/arch/arm/include/asm/vpsci.h      |  2 +-
 xen/arch/arm/mmu/p2m.c                |  6 +-
 xen/arch/arm/vpsci.c                  | 96 +++++++++++++++++++++++----
 5 files changed, 92 insertions(+), 15 deletions(-)

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
index 0cca5e6830..69d40f9d7f 100644
--- a/xen/arch/arm/include/asm/vpsci.h
+++ b/xen/arch/arm/include/asm/vpsci.h
@@ -23,7 +23,7 @@
 #include <asm/psci.h>
 
 /* Number of function implemented by virtual PSCI (only 0.2 or later) */
-#define VPSCI_NR_FUNCS  12
+#define VPSCI_NR_FUNCS  14
 
 /* Functions handle PSCI calls from the guests */
 bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
diff --git a/xen/arch/arm/mmu/p2m.c b/xen/arch/arm/mmu/p2m.c
index 67296dabb5..f9c09a49e2 100644
--- a/xen/arch/arm/mmu/p2m.c
+++ b/xen/arch/arm/mmu/p2m.c
@@ -6,6 +6,8 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 
+#include <public/sched.h>
+
 #include <asm/alternative.h>
 #include <asm/event.h>
 #include <asm/flushtlb.h>
@@ -198,7 +200,9 @@ void dump_p2m_lookup(struct domain *d, paddr_t addr)
  */
 void p2m_save_state(struct vcpu *p)
 {
-    p->arch.sctlr = READ_SYSREG(SCTLR_EL1);
+    if ( !(p->domain->is_shutting_down &&
+           p->domain->shutdown_code == SHUTDOWN_suspend) )
+        p->arch.sctlr = READ_SYSREG(SCTLR_EL1);
 
     if ( cpus_have_const_cap(ARM64_WORKAROUND_AT_SPECULATE) )
     {
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 7ba9ccd94b..c6b9ac1fc8 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -10,28 +10,18 @@
 
 #include <public/sched.h>
 
-static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
+static int do_setup_vcpu_ctx(struct vcpu *v, register_t entry_point,
                             register_t context_id)
 {
-    struct vcpu *v;
     struct domain *d = current->domain;
     struct vcpu_guest_context *ctxt;
     int rc;
     bool is_thumb = entry_point & 1;
-    register_t vcpuid;
-
-    vcpuid = vaffinity_to_vcpuid(target_cpu);
-
-    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
-        return PSCI_INVALID_PARAMETERS;
 
     /* THUMB set is not allowed with 64-bit domain */
     if ( is_64bit_domain(d) && is_thumb )
         return PSCI_INVALID_ADDRESS;
 
-    if ( !test_bit(_VPF_down, &v->pause_flags) )
-        return PSCI_ALREADY_ON;
-
     if ( (ctxt = alloc_vcpu_guest_context()) == NULL )
         return PSCI_DENIED;
 
@@ -78,11 +68,32 @@ static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
     if ( rc < 0 )
         return PSCI_DENIED;
 
-    vcpu_wake(v);
-
     return PSCI_SUCCESS;
 }
 
+static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
+                            register_t context_id)
+{
+    int rc;
+    struct vcpu *v;
+    struct domain *d = current->domain;
+    register_t vcpuid;
+
+    vcpuid = vaffinity_to_vcpuid(target_cpu);
+
+    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
+        return PSCI_INVALID_PARAMETERS;
+
+    if ( !test_bit(_VPF_down, &v->pause_flags) )
+        return PSCI_ALREADY_ON;
+
+    rc = do_setup_vcpu_ctx(v, entry_point, context_id);
+    if ( rc == PSCI_SUCCESS )
+        vcpu_wake(v);
+
+    return rc;
+}
+
 static int32_t do_psci_cpu_on(uint32_t vcpuid, register_t entry_point)
 {
     int32_t ret;
@@ -197,6 +208,52 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
 
+static void do_resume_on_error(struct domain *d)
+{
+    struct vcpu *v;
+
+    spin_lock(&d->shutdown_lock);
+
+    d->is_shutting_down = d->is_shut_down = 0;
+    d->shutdown_code = SHUTDOWN_CODE_INVALID;
+
+    for_each_vcpu ( d, v )
+    {
+        if ( v->paused_for_shutdown )
+            vcpu_unpause(v);
+        v->paused_for_shutdown = 0;
+    }
+
+    spin_unlock(&d->shutdown_lock);
+}
+
+static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
+{
+    int ret;
+    struct vcpu *v;
+    struct domain *d = current->domain;
+
+    /* Drop this check once SYSTEM_SUSPEND is supported in hardware domain */
+    if ( is_hardware_domain(d) )
+        return PSCI_NOT_SUPPORTED;
+
+    domain_shutdown(d, SHUTDOWN_suspend);
+
+    /* Ensure that all CPUs other than the calling one are offline */
+    for_each_vcpu ( d, v )
+        if ( v != current && is_vcpu_online(v) )
+        {
+            do_resume_on_error(d);
+            return PSCI_DENIED;
+        }
+
+    ret = do_setup_vcpu_ctx(current, epoint, cid);
+    if ( ret != PSCI_SUCCESS )
+        do_resume_on_error(d);
+
+    return ret;
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
@@ -344,6 +403,17 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
         return true;
     }
 
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
+    {
+        register_t epoint = PSCI_ARG(regs,1);
+        register_t cid = PSCI_ARG(regs,2);
+
+        perfc_incr(vpsci_system_suspend);
+        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
+        return true;
+    }
+
     default:
         return false;
     }
-- 
2.48.1


