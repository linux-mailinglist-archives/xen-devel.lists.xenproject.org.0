Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E141772E26
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578788.906479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Kc-0004pE-G7; Mon, 07 Aug 2023 18:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578788.906479; Mon, 07 Aug 2023 18:51:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Kc-0004ma-C4; Mon, 07 Aug 2023 18:51:54 +0000
Received: by outflank-mailman (input) for mailman id 578788;
 Mon, 07 Aug 2023 18:51:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5Kb-0004lg-0s
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:51:53 +0000
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [2607:f8b0:4864:20::729])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7807c4db-3553-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 20:51:51 +0200 (CEST)
Received: by mail-qk1-x729.google.com with SMTP id
 af79cd13be357-7658752ce2fso307674185a.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:51:51 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:51:49 -0700 (PDT)
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
X-Inumbo-ID: 7807c4db-3553-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434310; x=1692039110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj29XCVclI+6QGR1ahwKo+P0a4dIzt4OqPyhJ7hCJ/k=;
        b=MlsbqQcJyX9jN9lriHM0iDQ7gR5CoydJhp8pi3OdLiGwI71DCySx/z0maO1HF61T83
         FpNuso2rFHyFlar631WV906NN1tUBjpxJ0SbSPcSNUga2jI+DOY+Ah5CI4s+gFAhwGPL
         z/3B1ChBKLay6Eo41f7+XsHNoLpxSWGhvNHMaHPi4rVFHH1qecrz5M2RK2d8MlhmIxXr
         ijsDkh+bw6EaguEg9c5GSBTQogItxt1YI9o8Ox0whZiczCH1GGSO2IMoSEDXOu5fXREc
         s3/g/VRmSwrNKl6vQ1IY/wsUTgHlgHDd+ZJpGohCjofBhf3hLo7wtRTomBXrPqXHdfQL
         ZHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434310; x=1692039110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj29XCVclI+6QGR1ahwKo+P0a4dIzt4OqPyhJ7hCJ/k=;
        b=CffovdcvpOnKxFSj5L5e/F64cxvF2gHh3Byg22CJFyKKCXqki6UqNlIG0NT5qtUn4H
         FMGBC4/FcF0ToxhwnhjFOI75MPMKL4YqF7i5RxT2xC48hMH6GI6bwFHJBrDhZG2fyolu
         WUgH5gvepsxjuJKEvcds7K5gzSoAcammJRiC7PsDqAJiBJLGVHWsLHNzW7vK4Xe/5PKG
         cbx1rADnDRV1HIoI3ttwhQEg5j6vKk/VJFR7rIV6wo5MRcg0qjNy47VVfCx/glFWBmu1
         ZhOzrl+wQOhGMqt64MfBYbgRuQnR+jHI22zT2uSvhlN2v3yKwv/hG/+YllMzHF7MVqBY
         8rSw==
X-Gm-Message-State: AOJu0Yw1y/KOWYI93A2Q57sB9fNCFnjFXBbBmK4BqJrgHdms94qGi9hK
	NBmw9M3zFh15y69WO5AUAx2/2e1kmlM=
X-Google-Smtp-Source: AGHT+IGgGCC4XZiOpihmt9Ail03iR8azEz/pl5MYhM5hiOtjuCf1gBvEFIOfCMwg9A7Dcb2mI3FMoA==
X-Received: by 2002:ad4:569a:0:b0:62d:fa7c:6b95 with SMTP id bd26-20020ad4569a000000b0062dfa7c6b95mr8654681qvb.32.1691434309726;
        Mon, 07 Aug 2023 11:51:49 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 02/15] cpufreq: Add perf_freq to cpuinfo
Date: Mon,  7 Aug 2023 14:51:06 -0400
Message-ID: <20230807185119.98333-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
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


