Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 044739E1838
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:48:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847711.1262791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPW8-00016u-I9; Tue, 03 Dec 2024 09:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847711.1262791; Tue, 03 Dec 2024 09:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPW8-00014O-EA; Tue, 03 Dec 2024 09:48:28 +0000
Received: by outflank-mailman (input) for mailman id 847711;
 Tue, 03 Dec 2024 09:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaGl=S4=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tIPW6-0000ZC-QG
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:48:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id bd469e41-b15b-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 10:48:25 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A13741BF3;
 Tue,  3 Dec 2024 01:48:52 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 592C23F58B;
 Tue,  3 Dec 2024 01:48:23 -0800 (PST)
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
X-Inumbo-ID: bd469e41-b15b-11ef-99a3-01e77a169b0f
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 2/5] arm/setup: Move MMU specific extern declarations to mmu/setup.h
Date: Tue,  3 Dec 2024 09:48:07 +0000
Message-Id: <20241203094811.427076-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203094811.427076-1-luca.fancellu@arm.com>
References: <20241203094811.427076-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move some extern declarations related to MMU structures and define
from asm/setup.h to asm/mmu/setup.h, in order to increase encapsulation
and allow the MPU part to build, since it has no clue about them.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
CHanges from v3:
 - add Ack-by Julien
Changes from v1:
 - Moved extern to mmu/setup.h instead of mmu/mm.h
 - moved also pte_of_xenaddr()
---
---
 xen/arch/arm/include/asm/mmu/setup.h | 31 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/setup.h     | 20 ++++++------------
 2 files changed, 37 insertions(+), 14 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mmu/setup.h

diff --git a/xen/arch/arm/include/asm/mmu/setup.h b/xen/arch/arm/include/asm/mmu/setup.h
new file mode 100644
index 000000000000..3fe752b04c63
--- /dev/null
+++ b/xen/arch/arm/include/asm/mmu/setup.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __ARM_MMU_SETUP_H__
+#define __ARM_MMU_SETUP_H__
+
+#include <asm/lpae.h>
+#include <asm/mmu/layout.h>
+
+extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];
+
+#ifdef CONFIG_ARM_64
+extern lpae_t boot_first[XEN_PT_LPAE_ENTRIES];
+extern lpae_t boot_first_id[XEN_PT_LPAE_ENTRIES];
+#endif
+extern lpae_t boot_second[XEN_PT_LPAE_ENTRIES];
+extern lpae_t boot_second_id[XEN_PT_LPAE_ENTRIES];
+extern lpae_t boot_third[XEN_PT_LPAE_ENTRIES * XEN_NR_ENTRIES(2)];
+extern lpae_t boot_third_id[XEN_PT_LPAE_ENTRIES];
+
+/* Find where Xen will be residing at runtime and return a PT entry */
+lpae_t pte_of_xenaddr(vaddr_t va);
+
+#endif /* __ARM_MMU_SETUP_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 64c227d171fc..a5a80d9b477f 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -6,6 +6,12 @@
 #include <xen/bootfdt.h>
 #include <xen/device_tree.h>
 
+#if defined(CONFIG_MMU)
+# include <asm/mmu/setup.h>
+#elif !defined(CONFIG_MPU)
+# error "Unknown memory management layout"
+#endif
+
 #define MAX_FDT_SIZE SZ_2M
 
 struct map_range_data
@@ -65,20 +71,6 @@ int map_irq_to_domain(struct domain *d, unsigned int irq,
 int map_range_to_domain(const struct dt_device_node *dev,
                         uint64_t addr, uint64_t len, void *data);
 
-extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];
-
-#ifdef CONFIG_ARM_64
-extern lpae_t boot_first[XEN_PT_LPAE_ENTRIES];
-extern lpae_t boot_first_id[XEN_PT_LPAE_ENTRIES];
-#endif
-extern lpae_t boot_second[XEN_PT_LPAE_ENTRIES];
-extern lpae_t boot_second_id[XEN_PT_LPAE_ENTRIES];
-extern lpae_t boot_third[XEN_PT_LPAE_ENTRIES * XEN_NR_ENTRIES(2)];
-extern lpae_t boot_third_id[XEN_PT_LPAE_ENTRIES];
-
-/* Find where Xen will be residing at runtime and return a PT entry */
-lpae_t pte_of_xenaddr(vaddr_t va);
-
 extern const char __ro_after_init_start[], __ro_after_init_end[];
 
 struct init_info
-- 
2.34.1


