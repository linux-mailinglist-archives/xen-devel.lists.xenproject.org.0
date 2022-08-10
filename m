Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3B758F317
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383893.619179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPX-0000b0-Ez; Wed, 10 Aug 2022 19:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383893.619179; Wed, 10 Aug 2022 19:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPX-0000Vk-62; Wed, 10 Aug 2022 19:30:35 +0000
Received: by outflank-mailman (input) for mailman id 383893;
 Wed, 10 Aug 2022 19:30:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPW-0005rf-2A
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:34 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5bcb100-18e2-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 21:30:32 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id e28so3916602qts.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:32 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:29 -0700 (PDT)
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
X-Inumbo-ID: e5bcb100-18e2-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=P4DHnPs04M49UGm1RCAoIcdB9bRr1CaBP0xbsg4cF5o=;
        b=Crxk3M5J3ets7+XOb0sdwE4VxWh+gUIf5a5ZaidWk5CZSxln7toj7dp0umjDEpKpks
         dOPXniPalO0SHN6wYHQKdXTCSOtROqdJF6Exqvnfr0OaiZ9Hhp/MiBe3007fGv/GkM8l
         O5EOR+yQRcXk+NQoUy8IOovBd3aofkjY64XGAhkZoGICTnkiPMMrlnRmdHjFWrMcLo5L
         KkLCoxT/7rxCAvPLmKLWZhXcKR2j5AXmpw7WoiXsXnm8BJ/BmYmBSysKSxUr/Dscd0Gx
         YtkIAMijb6sShds5pfCCKU45o6IaxiddHikym8t5huzhXrS2UXKL8lcLdIh+5as4kgA1
         ggow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=P4DHnPs04M49UGm1RCAoIcdB9bRr1CaBP0xbsg4cF5o=;
        b=4JWL0PYOCMTeLTn5dXS0SZRh3lrJ36FC3QEFKHzGXqemc4ond8p0GQVPrsBmEKuu5s
         dMEhaWFfvbF1NmfNwUZsrvbadQUx+K4thijHArJ28kt7q97QTEDsLCwFQ/D671AYOV0R
         anUXXgYRaUs2CRhnyYU1/Vq/z49O2+umH6EdhvoJi52scH6TFLl51UX9p9tG9DjaSl/n
         FyprvqT1/EdGIGEuxf45XgL3sefgZzLH6h+xdNDBeF8isyoe8Jc/0WG4sDzswbdrZzCJ
         rLehUW1cv+BI2dh0SIqNCEtl1iDZMICAJWNfsg91r8sNEr6z04dNfP+vJYt7woCLYn6n
         uTSw==
X-Gm-Message-State: ACgBeo2tO/FCVQefoOPJpxeVZMJ3UQh1A2URwOfSOXI2Z5AXlv0rRx/O
	ufkS7JYqrw9upw0sOgx5FVVkqjE/lY0=
X-Google-Smtp-Source: AA6agR5mPFEwjA1NEpP4R+XOX2tCYNEaGu2dx5jNneksQstJ1gm4udxvsXelcDD/YAp3dmZr/MnL/A==
X-Received: by 2002:a05:622a:174e:b0:343:202:4e55 with SMTP id l14-20020a05622a174e00b0034302024e55mr11569015qtk.81.1660159830572;
        Wed, 10 Aug 2022 12:30:30 -0700 (PDT)
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
Subject: [PATCH v2 09/13] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
Date: Wed, 10 Aug 2022 15:29:40 -0400
Message-Id: <20220810192944.102135-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
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
 xen/arch/x86/acpi/cpufreq/hwp.c    | 96 ++++++++++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c          | 23 +++++++
 xen/include/acpi/cpufreq/cpufreq.h |  2 +
 xen/include/public/sysctl.h        | 30 ++++++++++
 4 files changed, 151 insertions(+)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 233089b6c9..2466933407 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -25,7 +25,9 @@ static bool feature_hdc;
 __initdata bool opt_cpufreq_hwp = false;
 __initdata bool opt_cpufreq_hdc = true;
 
