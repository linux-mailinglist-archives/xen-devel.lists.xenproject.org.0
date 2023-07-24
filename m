Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A3275F7CC
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568939.889159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvHX-00033P-4V; Mon, 24 Jul 2023 13:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568939.889159; Mon, 24 Jul 2023 13:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvHW-0002xT-VF; Mon, 24 Jul 2023 13:07:22 +0000
Received: by outflank-mailman (input) for mailman id 568939;
 Mon, 24 Jul 2023 13:07:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNv9x-0003BP-VY
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:33 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee157326-2a21-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:59:32 +0200 (CEST)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-4055bc3cdd8so11787461cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:32 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:29 -0700 (PDT)
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
X-Inumbo-ID: ee157326-2a21-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203570; x=1690808370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU4SMiJdUktv8hEdzVKy8V3KsteeHcG1cOr0eV9yG8I=;
        b=BcWMVL5ueF+iP4G5PnLsosbjMkhYHV2qzqa317LHDSf9s2ANyQN+l4UOxmpwMB9HTn
         /UVG+dG5qzwqWL0HjMNrODL/zl8/FMiMJhxoIwFylrKrolfi1vICFTPYD8niJNmB5/j0
         +osv8lpLnFVsuRuwdIFnEQ9p+3AC3TTD1RQKxM4wjkd6W4N23/vFZFR4wcguk62Wls/E
         7hzyDKsIpxJfzMJkqQj9oxupG4lKoCX9O+vrTbvVy61OiLXe9wT7XsqoFLadItXCkdF0
         rbtCDsP3QE5A6ynwe8GHNRdSzruMC2PP11SWhO/C1qHf/q+rRj1sxWE7wNC7X2XDJLIL
         jaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203570; x=1690808370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU4SMiJdUktv8hEdzVKy8V3KsteeHcG1cOr0eV9yG8I=;
        b=FlHetaV6jCO1Kr+MlMkqvnf9jcCVSNJ9jOLOeDFGQ+cuW3WGSnUv3SBG4D1IEgNx02
         nn/E1wLBFQhEGCHZY3r8eMA2a/IdE07w83JixtYNsYUlqSKqUtYdLl6TkJjj0gNSP8Mq
         fxExnaqOjUlUh5Kxs8XkooSl2XjxkhtaHZCfAlKUZERMWeAMUulPuak+G+06lzU05s+N
         q/iQyGYJA+0xhnwJWo6S28YvhAIMwuC7NO1lSww11FBDnDnCG0e2dVHdMFKmfSyWoX7D
         wZBIkxbTsO3qHW+MDJz/sEfodk7c0gRVbrs7Fp6x4w+3gmCaG4moQtmx7h+reLVWpti5
         ShKQ==
X-Gm-Message-State: ABy/qLbjd6a3YFPpruiXvwY6zSJa22RHks1vAATn6uYbgEHfftDrJtMk
	9ouUWiNhrzr7mzHzHNNI9754kzsuNiU=
X-Google-Smtp-Source: APBJJlFJmsqQYBT5LfoXDKUnIASSQEg6TvmQR9TcF2qEFG8Sz+O+8XEcKxeEgiI0T1/o6KQXqePvHg==
X-Received: by 2002:a05:622a:1314:b0:3ff:23e4:40b4 with SMTP id v20-20020a05622a131400b003ff23e440b4mr9359913qtk.42.1690203570171;
        Mon, 24 Jul 2023 05:59:30 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 05/15] pmstat&xenpm: Re-arrage for cpufreq union
Date: Mon, 24 Jul 2023 08:58:47 -0400
Message-ID: <20230724125857.11133-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724125857.11133-1-jandryuk@gmail.com>
References: <20230724125857.11133-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rearrange code now that xen_sysctl_pm_op's get_para fields has the
nested union and struct.  In particular, the scaling governor
information like scaling_available_governors is inside the union, so it
is not always available.  Move those fields (op->u.get_para.u.s.u.*)
together as well as the common fields (ones outside the union like
op->u.get_para.turbo_enabled).

With that, gov_num may be 0, so bounce buffer handling needs
to be modified.

scaling_governor and other fields inside op->u.get_para.u.s.u.* won't be
used for hwp, so this will simplify the change when hwp support is
introduced and re-indents these lines all together.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v6:
Add Jan's Ack

v5:
Remove some formatting changes
Expand commit message
---
 tools/libs/ctrl/xc_pm.c   | 12 ++++++++----
 tools/misc/xenpm.c        |  3 ++-
 xen/drivers/acpi/pmstat.c | 24 ++++++++++++------------
 3 files changed, 22 insertions(+), 17 deletions(-)

diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 6e751e242f..cea3eab22e 100644
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
index f5a9ac3f1a..d67d99e62f 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -239,6 +239,18 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
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
@@ -254,21 +266,10 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
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
@@ -291,7 +292,6 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
             &op->u.get_para.u.s.u.ondemand.sampling_rate,
             &op->u.get_para.u.s.u.ondemand.up_threshold);
     }
-    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
 
     return ret;
 }
-- 
2.41.0


