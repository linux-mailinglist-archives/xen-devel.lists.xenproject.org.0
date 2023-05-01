Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B938E6F37C5
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:31:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528115.820950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEw-0004Qd-LS; Mon, 01 May 2023 19:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528115.820950; Mon, 01 May 2023 19:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEw-0004Md-Hg; Mon, 01 May 2023 19:31:14 +0000
Received: by outflank-mailman (input) for mailman id 528115;
 Mon, 01 May 2023 19:31:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZEu-000149-Vf
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:31:12 +0000
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [2607:f8b0:4864:20::836])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bab86444-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:31:11 +0200 (CEST)
Received: by mail-qt1-x836.google.com with SMTP id
 d75a77b69052e-3eab1f2ba18so13397041cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:31:11 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d6-20020ac80606000000b003bf9f9f1844sm9351784qth.71.2023.05.01.12.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:31:09 -0700 (PDT)
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
X-Inumbo-ID: bab86444-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969470; x=1685561470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eu+1+LIcVcy6gjOVYvjWRf1phVWRYdUosVQFp9Yv6+Y=;
        b=ql4ZCfHL4hQ0YAqSbKsTQKwnIs1cococeDaD457Nd/sfN5/9p3XqlZSXQSmhYvdmBP
         W7yppqkFqdkjvLPtUOedeKRhze+niKiPC42xH8rLzDf/TDD9lhegO79YtMMwfXGQ3iwR
         5ZIQu0fUlo+SGW4BCPKFqLK9ZeNE4ntJZrtDe8B2UGjfD9ViFOSsQmWsesd0/Ag6TOuu
         ryHfod/UGi6YB9XTT8mlVX2YJGkndLYiBrAyEJO3/P92P4qKqWpUGoCRGSVjuNSNPPfR
         GoijsvrKi55fyZrP9J0BYmDW6CFG3rS3pA9ysF+snUGXJjIOq4jupDAkynLScU7AaUAQ
         jpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969470; x=1685561470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eu+1+LIcVcy6gjOVYvjWRf1phVWRYdUosVQFp9Yv6+Y=;
        b=KVsx/qHi083GcvYFA+XFXNhb1GbDqJmB8x6KuPxeLc/TydkvfAjkYzRlv5Z0Q2DJrP
         DwD2xTHERN9bmliu94BHjsU90jQsvc7zqIn8Wj8Ze0whcYB4isCoDLA4sZljYX1Ksp9w
         qGIj8mWUnG0fIcM6+LoAE8FXsAO+d+q/Mjkh9YjxghkQAc7/kAUqQ8hI+gWL7y+92WVP
         8YRZh8+E6s8BZH+Vpzc/yrTYlZZP6Yr9C7oMy2NkuMlVglZhmmtH6L2eK5+l8YK8TkUv
         ABOyE5IXAhe9zNiYt3tc/jRGPuIghjpUidB/mIYeVp95hkIrJxd6/CSbCl2hiyqveVY3
         NxOQ==
X-Gm-Message-State: AC+VfDyh/+midfWynqigiu/+cviRjgubegJM7Hl97EWRcyJ81oSAGLiD
	KzGIbfC1smZYySf0DKhI3JIqianQDLc=
X-Google-Smtp-Source: ACHHUZ75umoQyE6/G5AilWu+IH7PSPRSc9wk3YctqTMZOoMg4HPknC2FZ+DYgYcgnIQ1PIyrcoZ8AA==
X-Received: by 2002:a05:622a:646:b0:3eb:9b03:b5ba with SMTP id a6-20020a05622a064600b003eb9b03b5bamr23146173qtb.37.1682969470417;
        Mon, 01 May 2023 12:31:10 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 09/14 RESEND] xenpm: Print HWP parameters
Date: Mon,  1 May 2023 15:30:29 -0400
Message-Id: <20230501193034.88575-10-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501193034.88575-1-jandryuk@gmail.com>
References: <20230501193034.88575-1-jandryuk@gmail.com>
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
---
 tools/misc/xenpm.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index ce8d7644d0..b2defde0d4 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -708,6 +708,44 @@ void start_gather_func(int argc, char *argv[])
     pause();
 }
 
+static void calculate_hwp_activity_window(const xc_hwp_para_t *hwp,
+                                          unsigned int *activity_window,
+                                          const char **units)
+{
+    unsigned int mantissa = hwp->activity_window & HWP_ACT_WINDOW_MANTISSA_MASK;
+    unsigned int exponent =
+        (hwp->activity_window >> HWP_ACT_WINDOW_EXPONENT_SHIFT) &
+            HWP_ACT_WINDOW_EXPONENT_MASK;
+    unsigned int multiplier = 1;
+    unsigned int i;
+
+    if ( hwp->activity_window == 0 )
+    {
+        *units = "hardware selected";
+        *activity_window = 0;
+
+        return;
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
+    *activity_window = mantissa * multiplier;
+}
+
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
@@ -773,6 +811,33 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
                p_cpufreq->scaling_cur_freq);
     }
 
+    if ( strcmp(p_cpufreq->scaling_governor, XEN_HWP_GOVERNOR) == 0 )
+    {
+        const xc_hwp_para_t *hwp = &p_cpufreq->u.hwp_para;
+
+        printf("hwp variables        :\n");
+        printf("  hardware limits    : lowest [%u] most_efficient [%u]\n",
+               hwp->lowest, hwp->most_efficient);
+        printf("                     : guaranteed [%u] highest [%u]\n",
+               hwp->guaranteed, hwp->highest);
+        printf("  configured limits  : min [%u] max [%u] energy_perf [%u]\n",
+               hwp->minimum, hwp->maximum, hwp->energy_perf);
+
+        if ( hwp->features & XEN_SYSCTL_HWP_FEAT_ACT_WINDOW )
+        {
+            unsigned int activity_window;
+            const char *units;
+
+            calculate_hwp_activity_window(hwp, &activity_window, &units);
+            printf("                     : activity_window [%u %s]\n",
+                   activity_window, units);
+        }
+
+        printf("                     : desired [%u%s]\n",
+               hwp->desired,
+               hwp->desired ? "" : " hw autonomous");
+    }
+
     printf("turbo mode           : %s\n",
            p_cpufreq->turbo_enabled ? "enabled" : "disabled or n/a");
     printf("\n");
-- 
2.40.0


