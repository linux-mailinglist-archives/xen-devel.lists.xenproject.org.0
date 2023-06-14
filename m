Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D516730691
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549122.857527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqY-0007NK-I9; Wed, 14 Jun 2023 18:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549122.857527; Wed, 14 Jun 2023 18:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqY-0007J9-BO; Wed, 14 Jun 2023 18:03:54 +0000
Received: by outflank-mailman (input) for mailman id 549122;
 Wed, 14 Jun 2023 18:03:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9UqW-0005LA-Ha
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:03:52 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0d6b2f1-0add-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 20:03:50 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-62fea2f19d5so3534926d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:03:50 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:48 -0700 (PDT)
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
X-Inumbo-ID: d0d6b2f1-0add-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765829; x=1689357829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BW3lKTSm5JYkGrQYyurYltq8i3jFBvOnwjMyoQl8MJY=;
        b=cA4pTGbySBWczEcKbl+TGDjiEJCwYOqs54YBNFgohCp1tgWnET/wQ3X0NTMjRLxbm0
         jv5KELZXFxu9x0LtfwV+ocj+4KY3I/0EaeK3YceeIdpG5GUPjw0EzvuFIbO6Zivz17gF
         WImmEKDXJs8+3jhHATOgOkvXcFqH7m4z5GAL6vfU5CliY40AFLvGcuicSLakqD6wVeJK
         zmO/MlFGnvA5zgj1vn8iWQ32MuaSjsXE5BdWq/MWmJyp2jnPQtrKN43E+MdYHOBwyfYA
         2A1cET9XYwAxnVn6exRs7VRpiRSt7JXQdMQYrF9RDULW2bXGQTSf1jyd88ffcrQ7xcl3
         jEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765829; x=1689357829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BW3lKTSm5JYkGrQYyurYltq8i3jFBvOnwjMyoQl8MJY=;
        b=bHr1z+Q3qBWHkC8Lr+QllkJVvu6tSdWaBkwxy1P2/lpPgdfk6fFRCD/e6w69Dh0lS7
         rTsUBPYQ9dt51UtmXI7ShC8amSiW5v4sKhd1F13QSzEY9JYZL0Ic6smqoAaWYx8mBmjk
         Q1ti9v0dVJkM0/JDIiDNdh9rNoXgrfICZcD//bZLW/cvEdscKJARCR6ujeL1mutCUwSJ
         Ao0HTAQEO+BldvQeb50UPDdsYXIuX1uYE2qA9iQA0vz+pss+TIl7/yASuA55PbC3sN+y
         iPmeTuIxZPueShjoyzaK9HJaMX+WdtS/eDpMoKDgGcWepaqRKnQnci6waiJyuxFHxyk3
         pWtw==
X-Gm-Message-State: AC+VfDwd+3XRe+v2w9KHoEQnz9gcLNVOaxBWTJ87GH4OgPmOL7gskTsl
	10PwUtlwUA9DPYUcoL4V5ooqRczYxzk=
X-Google-Smtp-Source: ACHHUZ5Y/layCN4TDLjj5ioxrmoHmf9zUbZhIV64z78tfGT5H4NBF5sm6nLjqCJulx214g7aqajTYQ==
X-Received: by 2002:a05:6214:1941:b0:62f:eed1:4781 with SMTP id q1-20020a056214194100b0062feed14781mr225846qvk.21.1686765829046;
        Wed, 14 Jun 2023 11:03:49 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 07/15] xen/x86: Tweak PDC bits when using HWP
Date: Wed, 14 Jun 2023 14:02:45 -0400
Message-Id: <20230614180253.89958-8-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qubes testing of HWP support had a report of a laptop, Thinkpad X1
Carbon Gen 4 with a Skylake processor, locking up during boot when HWP
is enabled.  A user found a kernel bug that seems to be the same issue:
https://bugzilla.kernel.org/show_bug.cgi?id=110941.

That bug was fixed by Linux commit a21211672c9a ("ACPI / processor:
Request native thermal interrupt handling via _OSC").  The tl;dr is SMM
crashes when it receives thermal interrupts, so Linux calls the ACPI
_OSC method to take over interrupt handling.

The Linux fix looks at the CPU features to decide whether or not to call
_OSC with bit 12 set to take over native interrupt handling.  Xen needs
some way to communicate HWP to Dom0 for making an equivalent call.

Xen exposes modified PDC bits via the platform_op set_pminfo hypercall.
Expand that to set bit 12 when HWP is present and in use.

Any generated interrupt would be handled by Xen's thermal drive, which
clears the status.

Bit 12 isn't named in the linux header and is open coded in Linux's
usage.

This will need a corresponding linux patch to pick up and apply the PDC
bits.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v4:
Added __ro_after_init
s/ACPI_PDC_CPPC_NTV_INT/ACPI_PDC_CPPC_NATIVE_INTR/
Remove _IA32_
Fixup for opt_cpufreq_hwp removal
Add Jan Reviewed-by

v3:
New
---
 xen/arch/x86/acpi/cpufreq/hwp.c           | 16 +++++++++++-----
 xen/arch/x86/acpi/lib.c                   |  5 +++++
 xen/arch/x86/cpu/mcheck/mce_intel.c       |  6 ++++++
 xen/arch/x86/include/asm/msr-index.h      |  1 +
 xen/include/acpi/cpufreq/processor_perf.h |  1 +
 xen/include/acpi/pdc_intel.h              |  1 +
 6 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index c62345dde7..5f210b54ff 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -13,7 +13,8 @@
 #include <asm/msr.h>
 #include <acpi/cpufreq/cpufreq.h>
 
-static bool __ro_after_init feature_hwp;
+static bool __ro_after_init hwp_in_use;
+
 static bool __ro_after_init feature_hwp_notification;
 static bool __ro_after_init feature_hwp_activity_window;
 
@@ -168,6 +169,11 @@ static int __init cf_check cpufreq_gov_hwp_init(void)
 }
 __initcall(cpufreq_gov_hwp_init);
 
