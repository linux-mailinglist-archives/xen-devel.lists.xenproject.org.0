Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC956F37C0
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:31:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528117.820959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEz-0004su-2k; Mon, 01 May 2023 19:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528117.820959; Mon, 01 May 2023 19:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEy-0004mj-Uw; Mon, 01 May 2023 19:31:16 +0000
Received: by outflank-mailman (input) for mailman id 528117;
 Mon, 01 May 2023 19:31:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZEx-0000m4-7L
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:31:15 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc136e52-e856-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:31:14 +0200 (CEST)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-3ef588dcf7aso30763471cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:31:14 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d6-20020ac80606000000b003bf9f9f1844sm9351784qth.71.2023.05.01.12.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:31:12 -0700 (PDT)
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
X-Inumbo-ID: bc136e52-e856-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969473; x=1685561473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO0WsYuSOYLWQPRYhV/xiXSnog1IJZfbXjjJjaPzhyY=;
        b=p6B+B6XpWfwKWnoxvpW5gtX5oGjDvEZdCLriLQQadIJV+J3ljmoPJcH4bPIuL2ucfz
         mtHlnETg0UUF5jByhu/mM9kCyYkjt9P0hrQo1BqQXzxoyHqAN/zU/4cLUegdhqJGFW3t
         QztH/fVaAxhlryJfCG8yyT2BR+q8MjaDHQ1k8RBkJvq7VwlkvwAzt64TqlMQRtaJLSlX
         B9OciZJscFFBbj8sJxWeij9ItpbyraeDBE61NstR0lmm+WYl7PVusJFMbrY+siLj8pf9
         Ra5w3MhcVc+FspJuTOmCPDMSjYTp6lK70LZtyG2s2KTPyCZWrz8TqB30M8y+BTPNtocN
         BQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969473; x=1685561473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YO0WsYuSOYLWQPRYhV/xiXSnog1IJZfbXjjJjaPzhyY=;
        b=QpuBVmnais08zJSPDCUqVlgC/Hx8zXpAmue0WlvQCqLNznlb47OM5qWwpvtHhJKgI3
         pNDIu5QQM5CZHmZV3zPIaAxs72097gv3hm9V/mMg8YO70MtNHHE7VJ16zpQBayUWkJf2
         wqYOcH7phRpoVtDvYEUeCqYruaVFGkKlCrSTIAXa2dBArn9H6lbKzTA8JtBkVRjiQV7I
         W05zriV0EnE09HlAoU5K58Ba9BMUrw+d7XiVXv8HhwF6b8Xo984uv722mJxNVoX1v6K6
         sy1ePIFiAeIONA0US/X9ZV0nffTXvml64BP8530FXkSbbzYxS4TXLgZi19kuxzvaKtPX
         DNaw==
X-Gm-Message-State: AC+VfDxcJS26HCAvfpwbsNFu1ysfH3FWzlwba98dHqpLmrzDOfv3NicB
	DOaBH6h6IRhYu4h37lRpPKWMuMHN0hE=
X-Google-Smtp-Source: ACHHUZ6b2qw5XxkOLyjOcqjlFfogIYKVNHV7rj6p+aoYwVx36V4SPAB0ZWkXmKy5FGmMsIXEVVUykQ==
X-Received: by 2002:a05:622a:13cc:b0:3ef:6c09:edcc with SMTP id p12-20020a05622a13cc00b003ef6c09edccmr23837085qtk.22.1682969472810;
        Mon, 01 May 2023 12:31:12 -0700 (PDT)
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
Subject: [PATCH v3 10/14 RESEND] xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
Date: Mon,  1 May 2023 15:30:30 -0400
Message-Id: <20230501193034.88575-11-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501193034.88575-1-jandryuk@gmail.com>
References: <20230501193034.88575-1-jandryuk@gmail.com>
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
 xen/arch/x86/acpi/cpufreq/hwp.c    | 96 ++++++++++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c          | 18 ++++++
 xen/include/acpi/cpufreq/cpufreq.h |  2 +
 xen/include/public/sysctl.h        | 30 ++++++++++
 4 files changed, 146 insertions(+)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index cb52918799..3d15875dc1 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -27,7 +27,9 @@ static bool feature_hdc;
 __initdata bool opt_cpufreq_hwp = false;
 __initdata bool opt_cpufreq_hdc = true;
 
+#define HWP_ENERGY_PERF_MAX_PERFORMANCE 0
 #define HWP_ENERGY_PERF_BALANCE         0x80
+#define HWP_ENERGY_PERF_MAX_POWERSAVE   0xff
 #define IA32_ENERGY_BIAS_BALANCE        0x7
 #define IA32_ENERGY_BIAS_MAX_POWERSAVE  0xf
 #define IA32_ENERGY_BIAS_MASK           0xf
@@ -531,6 +533,100 @@ int get_hwp_para(const struct cpufreq_policy *policy,
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
index 67fd9dabd4..12c76f5e57 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -398,6 +398,20 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
     return ret;
 }
 
+static int set_cpufreq_hwp(struct xen_sysctl_pm_op *op)
+{
+    struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
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
@@ -470,6 +484,10 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
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
index bf7e6594a7..3242472cbe 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -317,6 +317,34 @@ struct xen_hwp_para {
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
@@ -379,6 +407,7 @@ struct xen_sysctl_pm_op {
     #define SET_CPUFREQ_GOV            (CPUFREQ_PARA | 0x02)
     #define SET_CPUFREQ_PARA           (CPUFREQ_PARA | 0x03)
     #define GET_CPUFREQ_AVGFREQ        (CPUFREQ_PARA | 0x04)
+    #define SET_CPUFREQ_HWP            (CPUFREQ_PARA | 0x05)
 
     /* set/reset scheduler power saving option */
     #define XEN_SYSCTL_pm_op_set_sched_opt_smt    0x21
@@ -405,6 +434,7 @@ struct xen_sysctl_pm_op {
         struct xen_get_cpufreq_para get_para;
         struct xen_set_cpufreq_gov  set_gov;
         struct xen_set_cpufreq_para set_para;
+        struct xen_set_hwp_para     set_hwp;
         uint64_aligned_t get_avgfreq;
         uint32_t                    set_sched_opt_smt;
 #define XEN_SYSCTL_CX_UNLIMITED 0xffffffff
-- 
2.40.0


