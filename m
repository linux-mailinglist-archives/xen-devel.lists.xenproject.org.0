Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E1458F314
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:30:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383873.619090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPB-000694-PK; Wed, 10 Aug 2022 19:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383873.619090; Wed, 10 Aug 2022 19:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLrPB-00067c-Mc; Wed, 10 Aug 2022 19:30:13 +0000
Received: by outflank-mailman (input) for mailman id 383873;
 Wed, 10 Aug 2022 19:30:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxBI=YO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oLrPA-00067E-Ho
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 19:30:12 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d96c44f9-18e2-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 21:30:11 +0200 (CEST)
Received: by mail-qk1-x72c.google.com with SMTP id d8so7300982qkk.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Aug 2022 12:30:11 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:289e:b898:c7de:df6c])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a05620a0f0600b006af10bd3635sm537231qkl.57.2022.08.10.12.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 12:30:09 -0700 (PDT)
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
X-Inumbo-ID: d96c44f9-18e2-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=YaQ1M6q3D+VE5TezIjwSsQPtyAvIE/tK9UYnMBK9ZTE=;
        b=JafKEHlefrPqEr6Vw+WOV8AkmEJGsfaqWtuIVzIELQET9cW8F7T//nvxxEdwYnETg7
         TMVXBTx4O3/K6+7PNozKjbfQu+TgTqj3hQ8AcGIdafm8GpZYY25mcZLUtNrmGaFNwDpU
         bvh5uvV56jG3p+Kai1GKr++Ucjdh2DZKhkpnRiaKwNQPxkk2eTpHS6KUtu0pRkqOr9Uc
         v6t1Ey8vN97/BDEegj8AsoixIKlynaczmTnK/9TVKjEQxMIKxZNgz+S9hWPelG8khq2U
         pjp5x1O/sJv6Fn3nk6tH3PgGrBwT5EIzuvJo5LC63qmBbZy8tXJV8o+HMDHZ7hEseyz+
         MmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=YaQ1M6q3D+VE5TezIjwSsQPtyAvIE/tK9UYnMBK9ZTE=;
        b=3o8e+dC0VJeonJgWqAKidW1swLSD8zYh610ogYoauEo9Lvcj8/6wZMJo+GhRpGZMKm
         kTpbIrmSkkRMs+4/9Kxuhg7KWdHZ1yZDjxyxBbhwLQJPNghBE5vlzO3FJzJQCWMVoCvK
         doI6pbWn8GO0mOuzsOq0YPbbXParaH5dzUVV7n8g4uus57VjgYD8qajQHsLepeIGpCJL
         XkObAVN91aN4cGuPK6mUi9jstmkhhmTPVmMFtE70EuiGUqOW6mIMssinGszFRSocML5g
         p+1uNKego5e/BFapvrGeDCdzZVdziDx9uvTiVq2pI7BL4dueQd/ZAVQ17m+yco6GjDSN
         zm8A==
X-Gm-Message-State: ACgBeo2hyEpH1aopmzwAsI85WKjhqRQ3QPKGRDsXQYxhFCgzoUj1EC7Y
	hsQ5SIGzXQNy7uzhTPunu9OQOSsuzNA=
X-Google-Smtp-Source: AA6agR7W1Sl4o/sOM/mI6Q51UBYQMCUa9K2ffX72dCl9qcAu7Eu53VT2O/s3Y9lPL4/anajxNG4HTQ==
X-Received: by 2002:a05:620a:1597:b0:6b9:57d2:8aa0 with SMTP id d23-20020a05620a159700b006b957d28aa0mr11223268qkk.485.1660159809965;
        Wed, 10 Aug 2022 12:30:09 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 01/13] cpufreq: Allow restricting to internal governors only
Date: Wed, 10 Aug 2022 15:29:32 -0400
Message-Id: <20220810192944.102135-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220810192944.102135-1-jandryuk@gmail.com>
References: <20220810192944.102135-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For hwp, the standard governors are not usable, and only the internal
one is applicable.  Add the cpufreq_governor_internal boolean to
indicate when an internal governor, like hwp-internal, will be used.
This is set during presmp_initcall, so that it can suppress governor
registration during initcall.  Only a governor with a name containing
"-internal" will be allowed in that case.

This way, the unuseable governors are not registered, so they internal
one is the only one returned to userspace.  This means incompatible
governors won't be advertised to userspace.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Switch to "-internal"
Add blank line in header
---
 xen/drivers/cpufreq/cpufreq.c      | 5 +++++
 xen/include/acpi/cpufreq/cpufreq.h | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index a94520ee57..1fdd63d7b5 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -57,6 +57,7 @@ struct cpufreq_dom {
 };
 static LIST_HEAD_READ_MOSTLY(cpufreq_dom_list_head);
 
+bool __read_mostly cpufreq_governor_internal;
 struct cpufreq_governor *__read_mostly cpufreq_opt_governor;
 LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
 
@@ -122,6 +123,10 @@ int __init cpufreq_register_governor(struct cpufreq_governor *governor)
     if (!governor)
         return -EINVAL;
 
+    if (cpufreq_governor_internal &&
+        strstr(governor->name, "-internal") == NULL)
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
2.37.1


