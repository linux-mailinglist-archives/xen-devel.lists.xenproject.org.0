Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN35Cbv2/WlilQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30BA4F7FAE
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303761.1577109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQs-0000FG-T3; Fri, 08 May 2026 14:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303761.1577109; Fri, 08 May 2026 14:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMQs-00005V-6x; Fri, 08 May 2026 14:44:02 +0000
Received: by outflank-mailman (input) for mailman id 1303761;
 Fri, 08 May 2026 14:44:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLMQp-00085T-OD
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:43:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMQn-00EphB-GZ
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:43:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6a1-e002-0a2a0a5209dd-0a2a4507ac04-26
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:58 +0200
Received: from [209.85.208.52] (helo=mail-ed1-f52.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fdf6ae-229c-0a2a45070019-d155d034b498-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:43:58 +0200
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-67e43a8996fso2007413a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 07:43:58 -0700 (PDT)
Received: from fedora (user-109-243-69-121.play-internet.pl. [109.243.69.121])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bcac4942068sm90736166b.62.2026.05.08.07.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 07:43:57 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251438; x=1778856238; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Y3wyFh809LwLfmzoza0kbwPpO/WboEnvN0kZbUKjhY=;
        b=DOT+I7UNBTFPwVkGGvfhYfPWCZeadFdCYE15d+A1mYSSt7D3N6+oZIsNUa/1Ac/ZGS
         YKPHwgk8gbWGp9LV3Iqn+16dIKzsofqnT3o05p7m3QoYkhjDYHsklwpd63Y4wcKMe3Mj
         ZwEPGNLBfPpcDwaBUOal+It8yCe5Z8SH1XM0K516IdO7mb2oARA2AffEaEcDt2T/JpLw
         R64UUsBYte8V8wxGHUib7PKpfs5RO8eVoMUm/cN+SOC0H+pPVz+pWMLeNky9wCLsRzh6
         sjN35//2bdZFPL34n/OpaDFxC85ukB7KoG/jraxfm5w7Xino2LlJBpIhqsJsc5/AElve
         RRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251438; x=1778856238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Y3wyFh809LwLfmzoza0kbwPpO/WboEnvN0kZbUKjhY=;
        b=Iy+80TsBdpHL8JvZn6nCdykA2wXw34coK2n8z5IcA14ukoVk1R5l3u7i7IaUupakSg
         jbOdtCw3xnFlcYgBcSWyYCqmZgzTiW06513SlPmt15HhZm3TT5ekvfaCW9jqQ7nUT1Im
         0PqeXA+IhMXmQqG/yWQuiO0qbXJ/zYege7YuPsMpIQV+aFVKgQXkQOsUhRYkJxZKCIRj
         QQsbYqr8HBs15U6A+xRNugNBelUsG2G7HEJ/D7Hshtxfxc5Lgx5GD1b9d5tkA2pGGmwX
         2aOMRpM+a2NulSuOPsfdIBCkj6mevg3/VSf37YXY6a4YXTBhRBBPQapXYofLna2c9s2I
         R6GA==
X-Gm-Message-State: AOJu0YwaGmYh7QHEPMO0kgCh/vplVijHMRqsIJUMFBU71ksvH88sXujs
	f9ELPmjAnyr7pOcNfd/5qz7sYWGmXpB3lB0uWlBD6MMFX4LNcc+g/YpmBt6asA==
X-Gm-Gg: AeBDiev+beMyKX1Bt/WbalhmAAfNFOrQeGfaj64W0GaXAbAlOKx26dRlKnj/rM6gJY7
	WnevXLsCSof+xwyPkKB9ixVbpWT9bOJRjdl+zxskhBR7CUSkalg2q6HudNpnUZCTeYiqeMeuxiO
	2B970wn7JF2DODqZzvw3EOFtq7ef6JguakkZjiptAkYlRUbWmCDPCZHKpWZN0P0HgbyaUPdfnNv
	wcULa7411GfZHQwHHsVpnTSoTb9SrE7VmZBUhs8F7AV7tYl7xX7W7gsb6TOf7w0WMjRacjEwngu
	+g4y6fpsqMSY6/s54adnG7BfXHqYo8T9APkn67vsluKcKnHuHSxOJdkIUr8n4A0EtOf1sB6W+j4
	/ospAF+StQLA9qcwWDzpxZUIGOXBZIxTqdoZsQO5jEbDNlufOTyjriKXC6XpIF9GH65nqU61Pvr
	XdrLmVczO6d/LdjxHG6UPW5OXeVifqfwI6MJKOKZBWhVWAs5axvFXkNwX56TeQxWXpJ4tvD7LyG
	m54
X-Received: by 2002:a17:907:c298:b0:bc4:a75e:1abb with SMTP id a640c23a62f3a-bc56cc2c06bmr790256166b.21.1778251437856;
        Fri, 08 May 2026 07:43:57 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 14/26] xen/riscv: add very early virtual APLIC (vAPLIC) initialization support
