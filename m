Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3E158F320
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383902.619212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPe-0001tR-82; Wed, 10 Aug 2022 19:30:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383902.619212; Wed, 10 Aug 2022 19:30:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPe-0001ph-33; Wed, 10 Aug 2022 19:30:42 +0000
Received: by outflank-mailman (input) for mailman id 383902;
 Wed, 10 Aug 2022 19:30:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPb-00067E-QT
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:40 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9c12b20-18e2-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 21:30:38 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id d10so6167281qvn.8
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:38 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:36 -0700 (PDT)
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
X-Inumbo-ID: e9c12b20-18e2-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=pJCyh+ArYcfa4uMep711UzFy3W8Uwd/8EjcLTHkoO0k=;
        b=RgcwESKdKg3z7te/avieu5S7kOxrYSbl//vn16Ja9ML2kcugPK8P7HczGrxGXMDQj3
         8Q51iyYO86N+ToneiJbarkoU6m4fEvT/x+NpwwiYetoS//NQtVfITVRcK8FCSL/k7yBz
         7yoxhcoqNZiGBIRuqeX9+GHYHC+htN4HPXh/97dWsl/89ETBOCOMVnMg8HVU9Q8NSESW
         TBEcafrE5Uzn1vRvikdzvf9BLRL42et1sTS5UIh22wuxcdEYK49JXKF6Yj6Bx4g8puO0
         4kwjhG0r1KV9u3yKKcWB2kTIjVl2Tlul4FXMd/FpKylocq5G7xyc2bm0AejG1mSI1RiU
         /1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=pJCyh+ArYcfa4uMep711UzFy3W8Uwd/8EjcLTHkoO0k=;
        b=19lOOBGt2VDPEW0nfO96wFe/+QX1UrIAzvBLAZ0gfrEM9Pa9BWQcjExh1ml2dWlAHA
         TLzpYtB0YXwXWOvPkDWG3PD+eUlU6LjM+7W5Ag5gUfdQfExApEK/8kzf6Ch+ZAhcmP+9
         ZRkKyix/TV2gZbQNNMugS8m16ur7bYZeU+NlcyBUzvPrR5nQ0EapJARamFmVm4tviwmk
         ewN7lV5TEGbP0oJPVSimz6l6tXO//gW5ZHItpGD+Sz0qeRPsK6ZepY5GuqftaR7f9Pq4
         7FmmS0jjnpynqs6J7GGmXA32l4XWGETFK2BiyqD7nDIan5DxkWGXbcVs3ameFeyfnV0D
         6RtQ==
X-Gm-Message-State: ACgBeo0pzg9TJI3Jytm1ALJhlshQ5micFr5J7TRdtimQayphbZ9ACA39
	YXm8C9uvwtM+rZ75Q/P3EkrjZ75b18k=
X-Google-Smtp-Source: AA6agR5MyhpdcuvfjPzDeyzHfF6vS/9egzV5yEl3CSLOvMPNmrpBJ2P4FeUmZb6SJV9ydYGADLnQSA==
X-Received: by 2002:a0c:f20f:0:b0:474:9593:ef67 with SMTP id h15-20020a0cf20f000000b004749593ef67mr25280406qvk.8.1660159837348;
        Wed, 10 Aug 2022 12:30:37 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v2 12/13] xenpm: Add set-cpufreq-hwp subcommand
Date: Wed, 10 Aug 2022 15:29:43 -0400
Message-Id: <20220810192944.102135-13-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set-cpufreq-hwp allows setting the Hardware P-State (HWP) parameters.

It can be run on all or just a single cpu.  There are presets of
balance, powersave & performance.  Those can be further tweaked by
param:val arguments as explained in the usage description.

Parameter names are just checked to the first 3 characters to shorten
typing.

Some options are hardware dependent, and ranges can be found in
get-cpufreq-para.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Compare provided parameter name and not just 3 characters.
Use "-" in parameter names
Remove hw_
Replace sscanf with strchr & strtoul.
Remove toplevel error message with lower level ones.
Help text s/127/128/
Help text mention truncation.
Avoid some truncation rounding down by adding 5 before division.
Help test mention default microseconds
Also comment the limit check written to avoid overflow.
---
 tools/misc/xenpm.c | 230 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 230 insertions(+)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 5b28e2f6dd..c66ba7c959 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -16,6 +16,7 @@
  */
 #define MAX_NR_CPU 512
 
