Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76F3AC8FCD
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000979.1381251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzfH-0007Yv-DN; Fri, 30 May 2025 13:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000979.1381251; Fri, 30 May 2025 13:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzfH-0007X2-67; Fri, 30 May 2025 13:20:51 +0000
Received: by outflank-mailman (input) for mailman id 1000979;
 Fri, 30 May 2025 13:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKze7-0003ZU-3j
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:19:39 +0000
Received: from 4.mo576.mail-out.ovh.net (4.mo576.mail-out.ovh.net
 [46.105.42.102]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baae0b70-3d58-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 15:19:34 +0200 (CEST)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.9.150])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4b83jy44vXz33bG
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:19:34 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-7mj9p (unknown [10.110.178.161])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C68EDC3334;
 Fri, 30 May 2025 13:19:33 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
 by ghost-submission-5b5ff79f4f-7mj9p with ESMTPSA
 id 3lLgJWWwOWhE4wAAMDjBXw
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:19:33 +0000
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
X-Inumbo-ID: baae0b70-3d58-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-98R0024bd3e58b-6ef2-461f-a919-a86e5b2b2194,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 21/22] x86/cpu: report SMX, TXT and SKINIT capabilities
Date: Fri, 30 May 2025 16:18:03 +0300
Message-ID: <6fb0f217027fc323d3c23e94bb99bc56e06f9763.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12710847002492581020
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegkeffieeitdevkefhudegffevieeggfelgedvgeehffdtteehfeeuleeiudekvdenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekgedrvddvuddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheejiegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=ms5Oz9mARFyw7F3TkgqehvFJRD2s1RQlx2UtDwBUcCc=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611174; v=1;
 b=C6XLwEEbnykxW5WCFW8jHLZp64xfpb5SRpRsUQdRMVjN7TEmRlNs7QoW1amRsHyG+KqO7z3+
 oAXEKrwNcCfSw7IPy9V4jWynYKJ1FaJghakTlgHaxZiQaVIZw77iZMv2SXQVdrUZ24esqF2TBoB
 gfOUHnlIIbWihbhi80t+CODpnGw1dIV+b9GRnAlvHRXEeoduVU/MqBtXIWil2F5GcP+OkyQIt4t
 CwbeliALJ8PQFIUwWNeGRLzuNQygt9L40ou5byjwcpQqPHgq1/YuoaCHWoRMBA5IKrErppAYUPc
 zU8mMFm75oMVQ9XhinXvi0aPSsDbnH42lis7PmUMrV2yA==

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
index 27ae167808..e630a0bb2a 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -688,6 +688,21 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
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
@@ -1337,6 +1352,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	check_syscfg_dram_mod_en();
 
 	amd_log_freq(c);
+	amd_log_skinit(c);
 }
 
 const struct cpu_dev __initconst_cf_clobber amd_cpu_dev = {
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index cbb434f3a2..94132394aa 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -24,6 +24,7 @@ extern bool detect_extended_topology(struct cpuinfo_x86 *c);
 
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
index ef9368167a..ed9cdd064f 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -14,6 +14,7 @@
 #include <asm/apic.h>
 #include <asm/i387.h>
 #include <asm/trampoline.h>
+#include <asm/intel-txt.h>
 
 #include "cpu.h"
 
@@ -633,6 +634,49 @@ static void init_intel_perf(struct cpuinfo_x86 *c)
     }
 }
 
+/*
+ * Print out the SMX and TXT capabilties, so that dom0 can determine if the
+ * system is DRTM-capable.
+ */
+static void intel_log_smx_txt(void)
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
@@ -647,6 +691,8 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 		detect_ht(c);
 	}
 
+	intel_log_smx_txt();
+
 	/* Work around errata */
 	Intel_errata_workarounds(c);
 
diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index c032ebb2e1..af388ade02 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -94,6 +94,11 @@
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


