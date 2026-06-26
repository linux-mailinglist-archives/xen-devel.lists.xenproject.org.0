Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CqZzJg6fPmodJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5046CEA5C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Mr5J6mPX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346301.1604882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lw-0005gI-7i; Fri, 26 Jun 2026 15:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346301.1604882; Fri, 26 Jun 2026 15:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lu-0005KK-TY; Fri, 26 Jun 2026 15:47:14 +0000
Received: by outflank-mailman (input) for mailman id 1346301;
 Fri, 26 Jun 2026 15:47:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8ln-00048G-PT
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:47:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8ln-004aSr-41
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:47:07 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef9-bab6-0a2a0a5309dd-0a2a450cac98-12
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:07 +0200
Received: from [209.85.167.51] (helo=mail-lf1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9efa-f399-0a2a450c0019-d155a733b057-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:07 +0200
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5ad58f31846so1048635e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:47:06 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:47:05 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782488826; x=1783093626; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tE18Q/Zu8AIcss7x9lzMh64k+xShMcKC9jAdFBx8PaU=;
        b=Mr5J6mPXzFDsrgwQOcnRv5t/Ptz4QeKITTMsy2Wd/gJz12KBxBdXVz3SV4ZS1oImZe
         4tqIZCnGMr6VBCF6Bi39JnWoB4p0pbr2lGdwjrdh5Zb6PhHuUTUU5yB0Q9tebRAxGszW
         /02rF4gwqwFw2ug/+sVhPiykwJxaLqwE+PsjsW0ox9qpcVNbWGYcN8qEFUZF2Ics4Qrx
         V15Imutauoc/LJykYcVDjEnGwbzo1vdPK0kbbu/m11AtU7MYWRm1cQetEswOazv4Syuq
         QX2sGbuZA2L+whPIMSh6jKkR4iU/c2dWfIqvkkMIZ6IwvAKDCDSGkibl10dYLYbe+3Gg
         V5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488826; x=1783093626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tE18Q/Zu8AIcss7x9lzMh64k+xShMcKC9jAdFBx8PaU=;
        b=aQCR7z0R6RBbW+Kjdf3iV2nEf/LkPEUYLmtN8NBVlyZULJMI76WNXdtjusTNq3ejnm
         SsEydevdzqTIWZEC4iWA+/73FOlL647bwMnQIgwwl4aCXOoqKHl7riu8SSZQcUW65Rxr
         hLVYEiygbCAy1zUOPA9xDNtX2xUj2avTQ7redFMbwwGvjrGDjVGVvW4NufaQLzijGt7o
         RNhoULM6jzHfDhMVjhoa1OMnfTwe8QDdImDjgBsvd9el8/O5UNsmW1L5k5ibVx6MKFzH
         1iLQ6f3YuKHCqjaSh3acXnBKD5KYbGgQbM0QjBzcBDQWmW6I6pjsUj+BHIjZ3E+MNLWm
         mQHQ==
X-Gm-Message-State: AOJu0YxOCY2KZmLX9Xiq0ZC0AoYYcpDnfv6TUcJvbQbG7894fCmTuZNz
	dBBdi8BkHYCL9Fnwk9BHbvZ1ckNfZNilAR03lrJvWJmS++BSXeRTdcj2S5DhAA==
X-Gm-Gg: AfdE7cmk3N1/yVT0krZc5utbZTiKr2GpLXmO3uL6VSL0CU+ftrKT0cEHm0ZoWyPOTav
	HGu2IxuJS0UpGEcUptA9vnFiJHRoN9W/ekDwgytlcpH5FKCAzKnpkH/LA+DxVG+5whKQ7vZA4kL
	Es5a9w/u1XnowUQKoTK/5sBTdze1vCbRCIdGlxUnOO6kjjlT3SDNlMX7xal8G8oToIXZv/652fZ
	p4g0h3osg2Crzsvpd5Fo5OP3q2mA0vw7ORK3cWm7Nw42Hh8x4/5LFHTTfvZLXLpnPJ5sGYegRFF
	xKIw9APezN6gxc6us++R8Bv6D72SKfOD691SzmnjqbPqWJGKECe4vKhxlmckP7BLniBUh2iezMZ
	7i3LOHDNdV8g9hthSg88cN7KCB7LUTxkfXrbtpU8ob12IKJdn9XMSBZDLHDggq5c+W8rFT1qkSR
	+mSy4geDtvc+2NhYCHKfsMk6ZFLzY7Vq339ws/X2zIHNQ5OOcrkidkTfo8sw==
X-Received: by 2002:a05:6512:68f:b0:5ad:4f88:30ec with SMTP id 2adb3069b0e04-5aea944ffe5mr386809e87.2.1782488826185;
        Fri, 26 Jun 2026 08:47:06 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v4 21/25] xen/riscv: implement IRQ routing for device passthrough
