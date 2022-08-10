Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B5058F30F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383879.619130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPN-0007D0-Cq; Wed, 10 Aug 2022 19:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383879.619130; Wed, 10 Aug 2022 19:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPM-00078l-VZ; Wed, 10 Aug 2022 19:30:24 +0000
Received: by outflank-mailman (input) for mailman id 383879;
 Wed, 10 Aug 2022 19:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPL-00067E-IQ
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:23 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e03a6b5e-18e2-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 21:30:22 +0200 (CEST)
Received: by mail-qv1-xf2c.google.com with SMTP id l18so11710839qvt.13
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:22 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:20 -0700 (PDT)
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
X-Inumbo-ID: e03a6b5e-18e2-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=rqMgcE4Oac0416vvAOiMSA4SrnvTMeuV9YAjTBvnyLM=;
        b=c1RoHlkCEWondmxQPEyoI0ZUa88s/sfMV7IFD3o1eO5ibI6vDW5UOqB3+rR29Vfd9X
         uJOnOE31Idn+uWnR1eh5ApWDAcJvn9ZzwN5x4yABO7IlUMRo88Xv27SDhelVOgI0fyt7
         7XTcf5DI2/I0kWo91UVcH/bin5EOk6bOi4krcpPMx0lFSEwct2LqbCSgvPx+W9sfGOpB
         6EnHlHR0lVGhWJyGGAdNRCjzgEcg/Mv4Y9z9IapK2gqTmtWn/J0dtC+rUIw/ZTg6E5eA
         preSsXc2WFKBuAflenTeDF9l9B226naJ8VRClCsM4TySxAQyRwZvG5IDbvPGQ7Rq5r3R
         npOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=rqMgcE4Oac0416vvAOiMSA4SrnvTMeuV9YAjTBvnyLM=;
        b=FRguijjFv2UqmPW1j2vPuF4ueIXaV617lcUn6/gVxRjRvf4dFYEkr/z2/LrqS3ekgc
         1kggzxGzIkpXn6GHJpnk0kNZtvR3p/FZyaybzwHrDT91tvByXMDEU//q4EthB/JrnnvV
         UTPyQGBoXvIj273479hW08pJTL7A1O9iIAE3iK1LIjLNdRBQSHgo7SfOxc0FUFP/LUfg
         X1AMlQMHg4jjDYk84qMS7OZ8y2NJEMkw/5d+o3lImtNFquTxVqR9tvfMbVceMlOKZXtV
         KDw+s+U2Xb5YBfquP3nCMJTz/nwUNYuvs0ejlCDXiYhye2AgZsqfJVg1p+iolNO5o7ut
         C2BA==
X-Gm-Message-State: ACgBeo0NTuazqNdu09y2TY7KjlJP1mKYVBfKesING7QVdbP6YMW8qk4m
	XWgSIMQyzZUETMdUTwPfFuFFJExTLgE=
X-Google-Smtp-Source: AA6agR5zmnvx/9hysTrDH3OmwaYLu83NMOvLqj3obI+NldcUtFs6ywO20hZPDCPlhkSSiaQROmmtTQ==
X-Received: by 2002:a05:6214:23ca:b0:474:8c8:4fdf with SMTP id hr10-20020a05621423ca00b0047408c84fdfmr25321370qvb.89.1660159821373;
        Wed, 10 Aug 2022 12:30:21 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 05/13] xenpm: Change get-cpufreq-para output for internal
Date: Wed, 10 Aug 2022 15:29:36 -0400
Message-Id: <20220810192944.102135-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using HWP, some of the returned data is not applicable.  In that
case, we should just omit it to avoid confusing the user.  So switch to
printing the base and turbo frequencies since those are relevant to HWP.
Similarly, stop printing the CPU frequencies since those do not apply.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Use full governor name XEN_HWP_GOVERNOR to change output
Style fixes
---
 tools/misc/xenpm.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 4f8cde690a..179f9f1f96 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -711,6 +711,7 @@ void start_gather_func(int argc, char *argv[])
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
+    bool internal = strstr(p_cpufreq->scaling_governor, XEN_HWP_GOVERNOR);
     int i;
 
     printf("cpu id               : %d\n", cpuid);
@@ -720,10 +721,15 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
         printf(" %d", p_cpufreq->affected_cpus[i]);
     printf("\n");
 
-    printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
-           p_cpufreq->cpuinfo_max_freq,
-           p_cpufreq->cpuinfo_min_freq,
-           p_cpufreq->cpuinfo_cur_freq);
+    if ( internal )
+        printf("cpuinfo frequency    : base [%u] turbo [%u]\n",
+               p_cpufreq->cpuinfo_min_freq,
+               p_cpufreq->cpuinfo_max_freq);
+    else
+        printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
+               p_cpufreq->cpuinfo_max_freq,
+               p_cpufreq->cpuinfo_min_freq,
+               p_cpufreq->cpuinfo_cur_freq);
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
@@ -750,19 +756,22 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
                p_cpufreq->u.ondemand.up_threshold);
     }
 
-    printf("scaling_avail_freq   :");
-    for ( i = 0; i < p_cpufreq->freq_num; i++ )
-        if ( p_cpufreq->scaling_available_frequencies[i] ==
-             p_cpufreq->scaling_cur_freq )
-            printf(" *%d", p_cpufreq->scaling_available_frequencies[i]);
-        else
-            printf(" %d", p_cpufreq->scaling_available_frequencies[i]);
-    printf("\n");
+    if ( !internal )
+    {
+        printf("scaling_avail_freq   :");
+        for ( i = 0; i < p_cpufreq->freq_num; i++ )
+            if ( p_cpufreq->scaling_available_frequencies[i] ==
+                 p_cpufreq->scaling_cur_freq )
+                printf(" *%d", p_cpufreq->scaling_available_frequencies[i]);
+            else
+                printf(" %d", p_cpufreq->scaling_available_frequencies[i]);
+        printf("\n");
 
-    printf("scaling frequency    : max [%u] min [%u] cur [%u]\n",
-           p_cpufreq->scaling_max_freq,
-           p_cpufreq->scaling_min_freq,
-           p_cpufreq->scaling_cur_freq);
+        printf("scaling frequency    : max [%u] min [%u] cur [%u]\n",
+               p_cpufreq->scaling_max_freq,
+               p_cpufreq->scaling_min_freq,
+               p_cpufreq->scaling_cur_freq);
+    }
 
     printf("turbo mode           : %s\n",
            p_cpufreq->turbo_enabled ? "enabled" : "disabled or n/a");
-- 
2.37.1


