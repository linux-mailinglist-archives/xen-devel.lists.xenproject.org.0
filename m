Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B149763D4F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:10:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570644.892674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi2D-0000YK-N8; Wed, 26 Jul 2023 17:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570644.892674; Wed, 26 Jul 2023 17:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi2D-0000VR-Hn; Wed, 26 Jul 2023 17:10:49 +0000
Received: by outflank-mailman (input) for mailman id 570644;
 Wed, 26 Jul 2023 17:10:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi2B-00062Z-Sq
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:10:47 +0000
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [2607:f8b0:4864:20::f2a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ca9b2f5-2bd7-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 19:10:47 +0200 (CEST)
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-63cf28db24cso550706d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:10:47 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:10:45 -0700 (PDT)
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
X-Inumbo-ID: 5ca9b2f5-2bd7-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391446; x=1690996246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aw1/CynLpBcgrYjNJfRHcPPsQKW2D4eyDyqElDmf4oI=;
        b=XE+5H+/U1l/JxMKuf+cgNLruiSGEGVMAvoOMBIduVqTeAbDcyYvFLzfw7XfkhzDb+F
         e5XogSOT+akLkdYONu+p2x9Al7H/FAUj8r42z/WCULB2U4bwooNMS3EV+atuImiiixsp
         MIEDEQU7RpGKlZnEdcWh2XEN1pD2ubeFhqubBqa8Lp/YkctR+Ra4Y76Iuxily0No2Xk2
         YiQOKjeLOg7SHQL9mtk2H5uxYaVtJmf1Tqhvgaq+RQm6E2u6qxZfj5Cklmx9YTvDVJ0J
         C25JIjzMVF/6KYeT63Q9/7uX0Y+fo5Tc+6vaQ8qVUmpkss0vr8t4lnh33YPMpiB/kITO
         b94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391446; x=1690996246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aw1/CynLpBcgrYjNJfRHcPPsQKW2D4eyDyqElDmf4oI=;
        b=lIV3nftCHWfHUqFWaVZIybZITaD4P+5NnC8uQcF9OsZhSYY3g5EfyzOppmBpZn6PEK
         m/l8mzKBMrS79tFZO7qaZfJ9Pxpw4m5iyR9SmE+TGBahA/NXowkJbQMJDPybTY+6pDa4
         TpFK0X4X/UUWCKomwr77w5Fvteus6W555PgL6GqAbC/1uWHRuQTanqsFirU/EceLlOsK
         d3HaCUzfQF07ep6liSunD1DvJt4CsfVYXSEY92+NixF0oY4lQ4ySDEYwnDP/qcAQgUk7
         Wug2JdXNaikqW18IMzvqSvjf21AGU2BjpXU69jdYSw7Yx6+3a9W2qTgTYrkfsI11BZ2j
         /w4Q==
X-Gm-Message-State: ABy/qLYAzhd/Rt6iPjIUysdB8n8xSdGVnNN5CqHT1mg8jgWuBH9fMfvw
	EqcyrY98wmdnChfvbalQ6wW14exIsQ8=
X-Google-Smtp-Source: APBJJlEjSvs2/Oa0C32f1xVjEOrBadhDvwiyg6kw0oc7YfDXdb2ZE5QHS5PkoFLT/v054+G0w1pD0w==
X-Received: by 2002:a0c:f4d1:0:b0:62d:f515:9320 with SMTP id o17-20020a0cf4d1000000b0062df5159320mr2319724qvm.28.1690391445720;
        Wed, 26 Jul 2023 10:10:45 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 08/15] xenpm: Change get-cpufreq-para output for hwp
Date: Wed, 26 Jul 2023 13:09:38 -0400
Message-ID: <20230726170945.34961-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726170945.34961-1-jandryuk@gmail.com>
References: <20230726170945.34961-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using HWP, some of the returned data is not applicable.  In that
case, we should just omit it to avoid confusing the user.  So switch to
printing the base and max frequencies since those are relevant to HWP.
Similarly, stop printing the CPU frequencies since those do not apply.
The scaling fields are also no longer printed.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v5:
Use XEN_HWP_DRIVER_NAME
Add Jan's Ack

v4:
s/turbo/max/
Check for XEN_HWP_DRIVER driver instead of "-internal"

v2:
Use full governor name XEN_HWP_GOVERNOR to change output
Style fixes
---
 tools/misc/xenpm.c | 83 +++++++++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 37 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 1c474c3b59..21c93386de 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -711,6 +711,7 @@ void start_gather_func(int argc, char *argv[])
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
+    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
     int i;
 
     printf("cpu id               : %d\n", cpuid);
@@ -720,49 +721,57 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
         printf(" %d", p_cpufreq->affected_cpus[i]);
     printf("\n");
 
