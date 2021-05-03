Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD218372072
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121811.229781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeFM-00064n-Uk; Mon, 03 May 2021 19:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121811.229781; Mon, 03 May 2021 19:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeFM-00063s-PL; Mon, 03 May 2021 19:28:48 +0000
Received: by outflank-mailman (input) for mailman id 121811;
 Mon, 03 May 2021 19:28:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeFL-0005i5-J7
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:28:47 +0000
Received: from mail-qk1-x730.google.com (unknown [2607:f8b0:4864:20::730])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03167565-5537-404f-b71c-fa23f9918af9;
 Mon, 03 May 2021 19:28:39 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id 197so5973125qkl.12
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:39 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:38 -0700 (PDT)
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
X-Inumbo-ID: 03167565-5537-404f-b71c-fa23f9918af9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A+tWllvHyW52JnCKAHpzVsmBO/u0B8vwweaHzsv0x+g=;
        b=c3ma4whvihZMr+XtT6Dsf4OvPW1Pd0zYSsA7yv0QPFWlH7p7BuQcQ2rtZziOWKLerT
         QaUC1k0ZsuNbbBHRsmyI5i/82bSOdyDg6ZGDgvxlKgAnxYIXJC5fc+rV5VwY+XKqpHpy
         LS9UTUig3LOABNY1ZWkONeNr2OJpkj9XjTdNSyxIpQgodbKxHkOiiZA6/8Nz707q5vrJ
         2GUOI9OCX0BZKNIWpMIFQBXDrEP/9aEklkD7xjIbYY7zBYn8SJjqzqIHRDTxCzvzGRH8
         d8Mu8fAfzzswLtYjMDAWdPgJaToPoK1kMIr4oolqmMT9WGyRJ+an+624OzwBCrWZRTLP
         31TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A+tWllvHyW52JnCKAHpzVsmBO/u0B8vwweaHzsv0x+g=;
        b=typfibQoJ2RX0HlYtl40cgBCp+73WBABo+9PNGLjXENR5/UsQFMwOuNx2suvTedgzc
         Z18x8vg4ECx9NJbAUIp4i4syooELzoQHXDn6FnddMFWGdnaDV6yBb6IFb+ljws8X8qhA
         N4lQbQ2ZR4g7HT4Egj4ShY7pbxkXYHac7bO9ckv7omN5tlpIYVb/zGY/d+0g3FQvRhQ1
         2EDNEtcP8o2/K4oYoh6C4zK7aWhObyFi74PL82zXHPXAmltM/b6Ftc0yvk8RQn22vJ1o
         pm6n2CZIOgXrVlgjW3LbjTfIkldjibQWg4Z3nStqZ7VcacBC6DYBboYu6aMPqzozx05K
         ZIXA==
X-Gm-Message-State: AOAM5308ZAV39HkCTvYgKrNiCKG2tsJ9JREvcnS2Ghf3pRF0nk1/QDn6
	No7f+hBGnayhbVWnVYdMuHEEHJUICWs=
X-Google-Smtp-Source: ABdhPJxhn3QpGVO522p42qDm0dV7XUUdhgdWu+j8lIrefXpjNxHG18JFiuo2CLCG8JYNeqhK+e05BA==
X-Received: by 2002:ae9:dc47:: with SMTP id q68mr21053462qkf.197.1620070119123;
        Mon, 03 May 2021 12:28:39 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 05/13] xenpm: Change get-cpufreq-para output for internal
Date: Mon,  3 May 2021 15:28:02 -0400
Message-Id: <20210503192810.36084-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using HWP, some of the returned data is not applicable.  In that
case, we should just omit it to avoid confusing the user.  So switch to
printing the base and turbo frequencies since those are relevant to HWP.
Similarly, stop printing the CPU frequencies since those do not apply.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/misc/xenpm.c | 45 +++++++++++++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index d0191d4984..562bf939f9 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -711,6 +711,7 @@ void start_gather_func(int argc, char *argv[])
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
+    bool internal = strstr(p_cpufreq->scaling_governor, "internal");
     int i;
 
     printf("cpu id               : %d\n", cpuid);
@@ -720,10 +721,19 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
         printf(" %d", p_cpufreq->affected_cpus[i]);
     printf("\n");
 
-    printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
-           p_cpufreq->cpuinfo_max_freq,
-           p_cpufreq->cpuinfo_min_freq,
-           p_cpufreq->cpuinfo_cur_freq);
+    if ( internal )
+    {
+        printf("cpuinfo frequency    : base [%u] turbo [%u]\n",
+               p_cpufreq->cpuinfo_min_freq,
+               p_cpufreq->cpuinfo_max_freq);
+    }
+    else
+    {
+        printf("cpuinfo frequency    : max [%u] min [%u] cur [%u]\n",
+               p_cpufreq->cpuinfo_max_freq,
+               p_cpufreq->cpuinfo_min_freq,
+               p_cpufreq->cpuinfo_cur_freq);
+    }
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
@@ -750,19 +760,22 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
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
2.30.2


