Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFEB58F30E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383876.619113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPJ-0006nN-FD; Wed, 10 Aug 2022 19:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383876.619113; Wed, 10 Aug 2022 19:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPJ-0006ki-9x; Wed, 10 Aug 2022 19:30:21 +0000
Received: by outflank-mailman (input) for mailman id 383876;
 Wed, 10 Aug 2022 19:30:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPG-0005rf-SD
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:18 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd77d49b-18e2-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 21:30:18 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id u24so4284861qku.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:18 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:16 -0700 (PDT)
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
X-Inumbo-ID: dd77d49b-18e2-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=9qPwuueNZm/jcjcA5mRF9P33JC4lKfZl/P5JBTr94o4=;
        b=qKAG0HqqmzibDAPGZjBSA0kiIYuYzdmb0zZoads/iQdBG8A7PgXzYHhfh+j7zdqdVz
         xbuER1rOhoCSA0laa2+APXLTU0JDx4Q8uoyUHrAyYhqliCotvf7lXYzIUQSBvO0tu6vB
         OBSPsoi+QsUaRNl8WL5RoA+Bp086yIeGBOrD8Bz/vNr55psf6aQ9j73T7KlXHRaVyoYa
         NV84Cthd10uBB9KuNhzz4gwUo34bx3BA3piAwbyK8vg+7CMUwVpW8fVykseeg7RlETKR
         QOHkCXNFhRCpt6xdcZ5gzyMnlFa5dctWq8QCo5KI75CD/t5F4wzVBQG4ycdqYkMCf60R
         9l2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=9qPwuueNZm/jcjcA5mRF9P33JC4lKfZl/P5JBTr94o4=;
        b=qya7G7ijhkyGqBnVK327LyZuTY65TB9EtDDV4P/bfr+4T5QVMvXMLIba4BsBEcdZAq
         z5s576RAcwiS4ZSwBeS09Qs1u7yttdA+oCiYNK0hRatfQzljtEzqK3JqGISwieLggyAT
         h7XHBJzpzz2w7YLOjAgEMqkV7gK8/4/FNN7ArN3t9ztAHZ3a5A4E18J3rkietURQN3LL
         iRfGtbsy6GUqHV5Ru/gjq0W6nCdIfUrpa6IMsufV0S5z+9irdJ0YiIvNkhBQN9urI35b
         Nz1WJP3AkGSotGBZT3mRD+oJA9N9qoOygfsPAUzNePnQpn+llMH92bnKQh0LCGfLDSZE
         bqTA==
X-Gm-Message-State: ACgBeo3JF0eytFm73jeH1GJdRCyfj+cZSv3m/JZXtUA+iFoi4XRCC/Ii
	h5PZdAuouZG3pJAR2/6rIsFWLaxrK10=
X-Google-Smtp-Source: AA6agR6/Et9og/kzf2RoDfeBn3P2dcpIpHBiLBAQgPI/jBOOhd5bkU4Ij8/0yxxVzB/1wSNVwe/n2A==
X-Received: by 2002:a05:620a:1026:b0:6b9:7884:1a6c with SMTP id a6-20020a05620a102600b006b978841a6cmr6868039qkk.664.1660159816780;
        Wed, 10 Aug 2022 12:30:16 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 03/13] cpufreq: Export intel_feature_detect
Date: Wed, 10 Aug 2022 15:29:34 -0400
Message-Id: <20220810192944.102135-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export feature_detect as intel_feature_detect so it can be re-used by
HWP.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2
export intel_feature_detect with typed pointer
Move intel_feature_detect to acpi/cpufreq/cpufreq.h since the
declaration now contains struct cpufreq_policy *.
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 8 ++++++--
 xen/include/acpi/cpufreq/cpufreq.h  | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index ded0150b3b..b5eb869227 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -340,9 +340,8 @@ static unsigned int cf_check get_cur_freq_on_cpu(unsigned int cpu)
     return extract_freq(get_cur_val(cpumask_of(cpu)), data);
 }
 
-static void cf_check feature_detect(void *info)
+void intel_feature_detect(struct cpufreq_policy *policy)
 {
-    struct cpufreq_policy *policy = info;
     unsigned int eax;
 
     eax = cpuid_eax(6);
@@ -354,6 +353,11 @@ static void cf_check feature_detect(void *info)
     }
 }
 
+static void cf_check feature_detect(void *info)
+{
+    intel_feature_detect((struct cpufreq_policy *)info);
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
2.37.1


