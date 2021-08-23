Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521163F48BA
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 12:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170312.311124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI7H8-0004YG-Hr; Mon, 23 Aug 2021 10:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170312.311124; Mon, 23 Aug 2021 10:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI7H8-0004VU-CX; Mon, 23 Aug 2021 10:33:54 +0000
Received: by outflank-mailman (input) for mailman id 170312;
 Mon, 23 Aug 2021 10:33:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xpK=NO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1mI7H6-0003ow-NU
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 10:33:52 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8976ba6c-84db-4fc1-8635-5c24693602d2;
 Mon, 23 Aug 2021 10:33:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 640961474;
 Mon, 23 Aug 2021 03:33:47 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B46963F66F;
 Mon, 23 Aug 2021 03:33:46 -0700 (PDT)
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
X-Inumbo-ID: 8976ba6c-84db-4fc1-8635-5c24693602d2
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 6/7] xen/arm: Taint Xen on incompatible DCZID values
Date: Mon, 23 Aug 2021 11:32:15 +0100
Message-Id: <5cbf35ee54b44774818d703e43e161740eca02a9.1629713932.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1629713932.git.bertrand.marquis@arm.com>
References: <cover.1629713932.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1629713932.git.bertrand.marquis@arm.com>
References: <cover.1629713932.git.bertrand.marquis@arm.com>

Use arm64 cpu feature sanitization to TAIN Xen if different DCZID values
are found (ftr_dczid is using only STRICT method).
In this case actual memory being cleaned by DC ZVA operations would be
different depending on the cores which could make a guest zeroing too
much or too little memory if it is merged between CPUs.

We could, on processor supporting it, trap access to DCZID_EL0 register
using HFGRTR_EL2 register but this would not solve the case where a
process is being migrated during a copy or if it cached the value of the
register.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Change in v2: Patch introduced in v2
---
 xen/arch/arm/arm64/cpufeature.c  | 14 +++++++++++---
 xen/arch/arm/cpufeature.c        |  2 ++
 xen/include/asm-arm/cpufeature.h |  8 ++++++++
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
index 61f629ebaa..b1936ef1d6 100644
--- a/xen/arch/arm/arm64/cpufeature.c
+++ b/xen/arch/arm/arm64/cpufeature.c
@@ -329,14 +329,11 @@ static const struct arm64_ftr_bits ftr_mvfr2[] = {
 	ARM64_FTR_END,
 };
 
-#if 0
-/* TODO: handle this when sanitizing cache related registers */
 static const struct arm64_ftr_bits ftr_dczid[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, DCZID_DZP_SHIFT, 1, 1),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, DCZID_BS_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
-#endif
 
 static const struct arm64_ftr_bits ftr_id_isar0[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_ISAR0_DIVIDE_SHIFT, 4, 0),
@@ -592,6 +589,17 @@ void update_system_features(const struct cpuinfo_arm *new)
 
 	SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
 
+	/*
+	 * Comment from Linux:
+	 * Userspace may perform DC ZVA instructions. Mismatched block sizes
+	 * could result in too much or too little memory being zeroed if a
+	 * process is preempted and migrated between CPUs.
+	 *
+	 * ftr_dczid is using STRICT comparison so we will taint Xen if different
+	 * values are found.
+	 */
+	SANITIZE_REG(dczid, 0, dczid);
+
 	if ( cpu_feature64_has_el0_32(&system_cpuinfo) )
 	{
 		SANITIZE_ID_REG(pfr32, 0, pfr0);
diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index f600a611bd..113f20f601 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -125,6 +125,8 @@ void identify_cpu(struct cpuinfo_arm *c)
 
     c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
 
+    c->dczid.bits[0] = READ_SYSREG(DCZID_EL0);
+
     aarch32_el0 = cpu_feature64_has_el0_32(c);
 #endif
 
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 52cb3133e0..5219fd3bab 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -259,6 +259,14 @@ struct cpuinfo_arm {
         register_t bits[1];
     } zfr64;
 
+    /*
+     * DCZID is only used to check for incoherent values between cores
+     * and taint Xen in this case
+     */
+    struct {
+        register_t bits[1];
+    } dczid;
+
 #endif
 
     /*
-- 
2.17.1


