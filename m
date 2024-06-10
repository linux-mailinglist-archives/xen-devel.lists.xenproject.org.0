Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0128C901B71
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 08:54:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736903.1142987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYuj-0002dY-4X; Mon, 10 Jun 2024 06:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736903.1142987; Mon, 10 Jun 2024 06:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGYui-0002ZW-To; Mon, 10 Jun 2024 06:53:56 +0000
Received: by outflank-mailman (input) for mailman id 736903;
 Mon, 10 Jun 2024 06:53:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FMhB=NM=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sGYuh-0002SJ-J0
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 06:53:55 +0000
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3391d7a6-26f6-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 08:53:54 +0200 (CEST)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-a63359aaaa6so594625266b.2
 for <xen-devel@lists.xenproject.org>; Sun, 09 Jun 2024 23:53:54 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1e6795b9sm107981966b.174.2024.06.09.23.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 23:53:52 -0700 (PDT)
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
X-Inumbo-ID: 3391d7a6-26f6-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718002433; x=1718607233; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JceofD7RBMGtBhxQJQYStOTtcfNOzjMXKDJSoSIwmug=;
        b=JaWqYG55WainfdKf+S2kg5CQ07FYmhbpwoj0U4RaPRbWap2Ml+0/l7yejbeTiIxd5O
         0lsUwdYQ+U7xGeGRiA6/Q+T7TnJLAZL8IqJsREGYbqqtxw4s+Swm9rF7b0yaMZXNY64p
         CqqSg6Q7pf2X9ICvZRS5rd78KC6j6F8UMmZx7t0a9HZWj7cctJ8oeXwTBuQJBlXpVyEu
         25wQan0tfVwqUmTQVTOWHdwahyTaezxlaBj0LVNz1lJhI6uQRJxuEycUgPHPJxpWoXoF
         lgEYCr7sDzCnmwEfhNyl108f70Njx0cAlNLGLwuG4xPVGSnwKvzc2vilpVJFCR/Sf0VE
         oPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718002433; x=1718607233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JceofD7RBMGtBhxQJQYStOTtcfNOzjMXKDJSoSIwmug=;
        b=UNyhsPTOP3G0fgmNM9MD5Kl1Es69F5YMNkH2jrxsMcNQNqpfUvIymnVNkURpUjb269
         wvVdBvQCARlkVQp5ztZNXfbk0YzrpAASQ1cOBSHSPoSOElFz8KLGU3qfJsRhJuucelWL
         HZIrPfLh6ts08kTk1kBqtosrV4mR9Wc3oK+FaZUgdDbtRX7ee1K3/UqptxdISRblQrGJ
         ANaKE4DRy8siHr2R0t0pa7rl/J9KMlWBe1KKv9H71rSVcr87t8Mrpb1Vi+efDGL1DasO
         AuPEGnfxr0k0iyFjQu1N1gV6OrFh3ggvPJLPcA78g+Lg55/0Y+WNS1Bt5PraeE3CTcDL
         Mviw==
X-Gm-Message-State: AOJu0YzfOgGH1k2jZVwKpvmL5DCKU6m26jRI0gl4acXs8eEAKrfV+Bh5
	q7PXfXMNos6w6dvEt45T5U/uTGW+sU2RzNRODsSmYLcQaMKCmHgm8XONQQj1Dcv5d+Xtg63Pu9n
	4YUf5wA==
X-Google-Smtp-Source: AGHT+IENIvSGyjGpOz9XjYX5uB8uPLMvPPR9yA55yF5Sw+1pXuvS4Hh317Vncdxx9CfRgcNU+2A6zw==
X-Received: by 2002:a17:906:1c87:b0:a6f:1106:5dc7 with SMTP id a640c23a62f3a-a6f11065e29mr239543466b.5.1718002433493;
        Sun, 09 Jun 2024 23:53:53 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [XEN PATCH v6 4/7] xen/arm: allow dynamically assigned SGI handlers
Date: Mon, 10 Jun 2024 08:53:40 +0200
Message-Id: <20240610065343.2594943-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240610065343.2594943-1-jens.wiklander@linaro.org>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates so request_irq() can be used with a dynamically assigned SGI irq
as input. This prepares for a later patch where an FF-A schedule
receiver interrupt handler is installed for an SGI generated by the
secure world.

From the Arm Base System Architecture v1.0C [1]:
"The system shall implement at least eight Non-secure SGIs, assigned to
interrupt IDs 0-7."

gic_route_irq_to_xen() don't gic_set_irq_type() for SGIs since they are
always edge triggered.

gic_interrupt() is updated to route the dynamically assigned SGIs to
do_IRQ() instead of do_sgi(). The latter still handles the statically
assigned SGI handlers like for instance GIC_SGI_CALL_FUNCTION.

[1] https://developer.arm.com/documentation/den0094/

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v3->v4
- Use IRQ_TYPE_EDGE_RISING instead of DT_IRQ_TYPE_EDGE_RISING

