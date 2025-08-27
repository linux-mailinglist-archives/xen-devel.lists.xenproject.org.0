Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83D3B38B4A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 23:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096965.1451485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urNc4-0003nv-SN; Wed, 27 Aug 2025 21:23:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096965.1451485; Wed, 27 Aug 2025 21:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urNc4-0003lw-OR; Wed, 27 Aug 2025 21:23:24 +0000
Received: by outflank-mailman (input) for mailman id 1096965;
 Wed, 27 Aug 2025 21:23:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4G5n=3H=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1urNc3-0003ij-4d
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 21:23:23 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f3d0366-838c-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 23:23:22 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-333f9160c21so2627631fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 14:23:22 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e2687acsm29844061fa.32.2025.08.27.14.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 14:23:20 -0700 (PDT)
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
X-Inumbo-ID: 0f3d0366-838c-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756329801; x=1756934601; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HWTZqa8Ch1iyLOD4xVTbJ8+odwTHS1AHeFEtVf7LN8=;
        b=j2q6cxEy/k1SYW3GYCxyIiY5WTFKGkXLSLCkWSAo+XeI8FS8Fcp7tyiTik1AD7FbCP
         g3O2BkJAnf490RUqjypjo2rUBh8WPvZGuuETMjqjJcdMEcEn6Nhm39/zyS8W04apJCcL
         LkqxTgUEHiKZbBFmCMWtTxr6p90Jlj406UTDKPm5wh1Q8YzXrCgDxAT4z/fkxMmlo2BI
         kk36UlNUmZ3O3m9INuoLX5Z1CjeI40y2prcyz7nrLqmxneecrVlWPR82DhvFPWScuBhh
         HiKnfPQIXWOK1zuqm8wKY4fndjeUvMXPJDMSqjpkzd7dnIz4EYgNhfBLtLLEDZDPSGZ3
         +h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756329801; x=1756934601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HWTZqa8Ch1iyLOD4xVTbJ8+odwTHS1AHeFEtVf7LN8=;
        b=qLt+/nV6UHBar9Zk+t3G20OdbosRvtpWNl1fUfHI5FAFP6vjuR1pUkLsSKzSKpMLXN
         D2JwyUY9fdGKF3r51gsXuHNdovSiKZphtNB92kkQMfJYVYnr+K3d0pAPyXRNRTgoVfxW
         +PM6MVR3PGIV97a0IaYpp4HdGx7JDj1cexX1CxKsSyWvFExRR9enTb7HvH1PMOPmR7GQ
         U99nTlB5u8x7D6VoGLX4b9H7huB0WvknOir2uLPy3ISgeExXsoqOOHGxK2yNJLIgFvH8
         Mr1mT6RMfEI7tfmUQhdiZgk8jQALDoYJqHhFj7BdbeA11yablGfTw+ossCiSoDb9RwIT
         ojTA==
X-Gm-Message-State: AOJu0YzER6KE3PIN9elqKwJ1zVyRXGU/z80lBZ2qeu5aBSp49othAOb+
	f+rPv6bnKMzdZRHO4jSd1WIzFjvo5lpkklAdI+ZSRzHaowTfLpFikgR+V3AVfQ==
X-Gm-Gg: ASbGncv44qn/vGrg9iYNOO4cB1/NUq9dlY9701iy9XXtUhqCr6LMtmfN1etKwQ77l1h
	x2cl6c6kN3yD81FwWaNOtpY/R6jGXetqa3u14wxCZ/doH+T7Yh5SJSReFqlW3AVGzwqh/6RXSBS
	sQiVEq6rIxvQnN4aR+D/x3j1v3tIUQcn/ZP+8U7Hzz79RHE9jYs9XBJXXpmyeQVqFQZ341LQYv1
	xLe3Dvzjf2G53so7nhHLnG5nveW+prhoM21tP0P6JCbK0aJR6Ac4o1J/OvuLNz4ykwiUknv/M/Y
	6jaXmzw5k9meOnKNy1XkS+8sgGGalIE1aGLFmh2ZG540pYJzMKnpPhlOH94hJ85kCrowv3ShACR
	cte/egScDEijgEfZsjgSllMn7VxxTy34NgIxwrCUqnYPsLgTe/iAwDu2zPznj0Q==
X-Google-Smtp-Source: AGHT+IGgM0L5TMgX1BM+J3KT83nfAnzaxXWzNduMzISMYfM4SUEpN74M2UFZ8j5d4/Eysb/1nIvUzw==
X-Received: by 2002:a05:651c:23c8:10b0:335:2563:c0ec with SMTP id 38308e7fff4ca-33651024391mr50921231fa.33.1756329801130;
        Wed, 27 Aug 2025 14:23:21 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v10 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
Date: Thu, 28 Aug 2025 00:21:33 +0300
Message-ID: <55ff99acd69f9eaf20f077e6b453b54931b541d4.1756329091.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756329091.git.mykola_kvach@epam.com>
References: <cover.1756329091.git.mykola_kvach@epam.com>
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

