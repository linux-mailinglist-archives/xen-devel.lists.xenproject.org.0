Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2DC6A5AD
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:40:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165056.1491890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNo7-0004sh-RX; Tue, 18 Nov 2025 15:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165056.1491890; Tue, 18 Nov 2025 15:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNo7-0004qF-LJ; Tue, 18 Nov 2025 15:39:51 +0000
Received: by outflank-mailman (input) for mailman id 1165056;
 Tue, 18 Nov 2025 15:39:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLNo6-0004pf-G7
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:39:50 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0344571-c494-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 16:39:47 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b727f452fffso1097231666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:39:47 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-54.as6723.net. [185.5.253.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80d27sm1391385266b.40.2025.11.18.07.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:39:45 -0800 (PST)
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
X-Inumbo-ID: d0344571-c494-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763480387; x=1764085187; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqRM5TfHvvqePEb+D+O5+fVBIHkXyRVzinuX7cgVNQA=;
        b=i23hrXfll+fbxmr5jVp5Gmg5ak4fpxuJ9jyu058vUuYjKJno6ammc2exEXYGTxlTMp
         gsUDDrj3oP9i1sZZfeCATBWJejlHBU9cj2Q6FTm+IWcqhLt3uUsMFdpxzxFT7tyO1ZeL
         t0euUV8aok79CNkeTP7/jBmUG+e5owbGzWPHfFOG7b/nBzGataTBfVQ3lJcPMBUcb7DG
         kr6m+ALmqGMekLbHavMJCK9KQ1woi2ZbT4sAnnvMp2X6mLJM28dZ+J9ZXsVV7oVx4T0k
         AHlU1qmfjJG2dShU5WpVg/Ds1CB+7i2tffq/kTpVBTxbAr9B2jNMn14K2hyTu4APdn08
         LvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763480387; x=1764085187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HqRM5TfHvvqePEb+D+O5+fVBIHkXyRVzinuX7cgVNQA=;
        b=gEQ+jY48nMRgiuoyJXyQGCJN1FFBzvZuLAcyj6VUQmCpNCaN6vv4ajycp2AqEMShg5
         M1doO447jaSayvxq3hNnylFO4feApeAZH+RKfuCXeAeNnCvFKAMcYm+F3FVTGbQ5CnPN
         Hd8F4HZLwIqehRjqkyRHB38MFdTHEx53BXjb7cuDT2y8DWWDc35tZuVQEazjNoz8DfOs
         11VV08qPWzlAtqIWGLp8qFImnwZLq3OdrfXc1tWyz5TgjBoYEyiVUulXgQoDZ6XPZsI0
         1VNSXWJ8Lm3uh7aA1AVM7bC7SKvwvSO9qt6/YQ8tTVLvUSCVcQXAWqpD+vMGEv0ZdFHM
         GygA==
X-Gm-Message-State: AOJu0YyC9om3ZwbWRC2xkPyGynf+0Xb8SjHZdYJQN7ro+BvL21klaF1Y
	HA4o0IPadO+Sa/JNhh6tpSAJV8z5T9ifpBo0P6hGqM+wNM0/k8TYBARqZluoZZ7bPPg=
X-Gm-Gg: ASbGncs3l3Jh4/q+nO5a792BhpqWPXFTto7iw65XJEennJwgi+jVqlcS3Vq3J4jZp51
	kQ3oMJF2z6oYZOr+9NlY2rUV4W6QhibPbozDySm2hh9ocnymHwMdQPQ0gQ/N++fV6D94l8ZfJLY
	g+Y3QKQHDtrmXlBQJW1VN6THYHEOrpVrli5lJhmAbX7GNJT9Jb+GoUD7spFZTlZDFjTqDoCQbcO
	YI20kruYX/SMj4A8pjkH7Z7TVW0a2wUQT+pHePv6i8k5skleH6DzoV9bPriQUZ4sB6HcT6txPUp
	DjjUkKbgeQqsD1WGWYFqqqR07BUvks7I5rKeQfWWWhKm0ebOpU2gMU2N2dLfb3ukdES0RMonYRG
	4FFW7o9apPGITJj21GsvLcLXq1IhnaUx13lLqdmh0Ez7kiJDuRgFY/DmGZA0FaOmiIkMAsr1uir
	Zfz6kZmbkyo6rT7fh0XLp1s/sXceECIyK/b/DC5+auMmI=
X-Google-Smtp-Source: AGHT+IEXF6JBmsC/ldlQ8X1jSWRbybTeO9zAY1ZsvRhhiAoI/qEINaqJ+7ttI3DgYIz0k9jQ7byPkg==
X-Received: by 2002:a17:907:2da9:b0:afe:159:14b1 with SMTP id a640c23a62f3a-b758bb5461cmr420613866b.9.1763480386414;
        Tue, 18 Nov 2025 07:39:46 -0800 (PST)
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
Subject: [PATCH v14 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
Date: Tue, 18 Nov 2025 17:37:28 +0200
Message-ID: <3786204d034ae4461aa0fde77771b8e14256314a.1763479083.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763479083.git.xakep.amatop@gmail.com>
References: <cover.1763479083.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND call
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
Changes in V14:
- move arch_domain_resume to a separate header
- avoid usage of typeof for context struct
- moved error printing from domain_resume to arch_domain_resume
  in order to simplify common parts of code
- minor changes after review
---
 xen/arch/arm/domain.c                 |  41 +++++++++
 xen/arch/arm/include/asm/domain.h     |   2 +
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/suspend.h    |  24 ++++++
 xen/arch/arm/include/asm/vpsci.h      |   5 +-
 xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
 xen/common/domain.c                   |   5 ++
 xen/include/xen/suspend.h             |  15 ++++
 9 files changed, 189 insertions(+), 22 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/include/xen/suspend.h

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index e36719bce4..3c0170480b 100644
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
@@ -24,10 +26,12 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/suspend.h>
 #include <asm/firmware/sci.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
+#include <asm/vpsci.h>
 #include <asm/vtimer.h>
 
 #include "vpci.h"
@@ -885,6 +889,43 @@ void arch_domain_creation_finished(struct domain *d)
     p2m_domain_creation_finished(d);
 }
 
+int arch_domain_resume(struct domain *d)
+{
+    int rc;
+    struct resume_info *ctx = &d->arch.resume_ctx;
+
+    if ( !d->is_shutting_down || d->shutdown_code != SHUTDOWN_suspend )
+    {
+        dprintk(XENLOG_WARNING,
+                "%pd: Invalid domain state for resume: is_shutting_down=%d, shutdown_code=%d\n",
+                d, d->is_shutting_down, d->shutdown_code);
+        return -EINVAL;
+    }
+
+    /*
+     * It is still possible to call domain_shutdown() with a suspend reason
+     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_shutdown.
+     * In these cases, the resume context will be empty.
+     * This is not expected to cause any issues, so we just warn about the
+     * situation and return without error, allowing the existing logic to
+     * proceed as expected.
+     */
+    if ( !ctx->wake_cpu )
+    {
+        dprintk(XENLOG_INFO, "%pd: Wake CPU pointer context was not provided\n",
+                d);
+        return 0;
+    }
+
+    rc = vpsci_vcpu_up_prepare(ctx->wake_cpu , ctx->ep, ctx->cid);
+    if ( rc )
+        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
+
+    memset(ctx, 0, sizeof(*ctx));
+
+    return rc;
+}
+
 static int is_guest_pv32_psr(uint32_t psr)
 {
     switch (psr & PSR_MODE_MASK)
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index af3e168374..e637cb4de0 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -5,6 +5,7 @@
 #include <xen/timer.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
+#include <asm/suspend.h>
 #include <asm/vfp.h>
 #include <asm/mmio.h>
 #include <asm/gic.h>
@@ -126,6 +127,7 @@ struct arch_domain
     void *sci_data;
 #endif
 
+    struct resume_info resume_ctx;
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
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
new file mode 100644
index 0000000000..b991a94d5a
--- /dev/null
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_SUSPEND_H__
+#define __ARM_SUSPEND_H__
+
+struct resume_info {
+    register_t ep;
+    register_t cid;
+    struct vcpu *wake_cpu;
+};
+
+int arch_domain_resume(struct domain *d);
+
+#endif /* __ARM_SUSPEND_H__ */
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
index 7ba9ccd94b..22c3a5f544 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -10,32 +10,16 @@
 
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
+    struct domain *d = v->domain;
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
-
-    vgic_clear_pending_irqs(v);
+        return -ENOMEM;
 
     memset(ctxt, 0, sizeof(*ctxt));
     ctxt->user_regs.pc64 = (u64) entry_point;
@@ -76,8 +60,37 @@ static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
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
@@ -197,6 +210,48 @@ static void do_psci_0_2_system_reset(void)
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
+            "SYSTEM_SUSPEND requested, epoint=0x%"PRIregister", cid=0x%"PRIregister"\n",
+            epoint, cid);
+
+    return rc;
+}
+
 static int32_t do_psci_1_0_features(uint32_t psci_func_id)
 {
     /* /!\ Ordered by function ID and not name */
@@ -214,6 +269,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
     case PSCI_0_2_FN32_SYSTEM_OFF:
     case PSCI_0_2_FN32_SYSTEM_RESET:
     case PSCI_1_0_FN32_PSCI_FEATURES:
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
     case ARM_SMCCC_VERSION_FID:
         return 0;
     default:
@@ -344,6 +401,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
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
index 775c339285..6410d32970 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -26,6 +26,7 @@
 #include <xen/hypercall.h>
 #include <xen/delay.h>
 #include <xen/shutdown.h>
+#include <xen/suspend.h>
 #include <xen/percpu.h>
 #include <xen/multicall.h>
 #include <xen/rcupdate.h>
@@ -1363,6 +1364,9 @@ void domain_resume(struct domain *d)
 
     spin_lock(&d->shutdown_lock);
 
+    if ( arch_domain_resume(d) )
+        goto fail;
+
     d->is_shutting_down = d->is_shut_down = 0;
     d->shutdown_code = SHUTDOWN_CODE_INVALID;
 
@@ -1373,6 +1377,7 @@ void domain_resume(struct domain *d)
         v->paused_for_shutdown = 0;
     }
 
+ fail:
     spin_unlock(&d->shutdown_lock);
 
     domain_unpause(d);
diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
new file mode 100644
index 0000000000..53f75fd6ad
--- /dev/null
+++ b/xen/include/xen/suspend.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __XEN_SUSPEND_H__
+#define __XEN_SUSPEND_H__
+
+#if __has_include(<asm/suspend.h>)
+#include <asm/suspend.h>
+#else
+static inline int arch_domain_resume(struct domain *d)
+{
+    return 0;
+}
+#endif
+
+
+#endif /* __XEN_SUSPEND_H__ */
-- 
2.43.0


