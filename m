Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E96CABFAA2
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992146.1376010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvR-0006tY-7B; Wed, 21 May 2025 16:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992146.1376010; Wed, 21 May 2025 16:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvR-0006qJ-1d; Wed, 21 May 2025 16:04:13 +0000
Received: by outflank-mailman (input) for mailman id 992146;
 Wed, 21 May 2025 16:04:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvO-0004XB-Gj
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:10 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b2697ce-365d-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 18:04:10 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-601dfef6a8dso6168312a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:10 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:04:08 -0700 (PDT)
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
X-Inumbo-ID: 3b2697ce-365d-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843449; x=1748448249; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rRipHHgVNlXBwWiXRpUAQ4oqkKb1qQJ/QJeF1BX1DU=;
        b=eC47aDgHT8dCD/Lc0+WaDwtP91gQf8e9PTPF38T4oRqUxJDebUfI5urTdIe0+DMvpR
         /8jGL0DnEYdFc7j9ZpJWkZ6LF9NDRFYopTINOhlBEV5kOJESLHLRJzKLLQjClEagoq3X
         hyq9HnZ012hEMkPFWw/CVE6V/ArUQRUBbX9SOHfDbxhrl5XWwHb0geUJu4mxg+vGpxOo
         LOGN5Y/o9RntMIBwS+POyY23vMfgYQ57lpdumi6jwPioWhlSQwO8ETP1vS7k+tVVXi4L
         dtNRSH3mNqpEvW4WGBdwJVC6vIL94Y+Fuxo6UONjr9jBS4F5khO6GL/WSFMbk0g3u/Md
         OZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843449; x=1748448249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4rRipHHgVNlXBwWiXRpUAQ4oqkKb1qQJ/QJeF1BX1DU=;
        b=dxRa77jMdwgQtzaNaLTh6jfqdqCKTVpN6q4tZkNfFs2m/3Db/UL0U9Krz4B4lvRnV7
         mnfpGS2B0Xkym/7OKedtNMyn+dcRuPoyhumKmVxghW1RwN9cfPVFZhcF/pUjxWmshaNW
         xJhsBiSgGquOBGcDfennmlFYEiau1sqyYHu6lxxWBWeoTvHWaPEz9+KKE4/Nj+eYcWEi
         ia5lb4UtmVYD5N4xKMPZIKKW2OetcSCmeTZbStbwgMDdFo+He/flM5fLbmQHzoH76M0+
         pVNlojPO+leJdDMZ8VtcXnES4nfrWMVGo1LE8h0B4R0Tqoq/YkVQR/PHKpzKs7tf+rAr
         aGmQ==
X-Gm-Message-State: AOJu0YwA9PQv32veReJVihIjQ7v+ggGwE7AGEozSfluMHP2w2S3NwoHR
	hHp0MGjvXr0Z+0iNPNNhCw8WIs6oj8nd4LWchyPP4J2u3mVPq9pdbSKoafjOkg==
X-Gm-Gg: ASbGnct4I6QPOdkju2jNSe6IkTVnzPDVQOomx1OUCDxKAQHmrezxSkX86a3nHOYvrrf
	YK4HGWxq4XbqllL1L9YdzhU893+APQ32NSWdgVBvyJmPy6StJveAU36CJ2PvQzLLXGekwySLrPO
	VpH22bznVS0otVkc58rOBlpKnsplkhZoqKHSowmPFCFe79b15xBECU5G1/iUyAvafgh444G8agq
	iVHrH9f3wb1GazfZnNM/ZexPzhMa7m6NWLPgmXTLMjwR/YgH6yGIFkRBt/x1MidvHN7gQFmaxaN
	AQyqjZkNmRzCkRB8JDhNAAOHZOFAJHWjR3DUnltxEOlNlCRX+jxjTtUw4fngtNySilrxLYAUuws
	PXG+ktrZGccJaXf4e+pJ7BYYNeqpp
