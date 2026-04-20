Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DKaAnM35mkmtgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F35F42D07D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 16:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286094.1567257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZK-0005qK-CP; Mon, 20 Apr 2026 14:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286094.1567257; Mon, 20 Apr 2026 14:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEpZK-0005kb-5A; Mon, 20 Apr 2026 14:25:46 +0000
Received: by outflank-mailman (input) for mailman id 1286094;
 Mon, 20 Apr 2026 14:25:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luca.fancellu@arm.com>) id 1wEpZI-0005fl-FR
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 14:25:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEpZH-00BFc6-Ru
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:25:43 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e63760-2eae-0a2a0a5409dd-0a2a450882fc-36
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:43 +0200
Received: from [217.140.110.172] (helo=foss.arm.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTP (eXpurgate 4.56.1)
 (envelope-from <luca.fancellu@arm.com>)
 id 69e63767-63b5-0a2a45080019-d98c6eacb956-1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 16:25:43 +0200
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05BCE1758;
 Mon, 20 Apr 2026 07:25:37 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F9473F7B4;
 Mon, 20 Apr 2026 07:25:41 -0700 (PDT)
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
	t=1776695142; bh=POwMy0a+mxqsay/MzYgDqyjsTTEYght2gW9VVJxJBz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iFLQu4L1MjrxmtfYHsLxLuv0UPDZvOLH4psmVR7VcRh6has4yzl+fjB3TwnUR1kUs
	 Wn8C0hKN1198xG8cQSM59wpSjmtbDzp1I1Zh2I1oxOXVjR4jSMTc+41zZRkclWcLuD
	 VrrXQVwZBJ1vM6AH9BCHpMyjFQEPmDHTLgkuk+Ko=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 7/8] arm/mpu: Save/restore guest EL1 MPU-related context
Date: Mon, 20 Apr 2026 15:25:23 +0100
Message-Id: <20260420142524.1804073-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260420142524.1804073-1-luca.fancellu@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1776695143-3AD73DB1-0CCEDBC0/0/0
X-purgate-type: clean
X-purgate-size: 18418
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,vstcr_el2.sa:url];
	FROM_NEQ_ENVFROM(0.00)[luca.fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.552];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 4F35F42D07D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement save/restore of guest MPU-related context, as all MPU memory
regions must be saved/restored on vCPU context switch when domain is
using PMSAv8-64 translation regime.

Introduce is_mpu_domain() helper function that is always false on MMU
and it checks if PMSA is selected at EL1 for MPU domains.

Split the save/restore functions into MPU arm64 and arm32, the latter
is currently not implemented, the former is fully implemented and
uses the PR{B,L}AR<n>_EL1 register access in order to issue the
minimum amount of ISB as possible while changing the selector and
writing/reading the registers.

struct arch_vcpu now includes a pointer to the allocated storage for
the additional MPU regions to be saved on context switch.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/arm64/mpu/p2m.c          |   2 +
 xen/arch/arm/domain.c                 |  49 +++++++---
 xen/arch/arm/include/asm/domain.h     |   5 +
 xen/arch/arm/include/asm/mm.h         |   3 +
 xen/arch/arm/include/asm/mmu/mm.h     |  12 +++
 xen/arch/arm/include/asm/mpu.h        |   3 +
 xen/arch/arm/include/asm/mpu/cpregs.h |   3 +
 xen/arch/arm/include/asm/mpu/mm.h     |  10 ++
 xen/arch/arm/mpu/arm32/mm.c           |  10 ++
 xen/arch/arm/mpu/arm64/mm.c           | 136 ++++++++++++++++++++++++++
 xen/arch/arm/mpu/mm.c                 |  39 ++++++++
 11 files changed, 260 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/arm64/mpu/p2m.c b/xen/arch/arm/arm64/mpu/p2m.c
