Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9664D7E7187
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 19:29:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629784.982256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19mi-000340-AM; Thu, 09 Nov 2023 18:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629784.982256; Thu, 09 Nov 2023 18:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19mi-00031p-7K; Thu, 09 Nov 2023 18:29:44 +0000
Received: by outflank-mailman (input) for mailman id 629784;
 Thu, 09 Nov 2023 18:29:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS/w=GW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r19mh-00005n-DQ
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 18:29:43 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1ab10bc-7f2d-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 19:29:41 +0100 (CET)
Received: from CH0PR03CA0189.namprd03.prod.outlook.com (2603:10b6:610:e4::14)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 18:29:37 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::7d) by CH0PR03CA0189.outlook.office365.com
 (2603:10b6:610:e4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 18:29:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Thu, 9 Nov 2023 18:29:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:29:35 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:29:35 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 9 Nov 2023 12:29:34 -0600
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
X-Inumbo-ID: f1ab10bc-7f2d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hs6rCOBEHwqsKXNWwKQGnU+p1HVRsQshj2iL2SbqjfzD28SvEOaa1t6WASy0BAecQ4J7OwZNCHImC2OmwAta+K4LLJwSz3u+oXbysVjJKIBznA9LISEfT1u+1v+m2FkHo5sunuvgh2mu4A04a2b68UThdwy5Qqz2kiph+nfGZLTUTlCK1zKWw1s68mh7anwwoA3GdY/oWJ/4aQMAiErOWNbIh2JwoYUvOE+d6e457DLZ2KqSYlwDQEGmII9sstBKUv6+2cnzYfh3WWc7ikp6UKUvwfHn51VXvqOnaZDIizYnxg6+VSH21oh0EhBnFxWIhxXs+eUFQK1aW5j3hB2ogA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQYTJpj4QbN4iIjk7+Mt55dnJorFy1YCp47ylKDnXSk=;
 b=iaiGESe5Y8SRtyxByoPwACufDSgba40N0IGaw1lHob7R8f2YWkMwMZh3GO7PVD3qTKmYTI+clXyK7ipJgz77kxzbbu/N9wOdTdMZdE1vpt7BDZ34/YXVnuik1lNkUU+JmtHF08O350K2N3/gPhWUDaus1k3c1pLF8tAhlmAt+KWpP7ChGk0mjWOeC2aALQh43ZGNbG+z4AbqeyccFfyyXipkBRqdxdmAWLVZUdFzsmWQRnUBNmfMl0ERWaDqv/Ewu+CzTf/T7ZGfY7dzsTkS52cpNRiRjgkR1o/qUWZ1sudmyawkp/gR6Z9HFhgwTZj+wQRLmgBVsZUUglY9YuaS+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQYTJpj4QbN4iIjk7+Mt55dnJorFy1YCp47ylKDnXSk=;
 b=yKPa9QuGCnQDfYCVCnX8SQkwgUrmTAgaVO4AcyjvUoLICOc3FOo4NHdw6mjo/hKag2x9iRrtQaJVM383LZ2gQ8mPcP7pjpOR9oa8gVPtTECOKCK7ICeNoXLi/E8eargDR9jAtCjQqyxmIyStDj7ze0QNp5oGAmeLkdz9ifRK+bo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v6 6/9] xen/arm: smmuv3: Add PCI devices support for SMMUv3
