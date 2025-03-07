Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011A2A56A55
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 15:27:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905058.1312816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqYf3-0000C9-T2; Fri, 07 Mar 2025 14:26:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905058.1312816; Fri, 07 Mar 2025 14:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqYf3-00008m-Pu; Fri, 07 Mar 2025 14:26:49 +0000
Received: by outflank-mailman (input) for mailman id 905058;
 Fri, 07 Mar 2025 14:26:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqYf1-00008g-Qs
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 14:26:47 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 329389d1-fb60-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 15:26:45 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso1510827f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 06:26:45 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfb16sm5459661f8f.29.2025.03.07.06.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 06:26:44 -0800 (PST)
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
X-Inumbo-ID: 329389d1-fb60-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741357605; x=1741962405; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2TzeJhPfRjh9culJoSSA5hwu6Q+wgxqSML8qWtf39I=;
        b=ENXb2/NgdVQ61W7+l2P6Ady65LwxVNIdvGkFVRMcfMuqX1Mbe7P2hckpPHpAZbymZE
         zXCG/bkWYD6lJZYXdNlGO1UjdEj/2v7izRwSii6QGclBooKEa/n5WO98PuYUSaIvNJSz
         QE/SjVrpYwjqNOukDsqaIzc/jHEULU/U4tMyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741357605; x=1741962405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2TzeJhPfRjh9culJoSSA5hwu6Q+wgxqSML8qWtf39I=;
        b=RuPG8C4vR3ahKzepwCYjiB+fbZr5O7bmugkws7waMS3MnLQDem/VxizUb4JL28VGi+
         GHR3jKwOKcomfyxwwCFLJB1CwQgNRLB8j1luKsqLaKMix33NjfqbLwBkGlXeYgRU1int
         gM1M5G3ibiNPzGz1Z9EseYDSXwK4v+zwER6/oGCfyQx3pzzQ1UziEKUx9DTPNfchT58T
         wdXfoOoY71A7HWatcFs9qV9gpcOjLkJNYvK9OoqSRSIz4FJpd2geihGCIWedmew5C0lh
         BmHhxkHtXXPIgi/JF/FYqeWdKJbKXlYOc8B5yw7oYfZz1gaLmqIRZisc8DEDnx/Mu9Ay
         RepA==
X-Gm-Message-State: AOJu0YxoI3Ish0yRSDZmEyq8Puz/oUclm9VCe1PUnm9kp5Adj3A3J0u9
	m5/HUQ/5S7h5WMRw9nE9Gq2UP1PCgnHSNFbkV/j1t7MOwGqRvLr98q3opFsc9lQpwpcH+8wwojz
	T
X-Gm-Gg: ASbGnctm8gHW9NQhBvPSR2jvE8OjTlnDxWBt+PaCrN8QwfGt5tweCJNSrQH0y74DcbH
	QLFVyyfPRwpZ1f0fnN14zZexUPIKwJWqMxDdiO2u0LwfkceHRprgyWXEkeBQFr0+0kQLhnP7ynK
	cAiUbqWTtKf5AcIHxm6o6ac3jX4Dj5Ns5HioeJXVqNcmYU60+XpV4MQ/ZN5n9mj8TLuxXY7b3m2
	XvyQkRb/I9ozZY61mfPtQ1Fq3ZKWfWqccs1eiXPamfqbp2uJGnxnJ7rhrDc3NrB+sAwgCe/zUZv
	ZYcgeF1tauOaaC8GBjPCwaV9Axwfs9XG/VAg5JFa3zNZdRGrtJr9FJhdrYdYXoOliLLJsXb5wXp
	LA+S4A3jMYLOxBEJprKp5XC5h
X-Google-Smtp-Source: AGHT+IFbK9MwCWUdJcKZMTUeOb+pbes0/VGJr+lCtdKljjqlE6X2qjcPx9/SJkGBCfjxlTVstfm3WQ==
X-Received: by 2002:a05:6000:1a86:b0:38f:2a32:abbb with SMTP id ffacd0b85a97d-39132d325c1mr1875537f8f.4.1741357604859;
        Fri, 07 Mar 2025 06:26:44 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v3] xen/watchdog: Identify which domain watchdog fired
Date: Fri,  7 Mar 2025 14:24:42 +0000
Message-Id: <20250307142442.3063528-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303232941.2641306-3-andrew.cooper3@citrix.com>
References: <20250303232941.2641306-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a watchdog fires, the domain is crashed and can't dump any state.

Xen allows a domain to have two separate watchdogs.  Therefore, for a
domain running multiple watchdogs (e.g. one based around network, one
for disk), it is important for diagnostics to know which watchdog
fired.

As the printk() is in a timer callback, this is a bit awkward to
arrange, but there are 12 spare bits in the bottom of the domain
pointer owing to its alignment.

Reuse these bits to encode the watchdog id too, so the one which fired
is identified when the domain is crashed.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Dario Faggioli <dfaggioli@suse.com>
CC: Juergen Gross <jgross@suse.com>
CC: George Dunlap <gwd@xenproject.org>

v3:
 * Fix alignof() expressions.
v2:
 * BUILD_BUG_ON() against the alignment of d.
---
 xen/common/sched/core.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d6296d99fdb9..9043414290a8 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1534,12 +1534,19 @@ long vcpu_yield(void)
 
 static void cf_check domain_watchdog_timeout(void *data)
 {
-    struct domain *d = data;
+    /*
+     * The data parameter encodes the watchdog id in the low bits of
+     * the domain pointer.
+     */
+    struct domain *d = _p((unsigned long)data & PAGE_MASK);
+    unsigned int id = (unsigned long)data & ~PAGE_MASK;
+
+    BUILD_BUG_ON(alignof(*d) < PAGE_SIZE);
 
     if ( d->is_shutting_down || d->is_dying )
         return;
 
-    printk("Watchdog timer fired for domain %u\n", d->domain_id);
+    printk("Watchdog timer %u fired for %pd\n", id, d);
     domain_shutdown(d, SHUTDOWN_watchdog);
 }
 
@@ -1593,7 +1600,17 @@ void watchdog_domain_init(struct domain *d)
     d->watchdog_inuse_map = 0;
 
     for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
-        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, d, 0);
+    {
+        void *data = d;
+
+        BUILD_BUG_ON(NR_DOMAIN_WATCHDOG_TIMERS > alignof(*d));
+
+        /*
+         * For the timer callback parameter, encode the watchdog id in
+         * the low bits of the domain pointer.
+         */
+        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, data + i, 0);
+    }
 }
 
 void watchdog_domain_destroy(struct domain *d)

base-commit: 4d4725901e474fb3a61814e3c7bcb563cbdd857a
prerequisite-patch-id: abf66c7a76178c5cf225f0c67efd6c430e95974a
-- 
2.39.5


