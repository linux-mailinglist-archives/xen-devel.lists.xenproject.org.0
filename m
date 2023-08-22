Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2E578375F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 03:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588001.919430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGF3-0002Xy-Ct; Tue, 22 Aug 2023 01:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588001.919430; Tue, 22 Aug 2023 01:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYGF3-0002V4-6R; Tue, 22 Aug 2023 01:31:33 +0000
Received: by outflank-mailman (input) for mailman id 588001;
 Tue, 22 Aug 2023 01:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MiiM=EH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qYGF1-0000x4-1U
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 01:31:31 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20610.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cc527ed-408b-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 03:31:28 +0200 (CEST)
Received: from MW4PR04CA0386.namprd04.prod.outlook.com (2603:10b6:303:81::31)
 by CH0PR12MB8531.namprd12.prod.outlook.com (2603:10b6:610:181::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 01:31:24 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::af) by MW4PR04CA0386.outlook.office365.com
 (2603:10b6:303:81::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 01:31:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.15 via Frontend Transport; Tue, 22 Aug 2023 01:31:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 21 Aug
 2023 20:31:21 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 21 Aug 2023 20:31:20 -0500
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
X-Inumbo-ID: 9cc527ed-408b-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpyQdlPYuaT7L+0tvcW8UVhtSzAikGq7V1RtNyl7qQOPhFH7Q7I8gf8yi2PEJB6nxrbSx72hSjyn2qZqgOR63Ri0pfx34nRfJloMvfxS594QxTpxYBZArXo9MLsm6lIzIM304qJKjrbFF9ClYDUmv/eATu1mEelKaKn130b5uWQsYWT2ui/0XGHU+BNL9xvkqGAZosFGWRzhMF4p2Vwvm1ysetVYGWveN1PLO9H1zQwo8DJJmnTVlmCewH1P//uZMSO3d3R1hRJznaMSFS63ZJ+YpMJqUuOFGs+xO63+lcx8JBONaO4FiWX1tJUB3Q7llmvzt9Y9W0u+HYPdGbLhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z48CuLPSHvch6OlJ6rBBQjOhGn404jnXwk0sx8bu/wA=;
 b=cCs0EnuIddXvqkkCND40qU8Tpx1uqnJipnm+cUIpb7OCFjiPxjRb/xDykgzOXNUAGkvR3kcj8+sO4uAyJMRooR+ifM6Xd5FRE/79jyovKJXjSKZnZlszhI3/fTEbiIMG0wHikn7Ayfd5ER8mMsRI6/4NoZUbuUEsz9Gof+cIBQJB+XRZFo1eb2yRSa34VgXoBasuyTyKYLRtpzVoxuUomkTnCzccLh9KHLdlyTQjAJIU0gFA6kL28y8pbIHekI+lDR9d5e22OeNWWIEt15ti8wYQEuV6S9c5kA2s543wLHqtMW5Dg/zBQv9s8kBQWlPB17GI6rbk8HaQt/UkY/vh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z48CuLPSHvch6OlJ6rBBQjOhGn404jnXwk0sx8bu/wA=;
 b=LBaj930kzzLLAfdJmXCmJH73iXI7I2vH7CnCtg8DUtTURYdaJG+eBdj4hB9yA/6bx2//61Z8Vf6/gTq2W7lHIqREbj5ljDipKbygYeeWO7lXjTXmH4aBURyPZqSIGvMNoLmHBJlQ/kdcvqnUM3MsRG+U+Ky9uUcN/rJvojoQb/g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 2/4] xen/pci: convert pci_find_*cap* to pci_sbdf_t
Date: Mon, 21 Aug 2023 21:29:50 -0400
Message-ID: <20230822012955.312930-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822012955.312930-1-stewart.hildebrand@amd.com>
References: <20230822012955.312930-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|CH0PR12MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: 2379a4e4-acc9-491e-c50c-08dba2af7e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D+rUf/7jWu+iLY9fSUbL1lgpk0ZZyiyGag45j8BygHj+jrvIGn+vOrrFA8VwnNQI3ZVZhNTqyPhVS4f3awIcU6vohYgHGGWPFXs9M+iPVYxtjI/J9Bg37cB8dzYAckIeaWJyD8b/vql4+4VfILQqHqEEUod2lp3SglxOSthapHqlSoEM5AugXAwPPzAvED6h+MLltsDfxnEv5T+AN2KjdSan6YkuzoOM25+ahTVdi619TjPR5QRVmBdpz7bLfQzOR7Ghk4npaBtaaMjtEeiwXarU5S3Wm4AMIdPy6yUzW/hQ/cUtGj0HEEtPJ6dGBVyW5xH0zNvq75B3pwHmArk1rXyTqmnZOQIDnapgp/uRtl0UXOHq/A6NDIQ+nft5m53t39SATjrguyMaC+tk9EuJ6iLTDIVwdgY3KxIFFOsgUi/y+Kc9en17BOqsm9jnTOdaBCmg9I8Ac7M2v0JdHERWCKrZAiStI9HC8dwkH3pSQ0Wg7eVDEaBDcZ/zegDPCNS5+9jkany3e8w1/YRKymET5vvC0f1S0H6CkeEzR0wVnhMQpdtYKexsqcH+OSbRvjkEXSdrgAEsmXAXr/CP0mbJm8AtM7HrAILAqV4pifPRBzTyMfllx5Lyq3aREF6wlm/om8Nbne13TxQCXmJgK4vJvPgPvLnKiCBxqEOATMG4OwFCHVlI3qeUzyhSRsoglfYHcwRFARqCz/PNiuo9zW1/rRPRrPWCmUOmeBoLnMzVxJ/PJvnSz5OtydTagI4jNc1gle4mDUT/VCTIBJiAMXyMNg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(82310400011)(451199024)(1800799009)(186009)(36840700001)(40470700004)(46966006)(2906002)(30864003)(7416002)(40480700001)(83380400001)(5660300002)(44832011)(336012)(426003)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(4326008)(70206006)(316002)(70586007)(6916009)(54906003)(478600001)(356005)(82740400003)(81166007)(6666004)(36756003)(41300700001)(40460700003)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 01:31:22.8649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2379a4e4-acc9-491e-c50c-08dba2af7e9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8531

Convert pci_find_*cap* functions and call sites to pci_sbdf_t, and remove some
now unused local variables. No functional change.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
I built with EXTRA_CFLAGS_XEN_CORE="-Wunused-but-set-variable" (and
unfortunately -Wno-error=unused-but-set-variable too) to identify locations of
unneeded local variables as a result of the change to pci_sbdf_t.

v2->v3:
* new patch
---
 xen/arch/x86/msi.c                         | 47 ++++++----------------
 xen/drivers/char/ehci-dbgp.c               |  3 +-
 xen/drivers/passthrough/amd/iommu_detect.c |  2 +-
 xen/drivers/passthrough/ats.c              |  4 +-
 xen/drivers/passthrough/ats.h              |  6 ++-
 xen/drivers/passthrough/msi.c              |  6 +--
 xen/drivers/passthrough/pci.c              | 20 ++++-----
 xen/drivers/passthrough/vtd/quirks.c       | 10 ++---
 xen/drivers/passthrough/vtd/x86/ats.c      |  3 +-
 xen/drivers/pci/pci.c                      | 28 ++++++-------
 xen/drivers/vpci/msi.c                     |  4 +-
 xen/drivers/vpci/msix.c                    |  4 +-
 xen/include/xen/pci.h                      |  9 ++---
 13 files changed, 53 insertions(+), 93 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index d0bf63df1def..13a1f0319a8a 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -283,7 +283,7 @@ static void msi_set_enable(struct pci_dev *dev, int enable)
     u8 slot = PCI_SLOT(dev->devfn);
     u8 func = PCI_FUNC(dev->devfn);
 
-    pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSI);
+    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
     if ( pos )
         __msi_set_enable(seg, bus, slot, func, pos, enable);
 }
