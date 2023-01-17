Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6368566DCC5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 12:44:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479340.743133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkNU-0007CQ-2G; Tue, 17 Jan 2023 11:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479340.743133; Tue, 17 Jan 2023 11:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkNT-0007Ae-RU; Tue, 17 Jan 2023 11:43:43 +0000
Received: by outflank-mailman (input) for mailman id 479340;
 Tue, 17 Jan 2023 11:43:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwid=5O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHkNR-0007AO-OE
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 11:43:42 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ec3cec6-965c-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 12:43:39 +0100 (CET)
Received: from BN9PR03CA0313.namprd03.prod.outlook.com (2603:10b6:408:112::18)
 by IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 11:43:36 +0000
Received: from BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::8e) by BN9PR03CA0313.outlook.office365.com
 (2603:10b6:408:112::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 11:43:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT046.mail.protection.outlook.com (10.13.177.127) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 11:43:35 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 05:43:35 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 03:43:35 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 05:43:34 -0600
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
X-Inumbo-ID: 2ec3cec6-965c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFNQG5vjTqgO+K6gzvk4yxzZej2wPLDh4t3HoiN8BmkBCNjQsVeGDZJfYPZ08A1YB6FcPAkPV0FamN151YHzCORuUU8Jswu1IzPg2q0XCXxdt4QKtaTTwYKataKZhrkSezJeFvNS4yKBlTLQMWfD0SKf4cqnmEKHBSZR7Jb1fxhS/9BIj7vs3jVCcwXWma9kRDO16Mv/SBIUsXcSOc37WWM2mtovVkzhL2t/kotw+qTl4YOUI5QQlvsA/rRYEXSQB5vcgkVlggd4ptv5Cr+L7AePnMKyhDO7uCtAYhRf3Vqb2Q2+0ebuoWdaHFX7oh9LxQ0/sqNebtrZJBKfN1P5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jf6nKNHLvOErBL72flx6M70+gIIF/nfl192wzeKo9EE=;
 b=IGlhrBR1nCtJ6c7gk1IGU1vUFD58g/5E2OIPX2Dl5Z9VbRZJz/ckmxZRFrjdi/RWXu8BKsJldxrmXpC/I57fbJJxaoGSx/XzC7YRc8zj7fbGgJ0x/w2fl52mYPsYenp1rjWm8ISDLvYeBaAhSLekf85VCFkKGEEfnCKURn6FDsjjDxwvUrWDvqCmG2f3Y+phBHrhvzzUshOSD5ToRyCOybES/o6bR2PHQNwBjYzodXbZSCaYSfkxLJ77trQAckyT5XsRmhUEkAfnEkfvndF2kpcnTQo9vZBD7EWZa7T1LMzuB1eqIj1sdPwoayU4ahrhsSPAFUdsxh2A9ulRTul77w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jf6nKNHLvOErBL72flx6M70+gIIF/nfl192wzeKo9EE=;
 b=aFO07387uofMwM688gR3X0nP6vCgLkI6CEtdduUhXDhl7V2pxeoulchKz52FOHzg0R2utCeN0OKgCRdmXpZBTnKUdoJIjOsYpBQ2u14xPZai6ZilWaeRJSv7gttkAb7sBd+wFMWkzeaVb4yKkCqHuKxjepglbkohIpY59F7nS04=
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
Subject: [PATCH v2 0/3] xen/arm: Frametable hardening and config.h cleanup
Date: Tue, 17 Jan 2023 12:43:29 +0100
Message-ID: <20230117114332.25863-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT046:EE_|IA1PR12MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad1f196-4852-45f6-00e6-08daf880117e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+mbqyj2KqGwgGPNONFO2Xwvd7Y4NNFf+WOND1FJPLPqr8uQ5Gt8KxRFSmZuaVFVY7D99qri2VpkNxyyrTMJdNRIkOUip4g4TyKxp/mgvlaBr+uNmYBglzioPPyBiVNfLqDQyLJUwh3FksjGG4+v1gvYdunycfAY/Tlb2fltRqKl2Xe63I2YZPXmQ4yHi4okIHv5K+VdjB4FyD17dbhK/aKewAOVwI28GcP+c4n3l/5T0qpEJ/Q7Sh4KZZM3pB+2f3PUnt900oOm3T+xe0vhJRHgEisBMzWcgfHJGyFQ0a61FPjRgZ6G/wYIvOo5L8FBKCb+A7z3Lg8TBxyfjTm1/FKaavkkWXPrB3RXiBttNITj44TQiCaCLL8Ap2YPZYwcQFegy5632/b40jaQrEBUNAjbdQarHV+QOPMPFIDqJb+mDLfj2/lg26IkfSrH82O22ByJSMfquWx/bRfIpMlk51laSXtjM04k7EgV5AV5u5bkT/eFQ254QU7v70gg1GJ/6NRDMvJjnZhat9iwOYgy+gCM8XmwLMdg5E6bgPFk4EtneaOfgCdXe0v54/BuUFgmzFNbKCcdsEupWOJYAwrDs3sbI3TTkosY4SvosIQL4pJmq++0ltA8PLIz1mCdo+Fpa3M/jlXg9UNb4O2fF8qOcL0wOTST2qluU/B3K9rGAPni8e1nCBJZdplxRGdt1ec1uq3keKhfckc6KCyTpUgxtfDpEEdAQTb8uWVJNz8/4Gsk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(2616005)(41300700001)(70586007)(186003)(70206006)(47076005)(426003)(8676002)(6916009)(4326008)(26005)(82310400005)(36756003)(86362001)(336012)(36860700001)(82740400003)(5660300002)(1076003)(8936002)(54906003)(478600001)(4744005)(40480700001)(316002)(83380400001)(356005)(6666004)(2906002)(81166007)(44832011)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 11:43:35.8538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad1f196-4852-45f6-00e6-08daf880117e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6604

The first patch fixes a bug due to incorrect DIRECTMAP_SIZE calculation.

The second patch removes unused macro FRAMETABLE_VIRT_END.

The third patch hardens the setup_frametable_mappings by adding a sanity check
for the size of struct page_info and calling panic if the calculate size of
the frametable exceeds the limit.

Sent together for ease of merging.

Michal Orzel (3):
  xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
  xen/arm32: Remove unused macro FRAMETABLE_VIRT_END
  xen/arm: Harden setup_frametable_mappings

 xen/arch/arm/include/asm/config.h |  7 +++----
 xen/arch/arm/include/asm/mm.h     | 11 +++++++++++
 xen/arch/arm/mm.c                 |  6 ++++++
 3 files changed, 20 insertions(+), 4 deletions(-)

-- 
2.25.1


