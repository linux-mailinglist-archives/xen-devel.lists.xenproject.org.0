Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D8073068B
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549115.857486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqN-0005zO-0O; Wed, 14 Jun 2023 18:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549115.857486; Wed, 14 Jun 2023 18:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqM-0005uo-Sq; Wed, 14 Jun 2023 18:03:42 +0000
Received: by outflank-mailman (input) for mailman id 549115;
 Wed, 14 Jun 2023 18:03:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9UqL-0005LA-5G
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:03:41 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id caba7099-0add-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 20:03:40 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-75eba89e373so136308685a.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:03:40 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:38 -0700 (PDT)
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
X-Inumbo-ID: caba7099-0add-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765819; x=1689357819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlkDpnzBOrYGbDVTZSSMEmRPTHTcziXTR1AlOBlC9P0=;
        b=AXnywO9drA3Q8W6DRI1x3EOkjYsJTjm66pGvWIuNfbh9MCYQf9DnHPNj0kPKgBCcJk
         5YZwfxOlkJZilJT9HNdET11GHbG2MAW6vGFdnR9GrD3pzwmG8hN6yzA8yoJFniWOICfg
         52qEe1JjedvdvS+rPiIeXIi/2ODtHrEjIdjIoCaels7dA/o7U05Y0J+FO0nDGEWyCs8O
         rs28/5dz/gzyeiOpwZnYJFL+XI1R6dkCMwrDYbaLbJNTs3b4MaGR86DSlO/mbHwi1XbP
         UYbzL/VTU2qzOLqQjvwj974CBVoGYL+XF1V/pWMR9PQEH/AnKDsnFxF9JyB0DkSjC57+
         ic8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765819; x=1689357819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlkDpnzBOrYGbDVTZSSMEmRPTHTcziXTR1AlOBlC9P0=;
        b=GHFUF2rWg9kYUr1k33d6f5FaCbUOlsgEM5EKzhUE45XPYOTila4XYqQ6H1Bm3UwE7/
         Wn731Pc1OG86oyPMNs3w4y+VhTeKgsH+zy08Yv3pSzC4gk6P0iZWTJGs4VEqHswLz1vX
         YLxJQ8FxXsmujHZ3mQLo/kOUrSfYB/qter940e7bpGzklyv5QEx/YP3anTlaJVbBzNcB
         vx8gHjZ6cAiSAwNPee28wzzcDz8MvyF0NvLhqEsVIiFUI7xxjWyetSnIV3PRcKTOeeyZ
         4q9jgpjOlPzvIN+ZvminCdI/1hliw53DksPtYXyX0CDx7tD5Ro4ouU3TLMeS/qzpdQ8J
         KiPQ==
X-Gm-Message-State: AC+VfDyrxw+iPWpC8L29E0Nkd0MK0DKjuee+nPjG2cfLqNFyUCTEO9wi
	kdegYchdPpbSoQ0hMj2gwvSH0QvKPic=
X-Google-Smtp-Source: ACHHUZ5R/W/a+GmZ21I2JuypJPX5nA4naO0DoMZMZaZAwUhz2FeSuuwZnCLdEm4hEUjr8RHGi7G6EQ==
X-Received: by 2002:a05:620a:4686:b0:75f:828:3c52 with SMTP id bq6-20020a05620a468600b0075f08283c52mr2758989qkb.3.1686765818943;
        Wed, 14 Jun 2023 11:03:38 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 03/15] cpufreq: Export intel_feature_detect
Date: Wed, 14 Jun 2023 14:02:41 -0400
Message-Id: <20230614180253.89958-4-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
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
index e2e03b8bd7..a49efd1cb2 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -244,4 +244,6 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
 void cpufreq_dbs_timer_suspend(void);
 void cpufreq_dbs_timer_resume(void);
 
+void intel_feature_detect(struct cpufreq_policy *policy);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
-- 
2.40.1


