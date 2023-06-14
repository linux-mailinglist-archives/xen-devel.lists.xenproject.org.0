Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3D9730694
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549126.857550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uqb-0008GZ-Lc; Wed, 14 Jun 2023 18:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549126.857550; Wed, 14 Jun 2023 18:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uqb-0008Dw-Gh; Wed, 14 Jun 2023 18:03:57 +0000
Received: by outflank-mailman (input) for mailman id 549126;
 Wed, 14 Jun 2023 18:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9Uqa-0005LA-IC
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:03:56 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d34dc8a1-0add-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 20:03:55 +0200 (CEST)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-5ed99ebe076so20968856d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:03:55 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:52 -0700 (PDT)
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
X-Inumbo-ID: d34dc8a1-0add-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765833; x=1689357833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uF8Wj46GTB4zKmfvuCCfVeswvcmmkhkf2knhpTgohUg=;
        b=IkDKOvKKl5vU1x2uhj2Gw+eeCWbPihqscD/s5K3RdP4VtDf2nyAr9ut6EkAk8mvopn
         hsx3vrYs5xK5YEU5Xz5BSljnmaeiGIQQzhI5O/++7/T3rWmizocyR44RYkZWPYT6gY13
         C99Q8FzB+/GQOVQRHn+JN72uaQsq51oGnNU06TKvhuagzTJI0V8jJqsN6PSzZuQB8tws
         QJl5Fk62SC5zcuZwsKEeXygAE39w8cimhQMNtAulEUrmBfXTOl+cfyA/BK2QYHIe08pK
         vZegIsbWgklsyDGnAOOL16tTW1ArKDaQZVshRBBLrfUJLsfhsg8l8GnkhPg0gi+O445L
         XT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765833; x=1689357833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uF8Wj46GTB4zKmfvuCCfVeswvcmmkhkf2knhpTgohUg=;
        b=MT9A+Px6XfJVo3n4jRhjoUW1HQVoAndn8GrbJ7zDkR2cZjlDVChss0YJXqAOwZOoNM
         49VFz/ggMk8Lyj9Z6BIYKjVXIQAPTt2B5n73gNcRd6r5VjzqNk+lzs65SQL/VTynS+rf
         H7wmMVIyKwLjw7AxR062NjQE4U22B0H1SyBK2DnammMLrvd3IYXWeok4Nd6hzTg+J58T
         0VB1IfLk2w23cr5RcGwZ31gcEadI/HK/wkm7dRkk8nLTVBs2FrNAsW5Izq78Xc3AjhWH
         lD2XCcBLuSpG8T6X1RuUY7Oa101n8W8cX96vpZe2w/LHLIYYx3VkX3cshmyxRLcHwxKP
         xaCw==
X-Gm-Message-State: AC+VfDxNjtuWJgyl4jgOA6Uc17PI4v/6lJc1RP92KeCUKgctLCaOzJ5n
	XK1GguEvCLh0oqWvT37G49w4pxXx6Vs=
X-Google-Smtp-Source: ACHHUZ78fPAF59pf1hisnYm84QCHRPh63yXRIYNML21YOpd3hr1AXgZlNoX4wTttmORx4HLvYP0F7A==
X-Received: by 2002:ad4:5c41:0:b0:62d:e9d5:336 with SMTP id a1-20020ad45c41000000b0062de9d50336mr14643490qva.41.1686765833314;
        Wed, 14 Jun 2023 11:03:53 -0700 (PDT)
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
Subject: [PATCH v4 09/15] cpufreq: Export HWP parameters to userspace as CPPC
Date: Wed, 14 Jun 2023 14:02:47 -0400
Message-Id: <20230614180253.89958-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend xen_get_cpufreq_para to return hwp parameters.  HWP is an
implementation of ACPI CPPC (Collaborative Processor Performance
Control).  Use the CPPC name since that might be useful in the future
for AMD P-state.

We need the features bitmask to indicate fields supported by the actual
hardware - this only applies to activity window for the time being.

The HWP most_efficient is mapped to CPPC lowest_nonlinear, and guaranteed is
mapped to nominal.  CPPC has a guaranteed that is optional while nominal
is required.  ACPI spec says "If this register is not implemented, OSPM
assumes guaranteed performance is always equal to nominal performance."

