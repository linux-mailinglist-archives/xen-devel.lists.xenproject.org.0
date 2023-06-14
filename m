Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B62730690
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549121.857523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqY-0007JH-91; Wed, 14 Jun 2023 18:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549121.857523; Wed, 14 Jun 2023 18:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqY-0007Dc-1v; Wed, 14 Jun 2023 18:03:54 +0000
Received: by outflank-mailman (input) for mailman id 549121;
 Wed, 14 Jun 2023 18:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9UqV-0005L9-JC
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:03:51 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfadfdb6-0add-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 20:03:49 +0200 (CEST)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-62884fa0e53so21279046d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:03:49 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:46 -0700 (PDT)
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
X-Inumbo-ID: cfadfdb6-0add-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765827; x=1689357827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3erQ3Tf88rrl0YLlehZaA13XnubAYvrTZWS6hEHGpfQ=;
        b=gS/cVFi9jkYv4CKeViJ4P01bEvYXsNQkFIcgXdxfBEEKXkB7x/wSglSeWvuFhWYKLs
         79D76CW1UlhdZIzF/4JLgPcc2mkUVmrkEEyDOkMopO3jmCENO29cNACJXVUgvU4IJXEM
         XYGrc94c2LZ7UWrYRcc5ocuvnuuiKEg31EikdTTsX8lErYsB+YVUOyL7JsuRhLlWol0E
         nMgK8qmUueFenCmyxtrnJH2sc+8Q+O8GVGDHANa4JbaHw6wVFUeLGchkEKMFwTqesEpe
         VAoTXN4xxkCZmfSWLVGxfEDS5OATyA1PDKQxBZl+czW0UTOpKyH8D/jqUURoHmNpJS63
         QUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765827; x=1689357827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3erQ3Tf88rrl0YLlehZaA13XnubAYvrTZWS6hEHGpfQ=;
        b=DT1o1AKJes43ZKRiodVwXQukq4+TIW/qPRZ1l8tvWCEPW5E1yxw71lneLU/eK/kDZA
         oQsRU2thJfusYg5WjFCkoEVPQ7OMIdUwPdSLTcLViGWH1PxjzwGZ1WubJc6KvTXUxAgR
         av1HwGwyS7bt5ICW8Mels8BPAbli9sLOylGMN41/6MsxdKV9Eh4CXbFE9y91xMHRXnOk
         o00Qtd7UNg4dT8DpVdDOiObJWAKOlSzhROg1MSYSvCetJKweqdS4WfbkVTN1ZN9zVUyJ
         oGEewpoVE+RThRBqm8Bs83BWubJdr33q89OQNGVTS+sfKpc17Fzi6EPdIP0r7rQAIQAn
         DZJA==
X-Gm-Message-State: AC+VfDzkq6V0bAE5hpaoiv6rckFtYz7xrtbXS7qimyIzyuTzPDnxu7TT
	Zx6+wVAMRlnLUpbRSu8lskGfqOnB2L8=
X-Google-Smtp-Source: ACHHUZ5rzAXCLx2h0nHG0yNbhhoAs0CJJCNs3ysW4lCrckM6hXceAe4MbAI5w2Ejko589xq745CsNQ==
X-Received: by 2002:ad4:5dea:0:b0:62d:f806:7f80 with SMTP id jn10-20020ad45dea000000b0062df8067f80mr6052255qvb.13.1686765826871;
        Wed, 14 Jun 2023 11:03:46 -0700 (PDT)
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
Subject: [PATCH v4 06/15] cpufreq: Add Hardware P-State (HWP) driver
Date: Wed, 14 Jun 2023 14:02:44 -0400
Message-Id: <20230614180253.89958-7-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From the Intel SDM: "Hardware-Controlled Performance States (HWP), which
autonomously selects performance states while utilizing OS supplied
performance guidance hints."

Enable HWP to run in autonomous mode by poking the correct MSRs.
cpufreq=hwp enables and specifying cpufreq=xen would disable it.  hdc is
a sub-option under hwp (i.e.  cpufreq=xen:hwp,hdc=0) as is verbose.  If
cpufreq=hwp is specified, but hardware support is unavailable, Xen
fallbacks back to cpufreq=xen.

There is no interface to configure - xen_sysctl_pm_op/xenpm will
be extended to configure in subsequent patches.  It will run with the
default values, which should be the default 0x80 (out of 0x0-0xff)
energy/performance preference.

