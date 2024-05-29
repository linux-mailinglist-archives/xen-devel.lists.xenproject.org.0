Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41248D2E1A
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 09:26:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731499.1137060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhN-0004Xp-Jb; Wed, 29 May 2024 07:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731499.1137060; Wed, 29 May 2024 07:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCDhN-0004VF-F2; Wed, 29 May 2024 07:26:13 +0000
Received: by outflank-mailman (input) for mailman id 731499;
 Wed, 29 May 2024 07:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+wO=NA=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1sCDhL-0002xp-UK
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 07:26:11 +0000
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [2a00:1450:4864:20::141])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7b4ac3f-1d8c-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 09:26:08 +0200 (CEST)
Received: by mail-lf1-x141.google.com with SMTP id
 2adb3069b0e04-52b59f77670so93660e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 00:26:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:2043:5e37:9d00:b09:3200:dd72:cfc8])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296ee4a58fsm1182353e87.67.2024.05.29.00.26.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 00:26:07 -0700 (PDT)
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
X-Inumbo-ID: b7b4ac3f-1d8c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716967569; x=1717572369; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SILgfa72VI0ajqqfGUDbvcNqJ8ZZiLfW7kFdd1Zm0SE=;
        b=AuB4qbJ2xqimzqlEorSKI44W2m0Wekva43pyAvzluEBYQO/uksqZgbPHXejPJW+A7A
         A0MWYEnCBvwmnO7KNwEeUjMY0MStM2BfoCy+l7SWT+Gvi11A35jaLtlzzDzllpwcWxRq
         Mo4/WJUN7/fBOL7571xA6onMrSR84WT+JI4+OJGaKLwq2HH8Aj6H0LKdvj6/dHV4STbR
         TyxEk56Qtue/hNwxFOHEmCe2y67j5WpsNbQe9Q5R13J2TVCWvy5fb4VfeHRCOUlxQigb
         vtgZVxsxdNTFd29s6T+GkWNxQqFXk4jtePAlTNrmGIZz86iGsenRlGSeL86Ct4BairIX
         ai1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716967569; x=1717572369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SILgfa72VI0ajqqfGUDbvcNqJ8ZZiLfW7kFdd1Zm0SE=;
        b=Y78kyyTdgmyCjkUxf0blcYMLeUQqQ7vEMfCNnQcfDwlnwXK+TZTbxF9GRfVrL1mlyr
         /RZktFe1vkCbUNXcf2VTN8rmWEPm8WMLZM2SgvEYrUGlzP4tLPA0sloaj0r2FwIRW6hS
         P3FVal98/pp2pbmmc0Mr4aiNTlydZhZdYIfv6+OiWsf6Qf9PEB1nAb/Tv2QIEgM0VOsL
         pfQ1n8pOtLaDbtmeHc9MLjiBFnZN04cHdqFTZ0n37Ot0D1xjAS6KwCXEW0tVnbmwdWlI
         VULYjptIitvzDMW41RLqt6V7rXPkD2G/IZ+U1cXP+QaSHcUP80N/3AKwMJ0E30jks9Om
         xy2g==
X-Gm-Message-State: AOJu0YzBMnXzEG6TZJB2U0jRsGC+o78anRXPJWEvX3Oa/XTWVJVHJltw
	+oZhd1ihYkqUtWPaCxDlMNJQZgSLH9w+3GJtR91DbJfr6UkhN63dD+5x5UR/GV/kL4Po8kSDNFR
	RERFstg==
X-Google-Smtp-Source: AGHT+IGBGpu4uivcFEM720OCgQ74X83zEPu/U5/K/JeSfte5w6XVAwJSrJjdaWEyuMCcyTnyu21+EA==
X-Received: by 2002:a05:6512:344d:b0:51c:c7ad:329b with SMTP id 2adb3069b0e04-52965c30f7fmr11942347e87.30.1716967569170;
        Wed, 29 May 2024 00:26:09 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v5 4/7] xen/arm: allow dynamically assigned SGI handlers
Date: Wed, 29 May 2024 09:25:56 +0200
Message-Id: <20240529072559.2486986-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529072559.2486986-1-jens.wiklander@linaro.org>
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
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


