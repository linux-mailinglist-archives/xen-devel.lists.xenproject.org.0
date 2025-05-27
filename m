Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E03DAC4B5F
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 11:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998155.1378947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJqTT-00035Q-3V; Tue, 27 May 2025 09:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998155.1378947; Tue, 27 May 2025 09:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJqTS-00032e-VI; Tue, 27 May 2025 09:19:54 +0000
Received: by outflank-mailman (input) for mailman id 998155;
 Tue, 27 May 2025 09:19:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdBa=YL=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uJqTR-0002b2-5d
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 09:19:53 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bede1c3a-3adb-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 11:19:52 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-549b116321aso4270147e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 02:19:52 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5521b9f9decsm1663715e87.157.2025.05.27.02.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 02:19:50 -0700 (PDT)
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
X-Inumbo-ID: bede1c3a-3adb-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748337592; x=1748942392; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0A4iHWHgJ3OVUk46IxGg4V5avDY0YuDEfMj7z0UPvo=;
        b=dbXL7Ja27hauio6FLNp81DWR9NNrbkljcjODV8KKh1W4qmuAcexv3j/2UAe8OW4uBr
         L+LDTlGUMRoaQDdrMN5+t1vDFKMgE+2Ww8SWZdwxSFSj5Lv95v8mT/2Tj+seyl7PirKJ
         NO0gqbiw9wReLv1WGP3t0WgrNz4cVVZ0nH9VaW44rcQJtJ8dEzq66Ihevvg7Ljy5gzO/
         SF6kzbsLvGVm6+BGccgcOAF5/FT/Dx/nv4sflgsCdaV3Cqn9IwQPwMhtNjft/LxmUxYJ
         HceDd3EzD+MDd/aou225tnXicbtzJ8pZP78+IaezthZb+8HcjeyOkEaVN//qaJC7q6YZ
         oB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748337592; x=1748942392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V0A4iHWHgJ3OVUk46IxGg4V5avDY0YuDEfMj7z0UPvo=;
        b=a7NjPVBIZafRkgoHfXoGMo9uASx2l9NnIiH4EXBCZnn8AfCQpM2jxFi5WKJSX/ap3r
         NCTxouooE12C+Ny8t++YgfVomKvCxbIpWFMpIb+ezJ+JCpnc7N5xdX5ZY8IuVTcuzE2Y
         tD5ywN8cw7vjSKHa2nntbGThaZGfDRSEWlrVlg6CF0g+bxeP50rGT2Ul/FvYVm341c/M
         LKFXvReCQeRTxjFdwZjJYZg1Od66N4xpQ25s/MIhAFmwRqqospRWZlqmrDhUDMlyFDHo
         QwtYKh5PoXGo0EZS7cw2bE6MvgGXuqTtsJKPGW8cCZOpPxXsGk4Pntft8I3vsvVnMd8Y
         Mbwg==
X-Gm-Message-State: AOJu0YxSckoflaRMyeJI1Q7kkWWwV7vdUA5rimw+pApF5S0n1ytOc0jH
	DETe0jXHab5cu4A2nPmxFOMOb/yMHdWaCufewl53uofcC8Q5cF7kCBlGdqnKPUJs
X-Gm-Gg: ASbGncshhydX6C/lQX7mvHWsy3tV/fvWR8GiHU9WIZPI51Wx5WUoIhV1+k5CZfKRPfy
	+tOyExSlnryfbT693pWxkfCeWzdJ0Oya0XN1bx3ITNWBmR/1ih9sl/1Jkt3CyqJfJZDKQY5Q1pS
	JRDpTdXI3dKWNLIKhNL65BEtZ/1STctVr0E8TBXsHssf2wlNmGim/MUoFrCJiqNreP+676rbiY5
	yTB96pdBAKBnTrD3Zwu2svhjaSozHUzbr5tLk4i+HzGlqBsH9vrQLG46RisRwcCSlEo0Sn6mZNV
	WtxUUiDuUzD5RMDa+zdZ+W1G4FY5e+Ax4wj4pgfKDmTqoE9Hpa3NtnIUiHPq83tcpQ+IN4eW8c4
	Zp8kQ8plqyO3L8hk=
