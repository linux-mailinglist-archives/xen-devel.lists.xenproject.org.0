Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDEA36C1D3
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 11:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118150.224158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbK8a-0006r8-Cd; Tue, 27 Apr 2021 09:36:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118150.224158; Tue, 27 Apr 2021 09:36:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbK8a-0006qK-8q; Tue, 27 Apr 2021 09:36:12 +0000
Received: by outflank-mailman (input) for mailman id 118150;
 Tue, 27 Apr 2021 09:36:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3fO=JY=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lbK8Y-0006jJ-AT
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 09:36:10 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e7887ec5-a427-4c04-9f58-01a7c570b171;
 Tue, 27 Apr 2021 09:36:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20B63106F;
 Tue, 27 Apr 2021 02:36:02 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.27.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D37C63F694;
 Tue, 27 Apr 2021 02:36:00 -0700 (PDT)
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
X-Inumbo-ID: e7887ec5-a427-4c04-9f58-01a7c570b171
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH v2 03/10] arm: Modify type of actlr to register_t
Date: Tue, 27 Apr 2021 11:35:39 +0200
Message-Id: <20210427093546.30703-4-michal.orzel@arm.com>
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

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/domain.c        | 2 +-
 xen/include/asm-arm/domain.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 621f518b83..c021a03c61 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -330,7 +330,7 @@ static void schedule_tail(struct vcpu *prev)
 
 static void continue_new_vcpu(struct vcpu *prev)
 {
-    current->arch.actlr = READ_SYSREG32(ACTLR_EL1);
+    current->arch.actlr = READ_SYSREG(ACTLR_EL1);
     processor_vcpu_initialise(current);
 
     schedule_tail(prev);
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index c6b59ee755..2d4f38c669 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -156,7 +156,7 @@ struct arch_vcpu
 
     /* Control Registers */
     register_t sctlr;
-    uint32_t actlr;
+    register_t actlr;
     uint32_t cpacr;
 
     uint32_t contextidr;
-- 
2.29.0


