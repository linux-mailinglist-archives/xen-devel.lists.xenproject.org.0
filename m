Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1945FAA8B38
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 05:00:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975778.1363109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm4M-0004Cs-24; Mon, 05 May 2025 03:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975778.1363109; Mon, 05 May 2025 03:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBm4L-0004AU-QR; Mon, 05 May 2025 03:00:37 +0000
Received: by outflank-mailman (input) for mailman id 975778;
 Mon, 05 May 2025 03:00:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LKXI=XV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uBm1Y-0000Iv-NO
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 02:57:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2418::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6bdf70b-295c-11f0-9eb4-5ba50f476ded;
 Mon, 05 May 2025 04:57:43 +0200 (CEST)
Received: from MW4PR02CA0017.namprd02.prod.outlook.com (2603:10b6:303:16d::24)
 by CH2PR12MB4246.namprd12.prod.outlook.com (2603:10b6:610:a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 02:57:36 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::13) by MW4PR02CA0017.outlook.office365.com
 (2603:10b6:303:16d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.27 via Frontend Transport; Mon,
 5 May 2025 02:57:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 5 May 2025 02:57:35 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 4 May
 2025 21:57:34 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sun, 4 May 2025 21:57:33 -0500
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
X-Inumbo-ID: b6bdf70b-295c-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V59qptvdI9oZhyuIamV+aWWeCLQMPRNybFvSaZH3y/fGC+w9goYscAqItYnUYpJsVw2JJeWFDF/Ro/xJ8M5zY+SUIGIh1abb521FbH4eIlbjAPi73n9vHHiLuFE1gGW7RSawUyA4vYun2dExAFYmxSq959uVCnMycN/QJ6f5bKAfZ33Nt462Mxj8jAri/Lv2qTrAb7KFjZ9m6qfRKIJp+Dqs89H+5SGYv4W/58myh4pKBlgDt0lYda0vwPqAMZ7HfoNBZohrZ4t0Ge3q5sXpzK4JsJSij4XtJdlLgD9tuipX3aGeBpO/qVYE/9JN2T5zVexLvb8MgUIUDJOOaibEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEvx1wmn01iTjM6pupbHY1kYSQPlwozYMYZ4oM7o7v0=;
 b=TzbXQDwXPdL/eGEeRhFtaTDe18lTNB5658MU+17FxN0wm9on3EYmMhHV94J5ZCt6ZSBymnDabQUPEdO6Gqwqg7pIf6larykWKBK3vWRbp5NspfWhrfDGRiDeP8ArxwWOZAsfEKR5eC8wm7vjLqrhh/OotdAO+OocjDL9wNUW3hpbrjVvX30VGKLGGgpObS7Vn45xGfH5fm7zeobmETYbubMAWQ+7vQaMHxM1DbhEHMXOEmFTttuZ+KgHJPgZDc3a1SNFt1WgzirHdWXqaQt7+dAn0EZ6cPrNC6/h6TRayUFuZ2Wu8qSxCwtAVGzSG25YlWezjXKipsk22vrh4jvTPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEvx1wmn01iTjM6pupbHY1kYSQPlwozYMYZ4oM7o7v0=;
 b=elUap8Gi6nWYoNAGky5eNCqqmKMkD0Xx/kJS5XXKLPTVtvMk3DNE5WGDRAB0MuLCSKa6Pz5wZGoi5kTgLQN05FgEhhJYXjBMGm0KhciXFbgTkNrB1JXwARsggqWr2Vp8PAduz4m1xLGB2JfKxjPc4F1SwiXpaInOD1FeT6HhEPc=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/6] xen/arm: exclude xen,reg{-cacheable} from domU extended regions
