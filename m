Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A0A4F994
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901868.1309817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknJ-0007Gy-EI; Wed, 05 Mar 2025 09:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901868.1309817; Wed, 05 Mar 2025 09:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknJ-0007A6-AW; Wed, 05 Mar 2025 09:12:01 +0000
Received: by outflank-mailman (input) for mailman id 901868;
 Wed, 05 Mar 2025 09:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknH-0006ev-Td
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:11:59 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e49dcbe1-f9a1-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:11:59 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-548430564d9so6960513e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:11:59 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.11.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:11:58 -0800 (PST)
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
X-Inumbo-ID: e49dcbe1-f9a1-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165919; x=1741770719; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0i36R5cWws/2lOrIDQReaU+v/4wYZErXE99/wpMnig=;
        b=c3BEZCxglptYUUQL7OUVEVI3kHQzI7rkVLm2w1Z/4RftqeeGgiINYYvcjdMthQLqcL
         jPoCSoFstRKWIVHmGgv6aRqX7PGbiX8o9YY3YDkpwT72rIO9Oq6BOfQ9WhG8N0CwWKGs
         sD7ZqEA9A1/Eq5EvetUww+lf8tKzemCm9Gj8uxi7LlqXGrl8Z6A/k70J6Bmp5bWuEG6m
         Xv2SmtUn9JldglUnTrPu41ZZGZG5psEQ3G/eWwA/lJq3MxsPnlEP9YZNSmCcnfupp7NG
         FFmauiNHfeFvCGM+/mfWOQFNKmLdj1TgctWw0cMLfeU/IIznMd9M2C+Yo0L7ze35sjm9
         O2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165919; x=1741770719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0i36R5cWws/2lOrIDQReaU+v/4wYZErXE99/wpMnig=;
        b=d+XTLcv0kPOCIxrvIzk1AyDD9SaG7kBLDCb+Ombk1KiQ6BJ0D8gPar4URPgmDdTffV
         +kakfZje9pHRazDd2PHVtL5EC7lfzx0ABiE7llY9TJycemFEwR9hTeqQQRoqbQXPFGYt
         UJqG3f1olSTzUouyYJK7jhWunz3Ynl+LDe5lUIcN80kEC6vDp+XnRSkf9Y3tyrKGAI9D
         OHZZqKdZMr6khjvffvxedUpk+Cn0VK+BUQylH8ZKA3mlFqEuTuPfKqK8UAU5nwwjSEs0
         M+p/dX+lZ8Tzrf9oAIwNRXogRNpxNgP8VI72rvrJpmycCztQxtM4oiJmQcz66OVxd6Y/
         jMCw==
X-Gm-Message-State: AOJu0Yxs7QFDlECQKdO87H/nPSs1SZ21+D+17MGz37qJTioytoyMK6o5
	Skwws9Xo4W6UNa/iNBgC3R+mGiaGzP7dwdKFVSRQwU6occHIRx2dO/yj8E7H
X-Gm-Gg: ASbGncuQTeGfbVrF0V0U5dQy43Y71o5z9r5iXbKOfpwmPxhyZ9QZEiTWfDRwr01Fllo
	g66OPoN+iuiK8hVUX8KZtGElYzBzCRWC+mL0bNdRZM1qQk9rgYGw8NaQ6SPvi2TlZ6F9UsW7sB1
	eLotp7Ce8RF+UnADeqb/JGU/GMeu4Vm0K2OVOT+s+thukwUz4peYVggfEEJ6EHp2qmaC9WZfsz1
	ZjMgSIxdy/araj6oQQl6bfw3C3vc7zZ+bi0C925DYOc3unQ9hrJXASlW/6wKnCEiQqbdN/aBPm7
	0wF6mBjurC5+BuJXwlQlICjgqlFIvwiB8JljB058a72AF529qQ==
X-Google-Smtp-Source: AGHT+IExoH/RJzkC8dxnobznYYQVv0p6BHKawuJcd+lkQWm/DcNhF5mR3Pb2XpOal6svcBwUD15cDw==
X-Received: by 2002:a05:6512:3984:b0:545:2300:924d with SMTP id 2adb3069b0e04-5497d336c84mr720527e87.22.1741165918440;
        Wed, 05 Mar 2025 01:11:58 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Mykyta Poturai <mykyta_poturai@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH 03/16] xen/arm: introduce a separate struct for watchdog timers
Date: Wed,  5 Mar 2025 11:11:11 +0200
Message-ID: <18a8a86ca0c1b884278d635fb18b3b53e062f10e.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mirela Simonovic <mirela.simonovic@aggios.com>

