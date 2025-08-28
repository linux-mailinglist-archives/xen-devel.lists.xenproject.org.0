Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD810B39007
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 02:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097179.1451610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQb6-0000SL-Ah; Thu, 28 Aug 2025 00:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097179.1451610; Thu, 28 Aug 2025 00:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQb6-0000Pf-7g; Thu, 28 Aug 2025 00:34:36 +0000
Received: by outflank-mailman (input) for mailman id 1097179;
 Thu, 28 Aug 2025 00:34:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urQb4-0000Oa-UP
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 00:34:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [2a01:111:f403:2417::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3ab4660-83a6-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 02:34:33 +0200 (CEST)
Received: from CH5P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::15)
 by SA5PPF916D632A9.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 00:34:28 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::86) by CH5P222CA0001.outlook.office365.com
 (2603:10b6:610:1ee::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 00:34:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 00:34:27 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 19:34:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 17:34:26 -0700
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 27 Aug 2025 19:34:26 -0500
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
X-Inumbo-ID: c3ab4660-83a6-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PgFgq9xzUG7fSPVPpTxZSxEGhNwBz6erNdjZjX7nwmGv/ktpD03GmQzP8Y2gh6y0ytorRFN6IW5yKHqxZGCgq1/G8OdTxLpK18LENTnnCr4of6ygFNiy+HnLko78yQMjU8UJKHgr3u+/Ojw0Y2Zx6qj3gIe5OVB64AxxaiC2jb7OqbrYSd1sOZeZnrhbjTPAfkVP08l11g9sSIvE71RWwv19RbtAQ+klL0GgsS6jwwnenMy1RLteh5UKDk9btB7PRUgglMjPfqcghRGypq9lIhuiH3oDXPYgXniRBmNhFUIG0ZGVBtvsFDgtQb2Q+oLn0nxGc0M1JDzlCKFweIwz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn7eBth2oHtJKO07Rys/pSHJpVQ8txr9CkjrO0LbiJ8=;
 b=WNdt4aLhbPG2myj8yjhj9pxMbHdH+g5ZuqJPF4btlSeNx1VbsvNUpPRvdNmp3tiX+PYlu4Ef+5DpimYvRS9FY8moy5uUvNKEgbupWCsgQ1MeLcOgvpuGboBYpqWCut9+tdS6WGqlq1F2HR9A5llnxbj11R+Eoxcr5Q5fmlLDiA9ACwBsr035i4LVG4PgvaYAt5KpYOk2ln0HLGFMyhs09ZOCdDauvpsW0BfpKzt/ZsUPkneQPEA1hQVU1bbNprl/UMIuDUqWP7bzuX3KZeU2gFO9U/DqTXYzZEhIgKdSaLTJYkfrAlklks3e1mm5GtpqqkcyyoEm9hfBgIfQYdKHNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn7eBth2oHtJKO07Rys/pSHJpVQ8txr9CkjrO0LbiJ8=;
 b=rTrrhzsrE9RtT2EjX/exWjhtiCAgMB/T01PxTXZb/ZPml3zuE9iRFCiTM3D/2s9GMBSF3LjK08nP0JBix2o955fMWZ0to37BBHGB356FLtLZV2EchVjXXwPlTfKtKbjwlzaLlmSn67Ar2uhUXWDdEH/fAU6mwXyboFw5GG2QSl4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/3] xen/events: Fix Global and Domain VIRQ tracking