Date: Sun, 4 May 2025 22:56:28 -0400
Message-ID: <20250505025631.207529-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505025631.207529-1-stewart.hildebrand@amd.com>
References: <20250505025631.207529-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|CH2PR12MB4246:EE_
X-MS-Office365-Filtering-Correlation-Id: 851ef4b8-c452-49c8-56c0-08dd8b8096aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Db7ltdOZ4l0YdJJowGeCr2YmjU85D6oCcICG1z+6JluPvXcqjAFWKe1UxMYx?=
 =?us-ascii?Q?zuUjGu1UABwfM20niFPO75Zt+omAUXSjyu6rg8LTFpvmRGFJC3ncNFSg2657?=
 =?us-ascii?Q?2bAmnG1k9uPKHbkH/gMrOBkjQzrBC2jV7qWbxuvF+AKrmcjh9ZkRNvMYE6FJ?=
 =?us-ascii?Q?Xt+CqU4A8nV5JTIw0qhOVmykkmNXsoZ14xkOxzOUPiZVRI+ksKwDw3C9SA6E?=
 =?us-ascii?Q?tKZGbYee3jz96BpDPzO+rA6QWa8iRZslA7Y/ErlXl57VD2jvt7Q4cbL1+cd/?=
 =?us-ascii?Q?4eRuR2rVxMSjbr+oFAKZsfvPcF2yotA0dm+tTFqa4plxtPaoOycO63247663?=
 =?us-ascii?Q?avTl3x3xEm2E6rSH6ltbmeczNQWaIs9Mnzwuz7vPrBQPviaycA+YJ9UfW+Pl?=
 =?us-ascii?Q?06LH7iPcSTD3fSMw2l6uWVRcy2QAguZOgv+LtrLpR6AVaTqS5o1hXNDWfL42?=
 =?us-ascii?Q?Csqn+Yad98SsYfhFG8S4l13SC3gShPJnP9DCoY0wH4oLxcQXDmnku7x779DU?=
 =?us-ascii?Q?tbX2/Hw11S5Knp5dZDRjTzdS//Nv9FZdtcxkz7bmUnFwVOqZUDAV6uDZeHuo?=
 =?us-ascii?Q?8T6KRlqwP647JEHblSLNIWWqP5JocCV/cF6Bq62t2QlBx5JDHVxsvWMSD4Qp?=
 =?us-ascii?Q?56P2rzwYtXtpl6lZ/B5D60idtVoXOIXFNW9unWC623fGnxyonU+RWdS+a2gF?=
 =?us-ascii?Q?6UoE2OaN2mAxHLmQDvbrQ0zpu8bRIsDo1E/gZyzj2nDzXfnMis6cDA0O0jmZ?=
 =?us-ascii?Q?+Jy6mlrIg/U8XHtyIY5MJ0YSR2/mEJz6wqxHRS6KQV89/2jGMTu7JP+da9v2?=
 =?us-ascii?Q?6PsMh8RAM+Fc3fQtretd0ydYQA8Ps18qfi1ErMArOeGBJSgwdXVsIdb0PYNg?=
 =?us-ascii?Q?Cmq1HDlIleTpjW8DeWmn1b7Xydrf0jQK7zOvD6IvRQYZNy8lTJRod8AZ0iFD?=
 =?us-ascii?Q?DVA7zl56LIiq27lABIDmGnfmW1oob4m/Vq60PjMRqtB3gSmYnjn8CA9rDgpS?=
 =?us-ascii?Q?ek4wbiSx5cUHqg+K6ka7x7CuCdDehUVG80DeIThVXOIBlbXHWdVfwGIqywyA?=
 =?us-ascii?Q?JYhjjF5LtSUprilh3dLn3hrFcwl2gEt+tfgFsfKH3AN7rksojR1BB3DVE+3P?=
 =?us-ascii?Q?+2qwjoUgmlfx2aWYFD4qksUZtv56UauKrYN7ZJRG1zvNuVr+MZ0CIPTukTL2?=
 =?us-ascii?Q?G1QxcGUGEWrV74ZIJ3RfASnkHo2NsxZbGn8A03cAnIForVTypb/1LgAsD3UX?=
 =?us-ascii?Q?gLopwmb7eF/eSI/Tgatwt5u4Qi8h8csQr6/oOgpJRnu06sBfVK+lvMewE2iC?=
 =?us-ascii?Q?xXZNz/NiPRIxppVi6MIIm0GOvEgkmZYWyPGkhe2ixmvvJCGnp5JqBsMciX2S?=
 =?us-ascii?Q?Xz047uHhHFtCjfftba3Y+TneOVmNnvgf6YL/W8+5zhM1jyYvCcSmOjx76ttQ?=
 =?us-ascii?Q?lV7uEHLbccOtdEzwZvZncK93twKTALWozNgC2pos1wKY7wyY/99sqjYPUEMA?=
 =?us-ascii?Q?qmyyqkD4cDqLPTCtwrRcYskySO3pcvf6Cy0i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 02:57:35.4879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 851ef4b8-c452-49c8-56c0-08dd8b8096aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4246

When a device is passed through to a dom0less domU, the
xen,reg{-cacheable} ranges may overlap with the extended regions. Remove
xen,reg{-cacheable} from extended regions.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Not sure if we need a Fixes: tag, but if we do:
Fixes: 2a2447757b3c ("xen/arm: implement domU extended regions")

I investigated an alternate approach of parsing the partial device tree
again to scan for xen,reg{-cacheable} properties, but it resulted in
quite a lot of code duplication. Adding a rangeset pointer to "struct
kernel_info" has a much smaller diffstat, and then we avoid the need to
parse the partial device tree a second time.

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
 xen/arch/arm/dom0less-build.c     | 19 ++++++++++++++++++-
 xen/arch/arm/domain_build.c       | 13 ++++++++++++-
 xen/arch/arm/include/asm/kernel.h |  1 +
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index a356fc94fc4d..23178a801818 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -274,6 +274,14 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
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
@@ -315,6 +323,11 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
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
@@ -1006,7 +1019,11 @@ static int __init construct_domU(struct domain *d,
 
     domain_vcpu_affinity(d, node);
 
-    return alloc_xenstore_params(&kinfo);
+    rc = alloc_xenstore_params(&kinfo);
+
+    rangeset_destroy(kinfo.xen_reg_assigned);
+
+    return rc;
 }
 
 void __init create_domUs(void)
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3dcdd7a8c46f..da7c7c000f1f 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1296,6 +1296,13 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
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
@@ -2329,7 +2336,11 @@ static int __init construct_dom0(struct domain *d)
     if ( rc < 0 )
         return rc;
 
-    return construct_hwdom(&kinfo, NULL);
+    rc = construct_hwdom(&kinfo, NULL);
+
+    rangeset_destroy(kinfo.xen_reg_assigned);
+
+    return rc;
 }
 
 int __init construct_hwdom(struct kernel_info *kinfo,
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index bdc96f4c18eb..b3c2d50e1e3d 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -50,6 +50,7 @@ struct kernel_info {
 #ifdef CONFIG_STATIC_SHM
     struct shared_meminfo shm_mem;
 #endif
+    struct rangeset *xen_reg_assigned;
 
     /* kernel entry point */
     paddr_t entry;
-- 
2.49.0