Unscientific powertop measurement of an mostly idle, customized OpenXT
install:
A 10th gen 6-core laptop showed battery discharge drop from ~9.x to
~7.x watts.
A 8th gen 4-core laptop dropped from ~10 to ~9

Power usage depends on many factors, especially display brightness, but
this does show a power saving in balanced mode when CPU utilization is
low.

HWP isn't compatible with an external governor - it doesn't take
explicit frequency requests.  Therefore a minimal internal governor,
hwp, is also added as a placeholder.

While adding to the xen-command-line.pandoc entry, un-nest verbose from
minfreq.  They are independent.

With cpufreq=hwp,verbose, HWP prints processor capabilities that are not
used by the code, like HW_FEEDBACK.  This is done because otherwise
there isn't a convenient way to query the information.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

---

We disable on cpuid_level < 0x16.  cpuid(0x16) is used to get the cpu
frequencies for calculating the APERF/MPERF.  Without it, things would
still work, but the average cpu frequency output would be wrong.

My 8th & 10th gen test systems both report:
(XEN) HWP: 1 notify: 1 act_window: 1 energy_perf: 1 pkg_level: 0 peci: 0
(XEN) HWP: Hardware Duty Cycling (HDC) supported
(XEN) HWP: HW_FEEDBACK not supported

Specifying HWP as a fake governor - cpufreq=xen:hwp - would require
resetting the governor if HWP hardware wasn't available.  Making
cpufreq=hwp a top level option avoids that issue.

Falling back from cpufreq=hwp to cpufreq=xen is a more user-friendly
choice than disabling cpufreq when HWP is not available.  Specifying
cpufreq=hwp indicates the user wants cpufreq, so, if HWP isn't
available, it makes sense to give them the cpufreq that can be
supported.  i.e. I can't see a user only wanting cpufreq=hwp or
cpufreq=none, but not cpufreq=xen.

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

v3:
Add cf_check to cpufreq_gov_hwp_init() - Marek
Print cpuid_level with %#x - Marek

