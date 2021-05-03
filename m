Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12358372085
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:35:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121843.229830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeLO-0007V7-EQ; Mon, 03 May 2021 19:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121843.229830; Mon, 03 May 2021 19:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeLO-0007Ui-B3; Mon, 03 May 2021 19:35:02 +0000
Received: by outflank-mailman (input) for mailman id 121843;
 Mon, 03 May 2021 19:35:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeG4-0005i5-KY
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:29:32 +0000
Received: from mail-qv1-xf2f.google.com (unknown [2607:f8b0:4864:20::f2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fdb1852-9169-42f7-9597-236b74c2a607;
 Mon, 03 May 2021 19:28:59 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id jm10so3210244qvb.5
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:59 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:58 -0700 (PDT)
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
X-Inumbo-ID: 8fdb1852-9169-42f7-9597-236b74c2a607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SBP/WUCHYsHwmvFvXna4dIQQTPCdqZeigE28a+rXW1E=;
        b=O6BVnc4qd3xwHDBJXfoQIucfK9gnTGxsJRVTZbya52yOkKK+3zh0/rVotSg+Sl9Hpp
         Tql0xvakVp3Q29gD1H39GXvBQzEipXCd/8vKYbYfC9b8eILOcHb72QlNF9Nh3PIjmc/z
         FWZHtDC2IixKzDJ5IbkNZVIG6TZrQbFfMN7UrNco4svOIsNz8xNIj2DD7zD40z/HDIKK
         cJqcv7PvqopYvl3GimbTVrtMB4SIxB/hPMryBcsl5ZKwcWW2Aqd325ZLdVUXk+KV5te0
         1pTIAso0lQiqiDltBky+pPfwXFXPqRtOsrRAtPf0vDlM+ZN1bTIq96pj+CroXFhOVzDe
         fWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SBP/WUCHYsHwmvFvXna4dIQQTPCdqZeigE28a+rXW1E=;
        b=a58Arko+9KvYrQgPLfaRTRZO8xjMkq8ycF42IjFHPmW5egk3cZcp7RsuwCGAqAdovP
         kzuUxieFtmiIe8ALXZtut24/emQdDmxMf7ZJmu/1532FXBPOcy/xKtrahwoyCfA8maBh
         1NIDegU1R3e+a+FdUe6p+fttEKOrboGaQo0rPpbqucuu+HrhaBpjGSJ7BzUaKCUilkcw
         x6ABd5YXxpyW616FPZ3+ZsB5QG9wT8JPOIQt3WBNklT5mUFPE8hN45XbDghOr13kTPPp
         E72XsmlTwt9fVQLGRCQXXJGsadSvo5rUQ9sVnEwYaEKkbKIUNnVoOa6kDIZ7XbjkIBHn
         aICg==
X-Gm-Message-State: AOAM531rnk1IDXK6CIn8Bw0IaSuDYbJMbNSjXQbMpgwB4eXdEWIOssRI
	h9sh9ixh3/zf3vNfjoqMZKSd450OGPM=
X-Google-Smtp-Source: ABdhPJw9qRujRfcqvQQOj/Nh1hz+fW3OuLKeqluU/Upmh5MZLqNoVIeI+WS4P/Ajl4B+ngqLCxMG+A==
X-Received: by 2002:a0c:c488:: with SMTP id u8mr21113740qvi.47.1620070139057;
        Mon, 03 May 2021 12:28:59 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 12/13] xenpm: Add set-cpufreq-hwp subcommand
Date: Mon,  3 May 2021 15:28:09 -0400
Message-Id: <20210503192810.36084-13-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
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
 tools/misc/xenpm.c | 240 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 240 insertions(+)

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
-- 
2.30.2


