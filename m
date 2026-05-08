Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ItHL2v0/WlxlAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:34:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD0B4F7C35
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:34:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303689.1576959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMHK-0001Bo-Fr; Fri, 08 May 2026 14:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303689.1576959; Fri, 08 May 2026 14:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMHK-00019u-Ch; Fri, 08 May 2026 14:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1303689;
 Fri, 08 May 2026 14:34:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wLMHI-0000yn-FV
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:34:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMHH-007WJL-SE
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:34:07 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69fdf446-2eae-0a2a0a5409dd-0a2a4509829e-42
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:34:07 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69fdf45e-2497-0a2a45090019-d98c6eaca344-1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:34:07 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DE3D1D34;
 Fri,  8 May 2026 07:34:01 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C97093F763;
 Fri,  8 May 2026 07:34:04 -0700 (PDT)
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
	t=1778250846; bh=uOx6o3Ma3CDEZYD8HLSisMuej2xnQvxCr5Ghf1MGQ4g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YfNVCBFMoqLbWa8T0NU2W5xPSWLGjnjVlwGeUxqZ8CEdh5pBw3Czhs9o15L1x92Kp
	 N5LvsV2jEKfW53O758lizcPXFPqV2GOhNIgAg+Mvt+Xdlk2op94Z5dFc/hkEVzquF3
	 +xGXytZaFPXOmyln83DBdYQkyTChbFbi+yRfEA/g=
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
Subject: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree property for domains
Date: Fri,  8 May 2026 15:33:52 +0100
Message-Id: <20260508143353.3512004-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508143353.3512004-1-luca.fancellu@arm.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778250847-8AF8CA53-284254DA/0/0
X-purgate-type: clean
X-purgate-size: 11918
X-Rspamd-Queue-Id: 6BD0B4F7C35
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:mid,arm.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Harry Ramsey <harry.ramsey@arm.com>

Add a new device tree property `v8r_el1_msa` to select the MSA (memory
system architecture) at EL1 for Armv8-R architecture: MPU or MMU, the
former is the default if the property is not passed.

Implement the dom0less path to parse the new device tree property, add
a new domctl hypercall input parameter `v8r_el1_msa` for arm and
add the sanitisation in arch_sanitise_domain_config(), the parameter
is intended to be used on CONFIG_MPU systems and returns an error if
selected for MMU.

Given the breaking change, bump the XEN_DOMCTL_INTERFACE_VERSION.

Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v5:
 - follow the way domu_dt_sci_parse and ARM_SCI is doing, but
   return error if property is present in MMU systems.
 - Align the commit message on the new changes
 - fix documentation
 - fix multiline comment
 - drop the explicit padding from struct xen_arch_domainconfig
v4:
- Rework the patch to have the v8r_el1_msa input parameter more
  enclosed in the Armv8-A (mmu)/Armv8-R (mpu) space.
v3:
- Improve commit message and device tree property description
- Remove macro protection
- Remove unused function is_mpu_domain
- Code formatting
---
 docs/misc/arm/device-tree/booting.txt   | 14 +++++
 xen/arch/arm/dom0less-build.c           | 74 +++++++++++++++++++++++++
 xen/arch/arm/domain.c                   | 11 ++++
 xen/arch/arm/include/asm/domain.h       |  4 ++
 xen/arch/arm/include/asm/domain_build.h | 21 +++++++
 xen/arch/arm/mpu/arm32/mm.c             | 17 ++++++
 xen/arch/arm/mpu/arm64/mm.c             | 18 ++++++
 xen/include/public/arch-arm.h           |  6 ++
 xen/include/public/domctl.h             |  4 +-
 9 files changed, 167 insertions(+), 2 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 977b4286082f..2389ae610963 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -322,6 +322,20 @@ with the following properties:
     Should be used together with scmi-smc-passthrough Xen command line
     option.
 
+- v8r_el1_msa
+
+    A string property specifying whether, on Armv8-R systems at EL1, a domain
+    should use PMSAv8 (MPU) or VMSAv8 (MMU).
+
+    - "mmu"
+    Enables VMSAv8 at EL1. This requires hardware support and is only
+    optionally available on AArch64. Not supported on AArch32.
+
+    - "mpu"
+    Enables PMSAv8 at EL1. This is the default behaviour when the property is
+    not passed. This configuration requires static allocation (xen,static-mem)
+    and direct mapping (direct-map).
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 6f73c65e5151..2a0671bd0e8e 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -295,6 +295,77 @@ static int __init domu_dt_sci_parse(struct dt_device_node *node,
     return 0;
 }
 
