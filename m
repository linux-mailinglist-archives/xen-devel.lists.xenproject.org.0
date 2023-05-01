Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 255016F3904
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 22:10:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528280.821240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZqM-0000Qx-TY; Mon, 01 May 2023 20:09:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528280.821240; Mon, 01 May 2023 20:09:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZqM-0000P5-QO; Mon, 01 May 2023 20:09:54 +0000
Received: by outflank-mailman (input) for mailman id 528280;
 Mon, 01 May 2023 20:09:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ptZqL-0000Of-TV
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 20:09:53 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21b20385-e85c-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 22:09:52 +0200 (CEST)
Received: from MW4PR04CA0323.namprd04.prod.outlook.com (2603:10b6:303:82::28)
 by DM4PR12MB6038.namprd12.prod.outlook.com (2603:10b6:8:ab::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 20:09:50 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::44) by MW4PR04CA0323.outlook.office365.com
 (2603:10b6:303:82::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30 via Frontend
 Transport; Mon, 1 May 2023 20:09:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.19 via Frontend Transport; Mon, 1 May 2023 20:09:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 15:09:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 15:09:48 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 1 May 2023 15:09:47 -0500
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
X-Inumbo-ID: 21b20385-e85c-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RD3OwduzSOZw9pVYmJqz5vhD8oFwIil30HgUTqOGpE/EV9XjgSsHVo2Eyi0yJtfyyGzEiJod49SLv+8sKRZETj8Ahf9MPf3KijWKjK0lvgnDugGQSHbSUf3ikJH62BXbEQrkKQ/jkxmGYA+YzgihUNFbf4ha1TlaKnBMiHaRWbonuhDfh/5nhv8Szk977fsDjrbWDaGEz7DnoG8xuA/2GVKOtc2aE/In72CT97uLMW4l6j8mkf7ptC/hcgEGkCjAkACMhhiyEEAVm1ZkE4qX0fHrMZfvSsFrlZZawjZSST7N/hYybeZ/XnTQNUizUSYg4nOOr65auJZu5CRfqLDmEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XJhPVciLUzEu7aYbf6zQpM/bkxm9q36IA+36Y75kWQ=;
 b=loBGtN6HImwO0TelplfgEoHq25dQ+HuRjGjWDUhFTIL2EvvCkcL5SH15jJRJQOejm0nx5eb81snfNK7MxlAV9Rxu+JVpEqfOYNeqgPc8vAZ9Ue+BCaUgcVTgHuF7+BqZSSIVOVXQkXm84q9CteSl3qG3JH24VJhfSF++WifF6mKatVKG+rwQ4UgpEqE56+7dB6svbEBGAjxKTXEcQIWEdbJd/XvE7djf0od+kai7Zecsb0enLMYsGsemkdfzm7IsliLS4IQ28k2m+08E5MkAGjTBJHbZMSu/R/xRBSw+1duO7GU7jb+ozjHSEas8Hy9LY0lszj1VzL8fVNy5YWeqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XJhPVciLUzEu7aYbf6zQpM/bkxm9q36IA+36Y75kWQ=;
 b=0slI8cl+LqjDqadGUBE5m95+adcNqO6T9TVhZfCNoplQ6uN+DrJiKm0wyGb4PrLopego0mOmxDTFyAvLfEw399H9uXQMdTIAQ9Q4IUjRj1NKUmgoUhPiURvgI80BCAoKw6ELLQY5YhHYmZQGd0IvMMwYwHTR/F/Cu9OIp2+vrnI=
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
Date: Mon, 1 May 2023 16:09:42 -0400
Message-ID: <20230501200942.168105-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501200305.168058-1-stewart.hildebrand@amd.com>
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT067:EE_|DM4PR12MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a3272d9-79e4-4a75-ca3b-08db4a800482
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AYbOBjwjju28o+61rCE+w9k0H0/ZRJqJopCvwEl4QGMqHtNwsWGsDzPWCZcmr3cRCFHzCxOy5RGRthnSLLEzjlSPhg2IXy1qAhPBYDES5PQemCtNDwHYC06FwXclLRIBABAPoSLijsC9TbjZYafmwNbDc7O87Qc+2x7niTjjJbGcr6lsJk3CzIV+YazJUboqO3lvJvN10LKbqDYTJxUu9ok8ZaCO6z6j6XmkZe5qsqpmOBV3L3oK3LFRzNTj3FWg2wVv4IjYwGISy4GevbyLTbN8yM2fBw6O/Wjnjk83CZjvP5lD/z27Mn436uK+F3fE88BloLZ3473dn8gUzzXrLZ9v2KnNnoNr6tqJKRJXuqISudAUudZZMoz6jib1vxs6aGE3ZkgrGEgpgULlXBjasoH15vslF+RCLER/1zTQPL2xEKQAJ7L0PJx6oN5Y49PA/l8rEVRI7OylvSMpg8tp2x/Ka85tiRoNAphprAFJ+BAR1owYULnIiIuPEOfgGK7Qw7d+Gz1cl8pQ/YOymeezkyH+rWwcT7HTb8EypernyyScKj93xMvJ7V5/LB+gJpOCITAYSi5bmaGfIqVmLeMIviURG7xUUboaKaBWdC3v++7UDAxfVCQ5Gh3h90MIny6wcNEYEew9dqdx/awKIOaz5miCdUcEVOAK8sFds1ph4rdSJ0/RkBFko4uAVjfYrgxsuz56Ev8q8A/peJ3zZfvJqrYiX4aMAdZaq89Gmihv9RrHIJ8L3RJnVN7NlMVvXfcs
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(82310400005)(44832011)(86362001)(336012)(2616005)(83380400001)(1076003)(47076005)(36860700001)(82740400003)(186003)(356005)(966005)(81166007)(426003)(26005)(40460700003)(6666004)(8936002)(478600001)(316002)(54906003)(8676002)(36756003)(40480700001)(6916009)(41300700001)(4326008)(70206006)(70586007)(2906002)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 20:09:49.3600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3272d9-79e4-4a75-ca3b-08db4a800482
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6038

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


