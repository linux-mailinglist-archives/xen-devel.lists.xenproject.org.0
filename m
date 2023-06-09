Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD8D729B39
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 15:14:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546044.852639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7bw2-0004Ko-Ee; Fri, 09 Jun 2023 13:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546044.852639; Fri, 09 Jun 2023 13:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7bw2-0004J8-Bj; Fri, 09 Jun 2023 13:13:46 +0000
Received: by outflank-mailman (input) for mailman id 546044;
 Fri, 09 Jun 2023 13:13:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=63PW=B5=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1q7bw0-0004J2-Ey
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 13:13:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7512cba6-06c7-11ee-b232-6b7b168915f2;
 Fri, 09 Jun 2023 15:13:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4331AB6;
 Fri,  9 Jun 2023 06:14:27 -0700 (PDT)
Received: from C3HXLD123V.arm.com (unknown [10.57.73.171])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 184F03F71E;
 Fri,  9 Jun 2023 06:13:40 -0700 (PDT)
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
X-Inumbo-ID: 7512cba6-06c7-11ee-b232-6b7b168915f2
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: rename guest_cpuinfo in domain_cpuinfo
Date: Fri,  9 Jun 2023 15:13:28 +0200
Message-Id: <7e18eceb2fb2f4cac991773a8697e9bf50b89aaf.1686316358.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the guest_cpuinfo structure to domain_cpuinfo as it is not only
used for guests but also for dom0 so domain is a more suitable name.

