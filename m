Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51F2ACAF6A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:47:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003405.1382977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5VW-0007oV-Ee; Mon, 02 Jun 2025 13:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003405.1382977; Mon, 02 Jun 2025 13:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5VW-0007lf-Ac; Mon, 02 Jun 2025 13:47:18 +0000
Received: by outflank-mailman (input) for mailman id 1003405;
 Mon, 02 Jun 2025 13:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jabw=YR=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uM5VU-0006ld-JL
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:47:16 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17a390bb-3fb8-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 15:47:15 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ad89c32a7b5so711831166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 06:47:15 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5dd04591sm790372466b.114.2025.06.02.06.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 06:47:13 -0700 (PDT)
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
X-Inumbo-ID: 17a390bb-3fb8-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1748872034; x=1749476834; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeLh8Ma6G37ySiE9rnwoSsxN+Os3m5e6sWsq/WSV0LI=;
        b=czLZFUEHgHIbREwRctJWRuZlmhja25ZzL1dFGRaWsDj1seQXhqUUHoKkKSAUIxUJyd
         TaJJawV+8r4t7zsEubpJlsM+jPOf7oYuLDYTCSLqJYCnFR7Ugrw+lBNAlVnkEMt6e33V
         G36ddhv+R6+oPivXdtIrmLHq8gjuIeBlV9Pdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748872034; x=1749476834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jeLh8Ma6G37ySiE9rnwoSsxN+Os3m5e6sWsq/WSV0LI=;
        b=GWJsxZrWLzn7atc5Y40Gz5wSBxaK6D7V8KzN5dLmXPM/FFDSbpuwsCI61TQL5MS/Qd
         kOOfogk9s9DCKrjoibDxKJPEgejXCPfmOPZNqB1mQJe2pVCbXL7HplOccDQqt7E2DQjk
         UAMDThOq482d60o1SNOjltrYpLsFrgN3+rn71DcF94q9QrkTScVNInzLQOT888qFJ4Q8
         +XH+epiQybIWPqxIp8hwZk2VD5JgV/TQQro72IBe5KD+x7L4qfZ68ws/g32Ball4Qt8g
         AAvVVTBOF5Y7cNFZWLLwIbTmEnxt/qFh33JashfRZIEtC8TSF3FCHGceCkgFSWjbCjx3
         kmZw==
X-Gm-Message-State: AOJu0YzyUCT4v5uQ/2Xj6aMCuwCJ60BJGmarpMEiKgdvWf75LzhWL7ts
	mNQTAjUrvHysjNmTkrRtwCtVWZoNBpC6HMKoNb5ozEhPalUxd0qUXN8nVznvNPOwGhjP+LqiXfg
	Vzk4d
X-Gm-Gg: ASbGncsQmjdT68aDl/g4POQtNyBZo/yQxs3tTp5Lo6RcuqrjDcYwh7ZjdZ6GQETkNEa
	V6CxM2wPPh3tb/Zolb+5LOE36M75CjYXu/N4LjowVCS3k0tgdIkhwtVd38utMUM+tbZtD2HpOAm
	da8Jlz0nSEtmVlMvnuL9dO6+Ki0zsEOy/Hb1RhSxefss8YHcT9fTCsmwVgCQVsjDIpRxMWbgRSk
	+0S2Gsa/7E/WIKpUGXtr6cDOZjd9jlUcBafhg6lTGzd1yc4fzfisPmcmWFEpdgk2lLzy9LqrPRT
	6gQvNij36CYlWp5rj3Xw3Dh/+hfEkFHYVvgdO4As4cgTgB3CzvcbriXPZjp6bVSeG34e
X-Google-Smtp-Source: AGHT+IEYwBX8bu190Ojee9nWXLiHoSLcBexR8JtlLtqIaRnE3WzzQdWdetG4JLk+JnPEyKtmvjLpHQ==
X-Received: by 2002:a17:907:971e:b0:ad8:81c2:64e9 with SMTP id a640c23a62f3a-adb322b3326mr1123457566b.8.1748872034117;
        Mon, 02 Jun 2025 06:47:14 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 3/3] Disallow most command-line options when lockdown mode is enabled
Date: Mon,  2 Jun 2025 14:46:56 +0100
Message-ID: <20250602134656.3836280-4-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250602134656.3836280-1-kevin.lampis@cloud.com>
References: <20250602134656.3836280-1-kevin.lampis@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A subset of command-line parameters that are specifically safe to use when
lockdown mode is enabled are annotated as such.

