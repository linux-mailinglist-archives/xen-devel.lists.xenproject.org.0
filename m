Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJvgCt825mkmtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:23:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E8942CF9C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:23:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286048.1567180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpWX-0002aj-9j; Mon, 20 Apr 2026 14:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286048.1567180; Mon, 20 Apr 2026 14:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpWX-0002XT-5K; Mon, 20 Apr 2026 14:22:53 +0000
Received: by outflank-mailman (input) for mailman id 1286048;
 Mon, 20 Apr 2026 14:22:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wEpWW-0002Oa-9c
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:22:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpWV-000Q5n-Mh
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:22:51 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e636b5-e002-0a2a0a5209dd-0a2a450bd802-14
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:22:51 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e636ba-212f-0a2a450b0019-d98c6eacb892-1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:22:51 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B8A516F3;
 Mon, 20 Apr 2026 07:22:44 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B51A73F7B4;
 Mon, 20 Apr 2026 07:22:48 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=foss header.d=arm.com header.i="@arm.com" header.h="From:To:Cc:Subject:Date:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776694970; bh=+vsui9ontMRbImpr24T712HFqgwztKghYeAs6axxQu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m38uLElW2SN88vFJmSSpwqVV8dKLr9Lbp4AxlgCsc1zUQDEzF+Umb/3wGlILHWY/I
	 M09xu8MndOKOFF44+ps7FUj+5dISiq8ySeIgEdEqeghFnWq0JjNtUUnlyDnCZxzKo2
	 G7i66FNS51Vz5RLkuDkyLKNckEVha/8ScqSngKfE=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Harry Ramsey <harry.ramsey@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree property for domains
Date: Mon, 20 Apr 2026 15:22:23 +0100
Message-Id: <20260420142224.1802911-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420142224.1802911-1-luca.fancellu@arm.com>
References: <20260420142224.1802911-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1776694971-0636CF3B-4468D4B2/0/0
X-purgate-type: clean
X-purgate-size: 13636
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:harry.ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C7E8942CF9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Harry Ramsey <harry.ramsey@arm.com>

Add a new device tree property `v8r_el1_msa` to select the MSA (memory
system architecture) at EL1 for Armv8-R architecture: MPU or MMU, the
former is the default if the property is not passed.

The check and setting of this new input parameter for the guest
configuration is performed in arch_domain_create() instead of the more
usual arch_sanitise_domain_config() because the former has access to the
Xen internal guest creation flags which are required to ensure PMSA can
work (domain requires static allocation and direct mapping).

The property is valid only when used on MPU systems and will result in
a panic on MMU ones.

Bumped XEN_DOMCTL_INTERFACE_VERSION because of the new domctl input
parameter.

Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v4:
- Rework the patch to have the v8r_el1_msa input parameter more
  enclosed in the Armv8-A (mmu)/Armv8-R (mpu) space.
v3:
- Improve commit message and device tree property description
- Remove macro protection
- Remove unused function is_mpu_domain
- Code formatting
---
 docs/misc/arm/device-tree/booting.txt       | 14 ++++
 xen/arch/arm/dom0less-build.c               |  3 +
 xen/arch/arm/domain.c                       |  4 ++
 xen/arch/arm/include/asm/domain.h           |  4 ++
 xen/arch/arm/include/asm/domain_build.h     |  8 +++
 xen/arch/arm/include/asm/mmu/domain-build.h | 46 +++++++++++++
 xen/arch/arm/include/asm/mpu.h              |  5 ++
 xen/arch/arm/include/asm/mpu/domain-build.h | 27 ++++++++
 xen/arch/arm/mpu/Makefile                   |  1 +
 xen/arch/arm/mpu/arm32/mm.c                 |  5 ++
 xen/arch/arm/mpu/arm64/mm.c                 |  5 ++
 xen/arch/arm/mpu/domain-build.c             | 76 +++++++++++++++++++++
 xen/include/public/arch-arm.h               |  7 ++
 xen/include/public/domctl.h                 |  4 +-
 14 files changed, 207 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mmu/domain-build.h
 create mode 100644 xen/arch/arm/include/asm/mpu/domain-build.h
 create mode 100644 xen/arch/arm/mpu/domain-build.c

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 977b4286082f..c3f484a3b01a 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -322,6 +322,20 @@ with the following properties:
     Should be used together with scmi-smc-passthrough Xen command line
     option.
 
