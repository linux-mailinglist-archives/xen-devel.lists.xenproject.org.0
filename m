Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49642A8A4B4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 18:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954255.1348575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4jYT-0007fW-TI; Tue, 15 Apr 2025 16:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954255.1348575; Tue, 15 Apr 2025 16:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4jYT-0007cj-PS; Tue, 15 Apr 2025 16:54:37 +0000
Received: by outflank-mailman (input) for mailman id 954255;
 Tue, 15 Apr 2025 16:54:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o4sU=XB=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u4jYS-000730-DZ
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 16:54:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2415::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4de18b9c-1a1a-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 18:54:33 +0200 (CEST)
Received: from SA9PR13CA0063.namprd13.prod.outlook.com (2603:10b6:806:23::8)
 by SJ2PR12MB8111.namprd12.prod.outlook.com (2603:10b6:a03:4fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 16:54:27 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:806:23:cafe::5d) by SA9PR13CA0063.outlook.office365.com
 (2603:10b6:806:23::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.8 via Frontend Transport; Tue,
 15 Apr 2025 16:54:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 16:54:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 11:54:25 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 15 Apr 2025 11:54:24 -0500
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
X-Inumbo-ID: 4de18b9c-1a1a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrPVFxXMyhlGAOR9Gb69ZZsrpBZlqYovLm8bqDxv1nmSnMJ18R4DIJ4c9khnlptUR1qhCiuUqRvwFN1yn5GU5sFyZQ2E3OCp5jlcUPSyvgd2r6hseWusVo8I5YKOGOXTeZ7eZ+6VEMK9N2U1dKCxOLUkVQY1Zge/6p4HFMx43WPv6D+oANFIXstigUYTlf9yevehLBE0w1UUGHJNG2z7pG2KGoLMiltKoFK7k2RLspszwKRGBRja2/PhqF0i0KW/Av5UHcDrZf3fDt0dzSkku8k030EOz47Wr4w1zTqDBHicAgctjQZ8Ka0gitCph6udg9TpsDmhdJK5N7deKEhUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lx8Lph3IBrxQ9Lis7LuGMBrvW2qwScDxY+y3wh5OujI=;
 b=nQZybeLSv/5B/tJIEXAR+7nriVjt1VuqVjTKRs8CTzA+0GAIYzgAEOC2mZ5KM6YRgEnv13M6TAqewtHHy+elM0ba9oz6SaBDmxiEgTRu0F+TzNzTPCM3qq49/Fd9ecwD4Nlf+iNxOeKHTqIdxW+eMfp8N+WivxdvOjpxrkqHKS0D0f/huAzOOYUVFx3Y+fPmL9faTrM74//TnTyMyooJWAqNUwSf1Mvu0nOl5eiLWD0oiH0gSsglqSS46RjaC/6WO9lAaRwu+kr1i4zKnaTAJZEQABUrFPU+gnj8/gZD6GBzJFYVUAd5gbSr/78lDE2fBT54Mld3W/yyEGKb3oNsyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx8Lph3IBrxQ9Lis7LuGMBrvW2qwScDxY+y3wh5OujI=;
 b=C6DUw6ocaOU1jF1zqWI4m9M2i9ZAMDDN0Dqk3l55PHtQUSXTpTcp8yd87Ly8OA1gkiQoTSSa5DZ66xmrwtlzhfZtKZ/1AR18I9VxQ7CkXHldHC2nUvEePovC5Kbz8k1V35YZBK/TNCcCVX4nZrr0tSMZWmN4scvTP3wl1QYWigI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	"Andrew Cooper" <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v19 2/3] vpci: acquire d->pci_lock in I/O handlers
