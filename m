Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B76C763D4D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570636.892643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi23-0007Yf-B6; Wed, 26 Jul 2023 17:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570636.892643; Wed, 26 Jul 2023 17:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi23-0007WE-7R; Wed, 26 Jul 2023 17:10:39 +0000
Received: by outflank-mailman (input) for mailman id 570636;
 Wed, 26 Jul 2023 17:10:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi21-0005nP-B8
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:10:37 +0000
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [2607:f8b0:4864:20::936])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 555528b1-2bd7-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 19:10:35 +0200 (CEST)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-79a31d66002so35475241.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:10:35 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:10:33 -0700 (PDT)
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
X-Inumbo-ID: 555528b1-2bd7-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391434; x=1690996234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU4SMiJdUktv8hEdzVKy8V3KsteeHcG1cOr0eV9yG8I=;
        b=XOqyjTz5zQOrBJP/LGz68gTg1LGP/fJzke5nj6V32BwrkjjGkdrqGEvc9Ns2WGnOjM
         5WpEssIBKHG4tf1ksN9qHZitYzCtT2q6+DNwdJAH8eZikryEWrhIWjdnT75cS3irOWHT
         ANiIKUyqXLADUWxlQ2onn0tD6G43MwHYreR2PKu6TkK/JSjAJwsd5x6itWMXpqbWLQfA
         rG50cxhnbSsjiRQyFrKeXxEPEPwmrLS9lwTta3TAE5djgoeBkF3To/pujKGJ/hgRirtU
         SHAfKMiiA5kRPgGqGn0oM0o3eIPnZ9RmaeA1Z1/1tqDHvnCq1GmMXqa1h0NUi+m64o1a
         CwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391434; x=1690996234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU4SMiJdUktv8hEdzVKy8V3KsteeHcG1cOr0eV9yG8I=;
        b=J7v8LuZU7PNUS6fNDI/NL55qabg5SQTteZ0oSjsuwzjPnZBVf9dQ6xrQw2VjxxRCCY
         r331O59emvPoyeOY6uC46Jmli3bO6fT/KDrxM8zGrZcsTU80lWNuLSPIRQace3o46uTK
         sHGQ8pIC+Ch5fqB6tVvgmlgQKqZFcr4SqiA85mzXx+v85c64n6Rj6JhaP5hKaBIRFRfh
         v2ELFySINBhIEW4d3ImDYo0ckIVh6Rwqeumwv3FABGQDEZ8gegCctneymb6TpaYPPH0j
         Hb3inN6U2iTodHEp7j/GHIEE2lLmoJQdxX7S3D3hvH+GxSfFM0Lek248Z3ZuGAjjLMNm
         b7JQ==
X-Gm-Message-State: ABy/qLblhdrz55DHh4Bpk1Flzgm9bcJEh9LJnVrxbXtiryGvnI03m3NP
	esOT5ZRS/5b7I0CnTHTuepXwgkIayco=
X-Google-Smtp-Source: APBJJlEH0+eyDIoFFsLzRezURkNtZT+DVR/bZxbTmYOfS6ExuDSeLBjXTnQrRh5vLKasYHnXJoa4Hg==
X-Received: by 2002:a1f:da05:0:b0:471:1785:e838 with SMTP id r5-20020a1fda05000000b004711785e838mr1872264vkg.2.1690391433942;
        Wed, 26 Jul 2023 10:10:33 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 05/15] pmstat&xenpm: Re-arrage for cpufreq union
Date: Wed, 26 Jul 2023 13:09:35 -0400
Message-ID: <20230726170945.34961-6-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726170945.34961-1-jandryuk@gmail.com>
References: <20230726170945.34961-1-jandryuk@gmail.com>
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


