Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C92F3C9D
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 00:45:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66204.117509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzTLS-0007fd-7F; Tue, 12 Jan 2021 23:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66204.117509; Tue, 12 Jan 2021 23:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzTLS-0007fE-3d; Tue, 12 Jan 2021 23:45:02 +0000
Received: by outflank-mailman (input) for mailman id 66204;
 Tue, 12 Jan 2021 23:45:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmZ/=GP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kzTLR-0007f9-0P
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 23:45:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc73fda0-7527-4609-a25c-ec594981ea6b;
 Tue, 12 Jan 2021 23:44:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D692823120;
 Tue, 12 Jan 2021 23:44:58 +0000 (UTC)
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
X-Inumbo-ID: cc73fda0-7527-4609-a25c-ec594981ea6b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610495099;
	bh=S/YjHVdaoHbilb3FppMkLOATNmhVGF368nEsdpllR6o=;
	h=From:To:Cc:Subject:Date:From;
	b=rynrGXdchN4GoUiYqLRZkq3JMJjysVdvLt7Z8Z8KV44XjibckfjPv88bnXdyfsdcg
	 jSWYpor5cRP/TW+q480DIKJYskhxOXBZO/WMJ04kDYNsreiQHtyxWNWUB1bFNFsZ6G
	 w4rUF6ABJCNh72/BpLVNAYFTpYLN+q1qJkZRye0xGXZOlRfYIo+fZOFzr7RH99Ttju
	 aAijNLHHRc5mkerH9oT1oFiLbZydozkujNSB2THPlcSGIpto2Dgsr7p+KZrsuklN/h
	 PVW40oODZdjeQ5Z8KGVYzHaJDOPyM59i5/2E7iPNjJxA3r1CwMDnke+iFW7f/0LI1d
	 HytNSKpgzDMfQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	julien@xen.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2] xen/arm: don't read aarch32 regs when aarch32 isn't available
Date: Tue, 12 Jan 2021 15:44:50 -0800
Message-Id: <20210112234450.31584-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Don't read aarch32 system registers at boot time when the aarch32 state
is not available at EL0. They are UNKNOWN, so it is not useful to read
them.  Moreover, on Cavium ThunderX reading ID_PFR2_EL1 causes a Xen
crash.  Instead, only read them when aarch32 is available.

Leave the corresponding fields in struct cpuinfo_arm so that they
are read-as-zero from a guest.

Since we are editing identify_cpu, also fix the indentation: 4 spaces
instead of 8.

Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
Link: https://lore.kernel.org/xen-devel/f90e40ee-b042-6cc5-a08d-aef41a279527@suse.com/
Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- check el0 instead of el1 for aarch32 support
- clarify EL0 in commit message
- remove temporary link in commit message
- use lore.kernel.org in commit message
- introduce cpu_feature64_has_el0_32
- rename aarch32 to aarch32_el0
---
 xen/arch/arm/cpufeature.c        | 35 +++++++++++++++++++-------------
 xen/include/asm-arm/cpufeature.h |  2 ++
 2 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 698bfa0201..99fe4db280 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -101,29 +101,35 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_capabilities *caps)
 
 void identify_cpu(struct cpuinfo_arm *c)
 {
-        c->midr.bits = READ_SYSREG(MIDR_EL1);
-        c->mpidr.bits = READ_SYSREG(MPIDR_EL1);
+    bool aarch32_el0 = true;
+
+    c->midr.bits = READ_SYSREG(MIDR_EL1);
+    c->mpidr.bits = READ_SYSREG(MPIDR_EL1);
 
 #ifdef CONFIG_ARM_64
-        c->pfr64.bits[0] = READ_SYSREG(ID_AA64PFR0_EL1);
-        c->pfr64.bits[1] = READ_SYSREG(ID_AA64PFR1_EL1);
+    c->pfr64.bits[0] = READ_SYSREG(ID_AA64PFR0_EL1);
+    c->pfr64.bits[1] = READ_SYSREG(ID_AA64PFR1_EL1);
+
+    c->dbg64.bits[0] = READ_SYSREG(ID_AA64DFR0_EL1);
+    c->dbg64.bits[1] = READ_SYSREG(ID_AA64DFR1_EL1);
 
-        c->dbg64.bits[0] = READ_SYSREG(ID_AA64DFR0_EL1);
-        c->dbg64.bits[1] = READ_SYSREG(ID_AA64DFR1_EL1);
+    c->aux64.bits[0] = READ_SYSREG(ID_AA64AFR0_EL1);
+    c->aux64.bits[1] = READ_SYSREG(ID_AA64AFR1_EL1);
 
-        c->aux64.bits[0] = READ_SYSREG(ID_AA64AFR0_EL1);
-        c->aux64.bits[1] = READ_SYSREG(ID_AA64AFR1_EL1);
+    c->mm64.bits[0]  = READ_SYSREG(ID_AA64MMFR0_EL1);
+    c->mm64.bits[1]  = READ_SYSREG(ID_AA64MMFR1_EL1);
+    c->mm64.bits[2]  = READ_SYSREG(ID_AA64MMFR2_EL1);
 
-        c->mm64.bits[0]  = READ_SYSREG(ID_AA64MMFR0_EL1);
-        c->mm64.bits[1]  = READ_SYSREG(ID_AA64MMFR1_EL1);
-        c->mm64.bits[2]  = READ_SYSREG(ID_AA64MMFR2_EL1);
+    c->isa64.bits[0] = READ_SYSREG(ID_AA64ISAR0_EL1);
+    c->isa64.bits[1] = READ_SYSREG(ID_AA64ISAR1_EL1);
 
-        c->isa64.bits[0] = READ_SYSREG(ID_AA64ISAR0_EL1);
-        c->isa64.bits[1] = READ_SYSREG(ID_AA64ISAR1_EL1);
+    c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
 
-        c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
+    aarch32_el0 = cpu_feature64_has_el0_32(c);
 #endif
 
+    if ( aarch32_el0 )
+    {
         c->pfr32.bits[0] = READ_SYSREG(ID_PFR0_EL1);
         c->pfr32.bits[1] = READ_SYSREG(ID_PFR1_EL1);
         c->pfr32.bits[2] = READ_SYSREG(ID_PFR2_EL1);
@@ -153,6 +159,7 @@ void identify_cpu(struct cpuinfo_arm *c)
 #ifndef MVFR2_MAYBE_UNDEFINED
         c->mvfr.bits[2] = READ_SYSREG(MVFR2_EL1);
 #endif
+    }
 }
 
 /*
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 6058744c18..13a2739a69 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -5,6 +5,8 @@
 #define cpu_feature64(c, feat)         ((c)->pfr64.feat)
 #define boot_cpu_feature64(feat)       (boot_cpu_data.pfr64.feat)
 
+#define cpu_feature64_has_el0_32(c)    (cpu_feature64(c, el0) == 2)
+
 #define cpu_has_el0_32    (boot_cpu_feature64(el0) == 2)
 #define cpu_has_el0_64    (boot_cpu_feature64(el0) >= 1)
 #define cpu_has_el1_32    (boot_cpu_feature64(el1) == 2)
-- 
2.17.1


