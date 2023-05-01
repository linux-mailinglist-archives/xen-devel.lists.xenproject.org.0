Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7656F3699
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528064.820640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZ5D-0003hA-Ui; Mon, 01 May 2023 19:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528064.820640; Mon, 01 May 2023 19:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZ5D-0003eF-RV; Mon, 01 May 2023 19:21:11 +0000
Received: by outflank-mailman (input) for mailman id 528064;
 Mon, 01 May 2023 19:21:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZ5C-0002np-B7
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:21:10 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53a88cf9-e855-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:21:09 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7515631b965so673368285a.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:21:09 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 x20-20020a0ce0d4000000b0061927ddb043sm2012307qvk.80.2023.05.01.12.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:21:07 -0700 (PDT)
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
X-Inumbo-ID: 53a88cf9-e855-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682968869; x=1685560869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9MXL508WAYhYYKIHs8d77jkKwZyoTe/WztjxZedAQ8=;
        b=rq0DvyOB5DfwmfNuwRvzir/PEUW4Q7Y7tqorFvzYUK9HQUsaW9yTveOdaSqHQszeGL
         jiHsrz5gRbbu3FwfmQLHNbPYDkloR8iXpYmZVMUNv2hNSzj2hJXttzAZO8x07fI705gn
         jEjQ0VogRFH3rkilyFMTeqorC6HRMiwrrdxRzNpgb/+UO1MRDIOj5z9QG6Z4oXYiBO19
         pjtMBMhUGnFJh8mxInOdnvtei4CDIzG9sBwjryXnb6D0yA5/VK4QjvlalXEMDkEC8QcR
         LDYdb/AzkiKUFK1+YA8RUoc8TmDoG93/ulnV+j4qPQ5kzJhPSQCdGnQXYqSlLZjtIUXl
         Qzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682968869; x=1685560869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9MXL508WAYhYYKIHs8d77jkKwZyoTe/WztjxZedAQ8=;
        b=U0ezniXveMf1m1cRbCjB7AkO45yWgq1pvxcN7SuYUWKwpXLcAtAaY1g9hyikCgNUi/
         dF0vqvLQyxeUvQXK3nlRyxMnQr157eU4/xRetceDVFptrZfjHY66M3SjHajrXCvqjle8
         DIC8pvOFxbY9+vhTd2+qxMPFZ1k6Az4nkDNpWVz9rnqwKunBpmYSCg3xrYXh+0j3YZBQ
         6vwVGpS1ejaRZVw6KV2mY8q+HRxoIqsV/TJHulx46RJJJvDW1xXlgzUwcMyShQ1a8x/K
         N+UXwH9C0Ca5UmWhfu7Ush7FmaVc6bMMhxIAkTdwfS7nPTIziAB+H/ku0Ru1zSDX99FB
         I0Zg==
X-Gm-Message-State: AC+VfDxvdOinF02xc+MIvacBMiF9feDAUoDYFTTTXtNMAwSd6bBNkhZV
	WpOfR5ekxOLY4jg3G0SquUo=
X-Google-Smtp-Source: ACHHUZ52fJMB7p3+z00UEHeNT6H5lQjNgXa9HJUz0dTy7X0df51pnNMHSDMMqDjFDxxrpToBKZMY8g==
X-Received: by 2002:a05:6214:23cc:b0:572:6e81:ae9c with SMTP id hr12-20020a05621423cc00b005726e81ae9cmr1857350qvb.1.1682968868683;
        Mon, 01 May 2023 12:21:08 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproj,
	xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 03/14] cpufreq: Export intel_feature_detect
Date: Mon,  1 May 2023 15:20:34 -0400
Message-Id: <20230501192045.87377-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501192045.87377-1-jandryuk@gmail.com>
References: <20230501192045.87377-1-jandryuk@gmail.com>
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


