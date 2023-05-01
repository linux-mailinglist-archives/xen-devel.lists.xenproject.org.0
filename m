Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE29F6F37AA
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:31:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528109.820919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEp-0003AY-DJ; Mon, 01 May 2023 19:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528109.820919; Mon, 01 May 2023 19:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEp-00036X-AN; Mon, 01 May 2023 19:31:07 +0000
Received: by outflank-mailman (input) for mailman id 528109;
 Mon, 01 May 2023 19:31:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZEo-000149-3A
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:31:06 +0000
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b61e0f36-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:31:04 +0200 (CEST)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-3ef38bea86aso13223701cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:31:04 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d6-20020ac80606000000b003bf9f9f1844sm9351784qth.71.2023.05.01.12.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:31:02 -0700 (PDT)
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
X-Inumbo-ID: b61e0f36-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969463; x=1685561463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AClKrOg8M97t4+1HhqAtzZODxTQ5H9SUOQWpW1JlGKM=;
        b=YaGuiAS9skGtNqMMYIs2izeJbZk9tjGRToKR7izraEPPKc5z3vDnPbYPZTMX9SPIu2
         9hEoyC+hQrBI0Au9ULyOsD0lzBzqhfpe3fmOUvtwsKoqOyiyRWgcObksuugY0iJ/6oJo
         Gr2bq0+Qr7BpDyDnjjtIaOqmt+9IImpmB/tmGF3TWsDBKlNezlhRfW5UV6vIAOF420WE
         K+ll91Lxlyg8ArMyp5vI/yJi3DnXpPzdn3IEmd4Xpp6BBLZCDpX5lPNO2kh1XAl2iheK
         /NBX+Vgt+eOocF/A2c26q8nSO5AerNn+zRDoWvx8Ptzxx08z1cJ6vk8JpTjfJXFP3xLA
         1Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969463; x=1685561463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AClKrOg8M97t4+1HhqAtzZODxTQ5H9SUOQWpW1JlGKM=;
        b=JQzUmKQCSJEEMvwUz/pBRyC3rWy0SooUxZfQOsmzq78sB0DNGnstGgUcK4ZvhKpE6v
         RwNwYzaRcJDHwYBxp7ZaCCMMVzxdEGNAi5Fksz8pjbRFcjux9pdkpwaUNZv0qDyh/vOq
         jcnhi5Oxjhd5mvtLG5WCwZg6TLXuWzwHRwLK91kLiZ/dvzQIhVH82+AmVMGOASXdyDim
         4F6WWOZke0sutPS/ZqgXLGbzwcmv3ufBWxZu54iIa+F1AZ0Q+eaxZ0XnXM4lTYIFL/X1
         VzCS+Rr4YUWa4cI80KZzmelrAU4UU9FBxNtBFRpp7uu1S3RtNuSuygaZHTABq51vSe9/
         52xQ==
X-Gm-Message-State: AC+VfDy0j+9cdFFfsGn6qypEnAf4IS7d6+rCvHmk8VQTPyW3QOk1M0B6
	2K2LI5Ium/ZBSfxOelbyczUIVxXCLiA=
X-Google-Smtp-Source: ACHHUZ5cQ2cgJdSAh0zgGf+/+ZF/Ml22GYGgHkn6nhGuZflecOxzamQB3CxZ4cxbFlh83Usj9WeWAw==
X-Received: by 2002:a05:622a:199d:b0:3ef:3bad:6d12 with SMTP id u29-20020a05622a199d00b003ef3bad6d12mr20428194qtc.5.1682969462760;
        Mon, 01 May 2023 12:31:02 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 06/14 RESEND] xen/x86: Tweak PDC bits when using HWP
Date: Mon,  1 May 2023 15:30:26 -0400
Message-Id: <20230501193034.88575-7-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501193034.88575-1-jandryuk@gmail.com>
References: <20230501193034.88575-1-jandryuk@gmail.com>
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
---
New in v3

 xen/arch/x86/acpi/cpufreq/hwp.c           | 16 +++++++++++-----
 xen/arch/x86/acpi/lib.c                   |  5 +++++
 xen/arch/x86/cpu/mcheck/mce_intel.c       |  6 ++++++
 xen/arch/x86/include/asm/msr-index.h      |  1 +
 xen/include/acpi/cpufreq/processor_perf.h |  1 +
 xen/include/acpi/pdc_intel.h              |  1 +
 6 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 57f13867d3..f84abe1386 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -13,6 +13,8 @@
 #include <asm/msr.h>
 #include <acpi/cpufreq/cpufreq.h>
 
+static bool hwp_in_use;
+
 static bool feature_hwp;
 static bool feature_hwp_notification;
 static bool feature_hwp_activity_window;
@@ -117,10 +119,14 @@ static int __init cf_check cpufreq_gov_hwp_init(void)
 }
 __initcall(cpufreq_gov_hwp_init);
 
+bool hwp_active(void)
+{
+    return hwp_in_use;
+}
+
 bool __init hwp_available(void)
 {
     unsigned int eax, ecx, unused;
-    bool use_hwp;
 
     if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
     {
@@ -173,13 +179,13 @@ bool __init hwp_available(void)
     hwp_verbose("HWP: HW_FEEDBACK %ssupported\n",
                 (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
 
-    use_hwp = feature_hwp && opt_cpufreq_hwp;
-    cpufreq_governor_internal = use_hwp;
+    hwp_in_use = feature_hwp && opt_cpufreq_hwp;
+    cpufreq_governor_internal = hwp_in_use;
 
-    if ( use_hwp )
+    if ( hwp_in_use )
         hwp_info("Using HWP for cpufreq\n");
 
-    return use_hwp;
+    return hwp_in_use;
 }
 
 static void hdc_set_pkg_hdc_ctl(bool val)
diff --git a/xen/arch/x86/acpi/lib.c b/xen/arch/x86/acpi/lib.c
index 43831b92d1..20d6115ba9 100644
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
+		pdc[2] |= ACPI_PDC_CPPC_NTV_INT;
+
 	return 0;
 }
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 2f23f02923..d430342924 100644
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
+        wrmsr_safe(MSR_IA32_HWP_STATUS, 0);
+
     if ( NOW() < per_cpu(next, cpu) )
         return;
 
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index a2a22339e4..f5269022da 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -157,6 +157,7 @@
 #define MSR_IA32_HWP_CAPABILITIES           0x00000771
 #define MSR_IA32_HWP_INTERRUPT              0x00000773
 #define MSR_IA32_HWP_REQUEST                0x00000774
+#define MSR_IA32_HWP_STATUS                 0x00000777
 
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
index 4fb719d6f5..e8332898fc 100644
--- a/xen/include/acpi/pdc_intel.h
+++ b/xen/include/acpi/pdc_intel.h
@@ -17,6 +17,7 @@
 #define ACPI_PDC_C_C1_FFH		(0x0100)
 #define ACPI_PDC_C_C2C3_FFH		(0x0200)
 #define ACPI_PDC_SMP_P_HWCOORD		(0x0800)
+#define ACPI_PDC_CPPC_NTV_INT		(0x1000)
 
 #define ACPI_PDC_EST_CAPABILITY_SMP	(ACPI_PDC_SMP_C1PT | \
 					 ACPI_PDC_C_C1_HALT | \
-- 
2.40.0


