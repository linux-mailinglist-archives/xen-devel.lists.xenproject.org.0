Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E247475F7CD
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568941.889168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvHX-0003DU-K0; Mon, 24 Jul 2023 13:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568941.889168; Mon, 24 Jul 2023 13:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvHX-00034a-EM; Mon, 24 Jul 2023 13:07:23 +0000
Received: by outflank-mailman (input) for mailman id 568941;
 Mon, 24 Jul 2023 13:07:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNvAC-0003BP-S7
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:48 +0000
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7389760-2a21-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:59:47 +0200 (CEST)
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-40398ccdaeeso23762401cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:47 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:44 -0700 (PDT)
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
X-Inumbo-ID: f7389760-2a21-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203585; x=1690808385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imeu59UbyEmxk/60do4rzt8IPOfqsoGRviRd+fRZmSg=;
        b=YpASQfLFnytk7VP1bYkLDavSb/M7qd+uwPu4j/tOJgE5DRIu7gma192+clwRqdJuSs
         rIuQfdHnqHXy3e1UUEJpOjUIxPPWgGTw+v0AnhDalZxIhlug0+RQ637d6jWkUsKo8C1w
         MqGLyfSyGk9EZHH+6S1/Tfq8H4euU6QRByDkEMyhaiitQwMKHMV8VjghKruObmaf69D9
         spTezGDsliw9sZDh33Yh1thB5Ej2WqN1lUkKp0aNlm/Vb7hNgcU4AklkB09Z6AgGL0hW
         +KEYT8da4xuymbRt6PTZGSRjp/62YfUBRP/mFrEwaA7rO7TSc/eufl/D/YiOxte9EeS1
         c/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203585; x=1690808385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imeu59UbyEmxk/60do4rzt8IPOfqsoGRviRd+fRZmSg=;
        b=ItQ9noTB0JQB7tpqwAeJgmvRTHCU66+pnAJeG6wjIF7s2aI6+mc53ovGOalCw06zAx
         V8tcoEtBviFzLXmgMtrjfwD6lXwU4kUcsqe5Wz3Za6DZH/S3iiXM4LAMA6JZrdAGh1t/
         SM/hfGxVvSArrYlGiVLvMGIbMvle2yCsRhyR1SIgbxklOZvm+eNAYl/7VEAufrhV+5Fs
         bPQb4yprTvKa0rip5J99dLEp2qlhCNWM/HdLkQgcElulUVXiUKAN9yi4ZHppOzFk4dFd
         RJY28/k/VtnfkjHYL5IDPWKfB/gKtaaCYUAAZgfu/2wWvsOMm++tpxtA2X2XI2R9DPro
         ck6w==
X-Gm-Message-State: ABy/qLaz3BrVJRZFRhQrzI7L84FYUpW183hc7ZVANmMzvM01oBpEc4WV
	xXVy02kebzsJ2ozeEnBQ3T2TQ/3UzZY=
X-Google-Smtp-Source: APBJJlG/rhBl3LQx8RWGyPUb+9Q0wH7L9YDLHr0wfJ7kUnm/j+ZPWiPY15cIeGXKzDbhLYch0wNK6w==
X-Received: by 2002:ac8:7f55:0:b0:403:be32:7669 with SMTP id g21-20020ac87f55000000b00403be327669mr8463060qtk.51.1690203585422;
        Mon, 24 Jul 2023 05:59:45 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 11/15] xenpm: Print HWP/CPPC parameters
Date: Mon, 24 Jul 2023 08:58:53 -0400
Message-ID: <20230724125857.11133-12-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724125857.11133-1-jandryuk@gmail.com>
References: <20230724125857.11133-1-jandryuk@gmail.com>
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


