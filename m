Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4DE772E2C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578795.906519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Kr-0006Pc-US; Mon, 07 Aug 2023 18:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578795.906519; Mon, 07 Aug 2023 18:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Kr-0006MR-PT; Mon, 07 Aug 2023 18:52:09 +0000
Received: by outflank-mailman (input) for mailman id 578795;
 Mon, 07 Aug 2023 18:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5Kp-0004GT-Uc
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:52:08 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80641785-3553-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 20:52:05 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-766fd5f9536so290435485a.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:52:05 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:52:02 -0700 (PDT)
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
X-Inumbo-ID: 80641785-3553-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434323; x=1692039123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gCOuYJf06lhbOIsw/F1/0m49/wq+20s+vXdSNsZE/tM=;
        b=F1ggc1h5yZl5XIQaGlZN6YoyCsqIh6cNGCed7oczn1Y9oCfoOMNiu2Oa7zMtQDmmaA
         whxc7xzm9FY7iDnduewdUvkJndU4jGG7+rMMc3p2r07N/ZE4d/grm6tkSNTsJQMiDb1C
         dnAjFCVv4RCimyeTFRUSGIzmqzGHLCEQkwsCNauLAGWjfScy+RwGoPO8PjldnpWi4OET
         s4N6TiPNIMVb2sxyK994bMgB5lKfj4YBH4m1Z1rKyMvE7T5WnrQxb6wFZYymhtYDceEp
         CYlUJdgaOtQbKDsNMKClEwAG+Q3/RfFoJnD1QNOsFzn2Os0frelmM+at/Pe5Q82Mchph
         ZuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434323; x=1692039123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gCOuYJf06lhbOIsw/F1/0m49/wq+20s+vXdSNsZE/tM=;
        b=C/qHG4tCJNsCdop4peokqhSOSQ5eippXbFm6GGgPmN6M+qteiFNeacz3Po5hBKVx7d
         /r3wXqyXQxJqeRfCvArku7k6zdNtZVZhuT9CmnEO2ap88FkDic9MLq9A2+1kisDKYIKl
         Ua1sGvKQl2CJMVPprAhiJIDDkEcZ+THdgp90lxLJ0FtG1BWWQH/PWUwSkjmi7pMrbnMv
         5na/FZcrjJylE7xN8z8POZvgmNullVDYq8zoIucWe6sizTtgRJykkAlsP6H3MMzWPqfh
         cXW1SbUJTWnkngosV/r8fRttUvBvuRIckxEA2GmtckQ4cOrwk6HfZMDnJXkofZoU/iAQ
         gdaQ==
X-Gm-Message-State: AOJu0Yytrfqb6Bl8b8K1x/8PC17u6tXiQYDt6CbkmuCLGJDYXr3GiEf1
	4eFmWgMHOC8AGFG4+zSYYd3I7Ji1yps=
X-Google-Smtp-Source: AGHT+IHujdpFIqe/Uv0K3AdNjlLtHUsARcy+eS9d8Vl1C+iSYTV5Z8hoxyo/QVYU0TVLguIQFurS2g==
X-Received: by 2002:a0c:be87:0:b0:636:afa1:345d with SMTP id n7-20020a0cbe87000000b00636afa1345dmr6374537qvi.17.1691434323398;
        Mon, 07 Aug 2023 11:52:03 -0700 (PDT)
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
Subject: [PATCH v8 06/15] cpufreq: Add Hardware P-State (HWP) driver
Date: Mon,  7 Aug 2023 14:51:10 -0400
Message-ID: <20230807185119.98333-7-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From the Intel SDM: "Hardware-Controlled Performance States (HWP), which
autonomously selects performance states while utilizing OS supplied
performance guidance hints."

Enable HWP to run in autonomous mode by poking the correct MSRs.  HWP is
disabled by default, and cpufreq=hwp enables it.

cpufreq= parsing is expanded to allow cpufreq=hwp;xen.  This allows
trying HWP and falling back to xen if not available.  Only hwp and xen
are supported for this fallback feature.  hdc is a sub-option under hwp
(i.e.  cpufreq=hwp,hdc=0) as is verbose.

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

Xen doesn't use the HWP interrupt, so it is disabled like in the Linux
pstate driver.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
We disable on cpuid_level < 0x16.  cpuid(0x16) is used to get the cpu
frequencies for calculating the APERF/MPERF.  Without it, things would
still work, but the average cpu frequency output would be wrong.

