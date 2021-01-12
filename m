Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E37032F2347
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 01:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65413.115887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz7ML-0002Fe-SA; Tue, 12 Jan 2021 00:16:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65413.115887; Tue, 12 Jan 2021 00:16:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz7ML-0002FF-P1; Tue, 12 Jan 2021 00:16:29 +0000
Received: by outflank-mailman (input) for mailman id 65413;
 Tue, 12 Jan 2021 00:16:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmZ/=GP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kz7MJ-0002FA-KZ
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 00:16:27 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97cfc09d-0fe5-45b7-a257-98d067642019;
 Tue, 12 Jan 2021 00:16:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4A16622D2B;
 Tue, 12 Jan 2021 00:16:25 +0000 (UTC)
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
X-Inumbo-ID: 97cfc09d-0fe5-45b7-a257-98d067642019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610410585;
	bh=l3xrdzTXAvflM8HYgqRBWk5PMftuMQKav6wAZwyk9kg=;
	h=From:To:Cc:Subject:Date:From;
	b=b+6Ir9beRJ90pLUpjj7D9yY8VFAHuDe17UvlN+K9luExIzjuZyRj2GLbF/4x+Vnwq
	 uiRPhMdlXZ+8xYvbpS+VGwzLZ/GHwymJs761Bq/pUGXQZa0Q6XEYTXiEz3sHYDqTRX
	 oQtXfmoNLBRwy0yP+3fmIV8//zMlv1Lpgqj37RdQ8M5WgX810JBdzOjzBAYjhDCMrk
	 JdPVXn7EWiMlsT+fcYnRqCSQZ2+VCb0V5YilimoqpikROKSF+uF369ZdBdNOLZiiPC
	 Qa9Dn7IrvkK3cnFEm5Ldm3FQ9y+Ps3SmJCUzm2nBpp6AU4cg+pwFW/+d5fQVC1bOZG
	 eTRkqJsy8bWhw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't available
Date: Mon, 11 Jan 2021 16:16:23 -0800
Message-Id: <20210112001623.28421-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

Don't read aarch32 system registers at boot time when the aarch32 state
is not available. They are UNKNOWN, so it is not useful to read them.
Moreover, on Cavium ThunderX reading ID_PFR2_EL1 causes a Xen crash.
Instead, only read them when aarch32 is available.

Leave the corresponding fields in struct cpuinfo_arm so that they
are read-as-zero from a guest.

Since we are editing identify_cpu, also fix the indentation: 4 spaces
instead of 8.

Fixes: 9cfdb489af81 ("xen/arm: Add ID registers and complete cpuinfo")
Link: https://marc.info/?l=xen-devel&m=161035501118086
Link: http://logs.test-lab.xenproject.org/osstest/logs/158293/test-arm64-arm64-xl-xsm/info.html
Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/cpufeature.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 698bfa0201..b1c82ade49 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -101,29 +101,35 @@ int enable_nonboot_cpu_caps(const struct arm_cpu_capabilities *caps)
 
 void identify_cpu(struct cpuinfo_arm *c)
 {
-        c->midr.bits = READ_SYSREG(MIDR_EL1);
-        c->mpidr.bits = READ_SYSREG(MPIDR_EL1);
+    bool aarch32 = true;
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
+    aarch32 = c->pfr64.el1 == 2;
 #endif
 
+    if ( aarch32 )
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
-- 
2.17.1


