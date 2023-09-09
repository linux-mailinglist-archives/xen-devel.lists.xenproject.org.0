Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659227995ED
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 04:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598342.933077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qenYE-0003GD-Cz; Sat, 09 Sep 2023 02:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598342.933077; Sat, 09 Sep 2023 02:18:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qenYE-0003EI-7T; Sat, 09 Sep 2023 02:18:22 +0000
Received: by outflank-mailman (input) for mailman id 598342;
 Sat, 09 Sep 2023 02:18:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vbb/=EZ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qenYD-0002vo-03
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 02:18:21 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 248f71a8-4eb7-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 04:18:19 +0200 (CEST)
Received: from SA0PR13CA0005.namprd13.prod.outlook.com (2603:10b6:806:130::10)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.34; Sat, 9 Sep 2023 02:18:13 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:130:cafe::11) by SA0PR13CA0005.outlook.office365.com
 (2603:10b6:806:130::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.11 via Frontend
 Transport; Sat, 9 Sep 2023 02:18:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Sat, 9 Sep 2023 02:18:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 21:18:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Sep
 2023 21:18:11 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 8 Sep 2023 21:18:09 -0500
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
X-Inumbo-ID: 248f71a8-4eb7-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jr4mkQ3VphiVOmd2Ew90MY3z7xDt/B+zoZpt3NgRHvbglhlKjUOZIoXP3LXxztraQyISDnlL1Sm83L19UjCkQURrkvcKWX5OjjKi0Nv53XCSTMOI6fuelSUxr0xtotmVDd41Tb3bXpoPF6/sUTmQCsKWz1A3Ukluf2pkGmvKDigaAhn8wf/fzPPx0T3w2GxKjjYbvT/dSS5JO0J2wQaD+hxSE4QoKnwgRCzhpFBAZeWllqBn4XwSgX/i9N9jkhFpflYaW6a8A9Y17llH96ZJcONVOtKC9i8J523TA232XTi5rIF5Rt12iFTxCCvevz6KdDhTVc+IXdhQ4llTmFHxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjGm0180x9ZTq619vf/+c98/7pcXUYOoX80SRHhD/4c=;
 b=bDPr8pcuXpqnEc76NXZQgoOoY0O+lM0djg/6zQEij+IjwVtd+SGWI39ltKyaVT4/yL3KH4zblorKPdLCmUZ5DyqqnNkBoQjm9XFJHbGna0coeMNo2SzvK+4oG63yTsVv8TpgkgKAceRBJt3eiMeAFBVoZZX7x29wshOxgjBHNzCaUgG9CM28JJRtIGMSQhCgTXeD7xxxUnHwXTouADl1GNkQzcttakRAG6V8fdC/29CqsNvAN5yGcdbvMDEuxMoxcP4+pRwNJjQmTO0zZUKFCGyxD44lvhGTexW9iBcsKlb12AjgiXKTnyiwtarPgTvoNre/lOSPzHfjB8nGrj3G8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjGm0180x9ZTq619vf/+c98/7pcXUYOoX80SRHhD/4c=;
 b=yICR2VVVPamJX1ZbfUbpYuGvFs/mTF+ap1LRCxxpdcFwsjMKKv2RuRdOlRtsN3RhiomA1mstRqM2giytROSJNsgegkDDylzUCG8THv6zAJh4FjnuDg0S099G7/6ytMpq66hbth/vei1x+xMRoyiCQUdtdHfkXltW0ZUCMuMbaBg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v6 1/4] xen/pci: convert pci_find_*cap* to pci_sbdf_t