Date: Fri,  8 May 2026 16:43:16 +0200
Message-ID: <220cf09814744b8b8136b1e3c35ab982226d3f6f.1778250616.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778250616.git.oleksii.kurochko@gmail.com>
References: <cover.1778250616.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778251438-0AD77C48-834605D1/10/73395122804
X-purgate-type: spam
X-purgate-size: 9408
X-Rspamd-Queue-Id: A30BA4F7FAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,wdc.com,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,microchip.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

At the current development stage, only domain vINTC init and deinit
operations are required, so implement those first.

Initialize vAPLIC's domaincfg to with the interrupt-enable bit set and
MSI delivery mode selected as the current solution is exepcted to have
always IMSIC, and initialize vintc->ops.

Other operations such as emulate_load(), emulate_store(), and is_access()
will be needed once guests are running and MMIO accesses to APLIC MMIO
range must be handled. These will be introduced separately later.

Introduce a structure to describe a virtual interrupt controller (vINTC)
and a vintc_ops structure, which provides operations to emulate load and
store accesses to interrupt controller MMIOs and to check whether a given
address falls within the MMIO range of a specific virtual interrupt
controller.

The vAPLIC implementation of these operations will be provided later
once guests can be run and these operations are actually needed.

Introduce these structures here as they are required for the implementation
of domain_vaplic_init() and domain_vaplic_alloc(). Also, introduce
vcpu_vaplic_init() and init vintc_ops->vcpu_init() with it.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - s/vcpu/v for function arguments in struct vintc_ops().
 - Update the comment above is_access() and drop const for addr argument.
 - Update to_vaplic() to work with 'struct domain *'.
 - Drop smsiaddrcfg{h} from vaplic_regs struct as they aren't used for now.
 - Drop inclusion of xen/schec.h from intc.c.
 - use result of xvzalloc() as initializer in vpalic_alloc().
 - Drop goto in domain_vaplic_init().
 - s/XVFREE/xvfree.
 - s/aplic/vintc.
 - Drop __init for vcpu_vaplic_init() as it could be called for secondary CPU bring up.
 - Drop vaplic_alloc().
 - Drop vintc_ops struct, embed callbacks iniside struct vintc.
 - Introduce and init vintc irqs for vAPLIC.
 - Introduce intc_irq_nums() to properly initialize number of vAPLIC's irqs.
---
 xen/arch/riscv/Makefile             |  1 +
 xen/arch/riscv/aplic.c              |  6 +++
 xen/arch/riscv/domain.c             | 13 ++---
 xen/arch/riscv/include/asm/intc.h   | 17 ++++++-
 xen/arch/riscv/include/asm/vaplic.h | 34 +++++++++++++
 xen/arch/riscv/intc.c               |  7 +++
 xen/arch/riscv/vaplic.c             | 78 +++++++++++++++++++++++++++++
 7 files changed, 147 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 9df8b72b5494..9d8d21b65188 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -25,6 +25,7 @@ obj-y += smpboot.o
 obj-y += stubs.o
 obj-y += time.o
 obj-y += traps.o
+obj-y += vaplic.o
 obj-y += vmid.o
 obj-y += vm_event.o
 obj-y += vsbi/
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 97dc0ef731f0..aba9f3945236 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -295,6 +295,11 @@ static void cf_check aplic_set_irq_type(struct irq_desc *desc,
     spin_unlock(&aplic.lock);
 }
 
