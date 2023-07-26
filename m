Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACD4763D48
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570633.892614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi1q-0006OT-Ig; Wed, 26 Jul 2023 17:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570633.892614; Wed, 26 Jul 2023 17:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi1q-0006L9-Em; Wed, 26 Jul 2023 17:10:26 +0000
Received: by outflank-mailman (input) for mailman id 570633;
 Wed, 26 Jul 2023 17:10:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi1p-0005nP-2d
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:10:25 +0000
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [2607:f8b0:4864:20::72b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e13bdb8-2bd7-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 19:10:22 +0200 (CEST)
Received: by mail-qk1-x72b.google.com with SMTP id
 af79cd13be357-76714caf466so3088285a.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:10:23 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:10:21 -0700 (PDT)
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
X-Inumbo-ID: 4e13bdb8-2bd7-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391422; x=1690996222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tj29XCVclI+6QGR1ahwKo+P0a4dIzt4OqPyhJ7hCJ/k=;
        b=eiNoAZOOGxuceqVWp2ammLbsp+637AYhLdnzo/0ZgxzBvrtaq/7uczbqwToMHwCL9E
         oP32llNkDgxa8zP4LsbwJoqD16+zUHi78FHC9YjOSXyKZ5uxvGUOLg1nHOjC6wPD+zWi
         sYu5S4u6biDs31r7OwSU5St5l8xkNlmAUI/qPBnmWqh3lZzikIuv+yx1KV1zGv1tO3/9
         fnrI4zs7ewI7Inv00OkJt0SxMICp3IxGFLEeRJZ74Z7gO3NQqLTmtkIh7mVao1N7DDUA
         RhoBzKygdg0ei/g21svSV5bhFi7J1W4MmMdIx+BlIOmk7ssiMESmezgf437BqkCeQFTV
         0R+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391422; x=1690996222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tj29XCVclI+6QGR1ahwKo+P0a4dIzt4OqPyhJ7hCJ/k=;
        b=SPj/4Bd8rxqm+LULiosc7LsGRMJp6qIuStOoD/mOf0G73Zt/K3nhpVRWTVstH12GGn
         lq1YT4GVAIWahqv8NoHzySXRA5k5jsiCJOc8uLaX9aGZzsVSPTAjq0f4Ab5qk0eSts1c
         9umej9Si+kYS5A8p1NgPVKQ7WLx7Ij3gjxx/3NkaObja1NhRvZNMOiRlufvPrzREBBPQ
         TRhw7IW6xg90vqC5D05aCdJKtWI42FurRyqf6lmYqMPxnQspAxVNq+BZJyW2uW1MRFeY
         cB9ZfZg11spYUSkCg/I59VAJVxK/iX2th3aGhKff7SRRKhgP4tZzGkEp4gSuNJasLAd3
         xCdQ==
X-Gm-Message-State: ABy/qLZTA7CmW33FaPhdklilMLFSEGEe0SOA0qcKvt+mIh9/JJuxhtfh
	Dst5MJqje9YWl5v4FV3urEmT7syTZi8=
X-Google-Smtp-Source: APBJJlH48lxLuLRRThOdDWjI4a2VBOKN76LvDeNPxc5mjqX3/N56ultLiZRko5Yq4i6oiox/KX6AjQ==
X-Received: by 2002:a05:6214:5294:b0:637:85e3:2a2d with SMTP id kj20-20020a056214529400b0063785e32a2dmr2779361qvb.58.1690391421785;
        Wed, 26 Jul 2023 10:10:21 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 02/15] cpufreq: Add perf_freq to cpuinfo
Date: Wed, 26 Jul 2023 13:09:32 -0400
Message-ID: <20230726170945.34961-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726170945.34961-1-jandryuk@gmail.com>
References: <20230726170945.34961-1-jandryuk@gmail.com>
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
index 44fc4c58fc..1f1898d811 100644
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
2.41.0


