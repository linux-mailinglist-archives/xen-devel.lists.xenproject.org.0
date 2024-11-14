Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F6C9C8784
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 11:28:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836238.1252122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBX5H-00069q-Va; Thu, 14 Nov 2024 10:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836238.1252122; Thu, 14 Nov 2024 10:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBX5H-00068B-S2; Thu, 14 Nov 2024 10:28:19 +0000
Received: by outflank-mailman (input) for mailman id 836238;
 Thu, 14 Nov 2024 10:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vGyf=SJ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tBX5G-000685-1d
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 10:28:18 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2704c49c-a273-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 11:28:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A85EC1480;
 Thu, 14 Nov 2024 02:28:42 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A7F063F6A8;
 Thu, 14 Nov 2024 02:28:11 -0800 (PST)
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
X-Inumbo-ID: 2704c49c-a273-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjI3MDRjNDljLWEyNzMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTgwMDkzLjc5MzkxNCwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Grygorii Strashko <grygorii_strashko@epam.com>
Subject: [PATCH v2] xen/device-tree: Allow region overlapping with /memreserve/ ranges
Date: Thu, 14 Nov 2024 10:28:02 +0000
Message-Id: <20241114102802.54512-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some cases where the device tree exposes a memory range
in both /memreserve/ and reserved-memory node, in this case the
current code will stop Xen to boot since it will find that the
latter range is clashing with the already recorded /memreserve/
ranges.

Furthermore, u-boot lists boot modules ranges, such as ramdisk,
in the /memreserve/ part and even in this case this will prevent
Xen to boot since it will see that the module memory range that
it is going to add in 'add_boot_module' clashes with a /memreserve/
range.

When Xen populate the data structure that tracks the memory ranges,
it also adds a memory type described in 'enum membank_type', so
in order to fix this behavior, allow overlapping with the /memreserve/
ranges in the 'check_reserved_regions_overlap' function when a flag
is set.

In order to implement this solution, there is a distinction between
the 'struct membanks *' handled by meminfo_overlap_check(...) that
needs to be done, because the static shared memory banks doesn't have
a usable bank[].type field and so it can't be accessed, hence now
the 'struct membanks_hdr' have a 'enum region_type type' field in order
to be able to identify static shared memory banks in meminfo_overlap_check(...).

While there, set a type for the memory recorded using meminfo_add_bank()
from efi-boot.h.

Fixes: 53dc37829c31 ("xen/arm: Add DT reserve map regions to bootinfo.reserved_mem")
Reported-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Reported-by: Grygorii Strashko <grygorii_strashko@epam.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v1:
 - fixed commit message
 - used boolean to allow /memreserve/ overlap or not
 - now 'struct membanks *' have a type, while it might seem a waste of space,
   it might be used in the future to consolidate also the 'struct bootmodules'
   and 'struct bootcmdlines' to use the same 'struct membanks *' interface.
   Also the added space is limited to 3/4 enum size.
 - The change above allowed this version to remove the "hack" when dealing with
   static shared memory banks, that doesn't have a type.

I tested this patch adding the same range in a /memreserve/ entry and
/reserved-memory node, and by letting u-boot pass a ramdisk.
I've also tested that a configuration running static shared memory still works
fine.
---
---
 xen/arch/arm/efi/efi-boot.h       |  3 ++-
 xen/arch/arm/static-shmem.c       |  2 +-
 xen/common/device-tree/bootfdt.c  |  9 ++++++-
 xen/common/device-tree/bootinfo.c | 39 +++++++++++++++++++++++--------
 xen/include/xen/bootfdt.h         | 20 +++++++++++++---
 5 files changed, 57 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 199f5260229d..a80a5a7ab326 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -167,13 +167,14 @@ static bool __init meminfo_add_bank(struct membanks *mem,
     if ( mem->nr_banks >= mem->max_banks )
         return false;
 #ifdef CONFIG_ACPI
-    if ( check_reserved_regions_overlap(start, size) )
+    if ( check_reserved_regions_overlap(start, size, false) )
         return false;
 #endif
 
     bank = &mem->bank[mem->nr_banks];
     bank->start = start;
     bank->size = size;
+    bank->type = MEMBANK_DEFAULT;
 
     mem->nr_banks++;
 
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index aa80756c3ca5..66088a426785 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -696,7 +696,7 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
         if (i < mem->max_banks)
         {
             if ( (paddr != INVALID_PADDR) &&
-                 check_reserved_regions_overlap(paddr, size) )
+                 check_reserved_regions_overlap(paddr, size, false) )
                 return -EINVAL;
 
             /* Static shared memory shall be reserved from any other use. */
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 927f59c64b0d..241810212c02 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -176,8 +176,15 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     for ( i = 0; i < banks && mem->nr_banks < mem->max_banks; i++ )
     {
         device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
+        /*
+         * Some valid device trees, such as those generated by OpenPOWER
+         * skiboot firmware, expose all reserved memory regions in the
+         * FDT memory reservation block AND in the reserved-memory node which
+         * has already been parsed. Thus, any matching overlaps in the
+         * reserved_mem banks should be ignored.
+         */
         if ( mem == bootinfo_get_reserved_mem() &&
-             check_reserved_regions_overlap(start, size) )
+             check_reserved_regions_overlap(start, size, true) )
             return -EINVAL;
         /* Some DT may describe empty bank, ignore them */
         if ( !size )
diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
index f2e6a1145b7c..b36b05fd9224 100644
--- a/xen/common/device-tree/bootinfo.c
+++ b/xen/common/device-tree/bootinfo.c
@@ -99,7 +99,8 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
  */
 static bool __init meminfo_overlap_check(const struct membanks *mem,
                                          paddr_t region_start,
-                                         paddr_t region_size)
+                                         paddr_t region_size,
+                                         bool allow_memreserve_overlap)
 {
     paddr_t bank_start = INVALID_PADDR, bank_end = 0;
     paddr_t region_end = region_start + region_size;
@@ -113,12 +114,23 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
         if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
              region_start >= bank_end )
             continue;
