Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA5075F79C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568914.889047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNv9q-0004Ko-6K; Mon, 24 Jul 2023 12:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568914.889047; Mon, 24 Jul 2023 12:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNv9q-0004H1-2O; Mon, 24 Jul 2023 12:59:26 +0000
Received: by outflank-mailman (input) for mailman id 568914;
 Mon, 24 Jul 2023 12:59:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNv9o-0003BP-7D
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:24 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e89517af-2a21-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:59:22 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-76754b9eac0so394224385a.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:22 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:20 -0700 (PDT)
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
X-Inumbo-ID: e89517af-2a21-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203561; x=1690808361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj29XCVclI+6QGR1ahwKo+P0a4dIzt4OqPyhJ7hCJ/k=;
        b=MefEokX652K3Hxpop/Q4MUOZwSx9FsyRVLkshoQu+sn3gQ6CYJ/YDwNuwOoy/D8IAA
         6D+xH84rlygFJyABuTIlX20Lk+yzoKkU5vwjGwZMaoK/jfBMTsWgub7rjLpyqfLLCSR+
         JWMPdas4HuujT4W7zgifiR+RJk45JF1pF8+a7wJDa3QEcojUEe0wiLHSQYEMNPJKjYXi
         ijiLBGl9eSxrK4CWCGrVTmPh/Qd2s7Lx0FvsGLocb5koZQQb9ZI968e0QAoKWvEx/ZpR
         ffBivN0qzCKVTI27ZcXRLbZSiaVDykVc0z181BmcnKRNK5iiSV1Nad4YPWr7CdmYSayv
         4e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203561; x=1690808361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj29XCVclI+6QGR1ahwKo+P0a4dIzt4OqPyhJ7hCJ/k=;
        b=VjTEeU9cCoJwlhkwvZTFc78WsTpqk37Vm6ya0c4Ez3ubGFOvGvwKtknre1BH2vvI0a
         gsF+wuCGqaaeudeK3Lou5FD3dIgtY87Ygu37k3hOT5jY3+kfrQSfU8HrW9CxyvLQP2Fz
         ZfPeQMXz5gAQLjEX1BUsCwH2wJdaAAk88dzAG0vuhNXkzN3WEkam6oeNrO9hiiuoTm27
         c6ydsNbMIyXIH4upfWlAF+wW2FhA2kAq/IQhzCTBvCifGqsJ2vebCrMEO9F4o5nCSn4n
         kqvp9rtjjpfdwYn4jhF9pTgNSq5AsiBlJRsendlAhaVO2XljdD3gM2dhbl+6hx0iHVQe
         EYtw==
X-Gm-Message-State: ABy/qLagmnfZcRbdm0vFrZWV8rFzQKrTI/HLm8sSJkgwIX4OUb9ktA/t
	1uo8bW5xVvXgVbHcvcw0Q8Xq4TLQo5c=
X-Google-Smtp-Source: APBJJlGr9DHZ8QXjoV3YuAbWacCy15zRL8+KkU5SbLjf/Ts2cgSvdd1lZO4UsazGe8E6ZRxSaZ0yHw==
X-Received: by 2002:a05:622a:249:b0:405:46e5:be3a with SMTP id c9-20020a05622a024900b0040546e5be3amr11564111qtx.49.1690203560813;
        Mon, 24 Jul 2023 05:59:20 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 02/15] cpufreq: Add perf_freq to cpuinfo
Date: Mon, 24 Jul 2023 08:58:44 -0400
Message-ID: <20230724125857.11133-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724125857.11133-1-jandryuk@gmail.com>
References: <20230724125857.11133-1-jandryuk@gmail.com>
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


