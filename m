Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DD3B43283
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 08:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109497.1459051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3ZX-0002kj-2w; Thu, 04 Sep 2025 06:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109497.1459051; Thu, 04 Sep 2025 06:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3ZX-0002jI-0J; Thu, 04 Sep 2025 06:35:51 +0000
Received: by outflank-mailman (input) for mailman id 1109497;
 Thu, 04 Sep 2025 06:35:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UG7t=3P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uu3ZV-0002iS-Bl
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 06:35:49 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2009::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63dc3dd2-8959-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 08:35:48 +0200 (CEST)
Received: from BL1PR13CA0123.namprd13.prod.outlook.com (2603:10b6:208:2bb::8)
 by DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 06:35:41 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::50) by BL1PR13CA0123.outlook.office365.com
 (2603:10b6:208:2bb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.7 via Frontend Transport; Thu, 4
 Sep 2025 06:35:41 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.0 via Frontend Transport; Thu, 4 Sep 2025 06:35:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 01:35:40 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Wed, 3 Sep 2025 23:35:37 -0700
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
X-Inumbo-ID: 63dc3dd2-8959-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSXnEc2nrB6hVKsbchqDu4cob5fOLcErZ8CVKk4gjvGeq9J9wHwTglxC/+XS1rumK0fiKEu5eRiQoG7lZouRdzXhA+bLKWf5hgdDiNioDpDPH7qvB/TU+u3bEKyGxhvrLb7oElxl6t848WS/XVE+FlaiPJzbv4Gr/LvmTESEKxZG6ybY4aJzweFYqgBRLObMgtTyKoWLwBXFiXgCxeKfu2lmRna5h57llPw9xHQ57/s+4Z5Wx1cfWy7yGNF+ARLmyy0ctt9/vX1gzrRixZFmRDhOHCch/zWxyM/XmxkeQEPlgzlcQzuSfRC43ogGpo3boaw0tCGTFoMYcUvFH/BOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0vfpD93FqCKRkqZ+5AZHXJ1ZRa+l+e1phs7KLQWPUU=;
 b=kQSEDWh+zpnOyx9GfxvOwnAxrmJQb44HmKwHgxjxZdScdVfFbotvCDAFuxrw7KVrWoY/5qZBZwirjD63pzWvcQ7/SGPNT+8r9HFqFInlt96lOEDPupU1TCuPvP/RycCFTIAHv58c/44kXkjOUIUwUewWbQN1HDiUWYLuR3bB8EVpOmn58kr7VsdJ4TXA1NBON+8/B6/gSFGHZmUsaoCWa5Mjf4ytxR8qaxaOlXrlIO1lfSJxsmMoKF7eFyPVxA01RBLD3u6G4y92I5SznjULuQFSW6z7bbEpWwxGXJ2LOhl5M16Fyeit8QtHm3isDFv+mCpK/gXvB3XBgYXmdAzsBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0vfpD93FqCKRkqZ+5AZHXJ1ZRa+l+e1phs7KLQWPUU=;
 b=lnbI2zjdSi/V78GT9Z77Ujo0h5NVjmTABio4CnQmMLhXqcPsAuBRc3nXOwYjYvNdxBRB/XcfrlHpeqoEHaAz5igjGw+9tJ+vIsxox0ywYe3q/y7E2fruzRVt39qzBoH+xzirhNROwyPLEAINuGLNTxmgAdsAgUDvKuwwINvBs5o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v9 0/8] amd-cppc CPU Performance Scaling Driver
