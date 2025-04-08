Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D446DA810E3
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 17:57:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942505.1341684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKP-0005uC-Or; Tue, 08 Apr 2025 15:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942505.1341684; Tue, 08 Apr 2025 15:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BKP-0005rf-Hh; Tue, 08 Apr 2025 15:57:33 +0000
Received: by outflank-mailman (input) for mailman id 942505;
 Tue, 08 Apr 2025 15:57:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f4Vq=W2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u2BKN-0004Yq-IU
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 15:57:31 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ccb0e72-1492-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 17:57:29 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ac25520a289so1006060566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 08:57:29 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7c018556bsm929934566b.156.2025.04.08.08.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:57:28 -0700 (PDT)
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
X-Inumbo-ID: 2ccb0e72-1492-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744127849; x=1744732649; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCtnXnepMjQJ6WdYnFvlLVv3tm/yir71NGvOBIDdkhw=;
        b=J8kt5T71PBmUAbha+/X33kUE2vjPDncWuh6r1TwYCbFLfOyAaPMICVQ7lvljkP5XcC
         zRpFniX3N/KzVDG2TzpWKFJbvnNI2g36HNJX4esqQ4Bg6lvuB5pgmFCsX9bVUBgN6y5A
         ZLxlfZsb+H3+JO5UeoqS9rkcJ4qlDW0YBQPtKoGMSxuUt1bDM3FxFKbk0eX0D9NIGkis
         B8M3wUjZkiwkXTjpzKXw3+2oCoMtTlye7e7h/o+b4D8A3uKzmBDVUPK02lpdyAMQTIBq
         qMFf5UHWv4NtCb4YwZg4Q29AsfdKi9XF2RTDLjx/+bAlZDnDKR9mAR+LETReouSHsz8T
         m9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744127849; x=1744732649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCtnXnepMjQJ6WdYnFvlLVv3tm/yir71NGvOBIDdkhw=;
        b=ojYnHaGd8IzXXci8xNMLT4+DzqA5OlRh7Y8aFEZKI5IfS3IaL36mFzIbIAve2dooRe
         HjlJcrtcIlr/kDC1pzWd1NybvEL/NraW+7+dUpTU93fvuMPfFb0Cc1sUKZGkDecpf8XL
         W2WcdGMbfmhHkw48mNZsLFc0HAn61nQOPg3JijRzRLjtyV+ZYrCIcrJhvykH/0NtZJDX
         m2vdwQ98DebkC/Lq2ytaDE74k+3PUNwnv+DbV1LxY7KORUoG2nYkxc3g4znsEGAfeNO3
         tKeZ4YgFBq0NmOdculg9IyKKvb3v3rmelD5InMJHXFTSdDAms6cTkPAJIGHB4gWir4Ku
         +UsQ==
X-Gm-Message-State: AOJu0YxBllLTTko1DidtLWy1cy3qDqiULD4pgvN7gU6XzKKSAQsx8Zkp
	EyFl+msz5WrXqSP5a7xKhIgdZET0AA4kdffFYFvYl77eqmHrFFlQPWwq9Q==
X-Gm-Gg: ASbGncvnxQvgQ9JPA6TYL1dzCZIEGHfreCDC0B5vJJkkxiRMmUlZm4XRjKSHA/aiNTU
	hqwiu1HqWZDYXTagEJpSLIWHdqsaWuwp/eybW7rq9fNIAu00vKfWYnvkaakmIgNBidakWDMS+Cy
	pI5o5XwDIb6FuPyvy/w1ZwlBEj1UReHtOJvsFHa9kcuzLdtOVMCIYNUj2Ozi/W5jeVp7+Q3TbgT
	Hsqhk8un7bGWXlszgK6Ffdjsoz6XdoPo3daaBzvolZM8m5EzsxbBUigxx452etpCB9R/jhsj4TR
	MRX5+y1Uk4W1jcpgVuaeIuRyiZMmf8CbmgVmvEVziUVJFFJj8+DWtoXgXnMcnwvAdOGX+HpGKHF
	/gaYKUOi5CstEtA==
