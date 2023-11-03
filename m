Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DFA7E077C
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 18:35:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627286.978221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyy4N-0002rc-G5; Fri, 03 Nov 2023 17:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627286.978221; Fri, 03 Nov 2023 17:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyy4N-0002pC-BC; Fri, 03 Nov 2023 17:34:55 +0000
Received: by outflank-mailman (input) for mailman id 627286;
 Fri, 03 Nov 2023 17:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VrR1=GQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qyy4L-0002p1-Ta
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 17:34:54 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4889379f-7a6f-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 18:34:49 +0100 (CET)
Received: from CYXPR03CA0002.namprd03.prod.outlook.com (2603:10b6:930:d0::8)
 by CH2PR12MB4134.namprd12.prod.outlook.com (2603:10b6:610:a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Fri, 3 Nov
 2023 17:34:44 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:930:d0:cafe::73) by CYXPR03CA0002.outlook.office365.com
 (2603:10b6:930:d0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.22 via Frontend
 Transport; Fri, 3 Nov 2023 17:34:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.79) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 17:34:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 12:34:43 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via
 Frontend Transport; Fri, 3 Nov 2023 12:34:42 -0500
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
X-Inumbo-ID: 4889379f-7a6f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3DOQdTR/0clyh7Fl81FMACw1W1Y/2akwlHupgzHdn6pPfg3/QqKQ97Xq/h+ikvDEh1GEVSpV+b3fDgNODhql01aWXpXYLzYhZC/VqAmpT9M7QpBpO1QN6tnOSnuhMLlUtRi15jRSVYWdkDB/pMV56GLW/WCABqE/Rt2RX8S8eZK9+Dy/CL1S91eXhFYO8KxY8Z6QEd4YT76VnM04/PxojDtXA+Gps70ON7Msf3eli7/xFL9G2ZgbTLKUkc/LxqtcN5MbvEmEbqnJxOj68wyqUS+/7INwFToMe0nmc1I4YmMDiFT1pneJX67NRmRIXtpiqwMR4Szhov310Oy0j8mPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bnDYIsJDNzdWK1B6E7XtLTwREV5ouPUxVLKOnssY218=;
 b=jornZWkHNTMfQ9nOMH8sRY5C47tGwzdf32u9qfPVJ+3NNsWu2yH4FHBccH9Hn8mS1MHAcMIzLhOOIh9BDfISTXPO5TiRXERxrpqcsqJS29LMzQpUEQsmuuqpwtZfo58RcuSa9wYa3MwHAKPK6ycIA7dCKAZt6H4qV02omx24H1cWnqHxI6eO6v0KqCEa5hUu37vW14TANwdDv5vl12BaRyeDJge/2R3oEsOrerixIPnqT/iv675+VoBIj3zsvOmYGjPbKkTGqrgU5UV5P0AKvwiu8duzNT64AwfDQMgAJCVSCEVlbFAftjecvW9Op2I6V/VjXh6UZT8j1sryNvNh/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bnDYIsJDNzdWK1B6E7XtLTwREV5ouPUxVLKOnssY218=;
 b=k32vNVqBj+V3OPHAq1lO8jMANJzsM1UoFmO5Kytivjdr/PcFSmB00S/E2fqq+BoGqq0Q99l17OlTcrpCPPyk3BUxGlyZrugwAmq85T6gNUGdV09+iIaATMfE6WR+3RE8vxPOCwbcUFXyfeTpWhQIb+OzFk6eUz81Dhh2L4DOos0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@arm.com>, <henry.wang@arm.com>, <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v2 0/2] xen/arm: Split MMU code as the prepration of MPU work form Arm32
