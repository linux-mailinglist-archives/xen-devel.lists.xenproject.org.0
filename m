Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FEAA5DA4D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 11:16:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910188.1316940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsJ8p-0001qF-L3; Wed, 12 Mar 2025 10:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910188.1316940; Wed, 12 Mar 2025 10:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsJ8p-0001om-Hp; Wed, 12 Mar 2025 10:16:47 +0000
Received: by outflank-mailman (input) for mailman id 910188;
 Wed, 12 Mar 2025 10:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnRX=V7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tsJ8n-0001og-QF
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 10:16:45 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:200a::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17a140d6-ff2b-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 11:16:43 +0100 (CET)
Received: from MW4PR04CA0214.namprd04.prod.outlook.com (2603:10b6:303:87::9)
 by DM4PR12MB8569.namprd12.prod.outlook.com (2603:10b6:8:18a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 10:16:38 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::8e) by MW4PR04CA0214.outlook.office365.com
 (2603:10b6:303:87::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Wed,
 12 Mar 2025 10:16:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 10:16:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 05:16:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Mar
 2025 05:16:36 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 12 Mar 2025 05:16:35 -0500
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
X-Inumbo-ID: 17a140d6-ff2b-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCDlf0KyKQUclMVlB+4STzoSvT4c2N+RFVDD56VXrKj54V6jsrWDAg81pIz5JAyjW8kP2r0Acw8O4Y0pwWHDLsKjvZwUHj7uy027lqhpB+c8VqzbRK9Ulj9tx54G/Kmdj3mitI1HMyAMQxs0i3ZySkhFvQWLsvABJ1oztOIi4Z1rqcCxdzB5y2Lu6sxoZfgfIyMIxKop+I4sH1Pd/TYUfjhSDaCnvl8eXaC0uOixLex87jyBVHi80esI2MjpUi4zy1SyprrqnvlFucQsetOIBLEXVZK+hVdlr0oAA2I8OtEn+vvlHDM/N3t7BaPAy0I52HV8AxAa2k34Xq5k82kfLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ix6kopAMFhaIxGt+OPiCb5aUtkHVBjxIJ7HeFgIwq3g=;
 b=NnkX2705oEshBaqu97Y0naoCqgHnAhwT/jf10c/2NUvRX6dElLHfR4wYAmMTzrc1hLTCWAWDPQcXzOLx+HR2n588P/QBJwtjYT/OUgLs17J8Ycbcs2Nx3lhzw4hEIibLzh8d6YfPJ8S11z9ahc2hcx0WnenkjnOUHx7kfqrni9Wpno4H6lY6jx5+mfTYlaXhQ4CYLzU8wCgZ1ph7pYhAKpRtMjU2LG6TgxBjCUOHfoiHc+ZBzpJIsKjO+8R4LHX5wL2zb4MmM5H1Tpsu9XwgfvdaQ8k6KTT6+92dF1N9zy/tuRjdYrjls/PrT+OCeTm5L8rC3NERoBKU+cjqowy+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ix6kopAMFhaIxGt+OPiCb5aUtkHVBjxIJ7HeFgIwq3g=;
 b=sLANe1aWhA5nlNkKb/1I/P16+enbW4UdAlb25gqjuyMZjEA3HRqTo9T77MC/e4GNFeO8g4jAGjiFR9CGafDGz24pHCDuQ7//IJZwCihdvOlLWRqv1iOZOt1igQkxTsGoHqMg9mwwOH0hggAp6jvUeDhgzmWa9RI8p8b+ml/FBqk=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/2] arm: better handling of nr_spis
Date: Wed, 12 Mar 2025 11:16:17 +0100
Message-ID: <20250312101619.327391-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|DM4PR12MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 93eb48ba-d985-4afa-a64f-08dd614ef9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?96tgSLGq0OkLL2eQoJ92voERYkbTdKL2NNSVwiNYH52A0MzaLK19aEsmIAXj?=
 =?us-ascii?Q?hBsf/L4aSZJbw4jlAzA15dS6tflrd+M98njOjL2KiKfxKdbwIYeIN3SJJ26s?=
 =?us-ascii?Q?/cMWimlVU167j+67BnWr02YE/J4YG96ffIbI2l6qt4Rsy+98wC1ayHqERvbo?=
 =?us-ascii?Q?/ICGrjG8chAMOwMhQoDMcLclkiSbfDXP9JPjBuj+5xYkpW/NQN0NIinRO9Jf?=
 =?us-ascii?Q?7vkMtEObumPbpgaiWIFhg3qWthsONfdXJX9xNnVyXMQ4+ntfGb3JLYI2ZR8B?=
 =?us-ascii?Q?kfY7cg+J/9gqGCMgx1ySLULV7dSCbzFwTAWdcBEp/mzmC5E7qsytU0bsgawf?=
 =?us-ascii?Q?d0g5CDrlxDvH7BdgITjfKNHyMdcWh92J+IjzpOOlBzFPyPh3RQwFQ+3UrrR1?=
 =?us-ascii?Q?DwKQ90n5bp3dL/n5dDLfXPIGrHlow1ZgxcDLqr23/8RjPkAZQARwtXc1/qLD?=
 =?us-ascii?Q?2YONshEqo9fi158qr0HZfZCX/yB+fbrRTfMYvRQV9lRbGNBrHiRb7NT0OJGQ?=
 =?us-ascii?Q?rFuk/ZbwpbDIPHPqWy6LMkqJxZsXxTLI9MCnpfOT6UeEs4k9JyWK50eTZQE5?=
 =?us-ascii?Q?RQS9Ck2n99B9nPzJXeRSRVB45Djp+SWS/Id6CB7aN3Pt6ycH45stZd3V6Yyn?=
 =?us-ascii?Q?FotllBXTeGlBT88sAE4KGEY6yITi5jrlZJ5zz4+6vsAXG/rmENp3EpIk3bg6?=
 =?us-ascii?Q?ErGisWFYemSiwnQTDCwffnWXgaBu7w3oj/KcQe0FFHdbsJ2mqj+d333PbFWT?=
 =?us-ascii?Q?Q69AQhxtFKFsPBrokcmCyJt7slF2YzgmgLke8ONWklKYGqkiEyalVByihYhA?=
 =?us-ascii?Q?kTS+tHhaaa7LgqUhH5yNZfWCb2O875RSdcgTENGdxXvp9+3xcveMQaXEAejs?=
 =?us-ascii?Q?dQfYn3WmdYgrees926khknPNlOsyCtJP1L9EILb3d54bmevdBrHEr5EMp/MO?=
 =?us-ascii?Q?rEhouzrH5FGratveJscuCyfcMOM2NgRkZOO4JDc35dG8jF0BrCwEllEhcltJ?=
 =?us-ascii?Q?efRsEw1Xl3neK33YSBkOfUqKZtnFOSUFoMupl45IZHaegie2/3Dzg9uCkkIH?=
 =?us-ascii?Q?39wZR7gUSK4wLpv4Fvdm2TKjuEKADTXFHlSH1Va5uid3n9oXSSBBAOw5sQMa?=
 =?us-ascii?Q?qkcXaieAMuq2f05xl/z0V5h1V8uuVW//fYDxDpnC7OwRXalEqTv2ydzxapJF?=
 =?us-ascii?Q?GfL/DsYzp8/HoIkdePPX0PUqm5VLHrgMun02O8knhxKdInJdyY1KXzNxSzG6?=
 =?us-ascii?Q?B9HVO8aqfxR4hHBt2z3ecB5yb/nkhSP0IGyKFu/sSf4JV7eaNddSwRU2k0q5?=
 =?us-ascii?Q?948cq3tooEC29cG8vinK3ZQLSGovLWqDcvrATt1AbPgMWlXGw67laFoV3PZz?=
 =?us-ascii?Q?FxG+H5YPlKnX8ueMKEvFiyG6r6o1BRCFMKZQdZjyRVRYMjXEAToeq1e0I6vB?=
 =?us-ascii?Q?VuroPr5PchmpuUjoTeY8kL+HXhJ/DAfj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 10:16:37.8773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93eb48ba-d985-4afa-a64f-08dd614ef9a7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8569

Refer:
https://lore.kernel.org/xen-devel/20250306220343.203047-6-jason.andryuk@amd.com/T/#mc15ab00940d5964b18b3d6092869dae6f85af1dc

Michal Orzel (2):
  xen/arm: Improve handling of nr_spis
  tools/arm: Reject configuration with incorrect nr_spis value

 docs/man/xl.cfg.5.pod.in        | 13 +++++--------
 tools/libs/light/libxl_arm.c    |  6 ++++++
 xen/arch/arm/dom0less-build.c   |  2 +-
 xen/arch/arm/domain_build.c     |  8 +-------
 xen/arch/arm/gic.c              |  3 +++
 xen/arch/arm/include/asm/vgic.h |  6 ++++++
 6 files changed, 22 insertions(+), 16 deletions(-)

-- 
2.25.1


