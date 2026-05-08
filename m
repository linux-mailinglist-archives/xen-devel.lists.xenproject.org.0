Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P8nMcb2/WlklQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4304F7FE9
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303790.1577143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMR1-000233-P8; Fri, 08 May 2026 14:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303790.1577143; Fri, 08 May 2026 14:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMR0-0001ge-P2; Fri, 08 May 2026 14:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1303790;
 Fri, 08 May 2026 14:44:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQw-00018r-N1
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:44:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQw-007XaD-1f
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:44:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6b5-2eae-0a2a0a5409dd-0a2a45068ed4-2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:06 +0200
Received: from [209.85.218.45] (helo=mail-ej1-f45.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6b5-7371-0a2a45060019-d155da2de86b-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:44:05 +0200
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so339684666b.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:44:05 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.44.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:44:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251445; x=1778856245; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVjEQLF6+ArFax55HjUAv3nB814yKtCQ+By22aNb4VM=;
        b=Vqq/B0x7CDPzV3UA41uSbxmwuAbOOgcGBSJIsSvItDURjB0izTKNWXie3koB54RCcZ
         e2d2004553tYDIFROfZ3EF+VidCU9pFBkdZWB8gAoNpLf6QkbIJWu8IOE2aMb8vi3A7X
         qjUeiUOjdxjK49wq1KUclvfM1PKIz7Oxwno82QTybBzQ7ZV/FtEugcwg6Bbg3puOMyKU
         +jJCFgIaQHXgXB9WJ8Dl7LsAXguCKc1VNfjyPzKd59QWVZtRkMFTZ4EVBYdj9uuVXaOF
         SDEj76AB3p2S5oPNqbm9lQdVpFshEn1axDZCQ9tAAiz75sMhSd82lGiQG8Itp2oSVxXY
         3mFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251445; x=1778856245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XVjEQLF6+ArFax55HjUAv3nB814yKtCQ+By22aNb4VM=;
        b=Lh5VXzDMBA5U94vELI0+xqXnHzpqjStlMmNQyRVj2j7NhCmO5PRWNDhRURo73uhMk+
         KONKkGVII1qVQ9JhalU8gU7pQi7VWPe5eplC6Vk7bhMgHrsx2/FMYCUf/GO4IU3I4C1i
         ElUvSvavEHQwNnpuROPc3Y9iKArEntf5G663DT7ANOMufsglU7oB7no34ObavY5kWkzX
         5DJ6RDvVQoczf8tcD/OzSSp1NRo14uawsm3TWvydjaue5kr9VieXpVAGtH5gEJY1shAl
         i2Rn/1OUWmdai3BQTH/oy+jSZrtBBfAE5QgQWDuUdLSsGK7kEkUKa9ywvdn7jYVsxuDq
         KsbA==
X-Gm-Message-State: AOJu0YyIjqsY7A9A/ySOK9o5ewVuudKkCKoh2iOaCerMn0rlJHairmqf
	6f0+0IE5IIyQ2B2EfOEo5plEUVEPmOUCLg+WiqVB7c2zY9rm9Jmvh+d4MtWt3Q==
X-Gm-Gg: AeBDieuflP0j8P2M1kK309wlAWhJnQwSLaFFyVAyQykhPmclVOb2Ow/U5HxJCVyQB8A
	NZ3fKrdarSIgsyJ6T7yCtK/DZmXHavCVUKjSvkBirQQqo14Nb0Thp3aTawqWs8yxlQrzNqpPmvP
	nSpwLBRFLFeBIAOgQHHybn+fSTPGFDzv/nAJVnUA+ov01wA+Q4LKHzAUOWturNUvDHKJnaVVopi
	19sPrrc5/nPAOWgfMKrqgcpnNy0jspey5TKn240NWAWPTgYtgtlNHdgKIMY0G0yx3xdVoqDahwA
	uWByRpwoB+bNBoga2bYqkA7eGOYKX+dUojtPPVRa925Vqt03yzSUxNN7pkurBxr+kSTbsCKA2Dh
	yc6zoXbp5979f01bP+JoWB+dgi5kdksS+a5K+4sqTccyoWY5P1IuAiDcMqj3DJd51I5pZHNgJln
	Tb8f2Pptoikk0y18TAPUf2RD0gnwOb4p91NKJKrpIFU0dEtxGcX3kLaY9DW/KDiGzjgFDSzNSO9
	xA4
X-Received: by 2002:a17:907:7b9d:b0:bc3:80a5:5277 with SMTP id a640c23a62f3a-bc56dc16e60mr782938266b.45.1778251444867;
        Fri, 08 May 2026 07:44:04 -0700 (PDT)
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
Subject: [PATCH v2 19/26] xen/riscv: implement IRQ routing for device passthrough
Date: Fri,  8 May 2026 16:43:21 +0200
Message-ID: <ed5218e94790ff8de36af12852605454606a6d80.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1778251445-8C87AD75-EE5EF4EA/10/73395122804
X-purgate-type: spam
X-purgate-size: 15918
X-Rspamd-Queue-Id: 5A4304F7FE9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.993];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

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
Changes in v2:
 - Rework IRQ mapping in more common (similar approach to Arm).
