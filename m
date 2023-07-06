Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDA674A3FE
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559976.875498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8d-00056a-7j; Thu, 06 Jul 2023 18:55:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559976.875498; Thu, 06 Jul 2023 18:55:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8d-000543-3g; Thu, 06 Jul 2023 18:55:35 +0000
Received: by outflank-mailman (input) for mailman id 559976;
 Thu, 06 Jul 2023 18:55:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU8c-0003x0-Fh
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:55:34 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeb02015-1c2e-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 20:55:32 +0200 (CEST)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-765a311a7a9so54225485a.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:55:32 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:30 -0700 (PDT)
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
X-Inumbo-ID: aeb02015-1c2e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669731; x=1691261731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdPPmSCUBtdPIby1qoYSPcEtoI4o/SgaXEEieAqfMj0=;
        b=sJaEGKppRJvId0tTZ9dcdExDZg9dma1jaGvEwvOmrRruRrcWy67hx0DvKg5Bb0rXvk
         AISoypginNLOBa8LcGgHDbAz1nBf0E14d1nOp2L6hO/rZAXRaYnEsgybSpSjgVivUHAk
         pSaqd9FyP9uIUZHnLAApw8E8o81FyqzOUNI0TrYQocoas1vPWrYEb0mLokcVpCFaiaWV
         M1WOtxsPVwMevyReDnphwFFN7boGlvJHDh0T56NZlW//O+hxx46GgI6Bm6OsNGX+cb1G
         m+B9L+G7rq03XPovXCzIdSeAOd9HwJPSl3cp/McPldvO0Fc0tYnLU6H07ine7wiMVHEG
         qHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669731; x=1691261731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdPPmSCUBtdPIby1qoYSPcEtoI4o/SgaXEEieAqfMj0=;
        b=j7YkN9P703UFkPZUrXujzZD9F8FFWtlcotwr2CNqlrfH+KfADlb3aua7HydtmpI/1k
         FJrAEM3j2/CEyizvbz77LwEDACe6BCX8NJSUo8x85UcD7VmI1vCUdZC2F+egj69jfAMa
         a11CHofV8F/rVCna4TXUJU2hlLjmcKC6ooj/ar7F8b35zDEE0XlsSOxjB4Fu1EuGrpPU
         LuJvppQovdpfO/epKVnBMPD5kibnJdjbdni1gtH6TmOtlAhew+Leo1HLGG6vp1c61o2x
         tUVJ99RF77hH4VegdM8cH0Fqda2Sq47CJHyA1/8Cj78H7yMZzos8lXMwbOmriiRELHQ5
         y+tA==
X-Gm-Message-State: ABy/qLaGIwV1lQOg5HYO5Nx1XhWgdf39xyEYizbCZvaMaY5nud3eF1NR
	1BAn/O+0Fpuv3DtWMIZzQbP55ScfHEk=
X-Google-Smtp-Source: APBJJlG7GISg3g5UMgbRMlJYffrQCdQ6cZ2B87wh6U1X1LPvTtb/U+R6Z2xFDQ13was/yle0x18w/Q==
X-Received: by 2002:a05:620a:199f:b0:75b:23a1:d847 with SMTP id bm31-20020a05620a199f00b0075b23a1d847mr6281003qkb.9.1688669730910;
        Thu, 06 Jul 2023 11:55:30 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 04/15] xen/sysctl: Nest cpufreq scaling options
Date: Thu,  6 Jul 2023 14:54:29 -0400
Message-ID: <20230706185440.48333-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a union and struct so that most of the scaling variables of struct
xen_get_cpufreq_para are within in a binary-compatible layout.  This
allows cppc_para to live in the larger union and use uint32_ts - struct
xen_cppc_para will be 10 uint32_t's.

The new scaling struct is 3 * uint32_t + 16 bytes CPUFREQ_NAME_LEN + 4 *
uint32_t for xen_ondemand = 11 uint32_t.  That means the old size is
retained, int32_t turbo_enabled doesn't move and it's binary compatible.

