Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A28358C7457
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722989.1127452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxf-0005HK-2n; Thu, 16 May 2024 10:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722989.1127452; Thu, 16 May 2024 10:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxe-0005EX-VT; Thu, 16 May 2024 10:03:42 +0000
Received: by outflank-mailman (input) for mailman id 722989;
 Thu, 16 May 2024 10:03:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MS9v=MT=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7Xxd-0005ER-Bf
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:03:41 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90be1afc-136b-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 12:03:39 +0200 (CEST)
Received: from MW4PR04CA0249.namprd04.prod.outlook.com (2603:10b6:303:88::14)
 by MW6PR12MB8664.namprd12.prod.outlook.com (2603:10b6:303:23c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Thu, 16 May
 2024 10:03:35 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:88:cafe::ce) by MW4PR04CA0249.outlook.office365.com
 (2603:10b6:303:88::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Thu, 16 May 2024 10:03:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.0 via Frontend Transport; Thu, 16 May 2024 10:03:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:33 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 05:03:30 -0500
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
X-Inumbo-ID: 90be1afc-136b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xv21quXJJPUM1XQrsjr/ttbijV6QR1Y+hnZ4YOB+zg/QF1GPhQvDgI3Hqw+boUmU4YKRrXWOMZgUvUlu/iShIv7aN4EhAygQiY/8iwfstKYjqk978poPz9Kz054xwKkfJBkOVar/jLi0eQYkdndGfLvWUpvsRWFKpDH6pwX9Yw2IQqIPusZVo1XMvUlQcGIReyiz53yWbU+RrKrK6VlaYDTqS2c5+D2+8nkEAhmzLy7aJ6Aofvhx7udF+FBvgjdXjtBCgdM2oAqMulpV3CCBqa0dRwsL7tdbNhYEc9p4QkPlsuZS5Y+/O26u44N+2EICEvHLlvK6FWC0kgIf2jmOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/pgNhx9ywTPwFg7fK3LV9WnW4v2x0UNVhg62vcL7cw=;
 b=kev7jBOFws8DukOh3Tph3jjf3Q4YLXtd7pkn2kfjAVoCYm3PRhzO65gyP6RXRmfQSb5cIiRBs8D8L73+2aq0vO6WHzm+wE2iKc6NVpBP7pYNHaMSzdnWJ9YXGfHm9EnP7+AQZEcqiYEVMcT7oos3f2yxRj2aI//E0rdTHtDjLxr6ELG0ePfTSplk/cUzwBQuJukCfLegkWdfuDOeKY8425uDtyj/goGfaErm6vYXZj1L9RbIAmSwzY+J9IU+M8Bnat9FsR15CqPHm6XdCoOjkrhv8v6w0zZS7EvyJmtV8IHJLyXFTn+6jhJactdBir32+IOXeJ29aHlkBhpqHWEwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/pgNhx9ywTPwFg7fK3LV9WnW4v2x0UNVhg62vcL7cw=;
 b=p8sgbdoyRTJiNKjEQzdjsWQvwNtQfnRo1zdYpXBBG7b0ZWs2HbDXkK5Xfn8kcwqqv9N30DWA8XqzZ6dfvSGiT9cTw2Lfa5/K0F6BJ0nQUzUmYMhNkgZ2Egq6j7+pLxMQHh7pgeJm+woRqsglABPYqEWYuRAluWvMVHPTr/CJp+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Anthony PERARD
	<anthony@xenproject.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <george.dunlap@citrix.com>, "Nick Rosbrook"
	<rosbrookn@gmail.com>, Juergen Gross <jgross@suse.com>, "Andrew Cooper"
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/8] Remaining patches for dynamic node programming using overlay dtbo
Date: Thu, 16 May 2024 18:03:22 +0800
Message-ID: <20240516100330.1433265-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|MW6PR12MB8664:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b562db-f632-458a-7dd6-08dc758f72e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|7416005|1800799015|36860700004|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6X9jAmoW21R4lO9Dejfuo90UCHE8992osksi3mV4/asHAhEQzcYc/fP/1+5Y?=
 =?us-ascii?Q?yJ6LVu+jzx5YusI3o/3WhJ00oYLyd8cwVihUPjOJw06DNZGBFDH8FmkqEGVE?=
 =?us-ascii?Q?zkHDE0I3X2RVJ5nI9YJbEyi218Y3CQNO7bOsFvOKj92ByFVOYUw2f1mr2uMu?=
 =?us-ascii?Q?q/2pssGheDj2LIWZchmmG+3UFc4GwXjkifUHBfrcTp/nScYPy8I8FoaFgg7M?=
 =?us-ascii?Q?vtBxBbcnu2R3bIqd7j9a8xwFjVeUW8RPBVPkBrP9tDXu2LDbQCWTD1HZmw7R?=
 =?us-ascii?Q?+l5AAfiGV7POzxBx82sRDeAvkEOEPIerFcVM4YW3kLhcJFeByXF4qUgcgP9C?=
 =?us-ascii?Q?tg7NCYA1ip3G3VXXrAiXJWLGlYkpV1M2duiLGnFp/n0lJDyUEhJtCm8LbaWC?=
 =?us-ascii?Q?t2NnIh2DE0A3RCwqjpT+OWLOeH1isH07YFmrC2PhIHVA0MgXwGx0Fyate8Kn?=
 =?us-ascii?Q?rPdt5+cXYY40MYMqCkibrZY1H5zqpmlHp8VMcK3AkFHRokXouETkLBD/LfNE?=
 =?us-ascii?Q?oFdgd5TIpRCl8eno+u7qCP05+/mdZKqhTEsJkcD9FCRuRvUtXfA5ZYJnyoLe?=
 =?us-ascii?Q?hfvrZygGHxemKPXuojqz7DEaJwa9JpcE+R9MCrnyH9NDLes9oq7sAi+SX/Ix?=
 =?us-ascii?Q?ZuTUBOacKiDWoZDcCdo0+Y0sBVzzsVvkH3OuaVr2gxY4OeDBTyyrFTebuVfI?=
 =?us-ascii?Q?NYuTBIzkLrJN2QO+ET0Aqx2vZxiodmermCLKKLfVVWX77x1F75s2RxDwFVgc?=
 =?us-ascii?Q?DISOxxl/ERTx4GUzyjxlOPOhtIj/jSBPY6SOYQYvvsUMCUAqSRZYuQ1Xl09v?=
 =?us-ascii?Q?jMtvxVqfszO7mbpX8ynJ9YJgFuXL4tVhHgYi/SQKv6PWBlggo3nmg1cRPsUU?=
 =?us-ascii?Q?DMp3LxPC5+UAoFhAJwd7EEglVqnX4CtcZZV+RpqX14ypwjWT1Zk6dD6ifRad?=
 =?us-ascii?Q?FStjjZ4LLYQJjIiG9oXgIMzlfMEEadAt22n/3bzWWRuQ7ZiyD5G81828jNhG?=
 =?us-ascii?Q?QNadSWNIsad4NWdlXTsbDc4wO5P0ijzKj9zA8FZo2FwWkYTB6q6r3Zsh99py?=
 =?us-ascii?Q?BWIt3sR0ODwhlKZ3JrXVCBJVjg3AlxeL1QzEbzo1Ad2PLrDgL2o0FTrxVrzu?=
 =?us-ascii?Q?WcH0q4qCi5fmvUMcWcDW1zSxBilpM6+pl4cFwAla49spiuX0HzVx+BjqGZ0u?=
 =?us-ascii?Q?34rwi1MJ6yuYTkm7Bjm0+NiEsjttu8zFvJ2ZOFodrScQ07bog+H/FIz+Amyo?=
 =?us-ascii?Q?iL63fo59j5lh7JGMrG2tzJbL0Z+LaoWWJPhjWLgkJG4tpvHZsHijaC5Ropg9?=
 =?us-ascii?Q?vuj+aa8f8lOxNTQI3j+zbsF/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(36860700004)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:03:34.6726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b562db-f632-458a-7dd6-08dc758f72e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8664

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

