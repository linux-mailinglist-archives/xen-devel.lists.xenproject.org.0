Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B456CAACB8A
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977627.1364660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWb-0007Jh-3M; Tue, 06 May 2025 16:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977627.1364660; Tue, 06 May 2025 16:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWa-0007D0-NO; Tue, 06 May 2025 16:52:08 +0000
Received: by outflank-mailman (input) for mailman id 977627;
 Tue, 06 May 2025 16:52:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWY-00058E-8n
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:06 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70c041a5-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:52:05 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac3eb3fdd2eso262738966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:05 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:52:04 -0700 (PDT)
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
X-Inumbo-ID: 70c041a5-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550325; x=1747155125; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MagsnbbonM4RCqIwn/oarouHR237rcv9tp4MRYfZzDU=;
        b=jlEIAx19NdoCXVUPoyFwGEv7wp+YcJ3cDwbi5u0UsVnrNwjwWlbz6Uov5nk/ZtGuLA
         dQhYWonH9Gehgmtn/gJYZghdxZcyhd6nX1X++vo/bXYGxfl26vO8ZZwNrKAA5FRRYHGi
         C2NTjocoK1zKp0I0qVleM7P1tC9eDMCnI9v+iFLOZaH9Ei6A6IAI7vSEuBeNmtou7q2C
         Fq8D+GyCxesv1L5cwK6R3VoIvhSCF5WhMLtADyqcirMaa+ZRFAX3B4dx6hEHPCIqYrKI
         5WEDi0X57R0xodwxZGhCZI+SRvCg5zABSHWnrvgAxbWxPOLGXbf61iEDI4HImXeKi49o
         xNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550325; x=1747155125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MagsnbbonM4RCqIwn/oarouHR237rcv9tp4MRYfZzDU=;
        b=kT1Y8Fxyxb+sYh/jVGS6IWlz8PHMN//EIzJjtMUfHyY/1NMBZQMfPuvuXvOV0JhhXi
         BiaxdwzqZ+HOmJKyITkIlz0DbXnhs9ZYncgUIVthhRa7a5SYJEWPVVSi1HOMMCWSJjuU
         1iGz/WgHRZ5UkaPrm78bviOoyE3NM6OfQ8RjgZ/IXLjhMh72cnZopQ/fYe4PqdPZtjK1
         hV03Kxw16B++iyjcYiMVts8eLl8BTCnLdFjV9CiKTTdp2Pl0tKJCi99VN4t5Vd/lmMU7
         YhimZ8NTn8VRExg9ytN/blxld/ZIFHXr9ILtTgl20THzjF19Tj8HE7OcGVRv8tiNYSUI
         0SJg==
X-Gm-Message-State: AOJu0YzFfWGJZ1OCImpPP7Z89ltQNXQxEPDqJhJ68SmEe0xxnuGxTV69
	GN+eZNBvYQJP9MP3e6xRrU/k/IXJBS77Gpt6umxruHFaeemwg/q2De3eNA==
X-Gm-Gg: ASbGncvGN69oDvtKV2cZIEznHQX4yTPRsMas96kaxi3WwmX8GzvBlyMin7qcW90NnQz
	h7zsmRdWPfML7UKaQX+i/z4qkfxgqaEXiX8JRZmMQkjxy6ZpKH5dPyQrKRe4dUgQ+fGsMTli0ac
	FIArWVybTpKiOfaVSrwpya9Jod0aRl2aC1tPNGg73E2luIYAem876EvIu/g4XExkmDT/K6GMmyU
	ipsanLUbRF6XXF1f2godiNsY8aXVIsvKMAUk/OjstAlcPkOiWDDAQrd5IskE9HUoMP9ydUmleWH
	Q7xZvGAELCh8EMtOL8FGp32VHJkfwhsmtRiNtJscOR2sk42NHwyjOmmrc7ZcQRTpwebqEHtVVSo
	NeBfsWA00WQ==
X-Google-Smtp-Source: AGHT+IHXVcgZWqmG8m0i6ryn+QDye6ieZnyr5R5iVbzKSImUtMH6siYhduEiVLati9KAvZAxaemw6Q==
X-Received: by 2002:a17:907:3f9a:b0:ad1:d061:e8b6 with SMTP id a640c23a62f3a-ad1e8bc8d20mr17508666b.21.1746550324581;
        Tue, 06 May 2025 09:52:04 -0700 (PDT)
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
Subject: [PATCH v2 09/16] xen/riscv: introduce register_intc_ops() and intc_hw_ops.
Date: Tue,  6 May 2025 18:51:39 +0200
Message-ID: <7cd7d3780bb6db45b92c971ff8bcf2634570431f.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
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
Changes in V2:
 - This patch was part of "xen/riscv: Introduce intc_hw_operations abstraction"
   and splitted to have ability to merge some patches from this patch series
   into one patch.
 - Declare host_irq_type member of intc_hw_operations as pointer-to-const.
 - Moved up forward declaration of irq_desc.
 - Use attribute __init for register_intc_ops().
 - Use attribute __ro_after_init for intc_hw_ops variable.
 - Update prototype of register_intc_ops() because of what mention in the
   previous point.
---
 xen/arch/riscv/include/asm/intc.h | 22 ++++++++++++++++++++++
 xen/arch/riscv/intc.c             |  9 +++++++++
 2 files changed, 31 insertions(+)

diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 52ba196d87..e72d5fd9d3 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -8,6 +8,8 @@
 #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
 #define ASM__RISCV__INTERRUPT_CONTOLLER_H
 
+#include <xen/irq.h>
+
 enum intc_version {
     INTC_APLIC,
 };
@@ -17,6 +19,26 @@ struct intc_info {
     const struct dt_device_node *node;
 };
 
+struct irq_desc;
+
+struct intc_hw_operations {
+    /* Hold intc hw information */
+    const struct intc_info *info;
+    /* Initialize the intc and the boot CPU */
+    int (*init)(void);
+
+    /* hw_irq_controller to enable/disable/eoi host irq */
+    const hw_irq_controller *host_irq_type;
+
+    /* Set IRQ type */
+    void (*set_irq_type)(struct irq_desc *desc, unsigned int type);
+    /* Set IRQ priority */
+    void (*set_irq_priority)(struct irq_desc *desc, unsigned int priority);
+
+};
+
 void intc_preinit(void);
 
+void register_intc_ops(struct intc_hw_operations *ops);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index 4061a3c457..122e7b32b5 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -5,6 +5,15 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 
+#include <asm/intc.h>
+
+static struct __ro_after_init intc_hw_operations *intc_hw_ops;
+
+void __init register_intc_ops(struct intc_hw_operations *ops)
+{
+    intc_hw_ops = ops;
+}
+
 void __init intc_preinit(void)
 {
     if ( acpi_disabled )
-- 
2.49.0