Date: Tue, 15 Apr 2025 12:54:01 -0400
Message-ID: <20250415165404.435506-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415165404.435506-1-stewart.hildebrand@amd.com>
References: <20250415165404.435506-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|SJ2PR12MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 73326c69-9d9f-4d93-2fd3-08dd7c3e2e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i6pABr/1b1Z/g4vRU4M7tkhg6LKZ5suazYTELTGCf19XSUUMqQ1fBlFg3CMD?=
 =?us-ascii?Q?Shrc7Mpg5M4mwNgaP4SbLeYdEPXJaH5H6Xbsvx4TxUHdoo05hTs/CvnyhZxX?=
 =?us-ascii?Q?P7xanu5Rif2+81ASfPcD8VC69OZStB+zm+gvi8cVLmHtwpzUnt3KKi8ssyho?=
 =?us-ascii?Q?DbZZZnz6omJMW+qd8dAoM42DJ3kizZbNBHwQvmMPz/WkmMNym4FDjoVQzROW?=
 =?us-ascii?Q?6m7fjqUyn1p0+HYfHCs19O1gpTUSEr/QMofNbBHIFKj2qi6YHuOo5ETqZlTI?=
 =?us-ascii?Q?q7mzcSnHd/GpRaJWdeNdlJSlPimJNBlAn8GzgWvn/7Evx5IkzODTfNtUHfw+?=
 =?us-ascii?Q?z7PLY4fhqpbngHeihiBcv512tYiOeU83VRK5atDJmPY0WUUTLdZiL7gkY2Ov?=
 =?us-ascii?Q?TQWKUvIRDjr6yOpxafZXy59I1uFP0uUdWwq4uBrYkf87O5EruhQyqjFeLdQd?=
 =?us-ascii?Q?AsAPwA0TQYIsJGurQEv5dfGkh3DyphTNj5w3UpAGIUT30UtVp8+bOJad0f6I?=
 =?us-ascii?Q?nux63JTdbTPBkMUll2Ryvfgw5zwhnH46vU0qzYzkBXqWC7LbpGrrGcHs1V1G?=
 =?us-ascii?Q?8y4Ren666vI5WQCeWBXJtomIIviSLuzjap2ps84wT0atmRg8ghBUCl2Mt+lP?=
 =?us-ascii?Q?H5KYsiE1CUx/U1D+ooCr8P3h50yjJt2983F6NfeCvWMX00sRdYBj1vLFtPid?=
 =?us-ascii?Q?TLVLqGQ/96E9zJ7r2VMUMH/uGXKdk0i23TEhDM6eKX5rL/iS+mXgpLC7Zwd/?=
 =?us-ascii?Q?rUgamBYL+GjVTpBH5q0dczkmHpfoUIIBlyjbkZxaNTl3sMXFeW7VmvqK+u0N?=
 =?us-ascii?Q?lmJNg86wyVDykYtbdw9LbGViYKfUsP1CpFZgR7obQBmdfO+8uHfPAoGWo5Z4?=
 =?us-ascii?Q?o03k3XLFwIlctm83DytpxVa40UWqBxzWq48B2mlpXcid6tA3MahLo/yjLNnp?=
 =?us-ascii?Q?bv4FewaSVe5xKc4/LH6JRfaq9RjquGrLDU7ao+ZOOwW0ZoHmPiyx0rxefN3X?=
 =?us-ascii?Q?djtVcbSM/FAvBaqYlUy5cUoiCVfcdhKG0u8R5CNo2rXjOdsmSrEW8ZhsQQu6?=
 =?us-ascii?Q?pMjfZic/VJpYG8dIWeZwtTvwqt26HvCvkz1FOw6P4HINNXN5C9HTMUVwrDDX?=
 =?us-ascii?Q?sUvh/IVmyguVLxcPTKvCx/U78kxFWrpAz6G3M2LkA7xoeZc263ze6CY4GzKv?=
 =?us-ascii?Q?T1dQ+9jGoslJcb3aR9dnoEy64RykCAC0QnG+EhGZsmSJdNyPGgNVkioYiBGp?=
 =?us-ascii?Q?lNFJW19J1JyjstR3F2+mWCXRt9ybRr1K2BH1xkAsL1ca41YLreC0mmIFFOif?=
 =?us-ascii?Q?xs61VL4qXLqLxtbe6GzZwj2BU5BCncePCIBdQmHmEMjzpAT3OC3DBWgV4jLi?=
 =?us-ascii?Q?28qlvcEk0/w0FQf9tvABq6X7nzXysktHBA7z9KfiwnzFo8Io233qP4wWgPuN?=
 =?us-ascii?Q?aysW1b4VQTwVsifb7fBCNDrhaE+UozTWqXjkKQ38IbtqipPIbZQ5VOcqp5wt?=
 =?us-ascii?Q?vMklnNC0m+iKFwEosIf/zTkUxMUdM1vHfphZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:54:26.1013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73326c69-9d9f-4d93-2fd3-08dd7c3e2e39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8111

In preparation for translating virtual PCI bus topology (where a pdev
lookup will be needed in the vPCI I/O handlers), acquire d->pci_lock in
the vPCI I/O handlers.

While here, adjust indentation in vpci_ecam_{read,write}.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v18->v19:
* new patch

While the current patch series focus is Arm, this is also prerequisite
for eventually enabling x86 PVH domU passthrough. Similar to Arm, a call
to vpci_translate_virtual_device() would be added in
xen/arch/x86/hvm/io.c:vpci_portio_{read,write} and
vpci_mmcfg_{read,write}.
---
 xen/arch/arm/vpci.c     | 11 +++++++++--
 xen/arch/x86/hvm/io.c   | 10 +++++++++-
 xen/drivers/vpci/vpci.c | 21 ++++++++++-----------
 3 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index b63a356bb4a8..828c5c745bd9 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -34,15 +34,18 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
+    read_lock(&v->domain->pci_lock);
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
         *r = data;
+        read_unlock(&v->domain->pci_lock);
         return 1;
     }
 
     *r = invalid;
 
+    read_unlock(&v->domain->pci_lock);
     return 0;
 }
 