These are commonly used parameters which have been audited to ensure they
cannot be used to undermine the integrity of the system when booted in
Secure Boot mode.

Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
Changes in v2:
- Add more information about the safe parameters
- Add lockdown section to the command line doc
---
 docs/misc/xen-command-line.pandoc     | 16 +++++++++
 xen/arch/arm/domain_build.c           |  4 +--
 xen/arch/x86/acpi/cpu_idle.c          |  2 +-
 xen/arch/x86/cpu/amd.c                |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c         |  2 +-
 xen/arch/x86/cpu/microcode/core.c     |  2 +-
 xen/arch/x86/dom0_build.c             |  4 +--
 xen/arch/x86/hvm/hvm.c                |  2 +-
 xen/arch/x86/irq.c                    |  2 +-
 xen/arch/x86/nmi.c                    |  2 +-
 xen/arch/x86/setup.c                  |  2 +-
 xen/arch/x86/traps.c                  |  2 +-
 xen/arch/x86/x86_64/mmconfig-shared.c |  2 +-
 xen/common/domain.c                   |  2 +-
 xen/common/kernel.c                   | 10 +++++-
 xen/common/kexec.c                    |  2 +-
 xen/common/lockdown.c                 |  2 +-
 xen/common/numa.c                     |  2 +-
 xen/common/page_alloc.c               |  2 +-
 xen/common/shutdown.c                 |  2 +-
 xen/drivers/char/console.c            |  2 +-
 xen/drivers/char/ns16550.c            |  4 +--
 xen/drivers/video/vga.c               |  2 +-
 xen/include/xen/param.h               | 49 +++++++++++++++++++++------
 24 files changed, 87 insertions(+), 36 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b0eadd2c5d..7916875f22 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1798,6 +1798,22 @@ immediately. Specifying `0` will disable all testing of illegal lock nesting.
 
 This option is available for hypervisors built with CONFIG_DEBUG_LOCKS only.
 
+### lockdown
+> `= <boolean>`
+
+> Default: `false`
+
+The intention of lockdown mode is to prevent attacks from a rogue dom0
+userspace from compromising the system. It is also enabled automatically
+when Secure Boot is enabled and it cannot be disabled in that case.
+
+After lockdown mode is enabled some unsafe command line options will be
+ignored by Xen.
+
+If enabling lockdown mode via the command line then ensure it is positioned as
+the first option in the command line string otherwise Xen may process unsafe
+options before reaching the lockdown parameter.
+
 ### loglvl
 > `= <level>[/<rate-limited level>]` where level is `none | error | warning | info | debug | all`
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b189a7cfae..ef1cba8f0f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -41,7 +41,7 @@
 #include <xen/serial.h>
 
 static unsigned int __initdata opt_dom0_max_vcpus;
-integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
+integer_secure_param("dom0_max_vcpus", opt_dom0_max_vcpus);
 
 /*
  * If true, the extended regions support is enabled for dom0 and
@@ -61,7 +61,7 @@ static int __init parse_dom0_mem(const char *s)
 
     return *s ? -EINVAL : 0;
 }
-custom_param("dom0_mem", parse_dom0_mem);
+custom_secure_param("dom0_mem", parse_dom0_mem);
 
 int __init parse_arch_dom0_param(const char *s, const char *e)
 {
diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 1dbf15b01e..431fd0c997 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -113,7 +113,7 @@ static int __init cf_check parse_cstate(const char *s)
         max_csubstate = simple_strtoul(s + 1, NULL, 0);
     return 0;
 }
-custom_param("max_cstate", parse_cstate);
+custom_secure_param("max_cstate", parse_cstate);
 
 static bool __read_mostly local_apic_timer_c2_ok;
 boolean_param("lapic_timer_c2_ok", local_apic_timer_c2_ok);
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 27ae167808..9aab3d05e1 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -47,7 +47,7 @@ integer_param("cpuid_mask_thermal_ecx", opt_cpuid_mask_thermal_ecx);
 
 /* 1 = allow, 0 = don't allow guest creation, -1 = don't allow boot */
 int8_t __read_mostly opt_allow_unsafe;
