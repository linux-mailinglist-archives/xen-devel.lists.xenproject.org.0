Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FE4750A0B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 15:53:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562526.879239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJaGl-0000f7-Uw; Wed, 12 Jul 2023 13:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562526.879239; Wed, 12 Jul 2023 13:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJaGl-0000cG-RM; Wed, 12 Jul 2023 13:52:39 +0000
Received: by outflank-mailman (input) for mailman id 562526;
 Wed, 12 Jul 2023 13:52:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YmCp=C6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qJaGj-0000c8-Ng
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 13:52:37 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [2a01:111:f400:7eab::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a7619a3-20bb-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 15:52:35 +0200 (CEST)
Received: from DS7PR03CA0108.namprd03.prod.outlook.com (2603:10b6:5:3b7::23)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Wed, 12 Jul
 2023 13:52:31 +0000
Received: from DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::6f) by DS7PR03CA0108.outlook.office365.com
 (2603:10b6:5:3b7::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.22 via Frontend
 Transport; Wed, 12 Jul 2023 13:52:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT075.mail.protection.outlook.com (10.13.173.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6588.22 via Frontend Transport; Wed, 12 Jul 2023 13:52:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Jul
 2023 08:52:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 12 Jul
 2023 08:52:29 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 12 Jul 2023 08:52:27 -0500
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
X-Inumbo-ID: 5a7619a3-20bb-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnXw4M11PL8zadG8PaiPgh4k09kVjzgt+3UUF/CmMVpPkuLUQy1OJ9UfJAzC+K3atqx7JxjH5txa4BwmMW6t+41OVuO1OPK0QDkVX0zGqveBnCOSvh/HhVq91qZ0NqQmfTU5kvUI6uXcpOZjOu919TbPrWlmz1cL9HCyPN2/uwxuMllZ7AOmgJCCDca6d/cpuvjZhIJf8sEktiipFNfJqBsEkvH+T+4YOXEXshsBGxyyreihmR12qsyO3J+3otSHA0wXeWC08Qvok577q4unEClhNAWD6VzZKKgfJIwNhl/lX0nx8NuH/9v220bKsrmIqhzQlaiAnfoxNn+xL/4JLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq36jgKCRrcIt4jf2b+WTJ8T8S9NB90WpaGx93hStms=;
 b=Wyb7wNscKOgaeMfpi/yJsTIDur8M1tWOvTKvnh3u+RzcnBy5iunXVAON2lPQkZ3/mqyBs+H7ek7saVXSxgBu0vHFemp9rUFBM6H41vwFHqXkJgxm/xoB6DU+Zy2ihh9EhIk02+hERuydDMZcZTax5CzCmW3f/E9dFzOVOsF8ZenHKYKF7DtGzMcTSJq6wjEDkeoHpv0+2MT1dFjJi4FfAs9DWEu59uEqBNn9gphnX9bj1jxH5ZZ0No1TIXBBt9G1jubGgZRfq5pUAgvrO6ep//9nYRo/zhXYe52xw2V3DkqWwu7sS+pGn3kqmV8/XknYX1kdeybn1xh2ITrWzF7+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq36jgKCRrcIt4jf2b+WTJ8T8S9NB90WpaGx93hStms=;
 b=X3PWyxCgNodNpxMFFVOXrgyDGJI5gD13sxreH+VQuRrKxLq4y5FAnnbV3z35N5tqRKhy0TW8edxaeEEeud+sYxkBigA4Uloha8Y1P27T7FIh6eXuBmHDhS9OzfLzlH72uSKJjhPRrCmlF4CIc7zDIPZhLa1Jv2V+kqR8YkSJhwI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3] xen/arm: pci: fix check in pci_check_bar()
Date: Wed, 12 Jul 2023 09:52:21 -0400
Message-ID: <20230712135226.747472-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT075:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: f1aea321-8392-459e-28d9-08db82df3c59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JpNQohC8DzYwVsCqLd4o/KuuTLOqa3WzLAfDelsws91pcBPdJBYxqYIC4AUPbnI8NFvOWN1hyiZYOCyMv3CWadTuuwzbQgPXlybZZTzTfUeH0pWUI09F+TYeNItc/xBHq2T1JKcZuNP8HYRTghf/T2wwGRW89X7k41Tb7pnzV6hpK9woh6DbmINUxcDBYfVjtQclaGvH1iMJdFZ62RygUmMAGRAKbO8yRUdiuEEjz7q4BR89T2sIkHOzfV2zHeFvrHImraFG4l+FjL3/Hfo2dTdk+o9uSnBRrgg9VAHeUvoadSw/PDMwqH3Gc1mTXHUoJjmRvjlJGOGyI0Tj1GlG4msj3lzKiI8VuaeYn0Ub3mZbqUlbEBlKB+sVM6m2A7hVP3NL5L5xA6lNxu8+XvFIYBAyQ6fz/rDT8SroFjB1dusgO2+0cl0wGor/Hagsrfb/SVORap5J0DygAX4acOi5nEg5lRYEnqc8KjfmcSxvsdcA7s7fIDJ6O6JDqGOCMUdh6VZ48K61WbhJ+RcoEbUMv8XTq2P1dD/FO5eUzMssTTbFjDl59/gjJGfms7ItYKeVLPppLnMGYxQ5Y3T4qk6684/A70fLmK5AdULaTU+6ZOd0yYIxAUGtGG4j/z0tzscWoQAzXFLUt9OEnC1+dZwDm9YWuGNu634iaTLTdnu67qog0caQsI4b8A4Nv9Wh7gbOxVhgaxGCROIXy2YvBwg7/Y6iaKiEG8PuPWGlZxzDXi7yhuiAO30limox7TteONjVMx/nhhI5J2Y/p5ofiD9ljA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(82740400003)(356005)(81166007)(83380400001)(186003)(2616005)(1076003)(426003)(336012)(26005)(40480700001)(47076005)(36860700001)(44832011)(2906002)(5660300002)(36756003)(478600001)(6666004)(316002)(54906003)(8676002)(6916009)(86362001)(70206006)(8936002)(70586007)(4326008)(41300700001)(40460700003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 13:52:30.4069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1aea321-8392-459e-28d9-08db82df3c59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288

When mapping BARs for vPCI, it's valid for a BAR mfn_t start to equal the BAR
mfn_t end (i.e. start == end) since end is inclusive. However, pci_check_bar()
currently returns false in this case, which results in Xen not mapping the BAR
in the guest 2nd stage page tables. In this example boot log, Linux has mapped
the BARs in the 1st stage, but since Xen did not map them in the 2nd stage,
Linux encounters a data abort and panics:

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

Adjust the end physical address e to account for the full page when converting
from mfn, at which point s and e cannot be equal, so drop the equality check in
the condition.

Note that adjusting e to account for the full page also increases the accuracy
of the subsequent is_bar_valid check.

Fixes: cc80e2bab0d0 ("xen/pci: replace call to is_memory_hole to pci_check_bar")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v2->v3:
* re-word commit message slightly
* add Roger's R-b

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

base-commit: 0a834e953b01ec25c412369d7a5b8b57d340ac60
-- 
2.41.0


