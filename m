Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C47A4FA2E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902050.1310010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl8p-0005GN-TH; Wed, 05 Mar 2025 09:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902050.1310010; Wed, 05 Mar 2025 09:34:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpl8p-0005E0-QF; Wed, 05 Mar 2025 09:34:15 +0000
Received: by outflank-mailman (input) for mailman id 902050;
 Wed, 05 Mar 2025 09:34:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknV-0006ew-9e
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:13 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eae9feb7-f9a1-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:12:09 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30795988ebeso70455221fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:09 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:12:08 -0800 (PST)
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
X-Inumbo-ID: eae9feb7-f9a1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165929; x=1741770729; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3W14MD7/86/g9aWL0OyKxo1c/Lcp0Ms013eqB7XEj1s=;
        b=Z3yWu9J4a+us/cE2M+nyFs/v8dcHXtvQP4niHtf1nC4Q85MHU+tSU3U7Zqb8j3f3WT
         U7ZNlYxs6G+S6yzjq33Y7/OJaXU6jKUWtDb+w+cZg+ux2P6bv1dkTDkFgAm+mViwQo/m
         TO1gNgOV+A6wdDMZrJt4tOyWtStsXy0j9YqPd46Rg41rzZ++EUgkBCVYA5ck54pOCB4L
         hbU1pGRilNR7o6f09B/G3MzMk34F1sXnO+fTkA7AIPJeeuImhMNL5HAi519hVeP0md92
         slUxW7Ksc9NonMSrI7hxIfFlbmK/dMXYJApYNNQO71qu5jraC+rn7cKvOswqijKdkscZ
         jtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165929; x=1741770729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W14MD7/86/g9aWL0OyKxo1c/Lcp0Ms013eqB7XEj1s=;
        b=gtvWRKrMX5aOnDpsNmwFhQsJopf5/flmH2rCmRm5noxSYQURXujxe4M+exXARZ+pOU
         phxXvwVQLqHoJ3k7hl4dDbI0gR4zH9qESov/cauDabYwEVni+/N/iuMvd90kvCuQicDB
         2dyL1aH5lKtnvFgKkPj5SAjeUO5eKmOtRmgCGfs7//nZTm5aIXBliHWUuf/vd+5yadpp
         C4tk3JnOvTCcGPoxQxhumT/5h2JJF7w3UgiiAp5I5KHqW6+m2S9qnmjoYJd7ZOfAPQ1u
         hGnlQQPt6C4tJX9Izw6I31PC0O1SSesvYOEvyy2Ff0K0ozuqTO6nYuGtHs2k9SOQ7lBj
         mMdA==
X-Gm-Message-State: AOJu0Yx6qAQa+vG5jyFNsHMjk3UKfheUp81Y4Y22gbutwg5ddHGmhh0V
	qkQJufnHcn05eB1Lrwnkln8FFEUPdWnysuyZTu0gVy/0ljRa40bx4shuRMfi
X-Gm-Gg: ASbGncsLG8AEuedvg+P8CbkqW7tG9nyvDocwkCJSyVmEXWO70AwQOz9QmTBeazF7AYI
	UwA3dMmfduvejOuaPp8AoT7HnhFojyBbl8ue8gZJ+O69071LRehU2QyHXJeyrsxI54yzxXsTdfF
	mN4gg/OU3X8EI8FECACLA5UhttO5Aq+d8pcUGzWOMw7BzzpoaONL0yP7+Plo5gV1sd6bK64Kfp7
	2Ud+2VBkU5O4+MKp6raL/haLI20lDaj5ENQJsSrnciatozyGB+6XWhc06vTEd08lxpftOnL3W2Q
	ndp80wlzjndbJu9AUKZZAidDzbBnr/VdBVKjwDPFZxqqCt1QGg==
