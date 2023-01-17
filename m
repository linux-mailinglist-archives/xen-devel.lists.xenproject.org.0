Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4017866E51F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 18:45:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479661.743646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1G-0000sq-Mf; Tue, 17 Jan 2023 17:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479661.743646; Tue, 17 Jan 2023 17:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1G-0000rF-Ja; Tue, 17 Jan 2023 17:45:10 +0000
Received: by outflank-mailman (input) for mailman id 479661;
 Tue, 17 Jan 2023 17:45:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8eG=5O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pHq1F-0000r0-KL
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 17:45:09 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2075.outbound.protection.outlook.com [40.107.100.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae7e8220-968e-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 18:45:08 +0100 (CET)
Received: from DM6PR08CA0042.namprd08.prod.outlook.com (2603:10b6:5:1e0::16)
 by DM6PR12MB4548.namprd12.prod.outlook.com (2603:10b6:5:2a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 17:45:05 +0000
Received: from DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::2e) by DM6PR08CA0042.outlook.office365.com
 (2603:10b6:5:1e0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 17:45:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT110.mail.protection.outlook.com (10.13.173.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 17:45:04 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:04 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 09:45:03 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 11:45:02 -0600
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
X-Inumbo-ID: ae7e8220-968e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNV7lckrRBEYlR5aLFTr4/LImzdTeNz4EfdEtnQsqPkfApJdvY2ZJw798B2HUt4fR0NlHI3Lhax+EfPTRpnOZLRpyNaUxQ3FfaEOSXm/NpYugV45/hFXcl4OJrl3ex1omtko75/6MczffwyJpHGS29eYX/yHT33C6ECnHczTCJNiAfLKOcKutBeNL0X99LHZFYK8gDXCD9X+BC8sUge1UTIR9x5DgJvZXPPywu08PDg3+QSVtwMdKpE4Bl5OYFlksnVFWVXe9EqUlI2CesKPNS8sbdaQ/+l8Z7jLMWpmpcEu6TcWzMCprwJ+qOu52aVacGLas52uazfdXa2F5jFVFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PB+0PNaaVLEQ5pWTn1e1aJdTj00MY9jH79kRwiJAuFg=;
 b=Dv6PvvEPGzxz+8RnbGax5C0Gxr8LFxzMh+x/uLqWy9Ue2VsZG4ftXaCkSW3Uz/li7flZhSPMXAGZnXxGI3wtKM/B4f0xaUNL8xOcsnSmJn/Uie9/GWeihIFt8shpnpe+PwW72AClWN4H34KTEuACePrgjk5mB1ewXzTKNDzUVkj/nAXJcRAfM0smM6HcTTSEcgg59P7YYh/yQDNtzCiVSK4US7kjVz/s3cmW8zVh7bvvCwL9Zjlk9SJ21p6kEulzs/Oy+tGAHcC3WcRYs0u6exFxQ2GzYsNoCf8QXdVrtNJWJlLY6toRO1Jr3UpSSJ4p0xDBEF97Qb6hMH7aKkvKfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PB+0PNaaVLEQ5pWTn1e1aJdTj00MY9jH79kRwiJAuFg=;
 b=DpmElJENMpCGMdyaVYQU52VW/Fu5IPSN0NNAgCbNZydsLQ6gceuFwtdTMIHiq8SPVybv7TMUdj3KYk1a4qlgM5vQP7SEA4H0i/KVx6v506OWNMd+HXekODzsweRsneQXKP/F7ltJnLDgl2l+HyFw2CwM2KmsF0wB7V2W2QBsMrU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v2 01/11] xen/ns16550: Remove unneeded truncation check in the DT init code
Date: Tue, 17 Jan 2023 17:43:48 +0000
Message-ID: <20230117174358.15344-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT110:EE_|DM6PR12MB4548:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8f7b73-a161-45c4-ea0d-08daf8b2911b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F7hWv/vho/RRk/vtgb5mfAOPpDbXN3M+/UnYIJ6AZgnhJx0cT1Bm4gIzHZRmqxPztiDUtbCf48PauaK0I6GpTb4TrJE8pdm8GovL0EPHCKLiwT9KzDRwjawIgmHinAwzSfRMOg5ZVO2ifIq0RVNJ9RQR27cRq8/yBig2Ujugd73b8VTmNmverjAiR4/0pbnflKy7ZnzXXSzQd+TOkrCPERbds5yRaonEj6SZS+wa6IpcMpVdxbzbeef4qibwk3b92rWxsBnAarUC37q/mq+YeRC+++HnWQYYjemJNP+LNDFgYRZkESluCB9fc4csA4WKBftts0sNYytF7TeUQ5uKjP8+EKODhGQl6f5f07SzOKyclBVMm0tpZfktStDE62rftHda68deQ7J8lriinLfP9NRnWU3I3x25ust/ungmUUj3sYjZHC1XsPiQv4HPVNXzkSKV2AteaDPcrVhmv9Yx1MDzzMEPAOWKGg8AORno6nzU13/LzS1fJnPPFh0WQ8lIRyK6zVDGwIYFmlkAxEAYO9lUfOPaC5Aa6bxBnJoXXkT0HE5h3QsP/dwVK5dwWi71letTmLjcLfTFEIm+I5RmC9A1z7SF3uwZ4irmZaHxx36b7lZLoDaFe0XPeWbT2AFPDaq6pfArfXVUemgXzCujql68bjCN5E1u/990dZgrYMt+k5UC2KRL0EabLflkhdNi7E+equbJBoj2D7IFIWWAhh5CeyQUVwZ7hwLbcm2s0f0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(6666004)(6916009)(70206006)(336012)(478600001)(186003)(83380400001)(26005)(4326008)(8936002)(47076005)(41300700001)(5660300002)(2906002)(36860700001)(426003)(8676002)(36756003)(82740400003)(70586007)(82310400005)(356005)(40480700001)(103116003)(81166007)(316002)(1076003)(86362001)(2616005)(54906003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:45:04.7958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8f7b73-a161-45c4-ea0d-08daf8b2911b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4548

In an earlier commit (7c1de0038895), "ns16550.io_size" was u32 and
"io_size" was u64. Thus, the ASSERT() was needed to check if the values
are the same.
However, in a later commit (c9f8e0aee507), "ns16550.io_size" was changed
to u64. Thus, the ASSERT() became redundant.

So, now as "io_size" and "uart->io_size" are both u64, there will be no
truncation. Thus, one can remove the ASSERT() and extra assignment.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Changes from :

v1 - 1. Updated commit message/title.
2. Added Rb.

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


