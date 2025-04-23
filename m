Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B50A988A1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 13:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964461.1355248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7YLh-0002Xx-DG; Wed, 23 Apr 2025 11:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964461.1355248; Wed, 23 Apr 2025 11:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7YLh-0002Vt-9f; Wed, 23 Apr 2025 11:33:05 +0000
Received: by outflank-mailman (input) for mailman id 964461;
 Wed, 23 Apr 2025 11:33:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+1X=XJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u7YLg-0002Vl-KC
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 11:33:04 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7fc6130-2036-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 13:33:03 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac2af2f15d1so720507066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 04:33:03 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acb6eefcf2csm782251566b.116.2025.04.23.04.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 04:33:02 -0700 (PDT)
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
X-Inumbo-ID: b7fc6130-2036-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745407983; x=1746012783; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AUVzt9yKwn3M18+3l/qllyr6CJufxy1FDQ47kr2wcI0=;
        b=jJGX1vYGQOjHzLSI84ZwRQ0OJ9B/31pAAbkADlixaNRuS1RIexOyjXZ5NyZUjsRcmW
         W2YV3rOOor6pQYAAKB1BR+zco7IncnCpcbqSaUZ6O2PkSM18FlbsIaDs5Qx8tipe1hgl
         ubJ3BhMHHJnrGM4/i5mMbBQ657OoCfIeA7alM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407983; x=1746012783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUVzt9yKwn3M18+3l/qllyr6CJufxy1FDQ47kr2wcI0=;
        b=wAUeDvimBUCyfU981wxzvS2P8LbP/amzX+sMjJiU4m8R6bs3bY1Zi1Kjsf8xVwvGIx
         EmVfE3HTybBTpLN5DQV+ugloWQHBEhKTgWbF/2Yt/iHXQyo3Q/u/iYtFxN0q8DbOodB2
         nH9GHCBBufCyZLwEV405skdugqdH1W4xSG73/bNnbueSmad+8BuDjH6i8A5UX+RpVspR
         F0Tq7yVrKIxnCSUKA0GQDQx3+CyvcH9PCBs6/Ngo03pSjacgvIRON1iXYzMzyTJtWdZl
         aWLf8RUHH2Lb5rSSinVPnH72Csy+3Xbf5MrDQSLwwXqiPB2ZtdkwT9O7NtdKAJ+JCKkF
         EU7w==
X-Gm-Message-State: AOJu0Yy7spatUDnBTFvWZaBc/jZJ2NRhxI7gfCePjBrndKJytnpRwJXf
	N0E7qoQqKUEFPopf8kaRKFpxWShth0Qez/qfR1c+LRy9j+UAxJW3QxTEB7ZKDwkJwyD5Bks8xfn
	I
X-Gm-Gg: ASbGnctDeeKQ8Q/6BKJq+VuRItqSaQionjEtxfKFkoJtI7e30+plxQaJdWWFPWss4cR
	/NYpOJLGiHlRZ7rh/gY0pDkNyx1FJV/TFjrevvWBPObHAKSyjqrgEo1fMF+aOY0Wiqfcb2t0n5h
	lYjxUWebs25c2nHXeVbrOsDE9ABsrbZfa0hN8kCVaoK7THWYdlIuZYO83JyMRzFAZjjdxRybtiC
	rLBdCvpGgxN8tplolqilJJxcJy2PcMiGz4uEoXR37WeAHSIBljUAulJp4nB1dOigq8uhk/OkbuV
	toBtSq4LPwV6NKJcgVnW84FUine4j1N+IOQqJGe6eQRYyg==
X-Google-Smtp-Source: AGHT+IFIWZRQN697K65SXYYMEkGl681Zutgy9a6NuUuM3W1KmGWfukHUTRgR0LSPh5mT0HLEQoF8/A==
X-Received: by 2002:a17:907:7e81:b0:acb:5583:6fe4 with SMTP id a640c23a62f3a-acb74ad7dddmr1770563066b.6.1745407982745;
        Wed, 23 Apr 2025 04:33:02 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] x86/intel: workaround several MONITOR/MWAIT errata
Date: Wed, 23 Apr 2025 13:32:15 +0200
Message-ID: <20250423113215.80755-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are several errata on Intel regarding the usage of the MONITOR/MWAIT
instructions, all having in common that stores to the monitored region
might not wake up the CPU.

Fix them by forcing the sending of an IPI for the affected models.