-    printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
-           p_cpufreq->cpuinfo_max_freq,
-           p_cpufreq->cpuinfo_min_freq,
-           p_cpufreq->cpuinfo_cur_freq);
+    if ( hwp )
+        printf("cpuinfo frequency    : base [%u] max [%u]\n",
+               p_cpufreq->cpuinfo_min_freq,
+               p_cpufreq->cpuinfo_max_freq);
+    else
+        printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
+               p_cpufreq->cpuinfo_max_freq,
+               p_cpufreq->cpuinfo_min_freq,
+               p_cpufreq->cpuinfo_cur_freq);
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    printf("scaling_avail_gov    : %s\n",
-           p_cpufreq->scaling_available_governors);
-
-    printf("current_governor     : %s\n", p_cpufreq->u.s.scaling_governor);
-    if ( !strncmp(p_cpufreq->u.s.scaling_governor,
-                  "userspace", CPUFREQ_NAME_LEN) )
-    {
-        printf("  userspace specific :\n");
-        printf("    scaling_setspeed : %u\n",
-               p_cpufreq->u.s.u.userspace.scaling_setspeed);
-    }
-    else if ( !strncmp(p_cpufreq->u.s.scaling_governor,
-                       "ondemand", CPUFREQ_NAME_LEN) )
+    if ( !hwp )
     {
-        printf("  ondemand specific  :\n");
-        printf("    sampling_rate    : max [%u] min [%u] cur [%u]\n",
-               p_cpufreq->u.s.u.ondemand.sampling_rate_max,
-               p_cpufreq->u.s.u.ondemand.sampling_rate_min,
-               p_cpufreq->u.s.u.ondemand.sampling_rate);
-        printf("    up_threshold     : %u\n",
-               p_cpufreq->u.s.u.ondemand.up_threshold);
-    }
+        printf("scaling_avail_gov    : %s\n",
+               p_cpufreq->scaling_available_governors);
 
-    printf("scaling_avail_freq   :");
-    for ( i = 0; i < p_cpufreq->freq_num; i++ )
-        if ( p_cpufreq->scaling_available_frequencies[i] ==
-             p_cpufreq->u.s.scaling_cur_freq )
-            printf(" *%d", p_cpufreq->scaling_available_frequencies[i]);
-        else
-            printf(" %d", p_cpufreq->scaling_available_frequencies[i]);
-    printf("\n");
+        printf("current_governor     : %s\n", p_cpufreq->u.s.scaling_governor);
+        if ( !strncmp(p_cpufreq->u.s.scaling_governor,
+                      "userspace", CPUFREQ_NAME_LEN) )
+        {
+            printf("  userspace specific :\n");
+            printf("    scaling_setspeed : %u\n",
+                   p_cpufreq->u.s.u.userspace.scaling_setspeed);
+        }
+        else if ( !strncmp(p_cpufreq->u.s.scaling_governor,
+                           "ondemand", CPUFREQ_NAME_LEN) )
+        {
+            printf("  ondemand specific  :\n");
+            printf("    sampling_rate    : max [%u] min [%u] cur [%u]\n",
+                   p_cpufreq->u.s.u.ondemand.sampling_rate_max,
+                   p_cpufreq->u.s.u.ondemand.sampling_rate_min,
+                   p_cpufreq->u.s.u.ondemand.sampling_rate);
+            printf("    up_threshold     : %u\n",
+                   p_cpufreq->u.s.u.ondemand.up_threshold);
+        }
+
+        printf("scaling_avail_freq   :");
+        for ( i = 0; i < p_cpufreq->freq_num; i++ )
+            if ( p_cpufreq->scaling_available_frequencies[i] ==
+                 p_cpufreq->u.s.scaling_cur_freq )
+                printf(" *%d", p_cpufreq->scaling_available_frequencies[i]);
+            else
+                printf(" %d", p_cpufreq->scaling_available_frequencies[i]);
+        printf("\n");
 
-    printf("scaling frequency    : max [%u] min [%u] cur [%u]\n",
-           p_cpufreq->u.s.scaling_max_freq,
-           p_cpufreq->u.s.scaling_min_freq,
-           p_cpufreq->u.s.scaling_cur_freq);
+        printf("scaling frequency    : max [%u] min [%u] cur [%u]\n",
+               p_cpufreq->u.s.scaling_max_freq,
+               p_cpufreq->u.s.scaling_min_freq,
+               p_cpufreq->u.s.scaling_cur_freq);
+    }
 
     printf("turbo mode           : %s\n",
            p_cpufreq->turbo_enabled ? "enabled" : "disabled or n/a");
-- 
2.41.0


