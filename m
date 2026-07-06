Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T2QTG8DQS2otawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC754712EEA
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:58:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=tBAP5QKy;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355525.1610408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliZ-0002t2-Fi; Mon, 06 Jul 2026 15:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355525.1610408; Mon, 06 Jul 2026 15:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgliY-0002dK-9l; Mon, 06 Jul 2026 15:58:46 +0000
Received: by outflank-mailman (input) for mailman id 1355525;
 Mon, 06 Jul 2026 15:58:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliU-000257-Tl
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliU-00AcZM-9N
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0ae-5cb7-0a2a0a5109dd-0a2a4506c18e-6
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:42 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0b1-08de-0a2a45060019-d155802bbc26-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:42 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so22318595e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:42 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:40 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353521; x=1783958321; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=517+1oBC/3etFT89VUu919j8ILu9fgNtL2l2e+ESqVQ=;
        b=tBAP5QKybvsIqzKJV8677XyaOpBVvExAEK4ebMYQHiAMvOnF7d0qsjv2E9rZtEju6m
         h2ag7a+5+8QGaRWaGhk660kkK8/pvrLDfOMjeKldM2ls63kt3ZUnUMruSbvv6VhREcB9
         /LNYGD7idtO4TvVGt2yV8Yn29t20xIn/UpTZrosNbgu6laKVkeiWGuOBqeN+el65Ivca
         Q3DCq6MYEBMb7Zzu/If+29+RD+n6f3V4GQToSPnZKW7YA1+aQPOZu1cj6BYeWcKOKXq3
         k1soeIG54Zf9VHQFiPAqAwmJGix/pB4U6qwRNN7jbpiD/UxphiLIn/Asf7LjWrLVEGOQ
         QnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353521; x=1783958321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=517+1oBC/3etFT89VUu919j8ILu9fgNtL2l2e+ESqVQ=;
        b=SMG1yRSgGAHl9VmzUcWEJ/2UaTBIK/wT5B5gDoWh/wJwFXOpTSQSdI4baAhk9blkM7
         +hdJU6PPwdNlFdGz3u+qiIG9qg8cgeM1Hdf4bCG7igWTOhGFw1eyQ7HOycJ/3excSk08
         CP4O7UbRZX0n3dHAIAR5TBl4g0M4bs+WzM0Dlf5Tl1BwUE70RHSnsad9VDkRlxK1Gd8R
         t4up2uXiayEq2T4CEFA0CpCqA3w5SLA9/AVqimIvZVw2t+f3Xle05srPjFSAtj4RcplN
         ZnRG2cVSGIKDvqMjrauPTBnuZ8b/aXbnovRkVATYIfJx4Nl1SGebEzLEB90+FKMmJwlx
         5zuQ==
X-Gm-Message-State: AOJu0YzlMsTIz+ON3hYPn/p8RM2wW7D19JQCKDDDAx4etKAj/FhKHPB4
	X/wIQxBEEv2yKJEiwBNPUQD3f+Y4+uy813INAyZAdzdqfYmCeTn5nicVoTqGYg==
X-Gm-Gg: AfdE7cnmOdYRPkqKWjXG6Dy9JtCuaIu8TcHMQwdhN7wifV8O4GN2Arj6uzAbms9uF/5
	+iuidMdJvlXf4VLc9LG49ErgG4e2U3FcGFWR1xchNSNPtsqwghUHlP+pjR8v0vqZfCItaPNhY/k
	lYzjtTAz3EooR82HHC0jJNdzvSR7vC1x+/l0hDPKxQb82PPhl+bUwRHxwDVNB/Q7lF4IOtR3Qlm
	NDd1QTP9Un7uHhCbtLqC6brwsJQvUxDYMEhiuvQCm64g4E3zu7OXV3fqnyQGr/c3MLqUkL1CHX/
	iyaZqY2TZmxhu5nOSJrJhidS2j2+3lrPJSPiMi59dtQh4m3aIGxVklJFaUL1KvPpbIpONOseiKT
	NomXjEHiOpiXZenb1b6lDLpkPu2eVx99EFBq1UNltvQ6bc4jWB2BKpHlCUlZswBhxztSdid/l5W
	Q6miwx9v3fVFbDv4LXgbV4KAkcxPpxU1SuvhKPx8YJeacK4s4pjMVjdawz/g==
X-Received: by 2002:a05:600c:83c9:b0:493:bc31:b2ae with SMTP id 5b1f17b1804b1-493df040597mr14466295e9.10.1783353521386;
        Mon, 06 Jul 2026 08:58:41 -0700 (PDT)
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
Subject: [PATCH v5 17/26] xen/riscv: introduce minimal virtual APLIC (vAPLIC) infrastructure
Date: Mon,  6 Jul 2026 17:57:58 +0200
Message-ID: <1f51410c080599a5c80173398d9db837b8718356.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1783353522-C7B2A68D-F0370B61/10/73395122804
X-purgate-type: spam
X-purgate-size: 9099
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,microchip.com:email];
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
X-Rspamd-Queue-Id: EC754712EEA

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
Note that already existed init_ops field in struct vintc will be init-ed
for APLIC in the follow up patch.

The vAPLIC implementation of these operations will be provided later
once guests can be run and these operations are actually needed.

Introduce these structures here as they are required for the implementation
of domain_vaplic_init() and domain_vaplic_alloc(). Also, introduce
vaplic_init() and init vintc_ops->vcpu_init() with it.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v5:
 - Add explanational comments for fields in struct vintc.
 - Drop unnessary empty line in asm/aplic.h.
 - Update the commit message to tell that init_ops will be init-ed later
   in follow up patch.
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
 xen/arch/riscv/include/asm/aplic.h  |  2 +
 xen/arch/riscv/include/asm/intc.h   | 12 ++++++
 xen/arch/riscv/include/asm/vaplic.h | 34 ++++++++++++++++
 xen/arch/riscv/vaplic.c             | 63 +++++++++++++++++++++++++++++
 6 files changed, 115 insertions(+), 8 deletions(-)
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
index c9933147595e..45712d305975 100644
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
index b0724fe6f360..31264e2e683a 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -15,6 +15,8 @@
 
 #include <asm/imsic.h>
 
+/* domaincfg bits 31:24 are read-only 0x80 */
+#define APLIC_DOMAINCFG_RO      (0x80U << 24)
 #define APLIC_DOMAINCFG_IE      BIT(8, U)
 #define APLIC_DOMAINCFG_DM      BIT(2, U)
 
diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index a4e678fad90b..5330666e139e 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -17,6 +17,7 @@ enum intc_variant {
 struct cpu_user_regs;
 struct irq_desc;
 struct kernel_info;
+struct vcpu;
 
 struct intc_info {
     enum intc_variant hw_variant;
@@ -53,8 +54,19 @@ struct vintc_init_ops {
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
+    /* Used during domain build only; dropped afterwards. */
     const struct vintc_init_ops *init_ops;
+    /* Runtime callbacks used for the lifetime of the guest. */
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


