Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C96F8CCD2F
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728093.1132863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34G-0001Z7-Iq; Thu, 23 May 2024 07:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728093.1132863; Thu, 23 May 2024 07:40:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34G-0001We-F5; Thu, 23 May 2024 07:40:52 +0000
Received: by outflank-mailman (input) for mailman id 728093;
 Thu, 23 May 2024 07:40:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Po+=M2=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1sA34E-0001WY-HU
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:40:50 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e88::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5d858ae-18d7-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 09:40:49 +0200 (CEST)
Received: from CH0PR03CA0210.namprd03.prod.outlook.com (2603:10b6:610:e4::35)
 by SN7PR12MB6672.namprd12.prod.outlook.com (2603:10b6:806:26c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 07:40:45 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::fd) by CH0PR03CA0210.outlook.office365.com
 (2603:10b6:610:e4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Thu, 23 May 2024 07:40:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 07:40:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:40:44 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:40:41 -0500
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
X-Inumbo-ID: c5d858ae-18d7-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBUFhwhuQjb7+8X5X6R4kmafl+OL6+/T+s7/7QRLM8LsMPe7aAnQYQce5Uceckjnm4ulN7kPX90a87WaTQg3YIpy2IZ0fkW1m+b0yAjfRtxlGUrIwx53tWq6G7C0/HVKwD+rQF0vkz2BXkAGpYVPtI89FYg9ewNIFnqANypiqMgzLOedgXgbtxGZED90lYmpJVzoPBKf6qfBpG3Gjr7JohMBdQ+DhZA7ai+Sylo+N6gg108yNo0fxISl2O7bVpzjivIxMsqblngHYBZ8Lpf4RP8EgA1PSL6/x1emsTyH6+w5sMJOFEjiMH7CHR/i6lIC6f6fX7uVEhxtfHlrBV/UGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6GY8LYUMBjl94igM9pP1TWRNhnTdORD7Nqir12syYE=;
 b=GD0yVgQJvqm2A6K/aRhqKWts4b8KpkSQIe1W6qG2WFmQGYlviHmqhyFwhxeh1KQUMVS83InoXJOBN18dMk0AXlc1y1HG0DjqfXomIfEXbjytlXX7kDeds6vS38Lc46zFu7Ygt5K1OjDsGVRoW7IldNZ3RnooEa7KTSrjfnQAflGPOqkillkMzd+MCqfrNo1jFHj5gQQpH0MQh5GbO2eH9N8kkHSQCmblknYFiI1UUH5wIabOb4ztLxfjar9Z3E6+eR3bOG1RuhrsX2ZSgNKlpJ7gKuLifuf9auQ1K+zhrldHAu9kU9PEoU+eJWMrvVjyNESO+iLCdUbhi977ahg6lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6GY8LYUMBjl94igM9pP1TWRNhnTdORD7Nqir12syYE=;
 b=2/xt8J4PMWfwWRhXHPSqdOsc9VTic6XmrzYqH29ztZa7YUXdNSwdzfZjesVPQwBIZhGnzRUFpL/nV121VS64xace/RAgkaUabUyDLhbZI2m+IkXujzCa53Sgh5I9ZPpJszbUxm99E5g1Rgq2tWk849FIejbouwhu6dfcVcwwWKY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, "Juergen
 Gross" <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: [PATCH v4 0/9] Remaining patches for dynamic node programming using overlay dtbo
Date: Thu, 23 May 2024 15:40:31 +0800
Message-ID: <20240523074040.1611264-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|SN7PR12MB6672:EE_
X-MS-Office365-Filtering-Correlation-Id: 7468e249-a0b4-4744-f97f-08dc7afba794
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|1800799015|36860700004|7416005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NBmC6hn3LQhREzPCW69Tq4ZqhcLA27uy65HuAVw65egaUcvJbqJgrntnyCRk?=
 =?us-ascii?Q?HsJzFsHdOD7aCDOThMmvuxJtJmjpVQngcjU32KuNJPws3hp8gPyDZl6oj5V6?=
 =?us-ascii?Q?N1OXRGJXYVxE4ZAoVBRSkwaB+PP8/fZc391NxIht8ha6T+y6/geYT6uma02M?=
 =?us-ascii?Q?Fy9jXd8Qw+6qNpgU49dlDC8Vrd6Kicoj898WdLPV/p/K5w3hxVw1skA6olSO?=
 =?us-ascii?Q?dSk/HPrPJrPIwj2dRTLGI0vxMG8PR0XEDEnLfswEctraVmE0SzawC4vz0784?=
 =?us-ascii?Q?nmseRuqq+qcMJmfQHOvuvDX14sGrlHgl64ECA5K1NcRnipVk+jTDUfU3Km1p?=
 =?us-ascii?Q?6bYYsHFBga6vPuj4iqFiwM1Je94bykjj4enWGf+7cY433Qa3uzVDx+cQLhk6?=
 =?us-ascii?Q?z4Nbx+fQMgQGsHuAtBFceUl4i5aW4yXIILeUraAQaIiB7mvMuByTJp06yO+m?=
 =?us-ascii?Q?oJCEYH3+6rMLtqZWITKTrn5ucp6QwcvweOXbfUz1HMDuWGmg9w/HEebVfjbm?=
 =?us-ascii?Q?LIlJW6W6ld7E+5EtPLB/Tc4fK6CvGlC05TEskK5ci33O5sGVVtTO1YTer5he?=
 =?us-ascii?Q?bNSuFewWuf9PTZHL8yQcCO7ERbCSpE9Ftnn3mk/R9SvMYrTTYtPcgHTMJntu?=
 =?us-ascii?Q?ij+G840Vzl+WRv1xEwOyjZCTFXrpFA+O1dlwoTyk7i5gLiqowOSTIBrbNR8H?=
 =?us-ascii?Q?37o4GbzdBkMmGsEFGLZKjgwJQgmp8ciwZyP0jvEaqlNxTm4mG7GViwUoLIdx?=
 =?us-ascii?Q?c/ueOkNJAbr3kxgl0O0nkR0fwNoMyn7JHLROK7lFjfAefe6u/pSoQRcvOL+F?=
 =?us-ascii?Q?dGx0f4J0LP40imynIOVELoU99lF2lXAm+eTOmGZIzfGXVz1Xb7+2XL/6IrlH?=
 =?us-ascii?Q?5B05esIR7fEcpmwQbvruKA9qZpTYH+mpSajFGHnS49fTxlmtc2GCgmGtZahn?=
 =?us-ascii?Q?w59RZWd3Ky2/EWUZ6EkaA0QNxxPtoirF7yjPLdC2faeZAOwfFfpy9SrY1UBA?=
 =?us-ascii?Q?o/ajC+Xn5Pl6TU/I0RgG0FgAoKuId7PlCtf8rN/RlTGFeg1FBdJMMT7cfJ03?=
 =?us-ascii?Q?VKxKU+39alBlxqAW6NkSFy1D9inRTSAjkHLUr3Poqm2IITT/7lWxczY8Qt1+?=
 =?us-ascii?Q?ud76zRIpk2IWfRRrtCbDVnhl4plrU3CyCSeOYnAadbXtZVJQCcgPaAgOIrEd?=
 =?us-ascii?Q?Xbq/8PizAW5YiwPC8HbfmT8k+TSbnUju5lQC05u/N36sG2luCW3Fau9a7IT3?=
 =?us-ascii?Q?rJ83A3qH2saH6Jq5d756Q/NLZDg4SFKNeeMRnw4Cep/bTFiUp31Mb+fXY6xW?=
 =?us-ascii?Q?bdtAzLXaDbFiF3x/2C+VnVHtIOA9iZhf57UM5kflcMqibA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004)(7416005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 07:40:44.5924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7468e249-a0b4-4744-f97f-08dc7afba794
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6672

Hi all,

This is the remaining series for the full functional "dynamic node
programming using overlay dtbo" feature. The first part [1] has
already been merged.

Quoting from the original series, the first part has already made
Xen aware of new device tree node which means updating the dt_host
with overlay node information, and in this series, the goal is to
map IRQ and IOMMU during runtime, where we will do the actual IOMMU
and IRQ mapping and unmapping to a running domain. Also, documentation
of the "dynamic node programming using overlay dtbo" feature is added.

During the discussion in v3, I was recommended to split the overlay
devices attach/detach to/from running domains to separated patches [3].
But I decided to only expose the xl user interfaces together to the
users after device attach/detach is fully functional, so I didn't
split the toolstack patch (#8).

Patch 1 is a fix of the existing code which is noticed during my local
tests, details please see the commit message.

Gitlab CI for this series can be found in [2].

[1] https://lore.kernel.org/xen-devel/20230906011631.30310-1-vikram.garhwal@amd.com/
[2] https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1301720278
[3] https://lore.kernel.org/xen-devel/e743d3d2-5884-4e55-8627-85985ba339f9@amd.com/

Henry Wang (7):
  tools/xl: Correct the help information and exit code of the dt-overlay
    command
  xen/arm, doc: Add a DT property to specify IOMMU for Dom0less domUs
  tools/arm: Introduce the "nr_spis" xl config entry
  xen/arm/gic: Allow adding interrupt to running VMs
  xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains
  xen/arm: Support device detachment from domains
  tools: Introduce the "xl dt-overlay {attach,detach}" commands

Vikram Garhwal (2):
  xen/arm/gic: Allow removing interrupt to running VMs
  docs: Add device tree overlay documentation

 docs/man/xl.cfg.5.pod.in              |  14 +
 docs/misc/arm/device-tree/booting.txt |  16 +
 docs/misc/arm/overlay.txt             |  99 ++++++
 tools/golang/xenlight/helpers.gen.go  |   2 +
 tools/golang/xenlight/types.gen.go    |   1 +
 tools/include/libxl.h                 |  10 +
 tools/include/xenctrl.h               |   3 +
 tools/libs/ctrl/xc_dt_overlay.c       |  31 ++
 tools/libs/light/libxl_arm.c          |   4 +-
 tools/libs/light/libxl_dt_overlay.c   |  28 ++
 tools/libs/light/libxl_types.idl      |   1 +
 tools/xl/xl_cmdtable.c                |   4 +-
 tools/xl/xl_parse.c                   |   3 +
 tools/xl/xl_vmcontrol.c               |  48 ++-
 xen/arch/arm/dom0less-build.c         |  11 +-
 xen/arch/arm/domctl.c                 |   3 +
 xen/arch/arm/gic-vgic.c               |  36 ++-
 xen/arch/arm/gic.c                    |  17 +-
 xen/arch/arm/vgic/vgic.c              |  31 +-
 xen/common/dt-overlay.c               | 438 ++++++++++++++++++++------
 xen/include/public/domctl.h           |  15 +
 xen/include/public/sysctl.h           |  11 +-
 xen/include/xen/dt-overlay.h          |   7 +
 23 files changed, 678 insertions(+), 155 deletions(-)
 create mode 100644 docs/misc/arm/overlay.txt

-- 
2.34.1


