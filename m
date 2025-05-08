Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85837AAFB31
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 15:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979401.1366059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1C1-0007XT-2k; Thu, 08 May 2025 13:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979401.1366059; Thu, 08 May 2025 13:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1C0-0007V9-VX; Thu, 08 May 2025 13:21:40 +0000
Received: by outflank-mailman (input) for mailman id 979401;
 Thu, 08 May 2025 13:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqQS=XY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uD1Bz-0005gY-EW
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 13:21:39 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20625.outbound.protection.outlook.com
 [2a01:111:f403:2409::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ea6bc96-2c0f-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 15:21:38 +0200 (CEST)
Received: from BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::8)
 by SJ5PPF01781787B.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::986) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 8 May
 2025 13:21:30 +0000
Received: from SJ1PEPF00002322.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::af) by BY1P220CA0012.outlook.office365.com
 (2603:10b6:a03:59d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.23 via Frontend Transport; Thu,
 8 May 2025 13:21:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002322.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 13:21:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 08:21:28 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 08:21:26 -0500
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
X-Inumbo-ID: 5ea6bc96-2c0f-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EYvVicEHsYdxjt3lgkDtzjrds35spwBOKnvu2/nY9UMyeqZe44CvRxpAH08GmOmfAjmhY1RCLEmcBmiIPMc4muGOz/pAjh2Cda+7v8u/rY9llZxI4i+cOlbeJIHB6uP9jNT56MPc+xYDBcidZ1QQ6cNGX6XMSZlrLGXLU4jLln2CKABZQaJv9HGfrK4B/OPXNCQdEF5yUQvKl4wILdr2EmuIoND70BefGNjUBiZhCVybTpc97D2R5muNlFL4AMde2l+d/2ujyXIffQtH/5FL9OrisCSZ9NKDp+cxZMr5e3bSBIR8gXklbC3nNVrt0sf9k+OLbpAL1tA7ar7366Ib3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mf45CPfSF8ad4+bAErKDjNmMPQ65zTOctdwv0MmR6s0=;
 b=CU9V2WlpNdfx3VBOMcp5RtNS14froWAWfyyJ4s/mXlDWusx9/mRKrQV6IJLqlQjy3g20//kQB4FtIOuhXbH+Nsm15WrG7VjmlU/5iSKpgXQ9gzdlnY5pblDy5nTiWXVNRg8AwLh/nF4IxkbUJtmzWlHGPFE+lROVhXWGjPPFdmuTK13Y5N0jZBnHQTkuPf5ejoqOrUv8Ha+GSEDMdXBsebibVtnUnY3GK5E6+crEouyl2qhiI0BxD8a5mWaAGmXPgT4fAWZ3kPuA0rXgYD1fTaal2bHZ7lUlUjkjhvkRql8pfP6QcBY/ZPUxEVRLl54nYXy0jYQyAO2grP47IrgBxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mf45CPfSF8ad4+bAErKDjNmMPQ65zTOctdwv0MmR6s0=;
 b=vvW0j2OrWjrSEBX+vqu6aU25aTlAPcVAhTAgyEX3ZNfiKb8W2WftvlBCgZmuRiverVj81oRyTqLimAKqmidaTH2Qf49JZ4J+NtGDGm4HUS+z17gjVvjF1kn9cj4td7Y4+MhoQKLUkllW8GAdLx96LDiQerDqLCaqLX19tan2sJ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 5/6] xen/arm: exclude xen,reg from domU extended regions
