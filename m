Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0169958F311
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383875.619102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPG-0006Tj-3z; Wed, 10 Aug 2022 19:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383875.619102; Wed, 10 Aug 2022 19:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPG-0006Qc-0d; Wed, 10 Aug 2022 19:30:18 +0000
Received: by outflank-mailman (input) for mailman id 383875;
 Wed, 10 Aug 2022 19:30:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPE-0005rf-4p
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:16 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbcba058-18e2-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 21:30:15 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id i13so4078099qkm.8
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:15 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:13 -0700 (PDT)
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
X-Inumbo-ID: dbcba058-18e2-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=SxZKnNNwTrIDOU+tEEO3VrrnwPCkxQYa2L8+Nx13qkY=;
        b=bl/eoNSd9YwaRcoCzH/e8sfTl5jrA4sJRaO9jVDs7GEFnRKcXPl3okgUWs/N4rLDrO
         X1VAgxTO2BH17pqV/CCgpbhL9rHI0Alz/4SB/mGoNhrM83rsinigCgQ/xJpG9Q5WsIJK
         hN5iInEvZIpGsTvImIYIEwyk7++1Tgd6NX6W/zYNzgFGG1tFWDCBXiX6eN4Cr5uWiosL
         NXETEiYUVteyYRsMR+QcHusjzUTXtURteUC6CAVR/4cnKwpoPEsFKaXF5UHj4vRRfjZ5
         3vnz7fzR7//O7vYUhqXA1FODyGLJOVThfRAsc/Z9vkSsAsfI8u3JxG/WXEXGQV3Lnw4f
         R6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=SxZKnNNwTrIDOU+tEEO3VrrnwPCkxQYa2L8+Nx13qkY=;
        b=4EC1h+2k0H03Y3Dnol123qpnlNLZgrIBQ7Pjxh/6Z/mVUEHvS4oruJD+YOxHkIpYM0
         7nKqVKlIXWYc+YGyad5wdXsHrE4uyx/O2D4LIIXnt16QHjtH0WXNJEJzWLX+IvSC+Hpy
         M6656N0GhCEmwCzh7QtUPxIXBZSeIenH9U29x34JTUKSzrf62O7V42CKgu7o8dCO4gLb
         JnTyIQ3WduQWh295Eqa6ISc9iM6D6YuYsxMeQf0UDvIAiflmSCVDf3T5JO4fXOPbuA7A
         zkD0e5qsgefgLUh2WgfZROGj4Dj1lsRB3d3EJfJAhtk7bVdihTuEnuES6y/fRNjO1sdC
         YC5g==
X-Gm-Message-State: ACgBeo3KeOikdAq+KvfJrWNnRPh53wcDB5KNmbA5W0UngzqLSh4UnVK6
	/Qk+g4LngPxkCUlOepPnf6T2NjGYSiU=
X-Google-Smtp-Source: AA6agR5A7InDlBEvaDBVp0c4YGz2tHxYW8f1DEBshjdpKSaPdcxbMaJFD9d4YbR4LPypMIzjxLH9Bw==
X-Received: by 2002:a37:9247:0:b0:6b9:78ef:56 with SMTP id u68-20020a379247000000b006b978ef0056mr6732765qkd.364.1660159814067;
        Wed, 10 Aug 2022 12:30:14 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 02/13] cpufreq: Add perf_freq to cpuinfo
Date: Wed, 10 Aug 2022 15:29:33 -0400
Message-Id: <20220810192944.102135-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acpi-cpufreq scales the aperf/mperf measurements by max_freq, but HWP
needs to scale by base frequency.  Settings max_freq to base_freq
"works" but the code is not obvious, and returning values to userspace
is tricky.  Add an additonal perf_freq member which is used for scaling
aperf/mperf measurements.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
I don't like this, but it seems the best way to re-use the common
aperf/mperf code.  The other option would be to add wrappers that then
do the acpi vs. hwp scaling.
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 2 +-
 xen/drivers/cpufreq/utility.c       | 1 +
 xen/include/acpi/cpufreq/cpufreq.h  | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index c27cbb2304..ded0150b3b 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -317,7 +317,7 @@ unsigned int get_measured_perf(unsigned int cpu, unsigned int flag)
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
index 0da32ef519..a06aa92f62 100644
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
2.37.1


