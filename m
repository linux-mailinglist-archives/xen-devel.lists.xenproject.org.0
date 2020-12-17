Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C33D62DD461
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 16:42:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55980.97679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQJ-0004IL-Oh; Thu, 17 Dec 2020 15:42:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55980.97679; Thu, 17 Dec 2020 15:42:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpvQJ-0004Hd-LT; Thu, 17 Dec 2020 15:42:35 +0000
Received: by outflank-mailman (input) for mailman id 55980;
 Thu, 17 Dec 2020 15:42:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xKjN=FV=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kpvQI-0004GE-0U
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 15:42:34 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4bb17f7e-4ed5-4095-8d4e-a9faba7f8de8;
 Thu, 17 Dec 2020 15:42:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16B8430E;
 Thu, 17 Dec 2020 07:42:33 -0800 (PST)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 377B63F66B;
 Thu, 17 Dec 2020 07:42:32 -0800 (PST)
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
X-Inumbo-ID: 4bb17f7e-4ed5-4095-8d4e-a9faba7f8de8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 2/8] xen/arm: Add ID registers and complete cpuinfo
Date: Thu, 17 Dec 2020 15:38:02 +0000
Message-Id: <31d3537b11ba1a7531f1e3a38ba3b1e694a1224b.1608214355.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
References: <cover.1608214355.git.bertrand.marquis@arm.com>

Add definition and entries in cpuinfo for ID registers introduced in
newer Arm Architecture reference manual:
- ID_PFR2: processor feature register 2
- ID_DFR1: debug feature register 1
- ID_MMFR4 and ID_MMFR5: Memory model feature registers 4 and 5
- ID_ISA6: ISA Feature register 6
Add more bitfield definitions in PFR fields of cpuinfo.
Add MVFR2 register definition for aarch32.
Add MVFRx_EL1 defines for aarch32.
Add mvfr values in cpuinfo.
Add some registers definition for arm64 in sysregs as some are not
always know by compilers.
Initialize the new values added in cpuinfo in identify_cpu during init.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

---
Changes in V2:
  Fix dbg32 table size and add proper initialisation of the second entry
  of the table by reading ID_DFR1 register.
Changes in V3:
  Fix typo in commit title
  Add MVFR2 definition and handling on aarch32 and remove specific case
  for mvfr field in cpuinfo (now the same on arm64 and arm32).
  Add MMFR4 definition if not known by the compiler.
Changes in V4:
  Add MVFRx_EL1 defines for aarch32
  Use READ_SYSREG instead of 32/64 versions of the function which
  removed the ifdef case for MVFR access.
  User register_t type for mvfr and zfr64 fields of cpuinfo structure.

---
 xen/arch/arm/cpufeature.c           | 12 +++++++
 xen/include/asm-arm/arm64/sysregs.h | 28 +++++++++++++++
 xen/include/asm-arm/cpregs.h        | 15 ++++++++
 xen/include/asm-arm/cpufeature.h    | 56 ++++++++++++++++++++++++-----
 4 files changed, 102 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 115e1b164d..86b99ee960 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -114,15 +114,20 @@ void identify_cpu(struct cpuinfo_arm *c)
 
         c->mm64.bits[0]  = READ_SYSREG(ID_AA64MMFR0_EL1);
         c->mm64.bits[1]  = READ_SYSREG(ID_AA64MMFR1_EL1);
+        c->mm64.bits[2]  = READ_SYSREG(ID_AA64MMFR2_EL1);
 
         c->isa64.bits[0] = READ_SYSREG(ID_AA64ISAR0_EL1);
         c->isa64.bits[1] = READ_SYSREG(ID_AA64ISAR1_EL1);
+
+        c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
 #endif
 
         c->pfr32.bits[0] = READ_SYSREG(ID_PFR0_EL1);
         c->pfr32.bits[1] = READ_SYSREG(ID_PFR1_EL1);
+        c->pfr32.bits[2] = READ_SYSREG(ID_PFR2_EL1);
 
         c->dbg32.bits[0] = READ_SYSREG(ID_DFR0_EL1);
