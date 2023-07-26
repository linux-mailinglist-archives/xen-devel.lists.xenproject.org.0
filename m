Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FB1763D50
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:10:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570642.892664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi2B-00008b-C2; Wed, 26 Jul 2023 17:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570642.892664; Wed, 26 Jul 2023 17:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi2B-0008VS-8I; Wed, 26 Jul 2023 17:10:47 +0000
Received: by outflank-mailman (input) for mailman id 570642;
 Wed, 26 Jul 2023 17:10:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi29-0005nP-B2
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:10:45 +0000
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [2607:f8b0:4864:20::f2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a23fe7f-2bd7-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 19:10:43 +0200 (CEST)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-63d03d3cac6so436136d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:10:43 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:10:41 -0700 (PDT)
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
X-Inumbo-ID: 5a23fe7f-2bd7-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391442; x=1690996242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BC4KCbQaicpEfX3GeSqBCseD+2+53viJE6p7BIzEEpg=;
        b=ndtmflJBJ3YpsDmboHGO5jxzRiGA0QQkW8Kn9KHIuE5zXhNppgNSLsNw6L2zeewH47
         L8JEoqYsnFRSSrvn4poHVvTDSH24PYG/rYF3E6nj53SUjPeQHQhSaP93ETMPIv2pHY6/
         M5wtPzcvt4B8gKdf7iHJdsuR8r8qanLdcF14r1PwVHqNPSIBkcDeOCa/s8SXXpQyFDrp
         6p+sTd5c2C2XJ/iKbSJBrzWyvvZm8uMKeUavnfRukNoIpTWR0uwOJ4g3Ba+sf6tW2G4n
         dESNKTi3FPvjHE3jLtHInGN97F1IjHHvtZ9bNBtd/xDPpaMfTLQ7NZVINqhhbn7q1bsL
         QdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391442; x=1690996242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BC4KCbQaicpEfX3GeSqBCseD+2+53viJE6p7BIzEEpg=;
        b=dEqNGfaD5T9fGCje4NztSpEwe7Fi6kbLNPb92s0hIVrrf4EobhQFiyf+3BHDm+D8A3
         8BWyCoy6uhsy4luNj4gcafVY725+k9lD6RDa68ZBwoxH30lX3QXsh7X8MZx9JFe7Cvin
         gIHnJewu7U18i4MCbmuPzLPk0fdQ2Gb2qYogrE32qj8uR2sNTOshVwgqbpcQKzrNaMTq
         APQ6b0q0HsLHA2zXd4IvfhpCk97wtjVPDiIhKY/ehnWXK30E9yj7MBGTQgu1YSpEV6TG
         g5W4K7MJ1v/UkgOOM079FGgMPyLDnA3EIq3rp1Br0GHU909WZ2SlZ3nkUMv5GvYXXyQM
         qMEQ==
X-Gm-Message-State: ABy/qLZdKJhJ68XMb7uyoNyLf5bb4b172C+Qf9S2b6biP4dKz4xW7wHr
	9Zc87rYHXzIJBho1LJQYKsdZSYyM2rw=
X-Google-Smtp-Source: APBJJlETq+JdfQM6svwqAHt0eXz7N837lk5Ch/SoYIZabylFcWDTbaKfV8RLlJm3y3lVB5DJMJJmvw==
X-Received: by 2002:a0c:f84b:0:b0:635:f3c2:e88f with SMTP id g11-20020a0cf84b000000b00635f3c2e88fmr2101475qvo.33.1690391441963;
        Wed, 26 Jul 2023 10:10:41 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 07/15] xen/x86: Tweak PDC bits when using HWP
Date: Wed, 26 Jul 2023 13:09:37 -0400
Message-ID: <20230726170945.34961-8-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726170945.34961-1-jandryuk@gmail.com>
References: <20230726170945.34961-1-jandryuk@gmail.com>
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
index e9a6d23e38..33039ad39e 100644
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
index 56f93cb8e2..f2410fc8c8 100644
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