Additionally, GIC context must be saved when a domain suspends.
LRs are not architecturally preserved across suspend/resume or context
switches, so Xen must explicitly save and restore them. This requirement
is specified in the PSCI specification (DEN0022F.b, section 6.8 "Preserving
the execution context"). The fix is implemented by moving the respective
code in ctxt_switch_from() before the return path taken when the domain
suspends.

Introduce domain_resume_nopause/_helper() to allow resuming a domain from
SYSTEM_SUSPEND without pausing it first. This avoids problematic
domain_pause() calls when resuming from suspend on Arm, particularly in error
paths. The helper is Arm-specific; other architectures continue to use the
original domain_resume().

Usage:

For Linux-based guests, suspend can be initiated with:
    echo mem > /sys/power/state
or via:
    systemctl suspend

Resuming the guest is performed from control domain using:
      xl resume <domain>

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
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
 xen/arch/arm/domain.c                 |  21 +++++-
 xen/arch/arm/include/asm/domain.h     |   2 +
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/vpsci.h      |   2 +-
 xen/arch/arm/vpsci.c                  | 100 ++++++++++++++++++++++----
 xen/common/domain.c                   |  35 +++++++--
 xen/include/xen/sched.h               |   3 +
 8 files changed, 141 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 863ae18157..401106fd67 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -90,6 +90,24 @@ static void ctxt_switch_from(struct vcpu *p)
     if ( is_idle_vcpu(p) )
         return;
 
+    /*
+     * Even if the guest saves and restores its own context, Xen must save
+     * the transient state (such as List Registers) that is not preserved
+     * by hardware across suspend. See PSCI DEN0022F.b, section 6.8
+     * "Preserving the execution context".
+     */
+    gic_save_state(p);
+
+    /*
+     * Skip saving the rest of the context if the VCPU is suspended,
+     * to avoid modifying SCTLR_EL1. This is required by the PSCI
+     * specification, which manages SCTLR_EL1 during SYSTEM_SUSPEND flow.
+     */
+    if ( test_bit(_VPF_suspended, &p->pause_flags) )
+        return;
+
+    isb();
+
     p2m_save_state(p);
 
     /* CP 15 */
@@ -158,9 +176,6 @@ static void ctxt_switch_from(struct vcpu *p)
 
     /* XXX MPU */
 
-    /* VGIC */
-    gic_save_state(p);
-
     isb();
 }
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index a3487ca713..f9577bc9ae 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -312,6 +312,8 @@ static inline void update_guest_memory_policy(struct vcpu *v,
                                               struct guest_memory_policy *gmp)
 {}
 
+void domain_resume_nopause_helper(struct domain *d);
+
 #endif /* __ASM_DOMAIN_H__ */
 
 /*
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
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 7ba9ccd94b..3371f33b81 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -10,28 +10,18 @@
 
 #include <public/sched.h>
 
-static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
-                            register_t context_id)
+static int do_setup_vcpu_ctx(struct vcpu *v, register_t entry_point,
+                      register_t context_id)
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
@@ -197,6 +208,48 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
 
+static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
+{
+    int32_t rc;
+    struct vcpu *v;
+    struct domain *d = current->domain;
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
+    rc = do_setup_vcpu_ctx(current, epoint, cid);
+    if ( rc != PSCI_SUCCESS )
+    {
+        domain_resume_nopause_helper(d);
+        return rc;
+    }
+
+    set_bit(_VPF_suspended, &current->pause_flags);
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
@@ -214,6 +267,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
     case PSCI_0_2_FN32_SYSTEM_OFF:
     case PSCI_0_2_FN32_SYSTEM_RESET:
     case PSCI_1_0_FN32_PSCI_FEATURES:
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
     case ARM_SMCCC_VERSION_FID:
         return 0;
     default:
@@ -344,6 +399,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
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
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 104e917f07..e2371549a0 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1349,16 +1349,10 @@ int domain_shutdown(struct domain *d, u8 reason)
     return 0;
 }
 
-void domain_resume(struct domain *d)
+static void domain_resume_nopause(struct domain *d)
 {
     struct vcpu *v;
 
-    /*
-     * Some code paths assume that shutdown status does not get reset under
-     * their feet (e.g., some assertions make this assumption).
-     */
-    domain_pause(d);
-
     spin_lock(&d->shutdown_lock);
 
     d->is_shutting_down = d->is_shut_down = 0;
@@ -1366,13 +1360,40 @@ void domain_resume(struct domain *d)
 
     for_each_vcpu ( d, v )
     {
+        /*
+         * No need to conditionally clear _VPF_suspended here:
+         * - This bit is only set on Arm, and only after a successful suspend.
+         * - domain_resume_nopause() may also be called from paths other than
+         *   the suspend/resume flow, such as "soft-reset" actions (e.g.,
+         *   on_poweroff), as part of the Xenstore control/shutdown protocol.
+         *   These require guest acknowledgement to complete the operation.
+         * So clearing the bit unconditionally is safe.
+         */
+        clear_bit(_VPF_suspended, &v->pause_flags);
+
         if ( v->paused_for_shutdown )
             vcpu_unpause(v);
         v->paused_for_shutdown = 0;
     }
 
     spin_unlock(&d->shutdown_lock);
+}
 
+#ifdef CONFIG_ARM
+void domain_resume_nopause_helper(struct domain *d)
+{
+    domain_resume_nopause(d);
+}
+#endif
+
+void domain_resume(struct domain *d)
+{
+    /*
+     * Some code paths assume that shutdown status does not get reset under
+     * their feet (e.g., some assertions make this assumption).
+     */
+    domain_pause(d);
+    domain_resume_nopause(d);
     domain_unpause(d);
 }
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 02bdc256ce..12429d16b9 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1014,6 +1014,9 @@ static inline struct domain *next_domain_in_cpupool(
 /* VCPU is parked. */
 #define _VPF_parked          8
 #define VPF_parked           (1UL<<_VPF_parked)
+/* VCPU is suspended. */
+#define _VPF_suspended       9
+#define VPF_suspended        (1UL << _VPF_suspended)
 
 static inline bool vcpu_runnable(const struct vcpu *v)
 {
-- 
2.48.1