+        c->dbg32.bits[1] = READ_SYSREG(ID_DFR1_EL1);
 
         c->aux32.bits[0] = READ_SYSREG(ID_AFR0_EL1);
 
@@ -130,6 +135,8 @@ void identify_cpu(struct cpuinfo_arm *c)
         c->mm32.bits[1]  = READ_SYSREG(ID_MMFR1_EL1);
         c->mm32.bits[2]  = READ_SYSREG(ID_MMFR2_EL1);
         c->mm32.bits[3]  = READ_SYSREG(ID_MMFR3_EL1);
+        c->mm32.bits[4]  = READ_SYSREG(ID_MMFR4_EL1);
+        c->mm32.bits[5]  = READ_SYSREG(ID_MMFR5_EL1);
 
         c->isa32.bits[0] = READ_SYSREG(ID_ISAR0_EL1);
         c->isa32.bits[1] = READ_SYSREG(ID_ISAR1_EL1);
@@ -137,6 +144,11 @@ void identify_cpu(struct cpuinfo_arm *c)
         c->isa32.bits[3] = READ_SYSREG(ID_ISAR3_EL1);
         c->isa32.bits[4] = READ_SYSREG(ID_ISAR4_EL1);
         c->isa32.bits[5] = READ_SYSREG(ID_ISAR5_EL1);
+        c->isa32.bits[6] = READ_SYSREG(ID_ISAR6_EL1);
+
+        c->mvfr.bits[0] = READ_SYSREG(MVFR0_EL1);
+        c->mvfr.bits[1] = READ_SYSREG(MVFR1_EL1);
+        c->mvfr.bits[2] = READ_SYSREG(MVFR2_EL1);
 }
 
 /*
diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/arm64/sysregs.h
index c60029d38f..077fd95fb7 100644
--- a/xen/include/asm-arm/arm64/sysregs.h
+++ b/xen/include/asm-arm/arm64/sysregs.h
@@ -57,6 +57,34 @@
 #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
 #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
 
+/*
+ * Define ID coprocessor registers if they are not
+ * already defined by the compiler.
+ *
+ * Values picked from linux kernel
+ */
+#ifndef ID_AA64MMFR2_EL1
+#define ID_AA64MMFR2_EL1            S3_0_C0_C7_2
+#endif
+#ifndef ID_PFR2_EL1
+#define ID_PFR2_EL1                 S3_0_C0_C3_4
+#endif
+#ifndef ID_MMFR4_EL1
+#define ID_MMFR4_EL1                S3_0_C0_C2_6
+#endif
+#ifndef ID_MMFR5_EL1
+#define ID_MMFR5_EL1                S3_0_C0_C3_6
+#endif
+#ifndef ID_ISAR6_EL1
+#define ID_ISAR6_EL1                S3_0_C0_C2_7
+#endif
+#ifndef ID_AA64ZFR0_EL1
+#define ID_AA64ZFR0_EL1             S3_0_C0_C4_4
+#endif
+#ifndef ID_DFR1_EL1
+#define ID_DFR1_EL1                 S3_0_C0_C3_5
+#endif
+
 /* Access to system registers */
 
 #define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
diff --git a/xen/include/asm-arm/cpregs.h b/xen/include/asm-arm/cpregs.h
index 8fd344146e..6daf2b1a30 100644
--- a/xen/include/asm-arm/cpregs.h
+++ b/xen/include/asm-arm/cpregs.h
@@ -63,6 +63,8 @@
 #define FPSID           p10,7,c0,c0,0   /* Floating-Point System ID Register */
 #define FPSCR           p10,7,c1,c0,0   /* Floating-Point Status and Control Register */
 #define MVFR0           p10,7,c7,c0,0   /* Media and VFP Feature Register 0 */
