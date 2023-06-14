Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941673068E
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:03:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549114.857481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqM-0005uj-Qh; Wed, 14 Jun 2023 18:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549114.857481; Wed, 14 Jun 2023 18:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqM-0005sU-L4; Wed, 14 Jun 2023 18:03:42 +0000
Received: by outflank-mailman (input) for mailman id 549114;
 Wed, 14 Jun 2023 18:03:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9UqK-0005L9-NB
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:03:40 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c95a91c6-0add-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 20:03:38 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-62de651bcf0so20024736d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:03:38 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:35 -0700 (PDT)
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
X-Inumbo-ID: c95a91c6-0add-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765816; x=1689357816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5tkXnrNUw3eHjvmXo8drCoxp1uJZERpOt4e3aBqvlI=;
        b=WfNbPQT1HJVztPPCPFYHumWFQ4f9i6Y6tO82zr5G78mf9uA5aklvR2FPBCyzFESLQv
         HamDDASz8qUWFCp+If5uMty6mI5slouwmLtdsV+Z/wD3To1tw8w5l+U0yvu1GzWWF7qB
         omC+MMuiNiqjmlUmT2K1td73nlWj1CyVmUThHbHTtKWcYig5dwjZzL3EUi6PaiJIc85u
         zRDr1JhCW1j/fvWPRLJU+PFqcmHsNS2e3C9fkTEefjH/tGcPaLvZjhGNnACmDi32l2mj
         1LRWuFsoTGiMltuqEXyNOSvA7pn7XOZs6scE45qlGB2NYCYMq1DL0/JgjFMPiE/ofZEo
         QIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765816; x=1689357816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5tkXnrNUw3eHjvmXo8drCoxp1uJZERpOt4e3aBqvlI=;
        b=iTTK6LDSP6lCQvYnNHHuK2jDEznmdipTrLDOb6MgiHYWzYK3Mve6LELsd4uHGyJq8q
         3TOx1qxajdweVizGf3gNBRzhQlGUbCG8sRC9uFzQF0erlRnQf+oWdcyeHr2NQDJ3crXv
         s4+y6xTHcKby6CGzCH3Z3JjjKq/fDi9Tj9pQbrLMP9YgznS/b6fAS2W8gWGYKKKCkzVO
         yDBfIzopeus5LhHZwUp4+SSyHKVFNlf8tqbPmkccB8g9N22HgvKvIOSrYNaPg2k2GnJi
         LyzKr5ZNBNpnD4ACjFtPqeJOHjffg6fe6uEnY7l3rka+w8L8/5lE8Q5b+k8C6E3xObKo
         NNWA==
X-Gm-Message-State: AC+VfDw4JUqDW1ZaXVl8F3qOZsJRbg1p9q+xyFec9MSmaAv8T90BkS71
	+uQiKvqujTvp0ad9juPqof1vlEYg/+c=
X-Google-Smtp-Source: ACHHUZ7qj8JSis1q8yl+rMlAnzFRNgXrHEu7PaDjBjBcTiPdQNLM8Dlr3ErwVNhse3Hbf2SgHdmbUg==
X-Received: by 2002:a05:6214:5016:b0:62f:ebc4:89bd with SMTP id jo22-20020a056214501600b0062febc489bdmr750110qvb.63.1686765816353;
        Wed, 14 Jun 2023 11:03:36 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 02/15] cpufreq: Add perf_freq to cpuinfo
Date: Wed, 14 Jun 2023 14:02:40 -0400
Message-Id: <20230614180253.89958-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
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
index 1c0872506a..e2e03b8bd7 100644
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
2.40.1


