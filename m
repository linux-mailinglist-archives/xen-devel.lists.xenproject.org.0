Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6F26F369C
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:21:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528063.820631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZ5A-0003Q8-LP; Mon, 01 May 2023 19:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528063.820631; Mon, 01 May 2023 19:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZ5A-0003ML-I0; Mon, 01 May 2023 19:21:08 +0000
Received: by outflank-mailman (input) for mailman id 528063;
 Mon, 01 May 2023 19:21:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZ58-0002np-O4
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:21:06 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 518ff36a-e855-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:21:06 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-74fb8677a36so133678885a.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:21:06 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 x20-20020a0ce0d4000000b0061927ddb043sm2012307qvk.80.2023.05.01.12.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:21:04 -0700 (PDT)
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
X-Inumbo-ID: 518ff36a-e855-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682968865; x=1685560865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txBzmZlgf2a5ZApasbIDD2P8VUrWanxh/ZCZKapkSd4=;
        b=hnzzQkqw6iB4TnpMVolsM/d8tA0cLpu0rYq2RmzA5nHVBJa6VHBWbPjqIW0uCmQTUp
         sTHTPdiaSED7oKPvQeLQsKAATgCljdsn+MCz/RG6kH2ypD7ZqbfMoY6R0HGTi4r8sbJa
         vLXsFsL7O59YaDIhrpdY8gTEK7MrfC07APLJ70wAJkXqatxHLhrAJYYx5RT+v3jM+9mF
         9rPC6jdrwvxBkIzcvDFk0czEXPAxtnVqYbEwo01XNdS6hA8AhE7gWz0u4GUIzitKoSib
         slFFJidmyr7rrVuZnj5teD6sjEbvDofZD+sEdBlTlhwKt1Ce80m/sho+QJMXIot4qpnK
         l7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682968865; x=1685560865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txBzmZlgf2a5ZApasbIDD2P8VUrWanxh/ZCZKapkSd4=;
        b=V8vp370i1PknhVmIhkzfuvNks4vnELh2lTUgXZVLmBlvtvuGO6lL8vZLUmez9X2CT6
         2Vf54AU+OJhx1xUUySHYqZSrVBCn4OGXYIxaP5hAIJbJTpIb4pFfBYY9Mo7OEllaMAZc
         Tx5gAFITi17+vSIu5NAt4VNtsEEJjvLMlRzueRxVb59RU/WQ1cQZq1N4SnCf5hRiK4L3
         442dV7SbSJRs4uldLLv31Tx+UYFfUuvG8jHGJyp77jV5V9Xx8DNfOUPUjt7+86JCTDwy
         PcYYcMc8BgNCQZ/XFhg2B2rlXygXyraPU5S5MLz9yxFhAwUL7g3MBT6snvLI8IBTLemp
         6IAQ==
X-Gm-Message-State: AC+VfDwluYVv3DIRT/UivgmMNO+rRj8OeSLjyF5l6jSsZ3OBWjzFWqi/
	TsAwtVnwhLWdbAcI079ZKQI=
X-Google-Smtp-Source: ACHHUZ417cxCd/vqsbSp93kURkQVEsMZjpcjAt0WtKYiNB7H5wmUcdd/cQhBwm4ZtrgjNj2q+ozWzw==
X-Received: by 2002:a05:6214:c4c:b0:5ef:83cf:91c2 with SMTP id r12-20020a0562140c4c00b005ef83cf91c2mr1729663qvj.45.1682968865210;
        Mon, 01 May 2023 12:21:05 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproj,
	xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 02/14] cpufreq: Add perf_freq to cpuinfo
Date: Mon,  1 May 2023 15:20:33 -0400
Message-Id: <20230501192045.87377-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501192045.87377-1-jandryuk@gmail.com>
References: <20230501192045.87377-1-jandryuk@gmail.com>
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
2.40.0


