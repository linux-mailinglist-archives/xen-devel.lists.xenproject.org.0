Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFD8772E55
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578851.906599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Py-0003uw-83; Mon, 07 Aug 2023 18:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578851.906599; Mon, 07 Aug 2023 18:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Py-0003re-4s; Mon, 07 Aug 2023 18:57:26 +0000
Received: by outflank-mailman (input) for mailman id 578851;
 Mon, 07 Aug 2023 18:57:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5L8-0004GT-NT
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:52:26 +0000
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [2607:f8b0:4864:20::f29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b6ba4ac-3553-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 20:52:23 +0200 (CEST)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-63cf7cce5fbso34440726d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:52:23 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:52:21 -0700 (PDT)
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
X-Inumbo-ID: 8b6ba4ac-3553-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434342; x=1692039142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AOfN7Z9EVFLpJCkggYGDmqtmD+BO0lXy28fP8LpUWIs=;
        b=MiT8Aw+NG79O5MeG4oXEc4pSKAtjJwI8Nu69a04vUx48j5W1BdyxlNDr79683Vp+HR
         IXjUu8GoYlSl0vZFFUHw8YGdvVn8pr24sF5deCNZgy/KaU0dvdz1dJUoIq8+uvmZibLm
         GN33UrjmVbV8okClX7zSeAj/PGF8hHLc6UF+1WvyHMGAYjzjdT8xlMqClrbngtKrAxig
         siMzvNpiKt9HvV+7MmZ/ZhHTfZi6rBkQKK9oza9huO9dYmcM+6rPbjwFYQ9C/21C3cAl
         axqXCwEeif/qVJuqHBFXKVorarL36RtpZuODXMwV+ER+HlDWFsBmD1k6/4c1Nb95Z6uq
         Swcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434342; x=1692039142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AOfN7Z9EVFLpJCkggYGDmqtmD+BO0lXy28fP8LpUWIs=;
        b=S+V+azszrrEwO2rVMNUXAuXGwVMGHZm/lD4wpJ4qAsCgQmaOUXOXCudqOaAMNzZUHe
         Z5/NN6fzipFNepJ0583+p9Fs7gLrjT68y6k2vHLH1I7ITWYzwke3Ex0cBaRuMaupzWaC
         oCLSDjzcOmJ6+a6g+CZPP6bfI6sVk1dGG4xlj6gzTN+EcS4ALzZ2QpsI4F3nyOcwUi2e
         mPnea6dbXeWjXunR7tYZ6ZBySRD0zML0KgvwqTNRhvgqLbtz2Ab6d2Et4ii20JaSFXRN
         W+v1jC59m7ImGbailTINrSTNuae0a3JoPpW2i/eAntqUR79SWjqlg1QR/1GFj2KmUYQu
         hTDQ==
X-Gm-Message-State: AOJu0YwXD3R08aYUbt6fUvsAktDxpWoGGOYxyAAQguH5EeHxBqkXsi50
	1ZIW/niBfjFW/EwJXHIL+O1NA+V0VIM=
X-Google-Smtp-Source: AGHT+IFjjVG/Vb02rgE6PdI73vVmx0JX8EBV/Oopw5OaqGQYQCXg/GCuq/s5EL06eGXNzza5MxwhRg==
X-Received: by 2002:a05:6214:15cf:b0:632:207d:b834 with SMTP id p15-20020a05621415cf00b00632207db834mr9586248qvz.58.1691434342145;
        Mon, 07 Aug 2023 11:52:22 -0700 (PDT)
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
Subject: [PATCH v8 12/15] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
Date: Mon,  7 Aug 2023 14:51:16 -0400
Message-ID: <20230807185119.98333-13-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
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
additional parameters if desired.

"most_efficient" and "guaranteed" could be additional presets in the
future, but the are not added now.  Those levels can change at runtime,
but we don't have code in place to monitor and update for those events.

Since activity window may not be supported by all hardware, omit writing
it when not supported, and return that fact to userspace by updating
set_params.

CPPC parameter checking disallows setting reserved bytes and ensure
values are only non-zero when the corresponding set_params bit is set.
There is no range checking (0-255 is allowed) since hardware is
documented to clip internally.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v7:
Fix brace placement
Add Jan's R-b

v6:
Add () around bit test
Add U suffix to XEN_SYSCTL_ constants
Change -EINVAL returns to -ENOENT/-EOPNOTSUPP
Return success for no-op set_hwp_para()

v5:
Use cpufreq.h for include
Add () around bit test
Fix Configure typo
Drop duplicated energy_perf comment
Define XEN_SYSCTL_CPPC_ACT_WINDOW_MASK from *_MANTISSA_MASK and *_EXPONENT_MASK
Re-order XEN_SYSCTL_CPPC_SET_* flags to match field and hardware order.
Remove const from set_cppc param to update set_params
Skip Activity Window if not supported by hardware and clear set_params
Make parameter parsing consistent
Add an exit path when there are no parameters to write.
Expand the header file to cover the IN/OUT set_params.
Remove the "desired" lowest/highest checking as hardware clips internally

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
 xen/arch/x86/acpi/cpufreq/hwp.c    | 102 +++++++++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c          |  17 +++++
 xen/include/acpi/cpufreq/cpufreq.h |   2 +
 xen/include/public/sysctl.h        |  64 ++++++++++++++++++
 4 files changed, 185 insertions(+)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 92fa01b8ea..620149243d 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -21,6 +21,10 @@ static bool __ro_after_init feature_hdc;
 
 static bool __ro_after_init opt_cpufreq_hdc = true;
 
+#define HWP_ENERGY_PERF_MAX_PERFORMANCE 0
+#define HWP_ENERGY_PERF_BALANCE         0x80
+#define HWP_ENERGY_PERF_MAX_POWERSAVE   0xff
+
 union hwp_request
 {
     struct
@@ -542,6 +546,104 @@ int get_hwp_para(unsigned int cpu,
     return 0;
 }
 
+int set_hwp_para(struct cpufreq_policy *policy,
+                 struct xen_set_cppc_para *set_cppc)
+{
+    unsigned int cpu = policy->cpu;
+    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+    bool cleared_act_window = false;
+
+    if ( data == NULL )
+        return -ENOENT;
+
+    /* Validate all parameters - Disallow reserved bits. */
+    if ( set_cppc->minimum > 255 ||
+         set_cppc->maximum > 255 ||
+         set_cppc->desired > 255 ||
+         set_cppc->energy_perf > 255 ||
+         (set_cppc->set_params & ~XEN_SYSCTL_CPPC_SET_PARAM_MASK) ||
+         (set_cppc->activity_window & ~XEN_SYSCTL_CPPC_ACT_WINDOW_MASK) )
+        return -EINVAL;
+
+    /* Only allow values if params bit is set. */
+    if ( (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED) &&
+          set_cppc->desired) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
+          set_cppc->minimum) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
+          set_cppc->maximum) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF) &&
+          set_cppc->energy_perf) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
+          set_cppc->activity_window) )
+        return -EINVAL;
+
+    /* Clear out activity window if lacking HW supported. */
+    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW) &&
+         !feature_hwp_activity_window )
+    {
+        set_cppc->set_params &= ~XEN_SYSCTL_CPPC_SET_ACT_WINDOW;
+        cleared_act_window = true;
+    }
+
+    /* Return if there is nothing to do. */
+    if ( set_cppc->set_params == 0 )
+        return 0;
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
     int ret;
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index e4e2df94a7..85097d463c 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -400,6 +400,19 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
     return ret;
 }
 
