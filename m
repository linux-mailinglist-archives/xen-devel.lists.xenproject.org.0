Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E38B725A61
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544580.850496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pSU-0000S6-B3; Wed, 07 Jun 2023 09:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544580.850496; Wed, 07 Jun 2023 09:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pSU-0000QR-7K; Wed, 07 Jun 2023 09:28:02 +0000
Received: by outflank-mailman (input) for mailman id 544580;
 Wed, 07 Jun 2023 09:28:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A2EA=B3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q6pSS-0007p9-IR
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:28:00 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e83::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 963355aa-0515-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 11:27:58 +0200 (CEST)
Received: from BN0PR10CA0029.namprd10.prod.outlook.com (2603:10b6:408:143::7)
 by DS0PR12MB6462.namprd12.prod.outlook.com (2603:10b6:8:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:27:54 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:143:cafe::83) by BN0PR10CA0029.outlook.office365.com
 (2603:10b6:408:143::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 09:27:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.23 via Frontend Transport; Wed, 7 Jun 2023 09:27:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 04:27:52 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 7 Jun 2023 04:27:51 -0500
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
X-Inumbo-ID: 963355aa-0515-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGV4gzwikXD0RhBY7ZkIGrFXVMstyQ4eZQz+WRQbc57DKZ/IhdDAo3JRVwNwH65T/oaswEQ7gbeMJeeMqU4i+74x2FRyeMmIBmuYs0lH0X7CGmWrMrN/+BtNrX7JIttyryX35LOFYC4yniQqawQ8CueDMH6v4bgdha4nSyos6euLEj/tQEyfXCM+MTNaJhvGhC/pjaT0CRuj+PDmEAqmuOtDlTzigIQlSGpjWa3oeqHjhqeu2ftXbvBHfpTORP3HKQkXs8XkyTuHwhEiXIRY5ESOlMJ7hQzDY+A01lq14vdu+1K4CxtXyCdJkTl01JWcbBB1OzJk3eR942eyxNSLog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bdyg4wduBHS4jVU1X22vJpEOlAmdB1Wdxc+0O1Wdu78=;
 b=DvhLKzNwd7eZ3v/1347Dg+zNdhLBpfJLDffNfyPoDJBQw2G8dffACDy/sNk+4Y9JfeZetTaoyB1Wpb4MbeYjQM9qLN/xabBx92pUMx/3gPfnGkMEfRv6/PFi39KpIX0sRT3BojmS5M+v7wvI08gglscS5iEV74M2cV/eHqanJAnWa2hOXDYYjuLR81wl7Dt3hxb6dYEIvj4eV/iE/m4eVppf/6ZrKxKMq+Y4OeatzgswiX3rWV6jv1sIImCfFsco/6I99YM4qNuoRBWM7JchwT1dLXqZQhluCtDmdM3dCXFrGU65T82cCQhj+/8cMYvFC0A3HAQh/WJ0mUlwN+N7Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bdyg4wduBHS4jVU1X22vJpEOlAmdB1Wdxc+0O1Wdu78=;
 b=T/bvn1wB22kPeu+r1903F9qEXPCpWzDOMgHByCwJC6n3CLKiF8iUcTD8jlOgRV6psMcll6/ijGXifmD4CGdz6JLa/A2/dbM0pUzTz9xsb8tWdZcKa/7OYzCYmoLQGxzAM7f2LRoE4ICxE0LUHnmDtS6bXpnomF+z8WMYd1Ur/TA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 4/4] xen/arm: pl011: Add SBSA UART device-tree support
