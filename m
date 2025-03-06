Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CEAA55947
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904063.1311973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJJt-0000Zh-VT; Thu, 06 Mar 2025 22:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904063.1311973; Thu, 06 Mar 2025 22:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJJt-0000Vk-Qq; Thu, 06 Mar 2025 22:03:57 +0000
Received: by outflank-mailman (input) for mailman id 904063;
 Thu, 06 Mar 2025 22:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJJr-0000St-Lh
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:03:55 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1a6e162-fad6-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 23:03:50 +0100 (CET)
Received: from BN9PR03CA0084.namprd03.prod.outlook.com (2603:10b6:408:fc::29)
 by IA0PR12MB7602.namprd12.prod.outlook.com (2603:10b6:208:43a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 22:03:45 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::30) by BN9PR03CA0084.outlook.office365.com
 (2603:10b6:408:fc::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.17 via Frontend Transport; Thu,
 6 Mar 2025 22:03:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:03:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:44 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:03:43 -0600
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
X-Inumbo-ID: e1a6e162-fad6-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkEZU3U7tFfJmuIujTom24Ga0jGLw0uCcGvmcH7XyJGf01sOXjTPfmTuDS5C5KK15i6o9z2chxPPLCjPCILhKWHq6UxitcxAHGQBac0s2xHcSzEfkshQk5SrC2D5pwspO7VIf2VPK2Y5V28HnHDBcVoge3Fy+yN1gh/hyAHQ+os6FVTnRanaYPBSu+tA3LY4qTOs9Ib0lzqi7ewRLEjvRLhmIZyjWsT1hxVR6iNfkbEVLMEaD0S+GCeovO/HtjgWOcy5xg8625cWVHTXP+y5es6riRH4oi05J5iwBrmWtRKb2NZNCX7VD66T54Z/b4B7rOd9X4ifB7tlLIXz/YbCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZmvhT6nCE4j3onjtbDsQyRYYBH3tCizsA5vpT9tGmk=;
 b=OnzMcmFQ9czPjN57XTheAgfYzC66fhneAUwHGxWyhiRVVpJietbDfuMrX2NIt2wfP1ORNZ4Po5t63Xa3v9DJJrmUGGE7OnKPlpqz3sxWj87Cu+nWJ7Ih4weBSemJycY8g/ZjVKfGvzgW1elQBRc+awprYdotp1NdwThXmiCSXSe1M8FLCLxj40nJgVXT1Bkfwg0a7Q3mjZoPXQP13WmJeDGIs7ew4FqCczVvibvHjMm+8+ajURBEILPYloes8y1VzRccRES8y934PT6l99IwdRpOsMf4RQ28OBSGmgJeye4cqvQMy7IdBQqmRVNwt891C93hBQBo9phS2fBSrkjFaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZmvhT6nCE4j3onjtbDsQyRYYBH3tCizsA5vpT9tGmk=;
 b=POehc0LYTWrFyYrBpezCbWisJAGGa4qNczzxfZ7/FNhSHyyCY50/V0YdpiTWwhLeOMso3sgfCYfLqABG8ZWkSPdN5pt7T4H0NTFff6UHVrwvsSh9FwDBp83nlAP1SWJmXbC8oO02tfYPOZ7DR3IOuG9PWGIGG3ihnyuObghzix4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 00/23] ARM split hardware and control domains
