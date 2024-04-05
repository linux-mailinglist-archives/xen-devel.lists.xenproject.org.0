Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F289A41A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 20:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701357.1095745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsoBH-0007DQ-Uc; Fri, 05 Apr 2024 18:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701357.1095745; Fri, 05 Apr 2024 18:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsoBH-00079t-Rt; Fri, 05 Apr 2024 18:20:51 +0000
Received: by outflank-mailman (input) for mailman id 701357;
 Fri, 05 Apr 2024 18:20:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+fY=LK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rsoBG-00077g-14
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 18:20:50 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38576c6a-f379-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 20:20:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 185DD82855AB;
 Fri,  5 Apr 2024 13:20:45 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WlUwro3q7qks; Fri,  5 Apr 2024 13:20:44 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F2CE98285607;
 Fri,  5 Apr 2024 13:20:43 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id oOiyGNosNpEl; Fri,  5 Apr 2024 13:20:43 -0500 (CDT)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 52C7782855AB;
 Fri,  5 Apr 2024 13:20:43 -0500 (CDT)
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
X-Inumbo-ID: 38576c6a-f379-11ee-a1ef-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com F2CE98285607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712341244; bh=CHdkWKhIxnJ7d1hR9BPeVfbie9iAebaLrDQcbBpsOlE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=GZcUJO7fs+j4dZZTgmY78Gg6Xo8uUHk6isc0q//becuyC9dpaqThh8iYpKdlvckxS
	 G4MjSRdJ4lrhwu2tLuMO/47ecedCJti5dpQs6deqeUaTLAk1uRhloqIZvAH2Ocv7MB
	 gGJ/zNY+uBNYYX8UnDho4zH3dGhvNl2YEQk2dJAw=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>
Subject: [PATCH] xen/acpi: Allow xen/acpi.h to be included on non-ACPI archs
Date: Fri,  5 Apr 2024 13:20:31 -0500
Message-Id: <20240405182031.396528-1-sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Conditionalize xen/acpi.h's inclusion of acpi/acpi.h and asm/acpi.h on
CONFIG_ACPI and import ARM's !CONFIG_ACPI stub for acpi_disabled() so
that the header can be included on architectures without ACPI support,
like ppc.

This change revealed some missing #includes across the ARM tree, so fix
those as well.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/arm/arm32/mmu/mm.c     | 1 +
 xen/arch/arm/arm64/smpboot.c    | 3 ++-
 xen/arch/arm/domain_build.c     | 1 -
 xen/arch/arm/gic-v2.c           | 1 -
 xen/arch/arm/gic-v3.c           | 2 --
 xen/arch/arm/include/asm/acpi.h | 1 -
 xen/arch/arm/mmu/setup.c        | 1 +
 xen/arch/arm/psci.c             | 1 +
 xen/arch/arm/smpboot.c          | 1 +
 xen/arch/arm/traps.c            | 3 ++-
 xen/common/sched/boot-cpupool.c | 2 +-
 xen/include/xen/acpi.h          | 8 ++++++--
 12 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index cb441ca87c..0ab6ae52a6 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -3,6 +3,7 @@
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/libfdt/libfdt-xen.h>
+#include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/pfn.h>
 #include <asm/fixmap.h>
diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
index bf81d018b3..a225fae64d 100644
--- a/xen/arch/arm/arm64/smpboot.c
+++ b/xen/arch/arm/arm64/smpboot.c
@@ -1,4 +1,6 @@
+#include <xen/acpi.h>
 #include <xen/cpu.h>
+#include <xen/device_tree.h>
 #include <xen/lib.h>
 #include <xen/init.h>
 #include <xen/errno.h>
@@ -7,7 +9,6 @@
 #include <xen/vmap.h>
 #include <asm/io.h>
 #include <asm/psci.h>
