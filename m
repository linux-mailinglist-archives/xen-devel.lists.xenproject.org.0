Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC87C694621
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 13:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494413.764458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYCd-0006N1-5X; Mon, 13 Feb 2023 12:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494413.764458; Mon, 13 Feb 2023 12:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYCd-0006LN-1P; Mon, 13 Feb 2023 12:45:03 +0000
Received: by outflank-mailman (input) for mailman id 494413;
 Mon, 13 Feb 2023 12:45:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLJL=6J=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pRYCb-0006LH-Lr
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 12:45:01 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37608525-ab9c-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 13:44:56 +0100 (CET)
Received: from BL6PEPF00013E12.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:16) by CH0PR12MB5089.namprd12.prod.outlook.com
 (2603:10b6:610:bc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 12:44:52 +0000
Received: from BL02EPF000108EB.namprd05.prod.outlook.com
 (2a01:111:f403:f903::) by BL6PEPF00013E12.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28 via Frontend
 Transport; Mon, 13 Feb 2023 12:44:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000108EB.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.8 via Frontend Transport; Mon, 13 Feb 2023 12:44:51 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 13 Feb
 2023 06:44:51 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 13 Feb 2023 06:44:49 -0600
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
X-Inumbo-ID: 37608525-ab9c-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiX1bjzQpZZt4X7+1+AI7eEFiK3T7PxHR+4aLVa3I1z3o9kSIMeEFKNUEoxUQpkIol3OaS5HgeBRbFV9uD4WK0ggIgwXrfk6UVa42DmgWBfyEH8xTB314yyqTHOpWLp8MUFzPXAPishr8W7rfgDEJ6taTmRfTW9sKZi/Db0TpCbTnIop8Y0TGpZeTvaEWzEUDdksDGHYGNxdoD5VS3rvlH3HV7oFVvN5cPRW9O7HfvfkebvUS69jhej/34+DG9C7SFB3jrJL+XrqnTF1JIgBZPo1A930uueIPRSGOgh7C9ladM6iGOP590TxgFtjTCJ3raBCQIA+aBe1MUz+Bt58Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a89X8gZImurmuVKLyGhjWmjmcdOeuEuc/3vmxTUjv70=;
 b=izGXhDe6EH8N5NHQNQymGMgss0rPj9kg0cqmGP62pmDths9mlJ9UfHdNKaHeZsNY5uTOK6q3fGOcuKPTNFkMCVNBVgc/XJiMJyupQkp6gG1WCiftH57MDbBYoLXD5LTmLniHOMVk/wUIYl15e6HInBSY4t0rKP7RrDA+SO0pt7+J1W4jAibYxH2TgwMUg2Aw/nauqif+z6AeDtjEGLBfVwrWVjDCI0psBgkEXxPKFEn7rg0PKvdENYCPBlfW3Y1TSyxSDaKGy7ds37ERt5VztHUJEKsdEPoUPEBhdnwAeqNpJaXzXoXj3OPsagIeEEjnFNv1niD1+D5rQWFBQaz6Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a89X8gZImurmuVKLyGhjWmjmcdOeuEuc/3vmxTUjv70=;
 b=KhO9zWt6of52Jk2vJasPKYErk13rfK8IJYlF00GNL1zJ0YWcbQLQvjlyXrBfaRd5EroIziNOfshUUdfJu+ptB8N4+f8rkFxK/mcdSNhoeI3QUSCMlU3ok5fZgZeUpOWggsCI4B1MdMxS/IbXsGqQejNBOXfDgmxP7Hs4cib9dm4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>, <jgrall@amazon.com>,
	<stefano.stabellini@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v6 0/2] Pre-requisite fixes for supporting 32 bit physical address
Date: Mon, 13 Feb 2023 12:44:36 +0000
Message-ID: <20230213124438.14836-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108EB:EE_|CH0PR12MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dd1262f-2d9f-4e00-c9ae-08db0dc019a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2W8hz5ferBSPgRDhz7X8vIvKcHyRKLZ0umyeTWrH7bOFPvtQiv4lNDW95VT+yfldbcnhz6mLs4ajVIegSoOiSZyHmsIrt5g8GtMw5o01Sf2mWRA12qQeQSvyRps3sjHZJbM6ICYJHu+4bQ0FhlNqOm5lgRHaPP0aRJ9VsSu2pTGKW8ebiLDE1ly8iOlcNjlFyo61aGky+qx3esnd2O5X6QOldJTir4QFzbA8AZ3w4QYmaUCpzJMU2sdzwJ1WHRt5H84QBiqOF0qQdb5FMs3ok/8h5pSF+6q9XpNC+pby4VeQNqgSzxnmKfR07cd1tXX3vnzvGUCY0gvWfvcfYyozTvNR4xN1Z93HzMePJZmBIKK9SuTNMtCfxUR/atcea/d1iPZ/vez0uAqsmFZPzGPqPwRZ6qzQETek31FBBuqseJ+fGfqyqw/O16hPB0ZtjTv6AFjmNraFaIDlS2qUG4mYngDN53NBZUPuyixlsaSNnswxZYx9KZC3WO3yP26BbeCnCmG8lzIPzaJ88w1V+3KySvufpiHeQk8rcix0Qn8ljh1pc41CdULpSNomAcQUJ4lHQGyH+qO1lVNCOz9Jb06ImYBmUqlRKZuZ9sjwD28yt5mLfp/PwusGfCedUxL6Cu1ynZln/9gTKjCJhvjb1YI0uZ8GvtG0X9gHK83yUsMgMTMTaUgwaotkVNnlIzaFpC9ZYevp0l6oU9qgX7DG6bbFT4LKHsoVRPj5xye9IBnqhZlM0cSlGW1jg/P5nm0zlVUzSya1ygRPestDSuYRK2Cmhg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199018)(36840700001)(40470700004)(46966006)(103116003)(40460700003)(36756003)(86362001)(54906003)(316002)(8676002)(4326008)(1076003)(70586007)(83380400001)(6666004)(82310400005)(478600001)(2906002)(70206006)(6916009)(4744005)(41300700001)(8936002)(5660300002)(81166007)(356005)(82740400003)(36860700001)(40480700001)(2616005)(336012)(26005)(186003)(47076005)(426003)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 12:44:51.7896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd1262f-2d9f-4e00-c9ae-08db0dc019a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000108EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5089


Hi All,

These series include some patches and fixes identified during the review of
"[XEN v2 00/11] Add support for 32 bit physical address" and
"[XEN v3 0/9] Add support for 32 bit physical address".

Patch 1/2 : This has been reviewed and ack-ed. It needs to be committed before
any of the "[XEN v3 0/9]" patches are applied.

Patch 2/2 : This addresses an issue identified during the review of
"[XEN v3 4/9] xen/arm: Introduce a wrapper for dt_device_get_address() to handle paddr_t".

Ayan Kumar Halder (2):
  xen/arm: Use the correct format specifier
  xen/arm: domain_build: Use pfn start and end address for
    rangeset_{xxx}_range()

 xen/arch/arm/domain_build.c | 86 +++++++++++++++++++++++--------------
 xen/arch/arm/gic-v2.c       |  6 +--
 xen/arch/arm/mm.c           |  2 +-
 3 files changed, 57 insertions(+), 37 deletions(-)

-- 
2.17.1


