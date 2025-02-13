Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114D6A34A83
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 17:46:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887884.1297325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ticM8-0004M8-KU; Thu, 13 Feb 2025 16:46:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887884.1297325; Thu, 13 Feb 2025 16:46:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ticM8-0004Js-Go; Thu, 13 Feb 2025 16:46:28 +0000
Received: by outflank-mailman (input) for mailman id 887884;
 Thu, 13 Feb 2025 16:46:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8TG=VE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ticM6-0004Jm-Vr
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 16:46:27 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 102d6d2c-ea2a-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 17:46:25 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38dc1dfd9f2so889261f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 08:46:25 -0800 (PST)
Received: from andrew-laptop.. ([46.149.103.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1aa6f7sm52701825e9.32.2025.02.13.08.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:46:24 -0800 (PST)
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
X-Inumbo-ID: 102d6d2c-ea2a-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739465184; x=1740069984; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wWxdJ0VpxqkP0UZYhkjF8Nmcgr4ppvji91TorJqzE0g=;
        b=nw6GjAvbSFVDTXu1sALgtsV5VFEWUKY1B5Vc5MI3Q80tPTBaljvq0kvVlrtPHusAJI
         p7tG8oL5QnsB9qTEShxz9dKHnCYhmfZKf4OOjxYKofQpP9mWPSEpCg6LTFQXjTGauaI8
         Q9iqPpAHGrwyv/ILcpMWb57mokH8uIYNUN908=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739465185; x=1740069985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWxdJ0VpxqkP0UZYhkjF8Nmcgr4ppvji91TorJqzE0g=;
        b=ZxS/aHCU8+57ayzDuornB+qR7m6NOlOx2kGUG4pzwyjr/x8EBn0qsABrW++8ZeMM1Z
         8VYymL4sN9+IpyqKFMcJO4UtN8fQ/MKR3aCJGJWds1ykx1lgZSYmND4v7oBE5gSpL1VZ
         cpVjknxmQMn5KFLf30A0zUJCkunsZoZcXAHE7+O0flroYolgug3shvRCHGkDQTsQSReY
         M3alVs5kwE9/h9ul5AG9PEKNOIcDrFJjpdq3VBMd2AnzpZSx3pXFY//my09OdNP+EHBz
         bGJm/6bkX52rEwWsGmsRaAeTJ3JygIaPHgGdOnU92duWLVlJe79d9qGgHcDrvQAHqfyK
         DpMw==
X-Gm-Message-State: AOJu0Yy3pE6sGS9yRe0rniGQxW43d8ubaSE6cUlqkjXMeDRqjQwHArQ3
	K+c50VDwU31MVB2qB4xKlvvjD/n107T0+mPZcbo/IfkTFnnTAS/IKen0VstEgCbvrtF4gQZWbAV
	51yo=
X-Gm-Gg: ASbGncvp1C6X5hJxghE7CIHPwWf6NlALwTRbhdR7ULUwnFRODe0XbhKN927eV2ThvZq
	o/hOLKXT9G5aJzi71l3uFeec8j+sUDPYd75LJjiXplVrVsfrUITtga1K/wUpz9UvQ7M1pMJzIRM
	iu/FNcfJLLwtc6/kCcxnsIawaT6OSIBiradLnj2VFlTpHr6X04N2mTrAEltLVOKdowYfTSghW80
	bX3SCt264U7PFjQ3uOePz5/6JRNOmOC1OqSN/1/8WeMJIfq8mK6M3tXH1+uHFHKpOJbbKmPi7tf
	L5Kp98C4lyg2Cln1gGseJFigj+U=
X-Google-Smtp-Source: AGHT+IGzEECJy6F8mAkaV45txJ+0VCnw22UzS3dl9vUm9Pm00alGKSi+6A3G6C4Vt6iUQyWDncK5SA==
X-Received: by 2002:a05:6000:2a6:b0:38d:da11:df19 with SMTP id ffacd0b85a97d-38dea2eb362mr9256370f8f.41.1739465184594;
        Thu, 13 Feb 2025 08:46:24 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/watchdog: Identify which domain watchdog fired
Date: Thu, 13 Feb 2025 16:46:18 +0000
Message-Id: <20250213164618.38167-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
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

In XenServer's case, it's two different watchdogs for dom0, so this
printk() is the final piece of useful information out of the system
which has deemed itself to have lost connectivity.
---
 xen/common/sched/core.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d6296d99fdb9..38b20e5bbde6 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1534,12 +1534,17 @@ long vcpu_yield(void)
 
 static void cf_check domain_watchdog_timeout(void *data)
 {
-    struct domain *d = data;
+    /*
+     * The data parameter encodes the watchdog id in the low bits of
+     * the domain pointer.
+     */
+    struct domain *d = _p((unsigned long)data & PAGE_MASK);
+    unsigned int id = (unsigned long)data & ~PAGE_MASK;
 
     if ( d->is_shutting_down || d->is_dying )
         return;
 
-    printk("Watchdog timer fired for domain %u\n", d->domain_id);
+    printk("Watchdog timer %u fired for %pd\n", id, d);
     domain_shutdown(d, SHUTDOWN_watchdog);
 }
 
@@ -1593,7 +1598,17 @@ void watchdog_domain_init(struct domain *d)
     d->watchdog_inuse_map = 0;
 
     for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
-        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, d, 0);
+    {
+        void *data = d;
+
+        BUILD_BUG_ON(NR_DOMAIN_WATCHDOG_TIMERS >= PAGE_SIZE);
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
2.34.1