The Ice Lake issue has been reproduced internally on XenServer hardware,
and the fix does seem to prevent it.  The symptom was APs getting stuck in
the idle loop immediately after bring up, which in turn prevented the BSP
from making progress.  This would happen before the watchdog was
initialized, and hence the whole system would get stuck.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Apollo and Lunar Lake fixes have not been tested, due to lack of hardware.
---
Changes since v1:
 - Only probe for the errata at boot.
 - Use Intel model names instead of raw values.
 - Make force_mwait_ipi_wakeup __ro_after_init.
---
 xen/arch/x86/acpi/cpu_idle.c     |  6 ++++++
 xen/arch/x86/cpu/intel.c         | 36 +++++++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/mwait.h |  3 +++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 420198406def..1dbf15b01ed7 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -441,8 +441,14 @@ void cpuidle_wakeup_mwait(cpumask_t *mask)
     cpumask_andnot(mask, mask, &target);
 }
 
+/* Force sending of a wakeup IPI regardless of mwait usage. */
+bool __ro_after_init force_mwait_ipi_wakeup;
+
 bool arch_skip_send_event_check(unsigned int cpu)
 {
+    if ( force_mwait_ipi_wakeup )
+        return false;
+
     /*
      * This relies on softirq_pending() and mwait_wakeup() to access data
      * on the same cache line.
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 6a680ba38dc9..6c8377d08428 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -8,6 +8,7 @@
 #include <asm/intel-family.h>
 #include <asm/processor.h>
 #include <asm/msr.h>
+#include <asm/mwait.h>
 #include <asm/uaccess.h>
 #include <asm/mpspec.h>
 #include <asm/apic.h>
@@ -368,7 +369,6 @@ static void probe_c3_errata(const struct cpuinfo_x86 *c)
         INTEL_FAM6_MODEL(0x25),
         { }
     };
-#undef INTEL_FAM6_MODEL
 
     /* Serialized by the AP bringup code. */
     if ( max_cstate > 1 && (c->apicid & (c->x86_num_siblings - 1)) &&
@@ -380,6 +380,38 @@ static void probe_c3_errata(const struct cpuinfo_x86 *c)
     }
 }
 
+/*
+ * APL30: One use of the MONITOR/MWAIT instruction pair is to allow a logical
+ * processor to wait in a sleep state until a store to the armed address range
+ * occurs. Due to this erratum, stores to the armed address range may not
+ * trigger MWAIT to resume execution.
+ *
+ * ICX143: Under complex microarchitectural conditions, a monitor that is armed
+ * with the MWAIT instruction may not be triggered, leading to a processor
+ * hang.
+ *
+ * LNL030: Problem P-cores may not exit power state Core C6 on monitor hit.
+ *
+ * Force the sending of an IPI in those cases.
+ */
+static void __init probe_mwait_errata(void)
+{
+    static const struct x86_cpu_id models[] = {
+        INTEL_FAM6_MODEL(INTEL_FAM6_ATOM_GOLDMONT), /* APL30  */
+        INTEL_FAM6_MODEL(INTEL_FAM6_ICELAKE_X),     /* ICX143 */
+        INTEL_FAM6_MODEL(INTEL_FAM6_LUNARLAKE_M),   /* LNL030 */
+        { }
+    };
+#undef INTEL_FAM6_MODEL
+
+    if ( boot_cpu_has(X86_FEATURE_MONITOR) && x86_match_cpu(models) )
+    {
+        printk(XENLOG_WARNING
+               "Forcing IPI MWAIT wakeup due to CPU erratum\n");
+        force_mwait_ipi_wakeup = true;
+    }
+}
+
 /*
  * P4 Xeon errata 037 workaround.
  * Hardware prefetcher may cause stale data to be loaded into the cache.
@@ -406,6 +438,8 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
 		__set_bit(X86_FEATURE_CLFLUSH_MONITOR, c->x86_capability);
 
 	probe_c3_errata(c);
+	if (system_state < SYS_STATE_active && c == &boot_cpu_data)
+		probe_mwait_errata();
 }
 
 
diff --git a/xen/arch/x86/include/asm/mwait.h b/xen/arch/x86/include/asm/mwait.h
index 000a692f6d19..c52cd3f51011 100644
--- a/xen/arch/x86/include/asm/mwait.h
+++ b/xen/arch/x86/include/asm/mwait.h
@@ -13,6 +13,9 @@
 
 #define MWAIT_ECX_INTERRUPT_BREAK	0x1
 
+/* Force sending of a wakeup IPI regardless of mwait usage. */
+extern bool force_mwait_ipi_wakeup;
+
 void mwait_idle_with_hints(unsigned int eax, unsigned int ecx);
 #ifdef CONFIG_INTEL
 bool mwait_pc10_supported(void);
-- 
2.48.1


