Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B80246C479E
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 11:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513300.794127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevjE-0008Kx-9X; Wed, 22 Mar 2023 10:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513300.794127; Wed, 22 Mar 2023 10:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevjE-0008IE-5Z; Wed, 22 Mar 2023 10:30:00 +0000
Received: by outflank-mailman (input) for mailman id 513300;
 Wed, 22 Mar 2023 10:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sCgZ=7O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pevjC-0008I3-DI
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 10:29:58 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a6a373a-c89c-11ed-b464-930f4c7d94ae;
 Wed, 22 Mar 2023 11:29:52 +0100 (CET)
Received: from DM6PR07CA0127.namprd07.prod.outlook.com (2603:10b6:5:330::28)
 by DS0PR12MB8293.namprd12.prod.outlook.com (2603:10b6:8:f3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Wed, 22 Mar 2023 10:29:49 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:330:cafe::1f) by DM6PR07CA0127.outlook.office365.com
 (2603:10b6:5:330::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 10:29:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 10:29:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Mar
 2023 05:29:48 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 22 Mar 2023 05:29:46 -0500
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
X-Inumbo-ID: 7a6a373a-c89c-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZEE3TZRbqKrLhD43ZOdsHi6sQjHyS3lUgrs+WSjvTKylSvv4/lSP547eupnZdLdT1LOxtFgXymncKcmORhXJCzni04hTABw6yFc9uy4BVe/OwDPkphWBx+KOECHheVSyUfquSeeRWk6b+G6rnc3D9Hjtajr20Ndw0BqjEzn6dfxR7PmI9oN5Ida9ZdIZY3CcL9M/r5jPeq1iW3BEG/lN6gTNOFUmTHpwAvgnARfvcb5MXIcUS8IgKG9wb5B0/O9SjmmQtz9bxLjs53t9GtnolEiG6Wary09R2+SD5ICgQmMnMccWZV4/eFwEck3yx9U0tBV8tEJiB9Lx6jErKf0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geeri5RwCrMY4nv1/XjOI2ltQG1beTkPXWCp+aaMm7k=;
 b=GQVEMBFJkcDvtnksKLgAXKAs5z1zGnfRK7+g6jvQKBFTAkqsxjjPFGS/bUI+Z2ZmQ4GWNeefcamu/XAG9NCYosbiq4eRqLCS6/nieFzpMzIZKkWJyFIxzWUBNKOUsu43DNffZihVoDnSvfLMZmc70WEpmdjuUJ5N8Sh5kWQg2b4OZlTOngza8aoAYEdftMEoQmcaHRDxOMuBNdIGb+LeS5Nn2WJg1Y31o9HWKmCYUtPehHv7kf09gEb/7HPNd95MutegcnMK6z1HH6ZgJ3VQipoX8BtRb99O7rbVm22i2O2JbWN4TpjCEr2lVbKTfdOkG+RPTvWtNl2HHwqvjLPssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geeri5RwCrMY4nv1/XjOI2ltQG1beTkPXWCp+aaMm7k=;
 b=C6l2S3WQErTQSLisQh1yIumu780UDGLE2/Rsf9VKtlPMIVIU+OterB7BgUo5uBnA471x8zH457RXDohsj+XyZW+7EPMbcYP9mjLD2wBbNRBDAFlydYoLqsBXqGD0BpKtNVgtFhVFWsB4CFON5OBhYF1NDOB/JxRG2INpdyF4yIQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] xen/arm: fixes around domain_vpl011_init
Date: Wed, 22 Mar 2023 11:29:39 +0100
Message-ID: <20230322102941.959-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT040:EE_|DS0PR12MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 447f019d-7404-4102-9e7f-08db2ac05d34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+WEdu96VNyfSP2fTd8zgW3QRS+os8t7rBrn7BDdUnqTZO2WuokvLirl67gepbBQsE5Y+kFPlmE31CmW7R/q6lsrQKyfSGOmDVIAOSNyubSf2Htxs0grL8YCtyohYtJoip86ydqFRZdfB+D0qWkZCyTB+5eBYzQ3My3tgtxuKHO+xZE6VlnOU1vdSlezsQongs/qj6iBtvozbr20SvTg08Z0nZIXuI8I7GplqyWwe2TDSHtNVY2nI5RiEMnVifTYWDzU3qq9pFJTabw6zONO4v2rQpw4OUrAkawKU+3K23mg37+nO5XV4UwH5lCcrcrVBXa16JaRwvQm0WZUUFayXpRdJXkDz5QQqtkdMI+CRFw6wPl6lvY5UatxecS/24uGAVf77KpT5P9RO0Vd8jhiK2zaEaAZm+SUF1NsTXqUgQo29bUOZklXmEYC4Urodtd08T9TC3Ls7M6oTeD1B7zpIHj/0kIFYi3EJASlDZL5yy44otPfiGb3QzcE2OYxCQqEgwVoR2U7giFR8jIoDskENHHUc7xu/GRomGh1DzdbyBukRckzLgODxA7vlY/BGvni+SR+9JqmxGDyrCqZxSBSQRyxOKTEcy1VJMtK/xu+9MXxCmM88NCR3/FAWxpZgYGiyxU0n56/hIWJQPhuvMWVnTz7xhv9AkMiGNGtzg3VeMKhLqFgTPvnkpUa1vLZVCnYDd4qDQJmKcV0SWd+qvGQORc1rLVVipohZsvjXT5JCB1M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199018)(40470700004)(36840700001)(46966006)(82310400005)(47076005)(83380400001)(2616005)(426003)(81166007)(44832011)(36860700001)(336012)(356005)(40460700003)(86362001)(36756003)(41300700001)(40480700001)(8676002)(5660300002)(4326008)(2906002)(82740400003)(70586007)(8936002)(6916009)(70206006)(26005)(4744005)(186003)(54906003)(1076003)(316002)(478600001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 10:29:48.7311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 447f019d-7404-4102-9e7f-08db2ac05d34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8293

This series contains two trivial fixes around domain_vpl011_init().

Michal Orzel (2):
  xen/arm: domain_build: Check return code of domain_vpl011_init
  xen/arm: vpl011: Fix domain_vpl011_init error path

 xen/arch/arm/domain_build.c |  4 ++++
 xen/arch/arm/vpl011.c       | 11 +++++++----
 2 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.25.1


