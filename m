Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332D574A3F7
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559977.875507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8f-0005Rd-Gz; Thu, 06 Jul 2023 18:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559977.875507; Thu, 06 Jul 2023 18:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8f-0005OK-DO; Thu, 06 Jul 2023 18:55:37 +0000
Received: by outflank-mailman (input) for mailman id 559977;
 Thu, 06 Jul 2023 18:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU8e-0003x0-ED
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:55:36 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afeee0ff-1c2e-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 20:55:34 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7658752ce2fso90918985a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:55:34 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:32 -0700 (PDT)
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
X-Inumbo-ID: afeee0ff-1c2e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669733; x=1691261733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1trDvYrNW8WPrDTiUKj6xI03JCfHC/t+OXw0Nd9Uyw=;
        b=TpZmqRr4VVbFVOTvlwCSgIJfcGPcQuN3NHgunuhFoq5m4tBxo/JwS7hUuXsq8AqYEb
         QzQaabeZuIMQKT/iRUTzO1N1Zt6bmzIE3uO/BWyROwioWpWnggNgBqdyIZTqPc/5Itj7
         EWkQ72cNcLkfemPC+q/8T3+N50Ym4Yq7EkLDVAbXWZFYmVRD0uq84p6FlI9uoW1NEkwC
         3XkTlQUg3ojgBD+/+kJnOlZErP4SZsyFsFsX1g5cnOqQOidn8qzRvlaZuu80FjnA1iXE
         yCSAz4L9GMloW+aNNaxTA7VURw1Q/Vy3nYD6cMt2T9W26TuP3Ayrs4V3aGsNSdpGugK3
         YttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669733; x=1691261733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1trDvYrNW8WPrDTiUKj6xI03JCfHC/t+OXw0Nd9Uyw=;
        b=Nn6wtefd3wfj0aI7tVHcTfm7uuja5UIg066JdmhiYXjLLNDw2GWHbrZNWtXaBmbgFJ
         xsYAgZwDSCmWhBW+Hht50w4r9MYn9RIlvF0EAvHSS2btqGp344e2EYZSab0xjlSChs9w
         hT4fsKQuzc7U7033QOuGxqKgOJ6NMiQ3OwAy1BHE1wcpylLIjHufVvMqbPeFIO6mbacK
         7ZW+ExbQwGMhtnMG+R7+d6mhJdlhEMi7pz3mcFlqy3zHRk/KQshU4NPQ/k6KiCyETwEn
         FjQ6J+SltzumYAOBuVNq2hPMkw+gJlF+VrTJJA4TreofBrLxyvvDtfAyVougTrC72Rmf
         ylBA==
X-Gm-Message-State: ABy/qLayb0sQA2arWLP9eRJScO7dGgFwR9XBILvxy7uBaQNuQWtJHL8F
	0sScwBgq/WEhSAyM5PYXxeU0XuoF4m0=
X-Google-Smtp-Source: APBJJlFJO7rcRaXr7mnXh6KtXYHkCJKp43TntAQcU5txu71wuK0OM+Sm2KokmciqoLI6/15dAW/N/A==
X-Received: by 2002:a05:620a:4446:b0:767:2021:4988 with SMTP id w6-20020a05620a444600b0076720214988mr3112643qkp.13.1688669733021;
        Thu, 06 Jul 2023 11:55:33 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 05/15] pmstat&xenpm: Re-arrage for cpufreq union
Date: Thu,  6 Jul 2023 14:54:30 -0400
Message-ID: <20230706185440.48333-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
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
---
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


