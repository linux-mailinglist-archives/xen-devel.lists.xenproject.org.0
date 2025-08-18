Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17492B29CB1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085663.1443973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvZ7-0006Ks-S5; Mon, 18 Aug 2025 08:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085663.1443973; Mon, 18 Aug 2025 08:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvZ7-0006Hi-Oc; Mon, 18 Aug 2025 08:50:05 +0000
Received: by outflank-mailman (input) for mailman id 1085663;
 Mon, 18 Aug 2025 08:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFvU=26=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1unvZ6-0005gf-Be
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:50:04 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53403469-7c10-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 10:50:00 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-55ce526ac04so3694222e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:50:00 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351579sm1571950e87.4.2025.08.18.01.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 01:49:58 -0700 (PDT)
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
X-Inumbo-ID: 53403469-7c10-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755506999; x=1756111799; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+ft2nxvGpA3g1oU8oVhQcdEX9Ksnti8I9PxrIQBz08=;
        b=O7D4Snm7XdLNJLm43Rx+PfkfUfsxvhFlzobm2E3qnVnmmAcvzGIdeLmmdrlEGShAo6
         Dw4+kAsYULjuYD02ZFQ800URwXQUSE/fGPmWs/XIf7GajWJEnwKJP6tVkG3LSGJdf4IN
         YjyKNbDkKve6nZddaM5dsg1tFdEBQPn+afx7HcUim4m0eGtX7at/C4j3BEyYrCPTs5uz
         2in1nrlWZa+ZumDfvqQsQRo2UvP5VTQNDmJnQHEAdIcOZR9orRXzxTfAF2a9rsJtTBwv
         w1WA5T017M5pq8xLka01RNTyTrmeUkO2rgETZs3ocxtxfkl2VYzY5yfgoSbfsAXj/gcn
         HFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755506999; x=1756111799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+ft2nxvGpA3g1oU8oVhQcdEX9Ksnti8I9PxrIQBz08=;
        b=QsKLfDG31MRLVP/77AQUd4teLcIb8Z0QQ+y9nnFMuv2V6ZDdQ/p4tFc/piZjfeBREM
         uVGg7+nquz1K4y0yRRJnuuOiI01izdCQ1/HGaaWXuouYfLfPWMMx2R+wPBoCMpYIYrEM
         7SGQRbxUYw3JvjKa4dKds7tcAD2iwcLc5BMFpiuMffv7ed86h6J/e4zF+Oms8vr766pT
         e/tPcfbjDP1mQWDIrCoh5XsMyMyaOBbn/PIrGbr816++wkX43jA0ZXXlUCa2I+olsPYZ
         MylZX5Gl5hAHJNKMHv0b5lK2v8Sp39+URNtsAlKnhuE2mwqn1JN0nv7ZQs++0fXMo1uW
         paEQ==
X-Gm-Message-State: AOJu0YyMRr89Hd1jFYJ5qFGLi7bum6kWot8aBWAgwiQcaU3StcUsFJY7
	cKUXmBFVTuT6kQYlE4rEBUUuzkG6N3DwnjhGvaBRYDCtFLRXzRz0cldWKWY0Qg==
X-Gm-Gg: ASbGncssSTFyoKa0RBcOW2LL/GUBFyLlxzfmiK/AmnNLHdQhbTlnVPIcUa8+ld4qzKX
	ZodrAtMpCcPVZJS4XADiTD/ziKPYD9h28k9lycw3BAGhwb+z6U6MoqoRo4vatXhjonTiQcg3Awb
	oSotYcI/vU8efo8qn8h4xtW5l1ocZJNVLv0zvGGoTeL75OJwtqXf6CMeB0o0hDcO9NUjHAnpMyE
	W8T0/ndK/hCdtHYluayBzGPzmA7kuZQ/Q3RQlB+dXkWDcrOQtfr4m1PqOucZYnTShulD4jVzKF3
	wk6tcmP1Gm/yozepIhyUNe/ZX1YWwcCD052VyEQxq6tbgczUQrhL5mLPbfw93pabIqLp4YJ9BTA
	gpvjUUfjWObyrjZDvn/j+1XZTD6PpMOIMmYZt5qbyN0cz3n94fsH5XJ8NnkcNkNTTOYDcIwe5
