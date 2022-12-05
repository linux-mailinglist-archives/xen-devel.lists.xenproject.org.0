Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DB16421B9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 03:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453113.710796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p21gR-0000pz-7K; Mon, 05 Dec 2022 02:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453113.710796; Mon, 05 Dec 2022 02:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p21gR-0000m9-4I; Mon, 05 Dec 2022 02:58:19 +0000
Received: by outflank-mailman (input) for mailman id 453113;
 Mon, 05 Dec 2022 02:58:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IUlJ=4D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p21gP-0008OK-34
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 02:58:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a9ece343-7448-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 03:58:15 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11F8C23A;
 Sun,  4 Dec 2022 18:58:22 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49FD33F73D;
 Sun,  4 Dec 2022 18:58:13 -0800 (PST)
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
X-Inumbo-ID: a9ece343-7448-11ed-8fd2-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/3] xen/arm: Extend the memory overlap check to include EfiACPIReclaimMemory
Date: Mon,  5 Dec 2022 10:57:53 +0800
Message-Id: <20221205025753.2178965-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205025753.2178965-1-Henry.Wang@arm.com>
References: <20221205025753.2178965-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly as the static regions and boot modules, memory regions with
EfiACPIReclaimMemory type (defined in bootinfo.acpi if CONFIG_ACPI is
enabled) should also not be overlapping with memory regions in
bootinfo.reserved_mem and bootinfo.modules.

Therefore, this commit further extends the check in function
`check_reserved_regions_overlap()` to include memory regions in
bootinfo.acpi, and use the extended `check_reserved_regions_overlap()`
in `meminfo_add_bank()` defined in `efi-boot.h` to return early if any
error occurs.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/efi/efi-boot.h | 10 ++++++++--
 xen/arch/arm/setup.c        | 20 ++++++++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 43a836c3a7..6121ba1f2f 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -161,13 +161,19 @@ static bool __init meminfo_add_bank(struct meminfo *mem,
                                     EFI_MEMORY_DESCRIPTOR *desc)
 {
     struct membank *bank;
+    paddr_t start = desc->PhysicalStart;
+    paddr_t size = desc->NumberOfPages * EFI_PAGE_SIZE;
 
     if ( mem->nr_banks >= NR_MEM_BANKS )
         return false;
+#ifdef CONFIG_ACPI
+    if ( check_reserved_regions_overlap(start, size) )
+        return false;
+#endif
 
     bank = &mem->bank[mem->nr_banks];
-    bank->start = desc->PhysicalStart;
-    bank->size = desc->NumberOfPages * EFI_PAGE_SIZE;
+    bank->start = start;
+    bank->size = size;
 
     mem->nr_banks++;
 
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index b43c8e118a..f2c2a3b6df 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -287,6 +287,13 @@ static int __init overlap_check(void *bootinfo_type,
         num = bootinfo.modules.nr_mods;
         type_str = "bootmodules";
     }
+#ifdef CONFIG_ACPI
+    else if ( bootinfo_type == &bootinfo.acpi )
+    {
+        num = bootinfo.acpi.nr_banks;
+        type_str = "EfiACPIReclaimMemory";
+    }
+#endif
     else
         panic("Invalid bootinfo type passed to overlap check\n");
 
@@ -302,6 +309,13 @@ static int __init overlap_check(void *bootinfo_type,
             bank_start = bootinfo.modules.module[i].start;
             bank_end = bank_start + bootinfo.modules.module[i].size;
         }
+#ifdef CONFIG_ACPI
+        else if ( bootinfo_type == &bootinfo.acpi )
+        {
+            bank_start = bootinfo.acpi.bank[i].start;
+            bank_end = bank_start + bootinfo.acpi.bank[i].size;
+        }
+#endif
 
         if ( region_end <= bank_start || region_start >= bank_end )
             continue;
@@ -345,6 +359,12 @@ int __init check_reserved_regions_overlap(paddr_t region_start,
     if ( overlap_check(&bootinfo.modules, region_start, region_end) )
         return -EINVAL;
 
+#ifdef CONFIG_ACPI
+    /* Check if input region is overlapping with ACPI EfiACPIReclaimMemory */
+    if ( overlap_check(&bootinfo.acpi, region_start, region_end) )
+        return -EINVAL;
+#endif
+
     return 0;
 }
 
-- 
2.25.1