+#include <limits.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
@@ -67,6 +68,27 @@ void show_help(void)
             " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
             "                                     set the C-State limitation (<num> >= 0) and\n"
             "                                     optionally the C-sub-state limitation (<num2> >= 0)\n"
+            " set-cpufreq-hwp       [cpuid] [balance|performance|powersave] <param:val>*\n"
+            "                                     set Hardware P-State (HWP) parameters\n"
+            "                                     optionally a preset of one of\n"
+            "                                       balance|performance|powersave\n"
+            "                                     an optional list of param:val arguments\n"
+            "                                       minimum:N  lowest ... highest\n"
+            "                                       maximum:N  lowest ... highest\n"
+            "                                       desired:N  lowest ... highest\n"
+            "                                           Set explicit performance target.\n"
+            "                                           non-zero disables auto-HWP mode.\n"
+            "                                       energy-perf:0-255 (or 0-15)\n"
+            "                                                   energy/performance hint\n"
+            "                                                   lower - favor performance\n"
+            "                                                   higher - favor powersave\n"
+            "                                                   128 (or 7) - balance\n"
+            "                                       act-window:N{,m,u}s range 1us-1270s\n"
+            "                                           window for internal calculations.\n"
+            "                                           Defaults to us without units.\n"
+            "                                           Truncates un-representable values.\n"
+            "                                           0 lets the hardware decide.\n"
+            "                                     get-cpufreq-para returns lowest/highest.\n"
             " start [seconds]                     start collect Cx/Px statistics,\n"
             "                                     output after CTRL-C or SIGINT or several seconds.\n"
             " enable-turbo-mode     [cpuid]       enable Turbo Mode for processors that support it.\n"
@@ -1299,6 +1321,213 @@ void disable_turbo_mode(int argc, char *argv[])
                 errno, strerror(errno));
 }
 
