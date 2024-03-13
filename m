Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D65887B20C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 20:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692754.1080218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkURX-0008C8-O8; Wed, 13 Mar 2024 19:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692754.1080218; Wed, 13 Mar 2024 19:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkURX-00088e-Ks; Wed, 13 Mar 2024 19:39:15 +0000
Received: by outflank-mailman (input) for mailman id 692754;
 Wed, 13 Mar 2024 19:39:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOmT=KT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rkURV-0007Yd-Hf
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 19:39:13 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d5d8466-e171-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 20:39:11 +0100 (CET)
Received: from BN9PR03CA0646.namprd03.prod.outlook.com (2603:10b6:408:13b::21)
 by SJ0PR12MB8090.namprd12.prod.outlook.com (2603:10b6:a03:4ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 19:39:09 +0000
Received: from BN3PEPF0000B069.namprd21.prod.outlook.com
 (2603:10b6:408:13b:cafe::39) by BN9PR03CA0646.outlook.office365.com
 (2603:10b6:408:13b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35 via Frontend
 Transport; Wed, 13 Mar 2024 19:39:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B069.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.0 via Frontend Transport; Wed, 13 Mar 2024 19:39:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 13 Mar
 2024 14:39:06 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 13 Mar 2024 14:39:05 -0500
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
X-Inumbo-ID: 5d5d8466-e171-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAgMfomW72cUTDjqvEqQiWKpFmgZHtmBmJl1KvtnG1b/whR+m17V+7/BW+03cdhkH4llfjb3tWtxy4gNrBws/MiMEmYfRp2eIME1fF5yd5gMLJbxPnngOQEJ7ZQ5I8uFmqZZyywaGmqOp/uW7+18AqbUHq8Bl7ale3tYBrPLdCndwctm57/X0BWnlCRBU8QU/piL3iOEkVudgh1kxJmuns+TnsOtz+S7mxQCH4McMXHFa8UY5kU0xaPNpeNMnpcOQ/0lENxQjAwBwrTSgVQq4rFZWTbtU02EtAmx6zGx8pWIeJ8FvEhgGTUDwI9+XPLvx0GaKZlclLjaeJ5Z+YFbUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isSLpVSY0AA5iF+eAEUdjNCIEYGADkjQFYjW2bQ+zck=;
 b=Fs8MMlClH9ooTMElOJweGf9G/IAGipgVjmLcRiR5Z1CGg1XlvqwZvBaVJWtCnXAeNyWca5I0honLBf7JOfC2ecLLxU0AfNHlLBZDKEQqxYA/PtbaItiGPp31uHQpd7E8RAsVC5Slfi6DbXozHs8B5Gf7U/Wy27w+36p7ntGezsC+ps6sJCp9GteGIK0r39YTGXlMV4YOpRrFNJ+8V29Mj9CaNkAco13Uf6s4xg4tHeb0g7csgiJffmdNSO1CIYa7wWO3lFq4oOWw2WLz1nmUjmW0oSDhP4wlJUnssrPAERA0sAZSwoUuem6jvGWFPivIbwYGIh6NX5vpBIILC4HEug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isSLpVSY0AA5iF+eAEUdjNCIEYGADkjQFYjW2bQ+zck=;
 b=KTeo08n3cbdkPBuBHnaekA35vS6c2khMcYtVGnzNCsCrJXeQ/599qSJWXSxRjonBLwABL14NCaGljhkGibe6FHi3F0JeRBqeWNM31s3W/74wcCSOtlrxAO2cdJgprYLc5/HW9WNBfsGzFfrK4882ShEWEK47yBpHoAoO+cxdZl4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Date: Wed, 13 Mar 2024 15:30:21 -0400
Message-ID: <20240313193021.241764-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313193021.241764-1-jason.andryuk@amd.com>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B069:EE_|SJ0PR12MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e01ad16-0beb-4507-f2c5-08dc43953fea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+dZJltLeqQLYIFQP5YL1WyRP0XRUOYPHnHBnOaHhCHv9wzSI9+CiqahwVQuCtTSWbzjtJ2sSgHJg6nuwCEM0EoFYO1ehMWya1O8Ka/eIKqIwrxL/ySkZbgygUE/7jCty3YRfyznveUInZkekzJae+LgSEhBmyxFcFLwYNjJ+SvcZsMONw3V/VXhIVBgtlJiOiC3iqOXJi2RWivUXFdPcYPZ4fdKn6ys3t96L80hwcdH3RLB8eSGhMJWdEKvQu2WJq1kzP3QOO9pf1aWqd0bTAZJD7vnw/bWubuh1N3sqmyKsHsRxonn5alnH+HPCNAr+EwZgOnqeQpBGxhktfI+VBlvZsaMc9uX/dvVEVtapQL2N9PNxoc1znHzdp46uH2b13YSjinJNVIPER5aD1QbCdQUylWor1HUxEGP/dBR6Axuk4rKXZvGL8UksLpS3GJlUVqGz5TTlcu83ldxkSBFR3EeYoLGdCkXj1GJNod3aCGqfpY8JNR3uUieM6873tZwOcSIU7+ld66+smrIcagf12JSGmBtBRP6PzNL1LXlZ6xEZQ0qHCJs4QEq/Ymd3RWgBbXmVxu+/9kJalYd9l4qCO3x8F1iHkE500AFSlJ+A+pmE+bTTV63FVXK548XAYSbQqX/LJdtYeZxQQ5OAF7Rfd68TUL4GEo3Jnj0oigaxyc5wl1V+cXXoIjDh4B4K36fxWwz6brOVZn0Ab7oknwkX5g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 19:39:08.0849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e01ad16-0beb-4507-f2c5-08dc43953fea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B069.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8090

Xen tries to load a PVH dom0 kernel at the fixed guest physical address
from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
it can be configured.

Unfortunately there exist firmwares that have reserved regions at this
address, so Xen fails to load the dom0 kernel since it's not RAM.

The PVH entry code is not relocatable - it loads from absolute
addresses, which fail when the kernel is loaded at a different address.
With a suitably modified kernel, a reloctable entry point is possible.

Add XEN_ELFNOTE_PVH_RELOCATION which specifies the minimum, maximum and
alignment needed for the kernel.  The presence of the NOTE indicates the
kernel supports a relocatable entry path.

Change the loading to check for an acceptable load address.  If the
kernel is relocatable, support finding an alternate load address.

Link: https://gitlab.com/xen-project/xen/-/issues/180
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
ELF Note printing looks like:
(XEN) ELF: note: PVH_RELOCATION = min: 0x1000000 max: 0xffffffff align: 0x200000

v2:
Use elfnote for min, max & align - use 64bit values.
Print original and relocated memory addresses
Use check_and_adjust_load_address() name
Return relocated base instead of offset
Use PAGE_ALIGN
Don't load above max_phys (expected to be 4GB in kernel elf note)
Use single line comments
Exit check_load_address loop earlier
Add __init to find_kernel_memory()
---
 xen/arch/x86/hvm/dom0_build.c      | 108 +++++++++++++++++++++++++++++
 xen/common/libelf/libelf-dominfo.c |  13 ++++
 xen/include/public/elfnote.h       |  11 +++
 xen/include/xen/libelf.h           |   3 +
 4 files changed, 135 insertions(+)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 0ceda4140b..5c6c0d2db3 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -537,6 +537,108 @@ static paddr_t __init find_memory(
     return INVALID_PADDR;
 }
 
+static bool __init check_load_address(
+    const struct domain *d, const struct elf_binary *elf)
+{
+    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
+    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
+    unsigned int i;
+
+    /*
+     * The memory map is sorted and all RAM regions starts and sizes are
+     * aligned to page boundaries.
+     */
+    for ( i = 0; i < d->arch.nr_e820; i++ )
+    {
+        paddr_t start = d->arch.e820[i].addr;
+        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
+
+        if ( start >= kernel_end )
+            return false;
+
+        if ( start <= kernel_start &&
+             end >= kernel_end &&
+             d->arch.e820[i].type == E820_RAM )
+            return true;
+    }
+
+    return false;
+}
+
+/* Find an e820 RAM region that fits the kernel at a suitable alignment. */
+static paddr_t __init find_kernel_memory(
+    const struct domain *d, struct elf_binary *elf,
+    const struct elf_dom_parms *parms)
+{
+    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
+    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);
+    paddr_t kernel_size = kernel_end - kernel_start;
+    unsigned int i;
+
+    /*
+     * The memory map is sorted and all RAM regions starts and sizes are
+     * aligned to page boundaries.
+     */
+    for ( i = 0; i < d->arch.nr_e820; i++ )
+    {
+        paddr_t start = d->arch.e820[i].addr;
+        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
+        paddr_t kstart, kend;
+
+        if ( d->arch.e820[i].type != E820_RAM )
+            continue;
+
+        if ( d->arch.e820[i].size < kernel_size )
+            continue;
+
+        kstart = ROUNDUP(start, parms->phys_align);
+        kstart = kstart < parms->phys_min ? parms->phys_min : kstart;
+        kend = kstart + kernel_size;
+
+        if ( kend > parms->phys_max )
+            return 0;
+
+        if ( kend <= end )
+            return kstart;
+    }
+
+    return 0;
+}
+
+/* Check the kernel load address, and adjust if necessary and possible. */
+static bool __init check_and_adjust_load_address(
+    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms)
+{
+    paddr_t reloc_base;
+
+    if ( check_load_address(d, elf) )
+        return true;
+
+    if ( parms->phys_align == UNSET_ADDR )
+    {
+        printk("Address conflict and %pd kernel is not relocatable\n", d);
+        return false;
+    }
+
+    reloc_base = find_kernel_memory(d, elf, parms);
+    if ( reloc_base == 0 )
+    {
+        printk("Failed find a load address for the kernel\n");
+        return false;
+    }
+
+    if ( opt_dom0_verbose )
+        printk("Relocating kernel from [%lx, %lx] -> [%lx, %lx]\n",
+               (paddr_t)elf->dest_base,
+               (paddr_t)elf->dest_base + elf->dest_size,
+               reloc_base, reloc_base + elf->dest_size);
+
+    parms->phys_entry += (reloc_base - (paddr_t)elf->dest_base);
+    elf->dest_base = (char *)reloc_base;
+
+    return true;
+}
+
 static int __init pvh_load_kernel(struct domain *d, const module_t *image,
                                   unsigned long image_headroom,
                                   module_t *initrd, void *image_base,
@@ -585,6 +687,12 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
     elf.dest_size = parms.virt_kend - parms.virt_kstart;
 
+    if ( !check_and_adjust_load_address(d, &elf, &parms) )
+    {
+        printk("Unable to load kernel\n");
+        return -ENOMEM;
+    }
+
     elf_set_vcpu(&elf, v);
     rc = elf_load_binary(&elf);
     if ( rc < 0 )
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index 7cc7b18a51..837a1b0f21 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -125,6 +125,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
         [XEN_ELFNOTE_SUSPEND_CANCEL] = { "SUSPEND_CANCEL", ELFNOTE_INT },
         [XEN_ELFNOTE_MOD_START_PFN] = { "MOD_START_PFN", ELFNOTE_INT },
         [XEN_ELFNOTE_PHYS32_ENTRY] = { "PHYS32_ENTRY", ELFNOTE_INT },
+        [XEN_ELFNOTE_PVH_RELOCATION] = { "PVH_RELOCATION", ELFNOTE_OTHER },
     };
 /* *INDENT-ON* */
 
@@ -234,6 +235,17 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
                 elf_note_numeric_array(elf, note, 8, 0),
                 elf_note_numeric_array(elf, note, 8, 1));
         break;
