Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BB358F313
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383880.619145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPO-0007hi-Vt; Wed, 10 Aug 2022 19:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383880.619145; Wed, 10 Aug 2022 19:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPO-0007aE-RD; Wed, 10 Aug 2022 19:30:26 +0000
Received: by outflank-mailman (input) for mailman id 383880;
 Wed, 10 Aug 2022 19:30:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPN-00067E-NL
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:25 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e16f4b30-18e2-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 21:30:24 +0200 (CEST)
Received: by mail-qv1-xf2a.google.com with SMTP id j11so11706649qvt.10
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:24 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:22 -0700 (PDT)
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
X-Inumbo-ID: e16f4b30-18e2-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=oNA3OUefEtpoG+cuOAW7lfiq629QCTVrL+PJWqyEDAU=;
        b=h9zUJXTkGdYO0GMd0SimjPJDn7vqpELKtdImO3vNhMX2MuY3hszB5Pj+J+F6px5kiB
         gbZK9cmbdGiKNXFm5HK9dRKj+56l1VGVmd8Z/ilIPtluoUYsec9RGNCiPZf44PlCiRad
         jzFaM7xNGCWwF4oKBtpCcySFNRm/gd4tXayiROi6bZrOAtxRPTIyQypXGbQ8fE1boVEg
         H9AZ/Lx563a5xujFzbMMf5nEWaD4caQntveXCsmNFkLlhfRXt0vRGWbLHbwirU2KJ5Qu
         LpDbVzwBmnfAbFKDUMjgkScgzUDJKSGhDdWzDifMV9SE5/beAbP+luLNpKlxNNzC8c/J
         XtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=oNA3OUefEtpoG+cuOAW7lfiq629QCTVrL+PJWqyEDAU=;
        b=21VdFZWkqMPvZBgf/rHpDPB81eohaADlWDSB87UK6WU1icC9ZXtNhh6F3HsocuwpDD
         5lMuddt7a5pBzJFBrzf+Hhyl7SWVQ/9MLs8/THGf8fT/38ZBy6k7uvSNDwbbnw6uIEaM
         YgUU8Om1TKlloyuefOuxKnMW1iAsg/bZIcJFp2LTIVIUw4Up9Bg0zlcM8B2G/AVCvC7F
         OEAendKe9kXx1a6BK+wK/EMNTe/RFlEQJsxDdHA8/F1XbYCWdNoI0Q821/aRZIK/Agoa
         Cz4dngM9z7ghw+tm7oULiX1ojbiTKoaMua1WJa9WSeW4HCzKHo+QHcixNWX0mO0Unc9w
         A39A==
X-Gm-Message-State: ACgBeo2DnWrS7vNVaLk4yrE5NSTwt2O2Yq6vPAFyLrBho6xx9mOiXsIo
	mbjlr2FMf1uMqObvKboSXsH5JwMguac=
X-Google-Smtp-Source: AA6agR597Y3Z1Db2tIHP+bgACUqju5yRmkN2rOmAbGPHe4lw+QIIFKOWssCXmwUtFYFyMKFYspglmw==
X-Received: by 2002:a05:6214:e41:b0:473:915c:3efe with SMTP id o1-20020a0562140e4100b00473915c3efemr25215103qvc.10.1660159823436;
        Wed, 10 Aug 2022 12:30:23 -0700 (PDT)
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
Subject: [PATCH v2 06/13] cpufreq: Export HWP parameters to userspace
Date: Wed, 10 Aug 2022 15:29:37 -0400
Message-Id: <20220810192944.102135-7-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend xen_get_cpufreq_para to return hwp parameters.  These match the
hardware rather closely.

We need the features bitmask to indicated fields supported by the actual
hardware.

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
---
 xen/arch/x86/acpi/cpufreq/hwp.c    | 25 +++++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c          |  5 +++++
 xen/include/acpi/cpufreq/cpufreq.h |  2 ++
 xen/include/public/sysctl.h        | 26 ++++++++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 405cbae334..233089b6c9 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -500,6 +500,31 @@ static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
     .update = hwp_cpufreq_update,
 };
 
