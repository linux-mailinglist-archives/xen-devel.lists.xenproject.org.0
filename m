Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C39D21FE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 09:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839759.1255554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDK47-0005b9-0u; Tue, 19 Nov 2024 08:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839759.1255554; Tue, 19 Nov 2024 08:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDK46-0005TY-SK; Tue, 19 Nov 2024 08:58:30 +0000
Received: by outflank-mailman (input) for mailman id 839759;
 Tue, 19 Nov 2024 08:58:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5Q5=SO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tDK45-0005G2-6L
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 08:58:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 705d246b-a654-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 09:58:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B6D11E7D;
 Tue, 19 Nov 2024 00:58:56 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 498583F6A8;
 Tue, 19 Nov 2024 00:58:25 -0800 (PST)
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
X-Inumbo-ID: 705d246b-a654-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjcwNWQyNDZiLWE2NTQtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDA2NzA3LjA1MTI2LCJzZW5kZXIiOiJsdWNhLmZhbmNlbGx1QGFybS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/4] arm/setup: Move MMU specific extern declarations to mmu/setup.h
Date: Tue, 19 Nov 2024 08:58:04 +0000
Message-Id: <20241119085806.805142-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119085806.805142-1-luca.fancellu@arm.com>
References: <20241119085806.805142-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move some extern declarations related to MMU structures and define
from asm/setup.h to asm/mmu/setup.h, in order to increase encapsulation
and allow the MPU part to build, since it has no clue about them.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
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


