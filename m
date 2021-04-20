Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C3F3652E3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 09:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113308.215909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkVX-0006Om-KJ; Tue, 20 Apr 2021 07:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113308.215909; Tue, 20 Apr 2021 07:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYkVX-0006O6-Fb; Tue, 20 Apr 2021 07:09:15 +0000
Received: by outflank-mailman (input) for mailman id 113308;
 Tue, 20 Apr 2021 07:09:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8gRw=JR=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lYkVV-0006Ja-NO
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 07:09:13 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id aa01ec39-8aab-4e59-b44c-5e2fe6ec18a6;
 Tue, 20 Apr 2021 07:09:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA30814BF;
 Tue, 20 Apr 2021 00:09:07 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.29.239])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B348E3F85F;
 Tue, 20 Apr 2021 00:09:06 -0700 (PDT)
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
X-Inumbo-ID: aa01ec39-8aab-4e59-b44c-5e2fe6ec18a6
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH 2/9] arm/domain: Get rid of READ/WRITE_SYSREG32
Date: Tue, 20 Apr 2021 09:08:46 +0200
Message-Id: <20210420070853.8918-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210420070853.8918-1-michal.orzel@arm.com>
References: <20210420070853.8918-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AArch64 system registers are 64bit whereas AArch32 ones
are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
we should get rid of helpers READ/WRITE_SYSREG32
in favour of using READ/WRITE_SYSREG.
We should also use register_t type when reading sysregs
which can correspond to uint64_t or uint32_t.
Even though many AArch64 sysregs have upper 32bit reserved
it does not mean that they can't be widen in the future.

Modify type of registers: actlr, cntkctl to register_t.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/domain.c        | 20 ++++++++++----------
 xen/include/asm-arm/domain.h |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index bdd3d3e5b5..c021a03c61 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -113,13 +113,13 @@ static void ctxt_switch_from(struct vcpu *p)
     p->arch.tpidr_el1 = READ_SYSREG(TPIDR_EL1);
 
     /* Arch timer */
-    p->arch.cntkctl = READ_SYSREG32(CNTKCTL_EL1);
+    p->arch.cntkctl = READ_SYSREG(CNTKCTL_EL1);
     virt_timer_save(p);
 
     if ( is_32bit_domain(p->domain) && cpu_has_thumbee )
     {
-        p->arch.teecr = READ_SYSREG32(TEECR32_EL1);
-        p->arch.teehbr = READ_SYSREG32(TEEHBR32_EL1);
+        p->arch.teecr = READ_SYSREG(TEECR32_EL1);
+        p->arch.teehbr = READ_SYSREG(TEEHBR32_EL1);
     }
 
 #ifdef CONFIG_ARM_32
@@ -175,7 +175,7 @@ static void ctxt_switch_from(struct vcpu *p)
 
 static void ctxt_switch_to(struct vcpu *n)
 {
-    uint32_t vpidr;
+    register_t vpidr;
 
     /* When the idle VCPU is running, Xen will always stay in hypervisor
      * mode. Therefore we don't need to restore the context of an idle VCPU.
@@ -183,8 +183,8 @@ static void ctxt_switch_to(struct vcpu *n)
     if ( is_idle_vcpu(n) )
         return;
 
-    vpidr = READ_SYSREG32(MIDR_EL1);
-    WRITE_SYSREG32(vpidr, VPIDR_EL2);
+    vpidr = READ_SYSREG(MIDR_EL1);
+    WRITE_SYSREG(vpidr, VPIDR_EL2);
     WRITE_SYSREG(n->arch.vmpidr, VMPIDR_EL2);
 
     /* VGIC */
@@ -257,8 +257,8 @@ static void ctxt_switch_to(struct vcpu *n)
 
     if ( is_32bit_domain(n->domain) && cpu_has_thumbee )
     {
-        WRITE_SYSREG32(n->arch.teecr, TEECR32_EL1);
-        WRITE_SYSREG32(n->arch.teehbr, TEEHBR32_EL1);
+        WRITE_SYSREG(n->arch.teecr, TEECR32_EL1);
+        WRITE_SYSREG(n->arch.teehbr, TEEHBR32_EL1);
     }
 
 #ifdef CONFIG_ARM_32
@@ -274,7 +274,7 @@ static void ctxt_switch_to(struct vcpu *n)
 
     /* This is could trigger an hardware interrupt from the virtual
      * timer. The interrupt needs to be injected into the guest. */
-    WRITE_SYSREG32(n->arch.cntkctl, CNTKCTL_EL1);
+    WRITE_SYSREG(n->arch.cntkctl, CNTKCTL_EL1);
     virt_timer_restore(n);
 }
 
@@ -330,7 +330,7 @@ static void schedule_tail(struct vcpu *prev)
 
 static void continue_new_vcpu(struct vcpu *prev)
 {
-    current->arch.actlr = READ_SYSREG32(ACTLR_EL1);
+    current->arch.actlr = READ_SYSREG(ACTLR_EL1);
     processor_vcpu_initialise(current);
 
     schedule_tail(prev);
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 0a74df9931..2d4f38c669 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -156,7 +156,7 @@ struct arch_vcpu
 
     /* Control Registers */
     register_t sctlr;
-    uint32_t actlr;
+    register_t actlr;
     uint32_t cpacr;
 
     uint32_t contextidr;
@@ -190,7 +190,7 @@ struct arch_vcpu
     struct vgic_cpu vgic;
 
     /* Timer registers  */
-    uint32_t cntkctl;
+    register_t cntkctl;
 
     struct vtimer phys_timer;
     struct vtimer virt_timer;
-- 
2.29.0