Date: Fri, 8 Sep 2023 22:16:25 -0400
Message-ID: <20230909021647.558115-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230909021647.558115-1-stewart.hildebrand@amd.com>
References: <20230909021647.558115-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: d656cc31-9064-4a9f-71af-08dbb0db047c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZKGeNJnhabWqqMDnRMuFb4SLYb97RzRz29d3vdmxhMZACGjt3dQwgtwrX85+CQllogmTrB/VVVvEmLndKb1usOrI8ae5ZIsd0Qgx/owHgnnVFKS+H1KYduPaHGtJuTHn3TuAGowlQQrTCi8ja5n33xe91jBQaxpXC9jdACsrNoP00685EjBZYccsSNNJHIyfqoYF3aqeyQAycWuLOUC1jc7L2C7q/rXWi+HiNZh+67LcozpjHU4E2mnVlZjFRB+lj/MtB8jipLgx7WJ00sXSxyirO+3KJOsFnJ6jNYrwCFK9eiKbNuBm9LpcimNDRNCry7V1a1hZymMVovGGGg5qy9emJtvWAjpfEInrnpmEvmZ+EbCU9aem7lDFD6v1aCcAWWXSvGKh28U6Ib1uiYEb2l8JSJ9btqvoKKVWXj/41dYj31wSZmWXbZxW4H5RW8bM1xF2quZ7otVAvJY84Ukc1BH7ofZZWtJcFHSD5pCkBMPQhWK7d0LhFpVFPpuBykjBv3hfkOXhs8OkDmLPsI+xeofFDTT6q2TjEGndVWKqnMgL5WpUjhjviClxlGFXkXc7YlRra61IKmUfEbKr68N2JkB6K29U1sYhp2i3b4xjrI3QdPCtuhzr9ZP2GYdBaJFWrUAgGLjeIU9R7aI3fPhHuSpNEOOQs3MXcl38xU90FsHNge2xC8ipDO1yds9NVTGpKSagboLMkBfxJm+/odQEbihgQlYf+cpRkyG7kk0s7LeBA41ST4k5ad4aMztGNlD+U4RG0N6UcEt0AmDNxfzfiA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(1800799009)(186009)(451199024)(82310400011)(40470700004)(46966006)(36840700001)(70206006)(81166007)(356005)(4326008)(6666004)(41300700001)(86362001)(40460700003)(26005)(1076003)(36756003)(82740400003)(47076005)(40480700001)(36860700001)(2906002)(2616005)(426003)(6916009)(336012)(83380400001)(478600001)(8676002)(8936002)(30864003)(5660300002)(54906003)(7416002)(44832011)(70586007)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2023 02:18:12.2022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d656cc31-9064-4a9f-71af-08dbb0db047c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446

Convert pci_find_*cap* functions and call sites to pci_sbdf_t, and remove some
now unused local variables. Also change to more appropriate types on lines that
are already being modified as a result of the pci_sbdf_t conversion.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
I built with EXTRA_CFLAGS_XEN_CORE="-Wunused-but-set-variable" (and
unfortunately -Wno-error=unused-but-set-variable too) to identify locations of
unneeded local variables as a result of the change to pci_sbdf_t.

v5->v6:
* no change

v4->v5:
* add Jan's R-b

v3->v4:
* use more appropriate types on lines that are being modified anyway
* remove "no functional change" from commit description

v2->v3:
* new patch
---
 xen/arch/x86/msi.c                         | 40 ++++++----------------
 xen/drivers/char/ehci-dbgp.c               |  3 +-
 xen/drivers/passthrough/amd/iommu_detect.c |  2 +-
 xen/drivers/passthrough/ats.c              |  4 +--
 xen/drivers/passthrough/ats.h              |  6 ++--
 xen/drivers/passthrough/msi.c              |  6 ++--
 xen/drivers/passthrough/pci.c              | 21 +++++-------
 xen/drivers/passthrough/vtd/quirks.c       | 10 ++----
 xen/drivers/passthrough/vtd/x86/ats.c      |  3 +-
 xen/drivers/pci/pci.c                      | 32 +++++++++--------
 xen/drivers/vpci/msi.c                     |  4 +--
 xen/drivers/vpci/msix.c                    |  4 +--
 xen/include/xen/pci.h                      | 11 +++---
 13 files changed, 58 insertions(+), 88 deletions(-)

diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 41b82f3e87cb..8d4fd43b10a6 100644
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
+    uint16_t control;
 
