Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5A158F312
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383878.619124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPM-00078L-Pz; Wed, 10 Aug 2022 19:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383878.619124; Wed, 10 Aug 2022 19:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPM-00075J-Kz; Wed, 10 Aug 2022 19:30:24 +0000
Received: by outflank-mailman (input) for mailman id 383878;
 Wed, 10 Aug 2022 19:30:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPL-0005rf-3O
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:23 +0000
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [2607:f8b0:4864:20::829])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df53c7b2-18e2-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 21:30:21 +0200 (CEST)
Received: by mail-qt1-x829.google.com with SMTP id y18so1880286qtv.5
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:21 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:18 -0700 (PDT)
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
X-Inumbo-ID: df53c7b2-18e2-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=jO9XMqeKcSpPkx9F4IM717CUVIYEi9EqWDYU/rzhTS0=;
        b=QOt7cUYBZJqmsFGp43FBhVtWSxsRzBGDfC0NCp3LaYlJaqBn6hg1noBnX1U3AYcZjm
         oKxhLSyaCEVChpMvOETi8inV53A7YyVyJ5RoOl+Kq3qMAuWSJJ5HjNAXw+JTgssB0xT5
         qvoS5pjOWTrpq1AD7+VpgHVIvQVw3lfDloJRCOPwlYLjgD8EWmb6JTpPvI/aUPTBRJIo
         6Z8EPor0LV4+/bw/bNc3Zt2nyhauicslcUC1gfjUsSW4O+L8cij29Nv45SwSCwZBRQEi
         LYftu7P3bUU50vkiLHxkzdYBMxSydSUcx6rreWA0TgiPuY1c1zghVJIc0XO2o+jdHlnY
         WPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=jO9XMqeKcSpPkx9F4IM717CUVIYEi9EqWDYU/rzhTS0=;
        b=yuQny7KM8MffoopI/wS25hQv7cfFdqPUTQKCFTLnrKhB3T6N9ZVDz5DmLc6WYNXUJX
         zCoxIQKmO7JflXsFg25F14kUjVw6ujZSf+0FiAcG4lLC8nO7J7uhu1pbOI4uT1LlwUTH
         W0S12n6OjGJ+nolttlG5xmNQCPGtSs+WiHTc8cOphJnMHukSBgOu/6Ly35Hc5Bny866f
         Gvo0D5wEoq7HPdVF9Ou4VAuBfn+TZIadhqAzsXd7nyIgbvYdmeOVz6EMGWJb7pk5ep2i
         fFchg/ZcRER9X9CQwgHbwrjRgD1haWttwqwYhd6/TNCUopMRjB9ewGOqU8LjGpQQuYLX
         66OA==
X-Gm-Message-State: ACgBeo1eXyrahYBNc+TA2dQvx+VRLbhbvrp8BZjU/IpOMETsfylkFefj
	/sf3KS8bIHL7GgJNG6qLwZgcB5BxN6U=
X-Google-Smtp-Source: AA6agR7BmVnnkfyVRD6UMjBOIf0t8Vc9ybTPqd1ruaxG78toIKqZz1xc/qDhT+xKuwCGNS6D8C+CJQ==
X-Received: by 2002:ac8:5a16:0:b0:342:f905:bdf2 with SMTP id n22-20020ac85a16000000b00342f905bdf2mr13956377qta.364.1660159819512;
        Wed, 10 Aug 2022 12:30:19 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 04/13] cpufreq: Add Hardware P-State (HWP) driver
Date: Wed, 10 Aug 2022 15:29:35 -0400
Message-Id: <20220810192944.102135-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From the Intel SDM: "Hardware-Controlled Performance States (HWP), which
autonomously selects performance states while utilizing OS supplied
performance guidance hints."

Enable HWP to run in autonomous mode by poking the correct MSRs.
cpufreq=xen:hwp enables and cpufreq=xen:hwp=0 disables.  The same for
hdc.

There is no interface to configure - xen_sysctl_pm_op/xenpm will
be to be extended to configure in subsequent patches.  It will run with
the default values, which should be the default 0x80 (out
of 0x0-0xff) energy/performance preference.

