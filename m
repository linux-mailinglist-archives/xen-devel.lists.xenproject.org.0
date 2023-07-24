Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4099375F7A5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:00:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568928.889126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvAL-0008G2-8e; Mon, 24 Jul 2023 12:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568928.889126; Mon, 24 Jul 2023 12:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvAL-0008AV-4P; Mon, 24 Jul 2023 12:59:57 +0000
Received: by outflank-mailman (input) for mailman id 568928;
 Mon, 24 Jul 2023 12:59:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNvAJ-0005PS-0z
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:55 +0000
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [2607:f8b0:4864:20::833])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb8e9920-2a21-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 14:59:54 +0200 (CEST)
Received: by mail-qt1-x833.google.com with SMTP id
 d75a77b69052e-403a7066d9bso25740411cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:54 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:52 -0700 (PDT)
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
X-Inumbo-ID: fb8e9920-2a21-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203593; x=1690808393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gblVHwIRoZ9Cb4sFC+wqThP0YWJWsFM4Sph0J9w8nz0=;
        b=C8u0rZ8OH0ChHPtFR5Y4ilL+LX/QpCLEuSQijfYkbVS0HuDaktqfzS9UQMxTWaNJCk
         Ky/21sffmMh0sI0waS61fI+Qzh2teTL5MskKUEOE+5g3om/ySNRi/IhlhFWfI2DjiVU4
         K8MxBkvjdDMlB1NnXRisNulGWeJG/akBLXtNMCCvUY4nfOT4+kl2DxLSLWkOTSks/8wq
         JOxBO/+DBYFe9NGTll7jUcaVdo5DpAGYA465SXHsXjCiUCWWDVUbvwnKZJHQ+f5MD9Dt
         08VtsZE1RR5K2rAPGkyzhShIiCJsl5xF/EpHmxIGZ4Mtmhe2+0e9h6w3rcEUTppCm+OF
         xr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203593; x=1690808393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gblVHwIRoZ9Cb4sFC+wqThP0YWJWsFM4Sph0J9w8nz0=;
        b=d4/0Vv09HkQqE1mEVccKurYuA+hQR63yT9PdxcRHhXPXB/WPPnocDIaF2BbbeVcYF2
         MECnQ+liTa2T9a/ky/eKiUp2CS+ZU5ByArAk9++4OeSWfD8dztxMB6NhXtB5UAujIGOr
         nNtZCkadtNctAia+ip4ec/zx/hZe+l2SmjspvnhgEL62ATbu4HPSUhSrn7v+6ZwTZrpl
         J+FtdFkRi0uoxrwmgOGRT3TwjiWZ84fiF+Uo5lTLPKG29275xf+1NERitzTP4rpJcMM2
         8QAo4b19/bluMTT2uLzG3xG3ajAJX1cNUnqP2qZBDxCxMw+z++uz0QrybLJwMyzKkfAR
         zT0w==
X-Gm-Message-State: ABy/qLZWE24kb7CfDcTbdZD/zuSxZGJaqeD8hJ1aPE8UsWTi2MLdo95X
	nAhtdaAE9aI9u678Yun39HrPXzf8uSw=
X-Google-Smtp-Source: APBJJlEZaj/SDM9fAVEkIn8Xu6YGvulO4B3cxv83Rg+IbT/weF6ok/CqS2nBSaemNL8U+OlvVIbMPQ==
X-Received: by 2002:ac8:5916:0:b0:403:b6b0:c1d8 with SMTP id 22-20020ac85916000000b00403b6b0c1d8mr8688084qty.7.1690203592676;
        Mon, 24 Jul 2023 05:59:52 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 14/15] xenpm: Add set-cpufreq-cppc subcommand
Date: Mon, 24 Jul 2023 08:58:56 -0400
Message-ID: <20230724125857.11133-15-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724125857.11133-1-jandryuk@gmail.com>
References: <20230724125857.11133-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set-cpufreq-cppc allows setting the Hardware P-State (HWP) parameters.

