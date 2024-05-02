Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E990E8B9CF1
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 16:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715881.1117884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Xrq-0000aw-Pg; Thu, 02 May 2024 14:57:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715881.1117884; Thu, 02 May 2024 14:57:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Xrq-0000Y1-Lj; Thu, 02 May 2024 14:57:02 +0000
Received: by outflank-mailman (input) for mailman id 715881;
 Thu, 02 May 2024 14:57:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZceG=MF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1s2Xrp-0008Nr-5q
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 14:57:01 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a1fb8c6-0894-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 16:56:59 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a55911bff66so1022060266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 07:56:59 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 i15-20020a0564020f0f00b005726dceb2easm621919eda.20.2024.05.02.07.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 07:56:57 -0700 (PDT)
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
X-Inumbo-ID: 3a1fb8c6-0894-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714661818; x=1715266618; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQ4pg/w8bSmRL+E3Xx38ujJg69A1ctGlBgRe1phhh4c=;
        b=IQbKVC8jqOFXn247TIW9IcJupZwTWJl2+/AtW3llvHDSlebkyF8nSzpPPOXecxJyhf
         rSGgqkaPJSn/12JDc4jxly6/Usn8Kv7UsosncsehsptxdDk2yM3v63tqQK/iQ8HKFWkF
         WTN8RhPZRw0H8T84D27halQqA51CC+7SjsjcTXZdd8yGQecrfNgpj7Ro3pDCrKUj9qGt
         v+JHYCTJKek6OvXBSjCev5jPFYeIqvbOH5ghZwHxfEjeRcCNdLpjuoC+ehRyo1hb1mtY
         FqN3L14ZzqZmLRFyPKrSWcsmegzkJDfq4XqFEE9w+0r0uo6aMzOV5RiO7Bo88zy7rqBi
         3zEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714661818; x=1715266618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQ4pg/w8bSmRL+E3Xx38ujJg69A1ctGlBgRe1phhh4c=;
        b=kMVvStg52jABNj7tQ05umYLN9xTBzYrS8CxxsXNPBILXreJ3+l/wnjKDSX7XCiobEd
         7iyd/zoNHX6790VgAzpXLZN48d0HvQpufq8QJDHrmQGOH59F4heqkLTJTm0Yn4EDo3oV
         36wxV6oOdWd25RcsxYyVInfMtFFqElEnY6UVwPUc9LiWknmtK73q+2VE9I56ww6US0ln
         gRc6eKBcOQFW11erqhx9kCDIWq5HOuxkovhkxMfDj8fA1b6Sm2J9XkHGt9+sgynf1wvF
         C7DCq/RUUyZbxZsj7F/q9nFlNwyiakwmpFnXPblTNpNRsVHQWut/Klpua035zq9BlHqE
         oR3g==
X-Gm-Message-State: AOJu0YxSN6lugrvtv1eEOsJQ/JL8lihbH6pjBomQXr2LqP6x6/cyP8rC
	0u1DDbUXcIMzOXIYRsVk+zQQLb3fexcVY60I7XxoR+wPrCz4rvs4QReKoxqZU8K9gPd+Q860vXd
	q
X-Google-Smtp-Source: AGHT+IFpPzIsWmfh/PLDEHEqquyefJY5D949+YxCRmBuJGZjQ9NOdEbnTp95aeqVKK3HWtO3bWmhXg==
X-Received: by 2002:a50:d597:0:b0:572:9d24:257a with SMTP id v23-20020a50d597000000b005729d24257amr4480385edi.23.1714661818693;
        Thu, 02 May 2024 07:56:58 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v4 4/5] xen/arm: allow dynamically assigned SGI handlers
Date: Thu,  2 May 2024 16:56:44 +0200
Message-Id: <20240502145645.1201613-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502145645.1201613-1-jens.wiklander@linaro.org>
References: <20240502145645.1201613-1-jens.wiklander@linaro.org>
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
index 44c40e86defe..882768252740 100644
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
 
@@ -330,7 +332,7 @@ void gic_disable_cpu(void)
     gic_hw_ops->disable_interface();
 }
 
-static void do_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
+static void do_static_sgi(struct cpu_user_regs *regs, enum gic_sgi sgi)
 {
     struct irq_desc *desc = irq_to_desc(sgi);
 
@@ -375,7 +377,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
         /* Reading IRQ will ACK it */
         irq = gic_hw_ops->read_irq();
 
-        if ( likely(irq >= 16 && irq < 1020) )
+        if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) )
         {
             isb();
             do_IRQ(regs, irq, is_fiq);
@@ -387,7 +389,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
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
index bcce80a4d624..5224898265a5 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -152,7 +152,13 @@ void __init init_IRQ(void)
 
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
@@ -224,9 +230,12 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq, int is_fiq)
 
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
@@ -260,6 +269,7 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq, int is_fiq)
          * The irq cannot be a PPI, we only support delivery of SPIs to
          * guests.
          */
+        ASSERT(irq >= NR_GIC_SGI);
         vgic_inject_irq(info->d, NULL, info->virq, true);
         goto out_no_end;
     }
@@ -396,7 +406,7 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
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