Unscientific powertop measurement of an mostly idle, customized OpenXT
install:
A 10th gen 6-core laptop showed battery discharge drop from ~9.x to
~7.x watts.
A 8th gen 4-core laptop dropped from ~10 to ~9

Power usage depends on many factors, especially display brightness, but
this does show an power saving in balanced mode when CPU utilization is
low.

HWP isn't compatible with an external governor - it doesn't take
explicit frequency requests.  Therefore a minimal internal governor,
hwp-internal, is also added as a placeholder.

While adding to the xen-command-line.pandoc entry, un-nest verbose from
minfreq.  They are independent.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

---

We disable on cpuid_level < 0x16.  cpuid(0x16) is used to get the cpu
frequencies for calculating the APERF/MPERF.  Without it, things would
still work, but the averge cpufrequency output would be wrong.

My 8th & 10th gen test systems both report:
(XEN) HWP: 1 notify: 1 act_window: 1 energy_perf: 1 pkg_level: 0 peci: 0
(XEN) HWP: Hardware Duty Cycling (HDC) supported
(XEN) HWP: HW_FEEDBACK not supported

IA32_ENERGY_PERF_BIAS has not been tested.

For cpufreq=xen:hwp, placing the option inside the governor wouldn't
work.  Users would have to select the hwp-internal governor to turn off
hwp support.  hwp-internal isn't usable without hwp, and users wouldn't
be able to select a different governor.  That doesn't matter while hwp
defaults off, but it would if or when hwp defaults to enabled.

We can't use parse_boolean() since it requires a single name=val string
and cpufreq_handle_common_option is provided two strings.  Use
parse_bool() and manual handle no-hwp.

Write to disable the interrupt - the linux pstate driver does this.  We
don't use the interrupts, so we can just turn them off.  We aren't ready
to handle them, so we don't want any.  Unclear if this is necessary.
SDM says it's default disabled.

FAST_IA32_HWP_REQUEST was removed in v2.  The check in v1 was wrong,
it's a model specific feature and the CPUID bit is only available
after enabling via the MSR.  Support was untested since I don't have
hardware with the feature.  Writes are expected to be infrequent, so
just leave it out.

---
v2:
Alphabetize headers
Re-work driver registration
name hwp_drv_data anonymous union "hw"
Drop hwp_verbose_cont
style cleanups
Condense hwp_governor switch
hwp_cpufreq_target remove .raw from hwp_req assignment
Use typed-pointer in a few functions
Pass type to xzalloc
Add HWP_ENERGY_PERF_BALANCE/IA32_ENERGY_BIAS_BALANCE defines
Add XEN_HWP_GOVERNOR define for "hwp-internal"
Capitalize CPUID and MSR defines
Change '_' to '-' for energy-perf & act-window
Read-modify-write MSRs updates
Use FAST_IA32_HWP_REQUEST_MSR_ENABLE define
constify pointer in hwp_set_misc_turbo
Add space after non-fallthrough break in governor switch
Add IA32_ENERGY_BIAS_MASK define
Check CPUID_PM_LEAK for energy bias when needed
Fail initialization with curr_req = -1
Fold hwp_read_capabilities into hwp_init_msrs
Add command line cpufreq=xen:hwp
Add command line cpufreq=xen:hdc
Use per_cpu for hwp_drv_data pointers
Move hwp_energy_perf_bias call into hwp_write_request
energy_perf 0 is valid, so hwp_energy_perf_bias cannot be skipped
Ensure we don't generate interrupts
Remove Fast Write of Uncore MSR
Initialize hwp_drv_data from curr_req
Use SPDX line instead of license text in hwp.c
---
 docs/misc/xen-command-line.pandoc         |   8 +-
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |   5 +-
 xen/arch/x86/acpi/cpufreq/hwp.c           | 506 ++++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeature.h     |  13 +-
 xen/arch/x86/include/asm/msr-index.h      |  13 +
 xen/drivers/cpufreq/cpufreq.c             |  32 ++
 xen/include/acpi/cpufreq/cpufreq.h        |   3 +
 xen/include/acpi/cpufreq/processor_perf.h |   3 +
 xen/include/public/sysctl.h               |   1 +
 10 files changed, 581 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index fa56e880b3..2ac5b8f5aa 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -492,7 +492,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
 available support.
 
 ### cpufreq
