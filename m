Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CDAB14A73
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062242.1427893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugg4X-0006Rw-Bd; Tue, 29 Jul 2025 08:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062242.1427893; Tue, 29 Jul 2025 08:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugg4X-0006Pn-6v; Tue, 29 Jul 2025 08:52:33 +0000
Received: by outflank-mailman (input) for mailman id 1062242;
 Tue, 29 Jul 2025 08:52:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R+Pi=2K=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ugg4V-0006C0-Kc
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:52:31 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c685540-6c59-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 10:52:30 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5562838ce68so4655192e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:52:30 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63375ca4sm1584998e87.124.2025.07.29.01.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 01:52:28 -0700 (PDT)
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
X-Inumbo-ID: 5c685540-6c59-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753779150; x=1754383950; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpKdhuPFHZzNA1oxnqzr6HIQt3R5lrFjm83AAIpDVog=;
        b=gw6BVp9VnUr/wa26N0omMtSdjrOiq6u+mF3Vmd0n13tfZko4rFD4JGZseQCJEWOp44
         qAHe1PGKe9afynkra/D7zaLCaLN1BP7EkVTXhqavxiqf6xQSULYRWjUpdOk8H47CQel0
         e7y66LZ05lNu2RHgVWrUajfCNx6mh52sQQAAJ/6JlrpMygvRnU1aUM2JYf1eEhgzPFFQ
         MKhm/+O5CRzaf8pmkWxpuBWiJoSTUKLQn+zNuu0JeX6dPxGqqsx0NGjSA4i8NHbekcYh
         OYAdW/n6cDCxSkijz0Nr97Cwkjg8y0tiHv0aPjRcI5g5ev1PbgFLpAoL8GgG+AubpoqI
         DErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753779150; x=1754383950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpKdhuPFHZzNA1oxnqzr6HIQt3R5lrFjm83AAIpDVog=;
        b=F9tuuF+K/rvTUEWd2T1TyA/sSKR4GmjYschhWUikV7PgkwhK/+LgvFeo0Xogxlz0Ta
         3crcOWXVCVcpSzsBxePz4VhMMDgY4BfosmtYXvMl0VrhpNOLWWTJPQq9vAHPDVmUOgey
         rbVXhxo4Y59ROrdWO/kccQJoOAHgpMkcjK+rYdutYrAulps2wxFryYZZ+3ND9EmAZHmw
         4dNy5GIFnneFSeGDch67jsg10MN7Q5+ZvgrLgVb/4X7hwkTJMiIysCJa+M1Vc0YP0Qxy
         iWveJzZFkFylDJj6EyawxGAuVzpTpzaNORXBNIo2OAoEA6FiJwndjesbYVG5me/43Pzt
         +6Tg==
X-Gm-Message-State: AOJu0YzYfcQzYprfHNxYZlPfYi/pehnaf240dOPU4D+wHLyFWnpgP5sP
	0YBGDOArDJLetCaFCmCVzINlBHKl+yxUtVhk69Za9Xwqk+ouaY5tJmHlJjbkiA==
X-Gm-Gg: ASbGncsGxFN8XknkH1A0s3t9YnYDkJGrv5njbZgu6yHvNNhLmTor9JoN15zQvAqZrl2
	lVi3PzsL0Ejx+8om07R90caW1ItTVH1P4V3ifb4oncg1ocMLC6mFrUVepMwKJYzhnY4hz+b56LR
	vTwy8Ymmq2ktdhLDul+yccrPEQ5u1V4det5kgCD9eJs4+bdH4RYvLMGXwTYjjIXwcv2HCEIO1GX
	mbz71nuvfvX1gHHzoWKHEPp+yl6J+SE52DcB88aVYuJ6fN9PNFpybMaQzQUX2JQSStqw+AJUw2e
	YXXMKd8/IbZTBt6XrqMyDXALXAFzkCeh33lb8Js/CV4PhMaMmSH2YSPHBR3pzINZsiaou+/2EAk
	WOiJJgy+ngrIIsUF0yHxxeWz0waKT2ZIqW+TpbNAvOJp5qjZkIDM1J8z6qbTpjw==
