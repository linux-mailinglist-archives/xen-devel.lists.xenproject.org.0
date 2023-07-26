Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5B763D49
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:10:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570632.892603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi1n-000657-2y; Wed, 26 Jul 2023 17:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570632.892603; Wed, 26 Jul 2023 17:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi1m-00063D-Vy; Wed, 26 Jul 2023 17:10:22 +0000
Received: by outflank-mailman (input) for mailman id 570632;
 Wed, 26 Jul 2023 17:10:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi1l-00062Z-Jb
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:10:21 +0000
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [2607:f8b0:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c9e991f-2bd7-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 19:10:20 +0200 (CEST)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-3a36b30aa7bso57651b6e.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:10:20 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:10:18 -0700 (PDT)
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
X-Inumbo-ID: 4c9e991f-2bd7-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391419; x=1690996219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNQhWJqSLtysm6iaINr+s0i3gnrhiDBqgnXkQD6RBcM=;
        b=krlaHJoIy3yBZiPoFJmrsH44untMDFcqlyD42tIv3J0pv1sayVDAZc3MYTKOUgkuGS
         QPdQK/0vaXkl655PX/IPtnDWBOgTDLQPo3kn2UstKajS8y+3wAyNEG+naNWGwMByi/lu
         wP14L80U5G0WULeBjTy3ECD/HyIkIYSshUjdMufVrdsSrtzB/nTD8VedVoUTd/Bi3Uv+
         h6dWVD0sFSQirDp6RWdJlTjaaLdUayfHbsqYJJfqrLz+kMlJjQkoaW/fRPyWpNH/XDoy
         Vsc4pnaNr8JQGVkAd0AStuPZzKUgy8ZBY3AG81WtREZOKMckbgYm+CNad6fuzpxTsp8W
         c2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391419; x=1690996219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNQhWJqSLtysm6iaINr+s0i3gnrhiDBqgnXkQD6RBcM=;
        b=g+iUq6yMhpmwpJ8+MxQ/ZoJpY75xdHrsH4lP8OBwYCXhu/F/zLMxEQ87aJyqk6H9iq
         cTrGE8anW8Pp+UWzGOffcIftWaL5lRe97P1UUVTMytIb0UNwLOfXb9OMTF62SlFZQ6O4
         9x0BdivppiP9pvLSUT/YVR+J83uqA+QxiWVb/EOcL5Irtss9cFQIbLFxIqiOYWyb8Fm6
         rTB3FIfO6OpJhibmGHT7AgA8R0HEUTdUegR1+l44LRDW1QKRY+/nsaiI+62YNWd4drYR
         XsAGBJv68yEuJHOzEXR96x8vLVNIlH/5lPJnVBiyFv2NCavgve6nNEa10ETL1KVKk4+N
         /deQ==
X-Gm-Message-State: ABy/qLYyrWhyhtoHIN/7PSkcC+Mtdjqoaos4AIy/jNCcdKnfPWLokDw6
	iWpoIBowjAa7ZC6ykB+nfIbE4AhH+4U=
X-Google-Smtp-Source: APBJJlFRa4l4v0YcVbLUCneCpGdNXFzCSJ8gSt8eoF0HC+kuPqGKrhColbbOUeFLOo40dYB+FiTYQA==
X-Received: by 2002:a05:6808:2119:b0:3a4:25ab:eecb with SMTP id r25-20020a056808211900b003a425abeecbmr101465oiw.51.1690391418755;
        Wed, 26 Jul 2023 10:10:18 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 01/15] cpufreq: Allow restricting to internal governors only
Date: Wed, 26 Jul 2023 13:09:31 -0400
Message-ID: <20230726170945.34961-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726170945.34961-1-jandryuk@gmail.com>
References: <20230726170945.34961-1-jandryuk@gmail.com>
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


