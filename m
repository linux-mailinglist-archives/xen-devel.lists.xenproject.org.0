Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D90064E1D2
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463749.722014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyY-0006d2-4C; Thu, 15 Dec 2022 19:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463749.722014; Thu, 15 Dec 2022 19:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyY-0006aE-0p; Thu, 15 Dec 2022 19:33:02 +0000
Received: by outflank-mailman (input) for mailman id 463749;
 Thu, 15 Dec 2022 19:33:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWk7=4N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p5tyW-0006TA-Ep
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 19:33:00 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2064.outbound.protection.outlook.com [40.107.95.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47a32604-7caf-11ed-91b6-6bf2151ebd3b;
 Thu, 15 Dec 2022 20:32:59 +0100 (CET)
Received: from DM6PR13CA0043.namprd13.prod.outlook.com (2603:10b6:5:134::20)
 by IA1PR12MB6258.namprd12.prod.outlook.com (2603:10b6:208:3e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 19:32:56 +0000
Received: from DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::8d) by DM6PR13CA0043.outlook.office365.com
 (2603:10b6:5:134::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 19:32:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT085.mail.protection.outlook.com (10.13.172.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 19:32:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:32:54 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 13:32:53 -0600
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
X-Inumbo-ID: 47a32604-7caf-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MB72qYGX0z8zAK5BKc6lYzbOauNVyB4HLwaWHkrWI4sP5zQqYcAqrr2G6QpXdbCw8QQcK11+JLIYIVLht5S4qFvZXwcBT/LSKyHA7QYAIgJ/kH+4XTH4jLyC3KTgf59lkY6N9Xyt5d34XuKvzZw+olesWJN9pu1Agdt0w/HkFodzSDdQPLNeSjzi1Z5upIAlqVRu8nD3u7GG0cbHy7DsUehYyADngQWnI4qvd0am/T2rFY+wK8UVo4SqBzL+ASWCE0oF5AUR6VR/Fepqez0euPFSKm6hQUOWJJKHozIOgn88CubBlqXuwPfhO6kLgxnSve9hDLG+HEEZb+6MCVgIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lvaSkI20lY6fb8u8ypyUkJA8QI8c03TjbZy9rbq1Zw=;
 b=QONe4YKqJ7+hrRpLZMzQPWfo+MRnRZznHuDpf5WkD0fU8FyKPfVyxJyPMzpKSDg14lR0+ENY9c6JdJkYRoy4vnX15NdQbu5oLEQ3sP9z1cqSR7/LUgF355BQ9NRhAYWekCzz7pFZoRo9cd/nuffBq6xUfkoOGN8Bye+WW/7B6ENy1TpkbHqusvD1+SPo6Nrv7FwaQ6fVRfXDfttpL/B6bSR96OPaThVjFtatUwgRqVBJLwQynTxMPA1NTxxrFrTgOqsAnCVjaPDML0YVN9pzMhxD4enSYyuV81TnKXYHJ9+LYHhNTtNhO4gYPoLm3FkP7MiFRs31hBS3N7zMLKeRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lvaSkI20lY6fb8u8ypyUkJA8QI8c03TjbZy9rbq1Zw=;
 b=L5HIAnZKUfVXbdQYCV/mtmKY2rvwh78BMLD8fvgF1hkTcEGDNybue0xj9PQbbZ5SNFVwq87kaKxrGY+Lnmu5paUUM6DN9ZiuIoc+KON6Wye6duYW9mnn3Vkn75STTQM7xiJoqCengzym+2d3AEwgvUm/ECWLuseueyo+bqU1DFw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1 1/9] xen/arm: Remove the extra assignment
Date: Thu, 15 Dec 2022 19:32:37 +0000
Message-ID: <20221215193245.48314-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT085:EE_|IA1PR12MB6258:EE_
X-MS-Office365-Filtering-Correlation-Id: 5053bf64-eb79-47d8-e273-08daded32a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DR7h29BeJ/qnZ7MilG79gedhoFf4Y8+a/fEO5eeUtJGE40ZV6pHYJ5y+pcxgtwgzxsNz00d+Y7TVXRneaE8cGerjONSobpNzwxUSu9Sh/KhqTE7DAwfxltI0nB1z93jX0hvVGN73ujLpxiycfYWCZs2baKqu3eBWUc5IqxhT+AJsdY+SyCUlBNf2q7P5dW02JK2bQjv8VojBLIFfS3wMfi2tURrH8VP9Pwk3xVh4gA5r13BqOIZdRPIRbfBjvGYWW6MlNOloqzIKgzTFpuyRFPWFEtoJxp5dASykMyDl8pKzwvayl1iKhmbm7+iaKZJ95AeZZC2L8MJ5D7hBDAKu+RQOdEtl8/tqnC1gmqyCP2eEpPOhBQDxvuesVPCRAlBe1OKp0VyQYBmDjD99Ltwgf8pWrJKcxNR8bvhqdLpQ4yO75Dsk6M0fQZT9nn63yDaJTve73sMhp5QG8azI0Ix0kYkWjT+Ai2r7TwtCpw6P5kvBgnoQ8hBtd1wD4KWZLcJ/Ul65nmqKze7fKzsYq5wSGzvO49imJcYIssWT3bns2yrdqqLYZBEDLasYKUyIR1vUsE9D3Vcf7B70z07ZGtJrFKrBDsSHDqDg1+BFShNi8GMaDaYmqBtk5vGJshi1G0hzwHNPSOID+ZQEFvoUEY7uCuyzB8hEUOUmmk183EJBJNJYMuNSe9iE+z1ZAM//n5X8eYh8KH7cU/oOA8PoDOgWtfELga9fI/tV9n3qFarmpt8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(40460700003)(2906002)(356005)(316002)(103116003)(40480700001)(70206006)(83380400001)(36756003)(8676002)(2616005)(4326008)(82740400003)(6916009)(26005)(70586007)(1076003)(54906003)(186003)(81166007)(478600001)(426003)(8936002)(6666004)(86362001)(336012)(47076005)(41300700001)(5660300002)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 19:32:55.4254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5053bf64-eb79-47d8-e273-08daded32a45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6258

As "io_size" and "uart->io_size" are both u64, so there will be no truncation.
Thus, one can remove the ASSERT() and extra assignment.

In an earlier commit (7c1de0038895),
"ns16550.io_size" was u32 and "io_size" was u64. Thus, the ASSERT() was needed
to check if the values are the same.
However, in a later commit (c9f8e0aee507),
"ns16550.io_size" was changed to u64. Thus, the ASSERT() became redundant.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

 xen/drivers/char/ns16550.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 01a05c9aa8..58d0ccd889 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1747,7 +1747,6 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     struct ns16550 *uart;
     int res;
     u32 reg_shift, reg_width;
-    u64 io_size;
 
     uart = &ns16550_com[0];
 
@@ -1758,14 +1757,10 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
     uart->parity    = UART_PARITY_NONE;
     uart->stop_bits = 1;
 
-    res = dt_device_get_address(dev, 0, &uart->io_base, &io_size);
+    res = dt_device_get_address(dev, 0, &uart->io_base, &uart->io_size);
     if ( res )
         return res;
 
-    uart->io_size = io_size;
-
-    ASSERT(uart->io_size == io_size); /* Detect truncation */
-
     res = dt_property_read_u32(dev, "reg-shift", &reg_shift);
     if ( !res )
         uart->reg_shift = 0;
-- 
2.17.1


