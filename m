Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1F3B39904
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098146.1452285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZU3-0006Lc-EL; Thu, 28 Aug 2025 10:03:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098146.1452285; Thu, 28 Aug 2025 10:03:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZU3-0006Js-Ab; Thu, 28 Aug 2025 10:03:55 +0000
Received: by outflank-mailman (input) for mailman id 1098146;
 Thu, 28 Aug 2025 10:03:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urZU2-0005cC-Jk
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:03:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2412::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c9dac2c-83f6-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 12:03:53 +0200 (CEST)
Received: from BN9PR03CA0927.namprd03.prod.outlook.com (2603:10b6:408:107::32)
 by IA1PR12MB6308.namprd12.prod.outlook.com (2603:10b6:208:3e4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Thu, 28 Aug
 2025 10:03:41 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:107:cafe::bc) by BN9PR03CA0927.outlook.office365.com
 (2603:10b6:408:107::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Thu,
 28 Aug 2025 10:03:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 10:03:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:03:40 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 28 Aug 2025 03:03:37 -0700
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
X-Inumbo-ID: 4c9dac2c-83f6-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oxhqf+/Xp+Y+JslVCSThxTIcW38CtGdxth1wYMbRviAxGmRcxFUKN+pKweTTJ/FQWu9nHTgMaG3WZEyLUcD8sW7VyAoN2Fm380vyVE+jJWxdgbeD86/G8lUE7JwjzTBO7N5inZyW4nczQWd2yiIBz8p7C3u7Y+d2eBsgE2kbAh2eYDey0SDVh6h2tqsKMO/FkIx6XKRIzQCr57nbnU5WP3xMV6EE8zKRtM5QjKBbRY3QCv3P6mqFEXQiLtPMzcNvGPIOUOiwUqvnd6IK1AIu4FE0Mb57ZZ2ADIFNllqeuzRo1yqBmkdAmRnFIunRd4KQKouPeuizVqNWf00RVYQqog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jW79G82BpkewH90NVqtXSWV0LisGw5ntTqLPIdgd3Ow=;
 b=QgsYuL+NFVFNFhDaj3dUfhwMft7bFoKDNc5TCSTE+MPDIHfr1Z7q6pqbBRtgwAIPzp5oTDZ5v/tydXKVk7W3+j2ErI4tbOHQqmdp2fEKw2EOSzO3HsuLNPzwUqakK0lRPjPrURkiIbSDhUCc2xb+wuLYShRYSZnL2nQUSxM+/+idnGrU0NfoKQUoitUxa/kGBYXwkQLI0uUkfosPlB02cz3CWvvJKvdbFgW7Q8ANX75aFiVr20EMxyQ5RAPBtiIZ42AyR9JZnWkj8CVjwaq9gk9n3p4RspHPutC32Ms1NVN+A/lAhW1J1/z+J/dJjEds4ERPbnrmWQt6e4DpTWJ0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW79G82BpkewH90NVqtXSWV0LisGw5ntTqLPIdgd3Ow=;
 b=H0x0RFxIBGgbOHWlhnC14+qk93IfoqLABf6kTHQ2ygDG2fx8sRGYjsD8SaMOfNkCCyGWGfJcsLpm0QYkD3PlDG/jju54KV7YN6ageTvf1p79LoRduSPSgYr4tv9mYpFNCCSiVp1auHgDcg3axPvrU7g+3jZiiWou0YeCEjxCM+s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 2/8] xen/cpufreq: introduce "cpufreq=amd-cppc" xen cmdline and amd-cppc driver
