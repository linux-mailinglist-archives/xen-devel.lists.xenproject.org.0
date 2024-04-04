Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB40B899032
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 23:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701002.1094982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsUaU-0003Yu-Dj; Thu, 04 Apr 2024 21:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701002.1094982; Thu, 04 Apr 2024 21:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsUaU-0003Vj-Ac; Thu, 04 Apr 2024 21:25:34 +0000
Received: by outflank-mailman (input) for mailman id 701002;
 Thu, 04 Apr 2024 21:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/v=LJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rsUaS-00032K-7b
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 21:25:32 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcb50877-f2c9-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 23:25:31 +0200 (CEST)
Received: from CH0PR03CA0257.namprd03.prod.outlook.com (2603:10b6:610:e5::22)
 by PH8PR12MB6916.namprd12.prod.outlook.com (2603:10b6:510:1bd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 21:25:27 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::ae) by CH0PR03CA0257.outlook.office365.com
 (2603:10b6:610:e5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20 via Frontend
 Transport; Thu, 4 Apr 2024 21:25:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 21:25:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 16:25:25 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Apr 2024 16:25:25 -0500
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
X-Inumbo-ID: dcb50877-f2c9-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=au+p+STwunlErEJ5NpOuBkgLS3e6xBtRGuBJ1BtjfmxSD9Quj36Sqqi20uqpHesjG/K7i62UDOlL7C2+dA9Hq494T4pml+pVSFIwh2PW8P37P1OW5EbR7oYQL5lGjJLTNetfCqw2FGBuCoqU9WExFsjV7sF1Vmf/QEdh7D++qP8ZacpEGlV4FgY7LklgMl/tkMx+ClwKtPGzjb1FiW0FKGQ7GxE3zahs12xvY8IOqdAYx+201OG/zMUYq1x7Dr0FKX/j9JkRbj3B+aG0MMbbsieOMmo4/oCC7sLTA5cqcWC0UB2KtxeuVcy47zfw7CARuFMnsGY13LLYuV/lQl3IGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUDfRVFRIPG004c/OhPMVoFuW636IJD+0LvgIIfh8a8=;
 b=M2SaX8HWL2VLRcPMeJphWuBoCgYRysj2gUyhw9mIKmWRtTtpIVKVZRPTzITZV0mkQGTlSqbrZSdyQu8GTVnYk11JmFevUBm0n8EvYLyX4wY3SRWBt6S3JxKAP8scr1hzAoTOnDmU87w61dzwJND1o7jD4yjrA1Unq4c1aG2U+lfQ0dKmEfuNEsKV0bocTjKg2MlKSoqis5e99LBmsmU/PqvwGidg2d5QGeeK5gqHDbp/dc9iXqlZKMceMIIeeooGrEEACAGkQyxp/bKA1mCobzCn+pgaf5R8fKW+ekCjKG5jF0D2vkfXO695lH1EJhtpGKn9GKt9xJHa9b4Mzpb72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUDfRVFRIPG004c/OhPMVoFuW636IJD+0LvgIIfh8a8=;
 b=1UZJRfvvuuSEzrrNjT9XVIdgMDXxfeP8C/HiX6zevH6haZxjBogulwD1xOo+Bsm6bmUa/ypQ6Sxn9xEzQ+SDPl/+9OKsO3Ni/bnPNPU2BwQk5Zg48deH0bCfKo8QzYuo77gU06yNKqIOfsWv+v4N+OG61Kox6ShwWES014Eghn4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: [PATCH v7 2/2] x86/PVH: Support relocatable dom0 kernels
Date: Thu, 4 Apr 2024 17:25:19 -0400
Message-ID: <20240404212519.16401-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404212519.16401-1-jason.andryuk@amd.com>
References: <20240404212519.16401-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|PH8PR12MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0f782e-b021-48d0-f881-08dc54edbf33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0iJrE76Des4ykMiKiTLV/n08Q1nlNly0mpWIv7BNx5vcOhArd8wpcAZVpX4g2LF/3Da1qUlFFP/jWZMOG50Ihi5QHDu25vKM8MW7krQKrS7v8rz7f/MKcPAXQ+4NxTC0ajT8AvpoFLBzRob1f2WOLhbPy98b2ApbQYVwwHpczF83jvCfiiOGtTijMsaDOWqRCfEgdgho1i51W4IrBVW/Vy66q5SeMS4OH+h9zfmrvx59HHLL0YPZU0doFMlPkYMsK5je2biqbi2pQV1qfU5hCfcRcP37zsMM8A/V7KOAvo6lrW+Ao+vHKgOPktqB2D0gAThxiHQ1J1fGzMOajMXdd1Jf/2sxWEZtxtsq4kCtAhesEbBWN5Blp4+hqibY83Ywz+/JsRBI5/J8UKB6GLvGEdM5XOvcTRTfykKC5faDotE3PaND/hT+VtWdf51bmTzzRdlh2V+9OoMpqLPSiEydWouKMnWwaLodGWtUeCzC/quYAYho06gmRLxK8g83XNpljuUh0lBde9ZDcLMaWzRIGpESgd+tggA4o4hIpNIx3Ugun52kqCcCDekhoTnylWcLI3Fg3m7s2GPJuDuSm6pizja7Nh/xACHGIDR1GtNcsqg2Pc87Ky3P7rOLDcPWpCsZp6MjCxj64S5CZ44cllKnpOqmWKnYcldhehopCwIoqnkiQKcCFUhRl2iEHRdGNfEUbu9d3+SjOQmMidqLRpHrWr48W67SLSORYDDTRqoBXx4rXPRPSQFwOuPvls5LA5wA
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 21:25:26.2854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0f782e-b021-48d0-f881-08dc54edbf33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6916

Xen tries to load a PVH dom0 kernel at the fixed guest physical address
from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
it can be configured.

Unfortunately there exist firmwares that have reserved regions at this
address, so Xen fails to load the dom0 kernel since it's not RAM.

The PVH entry code is not relocatable - it loads from absolute
addresses, which fail when the kernel is loaded at a different address.
With a suitably modified kernel, a reloctable entry point is possible.

Add XEN_ELFNOTE_PHYS32_RELOC which specifies optional alignment,
minimum, and maximum addresses needed for the kernel.  The presence of
the NOTE indicates the kernel supports a relocatable entry path.

Change the loading to check for an acceptable load address.  If the
kernel is relocatable, support finding an alternate load address.

The primary motivation for an explicit align field is that Linux has a
configurable CONFIG_PHYSICAL_ALIGN field.  This value is present in the
bzImage setup header, but not the ELF program headers p_align, which
report 2MB even when CONFIG_PHYSICAL_ALIGN is greater.  Since a kernel
is only considered relocatable if the PHYS32_RELOC elf note is present,
the alignment contraints can just be specified within the note instead
of searching for an alignment value via a heuristic.

Load alignment uses the PHYS32_RELOC note value if specified.
Otherwise, the maxmum ELF PHDR p_align value is selected if greater than
or equal to PAGE_SIZE.  Finally, the fallback default is 2MB.

libelf-private.h includes common-macros.h to satisfy the fuzzer build.

Link: https://gitlab.com/xen-project/xen/-/issues/180
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
ELF Note printing looks like:
(XEN) ELF: note: PHYS32_RELOC align: 0x200000 min: 0x1000000 max: 0x3fffffff

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

v3:
Remove kernel_start/end page rounding
Change loop comment to rely on a sorted memory map.
Reorder E820_RAM check first
Use %p for dest_base
Use PRIpaddr
Use 32bit phys_min/max/align
Consolidate to if ( x || y ) continue
Use max_t
Add parms->phys_reloc
Use common "%pd kernel: " prefix for messages
Re-order phys_entry assignment
Print range ends inclusively
Remove extra "Unable to load kernel" message
s/PVH_RELOCATION/PHYS32_RELOC/
Make PHYS32_RELOC contents optional
Use 2MB default alignment
Update ELF Note comment
Update XEN_ELFNOTE_MAX

v4:
Cast dest_base to uintptr_t
Use local start variable
Mention e820 requiring adjacent entries merged
Remove extra whitespace
Re-word elfnote comment & mention x86
Use ELFNOTE_NAME
Return -ENOSPC
Use ! instead of == 0
Check kend - 1 to avoid off by one
libelf: Use MB/GB() to define the size.
Use ARCH_PHYS_* defines

v5:
Place kernel in higher memory addresses
Remove stray semicolons
ELFNOTE_NAME comment about newline
Make PHYS32_RELOC element order align, min, max
Re-word PHYS32_RELOC comment
Move phys_align next to other bool variables

v6:
Select alignment from, in order, Note, PHDRs, then default

v7:
Re-format phys_entry assignment
Mention align selection in PHYS_RELOC comment
Use palign >= PAGE_SIZE
---
 xen/arch/x86/hvm/dom0_build.c      | 108 +++++++++++++++++++++++++++++
 xen/common/libelf/libelf-dominfo.c |  35 ++++++++++
 xen/common/libelf/libelf-private.h |   1 +
 xen/include/public/elfnote.h       |  20 +++++-
 xen/include/xen/libelf.h           |   4 ++
 5 files changed, 167 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 0ceda4140b..d158f4d241 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -537,6 +537,111 @@ static paddr_t __init find_memory(
     return INVALID_PADDR;
 }
 
+static bool __init check_load_address(
+    const struct domain *d, const struct elf_binary *elf)
+{
+    paddr_t kernel_start = (uintptr_t)elf->dest_base;
+    paddr_t kernel_end = kernel_start + elf->dest_size;
+    unsigned int i;
+
+    /* Relies on a sorted memory map with adjacent entries merged. */
+    for ( i = 0; i < d->arch.nr_e820; i++ )
+    {
+        paddr_t start = d->arch.e820[i].addr;
+        paddr_t end = start + d->arch.e820[i].size;
+
+        if ( start >= kernel_end )
+            return false;
+
+        if ( d->arch.e820[i].type == E820_RAM &&
+             start <= kernel_start &&
+             end >= kernel_end )
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
+    paddr_t kernel_size = elf->dest_size;
+    unsigned int align;
+    int i;
+
+    if ( parms->phys_align != UNSET_ADDR32 )
+        align = parms->phys_align;
+    else if ( elf->palign >= PAGE_SIZE )
+        align = elf->palign;
+    else
+        align = MB(2);
+
+    /* Search backwards to find the highest address. */
+    for ( i = d->arch.nr_e820 - 1; i >= 0 ; i-- )
+    {
+        paddr_t start = d->arch.e820[i].addr;
+        paddr_t end = start + d->arch.e820[i].size;
+        paddr_t kstart, kend;
+
+        if ( d->arch.e820[i].type != E820_RAM ||
+             d->arch.e820[i].size < kernel_size )
+            continue;
+
+        if ( start > parms->phys_max )
+            continue;
+
+        if ( end - 1 > parms->phys_max )
+            end = parms->phys_max + 1;
+
+        kstart = (end - kernel_size) & ~(align - 1);
+        kend = kstart + kernel_size;
+
+        if ( kstart < parms->phys_min )
+            return 0;
+
+        if ( kstart >= start && kend <= end )
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
+    if ( !parms->phys_reloc )
+    {
+        printk("%pd kernel: Address conflict and not relocatable\n", d);
+        return false;
+    }
+
+    reloc_base = find_kernel_memory(d, elf, parms);
+    if ( !reloc_base )
+    {
+        printk("%pd kernel: Failed find a load address\n", d);
+        return false;
+    }
+
+    if ( opt_dom0_verbose )
+        printk("%pd kernel: Moving [%p, %p] -> [%"PRIpaddr", %"PRIpaddr"]\n", d,
+               elf->dest_base, elf->dest_base + elf->dest_size - 1,
+               reloc_base, reloc_base + elf->dest_size - 1);
+
+    parms->phys_entry =
+        reloc_base + (parms->phys_entry - (uintptr_t)elf->dest_base);
+    elf->dest_base = (char *)reloc_base;
+
+    return true;
+}
+
 static int __init pvh_load_kernel(struct domain *d, const module_t *image,
                                   unsigned long image_headroom,
                                   module_t *initrd, void *image_base,
@@ -585,6 +690,9 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
     elf.dest_size = parms.virt_kend - parms.virt_kstart;
 
+    if ( !check_and_adjust_load_address(d, &elf, &parms) )
+        return -ENOSPC;
+
     elf_set_vcpu(&elf, v);
     rc = elf_load_binary(&elf);
     if ( rc < 0 )
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index 0cdb419b8a..260294d0ed 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -17,6 +17,14 @@
 
 #include "libelf-private.h"
 
+#if defined(__i386__) || defined(__x86_64__)
+#define ARCH_PHYS_MIN_DEFAULT   0
+#define ARCH_PHYS_MAX_DEFAULT   (GB(4) - 1)
+#else
+#define ARCH_PHYS_MIN_DEFAULT   0
+#define ARCH_PHYS_MAX_DEFAULT   0
+#endif
+
 /* ------------------------------------------------------------------------ */
 /* xen features                                                             */
 
@@ -125,6 +133,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
         [XEN_ELFNOTE_SUSPEND_CANCEL] = { "SUSPEND_CANCEL", ELFNOTE_INT },
         [XEN_ELFNOTE_MOD_START_PFN] = { "MOD_START_PFN", ELFNOTE_INT },
         [XEN_ELFNOTE_PHYS32_ENTRY] = { "PHYS32_ENTRY", ELFNOTE_INT },
+        [XEN_ELFNOTE_PHYS32_RELOC] = { "PHYS32_RELOC", ELFNOTE_NAME },
     };
 /* *INDENT-ON* */
 
@@ -132,6 +141,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
     uint64_t val = 0;
     unsigned int i;
     unsigned type = elf_uval(elf, note, type);
+    unsigned descsz = elf_uval(elf, note, descsz);
 
     if ( (type >= sizeof(note_desc) / sizeof(note_desc[0])) ||
          (note_desc[type].name == NULL) )
@@ -228,6 +238,27 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
     case XEN_ELFNOTE_PHYS32_ENTRY:
         parms->phys_entry = val;
         break;
+
+    case XEN_ELFNOTE_PHYS32_RELOC:
+        parms->phys_reloc = true;
+
+        if ( descsz >= 4 )
+        {
+            parms->phys_align = elf_note_numeric_array(elf, note, 4, 0);
+            elf_msg(elf, " align: %#"PRIx32, parms->phys_align);
+        }
+        if ( descsz >= 8 )
+        {
+            parms->phys_min = elf_note_numeric_array(elf, note, 4, 1);
+            elf_msg(elf, " min: %#"PRIx32, parms->phys_min);
+        }
+        if ( descsz >= 12 )
+        {
+            parms->phys_max = elf_note_numeric_array(elf, note, 4, 2);
+            elf_msg(elf, " max: %#"PRIx32, parms->phys_max);
+        }
+
+        break;
     }
 
     if ( note_desc[type].type == ELFNOTE_NAME)
@@ -543,6 +574,10 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
     parms->p2m_base = UNSET_ADDR;
     parms->elf_paddr_offset = UNSET_ADDR;
     parms->phys_entry = UNSET_ADDR32;
+    parms->phys_align = UNSET_ADDR32;
+    parms->phys_min = ARCH_PHYS_MIN_DEFAULT;
+    parms->phys_max = ARCH_PHYS_MAX_DEFAULT;
+    parms->phys_reloc = false;
 
     /* Find and parse elf notes. */
     count = elf_phdr_count(elf);
diff --git a/xen/common/libelf/libelf-private.h b/xen/common/libelf/libelf-private.h
index 47db679966..98cac65bc5 100644
--- a/xen/common/libelf/libelf-private.h
+++ b/xen/common/libelf/libelf-private.h
@@ -71,6 +71,7 @@
 #endif
 #include <xen/elfnote.h>
 #include <xen/libelf/libelf.h>
+#include <xen-tools/common-macros.h>
 
 #ifndef FUZZ_NO_LIBXC
 #include "xenctrl.h"
diff --git a/xen/include/public/elfnote.h b/xen/include/public/elfnote.h
index 1d84b05f44..5dfed6bc3e 100644
--- a/xen/include/public/elfnote.h
+++ b/xen/include/public/elfnote.h
@@ -196,10 +196,28 @@
  */
 #define XEN_ELFNOTE_PHYS32_ENTRY 18
 
+/*
+ * Physical loading constraints for PVH kernels
+ *
+ * The presence of this note indicates the kernel supports relocating itself.
+ *
+ * The note may include up to three 32bit values to place constraints on the
+ * guest physical loading addresses and alignment for a PVH kernel.  Values
+ * are read in the following order:
+ *  - a required start alignment (default 0x200000)
+ *  - a minimum address for the start of the image (default 0)
+ *  - a maximum address for the last byte of the image (default 0xffffffff)
+ *
+ *  When this note specifies an alignment value, it is used.  Otherwise the
+ *  maximum p_align value from loadable ELF Program Headers is used, if it is
+ *  greater than or equal to 4k (0x1000).  Otherwise, the default is used.
+ */
+#define XEN_ELFNOTE_PHYS32_RELOC 19
+
 /*
  * The number of the highest elfnote defined.
  */
-#define XEN_ELFNOTE_MAX XEN_ELFNOTE_PHYS32_ENTRY
+#define XEN_ELFNOTE_MAX XEN_ELFNOTE_PHYS32_RELOC
 
 /*
  * System information exported through crash notes.
diff --git a/xen/include/xen/libelf.h b/xen/include/xen/libelf.h
index 2d971f958e..9ac530acc2 100644
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -426,6 +426,7 @@ struct elf_dom_parms {
     enum xen_pae_type pae;
     bool bsd_symtab;
     bool unmapped_initrd;
+    bool phys_reloc;
     uint64_t virt_base;
     uint64_t virt_entry;
     uint64_t virt_hypercall;
@@ -435,6 +436,9 @@ struct elf_dom_parms {
     uint32_t f_supported[XENFEAT_NR_SUBMAPS];
     uint32_t f_required[XENFEAT_NR_SUBMAPS];
     uint32_t phys_entry;
+    uint32_t phys_align;
+    uint32_t phys_min;
+    uint32_t phys_max;
 
     /* calculated */
     uint64_t virt_kstart;
-- 
2.44.0