+- v8r_el1_msa
+
+    A string property specifying whether, on Armv8-R systems, a domain
+    should use PMSAv8 (MPU) at EL1 or VMSAv8 (MMU) at EL1.
+
+    - "mmu"
+    Enables VMSAv8 at EL1. This requires hardware support and is only
+    optionally available on AArch64.
+
+    - "mpu"
+    Enables PMSAv8 at EL1. This is the default behaviour when the property is
+    not passed. This configuration requires static allocation (xen,static-mem)
+    and direct mapping (direct-map).
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4181c105389a..6f0256f9d825 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -24,6 +24,7 @@
 #include <asm/domain_build.h>
 #include <asm/firmware/sci.h>
 #include <asm/grant_table.h>
+#include <asm/mpu.h>
 #include <asm/setup.h>
 
 #ifdef CONFIG_VGICV2
@@ -322,6 +323,8 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
     if ( domu_dt_sci_parse(node, d_cfg) )
         panic("Error getting SCI configuration\n");
 
+    arch_dt_v8r_el1_msa_parse(node, d_cfg);
+
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
         int vpl011_virq = GUEST_VPL011_SPI;
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 26380a807cad..dfa7ace1141b 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -18,6 +18,7 @@
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
 #include <asm/current.h>
+#include <asm/domain_build.h>
 #include <asm/event.h>
 #include <asm/gic.h>
 #include <asm/guest_atomics.h>
