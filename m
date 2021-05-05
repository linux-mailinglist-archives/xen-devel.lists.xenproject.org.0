Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9333735BF
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 09:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122821.231701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCBp-0004hX-Vd; Wed, 05 May 2021 07:43:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122821.231701; Wed, 05 May 2021 07:43:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCBp-0004eL-Qu; Wed, 05 May 2021 07:43:25 +0000
Received: by outflank-mailman (input) for mailman id 122821;
 Wed, 05 May 2021 07:43:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0XF=KA=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1leCBo-00044r-PH
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 07:43:24 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 88af7043-99c7-4d16-ab26-f8a73ae7904f;
 Wed, 05 May 2021 07:43:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 365441063;
 Wed,  5 May 2021 00:43:19 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.0.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC5BF3F718;
 Wed,  5 May 2021 00:43:17 -0700 (PDT)
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
X-Inumbo-ID: 88af7043-99c7-4d16-ab26-f8a73ae7904f
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 01/10] arm64/vfp: Get rid of READ/WRITE_SYSREG32
Date: Wed,  5 May 2021 09:42:59 +0200
Message-Id: <20210505074308.11016-2-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210505074308.11016-1-michal.orzel@arm.com>
References: <20210505074308.11016-1-michal.orzel@arm.com>
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

Modify type of FPCR, FPSR, FPEXC32_EL2 to register_t.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm64/vfp.c        | 12 ++++++------
 xen/include/asm-arm/arm64/vfp.h |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/arm64/vfp.c b/xen/arch/arm/arm64/vfp.c
index 999a0d58a5..47885e76ba 100644
--- a/xen/arch/arm/arm64/vfp.c
+++ b/xen/arch/arm/arm64/vfp.c
@@ -26,10 +26,10 @@ void vfp_save_state(struct vcpu *v)
                  "stp q30, q31, [%1, #16 * 30]\n\t"
                  : "=Q" (*v->arch.vfp.fpregs) : "r" (v->arch.vfp.fpregs));
 
-    v->arch.vfp.fpsr = READ_SYSREG32(FPSR);
-    v->arch.vfp.fpcr = READ_SYSREG32(FPCR);
+    v->arch.vfp.fpsr = READ_SYSREG(FPSR);
+    v->arch.vfp.fpcr = READ_SYSREG(FPCR);
     if ( is_32bit_domain(v->domain) )
-        v->arch.vfp.fpexc32_el2 = READ_SYSREG32(FPEXC32_EL2);
+        v->arch.vfp.fpexc32_el2 = READ_SYSREG(FPEXC32_EL2);
 }
 
 void vfp_restore_state(struct vcpu *v)
@@ -55,8 +55,8 @@ void vfp_restore_state(struct vcpu *v)
                  "ldp q30, q31, [%1, #16 * 30]\n\t"
                  : : "Q" (*v->arch.vfp.fpregs), "r" (v->arch.vfp.fpregs));
 
-    WRITE_SYSREG32(v->arch.vfp.fpsr, FPSR);
-    WRITE_SYSREG32(v->arch.vfp.fpcr, FPCR);
+    WRITE_SYSREG(v->arch.vfp.fpsr, FPSR);
+    WRITE_SYSREG(v->arch.vfp.fpcr, FPCR);
     if ( is_32bit_domain(v->domain) )
-        WRITE_SYSREG32(v->arch.vfp.fpexc32_el2, FPEXC32_EL2);
+        WRITE_SYSREG(v->arch.vfp.fpexc32_el2, FPEXC32_EL2);
 }
diff --git a/xen/include/asm-arm/arm64/vfp.h b/xen/include/asm-arm/arm64/vfp.h
index 6ab5d36c6c..e6e8c363bc 100644
--- a/xen/include/asm-arm/arm64/vfp.h
+++ b/xen/include/asm-arm/arm64/vfp.h
@@ -7,9 +7,9 @@
 struct vfp_state
 {
     uint64_t fpregs[64] __vfp_aligned;
-    uint32_t fpcr;
-    uint32_t fpexc32_el2;
-    uint32_t fpsr;
+    register_t fpcr;
+    register_t fpexc32_el2;
+    register_t fpsr;
 };
 
 #endif /* _ARM_ARM64_VFP_H */
-- 
2.29.0


