Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D983735C0
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 09:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122822.231712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCBu-00054W-9D; Wed, 05 May 2021 07:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122822.231712; Wed, 05 May 2021 07:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCBu-00051z-4U; Wed, 05 May 2021 07:43:30 +0000
Received: by outflank-mailman (input) for mailman id 122822;
 Wed, 05 May 2021 07:43:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0XF=KA=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1leCBs-00050P-Rv
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 07:43:28 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 26bd840a-f6da-4ce2-8f2b-87ef214a59a5;
 Wed, 05 May 2021 07:43:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA06A11FB;
 Wed,  5 May 2021 00:43:27 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.0.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 728C93F718;
 Wed,  5 May 2021 00:43:26 -0700 (PDT)
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
X-Inumbo-ID: 26bd840a-f6da-4ce2-8f2b-87ef214a59a5
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 06/10] arm/p2m: Get rid of READ/WRITE_SYSREG32
Date: Wed,  5 May 2021 09:43:04 +0200
Message-Id: <20210505074308.11016-7-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210505074308.11016-1-michal.orzel@arm.com>
References: <20210505074308.11016-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AArch64 registers are 64bit whereas AArch32 registers
are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
we should get rid of helpers READ/WRITE_SYSREG32
in favour of using READ/WRITE_SYSREG.
We should also use register_t type when reading sysregs
which can correspond to uint64_t or uint32_t.
Even though many AArch64 registers have upper 32bit reserved
it does not mean that they can't be widen in the future.

Modify type of vtcr to register_t.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/p2m.c   | 8 ++++----
 xen/arch/arm/traps.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index ac50312620..d414c4feb9 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1973,11 +1973,11 @@ void __init p2m_restrict_ipa_bits(unsigned int ipa_bits)
 }
 
 /* VTCR value to be configured by all CPUs. Set only once by the boot CPU */
-static uint32_t __read_mostly vtcr;
+static register_t __read_mostly vtcr;
 
 static void setup_virt_paging_one(void *data)
 {
-    WRITE_SYSREG32(vtcr, VTCR_EL2);
+    WRITE_SYSREG(vtcr, VTCR_EL2);
 
     /*
      * ARM64_WORKAROUND_AT_SPECULATE: We want to keep the TLBs free from
@@ -2000,7 +2000,7 @@ static void setup_virt_paging_one(void *data)
 void __init setup_virt_paging(void)
 {
     /* Setup Stage 2 address translation */
-    unsigned long val = VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
+    register_t val = VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
 
 #ifdef CONFIG_ARM_32
     if ( p2m_ipa_bits < 40 )
@@ -2089,7 +2089,7 @@ void __init setup_virt_paging(void)
            pa_range_info[pa_range].pabits,
            ( MAX_VMID == MAX_VMID_16_BIT ) ? 16 : 8);
 #endif
-    printk("P2M: %d levels with order-%d root, VTCR 0x%lx\n",
+    printk("P2M: %d levels with order-%d root, VTCR 0x%"PRIregister"\n",
            4 - P2M_ROOT_LEVEL, P2M_ROOT_ORDER, val);
 
     p2m_vmid_allocator_init();
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index ccc0827107..c7acdb2087 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -911,7 +911,7 @@ static void _show_registers(const struct cpu_user_regs *regs,
         show_registers_32(regs, ctxt, guest_mode, v);
 #endif
     }
-    printk("  VTCR_EL2: %08"PRIx32"\n", READ_SYSREG32(VTCR_EL2));
+    printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
     printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
     printk("\n");
 
-- 
2.29.0