Date: Thu, 9 Nov 2023 13:27:09 -0500
Message-ID: <20231109182716.367119-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109182716.367119-1-stewart.hildebrand@amd.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a841bac-4b36-4b66-1816-08dbe151d379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8e031W/5zuv61pAMZmIpoYrInUFq4lqJajdXok0ynw4E3ZegS5QnjPqc49Wiw6ZGsi0EncAsGDTcLs5TAtdgBLDK98t3YNW3oNtwQ7RlsZ/wnjd14kknD/UW4NqGfGtgV/RYkiUSzbAJS5T2dX3BUluJao4+yhNWFe7s6udIn29rb7+lLjLYdIDEcf3cWwl7WwtUbZ1A8QiTzgWOQaAO1ICk7OOOXW9bvT/AwtkXp2jGAKkCon80moC383s1fG/24K9uRqby9HXBNjGJN4g+7cEAqxFw0AYALH1pOdjlgkTfcCK74+1x7JRojtqDrsFnO2g6fJLeDU0LzZFp2WfuC/nLVonL+JUENAlleSaLz+HTVvIIpbEjmO7Guzgiuqpj+0W8Eg/Y9MwJc8Kbu3ksFWQUZ+TreTeCE9TeQ/iojaOgs8hdoP2dS7BMGKDvfg7hHAZnQ95IDZT5FJJXIgOIx+ODxJ6fXm7bBIX4xsi1KqmytKvV870mvM5cfDm7i33jvfhmsa3St0jpdCSnCO36b1Fq21BrCzeZ2HJgpMNHHm/ZR5i3cnbtvT3dfxur01rckLucCUwt9igZPYJ1kTuQYccAQK1CxLTIWFz4K/ihhExi9yjOb8SwxgVa9zGP8OXKrM8BlYB1CbUoJqPcAt/rbCtnMcz5HjQmkTfimFeEMrsg06X41A6Frq+T1KIpUBvQxsqsz8PjL216EZmdw5WdvVjWbka6Zjs9GUoiQzKH6H4FByPR3d2spD1Gs7YcPhNmsfsn86t3xZ2fYSkL8qzzZQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(4326008)(40460700003)(40480700001)(36756003)(426003)(316002)(336012)(8676002)(83380400001)(1076003)(26005)(54906003)(36860700001)(6916009)(70206006)(5660300002)(70586007)(47076005)(478600001)(966005)(2616005)(41300700001)(6666004)(44832011)(2906002)(82740400003)(8936002)(81166007)(86362001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:29:35.8961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a841bac-4b36-4b66-1816-08dbe151d379
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110

From: Rahul Singh <rahul.singh@arm.com>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v5->v6:
* check for hardware_domain == NULL (dom0less test case)
* locking: assign pdev->domain before list_add()

v4->v5:
* deassign from hwdom
* add TODO regarding locking
* fixup after dropping ("xen/arm: Move is_protected flag to struct device")

v3->v4:
* no change

v2->v3:
* rebase
* invoke iommu_add_pci_sideband_ids() from add_device hook

v1->v2:
* ignore add_device/assign_device/reassign_device calls for phantom functions
  (i.e. devfn != pdev->devfn)

downstream->v1:
* rebase
* move 2 replacements of s/dt_device_set_protected(dev_to_dt(dev))/device_set_protected(dev)/
  from this commit to ("xen/arm: Move is_protected flag to struct device")
  so as to not break ability to bisect
* adjust patch title (remove stray space)
* arm_smmu_(de)assign_dev: return error instead of crashing system
* remove arm_smmu_remove_device() stub
* update condition in arm_smmu_reassign_dev
* style fixup

(cherry picked from commit 7ed6c3ab250d899fe6e893a514278e406a2893e8 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/arm/smmu-v3.c | 131 ++++++++++++++++++++++++--
 1 file changed, 121 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index cdbb505134b7..ac6532e29b02 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1469,14 +1469,34 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
 }
 /* Forward declaration */
 static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev);
+static int arm_smmu_assign_dev(struct domain *d, u8 devfn, struct device *dev,
+			       u32 flag);
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
+				 struct device *dev);
 
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
 	int i, ret;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master;
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct iommu_fwspec *fwspec;
+
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev = dev_to_pci(dev);
+		int ret;
+
+		if ( devfn != pdev->devfn )
+			return 0;
+
+		ret = iommu_add_pci_sideband_ids(pdev);
+		if ( ret < 0 )
+			iommu_fwspec_free(dev);
+	}
+#endif
 
+	fwspec = dev_iommu_fwspec_get(dev);
 	if (!fwspec)
 		return -ENODEV;
 
@@ -1521,17 +1541,35 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
 	 */
 	arm_smmu_enable_pasid(master);
 
