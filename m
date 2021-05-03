Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E7B37206B
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:28:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121805.229733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeF3-0005ka-8g; Mon, 03 May 2021 19:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121805.229733; Mon, 03 May 2021 19:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeF3-0005jm-51; Mon, 03 May 2021 19:28:29 +0000
Received: by outflank-mailman (input) for mailman id 121805;
 Mon, 03 May 2021 19:28:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeF1-0005i5-MB
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:28:27 +0000
Received: from mail-qk1-x729.google.com (unknown [2607:f8b0:4864:20::729])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 289b7eb7-366a-4be4-b57f-3045304d52a9;
 Mon, 03 May 2021 19:28:27 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id o5so6300921qkb.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:27 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:25 -0700 (PDT)
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
X-Inumbo-ID: 289b7eb7-366a-4be4-b57f-3045304d52a9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g57GzuZpsCctvWoQCtrFFJcfB/69BgTCkSLuWAk+2XM=;
        b=YBSpjJP205ldCrlB+abWxu+m8VbeuPWIJ/XXExUz8EYyTkZUFjL7+LVAckObklbecq
         sPObnk2qR7dwOPgGgFzMo5rBmIb1D7OBaPvJ9SkIf6BJYqvOKybVkKht3Dzq74FhtPHv
         kw9pke3JThZ4BAXAMsWRUDC/bKESzyHV4xcS/vnc1V2z0FG8IDDfyjmYh9mFcjz3eoI1
         9+zZBOGyKlx4LFybEC/LGuvK/i9AAIdT0YTkCXdCxD7EOWOSwspc7zdAoJ0IVbOIWhOp
         E+bDacQAsydRaewH0NtCDSLYfl5pbxI0m5JCQT6cuCi0V9Qjk+SZC5BAstHdQbOfBKeL
         urWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g57GzuZpsCctvWoQCtrFFJcfB/69BgTCkSLuWAk+2XM=;
        b=t4hf6fIQpv6sFu+hCTiVgGK6AKE54Ct28Ux/sfJCwrTrNZiBgHVPFQyStCnTyo6uOg
         WDeD9xV576EFubHH7Q0qykN3m0tgzN2l7ZkFABHMVLgSjnOoDTabDdiKwM0W0P1v0jVh
         nZ7tW6FiGpLRtHMNK1BInCfB1txZxDbOTzEgvOHInb7gpaMz1zJReGRA2QzFXeZVVIM3
         yGCk4dKWNxlgx1DYz51kQkM1K7DTKcgix6XYSepsyN9EarKEXYLr4cUypldwf5LpwWMf
         xf6ElMXPF2FCs7awwUeMUXAz5JK6GkmHjqOpsb1QYA4z0xa6fkYrVjlGMee5lbax5C8h
         4juw==
X-Gm-Message-State: AOAM5317CPuYjK9hmeG1Qsy7CTqFA/vhh9L1mxKBbg6BaJLB4AK+OTuM
	dCLrHzYHxMnvDZ5V0rJEzQqO1U6d9OE=
X-Google-Smtp-Source: ABdhPJzItvGOOofE9kprenmOUVxW3jLCJ50TJvXYSkBUnqLA6shwxoxlgBVFLmzU5Z/p3pGvKbu5lg==
X-Received: by 2002:a37:a5d8:: with SMTP id o207mr17798356qke.13.1620070106436;
        Mon, 03 May 2021 12:28:26 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 01/13] cpufreq: Allow restricting to internal governors only
Date: Mon,  3 May 2021 15:27:58 -0400
Message-Id: <20210503192810.36084-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503192810.36084-1-jandryuk@gmail.com>
References: <20210503192810.36084-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For hwp, the standard governors are not usable, and only the internal
one is applicable.  Add the cpufreq_governor_internal boolean to
indicate when an internal governor, like hwp-internal, will be used.
This is set during presmp_initcall, so that it can suppress governor
registration during initcall.  Only a governor with a name containing
"internal" will be allowed in that case.

This way, the unuseable governors are not registered, so they internal
one is the only one returned to userspace.  This means incompatible
governors won't be advertised to userspace.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 xen/drivers/cpufreq/cpufreq.c      | 4 ++++
 xen/include/acpi/cpufreq/cpufreq.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 419aae83ee..6cbf150538 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -57,6 +57,7 @@ struct cpufreq_dom {
 };
 static LIST_HEAD_READ_MOSTLY(cpufreq_dom_list_head);
 
+bool __read_mostly cpufreq_governor_internal;
 struct cpufreq_governor *__read_mostly cpufreq_opt_governor;
 LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
 
@@ -122,6 +123,9 @@ int __init cpufreq_register_governor(struct cpufreq_governor *governor)
     if (!governor)
         return -EINVAL;
 
+    if (cpufreq_governor_internal && strstr(governor->name, "internal") == NULL)
+        return -EINVAL;
+
     if (__find_governor(governor->name) != NULL)
         return -EEXIST;
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index e88b20bfed..56df5eebed 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -115,6 +115,7 @@ extern struct cpufreq_governor cpufreq_gov_dbs;
 extern struct cpufreq_governor cpufreq_gov_userspace;
 extern struct cpufreq_governor cpufreq_gov_performance;
 extern struct cpufreq_governor cpufreq_gov_powersave;
+extern bool cpufreq_governor_internal;
 
 extern struct list_head cpufreq_governor_list;
 
-- 
2.30.2


