Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dRitBBSfPmohJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 030876CEA73
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Tljjas2u;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346315.1604908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8m3-0007Ek-O9; Fri, 26 Jun 2026 15:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346315.1604908; Fri, 26 Jun 2026 15:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8m2-0006vH-7H; Fri, 26 Jun 2026 15:47:22 +0000
Received: by outflank-mailman (input) for mailman id 1346315;
 Fri, 26 Jun 2026 15:47:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8lr-0004ra-Hc
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:47:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lq-008hTo-SI
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:47:10 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9eed-2eae-0a2a0a5409dd-0a2a4504e35c-38
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:10 +0200
Received: from [209.85.167.52] (helo=mail-lf1-f52.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9efc-a01d-0a2a45040019-d155a734a43b-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:08 +0200
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5aea1f4dc7fso1077205e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:47:08 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:47:07 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782488828; x=1783093628; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+nhDaDUJkCW0waY+Zvj1Fm8pm8i//taC/XFR+qPzKk=;
        b=Tljjas2u/Tw+NXK7EKfGLuDIVxm2fBdJSTXze1DwjP0nHErpof1Moy4IvOw6vd6SiN
         QWGoQ9ilD+yn1jg16fdxCiWr7AeR90f2WFjcO90URuPKpaBVALO+b7gx4ZijP2baxrGf
         3ktycjDVUTlJfV20xQv7aLBwQ8k6Z3R5CU1/mfByuUX/g7P+JnQBJRq84tueQa9brQ/5
         InHdOqTATkvjaNWMLFryNfF5uRn0kaLvRWPw/cKc8dSyqjxUauM0DsvnfxV6UQYXfYV4
         VEROcOhCSES70V2hPdMtbh9jK5JZs0hO88E++o5OL/zkvgv6wZTSkB9cRorLh7TnUI7m
         lICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488828; x=1783093628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q+nhDaDUJkCW0waY+Zvj1Fm8pm8i//taC/XFR+qPzKk=;
        b=CuFksLNGor2KCvfoX4/beHh15Z+rW3vtY8pUzl3Ps+mUFQKzpCIHnBlC2RLJb4Dy82
         Dh1Rt299ITO324Zo5MyQoLXxMrf7cd0zx8MJRw+wBqW3YgcXBpo+ZGidbmDyWuB7oesw
         jI03RBXVDvYkYwc08WmbmzOn/dM29cQefO62Fisy+nRCkzSvEX69Yg7eVAfnLgH+wa24
         OwD0KdzC8hSZvLYKSy+GXevuUEPo9QOQHKpiPXVkhNPsTrzmXJDeOw0yw2pyU4RFTWBG
         jY7mVZ8pw3+do6NpqHpuL1NNDc8kKNXNvb4yTU+oB07F5J18xMZbs7FjEVNo6W0pgtQx
         vSGQ==
X-Gm-Message-State: AOJu0Ywwo5qg9n2Ga2BhjPcfOe0BMjqN/5xAgzuIw/FkCAs+8epncVjR
	k5pDnCL3JfXTITwiQ6jwAtxFPJqjKyZ0TILDK62k/B7Fr6iheyjycfKyDZ7nuQ==
X-Gm-Gg: AfdE7cka8PO6vhq+mlaMcAMFfQgXNEAznimQZRNRBPrSUVrbmwfP/Vem48a/UUMlFvC
	VGd1l67izE2Dso5mG5tyy1js5X+C4kTam0EIICMwepkmd/D9MAztgFOq82p0pzOwG3Fh0QnHfgQ
	57yXGqLbJyA6L+kHIc3V+6eDznWQseTQWhnlWOZuD1eVd8D81hnINBhjrBVRaJHF1Dy/Hm8/2D4
	ZFysI2/+nQrzGX345vF6yB0wDh3BBTbSw5tLn4MzrnJH6a5i6ayfKoc5ofEYz9AT1afDoM4/rYJ
	A0ZFncnPXkrPv7esKx4Ri9yJlC9WkQg+z7IOA0S7yvTkYDPaAQUWMWwYz9cu8RzwLGhsWLaE2dR
	p7hZcNUyS4fx9DDrk9BYUvwgICD2ylq1MZoNO1ybH8AcGEyTPTeHz49Akt4C3tJSO1n6+QtxthS
	USSkLT1j6pT2KZke0ix1Z6nBGj1g76MeWz+Fqv2yWSr/fzZkGZClAyZuJqODPe4lnME2SV
X-Received: by 2002:a05:6512:2251:b0:5aa:65a3:468c with SMTP id 2adb3069b0e04-5aea1e246f6mr2021690e87.7.1782488828078;
        Fri, 26 Jun 2026 08:47:08 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 23/25] xen/riscv: initialize RCU, scheduler, and system domains in start_xen()
Date: Fri, 26 Jun 2026 17:46:32 +0200
Message-ID: <b1b73269c314940b959043dffd2183c180208035.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1782488828-AF32F1CC-AC15FB50/10/73395122804
X-purgate-type: spam
X-purgate-size: 1558
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 030876CEA73

Wire up the missing early-boot initialization steps in start_xen().

The scheduler must be initialized prior to do_initcalls() because
cpupool_create_pool() is called during initcalls; without it,
BUG_ON(IS_ERR(pool)) is triggered inside cpupool_create_pool().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - Nothing changed. Only rebase.
---
Changes in v3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v2:
 - New patch. Several patches were folded into one.
---
---
 xen/arch/riscv/setup.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 56a0907a855f..c3e98733ebc3 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -6,9 +6,12 @@
 #include <xen/compile.h>
 #include <xen/console.h>
 #include <xen/device_tree.h>
+#include <xen/domain.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/mm.h>
+#include <xen/rcupdate.h>
+#include <xen/sched.h>
 #include <xen/serial.h>
 #include <xen/shutdown.h>
 #include <xen/smp.h>
@@ -156,12 +159,21 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     timer_init();
 
+    rcu_init();
+
+    setup_system_domains();
+
     local_irq_enable();
 
     console_init_postirq();
 
     guest_mm_init();
 
+    scheduler_init();
+    set_current(idle_vcpu[0]);
+
+    do_initcalls();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.54.0


