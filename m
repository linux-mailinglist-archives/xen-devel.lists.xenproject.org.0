Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B67331910
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 22:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95110.179475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN6W-0007d8-3t; Mon, 08 Mar 2021 21:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95110.179475; Mon, 08 Mar 2021 21:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN6W-0007ci-05; Mon, 08 Mar 2021 21:07:52 +0000
Received: by outflank-mailman (input) for mailman id 95110;
 Mon, 08 Mar 2021 21:07:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odrr=IG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJN2A-0006P0-Jq
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 21:03:22 +0000
Received: from mail-qk1-x733.google.com (unknown [2607:f8b0:4864:20::733])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b51513b8-6bfb-48fc-bc0d-6441286aa7d3;
 Mon, 08 Mar 2021 21:02:47 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id b130so10829284qkc.10
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 13:02:47 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a33e:daa7:46a1:a7eb])
 by smtp.gmail.com with ESMTPSA id
 r2sm8514070qti.4.2021.03.08.13.02.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:02:46 -0800 (PST)
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
X-Inumbo-ID: b51513b8-6bfb-48fc-bc0d-6441286aa7d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PKJr8nrwfa99gzKdxy4i3QfsaQ+/kCEtBoAhhMKOwBc=;
        b=AGJqFitOs3SR/s3GKDOeCYaFSW2EOleleZyJ/l4r6z+1kV6iswUlvVlUw6jKFMrglP
         y7wfdqEI0ut4+sU2XdXaOGkaX6RYbehVdbBioKIX2lhOg5TMaQVXWXu1bkiHymevfWIp
         yqiw6SPbITy5LqVtlOZPNEHn66LgrB08HbB3OgHUKnX5kpatchhOc9aB4WkgI0JhOzxu
         BF02madFzY0pxaq3sUSmLDYIFNBjB6dLURnd8AJqxwGuOShxklWr3+LIYPyRstVB7LBm
         bq3c12d7MD5MEsq5G2neE1ai0E1zHYrwzwcAY103D9uIoeQnFz2uvS7qzz492tXf37Fd
         3C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PKJr8nrwfa99gzKdxy4i3QfsaQ+/kCEtBoAhhMKOwBc=;
        b=Fi4vYFSRSMUleKvffC1xxVcKDl0VSKi5xXuyuoeX8cyMV3qvqhwRskJ+mg9t131wRs
         kSTndLTbyMUarDGxy7vb3WcgIQKU015PDFkunNXkaude//ldLREccZJY90pbjFc7SK6M
         63t0QikTiJz+YAWzpCVwF7O21oVd/QKaM5nO0SNL6YSXtYfr1vRGY4ZXjjq/HQD1/0vU
         g5CTQ5sKhEyfBSLvTlOFmBqwYLzo728gNmnCU3TOAVULKu8u8l4FD1D2xPQJxQ7V6TES
         sqKklU2GFWqt3r3VNnjs11k0u2pp7H2/ay3KmM/vLwBTrUtOwkE3g+hyAGuintF2frz1
         W+rw==
X-Gm-Message-State: AOAM532D2t/PqwO4YhMkcX6PKD4GuJvmS59QIVRztu8vOXosjt6UoEVs
	2Ff6kqwWbjS6le8BI3GNMSgH9kV0E0o=
X-Google-Smtp-Source: ABdhPJykpZdiAikj/fSZyShWHGRzVySaMqLE1EYhJjnKIDorwAsEFzY0mTfkgnKVTsqakCSIMg/7Tw==
X-Received: by 2002:a37:9ed0:: with SMTP id h199mr22916899qke.8.1615237366768;
        Mon, 08 Mar 2021 13:02:46 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pawel@invisiblethingslab.com,
	marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 12/12] xenpm: Add set-cpufreq-hwp subcommand
Date: Mon,  8 Mar 2021 16:02:10 -0500
Message-Id: <20210308210210.116278-13-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308210210.116278-1-jandryuk@gmail.com>
References: <20210308210210.116278-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set-cpufreq-hwp allows setting the Hardware P-State (HWP) parameters.

It can be run on all or just a snigle cpu.  There are preset of
balance, powersave & performance.  Those can be further tweaked by
param:val arguments as explained in the usage description.

parameter names are just checked to the first 3 characters to shorten
typing.

Some options are hardware dependent, and ranges can be found in
get-cpufreq-para.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/misc/xenpm.c              | 240 ++++++++++++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/hwp.c |   1 +
 2 files changed, 241 insertions(+)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index a686f8f46e..d3bcaf3b58 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -67,6 +67,25 @@ void show_help(void)
             " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
             "                                     set the C-State limitation (<num> >= 0) and\n"
             "                                     optionally the C-sub-state limitation (<num2> >= 0)\n"
+            " set-cpufreq-hwp       [cpuid] [balance|performance|powersave] <param:val>*\n"
+            "                                     set Hardware P-State (HWP) parameters\n"
+            "                                     optionally a preset of one of\n"
+            "                                       balance|performance|powersave\n"
+            "                                     an optional list of param:val arguments\n"
+            "                                       minimum:N  hw_lowest ... hw_highest\n"
+            "                                       maximum:N  hw_lowest ... hw_highest\n"
+            "                                       desired:N  hw_lowest ... hw_highest\n"
+            "                                           Set explicit performance target.\n"
+            "                                           non-zero disables auto-HWP mode.\n"
+            "                                       energy_perf:0-255 (or 0-15)\n"
+            "                                                   energy/performance hint\n"
+            "                                                   lower favor performance\n"
+            "                                                   higher favor powersave\n"
+            "                                                   127 (or 7) balance\n"
+            "                                       act_window:N{,m,u}s range 0us-1270s\n"
+            "                                           window for internal calculations.\n"
+            "                                           0 lets the hardware decide.\n"
+            "                                     get-cpufreq-para returns hw_lowest/highest.\n"
             " start [seconds]                     start collect Cx/Px statistics,\n"
             "                                     output after CTRL-C or SIGINT or several seconds.\n"
             " enable-turbo-mode     [cpuid]       enable Turbo Mode for processors that support it.\n"
