Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB3D8C5813
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721586.1125134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tF6-00061l-Ka; Tue, 14 May 2024 14:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721586.1125134; Tue, 14 May 2024 14:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tF6-0005yf-GE; Tue, 14 May 2024 14:35:00 +0000
Received: by outflank-mailman (input) for mailman id 721586;
 Tue, 14 May 2024 14:34:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loUn=MR=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s6tF4-0005tT-VJ
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:34:59 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2214bc5a-11ff-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 16:34:57 +0200 (CEST)
Received: from CH2PR07CA0022.namprd07.prod.outlook.com (2603:10b6:610:20::35)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Tue, 14 May
 2024 14:34:50 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::ad) by CH2PR07CA0022.outlook.office365.com
 (2603:10b6:610:20::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26 via Frontend
 Transport; Tue, 14 May 2024 14:34:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Tue, 14 May 2024 14:34:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 09:34:49 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 09:34:42 -0500
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
X-Inumbo-ID: 2214bc5a-11ff-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvK8YW3OdSTp7BR35H5WYReHmVXCDzjxy/jatDpZ89ZsyNf2PvJ4pD+aYBareE2t/Ucifc+fFNDudN+P/wiGvl/q6ZJyzhV2mByNVr2W82H5NbW6RftrUf6aOMAM+KpDVl1YUtFg0RY94ZiFuQPYWKlEJ1MIraQgNZvRwVUR/lkwYcV9H2ZLVmNMc2UuT583mi0IbKgyj1YyJOCNQSmaF3oEAxz/NdQt5pVX7XBvLsvY3JryAINVIdqr3b0ilz+UOi8B94A6/aKF2tQ8/vyeXDHzfDy03vsMa1GGwH9AEl3Rzp8p8x83S6pvaMhW55TW587yo4JnvSdBaJ7lreeQ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fz5VFWknMZx6HHUaDNZrtZ7oahJwlLDFqbFpBhGUT+E=;
 b=F3nkW1OkQV5weYKJ4cf3BBBveZcM3DjcvqszT9p/6Fzpsjv8EpBgeuOZrRqq4Etb7kVTCV5XGddGegSEQk1QJqCwK4YxviyYoixNxNXPwN6WliK8u4zjOnLBtvFoOL5YgExWmB+JtUm710eaCHpezEDq1yf8NUrbSEzmLBWsnQWxX0cuW/IcHJAhc8/8oR047XG5uLfQ5/fe1ZFiaOtH2VOpkpfd9QQvrxqkU24TLK4ZUT60R0W/oQ3NjpXgP3fwrpCFznrdOLZk4BPwvzEdUgtVSRe8h0W1UebPaXyNx4M52jfHll42f8b6KGnMJyMpi0BWrHBw7mja0dao/hWdGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fz5VFWknMZx6HHUaDNZrtZ7oahJwlLDFqbFpBhGUT+E=;
 b=ijabFWS0YQIN1JvxDvuN7H+NOOrwD0hV5HSpXRs0XgI3RTSEpPbt8hY9n9Oempobwbc158gdlaC+zgq4IoYciVAa1dVRweIN+BYdOBjF1g0IdCjAWK4G5KB6cO5qyjFPImmMfn54hG7c8FTh/k5NTmO7kwgl8YVGSgjsf5oC3GE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: [PATCH v14 3/5] xen/arm: translate virtual PCI bus topology for guests
Date: Tue, 14 May 2024 10:33:55 -0400
Message-ID: <20240514143400.152280-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240514143400.152280-1-stewart.hildebrand@amd.com>
References: <20240514143400.152280-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 021f1f9e-2393-4caf-2263-08dc742302d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?72aDNwaCEi4ACEL7T6eSjo5aP4gesI8fE2UiN3kfdRYI1V23X4RabeFLe5Vy?=
 =?us-ascii?Q?RJnmkfln5SvXuu8IoihBb6XMAJ9swBHE3VtwZXMTnyOD5J9ZzwRYOR9NENFM?=
 =?us-ascii?Q?CUiLbDzXHHJjvByYBxKRH5NLxtzqxGrq56WJ4xj/0NVqOrkyRmZPXDKXDiXI?=
 =?us-ascii?Q?jyF+Sr8LLSYLJui2DdJKEAt6RwHGrK0WkRdfIFRv5WNpGck1A5/7QeDLFzH7?=
 =?us-ascii?Q?FjMMQ7NZLhn/poZzHaKcZJOfamqNDDlCv2qpDLYdqDAiNOnep8Kq4xLjN5ov?=
 =?us-ascii?Q?Wr409cFWcw/sDPlaNlqTjaZIKTv24UTMTjKTV+8xJEV6qCHUzGTy19Tmasxi?=
 =?us-ascii?Q?vStIh9CHfVN8WjRaXwEGWPJ4wGh6xn4rsZnteXGTiXQ9odLAtu0874O4QrWE?=
 =?us-ascii?Q?ihEsZG302Lf8QTRYoC2bYyBnuB07S1ro3RE7mednQQ3+O9mhMlNNMr6W8Civ?=
 =?us-ascii?Q?sa2Ylod0tiAmJhaIKLUMr29dlAx+z487aFTeEXpnL6GBNqRePBzRD/i7YXz4?=
 =?us-ascii?Q?87WeMmf/LLwo+WV6WdRqFmlQ5fGu+JRojJYFLA5kZ+vw+4+UMsz2nATT/2WV?=
 =?us-ascii?Q?TdXwCXIUBzzy6Y5Y0WW0iZZkI912Fg36YhInF4N5Id7cLd4S9scouRfxukfO?=
 =?us-ascii?Q?0bOPcjQEfQOCCZbhtTZH+FvkMK/R3pt2M3AsOqcomwelmD+BFILrmezC2nb4?=
 =?us-ascii?Q?KQ/jMtVvMn/KIqBYs9acZita64WfJSgQE0fPwBgqQ7VqlE6Xz1L3BJrG33MJ?=
 =?us-ascii?Q?gwJFQvGO2hZIwGWDV4svdzZ3GQqr3ppVMY3hjpRC5Eaqd2x9keohdZxYu1Kb?=
 =?us-ascii?Q?+DrN5VTT0raYl6kqQ1SpbxJKqoJ7iLjbl6u8NsEM6Qlm83zfyOQF22CQg9fk?=
 =?us-ascii?Q?HOv7iufP6opKwXqZrQ7RLf6uqg7Wr+NIpg7M4fR2jvdRRQORovI5P2cavAQz?=
 =?us-ascii?Q?r3NwNBBZZlWeuj34VDzdzbC2tdJUujsUtvocecVY02N7mSZ8CPmzooxk+TWJ?=
 =?us-ascii?Q?qNNFqWEm6V+fS+vTa8c7yJkZKzTCSPZl3v8Fwhq9veqaiE5MZgzN90by5qd+?=
 =?us-ascii?Q?cPIXbgOjxG7GZ0EWwCpDgjJjLhBS60HV0t5LbJtvncfJOL+opTyETcHb2DH6?=
 =?us-ascii?Q?BOqWQjzb/Rm2ewYmyj2v/aifqUwpgB76UVNZOUnjpwxKqIWrwGPJJwJe7wjY?=
 =?us-ascii?Q?1aSE5aiOSwL4tIWr88xSTOq3PoMMiiZkRNh0DpA2+7a89oKZYmP1agMsAfQU?=
 =?us-ascii?Q?6R+7PSyTDTOQJELFF2UymR4sfKbErd3AICFfN9I7KtF1fvIFR/ucN/YSVteL?=
 =?us-ascii?Q?XozmcQFufmPZ4u+hN8CLDZYsTD25GlKFZIY6RI5UefsitVpzEXGqNWTLggq3?=
 =?us-ascii?Q?y8pbD/wbtHv38fMoUNGV2im9MLEw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 14:34:49.9292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 021f1f9e-2393-4caf-2263-08dc742302d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

There are three  originators for the PCI configuration space access:
1. The domain that owns physical host bridge: MMIO handlers are
there so we can update vPCI register handlers with the values
written by the hardware domain, e.g. physical view of the registers
vs guest's view on the configuration space.
2. Guest access to the passed through PCI devices: we need to properly
map virtual bus topology to the physical one, e.g. pass the configuration
space access to the corresponding physical devices.
3. Emulated host PCI bridge access. It doesn't exist in the physical
topology, e.g. it can't be mapped to some physical host bridge.
So, all access to the host bridge itself needs to be trapped and
emulated.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
In v11:
- Fixed format issues
- Added ASSERT_UNREACHABLE() to the dummy implementation of
vpci_translate_virtual_device()
- Moved variable in vpci_sbdf_from_gpa(), now it is easier to follow
the logic in the function
Since v9:
- Commend about required lock replaced with ASSERT()
- Style fixes
- call to vpci_translate_virtual_device folded into vpci_sbdf_from_gpa
Since v8:
- locks moved out of vpci_translate_virtual_device()
Since v6:
- add pcidevs locking to vpci_translate_virtual_device
- update wrt to the new locking scheme
Since v5:
- add vpci_translate_virtual_device for #ifndef CONFIG_HAS_VPCI_GUEST_SUPPORT
  case to simplify ifdefery
- add ASSERT(!is_hardware_domain(d)); to vpci_translate_virtual_device
- reset output register on failed virtual SBDF translation
Since v4:
- indentation fixes
- constify struct domain
- updated commit message
- updates to the new locking scheme (pdev->vpci_lock)
Since v3:
- revisit locking
- move code to vpci.c
Since v2:
 - pass struct domain instead of struct vcpu
 - constify arguments where possible
 - gate relevant code with CONFIG_HAS_VPCI_GUEST_SUPPORT
New in v2
---
 xen/arch/arm/vpci.c     | 47 +++++++++++++++++++++++++++++++----------
 xen/drivers/vpci/vpci.c | 24 +++++++++++++++++++++
 xen/include/xen/vpci.h  | 12 +++++++++++
 3 files changed, 72 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 3bc4bb55082a..7a6a0017d132 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -7,31 +7,51 @@
 
 #include <asm/mmio.h>
 
-static pci_sbdf_t vpci_sbdf_from_gpa(const struct pci_host_bridge *bridge,
-                                     paddr_t gpa)
+static bool vpci_sbdf_from_gpa(struct domain *d,
+                               const struct pci_host_bridge *bridge,
+                               paddr_t gpa, pci_sbdf_t *sbdf)
 {
-    pci_sbdf_t sbdf;
+    bool translated = true;
+
+    ASSERT(sbdf);
 
     if ( bridge )
     {
-        sbdf.sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
-        sbdf.seg = bridge->segment;
-        sbdf.bus += bridge->cfg->busn_start;
+        sbdf->sbdf = VPCI_ECAM_BDF(gpa - bridge->cfg->phys_addr);
+        sbdf->seg = bridge->segment;
+        sbdf->bus += bridge->cfg->busn_start;
     }
     else
-        sbdf.sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
+    {
+        /*
+         * For the passed through devices we need to map their virtual SBDF
+         * to the physical PCI device being passed through.
+         */
+        sbdf->sbdf = VPCI_ECAM_BDF(gpa - GUEST_VPCI_ECAM_BASE);
+        read_lock(&d->pci_lock);
+        translated = vpci_translate_virtual_device(d, sbdf);
+        read_unlock(&d->pci_lock);
+    }
 
-    return sbdf;
+    return translated;
 }
 
 static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
                           register_t *r, void *p)
 {
     struct pci_host_bridge *bridge = p;
-    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
+    ASSERT(!bridge == !is_hardware_domain(v->domain));
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+    {
+        *r = ~0UL;
+        return 1;
+    }
+
     if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
                         1U << info->dabt.size, &data) )
     {
@@ -39,7 +59,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
         return 1;
     }
 