The use of uint8_t parameters matches the hardware size.  uint32_t
entries grows the sysctl_t past the build assertion in setup.c.  The
uint8_t ranges are supported across multiple generations, so hopefully
they won't change.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Style fixes
Don't bump XEN_SYSCTL_INTERFACE_VERSION
Drop cpufreq.h comment divider
Expand xen_hwp_para comment
Add HWP activity window mantissa/exponent defines
Handle union rename
Add const to get_hwp_para
Remove hw_ prefix from xen_hwp_para members
Use XEN_HWP_GOVERNOR
Use per_cpu for hwp_drv_data

v4:
Fixup for opt_cpufreq_hwp/hdc removal
get_hwp_para() takes cpu as arg
XEN_ prefix HWP_ACT_WINDOW_*
Drop HWP_ACT_WINDOW_EXPONENT_SHIFT - shift MASK
Remove Energy Bias (0-15) EPP fallback
Rename xen_hwp_para to xen_cppc_para
s/hwp/cppc/
Use scaling driver to switch output
---
 xen/arch/x86/acpi/cpufreq/hwp.c    | 23 +++++++++
 xen/drivers/acpi/pmstat.c          | 78 ++++++++++++++++--------------
 xen/include/acpi/cpufreq/cpufreq.h |  2 +
 xen/include/public/sysctl.h        | 56 +++++++++++++++++++++
 4 files changed, 123 insertions(+), 36 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 5f210b54ff..86c5793266 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -537,6 +537,29 @@ static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
     .update = hwp_cpufreq_update,
 };
 
+int get_hwp_para(const unsigned int cpu,
+                 struct xen_cppc_para *cppc_para)
+{
+    const struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+
+    if ( data == NULL )
+        return -EINVAL;
+
+    cppc_para->features         =
+        (feature_hwp_activity_window ? XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW : 0);
+    cppc_para->lowest           = data->hw.lowest;
+    cppc_para->lowest_nonlinear = data->hw.most_efficient;
+    cppc_para->nominal          = data->hw.guaranteed;
+    cppc_para->highest          = data->hw.highest;
+    cppc_para->minimum          = data->minimum;
+    cppc_para->maximum          = data->maximum;
+    cppc_para->desired          = data->desired;
+    cppc_para->energy_perf      = data->energy_perf;
+    cppc_para->activity_window  = data->activity_window;
+
+    return 0;
+}
+
 int __init hwp_register_driver(void)
 {
     return cpufreq_register_driver(&hwp_cpufreq_driver);
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 57359c21d8..10143c084c 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -251,48 +251,54 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    if ( !(scaling_available_governors =
-           xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
-        return -ENOMEM;
-    if ( (ret = read_scaling_available_governors(
-                    scaling_available_governors,
-                    gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
+    if ( !strncasecmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER,
+                      CPUFREQ_NAME_LEN) )
+        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
+    else
     {
+        if ( !(scaling_available_governors =
+               xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
+            return -ENOMEM;
+        if ( (ret = read_scaling_available_governors(
+                        scaling_available_governors,
+                        gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
+        {
+            xfree(scaling_available_governors);
+            return ret;
+        }
+        ret = copy_to_guest(op->u.get_para.scaling_available_governors,
+                    scaling_available_governors, gov_num * CPUFREQ_NAME_LEN);
         xfree(scaling_available_governors);
-        return ret;
-    }
-    ret = copy_to_guest(op->u.get_para.scaling_available_governors,
-                scaling_available_governors, gov_num * CPUFREQ_NAME_LEN);
-    xfree(scaling_available_governors);
-    if ( ret )
-        return ret;
+        if ( ret )
+            return ret;
 
-    op->u.get_para.u.s.scaling_cur_freq = policy->cur;
-    op->u.get_para.u.s.scaling_max_freq = policy->max;
-    op->u.get_para.u.s.scaling_min_freq = policy->min;
+        op->u.get_para.u.s.scaling_cur_freq = policy->cur;
+        op->u.get_para.u.s.scaling_max_freq = policy->max;
+        op->u.get_para.u.s.scaling_min_freq = policy->min;
 
-    if ( policy->governor->name[0] )
-        strlcpy(op->u.get_para.u.s.scaling_governor,
-            policy->governor->name, CPUFREQ_NAME_LEN);
-    else
-        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
-                CPUFREQ_NAME_LEN);
+        if ( policy->governor->name[0] )
+            strlcpy(op->u.get_para.u.s.scaling_governor,
+                policy->governor->name, CPUFREQ_NAME_LEN);
+        else
+            strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
+                    CPUFREQ_NAME_LEN);
 
-    /* governor specific para */
-    if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
-                      "userspace", CPUFREQ_NAME_LEN) )
-    {
-        op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
-    }
+        /* governor specific para */
+        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
+                          "userspace", CPUFREQ_NAME_LEN) )
+        {
+            op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
+        }
 
-    if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
-                      "ondemand", CPUFREQ_NAME_LEN) )
-    {
-        ret = get_cpufreq_ondemand_para(
-            &op->u.get_para.u.s.u.ondemand.sampling_rate_max,
-            &op->u.get_para.u.s.u.ondemand.sampling_rate_min,
-            &op->u.get_para.u.s.u.ondemand.sampling_rate,
-            &op->u.get_para.u.s.u.ondemand.up_threshold);
+        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
+                          "ondemand", CPUFREQ_NAME_LEN) )
+        {
+            ret = get_cpufreq_ondemand_para(
+                &op->u.get_para.u.s.u.ondemand.sampling_rate_max,
+                &op->u.get_para.u.s.u.ondemand.sampling_rate_min,
+                &op->u.get_para.u.s.u.ondemand.sampling_rate,
+                &op->u.get_para.u.s.u.ondemand.up_threshold);
+        }
     }
 
     return ret;
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 6ec7dbcbbb..fb655fac14 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -248,5 +248,7 @@ void intel_feature_detect(struct cpufreq_policy *policy);
 
 extern bool __initdata opt_cpufreq_hwp;
 int hwp_cmdline_parse(const char *s);