Introduce a separate struct for watchdog timers. It is needed to properly
implement the suspend/resume actions for the watchdog timers. To be able
to restart watchdog timer after suspend we need to remember their
frequency somewhere. To not bloat the struct timer a new struct
watchdog_timer is introduced, containing the original timer and the last
set timeout.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
This commit was introduced in patch series V2.
---
 xen/common/keyhandler.c    |  2 +-
 xen/common/sched/core.c    | 11 ++++++-----
 xen/include/xen/sched.h    |  3 ++-
 xen/include/xen/watchdog.h |  6 ++++++
 4 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 0bb842ec00..caf614c0c2 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -305,7 +305,7 @@ static void cf_check dump_domains(unsigned char key)
         for ( i = 0 ; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
             if ( test_bit(i, &d->watchdog_inuse_map) )
                 printk("    watchdog %d expires in %d seconds\n",
-                       i, (u32)((d->watchdog_timer[i].expires - NOW()) >> 30));
+                       i, (u32)((d->watchdog_timer[i].timer.expires - NOW()) >> 30));
 
         arch_dump_domain_info(d);
 
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d6296d99fd..b1c6b6b9fa 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1556,7 +1556,8 @@ static long domain_watchdog(struct domain *d, uint32_t id, uint32_t timeout)
         {
             if ( test_and_set_bit(id, &d->watchdog_inuse_map) )
                 continue;
-            set_timer(&d->watchdog_timer[id], NOW() + SECONDS(timeout));
+            d->watchdog_timer[id].timeout = timeout;
+            set_timer(&d->watchdog_timer[id].timer, NOW() + SECONDS(timeout));
             break;
         }
         spin_unlock(&d->watchdog_lock);
@@ -1572,12 +1573,12 @@ static long domain_watchdog(struct domain *d, uint32_t id, uint32_t timeout)
 
     if ( timeout == 0 )
     {
-        stop_timer(&d->watchdog_timer[id]);
+        stop_timer(&d->watchdog_timer[id].timer);
         clear_bit(id, &d->watchdog_inuse_map);
     }
     else
     {
-        set_timer(&d->watchdog_timer[id], NOW() + SECONDS(timeout));
+        set_timer(&d->watchdog_timer[id].timer, NOW() + SECONDS(timeout));
     }
 
     spin_unlock(&d->watchdog_lock);
@@ -1593,7 +1594,7 @@ void watchdog_domain_init(struct domain *d)
     d->watchdog_inuse_map = 0;
 
     for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
-        init_timer(&d->watchdog_timer[i], domain_watchdog_timeout, d, 0);
+        init_timer(&d->watchdog_timer[i].timer, domain_watchdog_timeout, d, 0);
 }
 
 void watchdog_domain_destroy(struct domain *d)
@@ -1601,7 +1602,7 @@ void watchdog_domain_destroy(struct domain *d)
     unsigned int i;
 
     for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
-        kill_timer(&d->watchdog_timer[i]);
+        kill_timer(&d->watchdog_timer[i].timer);
 }
 
 /*
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 177784e6da..d0d10612ce 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -24,6 +24,7 @@
 #include <asm/current.h>
 #include <xen/vpci.h>
 #include <xen/wait.h>
+#include <xen/watchdog.h>
 #include <public/xen.h>
 #include <public/domctl.h>
 #include <public/sysctl.h>
@@ -569,7 +570,7 @@ struct domain
 #define NR_DOMAIN_WATCHDOG_TIMERS 2
     spinlock_t watchdog_lock;
     uint32_t watchdog_inuse_map;
-    struct timer watchdog_timer[NR_DOMAIN_WATCHDOG_TIMERS];
+    struct watchdog_timer watchdog_timer[NR_DOMAIN_WATCHDOG_TIMERS];
 
     struct rcu_head rcu;
 
diff --git a/xen/include/xen/watchdog.h b/xen/include/xen/watchdog.h
index 4c2840bd91..2b7169632d 100644
--- a/xen/include/xen/watchdog.h
+++ b/xen/include/xen/watchdog.h
@@ -8,6 +8,12 @@
 #define __XEN_WATCHDOG_H__
 
 #include <xen/types.h>
+#include <xen/timer.h>
+
+struct watchdog_timer {
+    struct timer timer;
+    uint32_t timeout;
+};
 
 #ifdef CONFIG_WATCHDOG
 
-- 
2.43.0