+static unsigned int cf_check aplic_irq_num(void)
+{
+    return aplic_info.num_irqs;
+}
+
 static const hw_irq_controller aplic_xen_irq_type = {
     .typename     = "aplic",
     .startup      = aplic_irq_startup,
@@ -309,6 +314,7 @@ static const struct intc_hw_operations aplic_ops = {
     .host_irq_type       = &aplic_xen_irq_type,
     .handle_interrupt    = aplic_handle_interrupt,
     .set_irq_type        = aplic_set_irq_type,
+    .irq_nums            = aplic_irq_num,
 };
 
 static const struct intc_hw_init_ops __initdata aplic_init_ops = {
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 041aed176f32..7aa00d6cfd95 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -11,6 +11,7 @@
 #include <asm/bitops.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
+#include <asm/intc.h>
 #include <asm/riscv_encoding.h>
 #include <asm/vtimer.h>
 
@@ -155,14 +156,10 @@ int arch_vcpu_create(struct vcpu *v)
     if ( (rc = vcpu_vtimer_init(v)) )
         goto fail;
 
-    /*
-     * As interrupt controller (IC) is not yet implemented,
-     * return an error.
-     *
-     * TODO: Drop this once IC is implemented.
-     */
-    rc = -EOPNOTSUPP;
-    goto fail;
+    ASSERT(v->domain->arch.vintc->ops->vcpu_init);
+
+    if ( (rc = v->domain->arch.vintc->ops->vcpu_init(v)) )
+        goto fail;
 
     return rc;
 
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 70df461a2a51..3b30d000066a 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -15,6 +15,7 @@ enum intc_version {
 struct cpu_user_regs;
 struct irq_desc;
 struct kernel_info;
+struct vcpu;
 
 struct intc_info {
     enum intc_version hw_version;
@@ -38,6 +39,8 @@ struct intc_hw_operations {
 
     /* handle external interrupt */
     void (*handle_interrupt)(struct cpu_user_regs *regs);
+
+    unsigned int (*irq_nums)(void);
 };
 
 struct intc_hw_init_ops {
@@ -50,8 +53,18 @@ struct vintc_init_ops {
     int (*make_domu_dt_node)(struct kernel_info *kinfo);
 };
 
+struct vintc_ops {
+    /* Initialize some vINTC-related stuff for a vCPU */
+    int (*vcpu_init)(struct vcpu *v);
+
+    /* Check if a address is virtual interrupt controller MMIO */
+    int (*is_access)(const struct vcpu *v, unsigned long addr);
+};
+
 struct vintc {
-    struct vintc_init_ops *init_ops;
+    unsigned int irq_nums;
+    const struct vintc_init_ops *init_ops;
+    const struct vintc_ops *ops;
 };
 
 void intc_preinit(void);
@@ -65,4 +78,6 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
 
 void intc_handle_external_irqs(struct cpu_user_regs *regs);
 
+unsigned int intc_irq_nums(void);
+
 #endif /* ASM__RISCV__INTERRUPT_CONTOLLER_H */
diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
new file mode 100644
index 000000000000..630ca14657f2
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * xen/arch/riscv/vaplic.c
+ *
+ * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
+ *
+ * Copyright (c) Microchip.
+ */
+
+#ifndef ASM__RISCV__VAPLIC_H
+#define ASM__RISCV__VAPLIC_H
+
+#include <xen/kernel.h>
+#include <xen/types.h>
+
+#include <asm/intc.h>
+
+struct domain;
+
+#define to_vaplic(d) container_of(d->arch.vintc, struct vaplic, vintc)
+
+struct vaplic_regs {
+    uint32_t domaincfg;
+};
+
+struct vaplic {
+    struct vintc vintc;
+    struct vaplic_regs regs;
+};
+
+int domain_vaplic_init(struct domain *d);
+void domain_vaplic_deinit(struct domain *d);
+
+#endif /* ASM__RISCV__VAPLIC_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index a611c9dc5f32..122adf78a391 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -78,6 +78,13 @@ void intc_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
     intc_set_irq_priority(desc, priority);
 }
 
+unsigned int intc_irq_nums(void)
+{
+    ASSERT(intc_hw_ops && intc_hw_ops->irq_nums);
+
+    return intc_hw_ops->irq_nums();
+}
+
 int __init make_intc_domU_node(struct kernel_info *kinfo)
 {
     struct vintc *vintc = kinfo->bd.d->arch.vintc;
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
new file mode 100644
index 000000000000..d2ec196668bc
--- /dev/null
+++ b/xen/arch/riscv/vaplic.c
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * xen/arch/riscv/vaplic.c
+ *
+ * Virtual RISC-V Advanced Platform-Level Interrupt Controller support
+ *
+ * Copyright (c) Microchip.
+ * Copyright (c) Vates
+ */
+
+#include <xen/errno.h>
+#include <xen/sched.h>
+#include <xen/xvmalloc.h>
+
+#include <asm/aia.h>
+#include <asm/imsic.h>
+#include <asm/intc.h>
+#include <asm/vaplic.h>
+
+#include "aplic-priv.h"
+
+#define VAPLIC_NUM_SOURCES 96
+
+static int cf_check vcpu_vaplic_init(struct vcpu *v)
+{
+    int rc = 0;
+    unsigned int vgein_id;
+
+    rc = vcpu_imsic_init(v);
+    if ( rc )
+        return rc;
+
+    if ( !(vgein_id = vgein_assign(v)) )
+    {
+        printk("Software interrupt files aren't supported\n");
+        rc = -EOPNOTSUPP;
+        goto fail;
+    }
+
+    imsic_set_guest_file_id(v, vgein_id);
+
+    return rc;
+
+ fail:
+    vcpu_imsic_deinit(v);
+
+    return rc;
+}
+
+static const struct vintc_ops vintc_ops = {
+    .vcpu_init = vcpu_vaplic_init,
+};
+
+int __init domain_vaplic_init(struct domain *d)
+{
+    struct vaplic *vaplic = xvzalloc(struct vaplic);
+
+    if ( !vaplic )
+        return -ENOMEM;
+
+    d->arch.vintc = &vaplic->vintc;
+    d->arch.vintc->ops = &vintc_ops;
+
+    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
+
+    d->arch.vintc->irq_nums = min(intc_irq_nums(),
+                                  VAPLIC_NUM_SOURCES + 0U);
+
+
+    return 0;
+}
+
+void __init domain_vaplic_deinit(struct domain *d)
+{
+    struct vaplic *vaplic = to_vaplic(d);
+
+    xvfree(vaplic);
+}
-- 
2.54.0


