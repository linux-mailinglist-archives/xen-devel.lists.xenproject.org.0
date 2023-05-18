Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5238F708A31
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 23:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536566.835011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzku4-0007Wd-GG; Thu, 18 May 2023 21:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536566.835011; Thu, 18 May 2023 21:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzku4-0007Sx-DB; Thu, 18 May 2023 21:11:16 +0000
Received: by outflank-mailman (input) for mailman id 536566;
 Thu, 18 May 2023 21:11:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yK0N=BH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pzku3-0007Sr-79
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 21:11:15 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 841f0c6e-f5c0-11ed-b22d-6b7b168915f2;
 Thu, 18 May 2023 23:11:13 +0200 (CEST)
Received: from SJ0PR13CA0010.namprd13.prod.outlook.com (2603:10b6:a03:2c0::15)
 by PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 21:11:07 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:2c0:cafe::76) by SJ0PR13CA0010.outlook.office365.com
 (2603:10b6:a03:2c0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.6 via Frontend
 Transport; Thu, 18 May 2023 21:11:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 21:11:06 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 16:11:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 14:11:05 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 May 2023 16:11:03 -0500
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
X-Inumbo-ID: 841f0c6e-f5c0-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=je85EGooONoIrZymclRq8Z4Wjgh0PWAaj+mgjmzhQZbzc2doVtNBu7y8gM7dKQ20xFNzT/QjNnIsg06StOJfX9SPGPjOQV6nWRTFAiT3xKFg8s/k7E7ySiOqKacIkP/qSw6gZirI4026imAPPjcw/jDaP01fK3/v3RDHURspUeVPQWShfLf2jY/cDwmmk3p+IFrYKYsowWF6CoAUPvLlxOCuzKcsNRnqAM170n3MZsFxKKGoRINZNVdsQqgij6DZ5Sv5hd7Fu9ReAFNaZjIUEHlEE0rm8caAVV+ommBdamO0XGl3A5SLmTS/w//1hG5t3YMNem5DM7lFP+/EfndTPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lc3aiT/FBstHJO8Rds/4fwDxNeL7AHWhcXKg/oYVb4o=;
 b=iJavxXkt7TgRqQDkFyKwpm7WhF4esoh/MhXdPlAsxwckORZHh95rzh0V+PWvlNfGp6jB5SP4epN+eWFM0c6RyVBRlfBjwuKe7fZB7iTlIqLcTvWyFw4N6soXEDqKngP7q5O91q4h5ChLiWa/Rd72WmGZ9TFOPQ8j3HHEFLwGp3BVAGIB55CDiAyu1ROS/sNpsgNHkgy3NygKvBPBw1Qze/NJUI6GLvyfDbuCUAinkek4mOdkgMSjWYFFtul3FSk3jheX3jkzyYEc44ACXH/mjFZvA3P8JrgIvZC6pA15G9VkGcsXsLaX9b6iKeD2j28l5YgV1GWGtW97Iw4FpMGHwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lc3aiT/FBstHJO8Rds/4fwDxNeL7AHWhcXKg/oYVb4o=;
 b=1BmPev53OzxrLHodE+t4gKY3N4J94Zdmlja+8vq2S0GCfhFtsRksEt9DoCF6MmI1akn3Tpx8bsN1FvFkQ46/hx9j0B+m5B775+fFAGSX2L+l/a6Fx5iEyh9L/V+qi/lfFTKQLj2qE6dLUgVyt5wdbrhV8cNWjsnzR4zhn/ln0PQ=
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
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v3 6/6] xen/arm: smmuv3: Add PCI devices support for SMMUv3
Date: Thu, 18 May 2023 17:06:58 -0400
Message-ID: <20230518210658.66156-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518210658.66156-1-stewart.hildebrand@amd.com>
References: <20230518210658.66156-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT066:EE_|PH8PR12MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 6223ce84-9df2-493d-43a4-08db57e46555
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MZglEBikKfx/a1lsqwlQhgOMgnn3h5VXxsWqPjaTZooZ7RSQwadQxX3C4rc40re8ez3M6vN351DrzGJWqy44IIe6GQmPAk43CA32i8S0hKEzM/c9Z73dR4woNe8hqTV/HF7m7CgO3uCCXiiIFZQuHOUbTyJRUIKJiEuydpiPxpoEZB4XKBQvv0MW6Mic5vnNyd02kmo+osiq1amgEisLuH/qs4odWBezGdHbKu3C4E96XRtIYRH9JX+aFr8FtUMKXfedYoDLsSvstiqQ00lv17D3McMiT55PXiO8RdxNLlET6J22yH467VXWT1Zjwa33Pq+4kjV/PIAESklmfliBHQEI4GDL8XaMTd06t2hmhjiCOcOB1SN8Qo6UJ9jIissWaLza3WHnE1y5+bnEAYDKPyBWfsy5J5TTiccM1CYkfFqQsdBrOZzwauJvQ9h8lp1IJBVw1sK0/sI8+Wx0/1hiTxYGeNpCJI8kOSeE34Cs45pHrqK/UdK6/sQf47KQ02MsG0uxNo/SbGfTh8j7DxG56qFLTAJEHmoa5jSD4pKlKQ6e2ptcJ1YhN51fHAcoJAaQ4WiKyAi/fx8YP7C7nlVESPzpCv2/IC8bUOQZqf/XmCstrTOBoc2fNqV1XEphmEP2B2Dm29lWXDpa0NpDQzlDI61Or2RzEGs4L0DupWjh0I//ENeQPCKXGPLmNoEZWSDO+vRHZ+2zJZf7y9jN5+PUzSmNVFjtOeoS2Oc+OTI0YNJbObDbOhpOrhY2qk7yl2Yw4eVxRX7lw7jPw6CXpUbSPw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(478600001)(316002)(4326008)(44832011)(2906002)(8936002)(6916009)(41300700001)(70206006)(8676002)(54906003)(6666004)(5660300002)(70586007)(966005)(40460700003)(1076003)(26005)(82740400003)(186003)(81166007)(40480700001)(83380400001)(36860700001)(36756003)(2616005)(47076005)(82310400005)(86362001)(356005)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 21:11:06.6522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6223ce84-9df2-493d-43a4-08db57e46555
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7325

