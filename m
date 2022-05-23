Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4A75315CB
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 21:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336060.560321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntE0m-0000mc-0b; Mon, 23 May 2022 19:46:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336060.560321; Mon, 23 May 2022 19:46:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntE0l-0000jw-SA; Mon, 23 May 2022 19:46:39 +0000
Received: by outflank-mailman (input) for mailman id 336060;
 Mon, 23 May 2022 19:46:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntE0k-0000jq-D5
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 19:46:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntE0k-00077F-0d; Mon, 23 May 2022 19:46:38 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntE0j-0007yJ-Ob; Mon, 23 May 2022 19:46:37 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=rjASqJUHRe0yAa+O5gTpo5HUVHFXyOJL+EcFbD9hG5M=; b=l/5uqy
	CvDDAnvApNCvjgAFcbXvVZDfXUI0okKqWj04ApfusK/GS6naW1oMl/rsw4TyefjAWGhwGvI3nYQKl
	2IV4R8QNbnFZhbpDOZg8FK57bqpjVn79SkzH363ob8nIeAMuzhyTkja0R/BdKY4u9NGarqfOnwzww
	re5pN/y93uY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: setup: nr_banks should be unsigned int
Date: Mon, 23 May 2022 20:46:31 +0100
Message-Id: <20220523194631.66262-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

It is not possible to have a negative number of banks. So switch
to unsigned int.

The type change is also propagated to any users of nr_banks that
were using "int" (there are not that many).

Note that fdt_num_mem_rsv() can actually returns a negative value
in case of an error. So the return should be checked before assigning
the result to an unsigned variable.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/domain_build.c      |  9 +++++----
 xen/arch/arm/efi/efi-dom0.c      |  4 ++--
 xen/arch/arm/include/asm/setup.h |  6 +++---
 xen/arch/arm/setup.c             | 17 +++++++++++++----
 4 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index aa777741bdd0..6ecb6673a3cd 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -111,7 +111,8 @@ static bool __init insert_11_bank(struct domain *d,
                                   struct page_info *pg,
                                   unsigned int order)
 {
-    int res, i;
+    unsigned int i;
+    int res;
     mfn_t smfn;
     paddr_t start, size;
 
@@ -264,7 +265,7 @@ static void __init allocate_memory_11(struct domain *d,
     const unsigned int min_order = get_order_from_bytes(MB(4));
     struct page_info *pg;
     unsigned int order = get_allocation_size(kinfo->unassigned_mem);
-    int i;
+    unsigned int i;
 
     bool lowmem = true;
     unsigned int lowmem_bitsize = min(32U, arch_get_dma_bitsize());
@@ -1022,8 +1023,8 @@ static int __init make_memory_node(const struct domain *d,
                                    int addrcells, int sizecells,
                                    struct meminfo *mem)
 {
-    int res, i;
-    int reg_size = addrcells + sizecells;
+    unsigned int i;
+    int res, reg_size = addrcells + sizecells;
     int nr_cells = 0;
     /* Placeholder for memory@ + a 64-bit number + \0 */
     char buf[24];
diff --git a/xen/arch/arm/efi/efi-dom0.c b/xen/arch/arm/efi/efi-dom0.c
index 494420eaa23e..aae0f979112a 100644
--- a/xen/arch/arm/efi/efi-dom0.c
+++ b/xen/arch/arm/efi/efi-dom0.c
@@ -34,14 +34,14 @@
 /* Constant to indicate "Xen" in unicode u16 format */
 static const CHAR16 xen_efi_fw_vendor[] = {0x0058, 0x0065, 0x006E, 0x0000};
 
-size_t __init estimate_efi_size(int mem_nr_banks)
+size_t __init estimate_efi_size(unsigned int mem_nr_banks)
 {
     size_t size;
     size_t est_size = sizeof(EFI_SYSTEM_TABLE);
     size_t ect_size = sizeof(EFI_CONFIGURATION_TABLE);
     size_t emd_size = sizeof(EFI_MEMORY_DESCRIPTOR);
     size_t fw_vendor_size = sizeof(xen_efi_fw_vendor);
-    int acpi_mem_nr_banks = 0;
+    unsigned int acpi_mem_nr_banks = 0;
 
     if ( !acpi_disabled )
         acpi_mem_nr_banks = bootinfo.acpi.nr_banks;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 7a1e1d67989c..2bb01ecfa88f 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -30,7 +30,7 @@ struct membank {
 };
 
 struct meminfo {
-    int nr_banks;
+    unsigned int nr_banks;
     struct membank bank[NR_MEM_BANKS];
 };
 
@@ -93,7 +93,7 @@ extern domid_t max_init_domid;
 
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
-size_t estimate_efi_size(int mem_nr_banks);
+size_t estimate_efi_size(unsigned int mem_nr_banks);
 
 void acpi_create_efi_system_table(struct domain *d,
                                   struct membank tbl_add[]);
@@ -109,7 +109,7 @@ void create_dom0(void);
 
 void discard_initial_modules(void);
 void fw_unreserved_regions(paddr_t s, paddr_t e,
-                           void (*cb)(paddr_t, paddr_t), int first);
+                           void (*cb)(paddr_t, paddr_t), unsigned int first);
 
 size_t boot_fdt_info(const void *fdt, paddr_t paddr);
 const char *boot_fdt_cmdline(const void *fdt);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index db1768c03f03..b30bccbaa7df 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -201,9 +201,17 @@ static void __init processor_id(void)
 
 static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
                                          void (*cb)(paddr_t, paddr_t),
-                                         int first)
+                                         unsigned int first)
 {
-    int i, nr = fdt_num_mem_rsv(device_tree_flattened);
+    unsigned int i, nr;
+    int rc;
+
+    rc = fdt_num_mem_rsv(device_tree_flattened);
+    if ( rc < 0 )
+        panic("Unable to retrieve the number of reserved regions (rc=%d)\n",
+              rc);
+
+    nr = rc;
 
     for ( i = first; i < nr ; i++ )
     {
@@ -249,7 +257,8 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
 }
 
 void __init fw_unreserved_regions(paddr_t s, paddr_t e,
-                                  void (*cb)(paddr_t, paddr_t), int first)
+                                  void (*cb)(paddr_t, paddr_t),
+                                  unsigned int first)
 {
     if ( acpi_disabled )
         dt_unreserved_regions(s, e, cb, first);
@@ -693,7 +702,7 @@ static void __init setup_mm(void)
     paddr_t ram_start, ram_end, ram_size, e;
     unsigned long ram_pages;
     unsigned long heap_pages, xenheap_pages, domheap_pages;
-    int i;
+    unsigned int i;
     const uint32_t ctr = READ_CP32(CTR);
 
     if ( !bootinfo.mem.nr_banks )
-- 
2.32.0


