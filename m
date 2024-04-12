Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5E8A2653
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 08:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704380.1100777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvADM-0002VC-MC; Fri, 12 Apr 2024 06:16:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704380.1100777; Fri, 12 Apr 2024 06:16:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rvADM-0002SK-JQ; Fri, 12 Apr 2024 06:16:44 +0000
Received: by outflank-mailman (input) for mailman id 704380;
 Fri, 12 Apr 2024 06:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GVg8=LR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rvADL-0002SC-Sr
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 06:16:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a257d2e-f894-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 08:16:42 +0200 (CEST)
Received: from SJ0PR13CA0105.namprd13.prod.outlook.com (2603:10b6:a03:2c5::20)
 by PH7PR12MB5952.namprd12.prod.outlook.com (2603:10b6:510:1db::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 06:16:37 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::19) by SJ0PR13CA0105.outlook.office365.com
 (2603:10b6:a03:2c5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.11 via Frontend
 Transport; Fri, 12 Apr 2024 06:16:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Fri, 12 Apr 2024 06:16:36 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 12 Apr
 2024 01:16:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Apr
 2024 23:16:33 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Fri, 12 Apr 2024 01:16:31 -0500
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
X-Inumbo-ID: 3a257d2e-f894-11ee-b908-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJAQugKXQgf0BK/0tA4X6N4NdrU4HlyUkBEs8KNINZDAS6ciT0K527NtBQNgqHZOjSjtmkEZJaV/CesJ1KOzHiqWOtqTtOr60Nb96gKlOFg8pOiXNTqxexui+waEemcNTQYb8tQauJdexsxJAzVWuKpFdbYCStvo1/eNAaE24JGZ6npwkPTE+ZSWWHVxgy1TQNaPrMV2CSlfVP8uB5FHppm3wb5iNq9nTKf/GbjK5WJW2AELM2Dh24Jryal2W5nwGgqHNqgD9QL2uT+MqNE1YQjvDSL2jxS874Dg/ho52XLO77Ix5ydyHWgjroclW1cmRE/zacqkXqMeesEWrwRNfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+3XfYZYQg2+c9cQTWwxXInVfjdr3ix4C9ycK4SuBFM=;
 b=NL5QJ29BrPyEFsqZeosgGTvq75qU3GbjyZPec46cWy+TgWJRh24C3RtWBaLJzDVgFG9oqrGvrAPnSiAZWV5ZpGne8q4MPfEnA11gQ1IV+vvuenRe4K1eH5XxB3wKyEuTVWbXPK3/5SqQyeqICQLX580fnUZ4p6cTM49U3Y23t0BI5LHMkeFv93WAms1Ebcrv3+ZKQPXx/ufzRbLS13ysZMiEz3EBsQ+JcEqfk7wDMn9jFnTpE46qNh80fcLO06EOvgQIANK6X3PfrwaoP+UmmLHHTKybpRfJPqYi9RwnPASuBI14hA3bLp6kuqaIOVnGIc5qkDcs6S5o5kKmOGRXsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+3XfYZYQg2+c9cQTWwxXInVfjdr3ix4C9ycK4SuBFM=;
 b=Be17PjLyWNFkNIkzdzKUC/V875TUflROuR8SHAFzNex4HdVdZqzJvFh3Afdl8hyebOiPBlsOY5vbS5gCQk+O2FGZCf4fNUE+37ZDZ4iCD36A4kwx7F1RpTS5D+EO2WoN+vkmX4tmkxtNPBoR6HQGG/aniGzwggjcvLfGkCH+KFo=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] docs: arm: Update where Xen should be loaded in memory
Date: Fri, 12 Apr 2024 08:16:24 +0200
Message-ID: <20240412061624.3441-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|PH7PR12MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: aca5b59d-8057-43a0-bca8-08dc5ab81b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S1XaK3GhfbAu30JG4kuWmZZjzQ3ggQc+izpSSYRWqqrkhPOh2t8WYqGq7SgajIQ0HczmcDu/4e0brqFBG/dyVZCWOZVSbpXtWTX/6uizaA3Y5V3HoXvS/VTv+Ut21mhmQzw8jkxaHMrTs8onUbSSAuvu7tcsy5ZIzJJO3zkqgqMFT/OI76OIuwbvF2OxCRjZyEsPpcxKvuMvLp5hc1tZSbOfA/lB/GEnhrhhkJMtrmEr31u6NU97/EKD4jJqRjZprAAtmSpyjytNooU4q83F6xRlVP7zD3YO/qHfH+HHNfrM5fg4JLZnBtkOGRVmj9+zu6elZD7vopQPu6/AHSuEJycqunVKKuK5dFL9rDv7kW5QtGieldGzmEy4FEPQBnU57cF2V7DDDj16+pXpudf7nijGXjqkRmG//WTBDmSYkT4fbm2xu8gOHDp8zuLQCgzotU4essl7XanTFYanFv3cc66uEGBEws1OwescNDo+EwX2GELfqkD65Rq4ZOoblRfW4TJzNMV0Eb6j0URXcyWG4dP71lytif3GHYVFNJIg7Vfm982rjKuS3H0/a1OLwtF7uwyTYQiZ1TypEferIXJR6cEBQt2U2UYfGKceLp0sNZAZ6BoAWXgLg4mssLbRcyECzwQVq4AUEBOE1GWxW1lmUvSP7x7MSbOpBbfjggVreoblvXptQh2KaR6no/4NKvLSbiwm6lB1JQs/gnINjTsSeg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 06:16:36.0789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aca5b59d-8057-43a0-bca8-08dc5ab81b88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5952

Since commit 6cd046c501bc ("xen/arm: Enlarge identity map space to 10TB")
Xen can be loaded below 10 TiB. Update docs accordingly.

Take the opportunity to update stale links to Linux docs.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misc/arm/booting.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index 547f58a7d981..21ae74837dcc 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -23,7 +23,7 @@ The exceptions to this on 32-bit ARM are as follows:
 
 The exceptions to this on 64-bit ARM are as follows:
 
- Xen binary should be loaded in memory below 2 TiB.
+ Xen binary should be loaded in memory below 10 TiB.
 
 Booting Guests
 --------------
@@ -64,10 +64,10 @@ Xen relies on some settings the firmware has to configure in EL3 before starting
 
 
 [1] linux/Documentation/arm/booting.rst
-Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm/booting.rst
+Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm/booting.rst
 
 [2] linux/Documentation/arm64/booting.rst
-Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
+Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm64/booting.rst
 
 [3] legacy format header
 Latest version: https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
-- 
2.25.1


