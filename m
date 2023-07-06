Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3AF74A402
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:55:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559988.875567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8s-0007tX-Nb; Thu, 06 Jul 2023 18:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559988.875567; Thu, 06 Jul 2023 18:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8s-0007oS-Ft; Thu, 06 Jul 2023 18:55:50 +0000
Received: by outflank-mailman (input) for mailman id 559988;
 Thu, 06 Jul 2023 18:55:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU8q-0003x8-Kx
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:55:48 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b78a2727-1c2e-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 20:55:47 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-765a5b93b5bso103326185a.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:55:47 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:44 -0700 (PDT)
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
X-Inumbo-ID: b78a2727-1c2e-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669746; x=1691261746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imeu59UbyEmxk/60do4rzt8IPOfqsoGRviRd+fRZmSg=;
        b=NHygVEY9QHYm0AxnCyYcRC5dW9Ivh6lam9Ug1/ng7OkZjORovjTOpUy2fmK3bMMHMo
         vC9KL5t7f2ru+WsNNRxf2WQHSa8FDWHNtTW44ozimEdJ3yCUu0hOL3pedcjQ+z7qbYP9
         ciEe9dlPQPKw0EQTwaJo7PtvKw5D8c6QxscJi49efTjcvvIxdw2XSQzpd7gB6YacqwlF
         RWm9+fDPXYu3R6dDdGLR1OP4K1oih2vwXb2O0Yd4NVVh92XwyWHjbglf8xtbfBu/j/nP
         ykn9KYVnfbr/d8OX/FGViAnncPW/3fO4LGFdQP9yQdfOqLliqfSYw+R2XFGBaF4dueAJ
         Fstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669746; x=1691261746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imeu59UbyEmxk/60do4rzt8IPOfqsoGRviRd+fRZmSg=;
        b=Bp0SAhJkJMbmBYT7gY1Y+/LKojO6bTmB/EWgQOCVl7U6VCcOXTMOmTi57oHMg703/4
         N3nHfLtDgbbMGf+JNjMQWElKqASsP84tEUylIduGQ9n0WIPt1qwZRT0HNNp8uFUfYcF9
         5ATKQOG5G9cfs+ocejz71CUqa2JPRAtUp8tM8ne2MMKv8nBBngLC0OALgoxTCd2tiBcA
         hSRWKk60Y4TNm/8PbTW+8/cHXDWVBCs3zIdtQklbfsnQw8iBfTrXvuUAjPJUJFrEbNq6
         4aZPjGgeeu0O3Btyux95vFAy/kk2R8yoJwST+nQn1GXMMpIUN8kMjy9pMnSsB/IgdObQ
         boBA==
X-Gm-Message-State: ABy/qLa0qZmiEpie9DXn7WBWvvD5Lfa1ejKHvMVT0HIBz4qISRruuiXY
	+dIADviIJyBHgeG6TrGWXo4nKwnln3c=
X-Google-Smtp-Source: APBJJlGRtr2Fnlb5yOuSTMEK/PcIgC735LSbHwdAe6KkPCEgJ5r1+PvRWk0d25RVB86Orqw4SB11Fg==
X-Received: by 2002:a37:b6c2:0:b0:767:32cd:5fe8 with SMTP id g185-20020a37b6c2000000b0076732cd5fe8mr2473424qkf.14.1688669745733;
        Thu, 06 Jul 2023 11:55:45 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 11/15] xenpm: Print HWP/CPPC parameters
Date: Thu,  6 Jul 2023 14:54:36 -0400
Message-ID: <20230706185440.48333-12-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print HWP-specific parameters.  Some are always present, but others
depend on hardware support.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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

v5:
Add Jan's Reviewed-by
---
 tools/misc/xenpm.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 21c93386de..3abd99fd20 100644
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
2.41.0


