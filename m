Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 955AF88065D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 21:59:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695612.1085513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgYC-0000B7-07; Tue, 19 Mar 2024 20:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695612.1085513; Tue, 19 Mar 2024 20:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmgYB-00009O-Rb; Tue, 19 Mar 2024 20:59:11 +0000
Received: by outflank-mailman (input) for mailman id 695612;
 Tue, 19 Mar 2024 20:59:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D7vt=KZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rmgY9-0007xt-Vm
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 20:59:10 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86f97b9e-e633-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 21:59:08 +0100 (CET)
Received: from CH5P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::16)
 by MW4PR12MB6852.namprd12.prod.outlook.com (2603:10b6:303:207::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Tue, 19 Mar
 2024 20:59:05 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::24) by CH5P221CA0012.outlook.office365.com
 (2603:10b6:610:1f2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Tue, 19 Mar 2024 20:59:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 19 Mar 2024 20:59:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 19 Mar
 2024 15:59:04 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 19 Mar 2024 15:59:03 -0500
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
X-Inumbo-ID: 86f97b9e-e633-11ee-afdd-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O77yB8uUAxJRIwxnzSCmsI7E+mctTib3+e9nx7TzSkspmgBLZnbSKNbUlA8ltngCjpJKfgEZYAznjlpHpPt24cl8DehSLpUP1caV3Y2uD/0ptJ9To9RjgOmsLDC6UqzNSp85nXgzlgnS5/LI1MEYsMDbsgg0OYayFdnUXEk12oJtrenVudhsSyVbYS2Fg0o4DbE8HheVlTIhUfxXWt/R+wpJwLQEwUeV82GxozcIoFuh6wJCMkBHr0EWBm3LVoTplpY806p3zwyKo273xsGj+xBGT3ga3hUaV/ayqjB0jDGo0Zaz367zF1jx+ILCQlLP7p4+GiBMqWcSsywrsXhr3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubecenY8h+cFWrLnty23ZPYxaQGRZIUEbcYcQZ6BJcU=;
 b=fwNLCu87IX6lsjsgTMK2vLsOkB1vWogb3uez3IxhvgM5V4NWz9jaPB2plRGxGCjPLsmcN4F65vsGwsHQGJU2bEC7zzeKnBDcpjcGsuMiJEZpun1WW26zkUMfF8E0d8PwF+vdakmPw+QWpMZcn7fKYlrW3iGTTBdJh/fjC3Sum4VW3rPRYto/wiSZ/sGR76WyrOQ0HaMYnzi0QuTDJ3ndT44ytldNnQ8+6I7RO5M8q2BY/th4dJxnnEdlTSleZa95/HJkIkfC/R6y8WytbJ7CVTiyuNU8Vv7N+rojm+JswQ0HJJONPFY6D0w0NdUGMFCcEqEDtPH2HdC2JpZanbcHjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubecenY8h+cFWrLnty23ZPYxaQGRZIUEbcYcQZ6BJcU=;
 b=B111KHkg3vYZ9uvZP25R9kbpuc48iXiUdcuHGyJnbUVXGkiTPsvq0DuXKvOQf2OoKudolPNDTO0fN50DEDeRVxpmF1OCDUuDUA2J7F0hFdQm4hB2WKuAaMq4Rvt1gwcGFbrmnHRvLYu8LTObBx5+XTZmO436UO0lByIkY68LnFo=
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
Subject: [PATCH v3 3/3] x86/PVH: Support relocatable dom0 kernels
Date: Tue, 19 Mar 2024 16:58:49 -0400
Message-ID: <20240319205849.115884-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240319205849.115884-1-jason.andryuk@amd.com>
References: <20240319205849.115884-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|MW4PR12MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf1f5f3-ff17-4de6-2640-08dc4857698d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bTB/la/v1Wb5p5uWuOAgg5iiJqtoM8bur8zfX/nyB/dtzXqULT4Qp80Crw1IMzm0SOOy31jTOB5IeOaIVdbq4CAky/adZ4HmcjEhigYCsa7Xcy2pAbYYO+KjF+uEN+oy9RWWXp9Nyq09ihAVYRu0mcGsXeIQS0jRKGJZFYO7LFZSCr7mMxYcz4QIVKjMWN6Bu6U/k9pzrmzOor4ihHFNHgDvVFHlOCpWwPGNMQ3gVTHEkBXKxClwDZDT1AH2Pb6/ntRoGSvC5V7Jc3rhw0U/Jhf1ROOzcnjQFFWUmc0l+vGi9fc9vlcue7lBl5eIlRdZQC4Ini8BFunkFu+BthfcEKmwQpF5CxmzMrbjNSqlp4I30Dh0maLHpTeyResWqJnyf0+cR+vKIyc+LrU08m4h6MCXU+en51080KspyMp9KKaDaWP0G84ng7N1tl79I/lSlND9BfmIS5u0+nyuuWo8kFJoTHS49KFIM4WElVSz6v7kKrQ3Y20bOSxcPh4+Vq36efKIU2BQbDMEuBkTLW/aVISk6+sQoD93sfFt4KSq9yAr0p/CpIl+lIeBjEJpVZAmYDizHDJB87EgdGCf0jrjSfuHq4u1+7gNTnQIH9v6di+HMvyee3sphaeroqRF+vAz2rBSpS4bA2OGVYpuTcXlQ49MAHvm4vwmxGJdkt0In0Tia3RxHlvINojwkl3nA8GuNsZo5uzPV8dKyNwtoEzSOg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2024 20:59:04.9355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf1f5f3-ff17-4de6-2640-08dc4857698d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6852

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
---
 xen/arch/x86/hvm/dom0_build.c      | 94 ++++++++++++++++++++++++++++++
 xen/common/libelf/libelf-dominfo.c | 33 +++++++++++
 xen/include/public/elfnote.h       | 18 +++++-
 xen/include/xen/libelf.h           |  4 ++
 4 files changed, 148 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index 0ceda4140b..d2686318c3 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -537,6 +537,97 @@ static paddr_t __init find_memory(
     return INVALID_PADDR;
 }
 
+static bool __init check_load_address(
+    const struct domain *d, const struct elf_binary *elf)
+{
+    paddr_t kernel_start = (paddr_t)elf->dest_base;
+    paddr_t kernel_end = kernel_start + elf->dest_size;
+    unsigned int i;
+
+    /* Relies on a sorted memory map. */
+    for ( i = 0; i < d->arch.nr_e820; i++ )
+    {
+        paddr_t start = d->arch.e820[i].addr;
+        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
+
+        if ( start >= kernel_end )
+            return false;
+
+        if ( d->arch.e820[i].type == E820_RAM  &&
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
+        paddr_t end = d->arch.e820[i].addr + d->arch.e820[i].size;
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
+    if ( !parms->phys_reloc )
+    {
+        printk("%pd kernel: Address conflict and not relocatable\n", d);
+        return false;
+    }
+
+    reloc_base = find_kernel_memory(d, elf, parms);
+    if ( reloc_base == 0 )
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
+                            (parms->phys_entry - (paddr_t)elf->dest_base);
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
+        return -ENOMEM;
+
     elf_set_vcpu(&elf, v);
     rc = elf_load_binary(&elf);
     if ( rc < 0 )
diff --git a/xen/common/libelf/libelf-dominfo.c b/xen/common/libelf/libelf-dominfo.c
index 405510ead9..7861e79658 100644
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -105,6 +105,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
             ELFNOTE_INT,
             ELFNOTE_STRING,
             ELFNOTE_NAME,
+            ELFNOTE_CUSTOM,
         } type;
     } note_desc[] = {
         [XEN_ELFNOTE_ENTRY] = { "ENTRY", ELFNOTE_INT },
@@ -125,6 +126,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
         [XEN_ELFNOTE_SUSPEND_CANCEL] = { "SUSPEND_CANCEL", ELFNOTE_INT },
         [XEN_ELFNOTE_MOD_START_PFN] = { "MOD_START_PFN", ELFNOTE_INT },
         [XEN_ELFNOTE_PHYS32_ENTRY] = { "PHYS32_ENTRY", ELFNOTE_INT },
+        [XEN_ELFNOTE_PHYS32_RELOC] = { "PHYS32_RELOC", ELFNOTE_CUSTOM },
     };
 /* *INDENT-ON* */
 
@@ -132,6 +134,7 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
     uint64_t val = 0;
     unsigned int i;
     unsigned type = elf_uval(elf, note, type);
+    unsigned descsz = elf_uval(elf, note, descsz);
 
     if ( (type >= sizeof(note_desc) / sizeof(note_desc[0])) ||
          (note_desc[type].name == NULL) )
@@ -161,6 +164,10 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
     {
         elf_msg(elf, "ELF: note: %s\n", note_desc[type].name);
     }
+    else if ( note_desc[type].type == ELFNOTE_CUSTOM )
+    {
+        elf_msg(elf, "ELF: note: %s", note_desc[type].name);
+    }
     parms->elf_notes[type].name = note_desc[type].name;
 
     switch ( type )
@@ -225,6 +232,28 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
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
+        elf_msg(elf, "\n");
+        break;
     }
     return 0;
 }
