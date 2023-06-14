Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DF173068A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:03:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549112.857461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqH-0005N5-5R; Wed, 14 Jun 2023 18:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549112.857461; Wed, 14 Jun 2023 18:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqH-0005LN-0u; Wed, 14 Jun 2023 18:03:37 +0000
Received: by outflank-mailman (input) for mailman id 549112;
 Wed, 14 Jun 2023 18:03:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9UqF-0005LA-Vw
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:03:36 +0000
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [2607:f8b0:4864:20::e35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7602c19-0add-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 20:03:35 +0200 (CEST)
Received: by mail-vs1-xe35.google.com with SMTP id
 ada2fe7eead31-43dc3f77accso1084383137.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:03:35 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:32 -0700 (PDT)
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
X-Inumbo-ID: c7602c19-0add-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765813; x=1689357813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lU8DGWwiCowI3/H8qxEHgym+pR/PD7+d49EnwTk48c0=;
        b=FTMGhYzyzesu0y8pq13HQGHdOiX37CAuijIjvJWyvNfGq+oJd8YxyBP8kdauoRw4Tg
         m6uOw5MoYCdf2z+6RHnovjMpq+Qj9okzrUJEMcbdtWDU/lV5BuqY4VkkNKFJb2kKXSC4
         WfevBJzJtfMrZvQ4XdszbfQV6G0u2liwKaQTzPXsPCX7UhBQwEvUzPwNsJvqG6iUVUUA
         snQ9YIvCZ9DxC5LC8NfHt3ywo1lFu1q0gYah2O5/1fK5v5FUEmgymK6iLt/7umElkTv9
         VaM/YsCQ30Q5bT/omyUDZbCo5LFpeiJCJZtZmbb+foEwedk8WYXM7IwJ+z4xu4MAeJHP
         Ya0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765813; x=1689357813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lU8DGWwiCowI3/H8qxEHgym+pR/PD7+d49EnwTk48c0=;
        b=btMjjmXecfxyfoHZCl+/dO5hXa+vJc1CcSWwcx6REag/xBRmo1JBpdvbPGxg5HACH7
         84sEgIK5eEHwbJLYzAwt0svK3nfqPAVYtIrlnHQtaVxGLiv70tl/95Z4/nGXZX/R9AwY
         ljkQrbHdUDXVwi54fgkmCtJ46JQOZrXvSHUHm3c05SFaPYo5ovV5Aj9w8Hfs+qchjJus
         GgGf18LYXckPEGhKs6gpuBgQlY7oUpAANN7eWmp+5i/rGMWTKQxoiT7Y9LZA4ckAjS+w
         vis9b7+F+j03QETWt9G/HD5LpPmo/mf7w79+y5vLvPKqWRorqn6qesSM/CAMNHUTt+9r
         rYDA==
X-Gm-Message-State: AC+VfDyWaGeUdD/+P/Lgw9OS5M5Wr6hcdVhPYCo63fHDSd1yVlZ37aXX
	bZ827CSE+/cotmtqXYREcXUfOaFHL8Y=
X-Google-Smtp-Source: ACHHUZ5d7g8agZ07KEhe8IWu0FQmrugubkYEzKObMy6SSopXNduOyiTa/lcirAy2NwfmmUcx7Np8Jw==
X-Received: by 2002:a67:ebda:0:b0:43f:35f5:771a with SMTP id y26-20020a67ebda000000b0043f35f5771amr4569198vso.19.1686765813187;
        Wed, 14 Jun 2023 11:03:33 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 01/15] cpufreq: Allow restricting to internal governors only
Date: Wed, 14 Jun 2023 14:02:39 -0400
Message-Id: <20230614180253.89958-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230614180253.89958-1-jandryuk@gmail.com>
References: <20230614180253.89958-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For hwp, the standard governors are not usable, and only the internal
one is applicable.  Add the cpufreq_governor_internal boolean to
indicate when an internal governor, like hwp, will be used.
This is set during presmp_initcall, so that it can suppress governor
registration during initcall.  Add an internal flag to struct
cpufreq_governor to indicate such governors.

This way, the unusable governors are not registered, so the internal
one is the only one returned to userspace.  This means incompatible
governors won't be advertised to userspace.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
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
 xen/drivers/cpufreq/cpufreq.c      | 7 +++++++
 xen/include/acpi/cpufreq/cpufreq.h | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 2321c7dd07..cccf9a64c8 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -56,6 +56,7 @@ struct cpufreq_dom {
 };
 static LIST_HEAD_READ_MOSTLY(cpufreq_dom_list_head);
 
+bool __initdata cpufreq_governor_internal;
 struct cpufreq_governor *__read_mostly cpufreq_opt_governor;
 LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
 
@@ -121,6 +122,12 @@ int __init cpufreq_register_governor(struct cpufreq_governor *governor)
     if (!governor)
         return -EINVAL;
 
+    if (cpufreq_governor_internal && !governor->internal)
+        return -EINVAL;
+
+    if (!cpufreq_governor_internal && governor->internal)
+        return -EINVAL;
+
     if (__find_governor(governor->name) != NULL)
         return -EEXIST;
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 35dcf21e8f..1c0872506a 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -106,6 +106,7 @@ struct cpufreq_governor {
                         unsigned int event);
     bool_t  (*handle_option)(const char *name, const char *value);
     struct list_head governor_list;
+    bool    internal;
 };
 
 extern struct cpufreq_governor *cpufreq_opt_governor;
@@ -114,6 +115,8 @@ extern struct cpufreq_governor cpufreq_gov_userspace;
 extern struct cpufreq_governor cpufreq_gov_performance;
 extern struct cpufreq_governor cpufreq_gov_powersave;
 
+extern bool cpufreq_governor_internal;
+
 extern struct list_head cpufreq_governor_list;
 
 extern int cpufreq_register_governor(struct cpufreq_governor *governor);
-- 
2.40.1


