Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B33B772E2A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578787.906469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5KZ-0004Xa-7r; Mon, 07 Aug 2023 18:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578787.906469; Mon, 07 Aug 2023 18:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5KZ-0004VY-4F; Mon, 07 Aug 2023 18:51:51 +0000
Received: by outflank-mailman (input) for mailman id 578787;
 Mon, 07 Aug 2023 18:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5KY-0004GT-AB
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:51:50 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76796329-3553-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 20:51:48 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-63cf9eddbc6so27013826d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:51:48 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:51:46 -0700 (PDT)
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
X-Inumbo-ID: 76796329-3553-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434307; x=1692039107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNQhWJqSLtysm6iaINr+s0i3gnrhiDBqgnXkQD6RBcM=;
        b=V3bDDlxVvi0tsUCmaHrr4kIxZRNDwH5cDbN2sq75I1MZcutfJ0gvNx9gtMtV5mjPyb
         donPyty3kc0fEgDAjshZsCWmZ4Bil9mwTLggUFolENijiSmEpu/hYwi6wjRkWvYLmSXK
         Pbhqj74Qb1WTGwu1iQd0Bs+uZd7L/6w/s2vKXL8c6VRfGY73bJUeslXwgHPkC4UP1ZIL
         faaaVdlIORfr4kckqu4P3g9aXEI/JxtjpbLdynC4dEFAOz2uyEStr2EuCOTA5RJKtxFY
         Qhgl0MHicM2Txwy5zvgb371xvT5Bqw7VF/BApMGVeQZu6cZDpRsgOeT4Bk0qCsiXWxME
         xikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434307; x=1692039107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNQhWJqSLtysm6iaINr+s0i3gnrhiDBqgnXkQD6RBcM=;
        b=aegO1ldYkIjzlULGj2F+wNUJsAMLk8nxSlB8nMdTHpOR/0hhWHp9xLu1BJlo2lCQvn
         oRDG54o7+GdhMvN2XtWHNqk0hXlQkeYBjqIytVvCNHcfPn5uLMOxHElq3ljiyUVbzr9I
         qlu5Hms789MWhymnSzDxDe5F+HpXrq2t2C3nAr9bJV+H172JkrvfP9/buiBNaiG8VpJW
         ACZt/ZWVGScQp2kT3+cPo2QW87Jh1yIYgUUOG5zmdONN+R/qJhZzV02zbt9iegssbQq1
         8rhrMZDrgg0ac92gjodx4LmpIXB0F0Fm5amsHc3LxzHw5xYWMKggO4qwZE7t800A77io
         X33g==
X-Gm-Message-State: AOJu0Yz0QMW7x17EeKFkOKFmeST4iSCfWHfVVuPPfCaUhRm3Bvina6Dv
	MV3WA4alIuixwUQeC9zUay9dGkVbxJs=
X-Google-Smtp-Source: AGHT+IGl7Y+1vn0bVef3zX0I0/p0lA+FKwyNiCKLG9/u/GHkJkHhIVMiSSz2y/CABd06pOC5Vny+Kw==
X-Received: by 2002:a05:6214:e6b:b0:63f:6ec7:9f7 with SMTP id jz11-20020a0562140e6b00b0063f6ec709f7mr9620469qvb.23.1691434307160;
        Mon, 07 Aug 2023 11:51:47 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8 01/15] cpufreq: Allow restricting to internal governors only
Date: Mon,  7 Aug 2023 14:51:05 -0400
Message-ID: <20230807185119.98333-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807185119.98333-1-jandryuk@gmail.com>
References: <20230807185119.98333-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For hwp, the standard governors are not usable, and only the internal
one is applicable.  Add the cpufreq_governor_internal boolean to
indicate when an internal governor, like hwp, will be used.  This is set
during presmp_initcall, and governor registration can be skipped when
called during initcall.

This way unusable governors are not registered, and only compatible
governors are advertised to userspace.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v6:
Add Jan's Ack

v5:
Check cpufreq_governor_internal and skip registration as applicable
Remove internal flag

v4:
Rework to use an internal flag
Removed Jan's Ack since the approach is different.

v3:
Switch to initdata
Add Jan Acked-by
Commit message s/they/the/ typo
Don't register hwp-internal when running non-hwp - Marek

v2:
Switch to "-internal"
Add blank line in header
---
 xen/drivers/cpufreq/cpufreq.c                | 1 +
 xen/drivers/cpufreq/cpufreq_misc_governors.c | 9 +++++++++
 xen/drivers/cpufreq/cpufreq_ondemand.c       | 3 +++
 xen/include/acpi/cpufreq/cpufreq.h           | 2 ++
 4 files changed, 15 insertions(+)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 2321c7dd07..67a58d409b 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -56,6 +56,7 @@ struct cpufreq_dom {
 };
 static LIST_HEAD_READ_MOSTLY(cpufreq_dom_list_head);
 
+bool __initdata cpufreq_governor_internal;
 struct cpufreq_governor *__read_mostly cpufreq_opt_governor;
 LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
 
diff --git a/xen/drivers/cpufreq/cpufreq_misc_governors.c b/xen/drivers/cpufreq/cpufreq_misc_governors.c
index f5571f5486..0327fad23b 100644
--- a/xen/drivers/cpufreq/cpufreq_misc_governors.c
+++ b/xen/drivers/cpufreq/cpufreq_misc_governors.c
@@ -120,6 +120,9 @@ static int __init cf_check cpufreq_gov_userspace_init(void)
 {
     unsigned int cpu;
 
+    if ( cpufreq_governor_internal )
+        return 0;
+
     for_each_online_cpu(cpu)
         per_cpu(cpu_set_freq, cpu) = userspace_cmdline_freq;
     register_cpu_notifier(&cpufreq_userspace_cpu_nfb);
@@ -162,6 +165,9 @@ struct cpufreq_governor cpufreq_gov_performance = {
 
 static int __init cf_check cpufreq_gov_performance_init(void)
 {
+    if ( cpufreq_governor_internal )
+        return 0;
+
     return cpufreq_register_governor(&cpufreq_gov_performance);
 }
 __initcall(cpufreq_gov_performance_init);
@@ -201,6 +207,9 @@ struct cpufreq_governor cpufreq_gov_powersave = {
 
 static int __init cf_check cpufreq_gov_powersave_init(void)
 {
+    if ( cpufreq_governor_internal )
+        return 0;
+
     return cpufreq_register_governor(&cpufreq_gov_powersave);
 }
 __initcall(cpufreq_gov_powersave_init);
diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index fbcd14d6c3..06cfc88d30 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -360,6 +360,9 @@ struct cpufreq_governor cpufreq_gov_dbs = {
 
 static int __init cf_check cpufreq_gov_dbs_init(void)
 {
+    if ( cpufreq_governor_internal )
+        return 0;
+
     return cpufreq_register_governor(&cpufreq_gov_dbs);
 }
 __initcall(cpufreq_gov_dbs_init);
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 35dcf21e8f..44fc4c58fc 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -116,6 +116,8 @@ extern struct cpufreq_governor cpufreq_gov_powersave;
 
 extern struct list_head cpufreq_governor_list;
 
+extern bool cpufreq_governor_internal;
+
 extern int cpufreq_register_governor(struct cpufreq_governor *governor);
 extern struct cpufreq_governor *__find_governor(const char *governor);
 #define CPUFREQ_DEFAULT_GOVERNOR &cpufreq_gov_dbs
-- 
2.41.0