-    pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSIX);
+    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
     if ( pos )
     {
         control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
@@ -603,13 +600,10 @@ static int msi_capability_init(struct pci_dev *dev,
     struct msi_desc *entry;
     int pos;
     unsigned int i, mpos;
-    u16 control, seg = dev->seg;
-    u8 bus = dev->bus;
-    u8 slot = PCI_SLOT(dev->devfn);
-    u8 func = PCI_FUNC(dev->devfn);
+    uint16_t control;
 
     ASSERT(pcidevs_locked());
-    pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSI);
+    pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSI);
     if ( !pos )
         return -ENODEV;
     control = pci_conf_read16(dev->sbdf, msi_control_reg(pos));
@@ -680,8 +674,8 @@ static u64 read_pci_mem_bar(u16 seg, u8 bus, u8 slot, u8 func, u8 bir, int vf)
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
@@ -772,8 +766,7 @@ static int msix_capability_init(struct pci_dev *dev,
     u8 slot = PCI_SLOT(dev->devfn);
     u8 func = PCI_FUNC(dev->devfn);
     bool maskall = msix->host_maskall, zap_on_error = false;
-    unsigned int pos = pci_find_cap_offset(seg, bus, slot, func,
-                                           PCI_CAP_ID_MSIX);
+    unsigned int pos = pci_find_cap_offset(dev->sbdf, PCI_CAP_ID_MSIX);
 
     if ( !pos )
         return -ENODEV;
@@ -1097,12 +1090,7 @@ static void _pci_cleanup_msix(struct arch_msix *msix)
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
@@ -1206,8 +1194,7 @@ void pci_cleanup_msi(struct pci_dev *pdev)
 
 int pci_reset_msix_state(struct pci_dev *pdev)
 {
-    unsigned int pos = pci_find_cap_offset(pdev->seg, pdev->bus, pdev->sbdf.dev,
-                                           pdev->sbdf.fn, PCI_CAP_ID_MSIX);
+    unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
 
     ASSERT(pos);
     /*
@@ -1229,10 +1216,6 @@ int pci_reset_msix_state(struct pci_dev *pdev)
 int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
                                  unsigned int size, uint32_t *data)
 {
-    u16 seg = pdev->seg;
-    u8 bus = pdev->bus;
-    u8 slot = PCI_SLOT(pdev->devfn);
-    u8 func = PCI_FUNC(pdev->devfn);
     struct msi_desc *entry;
     unsigned int pos;
 
@@ -1240,8 +1223,7 @@ int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
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
index 253f5c2e1042..0da183d057c5 100644
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
index baa5f6a6dc04..f5e1d254e0d3 100644
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
index ed1f689227fa..04d00c7c37df 100644
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
+    uint16_t cap, ctrl;
 
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
 
@@ -916,7 +914,8 @@ enum pdev_type pdev_type(u16 seg, u8 bus, u8 devfn)
 {
     u16 class_device, creg;
     u8 d = PCI_SLOT(devfn), f = PCI_FUNC(devfn);
-    int pos = pci_find_cap_offset(seg, bus, d, f, PCI_CAP_ID_EXP);
+    unsigned int pos = pci_find_cap_offset(PCI_SBDF(seg, bus, devfn),
+                                           PCI_CAP_ID_EXP);
 
     class_device = pci_conf_read16(PCI_SBDF(seg, bus, d, f), PCI_CLASS_DEVICE);
     switch ( class_device )
@@ -1184,10 +1183,7 @@ static int hest_match_pci(const struct acpi_hest_aer_common *p,
 static bool hest_match_type(const struct acpi_hest_header *hest_hdr,
                               const struct pci_dev *pdev)
 {
-    unsigned int pos = pci_find_cap_offset(pdev->seg, pdev->bus,
-                                           PCI_SLOT(pdev->devfn),
-                                           PCI_FUNC(pdev->devfn),
-                                           PCI_CAP_ID_EXP);
+    unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP);
     u8 pcie = MASK_EXTR(pci_conf_read16(pdev->sbdf, pos + PCI_EXP_FLAGS),
                         PCI_EXP_FLAGS_TYPE);
 
@@ -1258,8 +1254,7 @@ bool pcie_aer_get_firmware_first(const struct pci_dev *pdev)
 {
     struct aer_hest_parse_info info = { .pdev = pdev };
 
-    return pci_find_cap_offset(pdev->seg, pdev->bus, PCI_SLOT(pdev->devfn),
-                               PCI_FUNC(pdev->devfn), PCI_CAP_ID_EXP) &&
+    return pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_EXP) &&
            apei_hest_parse(aer_hest_parse, &info) >= 0 &&
            info.firmware_first;
 }
diff --git a/xen/drivers/passthrough/vtd/quirks.c b/xen/drivers/passthrough/vtd/quirks.c
index 5d706a539788..5a56565ea883 100644
--- a/xen/drivers/passthrough/vtd/quirks.c
+++ b/xen/drivers/passthrough/vtd/quirks.c
@@ -495,8 +495,6 @@ int me_wifi_quirk(struct domain *domain, uint8_t bus, uint8_t devfn,
 
 void pci_vtd_quirk(const struct pci_dev *pdev)
 {
-    int seg = pdev->seg;
-    int bus = pdev->bus;
     int pos;
     bool ff;
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
index 9de419775f90..1f5913bed9d2 100644
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
index c73a8c4124af..3569ccb24e9e 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -8,25 +8,25 @@
 #include <xen/pci.h>
 #include <xen/pci_regs.h>
 
-int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap)
+unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap)
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
@@ -39,19 +39,20 @@ int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap)
     return 0;
 }
 
-int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap)
+unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
+                               unsigned int cap)
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
@@ -65,21 +66,21 @@ int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap)
 
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
+unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap)
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
@@ -87,13 +88,14 @@ int pci_find_ext_capability(int seg, int bus, int devfn, int cap)
  * within the device's PCI configuration space or 0 if the device does
  * not support it.
  */
-int pci_find_next_ext_capability(int seg, int bus, int devfn, int start, int cap)
+unsigned int pci_find_next_ext_capability(pci_sbdf_t sbdf, unsigned int start,
+                                          unsigned int cap)
 {
     u32 header;
     int ttl = 480; /* 3840 bytes, minimum 8 bytes per capability */
-    int pos = max(start, 0x100);
+    unsigned int pos = max(start, 0x100U);
 
-    header = pci_conf_read32(PCI_SBDF(seg, bus, devfn), pos);
+    header = pci_conf_read32(sbdf, pos);
 
     /*
      * If we have no capabilities, this is indicated by cap ID,
@@ -109,7 +111,7 @@ int pci_find_next_ext_capability(int seg, int bus, int devfn, int start, int cap
         pos = PCI_EXT_CAP_NEXT(header);
         if ( pos < 0x100 )
             break;
-        header = pci_conf_read32(PCI_SBDF(seg, bus, devfn), pos);
+        header = pci_conf_read32(sbdf, pos);
     }
     return 0;
 }
diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 2814b63d2be7..a253ccbd7db7 100644
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
index 1be861343dba..d1126a417da9 100644
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
index 7d8a7cd21301..ea6a4c9abf38 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -193,11 +193,12 @@ int pci_mmcfg_read(unsigned int seg, unsigned int bus,
                    unsigned int devfn, int reg, int len, u32 *value);
 int pci_mmcfg_write(unsigned int seg, unsigned int bus,
                     unsigned int devfn, int reg, int len, u32 value);
-int pci_find_cap_offset(u16 seg, u8 bus, u8 dev, u8 func, u8 cap);
-int pci_find_next_cap(u16 seg, u8 bus, unsigned int devfn, u8 pos, int cap);
-int pci_find_ext_capability(int seg, int bus, int devfn, int cap);
-int pci_find_next_ext_capability(int seg, int bus, int devfn, int start,
-                                 int cap);
+unsigned int pci_find_cap_offset(pci_sbdf_t sbdf, unsigned int cap);
+unsigned int pci_find_next_cap(pci_sbdf_t sbdf, unsigned int pos,
+                               unsigned int cap);
+unsigned int pci_find_ext_capability(pci_sbdf_t sbdf, unsigned int cap);
+unsigned int pci_find_next_ext_capability(pci_sbdf_t sbdf, unsigned int start,
+                                          unsigned int cap);
 const char *parse_pci(const char *, unsigned int *seg, unsigned int *bus,
                       unsigned int *dev, unsigned int *func);
 const char *parse_pci_seg(const char *, unsigned int *seg, unsigned int *bus,
-- 
2.42.0


