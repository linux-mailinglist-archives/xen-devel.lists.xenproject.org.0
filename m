Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3A9596D1D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Aug 2022 12:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388858.625625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOGk1-0004d9-Em; Wed, 17 Aug 2022 10:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388858.625625; Wed, 17 Aug 2022 10:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOGk1-0004bM-BS; Wed, 17 Aug 2022 10:57:41 +0000
Received: by outflank-mailman (input) for mailman id 388858;
 Wed, 17 Aug 2022 10:57:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mz1p=YV=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oOGjz-0004av-Nw
 for xen-devel@lists.xenproject.org; Wed, 17 Aug 2022 10:57:39 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67ba5d79-1e1b-11ed-9250-1f966e50362f;
 Wed, 17 Aug 2022 12:57:38 +0200 (CEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 ch17-20020a17090af41100b001fa74771f61so3333586pjb.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Aug 2022 03:57:38 -0700 (PDT)
Received: from leoy-yangtze.lan
 (ec2-54-176-161-147.us-west-1.compute.amazonaws.com. [54.176.161.147])
 by smtp.gmail.com with ESMTPSA id
 ij28-20020a170902ab5c00b0016a111c83cdsm1164248plb.119.2022.08.17.03.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 03:57:35 -0700 (PDT)
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
X-Inumbo-ID: 67ba5d79-1e1b-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=iyFlyIEZzyGszhkX6cDJ5x7yOjHB+/uaApdjgt6qyBc=;
        b=A5W/kIck/q95G8s9pcKlL2h6dqQrQj8czaf/GI4dQNcz9a8PGP1PCAtdZVOBKFyexF
         MMzEZgUxw4YsJBFpJRuKtEu4eBrM7emXDhYjsvd/EwDF6mK/mPb/uc/3+TSKxprBxFGc
         TPhkHZ0HugLfov13e2MwZFsVrBucgEoUahLDQdD67odvNaQM3UkTy165bvYfoGGi1gze
         yG4XZ56uvi7/R9luoffAcoYes3kdUmJzsmjg8vH+z8iHP6HtowYytNwnSOsE6LDQDvig
         12qW34rXTuPohqVHLbQuY6lqFydfWRuoT5TyyAbeucGp+LmqDiw/Ore4+8tRVS2mdRty
         6i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=iyFlyIEZzyGszhkX6cDJ5x7yOjHB+/uaApdjgt6qyBc=;
        b=YZ+D2SVj0ebdU5rh3J3kVV4Q3tCO/2oxraGOkGoR8Y+TwCgRMSmBjuQyAfnlKfTivI
         vz4htOhvP9fFpr3q5b4cZFQ5H1YrjkazlE+fTMzGMvlvVz+QN2xdHURD6mY1uTNimcUU
         CO7v4LZOz+y35bLT8QLcNTGfT2mA6LrbfLvNzBa+ggvRozG7RpS0t31t/GN9McfAfZ+i
         PoGZiHxk0v2nIB0JqBgNTmM2IO6PXvH5yBvC+yJZ+SxpwTwcrl2MOqC86aZ1jAfNfity
         phQSaTH+8UrnzCxQ5LMPkysrEVKyeCsbgWWETvZOoPECTrQahucY071k79erGC4yw/IL
         9wAg==
X-Gm-Message-State: ACgBeo0zzj+pwrgNFaQoLdRP1YmcLasUkTIuNZZ4JJe6McDXRBc4Tu92
	ui9uqRoqI5n1Mju265eqg680mbXOsfprhdJSUm0=
X-Google-Smtp-Source: AA6agR404OeS+yKSxudPdUa4xDiEAx0ufReFbfysECjChFZb2Br3qm89fw9U1TQZ/ePT7GDE3Hjyag==
X-Received: by 2002:a17:902:da92:b0:16e:f2ee:b98a with SMTP id j18-20020a170902da9200b0016ef2eeb98amr26018534plx.154.1660733856331;
        Wed, 17 Aug 2022 03:57:36 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <jgrall@amazon.com>
Cc: Leo Yan <leo.yan@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH] xen/arm: acpi: Support memory reserve configuration table
Date: Wed, 17 Aug 2022 18:57:20 +0800
Message-Id: <20220817105720.111618-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Arm64, when boot Dom0 with the Linux kernel, it reports the warning:

