Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A928AACBCE
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 19:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977742.1364716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLge-0005lD-QY; Tue, 06 May 2025 17:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977742.1364716; Tue, 06 May 2025 17:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLge-0005jK-NV; Tue, 06 May 2025 17:02:32 +0000
Received: by outflank-mailman (input) for mailman id 977742;
 Tue, 06 May 2025 17:02:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWh-00058E-Ar
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:15 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7450c7d3-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:52:11 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ace98258d4dso866837866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:11 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:52:10 -0700 (PDT)
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
X-Inumbo-ID: 7450c7d3-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550331; x=1747155131; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74wiABz14bkw2Z/ZaZ483gmJiMxC4gHcocH3VFNYNbQ=;
        b=MBkhhV87eQ6bgaluAlm3NUhVI2I0x3LOURr+fUAZSXLD17RlMNOM0TFE1bLRihbuCj
         /aJDV3M4oBQrdywhmpfGMYfZ7rpZ0YUfYByHjBE9duXEzk4HqMXAi8akTPpavw45d4KB
         qPO1yAXRgCnSBk8nUTlDDXErgBrI1v04d3okFLwpBStC8NNdD4ylEGLGkgILiCeePBsF
         denSCbXPGlDX6vj/TK6FGdY4erhyClBX5B3ZppeeDGxwrcNZa8c08Reys4DgRulyNdna
         1EqhwH9FNDtpuQ7ODoURI68dku4cHNWWN7x47LtAQ5YzxwxRtlgn3x/MrpnJDEGRFfm4
         pCnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550331; x=1747155131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74wiABz14bkw2Z/ZaZ483gmJiMxC4gHcocH3VFNYNbQ=;
        b=Fl6vlptdQgRLqYXwNSDxgM4emYHS5vOH1MTc7J/1qTub3EBrJusytrFflP97F7B65F
         b1PV6jEV8DYpUexpfTgRyIhrq3Qwuvhj+GRVlTiKZsOgiaI+BWYNjzZEs/bu/MTmTerC
         l4fhBIJOKZ+KgtwVJlJz2IhD+AL5tETlIe2HUdfxvPv01OlBv4Y6eoyOGe5kzi3CH1lY
         MfEewK0XUMlSmu1JCNc52lJ8/pet+WnL/j491jQnw+etKNLthEY5oKEVvWHaZIJ2Fxwf
         CzRbxiezCiWs9egzQTrHj/ZNfbPHNbBevk7t9fwuWvp/vYiqBL2xRgr6k/pCqDk8PkUm
         Vfdw==
X-Gm-Message-State: AOJu0Yx1YcBH9MXIh7y5g/DHJ98xGq87dzSwWBWFcAS+tSU0IpjxhdfA
	GCDdsL7eaqJQDc+qoHeEeRKe+1QQYNhrDny+kAYb4KQgDoxvKDn6GFUdmg==
X-Gm-Gg: ASbGnctv3poAlvvredZkrlTfCHi1pXcLMlZ+GzmgxEFCXvGiEciMUaEYAW/+uErI56e
	y4lx78mlytoHzQlvbAvmkWkj9nB3nMximrNhfGVbaRaEokoiohMut5IxWeJYqEkUvm6YBTKBbyC
	Hzv0NtU7ERevCIiLmVkJ2nVltKEVLSOmzR/HuTDhLpXUoG2p2dcBBRtJLQaolo/Lavx8gJK5Upu
	QPPZW2N4ojF+LIbPi3UJRszMTk7j3QWgZymh7XG6ZeJk14MzkkjvwcYEj21TxMMIGVwHw5xPe5F
	Hts8oMcDDnlweK0ejGIMmq6UU9xEa/TFyb+28bYCsjrZIeEpmLKwkCn+mky7zA6icfJWLZ9qbHU
	NsP7QM/tgrg==
X-Google-Smtp-Source: AGHT+IFblu95xoNtRnG4Tji7qi8R+0NxWxbkXy0mdy5QOgL2ttB1oJu0kBzpaskg/5IPpBcIaP9wCA==
X-Received: by 2002:a17:907:1c12:b0:ace:3732:8a86 with SMTP id a640c23a62f3a-ad1e8d053a9mr17933666b.41.1746550330549;
        Tue, 06 May 2025 09:52:10 -0700 (PDT)
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
Subject: [PATCH v2 15/16] xen/riscv: implement setup_irq()
Date: Tue,  6 May 2025 18:51:45 +0200
Message-ID: <6f17bbf0eb6240d7389d389f0973af6fda5cce29.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
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
index 1a05c5ff88..d35fac0a86 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -9,6 +9,8 @@
 
 #define NR_IRQS 1024
 
+#define IRQ_NO_PRIORITY 0
+
 /* TODO */
 #define nr_irqs 0U
 #define nr_static_irqs 0
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 056bdf3ca8..969e22395d 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -7,6 +7,7 @@
  */
 
 #include <xen/bug.h>
+#include <xen/cpumask.h>
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
@@ -58,6 +59,89 @@ int platform_get_irq(const struct dt_device_node *device, int index)
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


