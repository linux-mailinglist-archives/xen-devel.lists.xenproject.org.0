Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJmJFIRe1mmNEggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 15:56:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA8B3BD3F9
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 15:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276213.1561766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wATNm-0001lI-2q; Wed, 08 Apr 2026 13:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276213.1561766; Wed, 08 Apr 2026 13:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wATNl-0001ik-VT; Wed, 08 Apr 2026 13:55:49 +0000
Received: by outflank-mailman (input) for mailman id 1276213;
 Wed, 08 Apr 2026 13:55:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wATNk-0001VL-Od
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 13:55:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wATNk-0081Hn-4Q
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 15:55:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69d65e64-2eae-0a2a0a5409dd-0a2a4505be88-0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 15:55:48 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.0)
 (envelope-from <luca.fancellu@arm.com>)
 id 69d65e63-3760-0a2a45050019-d98c6eacbd58-1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 15:55:47 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFD1F2D95;
 Wed,  8 Apr 2026 06:55:40 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAF2A3F641;
 Wed,  8 Apr 2026 06:55:44 -0700 (PDT)
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
	t=1775656546; bh=Jbkn6tr6DeeBrY5TgQXpfTzOB7k0l9K2i9UHo4esCJQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=janao23xhFbReleouDkYkbSn4pi/0x26slL4ykiuIE20zLLYWoXQ9WNlLe9Wl4VnT
	 QTPD+N6S0V2vPzkNsVUz4KIhrWX3d+mEXH8btNJcyTyXaUpbxRE/PZnYZgy9lMmB/b
	 dJhw9QR0DpXo+8LOzV82SpdNN+vT0NU49Oj04lQQ=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Hari Limaye <hari.limaye@arm.com>,
	Harry Ramsey <harry.ramsey@arm.com>
Subject: [PATCH v3 1/3] arm/mpu: implement setup_virt_paging for MPU system
Date: Wed,  8 Apr 2026 14:55:29 +0100
Message-Id: <20260408135531.1744388-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408135531.1744388-1-luca.fancellu@arm.com>
References: <20260408135531.1744388-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1775656547-3133496F-1045722C/0/0
X-purgate-type: clean
X-purgate-size: 7460
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:penny.zheng@arm.com,m:wei.chen@arm.com,m:hari.limaye@arm.com,m:harry.ramsey@arm.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,vstcr_el2.sc:url];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BDA8B3BD3F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Penny Zheng <Penny.Zheng@arm.com>

Implement setup_virt_paging for aarch64 MPU systems, taking tare of
stage 2 address translation regime, IPA bits, supported VMID length
configuration and vtcr_el2/vstcr_el2 register programming.

Implement also the Armv8-R specific changes to ID_AA64MMFR0_EL1,
related to the supported memory system architecture (PMSA/VMSA)
and check that when MPU is built, the underlying HW is compatible
with PMSA. By default MPU at EL2 and EL1 is required.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
v3:
- Refactor unused code to more relevant commits.
- Add P2M print information
- Formatting issues
- Update commit message
v2:
- Seperate commit into multiple commits
---
 xen/arch/arm/arm64/mpu/p2m.c             | 80 +++++++++++++++++++++++-
 xen/arch/arm/include/asm/arm64/sysregs.h |  4 ++
 xen/arch/arm/include/asm/cpufeature.h    | 13 +++-
 xen/arch/arm/include/asm/processor.h     |  8 +++
 4 files changed, 101 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
index b6d8b2777b58..fda512dc7c8f 100644
--- a/xen/arch/arm/arm64/mpu/p2m.c
+++ b/xen/arch/arm/arm64/mpu/p2m.c
@@ -2,11 +2,89 @@
 
 #include <xen/bug.h>
 #include <xen/init.h>
+#include <xen/lib.h>
 #include <asm/p2m.h>
 
 void __init setup_virt_paging(void)
 {
-    BUG_ON("unimplemented");
+    register_t vtcr_el2 = READ_SYSREG(VTCR_EL2);
+    register_t vstcr_el2 = READ_SYSREG(VSTCR_EL2);
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
+     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register identify the
+     * memory system configurations supported. In Armv8-R AArch64, the
+     * only permitted value for ID_AA64MMFR0_EL1.MSA is 0b1111.
+     */
+    if ( system_cpuinfo.mm64.msa != MM64_MSA_PMSA_SUPPORT )
+        goto fault;
+
+    /* Permitted values for ID_AA64MMFR0_EL1.MSA_frac are 0b0001 and 0b0010. */
+    if ( (system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_PMSA_SUPPORT) &&
+         (system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_VMSA_SUPPORT) )
+        goto fault;
+
+    /* Stage 1 EL1&0 translation regime uses PMSAv8 by default */
+    vtcr_el2 &= ~VTCR_MSA;
+
+    /*
+     * Clear VTCR_EL2.NSA bit to configure non-secure stage 2 translation output
+     * address space to access the Secure PA space as Armv8r only implements
+     * secure state.
+     */
+    vtcr_el2 &= ~VTCR_NSA;
+
+    /*
+     * cpuinfo sanitization makes sure we support 16bits VMID only if all cores
+     * are supporting it.
+     *
+     * Set the VS bit only if 16 bit VIMD is supported.
+     */
+    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
+    {
+        vtcr_el2 |= VTCR_VS;
+        max_vmid = MAX_VMID_16_BIT;
+    }
+    else
+        vtcr_el2 &= ~VTCR_VS;
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
+    printk("P2M: %d-bit IPA with %d-bit PA and %d-bit VMID\n",
+           p2m_ipa_bits,
+           pa_range_info[system_cpuinfo.mm64.pa_range],
+           ( MAX_VMID == MAX_VMID_16_BIT ) ? 16 : 8);
+
+    return;
+
+ fault:
+    panic("Hardware with no PMSAv8-64 support in any translation regime\n");
 }
 
 /*
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 19d409d3eb5a..f3c11d871e86 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -462,6 +462,10 @@
 #define ZCR_ELx_LEN_SIZE             9
 #define ZCR_ELx_LEN_MASK             0x1ff
 
+/* Virtualization Secure Translation Control Register */
+#define VSTCR_EL2_SA                 (_AC(0x1,U) << 30)
+#define VSTCR_EL2_SC                 (_AC(0x1,U) << 20)
+
 #ifdef CONFIG_MPU
 /*
  * The Armv8-R AArch64 architecture always executes code in Secure
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 13353c8e1ad1..bf902a397068 100644
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
 
diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 1a48c9ff3b39..895d7cd50244 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -403,6 +403,9 @@
 
 #define VTCR_RES1       (_AC(1,UL)<<31)
 
+#define VTCR_MSA        (_AC(0x1,UL)<<31)
+#define VTCR_NSA        (_AC(0x1,UL)<<30)
+
 /* HCPTR Hyp. Coprocessor Trap Register */
 #define HCPTR_TAM       ((_AC(1,U)<<30))
 #define HCPTR_TTA       ((_AC(1,U)<<20))        /* Trap trace registers */
@@ -464,6 +467,11 @@
 #define MM64_VMID_16_BITS_SUPPORT   0x2
 #endif
 
+#define MM64_MSA_PMSA_SUPPORT       0xf
+#define MM64_MSA_FRAC_NONE_SUPPORT  0x0
+#define MM64_MSA_FRAC_PMSA_SUPPORT  0x1
+#define MM64_MSA_FRAC_VMSA_SUPPORT  0x2
+
 #ifndef __ASSEMBLER__
 
 extern register_t __cpu_logical_map[];
-- 
2.34.1


