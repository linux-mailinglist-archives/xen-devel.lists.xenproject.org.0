Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E6763AD17
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 16:57:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449010.705600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVQ-00042t-T7; Mon, 28 Nov 2022 15:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449010.705600; Mon, 28 Nov 2022 15:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVQ-00040c-Pf; Mon, 28 Nov 2022 15:57:16 +0000
Received: by outflank-mailman (input) for mailman id 449010;
 Mon, 28 Nov 2022 15:57:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozgVP-00040T-2z
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:57:15 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04hn20326.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::326])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5238d421-6f35-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 16:57:13 +0100 (CET)
Received: from BN9PR03CA0206.namprd03.prod.outlook.com (2603:10b6:408:f9::31)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:57:09 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f9:cafe::b8) by BN9PR03CA0206.outlook.office365.com
 (2603:10b6:408:f9::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22 via Frontend
 Transport; Mon, 28 Nov 2022 15:57:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Mon, 28 Nov 2022 15:57:08 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:57:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:56:57 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 28 Nov 2022 09:56:56 -0600
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
X-Inumbo-ID: 5238d421-6f35-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNJq9DZYXkxNpVtvq/RJklP2NWsn0G7DkBU7IALUgkh58om8467skzVuIISwnG16ghlURBr8pYFVayPBpgaCmzGAMVXA3MPCl+Qy+Artu39csLi6oyP+mKQQPDIQzFaD2v/tm6Rs+h81WD1mLloOe/uUYNWnwkZ3Jwxe8219XUMhVa31FoqA/o7J8YUo2CHn+ItUgE/TitMAJSW+wzNsZieVMWa8qtVfs0gj2+nK5yzD9Z+b8KM4myr0P6SDpKOL94AM6l4IiC3s4iMfikc3ANiv/2Bb7Rljq9/c6vO38S40hHka5H5nFl6AnYr3sGwTo7+5fFHrsbBsCQRERoTz/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3Kpz+bqPr4H3fE7oYGCI2F/ShLsT3xtGUUc8+3JBkA=;
 b=HWPn4QMjCZCM0/RLHHuD/I842X7rN/IX8UUt6lBl82Mnxs6iwLxUzwZrLj1ZoVe5B7FUktmfEFDe0tW5d1iuLmZogRWqOv7gJdTSd9YY2LpbAN8kTiDaEmzm7khmhUWYgXzOrXzWtzrdyPz4uC3RTf1XYcltnQX/DccsGShopIQ8/VC3yJULZJpO3bYxqIGq8ncoxcmL46sOxT6jIgVkFYbExcJPuCXVz3GRmvA5CW953N/Fmw21j4f9PdYR6i/U6onuWRwVzujitnIxKJhSQcKsamtC+dwaohOUuOlWOHffkn64Did0YPk9Sn/kIxLenyF5yH4dfrvBuNwWgBNt4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3Kpz+bqPr4H3fE7oYGCI2F/ShLsT3xtGUUc8+3JBkA=;
 b=JrRSKKRTWwYQDub98i08Yn6lWnhMj60XTDLyuDnDd9DkgqkfFhPoRZyqyAs9FHsNY5QkjPlQVDbPtiR6QRD+WZvJaHb6eHzCd3af487hBHFjMfoaBeopDYCSGsNQxniJLfxT9G0jNO0n/X90LyTw5w1sdm728Beec8bmF9OKGoY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v4 00/11] Arm: Enable GICv3 for AArch32
