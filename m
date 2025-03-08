Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8960A576AF
	for <lists+xen-devel@lfdr.de>; Sat,  8 Mar 2025 01:16:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905462.1313276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqhrd-0001u6-US; Sat, 08 Mar 2025 00:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905462.1313276; Sat, 08 Mar 2025 00:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqhrd-0001rp-RN; Sat, 08 Mar 2025 00:16:25 +0000
Received: by outflank-mailman (input) for mailman id 905462;
 Sat, 08 Mar 2025 00:16:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIyW=V3=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqhrc-0001r6-6N
 for xen-devel@lists.xenproject.org; Sat, 08 Mar 2025 00:16:24 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2415::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9082c9de-fbb2-11ef-9ab7-95dc52dad729;
 Sat, 08 Mar 2025 01:16:23 +0100 (CET)
Received: from PH7PR10CA0004.namprd10.prod.outlook.com (2603:10b6:510:23d::22)
 by MN6PR12MB8489.namprd12.prod.outlook.com (2603:10b6:208:474::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Sat, 8 Mar
 2025 00:16:17 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:510:23d:cafe::1b) by PH7PR10CA0004.outlook.office365.com
 (2603:10b6:510:23d::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Sat,
 8 Mar 2025 00:16:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8558.0 via Frontend Transport; Sat, 8 Mar 2025 00:16:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Mar
 2025 18:16:14 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 7 Mar 2025 18:16:13 -0600
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
X-Inumbo-ID: 9082c9de-fbb2-11ef-9ab7-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOyZzMtiqHyTAAI3GFFrJpDwcasBslHC0E3WemiSzDtxNmlqwgy0vaNowC5uQwphNpy7iTntYajsO3bBp+CtpD5kAu8vOU0mGYIcr4dA64fyKkyEBGGLQ8L+196xoOs9zd6LT4l4q6YVynv6SdGeR9aJ6r4TWwKW6vefIY5ov/+ywx2Rv4wef6JGxExi+YEBQA3qD5XeO/5VTeyEK9FUf5LLQnnC0xdUQln39JvxIctKbU4qIlYFdFgG4kxZJ1KRTcTXdUSYGzynGxQQbj5tWf6trvy56tpy9KOk339gcArJNETCQaV5qQqfBwv+GJ1fewUAbEHEIdR7dSVhEvv7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaI6EZemoHm5B0weo/dwTRxCldsMAovM/DZArusHS5o=;
 b=l5ljIHZy5JUoLBO2iWUpeyHRN096+2kMNFHsVvzdxJWSN4yoKmblrzRr4c7dET0IJCWJ8UkRZNkyD7nQptz/xSjHuM0lW3/0lGE/CJrWnu944zos+jAiv7nLQkjOkE9Jk6zr7sB+Dvd5p7IKE/vUPvxNcDmqDDdLUKpgd0GUOmapbrAiTWgMvZKWdK6AOzEBcJvAbOjZHFjmftq/oz+su5vE6QGgQaMuW4ilkcjZiIQpraz3vFTnQRFha7ElBO+Xx8n2Bo9acBrnRyf+LQlibjd5Fa4V++qdMawWvEec/FkZNjjsCvz57JVa3gz6f5q6ILhyb204aFq91IPxMQOJxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaI6EZemoHm5B0weo/dwTRxCldsMAovM/DZArusHS5o=;
 b=ZoLN2mhpMXJrv4+7mtdO5LdJKiD9qyLaeqHFnHgShm1W9m0IzQNgJpNfQuF7Z+33Hlo6js6GEGqKZNK/rIC2ItSfCPu8ymmJ11T3/wquDw6FMnzxzNBMxlKlX1fkkNb7IQ7MmDNrVn1eUC7b36U4vby582+VA1iJId3Qnz4gAOc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Anthony PERARD <anthony.perard@vates.tech>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v2 1/2] tools/ctrl: Silence missing GSI in xc_pcidev_get_gsi()