My 8th & 10th gen test systems both report:
(XEN) HWP: 1 notify: 1 act_window: 1 energy_perf: 1 pkg_level: 0 peci: 0
(XEN) HWP: Hardware Duty Cycling (HDC) supported
(XEN) HWP: HW_FEEDBACK not supported

We can't use parse_boolean() since it requires a single name=val string
and cpufreq_handle_common_option is provided two strings.  Use
parse_bool() and manual handle no-hwp.

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

v5:
Use _AC() macro in MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE definition
hwp_err arg re-ordering
Use XEN_HWP_DRIVER_NAME
Use cpufreq.h for all declarations
Clear feature_hdc on failure and print a message
Use unnamed bitfields instead of reservered
Remove asm/io.h include
static DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data
Remove some empty newlines
Align feature_hdc assignment
Remove feature_hwp
Remove unnecesary return at end of void hwp_init_msrs()
BUILD_BUG_ON member variable
Reformat a compound if
Clear pre_cpu hwp_drv_data before xfree()
Only print HWP capabilities for CPU 0
Specify processor models in turbo comment
Use arg[1] in setup_cpufreq_option()
Remove some log messages
Drop double newline
Parse verbose as a boolean instead of the custom parsing.
Support cpufreq=hwp;xen fallback
Call hwp_available() from hwp_register_driver()
Move cpufreq_govenor_internal setting to hwp_register_driver

v6:
docs: mention verbose applies to both.
Use cpufreq=hwp;xen,verbose example with verbose at then end.
Declare induction i inside for loop
Add CPUFREQ_none
Only call cpufreq fallback for -ENODEV
Brace on newline fixes
hdc_set_pkg_hdc_ctl()/hdc_set_pm_ctl1() return boolean
Continue without hdc
Consolidate hdc if statement
Use hwp_req variable for BUILD_BUG_ON
Newline between declarations and statement
__initdata for cpufreq_xen_opts/cpufreq_xen_cnt
Only print HWP_REQUEST when differing from BSP.
Remove MSR_PM_ENABLE printing
Move hdc_set_pkg_hdc_ctl(), hdc_set_pm_ctl1(), hwp_get_cpu_speeds(), and
  hwp_init_msrs() to before their sole caller, hwp_cpufreq_cpu_init()
Fix cpufreq= parsing without options (set ret=0)
Drop stray s NULL check
Return -EINVAL from hwp_cmdline_parse()
Latch first CPU HWP request and print differences
Use strpbrk to split on ',' or ':' for arg in xen/hwp do..while
Limit hwp parsing error to just current option with %.*s and (end ?: e) - s
docs: Expand and clarify the handling of `verbose` with cpufreq fallbacks.

