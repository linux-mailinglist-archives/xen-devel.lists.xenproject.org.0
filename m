Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jDT7JpmCMmrH1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A32698F4A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bQSaHdgK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340094.1601183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHr-00041r-1Z; Wed, 17 Jun 2026 11:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340094.1601183; Wed, 17 Jun 2026 11:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoHp-0003rD-3p; Wed, 17 Jun 2026 11:18:25 +0000
Received: by outflank-mailman (input) for mailman id 1340094;
 Wed, 17 Jun 2026 11:18:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHe-0002dE-Nm
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHd-008nTo-3B
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328270-bab6-0a2a0a5309dd-0a2a4504bf4a-30
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:13 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328274-1dec-0a2a45040019-d155802dc8b4-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:13 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so40645345e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:13 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695092; x=1782299892; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTR+5Hn5G7Lu4nePlK2+AFvBwLwdKYyMSMvXluDf1/8=;
        b=bQSaHdgKcrzLKVK0C0VWyEyjZv+I0kRZ1+jrpXCk2UBzFUbIJCUfXaaJbHO8LBJAbV
         XoMhnZbyKNV0oZ7GB70rn8m96xp7lvHW2BYPg6huZizzpycC3JE1gN04sVl6/YeYYL84
         Fs5PaZMg8ZX+pqVh2CWISBtfzStn5xPnNANU21tSxMt0jXUSC1eAY+X9bWQi4PdiLWOM
         dgEjGcxo7Zf6dkaQWP38bJqB4GXsJRBRes9vqzmH9doxyTIXucd6Bk4b7AGVioptEzNb
         rLEgcvnJoRZNfRcBYy2BN2onRFswqXOZGC1wUGZ7hmsLOdaXhlSNXAhGicGehs2LSOdR
         GkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695092; x=1782299892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JTR+5Hn5G7Lu4nePlK2+AFvBwLwdKYyMSMvXluDf1/8=;
        b=aG91UmCLZx4p7djk5XOV7JXgDbubWf4N4uPwp0DrUnEKg3Y4F9c0CXSosCdX81uF/+
         W0+dkMkKykGpA6cVj2acBpa0GZxL99+KCoscMEWxMaYRKE0oHiSfYmnduIN3nNh0iZMN
         CFLm9p2kndkKvaql5Wk8BF3sLEDezloMR27ttCaIRRmgWnQS5fvgXuifms9MSUmTd/Xu
         Gt91m7oJ5+OBliC4OM2SvaZrO9bJO5qm3rmmTRvav74E/HSg/YWLGZOWKNO7V6Sg4nxi
         Z9QK7so0VBDJskaMl8XQutdfWPCqRdIrEvfin9U2Vv8pNQAOuhoTWph322JFpf0uZG5R
         tFBA==
X-Gm-Message-State: AOJu0Yz5+Lg/o/5wHYqxwcvkytfNBEcMiBq45dFyb3csTpdq6h4expNk
	0FOfb11sJ1NdY2/bHj0do6rlgWMMk17ZkmtDvS9uRDPvIz10inAXe0VNmlUyIw==
X-Gm-Gg: Acq92OG+Iqt5FZgIhtMN+LwmzqiyWW0luYTOQn16OJ4hrn9S9gb6tBlJD6nXvmR2dPh
	Pax8dvmEr7kbF1dKrSnIR+GvrDAr0LOYtDHSPrGV8VC6j9scLgSkOmJ7TordiQFROG1ClKxQvVh
	MVZ2Xf58h6xcsXGajY9OQ60svDfwBQEp/yNNDF5h6sHFnHiYiI1gadhUlid4C8xjgvQjWFeyrEc
	RXPIYgvKlV8LZXWrxNWCfSfoZu6BtkUEIbmipOW9qO8yuvK0NwMu02vJ2qbtmqGOgWm5az2iQJ+
	iD8e1duPq34P5kgTHQ0YErL9J3YAleTREz1NhiFyCzm9s188j5dMOvrmRoZM6rhWaMc2b9Kfhx/
	IMUWugYDIICyPLRBt7cosJ/KuNzbg35z2pZ+yAkScyfX3MvRG/rshHYIhoabz4vROACvE6mh0K0
	pELlBxncAPocx2dhkZVoSyIWS5fm4NXhmKP9A3Og0VJhKJlpzF9rTRdJYPmA==
X-Received: by 2002:a05:600c:828e:b0:490:c024:2ec8 with SMTP id 5b1f17b1804b1-49233356d67mr63644725e9.0.1781695092263;
        Wed, 17 Jun 2026 04:18:12 -0700 (PDT)
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
Subject: [PATCH v3 11/23] xen/riscv: implement make_intc_domU_node()
Date: Wed, 17 Jun 2026 13:17:39 +0200
Message-ID: <7b40037c2d0cce84f9e65d7c4a58ec773f7e49d0.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1781695093-2A37F3FF-EF9655EB/10/73395122804
X-purgate-type: spam
X-purgate-size: 3376
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 39A32698F4A

Introduce a RISC-V specific function to create an interrupt controller
Device Tree node for DomU domains during dom0less build.

Add make_intc_domU_node() to the dom0less build path and wire it to
a new generic helper, intc_make_domu_dt_node(), which delegates DT
node creation to the active interrupt controller implementation via
vintc_init_ops.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/intc.h   | 12 ++++++++++--
 xen/arch/riscv/intc.c               |  8 ++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index 459896c04b41..8e597e231ee7 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -98,6 +98,8 @@ struct arch_domain {
 
     DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
     char *isa_str;
+
+    struct vintc *vintc;
 };
 
 #include <xen/sched.h>
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 3d84fcc51d1a..9b701445179f 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -8,14 +8,13 @@
 #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
 #define ASM__RISCV__INTERRUPT_CONTOLLER_H
 
-struct dt_device_node;
-
 enum intc_version {
     INTC_APLIC,
 };
 
 struct cpu_user_regs;
 struct irq_desc;
+struct kernel_info;
 
 struct intc_info {
     enum intc_version hw_version;
@@ -47,6 +46,15 @@ struct intc_hw_init_ops {
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
index 3600d23bdb5b..31e08e3a1b65 100644
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
+    struct vintc *vintc = kinfo->bd.d->arch.vintc;
+
+    return vintc->init_ops->make_domu_dt_node(kinfo);
+}
-- 
2.54.0