+#define MVFR1           p10,7,c6,c0,0   /* Media and VFP Feature Register 1 */
+#define MVFR2           p10,7,c5,c0,0   /* Media and VFP Feature Register 2 */
 #define FPEXC           p10,7,c8,c0,0   /* Floating-Point Exception Control Register */
 #define FPINST          p10,7,c9,c0,0   /* Floating-Point Instruction Register */
 #define FPINST2         p10,7,c10,c0,0  /* Floating-point Instruction Register 2 */
@@ -108,18 +110,23 @@
 #define MPIDR           p15,0,c0,c0,5   /* Multiprocessor Affinity Register */
 #define ID_PFR0         p15,0,c0,c1,0   /* Processor Feature Register 0 */
 #define ID_PFR1         p15,0,c0,c1,1   /* Processor Feature Register 1 */
+#define ID_PFR2         p15,0,c0,c3,4   /* Processor Feature Register 2 */
 #define ID_DFR0         p15,0,c0,c1,2   /* Debug Feature Register 0 */
+#define ID_DFR1         p15,0,c0,c3,5   /* Debug Feature Register 1 */
 #define ID_AFR0         p15,0,c0,c1,3   /* Auxiliary Feature Register 0 */
 #define ID_MMFR0        p15,0,c0,c1,4   /* Memory Model Feature Register 0 */
 #define ID_MMFR1        p15,0,c0,c1,5   /* Memory Model Feature Register 1 */
 #define ID_MMFR2        p15,0,c0,c1,6   /* Memory Model Feature Register 2 */
 #define ID_MMFR3        p15,0,c0,c1,7   /* Memory Model Feature Register 3 */
+#define ID_MMFR4        p15,0,c0,c2,6   /* Memory Model Feature Register 4 */
+#define ID_MMFR5        p15,0,c0,c3,6   /* Memory Model Feature Register 5 */
 #define ID_ISAR0        p15,0,c0,c2,0   /* ISA Feature Register 0 */
 #define ID_ISAR1        p15,0,c0,c2,1   /* ISA Feature Register 1 */
 #define ID_ISAR2        p15,0,c0,c2,2   /* ISA Feature Register 2 */
 #define ID_ISAR3        p15,0,c0,c2,3   /* ISA Feature Register 3 */
 #define ID_ISAR4        p15,0,c0,c2,4   /* ISA Feature Register 4 */
 #define ID_ISAR5        p15,0,c0,c2,5   /* ISA Feature Register 5 */
+#define ID_ISAR6        p15,0,c0,c2,7   /* ISA Feature Register 6 */
 #define CCSIDR          p15,1,c0,c0,0   /* Cache Size ID Registers */
 #define CLIDR           p15,1,c0,c0,1   /* Cache Level ID Register */
 #define CSSELR          p15,2,c0,c0,0   /* Cache Size Selection Register */
@@ -312,18 +319,23 @@
 #define HSTR_EL2                HSTR
 #define ID_AFR0_EL1             ID_AFR0
 #define ID_DFR0_EL1             ID_DFR0
+#define ID_DFR1_EL1             ID_DFR1
 #define ID_ISAR0_EL1            ID_ISAR0
 #define ID_ISAR1_EL1            ID_ISAR1
 #define ID_ISAR2_EL1            ID_ISAR2
 #define ID_ISAR3_EL1            ID_ISAR3
 #define ID_ISAR4_EL1            ID_ISAR4
 #define ID_ISAR5_EL1            ID_ISAR5
+#define ID_ISAR6_EL1            ID_ISAR6
 #define ID_MMFR0_EL1            ID_MMFR0
 #define ID_MMFR1_EL1            ID_MMFR1
 #define ID_MMFR2_EL1            ID_MMFR2
 #define ID_MMFR3_EL1            ID_MMFR3
+#define ID_MMFR4_EL1            ID_MMFR4
+#define ID_MMFR5_EL1            ID_MMFR5
 #define ID_PFR0_EL1             ID_PFR0
 #define ID_PFR1_EL1             ID_PFR1
+#define ID_PFR2_EL1             ID_PFR2
 #define IFSR32_EL2              IFSR
 #define MDCR_EL2                HDCR
 #define MIDR_EL1                MIDR
