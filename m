Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46193735C8
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 09:44:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122841.231797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCCK-0000k8-GG; Wed, 05 May 2021 07:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122841.231797; Wed, 05 May 2021 07:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leCCK-0000fe-9q; Wed, 05 May 2021 07:43:56 +0000
Received: by outflank-mailman (input) for mailman id 122841;
 Wed, 05 May 2021 07:43:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0XF=KA=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1leCCI-00044r-Py
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 07:43:54 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 80cab1ab-83b0-42a0-a8d2-bf91fa95ecc9;
 Wed, 05 May 2021 07:43:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20019D6E;
 Wed,  5 May 2021 00:43:36 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.0.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 388713F718;
 Wed,  5 May 2021 00:43:33 -0700 (PDT)
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
X-Inumbo-ID: 80cab1ab-83b0-42a0-a8d2-bf91fa95ecc9
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	bertrand.marquis@arm.com,
	wei.chen@arm.com
Subject: [PATCH v3 10/10] arm64: Change type of hsr, cpsr, spsr_el1 to uint64_t
Date: Wed,  5 May 2021 09:43:08 +0200
Message-Id: <20210505074308.11016-11-michal.orzel@arm.com>
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

Modify type of hsr, cpsr, spsr_el1 to uint64_t.
Previously we relied on the padding after SPSR_EL1.
As we removed the padding, modify the union to be 64bit so we don't corrupt SPSR_FIQ.
No need to modify the assembly code becuase the accesses were based on 64bit
registers as there was a 32bit padding after SPSR_EL1.

Remove 32bit padding in cpu_user_regs before spsr_fiq
as it is no longer needed due to upper union being 64bit now.
Add 64bit padding in cpu_user_regs before spsr_el1
because offset of spsr_el1 must be a multiple of 8.

Change type of cpsr to uint64_t in the public outside interface
"public/arch-arm.h" to allow ABI compatibility between 32bit and 64bit.
Increment XEN_DOMCTL_INTERFACE_VERSION.

Change type of cpsr to uint64_t in the public outside interface
"public/vm_event.h" to allow ABI compatibility between 32bit and 64bit.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
Changes since v2:
-Remove _res0 members from structures inside hsr union
-Update commit message
-Modify type of cpsr to uint64_t in public/arch-arm.h
-Increment XEN_DOMCTL_INTERFACE_VERSION
Changes since v1:
-Modify type of cpsr, spsr_el1
-Remove ifdefery in hsr union protecting _res0 members
-Fix formatting of printk calls
---
 xen/arch/arm/arm64/entry.S            |  4 ++--
 xen/arch/arm/arm64/traps.c            |  2 +-
 xen/arch/arm/arm64/vsysreg.c          |  3 ++-
 xen/arch/arm/domain.c                 |  2 +-
 xen/arch/arm/traps.c                  | 30 +++++++++++++++------------
 xen/arch/arm/vcpreg.c                 | 13 ++++++------
 xen/include/asm-arm/arm64/processor.h | 11 +++++-----
 xen/include/asm-arm/hsr.h             |  2 +-
 xen/include/public/arch-arm.h         |  4 ++--
 xen/include/public/domctl.h           |  2 +-
 xen/include/public/vm_event.h         |  3 +--
 11 files changed, 41 insertions(+), 35 deletions(-)

diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index ab9a65fc14..fc3811ad0a 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -155,7 +155,7 @@
         add     x21, sp, #UREGS_CPSR
         mrs     x22, spsr_el2
         mrs     x23, esr_el2
-        stp     w22, w23, [x21]
+        stp     x22, x23, [x21]
 
         .endm
 
