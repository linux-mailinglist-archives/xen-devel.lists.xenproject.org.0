Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EAE9E1584
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:22:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847290.1262411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAa-0008P5-3E; Tue, 03 Dec 2024 08:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847290.1262411; Tue, 03 Dec 2024 08:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAZ-0008MO-UX; Tue, 03 Dec 2024 08:22:07 +0000
Received: by outflank-mailman (input) for mailman id 847290;
 Tue, 03 Dec 2024 08:14:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIO32-0006dX-Ju
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:14:20 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2414::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9819adca-b14e-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 09:14:19 +0100 (CET)
Received: from BN9P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::7)
 by SN7PR12MB8818.namprd12.prod.outlook.com (2603:10b6:806:34b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 08:14:13 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:10a:cafe::3b) by BN9P221CA0012.outlook.office365.com
 (2603:10b6:408:10a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 08:14:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.1 via Frontend Transport; Tue, 3 Dec 2024 08:14:13 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:11:28 -0600
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
X-Inumbo-ID: 9819adca-b14e-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/kZ9Joc87vuAm1mqEjUhAqu7vQSfyLUoD/o4/CnKCJ3/VEhHJM87UFgbMraxZSoMMyT+pSEoZzyiH/kCCvBQyfnzmyTTaW1ltXvMyme4G+uYK5qo/+BSqhp2v+54M9tCVWHdLqDHl5SDZtCgp6pEhLCFVYhkJq+hA7n4WoGioG89urvekrwOOhBJNdd9BLfLKnphkzK4r255DMokh7/qjhEFLjhrbruWxOxoML+8BWwl6Vc0VrhXlVj3K/jwOwuztvUaY59Qxew0Ayx8KCdgByxH4D/yy5vvOn7U+9xZUwmh3NbITJCkxtBoADLg8oWdx0XF7IdkX2wg6mJhKM+tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LbG/8IIub4wmb2kCfj2ltWzhRP860ymQnZzHFTwDL8=;
 b=V96EQabQaaFuFLUpJ2I6N15R8PXVpzoRuGuB78ZKZrug15quF4oZ3hCv/B3X9bBIFnoi4oVvDl4V6rRWIgFAfYUYzKAQlYNLDtW0xo+8BpLfl2N6VKnlhrptuzGUp/f0lGmYa3KdjDSP3KKxjFySbcBj85DCbqsFOAJqmEOzK3JQ6ZnHSQPHqxB6Eg836KuoZqW15m0P92JKt9JUjofz7yCVp6GIuC4sFzqfKNoEi5oSqU8FKdkL2cFQ6o3JOt+PDGIQffdDdt7h1VuG9nI++dTGmQqnadk57+7yLbXttUW9OtAHge+q/r2BlphyBFMjwir0HRJOVkQlWRx3cwLp3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LbG/8IIub4wmb2kCfj2ltWzhRP860ymQnZzHFTwDL8=;
 b=UP5XWTPgPImhhfxUoxCDEio0ZX2qljd5toiAl3z4mU6LcoGwecu9Vd+HGXwGZZv5iQMkduSLM72thvpctOkhD3nCBO6aIa0eoBP3ES8PSDPk5G8KChF65IbCL/lfdWryYZ07br/p9/DpnRit20ZG35RB0rhBmXWZYSWXfuK4A18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <Ray.Huang@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>, <penny.zheng@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v1 00/11] amd-pstate CPU Performance Scaling Driver
