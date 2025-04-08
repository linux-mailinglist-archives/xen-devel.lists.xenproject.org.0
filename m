Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BA0A810E5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942507.1341712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKS-0006XK-Ro; Tue, 08 Apr 2025 15:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942507.1341712; Tue, 08 Apr 2025 15:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKS-0006LT-8g; Tue, 08 Apr 2025 15:57:36 +0000
Received: by outflank-mailman (input) for mailman id 942507;
 Tue, 08 Apr 2025 15:57:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKP-0004Yr-HI
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:33 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e9ceea1-1492-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 17:57:32 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac298c8fa50so959171766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:32 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:31 -0700 (PDT)
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
X-Inumbo-ID: 2e9ceea1-1492-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127852; x=1744732652; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiCk6l0j5WiAsBCvt03FXOQepiOD85wA7EDe/CpLmKg=;
        b=gQU13qDOttBKEnlHvx+1Mfx58cnepl9OuiFpJiNcmb6bGTh3Hdm3G/LRP0XeelWG6o
         zAUfkSa6kLyRR4bMtU1znQHijvLxOFpWt6RMLXCMtF5uqLw5cvuu3GVkrmmDAmUN2+Tc
         +9zcdcOuR0RW/Z5S1uedvSnpfI/QnfcFqmQaVywVYXwT6Qs6IgryZpShD/JRbwsyJY0R
         Zmxc5vvymMrX8+jAmhWkw1uQGlmt8rNNdCCW2E9fhYwo+Ybp8iPx0uvFeZqJI0+7aHi9
         4nCFhm4kkYitu2gKFeRciwxOhXIB71/THbZBF+X0yX81zJ3RD3gRoNMn7EJuvzFO90Xv
         I06Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127852; x=1744732652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiCk6l0j5WiAsBCvt03FXOQepiOD85wA7EDe/CpLmKg=;
        b=RpHm+z6N9zjnUHV0rIRmABQsv+4BH/RLjdqI9v7IvWb3qbVu5T7miPVmxe3NRK/eYR
         kTYQPiES8hwVC9deJq9IMvz2CQ3N2XihtpGRXQ31BdeUeFKM1rwdqvxTWsMRbuJH6wqs
         jgt2vIFHXd6W6klF9NFVre+p3xTtIGjcTkuztJ8ndC2/v30z5u4SdQnkxN/vnh8t4IRw
         Qz8rbJ5iNs5nwDHtKDnvAKhYCCUICfZJFwpaBi73+rdeW3Xzem8TPU9v8j1Togm4scp0
         weonPHtWG3xBxBeDDsjsTzYUtDxNWHqwoirn1sG1kn18OQvIMzOvfQDZdFl8kIP7S9Oz
         YLEw==
X-Gm-Message-State: AOJu0YysUJQMXUWec/RCJ3neOleig4983uHKyy0ilu0Wml7MX3NznQHj
	91FPzutkKDPsZVwJsWtnlMcIm2fp92+AgiasRFKNvFpV0N/+zTv5LN0E0g==
X-Gm-Gg: ASbGncsXavRx6U6zS8W0MvIXPSQ0BG9n+e6FI8dKkzE9uYkQUbaaRfjR/u05694ayBm
	5o3Hwr/rj9AFUltwRfDRhaWk5wDFnTMHP6kSq/vLyBNbIQsQ/m4DsyN+IX2hS8EuaDjG1RDlDnh
	DDKEk1YjsotMHNUlMJoE8NL/VWSsZUzmceHoQvXPfYfnMaGkLXBMdAu+QUYQYOvw9/RszATkHS7
	p84bntBV0JAqAhamAdQCdS0TToPY62Y0TTn56nnzEx/zRmgA4gQGxIuvbE/2baU9NDT4ZMKhr6+
	fLhA7EfMgenI47b4GttQEUM3i2Pxw0BWRQHI3i178ZfrKDY60MmOTOIV9P8A8Ynr5jAoceG3uNh
	jzWFWVsiMv6SCzQ==
