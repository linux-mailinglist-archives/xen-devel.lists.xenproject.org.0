Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D4930887A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78051.141822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SDW-0008QC-CB; Fri, 29 Jan 2021 11:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78051.141822; Fri, 29 Jan 2021 11:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5SDW-0008Pd-8w; Fri, 29 Jan 2021 11:45:34 +0000
Received: by outflank-mailman (input) for mailman id 78051;
 Fri, 29 Jan 2021 11:45:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDuN=HA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l5SDU-0008PD-KB
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:45:32 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ac9aadc-6cfa-4114-a821-99c1510a134d;
 Fri, 29 Jan 2021 11:45:32 +0000 (UTC)
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
X-Inumbo-ID: 9ac9aadc-6cfa-4114-a821-99c1510a134d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611920731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rTeaVOpSmujxBmF8hy4sR35dRGwZYTO/o0Z6xBtNMK8=;
  b=ek/kSpdAsNNAWBu6BRWPJedv5LzzqGbxJFHT3n0KqDgfZGWz094a812o
   oAZZYgNBRsFA12rllZtP78wY34JHvBXKHVGiI9I3N9l6ZLsA+FY9BWPS9
   UlmDLHKKFYZuEnXBRCSrmNnjH30h+XT72O7T6bhws7ee7oIfQKjhGFhFF
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0M+mj86SFvJHGnfxlk5KUKwjRuAgoaln6P7EGlA/P4WTycX3vD4aWBC7D3H7K4SYFptnItGLNa
 LHx19Jo8t0QZyePVwD/KcSy5YEuBME9c6d/LkfxCEI8rZHcASJHH/Ei38AlKmHKzD9CLS84RAE
 zR4dggOth/47oyK/yTc96AoqJrNZJXzwJlT3yo96rTpFjjapADzCB68ykH/pQHvl4PWAiAL2g0
 lav/SabNNJ5XX7wXkd2s1CQdny3GHL3DsTMKfdGDwxNJkqXxBDqTgjWsWUqH+WKDW7aXbEEzox
 SJA=
X-SBRS: 5.1
X-MesageID: 37468581
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="37468581"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Norbert=20Kami=C5=84ski?= <norbert.kaminski@3mdeb.com>, "Marek
 Kasiewicz" <marek.kasiewicz@3mdeb.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Michal Zygowski <michal.zygowski@3mdeb.com>, Piotr Krol
	<piotr.krol@3mdeb.com>, Krystian Hebel <krystian.hebel@3mdeb.com>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v2 3/3] x86: Support booting under Secure Startup via SKINIT
Date: Fri, 29 Jan 2021 11:45:10 +0000
Message-ID: <20210129114510.30966-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210115231046.31785-1-andrew.cooper3@citrix.com>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Norbert Kamiński <norbert.kaminski@3mdeb.com>

For now, this is simply enough logic to let Xen come up after the bootloader
has executed an SKINIT instruction to begin a Secure Startup.

During a Secure Startup, the BSP operates with the GIF clear (blocks all
external interrupts, even SMI/NMI), and INIT_REDIRECTION active (converts INIT
IPIs to #SX exceptions, if e.g. the platform needs to scrub secrets before
resetting).  To afford APs the same Secure Startup protections as the BSP, the
INIT IPI must be skipped, and SIPI must be the first interrupt seen.

Full details are available in AMD APM Vol2 15.27 "Secure Startup with SKINIT"

Introduce skinit_enable_intr() and call it from cpu_init(), next to the
enable_nmis() which performs a related function for tboot startups.

Also introduce ap_boot_method to control the sequence of actions for AP boot.

Signed-off-by: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
Signed-off-by: Norbert Kamiński <norbert.kaminski@3mdeb.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
CC: Norbert Kamiński <norbert.kaminski@3mdeb.com>
CC: Michal Zygowski <michal.zygowski@3mdeb.com>
CC: Piotr Krol <piotr.krol@3mdeb.com>
CC: Krystian Hebel <krystian.hebel@3mdeb.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Rich Persaud <persaur@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>

v2:
 * Rebase over 'stgi' cleanup
 * Don't use wrmsr_safe().