The out-of-context memcpy() in xc_get_cpufreq_para() now handles the
copying of the fields removed there.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v5:
Expand commit message
Change comment to driver/governor
---
 tools/include/xenctrl.h     | 22 +++++++++++++---------
 tools/libs/ctrl/xc_pm.c     |  7 +------
 tools/misc/xenpm.c          | 24 ++++++++++++------------
 xen/drivers/acpi/pmstat.c   | 27 ++++++++++++++-------------
 xen/include/public/sysctl.h | 22 +++++++++++++---------
 5 files changed, 53 insertions(+), 49 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index dba33d5d0f..8aedb952a0 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1909,16 +1909,20 @@ struct xc_get_cpufreq_para {
     uint32_t cpuinfo_cur_freq;
     uint32_t cpuinfo_max_freq;
     uint32_t cpuinfo_min_freq;
-    uint32_t scaling_cur_freq;
-
-    char scaling_governor[CPUFREQ_NAME_LEN];
-    uint32_t scaling_max_freq;
-    uint32_t scaling_min_freq;
-
-    /* for specific governor */
     union {
-        xc_userspace_t userspace;
-        xc_ondemand_t ondemand;
+        struct {
+            uint32_t scaling_cur_freq;
+
+            char scaling_governor[CPUFREQ_NAME_LEN];
+            uint32_t scaling_max_freq;
+            uint32_t scaling_min_freq;
+
+            /* for specific governor */
+            union {
+                xc_userspace_t userspace;
+                xc_ondemand_t ondemand;
+            } u;
+        } s;
     } u;
 
     int32_t turbo_enabled;
diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index c3a9864bf7..6e751e242f 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -265,17 +265,12 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
         user_para->cpuinfo_cur_freq = sys_para->cpuinfo_cur_freq;
         user_para->cpuinfo_max_freq = sys_para->cpuinfo_max_freq;
         user_para->cpuinfo_min_freq = sys_para->cpuinfo_min_freq;
-        user_para->scaling_cur_freq = sys_para->scaling_cur_freq;
-        user_para->scaling_max_freq = sys_para->scaling_max_freq;
-        user_para->scaling_min_freq = sys_para->scaling_min_freq;
         user_para->turbo_enabled    = sys_para->turbo_enabled;
 
         memcpy(user_para->scaling_driver,
                 sys_para->scaling_driver, CPUFREQ_NAME_LEN);
-        memcpy(user_para->scaling_governor,
-                sys_para->scaling_governor, CPUFREQ_NAME_LEN);
 
-        /* copy to user_para no matter what cpufreq governor */
+        /* copy to user_para no matter what cpufreq driver/governor */
         BUILD_BUG_ON(sizeof(((struct xc_get_cpufreq_para *)0)->u) !=
 		     sizeof(((struct xen_get_cpufreq_para *)0)->u));
 
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 1bb6187e56..ee8ce5d5f2 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -730,39 +730,39 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
     printf("scaling_avail_gov    : %s\n",
            p_cpufreq->scaling_available_governors);
 
-    printf("current_governor     : %s\n", p_cpufreq->scaling_governor);
-    if ( !strncmp(p_cpufreq->scaling_governor,
+    printf("current_governor     : %s\n", p_cpufreq->u.s.scaling_governor);
+    if ( !strncmp(p_cpufreq->u.s.scaling_governor,
                   "userspace", CPUFREQ_NAME_LEN) )
     {
         printf("  userspace specific :\n");
         printf("    scaling_setspeed : %u\n",
-               p_cpufreq->u.userspace.scaling_setspeed);
+               p_cpufreq->u.s.u.userspace.scaling_setspeed);
     }
-    else if ( !strncmp(p_cpufreq->scaling_governor,
+    else if ( !strncmp(p_cpufreq->u.s.scaling_governor,
                        "ondemand", CPUFREQ_NAME_LEN) )
     {
         printf("  ondemand specific  :\n");
         printf("    sampling_rate    : max [%u] min [%u] cur [%u]\n",
-               p_cpufreq->u.ondemand.sampling_rate_max,
-               p_cpufreq->u.ondemand.sampling_rate_min,
-               p_cpufreq->u.ondemand.sampling_rate);
+               p_cpufreq->u.s.u.ondemand.sampling_rate_max,
+               p_cpufreq->u.s.u.ondemand.sampling_rate_min,
+               p_cpufreq->u.s.u.ondemand.sampling_rate);
         printf("    up_threshold     : %u\n",
-               p_cpufreq->u.ondemand.up_threshold);
+               p_cpufreq->u.s.u.ondemand.up_threshold);
     }
 
     printf("scaling_avail_freq   :");
     for ( i = 0; i < p_cpufreq->freq_num; i++ )
         if ( p_cpufreq->scaling_available_frequencies[i] ==
-             p_cpufreq->scaling_cur_freq )
+             p_cpufreq->u.s.scaling_cur_freq )
             printf(" *%d", p_cpufreq->scaling_available_frequencies[i]);
         else
             printf(" %d", p_cpufreq->scaling_available_frequencies[i]);
     printf("\n");
 
     printf("scaling frequency    : max [%u] min [%u] cur [%u]\n",
-           p_cpufreq->scaling_max_freq,
-           p_cpufreq->scaling_min_freq,
-           p_cpufreq->scaling_cur_freq);
+           p_cpufreq->u.s.scaling_max_freq,
+           p_cpufreq->u.s.scaling_min_freq,
+           p_cpufreq->u.s.scaling_cur_freq);
 
     printf("turbo mode           : %s\n",
            p_cpufreq->turbo_enabled ? "enabled" : "disabled or n/a");
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 1bae635101..f5a9ac3f1a 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -258,37 +258,38 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
         cpufreq_driver.get ? cpufreq_driver.get(op->cpuid) : policy->cur;
     op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
     op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
