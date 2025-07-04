Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7D7AF8A27
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032940.1406357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbFo-00021o-KD; Fri, 04 Jul 2025 07:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032940.1406357; Fri, 04 Jul 2025 07:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbFo-0001zz-HA; Fri, 04 Jul 2025 07:54:40 +0000
Received: by outflank-mailman (input) for mailman id 1032940;
 Fri, 04 Jul 2025 07:54:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOXq=ZR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uXbFn-0001zt-R9
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:54:39 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2417::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21c671ad-58ac-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 09:54:38 +0200 (CEST)
Received: from BL1PR13CA0197.namprd13.prod.outlook.com (2603:10b6:208:2be::22)
 by DS2PR12MB9712.namprd12.prod.outlook.com (2603:10b6:8:275::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 07:54:34 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:208:2be:cafe::72) by BL1PR13CA0197.outlook.office365.com
 (2603:10b6:208:2be::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.14 via Frontend Transport; Fri,
 4 Jul 2025 07:54:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Fri, 4 Jul 2025 07:54:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:54:33 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 4 Jul 2025 02:54:32 -0500
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
X-Inumbo-ID: 21c671ad-58ac-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHM6dtKw8gxq9Un/j6EXuIS1iQL5pZryL+Rqa7UAU/xBj162h+kfySbX/sqF9HcYygwoGqR1OXRB/WNJrgungP+kpQo6HaJ4V5qBIpHxDJqx6BuCBliGwhichROXEmVUTcAT6CgQu4bYNXNeJuAWYv0KGW2P8PSGZvPg77N2+SiAGLZiw5wqEskEmZU+Lh58vkqklfUKBvdOHdpJV88xAUhbeRLgEHPomYBSCweXNszQjTG+7lnELm7eoGxxoag/BkhmlmqJ4ODYCexoQmO8UxGpzBufkc85GrHVDU32hkbT0CUYGdhomOGl18IhPHaTBiwosp5FxqKwa12EVNHACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDiQRVxHy+fYRauhZK6RtfI8uKtDZgOS9uGGKEQXYFI=;
 b=k2wVsuAI6Z2oKXHr/aqYGsOT2qpEYEuhpTSJsqONnkSHN7LqGGN+KM4Q2Wgp9qJa6FFhXm87j3njLjzQKFIMz0SCprnTKX76J19SMYkY7AtUT0o35f90CLbGRhhYrjFDU4rHhM5kx4BWyoCw6U3RPrpAOGYlxZi7vsnZmyH+WG5y+DU55Y79ypFhWWADdBzA3E+xkpP1L0j96hvNg01IjhlPGb9F9neN9UR/GhjmS6JGeMRHA8fVAsInN+YoMmWh17KKrgsHaJXhQR2gcT7D8lRjuazCx++auDQPsMGRIIReuR/z2WldtoLOoGtcjiQtVqzMn5sCxvE0+e/4CO4sOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDiQRVxHy+fYRauhZK6RtfI8uKtDZgOS9uGGKEQXYFI=;
 b=jcfV+r69IsNBo56wZuZDjKIs86LfX07mQi+2VPuwSe+YCOpqXxx44lPuG8It0eCrKAnZMGLy7fCRNBKF+PNFXl2RienujikFlUy/JzY7BHEeOIGBT+sMgg2Ba9E9WZXzluKnY4mjTkG0uNtjdkqCNYZvW3RwTHkuOdx58682CVk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/2] xen/arm64: Panic if direct map is too small
