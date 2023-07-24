Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E29775F7CA
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568932.889136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvHU-0002Wn-Vy; Mon, 24 Jul 2023 13:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568932.889136; Mon, 24 Jul 2023 13:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvHU-0002Uy-Sq; Mon, 24 Jul 2023 13:07:20 +0000
Received: by outflank-mailman (input) for mailman id 568932;
 Mon, 24 Jul 2023 13:07:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNvA9-0003BP-Gs
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:45 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f488429c-2a21-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:59:42 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7673180224bso286927985a.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:42 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:40 -0700 (PDT)
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
X-Inumbo-ID: f488429c-2a21-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203581; x=1690808381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lOhLHK6n7gDw0RiXQnnSlKqHxuCkhhczBtcl+i5sew4=;
        b=kJr07GRPShb+8/G78tHfwSntXH4s9n0PtX2zJwj2moxuU3J30W63G7hmPrC18vNB6O
         +5mc55P9vXO+0UvsBV1AXU4vEgk82BnSyheTwECDSKs3b5Uue/7DtxL4Q0ZJFDsSxrgd
         IwBUDim3GrtlNjX1wFNoxb1652UX98GFSRCA8R67oI31vJC39wKzbQpVMo8PtOaVV7tc
         UC34FLhlnEO/45MnXXaIkoTXadCygsJuULazBfSWKvUnFpdDG0PCyEJwhYzcAqhOxL+k
         oflP6ED5Zb2VCNUngP3rFt3CQb1GrByIQSEZiMxB2v6ZFzU+YCgrPhQE0BYqWfzCwz7g
         I18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203581; x=1690808381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lOhLHK6n7gDw0RiXQnnSlKqHxuCkhhczBtcl+i5sew4=;
        b=Yy79YIJVhcLuinwaZaEuvwWXt7IBgjurhbVlV3fGXh/qTVn3FQjYNU3sYNlv1DOErn
         scAu8cGwpkvxdoSaeFIssohwc7552cIFaKV5p+0xsxJ6JuMB+sPz/lovmececdR3mwLd
         Gaqx9Li8xK4LtJ/XjSlhg9dNMsw8NUpELVDXjA51b38jBYypr9udlUD1huXWpYrcgwTD
         aGDBk38KzXJ2hTbImVlbPMLISN7gT5PtWwz5Fb5iyH60ldCgGLCpiT/NRjjKiY+rYCRH
         EECxUXL6dwp7liNriLWPsCqjqkE+IgOA3Up2CiLpfl4Zhdz9Lyi5PhhZ+WvopQKjF+Kc
         4K4Q==
X-Gm-Message-State: ABy/qLawIM00L/30RYeLo/0rG/FUS9i95n+CBF5iDZcBfWnUGaQs38jv
	Mp+i5CDrT7hjtQlbIc/M3Ijb262Ne94=
X-Google-Smtp-Source: APBJJlFFK2/uArp/TlJqYh5u0Jctt8z9KycKNM8HjEyNeFgoxwfavV7nPCZPb0YgLXgGCAIC4xgS/w==
X-Received: by 2002:a05:622a:156:b0:402:4bf3:7f41 with SMTP id v22-20020a05622a015600b004024bf37f41mr9051029qtw.29.1690203580882;
        Mon, 24 Jul 2023 05:59:40 -0700 (PDT)
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
Subject: [PATCH v6 09/15] cpufreq: Export HWP parameters to userspace as CPPC
Date: Mon, 24 Jul 2023 08:58:51 -0400
Message-ID: <20230724125857.11133-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724125857.11133-1-jandryuk@gmail.com>
References: <20230724125857.11133-1-jandryuk@gmail.com>
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

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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

v5:
Use XEN_HWP_DRIVER_NAME
Use cpufreq.h for declarations
Fixup some comments
Drop const from unsigned int cpu
Drop some unnecessary { }
Use strncmp
Switch sizeof(char) to sizeof(*scaling_available_governors)
Reindent copy_to_guest call
Add "HWP: " prefix to sysctl comments for cppc->hwp mapping

