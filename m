Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0369862F3F8
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 12:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445620.700898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovzpg-0001ZX-4G; Fri, 18 Nov 2022 11:46:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445620.700898; Fri, 18 Nov 2022 11:46:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovzpg-0001XF-00; Fri, 18 Nov 2022 11:46:56 +0000
Received: by outflank-mailman (input) for mailman id 445620;
 Fri, 18 Nov 2022 11:46:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovzpe-0000h4-9v
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 11:46:54 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20602.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac8b951a-6736-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 12:46:45 +0100 (CET)
Received: from BN0PR04CA0173.namprd04.prod.outlook.com (2603:10b6:408:eb::28)
 by DM8PR12MB5414.namprd12.prod.outlook.com (2603:10b6:8:3e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 11:46:47 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::d4) by BN0PR04CA0173.outlook.office365.com
 (2603:10b6:408:eb::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 11:46:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 11:46:47 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 05:46:45 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 03:46:36 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 18 Nov 2022 05:46:35 -0600
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
X-Inumbo-ID: ac8b951a-6736-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhpX5Q3hHPKSqTwefrWXTlpxiQc2JzLbfZsC3cLyVMPJCS/dT9DlVGaEH1+nRykMNI/Kef1mULbiCrbxL6vVZQCJ7fNJ6a7oWJLSzIIVcain9yxtWXh7VJYg7TQy7iUqGZ6N5L5Ebm/Sk2sNJ29mDBC4/TlIU8sion4dPM7m5roebZeMnbibnbjM3Wq+fwdNHRjMeBjm9smhR1buT8sRdOblk3TAHrKW4AtjLQ1dBY4JG8fdkYQuUkjpkCIvIGRvhipVn/uo0D3tCYHfWbyDEiXw+L76rNatVe7C5TdPTfJiTgGSq5LyjkfjkZpHuwXBtMQeKhsGe4hn/DJBCAxD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9KnuJkP21+QZx681R7RotNsZmP72uq/NRP3ENsO2ho=;
 b=NVrIUG5Hx+3EoAN4UTrHf3Kn4Tn5zfYNdS1chYy1d7EMFqgKu44EQf+V43QF81svoyE/2CVd7hIspyfsTkR+O5+LL/xJ/W9dOuhOVLaJh1xeRbH3uxH2YzlPiEyD39BswYDxL/CtnkcA8jjlcblPySZdowvKoy+u5r/57GFq58jzK8PZtA47rWeXcP3NkuQG6h3DcHnNOMzs4ILzprmk71SzKgu0wNxQwDd7J8x9ER+NUZg8JJg7rCOK8WRZEu4BrU9Kkudc9HnbHOoRvUqsW0bZXo7gDDyxCInkPIBcYQofcShnlVsd3lqKx8fkaoUaLBNUkQmPnu9s+FReW1Vy8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9KnuJkP21+QZx681R7RotNsZmP72uq/NRP3ENsO2ho=;
 b=Vd5wOAAXos2Gnci50Wd/uO7IW3U7Wh1DICMzk1tjsWpBDP03d7urVRgDkWs4BfyFV1tK1zd486BTq18vkBYJuOuicAprsDiKZVyeeUCJL80p0jaxazDooHlgMCqysb3uxBnmo8YETzs/2CqDxMdDNJBAnGM3ayASXhYjsx4xdE0=
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
Subject: [PATCH 0/3] Early printk code cleanup
Date: Fri, 18 Nov 2022 12:46:15 +0100
Message-ID: <20221118114618.20754-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|DM8PR12MB5414:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d4718d-2f90-4b6e-a328-08dac95a92fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rtK2GVtnTxI9gpVodZngrKF1BghG6asdbTQx6m107WeGOu7+kOO2DQC9n8/of5NQyY8A5FsRL/fjgVo9ioGAH1Tp8w2wTLX2qsPP+aennpXkjf+VG1PVxcxA9v+fQe6ZUW75C0eyuddu0YdsukQzU/ZOV/uKOez9Ml4MsdeukNxvWfz371oZ4w3DTGLEgT4TguvKKIWxhbvvbNx3mvv/UHyhLfRphcjm0YbsJdg2+YEbcGSjIL3iYLD453OHrNELvaoJhW8WmLYJ3bNgq2UM8rCemqqnLZ45oAYwu+UV9w/WuiD5vHtEaOcU9HCTR3RbkozbCdWs/lTMmP6Igc8Dq+0KvHfkvD8wyWUFWSCZtTtND2nm49FjqohqsQPqxW/wrDRP5oIb39YnvLlqQ2gkaUU12sMxfsdehHsBR2grU7set2NcgbVZU4vKGHG0CAdIZx0SVvnWlRI0dIiPz6rc3ddGQNCVivntOZ8e2611k3SK3Wvbqu/yoWeTcrFpW5dRgU0sQNlp5UxYnYhqQYMuy7PQUVmLY/0I7dUQonavS0DIQ2WT2OzgQaLmsFqXuEDZVvHnqoMrLt4tmh5HbbdnEmFLJrtGfmFAxigqLo6BzjwNR1k8fFHRy1ge2nPnft3CqLxAIV8apbGovVvY796CvAYOkiBYtDTBeG25/1fVvoS1WnZIELXd9HWcJKTTOL6SFNmY6cWjeHE77QvImTxYmTUpt1pOtVJ9+mZEFc9N6EY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(82740400003)(86362001)(2906002)(44832011)(4326008)(8676002)(8936002)(81166007)(356005)(6916009)(4744005)(36860700001)(83380400001)(54906003)(336012)(1076003)(426003)(186003)(2616005)(47076005)(478600001)(40480700001)(70206006)(70586007)(5660300002)(82310400005)(316002)(41300700001)(6666004)(40460700003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 11:46:47.6435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d4718d-2f90-4b6e-a328-08dac95a92fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5414

This patch series performs simple early printk code cleanup around PL011.
No functional changes has been made.

Michal Orzel (3):
  xen/arm: Drop early_uart_init macro from debug-meson.inc
  xen/arm: debug-pl011.inc: Use macros instead of hardcoded values
  xen/arm: Define WLEN_8 macro and use it in debug-pl011

 xen/arch/arm/arm32/debug-pl011.inc    |  2 +-
 xen/arch/arm/arm64/debug-meson.inc    |  7 ++++---
 xen/arch/arm/arm64/debug-pl011.inc    | 22 ++++++++++++----------
 xen/arch/arm/include/asm/pl011-uart.h |  1 +
 4 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.25.1