-	if (dt_device_is_protected(dev_to_dt(dev))) {
-		dev_err(dev, "Already added to SMMUv3\n");
-		return -EEXIST;
-	}
+	if ( !dev_is_pci(dev) )
+	{
+		if (dt_device_is_protected(dev_to_dt(dev))) {
+			dev_err(dev, "Already added to SMMUv3\n");
+			return -EEXIST;
+		}
 
-	/* Let Xen know that the master device is protected by an IOMMU. */
-	dt_device_set_protected(dev_to_dt(dev));
+		/* Let Xen know that the master device is protected by an IOMMU. */
+		dt_device_set_protected(dev_to_dt(dev));
+	}
 
 	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
 			dev_name(fwspec->iommu_dev), fwspec->num_ids);
 
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev = dev_to_pci(dev);
+
+		/*
+		 * During PHYSDEVOP_pci_device_add, Xen does not assign the
+		 * device, so we must do it here.
+		 */
+		ret = arm_smmu_assign_dev(pdev->domain, devfn, dev, 0);
+		if (ret)
+			goto err_free_master;
+	}
+#endif
+
 	return 0;
 
 err_free_master:
@@ -2621,6 +2659,61 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
 	struct arm_smmu_domain *smmu_domain;
 	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
 
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) && !is_hardware_domain(d) )
+	{
+		struct pci_dev *pdev = dev_to_pci(dev);
+
+		printk(XENLOG_INFO "Assigning device %04x:%02x:%02x.%u to dom%d\n",
+			pdev->seg, pdev->bus, PCI_SLOT(devfn),
+			PCI_FUNC(devfn), d->domain_id);
+
+		if ( devfn != pdev->devfn || pdev->domain == d )
+			return 0;
+
+		ASSERT(pcidevs_locked());
+
+		/* TODO: acquire pci_lock */
+#if 0
+		write_lock(&pdev->domain->pci_lock);
+#endif
+		list_del(&pdev->domain_list);
+#if 0
+		write_unlock(&pdev->domain->pci_lock);
+#endif
+
+		pdev->domain = d;
+
+#if 0
+		write_lock(&d->pci_lock);
+#endif
+		list_add(&pdev->domain_list, &d->pdev_list);
+#if 0
+		write_unlock(&d->pci_lock);
+#endif
+
+		if ( hardware_domain )
+		{
+			io_domain = arm_smmu_get_domain(hardware_domain, dev);
+
+			/*
+			 * Xen may not deassign the device from hwdom before
+			 * assigning it elsewhere.
+			 */
+			if ( io_domain )
+			{
+				ret = arm_smmu_deassign_dev(hardware_domain, devfn, dev);
+				if ( ret )
+					return ret;
+			}
+		}
+
+		/* dom_io is used as a sentinel for quarantined devices */
+		if ( d == dom_io )
+			return 0;
+	}
+#endif
+
 	spin_lock(&xen_domain->lock);
 
 	/*
@@ -2654,7 +2747,7 @@ out:
 	return ret;
 }
 
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device *dev)
 {
 	struct iommu_domain *io_domain = arm_smmu_get_domain(d, dev);
 	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -2666,6 +2759,24 @@ static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
 		return -ESRCH;
 	}
 
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev = dev_to_pci(dev);
+
+		printk(XENLOG_INFO "Deassigning device %04x:%02x:%02x.%u from dom%d\n",
+			pdev->seg, pdev->bus, PCI_SLOT(devfn),
+			PCI_FUNC(devfn), d->domain_id);
+
+		if ( devfn != pdev->devfn )
+			return 0;
+
+		/* dom_io is used as a sentinel for quarantined devices */
+		if ( d == dom_io )
+			return 0;
+	}
+#endif
+
 	spin_lock(&xen_domain->lock);
 
 	arm_smmu_detach_dev(master);
@@ -2685,13 +2796,13 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 	int ret = 0;
 
 	/* Don't allow remapping on other domain than hwdom */
-	if ( t && !is_hardware_domain(t) )
+	if ( t && !is_hardware_domain(t) && (t != dom_io) )
 		return -EPERM;
 
 	if (t == s)
 		return 0;
 
-	ret = arm_smmu_deassign_dev(s, dev);
+	ret = arm_smmu_deassign_dev(s, devfn, dev);
 	if (ret)
 		return ret;
 
-- 
2.42.0


