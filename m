Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EF836C1D6
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 11:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118149.224147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbK8V-0006ms-2v; Tue, 27 Apr 2021 09:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118149.224147; Tue, 27 Apr 2021 09:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbK8U-0006mN-V2; Tue, 27 Apr 2021 09:36:06 +0000
Received: by outflank-mailman (input) for mailman id 118149;
 Tue, 27 Apr 2021 09:36:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3fO=JY=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lbK8T-0006jJ-AQ
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 09:36:05 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5a263592-b28c-4e82-bdce-c7fba4e098b1;
 Tue, 27 Apr 2021 09:36:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85BFF101E;
 Tue, 27 Apr 2021 02:36:00 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.27.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A6B53F694;
 Tue, 27 Apr 2021 02:35:59 -0700 (PDT)
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
X-Inumbo-ID: 5a263592-b28c-4e82-bdce-c7fba4e098b1
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com
Subject: [PATCH v2 02/10] arm/domain: Get rid of READ/WRITE_SYSREG32
Date: Tue, 27 Apr 2021 11:35:38 +0200
Message-Id: <20210427093546.30703-3-michal.orzel@arm.com>
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

Modify type of register cntkctl to register_t.
Modify accesses to thumbee registers to use READ/WRITE_SYSREG.
No need to change type of thumbee registers to register_t as they
only exist on arm32.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
Changes since v1:
-Move modification of ACTLR into seperate patch
---
 xen/arch/arm/domain.c        | 18 +++++++++---------
 xen/include/asm-arm/domain.h |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index bdd3d3e5b5..621f518b83 100644
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
 
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 0a74df9931..c6b59ee755 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -190,7 +190,7 @@ struct arch_vcpu
     struct vgic_cpu vgic;
 
     /* Timer registers  */
-    uint32_t cntkctl;
+    register_t cntkctl;
 
     struct vtimer phys_timer;
     struct vtimer virt_timer;
-- 
2.29.0