v7:
s/##_VA_ARGS/## args/ in macros
Add __init to hwp_handle_option
Add comment for 0 cpuid freqs
Reword intel_feature_detect comment.
Fix indent for HDC failure
Make first_run static and use for first cpu latching
hwp_set_misc_turbo() return -EACCES on error
s/end/*end/ in setup_cpufreq_option()

v8:
Annotate first_run as __read_mostly
Add Jan's Reviewed-by
---
 docs/misc/xen-command-line.pandoc     |  20 +-
 xen/arch/x86/acpi/cpufreq/Makefile    |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c   |  21 +-
 xen/arch/x86/acpi/cpufreq/hwp.c       | 524 ++++++++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeature.h |  12 +-
 xen/arch/x86/include/asm/msr-index.h  |  15 +-
 xen/drivers/cpufreq/cpufreq.c         |  59 ++-
 xen/include/acpi/cpufreq/cpufreq.h    |  10 +
 xen/include/public/sysctl.h           |   2 +
 9 files changed, 649 insertions(+), 15 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 9d66688bd1..abff141590 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -499,7 +499,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
 available support.
 
 ### cpufreq
-> `= none | {{ <boolean> | xen } [:[powersave|performance|ondemand|userspace][,<maxfreq>][,[<minfreq>][,[verbose]]]]} | dom0-kernel`
+> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]]`
 
 > Default: `xen`
 
@@ -510,6 +510,24 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `<maxfreq>` and `<minfreq>` are integers which represent max and min processor frequencies
   respectively.
 * `verbose` option can be included as a string or also as `verbose=<integer>`
+  for `xen`.  It is a boolean for `hwp`.
+* `hwp` selects Hardware-Controlled Performance States (HWP) on supported Intel
+  hardware.  HWP is a Skylake+ feature which provides better CPU power
+  management.  The default is disabled.  If `hwp` is selected, but hardware
+  support is not available, Xen will fallback to cpufreq=xen.
+* `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC enables the
+  processor to autonomously force physical package components into idle state.
+  The default is enabled, but the option only applies when `hwp` is enabled.
+
+There is also support for `;`-separated fallback options:
+`cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to `xen` if
+unavailable.  Note: The `verbose` suboption is handled globally.  Setting it
+for either the primary or fallback option applies to both irrespective of where
+it is specified.
+
+Note: grub2 requires to escape or quote ';', so `"cpufreq=hwp;xen"` should be
+specified within double quotes inside grub.cfg.  Refer to the grub2
+documentation for more information.
 
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
index f1cc473b4f..61b62c370a 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -642,7 +642,26 @@ static int __init cf_check cpufreq_driver_init(void)
         switch ( boot_cpu_data.x86_vendor )
         {
         case X86_VENDOR_INTEL:
-            ret = cpufreq_register_driver(&acpi_cpufreq_driver);
+            ret = -ENOENT;
+
+            for ( unsigned int i = 0; i < cpufreq_xen_cnt; i++ )
+            {
+                switch ( cpufreq_xen_opts[i] )
+                {
+                case CPUFREQ_xen:
+                    ret = cpufreq_register_driver(&acpi_cpufreq_driver);
+                    break;
+                case CPUFREQ_hwp:
+                    ret = hwp_register_driver();
+                    break;
+                case CPUFREQ_none:
+                    ret = 0;
+                    break;
+                }
+
+                if ( ret != -ENODEV )
+                    break;
+            }
             break;
 
         case X86_VENDOR_AMD:
diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
new file mode 100644
index 0000000000..932786ccca
--- /dev/null
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -0,0 +1,524 @@
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
+#include <asm/msr.h>
+#include <acpi/cpufreq/cpufreq.h>
+
+static bool __ro_after_init feature_hwp_notification;
+static bool __ro_after_init feature_hwp_activity_window;
+
+static bool __ro_after_init feature_hdc;
+
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
+        unsigned int :16;
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
+            unsigned int :32;
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
+static DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);
+
+#define hwp_err(cpu, fmt, args...) \
+    printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, ## args)
+#define hwp_info(fmt, args...)    printk(XENLOG_INFO "HWP: " fmt, ## args)
+#define hwp_verbose(fmt, args...)                         \
+({                                                        \
+    if ( cpufreq_verbose )                                \
+        printk(XENLOG_DEBUG "HWP: " fmt, ## args);        \
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
+static bool __init hwp_handle_option(const char *s, const char *end)
+{
+    int ret;
+
+    ret = parse_boolean("verbose", s, end);
+    if ( ret >= 0 )
+    {
+        cpufreq_verbose = ret;
+        return true;
+    }
+
+    ret = parse_boolean("hdc", s, end);
+    if ( ret >= 0 )
+    {
+        opt_cpufreq_hdc = ret;
+        return true;
+    }
+
+    return false;
+}
+
+int __init hwp_cmdline_parse(const char *s, const char *e)
+{
+    do
+    {
+        const char *end = strpbrk(s, ",;");
+
+        if ( !hwp_handle_option(s, end) )
+        {
+            printk(XENLOG_WARNING "cpufreq/hwp: option '%.*s' not recognized\n",
+                   (int)((end ?: e) - s), s);
+
+            return -EINVAL;
+        }
+
+        s = end ? ++end : end;
+    } while ( s && s < e );
+
+    return 0;
+}
+
+static struct cpufreq_governor cpufreq_gov_hwp =
+{
+    .name          = "hwp",
+    .governor      = hwp_governor,
+};
+
+static int __init cf_check cpufreq_gov_hwp_init(void)
+{
+    if ( !cpufreq_governor_internal )
+        return 0;
+
+    return cpufreq_register_governor(&cpufreq_gov_hwp);
+}
+__initcall(cpufreq_gov_hwp_init);
+
+static bool __init hwp_available(void)
+{
+    unsigned int eax;
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
+    feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
+    feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
+    feature_hdc                 = eax & CPUID6_EAX_HDC;
+
+    hwp_verbose("Hardware Duty Cycling (HDC) %ssupported%s\n",
+                feature_hdc ? "" : "not ",
+                feature_hdc ? opt_cpufreq_hdc ? ", enabled" : ", disabled"
+                            : "");
+
+    hwp_verbose("HW_FEEDBACK %ssupported\n",
+                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
+
+    hwp_info("Using HWP for cpufreq\n");
+
+    return true;
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
+    BUILD_BUG_ON(sizeof(hwp_req) != sizeof(hwp_req.raw));
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
+    on_selected_cpus(cpumask_of(cpu), hwp_write_request, policy, 1);
+
+    return data->ret;
+}
+
+static bool hdc_set_pkg_hdc_ctl(unsigned int cpu, bool val)
+{
+    uint64_t msr;
+
+    if ( rdmsr_safe(MSR_PKG_HDC_CTL, msr) )
+    {
+        hwp_err(cpu, "rdmsr_safe(MSR_PKG_HDC_CTL)\n");
+        return false;
+    }
+
+    if ( val )
+        msr |= PKG_HDC_CTL_HDC_PKG_ENABLE;
+    else
+        msr &= ~PKG_HDC_CTL_HDC_PKG_ENABLE;
+
+    if ( wrmsr_safe(MSR_PKG_HDC_CTL, msr) )
+    {
+        hwp_err(cpu, "wrmsr_safe(MSR_PKG_HDC_CTL): %016lx\n", msr);
+        return false;
+    }
+
+    return true;
+}
+
+static bool hdc_set_pm_ctl1(unsigned int cpu, bool val)
+{
+    uint64_t msr;
+
+    if ( rdmsr_safe(MSR_PM_CTL1, msr) )
+    {
+        hwp_err(cpu, "rdmsr_safe(MSR_PM_CTL1)\n");
+        return false;
+    }
+
+    if ( val )
+        msr |= PM_CTL1_HDC_ALLOW_BLOCK;
+    else
+        msr &= ~PM_CTL1_HDC_ALLOW_BLOCK;
+
+    if ( wrmsr_safe(MSR_PM_CTL1, msr) )
+    {
+        hwp_err(cpu, "wrmsr_safe(MSR_PM_CTL1): %016lx\n", msr);
+        return false;
+    }
+
+    return true;
+}
+
+static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
+{
+    uint32_t base_khz, max_khz, bus_khz, edx;
+
+    cpuid(0x16, &base_khz, &max_khz, &bus_khz, &edx);
+
+    /*
+     * Zero values are acceptable - they are not used for calculations
+     * and only returned to userspace.
+     */
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
+        hwp_err(policy->cpu, "rdmsr_safe(MSR_PM_ENABLE)\n");
+        data->curr_req.raw = -1;
+        return;
+    }
+
+    /* Ensure we don't generate interrupts */
+    if ( feature_hwp_notification )
+        wrmsr_safe(MSR_HWP_INTERRUPT, 0);
+
+    if ( !(val & PM_ENABLE_HWP_ENABLE) )
+    {
+        val |= PM_ENABLE_HWP_ENABLE;
+        if ( wrmsr_safe(MSR_PM_ENABLE, val) )
+        {
+            hwp_err(policy->cpu, "wrmsr_safe(MSR_PM_ENABLE, %lx)\n", val);
+            data->curr_req.raw = -1;
+            return;
+        }
+    }
+
+    if ( rdmsr_safe(MSR_HWP_CAPABILITIES, data->hwp_caps) )
+    {
+        hwp_err(policy->cpu, "rdmsr_safe(MSR_HWP_CAPABILITIES)\n");
+        goto error;
+    }
+
+    if ( rdmsr_safe(MSR_HWP_REQUEST, data->curr_req.raw) )
+    {
+        hwp_err(policy->cpu, "rdmsr_safe(MSR_HWP_REQUEST)\n");
+        goto error;
+    }
+
+    /* Check for turbo support. */
+    intel_feature_detect(policy);
+
+    if ( feature_hdc &&
+         (!hdc_set_pkg_hdc_ctl(policy->cpu, opt_cpufreq_hdc) ||
+          !hdc_set_pm_ctl1(policy->cpu, opt_cpufreq_hdc)) )
+    {
+        hwp_err(policy->cpu, "Disabling HDC support\n");
+        feature_hdc = false;
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
+        hwp_err(policy->cpu, "wrmsr_safe(MSR_PM_ENABLE, %lx)\n", val);
+}
+
+static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+    static bool __read_mostly first_run = true;
+    static union hwp_request initial_req;
+    unsigned int cpu = policy->cpu;
+    struct hwp_drv_data *data;
+
+    data = xzalloc(struct hwp_drv_data);
+    if ( !data )
+        return -ENOMEM;
+
+    policy->governor = &cpufreq_gov_hwp;
+
+    per_cpu(hwp_drv_data, cpu) = data;
+
+    on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
+
+    if ( data->curr_req.raw == -1 )
+    {
+        hwp_err(cpu, "Could not initialize HWP properly\n");
+        per_cpu(hwp_drv_data, cpu) = NULL;
+        xfree(data);
+        return -ENODEV;
+    }
+
+    data->minimum = data->curr_req.min_perf;
+    data->maximum = data->curr_req.max_perf;
+    data->desired = data->curr_req.desired;
+    data->energy_perf = data->curr_req.energy_perf;
+    data->activity_window = data->curr_req.activity_window;
+
+    if ( first_run )
+    {
+        hwp_verbose("CPU%u: HWP_CAPABILITIES: %016lx\n", cpu, data->hwp_caps);
+        initial_req = data->curr_req;
+    }
+
+    if ( first_run || data->curr_req.raw != initial_req.raw )
+    {
+        hwp_verbose("CPU%u: rdmsr HWP_REQUEST %016lx\n", cpu,
+                    data->curr_req.raw);
+        first_run = false;
+    }
+
+    return 0;
+}
+
+static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+{
+    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
+
+    per_cpu(hwp_drv_data, policy->cpu) = NULL;
+    xfree(data);
+
+    return 0;
+}
+
+/*
+ * The SDM reads like turbo should be disabled with MSR_IA32_PERF_CTL and
+ * PERF_CTL_TURBO_DISENGAGE, but that does not seem to actually work, at least
+ * with testing on i7-10810U and i7-8550U.  MSR_MISC_ENABLE and
+ * MISC_ENABLE_TURBO_DISENGAGE is what Linux uses and seems to work.
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
+        data->ret = -EACCES;
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
+        data->ret = -EACCES;
+    }
+}
+
+static int cf_check hwp_cpufreq_update(int cpuid, struct cpufreq_policy *policy)
+{
+    on_selected_cpus(cpumask_of(cpuid), hwp_set_misc_turbo, policy, 1);
+
+    return per_cpu(hwp_drv_data, cpuid)->ret;
+}
+
+static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
+{
+    .name   = XEN_HWP_DRIVER_NAME,
+    .verify = hwp_cpufreq_verify,
+    .target = hwp_cpufreq_target,
+    .init   = hwp_cpufreq_cpu_init,
+    .exit   = hwp_cpufreq_cpu_exit,
+    .update = hwp_cpufreq_update,
+};
+
+int __init hwp_register_driver(void)
+{
+    int ret;
+
+    if ( !hwp_available() )
+        return -ENODEV;
+
+    ret = cpufreq_register_driver(&hwp_cpufreq_driver);
+    cpufreq_governor_internal = (ret == 0);
+
+    return ret;
+}
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 64e1dad225..93466441f5 100644
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
index 4d41c171d2..2705982d93 100644
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
 
@@ -468,7 +480,8 @@
 #define MSR_IA32_MISC_ENABLE_MONITOR_ENABLE (1<<18)
 #define MSR_IA32_MISC_ENABLE_LIMIT_CPUID  (1<<22)
 #define MSR_IA32_MISC_ENABLE_XTPR_DISABLE (1<<23)
-#define MSR_IA32_MISC_ENABLE_XD_DISABLE   (_AC(1, ULL) << 34)
+#define MSR_IA32_MISC_ENABLE_XD_DISABLE      (_AC(1, ULL) << 34)
+#define MSR_IA32_MISC_ENABLE_TURBO_DISENGAGE (_AC(1, ULL) << 38)
 
 #define MSR_IA32_TSC_DEADLINE		0x000006E0
 #define MSR_IA32_ENERGY_PERF_BIAS	0x000001b0
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 67a58d409b..81bda5df23 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -63,12 +63,19 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
 /* set xen as default cpufreq */
 enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
 
