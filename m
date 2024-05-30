Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA748D51E4
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 20:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732958.1139028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCkhZ-0004tm-7Q; Thu, 30 May 2024 18:40:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732958.1139028; Thu, 30 May 2024 18:40:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCkhZ-0004rD-3P; Thu, 30 May 2024 18:40:37 +0000
Received: by outflank-mailman (input) for mailman id 732958;
 Thu, 30 May 2024 18:40:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8pxM=NB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sCkhX-0004ea-6x
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 18:40:35 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18b2f88d-1eb4-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 20:40:33 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57a30dbdb7fso218522a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2024 11:40:33 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a67e6f02d29sm4086666b.14.2024.05.30.11.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 11:40:31 -0700 (PDT)
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
X-Inumbo-ID: 18b2f88d-1eb4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717094432; x=1717699232; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5QMwuJU8AJ5lyqy+M0BkxbHCvu9t37ti0og1vGBBFw=;
        b=RPST3wXfWYZSMbmtGkpA+4O4NhPDK+Z3gVW/vdGO3z7JQEonVDnKO5IprFrQtLFphD
         neve3yJnhkQtxRHMbcNhLNdy69OaULi1QDXIhMqjHqJbWkNIZUgrKEiqdQ+IpV9oxikS
         fzM//Xs8iuUr9gaEkfEQGzqn9tv1IJuwpJALA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717094432; x=1717699232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5QMwuJU8AJ5lyqy+M0BkxbHCvu9t37ti0og1vGBBFw=;
        b=PUJ39ZjnySZx7F3WSbsvlLqAR/K2BGFcUHl84C21HQM27/4aRvBG+xCDfHTXprla7E
         AUGHxGkL1veELJTjTJ+avw65cxVW0pyyfPz9nTDTQIctrCHSA8oNn1ro5DDhQ0xQYFmy
         lqpn4Pijudf5UriSA+a8uru8Tf/NBUtZ2qJKsxkImWL+FO/ZPRjsThFjRYwG+Lvvljda
         c8xzHsFjuAcMLIssOxDf1wp4Se9/n1txKnNbEz9VrMNz9RYlmQFQ96FA5HruJT8XH1HW
         27y+fOUdAAAD0+5iDNQB3R8pX/02MlYen3ml9kDpJKq8+8SWIwwZCqXworf/8sLgzjKD
         lnjg==
X-Gm-Message-State: AOJu0YzvS2mLynBZyE3INJstX7i0vYor1Ava9dkVo0FEP6RW3yPpXdzI
	kR9olxlPqeOGbjN4L9At77l57VcOzLfvuTefdpAxhwI0exAf7ZAbkfC8A/iGDqej86qbgQxkAzk
	d
X-Google-Smtp-Source: AGHT+IETGLUBFNDb8N54iW+kGM7XqF5hjLpboxoNZIpw3z1Xr11N+iJwjq9qdxtheDVhcDAuuhaTOA==
X-Received: by 2002:a17:906:4f8c:b0:a59:a18e:3fda with SMTP id a640c23a62f3a-a65e92152e1mr208527366b.68.1717094432361;
        Thu, 30 May 2024 11:40:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 1/2] arch/irq: Make irq_ack_none() mandatory
Date: Thu, 30 May 2024 19:40:26 +0100
Message-Id: <20240530184027.44609-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240530184027.44609-1-andrew.cooper3@citrix.com>
References: <20240530184027.44609-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Any non-stub implementation of these is going to have to do something here.

irq_end_none() is more complicated and has arch-specific interactions with
irq_ack_none(), so make it optional.

For PPC, introduce a stub irq_ack_none().

For ARM and x86, export the existing {ack,end}_none() helpers, gaining an irq_
prefix for consisntency with everything else in no_irq_type.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/arm/include/asm/irq.h | 3 +++
 xen/arch/arm/irq.c             | 8 ++++----
 xen/arch/ppc/stubs.c           | 6 ++++++
 xen/arch/x86/irq.c             | 4 ++--
 xen/include/xen/irq.h          | 6 ++++++
 5 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
index 1bae5388878e..ec437add0971 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -98,6 +98,9 @@ void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask);
  */
 bool irq_type_set_by_domain(const struct domain *d);
 
+void irq_end_none(struct irq_desc *irq);
+#define irq_end_none irq_end_none
+
 #endif /* _ASM_HW_IRQ_H */
 /*
  * Local variables:
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index bcce80a4d624..7138f9e7c283 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -31,12 +31,12 @@ struct irq_guest
     unsigned int virq;
 };
 
-static void ack_none(struct irq_desc *irq)
+void irq_ack_none(struct irq_desc *irq)
 {
     printk("unexpected IRQ trap at irq %02x\n", irq->irq);
 }
 
-static void end_none(struct irq_desc *irq)
+void irq_end_none(struct irq_desc *irq)
 {
     /*
      * Still allow a CPU to end an interrupt if we receive a spurious
@@ -51,8 +51,8 @@ hw_irq_controller no_irq_type = {
     .shutdown = irq_shutdown_none,
     .enable = irq_enable_none,
     .disable = irq_disable_none,
-    .ack = ack_none,
-    .end = end_none
+    .ack = irq_ack_none,
+    .end = irq_end_none
 };
 
 static irq_desc_t irq_desc[NR_IRQS];
diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
index da193839bd09..4e03428e071a 100644
--- a/xen/arch/ppc/stubs.c
+++ b/xen/arch/ppc/stubs.c
@@ -134,12 +134,18 @@ void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
     BUG_ON("unimplemented");
 }
 
+void irq_ack_none(struct irq_desc *desc)
+{
+    BUG_ON("unimplemented");
+}
+
 hw_irq_controller no_irq_type = {
     .typename = "none",
     .startup = irq_startup_none,
     .shutdown = irq_shutdown_none,
     .enable = irq_enable_none,
     .disable = irq_disable_none,
+    .ack = irq_ack_none,
 };
 
 int arch_init_one_irq_desc(struct irq_desc *desc)
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index c16205a9beb6..cfd7a08479d2 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -467,7 +467,7 @@ int __init init_irq_data(void)
     return 0;
 }
 
-static void cf_check ack_none(struct irq_desc *desc)
+void cf_check irq_ack_none(struct irq_desc *desc)
 {
     ack_bad_irq(desc->irq);
 }
@@ -478,7 +478,7 @@ hw_irq_controller no_irq_type = {
     irq_shutdown_none,
     irq_enable_none,
     irq_disable_none,
-    ack_none,
+    irq_ack_none,
 };
 
 static vmask_t *irq_get_used_vector_mask(int irq)
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 89f7a8317a87..b71f65db8621 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -130,6 +130,12 @@ void cf_check irq_actor_none(struct irq_desc *desc);
 #define irq_disable_none irq_actor_none
 #define irq_enable_none irq_actor_none
 
+/*
+ * irq_ack_none() must be provided by the architecture.
+ * irq_end_none() is optional, and opted into using a define.
+ */
+void irq_ack_none(struct irq_desc *irq);
+
 /*
  * Per-cpu interrupted context register state - the inner-most interrupt frame
  * on the stack.
-- 
2.30.2


