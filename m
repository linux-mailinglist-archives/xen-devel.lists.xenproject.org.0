Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC94D763D4B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570635.892634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi1z-00076B-2C; Wed, 26 Jul 2023 17:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570635.892634; Wed, 26 Jul 2023 17:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi1y-00073n-VS; Wed, 26 Jul 2023 17:10:34 +0000
Received: by outflank-mailman (input) for mailman id 570635;
 Wed, 26 Jul 2023 17:10:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi1x-0005nP-NP
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:10:33 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 531ec029-2bd7-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 19:10:31 +0200 (CEST)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-63d0bf91362so601996d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:10:31 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:10:29 -0700 (PDT)
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
X-Inumbo-ID: 531ec029-2bd7-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391430; x=1690996230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htBvMGWbD3+u7hn1x0QKNR+1N7bjYI+3CVNCpwjhGVA=;
        b=T831vii0YgY07Z83L01Nj+iwJhMaaz7XI15DD/yV3qoOJds9xxSNaNsCqjlrL43oCq
         8tjSpqwX+QHZu1CG+QENU0kpzMfcgj4miZNkXbK6bP3W2yKpP16IdazuMPthLAc3jUFY
         YLE9EwjxaAU7PWVY6UFMenZiNDyfe9CkpUxji4dKUqXf0Efqq8IwCuI0qGYd76UH9bwf
         Vs+RxWaWld/Jakt8RxhMsUXC7jlGYsJUarxFRn3SnKQ2iwB45kIqOQHTHdrv3T7eBp6+
         HbTZh2PtEo/923DvhctJGV0PmlDKDhyAO+t9kvakWD/lp7FKOpEZv6aJy/OzjhDC6Qq8
         G2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391430; x=1690996230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htBvMGWbD3+u7hn1x0QKNR+1N7bjYI+3CVNCpwjhGVA=;
        b=UoYoPGyG+OLEYXXK1HMxSYgOsQGoZihHrUr3KIvp6uvHG+4qcXGv65WIVx7rcJ16mr
         5mX+1Mc3HiHQDp+gmEJdN8reL0mbzdl8SqMOMj/L5SN2dNpXUSuZIVZdIMkMDvXtm7ur
         Th02vLiHJ4PtVrO0z+cG9Xe3CReIC2+DnnNv3Spn1wefoYKG3DvfM0vHJEIoeRfIscP2
         pfNWc90dxihXHGdxK5ZaRtFje8EaUQWkaJmnBA5/9KNa4XQoPgIV6YMzgqw5LqRCnlMt
         XWYhm42wKygPt1C9ibvSRf43SJIVFQbn+tYr3nxMGQhpJcyyIkxPCCNYWNhf5XLtMT6n
         wtXA==
X-Gm-Message-State: ABy/qLZSckS7pPZ84YYKeXkRNr2UzU2d79Z3Y4i5hCTKIG7PWFzvNM3w
	dO1NOlK79L4S/7S5JYgiCXwESVijYro=
X-Google-Smtp-Source: APBJJlEREOjNO2Sz+3O5ek1BYsZDupOCxHqMM3ho46YsPKPtLSo8vNBvKHt32oHt2UDSo7uGa9eDHg==
X-Received: by 2002:a0c:d84c:0:b0:634:7c34:6c96 with SMTP id i12-20020a0cd84c000000b006347c346c96mr2056727qvj.7.1690391430198;
        Wed, 26 Jul 2023 10:10:30 -0700 (PDT)
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
Subject: [PATCH v7 04/15] xen/sysctl: Nest cpufreq scaling options
Date: Wed, 26 Jul 2023 13:09:34 -0400
Message-ID: <20230726170945.34961-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726170945.34961-1-jandryuk@gmail.com>
References: <20230726170945.34961-1-jandryuk@gmail.com>
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
NOTE: Jan would like a toolside review / ack because:
    Nevertheless I continue to be uncertain about all of this: Parts of
    the struct can apparently go out of sync with the sysctl struct, but
    other parts have to remain in sync without there being an
    appropriate build-time check (checking merely sizes clearly isn't
    enough). Therefore I'd really like to have a toolstack side review /
    ack here as well.

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


