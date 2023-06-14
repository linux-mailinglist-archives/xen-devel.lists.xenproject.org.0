Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCED730693
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549130.857561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uqh-0000SX-8K; Wed, 14 Jun 2023 18:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549130.857561; Wed, 14 Jun 2023 18:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9Uqh-0000PH-4W; Wed, 14 Jun 2023 18:04:03 +0000
Received: by outflank-mailman (input) for mailman id 549130;
 Wed, 14 Jun 2023 18:04:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9Uqf-0005L9-Cw
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:04:01 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d61b5b31-0add-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 20:03:59 +0200 (CEST)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-62de85dd962so18741206d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:03:59 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:57 -0700 (PDT)
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
X-Inumbo-ID: d61b5b31-0add-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765838; x=1689357838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2G+0xPmD9u5kzp6yWDZeh7ZvMy436YMgfg56aXJDM/0=;
        b=HFJzrNHYhSAPngEZ+wRb669gxq7uVYIQUwX4ldz3MzimvMKIFT8t83knxO0WaPhlMW
         BlpJMbxpKr85dkg4lpDWbbe/ceItB8S8VEcWrwPcnQrmvFip/nZaXKTAy1EtTognkWSr
         SGSdSZB62pmMdcnIWJ17A6BvqfebQU5wipwGbDycElYp67dlTD2u/74NcKg+6LOf9835
         9pIvtH+uw8nSDLw+u4oAgMVbSyvlfPWNIa1Ft6jllKH4zyV8/MBUbIoKfMJAwT/JuA9N
         0usYC2hGp+OOHfEiozYpIEgiApujrkYvlFd/5+22k+7dAgAMZo3W6taCx3X3DCycfDbd
         LhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765838; x=1689357838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2G+0xPmD9u5kzp6yWDZeh7ZvMy436YMgfg56aXJDM/0=;
        b=JSWPnyD9UnrQbKuxWpUkl6rxrvaA2b8qPEORGLseUuuU6OTE0NlhsVC8Fq0ETkSLyI
         fb/i3SsMJERHR1pt6EiZp7oAadPAyHD/JJglrFy0HCyxDwmhsAtoly2PQ1M48QQzk3gD
         ZF5m1OfzaFdb6hDsxWkJArCjyH4V8TXDDgFgT0AknflPaihHnsR9VAkh1M0NvMkU3U74
         PhP5CL0YRiAEMFmcnkW/m68SXDW5H9YKlHfjwegscVWaeETccGbNyEXpYZ+dfmn2/hBs
         OhwrrNj87ErvT5tb2Hv7rEz7+vYJPoLiqUPN8XfC43rgCUQ10wsCuTxY9i85UGDQg9/O
         YXZg==
X-Gm-Message-State: AC+VfDw83zb/PQe9HK50susQcZzzmr08/vpRJ1Nuz6mIb6pa05FoJQgg
	LZlCpneX8oQNauCw26RG9EtdO7sJn3o=
X-Google-Smtp-Source: ACHHUZ740s5OQ6s/5g9KdK4xRCjO1EnL5dM8aI86KWmOknFw61KSZMzn+Po6mkTlPMwNCiQ5pD7ZMw==
X-Received: by 2002:ad4:5dea:0:b0:62d:f8e7:3043 with SMTP id jn10-20020ad45dea000000b0062df8e73043mr5465088qvb.18.1686765837938;
        Wed, 14 Jun 2023 11:03:57 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 11/15] xenpm: Print HWP/CPPC parameters
Date: Wed, 14 Jun 2023 14:02:49 -0400
Message-Id: <20230614180253.89958-12-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
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

v4:
Return activity_window from calculate_hwp_activity_window
Use blanks instead of _ in output
Use MASK_EXTR
Check XEN_HWP_DRIVER name since governor is no longer returned
s/hwp/cppc
---
 tools/misc/xenpm.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 4e53e68dc5..488797fd20 100644
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
2.40.1


