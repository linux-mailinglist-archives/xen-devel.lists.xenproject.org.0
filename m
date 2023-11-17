Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2E87EF54D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 16:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635278.991142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r40oY-0007Ke-Rc; Fri, 17 Nov 2023 15:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635278.991142; Fri, 17 Nov 2023 15:31:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r40oY-0007IC-Ns; Fri, 17 Nov 2023 15:31:26 +0000
Received: by outflank-mailman (input) for mailman id 635278;
 Fri, 17 Nov 2023 15:31:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0J2k=G6=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1r40oX-0007I6-67
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 15:31:25 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c8ee6e4-855e-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 16:31:23 +0100 (CET)
Received: from SA9PR13CA0066.namprd13.prod.outlook.com (2603:10b6:806:23::11)
 by IA0PR12MB8254.namprd12.prod.outlook.com (2603:10b6:208:408::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 15:31:17 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:23:cafe::b) by SA9PR13CA0066.outlook.office365.com
 (2603:10b6:806:23::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.11 via Frontend
 Transport; Fri, 17 Nov 2023 15:31:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 17 Nov 2023 15:31:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 09:31:16 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via
 Frontend Transport; Fri, 17 Nov 2023 09:31:15 -0600
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
X-Inumbo-ID: 5c8ee6e4-855e-11ee-98dc-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToCGg1fserZKPeY992j1b5l0YTuxUoc/SejopmrsTvBNR1V9NjokF4sH8Cqw7ldivL/N9cQ9BgjAJRJ979Jao0pj66Z7krxn26hDqpznsuUFM/mFhaQpe0sHrEAIiMTJCT2PVGR71yxxnZHM7tVxKGJWo9G2xDT7xECXTwEaMVGbB52JKeo829vPWFzxBJCree6PaWOBpy2JLlmW+0ZqfjHXanhkQeYsReg1y2gO/ohwwb0gIpFlyLpqTPQZ0i2H2/LlnoOOdb/KUT59ssye6XvWA2fT8mq5CCmkYicD/+++/znGVsmUmy0qCBR8wlpyvnU10XcCY9Vqbl+60lHfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KF7/dY1yb1j7vG1ev5vkjoiz+rxOog9xapN4sNqfg8=;
 b=AW8d227a4Q/8Jy0Zxtkk259ALfiPV+OOEe3euHqm+jt+l/6zLOyRSwxQabyGVJtY1fYVHLbRS/rUGpYWHsfVu75JfIaNphSnOOg6UgVWq8aJg8hE6EFFFXtfM7LBmRCiNASQfEdkAIeXQE4zAg4hsmrhGfhMxsQo7NvlyRni947Wa5L5NH58JAbKbHEMZkmdxFkDTkD1Vw7MSv1ww64Z/8DAORWrgjcMESR4dv+bi1HYfOeCEkmFlkK8g5yc4lOWLkktE3N5+2x4qokzQhAl5KUTkAIswp6k8RxZ5mSDiyPgD6TRr2qLpZ3Yx7mpaoDtQzSihgcve0fxx/STcvPLww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KF7/dY1yb1j7vG1ev5vkjoiz+rxOog9xapN4sNqfg8=;
 b=huGi4XNEitVs58Qk/jmdQYBOM2zdnnlLlJfZm+f0GJLgajFtDO2nJzHRK/gm41rSsp/S6bbAeHlKxsT3H65JotDmnitbBZSPYSdNzpR8dNm+v75P54J+FtC5TwJKdVNXbGDm3Enqn/O3tWFNwoOqeFdvKA28KGBKceO99TJVHBw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <henry.wang@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v4 0/2] xen/arm: Split MMU code as the prepration of MPU work form Arm32
Date: Fri, 17 Nov 2023 15:30:59 +0000
Message-ID: <20231117153101.2902792-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|IA0PR12MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6506b2-e1f8-47df-c4b2-08dbe7823d6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dpJE/cBrMJ447rIZX6aBJCXQgneb1HEC0ORgrrQjAuHCZn3DQj3LCgS0TWexLfNG5QGD57avbgMJGuN/xg3Jq6Or+I1XZgiI6Q1jsN/PRro6CNd7qiTFkIpQ6YHmrfZ+Kq9Io3CtaEvnkn1jzlb/IRFqXVAABzzn9TUf1rUzlkRSQTsBNYEX29qO939TgRzByZ9TBlgHjq/ONfgbtOM57XdDE75rZHuKIi8MXRQBvL19pmCvSdQMXoo0Yqm6V+myKE40Rm9XMxOdvaFHgg534Dw6Fl7oVL5Pn/cW2at7TNbcM04xeiZJCbvFYJLu51i3OZ/N/X13VyOQ9ejWcu4bY1+oyKx5G/thEIFRd5IFhWwng2+M76o1r7wSmhk9Yd0XmwIVzN+o/L1q7cU+C/Mx33DtqGKBFMO4o1rCFutlR2pqb2vk8w7ZafFkWpB1Y/bmG5jpai8jOblafIPoDFUpDakn49Cx5xTLv+kQ4i4+QcUX7cn+onRJu0fxztvCfnfBE0uPQhlFTOYkFUJR1nqHlClu3Z8iv+3zqkjqgDXCYPLOoLtAOyO7kOyPS9f73KSqOIzgQqdyEqyOhGjFUsVC4liiEZaqMmxBsR13o4/1lxXRa+OMrDMTxeS1znOW1DU/aHH4Dkj1zxtaApnWGAL3v+5exXJL5N9MBqOwsauQ2XhxcxyjYHNpe3NTr5cSAdCXYYNjPiHE6FTRrnM0amOCDhyCQJnFgmp/Dlnp/pYE2dMOWLUxMMa8tBatF+dbXz6mmaCIHOB0uJm74OGjl1svMQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(1800799009)(451199024)(186009)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(47076005)(478600001)(40460700003)(36756003)(2906002)(82740400003)(426003)(336012)(81166007)(41300700001)(356005)(103116003)(2616005)(70206006)(1076003)(83380400001)(6916009)(70586007)(54906003)(316002)(86362001)(26005)(36860700001)(5660300002)(4744005)(4326008)(8936002)(8676002)(40480700001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 15:31:16.4957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6506b2-e1f8-47df-c4b2-08dbe7823d6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8254

Hi,


These are the set of patches based on top of
"[PATCH v9 0/8] xen/arm: Split MMU code as the prepration of MPU work".
This is the preparation work to add MPU support on Arm32.

Changes from :-

v1 - Dropped "[XEN v1 1/4] xen/arm: arm32: Move pt_enforce_wxn() so that it can be bundled with other MMU functionality"
and "[XEN v1 4/4] xen/arm: traps.c: Enclose VMSA specific registers within CONFIG_MMU".

v2 - Changes mentioned in individual patches.

v3 - Changes mentioned in individual patches.

Ayan Kumar Halder (2):
  xen/arm32: head: Introduce enable_{boot,secondary}_cpu_mm()
  xen/arm32: head Split and move MMU-specific head.S to mmu/head.S

 xen/arch/arm/arm32/head.S               | 580 +-----------------------
 xen/arch/arm/arm32/mmu/Makefile         |   1 +
 xen/arch/arm/arm32/mmu/head.S           | 573 +++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/macros.h |  58 ++-
 4 files changed, 642 insertions(+), 570 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mmu/head.S

-- 
2.25.1


