Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19B2AFAF1F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 11:02:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035349.1407648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhjl-00043e-Hc; Mon, 07 Jul 2025 09:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035349.1407648; Mon, 07 Jul 2025 09:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhjl-0003zt-A5; Mon, 07 Jul 2025 09:02:09 +0000
Received: by outflank-mailman (input) for mailman id 1035349;
 Mon, 07 Jul 2025 09:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItPy=ZU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uYhjj-0002wP-7B
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 09:02:07 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dba57fc-5b11-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 11:02:05 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ae0e0271d82so582458066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 02:02:05 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b04d30sm662892766b.133.2025.07.07.02.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 02:02:03 -0700 (PDT)
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
X-Inumbo-ID: 0dba57fc-5b11-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751878924; x=1752483724; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7Ybpu7ozA8JgKQL7KWhzMFz0aX51gKmDoLYfs8b11Q=;
        b=VNoATqd66Cui4IwvSA8fKj25ac9O8KVdpUehraeGPkdRb8mLoBf6od0OopoeJX5/Dy
         4qDWNB54pKOO4RDA84iBnwpLPLVJv1a041nA5iH2Cajg5bDm/ipV+mpKwfgy3CZHdZRm
         NzwZ0+9ApX1H+ANY4YClUZh97VJJSasRBQvzXhHRONVzGLhZ9E94/889sdROdmeXgpTY
         IqxhXA7Nd76MJdVxsO/qtpVONGO7cpdXB1GIelPBTkmraIjoH0PW6GyaoHF4DYdmjnpC
         9Jt8Ti5Q/an5O1GFElEbRcpG1jo/R5VHzNy6MFmg+0idnw19+dXrMeN3ScDlVmG/p+oB
         xlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751878924; x=1752483724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7Ybpu7ozA8JgKQL7KWhzMFz0aX51gKmDoLYfs8b11Q=;
        b=c6NrFKIg5mt7SOTn0Tw5Lc8K68W36zgOwgrDJ2WNEWV8oQMq9rAO9JSvNJoyHfwCq4
         vk9GgNCZKkuyR+o43UHxiiJQZutZonguj2zrnWF5rmcvgHSekG3Tm/IcMSDsWSzQXoqZ
         dxqYpMpTeh1OeZHiQlLL4rmt6n9eore7pExAxwIpGUBt+WTNx9T21uAGkiO7a2YaNiIK
         XB13AKl7D2wcaYAmmjsCdlEjHQy7kUZu4/Xx6QAfcLcXMND3xm47E5Yq14bZ9wE/9VQF
         ExU7Vbf3mOvgXp57rdOGPwaqqJ4fPO84PTwOarOvhqXc7CtbEK38AbB9l/7zS/ZzSVaa
         o2gA==
X-Gm-Message-State: AOJu0Yx9WD9VriuhoFBEab4gTbVAYIqMBK1sXmm7Ki8yVkcEFhrmqaQj
	EU3uzuvrENGQKCrQQU47Ph375EbdWWNYCuE7exBsYfFkVzmRq0FpPRiPXNYC8A==
X-Gm-Gg: ASbGncvM/klpgur+h94I/M9qdIxwvIJHfQj66EC4SKcsmen+uU26UxVfkw1YW1hQoXS
	oFt48Zf6OaGcpGl76RCxARVhd3dBtoP8L706RiHDdXL5Ygvpn26ea0b3U4CnbWDueBpcpGe7Yr+
	1JqLohy2qnydohUgqjGxeWGjvrjjWwIkwiQ1CGA6UAgn4XMAFS4B9Akhq8wsRuhaIj6HdTlIPB3
	3osGh+xSyBfBjZ+5JLZbOV0UVbpsCrUGtE6uCYm5g1J380slxQj5afUCjhss+KUdFsC7C4yd2zV
	FxRG+VPWahBt8Lqp+CFM9xn5dmDrihNeXwxUy2yoXo9braJQIHUubrEQgKT36jl4NlzceHbEIJ1
	QoYa8k676c+TE6Hbzsf6uA+si+Q==
X-Google-Smtp-Source: AGHT+IFHz/oTCD+rMct36UjbtVdKadw7+Qndwouf7hIs0WWrHrl0FotTMw7dNvU0kkKCRObPLtOmSg==
X-Received: by 2002:a17:906:c10d:b0:ae3:f524:b51 with SMTP id a640c23a62f3a-ae41079d210mr725450866b.10.1751878924156;
        Mon, 07 Jul 2025 02:02:04 -0700 (PDT)
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
Subject: [PATCH v6 6/7] xen/riscv: implement setup_irq()
Date: Mon,  7 Jul 2025 11:01:42 +0200
Message-ID: <508646feadbff6409d2415ac695c215f6fc9182b.1751876912.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1751876912.git.oleksii.kurochko@gmail.com>
References: <cover.1751876912.git.oleksii.kurochko@gmail.com>
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
Changes in V6:
 - Nothing changed. Only rebase.
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
2.50.0


