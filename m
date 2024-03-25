Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8838B88B1E3
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 21:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697881.1089137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rorCJ-0000CO-BO; Mon, 25 Mar 2024 20:45:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697881.1089137; Mon, 25 Mar 2024 20:45:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rorCJ-00007u-5S; Mon, 25 Mar 2024 20:45:35 +0000
Received: by outflank-mailman (input) for mailman id 697881;
 Mon, 25 Mar 2024 20:45:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvT0=K7=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rorCH-0007LI-3l
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 20:45:33 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e7e685b-eae8-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 21:45:31 +0100 (CET)
Received: from BL1PR13CA0146.namprd13.prod.outlook.com (2603:10b6:208:2bb::31)
 by DS0PR12MB8072.namprd12.prod.outlook.com (2603:10b6:8:dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 20:45:27 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::b) by BL1PR13CA0146.outlook.office365.com
 (2603:10b6:208:2bb::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Mon, 25 Mar 2024 20:45:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 25 Mar 2024 20:45:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 15:45:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 15:45:27 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 15:45:26 -0500
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
X-Inumbo-ID: 9e7e685b-eae8-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBGv2hcspRiQHthjVTJTgY1Zo38ZLY70+o5naEC3vguv2fi6CQ+ME7sm1NXMmCxjoXzevypECaD2/5AUh30UNw4JUnkoWwBiKywssBoyBobIakMEWgwWX3Uw76zFEjIR7OUY6p69SzO9Cpf7QgLkQpXO3+4ZwE12tpfoIDPC7uX1HBL5oJlfVPmWhHbpYNjIbR39KriS69Z67uGzKm0k4ckPw1MR7KqJIDIY8gpHjx2bpz2Dl6gu9MbL4uDnSTLJZcBGzilToX6q1wNPTL0I1CIaNu1fMxEzKya+1PNv0HhtxynUOH4zoRRHqj7J2UGfLrblSEJX/uZdJh/kGsenEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jacF0UMoGSb9RVAfT7Engwk4ViDuVVXCvP4NVs29k4=;
 b=JBjYaa3ekfLgK2vCQuVsmzl8cQis7dnRuYMGSG3wqe1Pw17Taz+wg/5udvp9nh+eLjeTT6j0ZVWZlLAN0bJKIinyQzvPcUdxhSK+RUGEK0J/sWJZM10NcAFd45mNdiLMhhvpxrkVwcLL6ySjE78eDZ+lDPPU7P9DkXyBxkYfxFA2wDFltp/2z7uelk+99Cu2NTiPh+rt2fCbb05cvOdDr4FDHYArLbJIHKxcgqM9Wv7ydtrZOYFX7ScSFpxxK31rinE3z4FNY1ORCVUyaVcE9GfE2OKOwglIA4RrctwbjuR57NYrRxJpB/GO6rTHeKG0g2FzFyscS8nY7l9ThZwSNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jacF0UMoGSb9RVAfT7Engwk4ViDuVVXCvP4NVs29k4=;
 b=TrVGA/rnCSgDkDZIBcHkccCCFsDjqOaVcK0anDpmTEykpDJftdmpkLtNPpO/2xebyI5BNR305DrnSYxuvOhOdMChU19wWIt/KbpS2PAQbs8HO+s3mK6Cz9+zoPCrYYL4skkyMZaNS9Dqvv2vE+LaEiTk4R/+rCLavAKfnO2lNQU=
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
Subject: [PATCH v4 5/5] x86/PVH: Support relocatable dom0 kernels
Date: Mon, 25 Mar 2024 16:45:15 -0400
Message-ID: <20240325204515.250203-6-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325204515.250203-1-jason.andryuk@amd.com>
References: <20240325204515.250203-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|DS0PR12MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 267fe8e6-2916-4351-93dd-08dc4d0c80e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	46O/zpqTVIwGdxJ1STSHiFPium+6F+9V7jNn86RY55y5zc99JOXPBaP1L+W45inlSxQiJwVSfhyfThJ/lwYrWLZ+iVpwdaqOXcmpN5oKCuRC5x2ub9ynD50R2taxoOEoUcQfH38IQ1xRSUDdBwaW3z901gsCJHPMimfbtzDEMCnJ9PTnQu6oYuEwa37h8e/pwH5exlTolMcRmijU0A/33G0N35CPddpzD4WWAidtFNI9+gESXbzV3s9YbMowMgu+jyH29ePi32xSzC3zAuicN0fNVdty6647JRh7hqAreBoDFzVk+/sDLZYMhxtH29cHZqAIVjeIGmiaK5szJ9OyCSXzqBaYyw3kPYuSHdUTkAr7XewCv1eN9dBsqKD0RStpxCzQv/HO6kWfUPohlK2VOcpGCrwmd7dU7MfsIH3d2yzLBp2a4CTSo7vKD/zINCpxTZjZ39F4W8s5ewf6EqTRfBQ9H9aBZ3TXeBhlRJRy4j85CkiaGnk9kvHzdquxctKmSRYlqSmOdK+fAgyQhqqJ9S6v1HQEbNa5/SbO/VnjuZoZT/wqSy2TASg4C0DWq5M/UUwSjRAFF9zFDcjGo9K90kXg1LH+7QrdeViGce16WXz/Skr/2uDJhT/E7gNW9Rjn24cSebLiYmuumgg9WCEH+3C06J4tk4AB+qskgUgXBwI95hbfYwdk6Aw5aezgykd6ghA8nykkUri07y0WUncJgM+WV8ovxmUXe8Dom7n2EYZyZvKWR4/Y1KHn96gFxgre
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 20:45:27.6512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 267fe8e6-2916-4351-93dd-08dc4d0c80e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8072

Xen tries to load a PVH dom0 kernel at the fixed guest physical address
from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
it can be configured.

Unfortunately there exist firmwares that have reserved regions at this
address, so Xen fails to load the dom0 kernel since it's not RAM.

The PVH entry code is not relocatable - it loads from absolute
addresses, which fail when the kernel is loaded at a different address.
With a suitably modified kernel, a reloctable entry point is possible.

Add XEN_ELFNOTE_PHYS32_RELOC which specifies optional minimum, maximum and
alignment needed for the kernel.  The presence of the NOTE indicates the
kernel supports a relocatable entry path.

Change the loading to check for an acceptable load address.  If the
kernel is relocatable, support finding an alternate load address.

The primary motivation for an explicit align field is that Linux has a
configurable CONFIG_PHYSICAL_ALIGN field.  This value is present in the
bzImage setup header, but not the ELF program headers p_align, which
report 2MB even when CONFIG_PHYSICAL_ALIGN is greater.  Since a kernel
is only considered relocatable if the PHYS32_RELOC elf note is present,
the alignment contraints can just be specified within the note instead
of searching for an alignment value via a heuristic.

libelf-private.h includes common-macros.h to satisfy the fuzzer build.

Link: https://gitlab.com/xen-project/xen/-/issues/180
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
ELF Note printing looks like:
(XEN) ELF: note: PHYS32_RELOC = max: 0xffffffff min: 0x1000000 align: 0x200000

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
---
 xen/arch/x86/hvm/dom0_build.c      | 94 ++++++++++++++++++++++++++++++
 xen/common/libelf/libelf-dominfo.c | 37 ++++++++++++
 xen/common/libelf/libelf-private.h |  1 +
 xen/include/public/elfnote.h       | 19 +++++-
 xen/include/xen/libelf.h           |  4 ++
 5 files changed, 154 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 0ceda4140b..d925fc7417 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -537,6 +537,97 @@ static paddr_t __init find_memory(
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
+    unsigned int i;
+
+    for ( i = 0; i < d->arch.nr_e820; i++ )
+    {
+        paddr_t start = d->arch.e820[i].addr;
+        paddr_t end = start + d->arch.e820[i].size;
+        paddr_t kstart, kend;
+
+        if ( d->arch.e820[i].type != E820_RAM ||
+             d->arch.e820[i].size < kernel_size )
+            continue;
+
+        kstart = ROUNDUP(start, parms->phys_align);
+        kstart = max_t(paddr_t, kstart, parms->phys_min);
+        kend = kstart + kernel_size;
+
+        if ( kend - 1 > parms->phys_max )
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
+    parms->phys_entry = reloc_base +
+                            (parms->phys_entry - (uintptr_t)elf->dest_base);
+    elf->dest_base = (char *)reloc_base;
+
+    return true;
+}
+
 static int __init pvh_load_kernel(struct domain *d, const module_t *image,
                                   unsigned long image_headroom,
                                   module_t *initrd, void *image_base,
@@ -585,6 +676,9 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
     elf.dest_size = parms.virt_kend - parms.virt_kstart;
 
+    if ( !check_and_adjust_load_address(d, &elf, &parms) )
+        return -ENOSPC;
+
     elf_set_vcpu(&elf, v);
     rc = elf_load_binary(&elf);
     if ( rc < 0 )
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index e7b44d238b..b47d540023 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -17,6 +17,16 @@
 
 #include "libelf-private.h"
 
+#if defined(__i386__) || defined(__x86_64__)
+#define ARCH_PHYS_MIN_DEFAULT   0;
+#define ARCH_PHYS_MAX_DEFAULT   (GB(4) - 1);
+#define ARCH_PHYS_ALIGN_DEFAULT MB(2);
+#else
+#define ARCH_PHYS_MIN_DEFAULT   0;
+#define ARCH_PHYS_MAX_DEFAULT   0;
+#define ARCH_PHYS_ALIGN_DEFAULT 0;
+#endif
+
 /* ------------------------------------------------------------------------ */
 /* xen features                                                             */
 
@@ -125,6 +135,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
         [XEN_ELFNOTE_SUSPEND_CANCEL] = { "SUSPEND_CANCEL", ELFNOTE_INT },
         [XEN_ELFNOTE_MOD_START_PFN] = { "MOD_START_PFN", ELFNOTE_INT },
         [XEN_ELFNOTE_PHYS32_ENTRY] = { "PHYS32_ENTRY", ELFNOTE_INT },
+        [XEN_ELFNOTE_PHYS32_RELOC] = { "PHYS32_RELOC", ELFNOTE_NAME },
     };
 /* *INDENT-ON* */
 
@@ -132,6 +143,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
     uint64_t val = 0;
     unsigned int i;
     unsigned type = elf_uval(elf, note, type);
+    unsigned descsz = elf_uval(elf, note, descsz);
 
     if ( (type >= sizeof(note_desc) / sizeof(note_desc[0])) ||
          (note_desc[type].name == NULL) )
@@ -227,6 +239,27 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
     case XEN_ELFNOTE_PHYS32_ENTRY:
         parms->phys_entry = val;
         break;
+
+    case XEN_ELFNOTE_PHYS32_RELOC:
+        parms->phys_reloc = true;
+
+        if ( descsz >= 4 )
+        {
+            parms->phys_max = elf_note_numeric_array(elf, note, 4, 0);
+            elf_msg(elf, " = max: %#"PRIx32, parms->phys_max);
+        }
+        if ( descsz >= 8 )
+        {
+            parms->phys_min = elf_note_numeric_array(elf, note, 4, 1);
+            elf_msg(elf, " min: %#"PRIx32, parms->phys_min);
+        }
+        if ( descsz >= 12 )
+        {
+            parms->phys_align = elf_note_numeric_array(elf, note, 4, 2);
+            elf_msg(elf, " align: %#"PRIx32, parms->phys_align);
+        }
+
+        break;
     }
 
     if ( note_desc[type].type == ELFNOTE_NAME)
@@ -542,6 +575,10 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
     parms->p2m_base = UNSET_ADDR;
     parms->elf_paddr_offset = UNSET_ADDR;
     parms->phys_entry = UNSET_ADDR32;
+    parms->phys_min = ARCH_PHYS_MIN_DEFAULT;
+    parms->phys_max = ARCH_PHYS_MAX_DEFAULT;
+    parms->phys_align = ARCH_PHYS_ALIGN_DEFAULT;
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
index 8bf54d035b..ed87d5575d 100644
--- a/xen/include/public/elfnote.h
+++ b/xen/include/public/elfnote.h
@@ -194,10 +194,27 @@
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
+ *  - a maximum address for the entire image to be loaded below (default
+ *      0xffffffff)
+ *  - a minimum address for the start of the image (default 0)
+ *  - a required start alignment (default 0x200000)
+ *
+ *  This note is only valid for x86 binaries.
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
index 1c77e3df31..777c5008ca 100644
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -434,10 +434,14 @@ struct elf_dom_parms {
     uint32_t f_supported[XENFEAT_NR_SUBMAPS];
     uint32_t f_required[XENFEAT_NR_SUBMAPS];
     uint32_t phys_entry;
+    uint32_t phys_min;
+    uint32_t phys_max;
+    uint32_t phys_align;
 
     /* calculated */
     uint64_t virt_kstart;
     uint64_t virt_kend;
+    bool phys_reloc;
 };
 
 static inline void elf_xen_feature_set(int nr, uint32_t * addr)
-- 
2.44.0