@@ -432,7 +432,7 @@ return_from_trap:
         msr     daifset, #IFLAGS___I_ /* Mask interrupts */
 
         ldr     x21, [sp, #UREGS_PC]            /* load ELR */
-        ldr     w22, [sp, #UREGS_CPSR]          /* load SPSR */
+        ldr     x22, [sp, #UREGS_CPSR]          /* load SPSR */
 
         pop     x0, x1
         pop     x2, x3
diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
index babfc1d884..9113a15c7a 100644
--- a/xen/arch/arm/arm64/traps.c
+++ b/xen/arch/arm/arm64/traps.c
@@ -36,7 +36,7 @@ void do_bad_mode(struct cpu_user_regs *regs, int reason)
     union hsr hsr = { .bits = regs->hsr };
 
     printk("Bad mode in %s handler detected\n", handler[reason]);
-    printk("ESR=0x%08"PRIx32":  EC=%"PRIx32", IL=%"PRIx32", ISS=%"PRIx32"\n",
+    printk("ESR=%#"PRIregister":  EC=%"PRIx32", IL=%"PRIx32", ISS=%"PRIx32"\n",
            hsr.bits, hsr.ec, hsr.len, hsr.iss);
 
     local_irq_disable();
diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index 41f18612c6..caf17174b8 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -368,7 +368,8 @@ void do_sysreg(struct cpu_user_regs *regs,
                      sysreg.op2,
                      sysreg.read ? "=>" : "<=",
                      sysreg.reg, regs->pc);
-            gdprintk(XENLOG_ERR, "unhandled 64-bit sysreg access %#x\n",
+            gdprintk(XENLOG_ERR,
+                     "unhandled 64-bit sysreg access %#"PRIregister"\n",
                      hsr.bits & HSR_SYSREG_REGS_MASK);
             inject_undef_exception(regs, hsr);
             return;
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index c021a03c61..74bdbb9082 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -845,7 +845,7 @@ static int is_guest_pv32_psr(uint32_t psr)
 
 
 #ifdef CONFIG_ARM_64
-static int is_guest_pv64_psr(uint32_t psr)
+static int is_guest_pv64_psr(uint64_t psr)
 {
     if ( psr & PSR_MODE_BIT )
         return 0;
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index e7384381cc..c8f9773566 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -546,7 +546,7 @@ void inject_undef64_exception(struct cpu_user_regs *regs, int instr_len)
         PSR_IRQ_MASK | PSR_DBG_MASK;
     regs->pc = handler;
 
-    WRITE_SYSREG32(esr.bits, ESR_EL1);
+    WRITE_SYSREG(esr.bits, ESR_EL1);
 }
 
 /* Inject an abort exception into a 64 bit guest */
@@ -580,7 +580,7 @@ static void inject_abt64_exception(struct cpu_user_regs *regs,
     regs->pc = handler;
 
     WRITE_SYSREG(addr, FAR_EL1);
-    WRITE_SYSREG32(esr.bits, ESR_EL1);
+    WRITE_SYSREG(esr.bits, ESR_EL1);
 }
 
 static void inject_dabt64_exception(struct cpu_user_regs *regs,
@@ -717,7 +717,7 @@ struct reg_ctxt {
     uint64_t vttbr_el2;
 };
 
-static const char *mode_string(uint32_t cpsr)
+static const char *mode_string(register_t cpsr)
 {
     uint32_t mode;
     static const char *mode_strings[] = {
@@ -756,14 +756,16 @@ static void show_registers_32(const struct cpu_user_regs *regs,
 #ifdef CONFIG_ARM_64
     BUG_ON( ! (regs->cpsr & PSR_MODE_BIT) );
     printk("PC:     %08"PRIx32"\n", regs->pc32);
+    printk("CPSR:   %016"PRIx64" MODE:%s\n", regs->cpsr,
+           mode_string(regs->cpsr));
 #else
     printk("PC:     %08"PRIx32, regs->pc);
     if ( !guest_mode )
         printk(" %pS", _p(regs->pc));
     printk("\n");
-#endif
     printk("CPSR:   %08"PRIx32" MODE:%s\n", regs->cpsr,
            mode_string(regs->cpsr));
+#endif
     printk("     R0: %08"PRIx32" R1: %08"PRIx32" R2: %08"PRIx32" R3: %08"PRIx32"\n",
            regs->r0, regs->r1, regs->r2, regs->r3);
     printk("     R4: %08"PRIx32" R5: %08"PRIx32" R6: %08"PRIx32" R7: %08"PRIx32"\n",
@@ -846,7 +848,7 @@ static void show_registers_64(const struct cpu_user_regs *regs,
     {
         printk("SP:     %016"PRIx64"\n", regs->sp);
     }
-    printk("CPSR:   %08"PRIx32" MODE:%s\n", regs->cpsr,
+    printk("CPSR:   %016"PRIx64" MODE:%s\n", regs->cpsr,
            mode_string(regs->cpsr));
     printk("     X0: %016"PRIx64"  X1: %016"PRIx64"  X2: %016"PRIx64"\n",
            regs->x0, regs->x1, regs->x2);
@@ -919,7 +921,7 @@ static void _show_registers(const struct cpu_user_regs *regs,
     printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
     printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
     printk("\n");
-    printk("   ESR_EL2: %08"PRIx32"\n", regs->hsr);
+    printk("   ESR_EL2: %"PRIregister"\n", regs->hsr);
     printk(" HPFAR_EL2: %"PRIregister"\n", READ_SYSREG(HPFAR_EL2));
 
 #ifdef CONFIG_ARM_32
@@ -1599,7 +1601,7 @@ static const unsigned short cc_map[16] = {
 
 int check_conditional_instr(struct cpu_user_regs *regs, const union hsr hsr)
 {
-    unsigned long cpsr, cpsr_cond;
+    register_t cpsr, cpsr_cond;
     int cond;
 
     /*
@@ -1661,7 +1663,7 @@ int check_conditional_instr(struct cpu_user_regs *regs, const union hsr hsr)
 
 void advance_pc(struct cpu_user_regs *regs, const union hsr hsr)
 {
-    unsigned long itbits, cond, cpsr = regs->cpsr;
+    register_t itbits, cond, cpsr = regs->cpsr;
     bool is_thumb = psr_mode_is_32bit(regs) && (cpsr & PSR_THUMB);
 
     if ( is_thumb && (cpsr & PSR_IT_MASK) )
@@ -2004,13 +2006,15 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
 
         break;
     default:
-        gprintk(XENLOG_WARNING, "Unsupported FSC: HSR=%#x DFSC=%#x\n",
+        gprintk(XENLOG_WARNING,
+                "Unsupported FSC: HSR=%#"PRIregister" DFSC=%#x\n",
                 hsr.bits, xabt.fsc);
     }
 
 inject_abt:
-    gdprintk(XENLOG_DEBUG, "HSR=0x%x pc=%#"PRIregister" gva=%#"PRIvaddr
-             " gpa=%#"PRIpaddr"\n", hsr.bits, regs->pc, gva, gpa);
+    gdprintk(XENLOG_DEBUG,
+             "HSR=%#"PRIregister" pc=%#"PRIregister" gva=%#"PRIvaddr" gpa=%#"PRIpaddr"\n",
+             hsr.bits, regs->pc, gva, gpa);
     if ( is_data )
         inject_dabt_exception(regs, gva, hsr.len);
     else
@@ -2204,7 +2208,7 @@ void do_trap_guest_sync(struct cpu_user_regs *regs)
 
     default:
         gprintk(XENLOG_WARNING,
-                "Unknown Guest Trap. HSR=0x%x EC=0x%x IL=%x Syndrome=0x%"PRIx32"\n",
+                "Unknown Guest Trap. HSR=%#"PRIregister" EC=0x%x IL=%x Syndrome=0x%"PRIx32"\n",
                 hsr.bits, hsr.ec, hsr.len, hsr.iss);
         inject_undef_exception(regs, hsr);
     }
@@ -2242,7 +2246,7 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
         break;
     }
     default:
-        printk("Hypervisor Trap. HSR=0x%x EC=0x%x IL=%x Syndrome=0x%"PRIx32"\n",
+        printk("Hypervisor Trap. HSR=%#"PRIregister" EC=0x%x IL=%x Syndrome=0x%"PRIx32"\n",
                hsr.bits, hsr.ec, hsr.len, hsr.iss);
         do_unexpected_trap("Hypervisor", regs);
     }
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 55351fc087..f0cdcc8a54 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -385,7 +385,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
                  "%s p15, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
                  cp32.read ? "mrc" : "mcr",
                  cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
-        gdprintk(XENLOG_ERR, "unhandled 32-bit CP15 access %#x\n",
+        gdprintk(XENLOG_ERR, "unhandled 32-bit CP15 access %#"PRIregister"\n",
                  hsr.bits & HSR_CP32_REGS_MASK);
         inject_undef_exception(regs, hsr);
         return;
@@ -454,7 +454,8 @@ void do_cp15_64(struct cpu_user_regs *regs, const union hsr hsr)
                      "%s p15, %d, r%d, r%d, cr%d @ 0x%"PRIregister"\n",
                      cp64.read ? "mrrc" : "mcrr",
                      cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs->pc);
-            gdprintk(XENLOG_ERR, "unhandled 64-bit CP15 access %#x\n",
+            gdprintk(XENLOG_ERR,
+                     "unhandled 64-bit CP15 access %#"PRIregister"\n",
                      hsr.bits & HSR_CP64_REGS_MASK);
             inject_undef_exception(regs, hsr);
             return;
@@ -585,7 +586,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
                  "%s p14, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
                   cp32.read ? "mrc" : "mcr",
                   cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
-        gdprintk(XENLOG_ERR, "unhandled 32-bit cp14 access %#x\n",
+        gdprintk(XENLOG_ERR, "unhandled 32-bit cp14 access %#"PRIregister"\n",
                  hsr.bits & HSR_CP32_REGS_MASK);
         inject_undef_exception(regs, hsr);
         return;
@@ -627,7 +628,7 @@ void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr)
              "%s p14, %d, r%d, r%d, cr%d @ 0x%"PRIregister"\n",
              cp64.read ? "mrrc" : "mcrr",
              cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs->pc);
-    gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 access %#x\n",
+    gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 access %#"PRIregister"\n",
              hsr.bits & HSR_CP64_REGS_MASK);
     inject_undef_exception(regs, hsr);
 }
@@ -658,7 +659,7 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
              "%s p14, %d, r%d, r%d, cr%d @ 0x%"PRIregister"\n",
              cp64.read ? "mrrc" : "mcrr",
              cp64.op1, cp64.reg1, cp64.reg2, cp64.crm, regs->pc);
-    gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 DBG access %#x\n",
+    gdprintk(XENLOG_ERR, "unhandled 64-bit CP14 DBG access %#"PRIregister"\n",
              hsr.bits & HSR_CP64_REGS_MASK);
 
     inject_undef_exception(regs, hsr);
@@ -692,7 +693,7 @@ void do_cp10(struct cpu_user_regs *regs, const union hsr hsr)
                  "%s p10, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
                  cp32.read ? "mrc" : "mcr",
                  cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
-        gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#x\n",
+        gdprintk(XENLOG_ERR, "unhandled 32-bit CP10 access %#"PRIregister"\n",
                  hsr.bits & HSR_CP32_REGS_MASK);
         inject_undef_exception(regs, hsr);
         return;
diff --git a/xen/include/asm-arm/arm64/processor.h b/xen/include/asm-arm/arm64/processor.h
index 81dfc5e615..0e86079cbb 100644
--- a/xen/include/asm-arm/arm64/processor.h
+++ b/xen/include/asm-arm/arm64/processor.h
@@ -63,18 +63,19 @@ struct cpu_user_regs
 
     /* Return address and mode */
     __DECL_REG(pc,           pc32);             /* ELR_EL2 */
-    uint32_t cpsr;                              /* SPSR_EL2 */
-    uint32_t hsr;                               /* ESR_EL2 */
+    uint64_t cpsr;                              /* SPSR_EL2 */
+    uint64_t hsr;                               /* ESR_EL2 */
+
+    /* Offset of spsr_el1 must be a multiple of 8 */
+    uint64_t pad0;
 
     /* Outer guest frame only from here on... */
 
     union {
-        uint32_t spsr_el1;       /* AArch64 */
+        uint64_t spsr_el1;       /* AArch64 */
         uint32_t spsr_svc;       /* AArch32 */
     };
 
-    uint32_t pad1; /* Doubleword-align the user half of the frame */
-
     /* AArch32 guests only */
     uint32_t spsr_fiq, spsr_irq, spsr_und, spsr_abt;
 
diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h
index 29d4531f40..9b91b28c48 100644
--- a/xen/include/asm-arm/hsr.h
+++ b/xen/include/asm-arm/hsr.h
@@ -16,7 +16,7 @@ enum dabt_size {
 };
 
 union hsr {
-    uint32_t bits;
+    register_t bits;
     struct {
         unsigned long iss:25;  /* Instruction Specific Syndrome */
         unsigned long len:1;   /* Instruction length */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index 713fd65317..64a2ca30da 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -267,10 +267,10 @@ struct vcpu_guest_core_regs
 
     /* Return address and mode */
     __DECL_REG(pc64,         pc32);             /* ELR_EL2 */
-    uint32_t cpsr;                              /* SPSR_EL2 */
+    uint64_t cpsr;                              /* SPSR_EL2 */
 
     union {
-        uint32_t spsr_el1;       /* AArch64 */
+        uint64_t spsr_el1;       /* AArch64 */
         uint32_t spsr_svc;       /* AArch32 */
     };
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 4dbf107785..d576bfabd6 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -38,7 +38,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000013
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
index 36135ba4f1..bb003d21d0 100644
--- a/xen/include/public/vm_event.h
+++ b/xen/include/public/vm_event.h
@@ -266,8 +266,7 @@ struct vm_event_regs_arm {
     uint64_t ttbr1;
     uint64_t ttbcr;
     uint64_t pc;
-    uint32_t cpsr;
-    uint32_t _pad;
+    uint64_t cpsr;
 };
 
 /*
-- 
2.29.0


