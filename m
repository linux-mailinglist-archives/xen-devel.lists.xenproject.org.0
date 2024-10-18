Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E51159A4842
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 22:40:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.822148.1236111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1tks-0000zb-TS; Fri, 18 Oct 2024 20:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 822148.1236111; Fri, 18 Oct 2024 20:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1tks-0000xI-Ql; Fri, 18 Oct 2024 20:39:26 +0000
Received: by outflank-mailman (input) for mailman id 822148;
 Fri, 18 Oct 2024 20:39:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiWJ=RO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1t1tkr-0000xC-Nq
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 20:39:25 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2412::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0df7a2f9-8d91-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 22:39:23 +0200 (CEST)
Received: from SJ0PR13CA0221.namprd13.prod.outlook.com (2603:10b6:a03:2c1::16)
 by MW6PR12MB7086.namprd12.prod.outlook.com (2603:10b6:303:238::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 20:39:18 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::7) by SJ0PR13CA0221.outlook.office365.com
 (2603:10b6:a03:2c1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.21 via Frontend
 Transport; Fri, 18 Oct 2024 20:39:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 20:39:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 15:39:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Oct
 2024 15:39:16 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Oct 2024 15:39:14 -0500
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
X-Inumbo-ID: 0df7a2f9-8d91-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSIMrjYRY0WGfBYxbArmnefYkEhgrIoqXPJs7nS3ZWe/ePFmF/6qKDaOaBTPWJbHOLnr19SrBd1Om5VfJNpzK+1ujMc8h9dyKQ6IPLvzcpAohKtpdLJZYy38TCKGJhiMhQGoJJFGw+viBU++CJDetflZdHC2ksU/99pUnodQt/oMRLDkNUrc1TI00xyN8ZtsGIJQuXBgi6tmRjwUN36Aic7422QpFPZliaO0SLDmSHm/v+H0BUwkqjqm573HW1N2z4VCse6c5zPRczXdKPfFm89IoOXf4P9wNXpwPZijgLW29sEnMrbNbpB5Aav+HkxYb5Zif8W4oIdVABBk1zWwNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65zOba1Go4UkXf4nl4lRvSYjNqYKLo2d/nxL4CbGz60=;
 b=GrRmBvGNrUg9C+9P5lF6fgsF1RtO5ZQnLT+DV7IHuYC5j40gbHPWPVakJBPiB4ETZTkLFCiJ2N9ywdPXq5E07gBJBp2Tg/J4ik3DNk6yKXO622ZWcYeDOJBm0NCMwOLOpQZKirEd1ncPyBObLxqFvgoC4p7iRgxwtsbHBBDBmdG2YBTqbU/j0MhJBTCkKohBXbGVyqTkJ+WJfKGvgqMsZXvH6V5ZIXueOsZS1ATmYd0l7j1wV/HZ+7W3c3JW8eDiPYRs3DrWu/1/e17g3dE7qIXzpR5VvWzxP/794THBkKI/K68hoQOVsfiOjh/k9ZWihlPCb/d24e1xqiWcOYDI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65zOba1Go4UkXf4nl4lRvSYjNqYKLo2d/nxL4CbGz60=;
 b=1X3419D8MkAGNlw2MZMyNYmRzIuXQISsmwwSu0fCT13Z20LCePRW4XTwvH2zhbbdwpF89TyMgb/2hcMKKMIlgO6SbhOR2hnhSqprWr43F7QyKyGzi17uPamV0RhFSXupYy3jFgKiq7J/c0uH1uDZyE9J8s9YX0X5gKbgGlM4kKM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v6 0/3] xen: SR-IOV fixes
