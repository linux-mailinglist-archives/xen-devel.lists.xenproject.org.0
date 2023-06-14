Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB36173068D
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549117.857501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqQ-0006Td-Bw; Wed, 14 Jun 2023 18:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549117.857501; Wed, 14 Jun 2023 18:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqQ-0006QI-6r; Wed, 14 Jun 2023 18:03:46 +0000
Received: by outflank-mailman (input) for mailman id 549117;
 Wed, 14 Jun 2023 18:03:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9UqO-0005LA-8E
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:03:44 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc7940e3-0add-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 20:03:43 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-75d528d0811so236863385a.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:03:43 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:41 -0700 (PDT)
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
X-Inumbo-ID: cc7940e3-0add-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765822; x=1689357822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnealSDcQ5eD4/BMHbAdAnbMLaUANznTtXLujb813pg=;
        b=aNSOaYk5zO1KBg04VlVemwmWTnIt6/wLAeqR1wPh7xYYpSSH4qlOIMdBGatS2sXEh4
         OcaVMqXW1jDcyxAdnVyON3c5BI+g0JwYJWyInEKwR4Bta0GBVkiORyxefZTvGQOdLvw6
         0Is4l0/lm+JEINReuo51rkoPfx0SZTZl0wJ7wi+PDlKbEpgmHFmpx0yfCcIqFQfo34+G
         8KwlXT14II/YNrHVOojLL8NOX9waHB2JlFSQcwWnSGo1j1HdqoTid7IiOzkGD/6BrdzA
         RxDgez8RXmvmK4HSF5HDeyljzZfyoFSEy1aYInOzwC8J0g9yW00t5OkXRs6eE5+U1jxG
         pETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765822; x=1689357822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnealSDcQ5eD4/BMHbAdAnbMLaUANznTtXLujb813pg=;
        b=c1eA/CMvfMBuXD4Y6Y0HS8ULr1mNrJpbO+XjzbfOgxJbCbYh8jmOJUyjdfalerCJw7
         esfdzzUBNcMxEicqGNpyVl8CAT/k7EZ+vEIJ7hvkUaarRqQed8aIPx529srSL5lva4iD
         iZAx6ugfiQfskdacZAwn5kELK3vpxPRCDJmbGRJIP1ejAa7PHNnQCMHRkZpm9ir1LIbX
         Sh9aFu0NO/yPiGlQO3ALnWUwEhXZcei5gq4GN28DG3wT2l654eJHExHBBjzdbFrRNyet
         ygMrcdEYDfO+zyhDbn/3G12U02N6sEyhHvhAqN7bFPtiH6HwYon+6UOF7zYXD9MzXwVV
         xcPQ==
X-Gm-Message-State: AC+VfDzO+KnP78vnFk8/p6NGPZWwQgmh6JG82AtLzDFymBKBwV+MyImh
	PFzaf9D/Xd2o9qkiTOH11/36eXP/LtE=
X-Google-Smtp-Source: ACHHUZ7Hjc2utKPmJ0Oof45Hh1e1ert+3gNRKB/sSEHZeaA1HRXQM/ADydrx9UXqqd56EnLb+djrXA==
X-Received: by 2002:a05:6214:2467:b0:621:17c6:2713 with SMTP id im7-20020a056214246700b0062117c62713mr9796165qvb.49.1686765821615;
        Wed, 14 Jun 2023 11:03:41 -0700 (PDT)
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
Subject: [PATCH v4 04/15] xen/sysctl: Nest cpufreq scaling options
Date: Wed, 14 Jun 2023 14:02:42 -0400
Message-Id: <20230614180253.89958-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a union and struct so that most of the scaling variables of struct
xen_get_cpufreq_para are within in a binary-compatible layout.  This
allows cppc_para to live in the larger union and use uint32_ts - struct
xen_cppc_para will be 10 uint32_t's.

The new scaling struct is 3 * uint32_t + 16 bytes CPUFREQ_NAME_LEN + 4 *
uint32_t for xen_ondemand = 11 uint32_t.  That means the old size is
retained, int32_t turbo_enabled doesn't move and it's binary compatible.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/include/xenctrl.h     | 22 +++++++++++++---------
 tools/libs/ctrl/xc_pm.c     |  5 -----
 tools/misc/xenpm.c          | 24 ++++++++++++------------
 xen/drivers/acpi/pmstat.c   | 27 ++++++++++++++-------------
 xen/include/public/sysctl.h | 22 +++++++++++++---------
 5 files changed, 52 insertions(+), 48 deletions(-)

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
index c3a9864bf7..f92542eaf7 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -265,15 +265,10 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
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
 
         /* copy to user_para no matter what cpufreq governor */
         BUILD_BUG_ON(sizeof(((struct xc_get_cpufreq_para *)0)->u) !=
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
index 9d06e92d0f..bdcea99d71 100644
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
2.40.1