From: Rahul Singh <rahul.singh@arm.com>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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

This is a file imported from Linux with modifications for Xen. What should be
the coding style used for Xen modifications?
---
 xen/drivers/passthrough/arm/smmu-v3.c | 76 +++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index f5910e79922f..a9ca889bd437 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1469,14 +1469,32 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
 }
 /* Forward declaration */
 static struct arm_smmu_device *arm_smmu_get_by_dev(const struct device *dev);
+static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
+			struct device *dev, u32 flag);
 
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
 
@@ -1527,6 +1545,17 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
 	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
 			dev_name(fwspec->iommu_dev), fwspec->num_ids);
 
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev = dev_to_pci(dev);
+
+		ret = arm_smmu_assign_dev(pdev->domain, devfn, dev, 0);
+		if (ret)
+			goto err_free_master;
+	}
+#endif
+
 	return 0;
 
 err_free_master:
@@ -2616,6 +2645,27 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
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
+		list_move(&pdev->domain_list, &d->pdev_list);
+		pdev->domain = d;
+
+		/* dom_io is used as a sentinel for quarantined devices */
+		if ( d == dom_io )
+			return 0;
+	}
+#endif
+
 	spin_lock(&xen_domain->lock);
 
 	/*
@@ -2649,7 +2699,7 @@ out:
 	return ret;
 }
 
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device *dev)
 {
 	struct iommu_domain *io_domain = arm_smmu_get_domain(d, dev);
 	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -2661,6 +2711,24 @@ static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
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
@@ -2680,13 +2748,13 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
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
2.40.1


