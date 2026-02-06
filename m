Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBJYCiauhWkRFAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:02:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DD1FBC5B
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:02:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222988.1530670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHjK-0007kt-NY; Fri, 06 Feb 2026 09:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222988.1530670; Fri, 06 Feb 2026 09:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHjK-0007hm-KU; Fri, 06 Feb 2026 09:02:22 +0000
Received: by outflank-mailman (input) for mailman id 1222988;
 Fri, 06 Feb 2026 09:02:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaI+=AK=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1voHjJ-0007ev-Dg
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 09:02:21 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 86559266-033a-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 10:02:12 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E9D8339;
 Fri,  6 Feb 2026 01:02:05 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC6DF3F778;
 Fri,  6 Feb 2026 01:02:10 -0800 (PST)
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
X-Inumbo-ID: 86559266-033a-11f1-9ccf-f158ae23cfc8
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree property for domains
Date: Fri,  6 Feb 2026 09:01:54 +0000
Message-ID: <20260206090155.68466-3-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260206090155.68466-1-harry.ramsey@arm.com>
References: <20260206090155.68466-1-harry.ramsey@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[harry.ramsey@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Luca.Fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[harry.ramsey@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 23DD1FBC5B
X-Rspamd-Action: no action

Add a new device tree property `v8r_el1_msa` to enable/disable the
PMSAv8-64 translation regime at EL1.

Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 11 +++++++++++
 xen/arch/arm/dom0less-build.c         | 25 +++++++++++++++++++++++++
 xen/arch/arm/domain.c                 | 16 ++++++++++++++++
 xen/arch/arm/include/asm/domain.h     |  9 +++++++++
 xen/include/public/arch-arm.h         |  4 ++++
 5 files changed, 65 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 977b428608..431d285b6e 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -322,6 +322,17 @@ with the following properties:
     Should be used together with scmi-smc-passthrough Xen command line
     option.
 
+- v8r_el1_msa
+
+    A string property specifying whether, on Armv8-R aarch64 systems, a domain
+    should use PMSAv8-64 (MPU) at EL1 or VMSAv8-64 (MMU) at EL1.
+
+    - "mmu"
+    Enables VMSAv8-64 at EL1.
+
+    - "mpu"
+    Enables PMSAv8-64 at EL1.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4181c10538..41f538fb50 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -315,6 +315,7 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
     struct xen_domctl_createdomain *d_cfg = &bd->create_cfg;
     unsigned int flags = bd->create_flags;
     uint32_t val;
+    const char *v8r_el1_msa;
 
     d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
     d_cfg->flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
@@ -322,6 +323,30 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
     if ( domu_dt_sci_parse(node, d_cfg) )
         panic("Error getting SCI configuration\n");
 
+    if (!dt_property_read_string(node, "v8r_el1_msa", &v8r_el1_msa))
+    {
+#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
+        if ( !strcmp(v8r_el1_msa, "mmu") )
+        {
+            if ( system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_VMSA_SUPPORT )
+                panic("Platform does not support VMSA at EL1 (v8r_el1_msa)\n");
+            d_cfg->arch.v8r_el1_msa = MPU_EL1_VMSA;
+        }
+        else if ( !strcmp(v8r_el1_msa, "mpu") )
+        {
+            d_cfg->arch.v8r_el1_msa = MPU_EL1_PMSA;
+            if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
+                panic("PMSA is not valid for domain without static allocation"
+                      " and direct map (v8r_el1_msa)\n");
+        }
+        else
+            panic("Invalid device tree option for v8r_el1_msa\n");
+#else
+        panic("'v8r_el1_msa' property requires CONFIG_MPU and CONFIG_ARM_64 to "
+              "be selected\n");
+#endif
+    }
+
     if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
     {
         int vpl011_virq = GUEST_VPL011_SPI;
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 2eca2b913d..fc4c7ae734 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -35,6 +35,18 @@
 
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
 
+/* If this domain should use PMSAv8-64 translation regime (MPU) at EL1. */
+static inline bool is_mpu_domain(struct domain *d)
+{
+#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
+    return d->arch.v8r_el1_msa == MPU_EL1_PMSA;
+#elif defined(CONFIG_MPU)
+    return true;
+#else
+    return false;
+#endif
+}
+
 static void do_idle(void)
 {
     unsigned int cpu = smp_processor_id();
@@ -731,6 +743,10 @@ int arch_domain_create(struct domain *d,
     if ( (rc = sci_domain_init(d, config)) != 0 )
         goto fail;
 
+#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
+    d->arch.v8r_el1_msa = config->arch.v8r_el1_msa;
+#endif
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 758ad807e4..1387adc0e9 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -29,6 +29,11 @@ enum domain_type {
 #define is_64bit_domain(d) (0)
 #endif
 
+#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
+#define MPU_EL1_PMSA 0
+#define MPU_EL1_VMSA 1
+#endif
+
 /*
  * Is the domain using the host memory layout?
  *
@@ -126,6 +131,10 @@ struct arch_domain
     void *sci_data;
 #endif
 
+#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
+    uint8_t v8r_el1_msa;
+#endif
+
 }  __cacheline_aligned;
 
 struct arch_vcpu
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index cd563cf706..0ef445a273 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -355,6 +355,10 @@ struct xen_arch_domainconfig {
     uint32_t clock_frequency;
     /* IN */
     uint8_t arm_sci_type;
+#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
+    /* IN */
+    uint8_t v8r_el1_msa;
+#endif
 };
 #endif /* __XEN__ || __XEN_TOOLS__ */
 
-- 
2.43.0


