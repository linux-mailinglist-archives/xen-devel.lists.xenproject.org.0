Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146AE372071
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121809.229770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeFI-0005z9-Eo; Mon, 03 May 2021 19:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121809.229770; Mon, 03 May 2021 19:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeFI-0005yH-7z; Mon, 03 May 2021 19:28:44 +0000
Received: by outflank-mailman (input) for mailman id 121809;
 Mon, 03 May 2021 19:28:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeFG-0005i5-It
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:28:42 +0000
Received: from mail-qk1-x734.google.com (unknown [2607:f8b0:4864:20::734])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd0d2f7c-7ff6-4225-af94-1de9a427986a;
 Mon, 03 May 2021 19:28:37 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id o27so6262492qkj.9
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:37 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:35 -0700 (PDT)
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
X-Inumbo-ID: dd0d2f7c-7ff6-4225-af94-1de9a427986a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K9DM60LHgbrjnKk6ipk/EiTHiRh7kQUIe70xmtDrRvs=;
        b=P5Aw84DYh1kRXQ5q+yHsFjYfqLSNrAfPHZ9jm+TcO8POWbtHCSO4ouh7MVnMLN8FDS
         iRLfMTTPKeE4HObIsBrvkZ65umxSsZODudoQwF8kmoytYNhenb8BAmKRUeLLYE2fChqH
         ASQwYCgdusZ/HHnzLNK2GPyNanIGTYnZJKO/Ikpj/v+FXCtIdLYIP3YGlu4Qly0kg7qI
         K3zcgpq1+09x7uPMMDDbIx/pwiuFJ0Jvw+/F7IBUIroEaL0/pqRaWMU8QXwTheGPh3D6
         GIZc8mOL6rui+P+znBoRMZ6fK2uzj9O8e4iv3+TANhJKPs/5Rr0X7Cv6bqV42ThKrUWS
         rhTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K9DM60LHgbrjnKk6ipk/EiTHiRh7kQUIe70xmtDrRvs=;
        b=BM2uLiMhnboBTfffEvX8Oxl7ykCxWrtnjFdeEMBV77ngipRdYZZiAp/G69IRj1Vz7k
         sVQaX8El+Ny0Jmb4qfsdNwOgx15wXJd79HbAiekzMGvMtTvBJd7CVCgiNMheZsA/d2+9
         DYFgxl7TiOpaxl+gelZoYUorxEbs/Us3X7GED5at2hHhtu/8bwnqylXEYnCevEgNFDli
         YoBlrzLGqi9TZ+IQIgL5OfR7E34EtkRd22RPkSmabedXIvqHgphj/Ex6gzfIEHtaJMb4
         IxER7cB2gand73AcSGfP9GG184vGL7gWn/94YLCrgACKHdXWOwu3bTJ+TEaLMerHhVnV
         VOKw==
X-Gm-Message-State: AOAM531GWP7ALh4V5NhabJCLMojN0/7oP58t1pBM/qG6RL0TyBfS1hHy
	f4CgZhEGfoD3K4LS0waEshv4MNMnhH4=
X-Google-Smtp-Source: ABdhPJx4FLGBNxhoZUHMAUeQ/UHTXIvtNfrRi/JKbCGannSxELP/eThBg90JzOo4DSv2CWkTZ9YerA==
X-Received: by 2002:a37:6004:: with SMTP id u4mr21062213qkb.369.1620070116261;
        Mon, 03 May 2021 12:28:36 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 04/13] cpufreq: Add Hardware P-State (HWP) driver
Date: Mon,  3 May 2021 15:28:01 -0400
Message-Id: <20210503192810.36084-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From the Intel SDM: "Hardware-Controlled Performance States (HWP), which
autonomously selects performance states while utilizing OS supplied
performance guidance hints."

Enable HWP to run in autonomous mode by poking the correct MSRs.

There is no interface to configure - it hardcodes the default 0x80 (out
of 0x0-0xff) energy/performance preference.  xen_sysctl_pm_op/xenpm will
be to be extended to configure in subsequent patches.

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

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

---

