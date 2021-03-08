Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6603318F7
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 22:03:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95087.179417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1c-0006i7-Ue; Mon, 08 Mar 2021 21:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95087.179417; Mon, 08 Mar 2021 21:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1c-0006hF-OJ; Mon, 08 Mar 2021 21:02:48 +0000
Received: by outflank-mailman (input) for mailman id 95087;
 Mon, 08 Mar 2021 21:02:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odrr=IG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJN1b-0006P0-Ik
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 21:02:47 +0000
Received: from mail-qv1-xf2a.google.com (unknown [2607:f8b0:4864:20::f2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f6b2bc0-98ad-43b3-96a3-15221fda3c2c;
 Mon, 08 Mar 2021 21:02:33 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id bh3so5340421qvb.5
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 13:02:33 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a33e:daa7:46a1:a7eb])
 by smtp.gmail.com with ESMTPSA id
 r2sm8514070qti.4.2021.03.08.13.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:02:32 -0800 (PST)
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
X-Inumbo-ID: 2f6b2bc0-98ad-43b3-96a3-15221fda3c2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6huQgq+uDBy8RsFCTHtfKVZpPnrSucaiZ54dJm9nYeI=;
        b=Wer6nEDWVkndnvRNgmg4aC8u7FVAcjtZrQLpcbsl3hJ35DWgsPWJKkpRtbyqW2AI71
         n3LIDHqn5I6EFGOnAUKMYmr+rsIt08MZ+YcwWvfgRK/Z3UemUKq6S2gHGJWKcYiN+CsF
         +DjBDXyrr4CVPBKMAoUW5BIMbsrdakM0JhNGiSvIrztIfR89SjEBCHC8Flvofy3Sen2j
         EqQqIcYFLcmsfUVz6R3kJ6uP081YIti9XfTdTnnKuArSJk82tK21zlJ9tr1/Yn6xbLP2
         bWm6qkA5ig+AcpzdnRCC7BJxFL5jV6cgInMLTZ+UNCAydqlI7zdzHCgw7ZHshwAGFcnx
         55bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6huQgq+uDBy8RsFCTHtfKVZpPnrSucaiZ54dJm9nYeI=;
        b=iYr+t2pLqBz4+E4kRJp2k2KiW/0V9WldR1lBtYQCNJ1d+zbrgv8LpglQ2OTGWG/jsn
         Gq8nNE9KhN0TyzfEGchJQ+X6NrZ/lJ5Z5uoBXy6oArEHrv9Htc0UnBiECxrwAJO73ZtY
         Kk+ldsnTnZlOPbRPchp3AZHHSquwsmZ/PE81ZaH0ISjicbA/92q9Hl7YgTbdC4eVGKyD
         +8RGId8q2WWn1UrKCgsvLKvt2EsXEek1MIE3W8UMV/ygMTWpM58buytRL/ve+lrirSwZ
         VdpTXgLkGCRZLYzG7iLsCZtPUUEVP96hqvaR2Ng8H9HhfQQTByJUW8uP0jPxOtd4lhbY
         AhbQ==
X-Gm-Message-State: AOAM530NHUmdZqkkRrvrysxmOwmpVkjr0Sh/GuoN3raH3eLXactGitSO
	Bf7Q8GDS3Ygo2t4HSAYzUTo13jtMwr4=
X-Google-Smtp-Source: ABdhPJymVRcoQcyP0VqxqnyZsYHb3fWy4qxlrGF/d0o2piukAVzC1HJEvx3QPp+D8QBGx6qRVmTDqA==
X-Received: by 2002:a0c:f702:: with SMTP id w2mr776977qvn.0.1615237352617;
        Mon, 08 Mar 2021 13:02:32 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pawel@invisiblethingslab.com,
	marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC 05/12] xenpm: Change get-cpufreq-para output for internal
Date: Mon,  8 Mar 2021 16:02:03 -0500
Message-Id: <20210308210210.116278-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308210210.116278-1-jandryuk@gmail.com>
References: <20210308210210.116278-1-jandryuk@gmail.com>
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
index d0191d4984..35223b98df 100644
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
+    if (internal)
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
+    if (!internal)
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
2.29.2


