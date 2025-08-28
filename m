Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F08B39902
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098142.1452266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZTp-0005gh-RJ; Thu, 28 Aug 2025 10:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098142.1452266; Thu, 28 Aug 2025 10:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZTp-0005dg-Nv; Thu, 28 Aug 2025 10:03:41 +0000
Received: by outflank-mailman (input) for mailman id 1098142;
 Thu, 28 Aug 2025 10:03:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urZTo-0005cC-9B
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:03:40 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20607.outbound.protection.outlook.com
 [2a01:111:f403:200a::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4443714e-83f6-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 12:03:39 +0200 (CEST)
Received: from MN2PR17CA0024.namprd17.prod.outlook.com (2603:10b6:208:15e::37)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 10:03:28 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::63) by MN2PR17CA0024.outlook.office365.com
 (2603:10b6:208:15e::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.22 via Frontend Transport; Thu,
 28 Aug 2025 10:03:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 10:03:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:03:26 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 28 Aug 2025 03:03:23 -0700
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
X-Inumbo-ID: 4443714e-83f6-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UN4nRiaYXXQ9m1CC1Tx+wOnpH80TlsndAKm8Vgz4GDK5PUMIAdg4Spmm8h1aypzMGnUvBeJxEvCqLztm1Q2DC48yme41yshCuOGC4q2RJgjBte5sf7+2sNEB0FmaL5HeN+uqimEiBsAD7et2mj1PAdpMEyBnAvcwIXcWI4siqgwiVSVu4Qe9jsjgl5iTp6rMCzbsvTBGLl0PbceBlj6pxVREW5I+2P92buMyz+wR213358PYY0G3pgquZHuThsW7LTsFK10xl1xDqiqm+wgkazS0OzMxxEDGvAamLVY9Y2pvyy2rm1h+dl6EY8u2ZXlAG/6BlkoshaBE61aD/uKMiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqftR8SVfaahbiyQTZJlgdrm2kmXnJFHb+pxdOaArlQ=;
 b=KjwU6vbefinKZj5zQOVL6uSrTKhp4boY8/RdCU4WExFMl7AEqOt2K6pYOqt/uXUZOsTPJ0U73SQmJSX72v2Oqgjrr7twjBYJfNe7ZV82eUt0Ksft+ulzKdR1z9581zTc9cfY0xQ0ocqYj5X0jRh8LnqYhkaWoTPEKv1mYzVqSl0q2tU0TgLjKZnVHAoy5M8S3JMTQnAHPstij3psGtOoSNKtWyh0HE4uGy10AQvr16juBOymIaOSmF963EfV28/nS1ni5Znpeel3OCgStFUn6jQ1vxxMjPA7okxZDuSYGUMaOxp/ARaq5fuHt/+ZToJg+WZu+jBkhAkPJDqw67A4AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqftR8SVfaahbiyQTZJlgdrm2kmXnJFHb+pxdOaArlQ=;
 b=2HxDIXUxTK2pHcmk1qjB4HMvBSGzxAvAB2s5iC/ylfK6UT/PIPYAmO/FAK6+flmhiMCos4jmwt95N+kd3yOL+tZUZK5DR8VtsWbqcyKDctayAiztDYyHfgNSTN4xe4uPYgxhEFFgDFea29H6z1ipbCVN6wmFKISzr/hQwl58mXU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Juergen
 Gross <jgross@suse.com>
Subject: [PATCH v8 0/8] amd-cppc CPU Performance Scaling Driver
Date: Thu, 28 Aug 2025 18:02:58 +0800
Message-ID: <20250828100306.1776031-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|SJ1PR12MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: fa54b867-6f0c-4dc4-f1cc-08dde61a22a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gm3BUIo4oHPbfAsmK2NNtgXICZcMxvles0yIb+7o3BMHdzlNkfptdY1OPae8?=
 =?us-ascii?Q?aJamPt9DRY2jxzK+VkaMThfQAx/dXjEF9CVQ9jpZlP4dtQGhT8ZGc5PhaGRX?=
 =?us-ascii?Q?fb02/KfPjJXVR6rU+o3CertfgIn/THEgcJ2vPEVscxTjlLWuDjSzlqH7egCY?=
 =?us-ascii?Q?dhlXWUWWNI7gGlNYYEI3xMlTRyjt6RI52uvaSypEzhgm96BmXesrPSznKdFZ?=
 =?us-ascii?Q?SgwBFquyQc7fhaoRodDEWlLjzAM4gOh1d7b2yw4NcfCRe3rIZle4Pplu+1Zp?=
 =?us-ascii?Q?9iKo3GejK5tBi+xr/ajRclkyQvXZMuZzwk3fwv69hP9rINEkP8LZo9wPYyxe?=
 =?us-ascii?Q?7YO28nm1jQXXXKak0RcyeojHi54/UewiuTiD8qhNFjzLMx2n6mhIyS00PKW7?=
 =?us-ascii?Q?XHysqMZEQXP1x4urQfc/obW6Zqs2CIYGGekvuBT+zsSjQafQAf33zj62oYZ+?=
 =?us-ascii?Q?LncMcoy6QkppYPGiG100+NsB6plnfiRHLKRbiNeoOQOPzIfbxMsVOwZX/04N?=
 =?us-ascii?Q?R7GnKhLHEbNm9RBmgdIAUD4wZPukhZMO1w4CP1bxk/E+g5QygD4Ilh6TUv9t?=
 =?us-ascii?Q?CZ63ZRXc6RZAUbfF/yfI7McCpIL0BLbDjtQ7/Dhtbvx8hbOh+vVE036VsxhP?=
 =?us-ascii?Q?u4FYfPdtwFkckLzEBFE4dYfQeczxgATxg9YEDMFhe3WLn5JqtX53EzVGEIcB?=
 =?us-ascii?Q?1GKLhUwKhQB2Zjp6I9tLu+Kk889OqDe68FmiEjNv5qeAS5K7eCWQM/vUzJkH?=
 =?us-ascii?Q?bwQ0NLxDey18R9RkuvLeUM7TXlMxhCKxYOsSYBYpj2LefrCKFPa1IZVoujgB?=
 =?us-ascii?Q?1efT+wt3Pe1e/AX08zzqiZVqrrxg571cGX8UDVslLWgaq6yGiJ9ZyTPY9KHu?=
 =?us-ascii?Q?ndOtU6e9b7rZW3R9UFzUTHh+5P6oO3xQq6QjE7I7FU4xXtr+fmUqe514HBVW?=
 =?us-ascii?Q?UnrzIHvKOfBeHnA3clnKwvxx3fGWqSsF7/jZUkAgyWn6oo6dKeg9PwFK3Zzt?=
 =?us-ascii?Q?j9iSbCCah0GQc8I6BUGRmbJc4V/vp+llefaCyPp0ErQA6bqM7nPzBH5zUV4V?=
 =?us-ascii?Q?KBdQqEtyV25ch10jOgl9bhGM9Owr8ihrUgTRR+MqzJ72RVy10VfpxdnK4zJV?=
 =?us-ascii?Q?0B6yE9hHku2sQHeF4ZxKgmvLpTWoxvGhFufHCOOv0ewtX1PYgiVC6RDIFHOk?=
 =?us-ascii?Q?X1eE0DZHCc5W42SeOpp24OiXgFZVHEKiEgynaARtNF8ppe+3CUhGTzjTjmXt?=
 =?us-ascii?Q?DbA8yn5Ks+nE/KubGiHcur1zYbhFdIZdIysBpFKCJ5nrZjmgS1Lx3gTiOWKn?=
 =?us-ascii?Q?4/nhvGCGdpj4ZdPdWxzJDIqS32AUn9HWhLDk0GDAXU0w++LEEtOq2tAkMoTD?=
 =?us-ascii?Q?9p2+xEKOs4adk0E5wTyJNONZ30Vh9WvD9GWrEZQjXM2InpntEnqqFFSxS/pC?=
 =?us-ascii?Q?a7Eif/57Jcu4NoH3HuM6oPw5mrMuVAmmdc81mNxzFSImHN0Jx8MimAKahaBM?=
 =?us-ascii?Q?Eh09IdZfB7WyJqpAnORCgZSX9THtBf+QwWvM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:03:28.0538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa54b867-6f0c-4dc4-f1cc-08dde61a22a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217

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