Patch 1 and 2 are fixes of the existing code which is noticed during
my local tests, details please see the commit message.

Gitlab CI for this series can be found in [1].

[1] https://gitlab.com/xen-project/people/henryw/xen/-/pipelines/1293126857

Henry Wang (6):
  xen/common/dt-overlay: Fix lock issue when add/remove the device
  tools/xl: Correct the help information and exit code of the dt-overlay
    command
  xen/arm, doc: Add a DT property to specify IOMMU for Dom0less domUs
  tools/arm: Introduce the "nr_spis" xl config entry
  xen/arm: Add XEN_DOMCTL_dt_overlay DOMCTL and related operations
  tools: Introduce the "xl dt-overlay {attach,detach}" commands

Vikram Garhwal (2):
  xen/arm/gic: Allow routing/removing interrupt to running VMs
  docs: Add device tree overlay documentation

 docs/man/xl.cfg.5.pod.in              |  11 +
 docs/misc/arm/device-tree/booting.txt |  13 +
 docs/misc/arm/overlay.txt             |  99 ++++++
 tools/golang/xenlight/helpers.gen.go  |   2 +
 tools/golang/xenlight/types.gen.go    |   1 +
 tools/include/libxl.h                 |  15 +-
 tools/include/xenctrl.h               |   3 +
 tools/libs/ctrl/xc_dt_overlay.c       |  31 ++
 tools/libs/light/libxl_arm.c          |   4 +-
 tools/libs/light/libxl_dt_overlay.c   |  30 +-
 tools/libs/light/libxl_types.idl      |   1 +
 tools/xl/xl_cmdtable.c                |   4 +-
 tools/xl/xl_parse.c                   |   3 +
 tools/xl/xl_vmcontrol.c               |  39 ++-
 xen/arch/arm/dom0less-build.c         |   7 +-
 xen/arch/arm/domctl.c                 |   3 +
 xen/arch/arm/gic-vgic.c               |   8 +-
 xen/arch/arm/gic.c                    |  15 -
 xen/arch/arm/vgic/vgic.c              |   5 +-
 xen/common/dt-overlay.c               | 418 +++++++++++++++++++++-----
 xen/include/public/domctl.h           |  15 +
 xen/include/public/sysctl.h           |   7 +-
 xen/include/xen/dt-overlay.h          |   7 +
 23 files changed, 615 insertions(+), 126 deletions(-)
 create mode 100644 docs/misc/arm/overlay.txt

-- 
2.34.1


