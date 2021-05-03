Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA8A37206A
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121806.229745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeF7-0005oI-L3; Mon, 03 May 2021 19:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121806.229745; Mon, 03 May 2021 19:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeF7-0005nf-HK; Mon, 03 May 2021 19:28:33 +0000
Received: by outflank-mailman (input) for mailman id 121806;
 Mon, 03 May 2021 19:28:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeF6-0005i5-Ie
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:28:32 +0000
Received: from mail-qk1-x72b.google.com (unknown [2607:f8b0:4864:20::72b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4ea1e9d3-6db0-433a-9af7-bf527518f5d2;
 Mon, 03 May 2021 19:28:30 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id i67so3146897qkc.4
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:30 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:29 -0700 (PDT)
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
X-Inumbo-ID: 4ea1e9d3-6db0-433a-9af7-bf527518f5d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o6aeco73TVtnG2vnCKcrrr9RATvAYWd7uArT6elgZ4M=;
        b=jM9llCt0QXCGnbPlb2cvcWJKAmrDSwo4oWznuSXdih4WXdBIIY4x+Yysl99fS+iCtn
         K9hA03/FWdkpL2tmB6NjdnJaqql+sc+6eIL+mfxpMi2Fhkj75eF5IGrtQl+38SCjKGAf
         p4c8czJCGJODZux5wP737n2+HFbKfGOP4nJaeDCkGDIV8P+A6oNYFFBJk7cM3mTLhSTE
         re3LhBQd3hHCToEu/ZXmTnOPyVhvA6zCEJmyf0v31gy9m5sW6R862AlUJX1BUwvMXGNX
         62Xc/51OOE6g3uPf2Evvq80SkGeaDXUO94f0bhIrQWcX7917rGllkm17dViKf2tBIfSA
         FoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o6aeco73TVtnG2vnCKcrrr9RATvAYWd7uArT6elgZ4M=;
        b=g8iEJflMYM7i7doqae5epiTktyLcCiEqc0Z0Pu6xsUm1NayH8w3G65PXC7MbNoXkxw
         VyVQY0BZ1pHq2xUIhsTFiWcE8BYiWOSGWXpDE1qm5hfMmL+EwzAyuMxXm7njbKOsbbmL
         QuPw15GzWjs7dlUwkqIYeRpA8MjhS63fkUOTLUdI8Eq+l1yqqIfpXFoDgXK97RUCW/mR
         9qyDRJYvMzMlw0bX5RQ25SZ+JXG2j+7hCGK1s5GeuzTJgFIZWAokD4epTwqBTC/i1Hdu
         osE5+jyXIl0A/vBQqAhbpdbOypSAbEeZpmpIAwsTqvlM+M71qlrfXIOQQP6QWuM9JaJq
         xm8g==
X-Gm-Message-State: AOAM533vM9Fbv62N4S+5VdM3Zvk6gl67w+7NIBr8fBd41aQGG54kNHeF
	q5rhJ6O7ZJam4oVrsMuGKxWyKNzmcYQ=
X-Google-Smtp-Source: ABdhPJzy3E49jxtVyfMBYZkW+p55Hjn3fb981MdlPPXBkc0anCD6xoEj5zqOSMI3ZDWCGDmaiPnFJA==
X-Received: by 2002:ae9:df46:: with SMTP id t67mr20677355qkf.269.1620070109951;
        Mon, 03 May 2021 12:28:29 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 02/13] cpufreq: Add perf_freq to cpuinfo
Date: Mon,  3 May 2021 15:27:59 -0400
Message-Id: <20210503192810.36084-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

acpi-cpufreq scales the aperf/mperf measurements by max_freq, but HWP
needs to scale by base frequency.  Settings max_freq to base_freq
"works" but the code is not obvious, and returning values to userspace
is tricky.  Add an additonal perf_freq member which is used for scaling
aperf/mperf measurements.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
I don't like this, but it seems the best way to re-use the common
aperf/mperf code.  The other option would be to add wrappers that then
do the acpi vs. hwp scaling.
---
 xen/arch/x86/acpi/cpufreq/cpufreq.c | 2 +-
 xen/drivers/cpufreq/utility.c       | 1 +
 xen/include/acpi/cpufreq/cpufreq.h  | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index f1f3c6923f..5eac2f7321 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -317,7 +317,7 @@ unsigned int get_measured_perf(unsigned int cpu, unsigned int flag)
     else
         perf_percent = 0;
 
-    return policy->cpuinfo.max_freq * perf_percent / 100;
+    return policy->cpuinfo.perf_freq * perf_percent / 100;
 }
 
 static unsigned int get_cur_freq_on_cpu(unsigned int cpu)
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index b93895d4dd..788929e079 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -236,6 +236,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy,
 
     policy->min = policy->cpuinfo.min_freq = min_freq;
     policy->max = policy->cpuinfo.max_freq = max_freq;
+    policy->cpuinfo.perf_freq = max_freq;
     policy->cpuinfo.second_max_freq = second_max_freq;
 
     if (policy->min == ~0)
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 56df5eebed..b91859ce5d 100644
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
2.30.2