-        else
-        {
-            printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
-                   region_start, region_end, i, bank_start, bank_end);
-            return true;
-        }
+
+        /*
+         * If allow_memreserve_overlap is set, this check allows a region to be
+         * included in a MEMBANK_FDT_RESVMEM bank, but struct membanks *mem of
+         * type STATIC_SHARED_MEMORY don't set the bank[].type field because
+         * that is declared in a union with a field that is instead used,
+         * in any case this restriction is ok since STATIC_SHARED_MEMORY banks
+         * are not meant to clash with FDT /memreserve/ ranges.
+         */
+        if ( allow_memreserve_overlap && mem->type != STATIC_SHARED_MEMORY &&
+             region_start >= bank_start && region_end <= bank_end &&
+             mem->bank[i].type == MEMBANK_FDT_RESVMEM )
+            continue;
+
+        printk("Region: [%#"PRIpaddr", %#"PRIpaddr") overlapping with bank[%u]: [%#"PRIpaddr", %#"PRIpaddr")\n",
+                region_start, region_end, i, bank_start, bank_end);
+        return true;
     }
 
     return false;
@@ -171,7 +183,8 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
  * existing reserved memory regions, otherwise false.
  */
 bool __init check_reserved_regions_overlap(paddr_t region_start,
-                                           paddr_t region_size)
+                                           paddr_t region_size,
+                                           bool allow_memreserve_overlap)
 {
     const struct membanks *mem_banks[] = {
         bootinfo_get_reserved_mem(),
@@ -190,7 +203,8 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
      * shared memory banks (when static shared memory feature is enabled)
      */
     for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
-        if ( meminfo_overlap_check(mem_banks[i], region_start, region_size) )
+        if ( meminfo_overlap_check(mem_banks[i], region_start, region_size,
+                                   allow_memreserve_overlap) )
             return true;
 
     /* Check if input region is overlapping with bootmodules */
@@ -216,7 +230,12 @@ struct bootmodule __init *add_boot_module(bootmodule_kind kind,
         return NULL;
     }
 
-    if ( check_reserved_regions_overlap(start, size) )
+    /*
+     * u-boot adds boot module such as ramdisk to the /memreserve/, since these
+     * ranges are saved in reserved_mem at this stage, allow an eventual exact
+     * match with MEMBANK_FDT_RESVMEM banks.
+     */
+    if ( check_reserved_regions_overlap(start, size, true) )
         return NULL;
 
     for ( i = 0 ; i < mods->nr_mods ; i++ )
diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 16fa05f38f38..cea40ee11706 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -48,6 +48,12 @@ enum membank_type {
     MEMBANK_FDT_RESVMEM,
 };
 
+enum region_type {
+    MEMORY,
+    RESERVED_MEMORY,
+    STATIC_SHARED_MEMORY
+};
+
 /* Indicates the maximum number of characters(\0 included) for shm_id */
 #define MAX_SHM_ID_LENGTH 16
 
@@ -71,6 +77,7 @@ struct membanks {
     __struct_group(membanks_hdr, common, ,
         unsigned int nr_banks;
         unsigned int max_banks;
+        enum region_type type;
     );
     struct membank bank[];
 };
@@ -136,13 +143,17 @@ struct bootinfo {
 };
 
 #ifdef CONFIG_ACPI
-#define BOOTINFO_ACPI_INIT .acpi.common.max_banks = NR_MEM_BANKS,
+#define BOOTINFO_ACPI_INIT                          \
+    .acpi.common.max_banks = NR_MEM_BANKS,          \
+    .acpi.common.type = MEMORY
 #else
 #define BOOTINFO_ACPI_INIT
 #endif
 
 #ifdef CONFIG_STATIC_SHM
-#define BOOTINFO_SHMEM_INIT .shmem.common.max_banks = NR_SHMEM_BANKS,
+#define BOOTINFO_SHMEM_INIT                         \
+    .shmem.common.max_banks = NR_SHMEM_BANKS,       \
+    .shmem.common.type = STATIC_SHARED_MEMORY
 #else
 #define BOOTINFO_SHMEM_INIT
 #endif
@@ -150,7 +161,9 @@ struct bootinfo {
 #define BOOTINFO_INIT                               \
 {                                                   \
     .mem.common.max_banks = NR_MEM_BANKS,           \
+    .mem.common.type = MEMORY,                      \
     .reserved_mem.common.max_banks = NR_MEM_BANKS,  \
+    .reserved_mem.common.type = RESERVED_MEMORY,    \
     BOOTINFO_ACPI_INIT                              \
     BOOTINFO_SHMEM_INIT                             \
 }
@@ -158,7 +171,8 @@ struct bootinfo {
 extern struct bootinfo bootinfo;
 
 bool check_reserved_regions_overlap(paddr_t region_start,
-                                    paddr_t region_size);
+                                    paddr_t region_size,
+                                    bool allow_memreserve_overlap);
 
 struct bootmodule *add_boot_module(bootmodule_kind kind,
                                    paddr_t start, paddr_t size, bool domU);
-- 
2.34.1


