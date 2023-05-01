Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4989A6F3905
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 22:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528279.821230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZqJ-0000Bc-Mi; Mon, 01 May 2023 20:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528279.821230; Mon, 01 May 2023 20:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZqJ-00008Z-J1; Mon, 01 May 2023 20:09:51 +0000
Received: by outflank-mailman (input) for mailman id 528279;
 Mon, 01 May 2023 20:09:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ptZl1-000525-Ba
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 20:04:23 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5caaf7b0-e85b-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 22:04:22 +0200 (CEST)
Received: from MW4PR03CA0166.namprd03.prod.outlook.com (2603:10b6:303:8d::21)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.30; Mon, 1 May 2023 20:04:18 +0000
Received: from CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8d:cafe::7b) by MW4PR03CA0166.outlook.office365.com
 (2603:10b6:303:8d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30 via Frontend
 Transport; Mon, 1 May 2023 20:04:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT016.mail.protection.outlook.com (10.13.175.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.20 via Frontend Transport; Mon, 1 May 2023 20:04:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 15:04:17 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 1 May 2023 15:04:16 -0500
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
X-Inumbo-ID: 5caaf7b0-e85b-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNexJhQ/NuhFiX0DyBzMSeOq62USE0QEjAanpnrNFaavCs7HvVvReW2YWYXN4b4leT+2o9MBbHn14UANlFt5+Jk9Z5LF05ii8SkX2NNDp/iwzhoPif08QRS+OarFwkSJ+jZffXiJ+nzEjDOtuwzZLmQSNtje51xKWLwQZYw/bdN/Bzz5NL+KojeX56qihL6V2x69euXFSOTwTwUhfqe57g7SA5qBBMwKnkvt0QaQpmJ1uH+hwphYsuwZw5+24UjLGIanmLVQYN4WCyKmVnXfUoHWx2MNxepSb6t+CUsw1zFsFurrP9HKaSCKVFLR/klhHVBqZYN/OEpBMiDuN7WS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XJhPVciLUzEu7aYbf6zQpM/bkxm9q36IA+36Y75kWQ=;
 b=iQCskHVZ4giy13gN7Swm67lRuzEkZzgjJVWTw5k6BaNUiKI/UJps7CBtUc4tx9bJPZ9qVsN9awRebpiUIm3DBR8izhIaIeo1pPYMdEmAGZTIK7ye65W/h9FVeYI86J/Hc283Ek9K7QlbG8YPyhBpE3Xbdgx7/eiboOKq66wvmzf2t8GQM1xyMDy66ffUhZgvDXy4fICZUYcbXhJ7aAeYjXhxsl2uU2H7EhDuZF3p3+pAgfQ0NQvfFPZ7Qno5Ajs8hjCwJV/PIT4mE6i7tORRtstYBApHjcDL/W/mhgA8jsZOQKbk18C6GxnqqJksA/xiy/MDblBF7zvnRjLor1qUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XJhPVciLUzEu7aYbf6zQpM/bkxm9q36IA+36Y75kWQ=;
 b=QdlfoD2li1KtoqoJdGnQKPbex1ZfI1cViutgN1oMCJL1kxO9Wf1gU3FnYxEao8MKtW8sHu42CC8KUMoTWqdN2uBz4LnrbkeccIi7c1PCH4K9buMCxYgkwuQ2oCMlbRC3hCxHNhCA99LUrJZH2FTCb8RqLyqtvMRbIzqtcFOaJHU=
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
Subject: [PATCH v1 6/6] xen/arm: smmuv3: Add PCI devices support for SMMUv3
Date: Mon, 1 May 2023 16:03:05 -0400
Message-ID: <20230501200305.168058-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501200305.168058-1-stewart.hildebrand@amd.com>
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT016:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: cd0b89df-c04d-4fda-e7fa-08db4a7f3f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lHPtqGOP4XC2D/KGuxYseWc2nAyihzMlfG4W1jUl61eKikVKGiiGoZ1iQlhn//G8O8dcCRMRcjA8mRAClYScapDW8t9ETdy10lsXiwRTjjWYOQ9aQ04Q9i4KipxdfewBDxC/W536GYT2JTV0i3o6OfVPQQbQZTZhNKyvmolt/YtxKmGT5PRYocKldF/FUgg9e292RYdkGckuxZzFJ3N8PPsXMsuY0OHNBnlquPgIv3TAZOQK/AbvU/RKqVaSYmnCcJlCDMrEupm0nk+VR0wjwLyf7rDBghKjqzMKcUiUUBVPvUBDU6cxR0OL9I+P1mC8WI18Hj9CfIn8Epo2Z3t2puwsf/zXVjlXN7PSaX0y0CGsWs+xXJx5uCeGgtsUC67sIN4i4LkElMNFU/UTducWV5aAAqKXCk1pFjeOAoGBvjitldGae4rwCu56WSWb7qOHVRkVdHT7ubhA26QSzslPQzSiaj7ZyRVJB8PDIjL6ZJoOL2h3a4VNi51b2/o1NH+bqPIJCudhaUDR1TwAqp/EcOgBRq/pWpuWGYQ7i6X9b3dPS813hf22wv5qas/g+4Nxs1/4VGmdINsRrv381B/D7yMxFe35uOhnvhpDl4++LpdYH44NPNkobZcOCPShuA1jhqlTXTxuySXjjRLkB57R9jBSDyUoiMUNIeM/six4iQYjbmoX4UZ7P91pDFp7QSLQJuioWFEXfbG+r/QFbg0PBx1tevMItVotL214WAWfPRpMzRgXWbszuw+Jc3hmRUhR
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(40460700003)(8936002)(8676002)(36860700001)(26005)(2616005)(1076003)(44832011)(478600001)(5660300002)(186003)(40480700001)(36756003)(316002)(82740400003)(2906002)(54906003)(426003)(336012)(86362001)(83380400001)(70586007)(4326008)(6916009)(6666004)(41300700001)(70206006)(47076005)(966005)(81166007)(356005)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 20:04:18.4498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd0b89df-c04d-4fda-e7fa-08db4a7f3f45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262

From: Rahul Singh <rahul.singh@arm.com>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
 xen/drivers/passthrough/arm/smmu-v3.c | 66 +++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 4b452e6fdd00..481a35a8b8d4 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1469,6 +1469,8 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
 }
 /* Forward declaration */
 static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev);
+static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
+			struct device *dev, u32 flag);
 
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
@@ -1527,6 +1529,17 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
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
@@ -2607,6 +2620,31 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
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
+		/*
+		 * XXX What would be the proper behavior? This could happen if
+		 * pdev->phantom_stride > 0
+		 */
+		if ( devfn != pdev->devfn )
+			return -EOPNOTSUPP;
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
@@ -2640,7 +2678,7 @@ out:
 	return ret;
 }
 
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device *dev)
 {
 	struct iommu_domain *io_domain = arm_smmu_get_domain(d, dev);
 	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -2652,6 +2690,28 @@ static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
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
+		/*
+		 * XXX What would be the proper behavior? This could happen if
+		 * pdev->phantom_stride > 0
+		 */
+		if ( devfn != pdev->devfn )
+			return -EOPNOTSUPP;
+
+		/* dom_io is used as a sentinel for quarantined devices */
+		if ( d == dom_io )
+			return 0;
+	}
+#endif
+
 	spin_lock(&xen_domain->lock);
 
 	arm_smmu_detach_dev(master);
@@ -2671,13 +2731,13 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
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


