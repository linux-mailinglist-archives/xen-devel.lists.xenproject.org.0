Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D289CA810E6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942508.1341703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKR-0006LG-Nx; Tue, 08 Apr 2025 15:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942508.1341703; Tue, 08 Apr 2025 15:57:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKR-0006He-DT; Tue, 08 Apr 2025 15:57:35 +0000
Received: by outflank-mailman (input) for mailman id 942508;
 Tue, 08 Apr 2025 15:57:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKP-0004Yq-Ii
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:33 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2dee1f74-1492-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:57:31 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac2af2f15d1so776002666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:31 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:30 -0700 (PDT)
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
X-Inumbo-ID: 2dee1f74-1492-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127851; x=1744732651; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiCk6l0j5WiAsBCvt03FXOQepiOD85wA7EDe/CpLmKg=;
        b=jhEXWqruMyRd6bqsiZMLZ9Sr2SpaWC4DVVxerLond0rk1Hi0eTLLFw3go7X12c3X7r
         CN7lxruNGVFMLbt7CryhjEliPqVwoDSdjnLOeXSz3aqUoFaovgX9KyXUfUWPWWX7Y8u0
         Az0sjZ1MaD+Vc2mCAFiesgoizH/SK5DaWxIfeoDMm5f4exzDN+gHQxfEXP0iXPEOSm/W
         flf59RwZZx/24pbik/KSa/nZQYFP9aokkGWyUFb2PRl3CofOtgti0z39VQV1Ygie0go7
         igfFulqO77BbdN9tw5/3+OiPLgBiV9QwDETet/2B9kcZ1mL26yqEPj9iuLkFjuA90uSc
         L1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127851; x=1744732651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiCk6l0j5WiAsBCvt03FXOQepiOD85wA7EDe/CpLmKg=;
        b=tUk0GjcMHru9zVkVhcfxMu+Ayo8FZPRNNYySlnfDpoFw7kWlS6pNomzWO9eIoOmSyc
         AXf+mlyyv8E8LhmjrLOWru1bncjrpt9Oe/DlBIQv5xze28C3YBwpEzX2vcTZZdlK3PG3
         H1bFXUWMIt7PqXVSO/PcjHW0rRSHUl1bdkmvg9OEEza/Mwj3AKICwoCgjyHO9Zhzdtx9
         Td/aDqGoy3kZjUjRrHaimHSjECnlCi7qNNoyJTVhc8+D2qaV3gs7xoo8zRMcRBGLKgz7
         lSRxzzs9uLpjj3NEmbnhVj+zb+K0hGTIG/86hqAUVbDRQgZmAbKiTCRGygW1JVG0nNtY
         GObQ==
X-Gm-Message-State: AOJu0YwGk18ahEm4vrxn5berhDXecJN70iGDSf2mHN9qyP7/o+lrmXmc
	GajcJdLn/BZueT06SaCITr1ZbFaY4jYyntLhh89fONWt/TUfO42eGrLi4g==
X-Gm-Gg: ASbGnctszoaB9IbjJjRnMfGtjKmEpgXXHKELVFtVWLxbMtXVBS/jZrxmAQCqqkeOCSI
	rsphoC7jza2eh62XtQ24U+fwfLcQmpjOaROEflGZmQES9Rl69eNhPl2ZoglspUBsRs7TOWmiujy
	xjC2ikYGQhJqx12RUYnY1slLUwhJ1ljGcapRkZ7cC+1ARIRWvbb2V5z4Oh0ZTsb4cQOElqdi0sG
	89h1De2dEbLePoHRSjjMc4+ZRFl7zJhyFpI0LJMVW7oDLjol01EL0V8wkt5MrxiNdaWi/y1i7MV
	57EKTPb8lEc6u9Wj5g7uyVqb5cvmyj7Mtyabw+0rsSNE3MvkDB8HwvunKSOUuTLSfYYkLGIwb2U
	nBAHkIRvmjWdFZQ==
X-Google-Smtp-Source: AGHT+IFgwfOxXVHfVYqu1wdOQ9GYxprRsQ4/F7xJSCdqFJTVN4OXyfi5h1a5KmgqZzyh/NYVvTBqEA==
X-Received: by 2002:a17:907:9488:b0:ac3:4139:9346 with SMTP id a640c23a62f3a-ac7e717034fmr947478766b.9.1744127850991;
        Tue, 08 Apr 2025 08:57:30 -0700 (PDT)
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
Subject: [PATCH v1 07/14] wqriscv/intc: Introduce intc_hw_operations abstraction
Date: Tue,  8 Apr 2025 17:57:11 +0200
Message-ID: <7c1e0a9c36e92e993ae10d74b3cf816669282d6f.1744126665.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126665.git.oleksii.kurochko@gmail.com>
References: <cover.1744126665.git.oleksii.kurochko@gmail.com>
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