@@ -725,6 +726,9 @@ int arch_domain_create(struct domain *d,
     if ( (rc = sci_domain_init(d, config)) != 0 )
         goto fail;
 
+    if ( (rc = arch_set_v8r_el1_msa(d, config, flags)) != 0 )
+        goto fail;
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index ffe5d0d9f0a6..4a3fb825962b 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -128,6 +128,10 @@ struct arch_domain
 #endif
 
     struct resume_info resume_ctx;
+
+#ifdef CONFIG_MPU
+    uint8_t v8r_el1_msa;
+#endif
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 6674dac5e2f8..921d6f98f4f4 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -4,6 +4,14 @@
 #include <xen/fdt-kernel.h>
 #include <xen/sched.h>
 
+#if defined(CONFIG_MMU)
+#include <asm/mmu/domain-build.h>
+#elif defined(CONFIG_MPU)
+#include <asm/mpu/domain-build.h>
+#else
+# error "Unknown memory management layout"
+#endif
+
 typedef __be32 gic_interrupt_t[3];
 int make_psci_node(void *fdt);
 void evtchn_allocate(struct domain *d);
diff --git a/xen/arch/arm/include/asm/mmu/domain-build.h b/xen/arch/arm/include/asm/mmu/domain-build.h
new file mode 100644
index 000000000000..3e0d9a6a2a08
--- /dev/null
+++ b/xen/arch/arm/include/asm/mmu/domain-build.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_MMU_DOMAIN_BUILD_H__
+#define __ARM_MMU_DOMAIN_BUILD_H__
+
+#include <xen/device_tree.h>
+#include <xen/errno.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+#include <public/domctl.h>
+
+static inline
+void arch_dt_v8r_el1_msa_parse(struct dt_device_node *node,
+                               struct xen_domctl_createdomain *d_cfg)
+{
+    const char *v8r_el1_msa;
+
+    if ( !dt_property_read_string(node, "v8r_el1_msa", &v8r_el1_msa) )
+        panic("'v8r_el1_msa' property found, but CONFIG_MPU not selected\n");
+}
+
+static inline
+int arch_set_v8r_el1_msa(struct domain *d,
+                         const struct xen_domctl_createdomain *config,
+                         unsigned int flags)
+{
+    if ( config->arch.v8r_el1_msa )
+    {
+        dprintk(XENLOG_INFO,
+                "arch.v8r_el1_msa set, but CONFIG_MPU not selected\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+#endif /* __ARM_MMU_DOMAIN_BUILD_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 72fa5b00b861..8a8c01086206 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -27,6 +27,11 @@
 
 #ifndef __ASSEMBLER__
 
+/*
+ * Utility function to determine if an Armv8-R processor supports VMSA.
+ */
+bool has_v8r_vmsa_support(void);
+
 /*
  * Set base address of MPU protection region.
  *
diff --git a/xen/arch/arm/include/asm/mpu/domain-build.h b/xen/arch/arm/include/asm/mpu/domain-build.h
new file mode 100644
index 000000000000..463cd85b5b7e
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/domain-build.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_MPU_DOMAIN_BUILD_H__
+#define __ARM_MPU_DOMAIN_BUILD_H__
+
+#include <xen/device_tree.h>
+#include <xen/sched.h>
+#include <xen/types.h>
+#include <public/domctl.h>
+
+void arch_dt_v8r_el1_msa_parse(struct dt_device_node *node,
+                               struct xen_domctl_createdomain *d_cfg);
+
+int arch_set_v8r_el1_msa(struct domain *d,
+                         const struct xen_domctl_createdomain *config,
+                         unsigned int flags);
+
+#endif /* __ARM_MPU_DOMAIN_BUILD_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index 3327fadd5d0e..e3997e41b81b 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
+obj-y += domain-build.o
 obj-y += domain-page.o
 obj-y += mm.o
 obj-y += p2m.o
diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
index a4673c351141..5eaeb3400e6c 100644
--- a/xen/arch/arm/mpu/arm32/mm.c
+++ b/xen/arch/arm/mpu/arm32/mm.c
@@ -38,6 +38,11 @@
         break;                                            \
     }
 
+bool has_v8r_vmsa_support(void)
+{
+    return false;
+}
+
 /*
  * Armv8-R supports direct access and indirect access to the MPU regions through
  * registers:
diff --git a/xen/arch/arm/mpu/arm64/mm.c b/xen/arch/arm/mpu/arm64/mm.c
index ed643cad4073..b07e729a7d05 100644
--- a/xen/arch/arm/mpu/arm64/mm.c
+++ b/xen/arch/arm/mpu/arm64/mm.c
@@ -32,6 +32,11 @@
         break;                                                  \
     }
 
+bool has_v8r_vmsa_support(void)
+{
+    return system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_VMSA_SUPPORT;
+}
+
 /*
  * Armv8-R supports direct access and indirect access to the MPU regions through
  * registers:
diff --git a/xen/arch/arm/mpu/domain-build.c b/xen/arch/arm/mpu/domain-build.c
new file mode 100644
index 000000000000..1bdd0ffedebb
--- /dev/null
+++ b/xen/arch/arm/mpu/domain-build.c
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/device_tree.h>
+#include <xen/domain.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/types.h>
+#include <xen/sched.h>
+#include <asm/mpu.h>
+#include <asm/mpu/domain-build.h>
+#include <public/arch-arm.h>
+#include <public/domctl.h>
+
+void __init arch_dt_v8r_el1_msa_parse(struct dt_device_node *node,
+                                      struct xen_domctl_createdomain *d_cfg)
+{
+    const char *v8r_el1_msa;
+
+    d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE;
+
+    if ( !dt_property_read_string(node, "v8r_el1_msa", &v8r_el1_msa) )
+    {
+        if ( !strcmp(v8r_el1_msa, "mmu") )
+            d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA;
+        else if ( !strcmp(v8r_el1_msa, "mpu") )
+            d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA;
+        else
+            panic("Invalid device tree option for v8r_el1_msa\n");
+    }
+}
+
+int arch_set_v8r_el1_msa(struct domain *d,
+                         const struct xen_domctl_createdomain *config,
+                         unsigned int flags)
+{
+    switch ( config->arch.v8r_el1_msa )
+    {
+    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE:
+        fallthrough;
+    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA:
+        if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
+        {
+            dprintk(XENLOG_INFO,
+                    "PMSA is not valid for domain without static allocation and direct map (v8r_el1_msa)\n");
+            return -EINVAL;
+        }
+        break;
+
+    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA:
+        if ( !has_v8r_vmsa_support() )
+        {
+            dprintk(XENLOG_INFO,
+                    "Platform does not support VMSA at EL1 (v8r_el1_msa)\n");
+            return -EINVAL;
+        }
+        break;
+
+    default:
+        dprintk(XENLOG_INFO, "Unsupported arch.v8r_el1_msa value (%u)\n",
+                config->arch.v8r_el1_msa);
+        return -EINVAL;
+    }
+
+    d->arch.v8r_el1_msa = config->arch.v8r_el1_msa;
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index cd563cf70684..7d6f87e8b2b1 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -330,6 +330,10 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
 #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
 #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
 
+#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE    0
+#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA    1
+#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
+
 struct xen_arch_domainconfig {
     /* IN/OUT */
     uint8_t gic_version;
@@ -355,6 +359,9 @@ struct xen_arch_domainconfig {
     uint32_t clock_frequency;
     /* IN */
     uint8_t arm_sci_type;
+    /* IN */
+    uint8_t v8r_el1_msa;
+    uint16_t pad;
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 8f6708c0a7cd..23124547f347 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -30,9 +30,9 @@
  * fields) don't require a change of the version.
  * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
  *
- * Last version bump: Xen 4.19
+ * Last version bump: Xen 4.22
  */
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
-- 
2.34.1


