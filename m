Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E313A4CF3D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 00:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900666.1308514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpFGJ-0001JL-0C; Mon, 03 Mar 2025 23:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900666.1308514; Mon, 03 Mar 2025 23:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpFGI-0001HP-Rn; Mon, 03 Mar 2025 23:31:50 +0000
Received: by outflank-mailman (input) for mailman id 900666;
 Mon, 03 Mar 2025 23:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2B8f=VW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpFGH-0001Ed-Sc
 for xen-devel@lists.xenproject.org; Mon, 03 Mar 2025 23:31:49 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acbdf578-f887-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 00:31:47 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43bcb1a9890so1533665e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 03 Mar 2025 15:31:47 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba58713bsm211574785e9.34.2025.03.03.15.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 15:31:46 -0800 (PST)
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
X-Inumbo-ID: acbdf578-f887-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741044707; x=1741649507; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J91JazSYFQXqU+vsohzsb0V+rMFvaz3CX8hcgO5Nczo=;
        b=uk/dGK+p/f/QSjxHjSBhJL0dPNVU2eVLiIBa2mOlrJdw+kfNGTPuSlf1V3MYFxnbEh
         dBIm8E9kuTcPdobqlDlV8AJeN11LXVwHekagPVeVDLz7eNp3341UqDTSPSkplkH8eZqp
         wYy+ea7zbTh68gIWda/hsoeXWt5gVhO9ZOowI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741044707; x=1741649507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J91JazSYFQXqU+vsohzsb0V+rMFvaz3CX8hcgO5Nczo=;
        b=qUK7/yEerjrq48VlfmAGi6VkGUzMGQEXCMzNHUMrOhyLaMJRd9XxlO/pOs/BOrRDsQ
         lZSiIZd5FWrfbmm/JME0a4sZ5G9A1i5jnKNVxtwT4++bzRX+ayy82hzz3azivoTimpUg
         r/RJWbJ2Z7j7i/hQ8LEeCMR+cFQkf/ZN3xXMvEQ3K/Cx5ToglIMRR1wCgQP4TCiwO4s1
         JsShesidRtGYcx3eUg/xCDL7eMXozbcLzqUkLC0q7IgN98STrbHnHrDJ/WxvMs3GdSW0
         y9EtjAA3dxSOtx3eQPpkVQdYRFXaPAKKOyqoxEulOdQOw3N7zvBPZ1Q13hBxsDdnosk8
         ffmw==
X-Gm-Message-State: AOJu0Yzu/X88XrZSKo71mn2awm0uh3d/lQUVQ+kwvPV2HRnarpzONtpi
	BzVX7MStBETyhrJC79i3KT9IT8J3mppDz4GYScf1gYlHP7DX5aHUkIuYuRfrtJ+XcTnDidm6YGp
	r
X-Gm-Gg: ASbGncvtHnfYoQwSHoZ1anTFEcCVvKpWRwrh2sJlseDJMvaAl/x+Klb8dDyf6xq9qlC
	GpZIz9IUoBQGm6IPImwqgCj0IS5y58ejGzDOrBf97uKmGTRZgFRwq0mQWX1muIUtD3dO8V+nKps
	r6e7CxuoQ90BQGG+0PsxAjn+7/c9HsayyO82uNymyjEq7jJu66hFb+Mo5jaodzEnRA7BicVcT6F
	1Xqof8Sl4T4iEPznOwzmz/kmfgkqF1mU+rEInm4qLG70fC75D7p0MWVh0H6oPTBU/E6Cvd+Mj7r
	LiB/3jlrJR9r8s9Y6rbtRg/RdzaQ7qga50Tn+DflOFjasJ/JfyimEH10/6flKWPZhvPgpPsNNtI
	udRoMstUPH6Ykt26XH40LqJdn
X-Google-Smtp-Source: AGHT+IGwvmHd3HMEXQ3Pb9vNfBtwdCHwx1mWP1HTm0GHhr4X3yEKFfxPJFRjsy+hhuJ3EvD5+T2CeQ==
X-Received: by 2002:a05:600c:4455:b0:439:8e95:796a with SMTP id 5b1f17b1804b1-43bcb03e386mr8515615e9.13.1741044706836;
        Mon, 03 Mar 2025 15:31:46 -0800 (PST)
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
Subject: [PATCH v2 2/2] xen/watchdog: Identify which domain watchdog fired
Date: Mon,  3 Mar 2025 23:29:41 +0000
Message-Id: <20250303232941.2641306-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250303232941.2641306-1-andrew.cooper3@citrix.com>
References: <20250303232941.2641306-1-andrew.cooper3@citrix.com>
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

v2:
 * BUILD_BUG_ON() against the alignment of d.
---
 xen/common/sched/core.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d6296d99fdb9..3db0fe32ccd8 100644
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
+    BUILD_BUG_ON(!(alignof(d) < PAGE_SIZE));
 
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
+        BUILD_BUG_ON(NR_DOMAIN_WATCHDOG_TIMERS > alignof(d));
+
+        /*
+         * For the timer callback parameter, encode the watchdog id in
+         * the low bits of the domain pointer.
+         */
+        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, data + i, 0);
+    }
 }
 
 void watchdog_domain_destroy(struct domain *d)
-- 
2.39.5


