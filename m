Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAD2AB5AD7
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983317.1369695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtAM-0005Jm-9V; Tue, 13 May 2025 17:11:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983317.1369695; Tue, 13 May 2025 17:11:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtAM-0005Gt-67; Tue, 13 May 2025 17:11:42 +0000
Received: by outflank-mailman (input) for mailman id 983317;
 Tue, 13 May 2025 17:11:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dvFL=X5=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uEt6E-0003Uz-UH
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:07:26 +0000
Received: from 1.mo575.mail-out.ovh.net (1.mo575.mail-out.ovh.net
 [46.105.41.146]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdf0c63c-301c-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 19:07:25 +0200 (CEST)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.2.253])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZxjZj0tsHz1wl4
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 17:07:25 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-2qtvb (unknown [10.111.174.145])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4F1CA1FE42;
 Tue, 13 May 2025 17:07:24 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
 by ghost-submission-5b5ff79f4f-2qtvb with ESMTPSA
 id RlK5Akx8I2jSxwEAFJ2vGA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 13 May 2025 17:07:24 +0000
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
X-Inumbo-ID: bdf0c63c-301c-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-106R006b9d271f3-da02-4016-b3b2-a9ec1fd8f92a,
                    0F27B6D195039ACFBDF5EC7F2AC12BEA7E98F15C) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v2 21/22] x86/cpu: report SMX, TXT and SKINIT capabilities
Date: Tue, 13 May 2025 20:05:58 +0300
Message-ID: <7df06438d497830c646db4d32a4715e9fad729ec.1747155790.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8956815236962366620
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdegieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeekffeiiedtveekhfdugeffveeigefgleegvdeghefftdetheefueeliedukedvnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejhegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=xpixWV2mjLfPJBjterQJqwu+52ca0ZiJyxVq/AkKkxM=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747156045; v=1;
 b=KXpwKzJca4J3oxVvPsBkDdeqPcWzz5qGHw4Ew0kWg0h7AXN2Vnz2amGTJTNY/uzFGaQw+s8h
 AvwBUWKWMn0yjMXE9VzqCX+kxafgy67m8k2ZlWgaiCRH/7Y9Aymc98G0ryJ4Q2R7CzUQeN1EL8/
 UGabTrzvs8oTLFXK8nWZDgPqei7qqBLrNKCRcGP9UuZbFhvSBjOgyTS3xMnONGge3Yh8ESaH9Fi
 KMdqHur+hVpQCy6gD2hf9SGNSrU78VeNkbjr+3XgapGIgMSeObMOP62a1SYnbhrYLMPWLcQi/7p
 zXPyeSM4a907OjKBKzFiqkRNHMizKE4wekwaqP5Ia7DOQ==

From: Michał Żygowski <michal.zygowski@3mdeb.com>

Report TXT capabilities so that dom0 can query the Intel TXT or AMD
SKINIT support information using xl dmesg.

Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/cpu/amd.c               | 16 ++++++++++
 xen/arch/x86/cpu/cpu.h               |  1 +
 xen/arch/x86/cpu/hygon.c             |  1 +
 xen/arch/x86/cpu/intel.c             | 46 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/intel-txt.h |  5 +++
 5 files changed, 69 insertions(+)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 37d67dd15c..18b6cbb50b 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -684,6 +684,21 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
 #undef FREQ
 }
 
