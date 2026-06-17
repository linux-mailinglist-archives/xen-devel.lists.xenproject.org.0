Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ELCjM6aCMmrW1AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:19:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17842698F72
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 13:19:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ggfAcCYg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1340110.1601228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoI9-0006om-1B; Wed, 17 Jun 2026 11:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340110.1601228; Wed, 17 Jun 2026 11:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZoI7-0006Xe-7w; Wed, 17 Jun 2026 11:18:43 +0000
Received: by outflank-mailman (input) for mailman id 1340110;
 Wed, 17 Jun 2026 11:18:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZoHm-0003mG-VD
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 11:18:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZoHm-00CoLo-AB
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 13:18:22 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a328278-2eae-0a2a0a5409dd-0a2a4508ac62-26
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:22 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a32827e-63b5-0a2a45080019-d155802eed73-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 13:18:22 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so53249155e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 04:18:22 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa3a8efsm151319985e9.2.2026.06.17.04.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 04:18:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781695102; x=1782299902; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xSEG9bIjafLGrwzdvC04MxmFA+4dsnLVgng9C+J+7w=;
        b=ggfAcCYgm2saDY4pyoHIaCMMuWgHugUuPQcDlqcHYLlyVVsigvX7o2XL2oY28sGNB5
         2/NL83/qKVWJkuDIbkK998Qg/sDUwKB3ST0RrwqkYcVgD2gX4Wsj8WDHYpwQhWd4MgRp
         TGCYcQVBPs7WYUWHURKxRVbovxrJ04W8ZarMbN/gS4ZrNKzr4sqhA8yyYaBu77awcw2H
         TMO7za9jtafwftfkVU1iNYgzSAjHdqW2f2NnKJWCg6yWqW7RjxlV0sSe7WSoK41mKTfY
         v6NQ6yWtbHN2Ycaj4SSB6LFtpue0uRI8H8B5XZkLJhPuKRKZdNWOk17yE6ehMjSJtTEB
         zBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781695102; x=1782299902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4xSEG9bIjafLGrwzdvC04MxmFA+4dsnLVgng9C+J+7w=;
        b=YWMuPAbNybxRagTZBTib0zzKR/ny3TgJEDrXvCg9397byLderEq/V84xKE8vypN8nS
         7N2T5q7OmbGZA2wXrIwp0Auv4vvbpUo2MoAVui7/xVxiDkysJAaFqf8LPkzQGC660y85
         +51KkXhatxgWTkGOht9BUPLtlDyPK1/HAkSRQFbvqKBBZ1NHpTTPk6pD3V1AcG6tUVQM
         oMspruGOB0lc2gx1PcCmmge0xTn5Ebh/xtSVWb8QURLH69CnmI1YP9GjFID5q8unVpqE
         xcQPNK8DCvUd7liV0i02yGNTWvYHdGXCxtALsc4qSGOZML2Imb86AOFVz038mQKyFG/2
         Z3PQ==
X-Gm-Message-State: AOJu0YyNj3LCggosta1aH65E9aGF43NqgywMUOhufY9PbaH1X57volW5
	834CqmCdIz8UEuJZsyN+N7dmCYVorVJ9tKwCRQe//J26P7dkcSEdOstVtWiURQ==
X-Gm-Gg: Acq92OGTPtjn7zZ54voS/1Q7dSJhMw6HqQ4bTMZcNrejX+ILISbX67Ec0guGCIcjfp+
	LoUv5QCeNAZ3Lutr8Q/4Uksi38HlZaOr1zblcIiBbRp9vvT7XgJ9ITZRpJaWCxGG91NQFKEG9Uh
	PIlR24bxRFjh0QYl9cERT0GBMw0zxIbinIjGKYjCg7AzQ2g5BaETabR7DUb+f6CwejBeH6H6Rbn
	4jNsfCens2UirYJ0WS4iVnor2WTLfuMP8GVzyUM8vOqApg7iWyu8P06jRazUDwKUZ1TW7eqwqb0
	1d8IfO/1aXOK0p5nhlnojUlw/n0hCl7UuVJ1Q2qornXLwFhSg6KfZeh/gz2/C0+nY8eAL1OWPxK
	BxKoi32kcDlFCIsbKe/94tYip7PIEMJd9FC3IM6B17f9ZVFjjhocJgbsFd5Pz9Ht2IwYGKtZD5N
	LcfCJrDScEhzzcdu3wRK5phSkmuHxiQbCk92aGRLnoaECvlkccj/tF6z55Ouq6Wv30x75B
