Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ED87BA8E7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Oct 2023 20:18:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613093.953383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoSuQ-0004pS-B9; Thu, 05 Oct 2023 18:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613093.953383; Thu, 05 Oct 2023 18:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoSuQ-0004mJ-4K; Thu, 05 Oct 2023 18:17:14 +0000
Received: by outflank-mailman (input) for mailman id 613093;
 Thu, 05 Oct 2023 18:17:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JwJB=FT=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qoSuO-0004jk-4r
 for xen-devel@lists.xenproject.org; Thu, 05 Oct 2023 18:17:12 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20609.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 640787e4-63ab-11ee-98d3-6d05b1d4d9a1;
 Thu, 05 Oct 2023 20:17:09 +0200 (CEST)
Received: from BL1PR13CA0269.namprd13.prod.outlook.com (2603:10b6:208:2ba::34)
 by CH0PR12MB5266.namprd12.prod.outlook.com (2603:10b6:610:d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Thu, 5 Oct
 2023 18:17:01 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::ea) by BL1PR13CA0269.outlook.office365.com
 (2603:10b6:208:2ba::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.25 via Frontend
 Transport; Thu, 5 Oct 2023 18:17:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 5 Oct 2023 18:17:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 13:17:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 11:16:55 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 5 Oct 2023 13:16:54 -0500
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
X-Inumbo-ID: 640787e4-63ab-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDKRGH+EJZY7bPcyD2/FmFYx5xVAT0MbSNddyIvGQIniGlN40ohAvEup8QaDjivvJp508mqlw8e4UD108M1iNQ4Zh2B1HKnrYA+omZDFG5JaPWbWogLUP2Juudc0lTPr3WEZsV2rYF8R58833VMu2pmd2WhUnOdGaBHrRoIpSUynHhEziEEacP3XaT0x4bX9NJvbkSGhwF6MhwVouhtW3+mMGLiO3zbqRQKhYvQCol4ccdlMR1G2WaEoVg2vf4tVD8Ei4qkpsw+hJvWl8dZ+nRkGbU6n6uM3RpDhyiK9xUYongblDUE6c6acyxOF827IE8VWchYV6qy4mrk+UaWdAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqJO5eINxVHCO0CwH0LZUqYjnBPafl1pauyRsQ+lAX4=;
 b=JcMDSmld7eKl/ofCPEqiXrY661cj9ArZbAI5fXJEpAmdBsN88kh7cFb5I4ui6PvM9c8YrL0mCyWopu5XR6u2S4ffu6LWHMYeG8W4lsccBepUeZeDb12mLV/2AKXq7ZhmxUKxApn5/yRCogI7xiCXLEzOtUdwMj8u5sLSaw6C8NGQHGl+BJRPrpiXE0aIcE67pGYX0hki4JObKQPPsvCaNvYwnt5S4Q1l5j7TFu78vJwXzSNpzFx8q2n75pct+LfJHrwoyn1kCmn+Hy6GL8m2/yNhfQ+9TqPl/4cv6/5i3FC3NOzpcIgfzaFl+AVkdIFJAn989TYXBxxETfrmAFC9Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqJO5eINxVHCO0CwH0LZUqYjnBPafl1pauyRsQ+lAX4=;
 b=IAPWFLXHwOEMGxt9LDogPf5ldiqg9dPrJtwPhEJzfsjUF7Kdg458mki/bsa9y+UK7uiXKg3/t5gaYM8+xJTJCGPlvGo6kSMjMR3ZfnCFkrqucu6fHT12qGJ1MZg+q8gjZITgJlPNLOQHeH6sNOQdtGSiBCwOAMZhxOPCLDRUzGg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Vikram Garhwal
	<vikram.garhwal@amd.com>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>, "Marcel
 Apfelbaum" <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCH v1 1/7] xen: when unplugging emulated devices skip virtio devices
Date: Thu, 5 Oct 2023 11:16:23 -0700
Message-ID: <20231005181629.4046-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231005181629.4046-1-vikram.garhwal@amd.com>
References: <20231005181629.4046-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|CH0PR12MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: e88332cb-0256-4a72-3e1e-08dbc5cf4553
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E8bG/LV3yaSki3lq4iQpfPITD+pa4vdTBeWPzRR49oxoU3yBj1JGmeq2kyfuf+0/YX7gNkQeiuvsxr2E+08oV1b8C4cImrXnwb3kQ6JvRZEAkfpephEVN78NDwd9pis7EeUGf2vaC83XOwJn3oa+shHdorfWxPom9vm+IW/5sJYNkvBq5TgtlxFCd7gOIjyoxdVORNHGZwCgASudhNIqDCbedcXxohB1CtkT1O+E/uUBr1QhUkXlTkeneogxs9n15gBn0p91+QCIKDEpEhhbj4lPhEtRTumxJcXdYyJuRGgRmPwT9CQsN9jeVYNN0oRGO8DLs8NhltS7R6Ui7gt6DDwEMCvkHwI1RvBFwUo6gtUJx0U2/w1YjxRzvezTHo64WU7FF3H3Ilquwcc6biofUxXrySiRijSZDFRUU3oy/HZfJtyzOLaYJ5XDEmnah3A41PjRyE1vcFv2TLw//FBhVXkJ+payJdZGo/83Q3yjN2Yn9q28F8z+164btl5MBE2npgiVdfPgRplhx4i7C1aUqUYgooBWQcIbzL8kntv8Z0UgsZvKeyS+ZTRsEkB/vcSYos+HBked4WVIjk/rvRHfVBpNsWh4TCy7t3/u7UzudOHNnEM/rFYv+pspjnlqeeWuCV28mZQFI48uPotixXUPIklzMj0GJaO3c7uUkQymZlaNdZEyUr0DDuVEaqiIBQxn/5Hp6oCJKxkqvgodfunrOVIQsqaEzw9eNsn8atNX4LMJ1QXWw3UTDUWnCvhwDqMESCUsMA2Kspe7ID1A5tG/nQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(82310400011)(1800799009)(451199024)(64100799003)(186009)(40470700004)(36840700001)(46966006)(7416002)(44832011)(5660300002)(8676002)(2906002)(4326008)(8936002)(41300700001)(70206006)(70586007)(316002)(6916009)(40460700003)(54906003)(36860700001)(40480700001)(26005)(336012)(426003)(36756003)(6666004)(1076003)(2616005)(86362001)(356005)(81166007)(82740400003)(83380400001)(47076005)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 18:17:01.4573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e88332cb-0256-4a72-3e1e-08dbc5cf4553
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5266

From: Juergen Gross <jgross@suse.com>

Virtio devices should never be unplugged at boot time, as they are
similar to pci passthrough devices.

Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/i386/xen/xen_platform.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 17457ff3de..3560eaf8c8 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -28,6 +28,7 @@
 #include "hw/ide/pci.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
+#include "hw/virtio/virtio-bus.h"
 #include "net/net.h"
 #include "trace.h"
 #include "sysemu/xen.h"
@@ -132,7 +133,8 @@ static void unplug_nic(PCIBus *b, PCIDevice *d, void *o)
     /* We have to ignore passthrough devices */
     if (pci_get_word(d->config + PCI_CLASS_DEVICE) ==
             PCI_CLASS_NETWORK_ETHERNET
-            && !pci_device_is_passthrough(d)) {
+            && !pci_device_is_passthrough(d)
+            && !qdev_get_child_bus(&d->qdev, TYPE_VIRTIO_BUS)) {
         object_unparent(OBJECT(d));
     }
 }
@@ -208,6 +210,10 @@ static void unplug_disks(PCIBus *b, PCIDevice *d, void *opaque)
     /* We have to ignore passthrough devices */
     if (pci_device_is_passthrough(d))
         return;
+    /* Ignore virtio devices */
+    if (qdev_get_child_bus(&d->qdev, TYPE_VIRTIO_BUS)) {
+        return;
+    }
 
     switch (pci_get_word(d->config + PCI_CLASS_DEVICE)) {
     case PCI_CLASS_STORAGE_IDE:
-- 
2.17.1