We disable on cpuid_level < 0x16.  cpuid(0x16) is used to get the cpu
frequencies for calculating the APERF/MPERF.  Without it, things would
still work, but the averge cpufrequency output would be wrong.

If HWP Energy_Performance_Preference isn't supported, the code falls
back to IA32_ENERGY_PERF_BIAS.  Right now, we don't check
CPUID.06H:ECX.SETBH[bit 3] before using that MSR.  The SDM reads like
it'll be available, and I assume it was available by the time Skylake
introduced HWP.

My 8th & 10th gen test systems both report:
(XEN) HWP: 1 notify: 1 act_window: 1 energy_perf: 1 pkg_level: 0 peci: 0
(XEN) HWP: FAST_IA32_HWP_REQUEST not supported
(XEN) HWP: Hardware Duty Cycling (HDC) supported
(XEN) HWP: HW_FEEDBACK not supported

So FAST_IA32_HWP_REQUEST and IA32_ENERGY_PERF_BIAS have not been tested.
---
 docs/misc/xen-command-line.pandoc         |   9 +
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |   9 +-
 xen/arch/x86/acpi/cpufreq/hwp.c           | 533 ++++++++++++++++++++++
 xen/include/acpi/cpufreq/processor_perf.h |   3 +
 xen/include/asm-x86/cpufeature.h          |  11 +-
 xen/include/asm-x86/msr-index.h           |  17 +
 7 files changed, 579 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index c32a397a12..66363a3d71 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1355,6 +1355,15 @@ Specify whether guests are to be given access to physical port 80
 (often used for debugging purposes), to override the DMI based
 detection of systems known to misbehave upon accesses to that port.
 
+### hwp (x86)
+> `= <boolean>`
+
+> Default: `true`
+
+Specifies whether Xen uses Hardware-Controlled Performance States (HWP)
+on supported Intel hardware.  HWP is a Skylake+ feature which provides
+better CPU power management.
+
 ### idle_latency_factor (x86)
 > `= <integer>`
 
diff --git a/xen/arch/x86/acpi/cpufreq/Makefile b/xen/arch/x86/acpi/cpufreq/Makefile
index f75da9b9ca..db83aa6b14 100644
--- a/xen/arch/x86/acpi/cpufreq/Makefile
+++ b/xen/arch/x86/acpi/cpufreq/Makefile
@@ -1,2 +1,3 @@
 obj-y += cpufreq.o
