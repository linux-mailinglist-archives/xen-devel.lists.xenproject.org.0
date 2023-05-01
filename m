Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6846F369A
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528062.820619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZ56-00036V-Bj; Mon, 01 May 2023 19:21:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528062.820619; Mon, 01 May 2023 19:21:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZ56-00034k-8o; Mon, 01 May 2023 19:21:04 +0000
Received: by outflank-mailman (input) for mailman id 528062;
 Mon, 01 May 2023 19:21:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZ55-0002np-CQ
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:21:03 +0000
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f87efd6-e855-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:21:02 +0200 (CEST)
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-75131c2997bso1448687285a.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:21:02 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 x20-20020a0ce0d4000000b0061927ddb043sm2012307qvk.80.2023.05.01.12.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:21:01 -0700 (PDT)
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
X-Inumbo-ID: 4f87efd6-e855-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682968862; x=1685560862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VFwxnOVM/nUJWo2+kFJfbzF53GX8dfaVA+R5Uyazpc=;
        b=fxt+FrecoN8NG22EJ/cAh7e8No5T6QNfq9reDEVzQ7EdqNL/B6JjLggYYDL8/2v9gw
         rqD/WLcw8nkbQ1SUKcI+20o+Tu/W9Uiz5MTfrNtY9z5uam7qXqGBya8azNCJXqFE08Xk
         kbLvDoQ58GUkDwEw8Oc527I9EEPhPMQfZU+xCLzjQ1YGwAqpbGUbQaOEkMYGsHJIXH1L
         ySUDH5HHSwLUWEP9aC89yK74HssrIkNPdaGDzaXZuAOB0Sej6K3TDScZC/zTqYlii53O
         rIDA4MvVDlT7jnNZ9kdGxQgRPZdyo56FQJRUOrLxOE1Wr3NdZYkx/ZvxbQriRsaVfWG3
         ku3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682968862; x=1685560862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VFwxnOVM/nUJWo2+kFJfbzF53GX8dfaVA+R5Uyazpc=;
        b=ZIfSwEFvebKWOzBAKg16cOISPs987j4sF+asXIsJaX/a5mlyTPTWd+X8ZoA6SrYOWf
         RzfId430GKKBf3oLhNDV5YfRkXqf77NBIu/Bk6zjHlia6YmFOCPiFds5Us1Ep95BS+xw
         MrJ3JFpv/RnpYAUowWU86riJkJjaf/u/oc6NXicqFwfGmb+q9VhC/P2uWoWcYpf7nj13
         Jzdq6TYSz+tTbxcwAozk6lwaVv86Q1qh4XeRezihMiXXUi35K++sCcabjuaE1migZfoF
         SGGEvtQPZVcTY993ZxjD8CD7JnUHGLqTTi7WMWzzto1b/cgQ6iIdwzZx+amYYGzgGwm6
         m+Qg==
X-Gm-Message-State: AC+VfDyN6RQlOMvETukC083AAehwduDtpfEQDdC9aKGyygQh2JdYznoE
	GYqNURPzOfOg9nGzTv3iYR4=
X-Google-Smtp-Source: ACHHUZ7GV+m0SaqcaVilE9mZSkNpsz96YrsDMORzgTpHu95CZ/am2ZJKlVW9lI3rEQAcEmBuuBN5wQ==
X-Received: by 2002:a05:6214:c8c:b0:5ef:512d:2d47 with SMTP id r12-20020a0562140c8c00b005ef512d2d47mr1231450qvr.19.1682968861656;
        Mon, 01 May 2023 12:21:01 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproj,
	xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 01/14] cpufreq: Allow restricting to internal governors only
Date: Mon,  1 May 2023 15:20:32 -0400
Message-Id: <20230501192045.87377-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501192045.87377-1-jandryuk@gmail.com>
References: <20230501192045.87377-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For hwp, the standard governors are not usable, and only the internal
one is applicable.  Add the cpufreq_governor_internal boolean to
indicate when an internal governor, like hwp-internal, will be used.
This is set during presmp_initcall, so that it can suppress governor
registration during initcall.  Only a governor with a name containing
"-internal" will be allowed in that case.

This way, the unuseable governors are not registered, so the internal
one is the only one returned to userspace.  This means incompatible
governors won't be advertised to userspace.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3:
Switch to initdata
Add Jan Acked-by
Commit message s/they/the/ typo
Don't register hwp-internal when running non-hwp - Marek

v2:
Switch to "-internal"
Add blank line in header
---
 xen/drivers/cpufreq/cpufreq.c      | 8 ++++++++
 xen/include/acpi/cpufreq/cpufreq.h | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 2321c7dd07..7bd81680da 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -56,6 +56,7 @@ struct cpufreq_dom {
 };
 static LIST_HEAD_READ_MOSTLY(cpufreq_dom_list_head);
 
+bool __initdata cpufreq_governor_internal;
 struct cpufreq_governor *__read_mostly cpufreq_opt_governor;
 LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
 
@@ -121,6 +122,13 @@ int __init cpufreq_register_governor(struct cpufreq_governor *governor)
     if (!governor)
         return -EINVAL;
 
+    if (cpufreq_governor_internal &&
+        strstr(governor->name, "-internal") == NULL)
+        return -EINVAL;
+
+    if (!cpufreq_governor_internal && strstr(governor->name, "-internal"))
+        return -EINVAL;
+
     if (__find_governor(governor->name) != NULL)
         return -EEXIST;
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 35dcf21e8f..0da32ef519 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -114,6 +114,8 @@ extern struct cpufreq_governor cpufreq_gov_userspace;
 extern struct cpufreq_governor cpufreq_gov_performance;
 extern struct cpufreq_governor cpufreq_gov_powersave;
 
+extern bool cpufreq_governor_internal;
+
 extern struct list_head cpufreq_governor_list;
 
 extern int cpufreq_register_governor(struct cpufreq_governor *governor);
-- 
2.40.0