X-Google-Smtp-Source: AGHT+IFJ1QvQ6CEjloJ0R8mMyvtVVCL9ldhwXDZiW0oswAHpDPPPugf5ISduozzVoTqxseYyEoUJXQ==
X-Received: by 2002:a17:907:724a:b0:ac1:ddaa:2c03 with SMTP id a640c23a62f3a-ac7d690b353mr1371954466b.0.1744127848820;
        Tue, 08 Apr 2025 08:57:28 -0700 (PDT)
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
Subject: [PATCH v1 05/14] xen/riscv: introduce platform_get_irq()
Date: Tue,  8 Apr 2025 17:57:09 +0200
Message-ID: <6c6e7482cc3b0332f5724c80bf16931fe2d793ae.1744126720.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744126720.git.oleksii.kurochko@gmail.com>
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

platform_get_irq() recieves information about device's irq ( type
and irq number ) from device tree node and using this information
update irq descriptor in irq_desc[] array.

Introduce dt_irq_xlate and initialize with aplic_irq_xlate() as
it is used by dt_device_get_irq() which is called by
platform_get_irq().

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/aplic.c           | 19 +++++++++++++++
 xen/arch/riscv/include/asm/irq.h |  3 +++
 xen/arch/riscv/irq.c             | 41 ++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index caba8f8993..6dc040af6f 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -11,6 +11,7 @@
 
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/irq.h>
 #include <xen/sections.h>
 #include <xen/types.h>
 
@@ -21,6 +22,22 @@ static struct intc_info __ro_after_init aplic_info = {
     .hw_version = INTC_APLIC,
 };
 
+static int aplic_irq_xlate(const uint32_t *intspec, unsigned int intsize,
+                           unsigned int *out_hwirq,
+                           unsigned int *out_type)
+{
+    if ( intsize < 2 )
+        return -EINVAL;
+
+    /* Mapping 1:1 */
+    *out_hwirq = intspec[0];
+
+    if ( out_type )
+        *out_type = intspec[1] & IRQ_TYPE_SENSE_MASK;
+
+    return 0;
+}
+
 static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 {
     if ( aplic_info.node )
@@ -35,6 +52,8 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     aplic_info.node = node;
 
+    dt_irq_xlate = aplic_irq_xlate;
+
     return 0;
 }
 
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index 8f936b7d01..ff1c95e0be 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -47,6 +47,9 @@ static inline void arch_move_irqs(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+struct dt_device_node;
+int platform_get_irq(const struct dt_device_node *device, int index);
+
 void init_IRQ(void);
 
 #endif /* ASM__RISCV__IRQ_H */
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 99b8f2095e..c332e000c4 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -7,11 +7,52 @@
  */
 
 #include <xen/bug.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 
 static irq_desc_t irq_desc[NR_IRQS];
 
+static bool irq_validate_new_type(unsigned int curr, unsigned int new)
+{
+    return (curr == IRQ_TYPE_INVALID || curr == new );
+}
+
+static int irq_set_type(unsigned int irq, unsigned int type)
+{
+    unsigned long flags;
+    struct irq_desc *desc = irq_to_desc(irq);
+    int ret = -EBUSY;
+
+    spin_lock_irqsave(&desc->lock, flags);
+
+    if ( !irq_validate_new_type(desc->arch.type, type) )
+        goto err;
+
+    desc->arch.type = type;
+
+    ret = 0;
+
+err:
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    return ret;
+}
+
+int platform_get_irq(const struct dt_device_node *device, int index)
+{
+    struct dt_irq dt_irq;
+
+    if ( dt_device_get_irq(device, index, &dt_irq) )
+        return -1;
+
+    if ( irq_set_type(dt_irq.irq, dt_irq.type) )
+        return -1;
+
+    return dt_irq.irq;
+}
+
 int arch_init_one_irq_desc(struct irq_desc *desc)
 {
     desc->arch.type = IRQ_TYPE_INVALID;
-- 
2.49.0