v2->v3
- Rename GIC_SGI_MAX to GIC_SGI_STATIC_MAX and rename do_sgi() to
  do_static_sgi()
- Update comment in setup_irq() to mention that SGI irq_desc is banked
- Add ASSERT() in do_IRQ() that the irq isn't an SGI before injecting
  calling vgic_inject_irq()
- Initialize local_irqs_type[] range for SGIs as IRQ_TYPE_EDGE_RISING
- Adding link to the Arm Base System Architecture v1.0C

v1->v2
- Update patch description as requested
---
 xen/arch/arm/gic.c             | 12 +++++++-----
 xen/arch/arm/include/asm/gic.h |  2 +-
 xen/arch/arm/irq.c             | 18 ++++++++++++++----
 3 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index b3467a76ae75..3eaf670fd731 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -38,7 +38,7 @@ const struct gic_hw_operations *gic_hw_ops;
 static void __init __maybe_unused build_assertions(void)
 {
     /* Check our enum gic_sgi only covers SGIs */
-    BUILD_BUG_ON(GIC_SGI_MAX > NR_GIC_SGI);
+    BUILD_BUG_ON(GIC_SGI_STATIC_MAX > NR_GIC_SGI);
 }
 
 void register_gic_ops(const struct gic_hw_operations *ops)
@@ -117,7 +117,9 @@ void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 
     desc->handler = gic_hw_ops->gic_host_irq_type;
 
-    gic_set_irq_type(desc, desc->arch.type);
+    /* SGIs are always edge-triggered, so there is need to set it */
+    if ( desc->irq >= NR_GIC_SGI)
+        gic_set_irq_type(desc, desc->arch.type);
     gic_set_irq_priority(desc, priority);
 }
 
@@ -322,7 +324,7 @@ void gic_disable_cpu(void)
     gic_hw_ops->disable_interface();
 }
 
-static void do_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
+static void do_static_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
 {
     struct irq_desc *desc = irq_to_desc(sgi);
 
@@ -367,7 +369,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
         /* Reading IRQ will ACK it */
         irq = gic_hw_ops->read_irq();
 
-        if ( likely(irq >= 16 && irq < 1020) )
+        if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) )
         {
             isb();
             do_IRQ(regs, irq, is_fiq);
@@ -379,7 +381,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
         }
         else if ( unlikely(irq < 16) )
         {
-            do_sgi(regs, irq);
+            do_static_sgi(regs, irq);
         }
         else
         {
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
index 03f209529b13..541f0eeb808a 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -285,7 +285,7 @@ enum gic_sgi {
     GIC_SGI_EVENT_CHECK,
     GIC_SGI_DUMP_STATE,
     GIC_SGI_CALL_FUNCTION,
-    GIC_SGI_MAX,
+    GIC_SGI_STATIC_MAX,
 };
 
 /* SGI irq mode types */
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index e5fb26a3de2d..c60502444ccf 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -142,7 +142,13 @@ void __init init_IRQ(void)
 
     spin_lock(&local_irqs_type_lock);
     for ( irq = 0; irq < NR_LOCAL_IRQS; irq++ )
-        local_irqs_type[irq] = IRQ_TYPE_INVALID;
+    {
+        /* SGIs are always edge-triggered */
+        if ( irq < NR_GIC_SGI )
+            local_irqs_type[irq] = IRQ_TYPE_EDGE_RISING;
+        else
+            local_irqs_type[irq] = IRQ_TYPE_INVALID;
+    }
     spin_unlock(&local_irqs_type_lock);
 
     BUG_ON(init_local_irq_data(smp_processor_id()) < 0);
@@ -214,9 +220,12 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq, int is_fiq)
 
     perfc_incr(irqs);
 
-    ASSERT(irq >= 16); /* SGIs do not come down this path */
+    /* Statically assigned SGIs do not come down this path */
+    ASSERT(irq >= GIC_SGI_STATIC_MAX);
 
-    if ( irq < 32 )
+    if ( irq < NR_GIC_SGI )
+        perfc_incr(ipis);
+    else if ( irq < NR_GIC_LOCAL_IRQS )
         perfc_incr(ppis);
     else
         perfc_incr(spis);
@@ -250,6 +259,7 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq, int is_fiq)
          * The irq cannot be a PPI, we only support delivery of SPIs to
          * guests.
          */
+        ASSERT(irq >= NR_GIC_SGI);
         vgic_inject_irq(info->d, NULL, info->virq, true);
         goto out_no_end;
     }
@@ -386,7 +396,7 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
     {
         gic_route_irq_to_xen(desc, GIC_PRI_IRQ);
         /* It's fine to use smp_processor_id() because:
-         * For PPI: irq_desc is banked
+         * For SGI and PPI: irq_desc is banked
          * For SPI: we don't care for now which CPU will receive the
          * interrupt
          * TODO: Handle case where SPI is setup on different CPU than
-- 
2.34.1


