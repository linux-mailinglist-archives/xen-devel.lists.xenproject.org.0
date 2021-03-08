Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10A43318F6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 22:03:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95082.179380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1O-0006U1-IK; Mon, 08 Mar 2021 21:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95082.179380; Mon, 08 Mar 2021 21:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1O-0006TU-Cq; Mon, 08 Mar 2021 21:02:34 +0000
Received: by outflank-mailman (input) for mailman id 95082;
 Mon, 08 Mar 2021 21:02:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odrr=IG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJN1M-0006P0-IW
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 21:02:32 +0000
Received: from mail-qv1-xf30.google.com (unknown [2607:f8b0:4864:20::f30])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3317de23-9f88-48da-a58a-9c85b5f562b1;
 Mon, 08 Mar 2021 21:02:27 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id 15so5316748qvp.13
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 13:02:27 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a33e:daa7:46a1:a7eb])
 by smtp.gmail.com with ESMTPSA id
 r2sm8514070qti.4.2021.03.08.13.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:02:26 -0800 (PST)
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
X-Inumbo-ID: 3317de23-9f88-48da-a58a-9c85b5f562b1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=znGoCssIhhTkDoewrJpPluTmjs7zy8iVwjnUtkhYRns=;
        b=VTOGUgDcVBADbGGoC2x8aqI1+ZjoRam9mlpwc+lZv0DsI8vWG2GfhbyGSGGiKsawAQ
         glSnnJ6zgV9VKQqZnlMfkYl+JfnNw5HuyqiYsNhQuBtAHbxAR2qpOaJ2itLzjL5ygyw9
         4yFABH+KHt81zKuH6EyJPKU8Bul+1PmD1+kvXmstiSHSDMwRG9OBpLfdyRCSRlP1mVcT
         V7OFsTE/8s3TxUZo+q7Otzdxjs3SWrJUzLw9c22ixdVTtWvdIfGQfr8v0iIdCC12/VKf
         u7uoRsCGS+uWNVKxOGj1fhNpQR92UTD8P4irTiifsHFsZAlDX9iHzqXadSKaJDJUEGGR
         QRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=znGoCssIhhTkDoewrJpPluTmjs7zy8iVwjnUtkhYRns=;
        b=leMsvTdfksEpPHvH64Fo4l4TJ8xHDlaoLOdbP0RLiDk8eMf6k5pv9UYuljQrSYKNoj
         pozcSWn1aAS04FRvZYk29+063LjN4pg0YmkGnWkCf1Ha92XkBbMpenWDBxLqIjHNG3EL
         DOhKq7SdwcqqoB4Gs3WEm/u+paQwvjyOJ8UL7ReO7Vw/h6ncV+ygll35QtudC7AYEVXD
         80KuwWkHifLjBH2xvUzQrkhSBcVzSjWvvlZbFnJhFIYa8bDDud12kmUNuGoE2FEtrFuj
         YauMAbQyFdHupZWvUpYJWng0VMGU/tnaBFp9/PK4fLlvs40oAoZ10JkGlzWKxn//wix8
         vWJg==
X-Gm-Message-State: AOAM532MCXJWG6jXJlJOeTxER6F53L6fDIlcyZ6UsoraSHTUQV3jQa2C
	F75PPwJl18CG/Sed0fYvE4QhIkExiuo=
X-Google-Smtp-Source: ABdhPJzKIodUHBfVbf6ctvzIC+8gLg2g3Rmlasu1nuYaIbyh31yXV4Y9g6NRds9nDCx21/VDPIkNWw==
X-Received: by 2002:a0c:aece:: with SMTP id n14mr22796843qvd.52.1615237346639;
        Mon, 08 Mar 2021 13:02:26 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pawel@invisiblethingslab.com,
	marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 02/12] cpufreq: Add perf_freq to cpuinfo
Date: Mon,  8 Mar 2021 16:02:00 -0500
Message-Id: <20210308210210.116278-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308210210.116278-1-jandryuk@gmail.com>
References: <20210308210210.116278-1-jandryuk@gmail.com>
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
index f1f3c6923f..5eac2f7321 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -317,7 +317,7 @@ unsigned int get_measured_perf(unsigned int cpu, unsigned int flag)
     else
         perf_percent = 0;
 
-    return policy->cpuinfo.max_freq * perf_percent / 100;
+    return policy->cpuinfo.perf_freq * perf_percent / 100;
 }
 
 static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index b93895d4dd..788929e079 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -236,6 +236,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy,
 
     policy->min = policy->cpuinfo.min_freq = min_freq;
     policy->max = policy->cpuinfo.max_freq = max_freq;
+    policy->cpuinfo.perf_freq = max_freq;
     policy->cpuinfo.second_max_freq = second_max_freq;
 
     if (policy->min == ~0)
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 56df5eebed..b91859ce5d 100644
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
2.29.2


