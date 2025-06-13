Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96ADDAD91D8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:49:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014630.1392777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eP-0007zx-66; Fri, 13 Jun 2025 15:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014630.1392777; Fri, 13 Jun 2025 15:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ6eO-0007wc-VD; Fri, 13 Jun 2025 15:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1014630;
 Fri, 13 Jun 2025 15:49:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=44KY=Y4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uQ6eN-0006ch-C6
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:49:03 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edc1ef0b-486d-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:49:02 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ade48b24c97so337151766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Jun 2025 08:49:02 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adec8979563sm144821766b.158.2025.06.13.08.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 08:49:01 -0700 (PDT)
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
X-Inumbo-ID: edc1ef0b-486d-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829742; x=1750434542; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWLYSodiRsm7mDCKtezKwf+cxQyrLPn4QIQNMit6hRc=;
        b=boWo+MNP694kc4ZoJOqP0h//3WtVFQtD7ESqIvtJqnAzmWh6F8YfybhtzQ9i2o97g5
         ZxXXdErgHLLcGh1hiz3RE4+viKi6q5/pyicS3HMFJXFGje9xsWKzVay8HWm+G9kCX0TV
         TxB/dNV6xGfxsH7I6fkMmIQgf1CFeFnfjcewkRQmILFozDmgbctBXPJsdg9FBwVjciGy
         hmc1BQvSnQJLPoofYLAKF+gkbuIPs//LXFBZelcHZrGQ670WDZYptNC/sLEP75W3qfnh
         ccCviLzD82qDoAkyjLOfAxF/+zXv67hRWby4COhC3ykx8xSmRhwS93KeACJnEBrVdi1W
         xlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829742; x=1750434542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWLYSodiRsm7mDCKtezKwf+cxQyrLPn4QIQNMit6hRc=;
        b=NtjstrOUYmsRy2jsxlPXjOeC4WuC0WqHuWCsf2iAz/IdXt4xLSpfPvHDJYb1YqDOOs
         MsMURIZ+w1RseCFl2gK9wpcpDfHT360Zn12slbJD46/srnhhU0xlSd54esNCNZp239We
         a1/6uEJgwxnCvbjVDsw9nCRJHHNBGXix8RoDzqiHBwa3qHJMuVf8Ql8sAg6TunIfZqxs
         tWrxZASp7K6kbeudcWkTX6ex2VHeBVf0z+MiNJhZgQLSB2dZSy+d8jp4OF5ubmFoeIT4
         3MvAFxjcZqoR8P+W9UZKc+q5HjPlcB1751C4ijqZX0ZApIE+eGOGSbZlCRy5aBh8DFK1
         yPIw==
X-Gm-Message-State: AOJu0YxKojEpJJhfvKrjAhhXkPts6S/Z4HxE02cE6tpJ5Zj4v+xAWENW
	6ifMTdp3paWG232EH1crYeFd91T1XdhuLkwINdiIJ+3KzXg4YgoK2lEZ/c0wRw==
X-Gm-Gg: ASbGncspQTgHatMw3CwGDQhUtZiz/6JHU/AgIHgsm9x8zWsZrGEMYlOoMD0yZXzLhHT
	KVi9E90na5RzTjLQG6C67wYInHLlim2ej1AqFqa7TdfrrZ5kfBHjAnrT9Ag4NyvY2ydN6yNw/SE
	X5LfA6JHmBAS+9PAq/GqNAwJSuxPrzi4hWix3dlVR8fuFWlmWbLwxODPr3fFjwDNOM7CfnQXc9u
	CqUbc5+CZJ51UrFGjoT4dZEK0ZtapBIfboX+i0yFaiyqvKtgNg8rkfoOBWpP8pyYJxdO9vh5lkW
	xwHQTGAlVEzMz+3b0FOUHtNKMOYl0UbT8k4ksTy0+WpNAuDAzZ/oFoDZkYGOmM7AAShNHcViDIJ
	AaNmRk3XFm6gs+Tp9hzNDuNzObQwW
X-Google-Smtp-Source: AGHT+IFwuzRAO2aMwCpzgznPpw9bLv4IXoL0CdMKxiA7lbCL/uvyHdV1Z4CzCzATm/7hUMWYyh0qBA==
X-Received: by 2002:a17:907:2d08:b0:ade:9e62:5fa8 with SMTP id a640c23a62f3a-adec56ad7c9mr349658966b.30.1749829741790;
        Fri, 13 Jun 2025 08:49:01 -0700 (PDT)
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
Subject: [PATCH v5 5/9] xen/riscv: introduce intc_init() and helpers
Date: Fri, 13 Jun 2025 17:48:44 +0200
Message-ID: <90dea26b25c0934697885da2703842106b6aebaa.1749825782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749825782.git.oleksii.kurochko@gmail.com>
References: <cover.1749825782.git.oleksii.kurochko@gmail.com>
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
Changes in V5:
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
2.49.0


