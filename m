Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 928DFB1DD86
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 21:40:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073699.1436576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6TA-0003rH-WA; Thu, 07 Aug 2025 19:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073699.1436576; Thu, 07 Aug 2025 19:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6TA-0003pT-R3; Thu, 07 Aug 2025 19:40:08 +0000
Received: by outflank-mailman (input) for mailman id 1073699;
 Thu, 07 Aug 2025 19:40:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbW2=2T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uk6T8-0002bD-Qw
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 19:40:06 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 511ada61-73c6-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 21:40:05 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-55b8a7a505cso1803401e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 12:40:05 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bfc6sm2759188e87.10.2025.08.07.12.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 12:40:02 -0700 (PDT)
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
X-Inumbo-ID: 511ada61-73c6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754595604; x=1755200404; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJUB20LiWerUQhv0sVWwQBJUkY/1OeouJfHXDztIoDM=;
        b=daYeQaQ1VIgGNp+RpJdtjEcvtlm7HBeazMbcKik48weB2LPwXBcxQSijptgrtKPeDh
         svq4krqsBOFCV5yul1oD1s9CA9NqAITMDikZI9Vkkz4YiYluj1eI8BtbGFDZRCqXdO2x
         syMYYNg39K5qQY6OqoXGNX2oilRLmfcg0TUYuIGkO++jCD1TbqsIsgVsEgTeTUMeeh8e
         tJnTjKD7srDP5DsX+3GD8MNLDish1LOEaQ3r7FX7du+SwHNpAIlcPwPRY2JH2QeaqVP9
         4yB2sTgWb43nfWQHxVPu2AjLJWnqM5doJoDo2wafgi4t8wWqv7ZRtSWDxVjUIh//bMLj
         Akjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754595604; x=1755200404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fJUB20LiWerUQhv0sVWwQBJUkY/1OeouJfHXDztIoDM=;
        b=f9fV5rfXGTVlyJaw+5WZaVWeDJPJ9WSv2FALwOBYc638MY9zefxnwWuCXlHb7lq1uz
         Am+TZ57TkYCoLO7YSYOzWmhHLuScbDMP5RNRWuzBZLFPhzai+F5PSq4Bl+zpbTjYsHJW
         IBoXee79JATKr8vWUdeKzXGqMNgDnJiAgbnkUF3zLlC19jOExXSkHKVqrqasL7X1iZFl
         RDbeqSgQ2BpCQOq+/aDSHVNnBtb4sj1xUgpPU0We0U3+EkOLMxQfub2f4X0gE14nt9qT
         t7IQHMYW08uY9SeeHDYk86hbj5njzg5ZV5MlchHdez/y1er8yowJbROfEti8pEigbIo1
         IFSg==
X-Gm-Message-State: AOJu0YwSCiq9OWZVpfXCTaiY/cYW1wNlnP4+M0woOVzat67keNcDR6wj
	q+1w900J8QuuFWEzMWXMwoHV7elpp/jtcOM4Efi6e1uYEsw/zpQFPdqo+BpibbEIs+A=
X-Gm-Gg: ASbGncttp3NKtG4JfvzoybsUHrfuomk/apJgtWKOKR5urmYvHP+MIEhZ1nUOKkIRG71
	tEW+e6Axe1rtCneTNdUDcY9eJCw6xbE29cs8QDVFfNF/G4lnbRX3bOhnXAs/wr9b1hGUXOd12nb
	Lxh93P3Qmp7f8UggIR475vhpmqwC35mGUeHxykvfsUBE816P68JGyzYXlDEs+R4syPJjE8N3bsz
	O+Yv5w4T8cDDJbseT2Mxo1zATfM7J2BENLY/tWNGlHMeyffwszNoZuHs91G4xFf7dUxLRUAiIdQ
	9l14hMTed1axoKf+b89jjQoQSwjVnvQ7+Q1wTNpQzq+uMIMQ7q9gclPiflSwMA9hKbl13oO6GSs
	TqSduLtO7JKK8VhF7VWQCspHbxRX6zAQx46OQSj6Hv4Fkxii3j/6a20I/F18+2A==
X-Google-Smtp-Source: AGHT+IFvgkpt3O7sUpxvIO2fyn30cA6jxh06Jp6tGDDEJGuFiwLSoKayaTfR0T1sxT7i8mRt82y0YA==
X-Received: by 2002:ac2:4c53:0:b0:55b:87d9:3bad with SMTP id 2adb3069b0e04-55cc00fe7fcmr2939e87.34.1754595603834;
        Thu, 07 Aug 2025 12:40:03 -0700 (PDT)
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
Subject: [PATCH v8 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
Date: Thu,  7 Aug 2025 22:39:25 +0300
Message-ID: <64cbfa58af7935c47141a2b1c0560e8d63e3d712.1754595198.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754595198.git.mykola_kvach@epam.com>
References: <cover.1754595198.git.mykola_kvach@epam.com>
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

Usage:

For Linux-based guests, suspend can be initiated with:
    echo mem > /sys/power/state
or via:
    systemctl suspend

Resuming the guest is performed from control domain using:
      xl resume <domain>

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
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
 xen/common/domain.c                   |  22 ++++--
 xen/include/xen/sched.h               |   6 ++
 7 files changed, 122 insertions(+), 29 deletions(-)

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
index 5241a1629e..c3609b0cb0 100644
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
@@ -1360,13 +1357,24 @@ void domain_resume(struct domain *d)
 
     for_each_vcpu ( d, v )
     {
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
index fd5c9f9333..4050b5dc6a 100644
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
+#define _VPF_suspended 9
+#define VPF_suspended (1UL<<_VPF_suspended)
 
 static inline bool vcpu_runnable(const struct vcpu *v)
 {
-- 
2.48.1


