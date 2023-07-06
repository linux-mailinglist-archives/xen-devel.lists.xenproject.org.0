Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B9274A3FC
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:55:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559981.875538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8m-0006ck-Tz; Thu, 06 Jul 2023 18:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559981.875538; Thu, 06 Jul 2023 18:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8m-0006Zn-PG; Thu, 06 Jul 2023 18:55:44 +0000
Received: by outflank-mailman (input) for mailman id 559981;
 Thu, 06 Jul 2023 18:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU8k-0003x8-Vn
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:55:42 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b486abfb-1c2e-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 20:55:42 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-7659c6cae2cso92086285a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:55:42 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:40 -0700 (PDT)
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
X-Inumbo-ID: b486abfb-1c2e-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669741; x=1691261741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aw1/CynLpBcgrYjNJfRHcPPsQKW2D4eyDyqElDmf4oI=;
        b=nJjjohg+MptI1ijKbY1o3ZwqWvYJXGZh/wApwyE5GI8FI4L0UxGDkx0sVne5xp8vJc
         jajH/ufRjam/l3ed/k7V8XsibGbXrKlM52gCM5ITjfbLSU1sqkrq2gv7agH2mwDslPlq
         ae/aUoX3RjTvSRBgpTMZ9JZ+ba0u0cisYGE5wJWvXaGHMI97Y2VETu3c6qlNzXwmk19z
         QrEJ3VyRin21RN9mKMD0aSAvVY3YWU3PNphv8PnPi9Jesd3mya9X3DT5WboUCZ4y6H8t
         e0xoDoi/BTZN7xTZb9SD+afFBJN2BA1EPro+SgpMpSwOf7QjoBJIacHs44KMaMW3ttlw
         ZSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669741; x=1691261741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aw1/CynLpBcgrYjNJfRHcPPsQKW2D4eyDyqElDmf4oI=;
        b=lrS7tyLV+6faJEU8YPn32oK6zlo8JKCVS7K5o4ddVbIMvy+ibjN3VC7Ix1yoyDxfi2
         GTQ3o29UsLxCCCSmhwLuixdj6tU3EfZmpdkLC06j8Zq4aQMIthzaKD2DOkL+d1ngTM6I
         TVKqgzFxRnFX+wSwRK3Px01fbqqFvWLNsz4dBf870bnTpJ4al9WK5tYsYt1UMP17I4DO
         nCXK3oIMpPpUnUZh4S9kaGpSCRKsSjjhnZgs3/c0yTfrUzLWZdtaaH9TNXs8Q8p5llzO
         OAS3wJYJxyVt725idg+/D7yvLLc7BdWNsOFZTpN9zRZ1adp/EYg4nJzBSsXGkgONt7rG
         FXBA==
X-Gm-Message-State: ABy/qLY+AM9y8t/7kftjfeOMzIS9V+rB26T28X4PkLpLeZvuDfALHLxG
	oacjYVZLWgv0xGY7cw/rE3QsPFD3ivc=
X-Google-Smtp-Source: APBJJlHt8LClt1JdqMYxV6/OpGoYIA6wPZewZm8knNKhGf1/HJVF/0Fp4ML9DeWuRjd+ldN+9i5U4g==
X-Received: by 2002:a05:620a:668c:b0:767:671b:250f with SMTP id qh12-20020a05620a668c00b00767671b250fmr2017519qkn.52.1688669740645;
        Thu, 06 Jul 2023 11:55:40 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 08/15] xenpm: Change get-cpufreq-para output for hwp
Date: Thu,  6 Jul 2023 14:54:33 -0400
Message-ID: <20230706185440.48333-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
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


