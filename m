Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32563F626
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 18:32:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451084.708685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0nPM-0001F8-7b; Thu, 01 Dec 2022 17:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451084.708685; Thu, 01 Dec 2022 17:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0nPM-0001CT-4q; Thu, 01 Dec 2022 17:31:36 +0000
Received: by outflank-mailman (input) for mailman id 451084;
 Thu, 01 Dec 2022 17:31:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ywn3=37=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p0nPK-0001CN-Id
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 17:31:34 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdfc80e3-719d-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 18:31:32 +0100 (CET)
Received: from DM6PR07CA0126.namprd07.prod.outlook.com (2603:10b6:5:330::9) by
 BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Thu, 1 Dec 2022 17:31:27 +0000
Received: from DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::53) by DM6PR07CA0126.outlook.office365.com
 (2603:10b6:5:330::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Thu, 1 Dec 2022 17:31:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT094.mail.protection.outlook.com (10.13.172.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Thu, 1 Dec 2022 17:31:26 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 11:31:25 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 09:31:25 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 1 Dec 2022 11:31:24 -0600
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
X-Inumbo-ID: fdfc80e3-719d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KH3kZRyJ2G/aPnPYwVqv3EIygaJCQEwAwcFCxhJW+SUEQS3tXKZW8kqa5zXuab3B8nkBmr2QQGJaHYZ+0pJMWmMbAra7DrBigSDYczIN+oL5xSsT8w89PLEYSZ53JuOsHxmfJW23CAPDIuMUI3A6HnzeaZLgeFB+D6c3sMlplyEMxzKjnuviqAa78uyR4hUEXSA86NnPAG47oWnsAtSCGIPnebUH8vRn/4IwmYMk/EsOvKwEWKXL24F/LdOJiVTheY/DnwiwWvyqzLGGrBFgACfjm48iVpj0E6Zc3t7+GfH2NVcREzLkJsYk6THXAXIiwff7yxIbSP/0XysxVXwphA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3iyd5LwACZyzI3z2WmmW03akA0ULGJVFo8bGEQwiv4=;
 b=jsnzphEVkxrNfu+Qd5owUt6l0CnPB8ouQpTcSx2CL21IHiZMT7j6z9q1ufTjDcV7hpk8Oc7LbbJwpoT7LBtCEEnX11Df3T8OMAR/Wpom0ucBUenHskOeGeWS+RMj5F75SdBANWoU5Ir71iEs82jTEmLZbUsRPmE4zRFhdqVriv/GqI2kBu7phoQNIKaEifTMN1iVQWVUxYZFxqoA8NGpyZhuXyG0tjMrpytFY6iJDuxyyAItzmA8mcRP8wybt/d4tdw8oSGLAbboEf1GRY9hLAssaHIoSYsLJEC1Tjade1j8o4b4bDtWuhCE5MBDFqhbnfs10wMs9iBRy5Gp1HBwuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3iyd5LwACZyzI3z2WmmW03akA0ULGJVFo8bGEQwiv4=;
 b=1lmlGZJgsqbmhLGMMnGvYeAWr0hM+83ldKt0+B3MFNHTR3QELbjhCAaIqS/hyGlbPG4a0pzFvuZEGbZqd5ANmeq5ZtOEUP4Yein/kZDNyeLhgUJ4vlAVWFeUuUPTSQqXeY0AkE/I4dL9EFt9D6y8BjfwukiVqBNCQUusgjJPBlw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v1] xen/Arm: Remove the extra assignment
Date: Thu, 1 Dec 2022 17:31:21 +0000
Message-ID: <20221201173121.33865-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT094:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: f5e5908f-e6b4-4d65-5947-08dad3c1e002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UJwlVBw9uTTXHLSl/4OAcTSTFtE52vKSuo41eq/dAMsbPXTserYKbgNLFt8ref/ScXSaJ0ywvfquZJ4rBXYx6fovC1qz2I0CiCMnt0wLCjKc7zahbSGvErEwvUn5oBOwRZhxzk+JofPy9i+UPyFo2icFVBpNmT9UgG5YGjCWDNYrTxvp72MbcqG360Mpuz9d6Hl04CMQJvbOFcHi3ElT1gTjz7RMOteu/XPqWi853vk0X+BeLlc3zn2c/gY7TX8kzQiYiiH1SXjnXTuxdQDt8T5rLU/quQ/qh2ADtHsGEpROB7C2N5vo5FiClO4atu1nCTkWzmlTMCrsdLy7YUk+7etqHPbWv/BWfWL0G5NXPolss1OTGNaGfmMPaFucbERyOx3LoApAmU46MV1QJ/BbMiwkKcc7iK1lExRN7i2zNstkLMgscWVv/iUgjIJtWcPLvlJ6wK37wsS48Y/Kcg2itXHK/vs+yvXVXt2XcVM7OKMqKubW2cIJPTv51Mf9B3YmOcFFnrVrJsF/Ib+Ev6LZJ2gXJ/52FWomru1ur9C3aSz9P5XHPf6+GbboZYxuPySYSIaRBY1G+7GgoaGT4FEfC/TNI+vgulEcATWE7l33h+p9DdWAtvr7otYD928DdWqsFOaAH+1nIQPUBQWHWbWO6OQve060qtXArMjJpofbkwi2r3veaKAApU9edSalaKDncL0cnEyrF3tr6oUX3On0neyaS0SUVisXCsv+bdl1PHI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(81166007)(356005)(82740400003)(5660300002)(40480700001)(36860700001)(41300700001)(8936002)(82310400005)(83380400001)(103116003)(2906002)(86362001)(6916009)(316002)(36756003)(1076003)(8676002)(70586007)(2616005)(54906003)(4326008)(70206006)(47076005)(336012)(26005)(426003)(186003)(478600001)(40460700003)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 17:31:26.5964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e5908f-e6b4-4d65-5947-08dad3c1e002
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476

As "io_size" and "uart->io_size" are both u64, so there will be no truncation.
Thus, one can remove the ASSERT() and extra assignment.

In an earlier commit (7c1de0038895cbc75ebd0caffc5b0f3f03c5ad51),
"ns16550.io_size" was u32 and "io_size" was u64. Thus, the ASSERT() was needed
to check if the values are the same.
However, in a later commit (c9f8e0aee507bec25104ca5535fde38efae6c6bc),
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


