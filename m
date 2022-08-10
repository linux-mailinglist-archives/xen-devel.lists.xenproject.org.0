Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C03D58F316
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383888.619168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPU-00008l-Qu; Wed, 10 Aug 2022 19:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383888.619168; Wed, 10 Aug 2022 19:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPU-0008WK-Lp; Wed, 10 Aug 2022 19:30:32 +0000
Received: by outflank-mailman (input) for mailman id 383888;
 Wed, 10 Aug 2022 19:30:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPS-00067E-86
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:30 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e434f504-18e2-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 21:30:29 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id u12so12038470qtk.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:29 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:27 -0700 (PDT)
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
X-Inumbo-ID: e434f504-18e2-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=7bEttMh9VcsUlhPn8Yy1aX7Mn4PrqipA69uGmY68abY=;
        b=BwZyp+rsgJfUcUV4cG+PUd6wrTbHzbvEVC0JAen+uOJRCo6WANJLf5J/fDiwzm1pfE
         U7HTa5ToaHo1WKZVt2lb69gzA2NU3p1kzQ3NTDGainYHzWlly1gsAQFQEnaOc/vQ9wgR
         p5O/fOtrkxXTjTsMcsOdShFLjtAZRUfxdnOS1tVpqwdfA4QNvLhQZ7el1C1O2/zywO4p
         IKamJOf5E8nopP4EV8hXbgh7RmIkFOZbx6wKL3e62zHMrhY2/lizXG4guKiGp/9jQmSv
         ioHoMqM4t3owkdDyJrnS+njzmuVtMzkctSuRb0hiz+PlqNS/YiybrqLsV8H+vClWIjMH
         wldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7bEttMh9VcsUlhPn8Yy1aX7Mn4PrqipA69uGmY68abY=;
        b=sta73nWEni/3JAe5lbJXyqzOtZs91g9smzPQyk4cF5klsOwYWaVObQBJRQLgJflgYq
         x/RbhNQ38SoKJ1X/coZRJsufuj0KwyifgLh8xwE3Ig36HdhIMo0g2Zp6LQMKcL1rhnxy
         npBGRLsvrzJ9d9FPWpKBtJMw6/M45Y45So5A6CdpX2uTK0aVdQpYfUL5Ye2ipZcPV1SG
         UQ3bKf++UGHiGkXMVf5ZODAInD7VSpmxjySgB34RhlxFuUqWi3cE22fY8+6PwmE4Fl5P
         ZpCO/q8+Mw5H7/rtX537gbQrP8aybGAt+1CKAMTigB36RY4sUIpYnOtKw8u3netjNRXX
         WAeg==
X-Gm-Message-State: ACgBeo0bFj4HnDm8sNkmY73utSf7QjNI00AB3Zn6SJG55ZrSiyHT8sGA
	rw0xn9AhZKXjk0W615ueB4dGVjSdyU8=
X-Google-Smtp-Source: AA6agR7R3cf12ooaUePc+sYsLFBnL4fRmb64u+qopKpUNVUQB+R8UbRr+vZ8vPmykcmAvFjs44e5YA==
X-Received: by 2002:ac8:5882:0:b0:343:648d:5a00 with SMTP id t2-20020ac85882000000b00343648d5a00mr285819qta.636.1660159828163;
        Wed, 10 Aug 2022 12:30:28 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 08/13] xenpm: Print HWP parameters
Date: Wed, 10 Aug 2022 15:29:39 -0400
Message-Id: <20220810192944.102135-9-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print HWP-specific parameters.  Some are always present, but others
depend on hardware support.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Style fixes
Declare i outside loop
Replace repearted hardware/configured limits with spaces
Fixup for hw_ removal
Use XEN_HWP_GOVERNOR
Use HWP_ACT_WINDOW_EXPONENT_*
Remove energy_perf hw autonomous - 0 doesn't mean autonomous
---
 tools/misc/xenpm.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 179f9f1f96..610a516213 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -708,6 +708,44 @@ void start_gather_func(int argc, char *argv[])
     pause();
 }
 
+static void calculate_hwp_activity_window(const xc_hwp_para_t *hwp,
+                                          unsigned int *activity_window,
+                                          const char **units)
+{
+    unsigned int mantissa = hwp->activity_window & HWP_ACT_WINDOW_MANTISSA_MASK;
+    unsigned int exponent =
+        (hwp->activity_window >> HWP_ACT_WINDOW_EXPONENT_SHIFT) &
+            HWP_ACT_WINDOW_EXPONENT_MASK;
+    unsigned int multiplier = 1;
+    unsigned int i;
+
+    if ( hwp->activity_window == 0 )
+    {
+        *units = "hardware selected";
+        *activity_window = 0;
+
+        return;
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
+    *activity_window = mantissa * multiplier;
+}
+
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
@@ -773,6 +811,33 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
                p_cpufreq->scaling_cur_freq);
     }
 
+    if ( strcmp(p_cpufreq->scaling_governor, XEN_HWP_GOVERNOR) == 0 )
+    {
+        const xc_hwp_para_t *hwp = &p_cpufreq->u.hwp_para;
+
+        printf("hwp variables        :\n");
+        printf("  hardware limits    : lowest [%u] most_efficient [%u]\n",
+               hwp->lowest, hwp->most_efficient);
+        printf("                     : guaranteed [%u] highest [%u]\n",
+               hwp->guaranteed, hwp->highest);
+        printf("  configured limits  : min [%u] max [%u] energy_perf [%u]\n",
+               hwp->minimum, hwp->maximum, hwp->energy_perf);
+
+        if ( hwp->features & XEN_SYSCTL_HWP_FEAT_ACT_WINDOW )
+        {
+            unsigned int activity_window;
+            const char *units;
+
+            calculate_hwp_activity_window(hwp, &activity_window, &units);
+            printf("                     : activity_window [%u %s]\n",
+                   activity_window, units);
+        }
+
+        printf("                     : desired [%u%s]\n",
+               hwp->desired,
+               hwp->desired ? "" : " hw autonomous");
+    }
+
     printf("turbo mode           : %s\n",
            p_cpufreq->turbo_enabled ? "enabled" : "disabled or n/a");
     printf("\n");
-- 
2.37.1


