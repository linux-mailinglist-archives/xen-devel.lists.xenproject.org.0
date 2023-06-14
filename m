Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFB4730696
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549131.857570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uqk-0000ra-H2; Wed, 14 Jun 2023 18:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549131.857570; Wed, 14 Jun 2023 18:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uqk-0000q9-C8; Wed, 14 Jun 2023 18:04:06 +0000
Received: by outflank-mailman (input) for mailman id 549131;
 Wed, 14 Jun 2023 18:04:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9Uqi-0005L9-27
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:04:04 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7756023-0add-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 20:04:02 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-75da00a1eddso238630185a.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:04:02 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:59 -0700 (PDT)
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
X-Inumbo-ID: d7756023-0add-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765840; x=1689357840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GKrKS8MiOO/3IyATz8/1ZuFV/xDUGqEs/80K9twFs0=;
        b=esf7L9t+l/diomCDY4BXb+pi7Ip3FWjbSJST8nXYCU+g31ySOqGJhpWfw0Tj4cUzDo
         pVLj0k3qNE5gtEJpHkbERTnJkCQyVrIIdwd4RNmhPECaETgMHB4taCHichGuCHV8Q7HP
         UjdmEnCOl3+/OjT3pCRXkMhW9fbPGXq/tSOU+lstjLwrXkD7qOH6UKLZVLUqgU1GMvMa
         S7Rfai24HF5NNjJNh/6PSVrOCVyhPEoTcUwt/GibVbAbwNifahUXmNMijVbu5hcq78OA
         88sqCcU8h3Ur3VOEnp9rVpNfgr5UJ3lZ8L6OyDOw9aFU/UN3RjbT835RZgteCtC9sz+q
         OSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765840; x=1689357840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GKrKS8MiOO/3IyATz8/1ZuFV/xDUGqEs/80K9twFs0=;
        b=g2a8UtZYZwhx6O93mCjnywBfQn3yp0acXp+DwmFxhrRzDnIzMTFtXOM2KxShZc9wUJ
         pJ6ee8w8k+avj8isqH1tUTjVqvpFnEd0nlydjAYnNJJPSP7s10p7BO6ykb36WhA/RKfq
         gCFax0pszoPuJpSGUIdFoMJFHJKp8DOjS2GWTwkvqbiae9JAkc7U6j+l+1riZ3xNOMMj
         aC5SFLmidCh7U2Fg0InV9IFo71GQdId+2Uy3Fe/WTb8kh4L/XludQfyrNn41DhvAdNJ/
         EG0BVYxlpVjgRD5F6JWhjVqGN3BtR9sCy05yeoOjUjtqS+0aWbkDp1Osrhk4XDLBBgbK
         PqgA==
X-Gm-Message-State: AC+VfDwMwDO+venoKzwxvRpHviXJrt6K7IoPE2sWyn7thhRwOWRUhbeO
	3MkwhCJMIv6EzdhF7wmUoUApPLqvRaU=
X-Google-Smtp-Source: ACHHUZ4V73ClCfCNGt+bqS0RlR2jIE8NAYMZmmKlUEAS2C/EcyReY9KwirAaERaWSiv4w7yaIaTAtQ==
X-Received: by 2002:a05:6214:21eb:b0:623:9e5c:e625 with SMTP id p11-20020a05621421eb00b006239e5ce625mr16756670qvj.29.1686765840404;
        Wed, 14 Jun 2023 11:04:00 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 12/15] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
Date: Wed, 14 Jun 2023 14:02:50 -0400
Message-Id: <20230614180253.89958-13-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SET_CPUFREQ_HWP xen_sysctl_pm_op to set HWP parameters.  The sysctl
supports setting multiple values simultaneously as indicated by the
set_params bits.  This allows atomically applying new HWP configuration
via a single wrmsr.

XEN_SYSCTL_HWP_SET_PRESET_BALANCE/PERFORMANCE/POWERSAVE provide three
common presets.  Setting them depends on hardware limits which the
hypervisor is already caching.  So using them allows skipping a
hypercall to query the limits (lowest/highest) to then set those same
values.  The code is organized to allow a preset to be refined with
additional stuff if desired.

"most_efficient" and "guaranteed" could be additional presets in the
future, but the are not added now.  Those levels can change at runtime,
but we don't have code in place to monitor and update for those events.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

---
v4:
Remove IA32_ENERGY_BIAS support
Validate parameters don't exceed 255
Use CPPC/cppc name
set_cppc_para() add const
set_cppc_para() return hwp_cpufreq_target()
Expand sysctl comments

v3:
Remove cpufreq_governor_internal from set_cpufreq_hwp

