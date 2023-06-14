Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A969730695
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549134.857581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uqn-0001RD-UP; Wed, 14 Jun 2023 18:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549134.857581; Wed, 14 Jun 2023 18:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uqn-0001Na-O1; Wed, 14 Jun 2023 18:04:09 +0000
Received: by outflank-mailman (input) for mailman id 549134;
 Wed, 14 Jun 2023 18:04:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9Uqm-0005L9-E0
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:04:08 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da0f1f78-0add-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 20:04:06 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-75d44cb20a2so228113685a.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:04:06 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:04:04 -0700 (PDT)
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
X-Inumbo-ID: da0f1f78-0add-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765845; x=1689357845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2TAha9GGtbIdxJkaO8y2Wuv/uF0GuXKaVPOMOdxqX78=;
        b=DhcVB+qzfZOk0Tf3YAquvn9Qk0KzgkFeL7oyELAWV6v+8KLFDlIEqNEMaTZnFggGPh
         Y3TAvf7cXIO940NA3F5WnKWZtKlDwPxz4jNbU3NlKW7ufGX2THKvYjPi3/H5urUNmvHB
         tbXej7KCWfCL25EjBaIK/LKXXCNIEKbIW9SxuiNQUQvQR4VL/21/fjlavKmsDXOrzF80
         06+jm1aypyUb2+1Qk8zLncZsf74p9W6b1WOMlM9jUAird2lETwOunjmhV8jQIJkBpdvT
         DVENOQ+zniWrtS/huRheitJNTzzyapyrhK9cB2bXSs8fPAUkjh795lk7Occ7nt3lfkTx
         TMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765845; x=1689357845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TAha9GGtbIdxJkaO8y2Wuv/uF0GuXKaVPOMOdxqX78=;
        b=VifRWYZdT/oNytRLSGUbNTe4zag0VLZFDV+6S0USAvpszKR/bGJ50cg2U1RP1Gisyt
         DagnLt47xjIFFGYvpQfKKV5kqv0cA90qbruMhWyRzrPyLpXM5KWA+6FyH8oINmEQxrTf
         hgAlEZYLX2H00ixgsHxPcmD1iTzpm+6buoVHV9kASKBurtWZYNPaPTPtCSDQVaHGh/dR
         cR1zAYh0J2geiLVV53MN/i3vd1Niru66sxBwS/BsruGSglf7e0I41pOKAecZ7/Ao9Jcq
         URSjW+EC8x5Wc3oQZJbdPLFTxIpSUpRs5xrUiPyjCtqAcboHA8XXVbL3f8MedqIGxUNn
         Hb3A==
X-Gm-Message-State: AC+VfDxA2FX3jH0R5al2p/jRWO17a/+ykdGP177XQ9CA+gyvggPk8sY/
	rEhU7hqCM+CZ5vkglN6W3ge3yhy17cs=
X-Google-Smtp-Source: ACHHUZ7sTpaZjatEnLKDG0GeXM4DB6r32bbGsSisKNq+DZoxG62Lk0Nkap5olQC11CqZU7HfU7DArA==
X-Received: by 2002:a05:6214:e6b:b0:626:38cc:6497 with SMTP id jz11-20020a0562140e6b00b0062638cc6497mr18507482qvb.5.1686765844607;
        Wed, 14 Jun 2023 11:04:04 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 14/15] xenpm: Add set-cpufreq-cppc subcommand
Date: Wed, 14 Jun 2023 14:02:52 -0400
Message-Id: <20230614180253.89958-15-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
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
---
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
 tools/misc/xenpm.c | 237 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 237 insertions(+)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 488797fd20..2f2b699794 100644
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
@@ -1292,6 +1318,216 @@ void disable_turbo_mode(int argc, char *argv[])
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
+    int cpuid = -1;
+    int i = 0;
+
+    if ( parse_cppc_opts(&set_cppc, &cpuid, argc, argv) )
+        exit(EINVAL);
+
+    if ( cpuid != -1 )
+    {
+        i = cpuid;
+        max_cpu_nr = i + 1;
+    }
+
+    for ( ; i < max_cpu_nr; i++ )
+        if ( xc_set_cpufreq_cppc(xc_handle, i, &set_cppc) )
+            fprintf(stderr, "[CPU%d] failed to set cppc params (%d - %s)\n",
+                    i, errno, strerror(errno));
+}
+
 struct {
     const char *name;
     void (*function)(int argc, char *argv[]);
@@ -1302,6 +1538,7 @@ struct {
     { "get-cpufreq-average", cpufreq_func },
     { "start", start_gather_func },
     { "get-cpufreq-para", cpufreq_para_func },
+    { "set-cpufreq-cppc", cppc_set_func },
     { "set-scaling-maxfreq", scaling_max_freq_func },
     { "set-scaling-minfreq", scaling_min_freq_func },
     { "set-scaling-governor", scaling_governor_func },
-- 
2.40.1


