Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A996F37B1
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528111.820930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEs-0003cg-OW; Mon, 01 May 2023 19:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528111.820930; Mon, 01 May 2023 19:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEs-0003Z5-K5; Mon, 01 May 2023 19:31:10 +0000
Received: by outflank-mailman (input) for mailman id 528111;
 Mon, 01 May 2023 19:31:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZEq-000149-Vx
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:31:08 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7cb34ef-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:31:07 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-74e12e93384so121163085a.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:31:07 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d6-20020ac80606000000b003bf9f9f1844sm9351784qth.71.2023.05.01.12.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:31:04 -0700 (PDT)
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
X-Inumbo-ID: b7cb34ef-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969465; x=1685561465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJbA+BcuMsWkD5WxDhYLUpTvdE3qh/C4Qmxcz85bGeo=;
        b=nPWlTQA1AjIKcrvqph4r2lWQaecwmL0x3jr52qhY18Eh/tj6AwisM64Uf5AQI6tDP6
         +SHB6kT3hgPFzYFuPSiZdnezeuvRqRWklk6JbJwPnYXYJbiqijAAN73gfC6F2KQ72EM6
         S/WRuCg+Qj79DNx629ZznAmgIMCLFtAaTKnc/saoTH6BdXF/uSDpTQLtAL19IYtku7Qr
         TfzVmWYYvO2v2vCS6L9GfUYjTluKmU+tKekrWsmI0v37A1B6cVvfI5NwNK4xxvxBpOt8
         BlRjgQ7IhaWZBBqlScTZy3R7VDxW6QfZxKvbgKIcen7kq3fhlMEwWUIHssUGtO3tUD4/
         FUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969465; x=1685561465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJbA+BcuMsWkD5WxDhYLUpTvdE3qh/C4Qmxcz85bGeo=;
        b=cQx7lRyvtUz+bVqmhLqdnDXUM6eiKzVugVDf1Hcc8mqD0sJKGxtISdyegXLIGi9LT/
         egKYG4eKcRb0BNrBPoNBmvPt7OqWq+yTzbFoq5G90dnCERGupYN8tYhXGGdIe0CzBJ0T
         5UTEWvoRVmvg4Ii3ouaoeK5E8s8WIrgvrMEwU95iHdBjPeEN5mf6ckd+HzDmoHJvR/Mn
         gGc5aaBtbytUqEFedN3sg+HPTZGmLPgkSvDslA2ajeLiQvg+O3BEO4q7FE8w7cex9xrv
         JDilodbUH/M7JwiQyPum3O7tntvxqFyRtl8IfIAX+xh415bviSXs8JqaglpJGtVKhVBH
         LUsg==
X-Gm-Message-State: AC+VfDyVNDBtQv17JRHMam2wb/9ykLhrIk1dgkggIoSVtv8ezS7te8hG
	a5PZBod1xAPZlDIQk4kzU+nvnpAjTGA=
X-Google-Smtp-Source: ACHHUZ4yIAxtLHY8htulS6SPC+QNZq8i1LbhxAtAihfEzMKjPNr6hbZgwyHOFtp1cGuiuvKuMhWGew==
X-Received: by 2002:ac8:5e10:0:b0:3ef:34e1:d380 with SMTP id h16-20020ac85e10000000b003ef34e1d380mr24529806qtx.11.1682969465465;
        Mon, 01 May 2023 12:31:05 -0700 (PDT)
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
Subject: [PATCH v3 07/14 RESEND] cpufreq: Export HWP parameters to userspace
Date: Mon,  1 May 2023 15:30:27 -0400
Message-Id: <20230501193034.88575-8-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501193034.88575-1-jandryuk@gmail.com>
References: <20230501193034.88575-1-jandryuk@gmail.com>
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
index f84abe1386..cb52918799 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -506,6 +506,31 @@ static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
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
index b448f13b75..bf7e6594a7 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -292,6 +292,31 @@ struct xen_ondemand {
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
@@ -324,6 +349,7 @@ struct xen_get_cpufreq_para {
     union {
         struct  xen_userspace userspace;
         struct  xen_ondemand ondemand;
+        struct  xen_hwp_para hwp_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.40.0