-boolean_param("allow_unsafe", opt_allow_unsafe);
+boolean_secure_param("allow_unsafe", opt_allow_unsafe);
 
 /* Signal whether the ACPI C1E quirk is required. */
 bool __read_mostly amd_acpi_c1e_quirk;
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 1c348e557d..a229af6fd3 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -31,7 +31,7 @@
 #include "vmce.h"
 
 bool __read_mostly opt_mce = true;
-boolean_param("mce", opt_mce);
+boolean_secure_param("mce", opt_mce);
 bool __read_mostly mce_broadcast;
 bool is_mc_panic;
 DEFINE_PER_CPU_READ_MOSTLY(unsigned int, nr_mce_banks);
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 34a94cd25b..b5b7304ae7 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -160,7 +160,7 @@ static int __init cf_check parse_ucode(const char *s)
 
     return rc;
 }
-custom_param("ucode", parse_ucode);
+custom_secure_param("ucode", parse_ucode);
 
 static struct microcode_ops __ro_after_init ucode_ops;
 
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4..6d42acb661 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -142,7 +142,7 @@ static int __init cf_check parse_dom0_mem(const char *s)
 
     return s[-1] ? -EINVAL : ret;
 }
-custom_param("dom0_mem", parse_dom0_mem);
+custom_secure_param("dom0_mem", parse_dom0_mem);
 
 static unsigned int __initdata opt_dom0_max_vcpus_min = 1;
 static unsigned int __initdata opt_dom0_max_vcpus_max = UINT_MAX;
@@ -164,7 +164,7 @@ static int __init cf_check parse_dom0_max_vcpus(const char *s)
 
     return *s ? -EINVAL : 0;
 }
-custom_param("dom0_max_vcpus", parse_dom0_max_vcpus);
+custom_secure_param("dom0_max_vcpus", parse_dom0_max_vcpus);
 
 static __initdata unsigned int dom0_nr_pxms;
 static __initdata unsigned int dom0_pxms[MAX_NUMNODES] =
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4cb2e13046..97afb274fe 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -87,7 +87,7 @@ unsigned long __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 
 /* Xen command-line option to enable HAP */
 static bool __initdata opt_hap_enabled = true;
-boolean_param("hap", opt_hap_enabled);
+boolean_secure_param("hap", opt_hap_enabled);
 
 #ifndef opt_hvm_fep
 /* Permit use of the Forced Emulation Prefix in HVM guests */
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 556134f85a..44f39f6ece 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -34,7 +34,7 @@
 
 /* opt_noirqbalance: If true, software IRQ balancing/affinity is disabled. */
 bool __read_mostly opt_noirqbalance;
-boolean_param("noirqbalance", opt_noirqbalance);
+boolean_secure_param("noirqbalance", opt_noirqbalance);
 
 unsigned int __read_mostly nr_irqs_gsi = NR_ISA_IRQS;
 unsigned int __read_mostly nr_irqs;
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 9793fa2316..3735f22e88 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -73,7 +73,7 @@ static int __init cf_check parse_watchdog(const char *s)
 
     return 0;
 }
-custom_param("watchdog", parse_watchdog);
+custom_secure_param("watchdog", parse_watchdog);
 
 /* opt_watchdog_timeout: Number of seconds to wait before panic. */
 static unsigned int opt_watchdog_timeout = 5;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index efeed5eafc..adfaf8667b 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -71,7 +71,7 @@
 
 /* opt_nosmp: If true, secondary processors are ignored. */
 static bool __initdata opt_nosmp;
-boolean_param("nosmp", opt_nosmp);
+boolean_secure_param("nosmp", opt_nosmp);
 
 /* maxcpus: maximum number of CPUs to activate. */
 static unsigned int __initdata max_cpus;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 092c7e4197..1a1ce541c3 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -61,7 +61,7 @@ static char __read_mostly opt_nmi[10] = "dom0";
 #else
 static char __read_mostly opt_nmi[10] = "fatal";
 #endif
-string_param("nmi", opt_nmi);
+string_secure_param("nmi", opt_nmi);
 
 DEFINE_PER_CPU(uint64_t, efer);
 static DEFINE_PER_CPU(unsigned long, last_extable_addr);
diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
index f1a3d42c5b..80cdca7d77 100644
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -60,7 +60,7 @@ static int __init cf_check parse_mmcfg(const char *s)
 
     return rc;
 }