Date: Fri, 4 Jul 2025 09:54:27 +0200
Message-ID: <20250704075428.33485-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250704075428.33485-1-michal.orzel@amd.com>
References: <20250704075428.33485-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|DS2PR12MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: 59bac843-99b9-4d3e-3261-08ddbad00417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0/FJbRQn9STFORJGAinUHUCoaNNQZNun/96lPOZfdUbuqocC0gNZa0l0udj7?=
 =?us-ascii?Q?gOXUX3Wh0wXKEKNLCRWYnzNddtz4iolUJb3mTWMiOHuEBkvC/xvOv0C7BsHl?=
 =?us-ascii?Q?mxjGU2MrLQIKx1q1tLvLSBGp9KrPQgUYnbW541zXVAWPJneDzGQxrRVNZ675?=
 =?us-ascii?Q?zmvxSa3mKIK1Z0+vZh/+kyqGLOFsECmWpm9YIL9DYudf6p27hcTux8CUOpol?=
 =?us-ascii?Q?UAIiJr8gHcGqCquNPIdvcmahy/OGPRnJ0pkhA8IP2r6xKg60ifmeuNF4P3SQ?=
 =?us-ascii?Q?q9lxJh7xGiGysRnx0MEJ5bBvKKF6gmbvnJmswmOY5qbf57oQRdW7tqMfgZe2?=
 =?us-ascii?Q?B8SgLKzq02wYMAWHsqY7ewDenEdjJgWXxQpGQR9QknIV3d1aquLTYFkGjNtQ?=
 =?us-ascii?Q?6744aclrWFHoW5ZWunDsO3Aajlvd9+VeLAvwkH+gVCpf34ABlkamIBqGvai8?=
 =?us-ascii?Q?n4HhrGuGRnRkmpTnzpQEDaZWLG2CCwWuG973SFp/s+O03z/kIRFkpDzJ2Fl2?=
 =?us-ascii?Q?UynWbkmuk7phgU3q3l5gGtKCrT972+UhwGGlJXGptmDFLUcxO6nFqgOxIE82?=
 =?us-ascii?Q?xvmznNV6Py6KMC3y+fXvwPbRFyXyuZw0NjULbYt4X5mc+NgD2wH8owiTUYVT?=
 =?us-ascii?Q?/YMoxB3ToHzcaRueOe0v0ZnHBpuz00d2c/iCvOPEajN2HMkMjZ6gvNHhtjHt?=
 =?us-ascii?Q?9aj5U7sSk1t2rLqWJ5f2MtbobYoPapnRXxAfF0zw5C4P96Se1wvK3EsqnLy+?=
 =?us-ascii?Q?QcuSbbRzlceeZzRriZtWOy1cY7F+7tGhJkIbobAWjDgxnbtxIqV30dNcsM7k?=
 =?us-ascii?Q?S+CIwfFW3EX/kMwowpzsWlo1xtmzy2RaaTx/OO5z4G50bw4nRRxRNFBodyn6?=
 =?us-ascii?Q?FuOaDuj2Ar4i3JhF45Tnj3QuT7Jx6Prp8OvGGm3SI853MQw18c+3uU9nLLSB?=
 =?us-ascii?Q?/E1VqRpMd9FI/x1rnqndtTUS9HYjF/3q4PbJCUlVTRA7Vb/9kA32fOWM33sx?=
 =?us-ascii?Q?sVZ6iOBZfT56EiFFIDtXEyHEd2ELPujpDvZjTFm9ykflC8ER4MDPzN0RgEXR?=
 =?us-ascii?Q?EmqgW2N7vzHhp9cR/spPfFJm3KcvDuuKsjuzluny2KEOXwmbTLMJMTLQOF2Y?=
 =?us-ascii?Q?i5jwSF8cFdERzs3opGXM35DuzCsUOMCI8IZMvDtNS4fo6dLY8mrewf9Krn1B?=
 =?us-ascii?Q?wlarXgG0Vcx0rWy6DjkUt9+LqVq/Ppw/TaQQ1384dcplWzaS6c42lCszRQWu?=
 =?us-ascii?Q?pAc31forsXRykG3E53xXUNEAbT4B2w0zmXSf5RYjN0Cltp7TN4qnujMj2kac?=
 =?us-ascii?Q?Jv3ZTkg7+90RR6l4Ky2wsMUcXaxqOpOqKFmxF1JZ24Kpi2mS5ZLYnTu8937a?=
 =?us-ascii?Q?p22HENFJ4ziAtmfzEX0OcLZjv37uQ9XsqnJNzBXhLq+AWSOx1MI02HsiUmfa?=
 =?us-ascii?Q?Q+mf1VLJJiuHLcjCulQUI2OCJf0akQjUmGL15iuT0xLxt/v/ikidzegIma7a?=
 =?us-ascii?Q?Uouvp0Vm4DIxRv05h6mrG3B94ZOWbWKCQ+O2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:54:34.0648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bac843-99b9-4d3e-3261-08ddbad00417
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9712

Harden the code by panicing if direct map is too small for current memory
layout taking into account possible PDX compression. Otherwise the assert
is observed:
Assertion '(mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) < (DIRECTMAP_SIZE >> PAGE_SHIFT)' failed at ./arch/arm/include/asm/mmu/mm.h:72

At the moment, we don't set max_pdx denoting maximum usable PDX which
should be based on max_page. Consolidate setting of max_page and max_pdx
in init_pdx() for both arm32 and arm64. max_pdx will be used in the
future to set up frametable mappings respecting the PDX grouping.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
A similar check for frametable will be introduced with other changes to
frametable setting in the future.
---
 xen/arch/arm/arm32/mmu/mm.c | 1 -
 xen/arch/arm/arm64/mmu/mm.c | 4 +++-
 xen/arch/arm/setup.c        | 6 +++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index 4d22f35618aa..e6d9b49acd3c 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -190,7 +190,6 @@ void __init setup_mm(void)
 
     /* Frame table covers all of RAM region, including holes */
     setup_frametable_mappings(ram_start, ram_end);
-    max_page = PFN_DOWN(ram_end);
 
     /*
      * The allocators may need to use map_domain_page() (such as for
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index a0a2dd8cc762..3e64be6ae664 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -224,6 +224,9 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
          */
         directmap_virt_start = DIRECTMAP_VIRT_START +
             (base_mfn - mfn_gb) * PAGE_SIZE;
+
+        if ( (max_pdx - directmap_base_pdx) > (DIRECTMAP_SIZE >> PAGE_SHIFT) )
+            panic("Direct map is too small\n");
     }
 
     if ( base_mfn < mfn_x(directmap_mfn_start) )
@@ -278,7 +281,6 @@ void __init setup_mm(void)
     directmap_mfn_end = maddr_to_mfn(ram_end);
 
     setup_frametable_mappings(ram_start, ram_end);
-    max_page = PFN_DOWN(ram_end);
 
     init_staticmem_pages();
     init_sharedmem_pages();
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 58acc2d0d4b8..93b730ffb5fb 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -254,7 +254,7 @@ static void __init relocate_fdt(const void **dtb_vaddr, size_t dtb_size)
 void __init init_pdx(void)
 {
     const struct membanks *mem = bootinfo_get_mem();
-    paddr_t bank_start, bank_size, bank_end;
+    paddr_t bank_start, bank_size, bank_end, ram_end = 0;
 
     /*
      * Arm does not have any restrictions on the bits to compress. Pass 0 to
@@ -290,10 +290,14 @@ void __init init_pdx(void)
         bank_start = mem->bank[bank].start;
         bank_size = mem->bank[bank].size;
         bank_end = bank_start + bank_size;
+        ram_end = max(ram_end, bank_end);
 
         set_pdx_range(paddr_to_pfn(bank_start),
                       paddr_to_pfn(bank_end));
     }
+
+    max_page = PFN_DOWN(ram_end);
+    max_pdx = pfn_to_pdx(max_page - 1) + 1;
 }
 
 size_t __read_mostly dcache_line_bytes;
-- 
2.25.1