X-Google-Smtp-Source: AGHT+IHv9NdEfpk3ZS9JniuwJMZErPk5+MAvAllfRVvYFcFyYUz0uYtmV9DDn8BG4d4SsmOTQ7b+fg==
X-Received: by 2002:a05:6402:2793:b0:601:d77f:47d9 with SMTP id 4fb4d7f45d1cf-601d77f4b72mr12256239a12.5.1747843449162;
        Wed, 21 May 2025 09:04:09 -0700 (PDT)
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
Subject: [PATCH v3 10/14] xen/riscv: introduce intc_init() and helpers
Date: Wed, 21 May 2025 18:03:50 +0200
Message-ID: <e1c952169ca894f2ea5ab3236e3ceb68da0117c5.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce intc_init() to initialize the interrupt controller using the
registered hardware ops.
Also add intc_route_irq_to_xen() to route IRQs to Xen, with support for
setting IRQ type and priority via new internal helpers intc_set_irq_type()
and intc_set_irq_priority().

Call intc_init() to do basic initialization steps for APLIC and IMSIC.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Drop ASSERIT(intc_hw_ops) in intc_init().
 - Drop ASSERT(intc_hw_ops) in intc_set_irq_type() and
   intc_set_irq_priority() as intc_init() will be called first and so if it
   won't crash, then intc_hw_ops is registered.
---
Changes in V2:
 - This patch was part of "xen/riscv: Introduce intc_hw_operations abstraction"
   and splitted to have ability to merge patch "xen/riscv: initialize interrupt controller"
   to the current patch (where intc_init() call is actually introduced).
 - Add checks of that callbacks aren't set to NULL in intc_set_irq_priority()
   and intc_set_irq_type().
 - add num_irqs member to struct intc_info as it is used now in
   intc_route_irq_to_xen().
 - Add ASSERT(spin_is_locked(&desc->lock)) to intc_set_irq_priority() in
   the case this function will be called outside intc_route_irq_to_xen().
---
 xen/arch/riscv/include/asm/intc.h |  4 +++
 xen/arch/riscv/intc.c             | 41 +++++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c            |  2 ++
 3 files changed, 47 insertions(+)

diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index f3bbd281fa..1a88505518 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -41,4 +41,8 @@ void intc_preinit(void);
 
 void register_intc_ops(const struct intc_hw_operations *ops);
 
+void intc_init(void);
+
+void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 1ecd651bf3..f2823267a9 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -1,9 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/acpi.h>
+#include <xen/bug.h>
 #include <xen/device_tree.h>
 #include <xen/init.h>
+#include <xen/irq.h>
 #include <xen/lib.h>
+#include <xen/spinlock.h>
 
 #include <asm/intc.h>
 
@@ -21,3 +24,41 @@ void __init intc_preinit(void)
     else
         panic("ACPI interrupt controller preinit() isn't implemented\n");
 }
+
+void __init intc_init(void)
+{
+    if ( intc_hw_ops->init() )
+        panic("Failed to initialize the interrupt controller drivers\n");
+}
+
+/* desc->irq needs to be disabled before calling this function */
+static void intc_set_irq_type(struct irq_desc *desc, unsigned int type)
+{
+    ASSERT(desc->status & IRQ_DISABLED);
+    ASSERT(spin_is_locked(&desc->lock));
+    ASSERT(type != IRQ_TYPE_INVALID);
+
+    if ( intc_hw_ops->set_irq_type )
+        intc_hw_ops->set_irq_type(desc, type);
+}
+
+static void intc_set_irq_priority(struct irq_desc *desc, unsigned int priority)
+{
+    ASSERT(spin_is_locked(&desc->lock));
+
+    if ( intc_hw_ops->set_irq_priority )
+        intc_hw_ops->set_irq_priority(desc, priority);
+}
+
+void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
+{
+    ASSERT(desc->status & IRQ_DISABLED);
+    ASSERT(spin_is_locked(&desc->lock));
+    /* Can't route interrupts that don't exist */
+    ASSERT(intc_hw_ops && desc->irq < intc_hw_ops->info->num_irqs);
+
+    desc->handler = intc_hw_ops->host_irq_type;
+
+    intc_set_irq_type(desc, desc->arch.type);
+    intc_set_irq_priority(desc, priority);
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 8bcd19218d..0e7398159c 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -134,6 +134,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     intc_preinit();
 
+    intc_init();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.49.0


