Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9CEACF39A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:59:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007096.1386446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND07-00015p-Rq; Thu, 05 Jun 2025 15:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007096.1386446; Thu, 05 Jun 2025 15:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND07-00014C-Hw; Thu, 05 Jun 2025 15:59:31 +0000
Received: by outflank-mailman (input) for mailman id 1007096;
 Thu, 05 Jun 2025 15:59:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uND05-0007U9-Hf
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:59:29 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fc10a4e-4226-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 17:59:29 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-60700a745e5so2149583a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:59:29 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c2aba9sm10443034a12.2.2025.06.05.08.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 08:59:22 -0700 (PDT)
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
X-Inumbo-ID: 0fc10a4e-4226-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749139163; x=1749743963; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ovFmXA1UGXAtGGADABCiptgNt0/VbJsXEb5lSAcJ+w=;
        b=D5H+P7JAVlzAyI9l3neesNNWrS+ohzxZrt3AMghVcjFNk10YY7SF500T6i5KtAc5sq
         AiQvAdSicoAdEjFbBMVK+EFigs2nKcP0ojT1v8OFEwUuFtgnVbyjKZCZUaxhS7957FvG
         M3nLmc2yUCjc9xyGcSd4Rr++TAm+hoNV7GMZZzV+t1y08Tg0iXF5PlhlD6IpjmRFt/wH
         c4sbSpVzaXKS3LHR9oxPhrbTWk+DKe3y+xavYfq7SxxVYS1E8c2h9Hemv8zTCy7ZAKqi
         uZPxHdzlSR+I6ZdSHfeubW6OE9y9RY8fAJUCiEMkDPCa8nicDQMtByGvcwSuhEYPIRnE
         ENyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139163; x=1749743963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ovFmXA1UGXAtGGADABCiptgNt0/VbJsXEb5lSAcJ+w=;
        b=N0FxxalzA8FspI2gUoHMtSE703h7nGwc91Q6X4u/eLC0rFPwHyBFyMAxwcpQ9UML31
         xCt+MgylgzGuoKFnSILf4KbPhsNAHxrHw+pWkOyZ/n3Y7Jx19sBjSJgOGECZ8Zw/4wFW
         6qKcdSMZK9Rn6gKDj76+zb0C26F7DBnP/rYSbHJeh5+ZhshVpJxw4Ltf66DLrW35Jtzx
         EU3pdSMJQzCOzyUa4aBUHUvu8x2MpnUOPsjuItwPLQHI+PJzEM55aF5lpH3IlEkcn569
         I3dZCWptg2YL0gXisptkyPXtCUm0H132e8ymQTwCtTdSXzpnzkc4ZiqViwQNrXULbJan
         CmsQ==
X-Gm-Message-State: AOJu0Ywm8IdlNvv8kiaIzbnt7W6YSwzE3235kZqBIELziThEKxaegLCY
	TCZ18mP9HEx9HPO+StR7sJ41L+b2XJtnKIEt97jg2n+ZqPPEMqoCIdq0mvMJQw==
X-Gm-Gg: ASbGncsnON91FTUKYXaII0tcHubvIKDIPLjo8bU5YA4cHx/+BWYR5/Y0yOf0O6nUkep
	I04WD6t7d7DjXkO0BCCHyiqpaKnkn/rbPJYHn3stgxGxIS/uAPqUrO1H6YdzmkiD9uAW3aXUZF5
	C2V5Mu3PhNYvVSAqy6lCru03k+UbBnoSmUR/hVJ4Pv8jbPwEL7k/5drIaf0DhCtcWz2mqL9X1uA
	PFsXiUTNBIWT7s4jjX4tEkelSgDPsiVSQzOBu1IA+c+Bq/efL2uyJ7AKLV2JrZoY5Jvqch/SZJT
	TqrZ5LeYJpFHkKy/cTlG09Lr/i/RpMNTv0ArkpiM/0BlwFY8gGpovmK2hhSP/whMTeoZCeI1ys8
	WDvnNY8moOnwuEdgVTuPcAXzgG7Ka
X-Google-Smtp-Source: AGHT+IGiKozMXs76mhqmQRjxPg/vaDVehgBJBskLlP1rKEzmzMq8d3rg8rqpjs455MmbG2b488tCZA==
X-Received: by 2002:a05:6402:510e:b0:606:df70:7aa2 with SMTP id 4fb4d7f45d1cf-606ea3a78d7mr7351408a12.31.1749139163381;
        Thu, 05 Jun 2025 08:59:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Romain Caritey <Romain.Caritey@microchip.com>
Subject: [PATCH v4 8/9] xen/riscv: implement setup_irq()
Date: Thu,  5 Jun 2025 17:59:04 +0200
Message-ID: <4f2c15a95b1fb2720ba0643f668f080e8b390613.1749121437.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749121437.git.oleksii.kurochko@gmail.com>
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce support for IRQ setup on RISC-V by implementing setup_irq() and
__setup_irq(), adapted and extended from an initial implementation by [1].

