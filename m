Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC861A9D657
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 01:43:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968818.1358284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Shl-0003Cx-W9; Fri, 25 Apr 2025 23:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968818.1358284; Fri, 25 Apr 2025 23:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Shl-000384-RX; Fri, 25 Apr 2025 23:43:37 +0000
Received: by outflank-mailman (input) for mailman id 968818;
 Fri, 25 Apr 2025 23:43:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/n1b=XL=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1u8Shk-0002xO-EW
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 23:43:36 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20615.outbound.protection.outlook.com
 [2a01:111:f403:2009::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19f10889-222f-11f0-9eb3-5ba50f476ded;
 Sat, 26 Apr 2025 01:43:35 +0200 (CEST)
Received: from MW4PR02CA0020.namprd02.prod.outlook.com (2603:10b6:303:16d::26)
 by SA0PR12MB4415.namprd12.prod.outlook.com (2603:10b6:806:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 23:43:28 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::66) by MW4PR02CA0020.outlook.office365.com
 (2603:10b6:303:16d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Fri,
 25 Apr 2025 23:43:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 23:43:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 18:43:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Apr
 2025 18:43:27 -0500
Received: from xsjstefanos51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Apr 2025 18:43:26 -0500
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
X-Inumbo-ID: 19f10889-222f-11f0-9eb3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gvw63D85xjKc106Br8JOxYKmHCyGwJXkf2Ka5ZQNLHTuo0W16JHgcTd1rchCazA9zVzfoHlyYxM8B4PElMr7+1X5HpeEeNmWXaB6mfFrlgyIFr8G7yft2JuMXDcrjmF8HURDOPXdxJ6YihSAZET+vXKUkxWQcoSbvwgdnkuwQm2xOC5VqfppcNS3d6a5uLuoPMtATjJ7NbPH2UXBodI6YI21m7CO/cF57Vfzjx1bUpP7Xtsoads5GqUYYFRSvVTz6TG6pv2MUZda1RFf7c69GjacfSa8eKaFaLGQDyFImM4C9aCkGxjRKwzHCOzhHbs5UvCyw/bgRNT5XaouNEh4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L83w0WtnYztYUarRr7gN54jKPlPoYHFz4od7vI6r2Es=;
 b=tUn1w9glVtC1MKvS+O7Mg2mQIfB6O02TiLTKGwg4yIAXoEKL9DcfNRxFYbflgNL+EuQCZF4tjQqM7/XXYIVho/oTU1hqcIw3rVNxUXYvdnuyyxIXbjMnZwrIyeEeoYnjRkyeK9CRpwpobPMq7amL6F9JCcYhDGitGpTMKJ5HpOifVZTfUrapFKqHQzpOfILCP3DNGQsIDi7meI1aZaqWGcmyrl/kM15UNSRWYEM3sHhG3neAjw41eYrGD1cm6wn6u79DzP3P5Zw4O/nI3TDg2VCEyhajbHIKQkruKAVBG5DYhfOdNgE+YP1UR15gHK1/+jX+iIuAHTJrjlcbSrg9aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L83w0WtnYztYUarRr7gN54jKPlPoYHFz4od7vI6r2Es=;
 b=epiFVASeQ7GnZkobLj6xo5g+Dig1nhICNMF0CFQh1xmm/xXa4odU9wRjJ79dOJFfUrcCucLkHwEbuYJ3Rpk1WJdB71UWHdMF99kKyNsGKh3yufroCV3U6tiiiK2/08FMHUdcQEObjmn/CCCMEisauSjbXNnKYtqapmsg+zMqH6c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Victor Lira
	<victorm.lira@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v1 3/3] automation/eclair: tag Rule 19.1 as clean
Date: Fri, 25 Apr 2025 16:42:38 -0700
Message-ID: <7316cbef75cdd0726990bcb8b37cd10f3be62185.1745624090.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com>
References: <c694069696dd428bc1719e36c378a573b03f74b9.1745624090.git.victorm.lira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|SA0PR12MB4415:EE_
X-MS-Office365-Filtering-Correlation-Id: 101c96f9-7081-4aaa-b6a3-08dd8452fa7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkN2TFpOeU9Ua0pjaTE1bjVYaEpNQVMvSGZXbXRmUlIwVTByakxYcE5XZWFC?=
 =?utf-8?B?bGF2MWdCMDFubDBRNTVOYmd5YVlIaG0vdk9VM2phQ3ZoeUtKdCtXSDdpSlFn?=
 =?utf-8?B?cS9TeHhTbzFhalVqZm9ocFdpZitIZCt1bVk5U1B6WnhlOW5HMWFqZ2xkVW5P?=
 =?utf-8?B?QWlBT2R6WDU5Vzk2VDJhOFdDMTBlM2M4d3J3MjBiWDY3dWZEUjRQWFVJbWlD?=
 =?utf-8?B?VThuS1FYZU1aSXB6VUdUeExzYTRuSEluczlYTW9jUEZlVUcvODltY0htUEdq?=
 =?utf-8?B?enJyR3JJU3I5cDNRZnZZbGNHRzI0UTRlUXd0T2t2OXhiT2JhamNqQnJSaDFu?=
 =?utf-8?B?ek5SMGhiNGs2OG9TR0ZiRU1wNE8vc2Z0SllXRE02c3dYMjZlVEJrQXMxd0pm?=
 =?utf-8?B?cjJOdVM0RVM3WVhOdGJwNi9vV3R0V3pFRnVHN2xjbUsya1h1dEx1L3owcVdU?=
 =?utf-8?B?aElKdG95Y21RUk1rUE5QV1hMT0FBMWNJdmZiSCs4NFVlWm9yNkhUVjNhWFhZ?=
 =?utf-8?B?Qkh5R3hCU09tdXNnRm9KbkhzNHBIRHJpS09qOFpNSEk3VUxCbUJxenBWV0R5?=
 =?utf-8?B?aXpMSkZwR3Foa0tKZi8zb1k1QS9Nd09PbmZQY0NneXd2QlJORm1vMU94dE5C?=
 =?utf-8?B?QWs5WGNNQXJBbThmOG13OXdKMXFpWm5vQ1ZSdHZWZzBSVXQ3MDE0UHpWSExL?=
 =?utf-8?B?aUlMd04xSTVzb3NmUWd5ZHA2b1NjTFRqckIwNldCYUJCeWYvejlGRXVxdXNX?=
 =?utf-8?B?aEFYZEVTb0Jxay9WU2dGb0JKenovRldqYTVKU3BlQkFJV21JSGxRWjkrdmJu?=
 =?utf-8?B?MkRSRHMwd1ltTGRlWENGem8xV1JTOTdiUW5CeGJNQ2FLUXFMZmNqeDdhRUlY?=
 =?utf-8?B?Y0RhUkF4amFIOGMwT3k1MTlpckRQb0lkajMwaS9aQnJoRitTdzRTWEhyVUFN?=
 =?utf-8?B?ZnR3UkJia1RRcGcxeDAzSk40TEJzSC94elpqbSs5RlE1TzRRUlJJbE95NjIw?=
 =?utf-8?B?ZGp2elFVYVVhWUZaYW5FZU1ZNzdFQ1dyZGpJQnBqR3hkWEFRWU1oUS9hM1FK?=
 =?utf-8?B?TE5ka1hYM29rdUFLclhXM1IwWXErREhwZGRmMUpFN0UxdkhBbkU5U0Z4MFNW?=
 =?utf-8?B?QkduSkVnSkx2czM4R2R3eGxXMytJaFVyQ1F2VFR4NTNmckpId3FwOEplUTRq?=
 =?utf-8?B?U0xyT1QybVJaUG5YN055RGRwY0RzMDJzZ3k2ZEx3RVFucVh3T3dnbjdXdWsw?=
 =?utf-8?B?Y2NuR2d0TEkrNmdLYWVhZmFkdEFpMXl2dlFmUks5cFNoTHBIMXJ3T2pHRHIw?=
 =?utf-8?B?M0xwU3JhSkFIdlAxUjFTajZzZ3JyNVhNbWw4LzAyaitxeFFqSGsyWmxTTEd3?=
 =?utf-8?B?Nk9Zbkl3ekNIRnpmTGllTE9aa2NNekMzK3BvK3BOamtoTHllWWRHRFg3ZUh5?=
 =?utf-8?B?QWlCT1BtZTNyUnB1KzZnelpva3c5NUZFclZPdm1WQ1BGV0pEKytIRUNFN3RS?=
 =?utf-8?B?U3lmK053Q2FKSnMyRnlVSk9sYXBkR015bmtFYkc3VXBhRFVZbEcrZ2wwUVI3?=
 =?utf-8?B?NTJjbVJwdG5pa24yTkRoNDNkenBFTVZXOGd0QzBZQWFxbzZWcWZyU25WN1Ni?=
 =?utf-8?B?aHZGWkxBbGhDRUNOcmtGM28vNjc2cTdvek1aQmQwNVpTa0Nuem9ZdVBIMGtB?=
 =?utf-8?B?cGc0OGU4VWJHQVBZajZvbmxMZDd6Mlc1alU5a0hPYXg0aGVDSFJmd01YNTh2?=
 =?utf-8?B?WXlQaHk3OEdNTDdaTlI0aWhJa0EvSmcxWnBweHFtOFRNeFhKWjB2R1VnYk1l?=
 =?utf-8?B?WmVTbmZGS2c2WSt2UVRXSlFxUnR2cG9kUUlId0FVZzRIeW5HeklmRm1IYmxN?=
 =?utf-8?B?QWJEeWdpa1lwOUdBRkYrUW9vWkZEMXk4ZmEyaE1WOFc2SlZIckgySG84Vk1C?=
 =?utf-8?B?WVpROFd4aldsaklqLzdtdThRVEd5cnhNdU1mSDdTZDI3dE1qb2xPL2NCQ0Fy?=
 =?utf-8?B?eC9QNnEvUTUvU0hHbllsWlU5Ymlzd3dkMFFKWlRtaWhvZ2JYbWsxMFFuWmp2?=
 =?utf-8?Q?HJP7wS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 23:43:27.9577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 101c96f9-7081-4aaa-b6a3-08dd8452fa7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4415

From: Federico Serafini <federico.serafini@bugseng.com>

Tag MISRA C Rule 19.1 as clean to avoid regressions.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>
Cc: Michal Orzel <michal.orzel@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Roger Pau Monné <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>
---
 automation/eclair_analysis/ECLAIR/tagging.ecl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 1d078d8905..dab3c51faa 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -78,6 +78,7 @@ MC3A2.R17.5||
 MC3A2.R17.6||
 MC3A2.R18.6||
 MC3A2.R18.8||
+MC3A2.R19.1||
 MC3A2.R20.2||
 MC3A2.R20.3||
 MC3A2.R20.4||
--
2.47.0

