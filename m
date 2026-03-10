Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD8rMlJQsGnFhgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773232554CB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250402.1547969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aJ-0004yr-36; Tue, 10 Mar 2026 17:09:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250402.1547969; Tue, 10 Mar 2026 17:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00aI-0004s7-K3; Tue, 10 Mar 2026 17:09:30 +0000
Received: by outflank-mailman (input) for mailman id 1250402;
 Tue, 10 Mar 2026 17:09:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHsH=BK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1w00aG-0001Q4-SQ
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 17:09:28 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e57a1eca-1ca3-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 18:09:28 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48534b59cf3so23997145e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 10:09:28 -0700 (PDT)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485359bf807sm119619845e9.2.2026.03.10.10.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2026 10:09:26 -0700 (PDT)
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
X-Inumbo-ID: e57a1eca-1ca3-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162567; x=1773767367; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQUbsjGqpyJLaNssEnVD+AE4bLsCeyAg53aMfThr8Pc=;
        b=aJE7+K0BbJsUvk1B1xX1Istj/kPDTotAGS6MqmEnPDM6IyYxmrq/qCAcSFCpIZLU5V
         aeBci1Zrh92xcvw/OLEJeNnmM3vfcnhZ1JSC2Lux2tW9oFF/e0lgOvQzkRRZvdSGQ4u/
         c+9PwLGbmYhYlhSAIsWUgir0fn3ElCUfZSimndynWdCAYyR00WQ1PxO49yo75zfxb5k6
         H1rrtaJ5cyX+FC+jAPSlTrocRvfU8szxjqXptUzwd91yKBtUVfm+vG25ysFWl3GMoBYr
         hYqE/SLV30xgNlDyUSKZ4azsa8QwtdQSb0cAG1O8J3P05g2+QpbBcakLVmcLSfoswHOR
         2HPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162567; x=1773767367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQUbsjGqpyJLaNssEnVD+AE4bLsCeyAg53aMfThr8Pc=;
        b=ksmbL+54lHEsE0iM6G4Jb5laaA6XXFJXJGtyd2SqnfUoJJVG9dbjXqTX1zO8DxVpBh
         l7XGTLIGu4HWHV8NlyEGrv6w7xKxoBKkp8dFtl+sps4NL5vKHpDb0o9itohjT5vQ1bNv
         b9Jk89keU56BZkHzNwGVXfadzEzs/6XvP86RgJPlI/BT9i+mkHilMNv2RtGmDbTVdqRH
         boB4+zgdIE0DCtJHocN9rl1atWnFVfketcY5VDsbAZmvlxRqkX8BAcSRwnqXiXzvolXw
         7xUsDZjTjKZ7YxKrpOzTeEbiJW00Wk2P+LR0yjoPQMBPk3ousICy967ycAGI1iwev18H
         9nDw==
X-Gm-Message-State: AOJu0YygSFzMmw78j0HpEomguvy+0rzSEAuo8T/lc35ecv/u2uopoKQM
	IjbCyPdGZqOvfs6TymaqbFUqJSSX1KQbhGG3OO2llIJ+dNF2vKUCjBvleYQdDLV8
X-Gm-Gg: ATEYQzxuCZ/WCOLt8P7p2vtxyZLhi5CXJw1750jTpnF742lxp8+ytoRopOhdIzk6ksZ
	fREDoxqLx2UCLYywB/PkNhyWEDyRZcxsBkE8TaejjYGnbsjXfVzudojOBwckoKO1i6DbQt3BTdV
	ej4E9+tMY6sxELwknHQFaZDwqG0R81Yo/F0+JCUsxpImtmuRff68pv7rlpjvDDolZoIVC7JCCmz
	KWfBwmMeDOuVzdzA87TENu/2zEeVp0yz3kOaqhlPmpWTXtjiBwMWxqmKjzNNpgKbUhuw8Snd0KH
	1jZ7z2IUF3zQYNkLPZUpvxfvII2MiwOV13SAwGfGgQJwcVhZjU0FF4/cLFI7H4nH0Ajq32SvxDJ
	jC/yP4p3m3uiOhZvK+ez9e4POxktRkdvKdObkS43JvX8QW5UqZl/S6pv5PAfuZLVyrdvY/3pOuf
	2FD73PPZiqAQ2b3upWgj5HboPBV/nPkR0y8Fp1f0vJd8rf47kg3/Zrt/SX8aMRqzG2sw==
X-Received: by 2002:a05:600c:8b86:b0:485:3473:d4a1 with SMTP id 5b1f17b1804b1-4853473d6dcmr167697795e9.34.1773162567282;
        Tue, 10 Mar 2026 10:09:27 -0700 (PDT)
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
Subject: [PATCH v1 15/27] xen/riscv: add very early virtual APLIC (vAPLIC) initialization support
Date: Tue, 10 Mar 2026 18:08:48 +0100
Message-ID: <e8bcf5618a19fb44d4391410f2f67ffd98a96647.1773157782.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773157782.git.oleksii.kurochko@gmail.com>
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 773232554CB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
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
 xen/arch/riscv/Makefile             |  1 +
 xen/arch/riscv/domain.c             | 11 ++---
 xen/arch/riscv/include/asm/domain.h |  2 +
 xen/arch/riscv/include/asm/intc.h   | 14 ++++++
 xen/arch/riscv/include/asm/vaplic.h | 36 ++++++++++++++
 xen/arch/riscv/intc.c               |  1 +
 xen/arch/riscv/vaplic.c             | 74 +++++++++++++++++++++++++++++
 7 files changed, 131 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/vaplic.h
 create mode 100644 xen/arch/riscv/vaplic.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index d772b42386c0..b9941a230e03 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -24,6 +24,7 @@ obj-y += smpboot.o
 obj-y += stubs.o
 obj-y += time.o
 obj-y += traps.o
