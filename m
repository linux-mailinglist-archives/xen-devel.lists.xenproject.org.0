Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +UrzAqiCMmrY1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:19:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5A7698F7B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:19:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mXNqIleS;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340112.1601243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoIC-0007N7-J6; Wed, 17 Jun 2026 11:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340112.1601243; Wed, 17 Jun 2026 11:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoIA-00077F-Vr; Wed, 17 Jun 2026 11:18:47 +0000
Received: by outflank-mailman (input) for mailman id 1340112;
 Wed, 17 Jun 2026 11:18:25 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHo-0003wP-Ng
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHo-003J0D-36
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:24 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328276-bab6-0a2a0a5309dd-0a2a4507dd54-20
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:24 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32827f-229c-0a2a45070019-d1558036a586-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:24 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-492329c5514so3895045e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:24 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:23 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695103; x=1782299903; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2FIk6pMeqEKkA+0YYHQME+TSQ8sYaHR2h365DGY4sbA=;
        b=mXNqIleSA6uri73ySrWuyZsjgeNjpklY8r9Oi7WP9JvZJwTohJg9cASSX6fgAGZLZq
         4yGsHN/QbDlyCafcWn5C3pMJricaYQj8kbjdZEk/4P0Hjnz3QlMCtxTa2KXA3A/dUVVw
         yG1DxoKEFs5vFSfv9VCy6t30zNA3HPN6H1tbP0By96PHyRlM+gSX+YwKnmkpoQxQjkk3
         uOubLvBzR9Ya24XGmuDJu3Vs3CvFbg2izE4lql+mvU3190lKBoBtDTz38BRh7Pl0gu+9
         ZeMLd3Ec4PfWnPsOJvJRWLB5A8QD/oNPQmr2iy15r/TRdD9aB8l2m7AlTTmynW5XjpZ3
         UI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695103; x=1782299903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2FIk6pMeqEKkA+0YYHQME+TSQ8sYaHR2h365DGY4sbA=;
        b=sjQzB52X2wtSitjHhy6lkufYqq/DEZWDogwYCxNB0kfWMKlZy8+TMRBpBV0rPmjeVz
         8tC+PyNsxH57bU6Ds+BFC7oiM6iCrcqnMGOCrcyfHhlKf7DgwZmnXHf7edT/GshyBRh3
         SWDal1vUjrjWomDVYcURJpPPedF4Ps00Kim3UbOCoKianifT/9ujOuN0E1p7Ryan5kt/
         YQQOHhdz5QEV9jHmb0865oUT5CUa5wauYUohscibSWdEKiDewv3fUgwvih+103BAIy61
         WewVXgrAlwQKKYtfGufjROHD+VBjv0+EAR3dxAK7L+Fwwd1JgfxZti2ApBCTkbqHWGPY
         QOLQ==
X-Gm-Message-State: AOJu0YzIQHc/Zr5CzvTQ7W3aBOuX+CbN242joTrpZ4lAatmqwX7c6Org
	LOvr3veGnd5i7VXNrotzLnR6JGHntA4oXs/1uONHHnBe3VranZc6kHmc+a/mnw==
X-Gm-Gg: Acq92OEhSG5xmRf4Y9XyAmCRs68ohKdUYlruLD0TxuBWza8syit/A2K3h47utFJZh6Z
	YBefk/hQCVqT7dWrJkkWl1Lu2WBmcq0yvu9YQaupI0X79tlmdSS2tm5OAokmbZsPpxqrE58MINd
	Ir3ozrYAYxrK/tsudxwTvnIPj4UqwXt6MG0JV35ib+7UyyCpxm29hc3rJPON9Dr5XtkWUYaN356
	pNQUaHWelysd4kVc3+B0g+eiHH8Tr+fzuKeb1eO69H35eol5I9HkhR81ep4Hz2cYoodYgqm0OYh
	Sb6wh4e1TG9tUfhPzZDxKIgT2y+6Uwk+p54sMKAJo3D0uCRI1BGQSxPxU2/IkdMKyapuVIdrzdc
	lV/KrpCV2p6WNqXoCo/V4TW41tMn3Qt+8G/6I7z2x4ULRx6nninQviokqdO6dQzh95gI6DlMoq8
	hjA1Wdhbni/mjjGyd/V3vsoHrr8THvZYz25TT4qyYZhBqR7tZr+yQe+QiKHQ==
X-Received: by 2002:a05:600c:8285:b0:490:4b89:5372 with SMTP id 5b1f17b1804b1-492357da8b7mr16402825e9.11.1781695103242;
        Wed, 17 Jun 2026 04:18:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
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
Subject: [PATCH v3 20/23] xen/riscv: initialize RCU, scheduler, and system domains in start_xen()
Date: Wed, 17 Jun 2026 13:17:48 +0200
Message-ID: <7a236aae14c6685f8104f0d4f80a1b34c9be19b0.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1781695104-0A772C48-D67FB8A8/10/73395122804
X-purgate-type: spam
X-purgate-size: 1503
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
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: CA5A7698F7B

Wire up the missing early-boot initialization steps in start_xen().

The scheduler must be initialized prior to do_initcalls() because
cpupool_create_pool() is called during initcalls; without it,
BUG_ON(IS_ERR(pool)) is triggered inside cpupool_create_pool().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