@@ -51,9 +54,13 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
 {
     struct pci_host_bridge *bridge = p;
     pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    int ret;
 
-    return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
-                           1U << info->dabt.size, r);
+    write_lock(&v->domain->pci_lock);
+    ret = vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
+                          1U << info->dabt.size, r);
+    write_unlock(&v->domain->pci_lock);
+    return ret;
 }
 
 static const struct mmio_handler_ops vpci_mmio_handler = {
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index de6ee6c4dd4d..0b9036528abe 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -261,7 +261,7 @@ static int cf_check vpci_portio_read(
     const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
     uint64_t *data)
 {
-    const struct domain *d = current->domain;
+    struct domain *d = current->domain;
     unsigned int reg;
     pci_sbdf_t sbdf;
     uint32_t cf8;
@@ -285,7 +285,9 @@ static int cf_check vpci_portio_read(
     if ( !vpci_access_allowed(reg, size) )
         return X86EMUL_OKAY;
 
+    read_lock(&d->pci_lock);
     *data = vpci_read(sbdf, reg, size);
+    read_unlock(&d->pci_lock);
 
     return X86EMUL_OKAY;
 }
@@ -316,7 +318,9 @@ static int cf_check vpci_portio_write(
     if ( !vpci_access_allowed(reg, size) )
         return X86EMUL_OKAY;
 
+    write_lock(&d->pci_lock);
     vpci_write(sbdf, reg, size, data);
+    write_unlock(&d->pci_lock);
 
     return X86EMUL_OKAY;
 }
@@ -424,7 +428,9 @@ static int cf_check vpci_mmcfg_read(
     read_unlock(&d->arch.hvm.mmcfg_lock);
 
     /* Failed reads are not propagated to the caller */
+    read_lock(&d->pci_lock);
     vpci_ecam_read(sbdf, reg, len, data);
+    read_unlock(&d->pci_lock);
 
     return X86EMUL_OKAY;
 }
@@ -449,7 +455,9 @@ static int cf_check vpci_mmcfg_write(
     read_unlock(&d->arch.hvm.mmcfg_lock);
 
     /* Failed writes are not propagated to the caller */
+    write_lock(&d->pci_lock);
     vpci_ecam_write(sbdf, reg, len, data);
+    write_unlock(&d->pci_lock);
 
     return X86EMUL_OKAY;
 }
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 1e6aa5d799b9..d01fb7be226a 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -440,6 +440,8 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
     unsigned int data_offset = 0;
     uint32_t data = ~(uint32_t)0;
 
+    ASSERT(rw_is_locked(&d->pci_lock));
+
     if ( !size )
     {
         ASSERT_UNREACHABLE();
@@ -452,15 +454,11 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
      * If this is hwdom and the device is assigned to DomXEN, acquiring hwdom's
      * pci_lock is sufficient.
      */
-    read_lock(&d->pci_lock);
     pdev = pci_get_pdev(d, sbdf);
     if ( !pdev && is_hardware_domain(d) )
         pdev = pci_get_pdev(dom_xen, sbdf);
     if ( !pdev || !pdev->vpci )
-    {
-        read_unlock(&d->pci_lock);
         return vpci_read_hw(sbdf, reg, size);
-    }
 
     spin_lock(&pdev->vpci->lock);
 
@@ -507,7 +505,6 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
-    read_unlock(&d->pci_lock);
 
     if ( data_offset < size )
     {
@@ -555,6 +552,8 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
     const struct vpci_register *r;
     unsigned int data_offset = 0;
 
+    ASSERT(rw_is_write_locked(&d->pci_lock));
+
     if ( !size )
     {
         ASSERT_UNREACHABLE();
@@ -570,7 +569,6 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
      * TODO: We need to take pci_locks in exclusive mode only if we
      * are modifying BARs, so there is a room for improvement.
      */
-    write_lock(&d->pci_lock);
     pdev = pci_get_pdev(d, sbdf);
     if ( !pdev && is_hardware_domain(d) )
         pdev = pci_get_pdev(dom_xen, sbdf);
@@ -579,8 +577,6 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
         /* Ignore writes to read-only devices, which have no ->vpci. */
         const unsigned long *ro_map = pci_get_ro_map(sbdf.seg);
 
-        write_unlock(&d->pci_lock);
-
         if ( !ro_map || !test_bit(sbdf.bdf, ro_map) )
             vpci_write_hw(sbdf, reg, size, data);
         return;
@@ -622,7 +618,6 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
         ASSERT(data_offset < size);
     }
     spin_unlock(&pdev->vpci->lock);
-    write_unlock(&d->pci_lock);
 
     if ( data_offset < size )
         /* Tailing gap, write the remaining. */
@@ -651,8 +646,10 @@ bool vpci_access_allowed(unsigned int reg, unsigned int len)
 }
 
 bool vpci_ecam_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
-                         unsigned long data)
+                     unsigned long data)
 {
+    ASSERT(rw_is_write_locked(&current->domain->pci_lock));
+
     if ( !vpci_access_allowed(reg, len) ||
          (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
         return false;
@@ -667,8 +664,10 @@ bool vpci_ecam_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
 }
 
 bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
-                        unsigned long *data)
+                    unsigned long *data)
 {
+    ASSERT(rw_is_locked(&current->domain->pci_lock));
+
     if ( !vpci_access_allowed(reg, len) ||
          (reg + len) > PCI_CFG_SPACE_EXP_SIZE )
         return false;
-- 
2.49.0