---
 xen/arch/x86/cpu/common.c        | 32 ++++++++++++++++++++++++++++++++
 xen/arch/x86/smpboot.c           | 12 +++++++++++-
 xen/include/asm-x86/cpufeature.h |  1 +
 xen/include/asm-x86/msr-index.h  |  1 +
 xen/include/asm-x86/processor.h  |  6 ++++++
 5 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index a684519a20..cca97e4e03 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -834,6 +834,29 @@ void load_system_tables(void)
 	BUG_ON(system_state != SYS_STATE_early_boot && (stack_bottom & 0xf));
 }
 
+static void skinit_enable_intr(void)
+{
+	uint64_t val;
+
+	/*
+	 * If the platform is performing a Secure Launch via SKINIT
+	 * INIT_REDIRECTION flag will be active.
+	 */
+	if ( !cpu_has_skinit || rdmsr_safe(MSR_K8_VM_CR, val) ||
+	     !(val & VM_CR_INIT_REDIRECTION) )
+		return;
+
+	ap_boot_method = AP_BOOT_SKINIT;
+
+	/*
+	 * We don't yet handle #SX.  Disable INIT_REDIRECTION first, before
+	 * enabling GIF, so a pending INIT resets us, rather than causing a
+	 * panic due to an unknown exception.
+	 */
+	wrmsr(MSR_K8_VM_CR, val & ~VM_CR_INIT_REDIRECTION);
+	asm volatile ( "stgi" ::: "memory" );
+}
+
 /*
  * cpu_init() initializes state that is per-CPU. Some data is already
  * initialized (naturally) in the bootstrap process, such as the GDT
@@ -865,6 +888,15 @@ void cpu_init(void)
 	write_debugreg(6, X86_DR6_DEFAULT);
 	write_debugreg(7, X86_DR7_DEFAULT);
 
+	/*
+	 * If the platform is performing a Secure Launch via SKINIT, GIF is
+	 * clear to prevent external interrupts interfering with Secure
+	 * Startup.  Re-enable all interrupts now that we are suitably set up.
+	 *
+	 * Refer to AMD APM Vol2 15.27 "Secure Startup with SKINIT".
+	 */
+	skinit_enable_intr();
+
 	/* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled. */
 	enable_nmis();
 }
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 61ce923189..82c1012e89 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -49,6 +49,7 @@
 #include <mach_apic.h>
 
 unsigned long __read_mostly trampoline_phys;
+enum ap_boot_method __read_mostly ap_boot_method = AP_BOOT_NORMAL;
 
 /* representing HT siblings of each logical CPU */
 DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
@@ -424,7 +425,16 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
 {
     unsigned long send_status = 0, accept_status = 0;
     int maxlvt, timeout, i;
-    bool send_INIT = true;
+
+    /*
+     * Normal AP startup uses an INIT-SIPI-SIPI sequence.
+     *
+     * When using SKINIT for Secure Startup, the INIT IPI must be skipped, so
+     * that SIPI is the first interrupt the AP sees.
+     *
+     * Refer to AMD APM Vol2 15.27 "Secure Startup with SKINIT".
+     */
+    bool send_INIT = ap_boot_method != AP_BOOT_SKINIT;
 
     /*
      * Some versions of tboot might be able to handle the entire wake sequence
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index ad3d84bdde..f62e526a96 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -76,6 +76,7 @@
 #define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
 #define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
 #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
+#define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
 #define cpu_has_fma4            boot_cpu_has(X86_FEATURE_FMA4)
 #define cpu_has_tbm             boot_cpu_has(X86_FEATURE_TBM)
 
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index ff583cf0ed..1f5a5d0e38 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -117,6 +117,7 @@
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
 #define MSR_K8_VM_CR                        0xc0010114
+#define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)
 #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
 
 /*
diff --git a/xen/include/asm-x86/processor.h b/xen/include/asm-x86/processor.h
index 9acb80fdcd..d5f467d245 100644
--- a/xen/include/asm-x86/processor.h
+++ b/xen/include/asm-x86/processor.h
@@ -631,6 +631,12 @@ static inline uint8_t get_cpu_family(uint32_t raw, uint8_t *model,
 extern int8_t opt_tsx, cpu_has_tsx_ctrl;
 void tsx_init(void);
 
+enum ap_boot_method {
+    AP_BOOT_NORMAL,
+    AP_BOOT_SKINIT,
+};
+extern enum ap_boot_method ap_boot_method;
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_X86_PROCESSOR_H */
-- 
2.11.0