Date: Thu, 8 May 2025 09:20:34 -0400
Message-ID: <20250508132040.532898-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508132040.532898-1-stewart.hildebrand@amd.com>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002322:EE_|SJ5PPF01781787B:EE_
X-MS-Office365-Filtering-Correlation-Id: a132f9db-69e7-4b85-bed0-08dd8e333e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bKAsi3iAwhD8QB5o0zm3ICZFra3kNtOM3gRLsC8OuKu6ums44ToodvrQ6JC9?=
 =?us-ascii?Q?VQRp+8vhHG+m5DceU/QCX3COKtFt1i+lcDl7FcHiF4qaU0cl4FgZfBxMIf2z?=
 =?us-ascii?Q?de1/Q3Gw9bOHTD7hb5CdnA0FHzHKo+gOVRV4GQnjEiV7nUZu6APK1xytwcXD?=
 =?us-ascii?Q?WkSCnE/WB3mDuBak3boNAi4EIjpW2VDfPIi+tXTvnMmxdGDJLeeYJJehmeUY?=
 =?us-ascii?Q?fkJO9IV6mksx2SO7/B82/NYYpZ5KsInqbrN72WbrumQ3bPVn+RpaqFdOkBjN?=
 =?us-ascii?Q?eMsgnvwyOcV6xb9eqewkvF1ZrE29C4ftD7sLNS6q9cQ9tD+OBpL5nBRvnYet?=
 =?us-ascii?Q?PrUXI4r5nXURyZe27pizwek1bJ7jhyKVMdl2WMznlrJ45Fyei++Ucojmwyn+?=
 =?us-ascii?Q?+EbaDhX/Ihq1/naisIPJqqcMJO4XWeV5BP9isGmu+WeaUn1BRbo0FbWVpVAH?=
 =?us-ascii?Q?q1aeIt84J3ATLgKzrmbfgD0lbIr4dH6sRh1ccuf9B3sqfzHCHGCgeNY1JspF?=
 =?us-ascii?Q?frMR+JF1R0lMObeNUZQ71wCbKTGJErMu7ux5Sbr4cHEZ3ELJk+Mx1QPFpVkc?=
 =?us-ascii?Q?n4fVrZLO8phFhsvPfgr3jcwnO0vEDPqZ9cSmqj5wneWDdFi0h/yx8LhgIIbQ?=
 =?us-ascii?Q?sjvf4sFE5cSj4hg4j47WxaqQCwvAQtncL9wnO9efNqiartedAaQipTi2FEkv?=
 =?us-ascii?Q?Sgy1myyvmD5H1pHJAdt/4ZgLRS6Bu1VIo1/3bCh2ZIIKocdDMfCiLadYbd0G?=
 =?us-ascii?Q?Oy5DYwnjDkViLpdvGGzxtqxVYH0qPdYSqdcgaljQYUpPdwibGajvn4hjayzV?=
 =?us-ascii?Q?L4HRE4NSCg6uDvfU7m3feoJOugYF2ixngJK52mkM63+y0bJ2CbruFz1VROE9?=
 =?us-ascii?Q?p3BdaAa9m2UaYJslNMKKjjtNVwC0BQb/n9CgM8tUEpS3wot4Q4+hzAB+iva+?=
 =?us-ascii?Q?vC+bQn9GD6bsRpZfvXbbU+bRQhIunY3QM6GB4jS9DOz17jmi3aCzR/UhJ1rt?=
 =?us-ascii?Q?CcFQLjfgxwQmEdBxRj4VqL3IHeHtZXDtzgo+gMXCE/BO0Ekq6yawhHuf19wT?=
 =?us-ascii?Q?7DVbPizKiTBlAnXWGKYqDBhLsO/zA9oWbD12qA/woTmPe6SWxkKAuDM2QJVu?=
 =?us-ascii?Q?YTyPVsqlSTdoQg5x5zGjRClK6hqhZO1vKxokND2nOspwADl9SpDzFfO1f3HS?=
 =?us-ascii?Q?pwPfLeC0x5lQ3RM01OWM1CLl5HXTHOatDBcNhuNXJBhzj3a1enK8WwCsldsQ?=
 =?us-ascii?Q?w98hX6OD1zK0qVpuh2U3cGBxbKalG/8l5VPV8UPC5rOXbxfvK1dBnUZWzTKO?=
 =?us-ascii?Q?7uADAx5rDegI2bTp/zgkuQ59NSWEPQAJrqZGbGRDDVJT7ztCW9uuxtPEKTlH?=
 =?us-ascii?Q?/lrP9Z6g0vzwtzMoxU5Ng/Zc5wsEJQviSrefLFpV1j6+zmdY0OZmIysjBZrF?=
 =?us-ascii?Q?knmA6N7hOSndq8a/BzT71v07hizXFHErQ/CReK4ucZ+sv+fv28SESwfN1ZsL?=
 =?us-ascii?Q?a3aT4dXne5VaQn7ONqUoihAET9YWKEgDME9M?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:21:29.8950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a132f9db-69e7-4b85-bed0-08dd8e333e8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002322.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF01781787B