-static int __init cpufreq_cmdline_parse(const char *s);
+enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { CPUFREQ_xen,
+                                                        CPUFREQ_none };
+unsigned int __initdata cpufreq_xen_cnt = 1;
+
+static int __init cpufreq_cmdline_parse(const char *s, const char *e);
 
 static int __init cf_check setup_cpufreq_option(const char *str)
 {
-    const char *arg = strpbrk(str, ",:");
+    const char *arg = strpbrk(str, ",:;");
     int choice;
+    int ret = -EINVAL;
+
+    cpufreq_xen_cnt = 0;
 
     if ( !arg )
         arg = strchr(str, '\0');
@@ -89,15 +96,45 @@ static int __init cf_check setup_cpufreq_option(const char *str)
         return 0;
     }
 
-    if ( choice > 0 || !cmdline_strcmp(str, "xen") )
+    do
     {
-        xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
-        cpufreq_controller = FREQCTL_xen;
-        if ( *arg && *(arg + 1) )
-            return cpufreq_cmdline_parse(arg + 1);
-    }
+        const char *end = strchr(str, ';');
+
+        if ( end == NULL )
+            end = strchr(str, '\0');
+
+        arg = strpbrk(str, ",:");
+        if ( !arg || arg > end )
+            arg = strchr(str, '\0');
+
+        if ( cpufreq_xen_cnt == ARRAY_SIZE(cpufreq_xen_opts) )
+            return -E2BIG;
+
+        if ( choice > 0 || !cmdline_strcmp(str, "xen") )
+        {
+            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
+            cpufreq_controller = FREQCTL_xen;
+            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_xen;
+            ret = 0;
+            if ( arg[0] && arg[1] )
+                ret = cpufreq_cmdline_parse(arg + 1, end);
+        }
+        else if ( choice < 0 && !cmdline_strcmp(str, "hwp") )
+        {
+            xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
+            cpufreq_controller = FREQCTL_xen;
+            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_hwp;
+            ret = 0;
+            if ( arg[0] && arg[1] )
+                ret = hwp_cmdline_parse(arg + 1, end);
+        }
+        else
+            ret = -EINVAL;
+
+        str = *end ? ++end : end;
+    } while ( choice < 0 && ret == 0 && *str );
 
