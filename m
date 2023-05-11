Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540FB6FFA1F
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 21:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533578.830384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBws-0001Rq-Jn; Thu, 11 May 2023 19:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533578.830384; Thu, 11 May 2023 19:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBws-0001PQ-Gd; Thu, 11 May 2023 19:27:34 +0000
Received: by outflank-mailman (input) for mailman id 533578;
 Thu, 11 May 2023 19:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWxp=BA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pxBpB-00042a-D8
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 19:19:37 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20629.outbound.protection.outlook.com
 [2a01:111:f400:7eab::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c30d4630-f030-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 21:19:35 +0200 (CEST)
Received: from DS7P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::9) by
 DS7PR12MB5911.namprd12.prod.outlook.com (2603:10b6:8:7c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.18; Thu, 11 May 2023 19:19:31 +0000
Received: from DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::9e) by DS7P222CA0023.outlook.office365.com
 (2603:10b6:8:2e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22 via Frontend
 Transport; Thu, 11 May 2023 19:19:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT093.mail.protection.outlook.com (10.13.172.235) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.22 via Frontend Transport; Thu, 11 May 2023 19:19:31 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 14:19:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 12:19:30 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 11 May 2023 14:19:28 -0500
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
X-Inumbo-ID: c30d4630-f030-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z62fgB6WMELun9BSFmliivebJ5ZvIqlHQuq5HKMM+7NuUREA8YK69GgS1H+Icfa7jriO+hm/znpTDCYgiWLRnm4rPeVG7/uyg+Ld35p66cRCGE8znaD6zdX1ULGZKBUWJhhmYMDfcGF///QIUM0V4UGx+/91mTbzhwFuhCP5tRAyDCnl3rRynzlEu0GiouQACMPbC5mMhwNLNNUfeadwzeP0CnvZF4tt+raXjqGMw5kOuOG6BTRM7XujSDtmdDvuWKM/BkmDO3OA59NTpgY4Gkf7pdqALB2puYkalPFYKZUVlDuHzQpAejuWRibBoJQUHVXzRM0OJrx8y00slHd9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bw0rFieP9TglgEJiPQkHGTzJjkGcjQqChjjGQBEv5dQ=;
 b=C+ZrViLwvKc3xnHec0guBvhmK0C8aJaIg5ARM4oghkIeY5At1hqYvhFM1++VgyfDAwy3A1eBnd1xrnPyvRUaey69xoYnhEpMGFz8hUo39+jsu0pF7yz/lmcsVRdhlxtiSh2kicwVRGDntt2rcKfWtzJYZUyQKvn1Pwv3YvtK5qDYAnmmq5ofhXrrrfcl87Kb1X2U3424vGKWmrnGcMri1mED0uineT3rVrJvaaqtABr00V45CStyRJe6UCgRR3rfFCFqs1FmHMRNlXGKrlm+8L6sg9BW7kS8QL6WNxIeRUO/gFX+AJRWc0aRKQ0g2ZEiOwwNbmjFuNNWcFCahnOzIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bw0rFieP9TglgEJiPQkHGTzJjkGcjQqChjjGQBEv5dQ=;
 b=4ie/rqrNqJOuaGk+X0TXvsO7gIVhKgqH4AZIGH67kU7nrY49OO1C4K+ldJ1dtfciTt/YPrzNCHj8KoLeipA4zTHBqE0G8BOkad1a/RnkDRN1pbSki2HM3d/qnhZnLKCswE7ExAnSXGH4CqOogddj0SmBeRiraQ84ZaGEAnyZujc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v2 5/8] pci/arm: Use iommu_add_dt_pci_device()
