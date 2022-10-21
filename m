Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD30607ABC
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427735.677085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu00-0000EC-Qc; Fri, 21 Oct 2022 15:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427735.677085; Fri, 21 Oct 2022 15:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu00-0000Ab-NG; Fri, 21 Oct 2022 15:31:52 +0000
Received: by outflank-mailman (input) for mailman id 427735;
 Fri, 21 Oct 2022 15:31:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oltzy-0000AU-VH
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:31:51 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04hn2217.outbound.protection.outlook.com [52.100.161.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79cf14bd-5155-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 17:31:48 +0200 (CEST)
Received: from BN9PR03CA0218.namprd03.prod.outlook.com (2603:10b6:408:f8::13)
 by MN0PR12MB6127.namprd12.prod.outlook.com (2603:10b6:208:3c5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 15:31:45 +0000
Received: from BN8NAM11FT098.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::56) by BN9PR03CA0218.outlook.office365.com
 (2603:10b6:408:f8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 15:31:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT098.mail.protection.outlook.com (10.13.177.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 15:31:44 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:31:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:31:41 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:31:40 -0500
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
X-Inumbo-ID: 79cf14bd-5155-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CByo2xcbgorMXAd8gbvXKbaSVRO6/1gDjSz2wRDImyEH0qAYi5lSHHNEacHFU1SI0bpSyP4L6Xumob7z8e9CqmwUHX1CwJq3ffYUi1hFteuvxZ8z/W7+xQcgkHhR6mx49ZokHcPloNJGh/OkwQR592pIO7ZwsxffgyEKoy6Q83DGYfN7256vesHtjm75FixSzunuG+5+SrwTkehO/XrgSu/XzVmvlAoVEnCJgEujjM7V9NCE4ELkhlUU42fD/uheu1IoGZ37aT4inCzoObVSTLnWzzq1+ylYngq141wiN2YBxi+udK+zBAELL7Be8G918VCNyY3knp8Q6KmDwBCDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5B3TqJ58VJAkItxAN9gqSaQ9XwjpKLxd/rGzStRCyQ=;
 b=oQNneGlqtEgwtnNhgjn2s46GUdIXk7WzktbTXtph1Ua8lS/n4anUfKRgW4n6y59xKoGtQSu1yrwyI3rdwFIAPuU1TtpTZwx/80xr93opkNDQAWnjqNv1GNbFMNgXTZTPVMDh+X/xkVOxu7YmauCEafNLuFhtS9Iuqd7T1PfZJWWlWkyYbKYYdPANZd8z7WiL1YQBsgI/Kp49hiNzWiF/t3+khVp3Kffvdwv/xc7IoHVPEjTAECcv8MwusuJVvwflurbfEoKZqvuxA8d66gSeW1fTCFzQwUyMtA5gZQMuXfi+klBEReWZujJarLAyAd1aYFB+goq1D59eI9VKnsQpCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5B3TqJ58VJAkItxAN9gqSaQ9XwjpKLxd/rGzStRCyQ=;
 b=UmWDB72Tl18AeTS8tGSoRz5oSlH6RPYhAXkame/erAxRaCw5iAVYsWBFjLjZoVxJYcAWDRWQ0bcQjd9yTMd0Dqmtjm/NE1I8D1p5iflxVBeLLKc8rmD5TorXOD+25VE+P0goZGQXTN09m+DOmPmvjc4E5yLHZuP1ithWHA4Rwdo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [RFC PATCH v1 00/12] Arm: Enable GICv3 for AArch32
Date: Fri, 21 Oct 2022 16:31:16 +0100
Message-ID: <20221021153128.44226-1-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT098:EE_|MN0PR12MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: b40479c9-53ea-469f-b4bd-08dab3795c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bzS9r9DJSXaGJHYY+kyzTT52cN7XEsMv8CdVyK4DxUIXHt10IGnAN5IkR6l6?=
 =?us-ascii?Q?eOOqk2J2g8GIeMuI7W2CvpZ9iYaSt/03jgG2sgNMzM96R7EFqyWb44AOf5ls?=
 =?us-ascii?Q?RpX+zpirVdeoYjacl12Ht0NIj0h9LYn3ipNFu7fzSy3VR+nxHQC6SPRLSfgt?=
 =?us-ascii?Q?qkWXMYZQDatZwFZ/aZWmCx7WNBWQg7B+3yzlZJI3nnawesH3faBUYemLji4q?=
 =?us-ascii?Q?Jc2IsY/qXqw/SrkmsNOSyFHTvWbB3qcCzQDrK7VLbfZJKsE8bZMtqtCCBqwQ?=
 =?us-ascii?Q?bhUkbEPrcGehnOlR3+umAdn9fzxd4jv/3qjcLNoDEuESwBlrbh6eIbwsiUEt?=
 =?us-ascii?Q?QEZuE0QYCv53o9YnN9DB5rN6HFLMOJ5hErQ0XSfPTRkgfxR22VzNUD/QOLUB?=
 =?us-ascii?Q?UiwtewrSMGOfMkrUiXKji47lOD/TmGxcYUb/1cgnrVkyrRwdwTMSCy3gizf5?=
 =?us-ascii?Q?svOkWoxwp7534YY/hs5unQ6tk+T+V42fKEpE0KL8ETuXpJZ4c+jObeTaIlZ/?=
 =?us-ascii?Q?XBwUESp1JAVDSdH3XkcFqAp/WugV0ycH4riRN8vPzfZWrDIHr/PJWLvNlukj?=
 =?us-ascii?Q?GmLSUa95u29DSLK6HNpPIsWZHN0DUHLbJSEfMEUfj3WH4TLmnRKGEqxD0Ha/?=
 =?us-ascii?Q?pTNMuXTE2mG/dUBfciTnwlhShXRXV7cw4sAB0TSe+lk+3BkU28ULeagGgxCi?=
 =?us-ascii?Q?J1+xro7ee3w77A4Xv2ZUgaZrlL4fJ1/KrdZxXCPbdljLRDt1C6/uGDNvgCmN?=
 =?us-ascii?Q?Wem+dhI3Cp+/X5fyb1Kd6u57hLh+nL+rZw4HT+qaKbWiAqk8zncUiLVryHUV?=
 =?us-ascii?Q?LoIDyHope4IG56kdtNpHkOujtBxMeAvCls43TD4lQpIFGzkvSsnVAjAMyPCg?=
 =?us-ascii?Q?Zl/Le856ysCfrTcv/cs/7hZdqw0+CX9znnoXDoUWLSlkakdjitt0CDrabre0?=
 =?us-ascii?Q?F8N9pzmyrFcjkHLDDiTIjr+lrhg2mB7uMDcxGlOl1uUvLzE6is4CruC4ll/4?=
 =?us-ascii?Q?7DDFyFanCt19cXOsSZzEHLyV2YY9yZWwhUNZ0PAzyk9vWamwEOBIxFCKr+3m?=
 =?us-ascii?Q?scxSkpLsQB4r0272ymXR/hL7UXwotIhjjrUHkrs/r7WM1VYzWo3PUV3fqjTR?=
 =?us-ascii?Q?3JT/8u9DmeJOSiRrkPYuLV0sI0tcqjIwCFBZhdxr8EIYBmgqEl4dOudwaXlp?=
 =?us-ascii?Q?oXWRpLUbRdJaZPt4mesaKLdH2ZF2Sxrvk2QgsQmHEVoVVxVFtODsgCzyAh4?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:OSPM;SFS:(13230022)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(40480700001)(356005)(426003)(186003)(47076005)(2906002)(336012)(82740400003)(83380400001)(40460700003)(36860700001)(1076003)(82310400005)(36756003)(81166007)(54906003)(5660300002)(8936002)(70206006)(316002)(2616005)(478600001)(6916009)(41300700001)(8676002)(26005)(6666004)(70586007)(4326008)(36900700001)(11215385002);DIR:OUT;SFP:1501;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:31:44.9444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b40479c9-53ea-469f-b4bd-08dab3795c74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6127

Hi All,

Please find the following patches to enable GICv3 for AArch32.
This is a pre-requisite to support Xen on Cortex-R52 (AArch32-v8R system)

Let me know your thoughts.

Ayan Kumar Halder (12):
  Arm: GICv3: Sysreg emulation is applicable for Aarch64 only
  Arm: GICv3: Move the macros to compute the affnity level to
    arm64/arm32
  Arm: GICv3: Enable vreg_reg64_* macros for AArch32
  Arm: GICv3: Emulate GICR_TYPER on AArch32
  Arm: GICv3: Emulate GICR_PENDBASER and GICR_PROPBASER on AArch32
  Arm: GICv3: Emulate of ICC_SGI1R on AArch32
  Arm: GICv3: Emulate ICH_LR<n>_EL2 on AArch32
  Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n> for AArch32
  Arm: GICv3: Define GIC registers for AArch32
  Arm: GICv3: Use ULL instead of UL for 64bits
  Arm: GICv3: Define macros to read/write 64 bit
  Arm: GICv3: Enable GICv3 for AArch32

 xen/arch/arm/Kconfig                       |   2 +-
 xen/arch/arm/gic-v3-its.c                  |  20 ++--
 xen/arch/arm/gic-v3-lpi.c                  |   8 +-
 xen/arch/arm/gic-v3.c                      | 132 ++++++++++-----------
 xen/arch/arm/include/asm/arm32/io.h        |   4 +
 xen/arch/arm/include/asm/arm32/processor.h |  10 ++
 xen/arch/arm/include/asm/arm32/sysregs.h   |  80 +++++++++++++
 xen/arch/arm/include/asm/arm64/processor.h |  13 ++
 xen/arch/arm/include/asm/arm64/sysregs.h   |   7 +-
 xen/arch/arm/include/asm/cpufeature.h      |   1 +
 xen/arch/arm/include/asm/gic_v3_defs.h     |  24 ++--
 xen/arch/arm/include/asm/gic_v3_its.h      |   2 +-
 xen/arch/arm/include/asm/processor.h       |  14 ---
 xen/arch/arm/include/asm/vreg.h            |  23 ++--
 xen/arch/arm/vgic-v3-its.c                 |  17 +--
 xen/arch/arm/vgic-v3.c                     |  26 ++--
 16 files changed, 242 insertions(+), 141 deletions(-)

-- 
2.17.1


