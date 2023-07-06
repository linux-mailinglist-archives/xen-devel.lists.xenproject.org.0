Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB03A74A408
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560029.875598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUCP-0003FH-Py; Thu, 06 Jul 2023 18:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560029.875598; Thu, 06 Jul 2023 18:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUCP-0003CU-Lt; Thu, 06 Jul 2023 18:59:29 +0000
Received: by outflank-mailman (input) for mailman id 560029;
 Thu, 06 Jul 2023 18:59:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU93-0003x0-6f
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:56:01 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be88c7ac-1c2e-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 20:55:59 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-766fd5f9536so91290685a.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:55:59 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:56 -0700 (PDT)
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
X-Inumbo-ID: be88c7ac-1c2e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669757; x=1691261757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gblVHwIRoZ9Cb4sFC+wqThP0YWJWsFM4Sph0J9w8nz0=;
        b=HKZ8WfMZFZrUBl8E6JeIbkyEDqzsk49wKWIfc5+cn/s3uHdhLTuugUvb8UDp9Im+J7
         OWol+ZqYlmNVgUGPa7rVUJNSobCDcWRU+madg4NPO8L0Izu+l7Z4WgqbSZYUwGTK5T1m
         GkT5iQvhunLoWl805UkhUM2tYD3U5i5V8gCQYFFHB1kxpUC31aG7Cgl05yUpWFdSs5BE
         +EzTqA0MA+I08FYhTTXwPQOyiluv9wBOfwrvqP/OTXlxW9oblvalFQvMW0UOH7I22Puo
         WPuc5iJYcdMUKPC0uDlgT5o2+DpXmxVJdveIvdjvxtHrBBnSIImN8wO2rRNCNGZ9Q8ZD
         6NpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669757; x=1691261757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gblVHwIRoZ9Cb4sFC+wqThP0YWJWsFM4Sph0J9w8nz0=;
        b=kSMVxMPNecb1RSBub7rwxt0lYtaZFl0O8IrXcSLSmR/ayZl4AFFlClZlXMTkZYez7v
         mmaCTz5QnTWQP3LkM8174FNxT601l0+12oQKUu4p/x6die4lsD2aqC93Aj1yxY+nbkyX
         GGWXgiITXF5fbA90bjN5VzV8P32ah0lfzar1e81CsVxW/72RwjmsKz3sjO6+wNAU5Gv0
         3c99gCB/Z9ARSyDS9M6xLcRdx/Gfz02ZL+af5PZqn/1dYPHKi5naSgrhGvm2iEPOK1m6
         FT/mXdpF5nZzQW8+cNWp2ZMmg/uRcXX5S3ulHZ9FyoH5q6CyCUVFm/2ZC875XnS193Ah
         pQPw==
X-Gm-Message-State: ABy/qLYxHbWIZeowdv6lfmGDRnQ4L+RrT7QTTN7dToawudKMP2f8dTHP
	GyF3G2ie3ycNF+y55Z9qXvuRHx3/uVg=
X-Google-Smtp-Source: APBJJlEZc1uaT+n1dr8rdgGogn1D1RIvRYHslxYmUDLpvEY7l4uy9Ea/fy0or1TQaS84UaV0U+oBBw==
X-Received: by 2002:a05:620a:24cf:b0:765:575b:415 with SMTP id m15-20020a05620a24cf00b00765575b0415mr3328877qkn.24.1688669757355;
        Thu, 06 Jul 2023 11:55:57 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 14/15] xenpm: Add set-cpufreq-cppc subcommand
Date: Thu,  6 Jul 2023 14:54:39 -0400
Message-ID: <20230706185440.48333-15-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
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