-    return (choice < 0) ? -EINVAL : 0;
+    return (choice < 0) ? ret : 0;
 }
 custom_param("cpufreq", setup_cpufreq_option);
 
@@ -576,7 +613,7 @@ static int __init cpufreq_handle_common_option(const char *name, const char *val
     return 0;
 }
 
-static int __init cpufreq_cmdline_parse(const char *s)
+static int __init cpufreq_cmdline_parse(const char *s, const char *e)
 {
     static struct cpufreq_governor *__initdata cpufreq_governors[] =
     {
@@ -592,6 +629,8 @@ static int __init cpufreq_cmdline_parse(const char *s)
     int rc = 0;
 
     strlcpy(buf, s, sizeof(buf));
+    if (e - s < sizeof(buf))
+        buf[e - s] = '\0';
     do {
         char *val, *end = strchr(str, ',');
         unsigned int i;
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 482ea5b0de..cfe975814e 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -24,6 +24,13 @@ DECLARE_PER_CPU(spinlock_t, cpufreq_statistic_lock);
 
 extern bool_t cpufreq_verbose;
 
+enum cpufreq_xen_opt {
+    CPUFREQ_none,
+    CPUFREQ_xen,
+    CPUFREQ_hwp,
+};
+extern enum cpufreq_xen_opt cpufreq_xen_opts[2];
+extern unsigned int cpufreq_xen_cnt;
 struct cpufreq_governor;
 
 struct acpi_cpufreq_data {
@@ -245,4 +252,7 @@ void cpufreq_dbs_timer_resume(void);
 
 void intel_feature_detect(struct cpufreq_policy *policy);
 
+int hwp_cmdline_parse(const char *s, const char *e);
+int hwp_register_driver(void);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index c11c0b1a6c..5a30b16fcf 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -296,6 +296,8 @@ struct xen_ondemand {
     uint32_t up_threshold;
 };
 
+#define XEN_HWP_DRIVER_NAME "hwp"
+
 /*
  * cpufreq para name of this structure named
  * same as sysfs file name of native linux
-- 
2.41.0


