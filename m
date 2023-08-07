Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E2772E2D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578798.906540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Ku-00074b-1N; Mon, 07 Aug 2023 18:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578798.906540; Mon, 07 Aug 2023 18:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Kt-0006vR-QH; Mon, 07 Aug 2023 18:52:11 +0000
Received: by outflank-mailman (input) for mailman id 578798;
 Mon, 07 Aug 2023 18:52:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5Ks-0004lg-E1
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:52:10 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82dba3c6-3553-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 20:52:09 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-63cf69f3c22so34293286d6.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:52:09 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:52:07 -0700 (PDT)
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
X-Inumbo-ID: 82dba3c6-3553-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434328; x=1692039128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPqtnsHma2CfZS2wC9zaYpit9POpmY/2Wfh8kuw75z0=;
        b=ppenxGwClsnUAAp2/zqhU27AyvhhEJKfOPrRPJy0jaGfC0ksjWfsyADLYijCgL/r3J
         84dBKQ3MElDb1Z+cxwaXMZNQVldi8HR3FTnht9+REg13Lol6xbf8sDINWxhfu/vCY3IT
         e/1eLY1Ef0I1ZeMOJLBNTTbd2Lhg5GevI+BtGz0BOyWjrOaaLlKn6gQpZA3ZucBiOhPb
         o47GLfaMPUxTun4GTbW9Xh9vsTONXYwr8h0aCZKnv08ENFNjt5PaSPctEOA6iOrRiw6R
         Lt69seNe7f5DgzeqmaHUcnDhP6fTSk2zofcHlcgBQz2Xxe/fiO5nPETl3NKb3XxEGXJM
         RTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434328; x=1692039128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPqtnsHma2CfZS2wC9zaYpit9POpmY/2Wfh8kuw75z0=;
        b=UabJVbCVFGnq8GcERK5ppwxVlX0T1SazTfxubLudsGUgh/h59N49Guwv2sQeTHj/jA
         RuyDx+3ufQylU+lz+1X2lCjWnMcknDf7t8u3u72n74qwTIRTvN37/IIkztsD9H685H8d
         w9HIwIw+OUPr1MAj7UznEA6Z84Pb90awd+YdMVmWhhIGgOlIQow/f0+2lD7QAwlW6LTU
         RsJr5U/6ZcEL1pzcSIkfMh1NZMgHr0s1mP1SMUI/ofE9prlrglFQCy/dsS47jkoQ9s+O
         EtTfnbqgfpuHNx1pYrQ1oaevvGEjCWSD5tRT4SNWRKqZHuD670cmM2GVolsWjKxTW9RA
         4aXQ==
X-Gm-Message-State: AOJu0YwU/lXJx1MTlAcOMV7YjJdEhq35TU61nZQmyv0WQDvstuau8Jtp
	azRZGQEpjIsClNKjT82I83G9P1Jc9V0=
X-Google-Smtp-Source: AGHT+IEHQ/4/PfxRMgbqK/pM4ZITYqRK+XG5OfVqUINfsLCIhNx8quJd7Iw7hHNL/NJSMP+fVE0CZg==
X-Received: by 2002:a0c:ea4f:0:b0:63d:1573:c292 with SMTP id u15-20020a0cea4f000000b0063d1573c292mr9336327qvp.65.1691434328113;
        Mon, 07 Aug 2023 11:52:08 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8 08/15] xenpm: Change get-cpufreq-para output for hwp
Date: Mon,  7 Aug 2023 14:51:12 -0400
Message-ID: <20230807185119.98333-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using HWP, some of the returned data is not applicable.  In that
case, we should just omit it to avoid confusing the user.  So switch to
printing the base and max frequencies since those are relevant to HWP.
Similarly, stop printing the CPU frequencies since those do not apply.
The scaling fields are also no longer printed.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
v8:
Use %PRIu32 for added hwp printing
Add Anthony's Ack

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
index 1c474c3b59..3f5b2afcea 100644
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
+        printf("cpuinfo frequency    : base [%"PRIu32"] max [%"PRIu32"]\n",
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


