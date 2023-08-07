Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BC3772E2E
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578797.906526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Ks-0006ar-Jm; Mon, 07 Aug 2023 18:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578797.906526; Mon, 07 Aug 2023 18:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Ks-0006TE-BH; Mon, 07 Aug 2023 18:52:10 +0000
Received: by outflank-mailman (input) for mailman id 578797;
 Mon, 07 Aug 2023 18:52:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5Kr-0004lg-8b
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:52:09 +0000
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [2607:f8b0:4864:20::936])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 820632c1-3553-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 20:52:08 +0200 (CEST)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-79969c14964so1276083241.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:52:08 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:52:06 -0700 (PDT)
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
X-Inumbo-ID: 820632c1-3553-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434327; x=1692039127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7GMVxKHH5c0AlSKBRhOVtwdBCMeAlRn7S7x06padXs=;
        b=XCmwnixDv+P8jXyZGp6Ful597i+goriPcgErFJPTMtTgxeZqY/Q0Ajs9ohD+8PP82e
         UeUzo3oLKWCHlTsKFS2PMjJ/34ywunH+ptgjru3/jDG2mZCQO3Wd5jT6KuZ6u4Qd4Huq
         flh8y1KxcEzQPCm5x6TKp/TU9mqqGYrbCC+LMhDqwn0DipM7uNdUzPsmohFbv4uLHjPM
         lTGLMVvCWDYtJz5M+Wg4kOtZ3hfmJtdEmCK2AMjFHqDhNGadg1M15tVm4OjWHYIjCqCO
         dtZFc7RxEhF93+nG0lgCDqH83W5Ff6dOPPUrGJIYOA80vfR16wGlBbNCJZ12iGNaTfFg
         BAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434327; x=1692039127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7GMVxKHH5c0AlSKBRhOVtwdBCMeAlRn7S7x06padXs=;
        b=Pfxq1OqRLd00VtPjpOupPacJ3EvercF0mtfdo+YLz+Nm34ldO7JBE9b3yRwcqsEbdx
         H9ttQB4maFi5H0TtaYbXR49WZXAD9E0QDfAmVIsgIpy2PW3KN8MDLgwKjGUCrgD6GVnI
         mW341C2+xqA/VRiIYm5zpZYpsz8DOe/xtMWntEXDwaYQnw4tMSQLjYyQnNhaDCEy98of
         ODOjV1TaCyLWhQl/frfz3pxQuzuGqnTT7onQwqjJ242erw0Gr86EiO+1ap9Udy1njJjX
         UuZLvxer8MbYRkBRd3zNagc9nFkXia+tn0KZW9tZa9CychpfzfSxueDEmnPBJcxiovFh
         BisQ==
X-Gm-Message-State: AOJu0YzfYANs2DjuDc9gAZ/1YjNvbxpM6iX11NksJLy2NxEgMoJz8oNB
	+hy11m9zPkCiGAZ4jRkOTcK8bWTuVCU=
X-Google-Smtp-Source: AGHT+IGjSLSy/mXFwup5H0qfBTeFN88TKLtyXudtjOyP2AxytZ1td1acQxQ2Ypp14HMXA6Y+BZ2fYQ==
X-Received: by 2002:a67:bd01:0:b0:443:65cb:1364 with SMTP id y1-20020a67bd01000000b0044365cb1364mr4946213vsq.6.1691434326778;
        Mon, 07 Aug 2023 11:52:06 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 07/15] xen/x86: Tweak PDC bits when using HWP
Date: Mon,  7 Aug 2023 14:51:11 -0400
Message-ID: <20230807185119.98333-8-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
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
index 932786ccca..9be622f492 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -12,6 +12,8 @@
 #include <asm/msr.h>
 #include <acpi/cpufreq/cpufreq.h>
 
+static bool __ro_after_init hwp_in_use;
+
 static bool __ro_after_init feature_hwp_notification;
 static bool __ro_after_init feature_hwp_activity_window;
 
@@ -152,6 +154,11 @@ static int __init cf_check cpufreq_gov_hwp_init(void)
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
@@ -204,6 +211,8 @@ static bool __init hwp_available(void)
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
index 2705982d93..185d3c491e 100644
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
index cfe975814e..6737798e25 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -254,5 +254,6 @@ void intel_feature_detect(struct cpufreq_policy *policy);
 
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


