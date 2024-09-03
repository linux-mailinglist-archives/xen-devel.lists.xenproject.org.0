Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54121969E4E
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 14:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789122.1198637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slSxk-0002gp-JG; Tue, 03 Sep 2024 12:48:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789122.1198637; Tue, 03 Sep 2024 12:48:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slSxk-0002eA-FA; Tue, 03 Sep 2024 12:48:48 +0000
Received: by outflank-mailman (input) for mailman id 789122;
 Tue, 03 Sep 2024 12:48:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Szdq=QB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1slSxj-0002e3-4A
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 12:48:47 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:200a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dad7cadf-69f2-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 14:48:46 +0200 (CEST)
Received: from SA1P222CA0150.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::20)
 by SA3PR12MB7807.namprd12.prod.outlook.com (2603:10b6:806:304::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 12:48:41 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::8d) by SA1P222CA0150.outlook.office365.com
 (2603:10b6:806:3c2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Tue, 3 Sep 2024 12:48:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 3 Sep 2024 12:48:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:48:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Sep
 2024 07:48:39 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 3 Sep 2024 07:48:37 -0500
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
X-Inumbo-ID: dad7cadf-69f2-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4wjm2AsZZfTCc2JM6b9cGUIZWG+j4LkNCrp9+aLOt5YH8sPhMezWJcOaf0hXi2ZM+5DvYDnJq2V5NctKtJ/OmPO35037hrGnnQqVf2AUNgRAXt/QRZNRoa1XQ7yNxsMaxWoAWm9fr4IGifrnN8qyShks7Zo7YTxeO60Zv+8VBk2WVTw8hIQP4SDZ1bcz2C638FPbNSzPkM9XzvGiYKdQVSeYkX7chJjrleQyb1w5WvrdWW/PPBOSl4zhbb0DwbtJUDeC41OYsznkXDyfabEVjJSyTSD4kQk5SiGXMageufhZb7abizTUmqz0VuimIMkA50QPi5aZqDYppg02VIvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ncvduq1K5ppHN5PlWWZtZS+dB7piFPlWAGgdwH/vb3c=;
 b=FtCwV3Gh2GX+ox3vzdv6wzI0rjpgFN0wN9jm4TBSDgFUiyHv9wSyL3DVzd0rbmWV645X+Qz8IjdCjeA3/ZuL8UosfVnJt5M3qnkpgOKomm8wR8BGIQdpuzzcptKx+SUZVjPTDPNjlra4cATXJWH7WZPSlFZv26ygjORY4OfUj6SgXIs/zf7bm1gB/KFNI1dJawGnIdHBeTy97VXgENPSBrx7BH7Qt2z0wxRu4qsdr0724O8GEzvkM8jT8ZJ3VOqPDwFO5RzNb0gOojH219MibWzZOxFfyc6m8ytyofu4KUryoufRG6UdyOJqKkbQpWU6TVCHP9VBYNAsrbtWn4OrZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncvduq1K5ppHN5PlWWZtZS+dB7piFPlWAGgdwH/vb3c=;
 b=tgWYxYt7HpZ2vJCMLmVwZvKCafWBj73FNo3HaZnlr7DGOjK9Z/Ou13mOw9IHspquUGTwNi3ImMbx5NFzOkaPoA+zbKKbC4LbQ5GePj32UlMsvuGpp4Wu7qRmkp8W/+M1ByVlkqH0AHAALCzTBDZm8Eq/0cy2BeVWOxNHAvkEIos=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] arm/div64: Drop do_div() macro for GCC version < 4
