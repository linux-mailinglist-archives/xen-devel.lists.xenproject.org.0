Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D5574A3F9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559975.875488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8Z-0004nG-VF; Thu, 06 Jul 2023 18:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559975.875488; Thu, 06 Jul 2023 18:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8Z-0004lM-RR; Thu, 06 Jul 2023 18:55:31 +0000
Received: by outflank-mailman (input) for mailman id 559975;
 Thu, 06 Jul 2023 18:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU8Y-0003x8-F6
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:55:30 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad123d90-1c2e-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 20:55:30 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7659db6339eso53385585a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:55:29 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:27 -0700 (PDT)
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
X-Inumbo-ID: ad123d90-1c2e-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669728; x=1691261728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N7tHO/NpGPoNencisuqLlnFkoHrBAPddvPlzfIc1r8=;
        b=NAErraLZHKMB+GJUgJqMw+/SLS1MlY6VMy/Ns8TMxwjCB94CkN0sknUtBSveIV7i2/
         698ep9Tpi27mK7SXrhLbLPW8eUh4DqLtqk8iQAjfwC6H6sltzapXkShnU+kn3wCs9TWb
         0SCUxA87aa1Bv5aT7dlFn71gWe8+7dLk9aa999QkkmfLmUGYcDYy+dZYZptPeT/kykaz
         /X70g2HoY6u3sjcrD/IJ/kYNTJOBXOwIznr4C/5cgXp+JYi9+/XJgGF8OxqindvmKgvU
         Votvflon5IxRaPbheAm9hBXZFQ0f5DwyDy0pKP+C5opuFF6Lfupvoe2fT8KvpJigCxgm
         Ar7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669728; x=1691261728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6N7tHO/NpGPoNencisuqLlnFkoHrBAPddvPlzfIc1r8=;
        b=VharDf88/mSD3s5q7kiKjX6VTuJaYnMkfWhF469gG/N7dD5XzM7Xhx7vXbahoqmZ7u
         2QSQp5f3h/Sc3Xx5ix2/VZ6HfX78dOTGouaGG2xj6w0rHSOcwOPFLBkePxRmFTK+kf/Y
         x6x/BsUrdSCS72mCU03/J0LMhcsipl6l9GHmIl0CuAkMdY8JFeXMlgF2R/D3fvo3eW7Z
         CCphyqN1O9H/Osl866LDdwbyMOQpZbGnLXelB+CMXrU2CIyDlrULnIVrnvOev21YCn7G
         eIJbWgK+2KWB+ZyjEjHZMXCY7CkAsgRio7JsnvtFENltlx1aKd+QCWoSkbxLSQnPatYL
         mnSg==
X-Gm-Message-State: ABy/qLYnRzotb40WbOWkl0KbWLTYbvowU1aBtc+sVw+ienK5FXu/ser5
	0DHfEfGdNkeS+UTR8hJoVfvAVf6o+IY=
X-Google-Smtp-Source: APBJJlFyWedTLrAyP45SfAWkp0UgcxFi5stN5rICTm6xaXdlZRTCY/n84qAugW9czA+NsPI4gx/8HA==
X-Received: by 2002:a05:620a:1a92:b0:760:6fcb:77db with SMTP id bl18-20020a05620a1a9200b007606fcb77dbmr3279121qkb.36.1688669728233;
        Thu, 06 Jul 2023 11:55:28 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 03/15] cpufreq: Export intel_feature_detect
Date: Thu,  6 Jul 2023 14:54:28 -0400
Message-ID: <20230706185440.48333-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
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