[    0.403737] ------------[ cut here ]------------
[    0.403738] WARNING: CPU: 30 PID: 0 at drivers/irqchip/irq-gic-v3-its.c:3074 its_cpu_init+0x814/0xae0
[    0.403745] Modules linked in:
[    0.403748] CPU: 30 PID: 0 Comm: swapper/30 Tainted: G        W         5.15.23-ampere-lts-standard #1
[    0.403752] pstate: 600001c5 (nZCv dAIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.403755] pc : its_cpu_init+0x814/0xae0
[    0.403758] lr : its_cpu_init+0x810/0xae0
[    0.403761] sp : ffff800009c03ce0
[    0.403762] x29: ffff800009c03ce0 x28: 000000000000001e x27: ffff880711f43000
[    0.403767] x26: ffff80000a3c0070 x25: fffffc1ffe0a4400 x24: ffff80000a3c0000
[    0.403770] x23: ffff8000095bc998 x22: ffff8000090a6000 x21: ffff800009850cb0
[    0.403774] x20: ffff800009701a10 x19: ffff800009701000 x18: ffffffffffffffff
[    0.403777] x17: 3030303035303031 x16: 3030313030303078 x15: 303a30206e6f6967
[    0.403780] x14: 6572206530312072 x13: 3030303030353030 x12: 3130303130303030
[    0.403784] x11: 78303a30206e6f69 x10: 6765722065303120 x9 : ffff80000870e710
[    0.403788] x8 : 6964657220646e75 x7 : 0000000000000003 x6 : 0000000000000000
[    0.403791] x5 : 0000000000000000 x4 : fffffc0000000000 x3 : 0000000000000010
[    0.403794] x2 : 000000000000ffff x1 : 0000000000010000 x0 : 00000000ffffffed
[    0.403798] Call trace:
[    0.403799]  its_cpu_init+0x814/0xae0
[    0.403802]  gic_starting_cpu+0x48/0x90
[    0.403805]  cpuhp_invoke_callback+0x16c/0x5b0
[    0.403808]  cpuhp_invoke_callback_range+0x78/0xf0
[    0.403811]  notify_cpu_starting+0xbc/0xdc
[    0.403814]  secondary_start_kernel+0xe0/0x170
[    0.403817]  __secondary_switched+0x94/0x98
[    0.403821] ---[ end trace f68728a0d3053b70 ]---

In the Linux kernel, the GIC driver tries to reserve ITS interrupt
table, and the reserved pages can survive for kexec/kdump and will be
used for secondary kernel.  Linux kernel relies on MEMRESERVE EFI
configuration table for memory page , but this table is not supported
by Xen.

This patch adds a MEMRESERVE configuration table into the system table,
it points to a dummy data structure acpi_table_memreserve, this
structure has the consistent definition with the Linux kernel.
Following the method in Xen, it creates a table entry for the structure
acpi_table_memreserve.

Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 xen/arch/arm/acpi/domain_build.c | 24 ++++++++++++++++++++++++
 xen/arch/arm/efi/efi-dom0.c      | 19 ++++++++++++++++---
 xen/arch/arm/include/asm/acpi.h  |  1 +
 xen/include/acpi/actbl.h         | 17 +++++++++++++++++
 xen/include/efi/efiapi.h         |  2 ++
 5 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index bbdc90f92c..f7d1935f60 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -242,6 +242,26 @@ static int __init acpi_create_rsdp(struct domain *d, struct membank tbl_add[])
     return 0;
 }
 
+static int __init acpi_create_memreserve(struct domain *d, struct membank tbl_add[])
+{
+    struct acpi_table_memreserve *memreserve = NULL;
+    u64 table_size = sizeof(struct acpi_table_memreserve);
+    u8 *base_ptr;
+
+    base_ptr = d->arch.efi_acpi_table
+               + acpi_get_table_offset(tbl_add, TBL_MRSV);
+    memreserve = (struct acpi_table_memreserve *)base_ptr;
+
+    memreserve->next = 0;
+    memreserve->size = 0;
+    memreserve->count = 0;
+
+    tbl_add[TBL_MRSV].start = d->arch.efi_acpi_gpa
+                            + acpi_get_table_offset(tbl_add, TBL_MRSV);
+    tbl_add[TBL_MRSV].size = table_size;
+    return 0;
+}
+
 static void __init acpi_xsdt_modify_entry(u64 entry[],
                                           unsigned long entry_count,
                                           char *signature, u64 addr)
@@ -543,6 +563,10 @@ int __init prepare_acpi(struct domain *d, struct kernel_info *kinfo)
     if ( rc != 0 )
         return rc;
 
+    rc = acpi_create_memreserve(d, tbl_add);
+    if ( rc != 0 )
+        return rc;
+
     acpi_map_other_tables(d);
     acpi_create_efi_system_table(d, tbl_add);
     acpi_create_efi_mmap_table(d, &kinfo->mem, tbl_add);