index a39a1fc38946..a1ec9fcd6195 100644
--- a/xen/arch/arm/arm64/mpu/p2m.c
+++ b/xen/arch/arm/arm64/mpu/p2m.c
@@ -62,6 +62,8 @@ void __init setup_virt_paging(void)
 
     p2m_vmid_allocator_init();
 
+    load_nr_mpu_regions_el1();
+
     /*
      * VSTCR_EL2.SA defines secure stage 2 translation output address space.
      * To make sure that all stage 2 translations for the Secure PA space access
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index dfa7ace1141b..221b1f8a7f9d 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -123,11 +123,23 @@ static void ctxt_switch_from(struct vcpu *p)
 
     isb();
 
-    /* MMU */
+    /* MMU/MPU */
+    if ( is_mpu_domain(p->domain) )
+    {
+        /*
+         * Domain is using PMSAv8-64 translation regime at EL1, so we need to
+         * save EL1 MPU memory regions.
+         */
+        save_el1_mpu_regions(p);
+    }
+    else
+    {
+        /* Domain is using VMSAv8-64 translation regime via MMU. */
+        p->arch.ttbcr = READ_SYSREG(TCR_EL1);
+        p->arch.ttbr0 = READ_SYSREG64(TTBR0_EL1);
+        p->arch.ttbr1 = READ_SYSREG64(TTBR1_EL1);
+    }
     p->arch.vbar = READ_SYSREG(VBAR_EL1);
-    p->arch.ttbcr = READ_SYSREG(TCR_EL1);
-    p->arch.ttbr0 = READ_SYSREG64(TTBR0_EL1);
-    p->arch.ttbr1 = READ_SYSREG64(TTBR1_EL1);
     if ( is_32bit_domain(p->domain) )
         p->arch.dacr = READ_SYSREG(DACR32_EL2);
     p->arch.par = read_sysreg_par();
@@ -156,8 +168,6 @@ static void ctxt_switch_from(struct vcpu *p)
     p->arch.afsr0 = READ_SYSREG(AFSR0_EL1);
     p->arch.afsr1 = READ_SYSREG(AFSR1_EL1);
 
-    /* XXX MPU */
-
     /* VGIC */
     gic_save_state(p);
 
@@ -181,8 +191,6 @@ static void ctxt_switch_to(struct vcpu *n)
     /* VGIC */
     gic_restore_state(n);
 
-    /* XXX MPU */
-
     /* Fault Status */
 #if defined(CONFIG_ARM_32)
     WRITE_CP32(n->arch.dfar, DFAR);
@@ -198,11 +206,23 @@ static void ctxt_switch_to(struct vcpu *n)
     WRITE_SYSREG(n->arch.afsr0, AFSR0_EL1);
     WRITE_SYSREG(n->arch.afsr1, AFSR1_EL1);
 
-    /* MMU */
+    /* MMU/MPU */
+    if ( is_mpu_domain(n->domain) )
+    {
+        /*
+         * Domain is using PMSAv8-64 translation regime at EL1, so we need to
+         * restore EL1 MPU memory regions.
+         */
+        restore_el1_mpu_regions(n);
+    }
+    else
+    {
+        /* Domain is using VMSAv8-64 translation regime via MMU. */
+        WRITE_SYSREG(n->arch.ttbcr, TCR_EL1);
+        WRITE_SYSREG64(n->arch.ttbr0, TTBR0_EL1);
+        WRITE_SYSREG64(n->arch.ttbr1, TTBR1_EL1);
+    }
     WRITE_SYSREG(n->arch.vbar, VBAR_EL1);
