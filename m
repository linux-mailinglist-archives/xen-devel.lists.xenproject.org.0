Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88043AD91DC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014635.1392806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eV-0000Xe-Pm; Fri, 13 Jun 2025 15:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014635.1392806; Fri, 13 Jun 2025 15:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eV-0000RO-HE; Fri, 13 Jun 2025 15:49:11 +0000
Received: by outflank-mailman (input) for mailman id 1014635;
 Fri, 13 Jun 2025 15:49:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6eT-0006cn-Mt
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:49:09 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0c278db-486d-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 17:49:07 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-60727e46168so3871602a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:49:07 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8979563sm144821766b.158.2025.06.13.08.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:49:06 -0700 (PDT)
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
X-Inumbo-ID: f0c278db-486d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829747; x=1750434547; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ng1/O00EG3qvzx6QpvcaagFyielcBbUguKaEDbZry58=;
        b=KU60eSabMvBT28/NMRtsePRG499XRve6L4Z06PpYCNNuCmGjxSAln/UlhrYGE57G9y
         0HtxvJUrFadU11dHVX/lXu7tL6rfG6hWi0/ai4q4YoCRhoaSpNa8wYbziC7z1L476xro
         /Qsz3JFeGnZiDOlArXZJJlFbjCoMGIiOpETih9mbkHFFWlx4SpsOwGMTuywxzmmORweR
         ZCO0+ohxac2wcMo404auTXC7lvIBVN4asiKPRQ4i0vWXkKLHcvowiyHbqs/hm2ASdWZk
         xy5cMNlR67Ra8K3ayNPIFuqxQK5UtPkk7WYDc1aLeRM1qSdQly7dseTKYCbfx3+MzQZa
         26CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829747; x=1750434547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ng1/O00EG3qvzx6QpvcaagFyielcBbUguKaEDbZry58=;
        b=fFKtHb4ZgP8MnpeNhjNTucMaaSGXsJsX9Hr5LrrgKCat1GDJd1ICviQ/deyHAUMptE
         rLhz53U3yKjNnqkGYBKa8ha1wHkZHwqMO8hB4EwhSeAXn8GMdqrcOlrCwLmBMrxsoGTn
         LO0UQ//iaWK+XuUtFbw45SSVRZXOf7u2DZ1jD3kApk3pI/wcx7SrE8wcFaolTS/ADaxk
         uMQZWAeswdexYTWPH9wIBVn1uhsai1gSa8zLTZkvmoFhxPqt3Bdhr3bV/YNNTk+l+6Zv
         5wCTu6ldj7NLUq4lZ84bwc+Hgvoo/fAF6ASg5HlUBgvfUF5rOd3YUhBD/KV3tC+kR+8M
         a/4w==
X-Gm-Message-State: AOJu0YwHWEargPLB9/plR7TRRKGjIXCPrHJGBtI5kKabdwdDFTcs08i3
	G0SnwJretDbKy4tfzyeRYW06RHcvfZonuQMwKlguyIV8+Fh36QXGMR/J6emPbA==
X-Gm-Gg: ASbGncsD+AZP0s0Yg9rCgvys2z2Jg9j+9xKJqcGCZTX+NxiVO4ln2DoBM47JEHSCMep
	OO76IdS6QViW44gnSr3Kg+T0YvcTLL1SzA+QEgEo47i0YfKXoJ0J1RkpG9z/7DHxJDxUbE2iUU7
	iFxModBgRGGofncOaL6KBf9RqfBfPJWBWIfBLwZqtPeWducRYgRzNV/zlmCmUKwEzLaqFqQBKTr
	VfgcwGaFyYxI2LUu6Ryx1CbKKb6dNQtKN4oDaNfxjC5Wc0HPCU7Bpx/TySOU9qnAYKWPVXsiqVM
	RwMYkwFfcq4T1myPpDAO8JsT5HPR8LKL/flAEnCGoAW0b1MBxKALzB2+tvTxZCjoMS2dsJSvUMs
	epPGg4pTQ75ULhKrpWhjYcciU2dY5pBPb60FQ3mY=
X-Google-Smtp-Source: AGHT+IE/3Xp4wH/5ZF0WFtvv8fz0DGFg6r9En/d1UaVZQcK/0802/7eUP+YSNHJznRL7QFiHkNUV5A==
X-Received: by 2002:a17:906:7956:b0:ad8:a4a8:103a with SMTP id a640c23a62f3a-adec559616cmr391301766b.4.1749829746719;
        Fri, 13 Jun 2025 08:49:06 -0700 (PDT)
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
Subject: [PATCH v5 8/9] xen/riscv: implement setup_irq()
Date: Fri, 13 Jun 2025 17:48:47 +0200
Message-ID: <eed2259da2e7c39232a41d4a4f11c1c406ddff15.1749825782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749825782.git.oleksii.kurochko@gmail.com>
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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


