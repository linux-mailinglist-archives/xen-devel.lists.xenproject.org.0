Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8B3AFAF24
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 11:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035344.1407602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhjf-0002z3-OU; Mon, 07 Jul 2025 09:02:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035344.1407602; Mon, 07 Jul 2025 09:02:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYhjf-0002wj-LI; Mon, 07 Jul 2025 09:02:03 +0000
Received: by outflank-mailman (input) for mailman id 1035344;
 Mon, 07 Jul 2025 09:02:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItPy=ZU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uYhje-0002Us-8K
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 09:02:02 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b842fb1-5b11-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 11:02:01 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-60780d74c8cso4333778a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 02:02:01 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b04d30sm662892766b.133.2025.07.07.02.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 02:01:59 -0700 (PDT)
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
X-Inumbo-ID: 0b842fb1-5b11-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751878921; x=1752483721; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIulsTowM6fpIW0DBmjDSeTo+fz8PiaYuYsmGxHqOLs=;
        b=VBtXXMLXQnfpisecrSjbbCX6Tsd1FwDxZxpmD0FJY4URF3wDc8o6Ua6yOQuCkVhMOS
         x5uIw4fuTLd/TDZwTbK8tdlw1sQcOoZzsesmgf+qHH4qbqsx/e1mz8ACqtj7FQBenUiw
         sgtZpaoUhvt4s8xcrUnGL+RLQghwwhYSv/drj53KC48++FvY8IhOJWBBVQjwwV4gxtIz
         UEDIaJEFs5i7jAFI28xWBO4NW20whl6eIHvB2cjd9nHtvRyMMpgiyaN1swXVPtFVd5o+
         vYsPUVx0hkNFfhgH0Q7/tMHmBTRKDSkquiBxowMyyY6+JRdN/B7+RGwQsYFG3hDdDmBp
         g9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751878921; x=1752483721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIulsTowM6fpIW0DBmjDSeTo+fz8PiaYuYsmGxHqOLs=;
        b=vRn5RgdWnU/6TbhNaKaWCc9fdhemonvUuiowVsiEKVkFG0kmZBijKrPV/eoFk8P4XI
         lnpB5Lovy7JhXTgaeh8CEW8mnJCtDZASKu6XIkz5zujCJn9Bj3SXSqYqk7h5VnW9MhCu
         fyYU5/Xq0UccFeclr2itEqXObIHfAcBgsaM8I1WFR6hvo4M2jaQFzelhXbanSsk86XSv
         kjdVSgBSFsOGe+rHH7bFUJVqWGlk9drMft+Fz2MFoX6FTTd0rhw3gx7ja/15N3EyV3IR
         o/1i7QF7v0I1u9hICuvAC+dT4MnH0kHcB5rgS23YT+x593yaOOzIWKZMDXadF8TyPb0+
         Dylg==
X-Gm-Message-State: AOJu0YzJFFFeA6dyEpForjFw5G+nGkhdvi8jD4g6kYI98aDVIYMjPZN6
	uNgY9L4B8sZuenpX0DQDvBeW/lRROOpgc8BF3a/9/VpOb8inLvV7+8OQ17Y50g==
X-Gm-Gg: ASbGncttRjULnVIIr7cjgWBb+/o2Sj0VZNQnASGx8gYwllx+WKS4NquzZ1KXDXVhAlA
	+JgzvrgxP31DN9+DoZ1gMegNaNzA/XUgP6SmJyb8SO10aBDzsL2j9Qvs/NDxfmcQURwgucpxtpk
	MJ59rEBz+RdE3X6GLignZgBoYIYTIkHXAeEhGCPSR8CzQ89T7u/2tnswSx5lB9wIyNOVZ6/LWfs
	qsZ6D0+l6cgHi1Y5423suRWCx60DLT3oxjQQ3PYihvOv54m/zycPmo4dCaXS59ru8GgUbtqTzMV
	TXDmyXqjKYUFNAm8AUUDNIOz89jk2kRJ3ZKHkGVZBDG7G9YzQRDwAybKqYwhbjh47Cn60bOXJVl
	wq62XraMw4q5olQFTN7szQlDEeA==
X-Google-Smtp-Source: AGHT+IExz9jH2HEy32+86Q9OqvfK/Bv+htGN4MGGy+Jpo7I/TJJixF1baCNR0cJAuCAchAOCZkKIdg==
X-Received: by 2002:a17:907:3f1a:b0:ae3:cc60:8cf0 with SMTP id a640c23a62f3a-ae3fe7b4298mr1046761366b.34.1751878920480;
        Mon, 07 Jul 2025 02:02:00 -0700 (PDT)
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
Subject: [PATCH v6 3/7] xen/riscv: introduce intc_init() and helpers
Date: Mon,  7 Jul 2025 11:01:39 +0200
Message-ID: <0d2a1308d0b1c988fdec13a87aef338a06e8cd13.1751876912.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1751876912.git.oleksii.kurochko@gmail.com>
References: <cover.1751876912.git.oleksii.kurochko@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V5-V6:
 - Nothing changed. Only rebase.
---
Changes in V4:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
index 3c4b211f58..a11b7aa55e 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -43,4 +43,8 @@ void intc_preinit(void);
 
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
2.50.0