+void amd_log_skinit(const struct cpuinfo_x86 *c)
+{
+    /*
+     * Run only on BSP and not during resume to report the capability only once.
+     */
+    if ( system_state != SYS_STATE_resume && smp_processor_id() )
+        return;
+
+    printk("CPU: SKINIT capability ");
+    if ( !test_bit(X86_FEATURE_SKINIT, &boot_cpu_data.x86_capability) )
+        printk("not supported\n");
+    else
+        printk("supported\n");
+}
+
 void cf_check early_init_amd(struct cpuinfo_x86 *c)
 {
 	if (c == &boot_cpu_data)
@@ -1333,6 +1348,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	check_syscfg_dram_mod_en();
 
 	amd_log_freq(c);
+	amd_log_skinit(c);
 }
 
 const struct cpu_dev __initconst_cf_clobber amd_cpu_dev = {
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index 8be65e975a..5bcf118a93 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -20,6 +20,7 @@ extern bool detect_extended_topology(struct cpuinfo_x86 *c);
 
 void cf_check early_init_amd(struct cpuinfo_x86 *c);
 void amd_log_freq(const struct cpuinfo_x86 *c);
+void amd_log_skinit(const struct cpuinfo_x86 *c);
 void amd_init_lfence(struct cpuinfo_x86 *c);
 void amd_init_ssbd(const struct cpuinfo_x86 *c);
 void amd_init_spectral_chicken(void);
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index f7508cc8fc..6ebb8b5fab 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -85,6 +85,7 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
 	}
 
 	amd_log_freq(c);
+	amd_log_skinit(c);
 }
 
 const struct cpu_dev __initconst_cf_clobber hygon_cpu_dev = {
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 12c3ff65e0..a99aec80ad 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -14,6 +14,7 @@
 #include <asm/apic.h>
 #include <asm/i387.h>
 #include <asm/trampoline.h>
+#include <asm/intel-txt.h>
 
 #include "cpu.h"
 
@@ -605,6 +606,49 @@ static void init_intel_perf(struct cpuinfo_x86 *c)
     }
 }
 
+/*
+ * Print out the SMX and TXT capabilties, so that dom0 can determine if the
+ * system is DRTM-capable.
+ */
+static void intel_log_smx_txt(struct cpuinfo_x86 *c)
+{
+    unsigned long cr4_val, getsec_caps;
+
+    /*
+     * Run only on BSP and not during resume to report the capability only once.
+     */
+    if ( system_state != SYS_STATE_resume && smp_processor_id() )
+        return;
+
+    printk("CPU: SMX capability ");
+    if ( !test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) )
+    {
+        printk("not supported\n");
+        return;
+    }
+    printk("supported\n");
+
+    /* Can't run GETSEC without VMX and SMX */
+    if ( !test_bit(X86_FEATURE_VMX, &boot_cpu_data.x86_capability) )
+        return;
+
+    cr4_val = read_cr4();
+    if ( !(cr4_val & X86_CR4_SMXE) )
+        write_cr4(cr4_val | X86_CR4_SMXE);
+
+    asm volatile ("getsec\n"
+        : "=a" (getsec_caps)
+        : "a" (GETSEC_CAPABILITIES), "b" (0) :);
+
+    if ( getsec_caps & GETSEC_CAP_TXT_CHIPSET )
+        printk("Chipset supports TXT\n");
+    else
+        printk("Chipset does not support TXT\n");
+
+    if ( !(cr4_val & X86_CR4_SMXE) )
+        write_cr4(cr4_val & ~X86_CR4_SMXE);
+}
+
 static void cf_check init_intel(struct cpuinfo_x86 *c)
 {
 	/* Detect the extended topology information if available */
@@ -619,6 +663,8 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 		detect_ht(c);
 	}
 
+	intel_log_smx_txt(c);
+
 	/* Work around errata */
 	Intel_errata_workarounds(c);
 
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index 5d76443d35..c834e08903 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -85,6 +85,11 @@
 #define TXT_AP_BOOT_CS                  0x0030
 #define TXT_AP_BOOT_DS                  0x0038
 
+/* EAX value for GETSEC leaf functions. Intel SDM: GETSEC[CAPABILITIES] */
+#define GETSEC_CAPABILITIES             0
+/* Intel SDM: GETSEC Capability Result Encoding */
+#define GETSEC_CAP_TXT_CHIPSET          1
+
 #ifndef __ASSEMBLY__
 
 #include <xen/slr-table.h>
-- 
2.49.0