+static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
+{
+    struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
+
+    if ( !policy || !policy->governor )
+        return -ENOENT;
+
+    if ( !hwp_active() )
+        return -EOPNOTSUPP;
+
+    return set_hwp_para(policy, &op->u.set_cppc);
+}
+
 int do_pm_op(struct xen_sysctl_pm_op *op)
 {
     int ret = 0;
@@ -472,6 +485,10 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
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
index f90e9d3a6c..281e3f513d 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -257,5 +257,7 @@ int hwp_register_driver(void);
 bool hwp_active(void);
 int get_hwp_para(unsigned int cpu,
                  struct xen_cppc_para *cppc_para);
+int set_hwp_para(struct cpufreq_policy *policy,
+                 struct xen_set_cppc_para *set_cppc);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index cf27f8f2f9..3975050248 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -351,6 +351,68 @@ struct xen_cppc_para {
     uint32_t activity_window;
 };
 
+/*
+ * Set CPPC values.
+ *
+ * Configure the parameters for CPPC.  Set bits in set_params control which
+ * values are applied.  If a bit is not set in set_params, the field must be
+ * zero.
+ *
+ * For HWP specifically, values must be limited to 0-255 or within
+ * XEN_SYSCTL_CPPC_ACT_WINDOW_MASK for activity window.  Set bits outside the
+ * range will be returned as -EINVAL.
+ *
+ * Activity Window may not be supported by the hardware.  In that case, the
+ * returned set_params will clear XEN_SYSCTL_CPPC_SET_ACT_WINDOW to indicate
+ * that it was not applied - though the rest of the values will be applied.
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
+#define XEN_SYSCTL_CPPC_SET_MINIMUM              (1U << 0)
+#define XEN_SYSCTL_CPPC_SET_MAXIMUM              (1U << 1)
+#define XEN_SYSCTL_CPPC_SET_DESIRED              (1U << 2)
+#define XEN_SYSCTL_CPPC_SET_ENERGY_PERF          (1U << 3)
+#define XEN_SYSCTL_CPPC_SET_ACT_WINDOW           (1U << 4)
+#define XEN_SYSCTL_CPPC_SET_PRESET_MASK          0xf0000000U
+#define XEN_SYSCTL_CPPC_SET_PRESET_NONE          0x00000000U
+#define XEN_SYSCTL_CPPC_SET_PRESET_BALANCE       0x10000000U
+#define XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE     0x20000000U
+#define XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE   0x30000000U
+#define XEN_SYSCTL_CPPC_SET_PARAM_MASK \
+        (XEN_SYSCTL_CPPC_SET_PRESET_MASK | \
+         XEN_SYSCTL_CPPC_SET_MINIMUM     | \
+         XEN_SYSCTL_CPPC_SET_MAXIMUM     | \
+         XEN_SYSCTL_CPPC_SET_DESIRED     | \
+         XEN_SYSCTL_CPPC_SET_ENERGY_PERF | \
+         XEN_SYSCTL_CPPC_SET_ACT_WINDOW  )
+    /* IN/OUT */
+    uint32_t set_params; /* bitflags for valid values */
+    /* See comments in struct xen_cppc_para. */
+    /* IN */
+    uint32_t minimum;
+    uint32_t maximum;
+    uint32_t desired;
+    uint32_t energy_perf;
+#define XEN_SYSCTL_CPPC_ACT_WINDOW_MASK (XEN_CPPC_ACT_WINDOW_MANTISSA_MASK | \
+                                         XEN_CPPC_ACT_WINDOW_EXPONENT_MASK)
+    uint32_t activity_window;
+};
+
 #define XEN_HWP_DRIVER_NAME "hwp"
 
 /*
@@ -418,6 +480,7 @@ struct xen_sysctl_pm_op {
     #define SET_CPUFREQ_GOV            (CPUFREQ_PARA | 0x02)
     #define SET_CPUFREQ_PARA           (CPUFREQ_PARA | 0x03)
     #define GET_CPUFREQ_AVGFREQ        (CPUFREQ_PARA | 0x04)
+    #define SET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x05)
 
     /* set/reset scheduler power saving option */
     #define XEN_SYSCTL_pm_op_set_sched_opt_smt    0x21
@@ -444,6 +507,7 @@ struct xen_sysctl_pm_op {
         struct xen_get_cpufreq_para get_para;
         struct xen_set_cpufreq_gov  set_gov;
         struct xen_set_cpufreq_para set_para;
+        struct xen_set_cppc_para    set_cppc;
         uint64_aligned_t get_avgfreq;
         uint32_t                    set_sched_opt_smt;
 #define XEN_SYSCTL_CX_UNLIMITED 0xffffffffU
-- 
2.41.0