v2:
Update for naming anonymous union
Drop hwp_err for invalid input in set_hwp_para()
Drop uint16_t cast in XEN_SYSCTL_HWP_SET_PARAM_MASK
Drop parens for HWP_SET_PRESET defines
Reference activity_window format comment
Place SET_CPUFREQ_HWP after SET_CPUFREQ_PARA
Add {HWP,IA32}_ENERGY_PERF_MAX_{PERFORMANCE,POWERSAVE} defines
Order defines before fields in sysctl.h
Use XEN_HWP_GOVERNOR
Use per_cpu for hwp_drv_data
---
 xen/arch/x86/acpi/cpufreq/hwp.c    | 98 ++++++++++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c          | 17 ++++++
 xen/include/acpi/cpufreq/cpufreq.h |  2 +
 xen/include/public/sysctl.h        | 58 ++++++++++++++++++
 4 files changed, 175 insertions(+)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 86c5793266..3ee046940c 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -23,6 +23,10 @@ static bool __ro_after_init feature_hdc;
 bool __initdata opt_cpufreq_hwp;
 static bool __ro_after_init opt_cpufreq_hdc = true;
 
+#define HWP_ENERGY_PERF_MAX_PERFORMANCE 0
+#define HWP_ENERGY_PERF_BALANCE         0x80
+#define HWP_ENERGY_PERF_MAX_POWERSAVE   0xff
+
 union hwp_request
 {
     struct
@@ -560,6 +564,100 @@ int get_hwp_para(const unsigned int cpu,
     return 0;
 }
 
+int set_hwp_para(struct cpufreq_policy *policy,
+                 const struct xen_set_cppc_para *set_cppc)
+{
+    unsigned int cpu = policy->cpu;
+    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+
+    if ( data == NULL )
+        return -EINVAL;
+
+    /* Validate all parameters first */
+    if ( set_cppc->set_params & ~XEN_SYSCTL_CPPC_SET_PARAM_MASK )
+        return -EINVAL;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW &&
+         !feature_hwp_activity_window )
+        return -EINVAL;
+
+    if ( !(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
+         set_cppc->activity_window )
+        return -EINVAL;
+
+    if ( set_cppc->activity_window & ~XEN_SYSCTL_CPPC_ACT_WINDOW_MASK )
+        return -EINVAL;
+
+    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED) &&
+         set_cppc->desired != 0 &&
+         (set_cppc->desired < data->hw.lowest ||
+          set_cppc->desired > data->hw.highest) )
+        return -EINVAL;
+
+    /*
+     * minimum & maximum are not validated against lowest or highest as
+     * hardware doesn't seem to care and the SDM says CPUs will clip
+     * internally.
+     */
+    if ( set_cppc->minimum > 255 ||
+         set_cppc->maximum > 255 ||
+         set_cppc->energy_perf > 255 )
+        return -EINVAL;
+
+    /* Apply presets */
+    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
+    {
+    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
+        data->minimum = data->hw.lowest;
+        data->maximum = data->hw.lowest;
+        data->activity_window = 0;
+        data->energy_perf = HWP_ENERGY_PERF_MAX_POWERSAVE;
+        data->desired = 0;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
+        data->minimum = data->hw.highest;
+        data->maximum = data->hw.highest;
+        data->activity_window = 0;
+        data->energy_perf = HWP_ENERGY_PERF_MAX_PERFORMANCE;
+        data->desired = 0;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_BALANCE:
+        data->minimum = data->hw.lowest;
+        data->maximum = data->hw.highest;
+        data->activity_window = 0;
+        data->energy_perf = HWP_ENERGY_PERF_BALANCE;
+        data->desired = 0;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
+        break;
+
+    default:
+        return -EINVAL;
+    }
+
+    /* Further customize presets if needed */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM )
+        data->minimum = set_cppc->minimum;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM )
+        data->maximum = set_cppc->maximum;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF )
+        data->energy_perf = set_cppc->energy_perf;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+        data->desired = set_cppc->desired;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
+        data->activity_window = set_cppc->activity_window &
+                                XEN_SYSCTL_CPPC_ACT_WINDOW_MASK;
+
+    return hwp_cpufreq_target(policy, 0, 0);
+}
+
 int __init hwp_register_driver(void)
 {
     return cpufreq_register_driver(&hwp_cpufreq_driver);
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 10143c084c..e4482bcdbc 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -402,6 +402,19 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
     return ret;
 }
 
+static int set_cpufreq_cppc(const struct xen_sysctl_pm_op *op)
+{
+    struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
+
+    if ( !policy || !policy->governor )
+        return -EINVAL;
+
+    if ( !hwp_active() )
+        return -EINVAL;
+
+    return set_hwp_para(policy, &op->u.set_cppc);
+}
+
 int do_pm_op(struct xen_sysctl_pm_op *op)
 {
     int ret = 0;
@@ -474,6 +487,10 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
         break;
     }
 
