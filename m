Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC801A46DF6
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 22:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897276.1305977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnPL8-0001FY-12; Wed, 26 Feb 2025 21:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897276.1305977; Wed, 26 Feb 2025 21:53:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnPL7-0001Ct-Ud; Wed, 26 Feb 2025 21:53:13 +0000
Received: by outflank-mailman (input) for mailman id 897276;
 Wed, 26 Feb 2025 21:53:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Soix=VR=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tnPL6-0001Cn-7k
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 21:53:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 10a9b7ce-f48c-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 22:53:08 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F771150C;
 Wed, 26 Feb 2025 13:53:24 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E9093F5A1;
 Wed, 26 Feb 2025 13:53:07 -0800 (PST)
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
X-Inumbo-ID: 10a9b7ce-f48c-11ef-9aae-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3] xen/arm: Don't use copy_from_paddr for DTB relocation
Date: Wed, 26 Feb 2025 21:52:56 +0000
Message-Id: <20250226215256.2713698-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the early stage of the Arm boot maps the DTB using
early_fdt_map() using PAGE_HYPERVISOR_RO which is cacheable
read-only memory, later during DTB relocation the function
copy_from_paddr() is used to map pages in the same range on
the fixmap but using PAGE_HYPERVISOR_WC which is non-cacheable
read-write memory.

The Arm specifications, ARM DDI0487L.a, section B2.11 "Mismatched
memory attributes" discourage using mismatched attributes for
aliases of the same location.

Given that there is nothing preventing the relocation since the region
is already mapped, fix that by open-coding copy_from_paddr inside
relocate_fdt, without mapping on the fixmap.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v2:
 - fixed pointer issue for dtb_vaddr.
---
 xen/arch/arm/setup.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c1f2d1b89d43..ffcae900d72e 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -237,16 +237,17 @@ void __init discard_initial_modules(void)
 }
 
 /* Relocate the FDT in Xen heap */
-static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
+static void __init relocate_fdt(const void **dtb_vaddr, size_t dtb_size)
 {
     void *fdt = xmalloc_bytes(dtb_size);
 
     if ( !fdt )
         panic("Unable to allocate memory for relocating the Device-Tree.\n");
 
-    copy_from_paddr(fdt, dtb_paddr, dtb_size);
+    memcpy(fdt, *dtb_vaddr, dtb_size);
+    clean_dcache_va_range(fdt, dtb_size);
 
-    return fdt;
+    *dtb_vaddr = fdt;
 }
 
 void __init init_pdx(void)
@@ -362,7 +363,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
     if ( acpi_disabled )
     {
         printk("Booting using Device Tree\n");
-        device_tree_flattened = relocate_fdt(fdt_paddr, fdt_size);
+        relocate_fdt(&device_tree_flattened, fdt_size);
         dt_unflatten_host_device_tree();
     }
     else
-- 
2.34.1