When a device is passed through to a dom0less domU, the xen,reg ranges
may overlap with the extended regions. Remove xen,reg from extended
regions.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Not sure if we need a Fixes: tag, but if we do:
Fixes: 2a2447757b3c ("xen/arm: implement domU extended regions")

v1->v2:
* adjust commit message to not mention xen,reg-cacheable
* don't call rangeset_destroy() in construct_dom0()
* rebase

I investigated an alternate approach of parsing the partial device tree
again to scan for xen,reg properties, but it resulted in quite a lot of
code duplication. Adding a rangeset pointer to "struct kernel_info" has
a much smaller diffstat, and then we avoid the need to parse the partial
device tree a second time.

I discovered this issue when booting a dom0less domU with a device
passed through. Partial device tree excerpt:

    passthrough {
        ... <snip> ...

        axi_uart16550_0: serial@a0001000 {
            clocks = <&uart_fixed_clk>;
            compatible = "ns16550a";
            interrupt-parent = <&gic>;
            interrupts = <0 89 4>;
            reg = <0x0 0xa0001000 0x0 0x1000>;
            reg-shift = <2>;

            xen,reg = <0x0 0xa0001000 0x00 0x1000 0x0 0xa0001000>;
            xen,path = "/amba_pl@0/serial@a0000000";
            xen,force-assign-without-iommu;
        };
    };

The domU was assigned an extended region overlapping with MMIO of the
passed through device:

(XEN) d1: extended region 0: 0xa0000000->0x100000000
(XEN) d1: extended region 1: 0x200000000->0xf000000000

The domU panicked when attempting to initialize the device:

[    3.490068] a0001000.serial: ttyS0 at MMIO 0xa0001000 (irq = 15, base_baud = 6249375) is a 16550A
[    3.498843] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
[    3.498853] Mem abort info:
[    3.498855]   ESR = 0x0000000096000044
[    3.498859]   EC = 0x25: DABT (current EL), IL = 32 bits
[    3.498864]   SET = 0, FnV = 0
[    3.498867]   EA = 0, S1PTW = 0
[    3.498870]   FSC = 0x04: level 0 translation fault
[    3.498874] Data abort info:
[    3.498876]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
[    3.498879]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
[    3.498884]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    3.498888] [0000000000000010] user address but active_mm is swapper
[    3.498894] Internal error: Oops: 0000000096000044 [#1] SMP
[    3.498899] Modules linked in:
[    3.498908] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.10-stew #1
[    3.498917] pstate: 400000c5 (nZcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    3.498924] pc : mem_serial_out+0x18/0x20
[    3.498936] lr : serial8250_do_set_mctrl+0x6c/0xc0
[    3.498943] sp : ffff800081bab6d0
[    3.498946] x29: ffff800081bab6d0 x28: ffff8000815e0dc8 x27: ffff000001c29c60
[    3.498957] x26: 0000000000000000 x25: ffff00000347b900 x24: ffff000005504c00
[    3.498968] x23: ffff00000347b800 x22: 0000000000000000 x21: ffff800081b69d78
[    3.498978] x20: ffff800081b69d78 x19: 0000000000000000 x18: ffffffffffffffff
[    3.498989] x17: 3d20647561625f65 x16: 736162202c353120 x15: 3d20717269282030
[    3.498999] x14: 3030313030306178 x13: ffff800081a21ff0 x12: 00000000000007fe
[    3.499010] x11: 00000000000002aa x10: ffff800081a4dff0 x9 : ffff800081a21ff0
[    3.499020] x8 : 00000000fffff7ff x7 : ffff800081a4dff0 x6 : 0000000000000008
[    3.499030] x5 : 0000000000000000 x4 : ffff800080797584 x3 : 0000000000000002
[    3.499040] x2 : 0000000000000000 x1 : 0000000000000010 x0 : 0000000000000000
[    3.499050] Call trace:
[    3.499053]  mem_serial_out+0x18/0x20
[    3.499059]  serial8250_set_mctrl+0x34/0x40
[    3.499065]  serial_core_register_port+0x534/0x7dc
[    3.499075]  serial_ctrl_register_port+0x10/0x1c
[    3.499084]  uart_add_one_port+0x10/0x1c
[    3.499092]  serial8250_register_8250_port+0x308/0x4c0
[    3.499102]  of_platform_serial_probe+0x2c4/0x48c
[    3.499110]  platform_probe+0x68/0xdc
[    3.499120]  really_probe+0xbc/0x298
[    3.499128]  __driver_probe_device+0x78/0x12c
[    3.499135]  driver_probe_device+0xdc/0x160
[    3.499142]  __driver_attach+0x94/0x19c
[    3.499149]  bus_for_each_dev+0x74/0xd0
[    3.499155]  driver_attach+0x24/0x30
[    3.499162]  bus_add_driver+0xe4/0x208
[    3.499168]  driver_register+0x60/0x128
[    3.499176]  __platform_driver_register+0x24/0x30
[    3.499184]  of_platform_serial_driver_init+0x1c/0x28
[    3.499192]  do_one_initcall+0x6c/0x1b0
[    3.499199]  kernel_init_freeable+0x178/0x258
[    3.499209]  kernel_init+0x20/0x1d0
[    3.499218]  ret_from_fork+0x10/0x20
[    3.499228] Code: f9400800 1ac32021 8b21c001 d50332bf (39000022)
[    3.499233] ---[ end trace 0000000000000000 ]---
[    3.499237] note: swapper/0[1] exited with irqs disabled
[    3.499247] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    3.499251] SMP: stopping secondary CPUs
[    3.499284] Kernel Offset: disabled
[    3.499286] CPU features: 0x00,00000080,00200000,0200420b
[    3.499292] Memory Limit: none
[    3.792412] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
---
 xen/arch/arm/domain_build.c             |  7 +++++++
 xen/common/device-tree/dom0less-build.c | 19 ++++++++++++++++++-
 xen/include/xen/fdt-kernel.h            |  1 +
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 05a77a4f92c6..b189a7cfae9f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -973,6 +973,13 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
     if ( res )
         goto out;
 
