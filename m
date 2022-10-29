Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47969612645
	for <lists+xen-devel@lfdr.de>; Sun, 30 Oct 2022 00:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432439.685181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooucl-0007oN-Ug; Sat, 29 Oct 2022 22:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432439.685181; Sat, 29 Oct 2022 22:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooucl-0007lw-Rm; Sat, 29 Oct 2022 22:48:19 +0000
Received: by outflank-mailman (input) for mailman id 432439;
 Sat, 29 Oct 2022 22:48:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2MEd=26=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oouck-0007lq-JU
 for xen-devel@lists.xenproject.org; Sat, 29 Oct 2022 22:48:18 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c618025c-57db-11ed-8fd0-01056ac49cbb;
 Sun, 30 Oct 2022 00:48:17 +0200 (CEST)
Received: from DM6PR08CA0050.namprd08.prod.outlook.com (2603:10b6:5:1e0::24)
 by DM6PR12MB4925.namprd12.prod.outlook.com (2603:10b6:5:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Sat, 29 Oct
 2022 22:48:13 +0000
Received: from CY4PEPF0000B8EE.namprd05.prod.outlook.com
 (2603:10b6:5:1e0:cafe::4d) by DM6PR08CA0050.outlook.office365.com
 (2603:10b6:5:1e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16 via Frontend
 Transport; Sat, 29 Oct 2022 22:48:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8EE.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Sat, 29 Oct 2022 22:48:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Sat, 29 Oct
 2022 17:48:11 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Sat, 29 Oct 2022 17:48:10 -0500
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
X-Inumbo-ID: c618025c-57db-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IksFvbwPn0madVIVrgwmP0RR+9JANWDmd/PGqSDMLeiNiuCnDDC43+AUnkGlHXGhAQ30yoeclQQGLYe/YN7lISr45qcf03h2WgguqHWTInsS6ELTjSce5Tfgr3aWRaM66bDpdfs/7+vC5SP+uJcifpQgvbF6RDUJ+U/QE47vppBdyX8cb4alz7sJF31AV0Km1UXNrK7yNzsjZl+5P/aWZy88KYhyBIZXCo1hWEtp6qmUHrJKBXEPq/+Fd7hypedLTZTLNVCD3Kqyu5uFGGy9Sl5HAJDE/pjNLVnDvesRDgc8YbY2qrnk0n9YHELf3+ZVO9dpAwrHt5B49ZUYEbTn/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYPO/ZJx5OoPn847hTGmKX837OvG63RvUdsnPCdXzUs=;
 b=lP0MIySkc8lSCAGuCcRR/8EityVRGvRtFE5AhylMfKuHiYP3bQ/+McgTz/TFiFMSgO/b/V98kTRLMy4WBe6pildYKL3HcCewz5L/HhPvmMiLOKacLaSPnScOFY9puKRwGNdNMlWRCyRW/DraavNSER5FCUQn80x/xojEJZME8mYrVCnPTn+QP8JVcdlXVLuV1HK6AgAKPoxSFzE/+8KjxcMw4LJO7KMtwRq12mWkTennIjz+xTgj1MRGxXZB/tThy8zspwjxL0vv6prnmO+wo571RusxS8prb32Dt6tQ4gGIsJAZB0xu6XrqmHdHQtyb1dGzzKrKsym36yutkyBG2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYPO/ZJx5OoPn847hTGmKX837OvG63RvUdsnPCdXzUs=;
 b=qgPC9qPTauHh6AY6oofj3IDYjYsoVUWzhQ5TJEuaLr1/caRrMYXYZk/0xViBsD9Ux/0VYSKTjbJdcbKyZ7/LsNvq9Bl26Anm4tkbGsZoKAAx3Wji3DIjU8/Bed1MkeRgiMFGoTZji4eLifChRv/pG/FA2jcOavbTQ3eRU+bpbS4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andre.przywara@arm.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v1] xen/Arm: Enforce alignment check for atomic read/write
Date: Sat, 29 Oct 2022 23:48:02 +0100
Message-ID: <20221029224802.464-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8EE:EE_|DM6PR12MB4925:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf0c26c-0999-4ac1-e6a1-08dab9ffa8b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YR90vqEmavmUqT+iD6csEi2DTGa1trLGF+FihRH4XHmd/LtJffPBD9y/MlRPPtnfBq0vVx2X34xbMZxKf/SLymdN08elvJb0RL5f6HjadKYDGQ24TdaHEUjQyxyOZEmHxhMoUEvZjb8kCWLK5wSNYfnpyc1azUxFzrVFls51DwRzfbRdBe4w2GS9nJv8X6uv6AhRBj9IN1M2Ga3PvQCj6hP66qv9xPTqs9SdxWhqeVeHa4B5qNcsYixFLIVx83X8pCgxv8s5z1P85fTfj9oAPGNuTpOxCp+DCyh9URhXXXLJcg5YEiK15kjFSFoYlMt8OhgRXHaFqqSJTNpiNFBaqe0T65LsAwuSFcwNiV71alYE2PEl27qrSY6h50ocTGMlpw2q0Rva3lcJETteSPiHDHi210cK+m0NCh1SSH9X0ibsdQJKXn7wHieUVNADaVOqrEj2+xSGl/tFhghSGHkmZ6KUMhGg3TWFyeMM4578XYKUJhkRbGr1BfK/+ZjOZbhtTc+DeLWq8SLb0/1HCS3mirj099VM0eFBsVJDE5BSWb5VRZirgF8v4yXLTsri3rYPkqY0dRcD8x2EDUpn9kuIomvaDxxLjt5fRR85Sa/4lSXnqXmAaNBchsyLEkpS5M2W+Q1wCZd/OtARswuCvhDJRMIagIcj4R/k9rkWI8/5HWRKKMu2wB898fabD0a7QBMHnfSoZztBf6hEhPjRLchx3usQBYsC5sUSmmhRvNimZufZce2J9c6HPPLtG7ED2GEhNgLmFW5ZALU18L7thX/RU+FdQ705N4ts3rMQnWJKq4tnPnbcpybgX3dAdKY3dIhTDFd1sP3AE9ygozXx6ieVHw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(8676002)(70206006)(70586007)(4326008)(2906002)(5660300002)(8936002)(41300700001)(40480700001)(82310400005)(966005)(36860700001)(26005)(478600001)(6666004)(316002)(54906003)(6916009)(426003)(81166007)(356005)(40460700003)(82740400003)(47076005)(186003)(1076003)(336012)(2616005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 22:48:12.3806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf0c26c-0999-4ac1-e6a1-08dab9ffa8b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4925

Refer ARM DDI 0487G.b ID072021, B2.2.1
"Requirements for single-copy atomicity

- A read that is generated by a load instruction that loads a single
general-purpose register and is aligned to the size of the read in the
instruction is single-copy atomic.

-A write that is generated by a store instruction that stores a single
general-purpose register and is aligned to the size of the write in the
instruction is single-copy atomic"

On AArch32, the alignment check is enabled at boot time by setting HSCTLR.A bit.
("HSCTLR, Hyp System Control Register").
However in AArch64, alignment check is not enabled at boot time.

Thus, one needs to check for alignment when performing atomic operations.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

This came up during discussion https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg131185.html

 xen/arch/arm/include/asm/atomic.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm/atomic.h
index 1f60c28b1b..64314d59b3 100644
--- a/xen/arch/arm/include/asm/atomic.h
+++ b/xen/arch/arm/include/asm/atomic.h
@@ -78,6 +78,7 @@ static always_inline void read_atomic_size(const volatile void *p,
                                            void *res,
                                            unsigned int size)
 {
+    ASSERT(IS_ALIGNED((vaddr_t)p, size));
     switch ( size )
     {
     case 1:
@@ -102,6 +103,7 @@ static always_inline void write_atomic_size(volatile void *p,
                                             void *val,
                                             unsigned int size)
 {
+    ASSERT(IS_ALIGNED((vaddr_t)p, size));
     switch ( size )
     {
     case 1:
-- 
2.17.1


