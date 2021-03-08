Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE03318F8
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 22:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95081.179368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1J-0006R1-8J; Mon, 08 Mar 2021 21:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95081.179368; Mon, 08 Mar 2021 21:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1J-0006QU-4m; Mon, 08 Mar 2021 21:02:29 +0000
Received: by outflank-mailman (input) for mailman id 95081;
 Mon, 08 Mar 2021 21:02:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odrr=IG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJN1H-0006P0-Hx
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 21:02:27 +0000
Received: from mail-qv1-xf2f.google.com (unknown [2607:f8b0:4864:20::f2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43aa06a6-76b4-4036-837e-7fcc27eb821d;
 Mon, 08 Mar 2021 21:02:24 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id s17so5311941qvr.12
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 13:02:24 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a33e:daa7:46a1:a7eb])
 by smtp.gmail.com with ESMTPSA id
 r2sm8514070qti.4.2021.03.08.13.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:02:23 -0800 (PST)
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
X-Inumbo-ID: 43aa06a6-76b4-4036-837e-7fcc27eb821d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AfcM/s05qxzInnDElTdSa2MUdrnaUTl8MKM2+TfWCVg=;
        b=tbMhZo+C/23Qk6OTDzVt4ntvhwQITnUTwcsWvir9zh+CBlzBSXCq/rINAAzPFz88s6
         sm65Or2at2PZwM9OyXMQBkwvz8WVbxSIi8kfNdy5sj5TjdAj724obPfg1aOCylj0FKMV
         7HU1HUA1MV4DZdfHrDqsj2lX4xt+26nJvNA6K8iAXoZ/yAwryvCAwZXlZ/TY+eHBkMym
         cADG9C92CEKCTjfN9HXLOPb2B4rgMDImokSiU72PRhEZbKf76RHdH2Bxrsos8D84pzuG
         oDY4mZQNUJe3nzYoEJkCSQJbl/urs94V8KGdP05uslJ+02VO5KJ2kIFOrMW+NRGYzNTT
         AwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AfcM/s05qxzInnDElTdSa2MUdrnaUTl8MKM2+TfWCVg=;
        b=AF8PJwYNOfQysq/gVqLA2/myFhaxfGnCxo9hld4+TM3NnPh4sMiQ+juhUGBD/i9uaO
         ecGMt13qk2anGvMu0mQO2XhwuHfIbjc8WFeLtgB7j1MwdZi4Hr5lIHnCSI4/T+JKQjTe
         VogGNe0s6tOaq8AS/6FM61kNWxo5aynHaL1ebtS07czHWOzDS9v8vEtzGdMvk8kttr2V
         +DZgioOlhBc2ra7qhU7EJH0cExudecf4v7HgLxfLNUVxd5O0hAWEPoB4L9pjfLPTnP3m
         iAtsb12HUNfbs8UoKCGJevust8pgoR5Ta5EUfP9MxGgGU+h0I0EvcarsUyIbn4nbAHrf
         BDxw==
X-Gm-Message-State: AOAM5330DHGv78YR4Gqktex82hS0RjLYKh+Slj7yP8kIFaYJSMByfsk/
	Eu4wB/r3t5NdaFRd11RR31oIKGFzvA4=
X-Google-Smtp-Source: ABdhPJyHuwzAX6BTlMOiuZNdGKVNT28aymiqM3iA/I5EocSfeuPmVcrmGeqzJ7pR7YdpkQMQVDFKsg==
X-Received: by 2002:ad4:4c0b:: with SMTP id bz11mr1818565qvb.4.1615237344305;
        Mon, 08 Mar 2021 13:02:24 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pawel@invisiblethingslab.com,
	marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [RFC 01/12] cpufreq: Allow restricting to internal governors only
Date: Mon,  8 Mar 2021 16:01:59 -0500
Message-Id: <20210308210210.116278-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308210210.116278-1-jandryuk@gmail.com>
References: <20210308210210.116278-1-jandryuk@gmail.com>
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
index e630a47419..b1f668b715 100644
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
2.29.2