+int get_hwp_para(const unsigned int cpu,
+                 struct xen_cppc_para *cppc_para);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 08fe815329..5c9b60b5d0 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -296,6 +296,61 @@ struct xen_ondemand {
     uint32_t up_threshold;
 };
 
+struct xen_cppc_para {
+    /* OUT */
+    /* activity_window supported if 1 */
+#define XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW  (1 << 0)
+    uint32_t features; /* bit flags for features */
+    /*
+     * See Intel SDM: HWP Performance Range and Dynamic Capabilities
+     *
+     * These four are 0-255 hardware-provided values.  They "continuous,
+     * abstract unit-less, performance" values.  smaller numbers are slower
+     * and larger ones are faster.
+     */
+    uint32_t lowest;
+    uint32_t lowest_nonlinear; /* most_efficient */
+    uint32_t nominal; /* guaranteed */
+    uint32_t highest;
+    /*
+     * See Intel SDM: IA32_HWP_REQUEST MSR (Address: 774H Logical Processor
+     * Scope)
+     *
+     * These are all hints, and the processor may deviate outside of them.
+     * Values below are 0-255.
+     *
+     * minimum and maximum can be set to the above hardware values to constrain
+     * operation.  The full range 0-255 is accepted and will be clipped by
+     * hardware.
+     */
+    uint32_t minimum;
+    uint32_t maximum;
+    /*
+     * Set an explicit performance hint, disabling hardware selection.
+     * 0 lets the hardware decide.
+     */
+    uint32_t desired;
+    /*
+     * Hint to hardware for energy/performance preference.
+     * 0:   Performance
+     * 128: Balance (Default)
+     * 255: Powersaving
+     */
+    uint32_t energy_perf;
+    /*
+     * Activity Window is a moving history window for the processor's operation
+     * calculations, controlling responsiveness.  Measured in microseconds
+     * encoded as:
+     *
+     * bits 6:0   - 7bit mantissa
+     * bits 9:7   - 3bit base-10 exponent
+     * btis 15:10 - Unused - must be 0
+     */
+#define XEN_CPPC_ACT_WINDOW_MANTISSA_MASK  0x07f
+#define XEN_CPPC_ACT_WINDOW_EXPONENT_MASK  0x380
+    uint32_t activity_window;
+};
+
 #define XEN_HWP_DRIVER "hwp"
 /*
  * cpufreq para name of this structure named
@@ -332,6 +387,7 @@ struct xen_get_cpufreq_para {
                 struct  xen_ondemand ondemand;
             } u;
         } s;
+        struct xen_cppc_para cppc_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.40.1