-custom_param("mmcfg", parse_mmcfg);
+custom_secure_param("mmcfg", parse_mmcfg);
 
 static const char *__init cf_check pci_mmcfg_e7520(void)
 {
diff --git a/xen/common/domain.c b/xen/common/domain.c
index abf1969e60..c95988c067 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -55,7 +55,7 @@ unsigned int xen_processor_pmbits = XEN_PROCESSOR_PM_PX;
 
 /* opt_dom0_vcpus_pin: If true, dom0 VCPUs are pinned. */
 bool opt_dom0_vcpus_pin;
-boolean_param("dom0_vcpus_pin", opt_dom0_vcpus_pin);
+boolean_secure_param("dom0_vcpus_pin", opt_dom0_vcpus_pin);
 
 /* Protect updates/reads (resp.) of domain_list and domain_hash. */
 DEFINE_SPINLOCK(domlist_update_lock);
diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 7280da987d..923ea43cee 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -14,6 +14,7 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/hypfs.h>
+#include <xen/efi.h>
 #include <xen/lockdown.h>
 #include <xsm/xsm.h>
 #include <asm/current.h>
@@ -136,9 +137,16 @@ static int parse_params(const char *cmdline, const struct kernel_param *start,
                 }
                 continue;
             }
+            found = true;
+
+            if ( !param->is_lockdown_safe && is_locked_down() )
+            {
+                printk("Ignoring unsafe cmdline option %s in lockdown mode\n",
+                       param->name);
+                break;
+            }
 
             rctmp = 0;
-            found = true;
             switch ( param->type )
             {
             case OPT_STR:
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 84fe8c3597..790839657d 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -189,7 +189,7 @@ static int __init cf_check parse_crashkernel(const char *str)
 
     return rc;
 }
-custom_param("crashkernel", parse_crashkernel);
+custom_secure_param("crashkernel", parse_crashkernel);
 
 /* Parse command lines in the format:
  *
diff --git a/xen/common/lockdown.c b/xen/common/lockdown.c
index 84eabe9c83..cd3deeb63e 100644
--- a/xen/common/lockdown.c
+++ b/xen/common/lockdown.c
@@ -35,7 +35,7 @@ static int __init parse_lockdown_opt(const char *s)
 
     return 0;
 }
-custom_param("lockdown", parse_lockdown_opt);
+custom_secure_param("lockdown", parse_lockdown_opt);
 
 bool is_locked_down(void)
 {
diff --git a/xen/common/numa.c b/xen/common/numa.c
index ad75955a16..c4981f2ff1 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -687,7 +687,7 @@ static int __init cf_check numa_setup(const char *opt)
 
     return 0;
 }
-custom_param("numa", numa_setup);
+custom_secure_param("numa", numa_setup);
 
 static void cf_check dump_numa(unsigned char key)
 {
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e57a287133..a07690d8fd 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -235,7 +235,7 @@ static int __init cf_check parse_bootscrub_param(const char *s)
 
     return 0;
 }
-custom_param("bootscrub", parse_bootscrub_param);
+custom_secure_param("bootscrub", parse_bootscrub_param);
 
 /*
  * bootscrub_chunk -> Amount of bytes to scrub lockstep on non-SMT CPUs
diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index c47341b977..231de1454a 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -13,7 +13,7 @@
 
 /* opt_noreboot: If true, machine will need manual reset on error. */
 bool __ro_after_init opt_noreboot;
