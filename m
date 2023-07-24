Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C96E75F79D
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568915.889056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNv9r-0004bc-EY; Mon, 24 Jul 2023 12:59:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568915.889056; Mon, 24 Jul 2023 12:59:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNv9r-0004YV-9i; Mon, 24 Jul 2023 12:59:27 +0000
Received: by outflank-mailman (input) for mailman id 568915;
 Mon, 24 Jul 2023 12:59:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNv9p-0003BP-D6
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:25 +0000
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9526194-2a21-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:59:23 +0200 (CEST)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-403a7066bc8so34716411cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:23 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:21 -0700 (PDT)
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
X-Inumbo-ID: e9526194-2a21-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203562; x=1690808362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6N7tHO/NpGPoNencisuqLlnFkoHrBAPddvPlzfIc1r8=;
        b=cGb1P+6S3Av5VGzrgSZc1YUQupRCIbJ6DAVAiXA9Mottwv6P7pTsXXlnUeOeNQE6yS
         KXloN25oLGNWTvgFBoaCmcjPodiF98MuPueE99Oh/l/jiDSTy99X+cbsz2u76U2fKDtN
         GQrq3t/hMKxCpsFJTSG9KtG3i9LiWtrYvD7m9p/nqooS4SIDUyfGT/NS++diC6BVnvYM
         Ix7EoMFBJPh27yiNw7eExYutYYqXbb/9Z8YQbEJAVDxim2gAX+MmqXE5Q4IU8yVcoGq9
         XjmjJLYBdAdSc/tLVMdlChHQPvllJwyAX9ZrBYPRgSvckE/QVWo5fwOj/SOgEjcjVEbp
         MuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203562; x=1690808362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6N7tHO/NpGPoNencisuqLlnFkoHrBAPddvPlzfIc1r8=;
        b=PXjrY+0V7KnGLn2F1j/Q01hUIJvBNBzCMo3KNBvD8Ksh8YiD7f3MbNHevryu6tHOXY
         fV3QXdNbKzZxuyF1lRo3s/++Hyxz4lW/qO6T6XrDl0mnCzWRzQZw3nm78A7cJExP3qvz
         VJCIvg6d0ioqltx+WqWsZ5Gy+uj4UblKo8Qgrvf6AORVHsAUhtenfZ3JEGInFIagPEg7
         hE8I8B6v2e8OaKmElI+yBw4z2uE5plmd/2xTgPIPdzaW65SGwAhOKn8kSwGlxJGszmD2
         pOwKui4Y9hBeYQ1hwcsJrz5limFBjHrcEEfK2x32EAQeB02+PbNecYjdt1TFFhL4kNcW
         On+Q==
X-Gm-Message-State: ABy/qLYrSEFy1dnw3z81yYGwmeYzVg+bvMM06YA2BC7xekwiXvgq9NwY
	TWm7+Y8TPT0TJnJJ6sWT+Dm4g4BHLkc=
X-Google-Smtp-Source: APBJJlHp7cIM4/UVssHdBqftTk4Z3lll3Mh05WSVk3y28GZq+W5S9sj/cFB3io/d1A08Hhw1vN1MKw==
X-Received: by 2002:ac8:5e46:0:b0:400:91d8:a704 with SMTP id i6-20020ac85e46000000b0040091d8a704mr10189554qtx.47.1690203562196;
        Mon, 24 Jul 2023 05:59:22 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 03/15] cpufreq: Export intel_feature_detect
Date: Mon, 24 Jul 2023 08:58:45 -0400
Message-ID: <20230724125857.11133-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724125857.11133-1-jandryuk@gmail.com>
References: <20230724125857.11133-1-jandryuk@gmail.com>
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


