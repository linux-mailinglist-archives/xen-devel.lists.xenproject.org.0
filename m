Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E56F3786
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:31:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528104.820891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEe-0001nF-AK; Mon, 01 May 2023 19:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528104.820891; Mon, 01 May 2023 19:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEe-0001iM-6L; Mon, 01 May 2023 19:30:56 +0000
Received: by outflank-mailman (input) for mailman id 528104;
 Mon, 01 May 2023 19:30:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZEd-000149-7d
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:30:55 +0000
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [2607:f8b0:4864:20::82b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afbb5f8e-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:30:53 +0200 (CEST)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-3ee339e8c2fso12897371cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:30:53 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d6-20020ac80606000000b003bf9f9f1844sm9351784qth.71.2023.05.01.12.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:30:51 -0700 (PDT)
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
X-Inumbo-ID: afbb5f8e-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969452; x=1685561452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9MXL508WAYhYYKIHs8d77jkKwZyoTe/WztjxZedAQ8=;
        b=CxdCiWP1SUv+Yp9hcpkzl92fy/yJPA8ybi4F68aLbr7SImDVwdbkjA8fYrnKQtXs+V
         pyIBxunNJdDUmJu3GU08SVoJY6+AUIzlYw8Hp/YQNccxMy5ld9JuVsWUxj5x49H+ujHO
         VIieK+/4WpGVxK+rnYj1gYs2kAL8VpqO7ajvJjsKCiAZUeKosYnkXATmvGwpKqOi5mx6
         COc3zbTQyMnNL4+dvc51sNW/sIZgrauQWsGX/+84BZCDmKNjVqvNfj1VCJo+X01cSs32
         pAT8wfI6COmTC1J5jd8FIwODj9GF/tVGjc1pKqiQ8bgdYYRdSKgJeaG6kECUY3aWLl2j
         bwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969452; x=1685561452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9MXL508WAYhYYKIHs8d77jkKwZyoTe/WztjxZedAQ8=;
        b=epUQ+HPRXrzEXbAqQbc+o/XsL9i7CUbgvGl+IgjQMp1ZpotUerBNXs1DdNq2iF2cEc
         a6ozq+PnBexrR5+OFSKztpOFa7T0ejWrrhMK/nezT5DwLrwK8/G7HCaW6+NZ4AghBlba
         1d1ZUHfTBovnkM8JwtayqRZfqc1aTpPjkvWgyFvvUPUJyh921R0LFiJuFXX6/o7TeU1P
         8jjlrQ9p5wxMZKx1PVal+s71elFTKmAGVm9ou5RNdL6syiPmAz0UO0/d2OALP35GaKVm
         1TMblTve55P+1EQae2MfiZ4CmBd7KhKD2c42sD1MSqCrrwvZlF4oHKPXKzDi4fWDTdAR
         g7YA==
X-Gm-Message-State: AC+VfDyqOUuNo9XQTsPtnA31+l+MJGd9w/hQBW0ytFVLfd/uvpZp56UG
	mPcFNF+96U+vtgJ2M0MjM4loGWCsvVI=
X-Google-Smtp-Source: ACHHUZ61Lw9FNIzq0S8Unejn3bdDcd2bR/GRbFtZ1Rd6OIkz4KwanSmye/RkOvAVRjQPpb2hLgwA8Q==
X-Received: by 2002:ac8:5d89:0:b0:3e8:1903:ab05 with SMTP id d9-20020ac85d89000000b003e81903ab05mr22968522qtx.64.1682969452035;
        Mon, 01 May 2023 12:30:52 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 03/14 RESEND] cpufreq: Export intel_feature_detect
Date: Mon,  1 May 2023 15:30:23 -0400
Message-Id: <20230501193034.88575-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501193034.88575-1-jandryuk@gmail.com>
References: <20230501193034.88575-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export feature_detect as intel_feature_detect so it can be re-used by
HWP.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
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
index a06aa92f62..0f334d2a43 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -243,4 +243,6 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
 void cpufreq_dbs_timer_suspend(void);
 void cpufreq_dbs_timer_resume(void);
 
+void intel_feature_detect(struct cpufreq_policy *policy);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
-- 
2.40.0