Date: Tue, 3 Sep 2024 14:48:34 +0200
Message-ID: <20240903124834.2240364-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|SA3PR12MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: ff3bc2f1-cb30-4f3c-0525-08dccc16bca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zYgD2agD2/8GG/jSA3QOmcdlxYYc84K87gZKJ812GUEw+b3/lD/H8EXONIQE?=
 =?us-ascii?Q?qadilSuE45jfkWKSbRd00sFFi8iJeffUiHcEtTI9ZJkkH+2zlaP4UQwSbT0s?=
 =?us-ascii?Q?QND2nYpIGWWQVLLsYuA2+FBagrZDlYR0ngEMNzrkflphlOz+E5oMSR7+ppz8?=
 =?us-ascii?Q?K1l2mfB+Q8t2RoFa82iBPPzVSMH/DaaUu9Ekka3xV/5bb7sPger8XxtZLdvA?=
 =?us-ascii?Q?TkVEgKPvGCmpN5e7TN5gxBMsu8fSnqJ3yrDdUeWFdtTxEju+QsMn+BgMFCLb?=
 =?us-ascii?Q?gPWuqvxy+caueBlcWQjoCTEQEKHj+3/Q0nnVKqkHClQMw2Mr14mPQQTzoma+?=
 =?us-ascii?Q?fsM09Gtt8O5nV2WsZsaFy2mC1ZvPqY8aukhLd+MUh9pldFjERwSCvXGj5PyO?=
 =?us-ascii?Q?2o4iGzibzu5XloL8hce5aPC2skS01Uw9Zl/FpFHUvwveDRMgr6AQbJPKUE0S?=
 =?us-ascii?Q?xaKeD51W+46yYCvVA9TFf/Srd46sc6UZgZZwNOyJD2iVOlb9Qi8g4hmaAf22?=
 =?us-ascii?Q?XjcNV8Vk5oW8OoV6K5cVv5TA29f4jlRdHntWCE/hQEYkki3JFqjXmxVuHYpS?=
 =?us-ascii?Q?v8hDazd2ecd/uS9eu0+4F2VJ/k6SIwYE2oaXhMdDTmKw26n8yaZJtjvP72El?=
 =?us-ascii?Q?zcRiKHOvG13frs6VDiEVn7UBIYaonCePbz59CTtTQSCl7XnMf8Uoo5wDh8fe?=
 =?us-ascii?Q?v6RImi6/0WF7i5zxjVtTOzK8KxJVO87QHBszQBWBSrBvEDm+CYBEnIo3YxKD?=
 =?us-ascii?Q?+Ffuu6SJNiQD5rGDg2Bl3ng57ZdY0hNQ6m3ZYVfEPnUWNZnWgn0VmcKPFbqT?=
 =?us-ascii?Q?YL5wfizrCoWdp3dkEwS50CBm6LbfJE1C64nCpOze9kqgzdOOFCSLMIuy1D1s?=
 =?us-ascii?Q?5gjQ4JbEmrNqSmPEIeZVN+2u/NpPYk3WUOi4kyqEd1n4SKDOAu3MASVLExX6?=
 =?us-ascii?Q?7GomGPb8PGcGoaEwTrZocHldqaCERJce6JoSRzCg+iTXKVhfi/sUU5BPFNLP?=
 =?us-ascii?Q?LB5liEML7rnYHwUF6HuN6cgyyNII4zN+PKSvoPdpy1MaPR1VPxG9UweXU1ia?=
 =?us-ascii?Q?vDUbspwhy/al+z2trh0EOFkGxWX6h+OBpYoZZwiWyQpEWWrC5c2kVhATxbKz?=
 =?us-ascii?Q?qFyZ8XFyLFp4u6xMUoflBToYz8M/Av8cbVi0s7Qg8q2/J/ADA8y1M35Oj4xZ?=
 =?us-ascii?Q?pbczZ82gjpP/nMcQ6vl/KhLRVbU8N8yuPhtnNw9zDbOEEeNDr9b89Kd315QE?=
 =?us-ascii?Q?A9+thTf7pER15T0+xpIsWZRCx6j6X9Pr/3O4epd4Ogp0WjvcoxyHYQnZ/KAX?=
 =?us-ascii?Q?9wXCW+TS/wMxxsFMymafvtrnfTKoeiX2FZvbJqXWBMoMnTxiM23ZA2TSyChR?=
 =?us-ascii?Q?W7mGis2Hb2XqARqyQjrHYdlTPlB5zlS8gFCIcm7ggee3ngTctFiNH5TqfsGy?=
 =?us-ascii?Q?ZZUyG5VhDYo66rnyjRrwBMlHs3YkAlD+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 12:48:40.5002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3bc2f1-cb30-4f3c-0525-08dccc16bca1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7807

As stated in README, the minimum supported GCC version for arm32 is
4.9, therefore drop the custom do_div() macro in favor of using the
optimized version.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
To be merged after:
https://lore.kernel.org/xen-devel/20240902100355.3032079-2-andrew.cooper3@citrix.com
---
 xen/arch/arm/include/asm/div64.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/xen/arch/arm/include/asm/div64.h b/xen/arch/arm/include/asm/div64.h
index da1f1fcbd503..8fe17f0ff27c 100644
--- a/xen/arch/arm/include/asm/div64.h
+++ b/xen/arch/arm/include/asm/div64.h
@@ -54,20 +54,6 @@
 	__rem;							\
 })
 
-#if __GNUC__ < 4
-
-/*
- * gcc versions earlier than 4.0 are simply too problematic for the
- * optimized implementation below. First there is gcc PR 15089 that
- * tend to trig on more complex constructs, spurious .global __udivsi3
- * are inserted even if none of those symbols are referenced in the
- * generated code, and those gcc versions are not able to do constant
- * propagation on long long values anyway.
- */
-#define do_div(n, base) __do_div_asm(n, base)
-
-#elif __GNUC__ >= 4
-
 #include <xen/bug.h>
 
 /*
@@ -217,8 +203,6 @@
 	__r;								\
 })
 
-#endif /* GCC version */
-
 #endif /* BITS_PER_LONG */
 
 #endif
-- 
2.25.1