+    if ( kinfo->xen_reg_assigned )
+    {
+        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
+        if ( res )
+            goto out;
+    }
+
     res = rangeset_report_ranges(mem_holes, 0,
                                  PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
                                  add_ext_regions, ext_regions);
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 4aa36c8ef33f..2c56f13771ab 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -146,6 +146,14 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
     int res;
     paddr_t mstart, size, gstart;
 
+    if ( !kinfo->xen_reg_assigned )
+    {
+        kinfo->xen_reg_assigned = rangeset_new(NULL, NULL, 0);
+
+        if ( !kinfo->xen_reg_assigned )
+            return -ENOMEM;
+    }
+
     /* xen,reg specifies where to map the MMIO region */
     cell = (const __be32 *)xen_reg->data;
     len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
@@ -187,6 +195,11 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
                    mstart, gstart);
             return -EFAULT;
         }
+
+        res = rangeset_add_range(kinfo->xen_reg_assigned, PFN_DOWN(gstart),
+                                 PFN_DOWN(gstart + size - 1));
+        if ( res )
+            return res;
     }
 
     /*
@@ -814,7 +827,11 @@ static int __init construct_domU(struct domain *d,
 
     domain_vcpu_affinity(d, node);
 
-    return alloc_xenstore_params(&kinfo);
+    rc = alloc_xenstore_params(&kinfo);
+
+    rangeset_destroy(kinfo.xen_reg_assigned);
+
+    return rc;
 }
 
 void __init create_domUs(void)
diff --git a/xen/include/xen/fdt-kernel.h b/xen/include/xen/fdt-kernel.h
index 7a6cd67c22f1..1939c3ebf7dc 100644
--- a/xen/include/xen/fdt-kernel.h
+++ b/xen/include/xen/fdt-kernel.h
@@ -24,6 +24,7 @@ struct kernel_info {
 #ifdef CONFIG_STATIC_SHM
     struct shared_meminfo shm_mem;
 #endif
+    struct rangeset *xen_reg_assigned;
 
     /* kernel entry point */
     paddr_t entry;
-- 
2.49.0