Date: Thu, 6 Mar 2025 17:03:20 -0500
Message-ID: <20250306220343.203047-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|IA0PR12MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 892991ce-d7ea-4038-18f3-08dd5cfac38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?84bnpxTJnjPvirNICD3slmrStn4nKYmy4LOh0X2xG+4vSRoUaQOcladf44UV?=
 =?us-ascii?Q?gYPWGeXCO6rq9prLFTcYj0Ops1faGjAZrU/xxI8iGMK6J22kv+IKuafYnC5p?=
 =?us-ascii?Q?h3uOtJ/ghyadMfpcUic8e/HP0cpByvhy2GJagf592e3S8xvRZUGskvcPJ75I?=
 =?us-ascii?Q?ubhwzXR4SFthrbWyea5tVoRip2if2piAp57TRmD7If62uU4viLHJcsPr86RW?=
 =?us-ascii?Q?7ZsFY3+dhi9gphHDEsxwnQf3iDPc1z5VY4WoP2KSxpRCBQ+clRiWmLgixs1K?=
 =?us-ascii?Q?fhOItcHqF4Z2adcsiSPvcWCc8TrU53piVaiqa9VV6KUvrUdQ8OU8oxAoWtdC?=
 =?us-ascii?Q?fXOZQcCTG2zdzjblulRnVKfsByJbidv4AFy+R30XscPgo8f7uhBwhShxbtq5?=
 =?us-ascii?Q?eB5nVQtHEiiBpqXJkKR42zBZwvLEqBxxeMeWsmMemhDeIUDTG5ClSV6NzbyA?=
 =?us-ascii?Q?gpX0cShl9Oq8J7pn2wP4a3J4m6KjNAcJT7IoeKf1f5A4/eTR1iQ8RJJk2lmJ?=
 =?us-ascii?Q?T0RWeY/pPvqzFwPNWsAnmav3R1Ut6UncMphYsOXj62kxoJx4wjx3gDJIJE8o?=
 =?us-ascii?Q?hHtadcgE1YWPzHdfPXf3Yns7SHuGE4r56mjSdv8joeEplC4dmZBBOKWX7un9?=
 =?us-ascii?Q?opdCkJOL7RqYp81hdR7MeE/NiO2v00njQUqE7I9P0UjWMcAZ26VcuWd12Wzt?=
 =?us-ascii?Q?KVRAyGsud8vDuDniPchj/vXzUWawEiBHzZyE2dw0NzUo2612RkyHR+u+31pA?=
 =?us-ascii?Q?DJfV9tR1+yiqvkVMV16tE+jIDSQr466YeNMeHGu+xPiP07FmQZoXmYVeCNhF?=
 =?us-ascii?Q?+GakVYp6Q8L9QgEmY5rqAkklGt7j7rrWOReOxEhIk3aW+PfB8IDpKRg25gOA?=
 =?us-ascii?Q?GmVG0clWGJ8S6WRymHAaPBTLWqhYK7DATjFpqNLSF9tgJW1cNHFIZuK2lVZ5?=
 =?us-ascii?Q?jS910+VQoXUS7WCErpcWd5PHOnVkWse2gsOxcSan3y3/yVfnky/ng5HjOcph?=
 =?us-ascii?Q?+IrA182sVWgPbXpm9Y9Yl/rGukSB7LzRptQytAwj3H/TvIlMQJaZhxLjPsPm?=
 =?us-ascii?Q?MZhphjonrDTZnPf71ysYP5UE1idQvOyVfvtQys66iN2LwAwHRAqo+95Lj3WT?=
 =?us-ascii?Q?vcHW4jGgU2eVA+psrTiyVoOfHV/e1IkFkT036KmRHZJUD0wXF8jP9PY4tttN?=
 =?us-ascii?Q?EqKx8Q+1Ntrq8liB/BQI1qKeUDzWJ9sKwx4GNrH9MdQDKXSdkQ9T0hGSws4A?=
 =?us-ascii?Q?TWUar0hV8LYRksni4JJopCo4mHXRJacCXADdPrKuBxO01SjsbCy6hpTSJwi0?=
 =?us-ascii?Q?0l/jz/Y9N39eZZlOVQVust/8JIwn80TfoO4CYOht07Pr0Qt+4kTzWNeErLop?=
 =?us-ascii?Q?zitI4/5F4/7Hm1WUgpIOZN5HaB8OcIUIhucbgbXJdZ/pp+nz+/hX3o4TMV5R?=
 =?us-ascii?Q?JENC3IfIm0VqLooWs+buQMXIHfTW4d/VEkjdPL40G7unjXTzYo6iYVkJDUSD?=
 =?us-ascii?Q?+kMcvhDuynVAwQ4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:03:44.8196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 892991ce-d7ea-4038-18f3-08dd5cfac38a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7602

This series implements separation of dom0 into separate hardware and
control domains.  It uses the capabilities idea from Hyperlaunch -
hardware, control, and xenstore.  It's been tested with dom0 as hardware
& xenstore, dom1 as control, and dom2 as a domU.

Running hardware and xenstore together eases the implementation.
Xenstore permissions were tested with a hyperlaunched xenstore stubdom.
C xenstored is needed to use grant mapping instead of foreign mapping -
this is especially needed for hwdom to provide the xenstore to control.
Xen seeds the xenstore grant entries since init-dom0less in hardware
domain does not have permission to map the grant table.

