Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4592274F862
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 21:30:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561888.878456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJJ35-00067H-9L; Tue, 11 Jul 2023 19:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561888.878456; Tue, 11 Jul 2023 19:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJJ35-00064v-66; Tue, 11 Jul 2023 19:29:23 +0000
Received: by outflank-mailman (input) for mailman id 561888;
 Tue, 11 Jul 2023 19:29:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e9Pp=C5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qJJ33-00064p-UQ
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 19:29:21 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20619.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3af8b399-2021-11ee-b239-6b7b168915f2;
 Tue, 11 Jul 2023 21:29:20 +0200 (CEST)
Received: from BN0PR03CA0048.namprd03.prod.outlook.com (2603:10b6:408:e7::23)
 by BL1PR12MB5972.namprd12.prod.outlook.com (2603:10b6:208:39b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 19:29:16 +0000
Received: from BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e7:cafe::a4) by BN0PR03CA0048.outlook.office365.com
 (2603:10b6:408:e7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Tue, 11 Jul 2023 19:29:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT077.mail.protection.outlook.com (10.13.177.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.20 via Frontend Transport; Tue, 11 Jul 2023 19:29:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Jul
 2023 14:29:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 11 Jul
 2023 14:29:03 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Tue, 11 Jul 2023 14:29:02 -0500
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
X-Inumbo-ID: 3af8b399-2021-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkYnv/mXBIjl1mroWrqDwgdcI8y7DFzhHNuQC7eacmDiXiwCJeawdqGC4dwlmK7DQDawG74a8T+/8V0We6KdYCzgtXQG0sMZZSrHVUAFKdrwoSr7ry2JqucHg1CGCp5aBkUgWQm4fO8E1sTiZU7UUnEvEYH9l0AxaSRW0v/uvTpa2wRBR6CJ+rI+/zSRmu46PreLzEOBVig/jvwBOJu+kHMJgH0eO4P+0B/M0w5TkcjHCfN+Mps8xS33ELLr6hr7O7Fss9oHFDwhg8x0cdgZ5obSyktCiOH0OXAwGFgFcfiF/+002Jv41wRmC/y1vEpRvC7KaL3GjSPl2FGMNNRLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4fZ5AYV++e461XBJf/ibPXTzm5SJu83StErzueTYbM=;
 b=DYu4Xajj7NjdjE0DqUZl3Rx8oke0H3d4kT2isYQ9ixgBKe1mcz4n61l1h5o9D0JUTL3Gdz7/xO3p/hkOgrbgOwywxLMUZhwQ3fhyqoAI+qMyMZyFH+qJQFryxCb3kxflEtTF2OsJNvJ0KeHODsx6fVju90ORueg3Rdy12FuAy41IEIVZlwRwGF34Cv40jfJXWAY4EPLqPIJs+GydS3LVnYaiYGrLOADsFwied/rUganhLmebxbNycOVuyLEKuIsZcEhwHIuG3YlEpGUrKou5yygntbbLfwK6hFe8rGGKoeUSkKj0x6Y4aQcxVYNd3GRz9UcMnaglPT9aX3i2/ILU3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4fZ5AYV++e461XBJf/ibPXTzm5SJu83StErzueTYbM=;
 b=Aag5wmTqip065jD1gNdtJjbJ7PRp//N6Q2HLpgwx9VVcnVp7tO6xSATkRHog8nZB41jZh89ZMt6LQfx072k71wjV0PJBTWNgcyZoXcaOGn4yrHiVIwhcK+UBQJvGaly6op/cveUQmdUN6HYVQVSS7CBj5M+UdI6DpTCBNGNhF6Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2] xen/arm: pci: fix check in pci_check_bar()
Date: Tue, 11 Jul 2023 15:28:28 -0400
Message-ID: <20230711192829.744077-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT077:EE_|BL1PR12MB5972:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a9d66d2-8b56-495e-d2fd-08db82451d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J7/46Sw5PO1TdwakgO2VDpqlQMeyX0ehOOuQbQMLKZb+A6UN1N3Aa7ZeqxOzQ3Er5SHaAz9OpUrHueIeHd66hjX3Jrr4jM9whvIgO018ebHI+cIPNtm15uRb/xhVTOf3ZLT85rf7SH+OzUS1Kh795SEt6TGgJU9KyaDt37oXPnfNksqrMULaFMioJe02K8vP95edQoMS/4sI8xPpjJB5hJf+pkNaHbrkLdLiXyDUaYYH/bWPjMh8w7y+JcHoZfVaQGJAiAEG8IGJV8Vhv8BMeOh8vYzJo8BhMfjSNKkQcGkZAthkfQGQZhPdZ3lAa7Ng9PQEU9slVaS+sIxwSd9VsBQMQw/dWwzkraCfCFWUncBIGlClSi/25r9FFKq/2koPt7y7gmrYbUCvwR/N2dfm7UTgeZrwn7iVlaGs19gaEWWSEMVPAndPdpPExGe9t69gre/w4RCth2s2Mgf8aZ2IoIyjNsjo74QtDm6Kc3xOsfoTS3j1CctJkjrVyYSzKh7UfHgTTEaWt7hZMsuzf6LFGAS85eYKpvb2awdXiLv+6KZDLq/j1k0xwK7WN+dOz2CyplTX1ZEN8c0mtuN3iysWVYYy3Bfnw2UULAK7xMUfl7yy83KBwiBL+b55B2/z8YMsiT9agnjWWz/xqa6dfTyc73+HgY/Z0nCWdz8g6AZ0SNanO1WNf6Hfom4t2n3mA9dU6FzDJbzkBSeRMilo+Bs0DhIjmJGvxsRfHyoms4eyvsJydyKVysNt0PJObwQ/LyXV8wegXI3dAruh4X483T9+zw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(44832011)(86362001)(5660300002)(8936002)(8676002)(41300700001)(316002)(82310400005)(2906002)(70586007)(4326008)(70206006)(6916009)(82740400003)(81166007)(356005)(54906003)(83380400001)(6666004)(478600001)(36860700001)(26005)(186003)(2616005)(1076003)(47076005)(36756003)(40460700003)(336012)(426003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 19:29:16.2842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9d66d2-8b56-495e-d2fd-08db82451d8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT077.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5972

When mapping BARs for vPCI, it's valid for a BAR start address to equal the BAR
end address (i.e. s == e) since e is inclusive. However, pci_check_bar()
currently returns false in this case, which results in Xen not mapping the BAR.
In this example boot log, Linux has mapped the BARs, but since Xen did not map
them, Linux encounters a data abort and panics:

[    2.593300] pci 0000:00:00.0: BAR 0: assigned [mem 0x50008000-0x50008fff]
[    2.593682] pci 0000:00:00.0: BAR 2: assigned [mem 0x50009000-0x50009fff]
[    2.594066] pci 0000:00:00.0: BAR 4: assigned [mem 0x5000a000-0x5000afff]
...
[    2.810502] virtio-pci 0000:00:00.0: enabling device (0000 -> 0002)
(XEN) 0000:00:00.0: not mapping BAR [50008, 50008] invalid position
(XEN) 0000:00:00.0: not mapping BAR [50009, 50009] invalid position
(XEN) 0000:00:00.0: not mapping BAR [5000a, 5000a] invalid position
[    2.817502] virtio-pci 0000:00:00.0: virtio_pci: leaving for legacy driver
[    2.817853] virtio-pci 0000:00:00.0: enabling bus mastering
(XEN) arch/arm/traps.c:1992:d0v0 HSR=0x00000093010045 pc=0xffff8000089507d4 gva=0xffff80000c46d012 gpa=0x00000050008012
[    2.818397] Unable to handle kernel ttbr address size fault at virtual address ffff80000c46d012
...

Since e is inclusive, drop the equality check.

Also, adjust e to include the whole page. This increases the accuracy of the
subsequent is_bar_valid check.

Fixes: cc80e2bab0d0 ("xen/pci: replace call to is_memory_hole to pci_check_bar")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* adjust e to include full page (e is still inclusive)
* add comment at the top of the function to document that end is inclusive
---
 xen/arch/arm/pci/pci-host-common.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index 7cdfc89e5211..c0faf0f43675 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -393,20 +393,24 @@ static int is_bar_valid(const struct dt_device_node *dev,
     return 0;
 }
 
-/* TODO: Revisit this function when ACPI PCI passthrough support is added. */
+/*
+ * The MFN range [start, end] is inclusive.
+ *
+ * TODO: Revisit this function when ACPI PCI passthrough support is added.
+ */
 bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end)
 {
     int ret;
     const struct dt_device_node *dt_node;
     paddr_t s = mfn_to_maddr(start);
-    paddr_t e = mfn_to_maddr(end);
+    paddr_t e = mfn_to_maddr(mfn_add(end, 1)) - 1; /* inclusive */
     struct pdev_bar_check bar_data =  {
         .start = s,
         .end = e,
         .is_valid = false
     };
 
-    if ( s >= e )
+    if ( s > e )
         return false;
 
     dt_node = pci_find_host_bridge_node(pdev);

base-commit: b831326ee2f9ed94523b3d8b0fb2da2a82113e9e
-- 
2.41.0


