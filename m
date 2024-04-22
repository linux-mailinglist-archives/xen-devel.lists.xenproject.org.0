Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 566018AC5B0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 09:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709719.1108728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoFD-0007ms-PV; Mon, 22 Apr 2024 07:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709719.1108728; Mon, 22 Apr 2024 07:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryoFD-0007j2-M1; Mon, 22 Apr 2024 07:37:43 +0000
Received: by outflank-mailman (input) for mailman id 709719;
 Mon, 22 Apr 2024 07:37:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ALvU=L3=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1ryoFC-0007cz-Hy
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 07:37:42 +0000
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33228ea9-007b-11ef-9e3a-7da7ca7a9ce9;
 Mon, 22 Apr 2024 09:37:42 +0200 (CEST)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5c229dabbb6so2188890a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 00:37:41 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se.
 [217.31.164.171]) by smtp.gmail.com with ESMTPSA id
 x37-20020a056a000be500b006edcceffcb0sm7221726pfu.161.2024.04.22.00.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 00:37:39 -0700 (PDT)
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
X-Inumbo-ID: 33228ea9-007b-11ef-9e3a-7da7ca7a9ce9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713771460; x=1714376260; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqIqZwJgUcekPQuPI1VH6Nw18oRab5zr4LvkDvC5BW8=;
        b=hgMAzr9/v3VV2ZdPFngyZFvDjtm0yzZ+ChNw/gDYVOnM7giroacv2sqWyMfBdDQl0F
         UkFF9LnaYkk8M7zyeJYUf+q26CrWhV0Bt3lO57ev03q8ROP1m4vdGQuw2bYPxAxxipos
         8pJHZMpv3dtX0OV8+tE8/RZoFFOMUL9Q9O+q8gPmsDcc+UVDznuvXaQKSfSeDbmGO12L
         oxGuG8OGxAnyYqclPyJBQzbqcF8f4VJDXELoGaMR1HkT8zYa9VH5TB489fHpSqV8NJws
         Mc+Fi4MxmQju2nqN/2xuJLhkDtQCFAlFRrxoQgl+GNYSHRE+rSVQIuptDKc1Fnk5DoeH
         7P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713771460; x=1714376260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqIqZwJgUcekPQuPI1VH6Nw18oRab5zr4LvkDvC5BW8=;
        b=PMGk6NFczZS2xo7RDwgpNHatz3ngnmg4H8A8kWupmpf/ZmHzyPTLhP5yC6N2UVZukT
         24UDHYmtbWFTzxwEaAmcA70Qy07pcXx8pq7TWcIs0l6AnZyI1IcnLoBEN+gbfJC8Usfo
         YQZQd+HkhK/V7cZlRwNvN2X6lowNuI2L2WAvLE2eECC+p1Va6SkBr4WDQWTtisMLldcw
         08lhpRAx7BOomnvJ9oc7jyRb9JlAT+rZsrERKzce/UNUNLv6EEB3i6jpbyImo+Tv0AyH
         2fNr8NnTsgmiVY+vSk5d+a9JeCkBbGDsGZFEAxkVPZxOcjoE3aDNmNFzUCKnionF/m1T
         5yHQ==
X-Gm-Message-State: AOJu0YysgCJ5mFXm0+lmYd6oTg6yLxPtXecOFTCnrG568pdLEIi+iT+T
	vATIEzh88c8APosRsaYnhpjMPD45+NU/zGQOnD42QvU+wUyWFq1L8t+ftlIquncOFyMviwnxD0Q
	v
X-Google-Smtp-Source: AGHT+IFomXvyJRBoJZ6esF5z/ya0gd+1lmpeMxibc4K5rG4EGXwP1H+lFCeoqG4tVAoaic3N+WUdGg==
X-Received: by 2002:a05:6a20:8417:b0:1aa:41e4:f1b4 with SMTP id c23-20020a056a20841700b001aa41e4f1b4mr9140138pzd.44.1713771460059;
        Mon, 22 Apr 2024 00:37:40 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: patches@linaro.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2 4/5] xen/arm: allow dynamically assigned SGI handlers
Date: Mon, 22 Apr 2024 09:37:07 +0200
Message-Id: <20240422073708.3663529-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422073708.3663529-1-jens.wiklander@linaro.org>
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updates so request_irq() can be used with a dynamically assigned SGI irq
as input. This prepares for a later patch where an FF-A schedule
receiver interrupt handler is installed for an SGI generated by the
secure world.

gic_route_irq_to_xen() don't gic_set_irq_type() for SGIs since they are
always edge triggered.

gic_interrupt() is updated to route the dynamically assigned SGIs to
do_IRQ() instead of do_sgi(). The latter still handles the statically
assigned SGI handlers like for instance GIC_SGI_CALL_FUNCTION.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
v1->v2
- Update patch description as requested
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


