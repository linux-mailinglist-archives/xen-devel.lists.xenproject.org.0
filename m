Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE79CABFAA1
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992143.1375979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvN-00063O-Qe; Wed, 21 May 2025 16:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992143.1375979; Wed, 21 May 2025 16:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvN-00061w-Md; Wed, 21 May 2025 16:04:09 +0000
Received: by outflank-mailman (input) for mailman id 992143;
 Wed, 21 May 2025 16:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvL-0004XB-BE
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:07 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3945bd89-365d-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 18:04:07 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-60119cd50b6so8915099a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:06 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:04:05 -0700 (PDT)
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
X-Inumbo-ID: 3945bd89-365d-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843446; x=1748448246; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXa7CGMEIFOZ1vN2aNUNz1YqzXIyy5P1kJ1VTA9ahL8=;
        b=Ql/U+Y2gv8TuEyJvD55drooo0n+lpbzEJgvHP1dXnRe7W6f3TE6qa1GYFwtqAKn2j9
         jTqyF7te+xrKt0O1hi60DwUb8H9SCFBSeM+wAH4SRnMMwnPNvcH71MH3ZNh4RjQ8PXzu
         ctNI5hmNHIY/esNB+a9Us1xPhRtI9PUqF1cm6ec3IG6KE2wohykGzw4MM9dL/wD0hh2X
         k6gL0RXfM2Z55lCkjH0yGSFL9oboV10OeCVnVWvP+ac+xfdfWXJ8vmTj3QvbaZgVlzyR
         g/x8J+FK/Y+qfxYQKvIJOvkT1n+8OBtGOd9q8t0zUGIt7SkIRyqXPdB4exPdcWnyNSX1
         8Kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843446; x=1748448246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXa7CGMEIFOZ1vN2aNUNz1YqzXIyy5P1kJ1VTA9ahL8=;
        b=Wt6VUCXLEvDfRB9YhoE5WyP08+PHF8E4+Zrhpb9AeqMASvEfy2f1vUsOU8ir4q2OwA
         vUaPOeSTze47fEk+zq2v4WsKW8b71HL055aUF5VNA2/IIGTHBuwIjiCVkr/H5O0IvQXv
         2F0sbnIJ1RIlnq5QgRsDsWi9co3wnwIBItStZUrVVu3CKEPNq6+KoyF8xrY3xDajLvH1
         z9phmflz5dz70FzbDxiZbaNg+vRRADQyHHpdAIso8mW83oRHMK2OkeDZkJfQji1221eH
         SzJ+IdBBQE46SRMkPf0GLpatVig2jFNu7ramTZZUWvSbSRmDos3+umkJHCpL2Uz2WFiV
         GWpg==
X-Gm-Message-State: AOJu0YzEaZW8bdPkK9GS7yWrTMaw9ly1vSItyJOO5J3LppIIdOdTC/0H
	5JEnDYCGP6iY67S+/UqLMOOGOlwuOrcR+xzqCClpQwZ5JUIRnBSk1gpiQNKPsQ==
X-Gm-Gg: ASbGnctxi2rLFD2OGlHwg7jigooZ9GAUycl1oz/CvEstCextyW73ncbt7DcKve2YvQQ
	fqol9xnaRljRJeg/iy5A9bCz6PqbqqDetyPwhlKbEJFn3nJs3sXyEnozJEeohOrYlN3NzoPzeHM
	aN1X07IiNV2FJAwjGdGg/AHnFFqfZsn31LuN6a1JxNIizxWQ6oASBtO7TOAK69J1i1mgfscSidS
	UNOzzxQv3ParXcVuZ5xdHahJ/yBugmx+8sL9vKTxpMFYrcCFPyfc7tSuSxqDhpjuvCISt+L9Cfn
	m9yP4CJgfT41BaXikVxXvIub2t8AL0L+SoH03IB5BUsiUJx5nClP5D9UdsafZOwYbxndkvGY/Di
	yxTkl10se+tem/gplBw==
X-Google-Smtp-Source: AGHT+IHS5fYBVXgwvUEWYYYGn4MRpmHoyuk/dgn1+GBR9YqJki3D+U4gCHeomjidZ5cP60SAXnS+tA==
X-Received: by 2002:a05:6402:35c3:b0:601:ff94:4a41 with SMTP id 4fb4d7f45d1cf-601ff944b43mr7172006a12.29.1747843446075;
        Wed, 21 May 2025 09:04:06 -0700 (PDT)
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
Subject: [PATCH v3 07/14] xen/riscv: introduce register_intc_ops() and intc_hw_ops.
Date: Wed, 21 May 2025 18:03:47 +0200
Message-ID: <bd5472b8042aa5074d8870df054c77c8cbdb6c16.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the intc_hw_operations structure to encapsulate interrupt
controller-specific data and operations. This structure includes:
- A pointer to interrupt controller information (`intc_info`)
- Callbacks to initialize the controller and set IRQ type/priority
- A reference to an interupt controller descriptor (`host_irq_type`)
- number of interrupt controller irqs.

Add function register_intc_ops() to mentioned above structure.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - Drop inclusion of xen/irq.h in asm/intc.h as forward declaration is enogh
   for types used in asm/intc.h.
 - Drop forward declaration for dt_device_node  and hw_irq_controller.
 - Declare intc_hw_ops as:
     const struct intc_hw_operations * __ro_after_init intc_hw_ops;
---
Changes in V2:
 - Declare host_irq_type member of intc_hw_operations as pointer-to-const.
 - Moved up forward declaration of irq_desc.
 - Use attribute __init for register_intc_ops().
 - Use attribute __ro_after_init for intc_hw_ops variable.
 - Update prototype of register_intc_ops() because of what mention in the
   previous point.
---
 xen/arch/riscv/include/asm/intc.h | 19 +++++++++++++++++++
 xen/arch/riscv/intc.c             |  9 +++++++++
 2 files changed, 28 insertions(+)

diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 52ba196d87..860737f965 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -12,11 +12,30 @@ enum intc_version {
     INTC_APLIC,
 };
 
+struct irq_desc;
+
 struct intc_info {
     enum intc_version hw_version;
     const struct dt_device_node *node;
 };
 
+struct intc_hw_operations {
+    /* Hold intc hw information */
+    const struct intc_info *info;
+    /* Initialize the intc and the boot CPU */
+    int (*init)(void);
+
+    /* hw_irq_controller to enable/disable/eoi host irq */
+    const struct hw_interrupt_type *host_irq_type;
+
+    /* Set IRQ type */
+    void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
+    /* Set IRQ priority */
+    void (*set_irq_priority)(struct irq_desc *desc, unsigned int priority);
+};
+
 void intc_preinit(void);
 
+void register_intc_ops(const struct intc_hw_operations *ops);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 4061a3c457..1ecd651bf3 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -5,6 +5,15 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 
+#include <asm/intc.h>
+
+static const struct intc_hw_operations *__ro_after_init intc_hw_ops;
+
+void __init register_intc_ops(const struct intc_hw_operations *ops)
+{
+    intc_hw_ops = ops;
+}
+
 void __init intc_preinit(void)
 {
     if ( acpi_disabled )
-- 
2.49.0


