Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA4373068F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549118.857511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqR-0006lZ-PW; Wed, 14 Jun 2023 18:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549118.857511; Wed, 14 Jun 2023 18:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqR-0006iG-KX; Wed, 14 Jun 2023 18:03:47 +0000
Received: by outflank-mailman (input) for mailman id 549118;
 Wed, 14 Jun 2023 18:03:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9UqQ-0005LA-HR
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:03:46 +0000
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [2607:f8b0:4864:20::f30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdde8bb2-0add-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 20:03:45 +0200 (CEST)
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-62fe188255eso5281316d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:03:45 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:43 -0700 (PDT)
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
X-Inumbo-ID: cdde8bb2-0add-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765824; x=1689357824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10pxhvdrn80PyMa9ObI4vzbfbnF6JqsnYlE3+fZTgH4=;
        b=TBzWEaEpROdu95ng56aLIM+QHArd/59X1K/ZGOGnC4hZg91HGP0VBDadoi6dlKiC5G
         M4wOQR3uyRbe/5Sf98NHxtDP88ECcoZG+ZTxwL3u4zugE0FVYgilEkXeyHc1Vi9KQyHQ
         /IbhHAojqOcd1GLW0/8lDPuaJxt9ab+ABWbZcrVjal22utQOPYayh+NggBQpT2YlcS28
         U+m7f9yPOPLRvj3p0eglXJXI5Ihb+agUIA0qD77BwLKMkdciIerzGov7ff2YErFwIPl9
         FpbyaoS6NgpvOkNuORNTDuk7MdQFG0039TBFg4GdK2QaLpjAf/REs4xtWR4lDevrdcGz
         sVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765824; x=1689357824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10pxhvdrn80PyMa9ObI4vzbfbnF6JqsnYlE3+fZTgH4=;
        b=NywY+PFhUsYL5IJ1aMXS/Qi/4r83EFHPxIrO1cWW8iTRMWAAbEasH3M6qGAGcoeEmo
         Egmuos4GD7GcV24yteF4N1C5MWQUIGYwUSefmI8dcpXx+hjWqgJjCwum3JLxaMf1fCr9
         /jeRriUhchMS1jr7mp5V65OYpzoJNHu6Qty/emqYPMdLp/tsJhDqNDd2O3Pa8zdeyUXp
         RBW+frybv2MMVMGnHsAJHeUBsxNelnKmn5jRmLqjTj+e9DsgxbS0kqZJdGlpmTPw2gtB
         T9mkNAclBTaYgAZyCBBGEhEK5qf95l0FuxuSgvKdODjHjeHiti4NgvZZvwipicm70MGe
         KCvg==
X-Gm-Message-State: AC+VfDzlaL1fw5V+Smun/9AEtwueZZ+d25il3S2INp57w/Z5zHHE+3Gn
	1upMvmOv97wjaxFvGfcvvJ4oYqQtLGU=
X-Google-Smtp-Source: ACHHUZ6N5eMFhC3uSDSbTWNAHc6p3JmhOkha9gRR1/mxpVow/vsJGC9n9OEZucxBv1K/MibnvmKS+g==
X-Received: by 2002:a05:6214:2022:b0:62b:6bc5:7a1b with SMTP id 2-20020a056214202200b0062b6bc57a1bmr3296531qvf.15.1686765824064;
        Wed, 14 Jun 2023 11:03:44 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 05/15] pmstat&xenpm: Re-arrage for cpufreq union
Date: Wed, 14 Jun 2023 14:02:43 -0400
Message-Id: <20230614180253.89958-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move some code around now that common xen_sysctl_pm_op get_para fields
are together.  In particular, the scaling governor information like
scaling_available_governors is inside the union, so it is not always
available.

With that, gov_num may be 0, so bounce buffer handling needs
to be modified.