---
 xen/arch/riscv/Makefile            |   1 +
 xen/arch/riscv/aplic.c             |   4 +
 xen/arch/riscv/device.c            | 108 ++++++++++++++++++
 xen/arch/riscv/include/asm/intc.h  |  10 ++
 xen/arch/riscv/include/asm/irq.h   |   3 +
 xen/arch/riscv/include/asm/setup.h |   4 +
 xen/arch/riscv/intc.c              |  36 ++++++
 xen/arch/riscv/irq.c               | 175 +++++++++++++++++++++++++++++
 8 files changed, 341 insertions(+)
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
index 6ed9118485f3..1c8fd0145eb2 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -311,9 +311,13 @@ static const hw_irq_controller aplic_xen_irq_type = {
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
     .irq_nums            = aplic_irq_num,
diff --git a/xen/arch/riscv/device.c b/xen/arch/riscv/device.c
new file mode 100644
index 000000000000..ba78032028af
--- /dev/null
+++ b/xen/arch/riscv/device.c
@@ -0,0 +1,108 @@
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
+        printk(XENLOG_ERR "Unable to permit to %pd access to IRQ %u\n", d, irq);
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
+    unsigned int i, nirq;
+    int res, irq;
+    struct dt_raw_irq rirq;
+
+    nirq = dt_number_of_irq(dev);
+
+    /* Give permission and map IRQs */
+    for ( i = 0; i < nirq; i++ )
+    {
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
+
+
+        /*
+         * At the moment there is only one user of map_device_irqs_to_domain()
+         * for RISC-V which calls it irq_ranges == NULL.
+         */
+        if ( irq_ranges )
+            return -EOPNOTSUPP;
+    }
+
+    return 0;
+}
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 89a9c6806e55..1ff992b6c20b 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -13,8 +13,11 @@ enum intc_version {
 };
 
 struct cpu_user_regs;
+struct domain;
+struct dt_device_node;
 struct irq_desc;
 struct kernel_info;
+struct rangeset;
 struct vcpu;
 
 struct intc_info {
@@ -32,6 +35,9 @@ struct intc_hw_operations {
     /* hw_irq_controller to enable/disable/eoi host irq */
     const struct hw_interrupt_type *host_irq_type;
 
+    /* hw_irq_controller to enable/disable/eoi guest irq */
+    const struct hw_interrupt_type *guest_irq_type;
+
     /* Set IRQ type */
     void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
     /* Set IRQ priority */
@@ -63,6 +69,7 @@ struct vintc_ops {
 
 struct vintc {
     unsigned int irq_nums;
+    unsigned long *allocated_irqs;
     const struct vintc_init_ops *init_ops;
     const struct vintc_ops *ops;
 };
@@ -75,6 +82,7 @@ void register_intc_ops(const struct intc_hw_operations *ops,
 void intc_init(void);
 
 void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
+int intc_route_irq_to_guest(struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
@@ -83,4 +91,6 @@ unsigned int intc_irq_nums(void);
 int domain_vintc_init(struct domain *d);
 void domain_vintc_deinit(struct domain *d);
 
+bool vintc_reserve_virq(const struct domain *d, unsigned int virq);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index f633636dc308..98dd536be86e 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -49,6 +49,9 @@ void init_IRQ(void);
 
 void do_IRQ(struct cpu_user_regs *regs, unsigned int irq);
 
+int route_irq_to_guest(struct domain *d, unsigned int virq,
+                       unsigned int irq, const char *devname);
+
 #endif /* ASM__RISCV__IRQ_H */
 
 /*
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/asm/setup.h
index 2215894cfbb1..9dbd3a8cbef7 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,6 +5,10 @@
 
 #include <xen/types.h>
 
+struct domain;
+struct dt_device_node;
+struct rangeset;
+
 #define max_init_domid (0)
 
 void setup_mm(void);
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 7f9850416bb4..a24c679c0cf8 100644
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
@@ -86,6 +88,22 @@ unsigned int intc_irq_nums(void)
     return intc_hw_ops->irq_nums();
 }
 
+int intc_route_irq_to_guest(struct irq_desc *desc,
+                            unsigned int priority)
+{
+    ASSERT(spin_is_locked(&desc->lock));
+
+    ASSERT(intc_hw_ops->guest_irq_type);
+
+    desc->handler = intc_hw_ops->guest_irq_type;
+    set_bit(_IRQ_GUEST, &desc->status);
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
@@ -112,6 +130,14 @@ int domain_vintc_init(struct domain *d)
         break;
     }
 
+    if ( !ret )
+    {
+        d->arch.vintc->allocated_irqs =
+            xvzalloc_array(unsigned long, BITS_TO_LONGS(d->arch.vintc->irq_nums));
+        if ( !d->arch.vintc->allocated_irqs )
+            ret = -ENOMEM;
+    }
+
     return ret;
 }
 
@@ -129,4 +155,14 @@ void domain_vintc_deinit(struct domain *d)
         printk("vintc (ver:%d) isn't implemented\n", ver);
         break;
     }
+
+    xvfree(d->arch.vintc->allocated_irqs);
+}
+
+bool vintc_reserve_virq(const struct domain *d, unsigned int virq)
+{
+    if ( virq >= d->arch.vintc->irq_nums )
+        return false;
+
+    return !test_and_set_bit(virq, d->arch.vintc->allocated_irqs);
 }
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 25d329500212..4481ae23aa8e 100644
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
 
@@ -221,3 +239,160 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq)
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
+#endif
+
+    /* If this was the last action, shut down the IRQ */
+    if ( !desc->action )
+    {
+        desc->handler->shutdown(desc);
+        clear_bit(_IRQ_GUEST, &desc->status);
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
+    action->free_on_release = 1;
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
+                printk(XENLOG_G_ERR "IRQ %u is already used by domain %u\n",
+                       irq, ad->domain_id);
+                retval = -EBUSY;
+            }
+            else if ( irq_get_guest_info(desc)->virq != virq )
+            {
+                printk(XENLOG_G_ERR
+                       "d%u: IRQ %u is already assigned to vIRQ %u\n",
+                       d->domain_id, irq, irq_get_guest_info(desc)->virq);
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
-- 
2.54.0