@@ -1309,6 +1328,226 @@ void disable_turbo_mode(int argc, char *argv[])
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
+ *        1 Not activity_window. i.e. try parsing as another argument
+ */
+static int parse_activity_window(xc_set_hwp_para_t *set_hwp, char *p)
+{
+    char *param = NULL, *val = NULL, *suffix = NULL;
+    unsigned int u;
+    unsigned int exponent = 0;
+    unsigned int multiplier = 1;
+    int ret;
+
+    ret = sscanf(p, "%m[a-z_A-Z]:%ms", &param, &val);
+    if ( ret != 2 )
+    {
+        return -1;
+    }
+
+    if ( strncasecmp(param, "act", 3) != 0 )
+    {
+        ret = 1;
+
+        goto out;
+    }
+
+    free(param);
+    param = NULL;
+
+    ret = sscanf(val, "%u%ms", &u, &suffix);
+    if ( ret != 1 && ret != 2 )
+    {
+        fprintf(stderr, "invalid activity window: %s\n", val);
+
+        ret = -1;
+
+        goto out;
+    }
+
+    if ( ret == 2 && suffix )
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
+            fprintf(stderr, "invalid activity window units: %s\n", suffix);
+
+            ret = -1;
+            goto out;
+        }
+    }
+
+    if ( u > 1270 * 1000 * 1000 / multiplier )
+    {
+        fprintf(stderr, "activity window %s too large\n", val);
+
+        ret = -1;
+        goto out;
+    }
+
+    /* looking for 7 bits of mantissa and 3 bits of exponent */
+    while ( u > 127 )
+    {
+        u /= 10;
+        exponent += 1;
+    }
+
+    set_hwp->activity_window = ( exponent & 0x7 ) << 7 | ( u & 0x7f );
+    set_hwp->set_params |= XEN_SYSCTL_HWP_SET_ACT_WINDOW;
+
+    ret = 0;
+
+ out:
+    free(suffix);
+    free(param);
+    free(val);
+
+    return ret;
+}
+
+static int parse_hwp_opts(xc_set_hwp_para_t *set_hwp, int *cpuid,
+                          int argc, char *argv[])
+{
+    int i = 0;
+
+    if ( argc < 1 )
+        return -1;
+
+    if ( parse_cpuid_non_fatal(argv[i], cpuid) == 0 )
+    {
+        i++;
+    }
+
+    if ( i == argc )
+        return -1;
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
+        unsigned int val;
+        char *param;
+        int ret;
+
+        ret = parse_activity_window(set_hwp, argv[i]);
+        switch ( ret )
+        {
+        case -1:
+            return -1;
+        case 0:
+            continue;
+            break;
+        case 1:
+            /* try other parsing */
+            break;
+        }
+
+        /* sscanf can't handle split on ':' for "%ms:%u'  */
+        ret = sscanf(argv[i], "%m[a-zA-Z_]:%u", &param, &val);
+        if ( ret != 2 )
+        {
+            fprintf(stderr, "%s is an invalid hwp parameter.\n", argv[i]);
+            return -1;
+        }
+
+        if ( val > 255 )
+        {
+            fprintf(stderr, "%s value %u is out of range.\n", param, val);
+            return -1;
+        }
+
+        if ( strncasecmp(param, "min", 3) == 0 )
+        {
+            set_hwp->minimum = val;
+            set_hwp->set_params |= XEN_SYSCTL_HWP_SET_MINIMUM;
+        }
+        else if ( strncasecmp(param, "max", 3) == 0 )
+        {
+            set_hwp->maximum = val;
+            set_hwp->set_params |= XEN_SYSCTL_HWP_SET_MAXIMUM;
+        }
+        else if ( strncasecmp(param, "des", 3) == 0 )
+        {
+            set_hwp->desired = val;
+            set_hwp->set_params |= XEN_SYSCTL_HWP_SET_DESIRED;
+        }
+        else if ( strncasecmp(param, "ene", 3) == 0 )
+        {
+            set_hwp->energy_perf = val;
+            set_hwp->set_params |= XEN_SYSCTL_HWP_SET_ENERGY_PERF;
+        }
+        else
+        {
+            fprintf(stderr, "%s is an invalid parameter\n.", param);
+            return -1;
+        }
+
+        free(param);
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
+    {
+        fprintf(stderr, "Missing, excess, or invalid argument(s)\n");
+        exit(EINVAL);
+    }
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
@@ -1319,6 +1558,7 @@ struct {
     { "get-cpufreq-average", cpufreq_func },
     { "start", start_gather_func },
     { "get-cpufreq-para", cpufreq_para_func },
+    { "set-cpufreq-hwp", hwp_set_func },
     { "set-scaling-maxfreq", scaling_max_freq_func },
     { "set-scaling-minfreq", scaling_min_freq_func },
     { "set-scaling-governor", scaling_governor_func },
diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 8f4b18d246..0fd70d76a8 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -584,6 +584,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
     }
 
     if ( set_hwp->set_params & XEN_SYSCTL_HWP_SET_DESIRED &&
+         set_hwp->desired != 0 &&
          ( set_hwp->desired < data->hw_lowest ||
            set_hwp->desired > data->hw_highest ) )
     {
-- 
2.29.2


