Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75AD372086
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121847.229854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeLV-0007ab-5n; Mon, 03 May 2021 19:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121847.229854; Mon, 03 May 2021 19:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeLV-0007a2-1s; Mon, 03 May 2021 19:35:09 +0000
Received: by outflank-mailman (input) for mailman id 121847;
 Mon, 03 May 2021 19:35:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeFp-0005i5-KA
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:29:17 +0000
Received: from mail-qv1-xf35.google.com (unknown [2607:f8b0:4864:20::f35])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7961687f-6128-4146-ae23-04d37fbfe793;
 Mon, 03 May 2021 19:28:52 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id h1so2412836qvv.10
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:52 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:50 -0700 (PDT)
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
X-Inumbo-ID: 7961687f-6128-4146-ae23-04d37fbfe793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SA2GZ9hF2Qvi9qam8q5O9Sh0EYcwTdRBSgnWrRejxiQ=;
        b=K7QccnrtgPJmjHYg6sNoXTWMoj+Vc0zwioEjc6/VfQ+P0fQm0cm07QvcejGvl0LYkp
         bjiUU8UfMyEa2DA+5i2PnVXzdLx0eH0sfJhMkV7ivzXalX07OeohPWBpbK66CkPG1qKs
         uak6gkfwR3PBhDcfrkQ1ZwJHMJ0vjnkN9rPc3P4dHTar58C+p+kfMGtAdkN7aevBVBl0
         G3CaB18hkpLlvhi1jUxxOXu5GDRk3c/BtzZSmfpSBOIcl189O6xwIoLOmDW0ga3u92tb
         3z0OsWME0xR6HW2gcMLZGtMvXsvnz6MI3Ub6yBnR4rRwncBZFkQHN/7Gmro27zlmJAiL
         /qRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SA2GZ9hF2Qvi9qam8q5O9Sh0EYcwTdRBSgnWrRejxiQ=;
        b=UKJTV6rSV43TJ4DuLtWHCyVKZ2FEdIEh13BSkHe9V9M1oGfxqeXEFmHiLtpTXTCkfw
         qP7VUx+uD8cjSznOjq41BvcarV2GQB/ZzXlroaNEy7nvJLAQ/EY37FXZ5ZP2s29v72oi
         b4BhbDx6FiPxqvBdNtGFCzPWPnyJ39bjfnZg5V2Q691IhDsQPEHUWdJuZVrtbMF6BM6u
         QNj69LLNJ5An45pNJbGa0oxDx43nCPuDK5Nqq7QlnmgNIk9kM0TGsj2uu0bEsgxiZb4z
         Lb9wg8zQgxSgUsq0qaWifHvFTzAUJwU1zGYXgaIJC7TnH+eC8ixZZi4SMqFXvKFoqMju
         QK+Q==
X-Gm-Message-State: AOAM532Z+/mgz6mxzkvjMFLrv2PFRD0COGoOfb62I4MpWtoufWXV/Fy5
	no0Dn+BEJLsbxYE74aiQOOET1hMpMsU=
X-Google-Smtp-Source: ABdhPJz+bMqGsKQPk/vjNNXpvY12fF1VAf59hcwKRvYkQrYHSjWtbGiQ8W9IwjoiBfMqfMcklYxxug==
X-Received: by 2002:ad4:59c7:: with SMTP id el7mr21549307qvb.26.1620070131409;
        Mon, 03 May 2021 12:28:51 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 09/13] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
Date: Mon,  3 May 2021 15:28:06 -0400
Message-Id: <20210503192810.36084-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SET_CPUFREQ_HWP xen_sysctl_pm_op to set HWP parameters.  The sysctl
supports setting multiple values simultaneously as indicated by the
set_params bits.  This allows atomically applying new HWP configuration
via a single wrmsr.

XEN_SYSCTL_HWP_SET_PRESET_BALANCE/PERFORMANCE/POWERSAVE provide three
common presets.  Setting them depends on hardware limits which the
hypervisor is already caching.  So using them allows skipping a
hypercall to query the limits (hw_lowest/highest) to then set those same
values.  The code is organized to allow a preset to be refined with
additional stuff if desired.

"most_efficient" and "guaranteed" could be additional presets in the
future, but the are not added now.  Those levels can change at runtime,
but we don't have code in place to monitor and update for those events.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/arch/x86/acpi/cpufreq/hwp.c    | 114 +++++++++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c          |  24 ++++++
 xen/include/acpi/cpufreq/cpufreq.h |   2 +
 xen/include/public/sysctl.h        |  32 ++++++++
 4 files changed, 172 insertions(+)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 92222d6d85..0fd70d76a8 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -547,6 +547,120 @@ int get_hwp_para(struct cpufreq_policy *policy, struct xen_hwp_para *hwp_para)
     return 0;
 }
 
