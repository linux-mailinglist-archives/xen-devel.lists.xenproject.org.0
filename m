Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y+MCBbnQS2opawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9522712ED8
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=O7xUXLmd;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355511.1610386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliT-0001sP-Qq; Mon, 06 Jul 2026 15:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355511.1610386; Mon, 06 Jul 2026 15:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliT-0001kD-BV; Mon, 06 Jul 2026 15:58:41 +0000
Received: by outflank-mailman (input) for mailman id 1355511;
 Mon, 06 Jul 2026 15:58:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliR-0001Kf-50
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliQ-003COz-IH
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0ae-2eae-0a2a0a5409dd-0a2a4501d5ae-0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:38 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0ae-400f-0a2a45010019-d1558031ace5-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:38 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493b6f1b14bso12910525e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:38 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:37 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353518; x=1783958318; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/ZtxrvuTd4UkEQ4i2TfmlJT/OYOaHL0n4xPwr38eXk=;
        b=O7xUXLmdEFb2iG0NZzUNX/7tcnd9rBHg3OfF3uS2ah1HiMMUZJk5adcWywRlYQRxpl
         /YNcEhj/+U3cd6LpLt4GOfA7NpHq1HHVrtRTJYZI7GEDcnExh3G8eQ6hOfy99x1FiBGT
         Gq+0XVG4u2DBYiOxCcmb0Qk3RrZVjXJJugMfrlhD4lRGYmyitSullRh9enY38pX3xPXf
         IMs8+qLA5cYauqpjub4q6ieVaUy7qCApwC0R9faHEaG1M5tktCZ1sAHLq/0BqgtfA+MB
         CJueG2a2XSDiPC/j3/WxJqIr+BkBBqCLIttSOVb0y26mkNyjvaKNCGNLeZVpgxEGSBbf
         Z8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353518; x=1783958318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A/ZtxrvuTd4UkEQ4i2TfmlJT/OYOaHL0n4xPwr38eXk=;
        b=kUpkabMgxHYp3UPZJeggzWire7uZoXJmTS5BW7mE4/1l3WF+k2FbsLY23r1jvp+Z3Q
         SV8bbpavhmIDWZCPHJUvtmQgkq9hl1XBQADhySb5CNyf9bN26kXNCGUIF+ydv7rBzHpn
         QnLh+a932BoHA/n9kDrG6T5YPSZ2eHgc8gQBzT+bZxms0CA5yeH7o60yuqt6fx5btaDJ
         ujItJeM1Ws/zD8RWqhDpkq6fJQwjFUz+AnosdJtv3SQalJJXjalQmDj7e7ztbpOMzBmA
         2MFdtAoVtIyVAXngCGMj08P5ultmlbP/169EgI+ypfjl+Njw9taZ80MwUnuYykGdrh/1
         ewAg==
X-Gm-Message-State: AOJu0Yx+KTtavx4mQQU4SEWlkyKFeW57U9aodgo/5zRQdj4EQcdSZ57l
	zxbP+YA2Zgw8HdwvoyG62Hn1G/MOk7NoWsr2N37X9mvPPT/52/bBWA0x62wE+w==
X-Gm-Gg: AfdE7cl3tEeCrde5gK9jVGmAtZVF2U5Ip0K3plgZCOuEwtJOMN0FXKilLUeX56W0xUJ
	vg31B7Ea5AxUAS9xrFrGLTM83HaPDB1Oo/VZMn516i8Q+Pxfd0F+BLUrFx/QISeQUFgJLu1/caR
	QRSCTp110nhxFAqAjEs3pADJCwMumw0VXPffUKH2+rUNgziQ0jHZnKQozalMEMY89eNm5dOOd12
	9z9cQXlns7W6EZqN+NbStd+3812Ngt/ZwdpA/nJoabCpCk5psj5/SUgfkHA+lF+yF2MA1sxJNEf
	vFUJ4IelERluUBz7RqVTGYc/21nucreQFKTlzhTps9r8uXKVzehFwoi3fcypbJ33MDiKCUY7L/1
	2qhnrcCupgj5xN68h8RBkk0U7sibuRKNtu9NvmM0UjUoZXu0OnxT8twvG5E7idqHOcPuZr7tSuN
	ubnO9ARfVS578L1ju/gnnscswJUY59dtFoD+3AFgWZvK/wUZ1sUfbPAplgYzryjhzh90lO
