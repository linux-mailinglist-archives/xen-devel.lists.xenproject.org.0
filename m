Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF93A4F99A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901877.1309876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknS-0000Wh-Rn; Wed, 05 Mar 2025 09:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901877.1309876; Wed, 05 Mar 2025 09:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknS-0000Op-Hl; Wed, 05 Mar 2025 09:12:10 +0000
Received: by outflank-mailman (input) for mailman id 901877;
 Wed, 05 Mar 2025 09:12:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknQ-0006ew-8W
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:08 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e88812e1-f9a1-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:12:05 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-30795988ebeso70454201fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:05 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:12:04 -0800 (PST)
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
X-Inumbo-ID: e88812e1-f9a1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165925; x=1741770725; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kd9A3RPHtE4WbhtZy7g4A6o5dxf1Hpbh5fmcqVM2Avc=;
        b=X0ey0JHH8QNYZUAscvqafQ9HXMVnKLqo2M/kcasVOuYQ7acU2yE2/81aarCn2gPPAH
         gfJLkKPqn4EOWG1Bu64H91ZevnlQrPkovmvrChtG7yiMzPVRiriTNWpwV10MEYQiw7Ve
         dETSkXgzgM80cFE0lUyLcAiPi28GjeDNVC4OkRrkg1sqKoSI6KmdUf9ELuhHU4spXGIB
         XJFWhG67jomZn7jKHeaxKOFzdMUUmlNPvl0WTMPGSY7gD/njwmT1/MXhrKYXHD+OiIVB
         sY5ldm7kkZ+nGoPDtWptkyH3WztpTXvER6kO5ftcf5LiEw4zGX9xOyrGAn3vrcevg93T
         FLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165925; x=1741770725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kd9A3RPHtE4WbhtZy7g4A6o5dxf1Hpbh5fmcqVM2Avc=;
        b=brWwbFnEdjgGvM2ZvDshauVsukazoe6rLd+jS/OWJw9WIDqL6/7HyfU2RsRaQPEk09
         LT7wg8ePKAMDJZbKP7cb0RPsiVvSmpvEpiS8ojS5vzGIZAMjHFQ0nM4vmLeSvwVZl7t5
         pX3xJ09jxPJGcTJr+zdZxYc7su0drPqAzDvlGGpHUOXkcHCWSa1IbG+bN8Jj30weiZSZ
         diJtV9B5TrVtSumRy5xZWNX6CuIv8Iej3Qu6w3jbGUISRRmJL4V4oF9XPlR764k+bOzG
         d8kkg0R1M1lKXgcCuCIVFUqcybo0FgXK7MVnlcB50v3/teIs2RXOMvzuMhgPIy1TZX2I
         tMLw==
X-Gm-Message-State: AOJu0YwiIxJ9OVEUpWGDciugkPoKAuobXm1bINF/9hVhaE1yN/dXcQmd
	bpaCIg0bIM6HITME18r1WyqGSTet+lKK5CsQx7cSWcBYqMMW925eJOAq8vOe
X-Gm-Gg: ASbGncvjT4kifJRjYmwEpxNXYIL3u/XHK6W6wncKw4oc97Oct8XK/n+l5We6TilFutq
	pwyqVJlMmSem7Wf5HRAJVSwWxllsP034jETUbOzyUO5RJ9zUC/9pRf2OFJ7BiN9RUkSZ1iWejGY
	pM88uc/RYmoidrhwTt4pj8LRBdFjOyGtzVYHuzi75g75tA8ErrZc+AuR/yjDntGLSL6TFtfK7MC
	L/mvkc+2qzgUpC/QizSSZ2u/y7I1zsPzmwxTfIkogztQs9QN+rf4wj9KiLPw1LlsvCQEv6ByQdY
	7EghN5l2iPnYRpAHpR4Us6oPHsmR8FmWmg9ATmxSzbtgiaGiOQ==
X-Google-Smtp-Source: AGHT+IHrsYsDR4qMXWVpxHaZu+wKGEz/PXJcy2Ue5u4oge/Kp9XG1dzWJFj7drL2FXF8JTW6lj9+WA==
X-Received: by 2002:a05:6512:3e06:b0:546:2f7a:38c4 with SMTP id 2adb3069b0e04-5497d335a4bmr910391e87.13.1741165924863;
        Wed, 05 Mar 2025 01:12:04 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Mirela Simonovic <mirela.simonovic@aggios.com>,
	Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
	Mykyta Poturai <mykyta_poturai@epam.com>
Subject: [PATCH 08/16] xen/arm: add watchdog domain suspend/resume helpers
Date: Wed,  5 Mar 2025 11:11:16 +0200
Message-ID: <15604985aae5333670467a84cccbaaa403a10000.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This patch implements suspend/resume helpers for the watchdog.
While a domain is suspended its watchdogs must be paused. Otherwise,
if the domain stays in the suspend state for a longer period of time
compared to the watchdog period, the domain would be shutdown on resume.
Proper solution to this problem is to stop (suspend) the watchdog timers
after the domain suspends and to restart (resume) the watchdog timers
before the domain resumes. The suspend/resume of watchdog timers is done
in Xen and is invisible to the guests.

Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v3:
- cover the code with CONFIG_SYSTEM_SUSPEND

Changes in v2:
- drop suspended field from timer structure
- drop the call of watchdog_domain_resume from ctxt_switch_to
---
 xen/common/sched/core.c | 39 +++++++++++++++++++++++++++++++++++++++
 xen/include/xen/sched.h |  9 +++++++++
 2 files changed, 48 insertions(+)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index b1c6b6b9fa..6c2231826a 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1605,6 +1605,45 @@ void watchdog_domain_destroy(struct domain *d)
         kill_timer(&d->watchdog_timer[i].timer);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+void watchdog_domain_suspend(struct domain *d)
+{
+    unsigned int i;
+
+    spin_lock(&d->watchdog_lock);
+
+    for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
+    {
+        if ( test_bit(i, &d->watchdog_inuse_map) )
+        {
+            stop_timer(&d->watchdog_timer[i].timer);
+        }
+    }
+
+    spin_unlock(&d->watchdog_lock);
+}
+
+void watchdog_domain_resume(struct domain *d)
+{
+    unsigned int i;
+
+    spin_lock(&d->watchdog_lock);
+
+    for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
+    {
+        if ( test_bit(i, &d->watchdog_inuse_map) )
+        {
+            set_timer(&d->watchdog_timer[i].timer,
+                      NOW() + SECONDS(d->watchdog_timer[i].timeout));
+        }
+    }
+
+    spin_unlock(&d->watchdog_lock);
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Pin a vcpu temporarily to a specific CPU (or restore old pinning state if
  * cpu is NR_CPUS).
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index d0d10612ce..caab4aad93 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1109,6 +1109,15 @@ void scheduler_disable(void);
 void watchdog_domain_init(struct domain *d);
 void watchdog_domain_destroy(struct domain *d);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+/*
+ * Suspend/resume watchdogs of domain (while the domain is suspended its
+ * watchdogs should be on pause)
+ */
+void watchdog_domain_suspend(struct domain *d);
+void watchdog_domain_resume(struct domain *d);
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Use this check when the following are both true:
  *  - Using this feature or interface requires full access to the hardware
-- 
2.43.0