There is a dependency on an ImageBuilder update to generate the
capability device tree nodes.  An update for the automation is in the
last commit - not to be commited.

The early patches re-work dom0less code to allow construction of hwdom.
There are some changes to expose the capabilities to the toolstack.

xenstored is changed to track dom0_domid (hwdom) and priv_domid.  This
works for only a single one of each.

Then there are a bunch of changes to the XSM dummy policy.  The sysctls
are the most problematic.  With a coarse grain policy, they are allowed
for both hwdom and control.  Flask can be used for fine grain control.

Finally, an automation test is added.

Daniel P. Smith (1):
  xen: introduce hardware domain create flag

Jason Andryuk (22):
  xen/arm: Factor out construct_hwdom()
  xen/arm: dom0less hwdom construction
  xen/arm: dom0less use domid 0 for hwdom
  xen/arm: Add capabilities to dom0less
  xen/domctl: Expose privileged and hardware capabilities
  tools/libxl: Expose hardware and privileged flags
  xen/arm: dom0less seed xenstore grant table entry
  tools/init-dom0less: Only seed legacy xenstore grants
  xen/arm: dom0less delay xenstore initialization
  tools/xenstored: Automatically set dom0_domid and priv_domid
  tools/xl: Print domain capabilities with verbose
  xsm/dummy: Allow XS_PRIV XEN_SYSCTL_getdomaininfolist
  xsm/dummy: Allow XS_PRIV to call get_hvm_param
  xen/xsm: Add XSM_HW_PRIV
  xsm/dummy: Allow hwdom xen_version
  xsm/dummy: Allow hwdom more - except targeting control
  xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo
  xsm/dummy: Allow sysctls to both hardware and control
  xsm/silo: Support hwdom/control domains
  automation/dom0less-arm64: Use double quotes
  automation: Add arm64 hardware/control split test
  DO NOT COMMIT: automation: updated imagebuilder

 automation/gitlab-ci/test.yaml                |   8 +
 .../scripts/qemu-smoke-dom0less-arm64.sh      |  87 ++++++++--
 docs/man/xl.1.pod.in                          |   3 +-
 docs/misc/arm/device-tree/booting.txt         |  11 ++
 tools/helpers/init-dom0less.c                 |  10 +-
 tools/include/libxl.h                         |  16 ++
 tools/libs/light/libxl_domain.c               |   2 +
 tools/libs/light/libxl_types.idl              |   2 +
 tools/xenstored/domain.c                      |  16 ++
 tools/xl/xl_info.c                            |  24 ++-
 xen/arch/arm/dom0less-build.c                 | 164 +++++++++++++-----
 xen/arch/arm/domain.c                         |   3 +-
 xen/arch/arm/domain_build.c                   |  35 ++--
 xen/arch/arm/hvm.c                            |   2 +-
 xen/arch/arm/include/asm/dom0less-build.h     |   2 +
 xen/arch/arm/include/asm/domain_build.h       |   2 +
 xen/arch/arm/platform_hypercall.c             |   2 +-
 xen/arch/x86/hvm/hvm.c                        |   8 +-
 xen/arch/x86/msi.c                            |   2 +-
 xen/arch/x86/physdev.c                        |  12 +-
 xen/arch/x86/platform_hypercall.c             |   2 +-
 xen/arch/x86/setup.c                          |   3 +-
 xen/common/domain.c                           |   2 +-
 xen/common/domctl.c                           |   2 +
 xen/common/grant_table.c                      |  10 ++
 xen/common/sysctl.c                           |   2 +-
 xen/drivers/passthrough/pci.c                 |   5 +-
 xen/drivers/pci/physdev.c                     |   2 +-
 xen/include/public/bootfdt.h                  |  27 +++
 xen/include/public/domctl.h                   |   6 +
 xen/include/xen/domain.h                      |   2 +
 xen/include/xen/grant_table.h                 |   8 +
 xen/include/xsm/dummy.h                       |  55 ++++--
 xen/include/xsm/xsm.h                         |   1 +
 xen/xsm/silo.c                                |   9 +-
 35 files changed, 431 insertions(+), 116 deletions(-)
 create mode 100644 xen/include/public/bootfdt.h

-- 
2.48.1


