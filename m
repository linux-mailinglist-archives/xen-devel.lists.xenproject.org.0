Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E587593113E
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 11:33:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758796.1168277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTI4x-0005t1-Uy; Mon, 15 Jul 2024 09:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758796.1168277; Mon, 15 Jul 2024 09:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTI4x-0005rM-RX; Mon, 15 Jul 2024 09:33:07 +0000
Received: by outflank-mailman (input) for mailman id 758796;
 Mon, 15 Jul 2024 09:33:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOo3=OP=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sTI4v-0005rC-R9
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 09:33:05 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bad50f1-428d-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 11:33:04 +0200 (CEST)
Received: from SJ0PR05CA0164.namprd05.prod.outlook.com (2603:10b6:a03:339::19)
 by SA3PR12MB7781.namprd12.prod.outlook.com (2603:10b6:806:31a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 09:32:58 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::60) by SJ0PR05CA0164.outlook.office365.com
 (2603:10b6:a03:339::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.13 via Frontend
 Transport; Mon, 15 Jul 2024 09:32:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Mon, 15 Jul 2024 09:32:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 04:32:56 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 15 Jul 2024 04:32:55 -0500
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
X-Inumbo-ID: 3bad50f1-428d-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frGoA5ydZ3gMXjd2kwfWjckXS/hgzGwMmHmrPSpwqnodqqa3qWaYbdamXL0+VvF7qHrVXpy9UrY9HmxoclF2OwL1FLq7zaxW6FkUgGWYmGgO2y+aKD8e4aGeTxjSL4Nl/SEjaGKlhdnuZ7D2IsQwR5Rcu+mfnTeJ9odENRueDQvyvp8O9JZjbEIrWMacuPTrm861c/EMh80qE8DQMPdUGrmxiFJVPH1HFXzgDrK/GuHTp3uQnBCDHr8Y3+H/G0tNgc744haYgRn5CujioauJf98HKER7NeEZmfXBcC1oFaSUBLga21BGy78nsLsbAY3iR4Mdo2QLv++vIgAM/8UMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NF8uzQMK3g8s8jElmJY9OAV99dioPt5RsKEOYrJQ/j8=;
 b=VcQkzNRX4eyM7tQrziWYX1rQQJk2RGifcvVycRSDbOaWSadTjz2F3FA42f/FEzHznp3ZRIafY8w8Y4nn7a84uJg1ah++ANU6vRrACn3IWWFot7GkSkfxqkkACxxjyMDz9Ma1mtMD0NbM1ReNy0BrCh6syyuZ06emwVjL2hWr3sGnbYfDIQq/In9MGPCvHyfTBd5rm0yVz7q9DoBf6pRoExY2vVLeB97hBEaHaJJqwNNFUgr1N3xq5oGKofKx9+3yyneuXfwlySxGqxQnZRrehqyQpVNYvMwexILz+8nCvrtMoLvNGHMzle7ZkTnTcESxhcv1CmGeKZNKX8IDk+eEZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NF8uzQMK3g8s8jElmJY9OAV99dioPt5RsKEOYrJQ/j8=;
 b=qY/t9AgdXDKv4U4exSRZvThi3YuMS/9ZSyerRfiTVSE6G0xgs5zDh/rLMGzktiachg9u31gbr6lL7a1TVUI98XiyV0Rz3w/Z2pX0J2+/TFSJ5AlRJ2gz20jJUoNsVI/Jyv8OlZPcMEWs/69PZdIjuPDF+jpHgEFPGPdO1hCg/Hw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.20] MAINTAINERS: Add me and Bertrand as device tree maintainers