Date: Tue, 3 Dec 2024 16:11:00 +0800
Message-ID: <20241203081111.463400-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|SN7PR12MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 9463a888-a7f4-4bb1-efb0-08dd13727905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ClctKpYGuSar7O7AsGCs74lfRQ8NY1TtyiZ/0TPuTp3Ip4IoFLpnP+KUBz3w?=
 =?us-ascii?Q?8o8hHwpBRiIl6lqecgSPAnM/vArcvf0mGS/aN84YysgwD6zbLJe+IFID7yoe?=
 =?us-ascii?Q?ikGNeWr7D8HtjXBwY68j0Xsz7TXD1buE7tHNl3yEVYpIh5CZeRbFzeHs6SvN?=
 =?us-ascii?Q?WmIDpGJpGKXG+DqrpruYMJIRkNFZTs3v5jz2+nC+KAPllUo6AsowCkVXVvEq?=
 =?us-ascii?Q?Kag6PC+TKlTJZtjohKU2H0eALuCIp+uMkLqWq+wguZbpWbv0yUjhdDB5shFm?=
 =?us-ascii?Q?R1toRBDbE5HqkEevSMZV4/TTNYZalY1HJFxsxLemt9rXPm3knSNJpJjCHaF0?=
 =?us-ascii?Q?9UCphKYVYm2ymdgbK9Mywy6lGX/WvvvwkmBnB5m/IVJNSLpT+py9gBRZcXOf?=
 =?us-ascii?Q?KupTEOy0mIToHIQ979xThP8q4SLQPsLETMtBztAlOdi4scjUjUtP5wwGb+dO?=
 =?us-ascii?Q?yViQr8y+cIpV6bNOlhvU5XShDfIO8oBr1XCT8tYW88C0xn+UKeBB1RakwTCR?=
 =?us-ascii?Q?XCFBE2++aDMs6XCVjivDWDoX3lnQ9SeIrcZ0c7oJddgZYLdJm5QTmXUVc+cg?=
 =?us-ascii?Q?RqdD1IZmj3aKPgkl57Kug3vyTH34PPBBbepVH0Tou4cvcQT3XPkWzqYR0rLj?=
 =?us-ascii?Q?psp+8ZnjPmCaPayoW4Wd+fPRcQ/2BNSfquESWHEHiJ4o/yAsTy1SwCl/LkxE?=
 =?us-ascii?Q?dXCH8ZIuGn4IY10eBrNPR0brwMGA2AZNEtGjO9owZqpNku413BYACHJeY+tk?=
 =?us-ascii?Q?ENgKUlUebUneb4Mu4lShQTTb2Ehk559oZadex3OLhIrQpdrfyTOczmE8PB3c?=
 =?us-ascii?Q?plYkoXR5/xBqnz0oz78z5DBtikdF5uiZCe/Y+RrSS2HeGXUdl8BQChUgjKuc?=
 =?us-ascii?Q?9AHlSHpupC9HlpizOL5TO96Z4vH+Fm+cl5+M5a7OrBOTo+qNP1MObUVqZ3yF?=
 =?us-ascii?Q?PCUpN6OMQYPL0ZtqDLQEy6F8rOOfJUwLgCGYOj6TGWoxRMvh5XriiagOBq0y?=
 =?us-ascii?Q?fXnSgxuRoNKgBEbdiB3CWuuaJDnlrzVPpXyqCq1xB6xaOEwZhBc9UYYufDq/?=
 =?us-ascii?Q?OXl2wW+KiAgRqVv7M9HxAZ2WmaPIUqkdqxmaL3czu38Tk4ISDHp+OJmKQstk?=
 =?us-ascii?Q?F5grvLQGcvm9baa7FhFk1DHbcwaK3jbb1awrlvh8IKW0M4xo2/kwbRB3dCnj?=
 =?us-ascii?Q?ZxJTFOhgtjMThYQxhQJuP+JNvGexGT9j5+Ne9H6SfCJhzuIsTVoZPlGml3I5?=
 =?us-ascii?Q?Ple7F7Im6RpqvQdBJGBCvZx4do1vOj87RPYfo/rSACkXk+tSd6fIG4dm9+Qv?=
 =?us-ascii?Q?tT4MzjNhnibxxmK9XHzHlqM8C3yqU0OJjp0ngi3XS+TllAcYC4RwyTPoLKST?=
 =?us-ascii?Q?a+BFEBcyAR5ABZbSF0phTJPAyG9SzT8Zy2kUaKVWL2/OUR21CW8iIjOF1Al6?=
 =?us-ascii?Q?+hKhj3UJqd8RdQIdWeQhvXmriqhKmzAX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:14:13.3329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9463a888-a7f4-4bb1-efb0-08dd13727905
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8818

