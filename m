Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D1D2DD460
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 16:42:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55979.97668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQI-0004Gi-F5; Thu, 17 Dec 2020 15:42:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55979.97668; Thu, 17 Dec 2020 15:42:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQI-0004GJ-BZ; Thu, 17 Dec 2020 15:42:34 +0000
Received: by outflank-mailman (input) for mailman id 55979;
 Thu, 17 Dec 2020 15:42:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xKjN=FV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kpvQG-0004G9-Tk
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 15:42:32 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 449d379c-d30f-49e2-98e8-9d1402156f8b;
 Thu, 17 Dec 2020 15:42:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F37AE30E;
 Thu, 17 Dec 2020 07:42:31 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BC833F66B;
 Thu, 17 Dec 2020 07:42:31 -0800 (PST)
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
X-Inumbo-ID: 449d379c-d30f-49e2-98e8-9d1402156f8b
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 1/8] xen/arm: Use READ_SYSREG instead of 32/64 versions
Date: Thu, 17 Dec 2020 15:38:01 +0000
Message-Id: <75ab5c84ed6ce1d004316ca4677735aa0543ecdc.1608214355.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>

Modify identify_cpu function to use READ_SYSREG instead of READ_SYSREG32
or READ_SYSREG64.
The aarch32 versions of the registers are 64bit on an aarch64 processor
so it was wrong to access them as 32bit registers.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Change in V4:
  This patch was introduced in v4.

---
 xen/arch/arm/cpufeature.c | 50 +++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 44126dbf07..115e1b164d 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -99,44 +99,44 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_capabilities *caps)
 
 void identify_cpu(struct cpuinfo_arm *c)
 {
-        c->midr.bits = READ_SYSREG32(MIDR_EL1);
+        c->midr.bits = READ_SYSREG(MIDR_EL1);
         c->mpidr.bits = READ_SYSREG(MPIDR_EL1);
 
 #ifdef CONFIG_ARM_64
-        c->pfr64.bits[0] = READ_SYSREG64(ID_AA64PFR0_EL1);
-        c->pfr64.bits[1] = READ_SYSREG64(ID_AA64PFR1_EL1);
+        c->pfr64.bits[0] = READ_SYSREG(ID_AA64PFR0_EL1);
+        c->pfr64.bits[1] = READ_SYSREG(ID_AA64PFR1_EL1);
 
-        c->dbg64.bits[0] = READ_SYSREG64(ID_AA64DFR0_EL1);
-        c->dbg64.bits[1] = READ_SYSREG64(ID_AA64DFR1_EL1);
+        c->dbg64.bits[0] = READ_SYSREG(ID_AA64DFR0_EL1);
+        c->dbg64.bits[1] = READ_SYSREG(ID_AA64DFR1_EL1);
 
-        c->aux64.bits[0] = READ_SYSREG64(ID_AA64AFR0_EL1);
-        c->aux64.bits[1] = READ_SYSREG64(ID_AA64AFR1_EL1);
+        c->aux64.bits[0] = READ_SYSREG(ID_AA64AFR0_EL1);
+        c->aux64.bits[1] = READ_SYSREG(ID_AA64AFR1_EL1);
 
-        c->mm64.bits[0]  = READ_SYSREG64(ID_AA64MMFR0_EL1);
-        c->mm64.bits[1]  = READ_SYSREG64(ID_AA64MMFR1_EL1);
+        c->mm64.bits[0]  = READ_SYSREG(ID_AA64MMFR0_EL1);
+        c->mm64.bits[1]  = READ_SYSREG(ID_AA64MMFR1_EL1);
 
-        c->isa64.bits[0] = READ_SYSREG64(ID_AA64ISAR0_EL1);
-        c->isa64.bits[1] = READ_SYSREG64(ID_AA64ISAR1_EL1);
+        c->isa64.bits[0] = READ_SYSREG(ID_AA64ISAR0_EL1);
+        c->isa64.bits[1] = READ_SYSREG(ID_AA64ISAR1_EL1);
 #endif
 
-        c->pfr32.bits[0] = READ_SYSREG32(ID_PFR0_EL1);
-        c->pfr32.bits[1] = READ_SYSREG32(ID_PFR1_EL1);
+        c->pfr32.bits[0] = READ_SYSREG(ID_PFR0_EL1);
+        c->pfr32.bits[1] = READ_SYSREG(ID_PFR1_EL1);
 
-        c->dbg32.bits[0] = READ_SYSREG32(ID_DFR0_EL1);
+        c->dbg32.bits[0] = READ_SYSREG(ID_DFR0_EL1);
 
-        c->aux32.bits[0] = READ_SYSREG32(ID_AFR0_EL1);
+        c->aux32.bits[0] = READ_SYSREG(ID_AFR0_EL1);
 
-        c->mm32.bits[0]  = READ_SYSREG32(ID_MMFR0_EL1);
-        c->mm32.bits[1]  = READ_SYSREG32(ID_MMFR1_EL1);
-        c->mm32.bits[2]  = READ_SYSREG32(ID_MMFR2_EL1);
-        c->mm32.bits[3]  = READ_SYSREG32(ID_MMFR3_EL1);
+        c->mm32.bits[0]  = READ_SYSREG(ID_MMFR0_EL1);
+        c->mm32.bits[1]  = READ_SYSREG(ID_MMFR1_EL1);
+        c->mm32.bits[2]  = READ_SYSREG(ID_MMFR2_EL1);
+        c->mm32.bits[3]  = READ_SYSREG(ID_MMFR3_EL1);
 
-        c->isa32.bits[0] = READ_SYSREG32(ID_ISAR0_EL1);
-        c->isa32.bits[1] = READ_SYSREG32(ID_ISAR1_EL1);
-        c->isa32.bits[2] = READ_SYSREG32(ID_ISAR2_EL1);
-        c->isa32.bits[3] = READ_SYSREG32(ID_ISAR3_EL1);
-        c->isa32.bits[4] = READ_SYSREG32(ID_ISAR4_EL1);
-        c->isa32.bits[5] = READ_SYSREG32(ID_ISAR5_EL1);
+        c->isa32.bits[0] = READ_SYSREG(ID_ISAR0_EL1);
+        c->isa32.bits[1] = READ_SYSREG(ID_ISAR1_EL1);
+        c->isa32.bits[2] = READ_SYSREG(ID_ISAR2_EL1);
+        c->isa32.bits[3] = READ_SYSREG(ID_ISAR3_EL1);
+        c->isa32.bits[4] = READ_SYSREG(ID_ISAR4_EL1);
+        c->isa32.bits[5] = READ_SYSREG(ID_ISAR5_EL1);
 }
 
 /*
-- 
2.17.1