X-Google-Smtp-Source: AGHT+IHQsJOO4SuJsHrELM1lWwUKSgDLp7NtfJ0oyLHVNFhvpstCp9DJaI/6CvympNyJ+jpwD5UDHQ==
X-Received: by 2002:a05:6512:3e06:b0:546:2f7a:38c4 with SMTP id 2adb3069b0e04-5497d335a4bmr910471e87.13.1741165928655;
        Wed, 05 Mar 2025 01:12:08 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH 11/16] xen/arm: Implement PSCI system suspend
Date: Wed,  5 Mar 2025 11:11:19 +0200
Message-ID: <b80f0559048638bfe1a934f2d256331db733ed3e.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

The implementation consists of:
-Adding PSCI system suspend call as new PSCI function
-Trapping PSCI system_suspend HVC
-Implementing PSCI system suspend call (virtual interface that allows
 guests to suspend themselves), but currently it is only partially
 implemented, so suspend/resume will correctly work only for dom0

The PSCI system suspend should be called by a guest from its boot
VCPU. Non-boot VCPUs of the guest should be hot-unplugged using PSCI
CPU_OFF call prior to issuing PSCI system suspend. Interrupts that
are left enabled by the guest are assumed to be its wake-up interrupts.
Therefore, a wake-up interrupt triggers the resume of the guest. Guest
should resume regardless of the state of Xen (suspended or not).

When a guest calls PSCI system suspend the respective domain will be
suspended if the following conditions are met:
1) Given resume entry point is not invalid
2) Other (if any) VCPUs of the calling guest are hot-unplugged

If the conditions above are met the calling domain is labeled as
suspended and the calling VCPU is blocked. If nothing else wouldn't
be done the suspended domain would resume from the place where it
called PSCI system suspend. This is expected if processing of the PSCI
system suspend call fails. However, in the case of success the calling
guest should resume (continue execution after the wake-up) from the entry
point which is given as the first argument of the PSCI system suspend
call. In addition to the entry point, the guest expects to start within
the environment whose state matches the state after reset. This means
that the guest should find reset register values, MMU disabled, etc.
Thereby, the context of VCPU should be 'reset' (as if the system is
comming out of reset), the program counter should contain entry point,
which is 1st argument, and r0/x0 should contain context ID which is 2nd
argument of PSCI system suspend call. The context of VCPU is set
accordingly when the PSCI system suspend is processed, so that nothing
needs to be done on resume/wake-up path.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V3:
Dropped all domain flags and related code (which touched common functions like
vcpu_unblock), keeping only the necessary changes for Xen suspend/resume, i.e.
suspend/resume is now fully supported only for the hardware domain.
Proper support for domU suspend/resume will be added in a future patch.
This patch does not yet include VCPU context reset or domain context
restoration in VCPU.
---
 xen/arch/arm/Makefile                 |  1 +
 xen/arch/arm/include/asm/domain.h     |  3 ++
 xen/arch/arm/include/asm/perfc_defn.h |  1 +
 xen/arch/arm/include/asm/psci.h       |  2 +
 xen/arch/arm/include/asm/suspend.h    | 18 +++++++
 xen/arch/arm/suspend.c                | 67 +++++++++++++++++++++++++++
 xen/arch/arm/vpsci.c                  | 32 +++++++++++++
 7 files changed, 124 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/arch/arm/suspend.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 43ab5e8f25..70d4b5daf8 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -53,6 +53,7 @@ obj-y += smpboot.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
+obj-$(CONFIG_SYSTEM_SUSPEND) += suspend.o
 obj-y += sysctl.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 50b6a4b009..8b1bdf3d74 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -233,6 +233,9 @@ struct arch_vcpu
     struct vtimer virt_timer;
     bool   vtimer_initialized;
 
