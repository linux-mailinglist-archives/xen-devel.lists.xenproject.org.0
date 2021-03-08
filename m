Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E693318FC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 22:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95089.179427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1i-0006mx-6d; Mon, 08 Mar 2021 21:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95089.179427; Mon, 08 Mar 2021 21:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1i-0006mV-30; Mon, 08 Mar 2021 21:02:54 +0000
Received: by outflank-mailman (input) for mailman id 95089;
 Mon, 08 Mar 2021 21:02:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odrr=IG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJN1g-0006P0-J2
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 21:02:52 +0000
Received: from mail-qk1-x731.google.com (unknown [2607:f8b0:4864:20::731])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16c4f119-6cfd-4363-b387-aa9243d33cb4;
 Mon, 08 Mar 2021 21:02:35 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id l4so10891012qkl.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 13:02:35 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a33e:daa7:46a1:a7eb])
 by smtp.gmail.com with ESMTPSA id
 r2sm8514070qti.4.2021.03.08.13.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:02:34 -0800 (PST)
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
X-Inumbo-ID: 16c4f119-6cfd-4363-b387-aa9243d33cb4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=URsm1yOuvp1SQ/7X/KtWhiPzCJKRQEYt//4KlQf0Bnc=;
        b=eDfuLm1Hvfmvh4pBO+nYR/75TocdTJ81qDRPc7rGYnK8fud2auS2N7XRHOPTk5bg91
         6lHO9sYXeVZHQVs/D8e9FWR8IXB3hnUGOsAbNWBZkAJGHRpR2mEilLasmdpjLHQ6F35S
         gVpqLT0oCysUoOtLQi4OY2LCdE8moGlCKa2vhm4osNA/kpRyHvfqCSoB6v5DVoZDIB7x
         vEowajRT3a7ztF7YGdFvX+FM9LOB3ARPEapGC5tvTjnEtdA/l2xSX4cxT1+d/aouXE0v
         WRTo+ZfgTev9qwuY9ZEP5fQMZuUT//H367YyICw9Ue0yEqfFuHmbzNZfn3bHgOWKcalg
         /hMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=URsm1yOuvp1SQ/7X/KtWhiPzCJKRQEYt//4KlQf0Bnc=;
        b=pdgkwC2z5g9Xynns4qxum7US5xrYhOMfmw6jrWn5z72jDPziPMX1EaAhBtDfI2NHCx
         6vLo59chi6V/VzBj/Y+CmP3ltIjoJ2CPDFw9mh0SkdsAlYy3GWmASl9Pl/XkQMHqcJsh
         LS7hlvqvBnWH77hRuNLLfPY3Dj74q6vrqPJQPazQMdUzDbzNnez0DK4IBAmoPLJDpQx8
         47P1WcQiiOlxuScSvwNsXHdPkt441cGQzIdLwbek4G8q/m3Zc80jgtaiirPov4uXKVZc
         XRenVxsesJIf8zid5hv7moWzF85nVRcOHd6ZQM565mJQegBryFBSohGr7tJCPs4uRKz0
         gb8A==
X-Gm-Message-State: AOAM531TcIggsYNrz7aFQP+6W49/su/u6Vm/aOwt08NzXT9Txq3dLjTl
	A0AVeAB1yJlaEfeLditG0kk9TkHg0UQ=
X-Google-Smtp-Source: ABdhPJy5hyPJly4pN5b+0G4ry9ay0NRrqf8uwMD/OcP5ZVaVBeGf/cvkzt//bzPRlZYop2dmt/enOg==
X-Received: by 2002:a37:8506:: with SMTP id h6mr22178160qkd.134.1615237354971;
        Mon, 08 Mar 2021 13:02:34 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pawel@invisiblethingslab.com,
	marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC 06/12] cpufreq: Export HWP parameters to userspace
Date: Mon,  8 Mar 2021 16:02:04 -0500
Message-Id: <20210308210210.116278-7-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308210210.116278-1-jandryuk@gmail.com>
References: <20210308210210.116278-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend xen_get_cpufreq_para to return hwp parameters.  These match the
hardware rather closely.

We need the hw_features bitmask to indicated fields supported by the
actual hardware.