amd-pstate is the AMD CPU performance scaling driver that introduces a
new CPU frequency control mechanism on modern AMD APU and CPU series in
Xen. The new mechanism is based on Collaborative Processor Performance
Control (CPPC) which provides finer grain frequency management than
legacy ACPI hardware P-States. Current AMD CPU/APU platforms are using
the ACPI P-states driver to manage CPU frequency and clocks with
switching only in 3 P-states. CPPC replaces the ACPI P-states controls
and allows a flexible, low-latency interface for Xen to directly
communicate the performance hints to hardware.

amd_pstate CPPC has 2 operation modes: autonomous (active) mode,
and non-autonomous (passive) mode. We register different CPUFreq driver
for different modes, "amd-pstate" for passive mode and "amd-pstate-epp"
for active mode.

The passive mode leverages common governors such as *ondemand*,
*performance*, etc, to manage the performance hints. And the active mode
uses epp to provides a hint to the hardware if software wants to bias
toward performance (0x0) or energy efficiency (0xff). CPPC power algorithm
will calculate the runtime workload and adjust the realtime cpu cores
frequency according to the power supply and thermal, core voltage and some
other hardware conditions.

amd-pstate is enabled with a top-level cpufreq=amd-pstate option. It will
fallback to cpufreq=xen if amd-pstate is unavailable.

With `cpufreq=amd-pstate,active`, We did a 60s sampling test to see the CPU
frequency change, through tweaking the energy_perf preference from
`xenpm set-cpufreq-cppc powersave` to `xenpm set-cpufreq-cppc performance`.
The outputs are as follows:
```
Setting CPU in powersave mode
Sampling and Outputs:
  Avg freq      2000000 KHz
  Avg freq      2000000 KHz
  Avg freq      2000000 KHz
Setting CPU in performance mode
Sampling and Outputs:
  Avg freq      4640000 KHz
  Avg freq      4220000 KHz
  Avg freq      4640000 KHz
```

Penny Zheng (11):
  xen/x86: add CPPC feature flag for AMD processors
  xen/x86: introduce new sub-hypercall to get CPPC data
  xen/x86: introduce "cpufreq=amd-pstate" xen cmdline
  xen/x86: get processor max speed from DMI table
  xen/x86: introduce a new amd pstate driver for cpufreq scaling
  xen/cpufreq: introduce policy type when cpufreq_driver->setpolicy
    exists
  xen/cpufreq: only set gov NULL when cpufreq_driver.target() exists
  x86/cpufreq: add "cpufreq=amd-pstate,active" para
  xen/x86: implement EPP support for the AMD processors
  tools/xenpm: Print CPPC parameters for amd-pstate driver
  xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for
    amd-pstate driver

 docs/misc/xen-command-line.pandoc           |  15 +-
 tools/misc/xenpm.c                          |  19 +-
 xen/arch/x86/acpi/cpufreq/Makefile          |   1 +
 xen/arch/x86/acpi/cpufreq/amd-pstate.c      | 641 ++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c         |  28 +
 xen/arch/x86/acpi/cpufreq/hwp.c             |  10 +-
 xen/arch/x86/dmi_scan.c                     |  19 +
 xen/arch/x86/include/asm/cpufeature.h       |   1 +
 xen/arch/x86/include/asm/msr-index.h        |   5 +
 xen/arch/x86/platform_hypercall.c           |  12 +
 xen/arch/x86/x86_64/cpufreq.c               |  18 +
 xen/arch/x86/x86_64/platform_hypercall.c    |   3 +
 xen/drivers/acpi/pmstat.c                   |  24 +-
 xen/drivers/cpufreq/cpufreq.c               |  71 ++-
 xen/drivers/cpufreq/utility.c               |  11 +
 xen/include/acpi/cpufreq/cpufreq.h          |  27 +
 xen/include/acpi/cpufreq/processor_perf.h   |   1 +
 xen/include/public/arch-x86/cpufeatureset.h |   1 +
 xen/include/public/platform.h               |  12 +
 xen/include/public/sysctl.h                 |   3 +-
 xen/include/xen/dmi.h                       |   5 +
 xen/include/xen/pmstat.h                    |   3 +
 xen/include/xlat.lst                        |   1 +
 23 files changed, 910 insertions(+), 21 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-pstate.c

-- 
2.34.1


