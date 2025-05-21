Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A060AABFAE0
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:11:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992217.1376061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHm1m-0004dJ-C7; Wed, 21 May 2025 16:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992217.1376061; Wed, 21 May 2025 16:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHm1m-0004Z0-81; Wed, 21 May 2025 16:10:46 +0000
Received: by outflank-mailman (input) for mailman id 992217;
 Wed, 21 May 2025 16:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvU-0004XB-Eg
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:16 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eae0dbe-365d-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 18:04:16 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-60179d8e65fso3006359a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:16 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.04.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:04:11 -0700 (PDT)
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
X-Inumbo-ID: 3eae0dbe-365d-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843455; x=1748448255; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlWbz8bLXM971n4ELjNA8FOn3nNYfb72U/n4kfm36CE=;
        b=Z3yHxa2yZ+JqbV2x2QrfwdUaISVrvbE/uI9zQxqn9w14GEgkGrQJQeX117q/pXQQKW
         mUONbn6sFd/uyOXh1ODngAb0dDK4PUSBLA2KKcc0we8BXF+PjIenf7zG1l79EktMFnRW
         YJWnCnNvMG4d+uFM+BXEBrsBUFM7YEzs6l4jbRUWigzAtUdOmrKHq2o7WAYxDeMQikK6
         AV6UT4OV1dSl3hBwrNOZXPB0qFJH+M58tnnfKX1z91JjM8r/sP1fs5bf9kawYmDDgKh7
         8wu+HdtXjcv6a4psGDyk1XpKnr3XIPW1F8x2gCsWgA2y+0Sz71q/l1ONI5hIQJnLq4v4
         5e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843455; x=1748448255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JlWbz8bLXM971n4ELjNA8FOn3nNYfb72U/n4kfm36CE=;
        b=se7hQ6MDip/Xqa7HeX7s7wAxxiEJ82NBeKTiLZz4HjPqfSHkpv55RYGleLsyVvHr5o
         EgXzKsQPdSoXukKUJBaJthFRkAgI7qjBJraRoSJeota6SwNPfUbm8CJpaE11A3mEzRY/
         ZrF0CWCzScH9+3Xuo9O4wUAyilTVssS/Qj/8SSK9S9K88PqL5Z0d1g1nOSVomk9/8BpK
         //4GcwtQQu61oCT097qWwWrhOV8PMNJDIjPT5yI/SOMUP4cGil7ysdUbH3PK71CEC2F6
         Y3rIqUSlK9Rz8+3BgrXfMhkYOdEjNMvsKlKeAmDmAVtyonS+39oZDpOThee5BR38mnPL
         iZcQ==
X-Gm-Message-State: AOJu0YxIFH1Z1R6U79UgHU1sMFPNRbbQ4zjXkL93b5cH6rAP1H69VdkV
	PziXGx527errBOiHpO5QaIRCB/P9JcSnABgRmG7XUnYyYWtnq+Tw7zrq9gBRZQ==
X-Gm-Gg: ASbGnctL+WzeqAS5peot+qEdZmNbZqV/LId/xB/DWDy/fm6SfJYR0NdeO7PSjrJt5N3
	4IxjkjDQ87QlnkoYMeuoZlIpppuX32v5t1niVen2P9oxLpUbsjnpcgxVC08UQKaHGX04fChdBFj
	aliVN3njk93WXC/YrN4MTJLGm9ktdgIcBgzO2RUsuJDLjrN7VlsgNQB9FIDcmxWKSSKobJh1av+
	tj6pDU7BaK48UxwYkJgWNzFvKThiMmMcOn6NDX7QWj08nCuBlgZMC1pWSpzwc6zpYYlO3Ri4zlL
	2tpDisvA2/3GhWguQlLIa9vOIldbpF0LHp6OdSYoUwWmfUi3u+w0xFpzZWSg15/E6batO46uGxK
	NBKTkBOPsiCyX7yaWuQ==
X-Google-Smtp-Source: AGHT+IFvXA5o4dcbptWPK9BfnqNxYlHv9zOXStdBdVOGxjEE1H2yKuHdQ4hApBcrS7rYn3vsPx8Svg==
X-Received: by 2002:a05:6402:848:b0:602:4405:7779 with SMTP id 4fb4d7f45d1cf-60244057a3amr1383333a12.20.1747843452136;
        Wed, 21 May 2025 09:04:12 -0700 (PDT)
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
Subject: [PATCH v3 13/14] xen/riscv: implement setup_irq()
Date: Wed, 21 May 2025 18:03:53 +0200
Message-ID: <5c7105aaf0a249cb86321ff58796658f69ad0f2d.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
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
Changes in V3:
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


