Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6M2mOSOuhWkRFAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:02:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82047FBC3E
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:02:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222984.1530651 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHjA-00077Y-3N; Fri, 06 Feb 2026 09:02:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222984.1530651; Fri, 06 Feb 2026 09:02:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHj9-00075E-Vd; Fri, 06 Feb 2026 09:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1222984;
 Fri, 06 Feb 2026 09:02:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaI+=AK=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1voHj8-0006qi-LM
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 09:02:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 84bf41e6-033a-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 10:02:09 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B81BF1516;
 Fri,  6 Feb 2026 01:02:02 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5B333F778;
 Fri,  6 Feb 2026 01:02:07 -0800 (PST)
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
X-Inumbo-ID: 84bf41e6-033a-11f1-b161-2bf370ae4941
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Hari Limaye <hari.limaye@arm.com>
Subject: [PATCH 1/3] arm/mpu: implement setup_virt_paging for MPU system
Date: Fri,  6 Feb 2026 09:01:53 +0000
Message-ID: <20260206090155.68466-2-harry.ramsey@arm.com>
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
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Luca.Fancellu@arm.com,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:penny.zheng@arm.com,m:wei.chen@arm.com,m:luca.fancellu@arm.com,m:hari.limaye@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harry.ramsey@arm.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RSPAMD_EMAILBL_FAIL(0.00)[penny.zheng.arm.com:query timed out,harry.ramsey.arm.com:query timed out];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email,vstcr_el2.sa:url];
	FROM_NEQ_ENVFROM(0.00)[harry.ramsey@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 82047FBC3E
X-Rspamd-Action: no action

From: Penny Zheng <Penny.Zheng@arm.com>

For MMU system, setup_virt_paging is used to configure stage 2 address
translation regime, like IPA bits, VMID allocator set up, etc.
Some could be inherited in MPU system, like VMID allocator set up, etc.

For MPU system, we could have the following memory translation regime:
- PMSAv8-64 at both EL1/EL0 and EL2 (default)
- VMSAv8-64 at EL1/EL0 and PMSAv8-64 at EL2 (enabled with device tree
  proprty v8r_el1_msa)

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
 xen/arch/arm/arm64/mpu/p2m.c             | 67 +++++++++++++++++++++++-
 xen/arch/arm/include/asm/arm64/sysregs.h |  4 ++
 xen/arch/arm/include/asm/cpufeature.h    | 13 +++--
 xen/arch/arm/include/asm/mpu/p2m.h       | 12 +++++
 xen/arch/arm/include/asm/p2m.h           |  5 ++
 xen/arch/arm/include/asm/processor.h     | 11 ++++
 6 files changed, 108 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
index b6d8b2777b..da8f0553c1 100644
--- a/xen/arch/arm/arm64/mpu/p2m.c
+++ b/xen/arch/arm/arm64/mpu/p2m.c
@@ -2,11 +2,76 @@
 
 #include <xen/bug.h>
 #include <xen/init.h>
+#include <xen/warning.h>
 #include <asm/p2m.h>
 
 void __init setup_virt_paging(void)
 {
-    BUG_ON("unimplemented");
+    uint64_t vtcr_el2 = READ_SYSREG(VTCR_EL2), vstcr_el2 = READ_SYSREG(VSTCR_EL2);
+
+    /* PA size */
+    const unsigned int pa_range_info[] = {32, 36, 40, 42, 44, 48, 52, 0,
+                                          /* Invalid */};
+
+    /*
+     * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
+     * with IPA bits == PA bits, compare against "pabits".
+     */
+    if ( pa_range_info[system_cpuinfo.mm64.pa_range] < p2m_ipa_bits )
+        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range];
+
+    /*
+     * Clear VTCR_EL2.NSA bit to configure non-secure stage 2 translation output
+     * address space to access the Secure PA space as Armv8r only implements
+     * secure state.
+     */
+    vtcr_el2 &= ~VTCR_NSA;
+
+    /*
+     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register identify the
+     * memory system configurations supported. In Armv8-R AArch64, the
+     * only permitted value for ID_AA64MMFR0_EL1.MSA is 0b1111.
+     */
+    if ( system_cpuinfo.mm64.msa != MM64_MSA_PMSA_SUPPORT )
+        goto fault;
+
+    /* Permitted values for ID_AA64MMFR0_EL1.MSA_frac are 0b0001 and 0b0010. */
+    if ( system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_NONE_SUPPORT )
+        goto fault;
+
+    /*
+     * cpuinfo sanitization makes sure we support 16bits VMID only if all cores
+     * are supporting it.
+     */
+    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
+        max_vmid = MAX_VMID_16_BIT;
+
+    /* Set the VS bit only if 16 bit VMID is supported. */
+    if ( max_vmid == MAX_VMID_16_BIT )
+        vtcr_el2 |= VTCR_VS;
+
+    p2m_vmid_allocator_init();
+
+    WRITE_SYSREG(vtcr_el2, VTCR_EL2);
+
+    /*
+     * VSTCR_EL2.SA defines secure stage 2 translation output address space.
+     * To make sure that all stage 2 translations for the Secure PA space access
+     * the Secure PA space, we keep SA bit as 0.
+     *
+     * VSTCR_EL2.SC is NS check enable bit. To make sure that Stage 2 NS
+     * configuration is checked against stage 1 NS configuration in EL1&0
+     * translation regime for the given address, and generates a fault if they
+     * are different, we set SC bit 1.
+     */
+    vstcr_el2 &= ~VSTCR_EL2_SA;
+    vstcr_el2 |= VSTCR_EL2_SC;
+    WRITE_SYSREG(vstcr_el2, VSTCR_EL2);
+
+    return;
+
+ fault:
+    panic("Hardware with no PMSAv8-64 support in any translation regime\n");
 }
 
 /*
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 19d409d3eb..a4b6eef181 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -462,6 +462,10 @@
 #define ZCR_ELx_LEN_SIZE             9
 #define ZCR_ELx_LEN_MASK             0x1ff
 
+/* Virtualization Secure Translation Control Register */
+#define VSTCR_EL2_SA                 (_AC(0x1,UL)<<30)
+#define VSTCR_EL2_SC                 (_AC(0x1,UL)<<20)
+
 #ifdef CONFIG_MPU
 /*
  * The Armv8-R AArch64 architecture always executes code in Secure
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 13353c8e1a..bf902a3970 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -248,6 +248,12 @@ struct cpuinfo_arm {
             unsigned long tgranule_16K:4;
             unsigned long tgranule_64K:4;
             unsigned long tgranule_4K:4;
+#ifdef CONFIG_MPU
+            unsigned long __res0:16;
+            unsigned long msa:4;
+            unsigned long msa_frac:4;
+            unsigned long __res1:8;
+#else
             unsigned long tgranule_16k_2:4;
             unsigned long tgranule_64k_2:4;
             unsigned long tgranule_4k_2:4;
@@ -255,6 +261,7 @@ struct cpuinfo_arm {
             unsigned long __res0:8;
             unsigned long fgt:4;
             unsigned long ecv:4;
+#endif
 
             /* MMFR1 */
             unsigned long hafdbs:4;