+static int __init
+domu_dt_v8r_el1_msa_parse(struct dt_device_node *node,
+                          struct xen_domctl_createdomain *d_cfg,
+                          unsigned int flags)
+{
+    bool property_present = dt_property_read_bool(node, "v8r_el1_msa");
+
+    if ( !property_present )
+        d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE;
+    else
+    {
+        const char *v8r_el1_msa;
+        int ret = dt_property_read_string(node, "v8r_el1_msa", &v8r_el1_msa);
+
+        if ( ret )
+            return ret;
+
+        if ( !strcmp(v8r_el1_msa, "mpu") )
+            d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA;
+        else if ( !strcmp(v8r_el1_msa, "mmu") )
+            d_cfg->arch.v8r_el1_msa = XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA;
+        else
+        {
+            printk(XENLOG_ERR
+                   "v8r_el1_msa value (%s) not valid for domain %s\n",
+                   v8r_el1_msa, dt_node_name(node));
+            return -EINVAL;
+        }
+    }
+
+    if ( !IS_ENABLED(CONFIG_MPU) )
+    {
+        if ( !property_present )
+            return 0;
+
+        printk(XENLOG_ERR
+               "Not supported 'v8r_el1_msa' DT property found for domain %s\n",
+               dt_node_name(node));
+        return -EINVAL;
+    }
+
+    switch ( d_cfg->arch.v8r_el1_msa )
+    {
+    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE:
+        fallthrough;
+    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA:
+        if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
+        {
+            printk(XENLOG_ERR
+                   "PMSA is not valid for domain (%s) without static allocation and direct map (v8r_el1_msa)\n",
+                   dt_node_name(node));
+            return -EINVAL;
+        }
+        break;
+
+    case XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA:
+        if ( !has_v8r_vmsa_support() )
+        {
+            printk(XENLOG_ERR
+                   "Platform doesn't support VMSA at EL1 (v8r_el1_msa)\n");
+            return -EINVAL;
+        }
+        break;
+
+    default:
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 int __init arch_parse_dom0less_node(struct dt_device_node *node,
                                     struct boot_domain *bd)
 {
@@ -308,6 +379,9 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
     if ( domu_dt_sci_parse(node, d_cfg) )
         panic("Error getting SCI configuration\n");
 
+    if ( domu_dt_v8r_el1_msa_parse(node, d_cfg, flags) )
+        panic("Error getting v8r_el1_msa configuration\n");
+
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
         int vpl011_virq = GUEST_VPL011_SPI;
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 26380a807cad..ac7d1abd9c7c 100644
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
@@ -630,6 +631,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
+    if ( !v8r_el1_msa_domain_sanitise_config(config) )
+    {
+        dprintk(XENLOG_INFO, "Unsupported v8r_el1_msa value\n");
+        return -EINVAL;
+    }
+
     return sci_domain_sanitise_config(config);
 }
 
@@ -722,6 +729,10 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl = config->arch.sve_vl;
 #endif
 
+#ifdef CONFIG_MPU
+    d->arch.v8r_el1_msa = config->arch.v8r_el1_msa;
+#endif
+
     if ( (rc = sci_domain_init(d, config)) != 0 )
         goto fail;
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index b24f02d269be..ac7300e41fcd 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -112,6 +112,10 @@ struct arch_domain
 #endif
 
     struct resume_info resume_ctx;
+
+#ifdef CONFIG_MPU
+    uint8_t v8r_el1_msa;
+#endif
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 6674dac5e2f8..50ddc0511e7e 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -19,6 +19,27 @@ int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
 
 int add_ext_regions(unsigned long s_gfn, unsigned long e_gfn, void *data);
 
+#ifdef CONFIG_MPU
+/* Utility function to determine if an Armv8-R processor supports VMSA. */
+bool has_v8r_vmsa_support(void);
+bool v8r_el1_msa_domain_sanitise_config(
+    const struct xen_domctl_createdomain *config);
+#else
+static inline bool has_v8r_vmsa_support(void)
+{
+    return false;
+}
+
+static inline bool v8r_el1_msa_domain_sanitise_config(
+    const struct xen_domctl_createdomain *config)
+{
+    if ( config->arch.v8r_el1_msa != XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE )
+        return false;
+
+    return true;
+}
+#endif /* CONFIG_MPU */
+
 #endif
 
 /*
diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
index a4673c351141..a759ebdfc124 100644
--- a/xen/arch/arm/mpu/arm32/mm.c
+++ b/xen/arch/arm/mpu/arm32/mm.c
@@ -5,6 +5,8 @@
 #include <asm/mpu.h>
 #include <asm/sysregs.h>
 #include <asm/system.h>
+#include <public/arch-arm.h>
+#include <public/domctl.h>
 
 #define GENERATE_WRITE_PR_REG_CASE(num, pr)               \
     case num:                                             \
@@ -38,6 +40,21 @@
         break;                                            \
     }
 
+bool has_v8r_vmsa_support(void)
+{
+    return false;
+}
+
+bool v8r_el1_msa_domain_sanitise_config(
+    const struct xen_domctl_createdomain *config)
+{
+    if ( config->arch.v8r_el1_msa != XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE &&
+         config->arch.v8r_el1_msa != XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA )
+        return false;
+
+    return true;
+}
+
 /*
  * Armv8-R supports direct access and indirect access to the MPU regions through
  * registers:
diff --git a/xen/arch/arm/mpu/arm64/mm.c b/xen/arch/arm/mpu/arm64/mm.c
index ed643cad4073..441d209601c1 100644
--- a/xen/arch/arm/mpu/arm64/mm.c
+++ b/xen/arch/arm/mpu/arm64/mm.c
@@ -5,6 +5,8 @@
 #include <asm/mpu.h>
 #include <asm/sysregs.h>
 #include <asm/system.h>
+#include <public/arch-arm.h>
+#include <public/domctl.h>
 
 /*
  * The following are needed for the cases: GENERATE_WRITE_PR_REG_CASE
@@ -32,6 +34,22 @@
         break;                                                  \
     }
 
+bool has_v8r_vmsa_support(void)
+{
+    return system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_VMSA_SUPPORT;
+}
+
+bool v8r_el1_msa_domain_sanitise_config(
+    const struct xen_domctl_createdomain *config)
+{
+    if ( config->arch.v8r_el1_msa != XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE &&
+         config->arch.v8r_el1_msa != XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA &&
+         config->arch.v8r_el1_msa != XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA )
+        return false;
+
+    return true;
+}
+
 /*
  * Armv8-R supports direct access and indirect access to the MPU regions through
  * registers:
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index cd563cf70684..6d222f15f6d5 100644
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
@@ -355,6 +359,8 @@ struct xen_arch_domainconfig {
     uint32_t clock_frequency;
     /* IN */
     uint8_t arm_sci_type;
+    /* IN */
+    uint8_t v8r_el1_msa;
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


