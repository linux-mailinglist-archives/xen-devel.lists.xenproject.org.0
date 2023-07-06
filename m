Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C507D74A3FD
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:55:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559980.875525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8k-00066J-Kg; Thu, 06 Jul 2023 18:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559980.875525; Thu, 06 Jul 2023 18:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8k-0005zF-Dv; Thu, 06 Jul 2023 18:55:42 +0000
Received: by outflank-mailman (input) for mailman id 559980;
 Thu, 06 Jul 2023 18:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU8j-0003x0-Ei
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:55:41 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2ee0279-1c2e-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 20:55:39 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7659c6cae2cso92082485a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:55:39 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:37 -0700 (PDT)
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
X-Inumbo-ID: b2ee0279-1c2e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669738; x=1691261738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KN/89cmmlDVrGXWlTK5wABJrp3BHjn1APTznmlWm8Is=;
        b=VKYpegKTek9Wj6oG+Y0lrCkwIJEnH47KefRCM4WhP/vkljR/H8nBtXz+CoYKK4b29J
         SkpxIGjtaV/in2pgOQKdY8oI3lJRoZxpXPPApl/pMsCX7VSX8zI4ozfAA3+LzhYKMpqs
         slbxHWCvbYgYKVFgfxkunTmD6FL5B0bonbH834v9Vn2t29oq63XNWjmB1utLMPUgnyo1
         d3ooDy3I/xwalkZUJDw1VeHxB7zKokNHia1rS5RL8Jk6GerCw/xrMh66RVMQg1te3AWy
         AT6Ne5QAQJiezMS6owD8PT4U1Xviyzahj9BFfl5+efaWPenNQ3757/QZ1RdXT9MOFghf
         dcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669738; x=1691261738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KN/89cmmlDVrGXWlTK5wABJrp3BHjn1APTznmlWm8Is=;
        b=E1kPXXgTV/kVOFbeCPj/RhjIS1+0bOos4OZoSVfNq3XplQ4LQf3LRnuCXUXzyACs05
         vSeQm5hiGrOIL0RnLqEeHhAuscqoy4yb/qO7HwXOvZ646GWc5N5gykwGnKnEV3osRldm
         D84AXDaS71BhEITZ76WAwaOTQHJhxfCNxNWn/zqvq0XkHMU1J24fTUclyIaCmrCh9n3V
         nxm37sMqfrEiL9l19lyeMA06o6Ka+uxaoP0FaAVV/Q/Jy9K2vatB++Rmx3ftJEQhigaE
         Tg9bhJiko4tEL26n0iQoGFv1TRzelPTn/1WW/GIEeYI/wtLHf7IY14HU/CsVrCFvjCAX
         8tbw==
X-Gm-Message-State: ABy/qLZ6VKC1YGe1vjEBYoC4NXgasCXZKrJ1Qgn1R0ibPHcl1oVaixEl
	6DO0LG0KIZlV0dQghO5wVFkVZbZZpvM=
X-Google-Smtp-Source: APBJJlFDmGfdCx45dI2upKrHXVttiysn3TYraZbQ0DOoV4J2w7H7RRRC+5i2RvOiEVWWDU+vAMiYJA==
X-Received: by 2002:a05:620a:2546:b0:767:a1ab:b3db with SMTP id s6-20020a05620a254600b00767a1abb3dbmr2579014qko.16.1688669738038;
        Thu, 06 Jul 2023 11:55:38 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 07/15] xen/x86: Tweak PDC bits when using HWP
Date: Thu,  6 Jul 2023 14:54:32 -0400
Message-ID: <20230706185440.48333-8-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
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
usage.  Name it ACPI_PDC_CPPC_NATIVE_INTR.

This will need a corresponding linux patch to pick up and apply the PDC
bits.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v5:
Minor fixup for feature_hwp removal
Use cpurfreq.h for declaration

v4:
Added __ro_after_init
s/ACPI_PDC_CPPC_NTV_INT/ACPI_PDC_CPPC_NATIVE_INTR/
Remove _IA32_
Fixup for opt_cpufreq_hwp removal
Add Jan Reviewed-by

v3:
New
---
 xen/arch/x86/acpi/cpufreq/hwp.c      | 9 +++++++++
 xen/arch/x86/acpi/lib.c              | 5 +++++
 xen/arch/x86/cpu/mcheck/mce_intel.c  | 6 ++++++
 xen/arch/x86/include/asm/msr-index.h | 1 +
 xen/include/acpi/cpufreq/cpufreq.h   | 1 +
 xen/include/acpi/pdc_intel.h         | 1 +
 6 files changed, 23 insertions(+)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 1ac07bbeb1..ce897d566f 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -12,6 +12,8 @@
 #include <asm/msr.h>
 #include <acpi/cpufreq/cpufreq.h>
 
+static bool __ro_after_init hwp_in_use;
+
 static bool __ro_after_init feature_hwp_notification;
 static bool __ro_after_init feature_hwp_activity_window;
 
@@ -150,6 +152,11 @@ static int __init cf_check cpufreq_gov_hwp_init(void)
 }
 __initcall(cpufreq_gov_hwp_init);
 
+bool hwp_active(void)
+{
+    return hwp_in_use;
+}
+
 static bool __init hwp_available(void)
 {
     unsigned int eax;
@@ -202,6 +209,8 @@ static bool __init hwp_available(void)
     hwp_verbose("HW_FEEDBACK %ssupported\n",
                 (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
 
+    hwp_in_use = true;
+
     hwp_info("Using HWP for cpufreq\n");
 
     return true;
diff --git a/xen/arch/x86/acpi/lib.c b/xen/arch/x86/acpi/lib.c
index 43831b92d1..51cb082ca0 100644
--- a/xen/arch/x86/acpi/lib.c
+++ b/xen/arch/x86/acpi/lib.c
@@ -26,6 +26,8 @@
 #include <asm/fixmap.h>
 #include <asm/mwait.h>
 
+#include <acpi/cpufreq/cpufreq.h>
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
index 2f23f02923..4045c6591d 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -15,6 +15,9 @@
 #include <asm/p2m.h>
 #include <asm/mce.h>
 #include <asm/apic.h>
+
+#include <acpi/cpufreq/cpufreq.h>
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
index 68407bd707..c8f507c92b 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -157,6 +157,7 @@
 #define MSR_HWP_CAPABILITIES                0x00000771
 #define MSR_HWP_INTERRUPT                   0x00000773
 #define MSR_HWP_REQUEST                     0x00000774
+#define MSR_HWP_STATUS                      0x00000777
 
 #define MSR_X2APIC_FIRST                    0x00000800
 #define MSR_X2APIC_LAST                     0x000008ff
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index c965a8c6b6..ccbd6ea4c5 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -253,5 +253,6 @@ void intel_feature_detect(struct cpufreq_policy *policy);
 
 int hwp_cmdline_parse(const char *s, const char *e);
 int hwp_register_driver(void);
+bool hwp_active(void);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
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
2.41.0


