Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2DC2C588C
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 16:53:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38701.71507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiJaC-0004YL-Q8; Thu, 26 Nov 2020 15:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38701.71507; Thu, 26 Nov 2020 15:53:20 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiJaC-0004Xc-JC; Thu, 26 Nov 2020 15:53:20 +0000
Received: by outflank-mailman (input) for mailman id 38701;
 Thu, 26 Nov 2020 15:53:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YrL6=FA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kiJaA-0004Ch-IS
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 15:53:18 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f5a14498-556f-4d9b-bcff-08e943744578;
 Thu, 26 Nov 2020 15:53:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C7B331B;
 Thu, 26 Nov 2020 07:53:06 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D6863F23F;
 Thu, 26 Nov 2020 07:53:05 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YrL6=FA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kiJaA-0004Ch-IS
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 15:53:18 +0000
X-Inumbo-ID: f5a14498-556f-4d9b-bcff-08e943744578
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id f5a14498-556f-4d9b-bcff-08e943744578;
	Thu, 26 Nov 2020 15:53:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C7B331B;
	Thu, 26 Nov 2020 07:53:06 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D6863F23F;
	Thu, 26 Nov 2020 07:53:05 -0800 (PST)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/7] xen/arm: Add handler for cp15 ID registers
Date: Thu, 26 Nov 2020 15:51:07 +0000
Message-Id: <d1b01a60e2e0042fe98719c2cd13b7d44e565dfb.1606151462.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606151462.git.bertrand.marquis@arm.com>
References: <cover.1606151462.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1606151462.git.bertrand.marquis@arm.com>
References: <cover.1606151462.git.bertrand.marquis@arm.com>

Add support for emulation of cp15 based ID registers (on arm32 or when
running a 32bit guest on arm64).
The handlers are returning the values stored in the guest_cpuinfo
structure.
In the current status the MVFR registers are no supported.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
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