While there also rename the create_guest_cpuinfo function to
create_domain_cpuinfo to be coherent.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/arm64/vsysreg.c          |  6 ++--
 xen/arch/arm/cpufeature.c             | 40 +++++++++++++--------------
 xen/arch/arm/include/asm/cpufeature.h |  2 +-
 xen/arch/arm/vcpreg.c                 |  2 +-
 4 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index fe31f7b3827f..b5d54c569b33 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -76,7 +76,7 @@ TVM_REG(CONTEXTIDR_EL1)
     case HSR_SYSREG_##reg:                                              \
     {                                                                   \
         return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr,   \
-                                  1, guest_cpuinfo.field.bits[offset]); \
+                                  1, domain_cpuinfo.field.bits[offset]); \
     }
 
 void do_sysreg(struct cpu_user_regs *regs,
@@ -300,7 +300,7 @@ void do_sysreg(struct cpu_user_regs *regs,
 
     case HSR_SYSREG_ID_AA64PFR0_EL1:
     {
-        register_t guest_reg_value = guest_cpuinfo.pfr64.bits[0];
+        register_t guest_reg_value = domain_cpuinfo.pfr64.bits[0];
 
         if ( is_sve_domain(v->domain) )
         {
@@ -336,7 +336,7 @@ void do_sysreg(struct cpu_user_regs *regs,
          * When the guest has the SVE feature enabled, the whole id_aa64zfr0_el1
          * needs to be exposed.
          */
-        register_t guest_reg_value = guest_cpuinfo.zfr64.bits[0];
+        register_t guest_reg_value = domain_cpuinfo.zfr64.bits[0];
 
         if ( is_sve_domain(v->domain) )
             guest_reg_value = system_cpuinfo.zfr64.bits[0];
diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index b53e1a977601..5f4644865505 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -14,7 +14,7 @@
 
 DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
 
-struct cpuinfo_arm __read_mostly guest_cpuinfo;
+struct cpuinfo_arm __read_mostly domain_cpuinfo;
 
 #ifdef CONFIG_ARM_64
 static bool has_sb_instruction(const struct arm_cpu_capabilities *entry)
@@ -191,45 +191,45 @@ void identify_cpu(struct cpuinfo_arm *c)
 /*
  * This function is creating a cpuinfo structure with values modified to mask
  * all cpu features that should not be published to guest.
- * The created structure is then used to provide ID registers values to guests.
+ * The created structure is then used to provide ID registers values to domains.
  */
-static int __init create_guest_cpuinfo(void)
+static int __init create_domain_cpuinfo(void)
 {
     /* Use the sanitized cpuinfo as initial guest cpuinfo */
-    guest_cpuinfo = system_cpuinfo;
+    domain_cpuinfo = system_cpuinfo;
 
 #ifdef CONFIG_ARM_64
     /* Hide MPAM support as xen does not support it */
-    guest_cpuinfo.pfr64.mpam = 0;
-    guest_cpuinfo.pfr64.mpam_frac = 0;
+    domain_cpuinfo.pfr64.mpam = 0;
+    domain_cpuinfo.pfr64.mpam_frac = 0;
 
     /* Hide SVE by default */
-    guest_cpuinfo.pfr64.sve = 0;
-    guest_cpuinfo.zfr64.bits[0] = 0;
+    domain_cpuinfo.pfr64.sve = 0;
+    domain_cpuinfo.zfr64.bits[0] = 0;
 
     /* Hide MTE support as Xen does not support it */
-    guest_cpuinfo.pfr64.mte = 0;
+    domain_cpuinfo.pfr64.mte = 0;
 
     /* Hide PAC support as Xen does not support it */
-    guest_cpuinfo.isa64.apa = 0;
-    guest_cpuinfo.isa64.api = 0;
-    guest_cpuinfo.isa64.gpa = 0;
-    guest_cpuinfo.isa64.gpi = 0;
+    domain_cpuinfo.isa64.apa = 0;
+    domain_cpuinfo.isa64.api = 0;
+    domain_cpuinfo.isa64.gpa = 0;
+    domain_cpuinfo.isa64.gpi = 0;
 #endif
 
     /* Hide AMU support */
 #ifdef CONFIG_ARM_64
-    guest_cpuinfo.pfr64.amu = 0;
+    domain_cpuinfo.pfr64.amu = 0;
 #endif
-    guest_cpuinfo.pfr32.amu = 0;
+    domain_cpuinfo.pfr32.amu = 0;
 
     /* Hide RAS support as Xen does not support it */
 #ifdef CONFIG_ARM_64
-    guest_cpuinfo.pfr64.ras = 0;
-    guest_cpuinfo.pfr64.ras_frac = 0;
+    domain_cpuinfo.pfr64.ras = 0;
+    domain_cpuinfo.pfr64.ras_frac = 0;
 #endif
-    guest_cpuinfo.pfr32.ras = 0;
-    guest_cpuinfo.pfr32.ras_frac = 0;
+    domain_cpuinfo.pfr32.ras = 0;
+    domain_cpuinfo.pfr32.ras_frac = 0;
 
     return 0;
 }
@@ -237,7 +237,7 @@ static int __init create_guest_cpuinfo(void)
  * This function needs to be run after all smp are started to have
  * cpuinfo structures for all cores.
  */
-__initcall(create_guest_cpuinfo);
+__initcall(create_domain_cpuinfo);
 
 /*
  * Local variables:
diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
index 03fe684b4d36..894f278a4a5a 100644
--- a/xen/arch/arm/include/asm/cpufeature.h
+++ b/xen/arch/arm/include/asm/cpufeature.h
@@ -461,7 +461,7 @@ static inline void update_system_features(const struct cpuinfo_arm *cpuinfo)
 extern struct cpuinfo_arm cpu_data[];
 #define current_cpu_data cpu_data[smp_processor_id()]
 
-extern struct cpuinfo_arm guest_cpuinfo;
+extern struct cpuinfo_arm domain_cpuinfo;
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 4adfc0a68d0e..39aeda9dab62 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -169,7 +169,7 @@ TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
     case HSR_CPREG32(reg):                                          \
     {                                                               \
         return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,  \
-                                  guest_cpuinfo.field.bits[offset]);\
+                                  domain_cpuinfo.field.bits[offset]);\
     }
 
 /* helper to define cases for all registers for one CRm value */
-- 
2.39.2 (Apple Git-143)


