Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3677A3735C6
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 09:43:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122830.231773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCCA-0007g3-NA; Wed, 05 May 2021 07:43:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122830.231773; Wed, 05 May 2021 07:43:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCCA-0007dI-Gc; Wed, 05 May 2021 07:43:46 +0000
Received: by outflank-mailman (input) for mailman id 122830;
 Wed, 05 May 2021 07:43:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0XF=KA=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1leCC8-00044r-Pp
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 07:43:44 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f23ef506-3155-4de1-a8c8-171db1729383;
 Wed, 05 May 2021 07:43:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 642841063;
 Wed,  5 May 2021 00:43:29 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.0.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C31D3F718;
 Wed,  5 May 2021 00:43:27 -0700 (PDT)
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
X-Inumbo-ID: f23ef506-3155-4de1-a8c8-171db1729383
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	wei.chen@arm.com
Subject: [PATCH v3 07/10] xen/arm: Always access SCTLR_EL2 using READ/WRITE_SYSREG()
Date: Wed,  5 May 2021 09:43:05 +0200
Message-Id: <20210505074308.11016-8-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210505074308.11016-1-michal.orzel@arm.com>
References: <20210505074308.11016-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Armv8 specification describes the system register as a 64-bit value
on AArch64 and 32-bit value on AArch32 (same as ARMv7).

Unfortunately, Xen is accessing the system registers using
READ/WRITE_SYSREG32() which means the top 32-bit are clobbered.

This is only a latent bug so far because Xen will not yet use the top
32-bit.

There is also no change in behavior because arch/arm/arm64/head.S will
initialize SCTLR_EL2 to a sane value with the top 32-bit zeroed.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
Changes since v2:
-Modify the commit message
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


