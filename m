Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 643B2A92288
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 18:19:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958257.1351173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Rxh-0001Vc-La; Thu, 17 Apr 2025 16:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958257.1351173; Thu, 17 Apr 2025 16:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Rxh-0001Tn-IY; Thu, 17 Apr 2025 16:19:37 +0000
Received: by outflank-mailman (input) for mailman id 958257;
 Thu, 17 Apr 2025 16:19:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dr0F=XD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u5Rxg-0001Tf-Bf
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 16:19:36 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bffd1d73-1ba7-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 18:19:34 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5f5bef591d6so1092694a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 09:19:34 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5f6254360e1sm22097a12.0.2025.04.17.09.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Apr 2025 09:19:33 -0700 (PDT)
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
X-Inumbo-ID: bffd1d73-1ba7-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744906773; x=1745511573; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JeqRf/ksfyKuWJc0QUlgZxLL7fEd09XKOEwheEVwUOw=;
        b=L12sXTRrEMIdJAVtatDotooeTHQmhLOkmM5yaUH+yCoUi3W897ZUmuuHbr3pASkHWV
         76+It81I9Z2MZ8YuExMQQvqExqxFigmoSEwgUvtPFJuMRDoMDV+/cJlmPZXhYHTP7wHp
         iH3w3zq84w3oiqhb1udby7p1zXR4+BbjnH1wM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906773; x=1745511573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeqRf/ksfyKuWJc0QUlgZxLL7fEd09XKOEwheEVwUOw=;
        b=RNIdM9GDJhXb6lALwja41TlLEwMb/9HOLtmU+Fatj6TokWjw0jc5143NbqHJoyZpzT
         yebUO+lg3Pn8Z62kP3wJkHQFMvlbfvoxzAe1R3VoK5Wza6rf+J3gW3f0m4Hk0JNUOZbO
         rsmasmrlsozkX8aCDfE9NVICro7UN2imnHJx9vanJh3cm/HAcXf7LNZpKFB3JcAPZw1+
         0CAhFbwJquM0dW/J2oqDGEOgdf1Ga7h+/W+n5+VPVKpfvVvGwzQmokW6VOLeHflKf1a0
         kOD992blHs7yEMqrhP0zghX7slteSSCiUX01KDRvOgK7n+kos8vpusZcD7sGPPjQRL/Q
         dXAA==
X-Gm-Message-State: AOJu0YwPChMQILq++42+O9ywkzjWxfGh+nkSJhcZnqXSzJRuR0KBItMi
	OKmCVdp5tYSCWqnI5XSNRJvw/qIS96csP+PWXAZIi9qS5qmznr2pDlRpFeOBfpQILxr6N3w0pT/
	X
X-Gm-Gg: ASbGnctZSzVkMHcyXDT5UsfH5DRKiwgoUJ1nKlPm7j+2L8B8lnAoofrWqCupP1Wk3+W
	t3PcWJbggot21v554vasRcB4oOf95zssrqbmq2SwkReqy2aS5yplFKRl/C0FYX9z5BoGgXnkNf/
	QnPhaaDdbC4Ouva5Zvu8P4pxOwrbsynvI/OtFRQlag4xjfvD+aGc0s8VsfgCy3mucca6A9PlylS
	dIsURBv0jWivKXq5As4slwuoBnbbokVlDlcu3YtrIFM91WnmpWhQX0fa+nldrFQi4zK8YdZED8E
	MTjQW88qdvHTKwpNcIbZQswDleUz9fXCxRNFe7CqVX65lw==
X-Google-Smtp-Source: AGHT+IETxZ5bBCZWWs21wifcVg8wPfD1HUpinU+PrW83jacUdpf2g2b3KmKC1Tx9zipW5f9p7Qnarg==
X-Received: by 2002:a05:6402:34c3:b0:5e0:9959:83cd with SMTP id 4fb4d7f45d1cf-5f4b75c543fmr5063576a12.21.1744906773490;
        Thu, 17 Apr 2025 09:19:33 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] x86/intel: workaround several MONITOR/MWAIT errata
Date: Thu, 17 Apr 2025 18:19:13 +0200
Message-ID: <20250417161913.14661-1-roger.pau@citrix.com>
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
 xen/arch/x86/acpi/cpu_idle.c     |  6 +++++
 xen/arch/x86/cpu/intel.c         | 41 +++++++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/mwait.h |  3 +++
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 420198406def..f8f11f3c31e4 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -441,8 +441,14 @@ void cpuidle_wakeup_mwait(cpumask_t *mask)
     cpumask_andnot(mask, mask, &target);
 }
 
+/* Force sending of a wakeup IPI regardless of mwait usage. */
+bool force_mwait_ipi_wakeup __read_mostly;
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
index 6a680ba38dc9..9d7c6ea297a9 100644
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
@@ -380,6 +380,43 @@ static void probe_c3_errata(const struct cpuinfo_x86 *c)
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
+static void probe_mwait_errata(void)
+{
+    static const struct x86_cpu_id models[] = {
+        /* Apollo Lake */
+        INTEL_FAM6_MODEL(0x5C),
+        /* Ice Lake */
+        INTEL_FAM6_MODEL(0x6A),
+        INTEL_FAM6_MODEL(0x6C),
+        /* Lunar Lake */
+        INTEL_FAM6_MODEL(0xBD),
+        { }
+    };
+#undef INTEL_FAM6_MODEL
+
+    if ( boot_cpu_has(X86_FEATURE_MONITOR) && !force_mwait_ipi_wakeup &&
+         x86_match_cpu(models) )
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
@@ -406,6 +443,8 @@ static void Intel_errata_workarounds(struct cpuinfo_x86 *c)
 		__set_bit(X86_FEATURE_CLFLUSH_MONITOR, c->x86_capability);
 
 	probe_c3_errata(c);
+	if (c == &boot_cpu_data)
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