+bool hwp_active(void)
+{
+    return hwp_in_use;
+}
+
 bool __init hwp_available(void)
 {
     unsigned int eax;
@@ -211,7 +217,6 @@ bool __init hwp_available(void)
         return false;
     }
 
-    feature_hwp                 = eax & CPUID6_EAX_HWP;
     feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
     feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
     feature_hdc = eax & CPUID6_EAX_HDC;
@@ -224,12 +229,13 @@ bool __init hwp_available(void)
     hwp_verbose("HW_FEEDBACK %ssupported\n",
                 (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
 
-    cpufreq_governor_internal = feature_hwp;
+    hwp_in_use = eax & CPUID6_EAX_HWP;
+    cpufreq_governor_internal = hwp_in_use;
 
-    if ( feature_hwp )
+    if ( hwp_in_use )
         hwp_info("Using HWP for cpufreq\n");
 
-    return feature_hwp;
+    return hwp_in_use;
 }
 
 static int hdc_set_pkg_hdc_ctl(unsigned int cpu, bool val)
diff --git a/xen/arch/x86/acpi/lib.c b/xen/arch/x86/acpi/lib.c
index 43831b92d1..1b4710a790 100644
--- a/xen/arch/x86/acpi/lib.c
+++ b/xen/arch/x86/acpi/lib.c
@@ -26,6 +26,8 @@
 #include <asm/fixmap.h>
 #include <asm/mwait.h>
 
+#include <acpi/cpufreq/processor_perf.h>
+
 u32 __read_mostly acpi_smi_cmd;
 u8 __read_mostly acpi_enable_value;
 u8 __read_mostly acpi_disable_value;
@@ -140,5 +142,8 @@ int arch_acpi_set_pdc_bits(u32 acpi_id, u32 *pdc, u32 mask)
 	    !(ecx & CPUID5_ECX_INTERRUPT_BREAK))
 		pdc[2] &= ~(ACPI_PDC_C_C1_FFH | ACPI_PDC_C_C2C3_FFH);
 
+	if (hwp_active())
+		pdc[2] |= ACPI_PDC_CPPC_NATIVE_INTR;
+
 	return 0;
 }
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 2f23f02923..c95152ad85 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -15,6 +15,9 @@
 #include <asm/p2m.h>
 #include <asm/mce.h>
 #include <asm/apic.h>
+
+#include <acpi/cpufreq/processor_perf.h>
+
 #include "mce.h"
 #include "x86_mca.h"
 #include "barrier.h"
@@ -64,6 +67,9 @@ static void cf_check intel_thermal_interrupt(struct cpu_user_regs *regs)
 
     ack_APIC_irq();
 
+    if ( hwp_active() )
+        wrmsr_safe(MSR_HWP_STATUS, 0);
+
     if ( NOW() < per_cpu(next, cpu) )
         return;
 
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 47b09a24b5..351745f6bc 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -157,6 +157,7 @@
 #define MSR_HWP_CAPABILITIES                0x00000771
 #define MSR_HWP_INTERRUPT                   0x00000773
 #define MSR_HWP_REQUEST                     0x00000774
+#define MSR_HWP_STATUS                      0x00000777
 
 #define MSR_X2APIC_FIRST                    0x00000800
 #define MSR_X2APIC_LAST                     0x000008ff
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index b751ca4937..dd8ec36ba7 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -8,6 +8,7 @@
 #define XEN_PX_INIT 0x80000000
 
 bool hwp_available(void);
+bool hwp_active(void);
 int hwp_register_driver(void);
 
 int powernow_cpufreq_init(void);
diff --git a/xen/include/acpi/pdc_intel.h b/xen/include/acpi/pdc_intel.h
index 4fb719d6f5..abaa098b51 100644
--- a/xen/include/acpi/pdc_intel.h
+++ b/xen/include/acpi/pdc_intel.h
@@ -17,6 +17,7 @@
 #define ACPI_PDC_C_C1_FFH		(0x0100)
 #define ACPI_PDC_C_C2C3_FFH		(0x0200)
 #define ACPI_PDC_SMP_P_HWCOORD		(0x0800)
+#define ACPI_PDC_CPPC_NATIVE_INTR	(0x1000)
 
 #define ACPI_PDC_EST_CAPABILITY_SMP	(ACPI_PDC_SMP_C1PT | \
 					 ACPI_PDC_C_C1_HALT | \
-- 
2.40.1