__setup_irq() does the following:
  - Sets up an IRQ action.
  - Validates that shared IRQs have non-NULL `dev_id` and are only used when
    existing handlers allow sharing.
  - Uses smp_wmb() to enforce memory ordering after assigning desc->action
    to ensure visibility before enabling the IRQ.
  - Supports multi-action setups via CONFIG_IRQ_HAS_MULTIPLE_ACTION.

setup_irq() does the following:
  - Converts IRQ number to descriptor and acquires its lock.
  - Rejects registration if the IRQ is already assigned to a guest domain,
    printing an error.
  - Delegates the core setup to __setup_irq().
  - On first-time setup, disables the IRQ, routes it to Xen using
    intc_route_irq_to_xen(), sets default CPU affinity (current CPU),
    calls the handler’s startup routine, and finally enables the IRQ.

irq_set_affinity() invokes set_affinity() callback from the IRQ handler
if present.

Defined IRQ_NO_PRIORITY as default priority used when routing IRQs to Xen.

[1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7390e2365828b83e27ead56b03114a56e3699dd5

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3-4:
 - Nothing changed. Only rebase.
---
Changes in V2:
 - Added implenmtation of aplic_set_irq_type() as it is going to be used in
   this commit. And also, update the implementation of it. Make default case
   of switch to do panic().
 - Move all forward declaration up  in asm/irq.h.
 - s/__setup_irq/_setup_irq.
 - Code style fixes.
 - Update commit message.
 - use smp_wmb() instead of smp_mb() in _setup_irq().
 - Drop irq_set_affinity().
 - Use plain C operator instead if {clear,set}_bit() for desc->status as it
   is always used under spinlock().
 - Drop set_bit(_IRQ_DISABLED, &desc->status) in setup_irq() as in the case
   when IRQ is setuped for a first time, desc->status should be already set
   to IRQ_DISABLED in init_one_irq_desc().
----
 xen/arch/riscv/include/asm/irq.h |  2 +
 xen/arch/riscv/irq.c             | 84 ++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 94151eb083..f633636dc3 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -17,6 +17,8 @@
  */
 #define NR_IRQS 1024
 
+#define IRQ_NO_PRIORITY 0
+
 /* TODO */
 #define nr_irqs 0U
 #define nr_static_irqs 0
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 466f1b4ba9..25d3295002 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -7,6 +7,7 @@
  */
 
 #include <xen/bug.h>
+#include <xen/cpumask.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
@@ -63,6 +64,89 @@ int platform_get_irq(const struct dt_device_node *device, int index)
     return dt_irq.irq;
 }
 
+static int _setup_irq(struct irq_desc *desc, unsigned int irqflags,
+                      struct irqaction *new)
+{
+    bool shared = irqflags & IRQF_SHARED;
+
+    ASSERT(new != NULL);
+
+    /*
+     * Sanity checks:
+     *  - if the IRQ is marked as shared
+     *  - dev_id is not NULL when IRQF_SHARED is set
+     */
+    if ( desc->action != NULL && (!(desc->status & IRQF_SHARED) || !shared) )
+        return -EINVAL;
+    if ( shared && new->dev_id == NULL )
+        return -EINVAL;
+
+    if ( shared )
+        desc->status |= IRQF_SHARED;
+
+#ifdef CONFIG_IRQ_HAS_MULTIPLE_ACTION
+    new->next = desc->action;
+#endif
+
+    desc->action = new;
+    smp_wmb();
+
+    return 0;
+}
+
+int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
+{
+    int rc;
+    unsigned long flags;
+    struct irq_desc *desc = irq_to_desc(irq);
+    bool disabled;
+
+    spin_lock_irqsave(&desc->lock, flags);
+
+    disabled = (desc->action == NULL);
+
+    if ( desc->status & IRQ_GUEST )
+    {
+        spin_unlock_irqrestore(&desc->lock, flags);
+        /*
+         * TODO: would be nice to have functionality to print which domain owns
+         *       an IRQ.
+         */
+        printk(XENLOG_ERR "ERROR: IRQ %u is already in use by a domain\n", irq);
+        return -EBUSY;
+    }
+
+    rc = _setup_irq(desc, irqflags, new);
+    if ( rc )
+        goto err;
+
+    /* First time the IRQ is setup */
+    if ( disabled )
+    {
+        /* Route interrupt to xen */
+        intc_route_irq_to_xen(desc, IRQ_NO_PRIORITY);
+
+        /*
+         * We don't care for now which CPU will receive the
+         * interrupt.
+         *
+         * TODO: Handle case where IRQ is setup on different CPU than
+         *       the targeted CPU and the priority.
+         */
+        desc->handler->set_affinity(desc, cpumask_of(smp_processor_id()));
+
+        desc->handler->startup(desc);
+
+        /* Enable irq */
+        desc->status &= ~IRQ_DISABLED;
+    }
+
+ err:
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    return rc;
+}
+
 int arch_init_one_irq_desc(struct irq_desc *desc)
 {
     desc->arch.type = IRQ_TYPE_INVALID;
-- 
2.49.0