The use of uint8_t parameters matches the hardware size.  uint32_t
entries grows the sysctl_t past the build assertion in setup.c.  The
uint8_t ranges are supported across multiple generations, so hopefully
they won't change.

Increment XEN_SYSCTL_INTERFACE_VERSION for the new fields.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/arch/x86/acpi/cpufreq/hwp.c    | 24 ++++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c          |  6 ++++++
 xen/include/acpi/cpufreq/cpufreq.h |  3 +++
 xen/include/public/sysctl.h        | 20 +++++++++++++++++++-
 4 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index f8e6fdbd41..92222d6d85 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -523,6 +523,30 @@ static const struct cpufreq_driver __initconstrel hwp_cpufreq_driver =
     .update = hwp_cpufreq_update,
 };
 
+int get_hwp_para(struct cpufreq_policy *policy, struct xen_hwp_para *hwp_para)
+{
+    unsigned int cpu = policy->cpu;
+    struct hwp_drv_data *data = hwp_drv_data[cpu];
+
+    if ( data == NULL )
+        return -EINVAL;
+
+    hwp_para->hw_feature        =
+        feature_hwp_activity_window ? XEN_SYSCTL_HWP_FEAT_ACT_WINDOW  : 0 |
+        feature_hwp_energy_perf     ? XEN_SYSCTL_HWP_FEAT_ENERGY_PERF : 0;
+    hwp_para->hw_lowest         = data->hw_lowest;
+    hwp_para->hw_most_efficient = data->hw_most_efficient;
+    hwp_para->hw_guaranteed     = data->hw_guaranteed;
+    hwp_para->hw_highest        = data->hw_highest;
+    hwp_para->minimum           = data->minimum;
+    hwp_para->maximum           = data->maximum;
+    hwp_para->energy_perf       = data->energy_perf;
+    hwp_para->activity_window   = data->activity_window;
+    hwp_para->desired           = data->desired;
+
+    return 0;
+}
+
 int hwp_register_driver(void)
 {
     int ret;
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 2f528f9ca3..4c6ae5d768 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -290,6 +290,12 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
             &op->u.get_para.u.ondemand.sampling_rate,
             &op->u.get_para.u.ondemand.up_threshold);
     }
+
+    if ( !strnicmp(op->u.get_para.scaling_governor,
+                   "hwp-internal", CPUFREQ_NAME_LEN) )
+    {
+        ret = get_hwp_para(policy, &op->u.get_para.u.hwp_para);
+    }
     op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
 
     return ret;
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index b91859ce5d..42146ca2cf 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -246,4 +246,7 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
 void cpufreq_dbs_timer_suspend(void);
 void cpufreq_dbs_timer_resume(void);
 
+/********************** hwp hypercall helper *************************/
+int get_hwp_para(struct cpufreq_policy *policy, struct xen_hwp_para *hwp_para);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 039ccf885c..1a6c6397ea 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -35,7 +35,7 @@
 #include "domctl.h"
 #include "physdev.h"
 
-#define XEN_SYSCTL_INTERFACE_VERSION 0x00000013
+#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
 
 /*
  * Read console content from Xen buffer ring.
@@ -301,6 +301,23 @@ struct xen_ondemand {
     uint32_t up_threshold;
 };
 
+struct xen_hwp_para {
+    uint16_t activity_window; /* 7bit mantissa and 3bit exponent */
+#define XEN_SYSCTL_HWP_FEAT_ENERGY_PERF (1 << 0) /* energy_perf range 0-255 if
+                                                    1. Otherwise 0-15 */
+#define XEN_SYSCTL_HWP_FEAT_ACT_WINDOW  (1 << 1) /* activity_window supported
+                                                    if 1 */
+    uint8_t hw_feature; /* bit flags for features */
+    uint8_t hw_lowest;
+    uint8_t hw_most_efficient;
+    uint8_t hw_guaranteed;
+    uint8_t hw_highest;
+    uint8_t minimum;
+    uint8_t maximum;
+    uint8_t desired;
+    uint8_t energy_perf;
+};
+
 /*
  * cpufreq para name of this structure named
  * same as sysfs file name of native linux
@@ -332,6 +349,7 @@ struct xen_get_cpufreq_para {
     union {
         struct  xen_userspace userspace;
         struct  xen_ondemand ondemand;
+        struct  xen_hwp_para hwp_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.29.2