Date: Fri, 3 Nov 2023 17:34:34 +0000
Message-ID: <20231103173436.3912488-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|CH2PR12MB4134:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e9422f-0989-4341-c85d-08dbdc932ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ipFe16kY0TbWMvLiuLLN4m4oZedeog+buWfiGp/8PlE1fENGHYkSCAF2HPtjP8QgG5JXm92g11kKm14uRb0vSfc/vCD2UqNUaBLC5qhFeLk8BmEPrFXe8G4YNndV9sr+8RpCM7jU2SFAsPgeLN/jgIdOJZBwykCW4DF2NuzKk4bh77hi9EmI1nVwwjVIZat6x9LAGciewjrUp7HmhpGqWVvd8i7djS3EhAd15rCG2kJyL2Hf83PVHExUzMPwaggqQ0W+5+ijo35XREbfvJM+OpUu7bsKmkQE4mvqkGJJIYbO7/TMJvN/QC4jgVF3YLajmR1TFXpH8abrtPDu+5zk2X2cTcO995wpP8IrpKogpaifjazLmAts+gU/396ke3e/QlssTW8oPdUGYHOuUbWSRkwGR2XDLCC6qemXOaj42UyRYttoYCNfide+ndIHB/EB68w8pkcyOB+h8xl4EYwwBnw7hW3VuSCfD0uGTfr4AHsDSy7wS1Nu/axVZl9pg/Zp4jm/gTWDUk9ibGBvHRTUccI900QDzIDhIuqEf/Oo1BOz+yy9ZyN/LAhEdHPoiTS+IUW7V1vvN5GHOv9l/sDZFstpf78LgWuscIILUqp2y6hDm7hdYVUyM9zbhIxo+xA4CGKZCUMdFzBO6UDB6FGfk54ScI7b9W+CcVSmpMQJdkjDM//vXkisS0xjnlAaq9Pd34FhJmDXmH3Jd+wOynFZwuA8shb+cAc5LNgVIUc3ua+Vyh77OTTT1cwU/7e4nR0vbuu386fRicPwy9kvij590tSD7mEFn9lAwJNxtTu2Fw8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(451199024)(1800799009)(64100799003)(82310400011)(186009)(36840700001)(46966006)(40470700004)(103116003)(36860700001)(47076005)(83380400001)(336012)(26005)(2616005)(6666004)(86362001)(36756003)(81166007)(356005)(82740400003)(426003)(1076003)(40480700001)(966005)(40460700003)(478600001)(8676002)(6916009)(54906003)(316002)(4326008)(41300700001)(5660300002)(2906002)(8936002)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 17:34:43.8002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e9422f-0989-4341-c85d-08dbdc932ac7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4134

Hi,

These are the set of patches based on top of
"[PATCH v8 0/8] xen/arm: Split MMU code as the prepration of MPU work".
This is the preparation work to add MPU support on Arm32.

There are two more dependencies for this series :-

1. "[XEN v1 1/4] xen/arm: arm32: Move pt_enforce_wxn() so that it can be bundled with other MMU functionality"
is merged into "[PATCH v8 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S"
as per the discussion on [1].

2. "[XEN v4] xen/arm32: head: Replace load_paddr with adr_l when they are equivalent"

Julien, I see that you have submitted "[PATCH 0/2] xen/arm32: Improve logging during early boot" [2].
Let me know if you want to reorder this series or base your series on top of mine.

[1] - https://lore.kernel.org/all/f098a07d-fa19-4b40-bfac-7b121524382a@xen.org/#t
[2] - https://lore.kernel.org/all/20231101233011.83098-3-julien@xen.org/T/

Changes from :-

v1 - Dropped "[XEN v1 1/4] xen/arm: arm32: Move pt_enforce_wxn() so that it can be bundled with other MMU functionality"
and "[XEN v1 4/4] xen/arm: traps.c: Enclose VMSA specific registers within CONFIG_MMU".

Ayan Kumar Halder (2):
  xen/arm32: head: Introduce enable_{boot,secondary}_cpu_mm()
  xen/arm32: head Split and move MMU-specific head.S to mmu/head.S

 xen/arch/arm/arm32/head.S               | 566 +-----------------------
 xen/arch/arm/arm32/mmu/Makefile         |   1 +
 xen/arch/arm/arm32/mmu/head.S           | 559 +++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/macros.h |  57 +++
 4 files changed, 622 insertions(+), 561 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mmu/head.S

-- 
2.25.1