-    *r = ~0ul;
+    *r = ~0UL;
 
     return 0;
 }
@@ -48,7 +68,12 @@ static int vpci_mmio_write(struct vcpu *v, mmio_info_t *info,
                            register_t r, void *p)
 {
     struct pci_host_bridge *bridge = p;
-    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
+    pci_sbdf_t sbdf;
+
+    ASSERT(!bridge == !is_hardware_domain(v->domain));
+
+    if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
+        return 1;
 
     return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
                            1U << info->dabt.size, r);
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 23722634d50b..98b294f09688 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -81,6 +81,30 @@ static int add_virtual_device(struct pci_dev *pdev)
     return 0;
 }
 
+/*
+ * Find the physical device which is mapped to the virtual device
+ * and translate virtual SBDF to the physical one.
+ */
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf)
+{
+    const struct pci_dev *pdev;
+
+    ASSERT(!is_hardware_domain(d));
+    ASSERT(rw_is_locked(&d->pci_lock));
+
+    for_each_pdev ( d, pdev )
+    {
+        if ( pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf) )
+        {
+            /* Replace guest SBDF with the physical one. */
+            *sbdf = pdev->sbdf;
+            return true;
+        }
+    }
+
+    return false;
+}
+
 #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
 
 void vpci_deassign_device(struct pci_dev *pdev)
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 980aded26fc1..7e5a0f0c50c1 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -303,6 +303,18 @@ static inline bool __must_check vpci_process_pending(struct vcpu *v)
 }
 #endif
 
+#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
+bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf);
+#else
+static inline bool vpci_translate_virtual_device(const struct domain *d,
+                                                 pci_sbdf_t *sbdf)
+{
+    ASSERT_UNREACHABLE();
+
+    return false;
+}
+#endif
+
 #endif
 
 /*
-- 
2.43.2


