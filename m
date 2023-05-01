Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A946F369B
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528066.820660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZ5L-0004MM-NE; Mon, 01 May 2023 19:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528066.820660; Mon, 01 May 2023 19:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZ5L-0004Jy-JA; Mon, 01 May 2023 19:21:19 +0000
Received: by outflank-mailman (input) for mailman id 528066;
 Mon, 01 May 2023 19:21:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZ5J-0003yM-Vk
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:21:17 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57a16940-e855-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:21:16 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-74cebbb7bc5so275654785a.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:21:16 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 x20-20020a0ce0d4000000b0061927ddb043sm2012307qvk.80.2023.05.01.12.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:21:14 -0700 (PDT)
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
X-Inumbo-ID: 57a16940-e855-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682968875; x=1685560875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hA8U/InM9EEJxsTtEJ4pQE8Dle8MV2Sm7m6DjaGLFBw=;
        b=alyW1WnDxf9gWpn/iywDsDjWYtiNrb58353i+DD9++Cpa7YDvVl5EOnhjOr7qgZ6B0
         RWo7oakWLr32hdtu25e0yXhddgGem81Abc9u1tiXk5BSZKu9Wn4LnZnWqohDt7U0OIRP
         1Vwij9eGmo0DPTDjtZAwVPzsmENXo5NCzFBn/pjPxkfGWiKoaKf2iMk1WNC0jNaA7qWV
         5fkIkwLkHB2hIGp6CrRnnNLwyp+Sw/3+BpQifdRz+2gZsR4C4IEGgAwG74R7Qe73+Joe
         6nZzkXBWog45V7Zpne/TjUOKDbRKSCzjxi67JcYxqhIWy/iklXt+xS1d0TB15rJvRp0s
         7//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682968875; x=1685560875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hA8U/InM9EEJxsTtEJ4pQE8Dle8MV2Sm7m6DjaGLFBw=;
        b=TV5WbagDmYG46TWa0zSQzYbBrHe77J89qcyOIBUz0gUDwJktRj9fNkg5SHYC5b7a0Q
         TtaRRqW2TtQ58O0ffKPQAVeasdCM93z4H9EOtUIRLxxHgpDFDbvvYWURkhYTiI86FvAb
         tt6SnTSa0oPWgp5yCD/0qObyhzYT/i3dCyKL6FlEqGHkrczypp8M91JyYpn9Ac7PQDyQ
         TVUezSWCS73RjRt/GK2Wi9bSbQ0nLvUjyx9rLkuzsuH1KOlVh7/1GV+T0KE7ap3w2o5G
         1SXPdD5wh/0JGamIYlzogbnmWs0D2w9R6vmdZZE+h9u4obiAbsA3Fvu2C12X7GlCVTt4
         SVBg==
X-Gm-Message-State: AC+VfDx9ah8A7JlM4jEGXY8MXpgaz980oA3gO4S4uDmAgGUqJEdSFAu3
	uEwnBK6uzL5rLubheIVipRQ=
X-Google-Smtp-Source: ACHHUZ7Si1N+KuQIyeuzpeF6TE80Hpb0MgsDrxMePO6KWSxcK6U33V2aUW4c9/8oenuaGAK3spl/eQ==
X-Received: by 2002:a05:6214:2a49:b0:5f5:51c4:fca5 with SMTP id jf9-20020a0562142a4900b005f551c4fca5mr1614591qvb.49.1682968875262;
        Mon, 01 May 2023 12:21:15 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproj,
	xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 05/14] xenpm: Change get-cpufreq-para output for internal
Date: Mon,  1 May 2023 15:20:36 -0400
Message-Id: <20230501192045.87377-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501192045.87377-1-jandryuk@gmail.com>
References: <20230501192045.87377-1-jandryuk@gmail.com>
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