scaling_governor won't be filled for hwp, so this will simplify the
change when it is introduced.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/ctrl/xc_pm.c   | 12 ++++++++----
 tools/misc/xenpm.c        |  3 ++-
 xen/drivers/acpi/pmstat.c | 32 +++++++++++++++++---------------
 3 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index f92542eaf7..19fe1a79dd 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -221,7 +221,7 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
     {
         if ( (!user_para->affected_cpus)                    ||
              (!user_para->scaling_available_frequencies)    ||
-             (!user_para->scaling_available_governors) )
+             (user_para->gov_num && !user_para->scaling_available_governors) )
         {
             errno = EINVAL;
             return -1;
@@ -230,12 +230,15 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
             goto unlock_1;
         if ( xc_hypercall_bounce_pre(xch, scaling_available_frequencies) )
             goto unlock_2;
-        if ( xc_hypercall_bounce_pre(xch, scaling_available_governors) )
+        if ( user_para->gov_num &&
+             xc_hypercall_bounce_pre(xch, scaling_available_governors) )
             goto unlock_3;
 
         set_xen_guest_handle(sys_para->affected_cpus, affected_cpus);
         set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);
-        set_xen_guest_handle(sys_para->scaling_available_governors, scaling_available_governors);
+        if ( user_para->gov_num )
+            set_xen_guest_handle(sys_para->scaling_available_governors,
+                                 scaling_available_governors);
     }
 
     sysctl.cmd = XEN_SYSCTL_pm_op;
@@ -278,7 +281,8 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
     }
 
 unlock_4:
-    xc_hypercall_bounce_post(xch, scaling_available_governors);
+    if ( user_para->gov_num )
+        xc_hypercall_bounce_post(xch, scaling_available_governors);
 unlock_3:
     xc_hypercall_bounce_post(xch, scaling_available_frequencies);
 unlock_2:
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index ee8ce5d5f2..1c474c3b59 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -811,7 +811,8 @@ static int show_cpufreq_para_by_cpuid(xc_interface *xc_handle, int cpuid)
             ret = -ENOMEM;
             goto out;
         }
-        if (!(p_cpufreq->scaling_available_governors =
+        if (p_cpufreq->gov_num &&
+            !(p_cpufreq->scaling_available_governors =
               malloc(p_cpufreq->gov_num * CPUFREQ_NAME_LEN * sizeof(char))))
         {
             fprintf(stderr,
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index f5a9ac3f1a..57359c21d8 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -239,11 +239,24 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     if ( ret )
         return ret;
 
+    op->u.get_para.cpuinfo_cur_freq =
+        cpufreq_driver.get ? cpufreq_driver.get(op->cpuid) : policy->cur;
+    op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
+    op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
+    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
+
+    if ( cpufreq_driver.name[0] )
+        strlcpy(op->u.get_para.scaling_driver,
+            cpufreq_driver.name, CPUFREQ_NAME_LEN);
+    else
+        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
+
     if ( !(scaling_available_governors =
            xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
         return -ENOMEM;
-    if ( (ret = read_scaling_available_governors(scaling_available_governors,
-                gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
+    if ( (ret = read_scaling_available_governors(
+                    scaling_available_governors,
+                    gov_num * CPUFREQ_NAME_LEN * sizeof(char))) )
     {
         xfree(scaling_available_governors);
         return ret;
@@ -254,26 +267,16 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     if ( ret )
         return ret;
 
-    op->u.get_para.cpuinfo_cur_freq =
-        cpufreq_driver.get ? cpufreq_driver.get(op->cpuid) : policy->cur;
-    op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
-    op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
-
     op->u.get_para.u.s.scaling_cur_freq = policy->cur;
     op->u.get_para.u.s.scaling_max_freq = policy->max;
     op->u.get_para.u.s.scaling_min_freq = policy->min;
 
-    if ( cpufreq_driver.name[0] )
-        strlcpy(op->u.get_para.scaling_driver,
-            cpufreq_driver.name, CPUFREQ_NAME_LEN);
-    else
-        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
-
     if ( policy->governor->name[0] )
         strlcpy(op->u.get_para.u.s.scaling_governor,
             policy->governor->name, CPUFREQ_NAME_LEN);
     else
-        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown", CPUFREQ_NAME_LEN);
+        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
+                CPUFREQ_NAME_LEN);
 
     /* governor specific para */
     if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
@@ -291,7 +294,6 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
             &op->u.get_para.u.s.u.ondemand.sampling_rate,
             &op->u.get_para.u.s.u.ondemand.up_threshold);
     }
-    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
 
     return ret;
 }
-- 
2.40.1