v4:
Use BIT() for CPUID and MSR bits
Move __initdata after type
Add __ro_after_init to feature_*
Remove aperf/mperf comment
Move feature_hwp_energy_perf { to newline
Remove _IA32_ infix
Use unsigned int & bool for bitfields
Require energy perf pref (Remove ENERGY_PERF_BIAS support)
Initialize activity_window
Return errors on wrmsr failure
Change command line to: cpufreq=xen:hwp
Move hdc into the hwp-specific handle_options
Drop feature_hwp_energy_perf, feature_hwp_pkg_level_ctl & feature_hwp_peci
Print features before exiting when energy/performance preference isn't available
Disable HWP MSR on initialization error
Change hwp_ print macros to add prefixes
Disable HDC when hdc=0 - (opt_hdc no longer initdata)
Mark hwp governor internal and use "hwp" name
Add XEN_HWP_DRIVER
Use top-level cpufreq=hwp command line option
Document that cpufreq=hwp falls back to cpufreq=xen without hardware
Add SPDX suffix GPL-2.0-only
---
 docs/misc/xen-command-line.pandoc         |   9 +-
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |   5 +-
 xen/arch/x86/acpi/cpufreq/hwp.c           | 537 ++++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeature.h     |  12 +-
 xen/arch/x86/include/asm/msr-index.h      |  13 +
 xen/drivers/cpufreq/cpufreq.c             |   9 +
 xen/include/acpi/cpufreq/cpufreq.h        |   3 +
 xen/include/acpi/cpufreq/processor_perf.h |   3 +
 xen/include/public/sysctl.h               |   1 +
 10 files changed, 589 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4060ebdc5d..9d6bdd6d66 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -499,7 +499,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
 available support.
 
 ### cpufreq
-> `= none | {{ <boolean> | xen } [:[powersave|performance|ondemand|userspace][,<maxfreq>][,[<minfreq>][,[verbose]]]]} | dom0-kernel`
+> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]]`
 
 > Default: `xen`
 
@@ -510,6 +510,13 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `<maxfreq>` and `<minfreq>` are integers which represent max and min processor frequencies
   respectively.
 * `verbose` option can be included as a string or also as `verbose=<integer>`
+* `hwp` selects Hardware-Controlled Performance States (HWP) on supported Intel
+  hardware.  HWP is a Skylake+ feature which provides better CPU power
+  management.  The default is disabled.  If `hwp` is selected, but hardware
+  support is not available, Xen will fallback to cpufreq=xen.
+* `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC enables the
+  processor to autonomously force physical package components into idle state.
+  The default is enabled, but the option only applies when `hwp` is enabled.
 
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
index f1cc473b4f..56816b1aee 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -642,7 +642,10 @@ static int __init cf_check cpufreq_driver_init(void)
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
index 0000000000..c62345dde7
--- /dev/null
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -0,0 +1,537 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
+static bool __ro_after_init feature_hwp;
+static bool __ro_after_init feature_hwp_notification;
+static bool __ro_after_init feature_hwp_activity_window;
+
+static bool __ro_after_init feature_hdc;
+
+bool __initdata opt_cpufreq_hwp;
+static bool __ro_after_init opt_cpufreq_hdc = true;
+
+union hwp_request
+{
+    struct
+    {
+        unsigned int min_perf:8;
+        unsigned int max_perf:8;
+        unsigned int desired:8;
+        unsigned int energy_perf:8;
+        unsigned int activity_window:10;
+        bool package_control:1;
+        unsigned int reserved:16;
+        bool activity_window_valid:1;
+        bool energy_perf_valid:1;
+        bool desired_valid:1;
+        bool max_perf_valid:1;
+        bool min_perf_valid:1;
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
+            unsigned int highest:8;
+            unsigned int guaranteed:8;
+            unsigned int most_efficient:8;
+            unsigned int lowest:8;
+            unsigned int reserved:32;
+        } hw;
+    };
+    union hwp_request curr_req;
+    int ret;
+    uint16_t activity_window;
+    uint8_t minimum;
+    uint8_t maximum;
+    uint8_t desired;
+    uint8_t energy_perf;
+};
+DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);
+
+#define hwp_err(fmt, cpu, ...) \
+    printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, ##__VA_ARGS__)
+#define hwp_info(fmt, ...)    printk(XENLOG_INFO "HWP: " fmt, ##__VA_ARGS__)
+#define hwp_verbose(fmt, ...)                             \
+({                                                        \
+    if ( cpufreq_verbose )                                \
+        printk(XENLOG_DEBUG "HWP: " fmt, ##__VA_ARGS__);  \
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
+static bool hwp_handle_option(const char *s, const char *end)
+{
+    int ret;
+
+    if ( strncmp(s, "verbose", 7) == 0 )
+    {
+        s += 7;
+        if ( *s == '=' )
+        {
+            s++;
+            cpufreq_verbose = !!simple_strtoul(s, NULL, 0);
+
+            return true;
+        }
+
+        if ( end == NULL ||
+             (end == s && (*end == '\0' || *end == ',')) )
+        {
+            cpufreq_verbose = true;
+
+            return true;
+        }
+
+        return false;
+    }
+
+    ret = parse_boolean("hdc", s, end);
+    if ( ret < 0 )
+        return false;
+
+    opt_cpufreq_hdc = ret;
+
+    return true;
+}
+
+int __init hwp_cmdline_parse(const char *s)
+{
+    do
+    {
+        const char *end = strchr(s, ',');
+
+        if ( s && !hwp_handle_option(s, end) )
+        {
+            printk(XENLOG_WARNING "cpufreq/hwp: option '%s' not recognized\n",
+                   s);
+
+
+            return -1;
+        }
+
+        s = end ? ++end : end;
+    } while ( s );
+
+    return 0;
+}
+
+static struct cpufreq_governor cpufreq_gov_hwp =
+{
+    .name          = "hwp",
+    .governor      = hwp_governor,
+    .internal      = true,
+};
+
+static int __init cf_check cpufreq_gov_hwp_init(void)
+{
+    return cpufreq_register_governor(&cpufreq_gov_hwp);
+}
+__initcall(cpufreq_gov_hwp_init);
+
+bool __init hwp_available(void)
+{
+    unsigned int eax;
+
+    if ( !opt_cpufreq_hwp )
+        return false;
+
+    if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
+    {
+        hwp_verbose("cpuid_level (%#x) lacks HWP support\n",
+                    boot_cpu_data.cpuid_level);
+
+        return false;
+    }
+
+    if ( boot_cpu_data.cpuid_level < 0x16 )
+    {
+        hwp_info("HWP disabled: cpuid_level %#x < 0x16 lacks CPU freq info\n",
+                 boot_cpu_data.cpuid_level);
+
+        return false;
+    }
+
+    eax = cpuid_eax(CPUID_PM_LEAF);
+
+    hwp_verbose("%d notify: %d act-window: %d energy-perf: %d pkg-level: %d peci: %d\n",
+                !!(eax & CPUID6_EAX_HWP),
+                !!(eax & CPUID6_EAX_HWP_NOTIFICATION),
+                !!(eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW),
+                !!(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE),
+                !!(eax & CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST),
+                !!(eax & CPUID6_EAX_HWP_PECI));
+
+    if ( !(eax & CPUID6_EAX_HWP) )
+        return false;
+
+    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) )
+    {
+        hwp_verbose("disabled: No energy/performance preference available");
+
+        return false;
+    }
+
+    feature_hwp                 = eax & CPUID6_EAX_HWP;
+    feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
+    feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
+    feature_hdc = eax & CPUID6_EAX_HDC;
+
+    hwp_verbose("Hardware Duty Cycling (HDC) %ssupported%s\n",
+                feature_hdc ? "" : "not ",
+                feature_hdc ? opt_cpufreq_hdc ? ", enabled" : ", disabled"
+                            : "");
+
+    hwp_verbose("HW_FEEDBACK %ssupported\n",
+                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
+
+    cpufreq_governor_internal = feature_hwp;
+
+    if ( feature_hwp )
+        hwp_info("Using HWP for cpufreq\n");
+
+    return feature_hwp;
+}
+
+static int hdc_set_pkg_hdc_ctl(unsigned int cpu, bool val)
+{
+    uint64_t msr;
+
+    if ( rdmsr_safe(MSR_PKG_HDC_CTL, msr) )
+    {
+        hwp_err("rdmsr_safe(MSR_PKG_HDC_CTL)\n", cpu);
+
+        return -1;
+    }
+
+    if ( val )
+        msr |= PKG_HDC_CTL_HDC_PKG_ENABLE;
+    else
+        msr &= ~PKG_HDC_CTL_HDC_PKG_ENABLE;
+
+    if ( wrmsr_safe(MSR_PKG_HDC_CTL, msr) )
+    {
+        hwp_err("wrmsr_safe(MSR_PKG_HDC_CTL): %016lx\n", cpu, msr);
+
+        return -1;
+    }
+
+    return 0;
+}
+
+static int hdc_set_pm_ctl1(unsigned int cpu, bool val)
+{
+    uint64_t msr;
+
+    if ( rdmsr_safe(MSR_PM_CTL1, msr) )
+    {
+        hwp_err("rdmsr_safe(MSR_PM_CTL1)\n", cpu);
+
+        return -1;
+    }
+
+    if ( val )
+        msr |= PM_CTL1_HDC_ALLOW_BLOCK;
+    else
+        msr &= ~PM_CTL1_HDC_ALLOW_BLOCK;
+
+    if ( wrmsr_safe(MSR_PM_CTL1, msr) )
+    {
+        hwp_err("wrmsr_safe(MSR_PM_CTL1): %016lx\n", cpu, msr);
+
+        return -1;
+    }
+
+    return 0;
+}
+
+static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
+{
+    uint32_t base_khz, max_khz, bus_khz, edx;
+
+    cpuid(0x16, &base_khz, &max_khz, &bus_khz, &edx);
+
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
+    if ( rdmsr_safe(MSR_PM_ENABLE, val) )
+    {
+        hwp_err("rdmsr_safe(MSR_PM_ENABLE)\n", policy->cpu);
+        data->curr_req.raw = -1;
+        return;
+    }
+
+    /* Ensure we don't generate interrupts */
+    if ( feature_hwp_notification )
+        wrmsr_safe(MSR_HWP_INTERRUPT, 0);
+
+    hwp_verbose("CPU%u: MSR_PM_ENABLE: %016lx\n", policy->cpu, val);
+    if ( !(val & PM_ENABLE_HWP_ENABLE) )
+    {
+        val |= PM_ENABLE_HWP_ENABLE;
+        if ( wrmsr_safe(MSR_PM_ENABLE, val) )
+        {
+            hwp_err("wrmsr_safe(MSR_PM_ENABLE, %lx)\n", policy->cpu, val);
+            data->curr_req.raw = -1;
+            return;
+        }
+    }
+
+    if ( rdmsr_safe(MSR_HWP_CAPABILITIES, data->hwp_caps) )
+    {
+        hwp_err("rdmsr_safe(MSR_HWP_CAPABILITIES)\n", policy->cpu);
+        goto error;
+    }
+
+    if ( rdmsr_safe(MSR_HWP_REQUEST, data->curr_req.raw) )
+    {
+        hwp_err("rdmsr_safe(MSR_HWP_REQUEST)\n", policy->cpu);
+        goto error;
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
+        if ( hdc_set_pkg_hdc_ctl(policy->cpu, opt_cpufreq_hdc) )
+            goto error;
+        if ( hdc_set_pm_ctl1(policy->cpu, opt_cpufreq_hdc) )
+            goto error;
+    }
+
+    hwp_get_cpu_speeds(policy);
+
+    return;
+
+ error:
+    data->curr_req.raw = -1;
+    val &= ~PM_ENABLE_HWP_ENABLE;
+    if ( wrmsr_safe(MSR_PM_ENABLE, val) )
+        hwp_err("wrmsr_safe(MSR_PM_ENABLE, %lx)\n", policy->cpu, val);
+
+    return;
+}
+
+static int cf_check hwp_cpufreq_verify(struct cpufreq_policy *policy)
+{
+    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
+
+    if ( !feature_hwp_activity_window && data->activity_window )
+    {
+        hwp_verbose("HWP activity window not supported\n");
+
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static void cf_check hwp_write_request(void *info)
+{
+    const struct cpufreq_policy *policy = info;
+    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
+    union hwp_request hwp_req = data->curr_req;
+
+    data->ret = 0;
+
+    BUILD_BUG_ON(sizeof(union hwp_request) != sizeof(uint64_t));
+    if ( wrmsr_safe(MSR_HWP_REQUEST, hwp_req.raw) )
+    {
+        hwp_verbose("CPU%u: error wrmsr_safe(MSR_HWP_REQUEST, %lx)\n",
+                    policy->cpu, hwp_req.raw);
+        rdmsr_safe(MSR_HWP_REQUEST, data->curr_req.raw);
+        data->ret = -EINVAL;
+    }
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
+    hwp_req.energy_perf = data->energy_perf;
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
+    return data->ret;
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
+    if ( cpufreq_opt_governor && strcmp(cpufreq_opt_governor->name,
+                                        cpufreq_gov_hwp.name) )
+        printk(XENLOG_WARNING
+               "HWP: governor \"%s\" is incompatible with hwp. Using default \"%s\"\n",
+               cpufreq_opt_governor->name, cpufreq_gov_hwp.name);
+    policy->governor = &cpufreq_gov_hwp;
+
+    per_cpu(hwp_drv_data, cpu) = data;
+
+    on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
+
+    if ( data->curr_req.raw == -1 )
+    {
+        hwp_err("Could not initialize HWP properly\n", cpu);
+        XFREE(per_cpu(hwp_drv_data, cpu));
+        return -ENODEV;
+    }
+
+    data->minimum = data->curr_req.min_perf;
+    data->maximum = data->curr_req.max_perf;
+    data->desired = data->curr_req.desired;
+    data->energy_perf = data->curr_req.energy_perf;
+    data->activity_window = data->curr_req.activity_window;
+
+    hwp_verbose("CPU%u: HWP_CAPABILITIES: %016lx\n", cpu, data->hwp_caps);
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
+ * with my HWP testing.  MSR_MISC_ENABLE and MISC_ENABLE_TURBO_DISENGAGE
+ * is what Linux uses and seems to work.
+ */
+static void cf_check hwp_set_misc_turbo(void *info)
+{
+    const struct cpufreq_policy *policy = info;
+    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
+    uint64_t msr;
+
+    data->ret = 0;
+
+    if ( rdmsr_safe(MSR_IA32_MISC_ENABLE, msr) )
+    {
+        hwp_verbose("CPU%u: error rdmsr_safe(MSR_IA32_MISC_ENABLE)\n",
+                    policy->cpu);
+        data->ret = -EINVAL;
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
+    {
+        hwp_verbose("CPU%u: error wrmsr_safe(MSR_IA32_MISC_ENABLE): %016lx\n",
+                    policy->cpu, msr);
+        data->ret = -EINVAL;
+    }
+}
+
+static int cf_check hwp_cpufreq_update(int cpuid, struct cpufreq_policy *policy)
+{
+    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpuid);
+    on_selected_cpus(cpumask_of(cpuid), hwp_set_misc_turbo, policy, 1);
+
+    return data->ret;
+}
+
+static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
+{
+    .name   = XEN_HWP_DRIVER,
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
index ace31e3b1f..00d618483c 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -52,8 +52,16 @@ static inline bool boot_cpu_has(unsigned int feat)
     return cpu_has(&boot_cpu_data, feat);
 }
 
-#define CPUID_PM_LEAF                    6
-#define CPUID6_ECX_APERFMPERF_CAPABILITY 0x1
+#define CPUID_PM_LEAF                                6
+#define CPUID6_EAX_HWP                               BIT(7, U)
+#define CPUID6_EAX_HWP_NOTIFICATION                  BIT(8, U)
+#define CPUID6_EAX_HWP_ACTIVITY_WINDOW               BIT(9, U)
+#define CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE BIT(10, U)
+#define CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST         BIT(11, U)
+#define CPUID6_EAX_HDC                               BIT(13, U)
+#define CPUID6_EAX_HWP_PECI                          BIT(16, U)
+#define CPUID6_EAX_HW_FEEDBACK                       BIT(19, U)
+#define CPUID6_ECX_APERFMPERF_CAPABILITY             BIT(0, U)
 
 /* CPUID level 0x00000001.edx */
 #define cpu_has_fpu             1
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 2749e433d2..47b09a24b5 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -151,6 +151,13 @@
 
 #define MSR_PKRS                            0x000006e1
 
+#define MSR_PM_ENABLE                       0x00000770
+#define  PM_ENABLE_HWP_ENABLE               BIT(0, ULL)
+
+#define MSR_HWP_CAPABILITIES                0x00000771
+#define MSR_HWP_INTERRUPT                   0x00000773
+#define MSR_HWP_REQUEST                     0x00000774
+
 #define MSR_X2APIC_FIRST                    0x00000800
 #define MSR_X2APIC_LAST                     0x000008ff
 
@@ -165,6 +172,11 @@
 #define  PASID_PASID_MASK                   0x000fffff
 #define  PASID_VALID                        (_AC(1, ULL) << 31)
 
+#define MSR_PKG_HDC_CTL                     0x00000db0
+#define  PKG_HDC_CTL_HDC_PKG_ENABLE         BIT(0, ULL)
+#define MSR_PM_CTL1                         0x00000db1
+#define  PM_CTL1_HDC_ALLOW_BLOCK            BIT(0, ULL)
+
 #define MSR_UARCH_MISC_CTRL                 0x00001b01
 #define  UARCH_CTRL_DOITM                   (_AC(1, ULL) <<  0)
 
@@ -503,6 +515,7 @@
 #define MSR_IA32_MISC_ENABLE_LIMIT_CPUID  (1<<22)
 #define MSR_IA32_MISC_ENABLE_XTPR_DISABLE (1<<23)
 #define MSR_IA32_MISC_ENABLE_XD_DISABLE	(1ULL << 34)
+#define MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE (1ULL << 38)
 
 #define MSR_IA32_TSC_DEADLINE		0x000006E0
 #define MSR_IA32_ENERGY_PERF_BIAS	0x000001b0
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index cccf9a64c8..b6e6d70ddf 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -97,6 +97,15 @@ static int __init cf_check setup_cpufreq_option(const char *str)
             return cpufreq_cmdline_parse(arg + 1);
     }
 
+    if ( choice < 0 && !cmdline_strcmp(str, "hwp") )
+    {
+        xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
+        cpufreq_controller = FREQCTL_xen;
+        opt_cpufreq_hwp = true;
+        if ( *arg && *(arg + 1) )
+            return hwp_cmdline_parse(arg + 1);
+    }
+
     return (choice < 0) ? -EINVAL : 0;
 }
 custom_param("cpufreq", setup_cpufreq_option);
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index a49efd1cb2..6ec7dbcbbb 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -246,4 +246,7 @@ void cpufreq_dbs_timer_resume(void);
 
 void intel_feature_detect(struct cpufreq_policy *policy);
 
+extern bool __initdata opt_cpufreq_hwp;
+int hwp_cmdline_parse(const char *s);
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
index bdcea99d71..08fe815329 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -296,6 +296,7 @@ struct xen_ondemand {
     uint32_t up_threshold;
 };
 
+#define XEN_HWP_DRIVER "hwp"
 /*
  * cpufreq para name of this structure named
  * same as sysfs file name of native linux
-- 
2.40.1


