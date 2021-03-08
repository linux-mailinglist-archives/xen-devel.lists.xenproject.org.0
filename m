Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F56F3318FB
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 22:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95085.179404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1Y-0006cz-D6; Mon, 08 Mar 2021 21:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95085.179404; Mon, 08 Mar 2021 21:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1Y-0006cI-7Y; Mon, 08 Mar 2021 21:02:44 +0000
Received: by outflank-mailman (input) for mailman id 95085;
 Mon, 08 Mar 2021 21:02:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odrr=IG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJN1W-0006P0-Id
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 21:02:42 +0000
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b82b9a90-1da7-425f-8d11-867da036625d;
 Mon, 08 Mar 2021 21:02:32 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id l14so5876405qtr.10
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 13:02:32 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a33e:daa7:46a1:a7eb])
 by smtp.gmail.com with ESMTPSA id
 r2sm8514070qti.4.2021.03.08.13.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:02:30 -0800 (PST)
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
X-Inumbo-ID: b82b9a90-1da7-425f-8d11-867da036625d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BjEhlVDqlccH5BFquh074KTWWcfbnvlNbbrUkEKCX2E=;
        b=C9zpkcGIjkKcQkJuirZxV8lknSTdXb9TB48gTR1ZFUf2zqkcrudQs1nWFO6zc8qtaJ
         AT+QHtMTcdxvYz8jvDSK7U274632PbP0nJdl8NApeStie5mL99Pw3A2V34GQ6ykhwqzP
         urlja47wAkAQHooJF4f31Wpg9nQm0wyQFwU+WB2TBLa9HTE5xS0OxHWiP4Jnsboc00bY
         zYbKAiEP+iwHa2ZGEE5D1gEc8QpqAGt7oqJ3pVZQ3Zl2fpk1fOP2qSt3nbVadtTMPCpL
         VXgGIuhQFKZvo40lUELmtD8krrrb4C86ceJsPLpIVQSs7pP80B76rRGbzt1q980gBsnD
         HiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BjEhlVDqlccH5BFquh074KTWWcfbnvlNbbrUkEKCX2E=;
        b=aKItCwWGxfJcUaGbNYrs3sgBEmTbl2ZMIBP7lJvspGacp1qMlBWiHEp8jts/Zw7GnR
         vapt7MelYXmVHxZ3GJWnjnZlKJWlQm64ublOn6XO3irrQQ5EZdTf1iOWpkVNsa7FHNXn
         Re9PyK11sLK68ukvOPEaw9IhIC368tkHsNt2yLo2ocovFGMSx1QPvMEF0CBaqSlXB9/h
         MJ48mCyfPN7CEqOobG5RGeQGJobsdFzYhiOZjHyNBQbOn6wbwSAdNgX97pOrSZZH6b2a
         2VJkMBizogOg9ub2bCuobo73PgZajlqPxGmGHpn3r+/tvwnu2rfjRmZ7AcQCFvRRj1Zv
         JiQQ==
X-Gm-Message-State: AOAM532f55AeQ2NHrvGDUSwCK8Wxo2tK5vbFgpMQq6xgNyo8/ummZuk0
	KV0r6/S02mRAjrftvQJE3pBSLZOnfPo=
X-Google-Smtp-Source: ABdhPJyeTwlanill4YhFzg/NcX9IGS/uaY7Er9nhFijWUKY+H7YHyhE+Pq4TNVu/YBEjonbsvqx64w==
X-Received: by 2002:a05:622a:4d3:: with SMTP id q19mr22286878qtx.316.1615237350881;
        Mon, 08 Mar 2021 13:02:30 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pawel@invisiblethingslab.com,
	marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 04/12] cpufreq: Add Hardware P-State (HWP) driver
Date: Mon,  8 Mar 2021 16:02:02 -0500
Message-Id: <20210308210210.116278-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308210210.116278-1-jandryuk@gmail.com>
References: <20210308210210.116278-1-jandryuk@gmail.com>
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
 xen/include/asm-x86/msr-index.h           |  21 +
 7 files changed, 583 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4737c92bfe..799391a5ab 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1310,6 +1310,15 @@ Specify whether guests are to be given access to physical port 80
 (often used for debugging purposes), to override the DMI based
 detection of systems known to misbehave upon accesses to that port.
 
+### hwp (x86)
+> `= <boolean>`
+
+> Default: `false`
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
index 1f5a5d0e38..6f1f62c0a1 100644
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
@@ -112,10 +118,24 @@
 #define MSR_PL3_SSP                         0x000006a7
 #define MSR_INTERRUPT_SSP_TABLE             0x000006a8
 
+#define MSR_IA32_PM_ENABLE                  0x00000770
+#define  IA32_PM_ENABLE_HWP_ENABLE          (_AC(1, ULL) <<  0)
+#define MSR_IA32_HWP_CAPABILITIES           0x00000771
+#define MSR_IA32_HWP_REQUEST_PKG            0x00000772
+#define MSR_IA32_HWP_INTERRUPT              0x00000773
+#define MSR_IA32_HWP_REQUEST                0x00000774
+#define MSR_IA32_HWP_PECI_REQUEST_INFO      0x00000775
+#define MSR_IA32_HWP_STATUS                 0x00000777
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
@@ -458,6 +478,7 @@
 #define MSR_IA32_MISC_ENABLE_LIMIT_CPUID  (1<<22)
 #define MSR_IA32_MISC_ENABLE_XTPR_DISABLE (1<<23)
 #define MSR_IA32_MISC_ENABLE_XD_DISABLE	(1ULL << 34)
+#define MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE (1ULL << 38)
 
 #define MSR_IA32_TSC_DEADLINE		0x000006E0
 #define MSR_IA32_ENERGY_PERF_BIAS	0x000001b0
-- 
2.29.2


