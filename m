Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED3C3318F9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 22:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95083.179392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1T-0006Y2-11; Mon, 08 Mar 2021 21:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95083.179392; Mon, 08 Mar 2021 21:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1S-0006XQ-TA; Mon, 08 Mar 2021 21:02:38 +0000
Received: by outflank-mailman (input) for mailman id 95083;
 Mon, 08 Mar 2021 21:02:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odrr=IG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJN1R-0006P0-IZ
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 21:02:37 +0000
Received: from mail-qt1-x82c.google.com (unknown [2607:f8b0:4864:20::82c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba2d4011-d9e8-42b6-befe-ff8a00d9df07;
 Mon, 08 Mar 2021 21:02:29 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id r24so8632480qtt.8
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 13:02:29 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a33e:daa7:46a1:a7eb])
 by smtp.gmail.com with ESMTPSA id
 r2sm8514070qti.4.2021.03.08.13.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:02:28 -0800 (PST)
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
X-Inumbo-ID: ba2d4011-d9e8-42b6-befe-ff8a00d9df07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/v3gx4Dpg1dN3dSgA3Eor7lGHSmiomkDY5L/9HqLLB8=;
        b=ccptF4NoVHXSWqJNceo7Twvm2jsdZVS02K7G5ejVkRhfqJyTwyy3QgbkYvCYWy2Ma+
         FSyoCOWDLdO5Ama9hIe2ZbbiA2m7Pe8hg9PrZoTu0ffmOSDFhc3oL8GGvVsq7+6yxbFd
         VQ+/LoyPWBvyFQCDp0XhyKJiRac1b9Mhh9EvLQsERVAqt5t7+4Wn8WwWQSHEgDtz6Yt4
         AaeUHDG5FVdncGRec+rK/EHVJpCq2wz+ET4r446T76XLafR4AgXwYQSaLwQIR48iWzwN
         P1x6xby0t5TzqiWu0owCUYJaq+VUitEr1ZNklw61GZCkvp/4B1Y4KCz4Q9/xQYs2RZaK
         Tbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/v3gx4Dpg1dN3dSgA3Eor7lGHSmiomkDY5L/9HqLLB8=;
        b=CwgkjeeM2Gvy0yfiiYMscCeHU4E790tl2VBFjvbae5NtEBXG7TIMQa+nkbfHv5kXTD
         RsFcgBsWIxiZndB4v58C1z8EmAyOxdropcdygVg7e7HJBI49+Yj+55N1OhU8Edt3ow+l
         8HkIGae4ihhreQShpetm3pIW9jrWOjgzJ4VJGk8cQF3qQp3GZF7rRxzAC0fChVp+J177
         NZeXdlqiSd8sy9K5OxzYSnRDPIgZLPZQB85Ry6jbvL1ippM6d5FpGA9a6VZ4vM/kJeVJ
         qIOwc2Quq9cPyl2liU1g/fp0n+cMgZdyUQdaBS0dBvxzQsNY+2BKwj3OdUDelkSqRRqq
         6v9w==
X-Gm-Message-State: AOAM5325rX+rT2AeY3/OXRI3vopjDF7pPl1Emp7mWDBcI+dMUdyK2jG1
	/3dTgYaPwWB1IFhMUoAB9r5pJEh9deI=
X-Google-Smtp-Source: ABdhPJzoDDpMqHHj2eLX8KAJiB9w5fKTdAodr8dsjoDTUw4POva1F7vKcpHCILY2iy2CBc2Q59O3CA==
X-Received: by 2002:ac8:47c2:: with SMTP id d2mr22977294qtr.348.1615237348549;
        Mon, 08 Mar 2021 13:02:28 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pawel@invisiblethingslab.com,
	marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 03/12] cpufreq: Export intel_feature_detect
Date: Mon,  8 Mar 2021 16:02:01 -0500
Message-Id: <20210308210210.116278-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308210210.116278-1-jandryuk@gmail.com>
References: <20210308210210.116278-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export feature_detect as intel_feature_detect so it can be re-used by
HWP.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c       | 4 ++--
 xen/include/acpi/cpufreq/processor_perf.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 5eac2f7321..8aae9b534d 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -340,7 +340,7 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
     return extract_freq(get_cur_val(cpumask_of(cpu)), data);
 }
 
-static void feature_detect(void *info)
+void intel_feature_detect(void *info)
 {
     struct cpufreq_policy *policy = info;
     unsigned int eax;
@@ -596,7 +596,7 @@ acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
     /* Check for APERF/MPERF support in hardware
      * also check for boost support */
     if (c->x86_vendor == X86_VENDOR_INTEL && c->cpuid_level >= 6)
-        on_selected_cpus(cpumask_of(cpu), feature_detect, policy, 1);
+        on_selected_cpus(cpumask_of(cpu), intel_feature_detect, policy, 1);
 
     /*
      * the first call to ->target() should result in us actually
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index d8a1ba68a6..e2c08f0e6d 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -7,6 +7,8 @@
 
 #define XEN_PX_INIT 0x80000000
 
+void intel_feature_detect(void *info);
+
 int powernow_cpufreq_init(void);
 unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
-- 
2.29.2


