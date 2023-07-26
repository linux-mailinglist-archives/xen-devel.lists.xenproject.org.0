Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 149AD763D74
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:17:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570663.892729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi8a-0004Iw-IX; Wed, 26 Jul 2023 17:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570663.892729; Wed, 26 Jul 2023 17:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi8a-00047y-72; Wed, 26 Jul 2023 17:17:24 +0000
Received: by outflank-mailman (input) for mailman id 570663;
 Wed, 26 Jul 2023 17:17:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi2p-0005nP-6l
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:11:27 +0000
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [2607:f8b0:4864:20::f34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72e669bf-2bd7-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 19:11:24 +0200 (CEST)
Received: by mail-qv1-xf34.google.com with SMTP id
 6a1803df08f44-63d1238c300so549856d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:11:25 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:11:22 -0700 (PDT)
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
X-Inumbo-ID: 72e669bf-2bd7-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391483; x=1690996283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gblVHwIRoZ9Cb4sFC+wqThP0YWJWsFM4Sph0J9w8nz0=;
        b=D/SWrGlHIE6OS7AXo5KLJiE8Br+n1jnkH8WKomZZqlzMcviXZe6PTZcGcfUgKTxe8a
         3oQErkwbUYqbAqDx+IRKwL9ga+YX3e8MxaMs0B4YsVQoC1T2oxa8J3HRtmkfiUB+4xZP
         5VIymmdRpDDx0gvaY9XOJ4T9GmQQUgx8zAkcyRtvdLxgSUOY2vEtm10Ykbn/LP1ZWimu
         TUdZqItCoczrq8MuUswS+/7u/l1a+vyAt10dwfAr2T3NCubAUcEbh14PPHKjSmE6I7C9
         dFaHM8B54aYbIOp2KnQeYBHxgvTPWIq9YKtQdJQAgsAxbCfFWKvts9rmz4jpfZt8ZBM8
         vY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391483; x=1690996283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gblVHwIRoZ9Cb4sFC+wqThP0YWJWsFM4Sph0J9w8nz0=;
        b=XnrtUUONlgl2sCOO+nRy9q+I15JJF5TFEd7hHBg4eY+/30jtS5NlcIngInUi+Of/2X
         MmHdBA+k3GqW1de8INNZaKobzWMf4VOK1VfWK/k37M/HvTI1jdUeCXQ03XKJUAe+QdpX
         PL8okvevPhcTDfm4OrpvBqKot+LJuTYeSIpBmEuz0xvwgvPfOPvgTLSOAnbZu4ZtHdzD
         Bt/dE/YzuLgdhAuCDlTrcxsHGUULiLertuodZmHhISb+YeNGJ64Bthz9OCAZ4bC1Tmp+
         fu1aNWonT1tPrd419Gw9wDFp+GqkqNJr/JZzqe5tHYw80WQjdv/3xvEUBYEcW6jarD1/
         Ok+g==
X-Gm-Message-State: ABy/qLYY3Jrsk42sOJCbo/hiMmfbLAbYAJG7L2nFRk/2VU7mZLDpwN1O
	pw7GJ1d/hHogrzjNw+EMF3JQparLTn0=
X-Google-Smtp-Source: APBJJlG2mAz/7i4T/ZOBnN5tJ9K+wAlzEb7gRCKFXz3COj83bkobJ2TfnYtmAcMUvOa/JCwPEV69zA==
X-Received: by 2002:a05:6214:80b:b0:631:6eea:c4f0 with SMTP id df11-20020a056214080b00b006316eeac4f0mr2169372qvb.48.1690391483494;
        Wed, 26 Jul 2023 10:11:23 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 14/15] xenpm: Add set-cpufreq-cppc subcommand
Date: Wed, 26 Jul 2023 13:09:44 -0400
Message-ID: <20230726170945.34961-15-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726170945.34961-1-jandryuk@gmail.com>
References: <20230726170945.34961-1-jandryuk@gmail.com>
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


