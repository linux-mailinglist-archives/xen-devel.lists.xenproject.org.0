Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GIczAJ6CMmrL1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E0698F57
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:18:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Qun6agAg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340102.1601207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoI1-0005qO-TM; Wed, 17 Jun 2026 11:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340102.1601207; Wed, 17 Jun 2026 11:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoI0-0004Xw-68; Wed, 17 Jun 2026 11:18:36 +0000
Received: by outflank-mailman (input) for mailman id 1340102;
 Wed, 17 Jun 2026 11:18:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHi-0003KN-UX
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHi-000VKU-AW
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:18 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32826a-e002-0a2a0a5209dd-0a2a45019d20-46
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:18 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32827a-c1f2-0a2a45010019-d155802add02-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:18 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49222fb062bso46603515e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:18 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:16 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695098; x=1782299898; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IqJ6MHjr1xcGHKYhTn6WrVMwlfb5wpnVFy95/sHCyxw=;
        b=Qun6agAgKNVx+lqmYNOI6gVGv07BZG6XGG15X3JS5bJDbeO9gCEuQi71MEqfcdqQku
         I5PumoB/6c9Vyn8KIEDMfaDUbIYS3R3Wot6qsNQmXSaOvJj/bu9jJWJPGJmFF5niKQ6h
         jw4hyQU+aW/ZiEpsPJ8smU87Maec/HO7MiMVisOh4bOHt3dMDH0g4pmBt/dWOYaA6Zsg
         HhnvwnfOew58DeoNHDtpTf5m/B5eJFZC0dKVOAlQy5gFZFgYcFns8Uzj4sl4ujRROjFY
         STuP3xWd37O1qUxFcEbCwsv6PZk5nz7iYX3OozHx4TgrLwBjEkd3x9glwMilyfen10Ej
         86vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695098; x=1782299898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IqJ6MHjr1xcGHKYhTn6WrVMwlfb5wpnVFy95/sHCyxw=;
        b=RrBEFdIqqRjihQhXZw9Qoe3Lnq1+Aupoh12Y82ixw6dL4LqNUOyLyRt5fV9MHPsJRd
         s/Xw82HmWJ2HSM9E+0z1Vs0Tn3Hcf7iG8xPqQryv75v7FvkNm45mJYmXwd4vXcU3R3Hz
         aaLQ5TDTOlSUrFP7sjJfsZw1igVArnLvzzZckUBzpc7mswWfbwSDpSsqx5OOAY9VHU2n
         /MXRc+lsHLbX2bCqLezvPMLapk6tACaaEz66huVOcre63Hj0KDYm0F1V4eLOOU5fRLSF
         AJ+PPb2Sn6TyZbQCPGIe2WWzBKlo4GrXFlk7mxiBcz6yBkA/aGkixfg86XqK1Um+RJUO
         a6mw==
X-Gm-Message-State: AOJu0YzRvMBUJ7/kX1tehSzge/nuwxZmnvFsuRyLBCa55XmE3FghWkXV
	eV8GZUNNEUDD2VdDlEnQYRSCzVu2plGwqV+eoEHt61ruWS5vsjl33b72NhAtTw==
X-Gm-Gg: Acq92OEto4rObK1DO8IIUFhjWKYk4rPbIGiz+N9cNl4WGN8bMoKLXj14siPvGsy69uP
	TyaLFspfNc1ut7APeoCfiduDqEqZLngU3umJBbE3VX79JaChRJTAWlAo5JIB7FhZ3YwwX4AD2lc
	WFYI0+6G8+sQ+RuJAMAZRO40sJplCnKh5XMsY/QKH7E09L/brzUhHjCgoukECqB1Igbn3Q0687l
	+nhT6AtYU3ONSxBolaGAFQjncis0cVvAJTrcmhWgMvRtKJJAwGkmPXcVyqexw1TZDTV3KKRn3pg
	f47qsmGQR6iXMPmOyhwV0WpbGkOHIdWarniQQ41wnx+cW5yps7+un5pnRWxWvYBkUS5VskXNMNf
	w8Kj4PfhOA9vHNSHyFnzFM5IBe7YE9BIA6f1juoz2DLWusyfnAhPNeO3YAvv0+g37fQ+fcYCEBE
	Kng8tNIaMiSf/N1V5fWkwkE83T3+9rPzs9xfckpy0MwFxIyDFPOMT7gllzUQ==
X-Received: by 2002:a05:600c:3f18:b0:490:e1a6:25d with SMTP id 5b1f17b1804b1-492333eb308mr58326275e9.26.1781695097494;
        Wed, 17 Jun 2026 04:18:17 -0700 (PDT)
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
Subject: [PATCH v3 15/23] xen/riscv: introduce (de)initialization helpers for vINTC
Date: Wed, 17 Jun 2026 13:17:43 +0200
Message-ID: <8bb11b0d9c905dd3dd9f922a3f1d2e7f2b75c978.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1781695098-AFD51FF4-953E5EAB/10/73395122804
X-purgate-type: spam
X-purgate-size: 3232
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
X-Rspamd-Queue-Id: 3C4E0698F57

Add common helpers domain_vintc_init() and domain_vintc_deinit() to
allocate and deallocate a virtual interrupt controller (vINTC)
structure and initialize basic virtual interrupt controller registers.

domain_vintc_deinit() isn't called at the moment as arch_domain_destroy()
is implemented as stub at the moment.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/intc.c             | 40 +++++++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 129e775c52cb..3499c25dcfe0 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -309,6 +309,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = p2m_init(d, config)) != 0)
         goto fail;
 
+    if ( (rc = domain_vintc_init(d)) )
+        goto fail;
+
     return rc;
 
  fail:
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index d3d456afe5f0..95ca526e1223 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -77,4 +77,7 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
 
+int domain_vintc_init(struct domain *d);
+void domain_vintc_deinit(struct domain *d);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index f0ce27a96c1d..ec37b359f323 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -11,6 +11,7 @@
 
 #include <asm/aia.h>
 #include <asm/intc.h>
+#include <asm/vaplic.h>
 
 static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
 
@@ -83,3 +84,42 @@ int __init make_intc_domU_node(struct kernel_info *kinfo)
 
     return vintc->init_ops->make_domu_dt_node(kinfo);
 }
+
+/*
+ * Guests are given a virtual interrupt controller that mirrors the host
+ * hardware: an AIA-capable host yields a virtual AIA for the guest, and
+ * so on for any future controller types.
+ */
+int domain_vintc_init(struct domain *d)
+{
+    int ret = -EOPNOTSUPP;
+    const enum intc_version ver = intc_hw_ops->info->hw_version;
+
+    switch ( ver )
+    {
+    case INTC_APLIC:
+        ret = domain_vaplic_init(d);
+        break;
+
+    default:
+        printk("vintc (ver:%d) isn't implemented\n", ver);
+        break;
+    }
+
+    return ret;
+}
+
+void domain_vintc_deinit(struct domain *d)
+{
+    const enum intc_version ver = intc_hw_ops->info->hw_version;
+
+    switch ( ver )
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


