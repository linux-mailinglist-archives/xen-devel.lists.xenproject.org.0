Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624F9A9700A
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:10:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962838.1354012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FGm-0006oE-Fc; Tue, 22 Apr 2025 15:10:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962838.1354012; Tue, 22 Apr 2025 15:10:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FGm-0006lG-Bg; Tue, 22 Apr 2025 15:10:44 +0000
Received: by outflank-mailman (input) for mailman id 962838;
 Tue, 22 Apr 2025 15:10:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FEI-0008SP-9m
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:08:10 +0000
Received: from 8.mo582.mail-out.ovh.net (8.mo582.mail-out.ovh.net
 [178.33.42.204]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 968e4884-1f8b-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 17:08:03 +0200 (CEST)
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.176.110])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4Zhlwf6xQpz1bPs
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:08:02 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-86gjs (unknown [10.110.118.75])
 by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 556AE1FF03;
 Tue, 22 Apr 2025 15:08:02 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
 by ghost-submission-5b5ff79f4f-86gjs with ESMTPSA
 id eWpyAdKwB2hq8wAAiLZzDg
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:08:02 +0000
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
X-Inumbo-ID: 968e4884-1f8b-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-108S002681ac38e-e960-4b16-b2af-646d803af872,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 21/21] x86/cpu: report SMX, TXT and SKINIT capabilities
Date: Tue, 22 Apr 2025 18:06:55 +0300
Message-ID: <5b40dbb1b30ce1e4bf7aed3e0ab7357db40d51ac.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12741246295885329564
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeekffeiiedtveekhfdugeffveeigefgleegvdeghefftdetheefueeliedukedvnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekvdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=u1i8lAG0kzr5pAfgDXgiX2oc2nU8MOoTSYHcysfLbnY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334483; v=1;
 b=VYr6oLYiwmn7ou/SifLAnmZ0APAtJ3ahbBKYAaR6uA30Rx8QFqgu40s8xwiCixQfxj5yg40F
 BhqASz0kXVS9dBGpdwOUOF4+Oil7easweehwegbTBVALpni0+SckQV7unWAzSQ/7jV1pvbsQygD
 0FvkLwM2UR7KUprgoz9nHkIjpDjZpsCifV4i6J77WHcMljj2bq0vnSI1/TYcm0mwiwBcEZBcH9m
 z0NedCW+IDRc3hbYs0CHKnCZUIwy3kGQs1S3Qn2dpwhhNgumghwxPv03d/EzU8C4bJb1gjOUe3m
 6nxTfhW6Xcsnq1f0AKmnogUtkYF22+iirePd9rv8pkTlg==

From: Michał Żygowski <michal.zygowski@3mdeb.com>

Report TXT capabilities so that dom0 can query the Intel TXT or AMD
SKINIT support information using xl dmesg.

Signed-off-by: Michał Żygowski <michal.zygowski@3mdeb.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/cpu/amd.c               | 14 +++++++++
 xen/arch/x86/cpu/cpu.h               |  1 +
 xen/arch/x86/cpu/hygon.c             |  1 +
 xen/arch/x86/cpu/intel.c             | 44 ++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/intel_txt.h |  5 ++++
 5 files changed, 65 insertions(+)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index ce4e1df710..8be135dbc1 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -671,6 +671,19 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
 #undef FREQ
 }
 
+void amd_log_skinit(const struct cpuinfo_x86 *c)
+{
+    /* Run only on BSP to report the capability only once */
+    if ( smp_processor_id() )
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
@@ -1320,6 +1333,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
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
index 6a680ba38d..618bd5540e 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -13,6 +13,7 @@
 #include <asm/apic.h>
 #include <asm/i387.h>
 #include <asm/trampoline.h>
+#include <asm/intel_txt.h>
 
 #include "cpu.h"
 
@@ -571,6 +572,47 @@ static void init_intel_perf(struct cpuinfo_x86 *c)
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
+    /* Run only on BSP to report the SMX/TXT caps only once */
+    if ( smp_processor_id() )
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
@@ -585,6 +627,8 @@ static void cf_check init_intel(struct cpuinfo_x86 *c)
 		detect_ht(c);
 	}
 
+	intel_log_smx_txt(c);
+
 	/* Work around errata */
 	Intel_errata_workarounds(c);
 
diff --git a/xen/arch/x86/include/asm/intel_txt.h b/xen/arch/x86/include/asm/intel_txt.h
index af997c9da6..76ec651b11 100644
--- a/xen/arch/x86/include/asm/intel_txt.h
+++ b/xen/arch/x86/include/asm/intel_txt.h
@@ -82,6 +82,11 @@
 #define TXT_AP_BOOT_CS                  0x0030
 #define TXT_AP_BOOT_DS                  0x0038
 
+/* EAX value for GETSEC leaf functions. Intel SDM: GETSEC[CAPABILITIES] */
+#define GETSEC_CAPABILITIES             0
+/* Intel SDM: GETSEC Capability Result Encoding */
+#define GETSEC_CAP_TXT_CHIPSET          1
+
 #ifndef __ASSEMBLY__
 
 #include <xen/slr_table.h>
-- 
2.49.0


