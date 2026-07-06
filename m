Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XpxVJMDQS2ouawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42127712EEB
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="qYYE/0NX";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355531.1610416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglia-0003FR-Nv; Mon, 06 Jul 2026 15:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355531.1610416; Mon, 06 Jul 2026 15:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliZ-0002vw-Lk; Mon, 06 Jul 2026 15:58:47 +0000
Received: by outflank-mailman (input) for mailman id 1355531;
 Mon, 06 Jul 2026 15:58:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliV-0002PW-V9
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliV-003COz-B3
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:43 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0ae-2eae-0a2a0a5409dd-0a2a4501d5ae-16
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:43 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0b3-400f-0a2a45010019-d1558034c806-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:43 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493c19bad03so29975475e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:43 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353523; x=1783958323; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjcS/Avaf1GsgDFyaOfVm5ygdYGJU0669pyToitaIko=;
        b=qYYE/0NXEhGTHJef9K/oCbSB7UBOEnIQI1JM/Rg3sCOE/Wl2fpk0zR38OWBarXa7v4
         Nq1mPCukH6f2EbyPAQg/w7AHrIWpFLtLvlnpX+icARgfYcw/rc1R96/NGw+m1gIoeEvW
         AgQ3GZRKQ4e93AwRUbjINcVI1EtKeU7vECNw39Y4NidAGsV5/zwDIkyUE0CYottXyvaz
         7V98jlRsQhKGVNwo599nVYmYYACFvz8tl8k6rfWQry5uNtqcQNrVrmJBoVThIxzcBmiR
         TWm+kwyKKSueEjJiZ7KZryLHT1/PrDoESKcTgQFM8pQbV11t+sqtl8YwK+35vETnVUUx
         Lf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353523; x=1783958323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IjcS/Avaf1GsgDFyaOfVm5ygdYGJU0669pyToitaIko=;
        b=H6iW9DE1u8wi1Qcb5jJi8ZZPlbybM3rUUTu55WCjypiqCxDpRBBn0/cdKh9Qa9DFsk
         K/2ylsDYcDcDQXDdEvZfWRw/Dkqa0A4nGPSWFVhR/Xsw1S63XtnSkp3oLzwWZ+sVZ7Ly
         ZAvpAGfzUuWS9YjkNToC+aGW9eErgV52IU746FZeUKyePy16CpcgJfr65T5RCoOvWVgV
         RWa6NHKWqCND5f86QuP7rCT8eSXQFiuv+Af2sYwEk+DGQw8aD612dkr1UxLz81+Hbt0+
         w/mVyHcs5QwSrezV0HG/8176t/wqpNFGn/nRdzOSh1EtL+0bbm2l57DLvMgIAPpPCQi5
         bICw==
X-Gm-Message-State: AOJu0Ywt0oRmJUM5cNsS/l1aWUT5cuJMNH3cHkiE3G8Kv1Y+S/GDz/nr
	lrvU/zkMzG5upn2eboB5Y7tbsW4bEIVXJiJ+9TpUb1gjCiV1I+3qUhx8xolgjA==
X-Gm-Gg: AfdE7clPt/SYjzR/Ax8SVGVSQtq5dsqAGt5LvAx6Qnz/s7kW8d0Kdby45FarqJZjzC2
	GV6SmXsVYGrGKNiunzc2hQZycSrvJi/2h+vXPHy46DwwFvxENeXfzBaAHNuPhFXMwRa0PT+cncR
	finMOAU8TDb61sYJOmF5VmaELAnIxrYx4FU9D3t+f5UG0rViOm+gn4o7u+rkhKfX86yn3dQcdsf
	XfJhvH9O1jjGhL0tXXSisO3GLR12b4aT//N2fp1kkUDO7DJzFa9RQFP3zdDqvyy0Tw/rue4wjiY
	/oOre0rkvZ6EYBbbQ7WpaLjf/2FX+XlE1xGKojp1duY3f/ejsSrVYEZN7Ab0y7ZgOUIvjG1Y7jT
	spzQx8Lq/ijsrLMTMYEiQxY/BhhOPtSboT3SLgcSA1xHyUtNgRRxJa3v1+n8jTkBDYv9SMTy8ar
	b4Lm53OtAk18ocDYGERpZ88lU98lXYjHAT8Yfvp8R3YCNtuZQcj+wKNImbNg==
