Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CFF5E63DF
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 15:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410151.653151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMS5-000444-8T; Thu, 22 Sep 2022 13:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410151.653151; Thu, 22 Sep 2022 13:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMS5-00041T-5b; Thu, 22 Sep 2022 13:41:17 +0000
Received: by outflank-mailman (input) for mailman id 410151;
 Thu, 22 Sep 2022 13:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiOI=ZZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obMS2-00041N-Uo
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 13:41:15 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36f141c6-3a7c-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 15:41:09 +0200 (CEST)
Received: from BN0PR08CA0016.namprd08.prod.outlook.com (2603:10b6:408:142::35)
 by MN0PR12MB5835.namprd12.prod.outlook.com (2603:10b6:208:37a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Thu, 22 Sep
 2022 13:41:10 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::f9) by BN0PR08CA0016.outlook.office365.com
 (2603:10b6:408:142::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18 via Frontend
 Transport; Thu, 22 Sep 2022 13:41:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:41:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:09 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 22 Sep 2022 08:41:08 -0500
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
X-Inumbo-ID: 36f141c6-3a7c-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qf8UInUFkFmz86Dh6WSyuRFs+lOmcFz9DD2ahht6V/opJ9sY0Ng95R/crWSSrgjkQpAohFVwG6dg0A2mMonrhK0deJRJDNDtV3nxdh0Yi+XvKXjZDmtffUpJ53R7n/mdDsLTBJqlaDk/liOGiI8lx70y+iBHaMnOEEQ0493s9ikRjCVDxMQel2Nh6Md4cIu8sApw+C1V5ynmvO7dYaf0eUPcqy3NrOmYZjzl3lwhTH6mTGJB3EKLDIoeesTOw13VPjO+Ydt4rK3TNrDDQbjaGJc5/Pu1Mp35Y302eWqT7JwWZm4lPr9SqM+4wzytALUERe+bhPwOKjl+qZHP7u9GjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFd5gtYuyRgdB3UriWvj7k5JYO7DhSPqJ01SrsP14FU=;
 b=AgDhbQQjYGxam7fOz42M87syfgdwrbOf2mkUE/swE+O1eSyj83jiv1bq/HQ/6gO/vM0+6TL39RA0D9WWte/MkKn8tPJL2nDCuSil7Sx9z9PwjAAQoPaPX/Nrz0MRvkUw/i6Eom2rAEVsmfk42N2PN5lQ3DzwKwm9VW/Kn5qxA+J2VQfPnSRvjs54hpsAw43hpAJ7Mi0fHjAf6L9YpaUnVBnhY2gXEeDSkWhmnUKA8snsKVpZLI7yy5gkCKwP0SebRQRGHOKpEHZgLqrRwCZ67NxYUIYxf33fuqtUZ0jA4y4vV2bOn59VVGBoIb5ZBM+TToLmWPXSPnmpEqDkBz6ztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFd5gtYuyRgdB3UriWvj7k5JYO7DhSPqJ01SrsP14FU=;
 b=jhC3sYkUNGVag5imYeP5G30TbfeY3QwAmBFXI5vN9bOJmZDyLRdWyEeSRAKlACzJVfCoIre/umltDmXJLfNfNPXJDqG+mGuYQ47TyLjwRm+mstwSex/PaIXSKcItuXt8U4EJNZOmo9E06zTaCCCgXSg3jFM0RqUAIZoviv16cec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 0/9] GitLab CI cleanup & improvements for Arm
