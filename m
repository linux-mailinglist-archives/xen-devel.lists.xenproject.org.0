Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C8C7B832B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 17:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612669.952707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3SE-00008h-W5; Wed, 04 Oct 2023 15:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612669.952707; Wed, 04 Oct 2023 15:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3SE-00005E-Sc; Wed, 04 Oct 2023 15:06:26 +0000
Received: by outflank-mailman (input) for mailman id 612669;
 Wed, 04 Oct 2023 15:06:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSqs=FS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qo3K1-0004W4-Db
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 14:57:57 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20629.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 665bbdf2-62c6-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 16:57:56 +0200 (CEST)
Received: from BLAPR03CA0032.namprd03.prod.outlook.com (2603:10b6:208:32d::7)
 by IA1PR12MB6138.namprd12.prod.outlook.com (2603:10b6:208:3ea::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Wed, 4 Oct
 2023 14:57:52 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:32d::4) by BLAPR03CA0032.outlook.office365.com
 (2603:10b6:208:32d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Wed, 4 Oct 2023 14:57:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 14:57:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:57:51 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 4 Oct 2023 09:57:50 -0500
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
X-Inumbo-ID: 665bbdf2-62c6-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpjQuXfPeLeBV9aTQToBsmdYsJaNTvHwsYh5D8Ad7iOUzpEtNDtMfOzpByPNmCqnicXTZf+hVfGCmeM2+t7ftssHVaFailwqXFKHCycsONwH5zdTSypNYOulsMnQY3R7vX7Ess/weooGFkq5QQZxaWeoqdtjTn9AO71dfxMrePkx7UKdfMGKfP//s98JVtEEtY/HXmme9H5TcmkSdBGm2vsSXNB+mIQAzFAyPnzdpnru2+yM9+liQlPcaHHRx+/sY0iF+dI4yoetoy5M89uoiD/v0AGwMuiN2vn47RpcZat87e1zEO0Wo15VjnilJn31CNE3D7Tznle2ny3LgzFCIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WbWIZRLieROnDM8Z02yCZ2mzVNLfbiEXbXfdtDK3YI4=;
 b=mTeSGNY+tAdXUs8Qf1/snzONyblGXIWtC15uVHB+pC8B40RdHLQXM3ihg6NhN6ejvhZJgslttPQsG1WT0SSPkrRGgRV/EdqHQgYDwrjbIZ6Svij1rDMAglFmSBQa6/V7nMzvumSsPfBlDUewV4C5e3N/eVIHxrXT1JeAD6KW0u/jO/ZyJ98g7VdR8/sANTL8Iy4yzoMYgUBpTbURU7M+Q2g39CrPgtmbTvuNxvVWPXNUvoIr9fSSi9Z7uPQxjSshMnWg/w+uHOlg9jedYj05hDhF9TDAlppmYXG3TjIwuNehG5bdVoYz3OdfbN231sf3V7LMwuXWesgsDAf4VWrAgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbWIZRLieROnDM8Z02yCZ2mzVNLfbiEXbXfdtDK3YI4=;
 b=5e9mgjTphbUgpwi6mH81pZD/7ovT7pVb/uZh/itGEhWR8ccclMX1dUIZ9zVlaqQDp7leieSWKGEr5O1TiUZqbodyqxkOlZFr7CPoYfsG8c9eUlduuhD7ffQgfHBj3V/8Hm3RqBrPgtxgmwSMxJnD5aE6c3JPeae6bacph5doIFM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v5 6/9] xen/arm: smmuv3: Add PCI devices support for SMMUv3
Date: Wed, 4 Oct 2023 10:55:50 -0400
Message-ID: <20231004145604.1085358-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|IA1PR12MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: c12b0734-e6bf-4ff9-e21c-08dbc4ea48c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/d6HZ6HsvH9NLOIvaz1AXzuNyz+WZ21fmpi4qVuYV5YFkolapeHFze6VVGknFpin7AH+gZ5L3g9IBNhNqmms7DIC/X3vK1cfCQUw4POnonati7pW8alWNWIYqtvnpK9LOO3oavG2jE0aUfY0+UpQo1Vsh7VYmrc9WvtQT/E+r3Dpro5xVTTdvnD8ApHhhftYNagxWRv+LEv3SXPIATIufPWcTP/wdo7lS3Idm8uMm3yGRqfGOSKnAOA2SARvAP7gLlw2Acmtv+xULL5tDmDErEwEok9dAG5M2AyWqerhjhAQp7dvx2/uJ1Jld/Hk4EKzf/FzhrtGw5Tw7KQ+l9sdFv6CI+06q6UCQOlENAKcP5W6oZkc0eVSefhi1RQj78kS4NZvkmU8L7BSqz5TTAPy7045GkRCfTgaqLThRTi2+nfkf0Yy0o5jzijfopDQS1dHsjcLMBb26FGF/5JciQYToJHRkwIeQ2hzMHV4VC5M/zPPnl9Vew8XELB9JCvzl0U8Mlfr0eRQzhdiAXwojhwq/QcbJRLXz93TusZPnQwG6adFziZxP+tF+fBMtVX+GKs0VK8XoJGfSjeVTOabwWIafNul6Mk2+MySX+kY5lVOxIXPMzMiiPBr+3zKSyiBVXBDsK06Q3R2LkGQ6JEhrbXdQKKKOZh8S9KPD0zmtrNd3B5ETtCuEkRWbVwdj9cBIBhXAy3/Yv3kwsgFUlzb3eB+oQYQawDWJSLgIoL2GU+HrfmT4qXd5ervHjzdeYbHu+j9FWg7zrRbImgp4+ADXW1aBQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(40460700003)(966005)(356005)(70206006)(70586007)(47076005)(86362001)(81166007)(83380400001)(36756003)(36860700001)(54906003)(2616005)(6916009)(316002)(1076003)(478600001)(336012)(26005)(426003)(5660300002)(2906002)(4326008)(82740400003)(40480700001)(8676002)(8936002)(41300700001)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:57:52.4776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c12b0734-e6bf-4ff9-e21c-08dbc4ea48c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6138

From: Rahul Singh <rahul.singh@arm.com>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
 xen/drivers/passthrough/arm/smmu-v3.c | 126 ++++++++++++++++++++++++--
 1 file changed, 116 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index cdbb505134b7..5afef69096b3 100644
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
@@ -2621,6 +2659,56 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
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
+
+		write_lock(&d->pci_lock);
+#endif
+		list_add(&pdev->domain_list, &d->pdev_list);
+#if 0
+		write_unlock(&d->pci_lock);
+#endif
+
+		pdev->domain = d;
+
+		io_domain = arm_smmu_get_domain(hardware_domain, dev);
+
+		/*
+		 * Xen may not deassign the device from hwdom before assigning
+		 * it elsewhere.
+		 */
+		if ( io_domain )
+		{
+			ret = arm_smmu_deassign_dev(hardware_domain, devfn, dev);
+			if ( ret )
+				return ret;
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
@@ -2654,7 +2742,7 @@ out:
 	return ret;
 }
 
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device *dev)
 {
 	struct iommu_domain *io_domain = arm_smmu_get_domain(d, dev);
 	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -2666,6 +2754,24 @@ static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
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
@@ -2685,13 +2791,13 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
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


