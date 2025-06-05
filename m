Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07778ACF391
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007087.1386405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uND00-0008HO-4q; Thu, 05 Jun 2025 15:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007087.1386405; Thu, 05 Jun 2025 15:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCzz-0008Fh-W2; Thu, 05 Jun 2025 15:59:23 +0000
Received: by outflank-mailman (input) for mailman id 1007087;
 Thu, 05 Jun 2025 15:59:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uNCzy-00071f-GP
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:59:22 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0aeaae45-4226-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 17:59:20 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-606fdbd20afso2217330a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:59:20 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c2aba9sm10443034a12.2.2025.06.05.08.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 08:59:19 -0700 (PDT)
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
X-Inumbo-ID: 0aeaae45-4226-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749139160; x=1749743960; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sllje9we4dPE74YkPYuoGlvOyvramKxYrsh4yQeHi50=;
        b=DIujADFsC81OAWpHPdmzBoCiGOTk/db1tpd2hRbcsxNovXZx86xidFJwaXyC2abkzQ
         ka+mSWKvR9vUyynpZm4Priwmoy/HiIsGtFoo1ucw7u0nQT19yiIXTFDCnDcrz2+H4wPg
         dUqCgu+6A9IYtiY8c0Z8UkWQlfRTivsU/bYgrVNbzQ6kwDyXT2SMqIdgGgRPg7E22GKB
         7nUZ1hOLJj5Pr0LMdNoYNf0pYHSXoge/Z1CaiEhfnRkK3WrrSXsw1lMW7GsYDVlwUkMA
         eXZo1gZtZK0Yqj+kUAaVcAf1IaOK+WN8+DOUNqfl21Vz0oOHBZ1dZQV7bELCViOheAqM
         lBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139160; x=1749743960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sllje9we4dPE74YkPYuoGlvOyvramKxYrsh4yQeHi50=;
        b=vTbTK7CgFqEeXOTn8f6oot8LIo4QAiq7b8tBNKUQkAWVHdJezN4qycn4ub3zhPAaiv
         8XNSH+NhkbDHGanLwmjXzuPsBu7LJzyTSX+tNClUBSvLS01eyCdGv8bhvpl7G1GSfpfK
         6WDjhTF6Uhncn9LFJ2rpTtlX0uJyzJMbRJCn+yQR1FAZ42OvEE/AupU1Vc8OLQUsq1xx
         3p89rwbUjd91TN7HkWq3An9fa8CWKSwjg+wIQ3uEs5poilyOw4Qt2YE2vKIYGUAUkKaj
         zTm4j9zxY7ip9h6NEhn/MhTSznjxwe0aDpW4tcZpwbCsrkfmfzJmm+AcZ5EaVDpbNsTg
         eTWQ==
X-Gm-Message-State: AOJu0YxWd+CQTcDyR1tm3cvhzApyXu0Hrbt1huvIRX7ulqeMILemHBRB
	b5eIQHW1ijmWoelNtxCFt2CFLzIvzn5PDbBNowMG5ZYD2H8T2FfawlwZxXoW7A==
X-Gm-Gg: ASbGncuAHZDwV1JXVwBZZYI0P0BuHYLypH7bwXjQLMLhBfrGDUtWIuTAyJhpyV8hFhP
	x9LY4/ayYbTNrnAFP+F4LEHTBXVKD1bFcqPfLsJWfUSkvw88wRB0S+f1u/YT6xe5Rx4+kZ1sYty
	RCB5LuXJQHGHsz2UROouXBeDFovg86oe5rcmrzs15b+/N/HfbKto/YsGYb2snLmvezlMGixfpOu
	NYIwv/u1KSxtGfUy0uNylHvJ+HJYLyb52QEaxsNZfq2ttU+B3o+60QgMgRR7PbJwHcmTLb6of9w
	dxXMcxKOGKjOn6nfzOHb4llMVBOPy3iZNcFFhsx3d+G6H94gjPrUDCBWNtbCNaA4h4dbqxyYZi/
	3NyxESzIByiM2LMyKOw==
X-Google-Smtp-Source: AGHT+IEDl11Un6GzmqN7TowFArQN2doR3NmYj94vI9Uu0yfDeMYFn2yguIWN6w3JKktwr32STLofhw==
X-Received: by 2002:a05:6402:35d6:b0:607:6097:2f9c with SMTP id 4fb4d7f45d1cf-607609731a4mr421983a12.21.1749139160070;
        Thu, 05 Jun 2025 08:59:20 -0700 (PDT)
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
Subject: [PATCH v4 5/9] xen/riscv: introduce intc_init() and helpers
Date: Thu,  5 Jun 2025 17:59:01 +0200
Message-ID: <5b18180f1cae0bd29aac6e024d53a180362384c2.1749121437.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749121437.git.oleksii.kurochko@gmail.com>
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
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
2.49.0