Date: Mon, 28 Nov 2022 15:56:38 +0000
Message-ID: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT048:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f9ba67-b6e6-44b2-069f-08dad159342a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GDZsvz841AoWKcsAOdY6e7f4r3iicL6u7/ZyxyCa6nbkmCusN0/WR2idGaSY?=
 =?us-ascii?Q?F/P0fDcZzyysQ/lUhqrxRNWa9eqejycw94R3qmAjqKe9D/sKYtE+NS6L1BT7?=
 =?us-ascii?Q?lJZEero7jgt2il+gxwCcM8zn0id7kxtZDo353hfyo7PErtXlEjK1fNrmoZ/q?=
 =?us-ascii?Q?lFKZt75x1IImRw1eITvAxP+GAJc8jSND9BWZOma5z/gQH2WH2ThRSEb0UaWQ?=
 =?us-ascii?Q?rFKg5E1cmVqSf9DEZTrHKLIrVZCfmgElC36seMaeAprR73Gz4rfw7lizEakK?=
 =?us-ascii?Q?YNYkv0cEO0iZAMNb6Un7WmcVYI/aWpfW6IO696h+CpGj1Wc+I+lYb8WeZ3RH?=
 =?us-ascii?Q?3E32TbrhbtzysJEDmFnpsyK51KBXaIsUL+w2tXz5J9uzrtFO08G1LGKG8R83?=
 =?us-ascii?Q?/VtdiHG0HxCMEvufK9jFPSAyrsP0ts71b04QYBStFL1DbeYjkH1T/PHB4ncz?=
 =?us-ascii?Q?dWvmb9iv57SpX2EUjehleSQ/ulTi9gPdV9fQkAWyQ5LTYJPpMNPGuDu+6adH?=
 =?us-ascii?Q?q01uP2KrAQeKlxmuI2DAtYRg1DFlhWnYafein5ZicBq52E5AC08dMxA18BBu?=
 =?us-ascii?Q?6UmbISxFjXBnIIrBGA8M+M9UjII0CB3kwjUetyu9BLqHWqhiMNEoYryyvwyo?=
 =?us-ascii?Q?lqU7+83YlbXqsLG4QD3PaF22574z9nXB3iNbFv2A6Hs79+ospld9iWJqfQTS?=
 =?us-ascii?Q?HhLZ2ydqKHr+vrbGz0Qjc35YVrUJLgWlKv/ncpqBCKkqn7FeUtAgcIWCAEK3?=
 =?us-ascii?Q?3jvdsEzz1KGJxMCKHVFJWQWAruHrDDNBeeXjO7gKyCLgtZZd+z//BP1xxYMT?=
 =?us-ascii?Q?hCR8t2mBfpv2q4bhEWWWvxaEMJE0jeUu1Qgds6VE33giBRzTWpSW/9kgX3Hs?=
 =?us-ascii?Q?9taseeEjyiME9g+/JEX1O95njIr3hmNrW3QetcbaCh4ud2v8ZDWE541LIOzF?=
 =?us-ascii?Q?Xh7qkSvX3ZvS7otT/01RJ2kfi9P+erfIpcqffN+bm2hSfQLojLxZydcjH3qK?=
 =?us-ascii?Q?wJOCILDS7NE04JbeZNCR6MGVuv1nbsuEo1gilk81Kp7lfjHAiD1d8uDfv/rb?=
 =?us-ascii?Q?xVwHLS385cctH1nj05MghMM6P3ihm5IoER2K1C2TLFrXPsypdmYzv5gHxqgs?=
 =?us-ascii?Q?0OJ+FAVxD07S2ZAqC72wChv+La3vDuOvUb6yqBzir7CLDlXHdJ2haps=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:OSPM;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(82310400005)(2906002)(336012)(478600001)(5660300002)(8936002)(47076005)(426003)(186003)(1076003)(6916009)(81166007)(6666004)(86362001)(2616005)(41300700001)(356005)(70206006)(70586007)(103116003)(36756003)(40480700001)(82740400003)(26005)(54906003)(316002)(8676002)(4326008)(40460700003)(36860700001)(36900700001)(11215385002);DIR:OUT;SFP:1501;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:57:08.3341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f9ba67-b6e6-44b2-069f-08dad159342a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124

Hi All,

Please find the following patches to enable GICv3 for AArch32.
This is a pre-requisite to support Xen on Cortex-R52 (AArch32-v8R system)

Let me know your thoughts.


Changes from -

v1 :-
1. Updated in the changelog for each of the patches.

v2 :-
1. Dropped "xen/Arm: GICv3: Move the macros to compute the affnity level to
arm64/arm32". The reason being aff3 does not exist on arm32. And aff0..2 is
the same between arm32, AArch32 and AArch64.

2. Introduce a new patch "xen/Arm: GICv3: Adapt access to VMPIDR register for
AArch32".

3. For the new registers introduced, we have defined the arm32 name and then
an alias.

4. Use 'AArch32' across all the patches.

5. Dropped the 'R-b' and 'Ack' in "[XEN v3 08/12] xen/Arm: GICv3: Define
ICH_AP0R<n> and ICH_AP1R<n> for AArch32".

v3 :-
1. "xen/Arm: GICv3: Use ULL instead of UL for 64bits" has been dropped.
The change has been merged with "xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32".

2. I have marked the patches which have been Rb + Ack vs Rb only.

3. Dropped Rb from "xen/Arm: GICv3: Enable GICv3 for AArch32"

Ayan Kumar Halder (11):
  xen/Arm: vGICv3: Sysreg emulation is applicable for AArch64 only (Rb + Ack)
  xen/Arm: GICv3: Do not calculate affinity level 3 for AArch32 (Rb)
  xen/Arm: vreg: Support vreg_reg64_* helpers on AArch32 (Rb + Ack)
  xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for AArch32 (Rb)
  xen/Arm: GICv3: Fix GICR_{PENDBASER, PROPBASER} emulation on 32-bit
    host (Rb + Ack)
  xen/Arm: vGICv3: Fix emulation of ICC_SGI1R on AArch32 (Rb + Ack)
  xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
  xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n> for AArch32
  xen/Arm: GICv3: Define remaining GIC registers for AArch32
  xen/Arm: GICv3: Define macros to read/write 64 bit
  xen/Arm: GICv3: Enable GICv3 for AArch32

 SUPPORT.md                               |   7 ++
 xen/arch/arm/Kconfig                     |   9 +-
 xen/arch/arm/gic-v3.c                    | 153 ++++++++++++-----------
 xen/arch/arm/include/asm/arm32/io.h      |  20 +++
 xen/arch/arm/include/asm/arm32/sysregs.h |  19 +++
 xen/arch/arm/include/asm/arm64/io.h      |   2 +
 xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
 xen/arch/arm/include/asm/cpregs.h        | 136 ++++++++++++++++++++
 xen/arch/arm/include/asm/cpufeature.h    |   1 +
 xen/arch/arm/include/asm/gic_v3_defs.h   |  24 ++--
 xen/arch/arm/include/asm/vreg.h          |  86 +++----------
 xen/arch/arm/vgic-v3.c                   |  22 +++-
 12 files changed, 324 insertions(+), 160 deletions(-)

-- 
2.17.1