+int set_hwp_para(struct cpufreq_policy *policy,
+                 struct xen_set_hwp_para *set_hwp)
+{
+    unsigned int cpu = policy->cpu;
+    struct hwp_drv_data *data = hwp_drv_data[cpu];
+
+    if ( data == NULL )
+        return -EINVAL;
+
+    /* Validate all parameters first */
+    if ( set_hwp->set_params & ~XEN_SYSCTL_HWP_SET_PARAM_MASK )
+    {
+        hwp_err("Invalid bits in hwp set_params %u\n",
+                set_hwp->set_params);
+
+        return -EINVAL;
+    }
+
+    if ( set_hwp->activity_window & ~XEN_SYSCTL_HWP_ACT_WINDOW_MASK )
+    {
+        hwp_err("Invalid bits in activity window %u\n",
+                set_hwp->activity_window);
+
+        return -EINVAL;
+    }
+
+    if ( !feature_hwp_energy_perf &&
+         set_hwp->set_params & XEN_SYSCTL_HWP_SET_ENERGY_PERF &&
+         set_hwp->energy_perf > 0xf )
+    {
+        hwp_err("energy_perf %u out of range for IA32_ENERGY_PERF_BIAS\n",
+                set_hwp->energy_perf);
+
+        return -EINVAL;
+    }
+
+    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_DESIRED &&
+         set_hwp->desired != 0 &&
+         ( set_hwp->desired < data->hw_lowest ||
+           set_hwp->desired > data->hw_highest ) )
+    {
+        hwp_err("hwp desired %u is out of range (%u ... %u)\n",
+                set_hwp->desired, data->hw_lowest, data->hw_highest);
+
+        return -EINVAL;
+    }
+
+    /*
+     * minimum & maximum are not validated as hardware doesn't seem to care
+     * and the SDM says CPUs will clip internally.
+     */
+
+    /* Apply presets */
+    switch ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_PRESET_MASK )
+    {
+    case XEN_SYSCTL_HWP_SET_PRESET_POWERSAVE:
+        data->minimum = data->hw_lowest;
+        data->maximum = data->hw_lowest;
+        data->activity_window = 0;
+        if ( feature_hwp_energy_perf )
+            data->energy_perf = 0xff;
+        else
+            data->energy_perf = 0xf;
+        data->desired = 0;
+        break;
+    case XEN_SYSCTL_HWP_SET_PRESET_PERFORMANCE:
+        data->minimum = data->hw_highest;
+        data->maximum = data->hw_highest;
+        data->activity_window = 0;
+        data->energy_perf = 0;
+        data->desired = 0;
+        break;
+    case XEN_SYSCTL_HWP_SET_PRESET_BALANCE:
+        data->minimum = data->hw_lowest;
+        data->maximum = data->hw_highest;
+        data->activity_window = 0;
+        data->energy_perf = 0x80;
+        if ( feature_hwp_energy_perf )
+            data->energy_perf = 0x80;
+        else
+            data->energy_perf = 0x7;
+        data->desired = 0;
+        break;
+    case XEN_SYSCTL_HWP_SET_PRESET_NONE:
+        break;
+    default:
+        printk("HWP: Invalid preset value: %u\n",
+               set_hwp->set_params & XEN_SYSCTL_HWP_SET_PRESET_MASK);
+
+        return -EINVAL;
+    }
+
+    /* Further customize presets if needed */
+    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_MINIMUM )
+        data->minimum = set_hwp->minimum;
+
+    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_MAXIMUM )
+        data->maximum = set_hwp->maximum;
+
+    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_ENERGY_PERF )
+        data->energy_perf = set_hwp->energy_perf;
+
+    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_DESIRED )
+        data->desired = set_hwp->desired;
+
+    if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_ACT_WINDOW )
+        data->activity_window = set_hwp->activity_window &
+                                XEN_SYSCTL_HWP_ACT_WINDOW_MASK;
+
+    hwp_cpufreq_target(policy, 0, 0);
+
+    return 0;
+}
+
 int hwp_register_driver(void)
 {
     int ret;
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 3e35c42949..016b0445ec 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -318,6 +318,24 @@ static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
     return __cpufreq_set_policy(old_policy, &new_policy);
 }
 