X-Google-Smtp-Source: AGHT+IE1SNHS+vq6TV4Mz4fvBAP49zSjvKDSYnm+lYChgBQrH/WtqD7cLXteVGSft536lhPs6ZUPGw==
X-Received: by 2002:a05:6512:3b27:b0:553:2311:e1f6 with SMTP id 2adb3069b0e04-55b5f5108e1mr3486360e87.49.1753779149711;
        Tue, 29 Jul 2025 01:52:29 -0700 (PDT)
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
Subject: [PATCH v7 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
Date: Tue, 29 Jul 2025 11:52:11 +0300
Message-ID: <45e670391c37ab54f721b6576a41ded2e543d6db.1753778926.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1753778926.git.mykola_kvach@epam.com>
References: <cover.1753778926.git.mykola_kvach@epam.com>
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
 xen/arch/arm/domain.c                 |   3 +
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/vpsci.h      |   2 +-
 xen/arch/arm/vpsci.c                  | 104 ++++++++++++++++++++++----
 xen/common/domain.c                   |  25 +++++--
 xen/include/xen/sched.h               |   7 ++
 7 files changed, 122 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 310c578909..451b468755 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -90,6 +90,9 @@ static void ctxt_switch_from(struct vcpu *p)
     if ( is_idle_vcpu(p) )
         return;
 
+    if ( test_bit(_VPF_suspended, &p->pause_flags) )
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
index 7ba9ccd94b..c8f74fd28b 100644
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
@@ -197,6 +208,51 @@ static void do_psci_0_2_system_reset(void)
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
+    domain_lock(d);
+
+    /* Ensure that all CPUs other than the calling one are offline */
+    for_each_vcpu ( d, v )
+    {
+        if ( v != current && is_vcpu_online(v) )
+        {
+            rc = PSCI_DENIED;
+            goto exit_unlock;
+        }
+    }
+
+    rc = do_setup_vcpu_ctx(current, epoint, cid);
+    if ( rc != PSCI_SUCCESS )
+        goto exit_unlock;
+
+    rc = domain_shutdown(d, SHUTDOWN_suspend) ?
+         PSCI_INTERNAL_FAILURE : PSCI_SUCCESS;
+    if ( rc != PSCI_SUCCESS )
+    {
+        domain_resume_nopause(d);
+        goto exit_unlock;
+    }
+
+    set_bit(_VPF_suspended, &current->pause_flags);
+
+    dprintk(XENLOG_INFO,
+            "Dom %u: SYSTEM_SUSPEND requested, epoint=%#lx, cid=%#lx\n",
+            d->domain_id, epoint, cid);
+
+ exit_unlock:
+    domain_unlock(d);
+    return rc;
+}
+
 static int32_t do_psci_1_0_features(uint32_t psci_func_id)
 {
     /* /!\ Ordered by function ID and not name */
@@ -214,6 +270,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
     case PSCI_0_2_FN32_SYSTEM_OFF:
     case PSCI_0_2_FN32_SYSTEM_RESET:
     case PSCI_1_0_FN32_PSCI_FEATURES:
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
     case ARM_SMCCC_VERSION_FID:
         return 0;
     default:
@@ -344,6 +402,24 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
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
index 3c65cca5b0..bd698dfc0f 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1334,16 +1334,15 @@ int domain_shutdown(struct domain *d, u8 reason)
     return 0;
 }
 
-void domain_resume(struct domain *d)
+#ifdef CONFIG_ARM
+void domain_resume_nopause(struct domain *d)
+#else
+static void domain_resume_nopause(struct domain *d)
+#endif
 {
     struct vcpu *v;
 
-    /*
-     * Some code paths assume that shutdown status does not get reset under
-     * their feet (e.g., some assertions make this assumption).
-     */
-    domain_pause(d);
-
+    domain_lock(d);
     spin_lock(&d->shutdown_lock);
 
     d->is_shutting_down = d->is_shut_down = 0;
@@ -1351,13 +1350,25 @@ void domain_resume(struct domain *d)
 
     for_each_vcpu ( d, v )
     {
+        clear_bit(_VPF_suspended, &v->pause_flags);
+
         if ( v->paused_for_shutdown )
             vcpu_unpause(v);
         v->paused_for_shutdown = 0;
     }
 
     spin_unlock(&d->shutdown_lock);
+    domain_unlock(d);
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
index fe53d4fab7..5647a15c84 100644
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
 
@@ -1010,6 +1013,10 @@ static inline struct domain *next_domain_in_cpupool(
 /* VCPU is parked. */
 #define _VPF_parked          8
 #define VPF_parked           (1UL<<_VPF_parked)
+/* VCPU is suspended. */
+#define _VPF_suspended       9
+#define VPF_suspended        (1UL<<_VPF_suspended)
+
 
 static inline bool vcpu_runnable(const struct vcpu *v)
 {
-- 
2.48.1