Date: Fri, 18 Oct 2024 16:39:07 -0400
Message-ID: <20241018203913.1162962-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|MW6PR12MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: 03acee0d-8a06-4cd0-5a66-08dcefb4efc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XkiNwZt9+rNfr0/LkFssOQpgWsThmuvw2UIEcqIwUKX9xfCNvqR1Q1WkEZhP?=
 =?us-ascii?Q?PrnsAt6XlYrb5Fu4bI7AE0WVqWsxoFoeISFCIca4+By7XMbJJcC4HdKxHUOs?=
 =?us-ascii?Q?MIVhZRITBXRHg2jQjGNsCDB9fngl8bQiZHx1VULGqVnkIlyb8IczhCHbsDI/?=
 =?us-ascii?Q?8d9nv+rdjEGN1CR4bVCCN7gsmpt953DsRI6qiG95VsTK7XRQKc0+QB7IH5Lr?=
 =?us-ascii?Q?wPQ2v4dTxzdhO2e1W2sw50qZ+HYauKsroaUpsqZQnvwibOoHiC3U/aUzJxWH?=
 =?us-ascii?Q?+s05o5Fb2BvmkHREpmVst2elNZyYj72/WETxtK4LL+j6dUkKifAm2WOmGbwD?=
 =?us-ascii?Q?5bji2vrK4+QNgCfBj8wrV7s8wwQQ8QFwjvrLLWorgMCLc/FVcmKUtiYqvslD?=
 =?us-ascii?Q?DTSvC/2j2R1R5UENXyONYlYMNNYexbffoOVuMBqPuk/b0FUQJDG+PsTp83BQ?=
 =?us-ascii?Q?G5SXAHjlYLZN03bGqeTMuKf7g/3ilsjTXBxyJoXc15BcNs5eeiRu+JgltCso?=
 =?us-ascii?Q?QyshdVzOdEJuapcHmKAlPocw5BkmudQxWk1iAyE7dqH/RcusxCX3Q6aRPMhH?=
 =?us-ascii?Q?grisIarUNld7odIbvGIZmKJr5fgeYteMOhoHVKhRsw/81f5SzIlXQqZ01Wh4?=
 =?us-ascii?Q?IhhjcUujGNfgspa3yZ6QrwqcVqe4neh6FfvrpVBFzVzcCvUO52yPPgcoDsL7?=
 =?us-ascii?Q?cEHCP3YaUPW+SZa6KL4ytP4ci6fXIqitYwXHPj0jg6+wFwrJuTzwSe0H/PGy?=
 =?us-ascii?Q?YNobY5lv1SoNja031n2IN0Ie8Z0D48nqS8aqyPjyb2WR9adzYLb5Cz0NOK8Y?=
 =?us-ascii?Q?pmncaRzRZ90kQkiAe8d98+QllP/SM0GjSfE1vFbSgHw4gfxEr62yk5x/lnMm?=
 =?us-ascii?Q?iKE2rz9v+EvbAQHHpP/f9Jm1QbqkGrKA3ZCKcaTkRcIf09Jf2hXNxnpzjxp7?=
 =?us-ascii?Q?BsNB+SQSQk63hO0fVqM1PWpF5FPHSlS8H9KEkiALV62UpH8EMKGlEJE88Lvp?=
 =?us-ascii?Q?8Mzf6jblxIZHOS7p7zpDTa3qrcz+wtJAU1YVvc+L4lUbm+l2qraSBNlxTury?=
 =?us-ascii?Q?che0U2H2cURz4+fG9LdUGnsccXojkHnwNUlmsp1qc+gMguhNrU7xp7CXXK2r?=
 =?us-ascii?Q?G6ksBicyGGeCBsTUkZBS41nXxg9/y3w7L5g4AfhFnJYERWNU67QXGYjz+Lp7?=
 =?us-ascii?Q?4pAff+lmC/VqtIlw6DNH9zF3p+fey3DqRrXqzWxQlUzgvnFGaADcCpLWMbUB?=
 =?us-ascii?Q?occHbsj4YEy7LDNVVRhBV8mmYX5mHcItpgZqClDD4MU3q5ZSsLxEqWS09dyM?=
 =?us-ascii?Q?rm4lLb7uUaQ8dk/eugMWpiVJ4TZZEcOF5h/RZthUkbANLLl8pJPSw2xfCthC?=
 =?us-ascii?Q?amiySABthAIFzg3Y9HctdnHzgIBOXEtw4t6gmBzzik+E3QqTFg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 20:39:17.3939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03acee0d-8a06-4cd0-5a66-08dcefb4efc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7086

A fix for handling of stale pdevs, and a fix for a regressiong related
to a locking change.

Stewart Hildebrand (3):
  x86/msi: harden stale pdev handling
  xen/pci: introduce PF<->VF links
  x86/msi: fix locking for SR-IOV devices

 xen/arch/x86/msi.c            | 56 +++++++++++++----------
 xen/drivers/passthrough/msi.c |  3 ++
 xen/drivers/passthrough/pci.c | 84 ++++++++++++++++++++++++++++-------
 xen/drivers/vpci/msi.c        |  2 +-
 xen/drivers/vpci/msix.c       |  2 +-
 xen/include/xen/pci.h         | 20 ++++++++-
 6 files changed, 123 insertions(+), 44 deletions(-)


base-commit: 4c21b6affb4c5a3afe22cbc144362091de063366
-- 
2.47.0


