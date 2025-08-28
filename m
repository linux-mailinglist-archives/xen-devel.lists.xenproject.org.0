Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76811B39905
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:04:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098147.1452295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZU4-0006cs-OS; Thu, 28 Aug 2025 10:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098147.1452295; Thu, 28 Aug 2025 10:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZU4-0006Z6-KL; Thu, 28 Aug 2025 10:03:56 +0000
Received: by outflank-mailman (input) for mailman id 1098147;
 Thu, 28 Aug 2025 10:03:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urZU3-0005cC-Jz
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:03:55 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2416::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4dc98375-83f6-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 12:03:54 +0200 (CEST)
Received: from MN2PR17CA0012.namprd17.prod.outlook.com (2603:10b6:208:15e::25)
 by DS4PR12MB9562.namprd12.prod.outlook.com (2603:10b6:8:27e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 10:03:46 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::eb) by MN2PR17CA0012.outlook.office365.com
 (2603:10b6:208:15e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Thu,
 28 Aug 2025 10:03:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 10:03:45 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:03:44 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 28 Aug 2025 03:03:41 -0700
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
X-Inumbo-ID: 4dc98375-83f6-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y00EPWuJewgLz3F0d+rXZYTdrRfQaVOriL1I2vP4ZSJmSWqda9nxuwdluwoSLBgnSVwriY1F0kN5+KE/i3t93AHnGHYeB1jWgKjlvvz8N9R47Dd2MtuOv//hV8ncg/CkCtcberTYl8xqRa5WkmB2NOefrfWxRMBaT4Kpv0yXunfV1JeWexP++mIlkV7z7OXQtTm030uZNPM2vxV7Zt+VMriUu2/+eLvMghWPz6ojeYJ/EjsbITuWBEUZFAhnsWsspwg1Z/ZoQxS6zpJvF5BkZ3BcdedZ/aNF/aDkJKVnvK01d3EeT7a9KAdiwCvWlA1Z6ZsgGDDkeHA4+u2c/EpX7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrV4RgW5JNSPWiJYFOgw2plxIEpaWhTla8i2lcxDHLQ=;
 b=G7Mqe99OGcJj2yeGwEuFKYe7dMTZHDnYIDoYyqZO731Xb5n42g/TZE4Pd4yFst060dg/cxA5ebee9freHFPf8kT8ZGBXSM688fB4Pyzlrzn3YVnva3hkfchSuN0HmDr1rdfCtiUnQr55iLVqiVeik+aY7+HoNfVuRjAhPZ8ilhqGi5eCTYgocTWWrdUu9wNNtPsyUrJqg3JfQGxJV13sudUZrJb74P9KsyQbH+OmkdURtYNq00KtcAyhQ7AXj7DRJUEqcOZJtp6C8SrFieHURsib5FrmJSgAeJ7aN+LSvIroSmQxBBP6JZOQrlfeLPdsW2cYmqo939aEb+YErhzvPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrV4RgW5JNSPWiJYFOgw2plxIEpaWhTla8i2lcxDHLQ=;
 b=PQCwrsNsHd9R5VV9pxBZln37Ti8xJicOFooITmgVOlOLvfn7M3XJRVBmk52TBw4ofeLUqWHmZgayc07/HdHIZSAlWGEuCkRBRm/gLTno/xhPIergINfhk94+z9+MZdMn6O7cHwF2MNPDy/nMM3PtUAlYdsMJ07Snumc96IHpfDc=
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
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 3/8] xen/cpufreq: implement amd-cppc driver for CPPC in passive mode
Date: Thu, 28 Aug 2025 18:03:01 +0800
Message-ID: <20250828100306.1776031-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828100306.1776031-1-Penny.Zheng@amd.com>
References: <20250828100306.1776031-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|DS4PR12MB9562:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a015a96-eb5f-496e-1d85-08dde61a2d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVhRNXkwWXVNVGpsdFNsWHBIdEdybXVwR0NzQ0VrRjJQMHkvRjdBZ2J5MERB?=
 =?utf-8?B?djdJcWZvd1BZL2RuRzFLWGttcHdISCtRcmJ4N2Y5TTZpclVhOXlRazRTU1l0?=
 =?utf-8?B?ZUNyZk9pOHl1bFE3RGVJUWFxT3RBcDREeUlsb2MwNmFTYWxPb01SenM0YmhT?=
 =?utf-8?B?UDNZeERSaEloSDA1eS80Q2xFZnFoTmxGSU5xRXdoRS9uR1Q4NUtCWlNFWVlC?=
 =?utf-8?B?VTd6SlZUb1ZTT1BrMXQrQzgvSmVVMk9qVGptUDZ5dEtEdU5CMkRhUVhrdmh3?=
 =?utf-8?B?d2dEeDBBemZRb3hkM3pVYVBwdjFDME5YMHBoOFgyUEpiS25FbklrTkdReUd4?=
 =?utf-8?B?Wm9VdWJNajVEUWx1UU1WWFlOOTVpUWpRbGRvNXRvaTcvWFR1cjdVaWFtZnJH?=
 =?utf-8?B?aUtUOG9qaEFyd1VhZ3BIOElqMG13WmdoWkl3WlM0US9pNzNIVm10aG0zUldH?=
 =?utf-8?B?dXFUcTJOSEczVWZVSHlHNWI0L084WlVEZHRtS2x4K3VUbkxiVmRBTUF5WUNX?=
 =?utf-8?B?UUJaK0V0c2dCZG50dXJxenZEWTlTcXRZNWtYS3Q3VVFNYk5RbStKd2l6Q3Vy?=
 =?utf-8?B?QzNXTlk2Y2tvVWFmNVZnekF0SlExMThyZkZINk9JVGo5RXoxNEYwV3EwUkpT?=
 =?utf-8?B?QlJRYisxeEtiMFBtTlp5elNERnNVTG5TSjIyYThtWWxaS3RkSGozMlo0VHZV?=
 =?utf-8?B?VjAxZFJLQ0RabGQzYVdFK1ZjV3RDZlA2SzVpZmZaZGtPeGUxbWxYU01zNjZu?=
 =?utf-8?B?WkVNYk00bjV1cHU0cXQvSHNJd3pXOW4wdXplOFVnKzF3V0s4Y1N3VFBkSTYr?=
 =?utf-8?B?MjJGcG1oUFhoUVB5Y1cyeTRXK2k2eWZsQ0R1cFZtNk1OOXZDTHNhQVNzMFFl?=
 =?utf-8?B?bE5iUE1zZkJKWnM5ekFVdnBGZEFHS0EyV3ZsR0djQ0QyTllWMnB1bnJKWTBl?=
 =?utf-8?B?M2UxSDl6bUE1SFdUemduTyttQk9nRC83NzZGSkJOd1RxYWdtT1pEYTZ1clJX?=
 =?utf-8?B?WTBjM2R1N0QxQmxXUWlNNUN3emVYOGk0bUthYUdJc044blNjSUFmYjd6UWkr?=
 =?utf-8?B?ZUVkeWE0aHZXUmFEbzJNa2p2d1RsNm1ja1NWQnNKNHNWbFFKcWlVdlYxRCs4?=
 =?utf-8?B?b0krN1FJalJod2NNV3RIOTJGbjB4T09Db1V0ZGdsaUh2WTFVYnpGbHhTVDlz?=
 =?utf-8?B?WG5oRzdFSzNnKzJRemRQL2hCWkRpZVFpekM4cGd6STdxc3JCUzBMcWhqNlcx?=
 =?utf-8?B?Vzk5U0J1T295ZTlaTUhuY3JwdTE1NGdHZ2x4eFM5R0FZMFErSVRTQmROaHU0?=
 =?utf-8?B?SlZsRHNlRlBmME9nV0xwNGZGMExKVFNMUVpxOVZ0UUMrRGdkcU1OL3dpNHZK?=
 =?utf-8?B?M25TN0VpaCs2N2d3TEI1QUUwR1FDK1N1OE01RDM2UGFEZTRPZ2FHeXArc0xa?=
 =?utf-8?B?LzA0ejNsanRaRk9RSmdLMzc5aWxvQlpydTI5L1N1eUI3Q0k0MFJsVWNjK1Nz?=
 =?utf-8?B?WTZ0dkZaNnJKOXFydFVjUzRvUFNSdlI2OWg4K2YrclRPUURhTjRHb1F5N2x4?=
 =?utf-8?B?cHJrM21NbHJEMGlUMGZlRkxWZmpqazd4ZSt6MldaOWlGUU1SSnJ3Y2hLTTN4?=
 =?utf-8?B?SGpCNDE5L2tmNzdaK2hHR0d1cFVreDg3Q1NJblVjeWF0RzhMTnN0Q2FHUlBh?=
 =?utf-8?B?NkttMVBwZVJZSGR4OUkycitXV3VzejAyWGNDb0Z4UTlqcUN2UDJBVGJ1djlM?=
 =?utf-8?B?VGdIdzNKWGRZZ2NjbnB4bUp5c1BRRTkwMnpxQUhzQ0FIbXRxa0p6WHBOMEtW?=
 =?utf-8?B?Z1grK2g0M1FSRUdkTGtHVG8vdVJlK2haVUlhcVdUMm5Ic0k0a2twQXNRZThO?=
 =?utf-8?B?cFNWZ2ZsNnowM1h1Nmp3bTZ1c2FLOUczdm5veGc1b3NtUUYvb3ZEM2NvdVdt?=
 =?utf-8?B?RnNsd3ZEYnhUSDR6ZXZwUVROT2NtUFVFZEdqRmFUZlFSd2M1dG5uZ0krOGRm?=
 =?utf-8?B?aGU3cWNhZ2pSZ3g3ZGhtaXhxL3NYNWNYVStmMkcwRzZNbnJ3SU1MYzdRTXR0?=
 =?utf-8?Q?Ry3QLS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:03:45.8492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a015a96-eb5f-496e-1d85-08dde61a2d3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9562

