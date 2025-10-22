Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F2FBFE83E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 01:21:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148543.1480518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBi8o-0003gE-Ue; Wed, 22 Oct 2025 23:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148543.1480518; Wed, 22 Oct 2025 23:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBi8o-0003el-RQ; Wed, 22 Oct 2025 23:21:14 +0000
Received: by outflank-mailman (input) for mailman id 1148543;
 Wed, 22 Oct 2025 23:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KROf=47=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vBi8m-0003eX-U6
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 23:21:13 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3edc56f-af9d-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 01:20:59 +0200 (CEST)
Received: from CH3P220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::7)
 by CH3PR12MB7642.namprd12.prod.outlook.com (2603:10b6:610:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 23:20:54 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:1e8:cafe::bd) by CH3P220CA0005.outlook.office365.com
 (2603:10b6:610:1e8::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Wed,
 22 Oct 2025 23:20:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Wed, 22 Oct 2025 23:20:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 22 Oct
 2025 16:20:53 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Oct
 2025 18:20:53 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 22 Oct 2025 16:20:52 -0700
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
X-Inumbo-ID: c3edc56f-af9d-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLg3q0sRgMkDjM8WbhaExhtp3v7oFkWPM2iz7qrKkDnsLprbtXQHNO40vXEd/KleF+HxuC+jWRFcfR2vHdiER95jvWeS/5nJO6OJQXqYe2ghnQXiIsUb/ctsqtQeAR/2hwiKsBDTwo5jy017kI4jMAK2H6I5KSIYAaO+3Ohz3xyov4JNOnJLtRWgSibvWLeF4W7I82EtYaqAzbcVH6WZzzDvyjf4IWgx0I6pc+/yQ69YhHb7Dew3TQ3SbjYYgB+KG4BJGqnCwsROh5zvIb47tbx8ktX6RKcMYr2IrZ8eSZLA+zEK8nF2PGacd8pUW5YCLS2VOqdzP+vwTLopVa2Yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBDo8oO7K/oh0KcAL7ZLWPFe2u1tB5p2aAe84ja1/3c=;
 b=F3C4JdBnskdaIMIcjjAynBoiweF+Jje8lX/A2ZzGse630z9ijkhnr1mSsp8O62sRQFuCn/IECyHtCeWUIs64HOmzrU78g3mOPf6mN4cg7zkxz+nyKkYXAcdLRbnzMs2TDHC5u2jdaqgiVOcgvtANRGaOnTZRwVVzGVJpY00Azr9l1cKXDpwWm+MTFB9XMDgAIjvXdZ1WcRoknFyECxeTd9+PhJ3HFbLHux8/JUgIV84EPWr4tm9EBT8ABAesqBD3J78IzGN7eAns/++SZr/gUFqJIvUuBNtSupOtSrHOmItPzaT0aYPnYKtfTeTeKrIZXkmqZFftaeWdU2UcTDIzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBDo8oO7K/oh0KcAL7ZLWPFe2u1tB5p2aAe84ja1/3c=;
 b=cx/j6gswp55WaHU4eqXzXCIPQxL77raC4R9OlzfkHVYCnt7VwR4PMEEYmV2+0nZNcNbKSTsNQ5/wuyyLqv1rcoQYOvwel6Y7y8M//sVTFHFhvgUZBCiht2rWe87QpySZiEtlC1sLmVV627vrLwN3c51k+9TtDtJ4yHB9nvknQkM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Date: Wed, 22 Oct 2025 16:20:52 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<oleksii.kurochko@gmail.com>
Subject: [PATCH 0/2] xen: randconfig fixes
Message-ID: <alpine.DEB.2.22.394.2510221616570.495094@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CH3PR12MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: de7ac679-f13b-4813-e103-08de11c1a591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jcvgwLqwYHXU8S34i6WdbyQrK7E0BTlc8COGCes76JXQPztuBTD+bafHDT7p?=
 =?us-ascii?Q?cWRJ1h9vU0Z+99uNadvUxW0y9YFl863Tj+VJ7tR1ASDNd9ejYsyIKzyUpCX8?=
 =?us-ascii?Q?eDV2E13iw3HN33PSUA2j84EfP+c8it2kigGmvHRJlJ2wm56Sexwui46I8vlk?=
 =?us-ascii?Q?E46TN6Z4/TflpxjeQOJRTr0MEcXFiLW5ohQPW3Uw2ULx7lPwxw/hRDTamXTz?=
 =?us-ascii?Q?NIS40GiIJOME1p4cvK5CMMP0ysN/Xcb/gS5263aQywdRSQw6hl/OcuVal6+x?=
 =?us-ascii?Q?256BxT0s+jfaeglQN2tBxDSa7FM87y5zXaLYYNA+Jz/3ngjua05dPHA2tQ4e?=
 =?us-ascii?Q?k/2HaALoEH7BBSY3HdutivrBUjT7912sTXHaw8+xakdMvCj7G4FPerGkuhxm?=
 =?us-ascii?Q?bo18xZBaShs62zoV22O1ZUvrMaH0pygUZZzYxH640pM0OfPhBJgqhWGk0M1+?=
 =?us-ascii?Q?d2hn1tZUVqx3p8gLeUfW4dnWpdxgND7Hzt7X5uxAO6i28m+uiKai2lvW1Waw?=
 =?us-ascii?Q?UbV4cAGAzjUBRprcL1IOFzxZ9MIemS6q2j+qSAelOn6eOuHtgfLRzPHrw7ZP?=
 =?us-ascii?Q?aiyxZxsWRx6JOxe8s1JYG2TqHg/csptMCLD9oXt3AwF63iRjGQlwa/NadOQZ?=
 =?us-ascii?Q?2eCV9RQWU9wko31uOfY62LC7qL4Til+KfcfyU6aMA4JTXBLHheXJRodUj9jp?=
 =?us-ascii?Q?HhKrVrUzKkGmTE80J2cxD4QK8NbrIOGLG1zu5barJqDbKNPFnLQTdE6uEYGH?=
 =?us-ascii?Q?eQkSVqCSxjqlK6IYsyVXAHF3TIJe6iQPOvY6FrFUc7N5CRIxxUSH58oX/sQ/?=
 =?us-ascii?Q?6ODaAOOMRorG5eht1fE+i1xcwcPEZUQeWMttVkc0uLyIm1hHH4ANOHwJ8e8u?=
 =?us-ascii?Q?/G5Ggj1oVTZJN3UE9KFBB5LmW6s76LehSYmw3ZZzGwT0R9OuJqk7hUeGH8kc?=
 =?us-ascii?Q?zDdf8aynmTU1xzqtb2JBz4IkQpidrPQx+cRVZsQz1s+Tw18/K/D43OUqDVn7?=
 =?us-ascii?Q?V3F5ST8ilYOuK6p0mj05o0DWaTz7piuC1ltcYrIiHma9X1J6xjB9iCvUOGYo?=
 =?us-ascii?Q?IRd5cOsZEwe1EDnY0S/pd6xdUhKPme/oHPc5jAtmyZ5QpeywToqAaRnfqc+B?=
 =?us-ascii?Q?lIO63tuzYsTxD0wXfnNjydbi3DLgWm/nUFXuLo5dF48Uw4mKgdRnSeMhJjOK?=
 =?us-ascii?Q?YGISnUDK7A/lhiFncSXfnDhWqKwK0ZZv+LRLvXC07ZjocmvtEZjtY1hk9tbp?=
 =?us-ascii?Q?+svh2sy8XKagkqru2wyT7+kelFZGIuM3wKP8JBq7FvyVhCiztdQF4EKr3E+T?=
 =?us-ascii?Q?G3wFgudjODjkFj2c2Q9BcFRIyRjf9kuo6mcFat5zqVpC30uljLM91j5KOTMx?=
 =?us-ascii?Q?vL9QNeq7LbTtKqcx5KAT5DcyTbEXAkxDVt5eeZsM6lTNpZCQEoVcz1ON95aR?=
 =?us-ascii?Q?XNh+lJhYrUtaQ8gtsLjJua1qqU3XCMDIi6KFXjnP56epnTA+CMf2sipG3lMV?=
 =?us-ascii?Q?xZ5FVOSojhmXjrLyNMInKYgP70hOWy6VA0uXxszLdQ21XqvWkH34z2NMcLOs?=
 =?us-ascii?Q?qDvRo3pAFm6bdk7Nn88=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 23:20:53.6598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de7ac679-f13b-4813-e103-08de11c1a591
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7642

Hi all,

I tested the two fixes together for 1000 randconfig build tests here:
https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/2114931367

And also locally on my workstation for a full day successfully.


Jan Beulich (1):
      x86/mm: correct PG_log_dirty definition again

Stefano Stabellini (1):
      xen: fix randconfig build problems after introducing SYSCTL

 xen/arch/x86/hvm/Kconfig          | 1 +
 xen/arch/x86/include/asm/paging.h | 2 +-
 xen/common/Kconfig                | 1 +
 xen/include/hypercall-defs.c      | 4 ++--
 4 files changed, 5 insertions(+), 3 deletions(-)

