Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MfIdCcfQS2oxawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:59:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AF9712EF8
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 17:59:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bOE7Vr3T;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355539.1610433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglig-0004Sr-P1; Mon, 06 Jul 2026 15:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355539.1610433; Mon, 06 Jul 2026 15:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglif-0004B7-LO; Mon, 06 Jul 2026 15:58:53 +0000
Received: by outflank-mailman (input) for mailman id 1355539;
 Mon, 06 Jul 2026 15:58:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wgliY-0002t5-LK
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 15:58:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgliY-00AcZM-0V
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 17:58:46 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd081-5cb7-0a2a0a5109dd-0a2a450a953e-44
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:45 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a4bd0b5-e40e-0a2a450a0019-d1558035e498-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 17:58:45 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493bc8fda98so35471125e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 08:58:45 -0700 (PDT)
Received: from fedora (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce03fa1sm284910325e9.11.2026.07.06.08.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 08:58:44 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1783353525; x=1783958325; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VOtrWkaPQqlfPd6Df6usWjHZMbCEmGeH2VRC7YlQb7M=;
        b=bOE7Vr3TTWY/vqIt2ENCpd/P1jLCX8jCOt5vwl0XaQjxkyWgXZHWS4DaphEeTY4IWr
         WH0/ZAjMECpmyySFadbEBonqdMNRv4a68smFV7d7U813W9mY6t9aOAJk2BEtrnzrijCO
         R3cSzrZZ1yMPBTMBlyhWinDnDnqYrEmNX4J0sRSK3CG076qfyqh66lQFHjIRaQVGAmBB
         Chzcz+eXWKBA39NFnD0MZd/yG/UbioeLRLdgDjS5rbmHq1rVBmCi8ueM5CJkS3ills5z
         IafVQxHCr9M2eDDyTXEs1/LsHToTM9StBZfkjGM6HD/8iIe+leX3DuWM8bKjF2PY14Hq
         uclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353525; x=1783958325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VOtrWkaPQqlfPd6Df6usWjHZMbCEmGeH2VRC7YlQb7M=;
        b=GlMxcgNHGtn8PP95VtsfzLRjjIjoCOZjZ5+Y9K+0A/tVjTTJMdnCaeoUmNLGhBqDq8
         7YQqWMOZ4fCBAGZGuAsAQBqX8ndNIvP2C4ItHtSlY4MiC80qQ09w3hVYInUY1nxRG1O7
         zlW+tMRfek51FmOTGT62Ti65gXYsg+0cyX9oNN5Rvgy+ZccQepsmdMe+CDcIEbNH5O4E
         Lsv+STwpAQPi7AD/wrMcDdaBQkOO/QJxJCt4+amCwMhjHMzFyVjNTfGiKHgm0pd8WVX6
         Bt/UM9J2ZCQnVVW7W7O8Gc7XfbfaAqQTn2ykOwzAw4as6+S3MEuXH8+Mq+LfUDSJf4aU
         8mUw==
X-Gm-Message-State: AOJu0YyIjiun6UzFg5jcNBhGOka2Q+0zUaRXjTitwKSN+xxyyhc8E38I
	cxBqWjUGNNlRoHEECLlo/G5vjRDoXtR+PZIXFnlN6kIkS3j43AKjJwSKJWfvOg==
X-Gm-Gg: AfdE7cnjo1kPvPNc/2IMcUwk1kBPmraP0nn+OtLkBEV/J0jPnCpF+eLnXDE1UcnyWkp
	dN4mSPp/Y0R0QgmsdfGLTmQp2RoLl/aozlvtzMJSjFAGbbjPlvRv6Y9wa4xEC+MHOY0JhQsgWIG
	GvdBEw18mvkf5CquVZqFGEJCWTEKc95bG/RVK8aqkN+DdvQA02cwMtb0g7pppeyiwmsCUxK7Dqv
	4x16gndsbQU3vNeYBhZDLvQa6ppyKoJUDEzVSJbyHtBFszde0AGylcrhDixcCDt7JHAm0rDkheD
	AUFzWP+1ETT589hPHx8zkKctDMcEKCxLqSa0jK/UjT/W+FS8ECRh91AkRJei3WPytZjGF6Tr844
	zh+c2tEzEFf5zJrWzw3depQK+8mTmmgsTsLxpUuwxD8L7Qv7WcuDIoqNA0yU8DbSpJxUbB7+Y/v
	vmtCjghzoUKxtdSfz3rnFn/t/44THUVITFzGwhp+BVg13Xz7H6CMkpNhl+eA==
X-Received: by 2002:a05:600c:3d8b:b0:493:bba7:e9f4 with SMTP id 5b1f17b1804b1-493df065f50mr14196265e9.18.1783353525265;
        Mon, 06 Jul 2026 08:58:45 -0700 (PDT)
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
Subject: [PATCH v5 20/26] xen/riscv: create APLIC DT node for guest domains
Date: Mon,  6 Jul 2026 17:58:01 +0200
Message-ID: <c05403d44a8c98eef2b7e399672158b40ff4a2fe.1783331040.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783331040.git.oleksii.kurochko@gmail.com>
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1783353525-3D470DDE-DB34833C/10/73395122804
X-purgate-type: spam
X-purgate-size: 8543
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
X-Rspamd-Queue-Id: C5AF9712EF8

Guests require a Device Tree description of the interrupt controller
topology. Add support for creating an APLIC node when building the
guest DT.

Provide stub for imsic_make_dt_node() it will be introduced properly
in follow-up patch.

The value chosen for GUEST_APLIC_S_BASE is based on QEMU one.

DT-building functions are marked __init because domain creation happens at
boot time, before the init sections are freed. In a typical deployment
libxl creates the interrupt controller node in userspace and hands the
complete FDT to Xen, so these functions are only called during early
domain construction.

Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v5:
 - Drop pointless initializer for local variable res in
   vaplic_make_domu_dt_node().
 - Limit guest_num_sources in the similar way to IMSIC.
 - Rename VAPLIC_NUM_SOURCES to GUEST_APLIC_MAX_SOURCES to be aligned with
   the similar place in vIMSIC related code.
---
Changes in v4:
 - Drop spurious <xen/fdt-kernel.h> and <xen/libfdt/libfdt.h> includes from
   aplic.c (mistakenly added, they belong to vaplic.c).
 - Reduce vaplic_name[] from 128 to 32 bytes in vaplic_make_domu_dt_node().
 - Use __initconstrel (with const) for init_ops instead of __initdata.
 - s/__ULL/_UL for defintion of GUEST_APLIC_S_BASE.
---
Changes in v3:
 - Fix rebase conflicts becuase of this patch is reordered after IMSIC DT
   node creation is intoduced.
 - Update the commit message.
 - Move initialization of domaincfg with APLIC_DOMAINCFG_RO80 from this
   patch to earlier.
 - Change paddr_t aplic_size to unsigned int in vaplic_make_domu_dt_node()
   and replace the UB (after it started to be uint) aplic_size >> 32 with
   an explicit 0 in the DT reg property.
 - Add BUILD_BUG_ON() to be sure that aplic size isn't bigger then
   UINT32_MAX.
---
Changes in v2:
 - Avoid as max as possible of host properties inheritance. Only number of
   APLIC's irqs are checked what leads to an introduction of
   get_aplic_irqs_num().
 - Move this patch earlier what leads to an introduction of
   vimsic_make_domu_dt_node() stub.
 - s/vimsic_make_domu_dt_node/imsic_make_domu_dt_node.
 - Refactor vimsic_make_domu_dt_node() to avoid re-usage of APLIC host
   properties.
 - Drop next_phandle as it is now in common code.
 - Drop const for kinfo argument of vimsic_make_domu_dt_node() is is
   going to be updated inside vimsic_make_domu_dt_node().
 - Use introduced before vintc->num_irqs.
---
---
 xen/arch/riscv/aplic-priv.h               | 14 +++++
 xen/arch/riscv/aplic.c                    |  2 +
 xen/arch/riscv/include/asm/aplic.h        |  8 +++
 xen/arch/riscv/include/asm/guest-layout.h |  6 ++
 xen/arch/riscv/vaplic.c                   | 77 +++++++++++++++++++++++
 5 files changed, 107 insertions(+)

diff --git a/xen/arch/riscv/aplic-priv.h b/xen/arch/riscv/aplic-priv.h
index 85e0d028d1ae..ac971f34add3 100644
--- a/xen/arch/riscv/aplic-priv.h
+++ b/xen/arch/riscv/aplic-priv.h
@@ -34,4 +34,18 @@ struct aplic_priv {
     const struct imsic_config *imsic_cfg;
 };
 
+/*
+ * Value is inspired by what QEMU is using for riscv,num-sources property for
+ * APLIC node.
+ */
+#define GUEST_APLIC_MAX_SOURCES 96
+
+/*
+ * Specifies the number of wired interrupt sources supported by guest APLIC
+ * domain.
+ * Could be limited by host interrupt controller and is identical for every
+ * domain.
+ */
+extern unsigned int guest_num_sources;
+
 #endif /* ASM_RISCV_APLIC_PRIV_H */
diff --git a/xen/arch/riscv/aplic.c b/xen/arch/riscv/aplic.c
index 126d56fb7ea8..5f8ae4d97b87 100644
--- a/xen/arch/riscv/aplic.c
+++ b/xen/arch/riscv/aplic.c
@@ -92,6 +92,8 @@ static int __init cf_check aplic_init(void)
         panic("%s: failed to get number of interrupt sources\n",
               node->full_name);
 
+    guest_num_sources = min(GUEST_APLIC_MAX_SOURCES + 0U, aplic_info.num_irqs);
+
     if ( aplic_info.num_irqs > ARRAY_SIZE(aplic.regs->sourcecfg) )
         aplic_info.num_irqs = ARRAY_SIZE(aplic.regs->sourcecfg);
 
diff --git a/xen/arch/riscv/include/asm/aplic.h b/xen/arch/riscv/include/asm/aplic.h
index 31264e2e683a..5a1ab85353e1 100644
--- a/xen/arch/riscv/include/asm/aplic.h
+++ b/xen/arch/riscv/include/asm/aplic.h
@@ -29,6 +29,14 @@
 
 #define APLIC_TARGET_HART_IDX_SHIFT 18
 
+#define APLIC_IDC_SIZE          32
+
+#define APLIC_MIN_SIZE          0x4000
+#define APLIC_SIZE_ALIGN(x)     ROUNDUP(x, APLIC_MIN_SIZE)
+
+#define APLIC_SIZE(nr_cpus)     (APLIC_MIN_SIZE + \
+                                 APLIC_SIZE_ALIGN(APLIC_IDC_SIZE * (nr_cpus)))
+
 struct aplic_regs {
     uint32_t domaincfg;         /* 0x0000 */
     uint32_t sourcecfg[1023];   /* 0x0004 */
diff --git a/xen/arch/riscv/include/asm/guest-layout.h b/xen/arch/riscv/include/asm/guest-layout.h
index 5e566450bdfa..90603f06bb91 100644
--- a/xen/arch/riscv/include/asm/guest-layout.h
+++ b/xen/arch/riscv/include/asm/guest-layout.h
@@ -3,6 +3,12 @@
 
 #include <public/xen.h>
 
+/*
+ * Base address of the guest's supervisor-mode APLIC. The value is the address
+ * typically used for APLIC by QEMU.
+ */
+#define GUEST_APLIC_S_BASE _UL(0xd000000)
+
 /*
  * Base address of the guest's supervisor-mode IMSIC. The value is the address
  * typically used for IMSIC by QEMU.
diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
index 6562b25f0abb..719c439e48d9 100644
--- a/xen/arch/riscv/vaplic.c
+++ b/xen/arch/riscv/vaplic.c
@@ -9,6 +9,8 @@
  */
 
 #include <xen/errno.h>
+#include <xen/fdt-kernel.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/sched.h>
 #include <xen/xvmalloc.h>
 
@@ -19,6 +21,12 @@
 
 #include "aplic-priv.h"
 
+unsigned int __ro_after_init guest_num_sources;
+
+#define VAPLIC_COMPATIBLE "riscv,aplic"
+
+#define FDT_VAPLIC_INT_CELLS 2
+
 static int cf_check vaplic_init(struct vcpu *v)
 {
     return vcpu_imsic_init(v);
@@ -29,6 +37,74 @@ static void cf_check vaplic_deinit(struct vcpu *v)
     return vcpu_imsic_deinit(v);
 }
 
+static int __init cf_check vaplic_make_domu_dt_node(struct kernel_info *kinfo)
+{
+    struct domain *d = kinfo->bd.d;
+    int res;
+    void *fdt = kinfo->fdt;
+    unsigned int msi_parent_phandle;
+    char vaplic_name[32];
+    unsigned int aplic_size = APLIC_SIZE(d->max_vcpus);
+    const __be32 reg[] = {
+        cpu_to_be32(GUEST_APLIC_S_BASE >> 32),
+        cpu_to_be32(GUEST_APLIC_S_BASE),
+        cpu_to_be32(0),
+        cpu_to_be32(aplic_size),
+    };
+
+    BUILD_BUG_ON(APLIC_SIZE(MAX_VIRT_CPUS) > UINT_MAX);
+
+    res = snprintf(vaplic_name, sizeof(vaplic_name), "/soc/aplic@%lx",
+                   GUEST_APLIC_S_BASE);
+    if ( res >= sizeof(vaplic_name) )
+    {
+        dprintk(XENLOG_DEBUG, "vaplic name is truncated\n");
+        return -ENOBUFS;
+    }
+
+    res = vimsic_make_domu_dt_node(kinfo, &msi_parent_phandle);
+    if ( res )
+        return res;
+
+    res = fdt_begin_node(fdt, vaplic_name);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#interrupt-cells", FDT_VAPLIC_INT_CELLS);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "reg", reg, sizeof(reg));
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "riscv,num-sources", guest_num_sources);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", VAPLIC_COMPATIBLE);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "msi-parent", msi_parent_phandle);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "phandle", kinfo->phandle_intc);
+    if ( res )
+        return res;
+
+    return fdt_end_node(fdt);
+}
+
+static const struct vintc_init_ops __initconstrel init_ops = {
+    .make_domu_dt_node = vaplic_make_domu_dt_node,
+};
+
 static const struct vintc_ops vintc_ops = {
     .vcpu_init = vaplic_init,
     .vcpu_deinit = vaplic_deinit,
@@ -43,6 +119,7 @@ int domain_vaplic_init(struct domain *d)
 
     d->arch.vintc = &vaplic->vintc;
     d->arch.vintc->ops = &vintc_ops;
+    d->arch.vintc->init_ops = &init_ops;
 
     vaplic->regs.domaincfg = APLIC_DOMAINCFG_IE | APLIC_DOMAINCFG_DM |
                              APLIC_DOMAINCFG_RO;
-- 
2.54.0


