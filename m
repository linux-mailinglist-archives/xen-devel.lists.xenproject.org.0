Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655AC763D73
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570656.892704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi8Z-0003me-5G; Wed, 26 Jul 2023 17:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570656.892704; Wed, 26 Jul 2023 17:17:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi8Z-0003kz-0d; Wed, 26 Jul 2023 17:17:23 +0000
Received: by outflank-mailman (input) for mailman id 570656;
 Wed, 26 Jul 2023 17:17:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi2S-0005nP-GG
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:11:04 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65880181-2bd7-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 19:11:02 +0200 (CEST)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6378cec43ddso375246d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:11:02 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:11:00 -0700 (PDT)
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
X-Inumbo-ID: 65880181-2bd7-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391461; x=1690996261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imeu59UbyEmxk/60do4rzt8IPOfqsoGRviRd+fRZmSg=;
        b=cfCWBHQN8Rx3skIwDb8tQKTb4yWLK4tNuauqP7/MkSC+Nyh3LyrBID5/Boz2Gx4Zwl
         KZxZirZdeRGoY15ZRY2G+pvyiZXofrEdvFGe+HJeHw13kfcszDjc4hL+p7J6SG8aZSEJ
         JyP8EtgLp1zRNihXxGq1XhJw2D205C8Fo2gr+u8BMiZUVdgg5DF3kjgA5x3MlZp/06LJ
         KmVbJ2f9CAJDW3JY3goGxrEyTyx6JDUQa/DByhUOl4Gx/7ZzqOWeBjYP0tEBkV9yqufn
         r6lDya10frr0lN54lmVKbYjpP3wtP9aj3BfpJbKocPFfcwiH12a10hAz22DUAeEI7/Zk
         boRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391461; x=1690996261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imeu59UbyEmxk/60do4rzt8IPOfqsoGRviRd+fRZmSg=;
        b=NWCNpzIq0AdqzEat3spWQlSaS1s66TWf0CzEhCVOJzXQrEeoF34045YfwS7lI+L6Pb
         Jsp65jVdPj1Bn4qGhXj3W4rX9URjkNOqyNZ1w77Y66duzw/ANCYjWlovH45mo4klGPT+
         R65hVukc07nrKiN5GAVNQ3/z/DjQfRsMrsFSixcspXJnhtbikrLhNarVfwak//aVV4Y1
         0bxHbqQy+arzf6XU8/3pQZrH6wdvbQJbrBb1ns3ZMq6AGbJ53Rn0mHDAJnRIx5WA1crc
         GQR6Y6btqboQbiaSHN6tmMzl+WM+dbmr2FmjBEuUvc75CE+IC8DpjZuIIVs0GRlB4EKv
         84iQ==
X-Gm-Message-State: ABy/qLZtrCV8lJXPW/IvQ4w8sKyxhG72g8BWkhBfV4wzOxvGwsp2i4eZ
	Dq4Dr4k7nwqw0shwEh8uotaB+JQlgtU=
X-Google-Smtp-Source: APBJJlE+vt1k5qigt2ot0tq2Cf86zCqHXL5I/dtYIhfnyiUGkSEF61FqmaMokrlG483z9w5brciStw==
X-Received: by 2002:a0c:e305:0:b0:63c:fbd0:84a6 with SMTP id s5-20020a0ce305000000b0063cfbd084a6mr2839134qvl.5.1690391461166;
        Wed, 26 Jul 2023 10:11:01 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 11/15] xenpm: Print HWP/CPPC parameters
Date: Wed, 26 Jul 2023 13:09:41 -0400
Message-ID: <20230726170945.34961-12-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726170945.34961-1-jandryuk@gmail.com>
References: <20230726170945.34961-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print HWP-specific parameters.  Some are always present, but others
depend on hardware support.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v2:
Style fixes
Declare i outside loop
Replace repearted hardware/configured limits with spaces
Fixup for hw_ removal
Use XEN_HWP_GOVERNOR
Use HWP_ACT_WINDOW_EXPONENT_*
Remove energy_perf hw autonomous - 0 doesn't mean autonomous

v4:
Return activity_window from calculate_hwp_activity_window
Use blanks instead of _ in output
Use MASK_EXTR
Check XEN_HWP_DRIVER name since governor is no longer returned
s/hwp/cppc

v5:
Add Jan's Reviewed-by
---
 tools/misc/xenpm.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 21c93386de..3abd99fd20 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -708,6 +708,46 @@ void start_gather_func(int argc, char *argv[])
     pause();
 }
 
+static unsigned int calculate_activity_window(const xc_cppc_para_t *cppc,
+                                              const char **units)
+{
+    unsigned int mantissa = MASK_EXTR(cppc->activity_window,
+                                      XEN_CPPC_ACT_WINDOW_MANTISSA_MASK);
+    unsigned int exponent = MASK_EXTR(cppc->activity_window,
+                                      XEN_CPPC_ACT_WINDOW_EXPONENT_MASK);
+    unsigned int multiplier = 1;
+    unsigned int i;
+
+    /*
+     * SDM only states a 0 register is hardware selected, and doesn't mention
+     * a 0 mantissa with a non-0 exponent.  Only special case a 0 register.
+     */
+    if ( cppc->activity_window == 0 )
+    {
+        *units = "hardware selected";
+
+        return 0;
+    }
+
+    if ( exponent >= 6 )
+    {
+        *units = "s";
+        exponent -= 6;
+    }
+    else if ( exponent >= 3 )
+    {
+        *units = "ms";
+        exponent -= 3;
+    }
+    else
+        *units = "us";
+
+    for ( i = 0; i < exponent; i++ )
+        multiplier *= 10;
+
+    return mantissa * multiplier;
+}
+
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
@@ -772,6 +812,32 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
                p_cpufreq->u.s.scaling_min_freq,
                p_cpufreq->u.s.scaling_cur_freq);
     }
+    else
+    {
+        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
+
+        printf("cppc variables       :\n");
+        printf("  hardware limits    : lowest [%u] lowest nonlinear [%u]\n",
+               cppc->lowest, cppc->lowest_nonlinear);
+        printf("                     : nominal [%u] highest [%u]\n",
+               cppc->nominal, cppc->highest);
+        printf("  configured limits  : min [%u] max [%u] energy perf [%u]\n",
+               cppc->minimum, cppc->maximum, cppc->energy_perf);
+
+        if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
+        {
+            unsigned int activity_window;
+            const char *units;
+
+            activity_window = calculate_activity_window(cppc, &units);
+            printf("                     : activity_window [%u %s]\n",
+                   activity_window, units);
+        }
+
+        printf("                     : desired [%u%s]\n",
+               cppc->desired,
+               cppc->desired ? "" : " hw autonomous");
+    }
 
     printf("turbo mode           : %s\n",
            p_cpufreq->turbo_enabled ? "enabled" : "disabled or n/a");
-- 
2.41.0


