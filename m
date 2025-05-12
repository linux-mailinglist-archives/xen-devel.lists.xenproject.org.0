Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCECFAB4540
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 21:56:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982148.1368722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZGT-0007SR-Ly; Mon, 12 May 2025 19:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982148.1368722; Mon, 12 May 2025 19:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEZGT-0007P8-HY; Mon, 12 May 2025 19:56:41 +0000
Received: by outflank-mailman (input) for mailman id 982148;
 Mon, 12 May 2025 19:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4yg=X4=cloud.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1uEZGR-00071g-Gy
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 19:56:39 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37977802-2f6b-11f0-9eb6-5ba50f476ded;
 Mon, 12 May 2025 21:56:39 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad4ce8cc3c1so86461166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 12:56:39 -0700 (PDT)
Received: from fedora.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197be0c5sm656407366b.153.2025.05.12.12.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 12:56:36 -0700 (PDT)
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
X-Inumbo-ID: 37977802-2f6b-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747079798; x=1747684598; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIEKL1OfSXAaAmq1R0BXNcV8CCHP1Evg860PougFuy0=;
        b=XHgoMzbriWRwYW8zBTFYZtDbV7iAqa9yws6NkwjiN7kgrwXx81eJaXhLj88nKrQ+Xh
         7USXgvjKwyU10xxP3NyLgrIcR2xuk8HtJvBLt326LaiFwDjKyRJrABXIjbg/fXvTuSkI
         mtAjRC9A1SVUB8QoA/qdj4feKt6Cb6cbXBe9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747079798; x=1747684598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIEKL1OfSXAaAmq1R0BXNcV8CCHP1Evg860PougFuy0=;
        b=DJ/UiFz6qb+whJW6fITTClhPC6KNRe/PUeOiprVpBoIrB/yl5YWe+8ACfZGp0fC7bi
         ySTMwkO4sm2BZk3AWtdvOmyMDN41IoP10by7Q5DhI/3TuNGvwfrFTMymkajoNezdabfw
         jfOfJ0U1y+zwDOnslfSZf4Yu6s9BviLCeZB6RCuzXr0GpnlJb85pBrGlBQqGagmDGknU
         DdE9CvmqMizR55tTEy5nKrA+YTVyr/8iidFwoKQg/WLKCBaCZ75K+MHDiF/nVC3WZpUu
         XNcCU7OVEI7mhDSFYvLQsOW+rhrzK2VEVr05wS2T7K2yko/SMImKPMbqK2aL1VpSH7Fx
         Y5JA==
X-Gm-Message-State: AOJu0Yy9zSr7YkRQEKeo/+aN/kBtXkLw4xcd88/uX794y4bnUGYXSv6K
	NHwBXaWQz2/zspt87GV++z0mbZQXGJESwXarq2A3Nu/RrLfaqJNKm9cQ3HPq3Rzj5ouBYMf/s7o
	u
X-Gm-Gg: ASbGnctX3KBErIfNajWT8cvnpoOPaKlcJqoXBzXQbK9qdfCjZOtJ6SULTmL6TABajYB
	3ikijwk8++9YB0zBUiaq2dCB6vhz+2wkpBjFGNZ+NCbYCVZ4ckIP3HVmd0dCwzw9J1q7McQ83yN
	rhqW69SiODHRvIoViNg8inYGmCI+3C/8/ug30Do68oxQRWhQZh1YivSagmY1RjuqjFApo/VAEhx
	l6GbdyPRtWOFgu5p/12wVoPfIrlS/6kmmK1DE1l9ShzgYmV3GL80YVl7GdHSA5Krekvr2lSte2l
	TkhwtC5Jzb4prPpOVguoa5xK1235s3zfhlgZE95RwisK/vb7cSXvSYZYUChlrA22k2Wu
X-Google-Smtp-Source: AGHT+IHMfFZDeuVejZ195aNZbQ2arcgWjbG0MNXrusQtmLt8QE5A2GQX7YRk66FdDb4jFkPf96+lwA==
X-Received: by 2002:a17:907:60ca:b0:ad2:4fb6:3b93 with SMTP id a640c23a62f3a-ad24fb63e30mr666470766b.28.1747079797720;
        Mon, 12 May 2025 12:56:37 -0700 (PDT)
From: Kevin Lampis <kevin.lampis@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 3/3] Disallow most command-line options when lockdown mode is enabled
Date: Mon, 12 May 2025 20:56:28 +0100
Message-ID: <20250512195628.1728455-4-kevin.lampis@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250512195628.1728455-1-kevin.lampis@cloud.com>
References: <20250512195628.1728455-1-kevin.lampis@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A subset of command-line parameters that are specifically safe to use when
lockdown mode is enabled are annotated as such.

Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
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
 xen/common/numa.c                     |  2 +-
 xen/common/page_alloc.c               |  2 +-
 xen/common/shutdown.c                 |  2 +-
 xen/drivers/char/console.c            |  2 +-
 xen/drivers/char/ns16550.c            |  4 +--
 xen/drivers/video/vga.c               |  2 +-
 xen/include/xen/param.h               | 49 +++++++++++++++++++++------
 22 files changed, 70 insertions(+), 35 deletions(-)

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
index 37d67dd15c..c36351c968 100644
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
index 38ac0823d7..453bdb9910 100644
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
index 276957c4ed..1018cdb771 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -70,7 +70,7 @@
 
 /* opt_nosmp: If true, secondary processors are ignored. */
 static bool __initdata opt_nosmp;
-boolean_param("nosmp", opt_nosmp);
+boolean_secure_param("nosmp", opt_nosmp);
 
 /* maxcpus: maximum number of CPUs to activate. */
 static unsigned int __initdata max_cpus;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 25e0d5777e..1af67d2256 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -86,7 +86,7 @@ static char __read_mostly opt_nmi[10] = "dom0";
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
index 6658db9514..eaa509f317 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -14,6 +14,8 @@
 #include <xen/guest_access.h>
 #include <xen/hypercall.h>
 #include <xen/hypfs.h>
+#include <xen/efi.h>
+#include <xen/lockdown.h>
 #include <xsm/xsm.h>
 #include <asm/current.h>
 #include <public/version.h>
@@ -135,9 +137,15 @@ static int parse_params(const char *cmdline, const struct kernel_param *start,
                 }
                 continue;
             }
+            found = true;
+
+            if ( !param->is_lockdown_safe && is_locked_down() )
+            {
+              printk("Ignoring unsafe cmdline option %s in lockdown mode\n", param->name);
+              break;
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
index c3150fbdb7..45a35903fe 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -43,7 +43,7 @@
 
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


