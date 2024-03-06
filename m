Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF842873FFB
	for <lists+xen-devel@lfdr.de>; Wed,  6 Mar 2024 19:51:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689472.1074505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwM5-0000Ab-HT; Wed, 06 Mar 2024 18:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689472.1074505; Wed, 06 Mar 2024 18:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhwM5-00006w-DM; Wed, 06 Mar 2024 18:51:05 +0000
Received: by outflank-mailman (input) for mailman id 689472;
 Wed, 06 Mar 2024 18:51:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=toy5=KM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rhwM3-0007k1-Rx
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2024 18:51:03 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a3f438f-dbea-11ee-a1ee-f123f15fe8a2;
 Wed, 06 Mar 2024 19:51:01 +0100 (CET)
Received: from BYAPR01CA0027.prod.exchangelabs.com (2603:10b6:a02:80::40) by
 LV8PR12MB9405.namprd12.prod.outlook.com (2603:10b6:408:1fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Wed, 6 Mar
 2024 18:50:58 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::8e) by BYAPR01CA0027.outlook.office365.com
 (2603:10b6:a02:80::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.37 via Frontend
 Transport; Wed, 6 Mar 2024 18:50:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Wed, 6 Mar 2024 18:50:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 12:50:56 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Mar 2024 12:50:55 -0600
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
X-Inumbo-ID: 7a3f438f-dbea-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehYy/t29tVSxeR6pttbMARcufQoWH+zAxrqUJu/dx1ARtrToPVVtN5FawayNQwOw2gYvaNIwLJfB5sf9AqQ3T0SwHoYaP4ZV8Fo2POIUi4XNAnxcyJsFzIdUf6t9YxQoJJcDzItnLcUack8QDJXjCUh6H0hH+nYkYN1/ntdYUzlMO91Sie80hExVCnp+O0V26gJj/ubS0D1LvRBbBvXpMlkA9JCcUhnIdWkLRZaaA4uZC95qWv3jfd0mMysQeBj7O/+8d0BWWFL4aWVX5XQKRYn0Wsz1Eb+bLgPKQJRclPyHmP0X4/ODEDiNKrBYF1NOb5qjyDpiKFlj62zgRzB53Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3CZf4Zi/+LKE/JxglBmU2IixkGLM4biIR5p9SBTScI=;
 b=fqH2vtXhqKt590lDgbNd1+yk7bZk8PD1I2izsTmvbT2WwRq/suTbG1sJiKC44mzQJAUD085PW1gDJHrIa73I0TALmxa6s6hrInr9WcCFpuLdU+xBPIVEbXUGenhFx9dxhr1aNpUSK8JKFDAwloPmM3dEiCHGHHHphO5EXrmR0iBJR8zL0iLZq2t3E3IemrRsDWIKf+ZeAHB+CctsqsoXdYqo0cfgnQlYUsXF/3LaaVm+pVEdW9k3l3AiV954De7I1N43sMboFb1Nx2uuOVW53057jnJpvnj/ou02oWAqswSo46lyaBAWKt9Zm2EQC0honLogFatXYskgj0BC3ahtZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3CZf4Zi/+LKE/JxglBmU2IixkGLM4biIR5p9SBTScI=;
 b=J1LoZ5QVDcPbn6hCpZgemz32LwgVxS1C1KkiQY5x/SGjd4W/k5ZiUMuoZBQuThjs/7zX64rmJeDLQomtoURhuK28rW5uKCM/nANpNgfBezsBdf93DJtKrlqn9KfDa+Pb/OY63dWCz8IB8hlx8lru5/zgJpXIM5+2A2bWjCSjqaA=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/3] x86/PVH: Support relocatable dom0 kernels
Date: Wed, 6 Mar 2024 13:50:32 -0500
Message-ID: <20240306185032.103216-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240306185032.103216-1-jason.andryuk@amd.com>
References: <20240306185032.103216-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|LV8PR12MB9405:EE_
X-MS-Office365-Filtering-Correlation-Id: dd647ce7-5f4d-4745-6283-08dc3e0e5bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OB6lho4d4qmSJMsKLPPvUveVfU8ytiL8AGNH+LlCnFFswKRijAbPVaXix9XKQfuMKykWNvlvRBGMMbylFnPME6+bk1+G6ycByO1/dzEASRhNdv5xulj4ApsBbkoQB+f8R6o3AAcdi0+8kvKvYf2eAxC/Vi+TYGzZKhntTg0ONVKnxSxUodUT3gQwMOVqMUJu53AnymdMI+MGp8bemV8MbOZGalmwhF8tnlSMP5DiWIlyUNVpfIe/59eGgF0XFL88CMsDucZvU/NZz0UCPxeLfQyK7diqnDUkfufqDg1I4o0af+oWbBGZESCdURsm9Hi01sZ4Lq6aTfFmGcQrrlqKa/GN6vsazC3zKX8n4dcR6VM6bWgil4//KXlp+CVjT/fLE5/SvdjwCdDvr5oiMbb/QTkuamdAmkAAfjRkSPQIr6l5GzZsa1owD6xET2EmAZ/86A/pB/Rcc6xnje5qZYb/jYZoIFspnN3lZ5pRxiYNwTPbVbxSfd7HkftxzwfB8bgtmYxMHISOd4reh5AgwrJiS2NroyPxHRi40nTgnVw1b5cYL1XcByC/5pn/f4XRTibe9vvcyjs3fc9iRO5NGjq8CUNOhREDjv8Py9/7uTNbqu6cVGSxj/wMVRADHhKTCNnoqfj8QfX3vnJCnJyIor8JpN4uPQA3ZhZZCKtfnZ1rrFMNYn+Jgzfgl91AUvzGTPCc/plsugpCFGNhcarZNwSe3mCKJswkcmcAJOMzrvMN0++KQUffu643851tiB/vdkrx
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 18:50:57.2052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd647ce7-5f4d-4745-6283-08dc3e0e5bf9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9405