Date: Wed, 27 Aug 2025 20:36:00 -0400
Message-ID: <20250828003604.8949-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|SA5PPF916D632A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 76480195-1932-443b-6f10-08dde5caa505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VrHTUAjHG4P4pVXM8xtR7iUsOX++drKrzrFJTYXrwwa0Wex/7RSQreJdaI9T?=
 =?us-ascii?Q?YBFQGBgCrVJoIu70oaU1Ds8iCBmsQbYbLiP4k9BZ3++tbXAcpbs/ue8XqnL/?=
 =?us-ascii?Q?bcWsCtM4w7eiEgswYpr4PAp+o1qiAXx1C2ffZTv9Q+CXdac2qTqOXgDhI6uT?=
 =?us-ascii?Q?p8YmD/k4TTXcU9WA4JxKV2QqpNf5Ldi4KW+dIMK8Mrg+ze9SGjez6fpxqm8T?=
 =?us-ascii?Q?++15yNbWmJWGRqjuSA5g1Ftp3f5WpqJdi1qvqdP/evkBMJhP1Ucz/KHiSPqL?=
 =?us-ascii?Q?MJqrv1p7I7eRtVpQAUt5XcK4iP0uzUvjp+kEcQae5+d5ZnqYUWdfxn2+2Vq7?=
 =?us-ascii?Q?WTG7I5IgenCAPAd0aUJY7GvoEISohvoPh4frLwh+aIKrTc7jSI6OR7SSD3eN?=
 =?us-ascii?Q?NvnzkVOXD/Q/HWI2HOhCnaAd+x/Lu8qShBctMvjKu4VDiZykKqvRa/zOnkOY?=
 =?us-ascii?Q?As/ez+9OE2CstcGXUmDbgGLtMBiD4kmCQx9ClyNINwopTTZZrF9msGXpyTC8?=
 =?us-ascii?Q?nwkB65yex61s9w6PpEDm58jgg5zQNNETr7mPfr5TDTeSEbQ8YnvtSlvBRRjS?=
 =?us-ascii?Q?j9w7oQCkcAfHadLQwDtU9OnzPsGDdqfSVAqZWJHWeNYXcO//yOXGIlXIeSD4?=
 =?us-ascii?Q?QVoYPesDE3AAUn/hiZmE+r3bsRA+jCBKiaQJfcoJQ3S4T1fU0ATuUhY+I2PR?=
 =?us-ascii?Q?lj8lAa96xHVDgAlP4QlITz3W6lmQ/WjJ8LdkTBPbWJaIMkDFZOgaRl0etGmC?=
 =?us-ascii?Q?1mUZROYTjWRfVDiXZXnxXIobUS+sJ+gY84EEOwY9vOwxrEFPVEhhX37qdoNk?=
 =?us-ascii?Q?jAOmWXEe/GuvjBgzb0KdshpNGPTBrAlwKiM4YFKOZGcXWSxcDSdvDF//38kw?=
 =?us-ascii?Q?bWswicCXAblyJXYSc/9Hhd1b8Txmfc+SPhamjj0OPjVkEX8Qa0kEJf5tBc8R?=
 =?us-ascii?Q?0tzPEK+D1sNbxmFCZsGf4FCBDoNYQ0EHXMUkXOr1LXgIzzv+P6kig6d/vTGU?=
 =?us-ascii?Q?oWKuybBvzB6t8MzeqLJJvqbHh9A+TR70KcaGvLt/wZM8zUEiTJnyuY4As1PP?=
 =?us-ascii?Q?ZjCmau2euGzqWmSzAlfLvWIazM1eeAp9en4XJZ6wIGAtB3I/EqbpfdArE+mY?=
 =?us-ascii?Q?NlgcQ7spL4xA3VH/2sDp8hWlODnSOgwpi18hVyPLP5eRQs9oFejD9731tdfa?=
 =?us-ascii?Q?4f/Gk7ZD2hjboZjD/92lWdaLjhcZOYhSUWx8/KGW8MhuR4mFRvjmvdq+j4HR?=
 =?us-ascii?Q?Vh7jrQBFEcP2bTsZwGovd7HNALMQvlqnbvqdEeu/PpLbdci/jC8JTT8Y3HGD?=
 =?us-ascii?Q?vwszwrXyU3B0r0Iprb7B5UCr+CLGN4bmC8f6RZwBqicoZxNGa5IYISkaBh9I?=
 =?us-ascii?Q?ESkb/aZM3wwkJt/mM51ZEX4xxr/fUZrRtzM8SzvZI/z0XR9oc7hm0G3sxKHI?=
 =?us-ascii?Q?rH0WECKXo3pQ+RFWNllOe/Q8RbrcdIOSrC983SmfHVZV6mO39G0u2FrIqV0L?=
 =?us-ascii?Q?g6IgGn2QsZp0VTj1gyLKsI2HFKuEwGMOuX49?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 00:34:27.0677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76480195-1932-443b-6f10-08dde5caa505
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF916D632A9

v2 and v3 are now series first changing find_virq() to return -EEXIST in
some cases, and then tracking cpu movement of VIRQs.  This keeps ensures
the cpu is correct when calling unbind_from_irq().

I'm adding Cc stable to all patches.  Patch 2 doesn't have a Fixes, but
it goes together with patch 3.

Jason Andryuk (3):
  xen/events: Cleanup find_virq() return codes
  xen/events: Return -EEXIST for bound VIRQs
  xen/events: Update virq_to_irq on migration

 drivers/xen/events/events_base.c | 37 +++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)

-- 
2.34.1