X-Google-Smtp-Source: AGHT+IHTg8h0ECxQ6SiPB5yOGc+qjrBov5X5L6YLzQJlCTfel3hBbXp6k05FA1Guj3dGKyh/SP23OA==
X-Received: by 2002:a05:6512:3985:b0:553:2633:8a65 with SMTP id 2adb3069b0e04-55326338bcamr1101322e87.30.1748337591419;
        Tue, 27 May 2025 02:19:51 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4][PART 1 2/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
Date: Tue, 27 May 2025 12:18:55 +0300
Message-ID: <1a8313537603bee36636b0fcd2fdc2f76a2374fb.1748337249.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748337249.git.mykola_kvach@epam.com>
References: <cover.1748337249.git.mykola_kvach@epam.com>
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
- Treats suspend as a "standby" operation: the domain is shut down with
  SHUTDOWN_suspend, and resumes execution at the instruction following
  the call

Usage:

For Linux-based guests, suspend can be initiated with:
    echo mem > /sys/power/state
or via:
    systemctl suspend

Resuming the guest is performed from control domain using:
      xl resume <domain>

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V3:
Dropped all domain flags and related code (which touched common functions like
vcpu_unblock), keeping only the necessary changes for Xen suspend/resume, i.e.
suspend/resume is now fully supported only for the hardware domain.
Proper support for domU suspend/resume will be added in a future patch.
This patch does not yet include VCPU context reset or domain context
restoration in VCPU.

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
---
 xen/arch/arm/include/asm/perfc_defn.h |  1 +
 xen/arch/arm/include/asm/psci.h       |  2 +
 xen/arch/arm/vpsci.c                  | 64 +++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

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
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index d1615be8a6..866bd3128b 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -197,6 +197,57 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
 
+static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
+{
+    struct vcpu *v;
+    struct domain *d = current->domain;
+
+    /* Drop this check once SYSTEM_SUSPEND is supported in hardware domain */
+    if ( is_hardware_domain(d) )
+        return PSCI_NOT_SUPPORTED;
+
+    /* Ensure that all CPUs other than the calling one are offline */
+    for_each_vcpu ( d, v )
+    {
+        if ( v != current && is_vcpu_online(v) )
+            return PSCI_DENIED;
+    }
+
+    /*
+     * System suspend requests are treated as performing standby
+     * as this simplifies Xen implementation.
+     *
+     * Arm Power State Coordination Interface (DEN0022F.b)
+     *
+     * 5.20.2 Caller responsibilities
+     * The call is equivalent to using the CPU_SUSPEND call for the deepest
+     * possible platform powerdown state. Consequently, the caller must observe
+     * all the rules described for CPU_SUSPEND. See section 5.4.
+     *
+     * 5.4.5 Caller responsibilities
+     * The caller must not assume that a powerdown request will return using
+     * the specified entry point address. The powerdown request might not
+     * complete due, for example, to pending interrupts. It is also possible
+     * that, because of coordination with other cores, the actual state entered
+     * is shallower than the one requested. Because of this it is possible for
+     * an implementation to downgrade the powerdown state request to a standby
+     * state. In the case of a downgrade to standby, the implementation returns
+     * at the instruction following the PSCI call, at the Exception level of
+     * the caller, instead of returning by the specified entry point address.
+     * The return code in this case is SUCCESS. In the case of an early return
+     * due to a pending wakeup event, the implementation can return at the next
+     * instruction, with a return code of SUCCESS, or resume at the specified
+     * entry point address.
+     *
+     * 5.4.9 Implementation responsibilities: State on return
+     * When returning from a standby state, the caller must observe no change in
+     * core state, other than any timer changes expected because of the time
+     * spent in the state, and changes in the CPU interface because of the
+     * wakeup reason.
+     */
+    return domain_shutdown(d, SHUTDOWN_suspend) ? PSCI_DENIED : PSCI_SUCCESS;
+}
+
 static int32_t do_psci_1_0_features(uint32_t psci_func_id)
 {
     /* /!\ Ordered by function ID and not name */
@@ -214,6 +265,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
     case PSCI_0_2_FN32_SYSTEM_OFF:
     case PSCI_0_2_FN32_SYSTEM_RESET:
     case PSCI_1_0_FN32_PSCI_FEATURES:
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
     case ARM_SMCCC_VERSION_FID:
         return 0;
     default:
@@ -344,6 +397,17 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
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