Date: Thu, 11 May 2023 15:16:51 -0400
Message-ID: <20230511191654.400720-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511191654.400720-1-stewart.hildebrand@amd.com>
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT093:EE_|DS7PR12MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: aedad1e9-6edc-487b-3cca-08db5254a5bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/JCPZQF+b+gEQ7Aq5Z2HwxiuUbrh7bQR2eRmoN4NuvXTxiIukSybeSfgepwVVoAZ7pQ5LnNIrNsHJgzWq+dko+4KsW6Om/o/WJNMYQZjaciPQM+womfyzZ8T0J0f6q/gW/byBgC0r1YdC+sEU98NT0UWt65WNe3BBcEfY/gLbNTyEuJcspJ97swiiQf6MvYVl+FpIaurGUddLx8oib/libFWq1xyz3yU3P/NCfisU4z8dij0pwI585wSi/6eb+Z+N/1niE/jCCHIjz0+srQpJ8+IG6Y/ipvPa30hH2lyPHS9ieQMJltg6RDO2IqrO//9ChlwWljO9+r7XFh73/heAAFvb9xak55cCz9aMmc+LTZJRZ36eCgrVnOPVAhKOFcwq3KNvBYqtffWt03WXsc+84W9QsedDalDMW8RySk/PAkdZXTq5S6qEc3R33c/8EssaXnPFezaF9YfewLNAfO0o+a4I/l1xn8Rwqvh5PD1KxNHirCcMWfcViEbHjrWsoCEUvXSP3PidaAGkeiWVaanaOiwdh18btELwEfWxMivJahntk1dJKqViGXwKUdkSZyl2VYCmEvqv1gaAGB8k0sTr1+yRskLkANi1tjSTbI61Jr8epxi1uhjXhgVZGgR1uneZtSaS0lAqQlkbhknhbjRPOKWdVQDNFkdyNsak6xepvH0DbwgNWAq3MMGDAATROsQTz/MPwVgrudLXfRz+rj83tPFuy03yQf/KN48g6IgupOijicMirmg4ULctbbIMkIZhm/lh204Q7GZJqvP59gqrw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(40480700001)(81166007)(1076003)(316002)(186003)(6916009)(4326008)(86362001)(26005)(70206006)(70586007)(40460700003)(82310400005)(54906003)(356005)(478600001)(36756003)(44832011)(47076005)(5660300002)(6666004)(966005)(7416002)(2906002)(36860700001)(8936002)(41300700001)(8676002)(82740400003)(336012)(426003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 19:19:31.3648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aedad1e9-6edc-487b-3cca-08db5254a5bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5911

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

On Arm we need to parse DT PCI-IOMMU specifier and provide it to
the driver (for describing the relationship between PCI devices
and IOMMUs) before adding a device to it.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* new patch title (was: "pci/arm: Use iommu_add_dt_pci_device() instead of arch hook")
* move iommu_add_dt_pci_device() call (and associated #ifdef) to
  pci_add_device()
* use existing call to iommu_add_device()

downstream->v1:
* rebase
* add __maybe_unused attribute to const struct domain_iommu *hd;
* Rename: s/iommu_add_pci_device/iommu_add_dt_pci_device/
* guard iommu_add_dt_pci_device call with CONFIG_HAS_DEVICE_TREE instead of
  CONFIG_ARM

(cherry picked from commit 2b9d26badab8b24b5a80d028c4499a5022817213 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/pci.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index b42acb8d7c09..6dbaae682773 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -34,6 +34,11 @@
 #include <xen/vpci.h>
 #include <xen/msi.h>
 #include <xsm/xsm.h>
+
+#ifdef CONFIG_HAS_DEVICE_TREE
+#include <asm/iommu_fwspec.h>
+#endif
+
 #include "ats.h"
 
 struct pci_seg {
@@ -762,9 +767,20 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
             pdev->domain = NULL;
             goto out;
         }
+#ifdef CONFIG_HAS_DEVICE_TREE
+        ret = iommu_add_dt_pci_device(pdev);
+        if ( ret < 0 )
+        {
+            printk(XENLOG_ERR "pci-iommu translation failed: %d\n", ret);
+            goto out;
+        }
+#endif
         ret = iommu_add_device(pdev);
         if ( ret )
         {
+#ifdef CONFIG_HAS_DEVICE_TREE
+            iommu_fwspec_free(pci_to_dev(pdev));
+#endif
             vpci_remove_device(pdev);
             list_del(&pdev->domain_list);
             pdev->domain = NULL;
-- 
2.40.1