Date: Thu, 4 Sep 2025 14:35:10 +0800
Message-ID: <20250904063518.2097629-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|DS2PR12MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d617140-bd19-4926-4a20-08ddeb7d44b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iHTDNff6VzRllsP4Y1Yy/jpWMsx6Km0EGIJ68+V8Iv6ZLxDoGddpf5OTZDwe?=
 =?us-ascii?Q?iet0Hqz7YZgZXNsWngYLPSChFfpfPPeC/ex9WGlOfVV0SmWE4cBCxjuq97rq?=
 =?us-ascii?Q?i1MMvzjyajrwa6RRkj7+p5sPUDjLD/MeaU4iLRpRFh2Kfr3yT7yGfzuzZW5j?=
 =?us-ascii?Q?K+Be1/NhOJs9t1zf6QYgqve7clRZM8ovbUbdepGhVqrDIhiuzNUKlMyiOhCl?=
 =?us-ascii?Q?KNfB25tWFmZNbrao9AKNOfRUNmAwGqz14t9quTKUC6YgiO6WfXZ6gtwqtKKp?=
 =?us-ascii?Q?pzU0+2opybn/Zn1Ey+447jD4iDfwoqP+iZhVPboBX0NR+zGKgtqvfSjxLEzC?=
 =?us-ascii?Q?TihEBgVekJqBqRAWUe1hpY1waW6CK1LrMCBHXui3npPR+XPlZuZHcbAPLoEE?=
 =?us-ascii?Q?QRzPwasRK7j9bLx1iZ3jDmRD39P7zNHRXN0kFBHJQyp2DzEeeIgDqvmagFtn?=
 =?us-ascii?Q?v/VOHyjeRRk/mn2DYrQODT2wB0V62PutV3O5mbiJRevAVGcZli9aNvw/mmFl?=
 =?us-ascii?Q?l/yRs11EjE+aCU24aCuxmyKW8v4fIjMdZtQ5iJ0t7SgHvfsdf8BdGgT0FwlN?=
 =?us-ascii?Q?0I0oCmJd1uEwac2w8eBACzrHutcCo1QwWfQ3lCFKPrFdJ1zCRaBDogrwY9KB?=
 =?us-ascii?Q?6ARpFbtdvMwpRtVA+zRbOUF6IzPkWsMfZfA1kWoxXKk2h6J7ZGwv1J4Bnx2L?=
 =?us-ascii?Q?/NeIXlCa3B/v/E4Yzb8JL3uLtrX7wRtqAvDPbmIqF2o+RR4wdJgh4Q7MSRu7?=
 =?us-ascii?Q?nIMLUwuo6n5PBG8kkAfdS7RNS3ZQrS1XXWjAbCd4IwWcmusLv8tXFLLF0V2q?=
 =?us-ascii?Q?nYPZwhEnlf00UiKidUrdBsdrHenCdrLs5wkTly6X/puADOynGVq6/r0gzR/9?=
 =?us-ascii?Q?XQG721BBjMle+1el8aKKe9GWFWUwkyaMRdNt9VAf4tX91LQxJX7aNhTERyDk?=
 =?us-ascii?Q?Yq8gBDX1pj2c+w3gj2QYk+Or3VkQrVFRb1xgk4VCo2j6R8FeYNjL/f9vwiI6?=
 =?us-ascii?Q?9YMqUTLGKv1rumV3tUIppG9Nk9/YrpNBvp5oKgwp6h+4W0clHxwDn5EA9RTQ?=
 =?us-ascii?Q?+cFG1Z+MaRm+ai6FKpQQxq4xv/16bJuQpN6EVilA36uDIXNRPbSRC/hDOiwV?=
 =?us-ascii?Q?PrKouN52ST3oSYV0R9hdXR6lOMiPpaTHqXFd8RbCgpXbRRn2b2bF7WqTqSQZ?=
 =?us-ascii?Q?qJk08mZso+yYWTwcaPWyw8yUbyJV/50aeUdIvr1+0t01k3TGdPWeVLbrgWUK?=
 =?us-ascii?Q?6NZRa+1HLBi8dt2cTRMao9wsgToShe69nj2Nwx87sVY7uJUfZ9kh1znaZsUu?=
 =?us-ascii?Q?V6x3r+Cwo3GWAICd9bcBIeQSFYJrQpofeVsSezCYg5RLlxwpaXKujES5cfIK?=
 =?us-ascii?Q?dOkMF+Phpja4r/vPz00evZJn9SX23wsZ25JyPDvHSFtQDQ5Qcj6b3hGeGB+M?=
 =?us-ascii?Q?/rKONIYeNJfPZ+ET8SyRFjVM5WOm9cw/SB9F6i8LVOKecWz10BLB6s8eXmIR?=
 =?us-ascii?Q?vOO20+kyVFABPSRIo1K01Lm1wkf8yW7AWQiv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 06:35:41.1963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d617140-bd19-4926-4a20-08ddeb7d44b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589

