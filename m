Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AEE719606
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 10:51:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542336.846070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4e0t-0000bJ-Cq; Thu, 01 Jun 2023 08:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542336.846070; Thu, 01 Jun 2023 08:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4e0t-0000Xy-9V; Thu, 01 Jun 2023 08:50:31 +0000
Received: by outflank-mailman (input) for mailman id 542336;
 Thu, 01 Jun 2023 08:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ef9=BV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q4e0r-0000Xs-Sq
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 08:50:30 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59ee93f8-0059-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 10:50:26 +0200 (CEST)
Received: from BN9PR03CA0934.namprd03.prod.outlook.com (2603:10b6:408:108::9)
 by PH0PR12MB5401.namprd12.prod.outlook.com (2603:10b6:510:d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 08:50:22 +0000
Received: from BN8NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::41) by BN9PR03CA0934.outlook.office365.com
 (2603:10b6:408:108::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Thu, 1 Jun 2023 08:50:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT088.mail.protection.outlook.com (10.13.177.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Thu, 1 Jun 2023 08:50:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 03:50:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 03:50:21 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 1 Jun 2023 03:50:20 -0500
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
X-Inumbo-ID: 59ee93f8-0059-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1442Zn3ZvZ2m9U42BOmxBV8GGdblfDLYgzX/SxjJTaxp1V3w/oLY60AEcLgPGnJBPeTfNJBJ7iTdUQnr2nWdPy4up5EpV10kEscYWmUYusPPD4xloySmSdUgKOI3v/wyKA6qzBOwc3BBULrTkHszhDpyG3sdqJjpv+eMNtPVD/XzuBn9YBR+zDn1AUT8tctxXsa+j1aJWCvRG7SD9f6d76PeiLC71JjYtgboaa/TF35su2LZqiwLcdoMP2rljBdseNm1n94QYSCcAqx9u7TYsT1XLUDQTHby0SNHSoc09IcesaJObiQBxf7/Eg+9BYeM11bQV8JXVFn4bc/eTalBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhhMDOjNPYL3+25tr9e14rvxZNeuEj3VcU9WF55+zWM=;
 b=c01EXnI4zewHLEaskLoWb2WWujbK5eQ9U1Ap6pIewUlYdIRQHv8Am6Xf0PxVra6K7JQfGuMY0CtUBBzyc0NGOp6H9KCIJtpHgMWZIISgAjGMBTbPHwdmfIPdYaoYJoIv/5ITDY1GLvCJhyGZtO5iJZvbArcBwri9eY8+uNhWwUJeFbcL4BtCuOp75Zq2MPleqGpBrtoaZLlz+fvA65dIxJ7TehLoVhEC5V98VzcnvBBMLNiZ3Pn25QvNaQzkTJM244EfREIMwcZuxXO3sWOy4Hfadg9YytENZ1JfoCgxxY3YC1lio0nFjGkVlEcgMEbhnfFORsiouiJFkz6Me7kJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhhMDOjNPYL3+25tr9e14rvxZNeuEj3VcU9WF55+zWM=;
 b=th7H3NyEbN8KoafaIt1kA1woPkD2BNh43tmaXPygjqcQGFAsrhFf5upiDHM6PjMflx2y66zANx4eBUs4sH9BrCnNTSsGxDhvyJ9FD+UDZ92TgmljOmRrhp0DXSHWvEdCErBRLmHq8WPH6GqxAlllmcaaOhQmXp2DCRsmHRRVOQ0=
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
Subject: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader compatibility
Date: Thu, 1 Jun 2023 10:50:01 +0200
Message-ID: <20230601085001.1782-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT088:EE_|PH0PR12MB5401:EE_
X-MS-Office365-Filtering-Correlation-Id: 0242eac6-b127-4595-7079-08db627d3c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hGUabM30yQNiM9GrEJNtSRbOjVrMbG/W1m4CWoXiMbICCmeuK1YRJ3exaM9UW4hEuAM7fDmZRl+ucDhfBMCuP2YIcsdaAnLMIj6V6gkSroNp0N7i+adQSb8Sffjt3epJD1Q3qsTIDB5Zwpnyife9mAAmoL4Ma8ACKmOPG65wQM9riq6YQmNlxRbY/nsXjAsp0o6IQ0U54LYdZWJ9csj0eLOABrjQtX0z1QvDry4afVF+z0k8/7dU/QtL7TG6aHDtbIQbd/rIj0oSXdAhneKhCOcNjWauRcH6HKc4YdZfxP6BVK0OcrbYT7Lj+WPqm8J2CKD5Bu2krqTAlsUJMv2+yx1HovkanhOwDqjJ3ao4EbllX8Ykfdk28tcHfli1ux49GFU2FRkDllsVhYiTXHiSTTu0EB4xNj2knkTmgUjCFVLWk5Rz++fTcYiMWM1wk+IYGbm/Qnc+CoiKYg1DFGRtj0KI58Rz4rUZvGUBLWGTyCsSPrf22ex74hJzphw7GIHlENw+IO9npjEXTTnxNz38XJXhL9hYrLdWyeW1HjYAEhwggoIBViwJU+ulF6AzduB0TVrMO0eLwRRpyHovr6rR0dUdX0RgPA19t6wRdI/1QRt/vMUnvq2bgqSlzzKhVuUdhAWWTncY4S+QktrWT9Nkqiyj/2UBxAIrgYoRwXeb3MBHWNRdlGpaunA0bhfzwtObqm9Z48Aqh+pOHqYG0wQlsAyMbxhOX9IQP0zGVv7Rpo66zmHzm8XVwFbfOtwkK8vqy1aKVbYICy/rMqMhLNZNRg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(83380400001)(26005)(1076003)(336012)(426003)(41300700001)(6666004)(47076005)(186003)(36860700001)(2616005)(478600001)(40460700003)(54906003)(81166007)(4326008)(6916009)(356005)(70586007)(70206006)(40480700001)(82740400003)(316002)(82310400005)(5660300002)(8676002)(8936002)(44832011)(2906002)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 08:50:22.0536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0242eac6-b127-4595-7079-08db627d3c0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5401

There are implementations of the PL011 that can only handle 32-bit
accesses (i.e. no 16-bit or 8-bit), usually advertised by 'reg-io-width'
dt property set to 4. On such UARTs, the current early printk code for
arm64 does not work. To fix this issue, make all the accesses to be 32-bit
by using ldr, str without a size field. This makes it possible to use
early printk on such platforms, while all the other implementations should
generally cope with 32-bit accesses. In case they do not, they would
already fail as we explicitly use writel/readl in the runtime driver to
maintain broader compatibility and to be SBSAv2 compliant. Therefore, this
change makes the runtime/early handling consistent (also it matches the
arm32 debug-pl011 code).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm64/debug-pl011.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
index 6d60e78c8ba3..80eb8fdc1ec7 100644
--- a/xen/arch/arm/arm64/debug-pl011.inc
+++ b/xen/arch/arm/arm64/debug-pl011.inc
@@ -25,9 +25,9 @@
  */
 .macro early_uart_init xb, c
         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
-        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
+        str   w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
-        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
+        str   w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
         mov   x\c, #WLEN_8           /* 8n1 */
         str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
         ldr   x\c, =(RXE | TXE | UARTEN)
@@ -41,7 +41,7 @@
  */
 .macro early_uart_ready xb, c
 1:
-        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
+        ldr   w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
         tst   w\c, #BUSY             /* Check BUSY bit */
         b.ne  1b                     /* Wait for the UART to be ready */
 .endm
@@ -52,7 +52,7 @@
  * wt: register which contains the character to transmit
  */
 .macro early_uart_transmit xb, wt
-        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
+        str   \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
 .endm
 
 /*
-- 
2.25.1