Date: Mon, 15 Jul 2024 11:32:51 +0200
Message-ID: <20240715093251.35371-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|SA3PR12MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: f40965b4-93ad-49ca-42a0-08dca4b11cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9B4pdoTLd8K8Esf142DDdEWgg/jMpz3XH8VL84oUgtMU/I1B1EPCw40jieuX?=
 =?us-ascii?Q?iU49CxW9iwpJYBYygCYZsxjfdo49/xC4e/wMcjstaTFxC/HN65lfoLa+B+hg?=
 =?us-ascii?Q?RgYtmZqJ1Uk6+1VDqsTTnp+jcHO4AsDzKF5ppv0/xL1urr7Q8CE4CeskPWM6?=
 =?us-ascii?Q?2ip+Y45Jo/IIA7tzTcGMozJQ6DGn0bSAve438Eqrs+dQgtreWUs2FbrS4Ne4?=
 =?us-ascii?Q?IFWdjXGgDSpK5i0KG4TX/J4U1jEyRl96MSWDym7FQbtEZR5LCWKcOt/4+iR8?=
 =?us-ascii?Q?oYOP6hfYxNsGK7+unJADBi2UCHq1kKWtOIO0lwDbj0DtrdEEJgWpMqSQoyXo?=
 =?us-ascii?Q?GNT7CoSDBMig9HHY/TsnHgi9RtXTOzOySWnQCQn7BYbl2v1K5hpFe3QPPq4H?=
 =?us-ascii?Q?ixUOqmYVBOGWggatTgdR6f96KB1HrVq1okekOjaBvmbjrzXkUvWTRG6++MuE?=
 =?us-ascii?Q?zRk2dFCcIBR39XbWubjMnlmaxhFz8/uibBVHaVVXkCgEEPDj4w+1IJpltaMw?=
 =?us-ascii?Q?MO7wEJTcD/L6T8ferjmSXNKngYMGP1b0XzzxeMu72aaxdAQSBkkfGF/DurtL?=
 =?us-ascii?Q?+PLITtDFn0tA+bEKYaT2AGGE9WobA75OUO67+gM/PwmYMyMhXeoYhkHoB4KQ?=
 =?us-ascii?Q?BWwnoMY9gPNIohOJ+KTAwf/NVbN7JXjgESHjxLzPSMZIT0pLpQyap32U3yz2?=
 =?us-ascii?Q?wUN77Ln/o0v/nEDS7F1/LSpxif8FTU9hZZp1+M6vuiBBGbxRvGwVIxPU6cUV?=
 =?us-ascii?Q?xKLzRzrssUuwP37fhh7fvymEEuAahDyOxuE2Nsj082NmWH+llNmnjIm1btQb?=
 =?us-ascii?Q?JIo/S4y2yI4Ytf2CkvUL7bcE0go+gfFIs0Dar0Ya2Vqg8XMwBdLERuD9oIcp?=
 =?us-ascii?Q?2vSGmojIPPt8O3zRv/5pRvwGBjEz1LikvYmFArMkAKXfelaRRCgWshQiWWHO?=
 =?us-ascii?Q?mefHZOtnaGYHIyQeFYo6OBQna+BnxcJrWgl+L+RHmfzveHr8xLvqjl6cPhOg?=
 =?us-ascii?Q?9aKIhZr7uh6Z6BsAzyS3alscpD0EidIAdA35x9nOMpTzuba/z8EIl8FB2bfc?=
 =?us-ascii?Q?QDyoJlY7+d9vyYCqmpJC0VfSft1hnUHsO5wchI0M32UFpCwl00tLo8FEgOGr?=
 =?us-ascii?Q?4dXvkmZjMP/8wwFBs7iq4WpeQmFtMHgKv3RRRXF9+kJvJWZh2p8t/tmP4LI1?=
 =?us-ascii?Q?uK+67WuOLb4Y2aMsFbsUbr4AFfx6sPdUUkzYlNyZPMvtqZ8okEPaYUNXmSmI?=
 =?us-ascii?Q?YRsFsQGgDc8F7NfG4r+671uA8rWXUYIQkAd5OFw5qwxmudEXEkpiDCfXU2GT?=
 =?us-ascii?Q?T93MmCLLXAtJB9f9+5oksEon3wfVczgEHim/WvtUPPSmZcwMhdkgxxo3PuqP?=
 =?us-ascii?Q?OvbUlmI4SpJTIsXQZaH6BV4MP/rk64BLO7sDv6YkTbCzfMHzNtrzBe2t33Gd?=
 =?us-ascii?Q?5Oft/q8rJa8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 09:32:57.6910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f40965b4-93ad-49ca-42a0-08dca4b11cd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7781

With Arm port being the major recipient of dt related patches and the
future need of incorporating dt support into other ports, we'd like to
keep an eye on these changes.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b0c8945270e..f47bdb33d510 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -293,6 +293,8 @@ F:	xen/common/sched/*cpupool.c
 DEVICE TREE
 M:	Stefano Stabellini <sstabellini@kernel.org>
 M:	Julien Grall <julien@xen.org>
+M:	Bertrand Marquis <bertrand.marquis@arm.com>
+M:	Michal Orzel <michal.orzel@amd.com>
 S:	Supported
 F:	xen/common/libfdt/
 F:	xen/common/device_tree.c
-- 
2.25.1


