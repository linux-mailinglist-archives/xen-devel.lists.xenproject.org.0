Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1513C7E2445
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 14:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627980.978948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzzW9-0001Nm-Jw; Mon, 06 Nov 2023 13:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627980.978948; Mon, 06 Nov 2023 13:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzzW9-0001LO-GZ; Mon, 06 Nov 2023 13:19:49 +0000
Received: by outflank-mailman (input) for mailman id 627980;
 Mon, 06 Nov 2023 13:19:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bfeq=GT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qzzW8-0001LI-Lk
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 13:19:48 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2695abd2-7ca7-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 14:19:45 +0100 (CET)
Received: from CY8PR22CA0008.namprd22.prod.outlook.com (2603:10b6:930:45::18)
 by SJ2PR12MB9006.namprd12.prod.outlook.com (2603:10b6:a03:540::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 6 Nov
 2023 13:19:41 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:45:cafe::40) by CY8PR22CA0008.outlook.office365.com
 (2603:10b6:930:45::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
 Transport; Mon, 6 Nov 2023 13:19:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Mon, 6 Nov 2023 13:19:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 6 Nov
 2023 07:19:40 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 6 Nov
 2023 07:19:40 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32
 via Frontend Transport; Mon, 6 Nov 2023 07:19:38 -0600
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
X-Inumbo-ID: 2695abd2-7ca7-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbGSXwQsiiyJtJ+c0SWjGFiKNFiLHtMhZEhRs34J1j0mmtj3ZvSo5UMHe3Uw2iY8lIuhhcqvdOodofo8RmM/3G8gFXXh/9XQ5cc9NIysItiRLUgpdJo9hAmM3PFNMasaIjne9MH9pXOW6+YaImdtzBW+dAolg6q4+6nORjv3B5NLYWXNIzLEe1Eveh6pHWXFUxKeXQYv7tn9PkGKsrTfbRNa6QSDjXPIO858zdLPNTYHEjy9I7CHtrVtUH2CzOUZS6z91XOqQ1ZpDHrzHiDy3mnRNDp668E0Qh0vQQAFAq/pF1l15/Q0kOLnJovkkmRC0XBiDq+BaMdtE9XkUhs8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/ajYP7sP2N9LYlmXyLJoKZdzh8sqIe132eMUezyJ5c=;
 b=gRUQiZfESvWq2qSMdmT4fv1IaTOMD4CFi0dZCpOGdJmbZ6qK6I40RPuJ+NEOQJ8X5PGcvS3PlVpmq2b/uasIVZQoBwM1XGv/GAZRZIo2l9MQabUR5Pj7rJ3vENJdnnRo1keXPYabbr6Mfft+OVx1GYKldmvm9urhtHSoOpzkO7BRfzVfs0Ma0PZK+DTXaqENRiiBdcRX60LD8xLblgnasOEW7uV9Swa+vBoQFff2+0bBucN/svhokpKIzUbIN6TVUMUTeOs2jRVEwSpZUjhXGZlPUQ2LZibNuf4S+4hwYWxOtCV7+cA2CIvul9nHbGgqRNxCkNO3m5Gi8GSSAR32+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/ajYP7sP2N9LYlmXyLJoKZdzh8sqIe132eMUezyJ5c=;
 b=ZrWsXvCdiUaFOyex60+NKVFD2J6gWrMq1wg3751vEjUeHWicZLV8ROHddRHSckrLRirzQO2qRRmwrNY2CU3pe+Nr//ocuYAjzInZ7vrcPyAhfSb1L2yThQilLSR7EQBEdHgC4bHztmUJwRZpUwIGIDtc+EYTAg7TPjd+khYBeIc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] MAINTAINERS: add xen/drivers/char/imx-lpuart.c to ARM section
Date: Mon, 6 Nov 2023 14:19:22 +0100
Message-ID: <20231106131922.29240-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|SJ2PR12MB9006:EE_
X-MS-Office365-Filtering-Correlation-Id: 495ae9de-0bbf-4ed6-a3e6-08dbdecb08d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w6cGR8/Tr2Jsc3Dm5uJHTejHhcB99zKYWyyuRNXBx/XvileMlvbYExs6f6FGNIhHcnXdktwguVCKQrxA0pwLVFon99f2ORyyjAIPX3zGkmGAut+ZVnsd3vXEvVqXxLPXf8VvINJ/M9z3lBMerk8412+442g7vYm/oeD8CSVE1UV/W/J7kDfuvnMUEYvhaSX6KjCyMavAB3Rtx6XY2PVCZEsXffwqsClfUam9BMqQMFaeaFLNo6Pby1mROUqjLRAwzHjBrslyHYGENWhAxxESKrIpC6NG4L9arEUclphFs94gEfp3J6GXdQTXicVrWhscqhi6LfCcnyNsSjouydmQHGTGrGIUnw3JUomzwq28btWTLVtJOPPTRtdktRO8C7R488vsMjXwEva3hJHUAsWRUjHzYXOwCtVS/C2YSkz/voIlwRlGmP+AFqoNqp2yZKOdvwYZgjr13GkvCD+y3Y5xjS2bKGCww/V8bKfsDgEDA6i99a2VVp3z7O4FNw+AyfpT3ZJ2ayfQ8lmqdKa4IF0r/0BSCXvS4ZV8fdqAM4E/0B0JFWF7Kkh76XVq9yyY0TySv3cRrkiXFJ40MGY16AaMQRvQEbRrkH8/ve6Tsy3jHRUjijaaRnMQoTTVo5d6gHq6URiw9Yd2o9TQBpDIQk03fIDuOxlZGAkv2vXJJ3udb+uBC5Y86S5hPa6sTwdDtqv+eN40LrNjusGs49vrwfQd4LOYcoDWh2otQR6KUxX8XLvnufr3pRq0usqGz3YCDWJg3lsLt5EGI03E1nsxgqVgPA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(6666004)(36860700001)(47076005)(36756003)(86362001)(81166007)(82740400003)(356005)(5660300002)(2906002)(4744005)(478600001)(426003)(336012)(26005)(2616005)(1076003)(8676002)(70206006)(70586007)(6916009)(54906003)(316002)(4326008)(41300700001)(8936002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 13:19:41.0040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 495ae9de-0bbf-4ed6-a3e6-08dbdecb08d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9006

Add it to the list next to other Arm serial drivers, so it does not fall
back to THE REST.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a5a5f2bffb24..0fcf5a6f3671 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -255,6 +255,7 @@ F:	xen/arch/arm/
 F:	xen/drivers/char/arm-uart.c
 F:	xen/drivers/char/cadence-uart.c
 F:	xen/drivers/char/exynos4210-uart.c
+F:	xen/drivers/char/imx-lpuart.c
 F:	xen/drivers/char/meson-uart.c
 F:	xen/drivers/char/mvebu-uart.c
 F:	xen/drivers/char/omap-uart.c
-- 
2.25.1


