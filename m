Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5A374A400
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:55:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559985.875552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8r-0007J5-2D; Thu, 06 Jul 2023 18:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559985.875552; Thu, 06 Jul 2023 18:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8q-0007Cv-Jx; Thu, 06 Jul 2023 18:55:48 +0000
Received: by outflank-mailman (input) for mailman id 559985;
 Thu, 06 Jul 2023 18:55:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU8p-0003x0-6F
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:55:47 +0000
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6062e8e-1c2e-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 20:55:45 +0200 (CEST)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6b5d6a05b6dso912886a34.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:55:45 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:42 -0700 (PDT)
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
X-Inumbo-ID: b6062e8e-1c2e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669743; x=1691261743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeS/hmy10nz4aQykj0+Uw88/Yi5kbVY8pjPL/tcCOMQ=;
        b=gtMbL1byL9r5kQz4Fo46/iY/OKMCNrd5M2IQA2Wjh3svqmst4yZrwITfXgQtBzs4B8
         XQCcurWAH84U68X675WIm+AvC2x38zP8ccNfcxnCHhnh1eBgGx8sTpP+GGI3tdF3JEE6
         47+gBRyICKyZhy/DmhR7r2kUClK1GWgilwwtWXNxJULdnJLjVPpBKoLg0bK5N8kOy8pT
         z5HBDu5/Mx6oQN6BX4gK7nLL8Ae1dWt7UEgtauOXEUsbEQqXERkPI9hHG9Z0iSPUlVRL
         OuMqOpezXVbbnkREfboLByl6l0YL/dx/nKH7tGyZgU28U0elB5SVk72pW83tYE2lXZ4K
         gbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669743; x=1691261743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeS/hmy10nz4aQykj0+Uw88/Yi5kbVY8pjPL/tcCOMQ=;
        b=EFeoB7ee4UGGNp+WJxHu/LI2dncceBWDAyLS5cXcpDZsYS1vavyIBwc3OVPxc0lbrb
         qEAdK9ZMAfawdLYiVE7KlFP8yfBp/yBIZfjO+7qg7E8u9wSh4MLrXLd+GFlJahZ7ExPX
         enCL5ugmCbmpi8vpO/m69Q7Sdi2sDRK6DTlVWVDm4hBjwW8LS+jswIMJv5jTx+Wjwo26
         InaeFYceoRjkDpPQ9PV2c3dsWJmKngDql3JGuh+OEVyRoQ8BnSPNpyn2Hhu0oCrokCgc
         PJVRVqzi66hfEWicG9p/2Wa9xkF1BbT/S/g2SxUsZUjJpTEAnPYAvBIASX/zu9GpH9sM
         5QtA==
X-Gm-Message-State: ABy/qLatqTY2np5drtnkqmYgyzAvUKo6CtGFuDbW3VcYfSGxyTnY+zjx
	g3FIRWaTl78/38aYaM6DEr4GdNZ9Jvo=
X-Google-Smtp-Source: APBJJlHIR0YGsSPD1RKw0+RBFa980aVwxHoVDMzZrJY7bfraGqOVfFA/7G4ZF6G2E2sCjUewNhJaMw==
X-Received: by 2002:a05:6358:4308:b0:134:d26c:4a97 with SMTP id r8-20020a056358430800b00134d26c4a97mr3204325rwc.23.1688669743000;
        Thu, 06 Jul 2023 11:55:43 -0700 (PDT)
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
Subject: [PATCH v5 09/15] cpufreq: Export HWP parameters to userspace as CPPC
Date: Thu,  6 Jul 2023 14:54:34 -0400
Message-ID: <20230706185440.48333-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
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
---
 xen/arch/x86/acpi/cpufreq/hwp.c    | 23 ++++++++++
 xen/drivers/acpi/pmstat.c          | 74 ++++++++++++++++--------------
 xen/include/acpi/cpufreq/cpufreq.h |  2 +
 xen/include/public/sysctl.h        | 56 ++++++++++++++++++++++
 4 files changed, 121 insertions(+), 34 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index ce897d566f..50b66a0449 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -508,6 +508,29 @@ static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
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
index d67d99e62f..f674ef51aa 100644
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
+                        gov_num * CPUFREQ_NAME_LEN *
+                            sizeof(*scaling_available_governors) )) )
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
index ccbd6ea4c5..c5636edf0e 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -254,5 +254,7 @@ void intel_feature_detect(struct cpufreq_policy *policy);
 int hwp_cmdline_parse(const char *s, const char *e);
 int hwp_register_driver(void);
 bool hwp_active(void);
+int get_hwp_para(unsigned int cpu,
+                 struct xen_cppc_para *cppc_para);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 59700b02f2..a5f8369116 100644
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
+     * These four are 0-255 hardware-provided values.  They "continuous,
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