-#include <asm/acpi.h>
 
 struct smp_enable_ops {
         int             (*prepare_cpu)(int cpu);
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 085d88671e..54232ed4cb 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -18,7 +18,6 @@
 #include <xen/acpi.h>
 #include <xen/vmap.h>
 #include <xen/warning.h>
-#include <acpi/actables.h>
 #include <asm/device.h>
 #include <asm/kernel.h>
 #include <asm/setup.h>
diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
index 5d6885e389..02043c0d4b 100644
--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -22,7 +22,6 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/sizes.h>
 #include <xen/acpi.h>
-#include <acpi/actables.h>
 #include <asm/p2m.h>
 #include <asm/domain.h>
 #include <asm/platform.h>
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 1cb1360606..cd3e1acf79 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -25,8 +25,6 @@
 #include <xen/sched.h>
 #include <xen/sizes.h>
 
-#include <acpi/actables.h>
-
 #include <asm/cpufeature.h>
 #include <asm/device.h>
 #include <asm/gic.h>
diff --git a/xen/arch/arm/include/asm/acpi.h b/xen/arch/arm/include/asm/acpi.h
index e53973e054..13756dd341 100644
--- a/xen/arch/arm/include/asm/acpi.h
+++ b/xen/arch/arm/include/asm/acpi.h
@@ -74,7 +74,6 @@ static inline void enable_acpi(void)
     acpi_disabled = false;
 }
 #else
-#define acpi_disabled (true)
 #define disable_acpi()
 #define enable_acpi()
 #endif
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 57f1b46499..c0cb17ca2e 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -10,6 +10,7 @@
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
+#include <asm/setup.h>
 #include <asm/fixmap.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index 695d2fa1f1..b6860a7760 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -9,6 +9,7 @@
  */
 
 
+#include <xen/acpi.h>
 #include <xen/types.h>
 #include <xen/init.h>
 #include <xen/mm.h>
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index a84e706d77..6efed87678 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -7,6 +7,7 @@
  * Copyright (c) 2011 Citrix Systems.
  */
 
+#include <xen/acpi.h>
 #include <xen/cpu.h>
 #include <xen/cpumask.h>
 #include <xen/delay.h>
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 9cffe7f790..083157d6f2 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -7,6 +7,7 @@
  * Copyright (c) 2011 Citrix Systems.
  */
 
+#include <xen/acpi.h>
 #include <xen/domain_page.h>
 #include <xen/errno.h>
 #include <xen/hypercall.h>
@@ -30,7 +31,6 @@
 #include <public/sched.h>
 #include <public/xen.h>
 
-#include <asm/acpi.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
 #include <asm/event.h>
@@ -38,6 +38,7 @@
 #include <asm/mem_access.h>
 #include <asm/mmio.h>
 #include <asm/regs.h>
+#include <asm/setup.h>
 #include <asm/smccc.h>
 #include <asm/traps.h>
 #include <asm/vgic.h>
diff --git a/xen/common/sched/boot-cpupool.c b/xen/common/sched/boot-cpupool.c
index 5955e6f9a9..feeac3b704 100644
--- a/xen/common/sched/boot-cpupool.c
+++ b/xen/common/sched/boot-cpupool.c
@@ -7,8 +7,8 @@
  * Copyright (C) 2022 Arm Ltd.
  */
 
+#include <xen/acpi.h>
 #include <xen/sched.h>
-#include <asm/acpi.h>
 
 /*
  * pool_cpu_map:   Index is logical cpu number, content is cpupool id, (-1) for
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 6a2f5983fd..73ca4ad75c 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -37,10 +37,10 @@
 
 #ifndef __ASSEMBLY__
 
+#include <xen/errno.h>
 #include <xen/list.h>
 
-#include <acpi/acpi.h>
-#include <asm/acpi.h>
+#include <public/xen.h>
 
 #define ACPI_MADT_GET_(fld, x) (((x) & ACPI_MADT_##fld##_MASK) / \
 	(ACPI_MADT_##fld##_MASK & -ACPI_MADT_##fld##_MASK))
@@ -54,6 +54,9 @@
 
 #ifdef CONFIG_ACPI
 
+#include <acpi/acpi.h>
+#include <asm/acpi.h>
+
 extern acpi_physical_address rsdp_hint;
 
 extern bool opt_acpi_verbose;
@@ -118,6 +121,7 @@ extern u32 pci_mmcfg_base_addr;
 #else	/*!CONFIG_ACPI*/
 
 #define acpi_mp_config	0
+#define acpi_disabled (true)
 
 static inline int acpi_boot_init(void)
 {
-- 
2.30.2


