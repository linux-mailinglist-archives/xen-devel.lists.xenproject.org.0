Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FB24D21DC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 20:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287458.487484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfnu-0004sZ-SQ; Tue, 08 Mar 2022 19:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287458.487484; Tue, 08 Mar 2022 19:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRfnu-0004ow-N4; Tue, 08 Mar 2022 19:47:30 +0000
Received: by outflank-mailman (input) for mailman id 287458;
 Tue, 08 Mar 2022 19:47:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RGf4=TT=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1nRfnt-0004Om-3w
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 19:47:29 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 954be4e0-9f18-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 20:47:28 +0100 (CET)
Received: from SN1PR12CA0071.namprd12.prod.outlook.com (2603:10b6:802:20::42)
 by SJ0PR02MB7230.namprd02.prod.outlook.com (2603:10b6:a03:29a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 19:47:24 +0000
Received: from SN1NAM02FT0043.eop-nam02.prod.protection.outlook.com
 (2603:10b6:802:20:cafe::57) by SN1PR12CA0071.outlook.office365.com
 (2603:10b6:802:20::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17 via Frontend
 Transport; Tue, 8 Mar 2022 19:47:24 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0043.mail.protection.outlook.com (10.97.5.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5038.14 via Frontend Transport; Tue, 8 Mar 2022 19:47:24 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Mar 2022 11:47:20 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Mar 2022 11:47:15 -0800
Received: from [172.19.2.115] (port=58782 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1nRfnf-000Cws-Pa; Tue, 08 Mar 2022 11:47:15 -0800
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
X-Inumbo-ID: 954be4e0-9f18-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjYCbAC33fZjBExGYzn6KfLfJpuUjoJyfUdNTSq1nd8MnbdRjhQxh7yEc9LcTwkRPJkgfwWp9GBIJ9lB7B997wU6o9mN1CeTYNyGXkHniMlJDgg/TB9iJLfFs24YYb9PFwj7ckP++IMAJ+SLMN757ibS7d9avqwRraum7kGuhC7AtiB7hM3Satqwk3pSxfgiRNJubcVlz4hq8J7CmxhQ6OZBQn2DrtWtSk4kzXiabbJLNRG0E/Oyx3cXNWhE9VgGsGcTzEFEZtGbKTfpuUxHzrZprIbhB+OQaE5lBliZXABQqIfSegDHo4R7/g8qKJOhAqlZUsPATylqA+QW09p8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrNaJDTXo0BfvUNG8uMhFTZZ7d11YwLQSgOOIsuxOC4=;
 b=KoBQsYvemfLaZ06U7SHKhiWQzJtPm4FQTkSpaoVfAkgppwFvpsXx9Y69iFdDeW8yQ99UwniyCAu58AFKaf+tPAg+85tWrQRW9CBnh9lbY8ifda6GPDHoqiyHR23sCMEhWlBo1Wy7rOBvT8338WRPCRkg6836NG1k8sXZ1mj9A38T9l9I2QCT+sjfn+go9imc7nNPzAqQRdH8y7SEerCnNpgNA//46STvAGCgA+aV3NTbzWB2TXDUzXJJDP4LfrpqNyty/0d543RoCZwJ3xXzSkEcGR7UoCL5It2n94uc03h1YxA93gwsgPH7WA8pg3HxN01SKQi4fI0+xyhPbu/C2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrNaJDTXo0BfvUNG8uMhFTZZ7d11YwLQSgOOIsuxOC4=;
 b=G65kcUVgrti9rwVDnyMxwV+arSsqCEqzgc8+6pslZJF6ySc+6CC3+8tUSubxqivQxwrtICdgA3NKUGM1Py5o3E/rMAK3DcKXHt+hpjp2jscHu22gwzs2EUPTQUIJV5hjOu+vk8au/84j59BEsInoCyqeg4ftvWzFuiHZ61XK1xw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][RFC PATCH v3 02/14] xen/arm: Add CONFIG_OVERLAY_DTB
Date: Tue, 8 Mar 2022 11:46:52 -0800
Message-ID: <20220308194704.14061-3-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308194704.14061-1-fnu.vikram@xilinx.com>
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b671b5af-4179-454e-6f7b-08da013c77b0
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7230:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB7230BA38C6DECDA98A703155BC099@SJ0PR02MB7230.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kJ1XdXTdgbeddIecBIqAGYkuswc+k8EmaGuWqk+kG2FSjAkUp3GaMb0w8tpFH4zGg1nhTO4M1tDQHhChvZiQwo8EH8hv2IxgQJJ3EDZYPruRc3IwVUyyZyzag8s1cIrHoygu+J0vv9VQqiuYrpka1BWfNboyPfxmecsoP7brC54lBeH7HtCho6amgsrIG5SaYtIUEeIa5lfCzzzaGpH1Xgzn3Wgg8Pf7Cu/lVGKJ8s7bNvKFSt56ISMckDCrH7oO1GBWTSfLmsO/oQFi9KgArAkBWMq6rmYpCPDXzkG+wCqznFFH8ZgfGbLPNUSZyEQw+rlKT8/XpIv9E8jTqVQ4tap+bKw1D5C8d64uw1793UFoOihWyB2DNwdsSOuUcybim686+JoGEpPcbPg9oRhJ2X+gMWTn5daXjSSk20XNfs6x/A2nK0UXPwWuyr/45UNsOd+BdwfXlaMxlKcyaZ9nuveW7OL7lkCrXB3xxm9iesDxXKDJ29n4E6Rg4pJO4tUVai9BUHUwrGlAgSKjzqNIIBep3WN6O1h0PozDNMR0MHy8jYG28qefBAewJrBilcqG17s4sLfzycn19nBYx9TPIJRTfrdiEp9EBWC70S96BGF/VnNpKpLWsCYYsxu5ynZx7QP21J8uTu2TSj8+U35yK9vCqJU6CuQlB4jtcKunTEw7lX5PoLwXfcDijrgNDzasggZ3v/GmVwyg37E+w+zF9Q==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(26005)(8676002)(1076003)(70206006)(356005)(70586007)(82310400004)(336012)(426003)(186003)(47076005)(8936002)(9786002)(40460700003)(36860700001)(5660300002)(7636003)(4326008)(4744005)(2906002)(54906003)(6916009)(508600001)(316002)(7696005)(6666004)(36756003)(2616005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 19:47:24.3126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b671b5af-4179-454e-6f7b-08da013c77b0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0043.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7230

Introduce a config option where the user can enable support for adding/removing
device tree nodes using a device tree binary overlay.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/arch/arm/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..0159fbe27a 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -46,6 +46,12 @@ config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
         depends on GICV3 && !NEW_VGIC
 
+config OVERLAY_DTB
+    bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
+    ---help---
+
+    Dynamic addition/removal of Xen device tree nodes using a dtbo.
+
 config HVM
         def_bool y
 
-- 
2.17.1