Date: Thu, 28 Aug 2025 18:03:00 +0800
Message-ID: <20250828100306.1776031-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828100306.1776031-1-Penny.Zheng@amd.com>
References: <20250828100306.1776031-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|IA1PR12MB6308:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f298020-fef3-4aa0-606c-08dde61a2a41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jfzwqyTuzCdBE52Vtor/FHBeJ1Ts22Qm0F5ilCDU7JFdLWXWsTNLHyk45ZpE?=
 =?us-ascii?Q?PX3lBxCch8UlV+9uZaJEc546ZE4U2vJh7YNJLkpsORQHOvSScfwya8jZweNS?=
 =?us-ascii?Q?EqAkJiXFZ1rhlGp8DMxlKwS/tH/tVJCp0r+eDNOnx/ah1jXHWbgFxrFedQo/?=
 =?us-ascii?Q?OtXbvvGAhZdocDNgTDQFYKdLZCNCn8PGko1TYEw36mQMOLJUEzw12EeeIADX?=
 =?us-ascii?Q?IrIVDU2Lgorr7U17qWHdab4hq0FDWBSOFUxHE5KAmz72fxdvHLksOHKEI7G6?=
 =?us-ascii?Q?tN+wfTjWzLtz2InbVj0TzAQzlQn16bV5T5NaHzfLVKIi0wPsVJA6TwXM6+U3?=
 =?us-ascii?Q?yREU7yHIpQfsS4a9j/rLU/7KMzKA5ZeKUlXeG9HOd6fR7YY1YewVS9zzLfTM?=
 =?us-ascii?Q?oc/Bo0UvGym5/tHylw/AIbu6gDtDuijFhK2LmeQysnbCg/XBeunpUayzTPCK?=
 =?us-ascii?Q?uE8vQ2wmGjWuWuIybtfmky7Gf4mPkWC552AznmMVzQeb0rLgVXJx3Rv/AvnH?=
 =?us-ascii?Q?fsf0uC4gINk346K0GcF1P4etbDG5scib83wX06B/Pi4s15hgRb41PnyCrGJi?=
 =?us-ascii?Q?/R28HPZYbc2mzVx+6XJ4i85sY3cPkHvnPfZ83FPqM1fZF6l8WHByk2mgDfsW?=
 =?us-ascii?Q?7w4+1ycAAs8svf56Y5eKHEX6y49xMXsWr/5H7gdd4rg9I8iVxEbxmFcKXSvv?=
 =?us-ascii?Q?Vnfy45QS+WU2wkKeiXmDxSUuQAFWnn8Mv2HR1PGVVW+SCdEQ5UUF46y+YpUJ?=
 =?us-ascii?Q?A8m8Qxpo81Lfw2ogoC4k3cRWqmwcxLDMr+1KzLaSH001kozgle7Qs/prmasJ?=
 =?us-ascii?Q?8JxhKkkmWxXtWP0ntWLbfih0t4u6y41f7jsj2zfwozcANf0qvZ53snngEnwb?=
 =?us-ascii?Q?cw9snHxIuigLP8TjFLFPmm8GDjQTxCYIb2h0qb9cQTR+azU02gJkWGjwTo73?=
 =?us-ascii?Q?U2HWlh3oKrleKWZM5PaT5bTjle6a6f+Y8qIsQJ7U+AIGX/9rwmj91nvUaNt3?=
 =?us-ascii?Q?Xliam4lDuIfXY7IKoGMFfXic2nZw2xztrJNkeQrsQbf7Zm7Y1g/Nsorm2ea2?=
 =?us-ascii?Q?Rz5shf1MKUS7bpqhA3idrsUKk+1l9e6fEZKx57tiVb3N7j2bI7IyPzHcqyRf?=
 =?us-ascii?Q?ZkSWtHcjm0PPjbnEXWe22IoeXoOkN8evB6fJuVK5q0wJUThu/rSNwJZw4rlr?=
 =?us-ascii?Q?dNbVvsrDZ/W/xTcRv60+5CWWBVi9+eUpsUpV8zIWiq8wcDOtEEP7vo9cXBFd?=
 =?us-ascii?Q?VeSGZU28fDfp7mBU52No3y3VYaR4PVlICaMZnsKcxFlhhNKXu7BGcm9tEewG?=
 =?us-ascii?Q?lgV/+0v0z06c7Wm1GkY37l/1eGX/CL5MO3pFav2CldpqDyETBwGtFkdvtqby?=
 =?us-ascii?Q?O7J+45TLYvZI0//JpjYyuSk0vfZs3jRQbtJP9luXBLyXGxbxxiGARppznq2O?=
 =?us-ascii?Q?PyT9OfRg1Nh8+pC8PpJXauJ2v99T9IMxyrP4muABSIBdOSmFfkdhxM0YeVgg?=
 =?us-ascii?Q?P/TYsn/EOvtXPTKnGAkYoKVVOSTDC3dXIp0u?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:03:40.8519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f298020-fef3-4aa0-606c-08dde61a2a41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6308