X-Google-Smtp-Source: AGHT+IGgpSlMZNNIp0rd6Ulo0pZO/vslcVWFFOm8JSDbN+R8a0ns3rXs1/gaM3I5T7VDk++uygeImQ==
X-Received: by 2002:a17:907:6d29:b0:ac1:f19a:c0a0 with SMTP id a640c23a62f3a-ac7d177475emr1383649066b.20.1744127851981;
        Tue, 08 Apr 2025 08:57:31 -0700 (PDT)
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
Subject: [PATCH v1 07/14] xen/riscv: Introduce intc_hw_operations abstraction
Date: Tue,  8 Apr 2025 17:57:12 +0200
Message-ID: <139b37478b4ca7e2ec3a04b73f462197227f57fa.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the `intc_hw_operations` structure to encapsulate interrupt
controller-specific data and operations. This structure includes:
- A pointer to interrupt controller information (`intc_info`)
- Callbacks to initialize the controller and set IRQ type/priority
- A reference to an interupt controller descriptor (`host_irq_type`)

Also introduce generic helper functions:
- `intc_init()`: Initializes the interrupt controller
- `register_intc_ops()`: Registers the `intc_hw_operations` implementation
- `intc_route_irq_to_xen()`: Configures IRQ routing to Xen, setting handler,
  type, and priority

Most of these functions act as thin wrappers around the corresponding
callbacks in `intc_hw_operations`.

This abstraction lays the groundwork for supporting multiple interrupt
controller types (e.g., PLIC, APLIC) in extensible way.

This patch is based on the changes from [1].

[1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/7cfb4bd4748ca268142497ac5c327d2766fb342d

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/intc.h | 23 ++++++++++++++
 xen/arch/riscv/intc.c             | 51 +++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 52ba196d87..0d498b10f4 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -17,6 +17,29 @@ struct intc_info {
     const struct dt_device_node *node;
 };
 
+struct intc_hw_operations {
+    /* Hold intc hw information */
+    const struct intc_info *info;
+    /* Initialize the intc and the boot CPU */
+    int (*init)(void);
+
+    /* hw_irq_controller to enable/disable/eoi host irq */
+    hw_irq_controller *host_irq_type;
+
+    /* Set IRQ type */
+    void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
+    /* Set IRQ priority */
+    void (*set_irq_priority)(struct irq_desc *desc, unsigned int priority);
+
+};
+
 void intc_preinit(void);
 
+void intc_init(void);
+
+void register_intc_ops(const struct intc_hw_operations *ops);
+
+struct irq_desc;
+void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 4061a3c457..8274897d8c 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -1,9 +1,21 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/acpi.h>
+#include <xen/bug.h>
 #include <xen/device_tree.h>
 #include <xen/init.h>
+#include <xen/irq.h>
 #include <xen/lib.h>
+#include <xen/spinlock.h>
+
+#include <asm/intc.h>
+
+static const struct intc_hw_operations *intc_hw_ops;
+
+void register_intc_ops(const struct intc_hw_operations *ops)
+{
+    intc_hw_ops = ops;
+}
 
 void __init intc_preinit(void)
 {
@@ -12,3 +24,42 @@ void __init intc_preinit(void)
     else
         panic("ACPI interrupt controller preinit() isn't implemented\n");
 }
+
+void __init intc_init(void)
+{
+    ASSERT(intc_hw_ops);
+
+    if ( intc_hw_ops->init() )
+        panic("Failed to initialize the interrupt controller drivers\n");
+}
+
+/* desc->irq needs to be disabled before calling this function */
+static void intc_set_irq_type(struct irq_desc *desc, unsigned int type)
+{
+    ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
+    ASSERT(spin_is_locked(&desc->lock));
+    ASSERT(type != IRQ_TYPE_INVALID);
+    ASSERT(intc_hw_ops && intc_hw_ops->set_irq_type);
+
+    intc_hw_ops->set_irq_type(desc, type);
+}
+
+static void intc_set_irq_priority(struct irq_desc *desc, unsigned int priority)
+{
+    ASSERT(intc_hw_ops && intc_hw_ops->set_irq_priority);
+
+    intc_hw_ops->set_irq_priority(desc, priority);
+}
+
+void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
+{
+    ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
+    ASSERT(spin_is_locked(&desc->lock));
+    /* Can't route interrupts that don't exist */
+    ASSERT(intc_hw_ops && desc->irq < intc_hw_ops->info->nr_irqs);
+
+    desc->handler = intc_hw_ops->host_irq_type;
+
+    intc_set_irq_type(desc, desc->arch.type);
+    intc_set_irq_priority(desc, priority);
+}
-- 
2.49.0