@@ -291,12 +291,9 @@ static void msi_set_enable(struct pci_dev *dev, int enable)
 static void msix_set_enable(struct pci_dev *dev, int enable)
 {
     int pos;
-    u16 control, seg = dev->seg;
-    u8 bus = dev->bus;
-    u8 slot = PCI_SLOT(dev->devfn);
-    u8 func = PCI_FUNC(dev->devfn);
+    u16 control;
 
-    pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSIX);
+    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
     if ( pos )
     {
         control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
@@ -318,17 +315,12 @@ static bool msi_set_mask_bit(struct irq_desc *desc, bool host, bool guest)
 {
     struct msi_desc *entry = desc->msi_desc;
     struct pci_dev *pdev;
-    u16 seg, control;
-    u8 bus, slot, func;
+    u16 control;
     bool flag = host || guest, maskall;
 
     ASSERT(spin_is_locked(&desc->lock));
     BUG_ON(!entry || !entry->dev);
     pdev = entry->dev;
-    seg = pdev->seg;
-    bus = pdev->bus;
-    slot = PCI_SLOT(pdev->devfn);
-    func = PCI_FUNC(pdev->devfn);
     switch ( entry->msi_attrib.type )
     {
     case PCI_CAP_ID_MSI:
@@ -608,13 +600,10 @@ static int msi_capability_init(struct pci_dev *dev,
     struct msi_desc *entry;
     int pos;
     unsigned int i, mpos;
-    u16 control, seg = dev->seg;
-    u8 bus = dev->bus;
-    u8 slot = PCI_SLOT(dev->devfn);
-    u8 func = PCI_FUNC(dev->devfn);
+    u16 control;
 
     ASSERT(pcidevs_locked());
-    pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSI);
+    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
     if ( !pos )
         return -ENODEV;
     control = pci_conf_read16(dev->sbdf, msi_control_reg(pos));
@@ -685,8 +674,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
     {
         struct pci_dev *pdev = pci_get_pdev(NULL,
                                             PCI_SBDF(seg, bus, slot, func));
-        unsigned int pos = pci_find_ext_capability(seg, bus,
-                                                   PCI_DEVFN(slot, func),
+        unsigned int pos = pci_find_ext_capability(PCI_SBDF(seg, bus, slot,
+                                                            func),
                                                    PCI_EXT_CAP_ID_SRIOV);
         uint16_t ctrl = pci_conf_read16(PCI_SBDF(seg, bus, slot, func),
                                         pos + PCI_SRIOV_CTRL);
@@ -777,8 +766,7 @@ static int msix_capability_init(struct pci_dev *dev,
     u8 slot = PCI_SLOT(dev->devfn);
     u8 func = PCI_FUNC(dev->devfn);
     bool maskall = msix->host_maskall, zap_on_error = false;
-    unsigned int pos = pci_find_cap_offset(seg, bus, slot, func,
-                                           PCI_CAP_ID_MSIX);
+    unsigned int pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
 
     if ( !pos )
         return -ENODEV;
@@ -1102,12 +1090,7 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
 static void __pci_disable_msix(struct msi_desc *entry)
 {
     struct pci_dev *dev = entry->dev;
-    u16 seg = dev->seg;
-    u8 bus = dev->bus;
-    u8 slot = PCI_SLOT(dev->devfn);
-    u8 func = PCI_FUNC(dev->devfn);
-    unsigned int pos = pci_find_cap_offset(seg, bus, slot, func,
-                                           PCI_CAP_ID_MSIX);
+    unsigned int pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
     u16 control = pci_conf_read16(dev->sbdf,
                                   msix_control_reg(entry->msi_attrib.pos));
     bool maskall = dev->msix->host_maskall;
@@ -1211,8 +1194,7 @@ void pci_cleanup_msi(struct pci_dev *pdev)
 
 int pci_reset_msix_state(struct pci_dev *pdev)
 {
-    unsigned int pos = pci_find_cap_offset(pdev->seg, pdev->bus, pdev->sbdf.dev,
-                                           pdev->sbdf.fn, PCI_CAP_ID_MSIX);
+    unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
 
     ASSERT(pos);
     /*
@@ -1234,10 +1216,6 @@ int pci_reset_msix_state(struct pci_dev *pdev)
 int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
                                  unsigned int size, uint32_t *data)
 {
-    u16 seg = pdev->seg;
-    u8 bus = pdev->bus;
-    u8 slot = PCI_SLOT(pdev->devfn);
-    u8 func = PCI_FUNC(pdev->devfn);
     struct msi_desc *entry;
     unsigned int pos;
 
@@ -1245,8 +1223,7 @@ int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
     {
         entry = find_msi_entry(pdev, -1, PCI_CAP_ID_MSIX);
         pos = entry ? entry->msi_attrib.pos
-                    : pci_find_cap_offset(seg, bus, slot, func,
-                                          PCI_CAP_ID_MSIX);
+                    : pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
         ASSERT(pos);
 
         if ( reg >= pos && reg < msix_pba_offset_reg(pos) + 4 )
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 72be4d9cc970..00cbdd5454dd 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -687,7 +687,8 @@ static unsigned int __init __find_dbgp(u8 bus, u8 slot, u8 func)
     if ( (class >> 8) != PCI_CLASS_SERIAL_USB_EHCI )
         return 0;
 
-    return pci_find_cap_offset(0, bus, slot, func, PCI_CAP_ID_EHCI_DEBUG);
+    return pci_find_cap_offset(PCI_SBDF(0, bus, slot, func),
+                               PCI_CAP_ID_EHCI_DEBUG);
 }
 
 static unsigned int __init find_dbgp(struct ehci_dbgp *dbgp,
diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/passthrough/amd/iommu_detect.c
index 2317fa6a7d8d..cede44e6518f 100644
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -27,7 +27,7 @@ static int __init get_iommu_msi_capabilities(
 {
     int pos;
 
-    pos = pci_find_cap_offset(seg, bus, dev, func, PCI_CAP_ID_MSI);
+    pos = pci_find_cap_offset(PCI_SBDF(seg, bus, dev, func), PCI_CAP_ID_MSI);
 
     if ( !pos )
         return -ENODEV;
diff --git a/xen/drivers/passthrough/ats.c b/xen/drivers/passthrough/ats.c
index 7f7b16dc490c..eec6eec00043 100644
--- a/xen/drivers/passthrough/ats.c
+++ b/xen/drivers/passthrough/ats.c
@@ -24,11 +24,9 @@ boolean_param("ats", ats_enabled);
 int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list)
 {
     u32 value;
-    u16 seg = pdev->seg;
-    u8 bus = pdev->bus, devfn = pdev->devfn;
     int pos;
 
-    pos = pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
+    pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
     BUG_ON(!pos);
 
     if ( iommu_verbose )
diff --git a/xen/drivers/passthrough/ats.h b/xen/drivers/passthrough/ats.h
index c202f4ecdd67..08a901187c54 100644
--- a/xen/drivers/passthrough/ats.h
+++ b/xen/drivers/passthrough/ats.h
@@ -32,7 +32,8 @@ static inline int pci_ats_enabled(int seg, int bus, int devfn)
     u32 value;
     int pos;
 
-    pos = pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
+    pos = pci_find_ext_capability(PCI_SBDF(seg, bus, devfn),
+                                  PCI_EXT_CAP_ID_ATS);
     BUG_ON(!pos);
 
     value = pci_conf_read16(PCI_SBDF(seg, bus, devfn), pos + ATS_REG_CTL);
@@ -45,7 +46,8 @@ static inline int pci_ats_device(int seg, int bus, int devfn)
     if ( !ats_enabled )
         return 0;
 
-    return pci_find_ext_capability(seg, bus, devfn, PCI_EXT_CAP_ID_ATS);
+    return pci_find_ext_capability(PCI_SBDF(seg, bus, devfn),
+                                   PCI_EXT_CAP_ID_ATS);
 }
 
 #endif /* _ATS_H_ */
diff --git a/xen/drivers/passthrough/msi.c b/xen/drivers/passthrough/msi.c
index fb78e2ebe8a4..13d904692ef8 100644
--- a/xen/drivers/passthrough/msi.c
+++ b/xen/drivers/passthrough/msi.c
@@ -24,8 +24,7 @@ int pdev_msi_init(struct pci_dev *pdev)
 
     INIT_LIST_HEAD(&pdev->msi_list);
 
-    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
-                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSI);
+    pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSI);
     if ( pos )
     {
         uint16_t ctrl = pci_conf_read16(pdev->sbdf, msi_control_reg(pos));
@@ -33,8 +32,7 @@ int pdev_msi_init(struct pci_dev *pdev)
         pdev->msi_maxvec = multi_msi_capable(ctrl);
     }
 
-    pos = pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
-                              PCI_FUNC(pdev->devfn), PCI_CAP_ID_MSIX);
+    pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
     if ( pos )
     {
         struct arch_msix *msix = xzalloc(struct arch_msix);
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 33452791a8e0..219b357efb14 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -361,8 +361,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
             break;
 
         case DEV_TYPE_PCIe_ENDPOINT:
-            pos = pci_find_cap_offset(pseg->nr, bus, PCI_SLOT(devfn),
-                                      PCI_FUNC(devfn), PCI_CAP_ID_EXP);
+            pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP);
             BUG_ON(!pos);
             cap = pci_conf_read16(pdev->sbdf, pos + PCI_EXP_DEVCAP);
             if ( cap & PCI_EXP_DEVCAP_PHANTOM )
@@ -565,13 +564,12 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
 static void pci_enable_acs(struct pci_dev *pdev)
 {
     int pos;
-    u16 cap, ctrl, seg = pdev->seg;
-    u8 bus = pdev->bus;
+    u16 cap, ctrl;
 
     if ( !is_iommu_enabled(pdev->domain) )
         return;
 
-    pos = pci_find_ext_capability(seg, bus, pdev->devfn, PCI_EXT_CAP_ID_ACS);
+    pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ACS);
     if (!pos)
         return;
 
@@ -704,7 +702,7 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
 
     if ( !pdev->info.is_virtfn && !pdev->vf_rlen[0] )
     {
-        unsigned int pos = pci_find_ext_capability(seg, bus, devfn,
+        unsigned int pos = pci_find_ext_capability(pdev->sbdf,
                                                    PCI_EXT_CAP_ID_SRIOV);
         uint16_t ctrl = pci_conf_read16(pdev->sbdf, pos + PCI_SRIOV_CTRL);
 
@@ -916,7 +914,7 @@ enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn)
 {
     u16 class_device, creg;
     u8 d = PCI_SLOT(devfn), f = PCI_FUNC(devfn);
-    int pos = pci_find_cap_offset(seg, bus, d, f, PCI_CAP_ID_EXP);
+    int pos = pci_find_cap_offset(PCI_SBDF(seg, bus, devfn), PCI_CAP_ID_EXP);
 
     class_device = pci_conf_read16(PCI_SBDF(seg, bus, d, f), PCI_CLASS_DEVICE);
     switch ( class_device )
@@ -1184,10 +1182,7 @@ static int hest_match_pci(const struct acpi_hest_aer_common *p,
 static bool_t hest_match_type(const struct acpi_hest_header *hest_hdr,
                               const struct pci_dev *pdev)
 {
-    unsigned int pos = pci_find_cap_offset(pdev->seg, pdev->bus,
-                                           PCI_SLOT(pdev->devfn),
-                                           PCI_FUNC(pdev->devfn),
-                                           PCI_CAP_ID_EXP);
+    unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP);
     u8 pcie = MASK_EXTR(pci_conf_read16(pdev->sbdf, pos + PCI_EXP_FLAGS),
                         PCI_EXP_FLAGS_TYPE);
 
@@ -1258,8 +1253,7 @@ bool_t pcie_aer_get_firmware_first(const struct pci_dev *pdev)
 {
     struct aer_hest_parse_info info = { .pdev = pdev };
 
-    return pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
-                               PCI_FUNC(pdev->devfn), PCI_CAP_ID_EXP) &&
+    return pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP) &&
            apei_hest_parse(aer_hest_parse, &info) >= 0 &&
            info.firmware_first;
 }
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index fcc8f73e8b90..e1946c268beb 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -495,8 +495,6 @@ int me_wifi_quirk(struct domain *domain, uint8_t bus, uint8_t devfn,
 
 void pci_vtd_quirk(const struct pci_dev *pdev)
 {
-    int seg = pdev->seg;
-    int bus = pdev->bus;
     int pos;
     bool_t ff;
     u32 val, val2;
@@ -532,12 +530,10 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
     /* Sandybridge-EP (Romley) */
     case 0x3c00: /* host bridge */
     case 0x3c01 ... 0x3c0b: /* root ports */
-        pos = pci_find_ext_capability(seg, bus, pdev->devfn,
-                                      PCI_EXT_CAP_ID_ERR);
+        pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ERR);
         if ( !pos )
         {
-            pos = pci_find_ext_capability(seg, bus, pdev->devfn,
-                                          PCI_EXT_CAP_ID_VNDR);
+            pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_VNDR);
             while ( pos )
             {
                 val = pci_conf_read32(pdev->sbdf, pos + PCI_VNDR_HEADER);
@@ -546,7 +542,7 @@ void pci_vtd_quirk(const struct pci_dev *pdev)
                     pos += PCI_VNDR_HEADER;
                     break;
                 }
-                pos = pci_find_next_ext_capability(seg, bus, pdev->devfn, pos,
+                pos = pci_find_next_ext_capability(pdev->sbdf, pos,
                                                    PCI_EXT_CAP_ID_VNDR);
             }
             ff = 0;
diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/x86/ats.c
index 04d702b1d6b1..d9d93df0260f 100644
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -57,8 +57,7 @@ int ats_device(const struct pci_dev *pdev, const struct acpi_drhd_unit *drhd)
         return 0;
 
     ats_drhd = find_ats_dev_drhd(drhd->iommu);
-    pos = pci_find_ext_capability(pdev->seg, pdev->bus, pdev->devfn,
-                                  PCI_EXT_CAP_ID_ATS);
+    pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
 
     if ( pos && (ats_drhd == NULL) )
     {
diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index c73a8c4124af..3bcb74040284 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -8,25 +8,25 @@
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
 
-int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap)
+int pci_find_cap_offset(pci_sbdf_t sbdf, u8 cap)
 {
     u8 id;
     int max_cap = 48;
     u8 pos = PCI_CAPABILITY_LIST;
     u16 status;
 
-    status = pci_conf_read16(PCI_SBDF(seg, bus, dev, func), PCI_STATUS);
+    status = pci_conf_read16(sbdf, PCI_STATUS);
     if ( (status & PCI_STATUS_CAP_LIST) == 0 )
         return 0;
 
     while ( max_cap-- )
     {
-        pos = pci_conf_read8(PCI_SBDF(seg, bus, dev, func), pos);
+        pos = pci_conf_read8(sbdf, pos);
         if ( pos < 0x40 )
             break;
 
         pos &= ~3;
-        id = pci_conf_read8(PCI_SBDF(seg, bus, dev, func), pos + PCI_CAP_LIST_ID);
+        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
 
         if ( id == 0xff )
             break;
@@ -39,19 +39,19 @@ int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap)
     return 0;
 }
 
-int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap)
+int pci_find_next_cap(pci_sbdf_t sbdf, u8 pos, int cap)
 {
     u8 id;
     int ttl = 48;
 
     while ( ttl-- )
     {
-        pos = pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos);
+        pos = pci_conf_read8(sbdf, pos);
         if ( pos < 0x40 )
             break;
 
         pos &= ~3;
-        id = pci_conf_read8(PCI_SBDF(seg, bus, devfn), pos + PCI_CAP_LIST_ID);
+        id = pci_conf_read8(sbdf, pos + PCI_CAP_LIST_ID);
 
         if ( id == 0xff )
             break;
@@ -65,21 +65,21 @@ int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap)
 
 /**
  * pci_find_ext_capability - Find an extended capability
- * @seg/@bus/@devfn: PCI device to query
+ * @sbdf: PCI device to query
  * @cap: capability code
  *
  * Returns the address of the requested extended capability structure
  * within the device's PCI configuration space or 0 if the device does
  * not support it.
  */
-int pci_find_ext_capability(int seg, int bus, int devfn, int cap)
+int pci_find_ext_capability(pci_sbdf_t sbdf, int cap)
 {
-    return pci_find_next_ext_capability(seg, bus, devfn, 0, cap);
+    return pci_find_next_ext_capability(sbdf, 0, cap);
 }
 
 /**
  * pci_find_next_ext_capability - Find another extended capability
- * @seg/@bus/@devfn: PCI device to query
+ * @sbdf: PCI device to query
  * @start: starting position
  * @cap: capability code
  *
@@ -87,13 +87,13 @@ int pci_find_ext_capability(int seg, int bus, int devfn, int cap)
  * within the device's PCI configuration space or 0 if the device does
  * not support it.
  */
-int pci_find_next_ext_capability(int seg, int bus, int devfn, int start, int cap)
+int pci_find_next_ext_capability(pci_sbdf_t sbdf, int start, int cap)
 {
     u32 header;
     int ttl = 480; /* 3840 bytes, minimum 8 bytes per capability */
     int pos = max(start, 0x100);
 
-    header = pci_conf_read32(PCI_SBDF(seg, bus, devfn), pos);
+    header = pci_conf_read32(sbdf, pos);
 
     /*
      * If we have no capabilities, this is indicated by cap ID,
@@ -109,7 +109,7 @@ int pci_find_next_ext_capability(int seg, int bus, int devfn, int start, int cap
         pos = PCI_EXT_CAP_NEXT(header);
         if ( pos < 0x100 )
             break;
-        header = pci_conf_read32(PCI_SBDF(seg, bus, devfn), pos);
+        header = pci_conf_read32(sbdf, pos);
     }
     return 0;
 }
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 8f2b59e61aa4..78261c3f6e37 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -184,9 +184,7 @@ static void cf_check mask_write(
 
 static int cf_check init_msi(struct pci_dev *pdev)
 {
-    uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
-    unsigned int pos = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
-                                           PCI_CAP_ID_MSI);
+    unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSI);
     uint16_t control;
     int ret;
 
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 25bde77586a4..626e7058c964 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -659,14 +659,12 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
 static int cf_check init_msix(struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
-    uint8_t slot = PCI_SLOT(pdev->devfn), func = PCI_FUNC(pdev->devfn);
     unsigned int msix_offset, i, max_entries;
     uint16_t control;
     struct vpci_msix *msix;
     int rc;
 
-    msix_offset = pci_find_cap_offset(pdev->seg, pdev->bus, slot, func,
-                                      PCI_CAP_ID_MSIX);
+    msix_offset = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
     if ( !msix_offset )
         return 0;
 
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index a8c8c4ff11c3..8a482b15745c 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -193,11 +193,10 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
                    unsigned int devfn, int reg, int len, u32 *value);
 int pci_mmcfg_write(unsigned int seg, unsigned int bus,
                     unsigned int devfn, int reg, int len, u32 value);
-int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap);
-int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap);
-int pci_find_ext_capability(int seg, int bus, int devfn, int cap);
-int pci_find_next_ext_capability(int seg, int bus, int devfn, int start,
-                                 int cap);
+int pci_find_cap_offset(pci_sbdf_t sbdf, u8 cap);
+int pci_find_next_cap(pci_sbdf_t sbdf, u8 pos, int cap);
+int pci_find_ext_capability(pci_sbdf_t sbdf, int cap);
+int pci_find_next_ext_capability(pci_sbdf_t sbdf, int start, int cap);
 const char *parse_pci(const char *, unsigned int *seg, unsigned int *bus,
                       unsigned int *dev, unsigned int *func);
 const char *parse_pci_seg(const char *, unsigned int *seg, unsigned int *bus,
-- 
2.41.0


