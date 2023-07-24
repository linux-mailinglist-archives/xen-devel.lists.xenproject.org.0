Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B399875F79B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568913.889035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNv9m-00041n-Si; Mon, 24 Jul 2023 12:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568913.889035; Mon, 24 Jul 2023 12:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNv9m-0003yz-Pg; Mon, 24 Jul 2023 12:59:22 +0000
Received: by outflank-mailman (input) for mailman id 568913;
 Mon, 24 Jul 2023 12:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNv9l-0003BP-HJ
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:21 +0000
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [2607:f8b0:4864:20::82c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6c3b833-2a21-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:59:19 +0200 (CEST)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-403f65a3f8cso33875051cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:19 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:17 -0700 (PDT)
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
X-Inumbo-ID: e6c3b833-2a21-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203558; x=1690808358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNQhWJqSLtysm6iaINr+s0i3gnrhiDBqgnXkQD6RBcM=;
        b=jzJf7FgcwuUKsKESZMpF55d1xqwWqJHwFCR4zuSTi+QWm3u8jN0QVvhkIGBQRXFD7y
         YZV5+qeXwjJK2oIVQ6A61KGyl3JEIti2HJkuhraBoFQc4S6WDGYRzqbB7O6Yo9nON5Qr
         YIFdWnq72RVfzRflIjH6IBoNSuhJ/Lx/lhtUpV6DcaGP6VY0l3pBINRta1CauaZQ+0HZ
         1YNa7biAradn/d5roC/ZdEpqDc2dXEIX+LWbACL2EC14akyYOkCrM+snVWxsgY4CFPvg
         egvmx8Klc/7eqFe5ujV9bOnU1zc7qFaW7GZ3oVu+C+6mGRIS7LlXHL9eVMLS78VjiYTK
         F7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203558; x=1690808358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vNQhWJqSLtysm6iaINr+s0i3gnrhiDBqgnXkQD6RBcM=;
        b=ERev7igYntj78oaenAkoiIhyxjPawOC3lsWiRxRb0CtRYCWtv6TMSX6qRYDqXEYlar
         bJ0gkG6TFeUjiSJt44n/kW4U48rjF4zNVQx27AzfuvMmRDaqcEXHsKyrhElbOwgTfnfB
         DPHXELJpuvEzgzA/mH+HsCbp3l36ijUypb7C5BpdA6ikUAiZ/qfBqYy52GAlahNhGmSE
         6oPyn/8kL64l1m97g4qqri/s0cXit7jX4PjCQ32opvlNiAhI3ae6fpFc2mhNrLW7NBA/
         kVcaTzHc2KZpTAOqRA4pmz6QYRU2KL0J4bIjTHqdQrZEiklLWTB/BDYazS8hEpQMdG6w
         FZ8Q==
X-Gm-Message-State: ABy/qLbwB4VBqEOeueKfuWp0c/nIMvOcYDta/16jZYmCLOmSVvgWVbEk
	Mans1X29tykwaspQHph7ivzNV26papY=
X-Google-Smtp-Source: APBJJlHC4Avp8+Uss8Thrg0l6R9yg0cs9o3uBbVy0DGpOB/Ec+Z1s8yL4NlgLNOMeOEwphsJvge5+g==
X-Received: by 2002:ac8:5786:0:b0:403:e895:155b with SMTP id v6-20020ac85786000000b00403e895155bmr8528736qta.34.1690203557767;
        Mon, 24 Jul 2023 05:59:17 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v6 01/15] cpufreq: Allow restricting to internal governors only
Date: Mon, 24 Jul 2023 08:58:43 -0400
Message-ID: <20230724125857.11133-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724125857.11133-1-jandryuk@gmail.com>
References: <20230724125857.11133-1-jandryuk@gmail.com>
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


