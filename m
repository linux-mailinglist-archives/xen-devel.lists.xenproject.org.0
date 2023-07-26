Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD2763D4A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:10:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570634.892624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi1t-0006gW-QN; Wed, 26 Jul 2023 17:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570634.892624; Wed, 26 Jul 2023 17:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi1t-0006du-N6; Wed, 26 Jul 2023 17:10:29 +0000
Received: by outflank-mailman (input) for mailman id 570634;
 Wed, 26 Jul 2023 17:10:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi1r-00062Z-Uu
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:10:27 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50c90e80-2bd7-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 19:10:27 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-76ae5b44426so2498385a.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:10:27 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:10:24 -0700 (PDT)
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
X-Inumbo-ID: 50c90e80-2bd7-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391425; x=1690996225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N7tHO/NpGPoNencisuqLlnFkoHrBAPddvPlzfIc1r8=;
        b=CZom+YTmDnHiRp8FX7mQxKkFsjyAiG0xPZHEu7bkMTB673t77gvfq5VsZwXCsew/9w
         vidT6gQwl7G0G3a1iRR09VS5rr547Ztov18JL0StBbHpric4NvntKEpbV9k/Zr2BX7NX
         pzVN+3wQ1MrnlRgLsrjTidioCPwdL/ahTXW/lETGU8O1lUyQkl/Vp5xXpX5zMta3+qjP
         s9bRRlk3gtKw2HsHO7mJfCvH4JaENOMSqDYxoatmHWt38LtQ+CDYI/RTMiNdXoVbJUIh
         NSP3KYAIZyIJYyxSeX80IzJAlbqJgOGL0UXmE9wP/dxx4obr3KYrmV+RDgKiIUTgNn4D
         GTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391425; x=1690996225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6N7tHO/NpGPoNencisuqLlnFkoHrBAPddvPlzfIc1r8=;
        b=k1VpMK4JIIjbDOSHMEZsL61ubNws6mKJ1EKNEN5xj5zGS/U1AUiCFr6PfTsGi+ON/1
         tBwEQsovlKgmKibRRT/VBA7sf3gE1TU2HzMCkHctlFKgm2NjxUqc+vzrzkUMvYnE2q9L
         A/mTYn0Yp0IxvqrtiFNnTvfD3h0ABlS5iPn846dg/2knLdlI63XNakG+wEgUBbTtapmz
         c0Yc2HzBJq7a8pEStuujlA4gGpLVF49P9S5TopdC3oP9jwo61gcP2I2Iiu49dU1OwlHI
         2SUOjoeY/eRw8Cd1tWFVOyj8WIP1F0//3A4b76YX19Xeshvlmhtkip2x9U4/nOKLQmSI
         fbyg==
X-Gm-Message-State: ABy/qLYhTt41I2Ur/n3aTcYbjYZsvR5v4sGWBoFjjuq1JxLLpuRLqy7s
	HtQb90/Oa/if41K6dcg7hZuCFBXHWsM=
X-Google-Smtp-Source: APBJJlHkSob2x7uUuh5jB8GE9zJTKb2Ot+bP8m9J4kEKe8C794coO7B/Sr8vfeQt0Ngm6wQ91Ljipg==
X-Received: by 2002:a0c:e5ce:0:b0:635:f4e3:8842 with SMTP id u14-20020a0ce5ce000000b00635f4e38842mr2416231qvm.48.1690391425476;
        Wed, 26 Jul 2023 10:10:25 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 03/15] cpufreq: Export intel_feature_detect
Date: Wed, 26 Jul 2023 13:09:33 -0400
Message-ID: <20230726170945.34961-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726170945.34961-1-jandryuk@gmail.com>
References: <20230726170945.34961-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export feature_detect as intel_feature_detect so it can be re-used by
HWP.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v4:
Add Jan's Ack

v3:
Remove void * cast when calling intel_feature_detect

v2:
export intel_feature_detect with typed pointer
Move intel_feature_detect to acpi/cpufreq/cpufreq.h since the
declaration now contains struct cpufreq_policy *.
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 8 ++++++--
 xen/include/acpi/cpufreq/cpufreq.h  | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 6c70d04395..f1cc473b4f 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -339,9 +339,8 @@ static unsigned int cf_check get_cur_freq_on_cpu(unsigned int cpu)
     return extract_freq(get_cur_val(cpumask_of(cpu)), data);
 }
 
-static void cf_check feature_detect(void *info)
+void intel_feature_detect(struct cpufreq_policy *policy)
 {
-    struct cpufreq_policy *policy = info;
     unsigned int eax;
 
     eax = cpuid_eax(6);
@@ -353,6 +352,11 @@ static void cf_check feature_detect(void *info)
     }
 }
 
+static void cf_check feature_detect(void *info)
+{
+    intel_feature_detect(info);
+}
+
 static unsigned int check_freqs(const cpumask_t *mask, unsigned int freq,
                                 struct acpi_cpufreq_data *data)
 {
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 1f1898d811..482ea5b0de 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -243,4 +243,6 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
 void cpufreq_dbs_timer_suspend(void);
 void cpufreq_dbs_timer_resume(void);
 
+void intel_feature_detect(struct cpufreq_policy *policy);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
-- 
2.41.0