Date: Wed, 7 Jun 2023 11:27:27 +0200
Message-ID: <20230607092727.19654-5-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607092727.19654-1-michal.orzel@amd.com>
References: <20230607092727.19654-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT020:EE_|DS0PR12MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: bb995567-5812-46e7-2cf2-08db673978de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9SrKz96UMzrO9J2Gh0/6ejJLqJtYjeRQzXDNw1SCGUSzlc2XpIi4YvfO9AJY1MyO3BP7JQkuEaFhlnHxa3oAgJM9G64X4aeYfRlvZdJOOjsaolFlGngitbbWYzwF7T8vBXoqknM0AH0x/GTGwTmfkhOGOaGWlYNb5g3orJBcQRzxUFgcAC3oaUWhqru+5+rlZsj5zr7sOC0i0d2x5UIx3Gn2Pkqnjgqte4bpH082Lu7j+MRKjP6cVsDjXcL/fIaY9XYQw7r23Ze4cHwo2wIREqYGGZYgEmBAKJBOjCATG3kGquUJJtgJrGl8DPKt9FzV8cuRJCpapMpicoa+WDeXWSqvrH00tDFm98+PJ9IFSNHQgdV2TN5/WrXnRX6JP4Ete9RuXcyy/f38NNIOzf0cjvuPp/0NCx6xbrJ24/Mu7d6oal1OhoXmyonnRr0lsR693t1tt+Wcm8z8tfJRUvmu7Lb1gyzsd1n17FGehMtzA+eXti6FCMGv3zSSW3MY7DGor82XxppC6cx+0I3FF9T8hVxR8zVriAwdtDx7eMYz7r08k3UNAEqG0U6AIi4+cKRW57StnTeF2IBJ9jXf+F5pEFsxVxzXhNMLstxUaypL8loYlBq5hMYBUrn/BRxNXvtg5Ps+dPftgWgdcvlue24TAp5D8/f1Pg6NXzed8fWu+p0juqLf7MI0fZdI2cv7O/F+jujh8IgdQLfcsexfgGtm1yx6dxtWuV7caVk3/FrxLQgC/WS0Vma8qxDUMTaKoB2cotg/ZPVG3j61NYsJfQuomg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(1076003)(26005)(186003)(2616005)(426003)(336012)(83380400001)(47076005)(36756003)(6666004)(36860700001)(82310400005)(2906002)(8676002)(8936002)(54906003)(82740400003)(44832011)(478600001)(81166007)(4326008)(40480700001)(5660300002)(6916009)(316002)(40460700003)(86362001)(41300700001)(356005)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:27:54.1211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb995567-5812-46e7-2cf2-08db673978de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6462

We already have all the bits necessary in PL011 driver to support SBSA
UART thanks to commit 032ea8c736d10f02672863c6e369338f948f7ed8 that
enabled it for ACPI. Plumb in the remaining part for device-tree boot:
 - add arm,sbsa-uart compatible to pl011_dt_match (no need for a separate
   struct and DT_DEVICE_START as SBSA is a subset of PL011),
 - from pl011_dt_uart_init(), check for SBSA UART compatible to determine
   the UART type in use.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
After this series the last thing not to be in spec for newer UARTs (well,
for rev1.5 introduced in 2007 I believe) is incorrect FIFO size. We hardcode it
to 16 but in r1.5 it is 32. This requires checking the peripheral ID register
or using arm,primecell-periphid dt property for overriding HW. Something to
be done in the future (at least 16 is not harmful).
---
 xen/drivers/char/pl011.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index 403b1ac06551..f7bf3ad117af 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -286,7 +286,7 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
     int res;
     paddr_t addr, size;
     uint32_t io_width;
-    bool mmio32 = false;
+    bool mmio32 = false, sbsa;
 
     if ( strcmp(config, "") )
     {
@@ -320,7 +320,9 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
         }
     }
 
-    res = pl011_uart_init(res, addr, size, false, mmio32);
+    sbsa = dt_device_is_compatible(dev, "arm,sbsa-uart");
+
+    res = pl011_uart_init(res, addr, size, sbsa, mmio32);
     if ( res < 0 )
     {
         printk("pl011: Unable to initialize\n");
@@ -335,6 +337,8 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
 static const struct dt_device_match pl011_dt_match[] __initconst =
 {
     DT_MATCH_COMPATIBLE("arm,pl011"),
+    /* No need for a separate struct as SBSA UART is a subset of PL011 */
+    DT_MATCH_COMPATIBLE("arm,sbsa-uart"),
     { /* sentinel */ },
 };
 
-- 
2.25.1