Users need to set "cpufreq=amd-cppc" in xen cmdline to enable amd-cppc driver,
which selects ACPI Collaborative Performance and Power Control (CPPC) on
supported AMD hardware to provide a finer grained frequency control mechanism.
`verbose` option can also be included to support verbose print.

When users setting "cpufreq=amd-cppc", a new amd-cppc driver
shall be registered and used. All hooks for amd-cppc driver are transiently
missing, and we temporarily make registration fail with -EOPNOTSUPP here. It
will be fixed along with the implementation.

New xen-pm internal flag XEN_PROCESSOR_PM_CPPC is introduced, to stand for
cpufreq driver in CPPC mode. We define XEN_PROCESSOR_PM_CPPC 0x100, as it is
the next value to use after 8-bits wide public xen-pm options. We also add
sanity check on compile time. All XEN_PROCESSOR_PM_xxx checking shall be
updated to consider "XEN_PROCESSOR_PM_CPPC" too.

XEN_PROCESSOR_PM_CPPC and XEN_PROCESSOR_PM_PX are firstly set when Xen parsed
relative driver signature from xen cmdline, and will become exclusive after
cpufreq driver registration. It is because that platform could not support
both or mixed mode (CPPC & legacy Px) operations, and only one cpufreq driver
could be registerd in Xen at one time, such as on AMD, it is either amd-cppc
or legacy P-states driver.
Xen rely on XEN_PROCESSOR_PM_CPPC flag to tell current cpufreq driver is in
CPPC mode, and accepts relative hypercall. It will neglect Px request and
yields success.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
---
v1 -> v2:
- Obey to alphabetic sorting and also strict it with CONFIG_AMD
- Remove unnecessary empty comment line
- Use __initconst_cf_clobber for pre-filled structure cpufreq_driver
- Make new switch-case code apply to Hygon CPUs too
- Change ENOSYS with EOPNOTSUPP
- Blanks around binary operator
- Change all amd_/-pstate defined values to amd_/-cppc
---
v2 -> v3
- refactor too long lines
- Make sure XEN_PROCESSOR_PM_PX and XEN_PROCESSOR_PM_CPPC incompatible flags
after cpufreq register registrantion
---
v3 -> v4:
- introduce XEN_PROCESSOR_PM_CPPC in xen internal header
- complement "Hygon" in log message
- remove unnecessary if()
- grow cpufreq_xen_opts[] array
---
v4 -> v5:
- remove XEN_PROCESSOR_PM_xxx flag sanitization from individual driver
- prefer ! over "== 0" in purely boolean contexts
- Blank line between non-fall-through case blocks
- add build-time checking between internal and public XEN_PROCESSOR_PM_*
values
- define XEN_PROCESSOR_PM_CPPC with 0x100, as it is the next value to use
after public interface, and public mask SIF_PM_MASK is 8 bits wide.
- as Dom0 will send the CPPC/Px data whenever it could, the return value shall
be 0 instead of -ENOSYS/EOPNOTSUP when platform doesn't require these data.
---
v5 -> v6:
- do not register the driver when all hooks are NULL
- refactor the subject and commit message
- move pruning of xen_processor_pmbits into generic space
- add comment and build-time check for XEN_PROCESSOR_PM_CPPC
---
v6 -> v7:
- reomove pointless initializer for "unsigned int i"
- move closing brace into its own line
- insertion always at the bottom
- change to use #ifdef CONFIG_AMD code wrapping
---
v7 -> v8:
- Blank line between declaration(s) and statement(s)
---
 docs/misc/xen-command-line.pandoc         |  7 ++-
 xen/arch/x86/acpi/cpufreq/Makefile        |  1 +
 xen/arch/x86/acpi/cpufreq/amd-cppc.c      | 59 +++++++++++++++++++
 xen/arch/x86/acpi/cpufreq/cpufreq.c       | 69 ++++++++++++++++++++++-
 xen/arch/x86/platform_hypercall.c         | 14 +++++
 xen/drivers/acpi/pm-op.c                  |  3 +-
 xen/drivers/cpufreq/cpufreq.c             | 13 ++++-
 xen/include/acpi/cpufreq/cpufreq.h        |  6 +-
 xen/include/acpi/cpufreq/processor_perf.h | 10 ++++
 9 files changed, 175 insertions(+), 7 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/amd-cppc.c

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a75b6c9301..3916cc81f6 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -515,7 +515,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
 available support.
 
 ### cpufreq
-> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]]`
+> `= none | {{ <boolean> | xen } { [:[powersave|performance|ondemand|userspace][,[<maxfreq>]][,[<minfreq>]]] } [,verbose]} | dom0-kernel | hwp[:[<hdc>][,verbose]] | amd-cppc[:[verbose]]`
 
 > Default: `xen`
 
@@ -526,7 +526,7 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `<maxfreq>` and `<minfreq>` are integers which represent max and min processor frequencies
   respectively.
 * `verbose` option can be included as a string or also as `verbose=<integer>`
-  for `xen`.  It is a boolean for `hwp`.
+  for `xen`.  It is a boolean for `hwp` and `amd-cppc`.
 * `hwp` selects Hardware-Controlled Performance States (HWP) on supported Intel
   hardware.  HWP is a Skylake+ feature which provides better CPU power
   management.  The default is disabled.  If `hwp` is selected, but hardware
@@ -534,6 +534,9 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
 * `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC enables the
   processor to autonomously force physical package components into idle state.
   The default is enabled, but the option only applies when `hwp` is enabled.
+* `amd-cppc` selects ACPI Collaborative Performance and Power Control (CPPC)
+  on supported AMD hardware to provide finer grained frequency control
+  mechanism. The default is disabled.
 
 There is also support for `;`-separated fallback options:
 `cpufreq=hwp;xen,verbose`.  This first tries `hwp` and falls back to `xen` if