+#define HWP_ENERGY_PERF_MAX_PERFORMANCE 0
 #define HWP_ENERGY_PERF_BALANCE         0x80
+#define HWP_ENERGY_PERF_MAX_POWERSAVE   0xff
 #define IA32_ENERGY_BIAS_BALANCE        0x7
 #define IA32_ENERGY_BIAS_MAX_POWERSAVE  0xf
 #define IA32_ENERGY_BIAS_MASK           0xf
@@ -525,6 +527,100 @@ int get_hwp_para(const struct cpufreq_policy *policy,
     return 0;
 }
 
+int set_hwp_para(struct cpufreq_policy *policy,
+                 struct xen_set_hwp_para *set_hwp)
+{
+    unsigned int cpu = policy->cpu;
+    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+
+    if ( data == NULL )
+        return -EINVAL;
+
+    /* Validate all parameters first */
+    if ( set_hwp->set_params & ~XEN_SYSCTL_HWP_SET_PARAM_MASK )
+        return -EINVAL;
+
+    if ( set_hwp->activity_window & ~XEN_SYSCTL_HWP_ACT_WINDOW_MASK )
+        return -EINVAL;
+
+    if ( !feature_hwp_energy_perf &&
+         (set_hwp->set_params & XEN_SYSCTL_HWP_SET_ENERGY_PERF) &&
+         set_hwp->energy_perf > IA32_ENERGY_BIAS_MAX_POWERSAVE )
+        return -EINVAL;
+
+    if ( (set_hwp->set_params & XEN_SYSCTL_HWP_SET_DESIRED) &&
+         set_hwp->desired != 0 &&
+         (set_hwp->desired < data->hw.lowest ||
+          set_hwp->desired > data->hw.highest) )
+        return -EINVAL;
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
+        data->minimum = data->hw.lowest;
+        data->maximum = data->hw.lowest;
+        data->activity_window = 0;
+        if ( feature_hwp_energy_perf )
+            data->energy_perf = HWP_ENERGY_PERF_MAX_POWERSAVE;
+        else
+            data->energy_perf = IA32_ENERGY_BIAS_MAX_POWERSAVE;
+        data->desired = 0;
+        break;
+
+    case XEN_SYSCTL_HWP_SET_PRESET_PERFORMANCE:
+        data->minimum = data->hw.highest;
+        data->maximum = data->hw.highest;
+        data->activity_window = 0;
+        data->energy_perf = HWP_ENERGY_PERF_MAX_PERFORMANCE;
+        data->desired = 0;
+        break;
+
+    case XEN_SYSCTL_HWP_SET_PRESET_BALANCE:
+        data->minimum = data->hw.lowest;
+        data->maximum = data->hw.highest;
+        data->activity_window = 0;
+        if ( feature_hwp_energy_perf )
+            data->energy_perf = HWP_ENERGY_PERF_BALANCE;
+        else
+            data->energy_perf = IA32_ENERGY_BIAS_BALANCE;
+        data->desired = 0;
+        break;
+
+    case XEN_SYSCTL_HWP_SET_PRESET_NONE:
+        break;
+
+    default:
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
 int __init hwp_register_driver(void)
 {
     return cpufreq_register_driver(&hwp_cpufreq_driver);
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 67fd9dabd4..55e2b285b5 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -398,6 +398,25 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
     return ret;
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
+    if ( strncasecmp(policy->governor->name, XEN_HWP_GOVERNOR,
+                     CPUFREQ_NAME_LEN) )
+        return -EINVAL;
+
+    return set_hwp_para(policy, &op->u.set_hwp);
+}
+
 int do_pm_op(struct xen_sysctl_pm_op *op)
 {
     int ret = 0;
@@ -470,6 +489,10 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
         break;
     }
 
+    case SET_CPUFREQ_HWP:
+        ret = set_cpufreq_hwp(op);
+        break;
+
     case GET_CPUFREQ_AVGFREQ:
     {
         op->u.get_avgfreq = cpufreq_driver_getavg(op->cpuid, USR_GETAVG);
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 92b4c7e79c..b8831b2cd3 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -249,5 +249,7 @@ extern bool opt_cpufreq_hwp;
 extern bool opt_cpufreq_hdc;
 int get_hwp_para(const struct cpufreq_policy *policy,
                  struct xen_hwp_para *hwp_para);
+int set_hwp_para(struct cpufreq_policy *policy,
+                 struct xen_set_hwp_para *set_hwp);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 12a7a7db29..08e25e15a6 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -341,6 +341,34 @@ struct xen_hwp_para {
     uint8_t energy_perf;
 };
 
+/* set multiple values simultaneously when set_args bit is set */
+struct xen_set_hwp_para {
+#define XEN_SYSCTL_HWP_SET_DESIRED              (1U << 0)
+#define XEN_SYSCTL_HWP_SET_ENERGY_PERF          (1U << 1)
+#define XEN_SYSCTL_HWP_SET_ACT_WINDOW           (1U << 2)
+#define XEN_SYSCTL_HWP_SET_MINIMUM              (1U << 3)
+#define XEN_SYSCTL_HWP_SET_MAXIMUM              (1U << 4)
+#define XEN_SYSCTL_HWP_SET_PRESET_MASK          0xf000
+#define XEN_SYSCTL_HWP_SET_PRESET_NONE          0x0000
+#define XEN_SYSCTL_HWP_SET_PRESET_BALANCE       0x1000
+#define XEN_SYSCTL_HWP_SET_PRESET_POWERSAVE     0x2000
+#define XEN_SYSCTL_HWP_SET_PRESET_PERFORMANCE   0x3000
+#define XEN_SYSCTL_HWP_SET_PARAM_MASK ( \
+                                  XEN_SYSCTL_HWP_SET_PRESET_MASK | \
+                                  XEN_SYSCTL_HWP_SET_DESIRED     | \
+                                  XEN_SYSCTL_HWP_SET_ENERGY_PERF | \
+                                  XEN_SYSCTL_HWP_SET_ACT_WINDOW  | \
+                                  XEN_SYSCTL_HWP_SET_MINIMUM     | \
+                                  XEN_SYSCTL_HWP_SET_MAXIMUM     )
+    uint16_t set_params; /* bitflags for valid values */
+#define XEN_SYSCTL_HWP_ACT_WINDOW_MASK          0x03ff
+    uint16_t activity_window; /* See comment in struct xen_hwp_para */
+    uint8_t minimum;
+    uint8_t maximum;
+    uint8_t desired;
+    uint8_t energy_perf; /* 0-255 or 0-15 depending on HW support */
+};
+
 #define XEN_HWP_GOVERNOR "hwp-internal"
 /*
  * cpufreq para name of this structure named
@@ -403,6 +431,7 @@ struct xen_sysctl_pm_op {
     #define SET_CPUFREQ_GOV            (CPUFREQ_PARA | 0x02)
     #define SET_CPUFREQ_PARA           (CPUFREQ_PARA | 0x03)
     #define GET_CPUFREQ_AVGFREQ        (CPUFREQ_PARA | 0x04)
+    #define SET_CPUFREQ_HWP            (CPUFREQ_PARA | 0x05)
 
     /* set/reset scheduler power saving option */
     #define XEN_SYSCTL_pm_op_set_sched_opt_smt    0x21
@@ -429,6 +458,7 @@ struct xen_sysctl_pm_op {
         struct xen_get_cpufreq_para get_para;
         struct xen_set_cpufreq_gov  set_gov;
         struct xen_set_cpufreq_para set_para;
+        struct xen_set_hwp_para     set_hwp;
         uint64_aligned_t get_avgfreq;
         uint32_t                    set_sched_opt_smt;
 #define XEN_SYSCTL_CX_UNLIMITED 0xffffffff
-- 
2.37.1


