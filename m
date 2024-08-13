Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A6D950B49
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2024 19:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776505.1186681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdv6e-0000fI-Kj; Tue, 13 Aug 2024 17:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776505.1186681; Tue, 13 Aug 2024 17:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdv6e-0000cj-Gw; Tue, 13 Aug 2024 17:14:48 +0000
Received: by outflank-mailman (input) for mailman id 776505;
 Tue, 13 Aug 2024 17:14:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rcsl=PM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sdv6d-0007JM-Q5
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2024 17:14:47 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20608.outbound.protection.outlook.com
 [2a01:111:f403:2009::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89ff0956-5997-11ef-a505-bb4a2ccca743;
 Tue, 13 Aug 2024 19:14:47 +0200 (CEST)
Received: from MN2PR02CA0005.namprd02.prod.outlook.com (2603:10b6:208:fc::18)
 by LV2PR12MB5824.namprd12.prod.outlook.com (2603:10b6:408:176::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Tue, 13 Aug
 2024 17:14:41 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:fc:cafe::e0) by MN2PR02CA0005.outlook.office365.com
 (2603:10b6:208:fc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Tue, 13 Aug 2024 17:14:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Tue, 13 Aug 2024 17:14:41 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 Aug
 2024 12:14:41 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 13 Aug 2024 12:14:40 -0500
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
X-Inumbo-ID: 89ff0956-5997-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mdVWLAXevRfVGlGb8wEf5fDNL1SL4AId9PAuSe+xj9UGHsJOXWj0Qeq79cTAAOmeFANEr471CywhQWFw3mfH3Ilvj7UGDQcU43lV/aVnptlD/IoVkymJPMWUCap8922fo0+lecKX4GpPLu7n7JTIXnZ51DSa7xWb3DNY+bWN2DFd3jdMuHY7G0BytdnB2N+QSt8EobzGJc7aYUnCqHmNZq7qXmJRiMfwSxM8mEd3QC/i+Ncp4P/F5Ov7Us6Q4cwqlKi9+ZDJS/eeEojJO0eanbvd2fp00TEeYMvLOx6Bk7LTsh8onJDFHE5Mr7adMqz+0Qkv74fB4pgL3sT9RcIGfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8syEudjqafW5Qhsj5GpdRFapDEC7fYWqSfZZMYCnLc=;
 b=AjbMOxaVsGdqEY3gMUX+ZZzZn3c76+m3JGz8j5/eIUq7Rg+C7D2cMqN4Y/VuGea+aZ5SBSWxsnHnyeXTqf4agviHwgS3ozAOH2unwW6XDDpZ44YCHYKw80zxliM3H0ovHWgx6pY2fuki/x6JmT4rzB6Big+JD9eNor8bExeWAvPtnuO0SJh6hpVr31kNMstR4cPs2P+YGEcc+1+7Y9D4SapFE5ORw+904ahKdWILiAIVaEb8V7eULaOtsVR+/l+UJV/Y1h6WMXMHpenDc+VF9o8oNDp8CtHV8qcqjihClK+/Og2MO5ioI+7Gz05Adp9GYmtHWYvzFlMyVxVby+Dphw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8syEudjqafW5Qhsj5GpdRFapDEC7fYWqSfZZMYCnLc=;
 b=WYKr+BVcPAeHrkEDj8a4SjXu/DE3ILT+Y1/gEuYL3jpa8gehr5JIP36xmPBtqBbDcdAnWWvAD2DB5z9u42fse6fRQJv+gXv0VifGG8xLjy6s9o5aB3BecKGj/ygKnhJO0dPYMWi2nURzaDg6fTopb3xh6Lr3N/aoxVcpakIZyZ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <julien@xen.org>, <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 4/4] xen: arm: Enclose access to EL2 MMU specific registers under CONFIG_MMU
Date: Tue, 13 Aug 2024 18:13:56 +0100
Message-ID: <20240813171356.46760-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
References: <20240813171356.46760-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|LV2PR12MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: d9072e21-ecc6-4c95-a3a9-08dcbbbb6ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JervzM7SJYMxSror9GyoOpUDbtkJjSrwghk2bLnl/B7HHrsPkvAkas+217gF?=
 =?us-ascii?Q?ngQU06ZdNs0fhKIDMD72wf3697z0++3UiNIdciW8/Oap0H11tmizyqiU3JxR?=
 =?us-ascii?Q?9BxxsqIJ1rjsDubw4l6Qa2OSfTG9ehq5Z3FxK27pFTI7iD5A2I+tvjYQC7+l?=
 =?us-ascii?Q?CnKUbog0hlqMhpDWT/ThC3lay4j6nCX8uE94aQKZAOBr02sBqNiW9xGpAalj?=
 =?us-ascii?Q?C5aejsecMtVfALKUbV1lP0wynn3GOM7mH039NUTPfinx5iFiz37vGAC7eoIh?=
 =?us-ascii?Q?UR97EvFhzUCRt1nxV5xcGX122nAPcKS/KdZN9VCUD++g14NHEFnJRw3OHRks?=
 =?us-ascii?Q?V97u34R+Z7KjzR6fMt/ciLO8vkghbtwF36kNd8bJs7pNPvmKxbRgTTbU9DxL?=
 =?us-ascii?Q?oXuBOj6Po9BGaj0MUjB31H6h5/iyWJZEwcrGXSgvo7jZ+Tgbc/n/XBHxkJET?=
 =?us-ascii?Q?VT72Pz8uaeBZJsjhT4DvBSDZ24c2uW40kfSYGmXwni4ud7Bl7DgAuorjryZg?=
 =?us-ascii?Q?2W9YsFnwT/7by/OTfHZwJn/QXPbrLtVQLVd4kbSKtNzxk3HMH7Y4N9MFc0C4?=
 =?us-ascii?Q?I7Lzj0VAMeYtFAxu/ndwJMRabLRKlvtq4Bvd3JTC26osqW+nYyAa84/AFMKp?=
 =?us-ascii?Q?unpRXRt5lTytrF9ArCFIX9qJZmFIC37y+JstA0JYbKk1Dm+j9doOeauafi5i?=
 =?us-ascii?Q?5CI2gVAEEs8wyGi4CiygvzrFStmjAGf8QM7fxWj55EpLRY6gGFTP8x84ry9l?=
 =?us-ascii?Q?cfVvaSHmtvFzqfD120sL/psRgE/hINgHgFkBnjvgfqjzoR4in3QhPHP2NyI9?=
 =?us-ascii?Q?JAgNadlY1dIXftFPZDM9cbRgFJ+bqm5IuFRAeBIKXn07VR8GXIN8BjAEwsws?=
 =?us-ascii?Q?grsoUs6u2gT4+tEgGk5T7RtOqNnZpYjCG8XfDFnD98bOGnPZbHdHYKa2DQad?=
 =?us-ascii?Q?A2v0/F8UIiulDga4p8V6ifwBpkzUnqv3vsA13AB31CorD8qXBemqj97eUgil?=
 =?us-ascii?Q?F4KSmLUyr01obPSUlo5PYPHxnpSkPD7yihbKTUO5DKInvUedhtqOw9HY2QEv?=
 =?us-ascii?Q?P41K8Dgn6whtf7+jgrAzXNjxe5Cu2oFwmPW2isb0js42/bhFSjZGGmzk2HnU?=
 =?us-ascii?Q?JnsvOCtoNjgF1Js8Q1oP2vJqBmzZaUJRdjRTUbLPSY/TsmrRhqgB5dyT/zvK?=
 =?us-ascii?Q?6TkMCjR9gf/kjNajpdMY5u675sOCLT9w7NoSZxGFYvoJ4flW567s7XdVCRpq?=
 =?us-ascii?Q?ry/0petoxFKatbuZKVgaucSCQRxTMLuiKM8c9h6TRkEu2mz3MrMkTMBlquQY?=
 =?us-ascii?Q?Trm3UKO4WnZAX3B2qRdMbkGdpbujZITSkCiIXCLCdk/qJehr5nyPxzGgJDmz?=
 =?us-ascii?Q?QH5KiPb9QAQHkOOlRzdRpZQcGMsS/r/fN7hVrJrqSgxOy2qevnpleEicNhBD?=
 =?us-ascii?Q?OdxeZBk7DphCYTj+mT2G2ITrqomTdRWz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 17:14:41.8085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9072e21-ecc6-4c95-a3a9-08dcbbbb6ba2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5824

All the EL2 MMU specific registers are enclosed within CONFIG_MMU.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :

v1 -
1. 'vttbr_el2' field is enclosed with ifdef.
2. No movement of code.

v2 -
1. Enclosed 'vttbr_el2' access in show_registers() and vcpu_show_registers().

 xen/arch/arm/traps.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index aac6c599f8..737f4d65e3 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -720,8 +720,10 @@ struct reg_ctxt {
     uint32_t ifsr32_el2;
 #endif
 
+#ifdef CONFIG_MMU
     /* Hypervisor-side state */
     uint64_t vttbr_el2;
+#endif
 };
 
 static const char *mode_string(register_t cpsr)
@@ -919,12 +921,16 @@ static void _show_registers(const struct cpu_user_regs *regs,
 #endif
     }
     printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
+#ifdef CONFIG_MMU
     printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
+#endif
     printk("\n");
 
     printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
     printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
+#ifdef CONFIG_MMU
     printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
+#endif
     printk("\n");
     printk("   ESR_EL2: %"PRIregister"\n", regs->hsr);
     printk(" HPFAR_EL2: %"PRIregister"\n", READ_SYSREG(HPFAR_EL2));
@@ -956,7 +962,9 @@ void show_registers(const struct cpu_user_regs *regs)
     if ( guest_mode(regs) && is_32bit_domain(current->domain) )
         ctxt.ifsr32_el2 = READ_SYSREG(IFSR32_EL2);
 #endif
+#ifdef CONFIG_MMU
     ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
+#endif
 
     _show_registers(regs, &ctxt, guest_mode(regs), current);
 }
@@ -979,7 +987,9 @@ void vcpu_show_registers(const struct vcpu *v)
     ctxt.ifsr32_el2 = v->arch.ifsr;
 #endif
 
+#ifdef CONFIG_MMU
     ctxt.vttbr_el2 = v->domain->arch.p2m.vttbr;
+#endif
 
     _show_registers(&v->arch.cpu_info->guest_cpu_user_regs, &ctxt, 1, v);
 }
-- 
2.25.1


