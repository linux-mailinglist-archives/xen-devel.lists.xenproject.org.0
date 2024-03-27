Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8A488F167
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 22:56:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698734.1090814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpbEv-0002ll-Tz; Wed, 27 Mar 2024 21:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698734.1090814; Wed, 27 Mar 2024 21:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpbEv-0002j8-QD; Wed, 27 Mar 2024 21:55:21 +0000
Received: by outflank-mailman (input) for mailman id 698734;
 Wed, 27 Mar 2024 21:55:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWcJ=LB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpbEu-0002MB-5P
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 21:55:20 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b25f16bf-ec84-11ee-a1ef-f123f15fe8a2;
 Wed, 27 Mar 2024 22:55:18 +0100 (CET)
Received: from SA9PR13CA0137.namprd13.prod.outlook.com (2603:10b6:806:27::22)
 by DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Wed, 27 Mar
 2024 21:55:13 +0000
Received: from SA2PEPF000015CD.namprd03.prod.outlook.com
 (2603:10b6:806:27:cafe::b8) by SA9PR13CA0137.outlook.office365.com
 (2603:10b6:806:27::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Wed, 27 Mar 2024 21:55:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CD.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Wed, 27 Mar 2024 21:55:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 16:55:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 27 Mar
 2024 16:55:08 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 27 Mar 2024 16:55:07 -0500
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
X-Inumbo-ID: b25f16bf-ec84-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBbCMWxeRRXGV8ZKEvgZeg7QOYPpX9a15aLN8jN95geBNAJVcV4Gqyligb7c5IsP2oGUba1Bh1uYktvULwd/QYpM+Xv/HvCrxLg/rIQ/GgYvO3yRrJVCTqQLdor+eY7TxRSgUJlwqP98DrPwmCY+nQGEXkz4QKlc4/ut29E4sBnghG+D+M+O0duRDpcucVoIJxlG9Uqc/2WLkbmwBOicoYQwhjd35YKKVWC6YQqXVIOFfrAR5BXvyZhKh4rDU/Ckj4cZh7qsXG92CrXGoatPf7nohNolmIBMgSzVtzU7pJDCv2Ex9feVQX8YCbxteVQwjZnfUuPrMIuJWyKJq9V/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjKlJSg9cT/vFlsYwh8UTOiO/XXv5HOBwoiNoPGXXHs=;
 b=TE3+CQVWuxwMqZQHH7TS2vU9zrb7/p+UVvIgZV8V0oXdk1Umn17c2A2j5edNTqJav7sgQOASnLYRXVpo4CWeuehI3RzYNA0mRa/BBOPz4zfvipGWFleTDnNvrtrsKuQM3bNk7oexOVs1O6BCza/vP9K0HyhCLMotty1V1c3IY3+G26pQ/gogrF0YIv7jBDrkxjWxfvdOlfq+dOvL0AiLbW+tcxlB3AGFiGFPkTPLF1daursQ0LO1CTW9LYo9AFYnvb8D1f6LS2qU45I4Uo2TdvlhlPRY6LWtx9H43dsrZr2Nf6CjMIUQynTaiOsSN3zE/RFj+KE4MvafmD6PK/ySGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjKlJSg9cT/vFlsYwh8UTOiO/XXv5HOBwoiNoPGXXHs=;
 b=pHitPNXv/yzRAXIHK42gbMeSAQZ7NSvfsltQ7Ic6X/K5ZDw7wcfQdCxZNc7KCJohr8p5Rh3M9HQ9wk9ovrUy5oZxvRigypTfselUZ78ef+3fgvSiBw/tg9VRxhfXijxKgcF2M0EHQOc3at6hQQq8MEySdyfdCEK0J4fOM4+Uo5Y=
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
Subject: [PATCH v6 4/4] x86/PVH: Support relocatable dom0 kernels
Date: Wed, 27 Mar 2024 17:51:02 -0400
Message-ID: <20240327215102.136001-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327215102.136001-1-jason.andryuk@amd.com>
References: <20240327215102.136001-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CD:EE_|DM4PR12MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: 954a892c-737b-4c0c-99e0-08dc4ea8941d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EUd2vsDMTegDgLCUkY1YpnRGamNu3O0oUC2xGITCWvZVw/mhOB77/1vauVvCuipQSVyH7ndRT4z0y2gfrZGHePA9HPGEhfs0vRZ9vB8VvVo8evi1efrp+8uL66N5s1pnZoUaUeozejZ5LCW9SVdatJy0KvD7Veisl9qFuIHPJ9Z+W0tzZBS9AEiIlTX6rDStZPCU9ZLdGjlwzeewUtvb+ie2XDeypiC7GQdLfAF58BevisoqbRShHIopZvLNqSsJksgldPIclyFUyGep01sfjInxAd+lF7h0G1po3mxy2KhQqyrpjOFN0VSuINgbwKYhgqJ/XHguj/xH+gQJw7Bklk6qssfmuHih6WHC4kNGAyK8CFcN2LTOE0lkf1ZFxraOEBbUZYXb1AmwZqgtvVEDReZeuyQCpHNn7Tv7SNYITNV4uDwyRzmm8ukAM2oxwsitaSLwmULxUMpkPlObOWe4njUxg1mNhqljTrSB6ycXba6Lqj7E3jv07aKmDWQvLWc8DCiN5xYA3ndq0bR9kbm94aKc18bEO4dIvbyN9G+2fGIgrMaAY5wrkENJOZHMkpxCgCskQ2N5SSZXqS2xrHLyFazAJMj18cUUXfb+RCaz374J5lJ3ah8dPM6dgEolRtFIHaCUR+lpEMSv34fhWMln06IMDUXbMPA4mO41jwZuj5YberT3iaoGVQlCFgLJ47jI9h/WealIaMNG1MvB0VLFBbH4Wk5C03Dt+u2lG/uPDgvifbkTamgscS/L7GJe1DHO
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 21:55:12.5582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 954a892c-737b-4c0c-99e0-08dc4ea8941d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6374

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
---
 xen/arch/x86/hvm/dom0_build.c      | 108 +++++++++++++++++++++++++++++
 xen/common/libelf/libelf-dominfo.c |  35 ++++++++++
 xen/common/libelf/libelf-private.h |   1 +
 xen/include/public/elfnote.h       |  16 ++++-
 xen/include/xen/libelf.h           |   4 ++
 5 files changed, 163 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 0ceda4140b..01f39d650e 100644
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
+    else if ( elf->palign > PAGE_SIZE )
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
index 1d84b05f44..a2f89bdc40 100644
--- a/xen/include/public/elfnote.h
+++ b/xen/include/public/elfnote.h
@@ -196,10 +196,24 @@
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


