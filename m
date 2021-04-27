Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007D036C1CF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 11:36:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118161.224218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbK8u-0007DI-77; Tue, 27 Apr 2021 09:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118161.224218; Tue, 27 Apr 2021 09:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbK8u-0007CF-3m; Tue, 27 Apr 2021 09:36:32 +0000
Received: by outflank-mailman (input) for mailman id 118161;
 Tue, 27 Apr 2021 09:36:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3fO=JY=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lbK8s-0006jJ-BB
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 09:36:30 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id eb4f75da-ec1a-4229-9c12-0fb90e007502;
 Tue, 27 Apr 2021 09:36:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F4EF101E;
 Tue, 27 Apr 2021 02:36:18 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.27.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FDCB3F694;
 Tue, 27 Apr 2021 02:36:08 -0700 (PDT)
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
X-Inumbo-ID: eb4f75da-ec1a-4229-9c12-0fb90e007502
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH v2 07/10] arm/mm: Get rid of READ/WRITE_SYSREG32
Date: Tue, 27 Apr 2021 11:35:43 +0200
Message-Id: <20210427093546.30703-8-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210427093546.30703-1-michal.orzel@arm.com>
References: <20210427093546.30703-1-michal.orzel@arm.com>
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

Modify SCTLR_EL2 accesses to use READ/WRITE_SYSREG.

SCTLR_EL2 already has bits defined in the range [32:63].
The ARM ARM defines them as unknown if implemented.
By writing in head.S SCTLR_EL2_SET we are zeroing the upper
32bit half which is correct but referring to this sysreg
as 32bit is a latent bug because the top 32bit was not used
by Xen.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
Changes since v1:
-Update commit message with SCTLR_EL2 analysis
---
 xen/arch/arm/mm.c    | 2 +-
 xen/arch/arm/traps.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 59f8a3f15f..0e07335291 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -613,7 +613,7 @@ void __init remove_early_mappings(void)
  */
 static void xen_pt_enforce_wnx(void)
 {
-    WRITE_SYSREG32(READ_SYSREG32(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
+    WRITE_SYSREG(READ_SYSREG(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
     /*
      * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
      * before flushing the TLBs.
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index c7acdb2087..e7384381cc 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -915,7 +915,7 @@ static void _show_registers(const struct cpu_user_regs *regs,
     printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
     printk("\n");
 
-    printk(" SCTLR_EL2: %08"PRIx32"\n", READ_SYSREG32(SCTLR_EL2));
+    printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
     printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
     printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
     printk("\n");
-- 
2.29.0