@@ -347,6 +359,9 @@
 #define VPIDR_EL2               VPIDR
 #define VTCR_EL2                VTCR
 #define VTTBR_EL2               VTTBR
+#define MVFR0_EL1               MVFR0
+#define MVFR1_EL1               MVFR1
+#define MVFR2_EL1               MVFR2
 #endif
 
 #endif
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index c7b5052992..74139be1cc 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -148,6 +148,7 @@ struct cpuinfo_arm {
     union {
         uint64_t bits[2];
         struct {
+            /* PFR0 */
             unsigned long el0:4;
             unsigned long el1:4;
             unsigned long el2:4;
@@ -155,9 +156,23 @@ struct cpuinfo_arm {
             unsigned long fp:4;   /* Floating Point */
             unsigned long simd:4; /* Advanced SIMD */
             unsigned long gic:4;  /* GIC support */
-            unsigned long __res0:28;
+            unsigned long ras:4;
+            unsigned long sve:4;
+            unsigned long sel2:4;
+            unsigned long mpam:4;
+            unsigned long amu:4;
+            unsigned long dit:4;
+            unsigned long __res0:4;
             unsigned long csv2:4;
-            unsigned long __res1:4;
+            unsigned long cvs3:4;
+
+            /* PFR1 */
+            unsigned long bt:4;
+            unsigned long ssbs:4;
+            unsigned long mte:4;
+            unsigned long ras_frac:4;
+            unsigned long mpam_frac:4;
+            unsigned long __res1:44;
         };
     } pfr64;
 
@@ -170,7 +185,7 @@ struct cpuinfo_arm {
     } aux64;
 
     union {
-        uint64_t bits[2];
+        uint64_t bits[3];
         struct {
             unsigned long pa_range:4;
             unsigned long asid_bits:4;
@@ -190,6 +205,8 @@ struct cpuinfo_arm {
             unsigned long pan:4;
             unsigned long __res1:8;
             unsigned long __res2:32;
+
+            unsigned long __res3:64;
         };
     } mm64;
 
@@ -197,6 +214,10 @@ struct cpuinfo_arm {
         uint64_t bits[2];
     } isa64;
 
+    struct {
+        register_t bits[1];
+    } zfr64;
+
 #endif
 
     /*
@@ -204,25 +225,38 @@ struct cpuinfo_arm {
      * when running in 32-bit mode.
      */
     union {
-        uint32_t bits[2];
+        uint32_t bits[3];
         struct {
+            /* PFR0 */
             unsigned long arm:4;
             unsigned long thumb:4;
             unsigned long jazelle:4;
             unsigned long thumbee:4;
-            unsigned long __res0:16;
+            unsigned long csv2:4;
+            unsigned long amu:4;
+            unsigned long dit:4;
+            unsigned long ras:4;
 
+            /* PFR1 */
             unsigned long progmodel:4;
             unsigned long security:4;
             unsigned long mprofile:4;
             unsigned long virt:4;
             unsigned long gentimer:4;
-            unsigned long __res1:12;
+            unsigned long sec_frac:4;
+            unsigned long virt_frac:4;
+            unsigned long gic:4;
+
+            /* PFR2 */
+            unsigned long csv3:4;
+            unsigned long ssbs:4;
+            unsigned long ras_frac:4;
+            unsigned long __res2:20;
         };
     } pfr32;
 
     struct {
-        uint32_t bits[1];
+        uint32_t bits[2];
     } dbg32;
 
     struct {
@@ -230,12 +264,16 @@ struct cpuinfo_arm {
     } aux32;
 
     struct {
-        uint32_t bits[4];
+        uint32_t bits[6];
     } mm32;
 
     struct {
-        uint32_t bits[6];
+        uint32_t bits[7];
     } isa32;
+
+    struct {
+        register_t bits[3];
+    } mvfr;
 };
 
 extern struct cpuinfo_arm boot_cpu_data;
-- 
2.17.1


