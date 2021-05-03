Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6B2372075
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121825.229816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeFh-0006OJ-P5; Mon, 03 May 2021 19:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121825.229816; Mon, 03 May 2021 19:29:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeFh-0006Na-LS; Mon, 03 May 2021 19:29:09 +0000
Received: by outflank-mailman (input) for mailman id 121825;
 Mon, 03 May 2021 19:29:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeFf-0005i5-Jn
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:29:07 +0000
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4ed6410-658a-4a0f-b3e0-88195cd685b6;
 Mon, 03 May 2021 19:28:49 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id x8so6283459qkl.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:49 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:48 -0700 (PDT)
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
X-Inumbo-ID: e4ed6410-658a-4a0f-b3e0-88195cd685b6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gt85a9/jfQ7Ok17ZWY+qwgah9qHuJa+K9OUnjKLsOOc=;
        b=m22f79isZGNQAsYaUIL3/HfQVDpVWzxexpINlOO7hIcVSY8G1Z3YESSEokpdYnOQ6L
         ufFHbXjfy5TsQpgDkum9bIdbZ54wXP5ix2KuyWgd8ab1SeWYd/V+rCEPIlO9P864Mfjc
         gnw0Az+nem/YdygO/CAen/ToQa9H/d4S/1/F/oNLNqc2sA7COQOT0ay6JP/cujrcqiRA
         FDh16mVHQDxquhIGGmKtg8XpvN1SwdPqcwEy903e1B3LaNyrBR42sXw1uqqg53o1kFdH
         TP1+7ipZeIxSMpU6CWn5KMPEfLkbeyArvRhuvoaad0BGn5XwHju6x+Gn6xZc2KG89We1
         qGHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gt85a9/jfQ7Ok17ZWY+qwgah9qHuJa+K9OUnjKLsOOc=;
        b=Nfaf4FAs7rID2AMuKS7VPONwLlBKH6e6275urV1JW44vt0ZKvG2Fuld0tzbaTEHzqO
         X59gT2vdKOzjN7OHhckNwzLBRxOpCqVures7MYYaza0Ae5DUAG5bvhXqJe8gggTag+YR
         cfwG3awdan5/gJbktCt33sxpbzUCRtvSNqAl8GUSn9Angdd1Lk/hmdR4eGIKQQ/6LDdD
         9qTkmAhAr/m+kksUFi535Zgp8eSEXCrVWfs2WW17xYOjRpUmZa8vnFx2242HN/kpl1RS
         8sIEFpX16d6ZN41FMYEXk9hxLniJhuviwuTnfzz3KuEZjkp0aHT+Us5vPxlS8MrkOty+
         5Q8g==
X-Gm-Message-State: AOAM533Aqo4MHR1bIo6VI9huVOdiUIG3oWS5egRdlvMVINUcMJmVeIyX
	wdV4ykKss0j9Zq80g08bDQpBh4pC7HY=
X-Google-Smtp-Source: ABdhPJz/03LMfmKp0x6zG8POk2wzTrZRWriHbDwMe0oz2I8oEm/pX7v3mJQspxQxqeARe/iXRkXpjg==
X-Received: by 2002:a37:a683:: with SMTP id p125mr14770669qke.332.1620070128657;
        Mon, 03 May 2021 12:28:48 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 08/13] xenpm: Print HWP parameters
Date: Mon,  3 May 2021 15:28:05 -0400
Message-Id: <20210503192810.36084-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print HWP-specific parameters.  Some are always present, but others
depend on hardware support.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/misc/xenpm.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 562bf939f9..9588dac991 100644
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
2.30.2