Date: Fri, 26 Jun 2026 17:46:30 +0200
Message-ID: <472a77604d35a0bc2a75b71f250fd67b63afde4c.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1782488827-0FF33D51-45140EBE/10/73395122804
X-purgate-type: spam
X-purgate-size: 20699
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:dpsmith@apertussolutions.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,apertussolutions.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A5046CEA5C

dom0less device passthrough requires granting guest domains access to
device interrupts.  Introduce map_device_irqs_to_domain() to enumerate
a DT node's interrupt properties, skipping those not owned by
the primary interrupt controller (as at the moment I haven't seen usages
of it), and map_irq_to_domain() to grant domain access and configure
Xen's interrupt descriptor accordingly. Sharing IRQ between domains is
rejected.

Both map_irq_to_domain() and map_device_irqs_to_domain() are marked
__overlay_init, mirroring Arm: without CONFIG_OVERLAY_DTB this expands to
__init, so the functions are init-only and need no XSM check; with
CONFIG_OVERLAY_DTB they become runtime-callable, but the only runtime
entry point is dt_overlay_domctl(), which performs the XSM checks at the
domctl layer.  RISC-V does not wire up DT overlay yet, so today these are
strictly __init; if/when overlay support is added, the domctl-level XSM
gating must be added together with it, as on Arm.

route_irq_to_guest() and release_irq() manage irq_desc ownership for
guest-assigned interrupts.  Each assignment carries a small irq_guest
structure as irqaction::dev_id, recording the owning domain and virtual
IRQ number which is 1:1 mapped to physical IRQ number.  A per-domain
vIRQ allocation bitmap (used_irqs in struct vintc), managed by
vintc_reserve_virq(), prevents the same vIRQ being claimed twice.

Host and guest interrupts may differ in some operations (EOI timing in
particular, possibly others): a host IRQ is completed once Xen's handler
runs, whereas a passthrough IRQ must defer the physical completion until
the guest issues its own EOI, otherwise a still-asserted level line would
immediately retrigger and storm.  This affects only the .end callback;
the rest of hw_interrupt_type is shared, hence the separate host and
guest hw_interrupt_type instances.

