Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F389827C
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 09:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700713.1094290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHt8-0006tD-1d; Thu, 04 Apr 2024 07:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700713.1094290; Thu, 04 Apr 2024 07:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHt7-0006mp-R5; Thu, 04 Apr 2024 07:51:57 +0000
Received: by outflank-mailman (input) for mailman id 700713;
 Thu, 04 Apr 2024 07:51:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OVy+=LJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rsHt5-0006V3-Rg
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 07:51:55 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 340221b9-f258-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 09:51:54 +0200 (CEST)
Received: from MW4PR04CA0189.namprd04.prod.outlook.com (2603:10b6:303:86::14)
 by DS7PR12MB8251.namprd12.prod.outlook.com (2603:10b6:8:e3::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Thu, 4 Apr 2024 07:51:52 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:303:86:cafe::88) by MW4PR04CA0189.outlook.office365.com
 (2603:10b6:303:86::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Thu, 4 Apr 2024 07:51:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 07:51:51 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 02:51:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 00:51:49 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Thu, 4 Apr 2024 02:51:48 -0500
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
X-Inumbo-ID: 340221b9-f258-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sy0zGEhtFM/AH7FWPAAloKSrf+Tx8LSgfK+3g8LNLo9cLuvFSmjji60JLqjKOVbnadE1PZX4qDTHqsMn1IGs0g1tu2nmcpfhMnP24Xlj6xQBBosBSsfXojMSeC0s6Hx7u2iah3nBAjuvMfyMUeCFO4D1L5sDm8BAz8TYLSbg8FEFwPs5f8kHPtLQBQgPKIE27MOax1/ZQ1TGdLotlJZhgX6zuqgKCXXt3XyWS1hu1R6coiCH141UqXY0vtWt9D7JrLyKFu8IJsSw0YtNTnqYepZuHIxYjvS8iN2H7H/ZooRS2LPdi/mO64TPGs5jlspQywPsSGajjNoNEgUp94mKBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkHCkM+Kw7MqR749th2KyIyoSZrmeqh5RM1QSsKlVXU=;
 b=YWo94Mtd8vBw3bTNkDwWHuLsUc3DaxtpzSCY2q5V1tRTd8qWCINeqFJqj+z8UfdktJ8l8kwx7k2bDnYiGF4hr0qNS23+d9aAwsqPgzDObfmsqceEqcQUXKk9NCqO0RFWG2GbZfdyVSXlWDJHVxjR9apxRDVKH3Dg9CDm9Wd2uRmoTgmn6qrx/bJwvJxN3G6AMPBZPQZjwYxSXyO87ii2LbjGA86o3j+MiWjdAy6cYopfpFcOOpLdZPs/z03lk3JmBj+oBbrR3TEdjlRh2P3hlfzbJ9Tq2mwH7LwDNNEPkl8PP1ezgk+EL3cQujAZ2IgJwf1SpT9ZgJFjKaOJLbW1fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkHCkM+Kw7MqR749th2KyIyoSZrmeqh5RM1QSsKlVXU=;
 b=QQdHkUqMYse7PneSMKqLyLAIJ8ovF4pYLF0I2tFgi+CKb1OWOLHnyy1j0rIoglmv18G1NXTyl/0FwpXg7oI9CmVYYUAv+gB0ZVDQO13vaEI1nEBpBM53B79x6GKZ5BKoN6xIQPAXHWuhnn3QT+Df1VP9LfE/YMwzD+99KGiMQFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] char: lpuart: Drop useless variables from UART structure
Date: Thu, 4 Apr 2024 09:51:43 +0200
Message-ID: <20240404075143.25304-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240404075143.25304-1-michal.orzel@amd.com>
References: <20240404075143.25304-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|DS7PR12MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b337963-06f1-47b2-8a10-08dc547c170d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lS5Fq7pW6DC4szhNW+r1GUIEDDUxbA5H8udv34ivPb+zCvR3ByNt1VWTtsUOONZFLvnzMxRVV3IcBky23QTSme7iu8FHH+8mTeUyoNQQ1kq/vIJtuRGWcGvfjy3DzInTN4iaGFWT6Y6BApeXvypr4kTgZb7wLkEI9js2vtXsou7ImOTv/wGyK4VkkfBJCL2kx4aJMw3T9DRD6rM4Mnp4KOgn747KakHeTg7gY2pfAOE3X0x/+dvxeIKh+j9NTqfbBS5Xgh9rx9kctgvSCAeSgPnLNUIuz3U8qVb2yjdzQF5hJ0WUE59n7o4f4tG1ZOTxo/TNH/hNfbvoNFtDFS7UafhPpgRL/7X0STnE8AQ7wwdLYMv4rv8e+mKm19fPkBIYqn9enVKL7hTBKOBpA8Cn0dRQLd7gMWXK/Vh9m7UnMvfeZV2df0uNfAV3U2L3fQGxdbQL6VLR3Jvla1BzclKg47cJIBSKsJakSpzFAvR/48haib/XKa2ZDfiIIWhEI/OTtX9gVgPc8x68xAxPg+zj29JPEalZLQI6ZE8ynPiv3PE2kxVAVLDCSHxYlDB8d5CaEauEX2BV75PY8qN64pDoKCpQUiNoSXmHY/SUy4fZhsEqOJtAyl+0wumSHa6bhkrnvZtcnLzbgV0tVCZcXfHMeUfmpamjVcsJSBCGpqRuVtftkjdf4c7VsRhYJn+6PNPPqvwiK6kIIh5Ey9IG5RgkNze3B5ZuNKGaKqIAD0OVhjcx3PYr156fMmiTMCJav2rz
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 07:51:51.5615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b337963-06f1-47b2-8a10-08dc547c170d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8251

These variables are useless. They are being assigned a value which is
never used since UART is expected to be pre-configured.

No functional change.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/char/imx-lpuart.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.c
index faf4693b66e1..7770d158bf59 100644
--- a/xen/drivers/char/imx-lpuart.c
+++ b/xen/drivers/char/imx-lpuart.c
@@ -30,7 +30,6 @@
 #define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + (off))
 
 static struct imx_lpuart {
-    uint32_t baud, clock_hz, data_bits, parity, stop_bits, fifo_size;
     uint32_t irq;
     char __iomem *regs;
     struct irqaction irqaction;
@@ -197,11 +196,6 @@ static int __init imx_lpuart_init(struct dt_device_node *dev,
 
     uart = &imx8_com;
 
-    uart->baud = 115200;
-    uart->data_bits = 8;
-    uart->parity = 0;
-    uart->stop_bits = 1;
-
     res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
-- 
2.25.1