+obj-y += hwp.o
 obj-y += powernow.o
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 8aae9b534d..966490bda1 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -641,9 +641,12 @@ static int __init cpufreq_driver_init(void)
     int ret = 0;
 
     if ((cpufreq_controller == FREQCTL_xen) &&
-        (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL))
-        ret = cpufreq_register_driver(&acpi_cpufreq_driver);
-    else if ((cpufreq_controller == FREQCTL_xen) &&
+        (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL)) {
+        if (hwp_available())
+            ret = hwp_register_driver();
+        else
+            ret = cpufreq_register_driver(&acpi_cpufreq_driver);
+    } else if ((cpufreq_controller == FREQCTL_xen) &&
         (boot_cpu_data.x86_vendor &
          (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
         ret = powernow_register_driver();
diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
new file mode 100644
index 0000000000..f8e6fdbd41
--- /dev/null
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -0,0 +1,533 @@
+/*
+ * hwp.c cpufreq driver to run Intel Hardware P-States (HWP)
+ *
+ * Copyright (C) 2021 Jason Andryuk <jandryuk@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or (at
+ * your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/cpumask.h>
+#include <xen/init.h>
+#include <xen/param.h>
+#include <xen/xmalloc.h>
+#include <asm/msr.h>
+#include <asm/io.h>
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
+static bool feature_fast_msr;
+
+bool opt_hwp = true;
+boolean_param("hwp", opt_hwp);
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
+            uint64_t hw_highest:8;
+            uint64_t hw_guaranteed:8;
+            uint64_t hw_most_efficient:8;
+            uint64_t hw_lowest:8;
+            uint64_t hw_reserved:32;
+        };
+    };
+    union hwp_request curr_req;
+    uint16_t activity_window;
+    uint8_t minimum;
+    uint8_t maximum;
+    uint8_t desired;
+    uint8_t energy_perf;
+};
+struct hwp_drv_data *hwp_drv_data[NR_CPUS];
+
+#define hwp_err(...)     printk(XENLOG_ERR __VA_ARGS__)
+#define hwp_info(...)    printk(XENLOG_INFO __VA_ARGS__)
+#define hwp_verbose(...)                   \
+({                                         \
+    if ( cpufreq_verbose )                 \
+    {                                      \
+        printk(XENLOG_DEBUG __VA_ARGS__);  \
+    }                                      \
+})
+#define hwp_verbose_cont(...)              \
+({                                         \
+    if ( cpufreq_verbose )                 \
+    {                                      \
+        printk(             __VA_ARGS__);  \
+    }                                      \
+})
+
+static int hwp_governor(struct cpufreq_policy *policy,
+                        unsigned int event)
+{
+    int ret;
+
+    if ( policy == NULL )
+        return -EINVAL;
+
+    switch (event)
+    {
+    case CPUFREQ_GOV_START:
+        ret = 0;
+        break;
+    case CPUFREQ_GOV_STOP:
+        ret = -EINVAL;
+        break;
+    case CPUFREQ_GOV_LIMITS:
+        ret = 0;
+        break;
+    default:
+        ret = -EINVAL;
+    }
+
+    return ret;
+}
+
+static struct cpufreq_governor hwp_cpufreq_governor =
+{
+    .name          = "hwp-internal",
+    .governor      = hwp_governor,
+};
+
+static int __init cpufreq_gov_hwp_init(void)
+{
+    return cpufreq_register_governor(&hwp_cpufreq_governor);
+}
+__initcall(cpufreq_gov_hwp_init);
+
+bool hwp_available(void)
+{
+    uint32_t eax;
+    uint64_t val;
+    bool use_hwp;
+
+    if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
+    {
+        hwp_verbose("cpuid_level (%u) lacks HWP support\n", boot_cpu_data.cpuid_level);
+
+        return false;
+    }
+
+    eax = cpuid_eax(CPUID_PM_LEAF);
+    feature_hwp                 = !!(eax & CPUID6_EAX_HWP);
+    feature_hwp_notification    = !!(eax & CPUID6_EAX_HWP_Notification);
+    feature_hwp_activity_window = !!(eax & CPUID6_EAX_HWP_Activity_Window);
+    feature_hwp_energy_perf     =
+        !!(eax & CPUID6_EAX_HWP_Energy_Performance_Preference);
+    feature_hwp_pkg_level_ctl   =
+        !!(eax & CPUID6_EAX_HWP_Package_Level_Request);
+    feature_hwp_peci            = !!(eax & CPUID6_EAX_HWP_PECI);
+
+    hwp_verbose("HWP: %d notify: %d act_window: %d energy_perf: %d pkg_level: %d peci: %d\n",
+                feature_hwp, feature_hwp_notification,
+                feature_hwp_activity_window, feature_hwp_energy_perf,
+                feature_hwp_pkg_level_ctl, feature_hwp_peci);
+
+    if ( !feature_hwp )
+    {
+        hwp_verbose("Hardware does not support HWP\n");
+
+        return false;
+    }
+
+    if ( boot_cpu_data.cpuid_level < 0x16 )
+    {
+        hwp_info("HWP disabled: cpuid_level %x < 0x16 lacks CPU freq info\n",
+                 boot_cpu_data.cpuid_level);
+
+        return false;
+    }
+
+    hwp_verbose("HWP: FAST_IA32_HWP_REQUEST %ssupported\n",
+                eax & CPUID6_EAX_FAST_HWP_MSR ? "" : "not ");
+    if ( eax & CPUID6_EAX_FAST_HWP_MSR )
+    {
+        if ( rdmsr_safe(MSR_FAST_UNCORE_MSRS_CAPABILITY, val) )
+            hwp_err("error rdmsr_safe(MSR_FAST_UNCORE_MSRS_CAPABILITY)\n");
+
+        hwp_verbose("HWP: MSR_FAST_UNCORE_MSRS_CAPABILITY: %016lx\n", val);
+        if (val & FAST_IA32_HWP_REQUEST )
+        {
+            hwp_verbose("HWP: FAST_IA32_HWP_REQUEST MSR available\n");
+            feature_fast_msr = true;
+        }
+    }
+
+    feature_hdc = !!(eax & CPUID6_EAX_HDC);
+
+    hwp_verbose("HWP: Hardware Duty Cycling (HDC) %ssupported\n",
+                feature_hdc ? "" : "not ");
+
+    hwp_verbose("HWP: HW_FEEDBACK %ssupported\n",
+                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
+
+    use_hwp = feature_hwp && opt_hwp;
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
+    msr = val ? IA32_PKG_HDC_CTL_HDC_PKG_Enable : 0;
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
+    msr = val ? IA32_PM_CTL1_HDC_Allow_Block : 0;
+
+    if ( wrmsr_safe(MSR_IA32_PM_CTL1, msr) )
+        hwp_err("error wrmsr_safe(MSR_IA32_PM_CTL1): %016lx\n", msr);
+}
+
+static void hwp_fast_uncore_msrs_ctl(bool val)
+{
+    uint64_t msr;
+
+    if ( rdmsr_safe(MSR_FAST_UNCORE_MSRS_CTL, msr) )
+        hwp_err("error rdmsr_safe(MSR_FAST_UNCORE_MSRS_CTL)\n");
+
+    msr = val;
+
+    if ( wrmsr_safe(MSR_FAST_UNCORE_MSRS_CTL, msr) )
+        hwp_err("error wrmsr_safe(MSR_FAST_UNCORE_MSRS_CTL): %016lx\n", msr);
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
+static void hwp_read_capabilities(void *info)
+{
+    struct cpufreq_policy *policy = info;
+    struct hwp_drv_data *data = hwp_drv_data[policy->cpu];
+
+    if ( rdmsr_safe(MSR_IA32_HWP_CAPABILITIES, data->hwp_caps) )
+    {
+        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_CAPABILITIES)\n",
+                policy->cpu);
+
+        return;
+    }
+
+    if ( rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw) )
+    {
+        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_REQUEST)\n", policy->cpu);
+
+        return;
+    }
+}
+
+static void hwp_init_msrs(void *info)
+{
+    struct cpufreq_policy *policy = info;
+    uint64_t val;
+
+    /* Package level MSR, but we don't have a good idea of packages here, so
+     * just do it everytime. */
+    if ( rdmsr_safe(MSR_IA32_PM_ENABLE, val) )
+    {
+        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_PM_ENABLE)\n", policy->cpu);
+
+        return;
+    }
+
+    hwp_verbose("CPU%u: MSR_IA32_PM_ENABLE: %016lx\n", policy->cpu, val);
+    if ( val != IA32_PM_ENABLE_HWP_ENABLE )
+    {
+        val = IA32_PM_ENABLE_HWP_ENABLE;
+        if ( wrmsr_safe(MSR_IA32_PM_ENABLE, val) )
+            hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_PM_ENABLE, %lx)\n",
+                    policy->cpu, val);
+    }
+
+    hwp_read_capabilities(info);
+
+    /* Check for APERF/MPERF support in hardware
+     * also check for boost/turbo support */
+    intel_feature_detect(policy);
+
+    if ( feature_hdc )
+    {
+        hdc_set_pkg_hdc_ctl(true);
+        hdc_set_pm_ctl1(true);
+    }
+
+    if ( feature_fast_msr )
+        hwp_fast_uncore_msrs_ctl(true);
+
+    hwp_get_cpu_speeds(policy);
+}
+
+static int hwp_cpufreq_verify(struct cpufreq_policy *policy)
+{
+    unsigned int cpu = policy->cpu;
+    struct hwp_drv_data *data = hwp_drv_data[cpu];
+
+    if ( !feature_hwp_energy_perf && data->energy_perf )
+    {
+        if ( data->energy_perf > 15 )
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
+        hwp_err("HWP activity window not supported.\n");
+
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+/* val 0 - highest performance, 15 - maximum energy savings */
+static void hwp_energy_perf_bias(void *info)
+{
+    uint64_t msr;
+    struct hwp_drv_data *data = info;
+    uint8_t val = data->energy_perf;
+
+    ASSERT(val <= 15);
+
+    if ( rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, msr) )
+    {
+        hwp_err("error rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS)\n");
+
+        return;
+    }
+
+    msr &= ~(0xf);
+    msr |= val;
+
+    if ( wrmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, msr) )
+        hwp_err("error wrmsr_safe(MSR_IA32_ENERGY_PERF_BIAS): %016lx\n", msr);
+}
+
+static void hwp_write_request(void *info)
+{
+    struct cpufreq_policy *policy = info;
+    struct hwp_drv_data *data = hwp_drv_data[policy->cpu];
+    union hwp_request hwp_req = data->curr_req;
+
+    BUILD_BUG_ON(sizeof(union hwp_request) != sizeof(uint64_t));
+    if ( wrmsr_safe(MSR_IA32_HWP_REQUEST, hwp_req.raw) )
+    {
+        hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_HWP_REQUEST, %lx)\n",
+                policy->cpu, hwp_req.raw);
+        rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw);
+    }
+}
+
+static int hwp_cpufreq_target(struct cpufreq_policy *policy,
+                              unsigned int target_freq, unsigned int relation)
+{
+    unsigned int cpu = policy->cpu;
+    struct hwp_drv_data *data = hwp_drv_data[cpu];
+    union hwp_request hwp_req;
+
+    /* Zero everything to ensure reserved bits are zero... */
+    hwp_req.raw = 0;
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
+    data->curr_req.raw = hwp_req.raw;
+
+    hwp_verbose("CPU%u: wrmsr HWP_REQUEST %016lx\n", cpu, hwp_req.raw);
+    on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);
+
+    if ( !feature_hwp_energy_perf && data->energy_perf )
+    {
+        on_selected_cpus(cpumask_of(cpu), hwp_energy_perf_bias,
+                         data, 1);
+    }
+
+    return 0;
+}
+
+static int hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+    unsigned int cpu = policy->cpu;
+    struct hwp_drv_data *data;
+
+    if ( cpufreq_opt_governor )
+    {
+        printk(XENLOG_WARNING
+               "HWP: governor \"%s\" is incompatible with hwp. Using default \"%s\"\n",
+               cpufreq_opt_governor->name, hwp_cpufreq_governor.name);
+    }
+    policy->governor = &hwp_cpufreq_governor;
+
+    data = xzalloc(typeof(*data));
+    if ( !data )
+        return -ENOMEM;
+
+    hwp_drv_data[cpu] = data;
+
+    on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
+
+    data->minimum = data->hw_lowest;
+    data->maximum = data->hw_highest;
+    data->desired = 0; /* default to HW autonomous */
+    if ( feature_hwp_energy_perf )
+        data->energy_perf = 0x80;
+    else
+        data->energy_perf = 7;
+
+    hwp_verbose("CPU%u: IA32_HWP_CAPABILITIES: %016lx\n", cpu, data->hwp_caps);
+
+    hwp_verbose("CPU%u: rdmsr HWP_REQUEST %016lx\n", cpu, data->curr_req.raw);
+
+    return 0;
+}
+
+static int hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+{
+    unsigned int cpu = policy->cpu;
+
+    xfree(hwp_drv_data[cpu]);
+    hwp_drv_data[cpu] = NULL;
+
+    return 0;
+}
+
+/* The SDM reads like turbo should be disabled with MSR_IA32_PERF_CTL and
+ * PERF_CTL_TURBO_DISENGAGE, but that does not seem to actually work, at least
+ * with my HWP testing.  MSR_IA32_MISC_ENABLE and MISC_ENABLE_TURBO_DISENGAGE
+ * is what Linux uses and seems to work. */
+static void hwp_set_misc_turbo(void *info)
+{
+    struct cpufreq_policy *policy = info;
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
+static int hwp_cpufreq_update(int cpuid, struct cpufreq_policy *policy)
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
+int hwp_register_driver(void)
+{
+    int ret;
+
+    ret = cpufreq_register_driver(&hwp_cpufreq_driver);
+
+    return ret;
+}
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index e2c08f0e6d..2e67e667e0 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -9,6 +9,9 @@
 
 void intel_feature_detect(void *info);
 
+bool hwp_available(void);
+int hwp_register_driver(void);
+
 int powernow_cpufreq_init(void);
 unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index 33b2257888..1900c90f90 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -26,7 +26,16 @@
 #define CPUID5_ECX_EXTENSIONS_SUPPORTED 0x1
 #define CPUID5_ECX_INTERRUPT_BREAK      0x2
 
-#define CPUID_PM_LEAF                    6
+#define CPUID_PM_LEAF                                6
+#define CPUID6_EAX_HWP                               (_AC(1, U) <<  7)
+#define CPUID6_EAX_HWP_Notification                  (_AC(1, U) <<  8)
+#define CPUID6_EAX_HWP_Activity_Window               (_AC(1, U) <<  9)
+#define CPUID6_EAX_HWP_Energy_Performance_Preference (_AC(1, U) << 10)
+#define CPUID6_EAX_HWP_Package_Level_Request         (_AC(1, U) << 11)
+#define CPUID6_EAX_HDC                               (_AC(1, U) << 13)
+#define CPUID6_EAX_HWP_PECI                          (_AC(1, U) << 16)
+#define CPUID6_EAX_FAST_HWP_MSR                      (_AC(1, U) << 18)
+#define CPUID6_EAX_HW_FEEDBACK                       (_AC(1, U) << 19)
 #define CPUID6_ECX_APERFMPERF_CAPABILITY 0x1
 
 /* CPUID level 0x00000001.edx */
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index bd3a3a1e7f..b8f712e1a3 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -101,6 +101,12 @@
 #define MSR_RTIT_ADDR_A(n)                 (0x00000580 + (n) * 2)
 #define MSR_RTIT_ADDR_B(n)                 (0x00000581 + (n) * 2)
 
+#define MSR_FAST_UNCORE_MSRS_CTL            0x00000657
+#define  FAST_IA32_HWP_REQUEST_MSR_ENABLE   (_AC(1, ULL) <<  0)
+
+#define MSR_FAST_UNCORE_MSRS_CAPABILITY     0x0000065f
+#define  FAST_IA32_HWP_REQUEST              (_AC(1, ULL) <<  0)
+
 #define MSR_U_CET                           0x000006a0
 #define MSR_S_CET                           0x000006a2
 #define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
@@ -112,10 +118,20 @@
 #define MSR_PL3_SSP                         0x000006a7
 #define MSR_INTERRUPT_SSP_TABLE             0x000006a8
 
+#define MSR_IA32_PM_ENABLE                  0x00000770
+#define  IA32_PM_ENABLE_HWP_ENABLE          (_AC(1, ULL) <<  0)
+#define MSR_IA32_HWP_CAPABILITIES           0x00000771
+#define MSR_IA32_HWP_REQUEST                0x00000774
+
 #define MSR_PASID                           0x00000d93
 #define  PASID_PASID_MASK                   0x000fffff
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
+#define MSR_IA32_PKG_HDC_CTL                0x00000db0
+#define  IA32_PKG_HDC_CTL_HDC_PKG_Enable    (_AC(1, ULL) <<  0)
+#define MSR_IA32_PM_CTL1                    0x00000db1
+#define  IA32_PM_CTL1_HDC_Allow_Block       (_AC(1, ULL) <<  0)
+
 #define MSR_K8_VM_CR                        0xc0010114
 #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)
 #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
@@ -460,6 +476,7 @@
 #define MSR_IA32_MISC_ENABLE_LIMIT_CPUID  (1<<22)
 #define MSR_IA32_MISC_ENABLE_XTPR_DISABLE (1<<23)
 #define MSR_IA32_MISC_ENABLE_XD_DISABLE	(1ULL << 34)
+#define MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE (1ULL << 38)
 
 #define MSR_IA32_TSC_DEADLINE		0x000006E0
 #define MSR_IA32_ENERGY_PERF_BIAS	0x000001b0
-- 
2.30.2


