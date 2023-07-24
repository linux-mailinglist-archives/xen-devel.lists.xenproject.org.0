Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1B275F7A2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568922.889096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvA7-0006V1-7l; Mon, 24 Jul 2023 12:59:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568922.889096; Mon, 24 Jul 2023 12:59:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvA7-0006Ov-2N; Mon, 24 Jul 2023 12:59:43 +0000
Received: by outflank-mailman (input) for mailman id 568922;
 Mon, 24 Jul 2023 12:59:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNvA5-0005PS-K2
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:41 +0000
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [2607:f8b0:4864:20::82f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f303aef8-2a21-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 14:59:40 +0200 (CEST)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-4039a42467fso31277551cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:40 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:37 -0700 (PDT)
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
X-Inumbo-ID: f303aef8-2a21-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203578; x=1690808378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aw1/CynLpBcgrYjNJfRHcPPsQKW2D4eyDyqElDmf4oI=;
        b=X+V9+qimaGeEq2IG3mPy0vaIQfs9BHl0Xl9qamIBc2t0mi9acZj6eVG9brWsRN/3bH
         DBqgd6UZ4X/76K6uKOEDHOldBt+1zWG0rvyGhZPmj4Npaqh4CuGUunOYLwUKKJBztIDt
         xwewMZYBIsnjdxVqBR7twDB4Y5koE9+o5Rf2Cz4NCuz1I27VZgJvDAnKjLBP3ipYArxZ
         DJ8q2lIuEEmNBXls31Hq+VfGrncGVJomyGI9lFjfp5VRkxsH9W8NYhJUWYvbY6svbplP
         8PsDY7DmivzU3tXaSA6rGWr3+hPJDohxRjRepwMcdLoR7Gt+0elZK7FsGUrAljSdwns9
         pGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203578; x=1690808378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aw1/CynLpBcgrYjNJfRHcPPsQKW2D4eyDyqElDmf4oI=;
        b=Jhh0IB7Dntx+zye7S1hZnIx3ubN+C2VnbqEY6fbwBxJCA9A2G4P6pV0G0XqbDniRd/
         bmvenID7kzvoIvbMXOiDHN2vGf4970dkeZdwdzqf/mLv5eo8NtKJEac/5nJrSBE43Gdc
         CL/R9HSoGnq9AOqWBkPAhFDpxGY5q+1lRMy4JFrqvvlka3Iq/ZIyepL2PdaIR9IW3hdv
         JannO3ROvpCRRquoGkUn5Ko9mnTKkPFbUWXmCjAXOqDNHAKocNhahazKJ811hYNi70vK
         Z96uinAzQfntqEz049zhchi1uvWrQ5H7nzNNO3KKy2BTODj6cOvu0FbAMJYYqIZZmmbB
         D9dw==
X-Gm-Message-State: ABy/qLazfaCh6P4kkvQc073XQMValafJUPb6c8oJqoB582rrHfS/0YFn
	VXb8+FRanUxa5Xe/NClW8VqkjeGvjc0=
X-Google-Smtp-Source: APBJJlHFNB+Iu0pU6jcWGQQF8qUJI893BZHVXWQjpTL9ssPC69rJ6UFgdDcZnQgM6euWszFNProKfw==
X-Received: by 2002:ac8:5c01:0:b0:406:95b8:6535 with SMTP id i1-20020ac85c01000000b0040695b86535mr4188278qti.48.1690203578329;
        Mon, 24 Jul 2023 05:59:38 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 08/15] xenpm: Change get-cpufreq-para output for hwp
Date: Mon, 24 Jul 2023 08:58:50 -0400
Message-ID: <20230724125857.11133-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724125857.11133-1-jandryuk@gmail.com>
References: <20230724125857.11133-1-jandryuk@gmail.com>
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