X-Received: by 2002:a05:600c:820f:b0:493:aa28:38ad with SMTP id 5b1f17b1804b1-493df06a2d2mr13017205e9.10.1783353517711;
        Mon, 06 Jul 2026 08:58:37 -0700 (PDT)
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
Subject: [PATCH v5 14/26] xen/riscv: implement make_intc_domU_node()
Date: Mon,  6 Jul 2026 17:57:55 +0200
Message-ID: <b9ceb87a7160b75538e1887f1457d6852fea619a.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1783353518-822DD1E0-05FB12CC/10/73395122804
X-purgate-type: spam
X-purgate-size: 3451
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
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
X-Rspamd-Queue-Id: A9522712ED8

Introduce a RISC-V specific function to create an interrupt controller
Device Tree node for DomU domains during dom0less build.

Add make_intc_domU_node() to the dom0less build path and wire it to
a new generic helper, intc_make_domu_dt_node(), which delegates DT
node creation to the active interrupt controller implementation via
vintc_init_ops.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - Nothing changed. Onlye rebase.
---
Change in v4:
 - Made local variable vintc pointer-to-const.
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v3:
 - Use const struct vintc_init_ops *init_ops in struct vintc.
 - Drop redundant intc_hw_ops check in make_intc_domU_node().
 - Drop NULL pointer checks in make_intc_domU_node() as we can't start domU
   without properly created interrupt contoller node.
---
Changes in v2:
 - s/intc_make_domu_dt_node/make_intc_domU_node.
 - introduce separate intc_hw_init_ops structure for init operations.
 - Return -EOPNOTSUPP instead of -ENOSYS.
 - Drop const for kinfo argument as it could be changed by interrupt
   controller node creation code.
 - Refactor make_domu_dt_node().
 - Make make_domu_dt_node part of vintc structure as it looks more logical to be
   there.
---
---
 xen/arch/riscv/include/asm/domain.h |  2 ++
 xen/arch/riscv/include/asm/intc.h   | 10 ++++++++++
 xen/arch/riscv/intc.c               |  8 ++++++++
 3 files changed, 20 insertions(+)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 235b20f8a6ba..bdc6086a1752 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -97,6 +97,8 @@ struct arch_domain {
     struct paging_domain paging;
 
     DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+
+    struct vintc *vintc;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index d7b34fc15ad1..a4e678fad90b 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -16,6 +16,7 @@ enum intc_variant {
 
 struct cpu_user_regs;
 struct irq_desc;
+struct kernel_info;
 
 struct intc_info {
     enum intc_variant hw_variant;
@@ -47,6 +48,15 @@ struct intc_hw_init_ops {
     int (*init)(void);
 };
 
+struct vintc_init_ops {
+    /* Create interrupt controller node for domain */
+    int (*make_domu_dt_node)(struct kernel_info *kinfo);
+};
+
+struct vintc {
+    const struct vintc_init_ops *init_ops;
+};
+
 void intc_preinit(void);
 
 void register_intc_ops(const struct intc_hw_init_ops *init_ops);
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 3600d23bdb5b..e63da5e22efc 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -3,6 +3,7 @@
 #include <xen/acpi.h>
 #include <xen/bug.h>
 #include <xen/device_tree.h>
+#include <xen/fdt-kernel.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
@@ -72,3 +73,10 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
     intc_set_irq_type(desc, desc->arch.type);
     intc_set_irq_priority(desc, priority);
 }
+
+int __init make_intc_domU_node(struct kernel_info *kinfo)
+{
+    const struct vintc *vintc = kinfo->bd.d->arch.vintc;
+
+    return vintc->init_ops->make_domu_dt_node(kinfo);
+}
-- 
2.54.0