+    case SET_CPUFREQ_CPPC:
+        ret = set_cpufreq_cppc(op);
+        break;
+
     case GET_CPUFREQ_AVGFREQ:
     {
         op->u.get_avgfreq = cpufreq_driver_getavg(op->cpuid, USR_GETAVG);
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index fb655fac14..d757da2ef4 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -250,5 +250,7 @@ extern bool __initdata opt_cpufreq_hwp;
 int hwp_cmdline_parse(const char *s);
 int get_hwp_para(const unsigned int cpu,
                  struct xen_cppc_para *cppc_para);
+int set_hwp_para(struct cpufreq_policy *policy,
+                 const struct xen_set_cppc_para *set_cppc);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 5c9b60b5d0..96c58eb998 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -351,6 +351,62 @@ struct xen_cppc_para {
     uint32_t activity_window;
 };
 
+/*
+ * Set CPPC values.
+ *
+ * Configured the parameters for CPPC.  Set bits in set_params control which
+ * values are applied.
+ *
+ * There are a set of presets along with individual fields.  Presets are
+ * applied first, and then individual fields.  This allows customizing
+ * a preset without having to specify every value.
+ *
+ * The preset options values are as follows:
+ *
+ * preset      | minimum | maxium  | energy_perf
+ * ------------+---------+---------+----------------
+ * powersave   | lowest  | lowest  | powersave (255)
+ * ------------+---------+---------+----------------
+ * balance     | lowest  | highest | balance (128)
+ * ------------+---------+---------+----------------
+ * performance | highest | highest | performance (0)
+ *
+ * desired and activity_window are set to 0, hardware selected.
+ */
+struct xen_set_cppc_para {
+#define XEN_SYSCTL_CPPC_SET_DESIRED              (1U << 0)
+#define XEN_SYSCTL_CPPC_SET_ENERGY_PERF          (1U << 1)
+#define XEN_SYSCTL_CPPC_SET_ACT_WINDOW           (1U << 2)
+#define XEN_SYSCTL_CPPC_SET_MINIMUM              (1U << 3)
+#define XEN_SYSCTL_CPPC_SET_MAXIMUM              (1U << 4)
+#define XEN_SYSCTL_CPPC_SET_PRESET_MASK          0xf000
+#define XEN_SYSCTL_CPPC_SET_PRESET_NONE          0x0000
+#define XEN_SYSCTL_CPPC_SET_PRESET_BALANCE       0x1000
+#define XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE     0x2000
+#define XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE   0x3000
+#define XEN_SYSCTL_CPPC_SET_PARAM_MASK ( \
+                                  XEN_SYSCTL_CPPC_SET_PRESET_MASK | \
+                                  XEN_SYSCTL_CPPC_SET_DESIRED     | \
+                                  XEN_SYSCTL_CPPC_SET_ENERGY_PERF | \
+                                  XEN_SYSCTL_CPPC_SET_ACT_WINDOW  | \
+                                  XEN_SYSCTL_CPPC_SET_MINIMUM     | \
+                                  XEN_SYSCTL_CPPC_SET_MAXIMUM     )
+    uint32_t set_params; /* bitflags for valid values */
+    /* See comments in struct xen_cppc_para. */
+    uint32_t minimum;
+    uint32_t maximum;
+    uint32_t desired;
+    /*
+     * Hint to hardware for energy/performance preference.
+     * 0:   Performance
+     * 128: Balance (Default)
+     * 255: Powersaving
+     */
+    uint32_t energy_perf;
+#define XEN_SYSCTL_CPPC_ACT_WINDOW_MASK          0x03ff
+    uint32_t activity_window;
+};
+
 #define XEN_HWP_DRIVER "hwp"
 /*
  * cpufreq para name of this structure named
@@ -417,6 +473,7 @@ struct xen_sysctl_pm_op {
     #define SET_CPUFREQ_GOV            (CPUFREQ_PARA | 0x02)
     #define SET_CPUFREQ_PARA           (CPUFREQ_PARA | 0x03)
     #define GET_CPUFREQ_AVGFREQ        (CPUFREQ_PARA | 0x04)
+    #define SET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x05)
 
     /* set/reset scheduler power saving option */
     #define XEN_SYSCTL_pm_op_set_sched_opt_smt    0x21
@@ -443,6 +500,7 @@ struct xen_sysctl_pm_op {
         struct xen_get_cpufreq_para get_para;
         struct xen_set_cpufreq_gov  set_gov;
         struct xen_set_cpufreq_para set_para;
+        struct xen_set_cppc_para    set_cppc;
         uint64_aligned_t get_avgfreq;
         uint32_t                    set_sched_opt_smt;
 #define XEN_SYSCTL_CX_UNLIMITED 0xffffffff
-- 
2.40.1