@@ -267,13 +274,13 @@ struct cpuinfo_arm {
             unsigned long xnx:4;
             unsigned long twed:4;
             unsigned long ets:4;
-            unsigned long __res1:4;
+            unsigned long __res2:4;
             unsigned long afp:4;
-            unsigned long __res2:12;
+            unsigned long __res3:12;
             unsigned long ecbhb:4;
 
             /* MMFR2 */
-            unsigned long __res3:64;
+            unsigned long __res4:64;
         };
     } mm64;
 
diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
index e46d9e757a..d165585d4e 100644
--- a/xen/arch/arm/include/asm/mpu/p2m.h
+++ b/xen/arch/arm/include/asm/mpu/p2m.h
@@ -5,6 +5,18 @@
 
 struct p2m_domain;
 
+/*
+ * The architecture allows at most 255 EL2 MPU memory regions. The size of the
+ * MPU structure entry (pr_t) is 32 Bytes on AArch64 (requiring two 4KB pages)
+ * and 16 bytes on AArch32 (requiring one 4KB page).
+ */
+#ifdef CONFIG_ARM_64
+#define P2M_ROOT_ORDER 1
+#else
+#define P2M_ROOT_ORDER 0
+#endif
+
+/* Not used on MPU system */
 static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
 
 static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 010ce8c9eb..ed1b6dd40f 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -48,8 +48,13 @@ struct p2m_domain {
     /* Current VMID in use */
     uint16_t vmid;
 
+#ifdef CONFIG_MMU
     /* Current Translation Table Base Register for the p2m */
     uint64_t vttbr;
+#else
+    /* Current Virtualization System Control Register for the p2m */
+    register_t vsctlr;
+#endif
 
     /* Highest guest frame that's ever been mapped in the p2m */
     gfn_t max_mapped_gfn;
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 1a48c9ff3b..7344aa094b 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -403,6 +403,10 @@
 
 #define VTCR_RES1       (_AC(1,UL)<<31)
 
+#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
+#define VTCR_NSA        (_AC(0x1,UL)<<30)
+#endif
+
 /* HCPTR Hyp. Coprocessor Trap Register */
 #define HCPTR_TAM       ((_AC(1,U)<<30))
 #define HCPTR_TTA       ((_AC(1,U)<<20))        /* Trap trace registers */
@@ -464,6 +468,13 @@
 #define MM64_VMID_16_BITS_SUPPORT   0x2
 #endif
 
+#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
+#define MM64_MSA_PMSA_SUPPORT       0xf
+#define MM64_MSA_FRAC_NONE_SUPPORT  0x0
+#define MM64_MSA_FRAC_PMSA_SUPPORT  0x1
+#define MM64_MSA_FRAC_VMSA_SUPPORT  0x2
+#endif
+
 #ifndef __ASSEMBLER__
 
 extern register_t __cpu_logical_map[];
-- 
2.43.0


