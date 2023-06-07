Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 925A3725251
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 05:08:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544326.850033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jX5-0005z6-7E; Wed, 07 Jun 2023 03:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544326.850033; Wed, 07 Jun 2023 03:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jX5-0005wJ-32; Wed, 07 Jun 2023 03:08:23 +0000
Received: by outflank-mailman (input) for mailman id 544326;
 Wed, 07 Jun 2023 03:08:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfoE=B3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6jX3-0005Dg-JF
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 03:08:21 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e83::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d5d8bd0-04e0-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 05:08:19 +0200 (CEST)
Received: from SJ0PR05CA0035.namprd05.prod.outlook.com (2603:10b6:a03:33f::10)
 by IA0PR12MB8280.namprd12.prod.outlook.com (2603:10b6:208:3df::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 03:08:16 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::df) by SJ0PR05CA0035.outlook.office365.com
 (2603:10b6:a03:33f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 03:08:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Wed, 7 Jun 2023 03:08:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 22:08:14 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 22:08:12 -0500
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
X-Inumbo-ID: 8d5d8bd0-04e0-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbiBz0kecpBhF2DYbPmGd/kLtbfs6Ca8+4/xGF44TLE43g1wMSonzZjHcFFWTZbIFHXRpwDNV/cDMTSZvYliYg1t30LqUzqgbqseVRXdKT3sosFNdUBs+ScX2yiHKLPjKZ69qjoIL7PtEqGLfbjzMR9ytoReA0FXvfJ10A3NYYBN7sNOeIafGBtsOnDWmB8TM181gaYnhUJrsp91sU0wZTKF6zzlXzOX1O5q6lsHSr/Fqjv7rr30CVI8CJmsivZzP3HUbKxGEZhEyu9yeTkTZmGFsS34SDBXJHGbR/81UhObqrqFtGYg/hGf1V2xf4RxTsy8f9B7x7lT9BcLRlDh3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRrQWmRSzu/GIUmuJ2fEbC87ERNVvfs7J7zPQvkONhA=;
 b=CSYcLwQAQD4HXLEzDUGCCQSTUMN57BX8GsuIlki6kdeUsidwsGx5nRenFJ/xnLpDFCaQI0+yGjqUZt2yHXtzVZfES6GVjepeeG0LOLYC3kg+KJFMeWr/GcohWSJ2YvgqA4KOFJ3Hn4WgN6M3yyTvZtnc/BArUHNpNGJjgAQuOlgeI86ghBpTJ6zUMfEa6T/6FTnFd8I+Lpab2Savz5Q1GHniGTcmX2DaBOvTRoWcwJ0THi5GIHizS1s/OW7/EuPtjxEpLPFI+HmPWyar11gYuHyATPUPpLj03VXd6gTUNmt11Hib8J0mfYStGxp5c2JYMy4ZY2FURLBIJJyzv7F5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRrQWmRSzu/GIUmuJ2fEbC87ERNVvfs7J7zPQvkONhA=;
 b=Lk/gF79vHhHHUMVSDVYBPx9GMbPmjMrDnZTmCf6TAtVn5v1vR9H1T4qDgc9juPdPbfgvsGKRefYpVUArPCPExm9x56z/yi7OYVtnpRm3FGWdZsNTQ6s/+AhXGbcdeqvvUfxOWljsUNIuvJRfIA/TA5GCIQiRoEgCW+nc9B0L5/o=
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
Subject: [PATCH v4 7/7] xen/arm: smmuv3: Add PCI devices support for SMMUv3
Date: Tue, 6 Jun 2023 23:02:20 -0400
Message-ID: <20230607030220.22698-8-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607030220.22698-1-stewart.hildebrand@amd.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|IA0PR12MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 250657cf-1483-4a7b-4f46-08db67046fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J+ykEm8fma+CPdpj2dIoU0v2cSX82VX2RObO6QAzu6d0H9oeYsMaVYJz35sSn9diEhle8Lf6NcRJ3wp3GAP3IfVgb64qWXqAuPjh/XwsGspWFpQe80es3BQmqfvTMOL2o7MK43rI3soRzhaIHbSbP/Zv73qpuQfEYOctsjjrWkX31LHMqXtMmUayXO7kUVW0nIlQ6drosNcohc36Z2Q1rGGeWrMc8QJRCkWfBG1Ag6snbGDmgjxLRmxORpSI6QrfE+nGUS4knSzXhbIM/kI3/luS0oVKAhYSN+zZmJCmxA41cOltmDtwwtrSrSo5ZburiwofntPu04/yy+1ssbGxZfPW8SVdxwzQgZujzjK+oRWUQbmlvFsAfwFN47kjVYegscfsXW3eS6H2Uax0Ic68ICcsCyoa5VNEFPScE64f3orNozobN+2ICp+fSWIdQ619V1LI5gAPzLWr5P63aJsZ+Ie3uy8gnoCgfewOLhJGsUS0PMBX55JnUNR/PfWeOgGcnpD5Y1M//JnQbFFvZf0mAwCZQoC16aXs1vYnn5BKNiev1Dynv9qSN1qIFWTNwGFVXPkMNZapMDRqhgksUVfa2mGlvSXXeDGMpqw5QM5Vb3r35GlMwHc340etOhvoMJv9tKYX4HMp+sPKYdMtVAMOFDyOkxTi3W+E5+O5+PclqNWVhIgO5eAdNeSdJBOATjj5gTtBSTpthXEoi2yytCQE+TYlgm+jGDfX5lVhR4u3/2N59CdNrbf9sc4u2gIpOiI8OVpFizheVC9DSxDqKNoUUQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(40470700004)(36840700001)(46966006)(36756003)(54906003)(40460700003)(2906002)(82310400005)(478600001)(86362001)(41300700001)(5660300002)(8676002)(8936002)(82740400003)(316002)(44832011)(356005)(81166007)(40480700001)(6916009)(4326008)(70586007)(70206006)(83380400001)(47076005)(1076003)(2616005)(26005)(186003)(426003)(336012)(36860700001)(966005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 03:08:15.2719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 250657cf-1483-4a7b-4f46-08db67046fae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8280

From: Rahul Singh <rahul.singh@arm.com>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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

This is a file imported from Linux with modifications for Xen. What should be
the coding style used for Xen modifications?
---
 xen/drivers/passthrough/arm/smmu-v3.c | 76 +++++++++++++++++++++++++--
 1 file changed, 72 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 8842db1ec07e..427946e68f9d 100644
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
 
@@ -1533,6 +1551,17 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
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
@@ -2622,6 +2651,27 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
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
@@ -2655,7 +2705,7 @@ out:
 	return ret;
 }
 
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device *dev)
 {
 	struct iommu_domain *io_domain = arm_smmu_get_domain(d, dev);
 	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -2667,6 +2717,24 @@ static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
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
@@ -2686,13 +2754,13 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
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


