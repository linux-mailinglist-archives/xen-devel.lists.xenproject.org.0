Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72079B38BA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 19:07:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826937.1241401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5U8i-000518-31; Mon, 28 Oct 2024 18:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826937.1241401; Mon, 28 Oct 2024 18:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5U8i-0004zQ-0S; Mon, 28 Oct 2024 18:06:52 +0000
Received: by outflank-mailman (input) for mailman id 826937;
 Mon, 28 Oct 2024 18:06:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Spcw=RY=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t5U8g-0004zK-6e
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 18:06:50 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2415::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65e93c51-9557-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 19:06:48 +0100 (CET)
Received: from BN9PR03CA0277.namprd03.prod.outlook.com (2603:10b6:408:f5::12)
 by IA1PR12MB8077.namprd12.prod.outlook.com (2603:10b6:208:3f4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 18:06:44 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:408:f5:cafe::32) by BN9PR03CA0277.outlook.office365.com
 (2603:10b6:408:f5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Mon, 28 Oct 2024 18:06:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 18:06:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 13:06:43 -0500
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 28 Oct 2024 13:06:42 -0500
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
X-Inumbo-ID: 65e93c51-9557-11ef-a0c2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=luJUG2YxmAknticEKiE44mcgRhhjSOtSRZIov3tHinQj1BWtJRAqFIy6WZIDfs3D6ziGe0odFCtcaMm2M+yGxogz4rFO7l+UGUUEv6gT90jFDSIuuu3tUZ3FEyZZXPxeriPMs5LBbCoDwHHkxlAc6rmmQRTkXHaBNLEIB94jRO8kIHHuW4NpMf195WlvmgLjQvA0dJmt79EOK5PDIG8G+pMrEepNqlq+O1G38tI39GkbvWj+OFMB9oosvzOeM3j4eIfARp+leB8vlRPt3uIZrz3xdCw+LekwMLfo2/p6UhCHs16iNVTUJ/dV7bqpPFskm0v2qDAvPPZUlw5noRctBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQrshb0JqlbwE4dNWvbr6cEcu+XgR/6ZqbZncx5+fmU=;
 b=Atj63MWDWJhtILMDHUf4ebMlDSzKVxexzmkrry6FMzB5/wEnY/ruo4+KsxISeGtz+Fe2vZ2CndI191RGZxV8HOHmD5hsm32J9uhdE2bDAm7RZCiUE9x1F+XAnZ8WsqTAisnEcL0CFH56/JsB9dhoPasd3aKn6JF8ew3U1KDz5qu5V+xA+AO2zv2pM4/PGUI0X21+sbghwaEiIM8Iy5AnihBL/vK7p6slCBj/9LhxgRxqdDqVErwMCUPdjSis1q+JYksijsp5JgKHcLglG7w206M0sxqcS5IW+ETOTBYcYChl/6DJDpPPrnf/KUSke/xw6VN25p533AkRs6CofMQn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQrshb0JqlbwE4dNWvbr6cEcu+XgR/6ZqbZncx5+fmU=;
 b=YULjSznJctgTmkeXXyllUKpT7/PTDRGkCNH3M7zGhTXggU9Uwd8QdyKpsLG4SG02nsQjUKtIIP5MB4AcJ8OUWYM49Q+fj5XjKpA8HsosdSz3jYfdAXBALWHseMVUvxgK3SCviYJjMZAKccTfNbCI0vFzihRT5kFHpU9xm4v+Y+E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Michal Orzel
	<michal.orzel@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [ImageBuilder] uboot-script-gen: Use split_value for memory
Date: Mon, 28 Oct 2024 14:06:44 -0400
Message-ID: <20241028180644.2501-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|IA1PR12MB8077:EE_
X-MS-Office365-Filtering-Correlation-Id: 52cc5960-ebc9-4ec4-a9ec-08dcf77b47d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HWyPDif2ZlnW8ae1FZmFcH1IkaMzxRzDdGE2uT6WcQAR+0JTuHIkc1enWznr?=
 =?us-ascii?Q?AQ22phZTfzUK/01m9mbBnjF9jf0HXGPgF4AknM+He9FqAMyMgcMii8nfVBQc?=
 =?us-ascii?Q?/KjvCAO9RRQs3JkJVdT8UgJ5oe+IIg7U/dl5Km7zLksYn3oZmSQlT85NBc5r?=
 =?us-ascii?Q?xLenb/TV+dNlVptirYK/RSBHNHHB9Fh7GkZjRP/uHBTtXkB3w4Wkd1asxVgO?=
 =?us-ascii?Q?fi7BeslJkiKMmQ3+ykBtw91uyltNzpb8RZvhaVWrY5lnRrLxpB6AL3U2v3TJ?=
 =?us-ascii?Q?M+ivqFqZ2/gTZM6mHlHttUgnroEVtPijMxPLqhoiJ5hu5pLE9tnnUq2bUBYK?=
 =?us-ascii?Q?R/3GG9NjDs1LGxnqjXCmXZDj1W3/48eKwESsjEmLIInkr7O51llflUDkZ9kC?=
 =?us-ascii?Q?La8sMaotIFp3kCvBDiECi8gvXIeustslZSGICBSmKXRXeND2kifqt9dIjERz?=
 =?us-ascii?Q?NUSDgGFQ18VQCxo0+Axr/kE56ZF/7NZ2/BWnWEjbHOoBd5lVYneEJJSQ83rV?=
 =?us-ascii?Q?soulopijeK7/yJa40S4Fw/isioGv4FKM7WjkQl9a7Djw1wDFyQ0mAz0f91BH?=
 =?us-ascii?Q?NibfhXOzv31QaAwUalXvsG9csISkKEqbnznGrxFz7QhpmVKFi0K9gb4AKjl8?=
 =?us-ascii?Q?O4uBIdlkRqPJac+aLkjtnmLEQesdQ1YTKafPY6puERKVPxo8qKNKdEMVg8ZN?=
 =?us-ascii?Q?Lb8iqRYhVkShoXd4m+MJrnZSKz/2pTIGwbm/V2lHFmfqfF9ffqoK+CqFj3pl?=
 =?us-ascii?Q?T0/4Snk8jfjt6BEP+A62dieIe4Amec+/IySgoDuHyVFiAWMhkInqUyBOKDUB?=
 =?us-ascii?Q?8hHGkqHZtj/0oOlr1xb9Sami7xPG1Q7m4Sv/FTjnuvUNXxAu7hnQM5FwgGH8?=
 =?us-ascii?Q?Ap9AQPW1EM4jO971XMHcHknjM9hm9j53uGihGD3n5Z53b1LcNxUC+ge2H1/v?=
 =?us-ascii?Q?pDn78YYz3tnR82VjmPI3i6snsxW6eSbAMHLoiP57+G0rZwxxfMsImCtKaaLd?=
 =?us-ascii?Q?JTogDI1rhHH/a2r/tT7rSLFtVcAX9bET9U7kRIqKFKjqd7Cm4sxGUVmxyKuH?=
 =?us-ascii?Q?ITDorNVKB3eK/FMXLuW/KDvSA75LhGdUYsjQgP19LDxG86hmS+YSbX2ezrXY?=
 =?us-ascii?Q?pTZkQHRBL9b2mc/MkIvt9VCMtBHClrvHmZ7wyW2lKV438mMwWXFA0LhHNbFR?=
 =?us-ascii?Q?1BHazgQiYmSh2vnyiNvgisP6jw3TsjjiIARyqKpovTbT8mpBf+U47173r/R9?=
 =?us-ascii?Q?W9e+ougkFbj7XoAreQs+Ck4vKY19zaFSzSQmNlTMs+OgDaTT24Hbt1WOt5m8?=
 =?us-ascii?Q?xHjvqzrLhaeDisiAk+snradIZusEhmQXXHwN+iGVBCFuCCcfMuE7/NUR4ou9?=
 =?us-ascii?Q?sSoV6A4Vg/78nEZ3SE5eZemdMPmFFdxXZwNJX1+GA/Yg/Y2pWQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 18:06:43.7103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cc5960-ebc9-4ec4-a9ec-08dcf77b47d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8077

Don't hardcode the first cell to 0 - use split_value to handle larger
values properly.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 scripts/uboot-script-gen | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index f10e5f4..dcf5bdb 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -174,7 +174,7 @@ function add_device_tree_mem()
         memory=$((512 * 1024))
     fi
 
-    dt_set "$path" "memory" "int" "0 $memory"
+    dt_set "$path" "memory" "int" "$( split_value $memory )"
 }
 
 function add_device_tree_static_mem()
-- 
2.34.1


