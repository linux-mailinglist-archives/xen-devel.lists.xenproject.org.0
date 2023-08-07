Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1B1772E2B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578790.906498 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Kh-0005O0-4i; Mon, 07 Aug 2023 18:51:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578790.906498; Mon, 07 Aug 2023 18:51:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Kh-0005L9-0h; Mon, 07 Aug 2023 18:51:59 +0000
Received: by outflank-mailman (input) for mailman id 578790;
 Mon, 07 Aug 2023 18:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5Kg-0004lg-6n
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:51:58 +0000
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [2607:f8b0:4864:20::a2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b7406a7-3553-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 20:51:57 +0200 (CEST)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-487442d5e49so485883e0c.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:51:57 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:51:55 -0700 (PDT)
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
X-Inumbo-ID: 7b7406a7-3553-11ee-b280-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434315; x=1692039115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlP8mCjQvy+39h7njc8jPJQIVXj0clvvCBaJ9ThAR4E=;
        b=V+TOtaFMBWDWV6a/gS3v3CLDf7RhwjdgX1K18CoqfTsEPvcOrFn3pDt7C5hNL9GDSG
         JA5PdYa2aB/7c032kG86/6NMMwsvSZGgQ+1vWoGTiN071xMxA9Sb5XoGo0SDGdvllCYB
         ncZjtigopOc+aiMWWwjzbGeprk71lT+Hg14e/FtcKVJnGSUQfv7T+vqfaTQRqdWur4Pn
         O78ra6nL24x+6DigObohZJ1rPfMhh2J6o7xnV4e1ee/17niJoSi+rwDSE4SmnsKs++gj
         dyK0zGiN03mfUd9hSB4Qi6tp5ezOin3+gvI2nOhTnZ9jowsQY/oHZBGsXq2DuB0pPxI3
         JUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434315; x=1692039115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FlP8mCjQvy+39h7njc8jPJQIVXj0clvvCBaJ9ThAR4E=;
        b=F9sXhF8O+8oCFkP6z+eN/TXdL90ukj67XM7tkUNtm4CMYaNabvjsNgp4Q1vkx4evY8
         oatxaex2BxDo1BpbwGPrIzFiIOuQuJodrNe0oxdE4dmrDorWW7PizbAj9ZnJz8T3ix9N
         xAVqS19VzL0jQBnu1PW36cTSjJNf1RtbnzFoNJ8X8Ad4lR7zFqOR5SdqiO8cOUJLYpd7
         HQdZf2MDulyiXQYp4Ea9OL82cN7ulpsL+qUiw/aFDblM5V0Tpcjd7SwIThTqxazZnJI9
         mzlAxHSNQwH/ocgjbbtTb8LxubDQ2732JOrUG5moCucyYn44cRAsOKFX8DzZF4Kpy3o5
         pROw==
X-Gm-Message-State: AOJu0YyRumdU88gUNmWEC8Pc+4jVA1ftjPy9j2X0nCVhIp76suV1XfR1
	jSLiOoNHCBMHz4DppqjH7RgSz02HwmQ=
X-Google-Smtp-Source: AGHT+IEHaRR4nFTTcUDmMm0Tal0kvEnQkaJFXt5NiD1DFtILS4ddXasHFdUHsPghHxgzv/S21/+YBA==
X-Received: by 2002:a1f:3f03:0:b0:487:16e2:b653 with SMTP id m3-20020a1f3f03000000b0048716e2b653mr4931614vka.13.1691434315620;
        Mon, 07 Aug 2023 11:51:55 -0700 (PDT)
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
Subject: [PATCH v8 04/15] xen/sysctl: Nest cpufreq scaling options
Date: Mon,  7 Aug 2023 14:51:08 -0400
Message-ID: <20230807185119.98333-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
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
v8:
Add BUILD_BUG_ON checks for structs xc_get_cpufreq_para & xen_get_cpufreq_para

v6:
Add Jan's Reviewed-by

v5:
Expand commit message
Change comment to driver/governor
---
 tools/include/xenctrl.h     | 22 ++++++++++--------
 tools/libs/ctrl/xc_pm.c     | 46 ++++++++++++++++++++++++++++++++-----
 tools/misc/xenpm.c          | 24 +++++++++----------
 xen/drivers/acpi/pmstat.c   | 27 +++++++++++-----------
 xen/include/public/sysctl.h | 22 ++++++++++--------
 5 files changed, 92 insertions(+), 49 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index faec1dd824..de03cfb117 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1926,16 +1926,20 @@ struct xc_get_cpufreq_para {
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
index c3a9864bf7..5ec050982a 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -245,6 +245,45 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
     sys_para->freq_num = user_para->freq_num;
     sys_para->gov_num  = user_para->gov_num;
 
+    /* Sanity check struct layout */
+    BUILD_BUG_ON(sizeof(*user_para) != sizeof(*sys_para));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), cpu_num) !=
+                 offsetof(typeof(*sys_para),  cpu_num));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), freq_num) !=
+                 offsetof(typeof(*sys_para),  freq_num));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), gov_num) !=
+                 offsetof(typeof(*sys_para),  gov_num));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), affected_cpus) !=
+                 offsetof(typeof(*sys_para),  affected_cpus));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_available_frequencies) !=
+                 offsetof(typeof(*sys_para),  scaling_available_frequencies));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_available_governors) !=
+                 offsetof(typeof(*sys_para),  scaling_available_governors));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), scaling_driver) !=
+                 offsetof(typeof(*sys_para),  scaling_driver));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_cur_freq) !=
+                 offsetof(typeof(*sys_para),  cpuinfo_cur_freq));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_max_freq) !=
+                 offsetof(typeof(*sys_para),  cpuinfo_max_freq));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), cpuinfo_min_freq) !=
+                 offsetof(typeof(*sys_para),  cpuinfo_min_freq));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_cur_freq) !=
+                 offsetof(typeof(*sys_para),  u.s.scaling_cur_freq));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_governor) !=
+                 offsetof(typeof(*sys_para),  u.s.scaling_governor));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_max_freq) !=
+                 offsetof(typeof(*sys_para),  u.s.scaling_max_freq));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.scaling_min_freq) !=
+                 offsetof(typeof(*sys_para),  u.s.scaling_min_freq));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.u.userspace) !=
+                 offsetof(typeof(*sys_para),  u.s.u.userspace));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), u.s.u.ondemand) !=
+                 offsetof(typeof(*sys_para),  u.s.u.ondemand));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), u.cppc_para) !=
+                 offsetof(typeof(*sys_para),  u.cppc_para));
+    BUILD_BUG_ON(offsetof(typeof(*user_para), turbo_enabled) !=
+                 offsetof(typeof(*sys_para),  turbo_enabled));
+
     ret = xc_sysctl(xch, &sysctl);
     if ( ret )
     {
@@ -265,17 +304,12 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
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