amd-cppc is the AMD CPU performance scaling driver that introduces a
new CPU frequency control mechanism. The new mechanism is based on
Collaborative Processor Performance Control (CPPC) which is a finer grain
frequency management than legacy ACPI hardware P-States.
Current AMD CPU platforms are using the ACPI P-states driver to
manage CPU frequency and clocks with switching only in 3 P-states, while the
new amd-cppc allows a more flexible, low-latency interface for Xen
to directly communicate the performance hints to hardware.

"amd-cppc" driver is responsible for implementing CPPC in passive mode, which
still leverages Xen governors such as *ondemand*, *performance*, etc, to
calculate the performance hints. In the future, we will introduce an advanced
active mode to enable autonomous performence level selection.

Field epp, energy performance preference, which only has meaning when active
mode is enabled and will be introduced later in details, so we read
pre-defined BIOS value for it in passive mode.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
---
v1 -> v2:
- re-construct union caps and req to have anonymous struct instead
- avoid "else" when the earlier if() ends in an unconditional control flow statement
- Add check to avoid chopping off set bits from cast
- make pointers pointer-to-const wherever possible
- remove noisy log
- exclude families before 0x17 before CPPC-feature MSR op
- remove useless variable helpers
- use xvzalloc and XVFREE
- refactor error handling as ENABLE bit can only be cleared by reset
---
v2 -> v3:
- Move all MSR-definations to msr-index.h and follow the required style
- Refactor opening figure braces for struct/union
- Sort overlong lines throughout the series
- Make offset/res int covering underflow scenario
- Error out when amd_max_freq_mhz isn't set
- Introduce amd_get_freq(name) macro to decrease redundancy
- Supported CPU family checked ahead of smp-function
- Nominal freq shall be checked between the [min, max]
- Use APERF/MPREF to calculate current frequency
- Use amd_cppc_cpufreq_cpu_exit() to tidy error path
---
v3 -> v4:
- verbose print shall come with a CPU number
- deal with res <= 0 in amd_cppc_khz_to_perf()
- introduce a single helper amd_get_lowest_or_nominal_freq() to cover both
lowest and nominal scenario
- reduce abuse of wrmsr_safe()/rdmsr_safe() with wrmsrl()/rdmsrl()
- move cf_check from amd_cppc_write_request() to amd_cppc_write_request_msrs()
- add comment to explain why setting non_linear_lowest in passive mode
- add check to ensure perf values in
lowest <= non_linear_lowest <= nominal <= highset
- refactor comment for "data->err != 0" scenario
- use "data->err" instead of -ENODEV
- add U suffixes for all msr macro
---
v4 -> v5:
- all freq-values shall be unsigned int type
- remove shortcuts as it is rarely taken
- checking cpc.nominal_mhz and cpc.lowest_mhz are non-zero values is enough
- drop the explicit type cast
- null pointer check is in no need for internal functions
- change amd_get_lowest_or_nominal_freq() to amd_get_cpc_freq()
- clarifying function-wide that the calculated frequency result is to be in kHz
- use array notation
- with cpu_has_cppc check, no need to do cpu family check
---
v5 -> v6
- replace "AMD_CPPC" with "AMD-CPPC" in message
- add equation(mul,div) non-zero check
- replace -EINVAL with -EOPNOTSUPP
- refactor comment
---
v6 -> v7
- used > in place of !=, to not only serve a doc aspect, but also allow to
drop one part
- unify with UINT8_MAX
- return -ERANGE as we reject perf values of 0 as invalid
- replace uint32_t with unsigned int
- Move some epp introduction here, otherwise we will mis-handle this field here
by always clearing it
---
v7 -> v8:
- refine message text by removing 0
---
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 418 ++++++++++++++++++++++++++-
 xen/arch/x86/cpu/amd.c               |   8 +-
 xen/arch/x86/include/asm/amd.h       |   2 +
 xen/arch/x86/include/asm/msr-index.h |   6 +
 xen/include/public/sysctl.h          |   1 +
 5 files changed, 430 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 3377783f7e..5b99b86fb7 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -14,7 +14,98 @@
 #include <xen/domain.h>
 #include <xen/init.h>
 #include <xen/param.h>
