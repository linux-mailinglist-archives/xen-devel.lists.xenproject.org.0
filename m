Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9528FABFA9E
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992142.1375971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvL-0005kf-MZ; Wed, 21 May 2025 16:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992142.1375971; Wed, 21 May 2025 16:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHlvL-0005fo-Fj; Wed, 21 May 2025 16:04:07 +0000
Received: by outflank-mailman (input) for mailman id 992142;
 Wed, 21 May 2025 16:04:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hkAn=YF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uHlvJ-0004XB-LD
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:04:05 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38205288-365d-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 18:04:05 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-601956fa3beso7489696a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 09:04:05 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502736sm9152513a12.25.2025.05.21.09.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 May 2025 09:04:03 -0700 (PDT)
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
X-Inumbo-ID: 38205288-365d-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747843444; x=1748448244; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuKFAgwAzdWX+jRW22HkNFtK9R6Dh6rQ/ItEXnnpjQ4=;
        b=WSoFoG0V5iWtBFxt1xF0zUVz9exvvJ7jtpoJ0/Y+ZjxvjQkaC2fNYdcSJvXZiqJY3I
         LOyQ8yzCNGt/AHOHkqNu5csmTy6Jq65ooDMhsxTXn0AJ0m9Hej7nmRfigIcMrjm8nwKJ
         0ACh0u+wReNAU/OESz96NZnRLfRmrYjcA0rnsQijn45xz+Xb5/0XNUks5brZaLMVNvhz
         l83LTYsB8eaoow4vtQ3PbT5C/jmI9IobjMdA0r7TwIAH99a8rcNRR3WVyEGRYOw7a4U6
         WBFp/f1i0zRAJoFhBFvZIjQzyp6a9Q1wNG8cn19BsMaZy6IpggJh6GKH+p71Pahteabr
         oLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843444; x=1748448244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuKFAgwAzdWX+jRW22HkNFtK9R6Dh6rQ/ItEXnnpjQ4=;
        b=MWPmBpDt2vwVj+qnJ4gp1/r6DTGVU/NRQClQADFn1biMUdq3dU/BlUmcRv+K/wQvg8
         Hi4KJnuEzAsuGVmD3QJlz5UCJtpeFzTuT/Z29sFSAos+9S/WWX6MzrSs8axzcBwEyfBr
         RQRBig1OGXDTUVuQfqEQgK74HNUyJaTJb6oT8gGd8/6XWk3Q+597vbJnaZC5BZI9VIYP
         x1Jty5UkEytvRnESWgp+w58tmAuXQ/LL7YuePj/A4S6VZcyGI2N2BkCjuWGIPA7qVNVp
         Yt+ri+Vg1Xsr+5bmmBLEcDCFY5sfvanAUQO0GLdsp1Iq/fNLlNb52NEaxN5i0+sTGca6
         PueA==
X-Gm-Message-State: AOJu0Yz9zKtvjMZMi6yAjTModplXdQLkRYWwdCe81nSawG4nlHRjWnjC
	st0sAPsAqANp/60PwRX7uhJ/MTEqOOKZa0al9Z/QNlf8ChDyTp0m5cF8SLrsaQ==
X-Gm-Gg: ASbGncvdA3dm1Exi/IBGSjXEuWV0aijcfm1yqb913uRM7fZtqHSiKhv3sVu9Z5V+50A
	CgQp+U8quvidtLJl9e8wXffbB+OBDFc0Aa+yMIIXDaasEN3uBtTVr7BSwuzPCxRRCbqFH0lXqqN
	JyV72ljloV7b2w3ZaNN1jEPgaH3SU9fM5I6caA49p1EGkMSIgyhOe+zTms70KOHXTjzDtHW3ltz
	a0P9s13Yok96Opggg3JpympksLNJhhT/2sW4z++3R4ARJDTfzpHt+YMvSCe0aG3fguKVVQC52se
	i5W7DdI7l5PcKAe4z8P21Rop3myfZe8pBVL+OfpuXl+X0tIv7E7R/u0JleY35InHhRFUftdUEaz
	ejdlxXq40kZ/KqxHaaw==