+    register_t suspend_ep;
+    register_t suspend_cid;
+
     /*
      * The full P2M may require some cleaning (e.g when emulation
      * set/way). As the action can take a long time, it requires
diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
index 3ab0391175..5049563718 100644
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
index 0000000000..745377dbcf
--- /dev/null
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_ARM_SUSPEND_H__
+#define __ASM_ARM_SUSPEND_H__
+
+int32_t domain_suspend(register_t epoint, register_t cid);
+
+#endif
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
diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
new file mode 100644
index 0000000000..27fab8c999
--- /dev/null
+++ b/xen/arch/arm/suspend.c
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/sched.h>
+#include <asm/cpufeature.h>
+#include <asm/event.h>
+#include <asm/psci.h>
+#include <asm/suspend.h>
+#include <asm/platform.h>
+#include <public/sched.h>
+
+static void vcpu_suspend_prepare(register_t epoint, register_t cid)
+{
+    struct vcpu *v = current;
+
+    v->arch.suspend_ep = epoint;
+    v->arch.suspend_cid = cid;
+}
+
+int32_t domain_suspend(register_t epoint, register_t cid)
+{
+    struct vcpu *v;
+    struct domain *d = current->domain;
+    bool is_thumb = epoint & 1;
+
+    dprintk(XENLOG_DEBUG,
+            "Dom%d suspend: epoint=0x%"PRIregister", cid=0x%"PRIregister"\n",
+            d->domain_id, epoint, cid);
+
+    /* THUMB set is not allowed with 64-bit domain */
+    if ( is_64bit_domain(d) && is_thumb )
+        return PSCI_INVALID_ADDRESS;
+
+    /* TODO: care about locking here */
+    /* Ensure that all CPUs other than the calling one are offline */
+    for_each_vcpu ( d, v )
+    {
+        if ( v != current && is_vcpu_online(v) )
+            return PSCI_DENIED;
+    }
+
+    /*
+     * Prepare the calling VCPU for suspend (save entry point into pc and
+     * context ID into r0/x0 as specified by PSCI SYSTEM_SUSPEND)
+     */
+    vcpu_suspend_prepare(epoint, cid);
+
+    /* Disable watchdogs of this domain */
+    watchdog_domain_suspend(d);
+
+    /*
+     * The calling domain is suspended by blocking its last running VCPU. If an
+     * event is pending the domain will resume right away (VCPU will not block,
+     * but when scheduled in it will resume from the given entry point).
+     */
+    vcpu_block_unless_event_pending(current);
+
+    return PSCI_SUCCESS;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index d1615be8a6..96eef06c18 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -7,6 +7,7 @@
 #include <asm/vgic.h>
 #include <asm/vpsci.h>
 #include <asm/event.h>
+#include <asm/suspend.h>
 
 #include <public/sched.h>
 
@@ -197,6 +198,15 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
 
+static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
+{
+#ifdef CONFIG_SYSTEM_SUSPEND
+    return domain_suspend(epoint, cid);
+#else
+    return PSCI_NOT_SUPPORTED;
+#endif
+}
+
 static int32_t do_psci_1_0_features(uint32_t psci_func_id)
 {
     /* /!\ Ordered by function ID and not name */
@@ -214,6 +224,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
     case PSCI_0_2_FN32_SYSTEM_OFF:
     case PSCI_0_2_FN32_SYSTEM_RESET:
     case PSCI_1_0_FN32_PSCI_FEATURES:
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
     case ARM_SMCCC_VERSION_FID:
         return 0;
     default:
@@ -344,6 +356,26 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
         return true;
     }
 
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
+    {
+        register_t epoint = PSCI_ARG(regs,1);
+        register_t cid = PSCI_ARG(regs,2);
+        register_t ret;
+
+        perfc_incr(vpsci_system_suspend);
+        /* Set the result to PSCI_SUCCESS if the call fails.
+         * Otherwise preserve the context_id in x0. For now
+         * we don't support the case where the system is suspended
+         * to a shallower level and PSCI_SUCCESS is returned to the
+         * caller.
+         */
+        ret = do_psci_1_0_system_suspend(epoint, cid);
+        if ( ret != PSCI_SUCCESS )
+            PSCI_SET_RESULT(regs, ret);
+        return true;
+    }
+
     default:
         return false;
     }
-- 
2.43.0


