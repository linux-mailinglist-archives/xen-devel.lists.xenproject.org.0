Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A2674A3FF
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:55:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559973.875478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8W-0004Tm-Og; Thu, 06 Jul 2023 18:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559973.875478; Thu, 06 Jul 2023 18:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8W-0004Sb-KT; Thu, 06 Jul 2023 18:55:28 +0000
Received: by outflank-mailman (input) for mailman id 559973;
 Thu, 06 Jul 2023 18:55:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU8U-0003x8-Ke
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:55:26 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aac4751e-1c2e-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 20:55:26 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-76547539775so89981585a.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:55:26 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:23 -0700 (PDT)
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
X-Inumbo-ID: aac4751e-1c2e-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669724; x=1691261724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj29XCVclI+6QGR1ahwKo+P0a4dIzt4OqPyhJ7hCJ/k=;
        b=I1SPNwYIsNcJaeKqpP8Szu9Rn6t5Ki5A+Wcsw8iP53+wPocHBK6kXk/NXUU6+Y3kZl
         XSKL4B8pXdtLDQDraW3F4lKQQj9PxOffPmlJdNJYXSMXUxh07akGHDLOHLlON0hLE9MQ
         fStBFou2G9J/MEL834kcFlovwnGDb4r0aGTJVys3YKu73k3MQ4SdZAUYdSovgyPfmc2c
         7015i/qRtUuxIYh8W+AobYamyLTKDc4Hxg43Jz/1PMZXvBgzihlIbAKaWCsyZjKuZdl8
         8DDPHVEHciBRy4PgFlwojRpQ0PvvaP9q+K6BjrxN7BxIXkZmv7aiZK830HFGzJ0KSG6E
         Q/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669724; x=1691261724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj29XCVclI+6QGR1ahwKo+P0a4dIzt4OqPyhJ7hCJ/k=;
        b=D78Lk0J9+ymqcqZOFp2kaTAZAWqQ+PALLv5He47bRgoaGWnVqEnIhUMfE69KcKMBIj
         hHqLqfyYrk1FINS/aop3DmNXZlz5wD5c+OIr8IuKrwXcIG5ZPakEqskwuJtKUFRl5OXc
         i+amhED97uQe+bvsluLgB2gHSqoPtS7KgzqrTWTfqJGMaN4WvPyqtXvzYSqWG338ylsd
         GdoTX8OUBv2hci3H6TKO7z8jWApIWuxyVhu+YUk2FQILrykagl8woWTiaCsF9wNjJaPh
         gFvgDtgELCogLc7/pxXmAx5x+ZYhKYp+KlwSQ3DhzCPgvcbeYAZ1NZBQb1DzDEKrWu8L
         Jj+w==
X-Gm-Message-State: ABy/qLYgzM3/Ee6bkRZcnAyJrU6c9nUtw+KkILng3nvEm+h0tf9OBGbZ
	n6bvIeO6yKpRhckc/HKnJdYbszXdCUc=
X-Google-Smtp-Source: APBJJlFUXhr4+jOWe6Boh7rUmyu5qDPto/0X2MBL7ciO/vPRWZsplRaYMm5FH2hjBeaZs4ZMIYpHjA==
X-Received: by 2002:a0c:f0d3:0:b0:61b:79ab:7129 with SMTP id d19-20020a0cf0d3000000b0061b79ab7129mr2390557qvl.37.1688669724311;
        Thu, 06 Jul 2023 11:55:24 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 02/15] cpufreq: Add perf_freq to cpuinfo
Date: Thu,  6 Jul 2023 14:54:27 -0400
Message-ID: <20230706185440.48333-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acpi-cpufreq scales the aperf/mperf measurements by max_freq, but HWP
needs to scale by base frequency.  Settings max_freq to base_freq
"works" but the code is not obvious, and returning values to userspace
is tricky.  Add an additonal perf_freq member which is used for scaling
aperf/mperf measurements.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3:
Add Jan's Ack

I don't like this, but it seems the best way to re-use the common
aperf/mperf code.  The other option would be to add wrappers that then
do the acpi vs. hwp scaling.
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 2 +-
 xen/drivers/cpufreq/utility.c       | 1 +
 xen/include/acpi/cpufreq/cpufreq.h  | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 2e0067fbe5..6c70d04395 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -316,7 +316,7 @@ unsigned int get_measured_perf(unsigned int cpu, unsigned int flag)
     else
         perf_percent = 0;
 
-    return policy->cpuinfo.max_freq * perf_percent / 100;
+    return policy->cpuinfo.perf_freq * perf_percent / 100;
 }
 
 static unsigned int cf_check get_cur_freq_on_cpu(unsigned int cpu)
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index 9eb7ecedcd..6831f62851 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -236,6 +236,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy,
 
     policy->min = policy->cpuinfo.min_freq = min_freq;
     policy->max = policy->cpuinfo.max_freq = max_freq;
+    policy->cpuinfo.perf_freq = max_freq;
     policy->cpuinfo.second_max_freq = second_max_freq;
 
     if (policy->min == ~0)
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 44fc4c58fc..1f1898d811 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -37,6 +37,9 @@ extern struct acpi_cpufreq_data *cpufreq_drv_data[NR_CPUS];
 struct cpufreq_cpuinfo {
     unsigned int        max_freq;
     unsigned int        second_max_freq;    /* P1 if Turbo Mode is on */
+    unsigned int        perf_freq; /* Scaling freq for aperf/mpref.
+                                      acpi-cpufreq uses max_freq, but HWP uses
+                                      base_freq.*/
     unsigned int        min_freq;
     unsigned int        transition_latency; /* in 10^(-9) s = nanoseconds */
 };
-- 
2.41.0