+
+    case XEN_ELFNOTE_PVH_RELOCATION:
+        if ( elf_uval(elf, note, descsz) != 3 * sizeof(uint64_t) )
+            return -1;
+
+        parms->phys_min = elf_note_numeric_array(elf, note, 8, 0);
+        parms->phys_max = elf_note_numeric_array(elf, note, 8, 1);
+        parms->phys_align = elf_note_numeric_array(elf, note, 8, 2);
+        elf_msg(elf, "min: %#"PRIx64" max: %#"PRIx64" align: %#"PRIx64"\n",
+                parms->phys_min, parms->phys_max, parms->phys_align);
+        break;
     }
     return 0;
 }
@@ -545,6 +557,7 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
     parms->p2m_base = UNSET_ADDR;
     parms->elf_paddr_offset = UNSET_ADDR;
     parms->phys_entry = UNSET_ADDR32;
+    parms->phys_align = UNSET_ADDR;
 
     /* Find and parse elf notes. */
     count = elf_phdr_count(elf);
diff --git a/xen/include/public/elfnote.h b/xen/include/public/elfnote.h
index 8bf54d035b..70bb93499c 100644
--- a/xen/include/public/elfnote.h
+++ b/xen/include/public/elfnote.h
@@ -194,6 +194,17 @@
  */
 #define XEN_ELFNOTE_PHYS32_ENTRY 18
 
+/*
+ * Physical loading constraints for PVH kernels
+ *
+ * Used to place constraints on the guest physical loading addresses and
+ * alignment for a PVH kernel.  This note's value is 3 64bit values in
+ * the following order: minimum, maximum and alignment.
+ *
+ * The presence of this note indicates the kernel is relocatable.
+ */
+#define XEN_ELFNOTE_PVH_RELOCATION 19
+
 /*
  * The number of the highest elfnote defined.
  */
diff --git a/xen/include/xen/libelf.h b/xen/include/xen/libelf.h
index 1c77e3df31..d55a839411 100644
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -431,6 +431,9 @@ struct elf_dom_parms {
     uint64_t virt_hv_start_low;
     uint64_t p2m_base;
     uint64_t elf_paddr_offset;
+    uint64_t phys_min;
+    uint64_t phys_max;
+    uint64_t phys_align;
     uint32_t f_supported[XENFEAT_NR_SUBMAPS];
     uint32_t f_required[XENFEAT_NR_SUBMAPS];
     uint32_t phys_entry;
-- 
2.44.0


