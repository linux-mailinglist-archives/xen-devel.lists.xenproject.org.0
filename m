Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9906F376A
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:30:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528102.820869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEX-00017F-Mt; Mon, 01 May 2023 19:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528102.820869; Mon, 01 May 2023 19:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZEX-00015P-Ja; Mon, 01 May 2023 19:30:49 +0000
Received: by outflank-mailman (input) for mailman id 528102;
 Mon, 01 May 2023 19:30:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZEW-000149-0Q
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:30:48 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab36cae7-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:30:46 +0200 (CEST)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-74e0180b7d3so129184485a.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:30:46 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d6-20020ac80606000000b003bf9f9f1844sm9351784qth.71.2023.05.01.12.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:30:43 -0700 (PDT)
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
X-Inumbo-ID: ab36cae7-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969444; x=1685561444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VFwxnOVM/nUJWo2+kFJfbzF53GX8dfaVA+R5Uyazpc=;
        b=r9j9BPVz3/laZA8dsDmxZe7TRv0yNCtj/Xbsb4WpqDXgx/fA0HOTxNUrvpQf+C4t2T
         YNYN206A0eGrKe1qAym9I5p7tG8XdEGiJaLW8/t6JkTJFkIT0pzBFXS/iIkCO56wJn3J
         pUjquCuW3n9+l6STbY/dk/Ilm9zT/scjBTbtK0COm2KbSl8FAiXw+kNZWbpx0W2WhcG0
         xkKJVYBUTb1RNwa7L8EPhULHZE9DzKHmCK095rERWUvFMoy1jZyxhh3f0Ve6Bc7Dd9u0
         RXDpYSvLxEtoWzrauTp25svhJmvdF5OfkwS+uKrmB1iBB7Lcit4b94RhLAlA38eqUI8l
         eUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969444; x=1685561444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VFwxnOVM/nUJWo2+kFJfbzF53GX8dfaVA+R5Uyazpc=;
        b=e5YLgoL599yP+Xdv0THAgss77WW4BQBhNDGUt27NFu/yV8d6Hk2Xd9U7aftqQ9dfzF
         oxkCghMUyRzel1clzQJRcVM5vahCRhg5CezxVDGDhNsiIXrczwnAnja7up9ZnNSqsirz
         Xk0Vz8cjOfJwbJDcv0EbU8WPQS4pz0PV5AmBG55CQXJwBZo4R77v1SRPl7B8hHOGyuux
         fW7j/gmJRqw+qC1Kd8bmqB+lyEOOsb8WaTgPQNv/o086SviJ2xaEg6yIef5ubaSMo0/4
         rYTqB6y/H3gTJVZ2si5QbqwIoOXZfqyUHXaWgQ8j2LM2Pri5RCygi/gtiVwLfOhr2+Op
         pcqA==
X-Gm-Message-State: AC+VfDwFiDMZoBVws863mnqB/YZLQslfknsbY4EPLNA1QijkGfK4cKVZ
	0hNoj1dGBrCCfasguw8ZeKCvACa/Zlk=
X-Google-Smtp-Source: ACHHUZ73X7XhEV+VKk/WhUuhmrdce/HnekpsrCHDFejO2dmdia7/TP7F2pse7XFmNwI5RC0Ffs/PlA==
X-Received: by 2002:ac8:7c50:0:b0:3f0:df4d:40b7 with SMTP id o16-20020ac87c50000000b003f0df4d40b7mr24378132qtv.7.1682969444425;
        Mon, 01 May 2023 12:30:44 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 01/14 RESEND] cpufreq: Allow restricting to internal governors only
Date: Mon,  1 May 2023 15:30:21 -0400
Message-Id: <20230501193034.88575-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230501193034.88575-1-jandryuk@gmail.com>
References: <20230501193034.88575-1-jandryuk@gmail.com>
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