-boolean_param("noreboot", opt_noreboot);
+boolean_secure_param("noreboot", opt_noreboot);
 
 static void noreturn reboot_or_halt(void)
 {
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 30701ae0b0..4f4f4aab19 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -65,7 +65,7 @@ static void console_send(const char *str, size_t len, unsigned int flags);
 
 /* console: comma-separated list of console outputs. */
 static char __initdata opt_console[30] = OPT_CONSOLE_STR;
-string_param("console", opt_console);
+string_secure_param("console", opt_console);
 
 /* conswitch: a character pair controlling console switching. */
 /* Char 1: CTRL+<char1> is used to switch console input between Xen and DOM0 */
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index eaeb0e09d0..fae509cbd8 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1390,8 +1390,8 @@ static void enable_exar_enhanced_bits(const struct ns16550 *uart)
  */
 static char __initdata opt_com1[128] = "";
 static char __initdata opt_com2[128] = "";
-string_param("com1", opt_com1);
-string_param("com2", opt_com2);
+string_secure_param("com1", opt_com1);
+string_secure_param("com2", opt_com2);
 
 enum serial_param_type {
     baud_rate,
diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
index b577b24619..abc6e56aa3 100644
--- a/xen/drivers/video/vga.c
+++ b/xen/drivers/video/vga.c
@@ -48,7 +48,7 @@ void (*video_puts)(const char *s, size_t nr) = vga_noop_puts;
  * control of the console to domain 0.
  */
 static char __initdata opt_vga[30] = "";
-string_param("vga", opt_vga);
+string_secure_param("vga", opt_vga);
 
 /* VGA text-mode definitions. */
 static unsigned int columns, lines;
diff --git a/xen/include/xen/param.h b/xen/include/xen/param.h
index 1bdbab34ab..31e7326d88 100644
--- a/xen/include/xen/param.h
+++ b/xen/include/xen/param.h
@@ -25,6 +25,7 @@ struct kernel_param {
         void *var;
         int (*func)(const char *s);
     } par;
+    bool is_lockdown_safe;
 };
 
 /* Maximum length of a single parameter string. */
@@ -44,46 +45,72 @@ extern const struct kernel_param __setup_start[], __setup_end[];
 #define _TEMP_NAME(base, line) __TEMP_NAME(base, line)
 #define TEMP_NAME(base) _TEMP_NAME(base, __LINE__)
 
-#define custom_param(_name, _var) \
+#define custom_param_(_name, _var, _sec) \
     __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_CUSTOM, \
-          .par.func = (_var) }
-#define boolean_param(_name, _var) \
+          .par.func = (_var), \
+          .is_lockdown_safe = (_sec) }
+#define custom_param(_name, _var) \
+    custom_param_(_name, _var, false)
+#define custom_secure_param(_name, _var) \
+    custom_param_(_name, _var, true)
+#define boolean_param_(_name, _var, _sec) \
     __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_BOOL, \
           .len = sizeof(_var) + \
                  BUILD_BUG_ON_ZERO(sizeof(_var) != sizeof(bool)), \
-          .par.var = &(_var) }
-#define integer_param(_name, _var) \
+          .par.var = &(_var), \
+          .is_lockdown_safe = (_sec) }
+#define boolean_param(_name, _var) \
+    boolean_param_(_name, _var, false)
+#define boolean_secure_param(_name, _var) \
+    boolean_param_(_name, _var, true)
+#define integer_param_(_name, _var, _sec) \
     __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_UINT, \
           .len = sizeof(_var), \
-          .par.var = &(_var) }
-#define size_param(_name, _var) \
+          .par.var = &(_var), \
+          .is_lockdown_safe = (_sec) }
+#define integer_param(_name, _var) \
+    integer_param_(_name, _var, false)
+#define integer_secure_param(_name, _var) \
+    integer_param_(_name, _var, true)
+#define size_param_(_name, _var, _sec) \
     __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_SIZE, \
           .len = sizeof(_var), \
-          .par.var = &(_var) }
-#define string_param(_name, _var) \
+          .par.var = &(_var), \
+          .is_lockdown_safe = (_sec) }
+#define size_param(_name, _var) \
+    size_param_(_name, _var, false)
+#define size_secure_param(_name, _var) \
+    size_param_(_name, _var, true)
+#define string_param_(_name, _var, _sec) \
     __setup_str __setup_str_##_var[] = (_name); \
     __kparam __setup_##_var = \
         { .name = __setup_str_##_var, \
           .type = OPT_STR, \
           .len = sizeof(_var), \
-          .par.var = &(_var) }
+          .par.var = &(_var), \
+          .is_lockdown_safe = (_sec) }
+#define string_param(_name, _var) \
+  string_param_(_name, _var, false)
+#define string_secure_param(_name, _var) \
+  string_param_(_name, _var, true)
 #define ignore_param(_name)                 \
     __setup_str TEMP_NAME(__setup_str_ign)[] = (_name);  \
     __kparam TEMP_NAME(__setup_ign) =                    \
         { .name = TEMP_NAME(__setup_str_ign),            \
-          .type = OPT_IGNORE }
+          .type = OPT_IGNORE,                            \
+          .is_lockdown_safe = true }
 
 #ifdef CONFIG_HYPFS
 
-- 
2.42.0