-    op->u.get_para.scaling_cur_freq = policy->cur;
-    op->u.get_para.scaling_max_freq = policy->max;
-    op->u.get_para.scaling_min_freq = policy->min;
+
+    op->u.get_para.u.s.scaling_cur_freq = policy->cur;
+    op->u.get_para.u.s.scaling_max_freq = policy->max;
+    op->u.get_para.u.s.scaling_min_freq = policy->min;
 
     if ( cpufreq_driver.name[0] )
-        strlcpy(op->u.get_para.scaling_driver, 
+        strlcpy(op->u.get_para.scaling_driver,
             cpufreq_driver.name, CPUFREQ_NAME_LEN);
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
     if ( policy->governor->name[0] )
-        strlcpy(op->u.get_para.scaling_governor, 
+        strlcpy(op->u.get_para.u.s.scaling_governor,
             policy->governor->name, CPUFREQ_NAME_LEN);
     else
-        strlcpy(op->u.get_para.scaling_governor, "Unknown", CPUFREQ_NAME_LEN);
+        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown", CPUFREQ_NAME_LEN);
 
     /* governor specific para */
-    if ( !strncasecmp(op->u.get_para.scaling_governor,
+    if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
                       "userspace", CPUFREQ_NAME_LEN) )
     {
-        op->u.get_para.u.userspace.scaling_setspeed = policy->cur;
+        op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
     }
 
-    if ( !strncasecmp(op->u.get_para.scaling_governor,
+    if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
                       "ondemand", CPUFREQ_NAME_LEN) )
     {
         ret = get_cpufreq_ondemand_para(
-            &op->u.get_para.u.ondemand.sampling_rate_max,
-            &op->u.get_para.u.ondemand.sampling_rate_min,
-            &op->u.get_para.u.ondemand.sampling_rate,
-            &op->u.get_para.u.ondemand.up_threshold);
+            &op->u.get_para.u.s.u.ondemand.sampling_rate_max,
+            &op->u.get_para.u.s.u.ondemand.sampling_rate_min,
+            &op->u.get_para.u.s.u.ondemand.sampling_rate,
+            &op->u.get_para.u.s.u.ondemand.up_threshold);
     }
     op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 33e86ace51..b0028d3058 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -317,16 +317,20 @@ struct xen_get_cpufreq_para {
     uint32_t cpuinfo_cur_freq;
     uint32_t cpuinfo_max_freq;
     uint32_t cpuinfo_min_freq;
-    uint32_t scaling_cur_freq;
-
-    char scaling_governor[CPUFREQ_NAME_LEN];
-    uint32_t scaling_max_freq;
-    uint32_t scaling_min_freq;
-
-    /* for specific governor */
     union {
-        struct  xen_userspace userspace;
-        struct  xen_ondemand ondemand;
+        struct {
+            uint32_t scaling_cur_freq;
+
+            char scaling_governor[CPUFREQ_NAME_LEN];
+            uint32_t scaling_max_freq;
+            uint32_t scaling_min_freq;
+
+            /* for specific governor */
+            union {
+                struct  xen_userspace userspace;
+                struct  xen_ondemand ondemand;
+            } u;
+        } s;
     } u;
 
     int32_t turbo_enabled;
-- 
2.41.0


