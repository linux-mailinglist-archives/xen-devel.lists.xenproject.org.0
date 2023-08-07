Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4D3772E28
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578789.906489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Kf-00058H-Rj; Mon, 07 Aug 2023 18:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578789.906489; Mon, 07 Aug 2023 18:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Kf-00054y-Oz; Mon, 07 Aug 2023 18:51:57 +0000
Received: by outflank-mailman (input) for mailman id 578789;
 Mon, 07 Aug 2023 18:51:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5Kd-0004GT-Im
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:51:55 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 799d13b1-3553-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 20:51:54 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-63d23473ed5so27492516d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:51:54 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:51:52 -0700 (PDT)
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
X-Inumbo-ID: 799d13b1-3553-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434312; x=1692039112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N7tHO/NpGPoNencisuqLlnFkoHrBAPddvPlzfIc1r8=;
        b=GHeky4+dM2Ufq/m6WeD1ULJqVahBnME1DiWNOJzDfbQD1PUG3us1g1/2H7LH6o6QQg
         BkOD62dOusGASJtAQOvZQtciJV+jpMFhwOUfcUI67+V+fKxO+SSANhpo5ibeLrmFl4Dp
         g0kpRNZO9dcRyIpijcDssfa9SiFhHrhHJ85x+UsPINDTllvTdyDKsSYNT4bbPDkMKsPM
         kisC6aiEFPTxLyU4GMu6H6TyudntoIEq353dFDp67v/04m0pmVKQzKL3LN1l+zi70aux
         TiTJGKZFPqYfVtxk/j8EOf78rOZFXdifyS0ho/CAm+ll9L/nW0bB/8ra6vkjgPdhDAO+
         KBaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434312; x=1692039112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6N7tHO/NpGPoNencisuqLlnFkoHrBAPddvPlzfIc1r8=;
        b=KmxbmpWW+tjkX1jByVlPgv3xYSatmYJJdjCZCNKZF2gWjytbjyPazmXTyg2JbLMlZp
         5DabLxlfKbg66RTCT9TiBHRrZycLnXit586GTPwdSVv9ewIdv0srA/HnYQMHu7n++3f0
         fOJB5jp2i4l/WL9sRI+pf6y6aUaZYH7qrJn2Bwgka/lGUbZSL2RZSDGTRJeEdiq0dt7K
         mbmlxHxcNgZ9cag/t2eIgJgHwXixPziv9ibbJ+GCFF+MlkKKajxWNkPmNbRoNEfvPy/V
         LEWTnSZKhz3c9dAgVUs5btlWbdBrqRlKiXjmR6pjySPNfzKwlZE5rcmx+kqegik7nv0m
         w2rg==
X-Gm-Message-State: AOJu0YyeN5hXOmX02+lXGFltJj0jD9w7Zc3gFSfpsaF52bvw2T878+pk
	KvDD43+y9bjLrB2Jgpg3Kpk24e6+lRA=
X-Google-Smtp-Source: AGHT+IGqakrWUAr2dflnsyhKPwTjuy2ForGGst/8v7r4iglq0Hh+C70Z74BvEzu6rs7s0s2r73f4oA==
X-Received: by 2002:a0c:e494:0:b0:632:15e6:a75e with SMTP id n20-20020a0ce494000000b0063215e6a75emr8976705qvl.46.1691434312492;
        Mon, 07 Aug 2023 11:51:52 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 03/15] cpufreq: Export intel_feature_detect
Date: Mon,  7 Aug 2023 14:51:07 -0400
Message-ID: <20230807185119.98333-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
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