Date: Thu, 22 Sep 2022 15:40:49 +0200
Message-ID: <20220922134058.1410-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT013:EE_|MN0PR12MB5835:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b6bce6-fa0f-47f5-ce80-08da9ca01ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ASM88PlnmzkmxM+DDJ6kinykIEWtvlL8KECacYZNE/o4YT+KzgNC6wzfOFJYgBL730JsDYO0/5/TfG+Z/sl2U+x6Kh1i6Lym2FM8R7YFgeKFHhSR1HCFTQ7dA5qm4G9r4/l/3u6XONRPK6x3D3In7L0qhkfVbjM3eHqpOh45h/wjpkwiN0O619hI6DFYfZrZ56r96Y13y0NprHmI68lM8MTrUoln6zSWjPWfCKvFFgD0HF1XKWnVX/efyzsBZ8rCjOjh55aw2CJsH/PDHdARDmf102/ggPRF3tuyclBBjzY9o+JY1EEl+QHbRbmtxPaJA1ooEuHR6hpDS8Cv48Ak3WlL2ajk7eGAqG83Uh8Ge0ph5iccOcndBW0fFgl9wim3SzXUm7Pt3IRv9KjbMvDGlWixO+j3uMbafH0ghBf9hkDCQiWbbAy3cvw0hKCiOucUsm/C85sUXRjXX9DKrBPdvM2YA4l52Psc6d21y9+cqL1kInhp/gFZ/bp00Cuvu7sKAjzrekazmYeI0AgaNfoRype2MReisHH4+o8J+qBp44yMd7mLl6bgI4RiO6a8pUJqzdn8l027NHe+DV69CEmSBfYfROnWUNM1M7CfP0Rh0n1GEc25HmHdtskTxV0DFT1qV02ulgG+Nj3IdhJA9FpaSfE1Zp9X+82wNOAz6wMGxSTX7bCOU7RpbJLjo4O8TEgJaBgmdapHM7KvH/D7aSLpza3SBCNibd719BmmYTyLK5PjXFcouJ8Pg4zTNpAKJUMvzEutAmdYuzfOWn2BMu50HG0RWTSi1DxRN63/jIQiFifgeGJ9ibO5H7Smi+6i9USt
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(81166007)(86362001)(83380400001)(356005)(36756003)(36860700001)(70586007)(41300700001)(70206006)(2616005)(82310400005)(40460700003)(2906002)(40480700001)(82740400003)(336012)(186003)(47076005)(26005)(426003)(478600001)(6666004)(1076003)(8936002)(316002)(44832011)(54906003)(6916009)(4326008)(8676002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:41:09.8469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b6bce6-fa0f-47f5-ce80-08da9ca01ba8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5835

This patch series performs necessary cleanup and improvements in our
GitLab CI automation for Arm. This is crucial so that in the future
we can focus on adding new tests instead of spending time to fix
issues, making the behavior consistent, removing ambiguity, etc.

With the increased interest in gitlab-ci and using it locally, there
is still some work to do mainly to improve documentation. This however,
will be handled in the future series.

Michal Orzel (9):
  automation: Use custom build jobs when extra config options are needed
  automation: Add randconfig build jobs for arm64 alpine container
  automation: Add debug versions of Arm tests
  automation: Add Arm containers to containerize script
  automation: qemu-smoke-arm32.sh: Modify script to use ImageBuilder
  automation: qemu-alpine-arm64: Cleanup and fixes
  automation: Rename qemu-smoke-arm64.sh to qemu-smoke-dom0less-arm64.sh
  automation: Rename qemu-alpine-arm64.sh to qemu-smoke-dom0-arm64.sh
  automation: Rename qemu-smoke-arm32.sh to qemu-smoke-dom0-arm32.sh

 automation/gitlab-ci/build.yaml               |  43 +++++++
 automation/gitlab-ci/test.yaml                | 117 ++++++++++++++++--
 automation/scripts/build                      |   8 +-
 automation/scripts/containerize               |   3 +
 ...moke-arm32.sh => qemu-smoke-dom0-arm32.sh} |  57 ++++-----
 ...pine-arm64.sh => qemu-smoke-dom0-arm64.sh} |  14 +--
 ...-arm64.sh => qemu-smoke-dom0less-arm64.sh} |   6 +-
 7 files changed, 190 insertions(+), 58 deletions(-)
 rename automation/scripts/{qemu-smoke-arm32.sh => qemu-smoke-dom0-arm32.sh} (55%)
 rename automation/scripts/{qemu-alpine-arm64.sh => qemu-smoke-dom0-arm64.sh} (88%)
 rename automation/scripts/{qemu-smoke-arm64.sh => qemu-smoke-dom0less-arm64.sh} (97%)

-- 
2.25.1