diff --git a/xen/arch/arm/efi/efi-dom0.c b/xen/arch/arm/efi/efi-dom0.c
index aae0f97911..4950f9ac99 100644
--- a/xen/arch/arm/efi/efi-dom0.c
+++ b/xen/arch/arm/efi/efi-dom0.c
@@ -38,7 +38,7 @@ size_t __init estimate_efi_size(unsigned int mem_nr_banks)
 {
     size_t size;
     size_t est_size = sizeof(EFI_SYSTEM_TABLE);
-    size_t ect_size = sizeof(EFI_CONFIGURATION_TABLE);
+    size_t ect_size = sizeof(EFI_CONFIGURATION_TABLE) * 2;
     size_t emd_size = sizeof(EFI_MEMORY_DESCRIPTOR);
     size_t fw_vendor_size = sizeof(xen_efi_fw_vendor);
     unsigned int acpi_mem_nr_banks = 0;
@@ -63,7 +63,8 @@ void __init acpi_create_efi_system_table(struct domain *d,
 
     table_addr = d->arch.efi_acpi_gpa
                  + acpi_get_table_offset(tbl_add, TBL_EFIT);
-    table_size = sizeof(EFI_SYSTEM_TABLE) + sizeof(EFI_CONFIGURATION_TABLE)
+    table_size = sizeof(EFI_SYSTEM_TABLE)
+	         + sizeof(EFI_CONFIGURATION_TABLE) * 2
                  + sizeof(xen_efi_fw_vendor);
     base_ptr = d->arch.efi_acpi_table
                + acpi_get_table_offset(tbl_add, TBL_EFIT);
@@ -75,7 +76,7 @@ void __init acpi_create_efi_system_table(struct domain *d,
     efi_sys_tbl->Hdr.HeaderSize = table_size;
 
     efi_sys_tbl->FirmwareRevision = 1;
-    efi_sys_tbl->NumberOfTableEntries = 1;
+    efi_sys_tbl->NumberOfTableEntries = 2;
     offset += sizeof(EFI_SYSTEM_TABLE);
     memcpy(base_ptr + offset, xen_efi_fw_vendor, sizeof(xen_efi_fw_vendor));
     efi_sys_tbl->FirmwareVendor = (CHAR16 *)(table_addr + offset);
@@ -86,6 +87,18 @@ void __init acpi_create_efi_system_table(struct domain *d,
     efi_conf_tbl->VendorTable = (VOID *)tbl_add[TBL_RSDP].start;
     efi_sys_tbl->ConfigurationTable = (EFI_CONFIGURATION_TABLE *)(table_addr
                                                                   + offset);
+
+    /*
+     * Configuration table for MEMRESERVE is used in Linux kernel for
+     * reserving pages, its main purpose is used for kexec/kdump to
+     * reserve persistent pages (e.g. GIC pending pages) for the secondary
+     * kernel.
+     */
+    offset += sizeof(EFI_CONFIGURATION_TABLE);
+    efi_conf_tbl = (EFI_CONFIGURATION_TABLE *)(base_ptr + offset);
+    efi_conf_tbl->VendorGuid = (EFI_GUID)LINUX_EFI_MEMRESERVE_TABLE_GUID;
+    efi_conf_tbl->VendorTable = (VOID *)tbl_add[TBL_MRSV].start;
+
     xz_crc32_init();
     efi_sys_tbl->Hdr.CRC32 = xz_crc32((uint8_t *)efi_sys_tbl,
                                       efi_sys_tbl->Hdr.HeaderSize, 0);
diff --git a/xen/arch/arm/include/asm/acpi.h b/xen/arch/arm/include/asm/acpi.h
index e53973e054..a8c523e387 100644
--- a/xen/arch/arm/include/asm/acpi.h
+++ b/xen/arch/arm/include/asm/acpi.h
@@ -35,6 +35,7 @@ typedef enum {
     TBL_STAO,
     TBL_XSDT,
     TBL_RSDP,
+    TBL_MRSV,
     TBL_EFIT,
     TBL_MMAP,
     TBL_MMAX,
diff --git a/xen/include/acpi/actbl.h b/xen/include/acpi/actbl.h
index 3079176992..682b27f353 100644
--- a/xen/include/acpi/actbl.h
+++ b/xen/include/acpi/actbl.h
@@ -302,6 +302,23 @@ struct acpi_table_fadt {
 #define ACPI_FADT_HW_REDUCED        (1<<20)	/* 20: [V5] ACPI hardware is not implemented (ACPI 5.0) */
 #define ACPI_FADT_LOW_POWER_S0      (1<<21)	/* 21: [V5] S0 power savings are equal or better than S3 (ACPI 5.0) */
 
+/*******************************************************************************
+ *
+ * MEMRESERVE - Dummy entry for memory reserve configuration table
+ *
+ ******************************************************************************/
+
+struct acpi_table_memreserve {
+	int size;		/* allocated size of the array */
+	int count;		/* number of entries used */
+	u64 next;		/* pa of next struct instance */
+	struct {
+		u64 base;
+		u64 size;
+	} entry[];
+};
+
+
 /* Values for preferred_profile (Preferred Power Management Profiles) */
 
 enum acpi_prefered_pm_profiles {
diff --git a/xen/include/efi/efiapi.h b/xen/include/efi/efiapi.h
index a616d1238a..a70b3d8a12 100644
--- a/xen/include/efi/efiapi.h
+++ b/xen/include/efi/efiapi.h
@@ -882,6 +882,8 @@ typedef struct _EFI_BOOT_SERVICES {
 #define SAL_SYSTEM_TABLE_GUID    \
     { 0xeb9d2d32, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
 
+#define LINUX_EFI_MEMRESERVE_TABLE_GUID    \
+    { 0x888eb0c6, 0x8ede, 0x4ff5, {0xa8, 0xf0, 0x9a, 0xee, 0x5c, 0xb9, 0x77, 0xc2} }
 
 typedef struct _EFI_CONFIGURATION_TABLE {
     EFI_GUID                VendorGuid;
-- 
2.34.1