-> `= none | {{ <boolean> | xen } [:[powersave|performance|ondemand|userspace][,<maxfreq>][,[<minfreq>][,[verbose]]]]} | dom0-kernel`
+> `= none | {{ <boolean> | xen } [:[powersave|performance|ondemand|userspace][,<hdc>][,[<hwp>]][,[<maxfreq>]][,[<minfreq>]][,[verbose]]]} | dom0-kernel`
 
 > Default: `xen`
 
@@ -503,6 +503,12 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `<maxfreq>` and `<minfreq>` are integers which represent max and min processor frequencies
   respectively.
 * `verbose` option can be included as a string or also as `verbose=<integer>`
+* `<hwp>` is a boolean to enable Hardware-Controlled Performance States (HWP)
+  on supported Intel hardware.  HWP is a Skylake+ feature which provides better
+  CPU power management.  The default is disabled.
+* `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC enables the
+  processor to autonomously force physical package components into idle state.
+  The default is enabled, but the option only applies when `<hwp>` is enabled.
 
 ### cpuid (x86)
 > `= List of comma separated booleans`
diff --git a/xen/arch/x86/acpi/cpufreq/Makefile b/xen/arch/x86/acpi/cpufreq/Makefile
index f75da9b9ca..db83aa6b14 100644
--- a/xen/arch/x86/acpi/cpufreq/Makefile
+++ b/xen/arch/x86/acpi/cpufreq/Makefile
@@ -1,2 +1,3 @@
 obj-y += cpufreq.o
+obj-y += hwp.o
 obj-y += powernow.o
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index b5eb869227..baafaf9b90 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -643,7 +643,10 @@ static int __init cf_check cpufreq_driver_init(void)
         switch ( boot_cpu_data.x86_vendor )
         {
         case X86_VENDOR_INTEL:
-            ret = cpufreq_register_driver(&acpi_cpufreq_driver);
+            if ( hwp_available() )
+                ret = hwp_register_driver();
+            else
+                ret = cpufreq_register_driver(&acpi_cpufreq_driver);
             break;
 
         case X86_VENDOR_AMD:
diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
new file mode 100644
index 0000000000..405cbae334
--- /dev/null
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -0,0 +1,506 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * hwp.c cpufreq driver to run Intel Hardware P-States (HWP)
+ *
+ * Copyright (C) 2021 Jason Andryuk <jandryuk@gmail.com>
+ */
+
+#include <xen/cpumask.h>
+#include <xen/init.h>
+#include <xen/param.h>
+#include <xen/xmalloc.h>
+#include <asm/io.h>
+#include <asm/msr.h>
+#include <acpi/cpufreq/cpufreq.h>
+
+static bool feature_hwp;
+static bool feature_hwp_notification;
+static bool feature_hwp_activity_window;
+static bool feature_hwp_energy_perf;
+static bool feature_hwp_pkg_level_ctl;
+static bool feature_hwp_peci;
+
+static bool feature_hdc;
+
+__initdata bool opt_cpufreq_hwp = false;
+__initdata bool opt_cpufreq_hdc = true;
+
+#define HWP_ENERGY_PERF_BALANCE         0x80
+#define IA32_ENERGY_BIAS_BALANCE        0x7
+#define IA32_ENERGY_BIAS_MAX_POWERSAVE  0xf
+#define IA32_ENERGY_BIAS_MASK           0xf
+
+union hwp_request
+{
+    struct
+    {
+        uint64_t min_perf:8;
+        uint64_t max_perf:8;
+        uint64_t desired:8;
+        uint64_t energy_perf:8;
+        uint64_t activity_window:10;
+        uint64_t package_control:1;
+        uint64_t reserved:16;
+        uint64_t activity_window_valid:1;
+        uint64_t energy_perf_valid:1;
+        uint64_t desired_valid:1;
+        uint64_t max_perf_valid:1;
+        uint64_t min_perf_valid:1;
+    };
+    uint64_t raw;
+};
+
+struct hwp_drv_data
+{
+    union
+    {
+        uint64_t hwp_caps;
+        struct
+        {
+            uint64_t highest:8;
+            uint64_t guaranteed:8;
+            uint64_t most_efficient:8;
+            uint64_t lowest:8;
+            uint64_t reserved:32;
+        } hw;
+    };
+    union hwp_request curr_req;
+    uint16_t activity_window;
+    uint8_t minimum;
+    uint8_t maximum;
+    uint8_t desired;
+    uint8_t energy_perf;
+};
+DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);
+
+#define hwp_err(...)     printk(XENLOG_ERR __VA_ARGS__)
+#define hwp_info(...)    printk(XENLOG_INFO __VA_ARGS__)
+#define hwp_verbose(...)                   \
+({                                         \
+    if ( cpufreq_verbose )                 \
+        printk(XENLOG_DEBUG __VA_ARGS__);  \
+})
+
+static int cf_check hwp_governor(struct cpufreq_policy *policy,
+                                 unsigned int event)
+{
+    int ret;
+
+    if ( policy == NULL )
+        return -EINVAL;
+
+    switch ( event )
+    {
+    case CPUFREQ_GOV_START:
+    case CPUFREQ_GOV_LIMITS:
+        ret = 0;
+        break;
+
+    case CPUFREQ_GOV_STOP:
+    default:
+        ret = -EINVAL;
+        break;
+    }
+
+    return ret;
+}
+
+static struct cpufreq_governor hwp_cpufreq_governor =
+{
+    .name          = XEN_HWP_GOVERNOR,
+    .governor      = hwp_governor,
+};
+
+static int __init cpufreq_gov_hwp_init(void)
+{
+    return cpufreq_register_governor(&hwp_cpufreq_governor);
+}
+__initcall(cpufreq_gov_hwp_init);
+
+bool __init hwp_available(void)
+{
+    unsigned int eax, ecx, unused;
+    bool use_hwp;
+
+    if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
+    {
+        hwp_verbose("cpuid_level (%u) lacks HWP support\n",
+                    boot_cpu_data.cpuid_level);
+        return false;
+    }
+
+    if ( boot_cpu_data.cpuid_level < 0x16 )
+    {
+        hwp_info("HWP disabled: cpuid_level %x < 0x16 lacks CPU freq info\n",
+                 boot_cpu_data.cpuid_level);
+        return false;
+    }
+
+    cpuid(CPUID_PM_LEAF, &eax, &unused, &ecx, &unused);
+
+    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) &&
+         !(ecx & CPUID6_ECX_IA32_ENERGY_PERF_BIAS) )
+    {
+        hwp_verbose("HWP disabled: No energy/performance preference available");
+        return false;
+    }
+
+    feature_hwp                 = eax & CPUID6_EAX_HWP;
+    feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
+    feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
+    feature_hwp_energy_perf     =
+        eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE;
+    feature_hwp_pkg_level_ctl   = eax & CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST;
+    feature_hwp_peci            = eax & CPUID6_EAX_HWP_PECI;
+
+    hwp_verbose("HWP: %d notify: %d act-window: %d energy-perf: %d pkg-level: %d peci: %d\n",
+                feature_hwp, feature_hwp_notification,
+                feature_hwp_activity_window, feature_hwp_energy_perf,
+                feature_hwp_pkg_level_ctl, feature_hwp_peci);
+
+    if ( !feature_hwp )
+        return false;
+
+    feature_hdc = eax & CPUID6_EAX_HDC;
+
+    hwp_verbose("HWP: Hardware Duty Cycling (HDC) %ssupported%s\n",
+                feature_hdc ? "" : "not ",
+                feature_hdc ? opt_cpufreq_hdc ? ", enabled" : ", disabled"
+                            : "");
+
+    feature_hdc = feature_hdc && opt_cpufreq_hdc;
+
+    hwp_verbose("HWP: HW_FEEDBACK %ssupported\n",
+                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
+
+    use_hwp = feature_hwp && opt_cpufreq_hwp;
+    cpufreq_governor_internal = use_hwp;
+
+    if ( use_hwp )
+        hwp_info("Using HWP for cpufreq\n");
+
+    return use_hwp;
+}
+
+static void hdc_set_pkg_hdc_ctl(bool val)
+{
+    uint64_t msr;
+
+    if ( rdmsr_safe(MSR_IA32_PKG_HDC_CTL, msr) )
+    {
+        hwp_err("error rdmsr_safe(MSR_IA32_PKG_HDC_CTL)\n");
+
+        return;
+    }
+
+    if ( val )
+        msr |= IA32_PKG_HDC_CTL_HDC_PKG_ENABLE;
+    else
+        msr &= ~IA32_PKG_HDC_CTL_HDC_PKG_ENABLE;
+
+    if ( wrmsr_safe(MSR_IA32_PKG_HDC_CTL, msr) )
+        hwp_err("error wrmsr_safe(MSR_IA32_PKG_HDC_CTL): %016lx\n", msr);
+}
+
+static void hdc_set_pm_ctl1(bool val)
+{
+    uint64_t msr;
+
+    if ( rdmsr_safe(MSR_IA32_PM_CTL1, msr) )
+    {
+        hwp_err("error rdmsr_safe(MSR_IA32_PM_CTL1)\n");
+
+        return;
+    }
+
+    if ( val )
+        msr |= IA32_PM_CTL1_HDC_ALLOW_BLOCK;
+    else
+        msr &= ~IA32_PM_CTL1_HDC_ALLOW_BLOCK;
+
+    if ( wrmsr_safe(MSR_IA32_PM_CTL1, msr) )
+        hwp_err("error wrmsr_safe(MSR_IA32_PM_CTL1): %016lx\n", msr);
+}
+
+static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
+{
+    uint32_t base_khz, max_khz, bus_khz, edx;
+
+    cpuid(0x16, &base_khz, &max_khz, &bus_khz, &edx);
+
+    /* aperf/mperf scales base. */
+    policy->cpuinfo.perf_freq = base_khz * 1000;
+    policy->cpuinfo.min_freq = base_khz * 1000;
+    policy->cpuinfo.max_freq = max_khz * 1000;
+    policy->min = base_khz * 1000;
+    policy->max = max_khz * 1000;
+    policy->cur = 0;
+}
+
+static void cf_check hwp_init_msrs(void *info)
+{
+    struct cpufreq_policy *policy = info;
+    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
+    uint64_t val;
+
+    /*
+     * Package level MSR, but we don't have a good idea of packages here, so
+     * just do it everytime.
+     */
+    if ( rdmsr_safe(MSR_IA32_PM_ENABLE, val) )
+    {
+        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_PM_ENABLE)\n", policy->cpu);
+        data->curr_req.raw = -1;
+        return;
+    }
+
+    /* Ensure we don't generate interrupts */
+    if ( feature_hwp_notification )
+        wrmsr_safe(MSR_IA32_HWP_INTERRUPT, 0);
+
+    hwp_verbose("CPU%u: MSR_IA32_PM_ENABLE: %016lx\n", policy->cpu, val);
+    if ( !(val & IA32_PM_ENABLE_HWP_ENABLE) )
+    {
+        val |= IA32_PM_ENABLE_HWP_ENABLE;
+        if ( wrmsr_safe(MSR_IA32_PM_ENABLE, val) )
+        {
+            hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_PM_ENABLE, %lx)\n",
+                    policy->cpu, val);
+            data->curr_req.raw = -1;
+            return;
+        }
+    }
+
+    if ( rdmsr_safe(MSR_IA32_HWP_CAPABILITIES, data->hwp_caps) )
+    {
+        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_CAPABILITIES)\n",
+                policy->cpu);
+        data->curr_req.raw = -1;
+        return;
+    }
+
+    if ( rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw) )
+    {
+        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_REQUEST)\n", policy->cpu);
+        data->curr_req.raw = -1;
+        return;
+    }
+
+    if ( !feature_hwp_energy_perf ) {
+        if ( rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, val) )
+        {
+            hwp_err("error rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS)\n");
+            data->curr_req.raw = -1;
+
+            return;
+        }
+
+        data->energy_perf = val & IA32_ENERGY_BIAS_MASK;
+    }
+
+    /*
+     * Check for APERF/MPERF support in hardware
+     * also check for boost/turbo support
+     */
+    intel_feature_detect(policy);
+
+    if ( feature_hdc )
+    {
+        hdc_set_pkg_hdc_ctl(true);
+        hdc_set_pm_ctl1(true);
+    }
+
+    hwp_get_cpu_speeds(policy);
+}
+
+static int cf_check hwp_cpufreq_verify(struct cpufreq_policy *policy)
+{
+    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
+
+    if ( !feature_hwp_energy_perf && data->energy_perf )
+    {
+        if ( data->energy_perf > IA32_ENERGY_BIAS_MAX_POWERSAVE )
+        {
+            hwp_err("energy_perf %d exceeds IA32_ENERGY_PERF_BIAS range 0-15\n",
+                    data->energy_perf);
+
+            return -EINVAL;
+        }
+    }
+
+    if ( !feature_hwp_activity_window && data->activity_window )
+    {
+        hwp_err("HWP activity window not supported\n");
+
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+/* val 0 - highest performance, 15 - maximum energy savings */
+static void hwp_energy_perf_bias(const struct hwp_drv_data *data)
+{
+    uint64_t msr;
+    uint8_t val = data->energy_perf;
+
+    ASSERT(val <= IA32_ENERGY_BIAS_MAX_POWERSAVE);
+
+    if ( rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, msr) )
+    {
+        hwp_err("error rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS)\n");
+
+        return;
+    }
+
+    msr &= ~IA32_ENERGY_BIAS_MASK;
+    msr |= val;
+
+    if ( wrmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, msr) )
+        hwp_err("error wrmsr_safe(MSR_IA32_ENERGY_PERF_BIAS): %016lx\n", msr);
+}
+
+static void cf_check hwp_write_request(void *info)
+{
+    struct cpufreq_policy *policy = info;
+    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
+    union hwp_request hwp_req = data->curr_req;
+
+    BUILD_BUG_ON(sizeof(union hwp_request) != sizeof(uint64_t));
+    if ( wrmsr_safe(MSR_IA32_HWP_REQUEST, hwp_req.raw) )
+    {
+        hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_HWP_REQUEST, %lx)\n",
+                policy->cpu, hwp_req.raw);
+        rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw);
+    }
+
+    if ( !feature_hwp_energy_perf )
+        hwp_energy_perf_bias(data);
+
+}
+
+static int cf_check hwp_cpufreq_target(struct cpufreq_policy *policy,
+                                       unsigned int target_freq,
+                                       unsigned int relation)
+{
+    unsigned int cpu = policy->cpu;
+    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+    /* Zero everything to ensure reserved bits are zero... */
+    union hwp_request hwp_req = { .raw = 0 };
+
+    /* .. and update from there */
+    hwp_req.min_perf = data->minimum;
+    hwp_req.max_perf = data->maximum;
+    hwp_req.desired = data->desired;
+    if ( feature_hwp_energy_perf )
+        hwp_req.energy_perf = data->energy_perf;
+    if ( feature_hwp_activity_window )
+        hwp_req.activity_window = data->activity_window;
+
+    if ( hwp_req.raw == data->curr_req.raw )
+        return 0;
+
+    data->curr_req = hwp_req;
+
+    hwp_verbose("CPU%u: wrmsr HWP_REQUEST %016lx\n", cpu, hwp_req.raw);
+    on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);
+
+    return 0;
+}
+
+static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+    unsigned int cpu = policy->cpu;
+    struct hwp_drv_data *data;
+
+    data = xzalloc(struct hwp_drv_data);
+    if ( !data )
+        return -ENOMEM;
+
+    if ( cpufreq_opt_governor )
+        printk(XENLOG_WARNING
+               "HWP: governor \"%s\" is incompatible with hwp. Using default \"%s\"\n",
+               cpufreq_opt_governor->name, hwp_cpufreq_governor.name);
+    policy->governor = &hwp_cpufreq_governor;
+
+    per_cpu(hwp_drv_data, cpu) = data;
+
+    on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
+
+    if ( data->curr_req.raw == -1 )
+    {
+        hwp_err("CPU%u: Could not initialize HWP properly\n", cpu);
+        XFREE(per_cpu(hwp_drv_data, cpu));
+        return -ENODEV;
+    }
+
+    data->minimum = data->curr_req.min_perf;
+    data->maximum = data->curr_req.max_perf;
+    data->desired = data->curr_req.desired;
+    /* the !feature_hwp_energy_perf case was handled in hwp_init_msrs(). */
+    if ( feature_hwp_energy_perf )
+        data->energy_perf = data->curr_req.energy_perf;
+
+    hwp_verbose("CPU%u: IA32_HWP_CAPABILITIES: %016lx\n", cpu, data->hwp_caps);
+
+    hwp_verbose("CPU%u: rdmsr HWP_REQUEST %016lx\n", cpu, data->curr_req.raw);
+
+    return 0;
+}
+
+static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+{
+    XFREE(per_cpu(hwp_drv_data, policy->cpu));
+
+    return 0;
+}
+
+/*
+ * The SDM reads like turbo should be disabled with MSR_IA32_PERF_CTL and
+ * PERF_CTL_TURBO_DISENGAGE, but that does not seem to actually work, at least
+ * with my HWP testing.  MSR_IA32_MISC_ENABLE and MISC_ENABLE_TURBO_DISENGAGE
+ * is what Linux uses and seems to work.
+ */
+static void cf_check hwp_set_misc_turbo(void *info)
+{
+    const struct cpufreq_policy *policy = info;
+    uint64_t msr;
+
+    if ( rdmsr_safe(MSR_IA32_MISC_ENABLE, msr) )
+    {
+        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_MISC_ENABLE)\n", policy->cpu);
+
+        return;
+    }
+
+    if ( policy->turbo == CPUFREQ_TURBO_ENABLED )
+        msr &= ~MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE;
+    else
+        msr |= MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE;
+
+    if ( wrmsr_safe(MSR_IA32_MISC_ENABLE, msr) )
+        hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_MISC_ENABLE): %016lx\n",
+                policy->cpu, msr);
+}
+
+static int cf_check hwp_cpufreq_update(int cpuid, struct cpufreq_policy *policy)
+{
+    on_selected_cpus(cpumask_of(cpuid), hwp_set_misc_turbo, policy, 1);
+
+    return 0;
+}
+
+static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
+{
+    .name   = "hwp-cpufreq",
+    .verify = hwp_cpufreq_verify,
+    .target = hwp_cpufreq_target,
+    .init   = hwp_cpufreq_cpu_init,
+    .exit   = hwp_cpufreq_cpu_exit,
+    .update = hwp_cpufreq_update,
+};
+
+int __init hwp_register_driver(void)
+{
+    return cpufreq_register_driver(&hwp_cpufreq_driver);
+}
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index f2c6f255ac..1aebf3f750 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -22,8 +22,17 @@
 #define cpu_has(c, bit)		test_bit(bit, (c)->x86_capability)
 #define boot_cpu_has(bit)	test_bit(bit, boot_cpu_data.x86_capability)
 
-#define CPUID_PM_LEAF                    6
-#define CPUID6_ECX_APERFMPERF_CAPABILITY 0x1
+#define CPUID_PM_LEAF                                6
+#define CPUID6_EAX_HWP                               (_AC(1, U) <<  7)
+#define CPUID6_EAX_HWP_NOTIFICATION                  (_AC(1, U) <<  8)
+#define CPUID6_EAX_HWP_ACTIVITY_WINDOW               (_AC(1, U) <<  9)
+#define CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE (_AC(1, U) << 10)
+#define CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST         (_AC(1, U) << 11)
+#define CPUID6_EAX_HDC                               (_AC(1, U) << 13)
+#define CPUID6_EAX_HWP_PECI                          (_AC(1, U) << 16)
+#define CPUID6_EAX_HW_FEEDBACK                       (_AC(1, U) << 19)
+#define CPUID6_ECX_APERFMPERF_CAPABILITY             0x1
+#define CPUID6_ECX_IA32_ENERGY_PERF_BIAS             0x8
 
 /* CPUID level 0x00000001.edx */
 #define cpu_has_fpu             1
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 1a928ea6af..3961bac614 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -147,6 +147,13 @@
 #define MSR_PL3_SSP                         0x000006a7
 #define MSR_INTERRUPT_SSP_TABLE             0x000006a8
 
+#define MSR_IA32_PM_ENABLE                  0x00000770
+#define  IA32_PM_ENABLE_HWP_ENABLE          (_AC(1, ULL) <<  0)
+
+#define MSR_IA32_HWP_CAPABILITIES           0x00000771
+#define MSR_IA32_HWP_INTERRUPT              0x00000773
+#define MSR_IA32_HWP_REQUEST                0x00000774
+
 #define MSR_X2APIC_FIRST                    0x00000800
 #define MSR_X2APIC_LAST                     0x000008ff
 
@@ -161,6 +168,11 @@
 #define  PASID_PASID_MASK                   0x000fffff
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
+#define MSR_IA32_PKG_HDC_CTL                0x00000db0
+#define  IA32_PKG_HDC_CTL_HDC_PKG_ENABLE    (_AC(1, ULL) <<  0)
+#define MSR_IA32_PM_CTL1                    0x00000db1
+#define  IA32_PM_CTL1_HDC_ALLOW_BLOCK       (_AC(1, ULL) <<  0)
+
 #define MSR_UARCH_MISC_CTRL                 0x00001b01
 #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
 
@@ -496,6 +508,7 @@
 #define MSR_IA32_MISC_ENABLE_LIMIT_CPUID  (1<<22)
 #define MSR_IA32_MISC_ENABLE_XTPR_DISABLE (1<<23)
 #define MSR_IA32_MISC_ENABLE_XD_DISABLE	(1ULL << 34)
+#define MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE (1ULL << 38)
 
 #define MSR_IA32_TSC_DEADLINE		0x000006E0
 #define MSR_IA32_ENERGY_PERF_BIAS	0x000001b0
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 1fdd63d7b5..634f0a8a49 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -563,6 +563,38 @@ static void cpufreq_cmdline_common_para(struct cpufreq_policy *new_policy)
 
 static int __init cpufreq_handle_common_option(const char *name, const char *val)
 {
+    if (!strcmp(name, "hdc")) {
+        if (val) {
+            int ret = parse_bool(val, NULL);
+            if (ret != -1) {
+                opt_cpufreq_hdc = ret;
+                return 1;
+            }
+        } else {
+            opt_cpufreq_hdc = true;
+            return 1;
+        }
+    } else if (!strcmp(name, "no-hdc")) {
+        opt_cpufreq_hdc = false;
+        return 1;
+    }
+
+    if (!strcmp(name, "hwp")) {
+        if (val) {
+            int ret = parse_bool(val, NULL);
+            if (ret != -1) {
+                opt_cpufreq_hwp = ret;
+                return 1;
+            }
+        } else {
+            opt_cpufreq_hwp = true;
+            return 1;
+        }
+    } else if (!strcmp(name, "no-hwp")) {
+        opt_cpufreq_hwp = false;
+        return 1;
+    }
+
     if (!strcmp(name, "maxfreq") && val) {
         usr_max_freq = simple_strtoul(val, NULL, 0);
         return 1;
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 0f334d2a43..29a712a4f1 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -245,4 +245,7 @@ void cpufreq_dbs_timer_resume(void);
 
 void intel_feature_detect(struct cpufreq_policy *policy);
 
+extern bool opt_cpufreq_hwp;
+extern bool opt_cpufreq_hdc;
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index d8a1ba68a6..b751ca4937 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -7,6 +7,9 @@
 
 #define XEN_PX_INIT 0x80000000
 
+bool hwp_available(void);
+int hwp_register_driver(void);
+
 int powernow_cpufreq_init(void);
 unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 5672906729..3d6dd14377 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -316,6 +316,7 @@ struct xen_ondemand {
     uint32_t up_threshold;
 };
 
+#define XEN_HWP_GOVERNOR "hwp-internal"
 /*
  * cpufreq para name of this structure named
  * same as sysfs file name of native linux
-- 
2.37.1