+static int set_cpufreq_hwp(struct xen_sysctl_pm_op *op)
+{
+    struct cpufreq_policy *policy;
+
+    if ( !cpufreq_governor_internal )
+        return -EINVAL;
+
+    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
+
+    if ( !policy || !policy->governor )
+        return -EINVAL;
+
+    if ( strncasecmp(policy->governor->name, "hwp-internal", CPUFREQ_NAME_LEN) )
+        return -EINVAL;
+
+    return set_hwp_para(policy, &op->u.set_hwp);
+}
+
 static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
 {
     int ret = 0;
@@ -465,6 +483,12 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
         break;
     }
 
+    case SET_CPUFREQ_HWP:
+    {
+        ret = set_cpufreq_hwp(op);
+        break;
+    }
+
     case SET_CPUFREQ_PARA:
     {
         ret = set_cpufreq_para(op);
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 42146ca2cf..7ff7d0d4bb 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -248,5 +248,7 @@ void cpufreq_dbs_timer_resume(void);
 
 /********************** hwp hypercall helper *************************/
 int get_hwp_para(struct cpufreq_policy *policy, struct xen_hwp_para *hwp_para);
+int set_hwp_para(struct cpufreq_policy *policy,
+                 struct xen_set_hwp_para *set_hwp);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 1a6c6397ea..3f18a3d522 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -318,6 +318,36 @@ struct xen_hwp_para {
     uint8_t energy_perf;
 };
 
+/* set multiple values simultaneously when set_args bit is set */
+struct xen_set_hwp_para {
+    uint16_t set_params; /* bitflags for valid values */
+#define XEN_SYSCTL_HWP_SET_DESIRED              (1U << 0)
+#define XEN_SYSCTL_HWP_SET_ENERGY_PERF          (1U << 1)
+#define XEN_SYSCTL_HWP_SET_ACT_WINDOW           (1U << 2)
+#define XEN_SYSCTL_HWP_SET_MINIMUM              (1U << 3)
+#define XEN_SYSCTL_HWP_SET_MAXIMUM              (1U << 4)
+#define XEN_SYSCTL_HWP_SET_PRESET_MASK          (0xf000)
+#define XEN_SYSCTL_HWP_SET_PRESET_NONE          (0x0000)
+#define XEN_SYSCTL_HWP_SET_PRESET_BALANCE       (0x1000)
+#define XEN_SYSCTL_HWP_SET_PRESET_POWERSAVE     (0x2000)
+#define XEN_SYSCTL_HWP_SET_PRESET_PERFORMANCE   (0x3000)
+#define XEN_SYSCTL_HWP_SET_PARAM_MASK ((uint16_t)( \
+                                  XEN_SYSCTL_HWP_SET_PRESET_MASK | \
+                                  XEN_SYSCTL_HWP_SET_DESIRED     | \
+                                  XEN_SYSCTL_HWP_SET_ENERGY_PERF | \
+                                  XEN_SYSCTL_HWP_SET_ACT_WINDOW  | \
+                                  XEN_SYSCTL_HWP_SET_MINIMUM     | \
+                                  XEN_SYSCTL_HWP_SET_MAXIMUM     ))
+
+    uint16_t activity_window; /* 7bit mantissa and 3bit exponent */
+#define XEN_SYSCTL_HWP_ACT_WINDOW_MASK          (0x03ff)
+    uint8_t minimum;
+    uint8_t maximum;
+    uint8_t desired;
+    uint8_t energy_perf; /* 0-255 or 0-15 depending on HW support */
+};
+
+
 /*
  * cpufreq para name of this structure named
  * same as sysfs file name of native linux
@@ -379,6 +409,7 @@ struct xen_sysctl_pm_op {
     #define SET_CPUFREQ_GOV            (CPUFREQ_PARA | 0x02)
     #define SET_CPUFREQ_PARA           (CPUFREQ_PARA | 0x03)
     #define GET_CPUFREQ_AVGFREQ        (CPUFREQ_PARA | 0x04)
+    #define SET_CPUFREQ_HWP            (CPUFREQ_PARA | 0x05)
 
     /* set/reset scheduler power saving option */
     #define XEN_SYSCTL_pm_op_set_sched_opt_smt    0x21
@@ -405,6 +436,7 @@ struct xen_sysctl_pm_op {
         struct xen_get_cpufreq_para get_para;
         struct xen_set_cpufreq_gov  set_gov;
         struct xen_set_cpufreq_para set_para;
+        struct xen_set_hwp_para     set_hwp;
         uint64_aligned_t get_avgfreq;
         uint32_t                    set_sched_opt_smt;
 #define XEN_SYSCTL_CX_UNLIMITED 0xffffffff
-- 
2.30.2