@@ -536,6 +565,10 @@ elf_errorstatus elf_xen_parse(struct elf_binary *elf,
     parms->p2m_base = UNSET_ADDR;
     parms->elf_paddr_offset = UNSET_ADDR;
     parms->phys_entry = UNSET_ADDR32;
+    parms->phys_min = 0;
+    parms->phys_max = 0xffffffff;
+    parms->phys_align = 0x200000;
+    parms->phys_reloc = false;
 
     /* Find and parse elf notes. */
     count = elf_phdr_count(elf);
diff --git a/xen/include/public/elfnote.h b/xen/include/public/elfnote.h
index 8bf54d035b..54362b907f 100644
--- a/xen/include/public/elfnote.h
+++ b/xen/include/public/elfnote.h
@@ -194,10 +194,26 @@
  */
 #define XEN_ELFNOTE_PHYS32_ENTRY 18
 
+/*
+ * Physical loading constraints for PVH kernels
+ *
+ * Used to place constraints on the guest physical loading addresses and
+ * alignment for a PVH kernel.
+ *
+ * The presence of this note indicates the kernel supports relocating itself.
+ *
+ * The note may include up to three 32bit values in the following order:
+ *  - a maximum address for the entire image to be loaded below (default
+ *      0xffffffff)
+ *  - a minimum address for the start of the image (default 0)
+ *  - a required start alignment (default 0x200000)
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