With APLIC+IMSIC, guest interrupts are delivered directly by hardware
through the IMSIC, bypassing do_IRQ(). The _IRQ_GUEST branch in
do_IRQ() is therefore left as BUG() until a platform without direct
IMSIC delivery is encountered.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Update the commit message.
 - Mark map_irq_to_domain() and map_device_irqs_to_domain() as
   __overlay_init (mirroring Arm) and include <xen/dt-overlay.h>.
 - Fix grammar in the controller-skip comment ("IRQ" -> "IRQs").
 - Drop the redundant 'base' local in guest_imsic_make_reg_property();
   use GUEST_IMSIC_S_BASE directly.
 - Rename vintc::irq_nums -> nr_virqs and update all users.
 - Guard domain_vintc_deinit() against a NULL d->arch.vintc.
 - Use smp_rmb() instead of smp_mb() in release_irq()'s wait loop and
   document how it pairs with the spin_unlock() in do_IRQ().
 - In release_guest_irq(), reject live unrouting from a non-dying domain
   (-EBUSY) and clear _IRQ_GUEST under desc->lock so a concurrent
   release for the same IRQ bails out instead of double-freeing 'info'.
 - Tidy spurious whitespace in release_irq()'s spin_lock/unlock calls.
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
 xen/arch/riscv/device.c           |  95 ++++++++++++
 xen/arch/riscv/include/asm/intc.h |   9 ++
 xen/arch/riscv/include/asm/irq.h  |   5 +
 xen/arch/riscv/intc.c             |  44 ++++++
 xen/arch/riscv/irq.c              | 230 ++++++++++++++++++++++++++++++
 xen/arch/riscv/vaplic.c           |   2 +
 8 files changed, 390 insertions(+)
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
index 126d56fb7ea8..96ea475e914b 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -304,9 +304,13 @@ static const hw_irq_controller aplic_xen_irq_type = {
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
index 000000000000..8bfb9926e8ef
--- /dev/null
+++ b/xen/arch/riscv/device.c
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/device_tree.h>
+#include <xen/dt-overlay.h>
+#include <xen/errno.h>
+#include <xen/iocap.h>
+#include <xen/rangeset.h>
+#include <xen/sched.h>
+
+#include <asm/intc.h>
+
+int __overlay_init map_irq_to_domain(struct domain *d, unsigned int irq,
+                                     bool need_mapping, const char *devname)
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
+int __overlay_init map_device_irqs_to_domain(struct domain *d,
+                                             struct dt_device_node *dev,
+                                             bool need_mapping,
+                                             struct rangeset *irq_ranges)
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
+         * Don't map IRQs that have no physical meaning
+         * ie: IRQs whose controller is not APLIC/IMSIC/PLIC.
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
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 62260155dc6b..f16dc4384e2c 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -13,6 +13,7 @@ enum intc_variant {
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
@@ -61,6 +65,8 @@ struct vintc_ops {
 };
 
 struct vintc {
+    unsigned int nr_virqs;
+    unsigned long *used_irqs;
     const struct vintc_init_ops *init_ops;
     const struct vintc_ops *ops;
 };
@@ -72,10 +78,13 @@ void register_intc_ops(const struct intc_hw_init_ops *init_ops);
 void intc_init(void);
 
 void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
+int intc_route_irq_to_guest(struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
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
index 0eb7eb924e9c..447b21db452b 100644
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
     const struct vintc *vintc = kinfo->bd.d->arch.vintc;
@@ -101,12 +119,28 @@ int domain_vintc_init(struct domain *d)
         break;
     }
 
+    if ( !ret )
+    {
+        d->arch.vintc->used_irqs =
+            xvzalloc_array(unsigned long, BITS_TO_LONGS(d->arch.vintc->nr_virqs));
+        if ( !d->arch.vintc->used_irqs )
+            ret = -ENOMEM;
+    }
+
     return ret;
 }
 
 void domain_vintc_deinit(struct domain *d)
 {
     const enum intc_variant variant = intc_hw_ops->info->hw_variant;
+    unsigned int virq;
+
+    if ( !d->arch.vintc )
+        return;
+
+    for ( virq = 0; virq < d->arch.vintc->nr_virqs; virq++ )
+        if ( test_bit(virq, d->arch.vintc->used_irqs) )
+            release_guest_irq(d, virq);
 
     switch ( variant )
     {
@@ -117,4 +151,14 @@ void domain_vintc_deinit(struct domain *d)
     default:
         break;
     }
+
+    XVFREE(d->arch.vintc->used_irqs);
+}
+
+bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
+{
+    if ( virq >= d->arch.vintc->nr_virqs )
+        return false;
+
+    return !test_and_set_bit(virq, d->arch.vintc->used_irqs);
 }
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 25d329500212..a308a6978752 100644
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
 
@@ -221,3 +239,215 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
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
+    spin_lock_irqsave(&desc->lock, flags);
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
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    /*
+     * Wait to make sure it's not being used on another CPU.
+     *
+     * The read barrier pairs with the spin_unlock() in do_IRQ(): once we
+     * observe _IRQ_INPROGRESS cleared, we are guaranteed to also see the
+     * writes do_IRQ() made to desc (e.g. desc->action) before releasing the
+     * lock, so it is safe to free the action below.
+     */
+    do { smp_rmb(); } while ( test_bit(_IRQ_INPROGRESS, &desc->status) );
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
+    /*
+     * Live IRQ unrouting from a running domain is not supported: the tear-down
+     * drops desc->lock across release_irq()/xvfree() and relies on no
+     * concurrent route_irq_to_guest() being issued for this domain. Only permit
+     * it for a dying domain, where assignment is frozen and no new routes can
+     * appear.
+     */
+    if ( !d->is_dying )
+    {
+        spin_unlock_irqrestore(&desc->lock, flags);
+        return -EBUSY;
+    }
+
+    /*
+     * Clear _IRQ_GUEST while still holding the lock so that a concurrent
+     * release_guest_irq() for the same IRQ observes it and bails out, rather
+     * than capturing the same 'info' and double-freeing it below.
+     */
+    clear_bit(_IRQ_GUEST, &desc->status);
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
index 6e409d9b732b..6256d75091b2 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -123,6 +123,8 @@ int domain_vaplic_init(struct domain *d)
     vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
                              APLIC_DOMAINCFG_RO;
 
+    d->arch.vintc->nr_virqs = VAPLIC_NUM_SOURCES;
+
     return 0;
 }
 
-- 
2.54.0


