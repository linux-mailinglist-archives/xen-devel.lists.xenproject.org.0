Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB845B106A7
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 11:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055530.1423891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesSd-0007uR-85; Thu, 24 Jul 2025 09:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055530.1423891; Thu, 24 Jul 2025 09:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesSd-0007q6-4I; Thu, 24 Jul 2025 09:41:59 +0000
Received: by outflank-mailman (input) for mailman id 1055530;
 Thu, 24 Jul 2025 09:41:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t79f=2F=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uesSb-0007nR-OY
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 09:41:57 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f945eea-6872-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 11:41:55 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-32b435ef653so6777931fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 02:41:55 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331e08e98aesm2418261fa.54.2025.07.24.02.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 02:41:53 -0700 (PDT)
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
X-Inumbo-ID: 6f945eea-6872-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753350115; x=1753954915; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ku9w1fkK0fAvgQ8OQfzLngvlrBrNrGCj3gQYtxHhrjY=;
        b=T4BtMSfpECMs2Xa7uyEtc5+S28w6rz9M+Pu4pXf6/ydiJMHEFLe6vu5sqEYG2Ic3L7
         MShZ+wbNNl85do6YpCw7XQN3ZHoQT49sFDYLIanSORXVCHUmfHteDJ+vNXcH1wKuQ18v
         CvBtrDa63a9QhGYblalezO4YX+gQCaqcrV8Pc31/mdccfqBV6zqwnKBCfm6o2o7aCm6d
         HcRHXbphLwV4NXaeXfO0WzlurbscCb8NBedD0cifsVUyn392Dgr4F7kgFdsgFSHJ6nXb
         jEbefepUNxAUy9KgXE6+wTc2K1Yo6uxiruQEMvU1H/afJcc+I4E1eB6lVKOBMX3UAEIY
         biVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350115; x=1753954915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ku9w1fkK0fAvgQ8OQfzLngvlrBrNrGCj3gQYtxHhrjY=;
        b=KqyIgN5lSVPGdO+XIAkrEj/86erxiFBuGb9PdCX045YIaAiQQEXAM+k6gcZWFJxHE9
         w0y4PD9G/u3zFMFqV+Ya8je10WHjo5b8CWK8SpJoFHGZOtwPQ2W/wq0sg5s6uc/F9f33
         XvQk9Z2BcD24CrQuLnePWnjLW21wrmY4PLGSXFl66P53oInnLjKXutzT0vlQ0gY+JoY+
         V1VoxXfvlaS+UipqchFLCjjdUdInfyncKDuFyu9ONEYwAkTifpPfMDLM5qgyhQGFEsS3
         WHCGp5NK3TTLi15ZNVcJ32Bcyd8KKWp3XrkgzG6coRN4xG8tnXf8jz/0IAw4x/CYbd4f
         Y+Yw==
X-Gm-Message-State: AOJu0YyLbPAU+UHzdf3/TjckWmkwFaGJNteuTaE6OfTt2f0hB/PITCHG
	jaJevW3M6ZZNokogRVgWtn3YNH1Ye9RBf4pxzuE4Ty/CsowGESEAyq5L7xHWNw==
X-Gm-Gg: ASbGncs7NQQ1rbvFEbQtbZhHJ5wn0ArmEXx74hNjweEakDYk/BKlIt8IgaTYaNbgzYY
	jNc7th0xZK4HmMhfx9xuDTo4lmAxAv+T9eEraVipUsiGaJXZ+QbnzxgZzr+Q6QKsFWOsD58MO9t
	zuNHqvOmER2n+afFUiGrQJz+MYejBQZldkWVxplS3vBWkf3IoqEw5WfrK9/4KOlavvuX4Dd24qb
	zn/xIUTMyji6KM+sZlToEnzp+cdgybnwYbn9YoJByrGS3NX9reA2bjfcG6NEE5jAnZ6EtXhdb8X
	FObLyZ2Y4nWW49zMks+9FN/RuROP86TuMmmVtNxA/BPqYcZbEabS8xxuxmrGytfINCWYrPxr0a6
	5YLUP7pgHJj8NE1V39vlBXaKCH+zzewihWrYNpQ4z2C563xi1CzAELnmjaFcSZg==