diff --git a/xen/arch/x86/acpi/cpufreq/Makefile b/xen/arch/x86/acpi/cpufreq/Makefile
index e7dbe434a8..a2ba34bda0 100644
--- a/xen/arch/x86/acpi/cpufreq/Makefile
+++ b/xen/arch/x86/acpi/cpufreq/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_INTEL) += acpi.o
+obj-$(CONFIG_AMD) += amd-cppc.o
 obj-y += cpufreq.o
 obj-$(CONFIG_INTEL) += hwp.o
 obj-$(CONFIG_AMD) += powernow.o
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
new file mode 100644
index 0000000000..3377783f7e
--- /dev/null
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * amd-cppc.c - AMD Processor CPPC Frequency Driver
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All Rights Reserved.
+ *
+ * Author: Penny Zheng <penny.zheng@amd.com>
+ *
+ * AMD CPPC cpufreq driver introduces a new CPU performance scaling design
+ * for AMD processors using the ACPI Collaborative Performance and Power
+ * Control (CPPC) feature which provides finer grained frequency control range.
+ */
+
+#include <xen/domain.h>
+#include <xen/init.h>
+#include <xen/param.h>
+#include <acpi/cpufreq/cpufreq.h>
+
+static bool __init amd_cppc_handle_option(const char *s, const char *end)
+{
+    int ret;
+
+    ret = parse_boolean("verbose", s, end);
+    if ( ret >= 0 )
+    {
+        cpufreq_verbose = ret;
+        return true;
+    }
+
+    return false;
+}
+
+int __init amd_cppc_cmdline_parse(const char *s, const char *e)
+{
+    do {
+        const char *end = strpbrk(s, ",;");
+
+        if ( !amd_cppc_handle_option(s, end) )
+        {
+            printk(XENLOG_WARNING
+                   "cpufreq/amd-cppc: option '%.*s' not recognized\n",
+                   (int)((end ?: e) - s), s);
+
+            return -EINVAL;
+        }
+
+        s = end ? end + 1 : NULL;
+    } while ( s && s < e );
+
+    return 0;
+}
+
+int __init amd_cppc_register_driver(void)
+{
+    if ( !cpu_has_cppc )
+        return -ENODEV;
+
+    return -EOPNOTSUPP;
+}
diff --git a/xen/arch/x86/acpi/cpufreq/cpufreq.c b/xen/arch/x86/acpi/cpufreq/cpufreq.c
index e227376bab..94e8e11c15 100644
--- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
+++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
@@ -131,12 +131,14 @@ static int __init cf_check cpufreq_driver_init(void)
 
     if ( cpufreq_controller == FREQCTL_xen )
     {
+        unsigned int i;
+
         ret = -ENOENT;
 
         switch ( boot_cpu_data.x86_vendor )
         {
         case X86_VENDOR_INTEL:
-            for ( unsigned int i = 0; i < cpufreq_xen_cnt; i++ )
+            for ( i = 0; i < cpufreq_xen_cnt; i++ )
             {
                 switch ( cpufreq_xen_opts[i] )
                 {
@@ -151,6 +153,11 @@ static int __init cf_check cpufreq_driver_init(void)
                 case CPUFREQ_none:
                     ret = 0;
                     break;
+
+                default:
+                    printk(XENLOG_WARNING
+                           "Unsupported cpufreq driver for vendor Intel\n");
+                    break;
                 }
 
                 if ( !ret || ret == -EBUSY )
@@ -160,13 +167,71 @@ static int __init cf_check cpufreq_driver_init(void)
 
         case X86_VENDOR_AMD:
         case X86_VENDOR_HYGON:
-            ret = IS_ENABLED(CONFIG_AMD) ? powernow_register_driver() : -ENODEV;
+#ifdef CONFIG_AMD
+            for ( i = 0; i < cpufreq_xen_cnt; i++ )
+            {
+                switch ( cpufreq_xen_opts[i] )
+                {
+                case CPUFREQ_xen:
+                    ret = powernow_register_driver();
+                    break;
+
+                case CPUFREQ_amd_cppc:
+                    ret = amd_cppc_register_driver();
+                    break;
+
+                case CPUFREQ_none:
+                    ret = 0;
+                    break;
+
+                default:
+                    printk(XENLOG_WARNING
+                           "Unsupported cpufreq driver for vendor AMD or Hygon\n");
+                    break;
+                }
+
+                if ( !ret || ret == -EBUSY )
+                    break;
+            }
+#else
+            ret = -ENODEV;
+#endif /* CONFIG_AMD */
             break;
 
         default:
             printk(XENLOG_ERR "Cpufreq: unsupported x86 vendor\n");
             break;
         }
+
+        /*
+         * After successful cpufreq driver registeration, XEN_PROCESSOR_PM_CPPC
+         * and XEN_PROCESSOR_PM_PX shall become exclusive flags.
+         */
+        if ( !ret )
+        {
+            ASSERT(i < cpufreq_xen_cnt);
+            switch ( cpufreq_xen_opts[i] )
+            {
+            case CPUFREQ_amd_cppc:
+                xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
+                break;
+
+            case CPUFREQ_hwp:
+            case CPUFREQ_xen:
+                xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
+                break;
+
+            default:
+                break;
+            }
+        }
+        else if ( ret != -EBUSY )
+            /*
+             * No cpufreq driver gets registered, clear both
+             * XEN_PROCESSOR_PM_CPPC and XEN_PROCESSOR_PM_PX
+             */
+             xen_processor_pmbits &= ~(XEN_PROCESSOR_PM_CPPC |
+                                       XEN_PROCESSOR_PM_PX);
     }
 
     return ret;
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index fafc176475..79bb99e0b6 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -546,6 +546,8 @@ ret_t do_platform_op(
                 ret = 0;
                 break;
             }
+            /* Xen doesn't support mixed mode */
+            ASSERT(!(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC));
 
             ret = set_px_pminfo(op->u.set_pminfo.id, &op->u.set_pminfo.u.perf);
             break;
@@ -578,6 +580,18 @@ ret_t do_platform_op(
         }
 
         case XEN_PM_CPPC:
+            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
+            {
+                /*
+                 * Neglect CPPC-info when registered cpufreq driver
+                 * isn't in CPPC mode
+                 */
+                ret = 0;
+                break;
+            }
+            /* Xen doesn't support mixed mode */
+            ASSERT(!(xen_processor_pmbits & XEN_PROCESSOR_PM_PX));
+
             ret = set_cppc_pminfo(op->u.set_pminfo.id,
                                   &op->u.set_pminfo.u.cppc_data);
             break;
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index e3b5c8bcaa..2f516e62b1 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -352,7 +352,8 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
     switch ( op->cmd & PM_PARA_CATEGORY_MASK )
     {
     case CPUFREQ_PARA:
-        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
+        if ( !(xen_processor_pmbits & (XEN_PROCESSOR_PM_PX |
+                                       XEN_PROCESSOR_PM_CPPC)) )
             return -ENODEV;
         if ( !pmpt || !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
             return -EINVAL;
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index c6ce31c0ac..52b7ff71ad 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -65,7 +65,7 @@ LIST_HEAD_READ_MOSTLY(cpufreq_governor_list);
 /* set xen as default cpufreq */
 enum cpufreq_controller cpufreq_controller = FREQCTL_xen;
 
-enum cpufreq_xen_opt __initdata cpufreq_xen_opts[2] = { [0] = CPUFREQ_xen };
+enum cpufreq_xen_opt __initdata cpufreq_xen_opts[3] = { [0] = CPUFREQ_xen };
 unsigned int __initdata cpufreq_xen_cnt = 1;
 
 static int __init cpufreq_cmdline_parse(const char *s, const char *e);
@@ -99,6 +99,10 @@ static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
         xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;
         break;
 
+    case CPUFREQ_amd_cppc:
+        xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
+        break;
+
     default:
         ASSERT_UNREACHABLE();
         ret = -EINVAL;
@@ -162,6 +166,13 @@ static int __init cf_check setup_cpufreq_option(const char *str)
             if ( !ret && arg[0] && arg[1] )
                 ret = hwp_cmdline_parse(arg + 1, end);
         }
+        else if ( IS_ENABLED(CONFIG_AMD) && choice < 0 &&
+                  !cmdline_strcmp(str, "amd-cppc") )
+        {
+            ret = handle_cpufreq_cmdline(CPUFREQ_amd_cppc);
+            if ( !ret && arg[0] && arg[1] )
+                ret = amd_cppc_cmdline_parse(arg + 1, end);
+        }
         else
             ret = -EINVAL;
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index fd530632b4..5d4881eea8 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -26,8 +26,9 @@ enum cpufreq_xen_opt {
     CPUFREQ_none,
     CPUFREQ_xen,
     CPUFREQ_hwp,
+    CPUFREQ_amd_cppc,
 };
-extern enum cpufreq_xen_opt cpufreq_xen_opts[2];
+extern enum cpufreq_xen_opt cpufreq_xen_opts[3];
 extern unsigned int cpufreq_xen_cnt;
 struct cpufreq_governor;
 
@@ -272,4 +273,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
 
 int acpi_cpufreq_register(void);
 
+int amd_cppc_cmdline_parse(const char *s, const char *e);
+int amd_cppc_register_driver(void);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index e6576314f0..0a87bc0384 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -5,6 +5,16 @@
 #include <public/sysctl.h>
 #include <xen/acpi.h>
 
+/*
+ * Internal xen-pm options
+ * They are extension to public xen-pm options (XEN_PROCESSOR_PM_xxx) defined
+ * in public/platform.h, guarded by SIF_PM_MASK
+ */
+#define XEN_PROCESSOR_PM_CPPC   0x100
+#if XEN_PROCESSOR_PM_CPPC & MASK_EXTR(~0, SIF_PM_MASK)
+# error "XEN_PROCESSOR_PM_CPPC shall not occupy bits reserved for public xen-pm options"
+#endif
+
 #define XEN_CPPC_INIT 0x40000000U
 #define XEN_PX_INIT   0x80000000U
 
-- 
2.34.1


