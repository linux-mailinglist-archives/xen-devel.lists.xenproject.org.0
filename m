Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6DFACF396
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007084.1386376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCzw-0007Wc-W5; Thu, 05 Jun 2025 15:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007084.1386376; Thu, 05 Jun 2025 15:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCzw-0007UC-Pt; Thu, 05 Jun 2025 15:59:20 +0000
Received: by outflank-mailman (input) for mailman id 1007084;
 Thu, 05 Jun 2025 15:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uNCzv-00071f-8U
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:59:19 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08e2e749-4226-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 17:59:17 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-601f278369bso2304251a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:59:17 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c2aba9sm10443034a12.2.2025.06.05.08.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 08:59:14 -0700 (PDT)
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
X-Inumbo-ID: 08e2e749-4226-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749139157; x=1749743957; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rMgsLeE3IPvDrOvyCQ5hw/i+mcvXBtOgOiBpyo7Ow8=;
        b=nlwo5ZQMM98ycaJvDWaUGm8O+EeByck7QUksUcCme9qAkd7sMpWnS5M+ZXLUuUFn5p
         DUKXV+87z53gfIFq8yE/erXsSZBNAS7mQfnBSuSwP4b2RzQ7qKm1e6zQD5oXqQ6kZtIP
         Zog2W0FMGL77GtmhPEI7f2zqAunFmfOh3X7q6jnb7NeQTbUUo67U2fLjtCA+/BEisiNH
         46+KpZtWAIZpMKepOFslvVeFktw5skcqj/4qmb1pVS1opSSiweEgPcysBTN4n4Qw4I+o
         iXOlHMwpB5sPKZ2sxyg5DTeWwScOZZbYlo14WvTV+S1mhCZulNaTxDjnkSJAV5QMq0ON
         xz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139157; x=1749743957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rMgsLeE3IPvDrOvyCQ5hw/i+mcvXBtOgOiBpyo7Ow8=;
        b=qNM7khYiLHf5ePyRL27oCeBpsXzmaYse4woOcbZ5a5u5HeTKCHQjUu3anXu4Bd5IEL
         WA+MNztoyXnNEd1U9YoaHCnIdRb5F+Q8dneFhWzgltmYpmFdFt6Km7BDZmsOmj18d6+g
         VM52hk0t8ISS1JskkrfBE/RiKx3KPTKXPi9U8/rt44aniNfBR5hMSm5CvuLZnQIwZISS
         rXxyMsV7WyRSwg5iCtujeesCWn9bCsAo9fQ5Mr0eXVVqzGZWNq8mlNd1QNTdBF2OwFS0
         sdlQ02ImgVdknl43XJqMG7QUYq3nWV2KQojFHBmy94KOaTvigMpNaP6/JiWnGPUHJ1Bn
         MITQ==
X-Gm-Message-State: AOJu0YwIn8NPuS4vVjQQY1VtBq/JT0CGf07HlIEyKElmUzrLfd0JAVs3
	AU0GPhceYcrn7HrNNidP0JzUv1nnzDrG6dpV2+5IOFSTq/VXXmwyksVLZDtpxQ==
X-Gm-Gg: ASbGncs2cC5FtrIxdvEmI65HdjisXQG9WtjEa6JFNpj3R82ndTRv6Avs7tdo62tBDND
	rGkoRzgv/Dq8M0qjiCGbOYvfYotGMWPuXLsdiZtiXqpPIpQXLxd76fF2yb7Pb8WgXHLoIff5Rh/
	yyJxhPRtYnLCIIHqtiom3bO+8nJP5FIkzSxhwMwUK63JcQb1lvgl5mHdF9T54MxzaXOB86vFzS+
	xJU1TsSpxE2ocPUHevpIJb0uOkEsbsiSaSfHC2wAUD1PcD/VawPnFgubuX/2a+O4Cf+KDDTejta
	4crVoHk8vpnLJ04R6Sn2QfeDRZ2ZWSD0L300/v+7254CsXZFlDEAZnSHf9E41rO9dRT+YyUPJsU
	rgPZK5oN2g75A825WXw==
X-Google-Smtp-Source: AGHT+IH7rXiZOc4pWZsuxKU/tb4/N3pcyfMMbckG8T5MjO0JeKXo7aXBlXFcqF9yolConDtACq6QAA==
X-Received: by 2002:a05:6402:3591:b0:607:27bb:7bf with SMTP id 4fb4d7f45d1cf-60727bb09f7mr3105825a12.32.1749139154603;
        Thu, 05 Jun 2025 08:59:14 -0700 (PDT)
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
Subject: [PATCH v4 2/9] xen/riscv: introduce register_intc_ops() and intc_hw_ops.
Date: Thu,  5 Jun 2025 17:58:58 +0200
Message-ID: <100c1377b3ac06a2603d5740ad4606cb84bff168.1749121437.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749121437.git.oleksii.kurochko@gmail.com>
References: <cover.1749121437.git.oleksii.kurochko@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
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
index 81f74736ba..434c9d0781 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -14,11 +14,30 @@ enum intc_version {
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