X-Received: by 2002:a05:600c:6d86:b0:492:2f3c:d0ed with SMTP id 5b1f17b1804b1-493df0786f2mr10598305e9.30.1783353522751;
        Mon, 06 Jul 2026 08:58:42 -0700 (PDT)
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
Subject: [PATCH v5 18/26] xen/riscv: introduce (de)initialization helpers for vINTC
Date: Mon,  6 Jul 2026 17:57:59 +0200
Message-ID: <547003a0b3489190e1709575798606b5104daa85.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1783353523-820DC1E0-1708A3FA/10/73395122804
X-purgate-type: spam
X-purgate-size: 3578
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
X-Rspamd-Queue-Id: 42127712EEB

Add common helpers domain_vintc_init() and domain_vintc_deinit() to
allocate and deallocate a virtual interrupt controller (vINTC)
structure and initialize basic virtual interrupt controller registers.

domain_vintc_deinit() isn't called at the moment as arch_domain_destroy()
is implemented as stub at the moment.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v5:
 - s/printk/printk_once().
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in v4:
 - Drop the comment from domain_vintc_init() about guests receiving a
   virtual interrupt controller that mirrors the host hardware as there
   can (and eventually should) be alternatives.
 - Finish renaming intc_version to intc_variant in domain_vintc_(de)init()
   (enum intc_variant, info->hw_variant, local variable) started in the
   prev patch.
---
Changes in v3:
 - Drop redundant printk() from domain_vintc_deinit()'s default case to
   avoid duplicate messages when init fails.
 - Add a comment to domain_vintc_init() clarifying that guests currently
   receive a virtual interrupt controller that mirrors the host hardware.
---
Changes in v2:
 - Drop __init for domain_vintc_(de)init().
 - Update the commit message.
---
---
 xen/arch/riscv/domain.c           |  3 +++
 xen/arch/riscv/include/asm/intc.h |  3 +++
 xen/arch/riscv/intc.c             | 35 +++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 45712d305975..4db9c28662c7 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -308,6 +308,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
+    if ( (rc = domain_vintc_init(d)) )
+        goto fail;
+
     return rc;
 
  fail:
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 5330666e139e..dad4c5fab08b 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -79,4 +79,7 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
+int domain_vintc_init(struct domain *d);
+void domain_vintc_deinit(struct domain *d);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 2864a896b677..f5c8af6ddea4 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -11,6 +11,7 @@
 
 #include <asm/aia.h>
 #include <asm/intc.h>
+#include <asm/vaplic.h>
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
 
@@ -83,3 +84,37 @@ int __init make_intc_domU_node(struct kernel_info *kinfo)
 
     return vintc->init_ops->make_domu_dt_node(kinfo);
 }
+
+int domain_vintc_init(struct domain *d)
+{
+    int ret = -EOPNOTSUPP;
+    const enum intc_variant variant = intc_hw_ops->info->hw_variant;
+
+    switch ( variant )
+    {
+    case INTC_APLIC:
+        ret = domain_vaplic_init(d);
+        break;
+
+    default:
+        printk_once("vintc (variant:%d) isn't implemented\n", variant);
+        break;
+    }
+
+    return ret;
+}
+
+void domain_vintc_deinit(struct domain *d)
+{
+    const enum intc_variant variant = intc_hw_ops->info->hw_variant;
+
+    switch ( variant )
+    {
+    case INTC_APLIC:
+        domain_vaplic_deinit(d);
+        break;
+
+    default:
+        break;
+    }
+}
-- 
2.54.0


