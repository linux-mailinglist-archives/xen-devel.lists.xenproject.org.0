Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 953C66F3796
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528107.820910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEm-0002fu-4Z; Mon, 01 May 2023 19:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528107.820910; Mon, 01 May 2023 19:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEl-0002dg-W6; Mon, 01 May 2023 19:31:03 +0000
Received: by outflank-mailman (input) for mailman id 528107;
 Mon, 01 May 2023 19:31:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZEk-000149-UP
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:31:02 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b44a29e3-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:31:01 +0200 (CEST)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-3ef64d8b2b4so13236131cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:31:01 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d6-20020ac80606000000b003bf9f9f1844sm9351784qth.71.2023.05.01.12.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:30:59 -0700 (PDT)
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
X-Inumbo-ID: b44a29e3-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969460; x=1685561460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hA8U/InM9EEJxsTtEJ4pQE8Dle8MV2Sm7m6DjaGLFBw=;
        b=cqYdElAgv017E/RPw2IfPj2RWa7HBP5wPUoivkXxfKl7Wcrhcl0iwOuzZphMkXGrmq
         wXCkHA8JltP+awApYh8wW61giM/5P2zyNIoHj3q9YmwRfaTUXFVZakg8TrC8FV/WoDGZ
         mo9IaeB6VUPChzAspWP9VcAsfV+TlO8Y/3cNML4q+Pu36JsDdpapVSvhvzxmzur3X5kb
         iYsf3odUJqBk7a9Ou/Bf4vu/nG3w22mo0+ol5vCDLc5dYSOaknjfd3TwNd4KjydszEDR
         jyy1FovHqAsAjtuqX9giS6oKxRxgZXnd68neZX3LzXl3USX2N/zFujA6OIMOGGjtAGZz
         xCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969460; x=1685561460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hA8U/InM9EEJxsTtEJ4pQE8Dle8MV2Sm7m6DjaGLFBw=;
        b=lymf5mbhwTrLPRooCSX7O3oPwZlGnMHiAdCT5aleAen8xbkQ3ahlWEqgWp2HASkWKZ
         Tf6aTDH/6VnBlmZG1Oum6xHimWPpMW9AulbOs+TJXMfpxhg8Rps/oM6HPJdJGmoOLd5W
         zJ1iXp6Wg2/4P9chlZD0SfusTNpqEDDLhRbBmnrUEFQML//lMBmgrfnmRBNlNCgz8A7J
         10htRuiX5GmIJMtq9fDJinNlyt69NjVjb4GOsGOHKfuH4z5KPvZfvA0iRIy9v4F9oZ57
         wxlxmvF/1yjJL192Hmt0oG+DXa+q48XuDm1tVUerdQ9A0Dt6Lxxo6D6HJBzX409YbeO7
         zIDw==
X-Gm-Message-State: AC+VfDxn7qAj80dvYOzVdxfsbUfBEGwBYyBRr4iwtY5XgUxrH4NivQVW
	MVKSSioemicMgE0WJBn/SdZg6aIbCPA=
X-Google-Smtp-Source: ACHHUZ56JSvdUTnYPJIqqSMnTeyqiLw1eNi/3MYuwdvmwUt+ZTaf7S1mFfukjjdCf4lp2bgDkUEqQQ==
X-Received: by 2002:ac8:5f54:0:b0:3e4:3f79:9d7b with SMTP id y20-20020ac85f54000000b003e43f799d7bmr23571957qta.55.1682969459739;
        Mon, 01 May 2023 12:30:59 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 05/14 RESEND] xenpm: Change get-cpufreq-para output for internal
Date: Mon,  1 May 2023 15:30:25 -0400
Message-Id: <20230501193034.88575-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501193034.88575-1-jandryuk@gmail.com>
References: <20230501193034.88575-1-jandryuk@gmail.com>
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
index 1bb6187e56..ce8d7644d0 100644
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
2.40.0


