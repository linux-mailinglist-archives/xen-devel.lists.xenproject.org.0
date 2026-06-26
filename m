Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r8QfLAefPmoIJQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A16CEA0B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2026 17:47:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JiFyoE88;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1346289.1604847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8lm-0003nW-6N; Fri, 26 Jun 2026 15:47:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1346289.1604847; Fri, 26 Jun 2026 15:47:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wd8ll-0003eR-Lv; Fri, 26 Jun 2026 15:47:05 +0000
Received: by outflank-mailman (input) for mailman id 1346289;
 Fri, 26 Jun 2026 15:47:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wd8li-0002xD-3b
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 15:47:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wd8lh-008hTo-Fi
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2026 17:47:01 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ed7-2eae-0a2a0a5409dd-0a2a4509c3ce-44
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:01 +0200
Received: from [209.85.167.54] (helo=mail-lf1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3e9ef5-97e6-0a2a45090019-d155a736bc1d-3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 17:47:01 +0200
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5aea7e6220aso809434e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2026 08:47:01 -0700 (PDT)
Received: from fedora (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5ae9cd5b232sm2612888e87.29.2026.06.26.08.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 08:47:00 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782488821; x=1783093621; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AchFHgJ16zmh1UmcP9J522LiWGX/SFON840u47F4Ksk=;
        b=JiFyoE88hmDxrKTGkldVJOfGKf/fN5KaRmq0B0nThqGG0iE1yM3Bei5uGT7/9BPduC
         rY0TBY3LYLUB3PNOhGoXuOSGEGk9BmBBxzhyAvnNQtjmsT9lxVlyhV6nunu+XEVH7vnn
         DgVyi2a8czr/IQkj8xOgywrmAbQU9jyPEfO25TUKMbO5pQ3ZH0EugbzP2S3+cQaDQQnI
         jlNORpahAmcDZ+O6lcwd+YbFaBwhvpEcH9KLLg4shyJ9Unl6HmzN4I2juBZqMcDHNfGe
         rZYmoAqztlX81dnDvXVUMeJFfjYaHQcQJXJQ+iz4Cdoq7cZ3HAV81IKitn76vygZoECa
         w7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782488821; x=1783093621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AchFHgJ16zmh1UmcP9J522LiWGX/SFON840u47F4Ksk=;
        b=hSZOmRtDEG5f3qGUOrRQelz2EOW8KGIUZASa1ljAuztMfmZRgo3ZksdkvALyw7fQC6
         a3WpBFQK0QUJEvN5JHZPO6ad/ikz1c7pBXu7erAJ86uhe/s1r7d22V00SVHyiDiRoJGf
         FT1PVTo6NJSy53Gjoq8nmcJTUfGPtf4t+7rZm3P0JtJXAsUOkjCgaQx3QfjqWjUP83QL
         1lwFbGFbELPXcVKKUg9dk7L9mKfhRVFIwy3+Yu+9RfapA6UBCSZzz1gn+tYnnLQIqHNr
         RqGocn1mFbmZsBPQ/4mcUMnuNxFlmdSBZ/tp1vn6t2QJ+ce/s5dCDjrtRPxYTJzfSCxm
         nfNA==
X-Gm-Message-State: AOJu0Yx9PlE7h+gG+AFy5e5wWhexWYGuUcRv0wIRa2i7x//Ymqz67O5a
	x2LTJ3EBQaE6o7/5nawfSqbTB6lLzz+TKmrHsOznn9N+N7jNZ4wVF+LeDui/Bg==
X-Gm-Gg: AfdE7cmCNi6XW9NFnrRgF+/SrN3HKNETaQ9sU4TY0E4xi1pLyA35cFxXU5FtTbGJCWs
	ta9qoF2IMH/OlBsEFd3MMZ+2adDdQoc18e1dDOyE1+U6dvJ/z9hsUV9IwAciS+pNyyWgtDEU5g+
	+S1QvqNPAXYpB28fKvHUYMvx+rqmtpaG63qiyGTbc+Vh4DhFfcz0aFbhaZx4TVFUfc+Vhg66M4p
	eXvOl0n7nQW6dYTnzJA4d4FvgT4rMbcsM5M42rlz5Nbxm17ZzD3zerioaySmpp52WRGYwf8O5gB
	UvfycwAbKythEZRQykI9OeGY1x/HEgaD1rH74btnjF7B6jQ0YdH9VJegYE/zYRaxpS2a5Out904
	BILJxU+Cnz7sOX4tPRZO4ddeGVDuQ31wXra/GY4JPzsjI4YOtFKXMP0n0tUcm+BkKFoB3TnwWpN
	iUG9LN6EfjFkh/kTkGzyluVctl9D26rsbgyhUlhu5rQnQpZgNqhpO9+ZaCSg==
X-Received: by 2002:a05:6512:3c92:b0:5aa:6fff:c3e3 with SMTP id 2adb3069b0e04-5aea1f4cdf3mr2573519e87.33.1782488820619;
        Fri, 26 Jun 2026 08:47:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
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
Subject: [PATCH v4 16/25] xen/riscv: introduce minimal virtual APLIC (vAPLIC) infrastructure
Date: Fri, 26 Jun 2026 17:46:25 +0200
Message-ID: <61603c1548b7c685fb92e1b687445fc1b6a95c35.1782487661.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782487661.git.oleksii.kurochko@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1782488821-46B3B986-AEAF6148/10/73395122804
X-purgate-type: spam
X-purgate-size: 8640
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,gmail.com,wdc.com,citrix.com,amd.com,suse.com,xen.org,kernel.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:oleksii.kurochko@gmail.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 343A16CEA0B

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
vaplic_init() and init vintc_ops->vcpu_init() with it.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v4:
 - Change subject of the commit.
 - s/APLIC_DOMAINCFG_RO80/APLIC_DOMAINCFG_RO + added a comment above definition.
 - Drop unnessary blank lines.
---
Changes in v3:
 - Drop ASSERT() before vintc->ops->vcpu_init() in arch_vcpu_create(); a
   NULL deref already produces a sufficient backtrace.
 - Parenthesize macro argument in to_vaplic().
 - Drop __init from domain_vaplic_init() and domain_vaplic_deinit() since
   the caller domain_vintc_init() (follow-up patch) is not __init.
 - Remove pointless zero-initializer for rc in vcpu_vaplic_init().
 - Fix domain_vaplic_deinit() to null d->arch.vintc before freeing, making
   the function idempotent.
 - Drop intc_irq_nums(), (*nr_irqs)(void) hook from intc_hw_operations,
   aplic_nr_irqs(), and vintc->nr_irqs field entirely.
 - Rename vcpu_vaplic_init() to vaplic_init() and drop vgein_assign() and
   imsic_set_guest_file_id() calls; those will be introduced/called later,
   where for sure we will know on which pCPU vCPU as it is required for
   proper h/w IMSIC interrupt file calculation, to have this initialization
   in one place.
 - Introduce vaplic_deinit().
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
---
 xen/arch/riscv/Makefile             |  1 +
 xen/arch/riscv/domain.c             | 11 ++---
 xen/arch/riscv/include/asm/aplic.h  |  3 ++
 xen/arch/riscv/include/asm/intc.h   | 10 +++++
 xen/arch/riscv/include/asm/vaplic.h | 34 ++++++++++++++++
 xen/arch/riscv/vaplic.c             | 63 +++++++++++++++++++++++++++++
 6 files changed, 114 insertions(+), 8 deletions(-)
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
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index e4a8c27ea9cb..129e775c52cb 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -11,6 +11,7 @@
 #include <asm/bitops.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
+#include <asm/intc.h>
 #include <asm/riscv_encoding.h>
 #include <asm/vtimer.h>
 
@@ -155,14 +156,8 @@ int arch_vcpu_create(struct vcpu *v)
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
+    if ( (rc = v->domain->arch.vintc->ops->vcpu_init(v)) )
+        goto fail;
 
     return rc;
 
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index b0724fe6f360..2e606b8cd947 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -15,6 +15,9 @@
 
 #include <asm/imsic.h>
 
+
+/* domaincfg bits 31:24 are read-only 0x80 */
+#define APLIC_DOMAINCFG_RO      (0x80U << 24)
 #define APLIC_DOMAINCFG_IE      BIT(8, U)
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
 
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 9b701445179f..46a0073c2d59 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -15,6 +15,7 @@ enum intc_version {
 struct cpu_user_regs;
 struct irq_desc;
 struct kernel_info;
+struct vcpu;
 
 struct intc_info {
     enum intc_version hw_version;
@@ -51,8 +52,17 @@ struct vintc_init_ops {
     int (*make_domu_dt_node)(struct kernel_info *kinfo);
 };
 
+struct vintc_ops {
+    /* Initialize some vINTC-related stuff for a vCPU */
+    int (*vcpu_init)(struct vcpu *v);
+
+    /* Deinitialize some vINTC-related stuff for a vCPU */
+    void (*vcpu_deinit)(struct vcpu *v);
+};
+
 struct vintc {
     const struct vintc_init_ops *init_ops;
+    const struct vintc_ops *ops;
 };
 
 void intc_preinit(void);
diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
new file mode 100644
index 000000000000..96080bfbc23b
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
+#define to_vaplic(d) container_of((d)->arch.vintc, struct vaplic, vintc)
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
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
new file mode 100644
index 000000000000..6562b25f0abb
--- /dev/null
+++ b/xen/arch/riscv/vaplic.c
@@ -0,0 +1,63 @@
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
+static int cf_check vaplic_init(struct vcpu *v)
+{
+    return vcpu_imsic_init(v);
+}
+
+static void cf_check vaplic_deinit(struct vcpu *v)
+{
+    return vcpu_imsic_deinit(v);
+}
+
+static const struct vintc_ops vintc_ops = {
+    .vcpu_init = vaplic_init,
+    .vcpu_deinit = vaplic_deinit,
+};
+
+int domain_vaplic_init(struct domain *d)
+{
+    struct vaplic *vaplic = xvzalloc(struct vaplic);
+
+    if ( !vaplic )
+        return -ENOMEM;
+
+    d->arch.vintc = &vaplic->vintc;
+    d->arch.vintc->ops = &vintc_ops;
+
+    vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
+                             APLIC_DOMAINCFG_RO;
+
+    return 0;
+}
+
+void domain_vaplic_deinit(struct domain *d)
+{
+    struct vaplic *vaplic;
+
+    if ( !d->arch.vintc )
+        return;
+
+    vaplic = to_vaplic(d);
+    d->arch.vintc = NULL;
+    xvfree(vaplic);
+}
-- 
2.54.0


