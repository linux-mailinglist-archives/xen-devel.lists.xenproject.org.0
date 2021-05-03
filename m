Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D935A37206D
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121807.229758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeFD-0005tM-0j; Mon, 03 May 2021 19:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121807.229758; Mon, 03 May 2021 19:28:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeFC-0005sg-SV; Mon, 03 May 2021 19:28:38 +0000
Received: by outflank-mailman (input) for mailman id 121807;
 Mon, 03 May 2021 19:28:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeFB-0005i5-Il
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:28:37 +0000
Received: from mail-qv1-xf2c.google.com (unknown [2607:f8b0:4864:20::f2c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3aa841dc-cbbf-4658-b61b-53c596a891d0;
 Mon, 03 May 2021 19:28:33 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id dl3so3214318qvb.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:33 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:32 -0700 (PDT)
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
X-Inumbo-ID: 3aa841dc-cbbf-4658-b61b-53c596a891d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n5SMtjJiYtnXZ6qrr9jd+Aepky6pd8C0k6PHUjXrSqU=;
        b=GPA8CR2Qwl41wS71H7Nrs1TOtettIUx/IgqSGziPcU99C+sHnTjMaToTZL/tTmcdt/
         23214F+Lqdlhzh5/9b/t/MdewCySeHLfdLAq0fCeptshVx6a39sYtoHH50dTV/IrwYIo
         C3J4GFLp2o+rK4DjzTlzj1aqRTTrFuAECppfXNlL2wrqcec+XjejgKSf4muKQZXSNVSd
         AInPzb8U7DswIQAlvV1HcIOkIvqpH6BYGhbvRuY6UGJKsgTfVG+zv0GYIkRabg2OC4GF
         UlziXpnMpqCK+MEhyuM035V6bGYQ4LaoT5Tyy2adfogGWLdvyCjSxmSUvoRRkEcQJv/w
         UaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n5SMtjJiYtnXZ6qrr9jd+Aepky6pd8C0k6PHUjXrSqU=;
        b=GGzzNNQlQg/X8+SGxEvwekG4an1Hl00F/iwcroWN2OSiX5W/smOMKfgiZEMFtfCRJW
         rRZxbIznQGnR3jWTtAp3vCHD3rHqiCw/lOJjIz7gJHdhB7QwcrqHgE4/D4Bm4pEHB0U7
         oLFMc76tVTVLKOaQtU7cC1IOOeHQRbXOi9OBvzRB0pBNLanF2QThes2Od8IzdwVYBC74
         tsMf8gVvL7k6F8sHnPl0mmN4EUkf9DID9/Laxw/GPEEEotYRiW/q3At8NMQXkDkegE3R
         rx/8DMUU7vpkbnn2kG+HRBGL0g3vApcwpRBvDPNZ/xZGmAR1HzeguxBtCJrWnpP90qAK
         8oaQ==
X-Gm-Message-State: AOAM530EmsLtAcnpVPej/pGb7V5VWFM1QCsMYqHgkc9AuUMfiCyxpNR1
	Zx6TXL/cze9BNq6LkzWCT/9B3Hg2w3w=
X-Google-Smtp-Source: ABdhPJxQRpBOQfnCcqOD0VJ2BEUNTsF095m+CkUd/TlpLDyVfgsU/URliWZUx2FLVrEwsNb8kmP/1A==
X-Received: by 2002:ad4:4bc4:: with SMTP id l4mr6967742qvw.46.1620070113001;
        Mon, 03 May 2021 12:28:33 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 03/13] cpufreq: Export intel_feature_detect
Date: Mon,  3 May 2021 15:28:00 -0400
Message-Id: <20210503192810.36084-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export feature_detect as intel_feature_detect so it can be re-used by
HWP.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c       | 4 ++--
 xen/include/acpi/cpufreq/processor_perf.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index 5eac2f7321..8aae9b534d 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -340,7 +340,7 @@ static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
     return extract_freq(get_cur_val(cpumask_of(cpu)), data);
 }
 
-static void feature_detect(void *info)
+void intel_feature_detect(void *info)
 {
     struct cpufreq_policy *policy = info;
     unsigned int eax;
@@ -596,7 +596,7 @@ acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
     /* Check for APERF/MPERF support in hardware
      * also check for boost support */
     if (c->x86_vendor == X86_VENDOR_INTEL && c->cpuid_level >= 6)
-        on_selected_cpus(cpumask_of(cpu), feature_detect, policy, 1);
+        on_selected_cpus(cpumask_of(cpu), intel_feature_detect, policy, 1);
 
     /*
      * the first call to ->target() should result in us actually
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index d8a1ba68a6..e2c08f0e6d 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -7,6 +7,8 @@
 
 #define XEN_PX_INIT 0x80000000
 
+void intel_feature_detect(void *info);
+
 int powernow_cpufreq_init(void);
 unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
-- 
2.30.2