+int get_hwp_para(const struct cpufreq_policy *policy,
+                 struct xen_hwp_para *hwp_para)
+{
+    unsigned int cpu = policy->cpu;
+    const struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+
+    if ( data == NULL )
+        return -EINVAL;
+
+    hwp_para->features        =
+        (feature_hwp_activity_window ? XEN_SYSCTL_HWP_FEAT_ACT_WINDOW  : 0) |
+        (feature_hwp_energy_perf     ? XEN_SYSCTL_HWP_FEAT_ENERGY_PERF : 0);
+    hwp_para->lowest          = data->hw.lowest;
+    hwp_para->most_efficient  = data->hw.most_efficient;
+    hwp_para->guaranteed      = data->hw.guaranteed;
+    hwp_para->highest         = data->hw.highest;
+    hwp_para->minimum         = data->minimum;
+    hwp_para->maximum         = data->maximum;
+    hwp_para->energy_perf     = data->energy_perf;
+    hwp_para->activity_window = data->activity_window;
+    hwp_para->desired         = data->desired;
+
+    return 0;
+}
+
 int __init hwp_register_driver(void)
 {
     return cpufreq_register_driver(&hwp_cpufreq_driver);
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 1bae635101..67fd9dabd4 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -290,6 +290,11 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
             &op->u.get_para.u.ondemand.sampling_rate,
             &op->u.get_para.u.ondemand.up_threshold);
     }
+
+    if ( !strncasecmp(op->u.get_para.scaling_governor, XEN_HWP_GOVERNOR,
+                      CPUFREQ_NAME_LEN) )
+        ret = get_hwp_para(policy, &op->u.get_para.u.hwp_para);
+
     op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
 
     return ret;
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 29a712a4f1..92b4c7e79c 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -247,5 +247,7 @@ void intel_feature_detect(struct cpufreq_policy *policy);
 
 extern bool opt_cpufreq_hwp;
 extern bool opt_cpufreq_hdc;
+int get_hwp_para(const struct cpufreq_policy *policy,
+                 struct xen_hwp_para *hwp_para);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 3d6dd14377..12a7a7db29 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -316,6 +316,31 @@ struct xen_ondemand {
     uint32_t up_threshold;
 };
 
+struct xen_hwp_para {
+    /*
+     * bits 6:0   - 7bit mantissa
+     * bits 9:7   - 3bit base-10 exponent
+     * btis 15:10 - Unused - must be 0
+     */
+#define HWP_ACT_WINDOW_MANTISSA_MASK  0x7f
+#define HWP_ACT_WINDOW_EXPONENT_MASK  0x7
+#define HWP_ACT_WINDOW_EXPONENT_SHIFT 7
+    uint16_t activity_window;
+    /* energy_perf range 0-255 if 1. Otherwise 0-15 */
+#define XEN_SYSCTL_HWP_FEAT_ENERGY_PERF (1 << 0)
+    /* activity_window supported if 1 */
+#define XEN_SYSCTL_HWP_FEAT_ACT_WINDOW  (1 << 1)
+    uint8_t features; /* bit flags for features */
+    uint8_t lowest;
+    uint8_t most_efficient;
+    uint8_t guaranteed;
+    uint8_t highest;
+    uint8_t minimum;
+    uint8_t maximum;
+    uint8_t desired;
+    uint8_t energy_perf;
+};
+
 #define XEN_HWP_GOVERNOR "hwp-internal"
 /*
  * cpufreq para name of this structure named
@@ -348,6 +373,7 @@ struct xen_get_cpufreq_para {
     union {
         struct  xen_userspace userspace;
         struct  xen_ondemand ondemand;
+        struct  xen_hwp_para hwp_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.37.1