+#include <xen/percpu.h>
+#include <xen/xvmalloc.h>
 #include <acpi/cpufreq/cpufreq.h>
+#include <asm/amd.h>
+#include <asm/msr.h>
+
+#define amd_cppc_err(cpu, fmt, args...)                             \
+    printk(XENLOG_ERR "AMD-CPPC: CPU%u error: " fmt, cpu, ## args)
+#define amd_cppc_warn(cpu, fmt, args...)                            \
+    printk(XENLOG_WARNING "AMD-CPPC: CPU%u warning: " fmt, cpu, ## args)
+#define amd_cppc_verbose(cpu, fmt, args...)                         \
+({                                                                  \
+    if ( cpufreq_verbose )                                          \
+        printk(XENLOG_DEBUG "AMD-CPPC: CPU%u " fmt, cpu, ## args);  \
+})
+
+/*
+ * Field highest_perf, nominal_perf, lowest_nonlinear_perf, and lowest_perf
+ * contain the values read from CPPC capability MSR. They represent the limits
+ * of managed performance range as well as the dynamic capability, which may
+ * change during processor operation
+ * Field highest_perf represents highest performance, which is the absolute
+ * maximum performance an individual processor may reach, assuming ideal
+ * conditions. This performance level may not be sustainable for long
+ * durations and may only be achievable if other platform components
+ * are in a specific state; for example, it may require other processors be
+ * in an idle state. This would be equivalent to the highest frequencies
+ * supported by the processor.
+ * Field nominal_perf represents maximum sustained performance level of the
+ * processor, assuming ideal operating conditions. All cores/processors are
+ * expected to be able to sustain their nominal performance state
+ * simultaneously.
+ * Field lowest_nonlinear_perf represents Lowest Nonlinear Performance, which
+ * is the lowest performance level at which nonlinear power savings are
+ * achieved. Above this threshold, lower performance levels should be
+ * generally more energy efficient than higher performance levels. So in
+ * traditional terms, this represents the P-state range of performance levels.
+ * Field lowest_perf represents the absolute lowest performance level of the
+ * platform. Selecting it may cause an efficiency penalty but should reduce
+ * the instantaneous power consumption of the processor. So in traditional
+ * terms, this represents the T-state range of performance levels.
+ *
+ * Field max_perf, min_perf, des_perf store the values for CPPC request MSR.
+ * Software passes performance goals through these fields.
+ * Field max_perf conveys the maximum performance level at which the platform
+ * may run. And it may be set to any performance value in the range
+ * [lowest_perf, highest_perf], inclusive.
+ * Field min_perf conveys the minimum performance level at which the platform
+ * may run. And it may be set to any performance value in the range
+ * [lowest_perf, highest_perf], inclusive but must be less than or equal to
+ * max_perf.
+ * Field des_perf conveys performance level Xen governor is requesting. And it
+ * may be set to any performance value in the range [min_perf, max_perf],
+ * inclusive.
+ * Field epp represents energy performance preference, which only has meaning
+ * when active mode is enabled.
+ */
+struct amd_cppc_drv_data
+{
+    const struct xen_processor_cppc *cppc_data;
+    union {
+        uint64_t raw;
+        struct {
+            unsigned int lowest_perf:8;
+            unsigned int lowest_nonlinear_perf:8;
+            unsigned int nominal_perf:8;
+            unsigned int highest_perf:8;
+            unsigned int :32;
+        };
+    } caps;
+    union {
+        uint64_t raw;
+        struct {
+            unsigned int max_perf:8;
+            unsigned int min_perf:8;
+            unsigned int des_perf:8;
+            unsigned int epp:8;
+            unsigned int :32;
+        };
+    } req;
+
+    int err;
+};
+
+static DEFINE_PER_CPU_READ_MOSTLY(struct amd_cppc_drv_data *,
+                                  amd_cppc_drv_data);
+/*
+ * Core max frequency read from PstateDef as anchor point
+ * for freq-to-perf transition
+ */
+static DEFINE_PER_CPU_READ_MOSTLY(unsigned int, pxfreq_mhz);
+static DEFINE_PER_CPU_READ_MOSTLY(uint8_t, epp_init);
 
 static bool __init amd_cppc_handle_option(const char *s, const char *end)
 {
@@ -50,10 +141,335 @@ int __init amd_cppc_cmdline_parse(const char *s, const char *e)
     return 0;
 }
 
+/*
+ * If CPPC lowest_freq and nominal_freq registers are exposed then we can
+ * use them to convert perf to freq and vice versa. The conversion is
+ * extrapolated as an linear function passing by the 2 points:
+ *  - (Low perf, Low freq)
+ *  - (Nominal perf, Nominal freq)
+ * Parameter freq is always in kHz.
+ */
+static int amd_cppc_khz_to_perf(const struct amd_cppc_drv_data *data,
+                                unsigned int freq, uint8_t *perf)
+{
+    const struct xen_processor_cppc *cppc_data = data->cppc_data;
+    unsigned int mul, div;
+    int offset = 0, res;
+
+    if ( cppc_data->cpc.lowest_mhz &&
+         data->caps.nominal_perf > data->caps.lowest_perf &&
+         cppc_data->cpc.nominal_mhz > cppc_data->cpc.lowest_mhz )
+    {
+        mul = data->caps.nominal_perf - data->caps.lowest_perf;
+        div = cppc_data->cpc.nominal_mhz - cppc_data->cpc.lowest_mhz;
+
+        /*
+         * We don't need to convert to kHz for computing offset and can
+         * directly use nominal_mhz and lowest_mhz as the division
+         * will remove the frequency unit.
+         */
+        offset = data->caps.nominal_perf -
+                 (mul * cppc_data->cpc.nominal_mhz) / div;
+    }
+    else
+    {
+        /* Read Processor Max Speed(MHz) as anchor point */
+        mul = data->caps.highest_perf;
+        div = this_cpu(pxfreq_mhz);
+        if ( !div )
+            return -EOPNOTSUPP;
+    }
+
+    res = offset + (mul * freq) / (div * 1000);
+    if ( res > UINT8_MAX )
+    {
+        printk_once(XENLOG_WARNING
+                    "Perf value exceeds maximum value 255: %d\n", res);
+        *perf = UINT8_MAX;
+        return 0;
+    }
+    if ( res <= 0 )
+    {
+        printk_once(XENLOG_WARNING
+                    "Perf value smaller than minimum value: %d\n", res);
+        return -ERANGE;
+    }
+    *perf = res;
+
+    return 0;
+}
+
+/*
+ * _CPC may define nominal frequecy and lowest frequency, if not, use
+ * Processor Max Speed as anchor point to calculate.
+ * Output freq stores cpc frequency in kHz
+ */
+static int amd_get_cpc_freq(const struct amd_cppc_drv_data *data,
+                            unsigned int cpc_mhz, uint8_t perf,
+                            unsigned int *freq)
+{
+    unsigned int mul, div, res;
+
+    if ( cpc_mhz )
+    {
+        /* Switch to kHz */
+        *freq = cpc_mhz * 1000;
+        return 0;
+    }
+
+    /* Read Processor Max Speed(MHz) as anchor point */
+    mul = this_cpu(pxfreq_mhz);
+    if ( !mul )
+        return -EOPNOTSUPP;
+    div = data->caps.highest_perf;
+    res = (mul * perf * 1000) / div;
+    if ( unlikely(!res) )
+        return -EOPNOTSUPP;
+
+    return 0;
+}
+
+/* Output max_freq stores calculated maximum frequency in kHz */
+static int amd_get_max_freq(const struct amd_cppc_drv_data *data,
+                            unsigned int *max_freq)
+{
+    unsigned int nom_freq = 0;
+    int res;
+
+    res = amd_get_cpc_freq(data, data->cppc_data->cpc.nominal_mhz,
+                           data->caps.nominal_perf, &nom_freq);
+    if ( res )
+        return res;
+
+    *max_freq = (data->caps.highest_perf * nom_freq) / data->caps.nominal_perf;
+
+    return 0;
+}
+
+static int cf_check amd_cppc_cpufreq_verify(struct cpufreq_policy *policy)
+{
+    cpufreq_verify_within_limits(policy, policy->cpuinfo.min_freq,
+                                 policy->cpuinfo.max_freq);
+
+    return 0;
+}
+
+static void cf_check amd_cppc_write_request_msrs(void *info)
+{
+    const struct amd_cppc_drv_data *data = info;
+
+    wrmsrl(MSR_AMD_CPPC_REQ, data->req.raw);
+}
+
+static void amd_cppc_write_request(unsigned int cpu, uint8_t min_perf,
+                                   uint8_t des_perf, uint8_t max_perf,
+                                   uint8_t epp)
+{
+    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+    uint64_t prev = data->req.raw;
+
+    data->req.min_perf = min_perf;
+    data->req.max_perf = max_perf;
+    data->req.des_perf = des_perf;
+    data->req.epp = epp;
+
+    if ( prev == data->req.raw )
+        return;
+
+    on_selected_cpus(cpumask_of(cpu), amd_cppc_write_request_msrs, data, 1);
+}
+
+static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
+                                            unsigned int target_freq,
+                                            unsigned int relation)
+{
+    unsigned int cpu = policy->cpu;
+    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+    uint8_t des_perf;
+    int res;
+
+    if ( unlikely(!target_freq) )
+        return 0;
+
+    res = amd_cppc_khz_to_perf(data, target_freq, &des_perf);
+    if ( res )
+        return res;
+
+    /*
+     * Having a performance level lower than the lowest nonlinear
+     * performance level, such as, lowest_perf <= perf <= lowest_nonliner_perf,
+     * may actually cause an efficiency penalty, So when deciding the min_perf
+     * value, we prefer lowest nonlinear performance over lowest performance.
+     */
+    amd_cppc_write_request(policy->cpu, data->caps.lowest_nonlinear_perf,
+                           des_perf, data->caps.highest_perf,
+                           /* Pre-defined BIOS value for passive mode */
+                           per_cpu(epp_init, policy->cpu));
+    return 0;
+}
+
+static void cf_check amd_cppc_init_msrs(void *info)
+{
+    struct cpufreq_policy *policy = info;
+    struct amd_cppc_drv_data *data = this_cpu(amd_cppc_drv_data);
+    uint64_t val;
+    unsigned int min_freq = 0, nominal_freq = 0, max_freq;
+
+    /* Package level MSR */
+    rdmsrl(MSR_AMD_CPPC_ENABLE, val);
+    /*
+     * Only when Enable bit is on, the hardware will calculate the processor’s
+     * performance capabilities and initialize the performance level fields in
+     * the CPPC capability registers.
+     */
+    if ( !(val & AMD_CPPC_ENABLE) )
+    {
+        val |= AMD_CPPC_ENABLE;
+        wrmsrl(MSR_AMD_CPPC_ENABLE, val);
+    }
+
+    rdmsrl(MSR_AMD_CPPC_CAP1, data->caps.raw);
+
+    if ( data->caps.highest_perf == 0 || data->caps.lowest_perf == 0 ||
+         data->caps.nominal_perf == 0 || data->caps.lowest_nonlinear_perf == 0 ||
+         data->caps.lowest_perf > data->caps.lowest_nonlinear_perf ||
+         data->caps.lowest_nonlinear_perf > data->caps.nominal_perf ||
+         data->caps.nominal_perf > data->caps.highest_perf )
+    {
+        amd_cppc_err(policy->cpu,
+                     "Out of range values: highest(%u), lowest(%u), nominal(%u), lowest_nonlinear(%u)\n",
+                     data->caps.highest_perf, data->caps.lowest_perf,
+                     data->caps.nominal_perf, data->caps.lowest_nonlinear_perf);
+        goto err;
+    }
+
+    amd_process_freq(&cpu_data[policy->cpu],
+                     NULL, NULL, &this_cpu(pxfreq_mhz));
+
+    data->err = amd_get_cpc_freq(data, data->cppc_data->cpc.lowest_mhz,
+                                 data->caps.lowest_perf, &min_freq);
+    if ( data->err )
+        return;
+
+    data->err = amd_get_cpc_freq(data, data->cppc_data->cpc.nominal_mhz,
+                                 data->caps.nominal_perf, &nominal_freq);
+    if ( data->err )
+        return;
+
+    data->err = amd_get_max_freq(data, &max_freq);
+    if ( data->err )
+        return;
+
+    if ( min_freq > nominal_freq || nominal_freq > max_freq )
+    {
+        amd_cppc_err(policy->cpu,
+                     "min(%u), or max(%u), or nominal(%u) freq value is incorrect\n",
+                     min_freq, max_freq, nominal_freq);
+        goto err;
+    }
+
+    policy->min = min_freq;
+    policy->max = max_freq;
+
+    policy->cpuinfo.min_freq = min_freq;
+    policy->cpuinfo.max_freq = max_freq;
+    policy->cpuinfo.perf_freq = nominal_freq;
+    /*
+     * Set after policy->cpuinfo.perf_freq, as we are taking
+     * APERF/MPERF average frequency as current frequency.
+     */
+    policy->cur = cpufreq_driver_getavg(policy->cpu, GOV_GETAVG);
+
+    /* Store pre-defined BIOS value for passive mode */
+    rdmsrl(MSR_AMD_CPPC_REQ, val);
+    this_cpu(epp_init) = MASK_EXTR(val, AMD_CPPC_EPP_MASK);
+
+    return;
+
+ err:
+    /*
+     * No fallback shceme is available here, see more explanation at call
+     * site in amd_cppc_cpufreq_cpu_init().
+     */
+    data->err = -EINVAL;
+}
+
+/*
+ * AMD CPPC driver is different than legacy ACPI hardware P-State,
+ * which has a finer grain frequency range between the highest and lowest
+ * frequency. And boost frequency is actually the frequency which is mapped on
+ * highest performance ratio. The legacy P0 frequency is actually mapped on
+ * nominal performance ratio.
+ */
+static void amd_cppc_boost_init(struct cpufreq_policy *policy,
+                                const struct amd_cppc_drv_data *data)
+{
+    if ( data->caps.highest_perf <= data->caps.nominal_perf )
+        return;
+
+    policy->turbo = CPUFREQ_TURBO_ENABLED;
+}
+
+static int cf_check amd_cppc_cpufreq_cpu_exit(struct cpufreq_policy *policy)
+{
+    XVFREE(per_cpu(amd_cppc_drv_data, policy->cpu));
+
+    return 0;
+}
+
+static int cf_check amd_cppc_cpufreq_cpu_init(struct cpufreq_policy *policy)
+{
+    unsigned int cpu = policy->cpu;
+    struct amd_cppc_drv_data *data;
+
+    data = xvzalloc(struct amd_cppc_drv_data);
+    if ( !data )
+        return -ENOMEM;
+
+    data->cppc_data = &processor_pminfo[cpu]->cppc_data;
+
+    per_cpu(amd_cppc_drv_data, cpu) = data;
+
+    on_selected_cpus(cpumask_of(cpu), amd_cppc_init_msrs, policy, 1);
+
+    /*
+     * The enable bit is sticky, as we need to enable it at the very first
+     * begining, before CPPC capability values sanity check.
+     * If error path is taken effective, not only amd-cppc cpufreq core fails
+     * to initialize, but also we could not fall back to legacy P-states
+     * driver, irrespective of the command line specifying a fallback option.
+     */
+    if ( data->err )
+    {
+        amd_cppc_err(cpu, "Could not initialize cpufreq core in CPPC mode\n");
+        amd_cppc_cpufreq_cpu_exit(policy);
+        return data->err;
+    }
+
+    policy->governor = cpufreq_opt_governor ? : CPUFREQ_DEFAULT_GOVERNOR;
+
+    amd_cppc_boost_init(policy, data);
+
+    amd_cppc_verbose(policy->cpu,
+                     "CPU initialized with amd-cppc passive mode\n");
+
+    return 0;
+}
+
+static const struct cpufreq_driver __initconst_cf_clobber
+amd_cppc_cpufreq_driver =
+{
+    .name   = XEN_AMD_CPPC_DRIVER_NAME,
+    .verify = amd_cppc_cpufreq_verify,
+    .target = amd_cppc_cpufreq_target,
+    .init   = amd_cppc_cpufreq_cpu_init,
+    .exit   = amd_cppc_cpufreq_cpu_exit,
+};
+
 int __init amd_cppc_register_driver(void)
 {
     if ( !cpu_has_cppc )
         return -ENODEV;
 
-    return -EOPNOTSUPP;
+    return cpufreq_register_driver(&amd_cppc_cpufreq_driver);
 }
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 567b992a9f..9767f63539 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -613,10 +613,10 @@ static unsigned int attr_const amd_parse_freq(unsigned int family,
 	return freq;
 }
 
-static void amd_process_freq(const struct cpuinfo_x86 *c,
-			     unsigned int *low_mhz,
-			     unsigned int *nom_mhz,
-			     unsigned int *hi_mhz)
+void amd_process_freq(const struct cpuinfo_x86 *c,
+		      unsigned int *low_mhz,
+		      unsigned int *nom_mhz,
+		      unsigned int *hi_mhz)
 {
 	unsigned int idx = 0, h;
 	uint64_t hi, lo, val;
diff --git a/xen/arch/x86/include/asm/amd.h b/xen/arch/x86/include/asm/amd.h
index 9c9599a622..72df42a6f6 100644
--- a/xen/arch/x86/include/asm/amd.h
+++ b/xen/arch/x86/include/asm/amd.h
@@ -173,5 +173,7 @@ extern bool amd_virt_spec_ctrl;
 bool amd_setup_legacy_ssbd(void);
 void amd_set_legacy_ssbd(bool enable);
 void amd_set_cpuid_user_dis(bool enable);
+void amd_process_freq(const struct cpuinfo_x86 *c, unsigned int *low_mhz,
+                      unsigned int *nom_mhz, unsigned int *hi_mhz);
 
 #endif /* __AMD_H__ */
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 428d993ee8..6abf154887 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -241,6 +241,12 @@
 
 #define MSR_AMD_CSTATE_CFG                  0xc0010296U
 
+#define MSR_AMD_CPPC_CAP1                   0xc00102b0U
+#define MSR_AMD_CPPC_ENABLE                 0xc00102b1U
+#define  AMD_CPPC_ENABLE                    (_AC(1, ULL) << 0)
+#define MSR_AMD_CPPC_REQ                    0xc00102b3U
+#define  AMD_CPPC_EPP_MASK                  (_AC(0xff, ULL) << 24)
+
 /*
  * Legacy MSR constants in need of cleanup.  No new MSRs below this comment.
  */
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index aafa7fcf2b..aa29a5401c 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -453,6 +453,7 @@ struct xen_set_cppc_para {
     uint32_t activity_window;
 };
 
+#define XEN_AMD_CPPC_DRIVER_NAME "amd-cppc"
 #define XEN_HWP_DRIVER_NAME "hwp"
 
 /*
-- 
2.34.1


