Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C004CAACB87
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 18:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977623.1364635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWY-0006gT-Em; Tue, 06 May 2025 16:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977623.1364635; Tue, 06 May 2025 16:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCLWY-0006cp-7e; Tue, 06 May 2025 16:52:06 +0000
Received: by outflank-mailman (input) for mailman id 977623;
 Tue, 06 May 2025 16:52:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/GUx=XW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uCLWW-00058E-8P
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 16:52:04 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6faca94b-2a9a-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 18:52:03 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5f6c3f7b0b0so11799413a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 09:52:03 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891a3cb9sm740295366b.60.2025.05.06.09.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 09:52:02 -0700 (PDT)
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
X-Inumbo-ID: 6faca94b-2a9a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746550323; x=1747155123; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQmSVGxqEnAHeu+UgiQeZLUtUFIRNIGEg4FW26txKNs=;
        b=OSNe/ndfvuDC822lP2dM8YoshI0hRUVFlEkJdsr8tz4mH+OAsqkUgZjLZOUaQGDwPB
         RZKU/DHQ0mBxmURhrbIsQM82QQ35K/CRftGvMTi+6owsKvD2MhJGb+T1XkamIrywJNFy
         f48+jdJbaOMyjBAniykbAEAjvIyDBHkBTQuUQCts9lLscJT+EJTtbEJP8aN34Y9dC6SV
         9sAAnDI+oJNsTJYu3P+5LG0h3jn4l/myb1jbEj+N32wGRcXjwYAg69IyTDcO4HOl0SKO
         /me3y4pc2fJOvnVvcC3UrqwAppJzA2h/yBUSusMlCDGLi3ZEBl1vsbw2/ltSyGFlfeX5
         maMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550323; x=1747155123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sQmSVGxqEnAHeu+UgiQeZLUtUFIRNIGEg4FW26txKNs=;
        b=FgVWcDEtnhb638WdTG+XBVDZW4clzJ2izVndl70kEqF0M8aJmWxAZsFzy0dtRmcQV6
         swO7Zw0kRzsTOoctV7+2vCn/aeyIDxUhiaiKEZhwi9F0w3isjekNGqB2pe6l7+v3Jc+E
         Inha7PqXZyiovvL7droXmCPD/GBLBjK5yNFIVxBoOE7fow7uW73UZdecBuYxGegsZrb+
         JShFU+oNaVIE0Ul3JxuVfWhIdagMEH98d5PUoxWFOOiN1y3LyzPUGEfqbXDs4SOx02Gw
         osjO1ZciSxn+e3rwTwxPLvwFMnFVIv8X5QxQzmJtGmd7tgQKTNbk/nYaB/xgFJWtcoXl
         +eYw==
X-Gm-Message-State: AOJu0YzN2xT5M62HNCg1QSc8sdgtFwi/JMupSWcbrsyvQMI5NRcUSOpR
	CCTZxry7x3Ty8H94c1Ap5Nztl16XOIp9L2t8fAWptep101EyKmmxYkXK+g==
X-Gm-Gg: ASbGncv99+BJMt5UfgmQ0pPd75IKcAja5Sd0fCtzTlSwgXAEl811bdFblJfUbP8OrzE
	j6WRaqvvdId70WwbZwk+hf7gs5h0heCDMLvF+Q+NbNermiylVb9mXUc1CfjxVqHTj7LYUssWUjO
	b5CIb5f1B/IuUponO9ySg2blnUKi9y6Mkpg8fs0EfEAhD07fCPMsSwP+GR5gx2P/v4d/2NitzFm
	Su3OSvZHIyWjfUDdpC7oFa5Y6yvcw5KMx198ul3bJC4k3KKNuzuCuFWU3aFaPzydfIUN0GKny7u
	xZMxDhxbz42e5K/J7uAybzwMKsmrMqyrLau7SJTaXxLa3fvm8Igpd4xulgGeWq2Ql5629j90vG5
	avvInGIR9Dap51Y/wFOYj
X-Google-Smtp-Source: AGHT+IEmGcXV6QzEG20w+umThYUL14rC7eZyQsSdWYUQrMcXWQKyWCRp4acrsSIB59X1kJW/UWJMRQ==
X-Received: by 2002:a17:907:8688:b0:ad1:8dd3:a4eb with SMTP id a640c23a62f3a-ad1e8d0d9e5mr16872366b.56.1746550322718;
        Tue, 06 May 2025 09:52:02 -0700 (PDT)
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
Subject: [PATCH v2 07/16] xen/riscv: introduce platform_get_irq()
Date: Tue,  6 May 2025 18:51:37 +0200
Message-ID: <a6198571b19be1f10b549e68a1b712a6653429e6.1746530883.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746530883.git.oleksii.kurochko@gmail.com>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
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
Changes in V2:
 - Add cf_check for aplic_irq_xlate().
 - Ident label in irq_set_type().
 - Return proper -E... values for platform_get_irq().
---
 xen/arch/riscv/aplic.c           | 20 +++++++++++++++
 xen/arch/riscv/include/asm/irq.h |  3 +++
 xen/arch/riscv/irq.c             | 42 ++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)

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
index f609df466e..6223bbbed5 100644
--- a/xen/arch/riscv/include/asm/irq.h
+++ b/xen/arch/riscv/include/asm/irq.h
@@ -30,6 +30,9 @@ static inline void arch_move_irqs(struct vcpu *v)
     BUG_ON("unimplemented");
 }
 
+struct dt_device_node;
+int platform_get_irq(const struct dt_device_node *device, int index);
+
 void init_IRQ(void);
 
 #endif /* ASM__RISCV__IRQ_H */
diff --git a/xen/arch/riscv/irq.c b/xen/arch/riscv/irq.c
index 26a8556b2c..4c518bbd97 100644
--- a/xen/arch/riscv/irq.c
+++ b/xen/arch/riscv/irq.c
@@ -7,11 +7,53 @@
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


