Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A47D6FFA16
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 21:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533571.830374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBs0-0000ZS-0z; Thu, 11 May 2023 19:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533571.830374; Thu, 11 May 2023 19:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBrz-0000Xa-UC; Thu, 11 May 2023 19:22:31 +0000
Received: by outflank-mailman (input) for mailman id 533571;
 Thu, 11 May 2023 19:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWxp=BA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pxBrz-0008QA-DH
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 19:22:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e89::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ad39f39-f031-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 21:22:29 +0200 (CEST)
Received: from DS7P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::18) by
 DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.22; Thu, 11 May 2023 19:22:24 +0000
Received: from DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::24) by DS7P222CA0011.outlook.office365.com
 (2603:10b6:8:2e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22 via Frontend
 Transport; Thu, 11 May 2023 19:22:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT085.mail.protection.outlook.com (10.13.172.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.20 via Frontend Transport; Thu, 11 May 2023 19:22:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 14:22:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 14:22:22 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 11 May 2023 14:22:21 -0500
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
X-Inumbo-ID: 2ad39f39-f031-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bak56nci9K5jjkkIkXvkbiaY+3qyRk9Y/L9C3w3i5L8DqGHjZQqoLxpjtSs+9Z7wLfvCAinnXUnKiA30MxXnXwomtoxjIDGEkjCXKmOmkT/Ymxowvei3Yi9PsISYTALPuP3LTb+nh7MDPwc61xDRsZ8GwdytdJi/I2X9tzUwkB6rMzThDWNCVAiux5I39wKRtNG4tTDdI7UiU6M3z/Wu7Sifui/Y4VrL8D7Sbkq54AhY8bkzrlg4siiYR7wQoO0+piCQnXgY6AfhAPyjdsJj21QK65keRuZUfRAHUGnchdezRzeeU7TxPQqKNadNrIdUYsGFzTA5wfa2Fge9kcGFRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SO3THuJ+/ik7n2bM+aWq9Ulbj6rZ/FkssTS50Og6lnI=;
 b=DcVPho3m/knVFB70n+uJdsR+l1LRyMEVYqut78+7RKqzAGXvc4v1b9+EJifgHOzUcSoZkHS64HeYASE8jloHotNwv5o1STGH1/qDDpAdbTnnSHivsr5jHDiQ+2p3Umsd9aDQnemmnCOEluOP08s0mog6BqvWs0TVUVSv9LOaTomnM+I3llOzfMJSGHQAM3Zufyqf+QXMVKzftqFG71+fp/6M0r6J5ueQJUx9G/LEA9Y+vsmLInpsZB6NipiaTZk8m1dv070z0R7ONBBWLZdWTDIOQnGNFz+jwVs/5eHrEFZ2FEuH0pCd+64kgdhVneldA4YNSemYOtepZ8Q+rE74lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SO3THuJ+/ik7n2bM+aWq9Ulbj6rZ/FkssTS50Og6lnI=;
 b=4A5tPR31dR/4f0o4ukSFqtuV8joZhJa17RwUd9cWru37kLlJaiZso5W7W6iP0wjin7oZBXCCyZcjYlHqgjziPI/zZG/SYFtZ+lwVez7VgBktz3euXhezzif1CX/eG84daUWlPafePXTY1+gS6vdNzQ6fYJySXaZuH/LBCLaOp/I=
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
Subject: [PATCH v2 8/8] xen/arm: smmuv3: Add PCI devices support for SMMUv3
Date: Thu, 11 May 2023 15:16:54 -0400
Message-ID: <20230511191654.400720-9-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511191654.400720-1-stewart.hildebrand@amd.com>
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT085:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: 686471a2-ae31-4dc7-22f2-08db52550cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3sG1t+oyvh+DFdbRQmSOotQNDk8aoyCD9Gi82mgtcjL/LvUeDP0PUS4nfl7gXyjug8wk987CNowXe/bLDix0H46cqeBNRI3i8s58zVy5REQ3S4KTGV74WCkltexXERhLTxqhCNxSWOeuu/1S2PypELaqI33L8qF7goba0/XkXIl5NK7g6FfB3oC7sg6yPXg+HuuRYCrPPPrpxRuofOBqbaqFsjVJY1sF8V+sZZWggSKhQuhpClxcwRSFt/HVLgptrGaLF0swGTFAWUOv+V7dg6k0umUyPPOPn+7zKozSNp0gzvG/IAJm2m0Ej9UNrDh6G7s9UjXEEWXl46EIUV4ky65F3MZ/y5SeWEBAC0AGIxy75aCGkRBku7yMICPW2fv7ya8KuDaBrzx+E1JnjialBJ2pY/aGGhLGl1btBB24Dwyn1d18JfVQo88K8AL+QY7xg1eX5RjAAwVfUtaIRTXh8yMD5N2WHhCxF8ztg0WR3+FHlmXIZJyaAXgMVnpkdX4kY2JR+g7JeHnoVwmmJFuaU4Q7B2zwXAl/BoOftglE0z/U1reN5rK/D46dlvlKLQ1rN58jHqzKgPbHmAFFmldHE8B92J66upaWuGuj/PJ83DLc6uVc+wfOLIwEndDgAgm8h+vzPn6JxN3fWaBP/Un49hB366dB8oB0orAztl7lmXeh5exnsU4pz7yquItV3pWzbgX9AdUa8uxMkSuZuZ+/IEgGL2sPBsEtrDf62wOoyRoyxuGgcXHj6C57fFprkZvFsYZdM7AsZ4UvDEzoOQJtcA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(40470700004)(36840700001)(46966006)(36756003)(86362001)(54906003)(316002)(6916009)(4326008)(70586007)(70206006)(966005)(478600001)(6666004)(40480700001)(82310400005)(8676002)(8936002)(41300700001)(2906002)(5660300002)(44832011)(81166007)(82740400003)(356005)(186003)(26005)(1076003)(336012)(36860700001)(426003)(83380400001)(47076005)(2616005)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 19:22:24.0974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 686471a2-ae31-4dc7-22f2-08db52550cb2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171

From: Rahul Singh <rahul.singh@arm.com>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
 xen/drivers/passthrough/arm/smmu-v3.c | 67 +++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 4b452e6fdd00..807cfe575345 100644
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
@@ -1484,6 +1486,15 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
 	if (!smmu)
 		return -ENODEV;
 
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev = dev_to_pci(dev);
+		if ( devfn != pdev->devfn )
+			return 0;
+	}
+#endif
+
 	master = xzalloc(struct arm_smmu_master);
 	if (!master)
 		return -ENOMEM;
@@ -1527,6 +1538,17 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
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
@@ -2607,6 +2629,27 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
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
@@ -2640,7 +2683,7 @@ out:
 	return ret;
 }
 
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn, struct device *dev)
 {
 	struct iommu_domain *io_domain = arm_smmu_get_domain(d, dev);
 	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -2652,6 +2695,24 @@ static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
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
@@ -2671,13 +2732,13 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
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


