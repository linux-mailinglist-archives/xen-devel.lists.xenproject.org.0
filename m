Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0439A35D9FA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 10:25:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109589.209197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWEM3-0006QP-PK; Tue, 13 Apr 2021 08:25:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109589.209197; Tue, 13 Apr 2021 08:25:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWEM3-0006Q3-LX; Tue, 13 Apr 2021 08:25:03 +0000
Received: by outflank-mailman (input) for mailman id 109589;
 Tue, 13 Apr 2021 08:25:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RIKl=JK=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lWEM2-0006Py-HK
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 08:25:02 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 696707c9-5020-4923-9ba4-fa889a4c64ad;
 Tue, 13 Apr 2021 08:24:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28ADF106F;
 Tue, 13 Apr 2021 01:24:59 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.30.107])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA1893F73B;
 Tue, 13 Apr 2021 01:24:57 -0700 (PDT)
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
X-Inumbo-ID: 696707c9-5020-4923-9ba4-fa889a4c64ad
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	wei.chen@arm.com
Subject: [PATCH] Remove support for ThumbEE
Date: Tue, 13 Apr 2021 10:24:47 +0200
Message-Id: <20210413082447.30313-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ThumbEE(T32EE) was introduced in ARMv7 and removed in ARMv8.
In 2011 ARM deprecated any use of the ThumbEE instruction set.

This feature is untested and as per my understanding
there are no reported users for it.

Remove all the bits related to it.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/cpufeature.c        |  3 +++
 xen/arch/arm/domain.c            | 12 ------------
 xen/arch/arm/setup.c             |  3 +--
 xen/include/asm-arm/cpregs.h     |  6 ------
 xen/include/asm-arm/cpufeature.h |  1 -
 xen/include/asm-arm/domain.h     |  1 -
 6 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 1d88783809..82265a72f4 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -209,6 +209,9 @@ static int __init create_guest_cpuinfo(void)
     guest_cpuinfo.pfr32.ras = 0;
     guest_cpuinfo.pfr32.ras_frac = 0;
 
+    /* Hide ThumbEE support */
+    guest_cpuinfo.pfr32.thumbee = 0;
+
     return 0;
 }
 /*
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index bdd3d3e5b5..d12903407f 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -116,12 +116,6 @@ static void ctxt_switch_from(struct vcpu *p)
     p->arch.cntkctl = READ_SYSREG32(CNTKCTL_EL1);
     virt_timer_save(p);
 
-    if ( is_32bit_domain(p->domain) && cpu_has_thumbee )
-    {
-        p->arch.teecr = READ_SYSREG32(TEECR32_EL1);
-        p->arch.teehbr = READ_SYSREG32(TEEHBR32_EL1);
-    }
-
 #ifdef CONFIG_ARM_32
     p->arch.joscr = READ_CP32(JOSCR);
     p->arch.jmcr = READ_CP32(JMCR);
@@ -255,12 +249,6 @@ static void ctxt_switch_to(struct vcpu *n)
     WRITE_SYSREG(n->arch.tpidrro_el0, TPIDRRO_EL0);
     WRITE_SYSREG(n->arch.tpidr_el1, TPIDR_EL1);
 
-    if ( is_32bit_domain(n->domain) && cpu_has_thumbee )
-    {
-        WRITE_SYSREG32(n->arch.teecr, TEECR32_EL1);
-        WRITE_SYSREG32(n->arch.teehbr, TEEHBR32_EL1);
-    }
-
 #ifdef CONFIG_ARM_32
     WRITE_CP32(n->arch.joscr, JOSCR);
     WRITE_CP32(n->arch.jmcr, JMCR);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 9ba2f267f6..76841262e3 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -165,12 +165,11 @@ static void __init processor_id(void)
         printk("32-bit Execution:\n");
         printk("  Processor Features: %"PRIregister":%"PRIregister"\n",
                boot_cpu_data.pfr32.bits[0], boot_cpu_data.pfr32.bits[1]);
-        printk("    Instruction Sets:%s%s%s%s%s%s\n",
+        printk("    Instruction Sets:%s%s%s%s%s\n",
                cpu_has_aarch32 ? " AArch32" : "",
                cpu_has_arm ? " A32" : "",
                cpu_has_thumb ? " Thumb" : "",
                cpu_has_thumb2 ? " Thumb-2" : "",
-               cpu_has_thumbee ? " ThumbEE" : "",
                cpu_has_jazelle ? " Jazelle" : "");
         printk("    Extensions:%s%s\n",
                cpu_has_gentimer ? " GenericTimer" : "",
diff --git a/xen/include/asm-arm/cpregs.h b/xen/include/asm-arm/cpregs.h
index 6daf2b1a30..2966c21708 100644
--- a/xen/include/asm-arm/cpregs.h
+++ b/xen/include/asm-arm/cpregs.h
@@ -87,13 +87,9 @@
 #define DBGOSDLR        p14,0,c1,c3,4   /* OS Double Lock */
 #define DBGPRCR         p14,0,c1,c4,4   /* Debug Power Control Register */
 
-/* CP14 CR0: */
-#define TEECR           p14,6,c0,c0,0   /* ThumbEE Configuration Register */
-
 /* CP14 CR1: */
 #define DBGDRAR64       p14,0,c1        /* Debug ROM Address Register (64-bit access) */
 #define DBGDRAR         p14,0,c1,c0,0   /* Debug ROM Address Register (32-bit access) */
-#define TEEHBR          p14,6,c1,c0,0   /* ThumbEE Handler Base Register */
 #define JOSCR           p14,7,c1,c0,0   /* Jazelle OS Control Register */
 
 /* CP14 CR2: */
@@ -344,8 +340,6 @@
 #define SCTLR_EL1               SCTLR
 #define SCTLR_EL2               HSCTLR
 #define TCR_EL1                 TTBCR
-#define TEECR32_EL1             TEECR
-#define TEEHBR32_EL1            TEEHBR
 #define TPIDRRO_EL0             TPIDRURO
 #define TPIDR_EL0               TPIDRURW
 #define TPIDR_EL1               TPIDRPRW
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index ba48db3eac..f02ae8fde2 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -27,7 +27,6 @@
 #define cpu_has_thumb     (boot_cpu_feature32(thumb) >= 1)
 #define cpu_has_thumb2    (boot_cpu_feature32(thumb) >= 3)
 #define cpu_has_jazelle   (boot_cpu_feature32(jazelle) > 0)
-#define cpu_has_thumbee   (boot_cpu_feature32(thumbee) == 1)
 #define cpu_has_aarch32   (cpu_has_arm || cpu_has_thumb)
 
 #ifdef CONFIG_ARM_32
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 1da90f207d..d5080a6df6 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -167,7 +167,6 @@ struct arch_vcpu
     /* HYP configuration */
     register_t hcr_el2;
 
-    uint32_t teecr, teehbr; /* ThumbEE, 32-bit guests only */
 #ifdef CONFIG_ARM_32
     /*
      * ARMv8 only supports a trivial implementation on Jazelle when in AArch32
-- 
2.29.0


