Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6EE772E33
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578812.906578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5LE-0001RR-89; Mon, 07 Aug 2023 18:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578812.906578; Mon, 07 Aug 2023 18:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5LE-0001PC-4B; Mon, 07 Aug 2023 18:52:32 +0000
Received: by outflank-mailman (input) for mailman id 578812;
 Mon, 07 Aug 2023 18:52:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5LC-0004lg-Nm
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:52:30 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eea7ef2-3553-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 20:52:29 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-76cdf055c64so417800685a.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:52:29 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:52:27 -0700 (PDT)
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
X-Inumbo-ID: 8eea7ef2-3553-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434348; x=1692039148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vy6l55+rICbbuCBbADGaq7cX5z20EMNlyiZQ4cOI23w=;
        b=gnpUvo20i1TFYP99cadluOYvaxMNd5nY7wt+HzhGdEQfwgjkzX3n0qokafBMyYnkYC
         2MI25xGHI4+fCYKeBHFj3UlNT3t5Kko9a5kEeZwIFE4U4W1QPMv+xE+7Ew216R5LcMbS
         D7PDx2N1CdPxYqDXi7rvurW4Du/FPSKCyedzSmbEThpKWHYpZUPo1nIKXX4ZnRfa/9W3
         go+0A3zypevobOWqNSvY9PF2w/IKOBJD2IY9xq0Fe7UFGF+oYI4V1YbZWvMJ6cB+mmVa
         YgrWnwvgBzw526ibKsN67rnrt7Eqf4g0yPZdFwnq04Qr9qoCzvZTngxsdLxX7m8s3K1G
         9X3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434348; x=1692039148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vy6l55+rICbbuCBbADGaq7cX5z20EMNlyiZQ4cOI23w=;
        b=ALQR2l7wpzmW4XgQ1jycutQ0Aa4gnRUfa7YIxDRJXY2peU0o9GuYz2OAWOIq/w7nPP
         u7Kjaw3raoCTGgRvZO4YgRS2qc5CRAYuFcAFsonHQ0rcJw7W13wkMxNWIRUZLYssrKkr
         igrJ+7bCSARkQQYbaUpdPR6geDNxWGDNv34AhXYWHiE05t2ajui5Oqlz9clyPTn4IptD
         K90YdO46pfJCHHG2rYvpSC02EaG3427sm+0pKN2oGUa1fKb//MA/fOwa/54cGD8IzvyN
         iqu9Yq1hd3qLyqLP1zrqgChFJVqPAItajMoLckNuIOwsm89uIjWYIhx4ysE8LxQpsZxp
         WDaA==
X-Gm-Message-State: AOJu0YxjjnQRT3uCot9p3gRk1A3cP4FacwHqunboYxPZV8PlpF8JnwaG
	OTdm3NpY3MoaQmkreGHDVg3NTCh5j3I=
X-Google-Smtp-Source: AGHT+IE270NkHftGVb6Bp1YfXQBa81JVmCLv3fKo81pPhZF8LWIBeXSP4vpcU+9V5qDfro0337GIoA==
X-Received: by 2002:a0c:e3c3:0:b0:636:47a5:4bc5 with SMTP id e3-20020a0ce3c3000000b0063647a54bc5mr9335668qvl.62.1691434348336;
        Mon, 07 Aug 2023 11:52:28 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8 14/15] xenpm: Add set-cpufreq-cppc subcommand
Date: Mon,  7 Aug 2023 14:51:18 -0400
Message-ID: <20230807185119.98333-15-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
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
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
v8:
Add Anthony's Ack

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
index 688529b59d..d982482a3f 100644
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


