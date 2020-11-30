Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726332C8693
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 15:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41183.74368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjk5B-0002MU-29; Mon, 30 Nov 2020 14:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41183.74368; Mon, 30 Nov 2020 14:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjk5A-0002L7-Sw; Mon, 30 Nov 2020 14:23:12 +0000
Received: by outflank-mailman (input) for mailman id 41183;
 Mon, 30 Nov 2020 14:23:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DnPL=FE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kjk59-00022w-H6
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 14:23:11 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 034b4ba2-2386-4ae3-92ee-0b5e1b1f31fc;
 Mon, 30 Nov 2020 14:23:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 475591042;
 Mon, 30 Nov 2020 06:23:03 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97B703F71F;
 Mon, 30 Nov 2020 06:23:02 -0800 (PST)
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
X-Inumbo-ID: 034b4ba2-2386-4ae3-92ee-0b5e1b1f31fc
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Date: Mon, 30 Nov 2020 14:21:41 +0000
Message-Id: <86c96cd3895bf968f94010c0f4ee8dce7f0338e8.1606742184.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606742184.git.bertrand.marquis@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1606742184.git.bertrand.marquis@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>

Add support for emulation of cp15 based ID registers (on arm32 or when
running a 32bit guest on arm64).
The handlers are returning the values stored in the guest_cpuinfo
structure.
In the current status the MVFR registers are no supported.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in V2: rebase
---
 xen/arch/arm/vcpreg.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index cdc91cdf5b..d0c6406f34 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -155,6 +155,14 @@ TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
         break;                                                      \
     }
 
+/* Macro to generate easily case for ID co-processor emulation */
+#define GENERATE_TID3_INFO(reg,field,offset)                        \
+    case HSR_CPREG32(reg):                                          \
+    {                                                               \
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr,     \
+                          1, guest_cpuinfo.field.bits[offset]);     \
+    }
+
 void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
 {
     const struct hsr_cp32 cp32 = hsr.cp32;
@@ -286,6 +294,33 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
          */
         return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
 
+    /*
+     * HCR_EL2.TID3
+     *
+     * This is trapping most Identification registers used by a guest
+     * to identify the processor features
+     */
+    GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
+    GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
+    GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
+    GENERATE_TID3_INFO(ID_DFR0, dbg32, 0)
+    GENERATE_TID3_INFO(ID_DFR1, dbg32, 1)
+    GENERATE_TID3_INFO(ID_AFR0, aux32, 0)
+    GENERATE_TID3_INFO(ID_MMFR0, mm32, 0)
+    GENERATE_TID3_INFO(ID_MMFR1, mm32, 1)
+    GENERATE_TID3_INFO(ID_MMFR2, mm32, 2)
+    GENERATE_TID3_INFO(ID_MMFR3, mm32, 3)
+    GENERATE_TID3_INFO(ID_MMFR4, mm32, 4)
+    GENERATE_TID3_INFO(ID_MMFR5, mm32, 5)
+    GENERATE_TID3_INFO(ID_ISAR0, isa32, 0)
+    GENERATE_TID3_INFO(ID_ISAR1, isa32, 1)
+    GENERATE_TID3_INFO(ID_ISAR2, isa32, 2)
+    GENERATE_TID3_INFO(ID_ISAR3, isa32, 3)
+    GENERATE_TID3_INFO(ID_ISAR4, isa32, 4)
+    GENERATE_TID3_INFO(ID_ISAR5, isa32, 5)
+    GENERATE_TID3_INFO(ID_ISAR6, isa32, 6)
+    /* MVFR registers are in cp10 no cp15 */
+
     /*
      * HCR_EL2.TIDCP
      *
-- 
2.17.1


