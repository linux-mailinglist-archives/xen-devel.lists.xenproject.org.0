Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97448772E29
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578791.906509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Km-0005nk-Dx; Mon, 07 Aug 2023 18:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578791.906509; Mon, 07 Aug 2023 18:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5Km-0005ki-A9; Mon, 07 Aug 2023 18:52:04 +0000
Received: by outflank-mailman (input) for mailman id 578791;
 Mon, 07 Aug 2023 18:52:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5Kk-0004GT-Sy
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:52:02 +0000
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [2607:f8b0:4864:20::c33])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dc665d4-3553-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 20:52:01 +0200 (CEST)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-56d263da4f2so3483467eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:52:01 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:51:58 -0700 (PDT)
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
X-Inumbo-ID: 7dc665d4-3553-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434319; x=1692039119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2cTNXN/aOxyn6yZt8JfTgLQyqiVtZjxkKTytYxVIK0=;
        b=CnO6HWIQbR2lQMKLHNby+LFi1nw8F/zZ2Cko9PIOtiApG8kgSA1mwtVcBWlprnTTgL
         FMCvYnLECT+RicsiD1/iWZcSoHpDm8QHW5C+UV/oQnrWZJ/scSvvPBfsUc7ckuARC8aQ
         n6UD331fi7yxBFRtHLWhx6pDumCMgQmN9w35oXbUykpuSnXhchaZmqaih3lGrgtVAwTM
         163tTW8+8qyxYYtGhToNwM5C+h4dbqvxpRh3ETgHsNfyRUSz1GWK8dZUfZG3p033O+w8
         Id+yhLAPE89HvqR9TfyfqSZQ9uWw5EkBlU+MlWIveNpX2Zx9TIhUgt4xY8rm/NcKzvV2
         qOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434319; x=1692039119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2cTNXN/aOxyn6yZt8JfTgLQyqiVtZjxkKTytYxVIK0=;
        b=Ws9M7CZYvqm97F1irX/c7UMS/K9hgd+M93pVYiPB2oxNE9pbwVnJLR77JjyYNFQJ+n
         Xp3y/0XhUKDkiDfz4YDgMYWzZK344FNh9Mz6VE5zugwAlaHKC/TAljSn0ABMhbXebl2y
         TjxsBLs21Yz3azuVOe2JhqZV7OCYtyxhjIj4vlRGvIvV1kZ2Jm6EedbNlGW0Hui6yWok
         CcqoSS82P6YfBuGuj3NFlFVc1uoOINHUKxXRvWlGWll/9HqoMPb7Hk0LEz9skNLv8Yll
         qC2/17OkNvUbAfpUDxDIrrFVmEkHSeYw01nA6RTwtT8bTFQyMqYzsmSq7DLsvi1Lf55M
         /fxQ==
X-Gm-Message-State: AOJu0Yw3lkZTRvHIHz0gbQ+eK/SFqkmY9Atg+m3ywwSgpfFRd785Y77U
	nCha9OhYEEYd6B8fCrKDE9+4ysJizLo=
X-Google-Smtp-Source: AGHT+IGB8zoaL8Wl4i2TbXtiQdNma5QYJIb2GwQ3mLZpI+PHYTazgpS7dKL4y2Cd1STr/leJB1hf1A==
X-Received: by 2002:a05:6358:8820:b0:135:3e6b:8430 with SMTP id hv32-20020a056358882000b001353e6b8430mr10912871rwb.5.1691434319201;
        Mon, 07 Aug 2023 11:51:59 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8 05/15] pmstat&xenpm: Re-arrage for cpufreq union
Date: Mon,  7 Aug 2023 14:51:09 -0400
Message-ID: <20230807185119.98333-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
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
Acked-by: Anthony PERARD <anthony.perard@citrix.com>
---
v8:
Add Anthony's Ack

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
index 5ec050982a..3e969b841f 100644
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
@@ -317,7 +320,8 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
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


