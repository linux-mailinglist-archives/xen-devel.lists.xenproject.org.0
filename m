Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285EE75F79E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568917.889067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNv9x-00054h-RT; Mon, 24 Jul 2023 12:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568917.889067; Mon, 24 Jul 2023 12:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNv9x-00050i-KD; Mon, 24 Jul 2023 12:59:33 +0000
Received: by outflank-mailman (input) for mailman id 568917;
 Mon, 24 Jul 2023 12:59:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNv9v-0003BP-Cr
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:31 +0000
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec0c1eaa-2a21-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:59:28 +0200 (CEST)
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7656652da3cso330108185a.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:28 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:25 -0700 (PDT)
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
X-Inumbo-ID: ec0c1eaa-2a21-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203566; x=1690808366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49TsFIBINTB4jyEM3kUw7HVPbRFWIZxCSrMg4LTGTQ8=;
        b=pWfjP/HO6qeTMKNsvEDHrF14ixlWFXJObWGPbYnTbBr6bTREvGjzzqkPeQLLYsGH4Z
         H5NZ35rOKBWQhwLAal1UUJnxVUchaW1us0mzcMsDlGMUmMbXtNHqtlRgDGzAO/FgLGxd
         AAf1TTvJOFBeFRd0A2zsV+9ScYnQ9VQOCxkyuJg1yaxrC+yPzE9mTkxmEp/neYIRcAjC
         XZex7mkgVVapFxDs5sr+HBXH8noKGrSTDYI3Ngjw8GEBiwlvCEa2xvk4KyyDuueoU0wW
         RYE36hH4adbzCMXh8E9+uovmDvkbdUB1vJH4NPcKFqNkhM2Hir7fUvSf/a6MjgUMgvD/
         71zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203566; x=1690808366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49TsFIBINTB4jyEM3kUw7HVPbRFWIZxCSrMg4LTGTQ8=;
        b=TiwhfU3113FjR/yqu6sb4SyFkB340CbI6jxOKYMhE4/6qPU6BUS44K5+LgngU3nI35
         vQTSm1aRsSQk1D1cxh5NZVCj1oZ5HO3701APlHBo1+A8cLDTmnCEjgl90Iazd/EZse4V
         ezb8B/ykkBQPklowXw4Lj9JEx/rLKAVXquyKUux1ZNAJ+55zkHwlgAO9A8WQnQLObQ2A
         GBXOmxtslIHaM9Hn1kvKcHjJNnOMfoujKJqHTLm509KA+ggJmOf+MB8uDEN3pDXQkLiv
         Tw7EhhXSgUSfprBQqCFN7kxZOJkQjV1/I04ojWI9KLnpUsGyucQMrapq+bPLmNABlVG2
         QQRA==
X-Gm-Message-State: ABy/qLZvHhR/sQHi6C9ohPhFg9r9UyGM5qbGYCQnQGtTgkJhJ/miQj1U
	lYZZpgLNSgFsFZS4F5LdHGkViCsy2FY=
X-Google-Smtp-Source: APBJJlEiffY54ufRiOuWPcgox/1ThBUVljb1DPh2tqKW5sPEEjan2K81uePrVFaZLm/NPoYYv3t+8Q==
X-Received: by 2002:ac8:7c44:0:b0:400:7ff8:db5b with SMTP id o4-20020ac87c44000000b004007ff8db5bmr11139049qtv.33.1690203566380;
        Mon, 24 Jul 2023 05:59:26 -0700 (PDT)
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
Subject: [PATCH v6 04/15] xen/sysctl: Nest cpufreq scaling options
Date: Mon, 24 Jul 2023 08:58:46 -0400
Message-ID: <20230724125857.11133-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724125857.11133-1-jandryuk@gmail.com>
References: <20230724125857.11133-1-jandryuk@gmail.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v6:
Add Jan's Reviewed-by

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
index fa7147de47..c11c0b1a6c 100644
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