It can be run on all or just a single cpu.  There are presets of
balance, powersave & performance.  Those can be further tweaked by
param:val arguments as explained in the usage description.

Parameter names are just checked to the first 3 characters to shorten
typing.

Some options are hardware dependent, and ranges can be found in
get-cpufreq-para.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v5:
Make i unsigned int
Use local max_cpuid instead of max_cpu_nr
Add Jan's Ack
Check set_params and print a message if activity window wasn't set

v4:
Remove energy bias 0-15 & 7 references
Use MASK_INSR
Fixup { placement
Drop extra case in parse_activity_window
strcmp suffix
Expand help text
s/hwp/cppc/
Use isdigit() to check cpuid - otherwise run on all CPUs.

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
 tools/misc/xenpm.c | 244 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 244 insertions(+)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 3abd99fd20..0877f43946 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -16,6 +16,8 @@
  */
 #define MAX_NR_CPU 512
 
+#include <ctype.h>
+#include <limits.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
@@ -67,6 +69,30 @@ void show_help(void)
             " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
             "                                     set the C-State limitation (<num> >= 0) and\n"
             "                                     optionally the C-sub-state limitation (<num2> >= 0)\n"
+            " set-cpufreq-cppc      [cpuid] [balance|performance|powersave] <param:val>*\n"
+            "                                     set Hardware P-State (HWP) parameters\n"
+            "                                     on CPU <cpuid> or all if omitted.\n"
+            "                                     optionally a preset of one of:\n"
+            "                                       balance|performance|powersave\n"
+            "                                     an optional list of param:val arguments\n"
+            "                                       minimum:N (0-255)\n"
+            "                                       maximum:N (0-255)\n"
+            "                                           get-cpufreq-para lowest/highest\n"
+            "                                           values are limits for\n"
+            "                                           minumum/maximum.\n"
+            "                                       desired:N (0-255)\n"
+            "                                           set explicit performance target.\n"
+            "                                           non-zero disables auto-HWP mode.\n"
+            "                                       energy-perf:N (0-255)\n"
+            "                                                   energy/performance hint\n"
+            "                                                   lower - favor performance\n"
+            "                                                   higher - favor powersave\n"
+            "                                                   128 - balance\n"
+            "                                       act-window:N{,m,u}s range 1us-1270s\n"
+            "                                           window for internal calculations.\n"
+            "                                           units default to \"us\" if unspecified.\n"
+            "                                           truncates un-representable values.\n"
+            "                                           0 lets the hardware decide.\n"
             " start [seconds]                     start collect Cx/Px statistics,\n"
             "                                     output after CTRL-C or SIGINT or several seconds.\n"
             " enable-turbo-mode     [cpuid]       enable Turbo Mode for processors that support it.\n"
@@ -1292,6 +1318,223 @@ void disable_turbo_mode(int argc, char *argv[])
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
+static int parse_activity_window(xc_set_cppc_para_t *set_cppc, unsigned long u,
+                                 const char *suffix)
+{
+    unsigned int exponent = 0;
+    unsigned int multiplier = 1;
+
+    if ( suffix && suffix[0] )
+    {
+        if ( strcmp(suffix, "s") == 0 )
+        {
+            multiplier = 1000 * 1000;
+            exponent = 6;
+        }
+        else if ( strcmp(suffix, "ms") == 0 )
+        {
+            multiplier = 1000;
+            exponent = 3;
+        }
+        else if ( strcmp(suffix, "us") != 0 )
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
+    set_cppc->activity_window =
+        MASK_INSR(exponent, XEN_CPPC_ACT_WINDOW_EXPONENT_MASK) |
+        MASK_INSR(u, XEN_CPPC_ACT_WINDOW_MANTISSA_MASK);
+    set_cppc->set_params |= XEN_SYSCTL_CPPC_SET_ACT_WINDOW;
+
+    return 0;
+}
+
+static int parse_cppc_opts(xc_set_cppc_para_t *set_cppc, int *cpuid,
+                           int argc, char *argv[])
+{
+    int i = 0;
+
+    if ( argc < 1 )
+    {
+        fprintf(stderr, "Missing arguments\n");
+        return -1;
+    }
+
+    if ( isdigit(argv[i][0]) )
+    {
+        if ( sscanf(argv[i], "%d", cpuid) != 1 || *cpuid < 0 )
+        {
+            fprintf(stderr, "Could not parse cpuid \"%s\"\n", argv[i]);
+            return -1;
+        }
+
+        i++;
+    }
+
+    if ( i == argc )
+    {
+        fprintf(stderr, "Missing arguments\n");
+        return -1;
+    }
+
+    if ( strcasecmp(argv[i], "powersave") == 0 )
+    {
+        set_cppc->set_params = XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE;
+        i++;
+    }
+    else if ( strcasecmp(argv[i], "performance") == 0 )
+    {
+        set_cppc->set_params = XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE;
+        i++;
+    }
+    else if ( strcasecmp(argv[i], "balance") == 0 )
+    {
+        set_cppc->set_params = XEN_SYSCTL_CPPC_SET_PRESET_BALANCE;
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
+            fprintf(stderr, "\"%s\" is an invalid cppc parameter\n", argv[i]);
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
+            ret = parse_activity_window(set_cppc, val, suffix);
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
+            set_cppc->minimum = val;
+            set_cppc->set_params |= XEN_SYSCTL_CPPC_SET_MINIMUM;
+        }
+        else if ( strncasecmp(param, "maximum", MAX(2, strlen(param))) == 0 )
+        {
+            set_cppc->maximum = val;
+            set_cppc->set_params |= XEN_SYSCTL_CPPC_SET_MAXIMUM;
+        }
+        else if ( strncasecmp(param, "desired", strlen(param)) == 0 )
+        {
+            set_cppc->desired = val;
+            set_cppc->set_params |= XEN_SYSCTL_CPPC_SET_DESIRED;
+        }
+        else if ( strncasecmp(param, "energy-perf", strlen(param)) == 0 )
+        {
+            set_cppc->energy_perf = val;
+            set_cppc->set_params |= XEN_SYSCTL_CPPC_SET_ENERGY_PERF;
+        }
+        else
+        {
+            fprintf(stderr, "\"%s\" is an invalid parameter\n", param);
+            return -1;
+        }
+    }
+
+    if ( set_cppc->set_params == 0 )
+    {
+        fprintf(stderr, "No parameters set in request\n");
+        return -1;
+    }
+
+    return 0;
+}
+
+static void cppc_set_func(int argc, char *argv[])
+{
+    xc_set_cppc_para_t set_cppc = {};
+    unsigned int max_cpuid = max_cpu_nr;
+    int cpuid = -1;
+    unsigned int i = 0;
+    uint32_t set_params;
+
+    if ( parse_cppc_opts(&set_cppc, &cpuid, argc, argv) )
+        exit(EINVAL);
+
+    if ( cpuid != -1 )
+    {
+        i = cpuid;
+        max_cpuid = i + 1;
+    }
+
+    set_params = set_cppc.set_params;
+    for ( ; i < max_cpuid; i++ ) {
+        if ( xc_set_cpufreq_cppc(xc_handle, i, &set_cppc) )
+            fprintf(stderr, "[CPU%d] failed to set cppc params (%d - %s)\n",
+                    i, errno, strerror(errno));
+    }
+
+    if ( (set_params ^ set_cppc.set_params) & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
+        printf("Activity window not supported and omitted\n");
+}
+
 struct {
     const char *name;
     void (*function)(int argc, char *argv[]);
@@ -1302,6 +1545,7 @@ struct {
     { "get-cpufreq-average", cpufreq_func },
     { "start", start_gather_func },
     { "get-cpufreq-para", cpufreq_para_func },
+    { "set-cpufreq-cppc", cppc_set_func },
     { "set-scaling-maxfreq", scaling_max_freq_func },
     { "set-scaling-minfreq", scaling_min_freq_func },
     { "set-scaling-governor", scaling_governor_func },
-- 
2.41.0


