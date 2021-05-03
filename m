Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1ED372073
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121816.229793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeFS-0006Ab-7T; Mon, 03 May 2021 19:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121816.229793; Mon, 03 May 2021 19:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeFS-00069v-3J; Mon, 03 May 2021 19:28:54 +0000
Received: by outflank-mailman (input) for mailman id 121816;
 Mon, 03 May 2021 19:28:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeFQ-0005i5-JK
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:28:52 +0000
Received: from mail-qv1-xf2f.google.com (unknown [2607:f8b0:4864:20::f2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a172d8b-12a9-47aa-99e3-a987c7197e98;
 Mon, 03 May 2021 19:28:42 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id h3so3191784qve.13
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:42 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:41 -0700 (PDT)
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
X-Inumbo-ID: 2a172d8b-12a9-47aa-99e3-a987c7197e98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zxg8tmL3kR+kA95W5jp8RRRSYuidUeimNwqoUj/JiLc=;
        b=OTQJH6lAkxr/0mZotzGTfOrTZs9LaA1POMdgMjB7jyiSkmDZfcpbpZAEM0BcfddfLD
         Dw6RBH69CKalNwQBzEgpkD71Txqi6A51Dx8lo54SoFaM6dVnQah6+uKJJQF3bkX36mJF
         UPJqgrsccGunCV8P/J4xMrAkooV05O78kBAsUZDzMfcwN6bnKfmswcZok1VHbZBcfpxX
         tCafV/2XFQHgL1rQuBO/cClJvPtL5qc4NBZ4HIxWotg9JeNM7Dwd2kmUH8pm9VnjdqV7
         K1F0ulBKbmdXP8hDvfMXRBvFGAyKc2XPH3MKW2ORXqhpQxFJkWYzcHKr1ZTWeCtTOoVY
         iE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zxg8tmL3kR+kA95W5jp8RRRSYuidUeimNwqoUj/JiLc=;
        b=Pc2JJA0jzOBUbMqFu2VYa/+anPOqUCgWeBYTdxT61XnJvv+WEJNq6ycynm9f7sEGFT
         rwZSv9liNsz8wtnyWQmc71vwK3kB0iE6Hlg2e2r2o/rDjYQFETlZjF5dDqOAxiy02Dzy
         +BBAmvXTwIo3Wv5FtheQDSMkfd5VqWEiucINwEqfMJgOMI8m1DauMSdr4YyS42wWdKin
         gW+lowsgNXG6F3IlMsBKs5T8poki2Qw5iiIVKiXWSswVeM/AK+3u+KS4IXgM3B8TDXl+
         b8ooROwPU3dQfDCHkoD5jgI1DH9xpNj6KtQ0o5Q+8YMsjCs337D4nx3sCqBHe11hjFsy
         0Tww==
X-Gm-Message-State: AOAM532cCMpBJVfkg4J/qD1JU7JEv5yyBSN8L5TuSZbfpPF5iJpvjWzJ
	yQg0VqIeWyKxiJ76ICYJOmyZSc9Bzrk=
X-Google-Smtp-Source: ABdhPJzIZGwlNdJ88kvoudaoCZRg4pJghjAdxq+KJiFs4RJwCeJsWtKiGg7so4U+USFNQt5LqdFI0g==
X-Received: by 2002:a05:6214:2b0:: with SMTP id m16mr21927389qvv.4.1620070122177;
        Mon, 03 May 2021 12:28:42 -0700 (PDT)
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
Subject: [PATCH 06/13] cpufreq: Export HWP parameters to userspace
Date: Mon,  3 May 2021 15:28:03 -0400
Message-Id: <20210503192810.36084-7-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
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
index 1bae635101..3e35c42949 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -290,6 +290,12 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
             &op->u.get_para.u.ondemand.sampling_rate,
             &op->u.get_para.u.ondemand.up_threshold);
     }
+
+    if ( !strncasecmp(op->u.get_para.scaling_governor,
+                      "hwp-internal", CPUFREQ_NAME_LEN) )
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
2.30.2


