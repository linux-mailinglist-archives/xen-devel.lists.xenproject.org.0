Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9711B90A8EB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 11:01:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741971.1148691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8El-0002lr-Rp; Mon, 17 Jun 2024 09:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741971.1148691; Mon, 17 Jun 2024 09:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8El-0002jk-Ne; Mon, 17 Jun 2024 09:01:15 +0000
Received: by outflank-mailman (input) for mailman id 741971;
 Mon, 17 Jun 2024 09:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d9pI=NT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sJ8Ek-0001sw-D7
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 09:01:14 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20627.outbound.protection.outlook.com
 [2a01:111:f403:200a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24a51101-2c88-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 11:01:12 +0200 (CEST)
Received: from BN0PR02CA0026.namprd02.prod.outlook.com (2603:10b6:408:e4::31)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 09:01:07 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::bb) by BN0PR02CA0026.outlook.office365.com
 (2603:10b6:408:e4::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30 via Frontend
 Transport; Mon, 17 Jun 2024 09:01:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Mon, 17 Jun 2024 09:01:06 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 17 Jun
 2024 04:01:01 -0500
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
X-Inumbo-ID: 24a51101-2c88-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeMfdHsjwibjuPvX1wgZ9PxctMhCa4ReTBMejBfgwoVlZxMQXL8Zo67T53Cqyu8Z0ULz4HvfmYkkEKlE7BBncIV9srlrhriT6+0Kq+94v7lVR1K3Doxk8H4K+WziI5k0p3H3o0uUJQg+iYCWfzcATmuKeJgUlZh2KrRDfDqGO9m4dSGYfwY34UjSLrD3jGOMH0rMlqMsCX4od+ZGmLv61W6wAJfZ27klVr8w2mH21kqihMnQz9lv9/5UShvAP+OUykjD4K7ax8L6wyDvVazY/Tr7SbER+BShA2rOZzmQNX3pF5NEuxqraXHROODw+NtJoDpG49ov1mhazE5FvR94tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMKlHsXkyAhfZlOofMMtN4ROHc5mALfPC96QGGMH/X0=;
 b=D+qbV5/5zV6If3j4IjOOxAfVVDNm2UcbU1QnUVjlA+eFe/Nih6Q7DmIwEmd7Tj15IoTTLBmZw3mrJZG01q2nci4hXzCVUtDH/vCTkmvwP+OOSOrLtOKV38HiGFlELs254xhqKv5SnHs0DsN8j3AAlIadkPLcg7basvY0UNzqu1JrrRcLoSCMppMtrQYXU9Z8rBIofn/VGs6E6Gt8xR374k09ddzabuitT/7h12x/Qvz4gFdimVQqwrDXkrARxJiWUR6sxtcmVs4/Y1dgMMOKE9O5pyWwzr/oIxHdvQP8u2DDoeFttvC1XX1TwcJ9JbBQIj/VuLfL5srBl5DlYN6ICw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMKlHsXkyAhfZlOofMMtN4ROHc5mALfPC96QGGMH/X0=;
 b=ymdY+jdRRjXAe0XqOFFZvr8oj605DJ+xVlYjCjf4InUOs2Tlh+BJOYL5CUJfU4bfoRJ7PsREijfIMVYVvRPGBBhB9iNYGuAwo69t2z7TkI8qPlKFJ5mkBTpPhd8SmT/d+alLMbq+KZGME6q+umLR16/XvczoTYkGkcFV8+/CiKo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [XEN PATCH v10 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Date: Mon, 17 Jun 2024 17:00:33 +0800
Message-ID: <20240617090035.839640-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617090035.839640-1-Jiqian.Chen@amd.com>
References: <20240617090035.839640-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|SA0PR12MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: 00028aba-4365-41da-ba50-08dc8eac0645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|36860700010|376011|7416011|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XB/KUpauiID7TSc8Cb+YVhE2fzelwsvdqeM05eRg6810sCCcW40gKuMuIxmd?=
 =?us-ascii?Q?J+SyxlaFKbiUS9fcaKfqt1Y3ZCKthCidCkzRR+49MPHM0lSA6uRf8mjNDTVL?=
 =?us-ascii?Q?Szw03Rzqpj6fZsvwsDMCqIa+bQllKtBEKNErlKKEvpMezBxKyQRIbEboPd4p?=
 =?us-ascii?Q?wTcLQarXkuqqZEG7nmbZk2rIk44iv0qNYMTIOseT/n+DuEj0iQm2IWnr9NIW?=
 =?us-ascii?Q?0kMbhqM7+K541PkQAWuq57+btHANVrEA+6QJpprOBJDTgt8k35EImN+B3iCn?=
 =?us-ascii?Q?J6DAKNYfyyfidftHub+HffclVOL4MIWvwZW6tyPQrDxjBz1Htf0UhBcAXJQR?=
 =?us-ascii?Q?+8AFrsrZQXuKCqdiykZXDX92aPJJeXdUE3swWqn1p4rjlJZGKySVWwLXI0eK?=
 =?us-ascii?Q?/jeQQ4gf4ZO98PTP2ygHuwfDJGfXnL8cXkLTV06Vc7gE0b6SmgDNLlSDUg9V?=
 =?us-ascii?Q?QkgBBVOrxTscK/nsYLt7fO6+ZmXlprSZ7kBjeedAo3r3BwxzY114AvBDuuQ9?=
 =?us-ascii?Q?6TmTQEioRJLLyTG5J7o93RXUIk9VzCyYunDC3SVevqFz0gq8RfjIvXzOxeX/?=
 =?us-ascii?Q?wmmbgKxMu4mnd25883sVdsvJdWHG26w+S62GA9jiX07EMZ6w62VnxKmEXsbg?=
 =?us-ascii?Q?5sGXUTMEwW8Uk5DHc8wPRNpiDf6bUNLxvkL6EGoxJnHWJmRwPuEKA3VS7f/J?=
 =?us-ascii?Q?9nRniSib8s+nCJfC4LyaHOptiKxlgL4vh0gd4SaxnFLYlxDJi6eTtUu4BjTp?=
 =?us-ascii?Q?iJfYVwh8/jRLNPZC6/RTnJRqlAlIWg9O17HQyBi+fSFLrkMcTUI9Kyg6XYLl?=
 =?us-ascii?Q?NG0GvKH8u9mLHw75HEf8uqA7LclTaRo8lIRJxNGXYUZtEwSBDR+AZPV/1k5N?=
 =?us-ascii?Q?Zc+499iUN0PXDacKmwSWJnjYziOF83BSp/yASfA4PilifxWy6jZWSepga2eE?=
 =?us-ascii?Q?GwUKe9czStcDoSjx24di75NTRiW+J8o5D8o7HTaQnAkDSVxJanhJ5OdRmLuj?=
 =?us-ascii?Q?LvtY3oulRj7IinBPiW2OPlqcQ2U2sBeVskNmGw10KaggqyTEAkaGEZzMs3mB?=
 =?us-ascii?Q?CuxQ/kLQslYsyZUM2SW4H7p0+NsHuir4oGxpf0PxPmkYVeX3C44VqS/IByIr?=
 =?us-ascii?Q?86uN2eHoFTSj9WBrqFiQGeZ/PujLK/3iY1yUbbsJCcxzVd1+pd/v+Q61B4LJ?=
 =?us-ascii?Q?FE1KVpKMHo5Zr4VG7PnO5896SfAH/qxNz8xR05bsE/memBAfZEmOmezUhU6G?=
 =?us-ascii?Q?TxFz/KA3N5hi3TPX0bCMCcHnN6p04J3cNKKtK29iI9Mvq9lRHIrNC+pgnIEf?=
 =?us-ascii?Q?HqS5xYcbA6H/4l3aOIHhBCBlGzfyO0FruBgY/AzNCmT7wea4saOuM3w+PMzk?=
 =?us-ascii?Q?5vTA5vs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(36860700010)(376011)(7416011)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 09:01:06.9738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00028aba-4365-41da-ba50-08dc8eac0645
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367

The gsi of a passthrough device must be configured for it to be
able to be mapped into a hvm domU.
But When dom0 is PVH, the gsis don't get registered, it causes
the info of apic, pin and irq not be added into irq_2_pin list,
and the handler of irq_desc is not set, then when passthrough a
device, setting ioapic affinity and vector will fail.

To fix above problem, on Linux kernel side, a new code will
need to call PHYSDEVOP_setup_gsi for passthrough devices to
register gsi when dom0 is PVH.

So, add PHYSDEVOP_setup_gsi into hvm_physdev_op for above
purpose.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
The code link that will call this hypercall on linux kernel side is as follows:
https://lore.kernel.org/xen-devel/20240607075109.126277-3-Jiqian.Chen@amd.com/
---
 xen/arch/x86/hvm/hypercall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 03ada3c880bd..cfe82d0f96ed 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -86,6 +86,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
             return -ENOSYS;
         break;
 
+    case PHYSDEVOP_setup_gsi:
     case PHYSDEVOP_pci_mmcfg_reserved:
     case PHYSDEVOP_pci_device_add:
     case PHYSDEVOP_pci_device_remove:
-- 
2.34.1


