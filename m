Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7772D244A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 08:24:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47171.83539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmXLZ-0002Bb-S2; Tue, 08 Dec 2020 07:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47171.83539; Tue, 08 Dec 2020 07:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmXLZ-0002BC-OR; Tue, 08 Dec 2020 07:23:41 +0000
Received: by outflank-mailman (input) for mailman id 47171;
 Tue, 08 Dec 2020 07:23:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbUw=FM=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1kmXLY-0002B5-Lw
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 07:23:40 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6cbbc409-bbb9-4462-a961-2df6a3430daa;
 Tue, 08 Dec 2020 07:23:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CD3230E;
 Mon,  7 Dec 2020 23:23:38 -0800 (PST)
Received: from e123311-lin.arm.com (unknown [10.57.20.247])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA3383F718;
 Mon,  7 Dec 2020 23:23:36 -0800 (PST)
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
X-Inumbo-ID: 6cbbc409-bbb9-4462-a961-2df6a3430daa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	wei.chen@arm.com
Subject: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #845719
Date: Tue,  8 Dec 2020 08:23:27 +0100
Message-Id: <20201208072327.11890-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When executing in aarch32 state at EL0, a load at EL0 from a
virtual address that matches the bottom 32 bits of the virtual address
used by a recent load at (aarch64) EL1 might return incorrect data.

The workaround is to insert a write of the contextidr_el1 register
on exception return to an aarch32 guest.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 docs/misc/arm/silicon-errata.txt |  1 +
 xen/arch/arm/Kconfig             | 19 +++++++++++++++++++
 xen/arch/arm/arm64/entry.S       |  9 +++++++++
 xen/arch/arm/cpuerrata.c         |  8 ++++++++
 xen/include/asm-arm/cpufeature.h |  3 ++-
 5 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-errata.txt
index 27bf957ebf..fa3d9af63d 100644
--- a/docs/misc/arm/silicon-errata.txt
+++ b/docs/misc/arm/silicon-errata.txt
@@ -45,6 +45,7 @@ stable hypervisors.
 | ARM            | Cortex-A53      | #827319         | ARM64_ERRATUM_827319    |
 | ARM            | Cortex-A53      | #824069         | ARM64_ERRATUM_824069    |
 | ARM            | Cortex-A53      | #819472         | ARM64_ERRATUM_819472    |
+| ARM            | Cortex-A53      | #845719         | ARM64_ERRATUM_845719    |
 | ARM            | Cortex-A55      | #1530923        | N/A                     |
 | ARM            | Cortex-A57      | #852523         | N/A                     |
 | ARM            | Cortex-A57      | #832075         | ARM64_ERRATUM_832075    |
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index f5b1bcda03..6bea393555 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -244,6 +244,25 @@ config ARM_ERRATUM_858921
 
 	  If unsure, say Y.
 
+config ARM64_ERRATUM_845719
+	bool "Cortex-A53: 845719: A load might read incorrect data"
+	default y
+	help
+	  This option adds an alternative code sequence to work around ARM
+	  erratum 845719 on Cortex-A53 parts up to r0p4.
+
+	  When executing in aarch32 state at EL0, a load at EL0 from a
+	  virtual address that matches the bottom 32 bits of the virtual address
+	  used by a recent load at (aarch64) EL1 might return incorrect data.
+
+	  The workaround is to insert a write of the contextidr_el1 register
+	  on exception return to an aarch32 guest.
+	  Please note that this does not necessarily enable the workaround,
+	  as it depends on the alternative framework, which will only patch
+	  the kernel if an affected CPU is detected.
+
+	  If unsure, say Y.
+
 config ARM64_WORKAROUND_REPEAT_TLBI
 	bool
 
diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index 175ea2981e..ef3336f34a 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -96,6 +96,15 @@
         msr     SPSR_fiq, x22
         msr     SPSR_irq, x23
 
+#ifdef CONFIG_ARM64_ERRATUM_845719
+alternative_if ARM64_WORKAROUND_845719
+        /* contextidr_el1 is not accessible from aarch32 guest so we can
+         * write xzr to it
+         */
+        msr     contextidr_el1, xzr
+alternative_else_nop_endif
+#endif
+
         add     x21, sp, #UREGS_SPSR_und
         ldp     w22, w23, [x21]
         msr     SPSR_und, x22
diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
index b398d480f1..8959d4d4dc 100644
--- a/xen/arch/arm/cpuerrata.c
+++ b/xen/arch/arm/cpuerrata.c
@@ -491,6 +491,14 @@ static const struct arm_cpu_capabilities arm_errata[] = {
         .capability = ARM_WORKAROUND_858921,
         MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
     },
+#endif
+#ifdef CONFIG_ARM64_ERRATUM_845719
+    {
+        /* Cortex-A53 r0p[01234] */
+        .desc = "ARM erratum 845719",
+        .capability = ARM64_WORKAROUND_845719,
+        MIDR_RANGE(MIDR_CORTEX_A53, 0x00, 0x04),
+    },
 #endif
     {
         /* Neoverse r0p0 - r2p0 */
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index c7b5052992..1165a1eb62 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -47,8 +47,9 @@
 #define ARM64_WORKAROUND_AT_SPECULATE 9
 #define ARM_WORKAROUND_858921 10
 #define ARM64_WORKAROUND_REPEAT_TLBI 11
+#define ARM64_WORKAROUND_845719 12
 
-#define ARM_NCAPS           12
+#define ARM_NCAPS           13
 
 #ifndef __ASSEMBLY__
 
-- 
2.28.0


