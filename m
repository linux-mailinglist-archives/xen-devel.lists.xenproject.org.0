Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F92E730692
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549123.857535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqZ-0007dN-DD; Wed, 14 Jun 2023 18:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549123.857535; Wed, 14 Jun 2023 18:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqZ-0007U8-6c; Wed, 14 Jun 2023 18:03:55 +0000
Received: by outflank-mailman (input) for mailman id 549123;
 Wed, 14 Jun 2023 18:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9UqX-0005LA-HX
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:03:53 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d210f1d2-0add-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 20:03:52 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-75d528d0811so236879185a.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:03:52 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:50 -0700 (PDT)
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
X-Inumbo-ID: d210f1d2-0add-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765831; x=1689357831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxVGZ+gvz08OKoWjfCFPcTsdFvOXHOS/NxFkI1JhnIY=;
        b=LKbwpHLzISyP75fjQUXwZsbNJE6lOz2vmOUuNIfFAvKHNACDHK12L9edz0k0+jEQuQ
         5VcMUx9ehO3prQURyQvX3P4qfLdifPjLP05pB5PlfymDB5Xlm3TBJC8pReG3rW3dPf77
         oMQcoOJNdusMS6kjJ3VjAwzJk1vqimMWMsH/Jei4X5Y2vmHMUqi6KjFTAJ1ISlS9+/Wz
         WiLrGvUvJOHkkE1JDdSGsBeU7J5PIZdHXH4KBGBJgHRChQbh2FVJTrpy3pocrP2oZsJz
         fskfk3Ic9tQdWBxMCTmo/H21oF7LaEuZYvCCU/oLyfDqeI1mHO4A4fxsE43I5iOz+/pv
         luzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765831; x=1689357831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxVGZ+gvz08OKoWjfCFPcTsdFvOXHOS/NxFkI1JhnIY=;
        b=cnP88vxKNAS84u4pzwSWivbPNf24tingHwDmSaTOLAf+l3nVr31nMqK1jR9xx7+aoC
         oLSofrO+VQ9JcF5pd43K6Z0m/YNb2ycBOj2os3ZBWHXTt9VP2EhcCa/KRJgschKOuk0Y
         rMd2d8fPn8iZUHQJF5fOxEFvS5WiZWzlGQ2trPXw3zs2YFoIeWHgCpEEg9PMbMwjp3QQ
         v2dBEhCfVE88jKKxzjnpTDTA9dDRbkEcb3Em86F5rR1IGirqQWkJh2C5aID4DJ6+OSa1
         QNAuaNsaNfotG6WkxgpEnAicNnJyk3Kzo29atssSjhokTWdUGi5oKnUjHGGY9mhUpsbT
         q3vg==
X-Gm-Message-State: AC+VfDxpzQF3ikyW/Wga6ATx7+iFSgkCWfh/CB/Z/M+y8VdWVP1lwj2f
	yX/nrzvANUyOPsdgK5U8TuCx9v20rEA=
X-Google-Smtp-Source: ACHHUZ5ioKKeef9cH4i55/FDg6yrWqp0eMHgoVA2PeT+JYpLBZc+rS0GufDj17GD9r3/h4y5fhgfgg==
X-Received: by 2002:a05:6214:c2c:b0:625:ba46:27e6 with SMTP id a12-20020a0562140c2c00b00625ba4627e6mr21097267qvd.2.1686765831038;
        Wed, 14 Jun 2023 11:03:51 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 08/15] xenpm: Change get-cpufreq-para output for hwp
Date: Wed, 14 Jun 2023 14:02:46 -0400
Message-Id: <20230614180253.89958-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using HWP, some of the returned data is not applicable.  In that
case, we should just omit it to avoid confusing the user.  So switch to
printing the base and max frequencies since those are relevant to HWP.
Similarly, stop printing the CPU frequencies since those do not apply.
The scaling fields are also no longer printed.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Use full governor name XEN_HWP_GOVERNOR to change output
Style fixes

v4:
s/turbo/max/
Check for XEN_HWP_DRIVER driver instead of "-internal"
---
 tools/misc/xenpm.c | 83 +++++++++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 37 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 1c474c3b59..4e53e68dc5 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -711,6 +711,7 @@ void start_gather_func(int argc, char *argv[])
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
+    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER) == 0;
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
2.40.1