v6:
Drop commit message uint8_t paragraph
sysctl.h s/They/They're/
Fix indent and add parens for read_scaling_available_governors() args
Add Jan's Ack
---
 xen/arch/x86/acpi/cpufreq/hwp.c    | 23 ++++++++++
 xen/drivers/acpi/pmstat.c          | 74 ++++++++++++++++--------------
 xen/include/acpi/cpufreq/cpufreq.h |  2 +
 xen/include/public/sysctl.h        | 56 ++++++++++++++++++++++
 4 files changed, 121 insertions(+), 34 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 662e719039..0dad23e330 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -516,6 +516,29 @@ static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
     .update = hwp_cpufreq_update,
 };
 
+int get_hwp_para(unsigned int cpu,
+                 struct xen_cppc_para *cppc_para)
+{
+    const struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+
+    if ( data == NULL )
+        return -ENODATA;
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
     int ret;
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index d67d99e62f..e4e2df94a7 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -251,46 +251,52 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    if ( !(scaling_available_governors =
-           xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
-        return -ENOMEM;
-    if ( (ret = read_scaling_available_governors(scaling_available_governors,
-                gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
+    if ( !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
+                      CPUFREQ_NAME_LEN) )
+        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
+    else
     {
+        if ( !(scaling_available_governors =
+               xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
+            return -ENOMEM;
+        if ( (ret = read_scaling_available_governors(
+                        scaling_available_governors,
+                        (gov_num * CPUFREQ_NAME_LEN *
+                         sizeof(*scaling_available_governors)))) )
+        {
+            xfree(scaling_available_governors);
+            return ret;
+        }
+        ret = copy_to_guest(op->u.get_para.scaling_available_governors,
+                            scaling_available_governors,
+                            gov_num * CPUFREQ_NAME_LEN);
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
-        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown", CPUFREQ_NAME_LEN);
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
+            op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
 
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
+            ret = get_cpufreq_ondemand_para(
+                &op->u.get_para.u.s.u.ondemand.sampling_rate_max,
+                &op->u.get_para.u.s.u.ondemand.sampling_rate_min,
+                &op->u.get_para.u.s.u.ondemand.sampling_rate,
+                &op->u.get_para.u.s.u.ondemand.up_threshold);
     }
 
     return ret;
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 6737798e25..f90e9d3a6c 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -255,5 +255,7 @@ void intel_feature_detect(struct cpufreq_policy *policy);
 int hwp_cmdline_parse(const char *s, const char *e);
 int hwp_register_driver(void);
 bool hwp_active(void);
+int get_hwp_para(unsigned int cpu,
+                 struct xen_cppc_para *cppc_para);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 5a30b16fcf..cf27f8f2f9 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -296,6 +296,61 @@ struct xen_ondemand {
     uint32_t up_threshold;
 };
 
+struct xen_cppc_para {
+    /* OUT */
+    /* activity_window supported if set */
+#define XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW  (1 << 0)
+    uint32_t features; /* bit flags for features */
+    /*
+     * See Intel SDM: HWP Performance Range and Dynamic Capabilities
+     *
+     * These four are 0-255 hardware-provided values.  They're "continuous,
+     * abstract unit-less, performance" values.  Smaller numbers are slower
+     * and larger ones are faster.
+     */
+    uint32_t lowest;
+    uint32_t lowest_nonlinear; /* HWP: most_efficient */
+    uint32_t nominal; /* HWP: guaranteed */
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
+     * An explicit performance hint, disabling hardware selection.
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
 #define XEN_HWP_DRIVER_NAME "hwp"
 
 /*
@@ -333,6 +388,7 @@ struct xen_get_cpufreq_para {
                 struct  xen_ondemand ondemand;
             } u;
         } s;
+        struct xen_cppc_para cppc_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.41.0


