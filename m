Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DAA64C2B0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 04:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461578.719708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5IGj-0006Nl-Ow; Wed, 14 Dec 2022 03:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461578.719708; Wed, 14 Dec 2022 03:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5IGj-0006KN-Ky; Wed, 14 Dec 2022 03:17:17 +0000
Received: by outflank-mailman (input) for mailman id 461578;
 Wed, 14 Dec 2022 03:17:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LNGa=4M=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p5IGh-0005ka-Qf
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 03:17:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id cea565f4-7b5d-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 04:17:15 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E46EFFEC;
 Tue, 13 Dec 2022 19:17:54 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 41B633F73B;
 Tue, 13 Dec 2022 19:17:12 -0800 (PST)
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
X-Inumbo-ID: cea565f4-7b5d-11ed-8fd2-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/3] xen/arm: Extend the memory overlap check to include EfiACPIReclaimMemory
Date: Wed, 14 Dec 2022 11:16:54 +0800
Message-Id: <20221214031654.2815589-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214031654.2815589-1-Henry.Wang@arm.com>
References: <20221214031654.2815589-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly as the static regions and boot modules, memory regions with
EfiACPIReclaimMemory type (defined in bootinfo.acpi if CONFIG_ACPI is
enabled) should also not be overlapping with memory regions in
bootinfo.reserved_mem and bootinfo.modules.

Therefore, this commit reuses the `meminfo_overlap_check()` to further
extends the check in function `check_reserved_regions_overlap()` so that
memory regions in bootinfo.acpi are included. If any error occurs in the
extended `check_reserved_regions_overlap()`, the `meminfo_add_bank()`
defined in `efi-boot.h` will return early.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v1 -> v2:
1. Rebase on top of patch #1 and #2.
---
 xen/arch/arm/efi/efi-boot.h | 10 ++++++++--
 xen/arch/arm/setup.c        |  6 ++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

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
index ba0152f868..a0cb2dd588 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -342,6 +342,12 @@ int __init check_reserved_regions_overlap(paddr_t region_start,
                                    region_start, region_end) )
         return -EINVAL;
 
+#ifdef CONFIG_ACPI
+    /* Check if input region is overlapping with ACPI EfiACPIReclaimMemory */
+    if ( meminfo_overlap_check(&bootinfo.acpi, region_start, region_end) )
+        return -EINVAL;
+#endif
+
     return 0;
 }
 
-- 
2.25.1


