Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C40AC89DF50
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 17:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702503.1097594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruDWb-0005kd-OB; Tue, 09 Apr 2024 15:36:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702503.1097594; Tue, 09 Apr 2024 15:36:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruDWb-0005eU-ER; Tue, 09 Apr 2024 15:36:41 +0000
Received: by outflank-mailman (input) for mailman id 702503;
 Tue, 09 Apr 2024 15:36:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n+OA=LO=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ruDWa-0005IE-E1
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 15:36:40 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f565771a-f686-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 17:36:39 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a51a7d4466bso518056466b.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 08:36:39 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 gs44-20020a1709072d2c00b00a46a3ad035esm5849000ejc.179.2024.04.09.08.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 08:36:38 -0700 (PDT)
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
X-Inumbo-ID: f565771a-f686-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712676999; x=1713281799; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uEJrO4wREA7Y495lkxFCQXI3O8u6pydWDQAtd/HK8M=;
        b=oGNEd/lLI5v+J19dOV/2sePbBZGcjY1E8ymJ8bXIq8owBLcv/EUegKtFZ5w9pBo/3x
         CLwwe4sjbBW3FlkGQrrmRhmSSWqU8Br8TEiYQENrzatP6zUJ37zM9zlOBz+Kaoi9WBAx
         CAgctetevhuoUXk88cx93QNOtJtD1i7Vm0UUYqaTmPMMO4WGLjmBc7oB6dkNOxl8Le8K
         4e2+tNjoGcZJLU1LCzdAoCAc+I35lmX9bm8a5MppVMFbx7AKSYRioS9RNikzwpceM9fJ
         z/vLWSpX7FIKEX/SWGa4dJojzpB7PrZDS00Ep8MriqnGONjEBJjI0fgao1UNGlRgd4M4
         YBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712676999; x=1713281799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uEJrO4wREA7Y495lkxFCQXI3O8u6pydWDQAtd/HK8M=;
        b=E7xaA2DjadlkOrgwcEDJ+BLsET4qc2Y1aOVI7L/t3eyhcpxRjiFsEFyTR+MtMlusbS
         uzgf+DmL/bDOvVl4mguAs69VLSdDrN2eM8KxP9d5LV0bAHqTqeFWbLPdfStC2f7uFKA+
         KT2jmBxYclZMS+qaUGfQJAusy8NF7022y5YIV3GXBnoQpMnnw2d9g8OUNh5PwTR4zDEo
         UHbhMktv8MLVh37zWyn6d7DY9qqwBjHsmzuUIIC2GL8QFky7mrJkBxFOVn2ASPFfXvch
         NjcvJMuH8cCWid4C84fD3Og7e0v0Ge+8Rpif0ckIxTORhMG1pn2Kv8MwPHOCrpG+nwMh
         rNRg==
X-Gm-Message-State: AOJu0YyRQE5ZZDvWuTH6ypAv6zubejQ0x+05/jJNnVxGL6a1B+fqO93s
	d/ensJyXBGrfqip35I/EipSdZwbIXHFoEyOaiY7LWy0NI/nIKjdiUFXfd5od30KJtxzf0fnP9FR
	s
X-Google-Smtp-Source: AGHT+IG0Viseu+hUAYAPjjQpOZn2uDv0CplDB0QrTJy7b31K6uj6uQbi8ba76tBgsTmmrU8GNqnLVQ==
X-Received: by 2002:a17:907:3fa3:b0:a51:d2d4:1302 with SMTP id hr35-20020a1709073fa300b00a51d2d41302mr5631524ejc.40.1712676999287;
        Tue, 09 Apr 2024 08:36:39 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v1 4/5] xen/arm: allow dynamically assigned SGI handlers
Date: Tue,  9 Apr 2024 17:36:29 +0200
Message-Id: <20240409153630.2026584-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409153630.2026584-1-jens.wiklander@linaro.org>
References: <20240409153630.2026584-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates so request_irq() can be used with a dynamically assigned SGI irq
as input.

gic_route_irq_to_xen() don't gic_set_irq_type() for SGIs since they have
their type assigned earlier during boot

gic_interrupt() is updated to route the dynamically assigned SGIs to
do_IRQ() instead of do_sgi(). The latter still handles the statically
assigned SGI handlers like for instance GIC_SGI_CALL_FUNCTION.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 xen/arch/arm/gic.c | 5 +++--
 xen/arch/arm/irq.c | 7 +++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 44c40e86defe..e9aeb7138455 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -117,7 +117,8 @@ void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 
     desc->handler = gic_hw_ops->gic_host_irq_type;
 
-    gic_set_irq_type(desc, desc->arch.type);
+    if ( desc->irq >= NR_GIC_SGI)
+        gic_set_irq_type(desc, desc->arch.type);
     gic_set_irq_priority(desc, priority);
 }
 
@@ -375,7 +376,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
         /* Reading IRQ will ACK it */
         irq = gic_hw_ops->read_irq();
 
-        if ( likely(irq >= 16 && irq < 1020) )
+        if ( likely(irq >= GIC_SGI_MAX && irq < 1020) )
         {
             isb();
             do_IRQ(regs, irq, is_fiq);
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index bcce80a4d624..fdb214560978 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -224,9 +224,12 @@ void do_IRQ(struct cpu_user_regs *regs, unsigned int irq, int is_fiq)
 
     perfc_incr(irqs);
 
-    ASSERT(irq >= 16); /* SGIs do not come down this path */
+    /* Statically assigned SGIs do not come down this path */
+    ASSERT(irq >= GIC_SGI_MAX);
 
-    if ( irq < 32 )
+    if ( irq < NR_GIC_SGI )
+        perfc_incr(ipis);
+    else if ( irq < NR_GIC_LOCAL_IRQS )
         perfc_incr(ppis);
     else
         perfc_incr(spis);
-- 
2.34.1