X-Received: by 2002:a05:600c:c08a:b0:490:acb8:1490 with SMTP id 5b1f17b1804b1-492333a1716mr50603575e9.4.1781695101242;
        Wed, 17 Jun 2026 04:18:21 -0700 (PDT)
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
Subject: [PATCH v3 18/23] xen/riscv: implement IRQ routing for device passthrough
Date: Wed, 17 Jun 2026 13:17:46 +0200
Message-ID: <0458468cc5a6db911a9acc64f4c8cf17ceebe4c6.1781693963.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1781693963.git.oleksii.kurochko@gmail.com>
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1781695102-BD96DDB1-392DB2D2/10/73395122804
X-purgate-type: spam
X-purgate-size: 18538
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
X-Rspamd-Queue-Id: 17842698F72

dom0less device passthrough requires granting guest domains access to
device interrupts.  Introduce map_device_irqs_to_domain() to enumerate
a DT node's interrupt properties, skipping those not owned by
the primary interrupt controller (as at the moment I haven't seen usages
of it), and map_irq_to_domain() to grant domain access and configure
Xen's interrupt descriptor accordingly. Sharing IRQ between domains is
rejected.

route_irq_to_guest() and release_irq() manage irq_desc ownership for
guest-assigned interrupts.  Each assignment carries a small irq_guest
structure as irqaction::dev_id, recording the owning domain and virtual
IRQ number which is 1:1 mapped to physical IRQ number.  A per-domain
vIRQ allocation bitmap (allocated_irqs in struct vintc), managed by
vintc_reserve_virq(), prevents the same vIRQ being claimed twice.

With APLIC+IMSIC, guest interrupts are delivered directly by hardware
through the IMSIC, bypassing do_IRQ(). The _IRQ_GUEST branch in
do_IRQ() is therefore left as BUG() until a platform without direct
IMSIC delivery is encountered.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Drop extraneous "to" from "Unable to permit to %pd" message.
 - Move res/irq/rirq to loop scope; use nirq as declaration initializer.
 - Hoist irq_ranges check before the loop (it is loop-invariant).
 - Remove spurious forward declarations (struct dt_device_node, struct
   rangeset) from intc.h; remove all three from setup.h.
 - Use __set_bit() instead of set_bit() in intc_route_irq_to_guest()
   since desc->lock is always held on every write path for desc->status.
 - Use XVFREE() instead of xvfree() in domain_vintc_deinit().
 - Rename allocated_irqs -> used_irqs in struct vintc.
 - Fix dangling desc->action in release_irq()'s !IRQ_HAS_MULTIPLE_ACTION
   path by nulling *action_ptr after saving the action pointer.
 - Use true (not 1) for free_on_release in route_irq_to_guest().
 - Use %pd for domain printing in route_irq_to_guest() error paths.
 - Introduce release_guest_irq() to pair with route_irq_to_guest() and
   plug the irq_guest info leak; call it from domain_vintc_deinit()
   for each vIRQ recorded in used_irqs.
---
Changes in v2:
 - Rework IRQ mapping in more common (similar approach to Arm).
