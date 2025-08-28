Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45178B398FD
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:03:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098122.1452245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZSh-0004O3-8l; Thu, 28 Aug 2025 10:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098122.1452245; Thu, 28 Aug 2025 10:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZSh-0004MU-4W; Thu, 28 Aug 2025 10:02:31 +0000
Received: by outflank-mailman (input) for mailman id 1098122;
 Thu, 28 Aug 2025 10:02:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urZSf-0003e5-Ba
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:02:29 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2413::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1970d746-83f6-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 12:02:27 +0200 (CEST)
Received: from BL0PR01CA0026.prod.exchangelabs.com (2603:10b6:208:71::39) by
 DS0PR12MB7971.namprd12.prod.outlook.com (2603:10b6:8:14e::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Thu, 28 Aug 2025 10:02:23 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:71:cafe::f9) by BL0PR01CA0026.outlook.office365.com
 (2603:10b6:208:71::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 10:01:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 10:02:23 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:02:22 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 28 Aug 2025 03:02:19 -0700
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
X-Inumbo-ID: 1970d746-83f6-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQBDCkcSJsEpGyHvAlyl15EyIYWPzP/jmhGz9eEikQnDDuFXBpZWfheBBc7kf60C+4l1yn3DJ4pT4FaTbekafgAak93ahHT6UaVF5iPx+iyMp0rLEl6HBK5bQ/G2MIGtYDlB9cyJVRNYVIoh2Nr+zXNxGSyhKRlC9EsSW8tIZxiVj+eC0Gm9+B3Vat0eiDS7n/q5hDNmQy+fl5VK2cmUFtIAloywvl3/KbjVxZePFe2SZ4DwGEACJnloAW8MqB+a0Zwlf11UIdH+06MZaF+pt2sERUrSZ+sUileNqoaY8hzDQKLL8XB355STlc9B2Ng2xcZOjigY358xk0Bm0Bx0iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqftR8SVfaahbiyQTZJlgdrm2kmXnJFHb+pxdOaArlQ=;
 b=LgWXH9Tdpt0MFjNYHwEKasPYnNDCIbzQUOalMXaJNpeUtA+EEa89x5HhnP3psaWIerGaEvMiyqbbGOLtx/uJeBc4yR+VJhhWYtltIAS0svzUqyiytoTXgw2hwnd6tenZ0cIGHpcrf7qEM65kjZXivRjHb0zwCrRd88LAEEg60g2IfxrSI6JDIfMcwLbXWKhGWpA58QZIkKnqizpDTNxEBcdsNDNpu9qD1y1rOmgdzMLu/vDzRmTahwkaa44y/htAWCPfZbMTPdVF2/7SpqFSOs8P6xW6zYsRa6loulATEfJNVEGMtu1Hvdo7og3qTjwiDI80ZqEZkr93AUmWE9ElCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqftR8SVfaahbiyQTZJlgdrm2kmXnJFHb+pxdOaArlQ=;
 b=FmvSyIXpbGdrvQbElByVsiRTqWo6QXxqqlglpaKiF6c8oQkOQbfw4oH1LREi4DS1HNtzHLO4euwUG5+2KjqPHupI2jL7qcFQmVyAQIosLEJnM5RwyywBF2nmLCJwyJl0KJOstrFYVY7z81TLHjdnnWmeg7f8/P6AgoLQ53ZsztM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen
 Gross <jgross@suse.com>
Subject: [PATCH v8 0/8] amd-cppc CPU Performance Scaling Driver
Date: Thu, 28 Aug 2025 18:01:57 +0800
Message-ID: <20250828100205.1775636-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|DS0PR12MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: 725d4809-ba04-4084-af9f-08dde619fbe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TanVG1VaUzehgEj5mEcJXaJOpdKejPRdzjlP6A6vcK5KGBuHachTZ5uRWZj5?=
 =?us-ascii?Q?cFL8m/bwCtnNO8cvh5POxsamLuftACCm4+fKWb1qIZ9OpnEEgTWL7hRhPsih?=
 =?us-ascii?Q?Odqt3NU1bUuJZGSoDJcDo9BNr0V0y9ewVUvd+GOsQfd1SdteNmEGqSaZfbgr?=
 =?us-ascii?Q?Po71JFZHGaKMoQmkjPPTRQDgw9lhcmuJxe3BzCHkM/87qPU+UT7KEXYVcHl1?=
 =?us-ascii?Q?dGOHAPbbKtR3P/FSBftz8iT3Z3YPSnxGcLT0vVBoAZx4h6R97GNRfebYssm2?=
 =?us-ascii?Q?/tMfCBHV2OcmUjSCqqzeMssVxGf+6bwo9jQgfEhCQNGUOb2xBmm5jy4MzPkD?=
 =?us-ascii?Q?+DaY6S44QYj5bV7w65Hq8PmWBJ5uvn7DHhrFIWusCeiPkxukA4qmizRZKuiC?=
 =?us-ascii?Q?Gopf2NJEFtXQZb8I6wwRWvP26HTNY+GrTnBCwulUqR4AhzXr95L8mnbbM0na?=
 =?us-ascii?Q?SckDG5lnVYYvPmWy0Ua9b4rxSbgBzh5MiKN5K+QdUpM7pH3/fiu7VhwIp33E?=
 =?us-ascii?Q?kfhbuFRIBIsLvuOWuaJDCpf9Orp2KtpNIvWTygIG1/Y/dpe27VHeJcrLQhwG?=
 =?us-ascii?Q?jqwVkm8CppLIq35BkrifVktu5D4I4ddm51NsJ+QaFBF089avtXqPLKOZ7/0x?=
 =?us-ascii?Q?hmghUigeunMEUokUhPna1NRub8ZepyPLvgkImPoLSBxoUhh0bgsnSlsAo7I+?=
 =?us-ascii?Q?nzpj9Ex0gjHOjrRAGR6QQC/HzcKoue836fdVAjrANUmhOx4ZX8GnKHCgPdCb?=
 =?us-ascii?Q?6lZBVer5M3mS6fATHlYg3zETnVZxkovG+ZJTm1TnCObmpTOHYUwVPyORONWH?=
 =?us-ascii?Q?iQkGA62OSsexl70K3QxyD1ekBsYvQvaFSGIEbGiRYrd/b7PZpfxMsHHUC4dP?=
 =?us-ascii?Q?2j2DLpR4VnthNt5ErceQMNFTHcPCFVXGFfYbUFkRP30HSfsWq5cQxDnEVXVa?=
 =?us-ascii?Q?gAJIxRGaht40Vb31pIDx0ygz0uWguXzN7caJKlGISwOh3hDCoJKpN7GePC8D?=
 =?us-ascii?Q?WqHIkCdbMfjZZTWOddsQhIzzpZJjPT61rl4AC8WRepREYvo9RsuIryV04Pb4?=
 =?us-ascii?Q?ELHiL2EjV/11rgFkdxDnBQlpEj4c4q6XYoHTgIxz6nDTI/ttVQq9uEad+ha4?=
 =?us-ascii?Q?x2L8qaZJr3s4QsrIxt8jX6SDOjgzhRS/VVp+yPJXhvZLZKldN+eVYbhIfz7V?=
 =?us-ascii?Q?reHWWfNzcdOum3qpodkzMRZwUsHvl7rcM68Bokp2eAh8qrbbAEVdiYBc1grq?=
 =?us-ascii?Q?kxTf+5Y4Cx9iGPIy0RCOAQvU7Y7kSeWNnfWbT+rv3b0+E5hXVz+89iQFNXa5?=
 =?us-ascii?Q?7Puiiww3f18uCBqADfQjEnKvdxSbgcNS/Tf+q7+h+psqbMTFc/tuft0C4BC+?=
 =?us-ascii?Q?RBsdPVxjy/FQJrxoP9i7V6TusH4uXXPZMBcxhG9ETN02ACQRGKNwFRT9K/k9?=
 =?us-ascii?Q?Ep/YRhOnBuz/BUOMCv9Gsm3zL/qybmbbp1c413FPOt9k7bmDZXWAdnBqCp3e?=
 =?us-ascii?Q?uDCx+sMOLOPOEnb+CMhyxNBwiBYjOpgjgHdh?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:02:23.0609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 725d4809-ba04-4084-af9f-08dde619fbe3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7971

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
  xen/cpufreq: introduce new sub-hypercall to propagate CPPC data
  xen/cpufreq: introduce "cpufreq=amd-cppc" xen cmdline and amd-cppc
    driver
  xen/cpufreq: implement amd-cppc driver for CPPC in passive mode
  xen/cpufreq: implement amd-cppc-epp driver for CPPC in active mode
  xen/cpufreq: get performance policy from governor set via xenpm
  tools/cpufreq: extract CPPC para from cpufreq para
  xen/cpufreq: bypass governor-related para for amd-cppc-epp
  xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc
    driver

 docs/misc/xen-command-line.pandoc         |  14 +-
 tools/include/xenctrl.h                   |   3 +-
 tools/libs/ctrl/xc_pm.c                   |  25 +-
 tools/misc/xenpm.c                        |  94 ++-
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 766 ++++++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |  69 +-
 xen/arch/x86/cpu/amd.c                    |   8 +-
 xen/arch/x86/include/asm/amd.h            |   2 +
 xen/arch/x86/include/asm/msr-index.h      |   6 +
 xen/arch/x86/platform_hypercall.c         |  19 +
 xen/arch/x86/x86_64/cpufreq.c             |  19 +
 xen/arch/x86/x86_64/platform_hypercall.c  |   3 +
 xen/drivers/acpi/pm-op.c                  |  68 +-
 xen/drivers/acpi/pmstat.c                 |   4 +
 xen/drivers/cpufreq/cpufreq.c             | 137 +++-
 xen/drivers/cpufreq/utility.c             |  15 +
 xen/include/acpi/cpufreq/cpufreq.h        |  40 +-
 xen/include/acpi/cpufreq/processor_perf.h |  14 +-
 xen/include/public/platform.h             |  26 +
 xen/include/public/sysctl.h               |   5 +-
 xen/include/xen/pmstat.h                  |   5 +
 xen/include/xlat.lst                      |   1 +
 23 files changed, 1283 insertions(+), 61 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

-- 
2.34.1