-    WRITE_SYSREG(n->arch.ttbcr, TCR_EL1);
-    WRITE_SYSREG64(n->arch.ttbr0, TTBR0_EL1);
-    WRITE_SYSREG64(n->arch.ttbr1, TTBR1_EL1);
 
     /*
      * Erratum #852523 (Cortex-A57) or erratum #853709 (Cortex-A72):
@@ -518,6 +538,9 @@ int arch_vcpu_create(struct vcpu *v)
     if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
         v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
 
+    if ( is_mpu_domain(v->domain) )
+        allocate_el1_mpu_regions(v);
+
     return rc;
 
 fail:
@@ -532,6 +555,8 @@ void arch_vcpu_destroy(struct vcpu *v)
     vcpu_timer_destroy(v);
     vcpu_vgic_free(v);
     free_xenheap_pages(v->arch.stack, STACK_ORDER);
+    if ( is_mpu_domain(v->domain) )
+        free_el1_mpu_regions(v);
 }
 
 void vcpu_switch_to_aarch64_mode(struct vcpu *v)
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 4a3fb825962b..44c304ef8aa9 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -202,6 +202,11 @@ struct arch_vcpu
     register_t actlr;
     uint32_t cpacr;
 
+#ifdef CONFIG_MPU
+    /* EL1 MPU memory regions */
+    pr_t *mpu_regions;
+#endif
+
     uint32_t contextidr;
     register_t tpidr_el0;
     register_t tpidr_el1;
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 72a692862420..9e35800aba5e 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -202,6 +202,9 @@ extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
 void setup_mm_helper(void);
 /* map a physical range in virtual memory */
 void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
+/* Allocate space for EL1 MPU region info */
+void allocate_el1_mpu_regions(struct vcpu *v);
+void free_el1_mpu_regions(struct vcpu *v);
 
 static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
 {
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index 7f4d59137d0d..c441af50c3a9 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -9,6 +9,8 @@
 #include <asm/mmu/layout.h>
 #include <asm/page.h>
 
+struct domain;
+
 /* Non-boot CPUs use this to find the correct pagetables. */
 extern uint64_t init_ttbr;
 
@@ -91,6 +93,16 @@ static inline struct page_info *virt_to_page(const void *v)
     return frame_table + pdx - frametable_base_pdx;
 }
 
+/* If this domain should use PMSAv8-64 translation regime (MPU) at EL1. */
+static inline bool is_mpu_domain(struct domain *d)
+{
+    return false;
+}
+
+/* Stub for MPU EL1 region save/restore */
+static inline void save_el1_mpu_regions(struct vcpu *p) { }
+static inline void restore_el1_mpu_regions(struct vcpu *n) { }
+
 /*
  * Print a walk of a page table or p2m
  *
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 8a8c01086206..525944987713 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -27,6 +27,9 @@
 
 #ifndef __ASSEMBLER__
 
+/* Load the number of regions supported by the EL1 MPU from MPUIR_EL1. */
+void load_nr_mpu_regions_el1(void);
+
 /*
  * Utility function to determine if an Armv8-R processor supports VMSA.
  */
diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
index 5a3d92cf5389..f6fb3c93c032 100644
--- a/xen/arch/arm/include/asm/mpu/cpregs.h
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -5,6 +5,7 @@
 
 /* CP15 CR0: MPU Type Register */
 #define HMPUIR          p15,4,c0,c0,4
+#define MPUIR           p15,0,c0,c0,4
 
 /* CP15 CR2: Virtualization System Control register */
 #define VSCTLR          p15,4,c2,c0,1
@@ -16,6 +17,7 @@
 #define HPRSELR         p15,4,c6,c2,1
 #define HPRBAR          p15,4,c6,c3,0
 #define HPRLAR          p15,4,c6,c3,1
+#define PRSELR          p15,0,c6,c2,1
 
 /* CP15 CR6: MPU Protection Region Base/Limit Address Register */
 #define HPRBAR0         p15,4,c6,c8,0
@@ -86,6 +88,7 @@
 /* Aliases of AArch64 names for use in common code */
 #ifdef CONFIG_ARM_32
 /* Alphabetically... */
+#define MPUIR_EL1       MPUIR
 #define MPUIR_EL2       HMPUIR
 #define PRBAR_EL2       HPRBAR
 #define PRENR_EL2       HPRENR
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 24bffdee4fb6..a536ec4431df 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -20,6 +20,7 @@
 extern struct page_info *frame_table;
 
 extern uint8_t max_mpu_regions;