---
---
 xen/arch/riscv/Makefile           |   1 +
 xen/arch/riscv/aplic.c            |   4 +
 xen/arch/riscv/device.c           | 102 +++++++++++++++
 xen/arch/riscv/imsic.c            |   5 +-
 xen/arch/riscv/include/asm/intc.h |   9 ++
 xen/arch/riscv/include/asm/irq.h  |   5 +
 xen/arch/riscv/intc.c             |  41 ++++++
 xen/arch/riscv/irq.c              | 203 ++++++++++++++++++++++++++++++
 xen/arch/riscv/vaplic.c           |   2 +
 9 files changed, 370 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/riscv/device.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 9d8d21b65188..fc6b34661111 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,6 +1,7 @@
 obj-y += aia.o
 obj-y += aplic.o
 obj-y += cpufeature.o
+obj-y += device.o
 obj-y += domain.o
 obj-y += domain-build.init.o
 obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 0abe32c2e446..a559c81c6d16 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -306,9 +306,13 @@ static const hw_irq_controller aplic_xen_irq_type = {
     .set_affinity = aplic_set_irq_affinity,
 };
 
+/* At the moment there is no difference between guest and Xen ops */
+#define aplic_guest_irq_type aplic_xen_irq_type
+
 static const struct intc_hw_operations aplic_ops = {
     .info                = &aplic_info,
     .host_irq_type       = &aplic_xen_irq_type,
+    .guest_irq_type      = &aplic_guest_irq_type,
     .handle_interrupt    = aplic_handle_interrupt,
     .set_irq_type        = aplic_set_irq_type,
 };