+/*
+ * Parse activity_window:NNN{us,ms,s} and validate range.
+ *
+ * Activity window is a 7bit mantissa (0-127) with a 3bit exponent (0-7) base
+ * 10 in microseconds.  So the range is 1 microsecond to 1270 seconds.  A value
+ * of 0 lets the hardware autonomously select the window.
+ *
+ * Return 0 on success
+ *       -1 on error
+ */
+static int parse_activity_window(xc_set_hwp_para_t *set_hwp, unsigned long u,
+                                 const char *suffix)
+{
+    unsigned int exponent = 0;
+    unsigned int multiplier = 1;
+
+    if ( suffix && suffix[0] )
+    {
+        if ( strcasecmp(suffix, "s") == 0 )
+        {
+            multiplier = 1000 * 1000;
+            exponent = 6;
+        }
+        else if ( strcasecmp(suffix, "ms") == 0 )
+        {
+            multiplier = 1000;
+            exponent = 3;
+        }
+        else if ( strcasecmp(suffix, "us") == 0 )
+        {
+            multiplier = 1;
+            exponent = 0;
+        }
+        else
+        {
+            fprintf(stderr, "invalid activity window units: \"%s\"\n", suffix);
+
+            return -1;
+        }
+    }
+
+    /* u * multipler > 1270 * 1000 * 1000 transformed to avoid overflow. */
+    if ( u > 1270 * 1000 * 1000 / multiplier )
+    {
+        fprintf(stderr, "activity window is too large\n");
+
+        return -1;
+    }
+
+    /* looking for 7 bits of mantissa and 3 bits of exponent */
+    while ( u > 127 )
+    {
+        u += 5; /* Round up to mitigate truncation rounding down
+                   e.g. 128 -> 120 vs 128 -> 130. */
+        u /= 10;
+        exponent += 1;
+    }
+
+    set_hwp->activity_window = (exponent & HWP_ACT_WINDOW_EXPONENT_MASK) <<
+                                   HWP_ACT_WINDOW_EXPONENT_SHIFT |
+                               (u & HWP_ACT_WINDOW_MANTISSA_MASK);
+    set_hwp->set_params |= XEN_SYSCTL_HWP_SET_ACT_WINDOW;
+
+    return 0;
+}
+
+static int parse_hwp_opts(xc_set_hwp_para_t *set_hwp, int *cpuid,
+                          int argc, char *argv[])
+{
+    int i = 0;
+
+    if ( argc < 1 ) {
+        fprintf(stderr, "Missing arguments\n");
+        return -1;
+    }
+
+    if ( parse_cpuid_non_fatal(argv[i], cpuid) == 0 )
+    {
+        i++;
+    }
+
+    if ( i == argc ) {
+        fprintf(stderr, "Missing arguments\n");
+        return -1;
+    }
+
+    if ( strcasecmp(argv[i], "powersave") == 0 )
+    {
+        set_hwp->set_params = XEN_SYSCTL_HWP_SET_PRESET_POWERSAVE;
+        i++;
+    }
+    else if ( strcasecmp(argv[i], "performance") == 0 )
+    {
+        set_hwp->set_params = XEN_SYSCTL_HWP_SET_PRESET_PERFORMANCE;
+        i++;
+    }
+    else if ( strcasecmp(argv[i], "balance") == 0 )
+    {
+        set_hwp->set_params = XEN_SYSCTL_HWP_SET_PRESET_BALANCE;
+        i++;
+    }
+
+    for ( ; i < argc; i++)
+    {
+        unsigned long val;
+        char *param = argv[i];
+        char *value;
+        char *suffix;
+        int ret;
+
+        value = strchr(param, ':');
+        if ( value == NULL )
+        {
+            fprintf(stderr, "\"%s\" is an invalid hwp parameter\n", argv[i]);
+            return -1;
+        }
+
+        value[0] = '\0';
+        value++;
+
+        errno = 0;
+        val = strtoul(value, &suffix, 10);
+        if ( (errno && val == ULONG_MAX) || value == suffix )
+        {
+            fprintf(stderr, "Could not parse number \"%s\"\n", value);
+            return -1;
+        }
+
+        if ( strncasecmp(param, "act-window", strlen(param)) == 0 )
+        {
+            ret = parse_activity_window(set_hwp, val, suffix);
+            if (ret)
+                return -1;
+
+            continue;
+        }
+
+        if ( val > 255 )
+        {
+            fprintf(stderr, "\"%s\" value \"%lu\" is out of range\n", param,
+                    val);
+            return -1;
+        }
+
+        if ( suffix && suffix[0] )
+        {
+            fprintf(stderr, "Suffix \"%s\" is invalid\n", suffix);
+            return -1;
+        }
+
+        if ( strncasecmp(param, "minimum", MAX(2, strlen(param))) == 0 )
+        {
+            set_hwp->minimum = val;
+            set_hwp->set_params |= XEN_SYSCTL_HWP_SET_MINIMUM;
+        }
+        else if ( strncasecmp(param, "maximum", MAX(2, strlen(param))) == 0 )
+        {
+            set_hwp->maximum = val;
+            set_hwp->set_params |= XEN_SYSCTL_HWP_SET_MAXIMUM;
+        }
+        else if ( strncasecmp(param, "desired", strlen(param)) == 0 )
+        {
+            set_hwp->desired = val;
+            set_hwp->set_params |= XEN_SYSCTL_HWP_SET_DESIRED;
+        }
+        else if ( strncasecmp(param, "energy-perf", strlen(param)) == 0 )
+        {
+            set_hwp->energy_perf = val;
+            set_hwp->set_params |= XEN_SYSCTL_HWP_SET_ENERGY_PERF;
+        }
+        else
+        {
+            fprintf(stderr, "\"%s\" is an invalid parameter\n", param);
+            return -1;
+        }
+    }
+
+    if ( set_hwp->set_params == 0 )
+    {
+        fprintf(stderr, "No parameters set in request\n");
+        return -1;
+    }
+
+    return 0;
+}
+
+static void hwp_set_func(int argc, char *argv[])
+{
+    xc_set_hwp_para_t set_hwp = {};
+    int cpuid = -1;
+    int i = 0;
+
+    if ( parse_hwp_opts(&set_hwp, &cpuid, argc, argv) )
+        exit(EINVAL);
+
+    if ( cpuid != -1 )
+    {
+        i = cpuid;
+        max_cpu_nr = i + 1;
+    }
+
+    for ( ; i < max_cpu_nr; i++ )
+        if ( xc_set_cpufreq_hwp(xc_handle, i, &set_hwp) )
+            fprintf(stderr, "[CPU%d] failed to set hwp params (%d - %s)\n",
+                    i, errno, strerror(errno));
+}
+
 struct {
     const char *name;
     void (*function)(int argc, char *argv[]);
@@ -1309,6 +1538,7 @@ struct {
     { "get-cpufreq-average", cpufreq_func },
     { "start", start_gather_func },
     { "get-cpufreq-para", cpufreq_para_func },
+    { "set-cpufreq-hwp", hwp_set_func },
     { "set-scaling-maxfreq", scaling_max_freq_func },
     { "set-scaling-minfreq", scaling_min_freq_func },
     { "set-scaling-governor", scaling_governor_func },
-- 
2.37.1


