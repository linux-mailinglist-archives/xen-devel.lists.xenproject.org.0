Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07DA649BDD
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459401.717179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsU-0007bo-Pe; Mon, 12 Dec 2022 10:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459401.717179; Mon, 12 Dec 2022 10:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsU-0007Rh-2I; Mon, 12 Dec 2022 10:17:42 +0000
Received: by outflank-mailman (input) for mailman id 459401;
 Mon, 12 Dec 2022 10:17:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fsQ-0006gW-0G
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 10:17:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fsP-0002CZ-Mz; Mon, 12 Dec 2022 10:17:37 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fXE-0001lz-1b; Mon, 12 Dec 2022 09:55:44 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=kKtmvZ+dAOm56S9vF3D9UCPp5WHtNoGUd6OZqQ013iM=; b=IILTbgmoqQNl4DJ4ZqEspkuR70
	IsHgglGpJyab13+5kWwDpqzCIxMgEebpiKZzNPGRNbg4/4XP+FiVSyFU320jnBlnEWUo/3HyofoHq
	wBOrlAv00Sx9nkiirsnPRNTn8vhS1zncwVXfitQ/TxDSIiiOqwlm2kYersNSk+LRhIro=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 15/18] xen/arm64: mm: Introduce helpers to prepare/enable/disable the identity mapping
Date: Mon, 12 Dec 2022 09:55:20 +0000
Message-Id: <20221212095523.52683-16-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212095523.52683-1-julien@xen.org>
References: <20221212095523.52683-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

In follow-up patches we will need to have part of Xen identity mapped in
order to safely switch the TTBR.

On some platform, the identity mapping may have to start at 0. If we always
keep the identity region mapped, NULL pointer dereference would lead to
access to valid mapping.

It would be possible to relocate Xen to avoid clashing with address 0.
However the identity mapping is only meant to be used in very limited
places. Therefore it would be better to keep the identity region invalid
for most of the time.

Two new external helpers are introduced:
    - arch_setup_page_tables() will setup the page-tables so it is
      easy to create the mapping afterwards.
    - update_identity_mapping() will create/remove the identity mapping

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Remove the arm32 part
        - Use a different logic for the boot page tables and runtime
          one because Xen may be running in a different place.
---
 xen/arch/arm/arm64/Makefile         |   1 +
 xen/arch/arm/arm64/mm.c             | 121 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/mm.h |   4 +
 xen/arch/arm/include/asm/arm64/mm.h |  12 +++
 xen/arch/arm/include/asm/setup.h    |  11 +++
 xen/arch/arm/mm.c                   |   6 +-
 6 files changed, 153 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mm.c

diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 6d507da0d44d..28481393e98f 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -10,6 +10,7 @@ obj-y += entry.o
 obj-y += head.o
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
+obj-y += mm.o
 obj-y += smc.o
 obj-y += smpboot.o
 obj-y += traps.o
diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
new file mode 100644
index 000000000000..9eaf545ea9dd
--- /dev/null
+++ b/xen/arch/arm/arm64/mm.c
@@ -0,0 +1,121 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <xen/init.h>
+#include <xen/mm.h>
+
+#include <asm/setup.h>
+
+/* Override macros from asm/page.h to make them work with mfn_t */
+#undef virt_to_mfn
+#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
+
+static DEFINE_PAGE_TABLE(xen_first_id);
+static DEFINE_PAGE_TABLE(xen_second_id);
+static DEFINE_PAGE_TABLE(xen_third_id);
+
+/*
+ * The identity mapping may start at physical address 0. So we don't want
+ * to keep it mapped longer than necessary.
+ *
+ * When this is called, we are still using the boot_pgtable.
+ *
+ * We need to prepare the identity mapping for both the boot page tables
+ * and runtime page tables.
+ *
+ * The logic to create the entry is slightly different because Xen may
+ * be running at a different location at runtime.
+ */
+static void __init prepare_boot_identity_mapping(void)
+{
+    paddr_t id_addr = virt_to_maddr(_start);
+    lpae_t pte;
+    DECLARE_OFFSETS(id_offsets, id_addr);
+
+    if ( id_offsets[0] != 0 )
+        panic("Cannot handled ID mapping above 512GB\n");
+
+    /* Link first ID table */
+    pte = mfn_to_xen_entry(virt_to_mfn(boot_first_id), MT_NORMAL);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+
+    write_pte(&boot_pgtable[id_offsets[0]], pte);
+
+    /* Link second ID table */
+    pte = mfn_to_xen_entry(virt_to_mfn(boot_second_id), MT_NORMAL);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+
+    write_pte(&boot_first_id[id_offsets[1]], pte);
+
+    /* Link third ID table */
+    pte = mfn_to_xen_entry(virt_to_mfn(boot_third_id), MT_NORMAL);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+
+    write_pte(&boot_second_id[id_offsets[2]], pte);
+
+    /* The mapping in the third table will be created at a later stage */
+}
+
+static void __init prepare_runtime_identity_mapping(void)
+{
+    paddr_t id_addr = virt_to_maddr(_start);
+    lpae_t pte;
+    DECLARE_OFFSETS(id_offsets, id_addr);
+
+    if ( id_offsets[0] != 0 )
+        panic("Cannot handled ID mapping above 512GB\n");
+
+    /* Link first ID table */
+    pte = pte_of_xenaddr((vaddr_t)xen_first_id);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+
+    write_pte(&xen_pgtable[id_offsets[0]], pte);
+
+    /* Link second ID table */
+    pte = pte_of_xenaddr((vaddr_t)xen_second_id);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+
+    write_pte(&xen_first_id[id_offsets[1]], pte);
+
+    /* Link third ID table */
+    pte = pte_of_xenaddr((vaddr_t)xen_third_id);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+
+    write_pte(&xen_second_id[id_offsets[2]], pte);
+
+    /* The mapping in the third table will be created at a later stage */
+}
+
+void __init arch_setup_page_tables(void)
+{
+    prepare_boot_identity_mapping();
+    prepare_runtime_identity_mapping();
+}
+
+void update_identity_mapping(bool enable)
+{
+    paddr_t id_addr = virt_to_maddr(_start);
+    int rc;
+
+    if ( enable )
+        rc = map_pages_to_xen(id_addr, maddr_to_mfn(id_addr), 1,
+                              PAGE_HYPERVISOR_RX);
+    else
+        rc = destroy_xen_mappings(id_addr, id_addr + PAGE_SIZE);
+
+    BUG_ON(rc);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
index 8bfc906e7178..856f2dbec4ad 100644
--- a/xen/arch/arm/include/asm/arm32/mm.h
+++ b/xen/arch/arm/include/asm/arm32/mm.h
@@ -18,6 +18,10 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 
 bool init_domheap_mappings(unsigned int cpu);
 
+static inline void arch_setup_page_tables(void)
+{
+}
+
 #endif /* __ARM_ARM32_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
index aa2adac63189..807d3b2321fd 100644
--- a/xen/arch/arm/include/asm/arm64/mm.h
+++ b/xen/arch/arm/include/asm/arm64/mm.h
@@ -1,6 +1,8 @@
 #ifndef __ARM_ARM64_MM_H__
 #define __ARM_ARM64_MM_H__
 
+extern DEFINE_PAGE_TABLE(xen_pgtable);
+
 /*
  * On ARM64, all the RAM is currently direct mapped in Xen.
  * Hence return always true.
@@ -10,6 +12,16 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return true;
 }
 
+void arch_setup_page_tables(void);
+
+/*
+ * Enable/disable the identity mapping
+ *
+ * Note that nested a call (e.g. enable=true, enable=true) is not
+ * supported.
+ */
+void update_identity_mapping(bool enable);
+
 #endif /* __ARM_ARM64_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index fdbf68aadcaa..e7a80fecec14 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -168,6 +168,17 @@ int map_range_to_domain(const struct dt_device_node *dev,
 
 extern const char __ro_after_init_start[], __ro_after_init_end[];
 
+extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
+
+#ifdef CONFIG_ARM_64
+extern DEFINE_BOOT_PAGE_TABLE(boot_first_id);
+#endif
+extern DEFINE_BOOT_PAGE_TABLE(boot_second_id);
+extern DEFINE_BOOT_PAGE_TABLE(boot_third_id);
+
+/* Find where Xen will be residing at runtime and return an PT entry */
+lpae_t pte_of_xenaddr(vaddr_t);
+
 #endif
 /*
  * Local variables:
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0cf7ad4f0e8c..39e0d9e03c9c 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -93,7 +93,7 @@ DEFINE_BOOT_PAGE_TABLE(boot_third);
 
 #ifdef CONFIG_ARM_64
 #define HYP_PT_ROOT_LEVEL 0
-static DEFINE_PAGE_TABLE(xen_pgtable);
+DEFINE_PAGE_TABLE(xen_pgtable);
 static DEFINE_PAGE_TABLE(xen_first);
 #define THIS_CPU_PGTABLE xen_pgtable
 #else
@@ -388,7 +388,7 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
         invalidate_icache();
 }
 
-static inline lpae_t pte_of_xenaddr(vaddr_t va)
+lpae_t pte_of_xenaddr(vaddr_t va)
 {
     paddr_t ma = va + phys_offset;
 
@@ -495,6 +495,8 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 
     phys_offset = boot_phys_offset;
 
+    arch_setup_page_tables();
+
 #ifdef CONFIG_ARM_64
     pte = pte_of_xenaddr((uintptr_t)xen_first);
     pte.pt.table = 1;
-- 
2.38.1