diff --git a/xen/arch/riscv/device.c b/xen/arch/riscv/device.c
new file mode 100644
index 000000000000..95bd3b46f538
--- /dev/null
+++ b/xen/arch/riscv/device.c
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/iocap.h>
+#include <xen/rangeset.h>
+#include <xen/sched.h>
+
+#include <asm/intc.h>
+
+int map_irq_to_domain(struct domain *d, unsigned int irq,
+                      bool need_mapping, const char *devname)
+{
+    int res;
+
+    res = irq_permit_access(d, irq);
+    if ( res )
+    {
+        printk(XENLOG_ERR "Unable to permit %pd access to IRQ %u\n", d, irq);
+        return res;
+    }
+
+    if ( need_mapping )
+    {
+        /*
+         * Checking the return of vintc_reserve_virq is not
+         * necessary. It should not fail except when we try to map
+         * the IRQ twice. This can legitimately happen if the IRQ is shared.
+         */
+        vintc_reserve_virq(d, irq);
+
+        res = route_irq_to_guest(d, irq, irq, devname);
+        if ( res < 0 )
+        {
+            printk(XENLOG_ERR "Unable to map IRQ%u to %pd\n", irq, d);
+            return res;
+        }
+    }
+
+    dt_dprintk("  - IRQ: %u\n", irq);
+
+    return 0;
+}
+
+/*
+ * map_device_irqs_to_domain retrieves the interrupts configuration from
+ * a device tree node and maps those interrupts to the target domain.
+ *
+ * Returns:
+ *   < 0 error
+ *   0   success
+ */
+int map_device_irqs_to_domain(struct domain *d,
+                              struct dt_device_node *dev,
+                              bool need_mapping,
+                              struct rangeset *irq_ranges)
+{
+    unsigned int i, nirq = dt_number_of_irq(dev);
+
+    if ( irq_ranges )
+        return -EOPNOTSUPP;
+
+    /* Give permission and map IRQs */
+    for ( i = 0; i < nirq; i++ )
+    {
+        int res, irq;
+        struct dt_raw_irq rirq;
+
+        res = dt_device_get_raw_irq(dev, i, &rirq);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Unable to retrieve irq %u for %s\n",
+                   i, dt_node_full_name(dev));
+            return res;
+        }
+
+        /*
+         * Don't map IRQ that have no physical meaning
+         * ie: IRQ whose controller is not APLIC/IMSIC/PLIC.
+         */
+        if ( rirq.controller != dt_interrupt_controller )
+        {
+            dt_dprintk("irq %u not connected to primary controller."
+                       "Connected to %s\n", i,
+                       dt_node_full_name(rirq.controller));
+            continue;
+        }
+
+        irq = platform_get_irq(dev, i);
+        if ( irq < 0 )
+        {
+            printk("Unable to get irq %u for %s\n", i, dt_node_full_name(dev));
+            return irq;
+        }
+
+        res = map_irq_to_domain(d, irq, need_mapping, dt_node_name(dev));
+        if ( res )
+            return res;
+    }
+
+    return 0;
+}
diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
index de8c54cb33fd..bd565aa6af08 100644
--- a/xen/arch/riscv/imsic.c
+++ b/xen/arch/riscv/imsic.c
@@ -538,10 +538,11 @@ int __init imsic_init(const struct dt_device_node *node)
 
 static int __init guest_imsic_make_reg_property(struct domain *d, void *fdt)
 {
+    paddr_t base = GUEST_IMSIC_S_BASE;
     paddr_t size = IMSIC_MMIO_PAGE_SZ * d->max_vcpus;
     __be32 regs[4] = {
-        cpu_to_be32(GUEST_IMSIC_S_BASE >> 32),
-        cpu_to_be32(GUEST_IMSIC_S_BASE),
+        cpu_to_be32(base >> 32),
+        cpu_to_be32(base),
         cpu_to_be32(size >> 32),
         cpu_to_be32(size),
     };
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 95ca526e1223..f257e6a47b2b 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -13,6 +13,7 @@ enum intc_version {
 };
 
 struct cpu_user_regs;
+struct domain;
 struct irq_desc;
 struct kernel_info;
 struct vcpu;
@@ -32,6 +33,9 @@ struct intc_hw_operations {
     /* hw_irq_controller to enable/disable/eoi host irq */
     const struct hw_interrupt_type *host_irq_type;
 
+    /* hw_irq_controller to enable/disable/eoi guest irq */
+    const struct hw_interrupt_type *guest_irq_type;
+
     /* Set IRQ type */
     void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
     /* Set IRQ priority */
@@ -62,6 +66,8 @@ struct vintc_ops {
 };
 
 struct vintc {
+    unsigned int irq_nums;
+    unsigned long *used_irqs;
     const struct vintc_init_ops *init_ops;
     const struct vintc_ops *ops;
 };
@@ -73,6 +79,7 @@ void register_intc_ops(const struct intc_hw_init_ops *init_ops);
 void intc_init(void);
 
 void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
+int intc_route_irq_to_guest(struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
@@ -80,4 +87,6 @@ void intc_handle_external_irqs(struct cpu_user_regs *regs);
 int domain_vintc_init(struct domain *d);
 void domain_vintc_deinit(struct domain *d);
 
+bool vintc_reserve_virq(const struct domain *d, unsigned int virq);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index f633636dc308..2b95f8226be2 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -49,6 +49,11 @@ void init_IRQ(void);
 
 void do_IRQ(struct cpu_user_regs *regs, unsigned int irq);
 
+int route_irq_to_guest(struct domain *d, unsigned int virq,
+                       unsigned int irq, const char *devname);
+
+int release_guest_irq(struct domain *d, unsigned int virq);
+
 #endif /* ASM__RISCV__IRQ_H */
 
 /*
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index ec37b359f323..a38740778d23 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -7,7 +7,9 @@
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/spinlock.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/aia.h>
 #include <asm/intc.h>
@@ -78,6 +80,22 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
     intc_set_irq_priority(desc, priority);
 }
 
+int intc_route_irq_to_guest(struct irq_desc *desc,
+                            unsigned int priority)
+{
+    ASSERT(spin_is_locked(&desc->lock));
+
+    ASSERT(intc_hw_ops->guest_irq_type);
+
+    desc->handler = intc_hw_ops->guest_irq_type;
+    __set_bit(_IRQ_GUEST, &desc->status);
+
+    intc_set_irq_type(desc, desc->arch.type);
+    intc_set_irq_priority(desc, priority);
+
+    return 0;
+}
+
 int __init make_intc_domU_node(struct kernel_info *kinfo)
 {
     struct vintc *vintc = kinfo->bd.d->arch.vintc;
@@ -106,12 +124,25 @@ int domain_vintc_init(struct domain *d)
         break;
     }
 
+    if ( !ret )
+    {
+        d->arch.vintc->used_irqs =
+            xvzalloc_array(unsigned long, BITS_TO_LONGS(d->arch.vintc->irq_nums));
+        if ( !d->arch.vintc->used_irqs )
+            ret = -ENOMEM;
+    }
+
     return ret;
 }
 
 void domain_vintc_deinit(struct domain *d)
 {
     const enum intc_version ver = intc_hw_ops->info->hw_version;
+    unsigned int virq;
+
+    for ( virq = 0; virq < d->arch.vintc->irq_nums; virq++ )
+        if ( test_bit(virq, d->arch.vintc->used_irqs) )
+            release_guest_irq(d, virq);
 
     switch ( ver )
     {
@@ -122,4 +153,14 @@ void domain_vintc_deinit(struct domain *d)
     default:
         break;
     }
+
+    XVFREE(d->arch.vintc->used_irqs);
+}
+
+bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
+{
+    if ( virq >= d->arch.vintc->irq_nums )
+        return false;
+
+    return !test_and_set_bit(virq, d->arch.vintc->used_irqs);
 }
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 25d329500212..3b90ab013e74 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -12,11 +12,20 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/irq.h>
+#include <xen/sched.h>
 #include <xen/spinlock.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/hardirq.h>
 #include <asm/intc.h>
 
+/* Describe an IRQ assigned to a guest */
+struct irq_guest
+{
+    struct domain *d;
+    unsigned int virq;
+};
+
 static irq_desc_t irq_desc[NR_IRQS];
 
 static bool irq_validate_new_type(unsigned int curr, unsigned int new)
@@ -192,6 +201,15 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
     if ( desc->handler->ack )
         desc->handler->ack(desc);
 
+    if ( desc->status & IRQ_GUEST )
+        /*
+         * As at the moment APLIC + IMSIC is used for guest interrupts will
+         * be directly passed to guest. But if/when IMSIC won't be available
+         * all interrupts will go through Xenand here an irq injection
+         * will be necessary to do.
+         */
+        panic("unimplemented");
+
     if ( desc->status & IRQ_DISABLED )
         goto out;
 
@@ -221,3 +239,188 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
     spin_unlock(&desc->lock);
     irq_exit();
 }
+
+static inline struct irq_guest *irq_get_guest_info(struct irq_desc *desc)
+{
+    ASSERT(spin_is_locked(&desc->lock));
+    ASSERT(test_bit(_IRQ_GUEST, &desc->status));
+    ASSERT(desc->action != NULL);
+
+    return desc->action->dev_id;
+}
+
+static inline struct domain *irq_get_domain(struct irq_desc *desc)
+{
+    return irq_get_guest_info(desc)->d;
+}
+
+void release_irq(unsigned int irq, const void *dev_id)
+{
+    struct irq_desc *desc;
+    unsigned long flags;
+    struct irqaction *action, **action_ptr;
+
+    desc = irq_to_desc(irq);
+
+    spin_lock_irqsave(&desc->lock,flags);
+
+    action_ptr = &desc->action;
+#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
+    for ( ;; )
+    {
+        action = *action_ptr;
+        if ( !action )
+        {
+            printk(XENLOG_WARNING "Trying to free already-free IRQ %u\n", irq);
+            spin_unlock_irqrestore(&desc->lock, flags);
+            return;
+        }
+
+        if ( action->dev_id == dev_id )
+            break;
+
+        action_ptr = &action->next;
+    }
+
+    /* Found it - remove it from the action list */
+    *action_ptr = action->next;
+#else
+    action = *action_ptr;
+    *action_ptr = NULL;
+#endif
+
+    /* If this was the last action, shut down the IRQ */
+    if ( !desc->action )
+    {
+        desc->handler->shutdown(desc);
+        __clear_bit(_IRQ_GUEST, &desc->status);
+    }
+
+    spin_unlock_irqrestore(&desc->lock,flags);
+
+    /* Wait to make sure it's not being used on another CPU */
+    do { smp_mb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );
+
+    if ( action->free_on_release )
+        xvfree(action);
+}
+
+int release_guest_irq(struct domain *d, unsigned int virq)
+{
+    struct irq_desc *desc = irq_to_desc(virq);
+    struct irq_guest *info;
+    unsigned long flags;
+
+    spin_lock_irqsave(&desc->lock, flags);
+
+    if ( !test_bit(_IRQ_GUEST, &desc->status) )
+        goto unlock_err;
+
+    info = irq_get_guest_info(desc);
+    if ( d != info->d )
+        goto unlock_err;
+
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    release_irq(desc->irq, info);
+    xvfree(info);
+
+    return 0;
+
+ unlock_err:
+    spin_unlock_irqrestore(&desc->lock, flags);
+    return -EINVAL;
+}
+
+/* Route an IRQ to a specific guest */
+int route_irq_to_guest(struct domain *d, unsigned int virq,
+                       unsigned int irq, const char *devname)
+{
+    struct irqaction *action;
+    struct irq_guest *info;
+    struct irq_desc *desc;
+    unsigned long flags;
+    int retval = 0;
+
+    desc = irq_to_desc(irq);
+
+    action = xvmalloc(struct irqaction);
+    if ( !action )
+        return -ENOMEM;
+
+    info = xvmalloc(struct irq_guest);
+    if ( !info )
+    {
+        xvfree(action);
+        return -ENOMEM;
+    }
+
+    info->d = d;
+    info->virq = virq;
+
+    action->dev_id = info;
+    action->name = devname;
+    action->free_on_release = true;
+
+    spin_lock_irqsave(&desc->lock, flags);
+
+    /*
+     * If the IRQ is already used by someone
+     *  - If it's the same domain -> Xen doesn't need to update the IRQ desc.
+     *  For safety check if we are not trying to assign the IRQ to a
+     *  different vIRQ.
+     *  - Otherwise -> For now, don't allow the IRQ to be shared between
+     *  Xen and domains.
+     */
+    if ( desc->action != NULL )
+    {
+        if ( test_bit(_IRQ_GUEST, &desc->status) )
+        {
+            struct domain *ad = irq_get_domain(desc);
+
+            if ( d != ad )
+            {
+                printk(XENLOG_G_ERR "IRQ %u is already used by %pd\n",
+                       irq, ad);
+                retval = -EBUSY;
+            }
+            else if ( irq_get_guest_info(desc)->virq != virq )
+            {
+                printk(XENLOG_G_ERR
+                       "%pd: IRQ %u is already assigned to vIRQ %u\n",
+                       d, irq, irq_get_guest_info(desc)->virq);
+                retval = -EBUSY;
+            }
+        }
+        else
+        {
+            printk(XENLOG_G_ERR "IRQ %u is already used by Xen\n", irq);
+            retval = -EBUSY;
+        }
+        goto out;
+    }
+
+    retval = _setup_irq(desc, 0, action);
+    if ( retval )
+        goto out;
+
+    retval = intc_route_irq_to_guest(desc, IRQ_NO_PRIORITY);
+
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    if ( retval )
+    {
+        release_irq(desc->irq, info);
+        goto free_info;
+    }
+
+    return 0;
+
+ out:
+    spin_unlock_irqrestore(&desc->lock, flags);
+    xvfree(action);
+ free_info:
+    xvfree(info);
+
+    return retval;
+}
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 683e8aaec2f3..b418cbedd9b3 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -123,6 +123,8 @@ int domain_vaplic_init(struct domain *d)
     vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
                              APLIC_DOMAINCFG_RO80;
 
+    d->arch.vintc->irq_nums = VAPLIC_NUM_SOURCES;
+
     return 0;
 }
 
-- 
2.54.0


