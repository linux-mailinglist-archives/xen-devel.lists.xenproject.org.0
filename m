Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E899BAACBCC
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 19:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977759.1364725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLhF-0006N8-2U; Tue, 06 May 2025 17:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977759.1364725; Tue, 06 May 2025 17:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLhE-0006LA-Va; Tue, 06 May 2025 17:03:08 +0000
Received: by outflank-mailman (input) for mailman id 977759;
 Tue, 06 May 2025 17:03:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWe-00058E-AW
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:12 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 728915db-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:52:08 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-acb2faa9f55so787367666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:08 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:52:07 -0700 (PDT)
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
X-Inumbo-ID: 728915db-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550328; x=1747155128; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=litmnL1mFXl7IfBQKSAEMuZm2aol2VAzqMHBocuz5Mc=;
        b=Z4FqmW0tjIRvSciGNP8tk6ZOjqVJoL+2mhg/qcnAYkp+OMBsQPs9FlASqcdoHCazEE
         rj84ubeRew0KBDtn/rsgE+BQAwnuEh5RkLKj/ZlGlExDEgQQSmE2FKvNaUqnEYKmD7Ce
         +EEjEM7qYr7cfn+w6OTGLUhSjzDZWMVtDmXo2TRnMTBpOT5REnzEDe3z56iq2KzfXZMM
         NPFsPMqWnYZ6oM/tDutoVbsuEyTo6m42mAsYswFXUbyjz/MTWUyHTdDIZNB2iQrdYsKF
         i3kfa9C1Ci70690uTIdcpDOc3YmkcfvuBF5GnyiJ3oXOXQvVgp9G1/yZc8z8fPe5DDsy
         lYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550328; x=1747155128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=litmnL1mFXl7IfBQKSAEMuZm2aol2VAzqMHBocuz5Mc=;
        b=DJSdHOUXYS/Mi2AE/7118fdIKCImGhv8igapB2J5HjAg9cIN4iXnYaKjJJw4sWmhlf
         Yv/zRYTIq9eElLgxykGk0whfG00XA0Q0q6HeXjL/lncHQ7bEYmhe8QRtz2NU5HzG0Tec
         XwGNXzsXsRhyz9kdKNTzYl3pNtn98LYCFJnPXRi7xX7w1Kq3E2lD+w2sNIPwzqErlFGG
         e6R3W+7bTzYxRBT9H4/TzVT3U4fnK3mXSK01k5eni/wzh2IwSsezxusuUSRWNHwnt/Ri
         gxa6LvlSAwM5wJu2NsSMFu3Ur3BpVZ8sx919Xpblud6AqwtjAimhO0ACgiaayzIKu58Z
         jwOw==
X-Gm-Message-State: AOJu0Yyd6n9jM0th0Y8fPqJG1Ya/lHCssa4sHJbwjw8NB02nupHHZdbi
	BSHsLBvkSvLu+Sv84ItVyguwI836hca0BlTv2ytWDwJ/rHYQQDiogng57Q==
X-Gm-Gg: ASbGncv7OrCvXcvxOGpyfu0GA5v3jn5/zIfTiztlmxDKfSBPLhOWREPw9AXA/GfKFKC
	aXmVTW2GvlgGXr3TbUxKGzzMDCBJpE7aELKPaZ77FK0mt6Qjs7l3onfFQw3HkvVAfGY3She4+mq
	y6MWvq8xIKnJaeYtR0/OliriezvECzIzysmebi4LQNngrN+nWJKLeu+D7ROBR5EpFzMoxryFHSt
	itk6lY1jm6OKe7mVZMxAowIk2dSrd41ofOFcZJt1oLGAQE2SwYSttR7OirPdE1p9LNFJKU3vinW
	K2mJtTlYryY5m1Xo+Vcixw7lNhWhnZ91kQq6hrd2RNUqg1RdF5KQeyt3XgTt8T/Jfcc45ld3BH0
	PHjkw4pEqgg==
X-Google-Smtp-Source: AGHT+IG/7pKhrKlFu76s5YoKOB7C8b7ohr5wUls16zb6a/DIy/w5fh/YtTd5UlTyYJLn20+NK7n5bQ==
X-Received: by 2002:a17:907:874e:b0:abf:a387:7e35 with SMTP id a640c23a62f3a-ad1e8d9b55dmr12164566b.53.1746550327492;
        Tue, 06 May 2025 09:52:07 -0700 (PDT)
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
Subject: [PATCH v2 12/16] xen/riscv: introduce intc_init() and helpers
Date: Tue,  6 May 2025 18:51:42 +0200
Message-ID: <13ce98ce580b6d1a38dcdcd711a6bcf92f4eb0cd.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
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
Changes in V2:
 - This patch was part of "xen/riscv: Introduce intc_hw_operations abstraction"
   and splitted to have ability to merge patch "xen/riscv: initialize interrupt
   controller" to the current patch (where intc_init() call is actually
   introduced).
 - Add checks of that callbacks aren't set to NULL in intc_set_irq_priority()
   and intc_set_irq_type().
 - add num_irqs member to struct intc_info as it is used now in
   intc_route_irq_to_xen().
 - Add ASSERT(spin_is_locked(&desc->lock)) to intc_set_irq_priority() in
   the case this function will be called outside intc_route_irq_to_xen().
---
 xen/arch/riscv/include/asm/intc.h |  4 +++
 xen/arch/riscv/intc.c             | 45 +++++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c            |  2 ++
 3 files changed, 51 insertions(+)

diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 2d55d74a2e..45a41147a6 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -44,4 +44,8 @@ void intc_preinit(void);
 
 void register_intc_ops(struct intc_hw_operations *ops);
 
+void intc_init(void);
+
+void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 122e7b32b5..15f358601d 100644
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
 
@@ -21,3 +24,45 @@ void __init intc_preinit(void)
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
+    ASSERT(desc->status & IRQ_DISABLED);
+    ASSERT(spin_is_locked(&desc->lock));
+    ASSERT(type != IRQ_TYPE_INVALID);
+    ASSERT(intc_hw_ops);
+
+    if ( intc_hw_ops->set_irq_type )
+        intc_hw_ops->set_irq_type(desc, type);
+}
+
+static void intc_set_irq_priority(struct irq_desc *desc, unsigned int priority)
+{
+    ASSERT(spin_is_locked(&desc->lock));
+    ASSERT(intc_hw_ops);
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
index 82f8839eff..4f92266224 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -136,6 +136,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     intc_preinit();
 
+    intc_init();
+
     printk("All set up\n");
 
     machine_halt();
-- 
2.49.0