X-Google-Smtp-Source: AGHT+IGUx6XOIBYD5ycm/HXQM2uAsBpbGVlHochHRwE0PTieq30Kt7jzpASz4BQxPcKunyTUBtZx1Q==
X-Received: by 2002:a05:6512:1512:10b0:55b:975b:98a with SMTP id 2adb3069b0e04-55ceeba2f0bmr1738395e87.41.1755506999295;
        Mon, 18 Aug 2025 01:49:59 -0700 (PDT)
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
Subject: [PATCH v9 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
Date: Mon, 18 Aug 2025 11:49:24 +0300
Message-ID: <205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1755506449.git.mykola_kvach@epam.com>
References: <cover.1755506449.git.mykola_kvach@epam.com>
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

GIC and virtual timer context must be saved when the domain suspends.
This is done by moving the respective code in ctxt_switch_from
before the return that happens if the domain suspended.

domain_resume_nopause() is introduced to allow resuming a domain from
SYSTEM_SUSPEND without pausing it first. This avoids problematic
domain_pause() calls when resuming from suspend on Arm, particularly
in error paths. The function is only used on Arm; other architectures
continue to use the original domain_resume().

Usage:

For Linux-based guests, suspend can be initiated with:
    echo mem > /sys/power/state
or via:
    systemctl suspend

Resuming the guest is performed from control domain using:
      xl resume <domain>

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
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
 xen/arch/arm/domain.c                 |  17 +++--
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/vpsci.h      |   2 +-
 xen/arch/arm/vpsci.c                  | 101 ++++++++++++++++++++++----
 xen/common/domain.c                   |  31 ++++++--
 xen/include/xen/sched.h               |   6 ++
 7 files changed, 131 insertions(+), 29 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 310c578909..9e9649c4e2 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -90,6 +90,16 @@ static void ctxt_switch_from(struct vcpu *p)
     if ( is_idle_vcpu(p) )
         return;
 
+    /* Arch timer */
+    p->arch.cntkctl = READ_SYSREG(CNTKCTL_EL1);
+    virt_timer_save(p);
+
+    /* VGIC */
+    gic_save_state(p);
+
+    if ( test_bit(_VPF_suspended, &p->pause_flags) )
+        return;
+
     p2m_save_state(p);
 
     /* CP 15 */
@@ -106,10 +116,6 @@ static void ctxt_switch_from(struct vcpu *p)
     p->arch.tpidrro_el0 = READ_SYSREG(TPIDRRO_EL0);
     p->arch.tpidr_el1 = READ_SYSREG(TPIDR_EL1);
 
-    /* Arch timer */
-    p->arch.cntkctl = READ_SYSREG(CNTKCTL_EL1);
-    virt_timer_save(p);
-
     if ( is_32bit_domain(p->domain) && cpu_has_thumbee )
     {
         p->arch.teecr = READ_SYSREG(TEECR32_EL1);
@@ -158,9 +164,6 @@ static void ctxt_switch_from(struct vcpu *p)
 
     /* XXX MPU */
 
-    /* VGIC */
-    gic_save_state(p);
-
     isb();
 }
 
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
index 7ba9ccd94b..67d369a8a2 100644
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
+        domain_resume_nopause(d);
+        return rc;
+    }
+
+    set_bit(_VPF_suspended, &current->pause_flags);
+
+    dprintk(XENLOG_DEBUG,
+            "Dom %u: SYSTEM_SUSPEND requested, epoint=%#lx, cid=%#lx\n",
+            d->domain_id, epoint, cid);
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
@@ -344,6 +399,24 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
         return true;
     }
 
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
+    {
+        register_t epoint = PSCI_ARG(regs, 1);
+        register_t cid = PSCI_ARG(regs, 2);
+
+        if ( is_64bit_domain(current->domain) &&
+             fid == PSCI_1_0_FN32_SYSTEM_SUSPEND )
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
index 5241a1629e..624c3e2c27 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1343,16 +1343,13 @@ int domain_shutdown(struct domain *d, u8 reason)
     return 0;
 }
 
-void domain_resume(struct domain *d)
+#ifndef CONFIG_ARM
+static
+#endif
+void domain_resume_nopause(struct domain *d)
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
@@ -1360,13 +1357,33 @@ void domain_resume(struct domain *d)
 
     for_each_vcpu ( d, v )
     {
+        /*
+         * No need to conditionally clear _VPF_suspended here:
+         * - This bit is only set on Arm64, and only after a successful suspend.
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
index fd5c9f9333..c1848d8ea6 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -814,6 +814,9 @@ void domain_destroy(struct domain *d);
 int domain_kill(struct domain *d);
 int domain_shutdown(struct domain *d, u8 reason);
 void domain_resume(struct domain *d);
+#ifdef CONFIG_ARM
+void domain_resume_nopause(struct domain *d);
+#endif
 
 int domain_soft_reset(struct domain *d, bool resuming);
 
@@ -1010,6 +1013,9 @@ static inline struct domain *next_domain_in_cpupool(
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


