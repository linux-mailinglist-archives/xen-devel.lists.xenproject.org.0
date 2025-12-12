Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3EBCB8E54
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 14:23:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185384.1507565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU36S-0000bH-1A; Fri, 12 Dec 2025 13:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185384.1507565; Fri, 12 Dec 2025 13:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU36R-0000YB-TI; Fri, 12 Dec 2025 13:22:35 +0000
Received: by outflank-mailman (input) for mailman id 1185384;
 Fri, 12 Dec 2025 13:22:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qjHH=6S=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vU36Q-0000XM-TL
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 13:22:35 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d71dc3f-d75d-11f0-9cce-f158ae23cfc8;
 Fri, 12 Dec 2025 14:22:32 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6499159273dso1451200a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 05:22:32 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-4.as6723.net. [185.5.253.4])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-649820f77fbsm5168260a12.19.2025.12.12.05.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 05:22:30 -0800 (PST)
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
X-Inumbo-ID: 9d71dc3f-d75d-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765545751; x=1766150551; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIP3SfEKENNmXaK6cHV/ouukhRUCsSHaHnKoL4OIvAA=;
        b=CVWgNP9MYTNAln43hXyW0NyKhfhKrhIdb/VPg+SAaU5kOKneLF6Z2rPNFjWDJIE1nK
         /d/YvfdqoX2Mg8Draw9hjU1Xa5Rl1Z5KuboQPflm79Xu8wBZg8Q2RRZeQaZEbdy4S2Bc
         cvyHqB9wILQFtt/YIju2+toCO1Z5cOIj/7ldFT4r24U+wMMNoit4M4hExEISCmrnaGv4
         S7c8XW26yVviWfG/Hvzcf9gvdbSgEf1LivYz927Z2IEfMdnFE/rzibmKwBBpM0cpC04b
         jK/7g/RL9syBloBVn4J6+ugPq0hGa54AF3seeSTX477AE8r4KxHLx9KsTplVJ9NbEKJO
         MZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765545751; x=1766150551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yIP3SfEKENNmXaK6cHV/ouukhRUCsSHaHnKoL4OIvAA=;
        b=asunE2j6YRADy3UEG0GjPRGcNx5R6NdMwZPtoCYrqMbWlc6Gn6c5qIofjXVWtk82+T
         PFHum9EXZJ5agrvIEEtU4FYvXMi90wDay5FnASIXGRo/jINwUbUh7qyi7rLIMZsJ0ID6
         TNaWzeIO5o1Myo+vyjtQEJ/Va2rHBW7Yg1xyuw3WF2Vonb1/g8kKjZR8Nj862o3+CsNR
         qUy8Hz+AmXuUAsiUqVQJfyRqkKw/l3SJ+bGw0oVwW+M32CoUdulxuWVAQs3wpd5oHRE8
         ZjLxeMLz4z6woumg+p6O0kMzrE7/hAc5Zn4lAYZ5++cEu0p1ppbwwUeEhiezar3KFudZ
         5Z6w==
X-Gm-Message-State: AOJu0Yx4PswePOWdcVsH+W2br2gRsZgf7TSn+jGiGnopBPgkEYWO9+mN
	HF0Nf6BE7/j5Syds5N/IcBnUrZR8ekT5u/oIe8a3XFBSd4uMhO+6TOiAwQ75sh+c
X-Gm-Gg: AY/fxX6OdcSFSxlzuXl4hZNFnsQHpGESCm/CLGLc6pDcWmpIsuO/sduqDZ194a3MGeE
	cQmPTB99Vc6nuXRnabcYX+bliKGBgEPwvB7rBsjmxBstAXWUcBzwGh5dEVnwgPYNWvh3Xw/xaiL
	tTQiHJcW1VQu901ZB/DumELrnQjls7smuFJDAj1W9CTOFGVUlBLWVGIWrFmxtCg9h4E8LeA6tN0
	0+uOLGi/teMSluovDO66ItjGB1MvZj8+KKkQWULn3b/JLQgsZYqj6jL+CXOFehl6ff3T1zk+K8L
	2XIF2GFxNjujwg68t7NTMemwSQ/FB2+w6TbqwRaL8iQs0yr+pgl6dySQVCAi8HUOXcZfG5HGmt3
	jvS6G/wxtc6mM2VrRUvHvoUs1Kf2rCfmS35l/WLfgHaAb4THqHe0/XIUsjRWp4IBW5kFcAGtztn
	fEd+XGo9EYWp8LA/oaLPhBpz0Og7sfAt2yS9HeN9Bp
