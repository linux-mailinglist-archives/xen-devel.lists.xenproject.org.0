Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8D874A3F8
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 20:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559972.875462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8S-00043p-EA; Thu, 06 Jul 2023 18:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559972.875462; Thu, 06 Jul 2023 18:55:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHU8S-0003ys-8v; Thu, 06 Jul 2023 18:55:24 +0000
Received: by outflank-mailman (input) for mailman id 559972;
 Thu, 06 Jul 2023 18:55:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zM/b=CY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qHU8R-0003x8-AF
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 18:55:23 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a87189a5-1c2e-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 20:55:22 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-765942d497fso104741085a.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jul 2023 11:55:22 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 g25-20020ae9e119000000b0075b168fcde9sm1015297qkm.77.2023.07.06.11.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:55:19 -0700 (PDT)
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
X-Inumbo-ID: a87189a5-1c2e-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688669720; x=1691261720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aycMLLTtkVhp4cOSefmKjKietLSeza3V+cbVoUfTbl0=;
        b=D+TZYy4fGZjGy+FgIRROffkomu3McxJniQxK3velbReBOlt8VFQBxbK3RJVUxGXQvK
         +rkIr6De7801ozYjBB2wk9nNVicLZvTZztYV1CYRRy7qq2URpQxQRcaSmdIdD6Dux/TH
         xtd2XwrYmO62EAi776URy3ZBKEKENf06rx5hkGE9KqLpDQPeTqeNjHXTzZOh3zFtirZp
         l5f0hM4YHvWKyThFjUO2mySlRIoVt2XfCFpInaYrVbtq1X8z35NPRvWCbvq5J9l/JwVM
         vhBQEq+yYxMykHmc7rjXEhZW+2QqSWOKh2gXLSH9D7wkYonXEObD9lziVR0l+Pd8MEfU
         abLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688669720; x=1691261720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aycMLLTtkVhp4cOSefmKjKietLSeza3V+cbVoUfTbl0=;
        b=coHIa4zCnuOiu7aGY2mwXIBttAdIMT05Ssq1d7a/4xKtWpk3ypYQmkBkd6VCwd3u/B
         HUx6Ry9bQqByC5q+49rkGuDOMuTl4SgD9jTeU13grmtN1UIyRVMbP2z9xIHUdQWeFLza
         xQ60JAPBJDDLb0ENDrHf+in2Iv1qX5WiuvE4SnWl3WwyzZGX2G7TATDGOKdVeRneiqtY
         Tvhy4nso4XuHQsAdQYdij9qLlM9pio1XNoVDvdE6kHdWZDbs8h++elvttuMDwy3T1JCw
         26BJLgGjxps2C9u5fwUmCMrlhN2LL/HHEqyOJn5OBLJzfawTtzfY5J8BmVdLcRZeWic6
         Pdfg==
X-Gm-Message-State: ABy/qLbQGMVmaE48l0JIiaGR1Frl9it6ZeFaod5+jXDPKKgVxbvVRGq4
	M5crcLVwusiEvJuAbaXm9StVkCMqEVs=
X-Google-Smtp-Source: APBJJlGKcaPEkc/C3x40sAt6Ntk1OpgdIHGddjk8juPw606QxSOs0aUq+cBfTaSdai/79xgKFr9x2g==
X-Received: by 2002:a05:620a:24cf:b0:767:4057:1d6d with SMTP id m15-20020a05620a24cf00b0076740571d6dmr3131937qkn.62.1688669720445;
        Thu, 06 Jul 2023 11:55:20 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v5 01/15] cpufreq: Allow restricting to internal governors only
Date: Thu,  6 Jul 2023 14:54:26 -0400
Message-ID: <20230706185440.48333-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706185440.48333-1-jandryuk@gmail.com>
References: <20230706185440.48333-1-jandryuk@gmail.com>
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
---
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