+obj-y += vaplic.o
 obj-y += vmid.o
 obj-y += vm_event.o
 obj-y += vsbi/
diff --git a/xen/arch/riscv/domain.c b/xen/arch/riscv/domain.c
index 515735b32e30..560b21b16ffb 100644
--- a/xen/arch/riscv/domain.c
+++ b/xen/arch/riscv/domain.c
@@ -11,6 +11,7 @@
 #include <asm/bitops.h>
 #include <asm/cpufeature.h>
 #include <asm/csr.h>
+#include <asm/intc.h>
 #include <asm/riscv_encoding.h>
 #include <asm/vtimer.h>
 
@@ -154,14 +155,8 @@ int arch_vcpu_create(struct vcpu *v)
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
 
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/asm/domain.h
index bdb1ffd748c9..21a3e6876f36 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -98,6 +98,8 @@ struct arch_domain {
     struct paging_domain paging;
 #endif
 
+    struct vintc *vintc;
+
     /* Next unused device tree phandle number */
     uint32_t next_phandle;
 };
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 8300d71d472f..c5a869db8bc5 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -16,6 +16,7 @@ struct cpu_user_regs;
 struct dt_device_node;
 struct irq_desc;
 struct kernel_info;
+struct vcpu;
 
 struct intc_info {
     enum intc_version hw_version;
@@ -47,6 +48,19 @@ struct intc_hw_operations {
                             const struct dt_device_node *intc);
 };
 
+struct vintc_ops {
+    /* Initialize some vINTC-related stuff for a vCPU */
+    int (*vcpu_init)(struct vcpu *vcpu);
+
+    /* Check if a register is virtual interrupt controller MMIO */
+    int (*is_access)(const struct vcpu *vcpu, const unsigned long addr);
+};
+
+struct vintc {
+    const struct intc_info *info;
+    const struct vintc_ops *ops;
+};
+
 void intc_preinit(void);
 
 void register_intc_ops(const struct intc_hw_operations *ops);
diff --git a/xen/arch/riscv/include/asm/vaplic.h b/xen/arch/riscv/include/asm/vaplic.h
new file mode 100644
index 000000000000..7684f3490829
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vaplic.h
@@ -0,0 +1,36 @@
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
+#define to_vaplic(v) container_of(v, struct vaplic, base)
+
+struct vaplic_regs {
+    uint32_t domaincfg;
+    uint32_t smsiaddrcfg;
+    uint32_t smsiaddrcfgh;
+};
+
+struct vaplic {
+    struct vintc base;
+    struct vaplic_regs regs;
+};
+
+int domain_vaplic_init(struct domain *d);
+void domain_vaplic_deinit(struct domain *d);
+
+#endif /* ASM__RISCV__VAPLIC_H */
diff --git a/xen/arch/riscv/intc.c b/xen/arch/riscv/intc.c
index c9f12651fda1..ff7a76accaca 100644
--- a/xen/arch/riscv/intc.c
+++ b/xen/arch/riscv/intc.c
@@ -6,6 +6,7 @@
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
+#include <xen/sched.h>
 #include <xen/spinlock.h>
 
 #include <asm/aia.h>
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
new file mode 100644
index 000000000000..9b105de7ed7d
--- /dev/null
+++ b/xen/arch/riscv/vaplic.c
@@ -0,0 +1,74 @@
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
+static int __init cf_check vcpu_vaplic_init(struct vcpu *v)
+{
+    int rc = 0;
+
+    rc = vcpu_imsic_init(v);
+    if ( rc )
+        return rc;
+
+    imsic_set_guest_file_id(v, vgein_assign(v));
+
+    return rc;
+}
+
+static const struct vintc_ops vaplic_ops = {
+    .vcpu_init = vcpu_vaplic_init,
+};
+
+static struct vintc * __init vaplic_alloc(void)
+{
+    struct vaplic *v = NULL;
+
+    v = xvzalloc(struct vaplic);
+    if ( !v )
+        return NULL;
+
+    return &v->base;
+}
+
+int __init domain_vaplic_init(struct domain *d)
+{
+    int ret = 0;
+
+    d->arch.vintc = vaplic_alloc();
+    if ( !d->arch.vintc )
+    {
+        ret = -ENOMEM;
+        goto fail;
+    }
+
+    d->arch.vintc->ops = &vaplic_ops;
+    to_vaplic(d->arch.vintc)->regs.domaincfg =
+        APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM;
+
+ fail:
+    return ret;
+}
+
+void __init domain_vaplic_deinit(struct domain *d)
+{
+    struct vaplic *vaplic = to_vaplic(d->arch.vintc);
+
+    XVFREE(vaplic);
+}
-- 
2.53.0