X-Google-Smtp-Source: AGHT+IFcSgWpsZtXTMwLskLJqr7Z8qqlgxwtEsEtGFnFRCUSxymEjlxdaSAwWlxEKroRl0M366aZSw==
X-Received: by 2002:a05:6402:2709:b0:647:54f9:cce6 with SMTP id 4fb4d7f45d1cf-6499b182ee4mr1997508a12.12.1765545751057;
        Fri, 12 Dec 2025 05:22:31 -0800 (PST)
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
Subject: [PATCH v16 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
Date: Fri, 12 Dec 2025 15:18:18 +0200
Message-ID: <f1d118552f84e2b894ec7163000f6dba98d0e3fa.1765533584.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765533584.git.mykola_kvach@epam.com>
References: <cover.1765533584.git.mykola_kvach@epam.com>
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
steps required by the platform. arch_domain_resume() stays int to propagate
errno-style detail into common logging; preserving the integer keeps the
reason visible and leaves room for future arch-specific failures or richer
handling.

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
Changes in V16:
- Refactor error handling in domain_resume: move logging to generic code,
  use explicit return code checking.
- Make context clearing conditional on success in arch_domain_resume.
- The 'int' return type is retained for arch_domain_resume for consistency
  with other arch hooks and to allow for specific negative error codes.
---
 xen/arch/arm/domain.c                 |  39 +++++++++
 xen/arch/arm/include/asm/domain.h     |   2 +
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/suspend.h    |  27 ++++++
 xen/arch/arm/include/asm/vpsci.h      |   5 +-
 xen/arch/arm/vpsci.c                  | 116 +++++++++++++++++++++-----
 xen/common/domain.c                   |  10 +++
 xen/include/xen/suspend.h             |  25 ++++++
 9 files changed, 205 insertions(+), 22 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/include/xen/suspend.h

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 47973f99d9..f903e7d4f0 100644
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
@@ -851,6 +855,41 @@ void arch_domain_creation_finished(struct domain *d)
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
+                "%pd: Invalid domain state for resume: is_shutting_down=%u, shutdown_code=%u\n",
+                d, d->is_shutting_down, d->shutdown_code);
+        return -EINVAL;
+    }
+
+    /*
+     * It is still possible to call domain_shutdown() with a suspend reason
+     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_shutdown.
+     * In these cases, the resume context will be empty.
+     * This is not expected to cause any issues, so we just notify about the
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
+    if ( !rc )
+        memset(ctx, 0, sizeof(*ctx));
+
+    return rc;
+}
+
 static int is_guest_pv32_psr(uint32_t psr)
 {
     switch (psr & PSR_MODE_MASK)
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 758ad807e4..66b1246892 100644
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
index 0000000000..313d03ea59
--- /dev/null
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ARM_SUSPEND_H
+#define ARM_SUSPEND_H
+
+struct domain;
+struct vcpu;
+
+struct resume_info {
+    register_t ep;
+    register_t cid;
+    struct vcpu *wake_cpu;
+};
+
+int arch_domain_resume(struct domain *d);
+
+#endif /* ARM_SUSPEND_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
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
index 7ba9ccd94b..c4d616ec68 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -10,32 +10,16 @@
 
 #include <public/sched.h>
 
-static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
-                            register_t context_id)
+int vpsci_vcpu_up_prepare(struct vcpu *v, register_t entry_point,
+                          register_t context_id)
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
+            "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
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
index 93c71bc766..09ad0a26ee 100644
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
@@ -1374,6 +1375,7 @@ int domain_shutdown(struct domain *d, u8 reason)
 void domain_resume(struct domain *d)
 {
     struct vcpu *v;
+    int rc;
 
     /*
      * Some code paths assume that shutdown status does not get reset under
@@ -1383,6 +1385,13 @@ void domain_resume(struct domain *d)
 
     spin_lock(&d->shutdown_lock);
 
+    rc = arch_domain_resume(d);
+    if ( rc )
+    {
+        printk("%pd: Failed to resume domain (ret %d)\n", d, rc);
+        goto fail;
+    }
+
     d->is_shutting_down = d->is_shut_down = 0;
     d->shutdown_code = SHUTDOWN_CODE_INVALID;
 
@@ -1393,6 +1402,7 @@ void domain_resume(struct domain *d)
         v->paused_for_shutdown = 0;
     }
 
+ fail:
     spin_unlock(&d->shutdown_lock);
 
     domain_unpause(d);
diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
new file mode 100644
index 0000000000..528879c2a9
--- /dev/null
+++ b/xen/include/xen/suspend.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_SUSPEND_H
+#define XEN_SUSPEND_H
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
+#endif /* XEN_SUSPEND_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