amd-cppc is the AMD CPU performance scaling driver that introduces a
new CPU frequency control mechanism on modern AMD APU and CPU series in
Xen. The new mechanism is based on Collaborative Processor Performance
Control (CPPC) which provides finer grain frequency management than
legacy ACPI hardware P-States. Current AMD CPU/APU platforms are using
the ACPI P-states driver to manage CPU frequency and clocks with
switching only in 3 P-states. CPPC replaces the ACPI P-states controls
and allows a flexible, low-latency interface for Xen to directly
communicate the performance hints to hardware.

amd_cppc driver has 2 operation modes: autonomous (active) mode,
and non-autonomous (passive) mode. We register different CPUFreq driver
for different modes, "amd-cppc" for passive mode and "amd-cppc-epp"
for active mode.

The passive mode leverages common governors such as *ondemand*,
*performance*, etc, to manage the performance tuning. While the active mode
uses epp to provides a hint to the hardware if software wants to bias
toward performance (0x0) or energy efficiency (0xff). CPPC power algorithm
in hardware will automatically calculate the runtime workload and adjust the
realtime cpu cores frequency according to the power supply and thermal, core
voltage and some other hardware conditions.

amd-cppc is enabled on passive mode with a top-level `cpufreq=amd-cppc` option,
while users add extra `active` flag to select active mode.

With `cpufreq=amd-cppc,active`, we did a 60s sampling test to see the CPU
frequency change, through tweaking the energy_perf preference from
`xenpm set-cpufreq-cppc powersave` to `xenpm set-cpufreq-cppc performance`.
The outputs are as follows:
```
Setting CPU in powersave mode
Sampling and Outputs:
  Avg freq      580000 KHz
  Avg freq      580000 KHz
  Avg freq      580000 KHz
Setting CPU in performance mode
Sampling and Outputs:
  Avg freq      4640000 KHz
  Avg freq      4220000 KHz
  Avg freq      4640000 KHz
```

Penny Zheng (8):
  xen/cpufreq: embed hwp into struct cpufreq_policy{}
  xen/cpufreq: implement amd-cppc driver for CPPC in passive mode
  xen/cpufreq: implement amd-cppc-epp driver for CPPC in active mode
  xen/cpufreq: get performance policy from governor set via xenpm
  tools/cpufreq: extract CPPC para from cpufreq para
  xen/cpufreq: bypass governor-related para for amd-cppc-epp
  xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc
    driver
  CHANGELOG.md: add amd-cppc/amd-cppc-epp cpufreq driver support

 CHANGELOG.md                         |   1 +
 docs/misc/xen-command-line.pandoc    |   9 +-
 tools/include/xenctrl.h              |   3 +-
 tools/libs/ctrl/xc_pm.c              |  25 +-
 tools/misc/xenpm.c                   |  94 ++--
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 703 ++++++++++++++++++++++++++-
 xen/arch/x86/acpi/cpufreq/hwp.c      |  32 +-
 xen/arch/x86/cpu/amd.c               |   8 +-
 xen/arch/x86/include/asm/amd.h       |   2 +
 xen/arch/x86/include/asm/msr-index.h |   6 +
 xen/drivers/acpi/pm-op.c             |  58 ++-
 xen/drivers/cpufreq/utility.c        |  15 +
 xen/include/acpi/cpufreq/cpufreq.h   |  44 ++
 xen/include/public/sysctl.h          |   5 +-
 14 files changed, 936 insertions(+), 69 deletions(-)

-- 
2.34.1


