Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 767E06F3773
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528103.820879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEa-0001Px-Vt; Mon, 01 May 2023 19:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528103.820879; Mon, 01 May 2023 19:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEa-0001NW-Rz; Mon, 01 May 2023 19:30:52 +0000
Received: by outflank-mailman (input) for mailman id 528103;
 Mon, 01 May 2023 19:30:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZEZ-0000m4-Bd
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:30:51 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adfbb034-e856-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:30:50 +0200 (CEST)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-3ef302a642eso13479981cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:30:50 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d6-20020ac80606000000b003bf9f9f1844sm9351784qth.71.2023.05.01.12.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:30:48 -0700 (PDT)
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
X-Inumbo-ID: adfbb034-e856-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969449; x=1685561449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txBzmZlgf2a5ZApasbIDD2P8VUrWanxh/ZCZKapkSd4=;
        b=ruWWxubqxWEfgknzCeHfuioXix3neQCmP3+a25TdXUf2lY/OXFPt8Fw7bOACTmeMj9
         W6lzbRO4CQm8VUxPYOZhHZE9MAixtoaCcKrnatX2CtjIGctgcqhiDy42JfMp7IiwQsJ2
         pJORAvC5p1oFLI9ZU2fPomLTuylha83HfbB0PRFixRqg6vC0BYsOt3O8hjTzKeInVEdB
         xETcc6syUMfOhifQLASnke2KU3HfyTwJkOGtQEYC2WBE1K5fATNr2/dHtxgsu261Kbce
         +eSDtdfkJ8r4k8f/c73OadVqX97fNky9tSHYk/+MBR2Gh0dmKpPjUK3U/1WOM4cjGqT8
         qyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969449; x=1685561449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txBzmZlgf2a5ZApasbIDD2P8VUrWanxh/ZCZKapkSd4=;
        b=lRDxUe0u80tEBUo92bxCtRWM89Hy/Fw3aGEIRyMdP2PTUrIr2heCD6Tw0J1ELx2T+k
         kvzOWfk7ttslKi9QWHDo17AiiosT1bsSntJo1bjoA9d/M7UH9ItDYQf60f+qtFKtQfBJ
         a1sUADMWndydb1dJS44dp6IdNuPVzkmFshlM1JUM4MSQCDDoq6OyIPR4btn9Rsja0vUU
         TmWsF3DWL6kgbprf/92dHaQaifLGalJ3WXJ380y8hthwzRKi7Uhukrq+llE5lhGWYUMx
         3LI0cKVLhbRJwBWb3VZuvoDju4ALAyYcbpj6q64dLqyRBgOMWnaZXnIWcB26PyJMCMTo
         DNZQ==
X-Gm-Message-State: AC+VfDz2ZyXgNv5NVJHbm+h+AJUvo12iPoBEfAROIVdOAPKtibh8Xq7Q
	E1q2aR2C8nus3W2KoD2ACU8ntOmiLfQ=
X-Google-Smtp-Source: ACHHUZ6w3eawFGc/l9nZiVmnOOvz/C0aG06cvY9N0n+NkCEj6Vg7LQZ4xbldKhhvalrOwWvRbT6aDw==
X-Received: by 2002:ac8:7c50:0:b0:3f0:df4d:40b7 with SMTP id o16-20020ac87c50000000b003f0df4d40b7mr24378669qtv.7.1682969449211;
        Mon, 01 May 2023 12:30:49 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 02/14 RESEND] cpufreq: Add perf_freq to cpuinfo
Date: Mon,  1 May 2023 15:30:22 -0400
Message-Id: <20230501193034.88575-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501193034.88575-1-jandryuk@gmail.com>
References: <20230501193034.88575-1-jandryuk@gmail.com>
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
index 0da32ef519..a06aa92f62 100644
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
2.40.0