+extern uint8_t max_mpu_regions_el1;
 
 extern DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR);
 
@@ -55,6 +56,15 @@ static inline void context_sync_mpu(void)
     isb();
 }
 
+/* If this domain should use PMSAv8-64 translation regime (MPU) at EL1. */
+bool is_mpu_domain(struct domain *d);
+
+/* Save EL1 MPU base and limit registers. */
+void save_el1_mpu_regions(struct vcpu *p);
+
+/* Restore EL1 MPU base and limit registers. */
+void restore_el1_mpu_regions(struct vcpu *n);
+
 /*
  * The following API requires context_sync_mpu() after being used to modify MPU
  * regions:
diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
index 5eaeb3400e6c..3dd71228b4ed 100644
--- a/xen/arch/arm/mpu/arm32/mm.c
+++ b/xen/arch/arm/mpu/arm32/mm.c
@@ -159,6 +159,16 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
     }
 }
 
+void save_el1_mpu_regions(struct vcpu *p)
+{
+    BUG_ON("unimplemented");
+}
+
+void restore_el1_mpu_regions(struct vcpu *n)
+{
+    BUG_ON("unimplemented");
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/mpu/arm64/mm.c b/xen/arch/arm/mpu/arm64/mm.c
index b07e729a7d05..ce9947851173 100644
--- a/xen/arch/arm/mpu/arm64/mm.c
+++ b/xen/arch/arm/mpu/arm64/mm.c
@@ -1,8 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/bug.h>
+#include <xen/sched.h>
 #include <xen/types.h>
 #include <asm/mpu.h>
+#include <asm/mpu/mm.h>
 #include <asm/sysregs.h>
 #include <asm/system.h>
 
@@ -10,9 +12,13 @@
  * The following are needed for the cases: GENERATE_WRITE_PR_REG_CASE
  * and GENERATE_READ_PR_REG_CASE with num==0
  */
+#define PRBAR0_EL1 PRBAR_EL1
+#define PRLAR0_EL1 PRLAR_EL1
 #define PRBAR0_EL2 PRBAR_EL2
 #define PRLAR0_EL2 PRLAR_EL2
 
+#define PRBAR_EL1_(n)   PRBAR##n##_EL1
+#define PRLAR_EL1_(n)   PRLAR##n##_EL1
 #define PRBAR_EL2_(n)   PRBAR##n##_EL2
 #define PRLAR_EL2_(n)   PRLAR##n##_EL2
 
@@ -32,6 +38,22 @@
         break;                                                  \
     }
 
+#define GENERATE_SAVE_EL1_PR_REG_CASE(num, pr, sel)             \
+    case num:                                                   \
+    {                                                           \
+        pr->prbar.bits = READ_SYSREG(PRBAR_EL1_(num));          \
+        pr->prlar.bits = READ_SYSREG(PRLAR_EL1_(num));          \
+        sel--;                                                  \
+    }
+
+#define GENERATE_RESTORE_EL1_PR_REG_CASE(num, pr, sel)                      \
+    case num:                                                               \
+    {                                                                       \
+        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL1_(num));   \
+        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL1_(num));   \
+        sel--;                                                              \
+    }
+
 bool has_v8r_vmsa_support(void)
 {
     return system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_VMSA_SUPPORT;
@@ -125,6 +147,120 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel)
     }
 }
 