Date: Fri, 7 Mar 2025 19:17:10 -0500
Message-ID: <20250308001711.18746-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250308001711.18746-1-jason.andryuk@amd.com>
References: <20250308001711.18746-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|MN6PR12MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: aae5044f-80fa-4e59-361c-08dd5dd671a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?crl9VXGY2PFwrB36WhG/XNRpL7LndwBx7oGcDn9nCcmoNrWb7McEGcCQ/Bui?=
 =?us-ascii?Q?5NmgrSdQt30q60KKr6E13tL72E+pHvv+wk0QmE/phVvuNFagPfLNT4HLWRAC?=
 =?us-ascii?Q?1k/iOOxp8Q77963JH0ePN5TVX4GWkvj1ZNJ/75KDDUewv5S/qLkgeD3yzt/e?=
 =?us-ascii?Q?wAZefpC8ZDpwoKiSohev7r6NRfz/UOSXeCsoQGAt+WdlFRiznhBDPQJt33gb?=
 =?us-ascii?Q?EVbirr2MyRiqsLPwtAs1pUV4mBxJ5XT7qzlTq1bqifsHRZ8NnvpRa6203B3l?=
 =?us-ascii?Q?cohSBBr8eTBqqOBd644j7EXkWr3ENvN5dzzzgK9Xqf72CAtjfPU8jv8QXSIF?=
 =?us-ascii?Q?Pd0BYmc7T8awHpTqD4yQBMZ+jGIRbfnlzTNFfkfEC/6YncwLCy4B9kilUh0t?=
 =?us-ascii?Q?HmUzJgmUrLC6D4NPpBK1s1BmaRCtKUsYGCuNwxymGVADW6OQMm5DMaaekLjp?=
 =?us-ascii?Q?rKlmLst4w4WtAldl7QpL3Z07SLJmhg+JWtDuo7q2MppoSSMEktlvwjXOUZX3?=
 =?us-ascii?Q?8RZp3UCp+wpFfWlUkJEuEniKOaOp/ezeNgrFGHM4EiqKkJ9dBZsRoUwspQYb?=
 =?us-ascii?Q?I4BXLxdHaQinvafaeVZ7FubYz+Ywx6zNxbAKLQfF5a8m1DArawFmgIRf64ds?=
 =?us-ascii?Q?HeqA08PzRenOQfl5oqAnQjG1iFoF53viO7RKUndndbDcC1iQtgcWzwABrGLC?=
 =?us-ascii?Q?aartSRBSYjeFAWDtCQoM8yDZcBjsL5fjYJKq7dVBGSwySYfmuGsnmDkpVkah?=
 =?us-ascii?Q?itrCn0kiM+o88ioaZOCwVmk1F9wHaesKMC0tZIoa9DiczxL5itQoMdQgNcaK?=
 =?us-ascii?Q?oHKjfaeXpeq8yodkvLohMGbWTUEQuQrD00SID2qoyovJXM44Gyi6EjDw/MJy?=
 =?us-ascii?Q?uqjd0iroyhGY3ZGBOyelDJTYF1oFOk1rR3SMLo+P3nAqUhCuWQknVXHvbjwv?=
 =?us-ascii?Q?IkdyCVjKqaRd0RZn2F0bWtbXVmMeI9p6y/XT4kXt//MBUYy1j4WzTx5EF25Q?=
 =?us-ascii?Q?+ejc+UtwEO1IqdQsg2h4dVTDfQXo1jE4LIzoVGjRNdk/B/aXzv5Yp73oabWn?=
 =?us-ascii?Q?XyPIG41EfX59q2hOhvAmqp9yY/bNU1pvgzuqtSJtG93t/KzKbghK2303mNAb?=
 =?us-ascii?Q?A+FgGcJJzAh+/izbSj/MdiL36oNwYeSqZPZH4fqjGWIVSBiChcuZPrP+vz4u?=
 =?us-ascii?Q?1QRx7Fy0LxAirlHk/rlBXVFYKFAbMvomFnT66967YBRq2kdR5ydMTrteox8O?=
 =?us-ascii?Q?U7o+Zpoqgu4Zto+nQR2MkOlmpN/lKKTIqne/OPwLIPNpV2IbohCyiijfmQU4?=
 =?us-ascii?Q?9Jzev+5k+ZjOolSRNsbcjWBzj8fA8cX2CurSXEzJi/o+V7in3Y+t+SJWxbpM?=
 =?us-ascii?Q?MnXmZI6J6ym6wO6VSvu3x0aR3w7OmCpJy8+56wHNK4thc3upgrOHEzzcL1rl?=
 =?us-ascii?Q?WHRBQ/k/AKXaJGduCjhTa9Q+/X0eN+dBBoi0r+Lwe7EMZHCK98iOcQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2025 00:16:16.5690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aae5044f-80fa-4e59-361c-08dd5dd671a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8489

It is valid for a PCI device to not have a legacy IRQ.  In that case, do
not print an error to keep the lgs clean.

This relies on pciback being updated to return -ENOENT for a missing
GSI.

Fixes: b93e5981d258 ("tools: Add new function to get gsi from dev")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Use Xen code style
Print sbdf
---
 tools/libs/ctrl/xc_linux.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/libs/ctrl/xc_linux.c b/tools/libs/ctrl/xc_linux.c
index 92591e49a1..2b2d7b3196 100644
--- a/tools/libs/ctrl/xc_linux.c
+++ b/tools/libs/ctrl/xc_linux.c
@@ -77,9 +77,14 @@ int xc_pcidev_get_gsi(xc_interface *xch, uint32_t sbdf)
     ret = ioctl(xencall_fd(xch->xcall),
                 IOCTL_PRIVCMD_PCIDEV_GET_GSI, &dev_gsi);
 
-    if (ret < 0) {
-        PERROR("Failed to get gsi from dev");
-    } else {
+    if ( ret < 0 )
+    {
+        if ( errno != ENOENT )
+            PERROR("Failed to get gsi for dev %04x:%02x:%02x.%u",
+                sbdf >> 16, (sbdf >> 8) & 0xff, sbdf >> 3 & 0x1f, sbdf & 0x7);
+    }
+    else
+    {
         ret = dev_gsi.gsi;
     }
 
-- 
2.34.1