X-Google-Smtp-Source: AGHT+IHMiUE1RNqkd7CFA0gkM4DTS7mv6rwNoXKENbduXzPAJdFGKEhEHzlWMu7Blf5NHSFiWG9jtg==
X-Received: by 2002:aa7:d28a:0:b0:601:31e6:697f with SMTP id 4fb4d7f45d1cf-60131e66b16mr14765902a12.26.1747843444003;
        Wed, 21 May 2025 09:04:04 -0700 (PDT)
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
Subject: [PATCH v3 05/14] xen/riscv: introduce platform_get_irq()
Date: Wed, 21 May 2025 18:03:45 +0200
Message-ID: <1729279a0ab39e2a2f09e475c2eb48fefd4aef54.1747843009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1747843009.git.oleksii.kurochko@gmail.com>
References: <cover.1747843009.git.oleksii.kurochko@gmail.com>
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
Changes in V3:
 - Drop parentheses in return inside irq_validate_new_type().
 - Add a check in platform_get_irq() that dt_irq.irq is less
   then NR_IRQS.
   Also, add BUILD_BUG_ON(NR_IRQS > INT_MAX).
---
Changes in V2:
 - Add cf_check for aplic_irq_xlate().
 - Ident label in irq_set_type().
 - Return proper -E... values for platform_get_irq().
---
 xen/arch/riscv/aplic.c           | 20 ++++++++++++++
 xen/arch/riscv/include/asm/irq.h |  3 ++
 xen/arch/riscv/irq.c             | 47 ++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)

diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index caba8f8993..10ae81f7ac 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -11,6 +11,7 @@
 
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/irq.h>
 #include <xen/sections.h>
 #include <xen/types.h>
 
@@ -21,6 +22,23 @@ static struct intc_info __ro_after_init aplic_info = {
     .hw_version = INTC_APLIC,
 };
 
+static int cf_check aplic_irq_xlate(const uint32_t *intspec,
+                                    unsigned int intsize,
+                                    unsigned int *out_hwirq,
+                                    unsigned int *out_type)
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
@@ -35,6 +53,8 @@ static int __init aplic_preinit(struct dt_device_node *node, const void *dat)
 
     aplic_info.node = node;
 
+    dt_irq_xlate = aplic_irq_xlate;
+
     return 0;
 }
 
diff --git a/xen/arch/riscv/include/asm/irq.h b/xen/arch/riscv/include/asm/irq.h
index ea555afd1a..84c3c2904d 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -38,6 +38,9 @@ static inline void arch_move_irqs(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+struct dt_device_node;
+int platform_get_irq(const struct dt_device_node *device, int index);
+
 void init_IRQ(void);
 
 #endif /* ASM__RISCV__IRQ_H */
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index b5ae7a114b..669ef3ae9e 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -7,11 +7,58 @@
  */
 
 #include <xen/bug.h>
+#include <xen/device_tree.h>
+#include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 
 static irq_desc_t irq_desc[NR_IRQS];
 
+static bool irq_validate_new_type(unsigned int curr, unsigned int new)
+{
+    return curr == IRQ_TYPE_INVALID || curr == new;
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
+ err:
+    spin_unlock_irqrestore(&desc->lock, flags);
+
+    return ret;
+}
+
+int platform_get_irq(const struct dt_device_node *device, int index)
+{
+    struct dt_irq dt_irq;
+    int ret;
+
+    if ( (ret = dt_device_get_irq(device, index, &dt_irq)) != 0 )
+        return ret;
+
+    BUILD_BUG_ON(NR_IRQS > INT_MAX);
+
+    if ( dt_irq.irq >= NR_IRQS )
+        panic("irq%d is bigger then NR_IRQS(%d)\n", dt_irq.irq, NR_IRQS);
+
+    if ( (ret = irq_set_type(dt_irq.irq, dt_irq.type)) != 0 )
+        return ret;
+
+    return dt_irq.irq;
+}
+
 int arch_init_one_irq_desc(struct irq_desc *desc)
 {
     desc->arch.type = IRQ_TYPE_INVALID;
-- 
2.49.0