X-Google-Smtp-Source: AGHT+IH73lN6yqHCBPcqd2/XZ8/oRJ1EQtkhz2AOFNgj0ymhgJMVvT3G0840gz5OP77DyOSiuOQP0w==
X-Received: by 2002:a2e:a882:0:b0:32b:8e4a:5710 with SMTP id 38308e7fff4ca-330dfe19fa2mr21716731fa.34.1753350114444;
        Thu, 24 Jul 2025 02:41:54 -0700 (PDT)
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
Subject: [PATCH v6 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
Date: Thu, 24 Jul 2025 12:40:56 +0300
Message-ID: <180825d963133be069385472f569ecb1870989fb.1753349109.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1753349108.git.mykola_kvach@epam.com>
References: <cover.1753349108.git.mykola_kvach@epam.com>
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

Usage:

For Linux-based guests, suspend can be initiated with:
    echo mem > /sys/power/state
or via:
    systemctl suspend

Resuming the guest is performed from control domain using:
      xl resume <domain>

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
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
 xen/arch/arm/domain.c                 |  4 ++
 xen/arch/arm/include/asm/perfc_defn.h |  1 +
 xen/arch/arm/include/asm/psci.h       |  2 +
 xen/arch/arm/include/asm/vpsci.h      |  2 +-
 xen/arch/arm/vpsci.c                  | 90 +++++++++++++++++++++++----
 xen/common/domain.c                   | 30 ++++++---
 xen/include/xen/sched.h               |  2 +
 7 files changed, 110 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 79a144e61b..a2ad10146f 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -90,6 +90,10 @@ static void ctxt_switch_from(struct vcpu *p)
     if ( is_idle_vcpu(p) )
         return;
 
+    /* VCPU's context should not be saved if its domain is suspended */
+    if ( vcpu_is_suspended(p) )
+        return;
+
     p2m_save_state(p);
 
     /* CP 15 */
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
index 7ba9ccd94b..11334b3426 100644
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
@@ -197,6 +208,39 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
 
+static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
+{
+    int ret;
+    struct vcpu *v;
+    struct domain *d = current->domain;
+
+    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
+    if ( is_hardware_domain(d) )
+        return PSCI_NOT_SUPPORTED;
+
+    /*
+     * Shut down the domain first to ensure all vCPUs are paused
+     * before checking that they (except the calling one) are offline.
+     */
+    domain_shutdown(d, SHUTDOWN_suspend);
+
+    /* Ensure that all CPUs other than the calling one are offline */
+    for_each_vcpu ( d, v )
+    {
+        if ( v != current && is_vcpu_online(v) )
+        {
+            domain_resume_nopause(d);
+            return PSCI_DENIED;
+        }
+    }
+
+    ret = do_setup_vcpu_ctx(current, epoint, cid);
+    if ( ret != PSCI_SUCCESS )
+        domain_resume_nopause(d);
+
+    return ret;
+}
+
 static int32_t do_psci_1_0_features(uint32_t psci_func_id)
 {
     /* /!\ Ordered by function ID and not name */
@@ -214,6 +258,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
     case PSCI_0_2_FN32_SYSTEM_OFF:
     case PSCI_0_2_FN32_SYSTEM_RESET:
     case PSCI_1_0_FN32_PSCI_FEATURES:
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
     case ARM_SMCCC_VERSION_FID:
         return 0;
     default:
@@ -344,6 +390,24 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
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
index 303c338ef2..5b760f0cd9 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1326,16 +1326,10 @@ int domain_shutdown(struct domain *d, u8 reason)
     return 0;
 }
 
-void domain_resume(struct domain *d)
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
@@ -1349,10 +1343,32 @@ void domain_resume(struct domain *d)
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
 
+bool vcpu_is_suspended(struct vcpu *v)
+{
+    bool is_suspended;
+    struct domain *d = v->domain;
+
+    spin_lock(&d->shutdown_lock);
+    is_suspended = d->shutdown_code == SHUTDOWN_suspend &&
+                   v->paused_for_shutdown;
+    spin_unlock(&d->shutdown_lock);
+
+    return is_suspended;
+}
+
 int vcpu_start_shutdown_deferral(struct vcpu *v)
 {
     if ( v->defer_shutdown )
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index fe53d4fab7..2e163497bd 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -814,6 +814,7 @@ void domain_destroy(struct domain *d);
 int domain_kill(struct domain *d);
 int domain_shutdown(struct domain *d, u8 reason);
 void domain_resume(struct domain *d);
+void domain_resume_nopause(struct domain *d);
 
 int domain_soft_reset(struct domain *d, bool resuming);
 
@@ -824,6 +825,7 @@ int get_domain_state(struct xen_domctl_get_domain_state *info,
 
 int vcpu_start_shutdown_deferral(struct vcpu *v);
 void vcpu_end_shutdown_deferral(struct vcpu *v);
+bool vcpu_is_suspended(struct vcpu *v);
 
 /*
  * Mark specified domain as crashed. This function always returns, even if the
-- 
2.48.1


