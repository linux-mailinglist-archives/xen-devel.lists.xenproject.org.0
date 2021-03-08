Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E60331900
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 22:03:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95093.179450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1t-0006z4-01; Mon, 08 Mar 2021 21:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95093.179450; Mon, 08 Mar 2021 21:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1s-0006yB-QX; Mon, 08 Mar 2021 21:03:04 +0000
Received: by outflank-mailman (input) for mailman id 95093;
 Mon, 08 Mar 2021 21:03:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odrr=IG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJN1q-0006P0-JW
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 21:03:02 +0000
Received: from mail-qt1-x829.google.com (unknown [2607:f8b0:4864:20::829])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af455b62-6776-4542-b122-5dd34a88e29a;
 Mon, 08 Mar 2021 21:02:39 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id d11so8625308qtx.9
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 13:02:39 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a33e:daa7:46a1:a7eb])
 by smtp.gmail.com with ESMTPSA id
 r2sm8514070qti.4.2021.03.08.13.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:02:38 -0800 (PST)
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
X-Inumbo-ID: af455b62-6776-4542-b122-5dd34a88e29a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N7yhEOqzJ0+x+JlQs3Sjsvl85JThC2zfENNxFodtLhk=;
        b=XwM+qLg2re6gp7d448+Z4XdF/EiedVpR0jSynMw3g0qTHhS+Schv8AjGvL+oKpNBcs
         aEEDdUOtQqtTmnZou2IGTaWScV60rmV3M77Qi4OzeRe5pbz4+3r14j2xh4/ZD9A8M/if
         pYeBWXijdo3EIVNXKgw1UhHD3YYZJ4iRqcLCl/kKogzReEEQDFU2MfLzprkBCslk1Hwh
         u7XytJhJSDyx36+Wq6c2Da+mdBXEh+CMID5qDo9/aqpzGx2p5pkUsAvZqHgYGNJvWcxn
         3Rrv1pT6jaSyFusmAzGA8N5fuw93FhJBQcvztMZeP5ZS2Cp71fkluy6xbYy4jeYrpiWn
         IwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N7yhEOqzJ0+x+JlQs3Sjsvl85JThC2zfENNxFodtLhk=;
        b=RiHfa1JTGh2w71SVvqDmoYYSL8GrhtlOwV4ZKUZQKs3VHpiBx+QtJPGKNwsNDD/4Ye
         HbB7Vqn3A8685P5OE3vsn5769Rp6ETIBFNsMNJWhuTN76HDsztu6znLtKTTRXHOg3kEa
         cS9d0GWmP5vXebkW8hIxzRNDdwys9AzH3oSINR3hQOA5ohW9UwQoZANy6quleycc0/y0
         /AyGZs7EvMYVLBwP9pZAW++TnrNmPYST7NeOtZzAEFHtD0AZJOGsM3PrAjWu0TDfF9GU
         iuJHrgueeXrzeAwg3qPw2maKdX+xPRZjUuzEMlAwpijdx407LJHaDo+YbpTceW+uBq/D
         bA3Q==
X-Gm-Message-State: AOAM532J+447TjJFohYC2dUPkZMr0eHFgRj9SBfr5R5rZZWlu7Ofn2s2
	/sdscRf3ByU3mj1Wj0A68MnN1z1kJrM=
X-Google-Smtp-Source: ABdhPJwf/dEzlun0+1V5RJMcQcxl6otvf+cIsUSOblP40ak/2X+oSRlaOUr+jhESxrlKhl+kVu61eg==
X-Received: by 2002:ac8:6988:: with SMTP id o8mr22523226qtq.24.1615237358791;
        Mon, 08 Mar 2021 13:02:38 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pawel@invisiblethingslab.com,
	marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC 08/12] xenpm: Print HWP parameters
Date: Mon,  8 Mar 2021 16:02:06 -0500
Message-Id: <20210308210210.116278-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308210210.116278-1-jandryuk@gmail.com>
References: <20210308210210.116278-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print HWP-specific parameters.  Some are always present, but others
depend on hardware support.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/misc/xenpm.c | 75 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 2 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 35223b98df..9588dac991 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -708,6 +708,43 @@ void start_gather_func(int argc, char *argv[])
     pause();
 }
 
+static void calculate_hwp_activity_window(const xc_hwp_para_t *hwp,
+                                          unsigned int *activity_window,
+                                          const char **units)
+{
+    unsigned int mantissa = hwp->activity_window & 0x7f;
+    unsigned int exponent = ( hwp->activity_window >> 7 ) & 0x7;
+    unsigned int multiplier = 1;
+
+    if ( hwp->activity_window == 0 )
+    {
+        *units = "hardware selected";
+        *activity_window = 0;
+
+        return;
+    }
+
+    if ( exponent >= 6 )
+    {
+        *units = "s";
+        exponent -= 6;
+    }
+    else if ( exponent >= 3 )
+    {
+        *units = "ms";
+        exponent -= 3;
+    }
+    else
+    {
+        *units = "us";
+    }
+
+    for ( unsigned int i = 0; i < exponent; i++ )
+        multiplier *= 10;
+
+    *activity_window = mantissa * multiplier;
+}
+
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
@@ -721,7 +758,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
         printf(" %d", p_cpufreq->affected_cpus[i]);
     printf("\n");
 
-    if (internal)
+    if ( internal )
     {
         printf("cpuinfo frequency    : base [%u] turbo [%u]\n",
                p_cpufreq->cpuinfo_min_freq,
@@ -760,7 +797,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
                p_cpufreq->u.ondemand.up_threshold);
     }
 
-    if (!internal)
+    if ( !internal )
     {
         printf("scaling_avail_freq   :");
         for ( i = 0; i < p_cpufreq->freq_num; i++ )
@@ -777,6 +814,40 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
                p_cpufreq->scaling_cur_freq);
     }
 
+    if ( strcmp(p_cpufreq->scaling_governor, "hwp-internal") == 0 )
+    {
+        const xc_hwp_para_t *hwp = &p_cpufreq->u.hwp_para;
+
+        printf("hwp variables        :\n");
+        printf("  hardware limits    : lowest [%u] most_efficient [%u]\n",
+               hwp->hw_lowest, hwp->hw_most_efficient);
+        printf("  hardware limits    : guaranteed [%u] highest [%u]\n",
+               hwp->hw_guaranteed, hwp->hw_highest);
+        printf("  configured limits  : min [%u] max [%u] energy_perf [%u]\n",
+               hwp->minimum, hwp->maximum, hwp->energy_perf);
+
+        if ( hwp->hw_feature & XEN_SYSCTL_HWP_FEAT_ENERGY_PERF )
+        {
+            printf("  configured limits  : energy_perf [%u%s]\n",
+                   hwp->energy_perf,
+                   hwp->energy_perf ? "" : " hw autonomous");
+        }
+
+        if ( hwp->hw_feature & XEN_SYSCTL_HWP_FEAT_ACT_WINDOW )
+        {
+            unsigned int activity_window;
+            const char *units;
+
+            calculate_hwp_activity_window(hwp, &activity_window, &units);
+            printf("  configured limits  : activity_window [%u %s]\n",
+                   activity_window, units);
+        }
+
+        printf("  configured limits  : desired [%u%s]\n",
+               hwp->desired,
+               hwp->desired ? "" : " hw autonomous");
+    }
+
     printf("turbo mode           : %s\n",
            p_cpufreq->turbo_enabled ? "enabled" : "disabled or n/a");
     printf("\n");
-- 
2.29.2