+void save_el1_mpu_regions(struct vcpu *p)
+{
+    int sel = max_mpu_regions_el1 - 1;
+    pr_t *table;
+
+    if ( max_mpu_regions_el1 == 0 )
+        return;
+
+    if ( p->arch.mpu_regions == NULL )
+        return;
+    table = p->arch.mpu_regions;
+
+    while ( sel >= 0 )
+    {
+        WRITE_SYSREG( (sel & 0xF0), PRSELR_EL1);
+        isb();
+        switch ( sel & 0xF ) {
+            GENERATE_SAVE_EL1_PR_REG_CASE(15, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(14, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(13, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(12, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(11, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(10, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(9, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(8, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(7, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(6, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(5, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(4, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(3, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(2, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(1, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_SAVE_EL1_PR_REG_CASE(0, (&table[sel]), sel);
+            break;
+            default:
+                BUG(); /* Can't happen */
+                break;
+        }
+    }
+}
+
+void restore_el1_mpu_regions(struct vcpu *n)
+{
+    int sel = max_mpu_regions_el1 - 1;
+    pr_t *table;
+
+    if ( max_mpu_regions_el1 == 0 )
+        return;
+
+    if ( !n->arch.mpu_regions )
+        return;
+    table = n->arch.mpu_regions;
+
+    while ( sel >= 0 )
+    {
+        WRITE_SYSREG( (sel & 0xF0), PRSELR_EL1);
+        isb();
+        switch ( sel & 0xF ) {
+            GENERATE_RESTORE_EL1_PR_REG_CASE(15, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(14, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(13, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(12, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(11, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(10, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(9, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(8, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(7, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(6, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(5, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(4, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(3, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(2, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(1, (&table[sel]), sel);
+            fallthrough;
+            GENERATE_RESTORE_EL1_PR_REG_CASE(0, (&table[sel]), sel);
+            break;
+            default:
+                BUG(); /* Can't happen */
+                break;
+        }
+    }
+
+    context_sync_mpu();
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 459fb952d125..d6703bf0c005 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -7,6 +7,7 @@
 #include <xen/mm.h>
 #include <xen/pfn.h>
 #include <xen/sizes.h>
+#include <xen/sched.h>
 #include <xen/spinlock.h>
 #include <xen/types.h>
 #include <asm/mpu.h>
@@ -14,6 +15,7 @@
 #include <asm/page.h>
 #include <asm/setup.h>
 #include <asm/sysregs.h>
+#include <public/arch-arm.h>
 
 #define MPU_ATTR_XN_RO_MISMATCH     -1
 #define MPU_ATTR_AI_MISMATCH        -2
@@ -23,6 +25,9 @@ struct page_info *frame_table;
 /* Maximum number of supported MPU memory regions by the EL2 MPU. */
 uint8_t __ro_after_init max_mpu_regions;
 
+/* Maximum number of supported MPU memory regions by the EL1 MPU. */
+uint8_t __read_mostly max_mpu_regions_el1;
+
 /*
  * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory regions.
  * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
@@ -631,6 +636,40 @@ void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
     return maddr_to_virt(start);
 }
 
+bool is_mpu_domain(struct domain *d)
+{
+    return (d->arch.v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE) ||
+           (d->arch.v8r_el1_msa == XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA);
+}
+
+void load_nr_mpu_regions_el1(void)
+{
+    max_mpu_regions_el1 = (uint8_t)(READ_SYSREG(MPUIR_EL1) &
+                                    NUM_MPU_REGIONS_MASK);
+}
+
+void allocate_el1_mpu_regions(struct vcpu *v)
+{
+    if ( max_mpu_regions_el1 == 0 )
+        return;
+
+    if ( v->arch.mpu_regions )
+        return;
+
+    v->arch.mpu_regions = (pr_t *)_xzalloc(sizeof(pr_t) * max_mpu_regions_el1,
+                                           SMP_CACHE_BYTES);
+    if ( !v->arch.mpu_regions )
+        panic("DOM%pd: mpu: no memory to store EL1 MPU memory region info\n",
+              v->domain);
+    memset(v->arch.mpu_regions, 0, sizeof(pr_t) * max_mpu_regions_el1);
+}
+
+void free_el1_mpu_regions(struct vcpu *v)
+{
+    if ( v->arch.mpu_regions )
+        xfree(v->arch.mpu_regions);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