Xen tries to load a PVH dom0 kernel at the fixed guest physical address
from the elf headers.  For Linux, this defaults to 0x1000000 (16MB), but
it can be configured.

Unfortunately there exist firmwares that have reserved regions at this
address, so Xen fails to load the dom0 kernel since it's not RAM.

The PVH entry code is not relocatable - it loads from absolute
addresses, which fail when the kernel is loaded at a different address.
With a suitably modified kernel, a reloctable entry point is possible.

Add the XENFEAT_pvh_relocatable flag to let a kernel indicate that it
supports a relocatable entry path.

Change the loading to check for an acceptable load address.  If the
kernel is relocatable, support finding an alternate load address.

Linux cares about its physical alignment.  This can be pulled out of the
bzImage header, but not from the vmlinux ELF file.  If an alignment
can't be found, use 2MB.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Put alignment as a new ELF note?  Presence of that note would indicate
relocation support without a new XENFEAT flag.

Default alignment to a multiple of 2MB to make more cases work?  It has
to be a power of two, and a multiple might allow loading a customized
kernel.  A larger alignment would limit the number of possible load
locations.
---
 xen/arch/x86/hvm/dom0_build.c | 109 ++++++++++++++++++++++++++++++++++
 xen/include/public/features.h |   5 ++
 2 files changed, 114 insertions(+)

diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index bbae8a5645..34d68ee8fb 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -537,6 +537,109 @@ static paddr_t __init find_memory(
     return INVALID_PADDR;
 }
 
+static bool __init check_load_address(
+    const struct domain *d, const struct elf_binary *elf)
+{
+    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
+    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
+                                 PAGE_SIZE);
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
+        if ( start <= kernel_start &&
+             end >= kernel_end &&
+             d->arch.e820[i].type == E820_RAM )
+            return true;
+    }
+
+    return false;
+}
+
+/*
+ * Find an e820 RAM region that fits the kernel at a suitable alignment.
+ */
+static paddr_t find_kernel_memory(
+    const struct domain *d, struct elf_binary *elf, paddr_t align)
+{
+    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
+    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
+                                 PAGE_SIZE);
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
+        paddr_t kstart, kend, offset;
+
+        if ( d->arch.e820[i].type != E820_RAM )
+            continue;
+
+        if ( d->arch.e820[i].size < elf->dest_size )
+            continue;
+
+        if ( end < kernel_end )
+            continue;
+
+        kstart = ROUNDUP(start, align);
+        offset = kstart - kernel_start;
+        kend = kernel_end + offset;
+
+        if ( kend <= end )
+            return offset;
+    }
+
+    return 0;
+}
+
+/*
+ * Check the kernel load address, and adjust if necessary and possible.
+ */
+static bool __init adjust_load_address(
+    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms,
+    paddr_t align)
+{
+    paddr_t offset;
+
+    /* Check load address */
+    if ( check_load_address(d, elf) )
+        return true;
+
+    if ( !test_bit(XENFEAT_pvh_relocatable, parms->f_supported) )
+    {
+        printk("Address conflict and %pd kernel is not relocatable\n", d);
+        return false;
+    }
+
+    if ( align == 0 )
+        align = MB(2);
+
+    offset = find_kernel_memory(d, elf, align);
+    if ( offset == 0 )
+    {
+        printk("Failed find a load offset for the kernel\n");
+        return false;
+    }
+
+    printk("Adjusting load address by %#lx\n", offset);
+    elf->dest_base += offset;
+    parms->phys_entry += offset;
+
+    return true;
+}
+
 static int __init pvh_load_kernel(struct domain *d, const module_t *image,
                                   unsigned long image_headroom,
                                   module_t *initrd, void *image_base,
@@ -587,6 +690,12 @@ static int __init pvh_load_kernel(struct domain *d, const module_t *image,
     elf.dest_base = (void *)(parms.virt_kstart - parms.virt_base);
     elf.dest_size = parms.virt_kend - parms.virt_kstart;
 
+    if ( !adjust_load_address(d, &elf, &parms, align) )
+    {
+        printk("Unable to load kernel\n");
+        return -ENOMEM;
+    }
+
     elf_set_vcpu(&elf, v);
     rc = elf_load_binary(&elf);
     if ( rc < 0 )
diff --git a/xen/include/public/features.h b/xen/include/public/features.h
index 4437f25d25..300480cb22 100644
--- a/xen/include/public/features.h
+++ b/xen/include/public/features.h
@@ -120,6 +120,11 @@
 #define XENFEAT_runstate_phys_area        18
 #define XENFEAT_vcpu_time_phys_area       19
 
+/*
+ * PVH: If set, the guest supports relocation in load address.
+ */
+#define XENFEAT_pvh_relocatable           20
+
 #define XENFEAT_NR_SUBMAPS 1
 
 #endif /* __XEN_PUBLIC_FEATURES_H__ */
-- 
2.44.0


