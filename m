Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469F58BDD16
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 10:25:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717918.1120425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4G7U-00041W-9w; Tue, 07 May 2024 08:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717918.1120425; Tue, 07 May 2024 08:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4G7U-0003zH-79; Tue, 07 May 2024 08:24:16 +0000
Received: by outflank-mailman (input) for mailman id 717918;
 Tue, 07 May 2024 08:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dSAm=MK=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s4G7S-0003kv-NM
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 08:24:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ee27881-0c4b-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 10:24:13 +0200 (CEST)
Received: from BY5PR17CA0004.namprd17.prod.outlook.com (2603:10b6:a03:1b8::17)
 by DS7PR12MB6046.namprd12.prod.outlook.com (2603:10b6:8:85::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 08:24:09 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::f) by BY5PR17CA0004.outlook.office365.com
 (2603:10b6:a03:1b8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39 via Frontend
 Transport; Tue, 7 May 2024 08:24:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 08:24:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 03:24:08 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 03:24:07 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 7 May 2024 03:24:06 -0500
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
X-Inumbo-ID: 2ee27881-0c4b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBZ36jiPbkTm799GQponF1AV0KXQ0h8xTCvyihe3HEzrVbM0qHS9kxzYgPqGrrkemqbcLx+N8kaZSks/QQjAD8EETQJ6VH3vi+kyrMG348bTdH7uMT4gsxLH4UFo5rFKhnKIkB7VZIhhxWJOh0oPPn5USPIYROaNO0LSgwltm9iEqhVc4JGCAKGYgbKxZiAzUa+dgar7Ded7yO1WYq3qymwtiOFQC+ECtff2kdXbX0eiN/sE8SMWazrwwBLHZxnROlH3kp1gRe8SrVX7tmlvh+5CQ1L5uZ2bVYUxAfa4p7Blw8wXpG2zYBD+80SNnvOx75lUOo88xV23KKtfQ4N6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wD4Edd/ZUQf6Rvz7ZHLdHdBtw+JBBmdZ+XcaUxuIswo=;
 b=fJUGebMYw3QKaf8MVhrI4sWQ61lDNyNMFSgqIaht8vkVjoI4msse874aeUjKzWpTGpLUxhbvJrnrKW5Z++FwObtMIHqnBPqjFzLs/6Le6HrHw+w6i3I2QEHg2Yup37bvOdzhyk6U2II1NMfVxNTwap5GDofq3dlpC0PQJzhIoIzVjZnFQP9zK6IdD1T71tDnKUX94GbwFauauo8/k5Ydtnvl+rUrugeeLcvVlYGAq5BFhJquba63CiDKnetnbCgzb1tLMwl44FlUP3Vxz430H+qrRRkkJCpEgomLi/he8iJuBRUzdtCMMLY/etSc00IeWOl+vXhhjloCO911l4rQYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wD4Edd/ZUQf6Rvz7ZHLdHdBtw+JBBmdZ+XcaUxuIswo=;
 b=iLT1x5zNabal3zNcpLs2N+k84rObxRzW30yoV6H8RcR9T0WejI779Gp0N062nzsVk3ZZwRo8O+rxeJ6zyQCarVKb18ToYwl+S6XJyaDRnMvC9zlcwteS6ewzVa7b9HdHwLIpn4fsDiKD9qZd7tuPSnlUplOPgrMfueSQ2vBysZk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: [PATCH v2 1/2] xen/common/dt-overlay: Fix missing lock when remove the device
Date: Tue, 7 May 2024 16:23:59 +0800
Message-ID: <20240507082400.25146-2-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507082400.25146-1-xin.wang2@amd.com>
References: <20240507082400.25146-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|DS7PR12MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de37103-84ff-4aef-8b8a-08dc6e6f1162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?25w2L+oTI6tJh9+1ACt4/ZjMLfP34T3DdYnO7/+YykwAbXBof3YcS7frECyS?=
 =?us-ascii?Q?sv1aIqis/gj4VPNaNHln3ap/Gqji3Nx820JU4DRPC8JJH2G0fQrGGYIkv3/O?=
 =?us-ascii?Q?EGm4yDvpM9l5TTGmpC52q778P12WdKvzNKBA2b2wnZdiY78phSy+pLg7lHQY?=
 =?us-ascii?Q?Y9C7PxQ8xxkLlrkoZj8pYmbVABi358PlGZan3SrFyWEr+A5mRrNQk7JXNguh?=
 =?us-ascii?Q?xUtJBHCtxi2ZGWTFXjDBjF4hrOLGHH531ZUyk8ev3SRaP+HMltiosbd2+Rde?=
 =?us-ascii?Q?yclL2uIxE8IFlSDbPiVq09QbmypMxHq2gz2cqcdq7P3ljn8QcLacNvKnOmh7?=
 =?us-ascii?Q?ZHr4QpgqykkJb3jZue8CUVV4WCMonc5qV+89f/3Kjxhe/ZT3yPU3+/7zQBII?=
 =?us-ascii?Q?fRlEryX1zLvNgniSmRrnjmcbQtlk9GDVDxqNNOpHMqHS0sAdTkt3LGLMcXau?=
 =?us-ascii?Q?wi7qpMfIcqmm8aVMZN4O2Q8b+b4fE4n/Glws/WWefs+1TRC/AsMFgPEypB8j?=
 =?us-ascii?Q?N5smep32w+yPST14H14xs79i9ZwtVRHXf3+hx6Gd2lQjYxLLkKvxHZ3bgcxr?=
 =?us-ascii?Q?riVKT7CFMav9+L+u8LseX8FSs5EVko15KoN4wgX0WeUG22aZ2sq5h/NpZAjs?=
 =?us-ascii?Q?vY+J5cXCbw6LBUnrPZCo9Jo/Z7k2tTNY3Jx8fjQgEt0rDClQ2k7E1Loirv7E?=
 =?us-ascii?Q?evPflTUnvy5LHZ1H9VI3H2OiFrwVpyQzOFyrHywl/RygQHR8SX3HWljTawvV?=
 =?us-ascii?Q?Bo20HbcP16T+bf6LW39PNxq1b76ckR/qQ+i2R5zIcpp4YJuvXerYLt5pkNx2?=
 =?us-ascii?Q?O0ak3wsCG5k4Fb3tI2WExToel9Fxnr+fzL2I+v2pLcXluIuGbMz/fnCzUmwp?=
 =?us-ascii?Q?xoawOE1faebF5uHqZ+2fiIgj8PfdrpwzdDNoIcTPhcp0G+k1epx4RY8BaBrT?=
 =?us-ascii?Q?6qkM8rRIKyVwoxPg7Ow+X0BS4bOp/vmcyvWNxsH4nXGDUOe2F/+Gko3t4Qyt?=
 =?us-ascii?Q?YQ5TtIpFUBphE6Vp3KvgemNsLTGHsIWMy8RstPDpoCmttmS3l8XfVKsmzPmr?=
 =?us-ascii?Q?/zXRgboh6aoFKuW1gbKkQx0QDQ/DSvhf3J8hTUFLRmeyPHfHUlRixm5hs8RQ?=
 =?us-ascii?Q?YCnsI6dwD3DNfzLiFVoUzvGPJAzxI8yqOS6qdLh4PpjmkslOG1F14tIIw/mc?=
 =?us-ascii?Q?pu4Y8f5p8ouZJXVY8QwWXDILeBp+hXAYXb4WYt4HDDHqdEVPRMMVCFg/s/Va?=
 =?us-ascii?Q?tLAD+v+JltmyerKfBTP+DKKKrtzQEsJeWlh7zctsWNjQLMC6T+WzpwmJBBuh?=
 =?us-ascii?Q?RNRqdQiX+fnIGvfLYsnOXOMBGR/w6o41PczP9EGF7uGww3PqAQL1pScr0DvA?=
 =?us-ascii?Q?srJwgUurMDs3Sc8sjH9EKv50CrCk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 08:24:09.0145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de37103-84ff-4aef-8b8a-08dc6e6f1162
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6046

If CONFIG_DEBUG=y, below assertion will be triggered:
(XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at drivers/passthrough/device_tree.c:146
(XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     00000a0000257418 iommu_remove_dt_device+0x8c/0xd4
(XEN) LR:     00000a00002573a0
(XEN) SP:     00008000fff7fb30
(XEN) CPSR:   0000000000000249 MODE:64-bit EL2h (Hypervisor, handler)
[...]

(XEN) Xen call trace:
(XEN)    [<00000a0000257418>] iommu_remove_dt_device+0x8c/0xd4 (PC)
(XEN)    [<00000a00002573a0>] iommu_remove_dt_device+0x14/0xd4 (LR)
(XEN)    [<00000a000020797c>] dt-overlay.c#remove_node_resources+0x8c/0x90
(XEN)    [<00000a0000207f14>] dt-overlay.c#remove_nodes+0x524/0x648
(XEN)    [<00000a0000208460>] dt_overlay_sysctl+0x428/0xc68
(XEN)    [<00000a00002707f8>] arch_do_sysctl+0x1c/0x2c
(XEN)    [<00000a0000230b40>] do_sysctl+0x96c/0x9ec
(XEN)    [<00000a0000271e08>] traps.c#do_trap_hypercall+0x1e8/0x288
(XEN)    [<00000a0000273490>] do_trap_guest_sync+0x448/0x63c
(XEN)    [<00000a000025c480>] entry.o#guest_sync_slowpath+0xa8/0xd8
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at drivers/passthrough/device_tree.c:146
(XEN) ****************************************

This is because iommu_remove_dt_device() is called without taking the
dt_host_lock. dt_host_lock is meant to ensure that the DT node will not
disappear behind back. So fix the issue by taking the lock as soon as getting
hold of overlay_node.

Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- Take the lock as soon as getting hold of overlay_node.
v1.1:
- Move the unlock position before the check of rc.
---
 xen/common/dt-overlay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 1b197381f6..25d15cbcb1 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -429,6 +429,8 @@ static int remove_nodes(const struct overlay_track *tracker)
         if ( overlay_node == NULL )
             return -EINVAL;
 
+        write_lock(&dt_host_lock);
+
         rc = remove_descendant_nodes_resources(overlay_node);
         if ( rc )
             return rc;
@@ -439,8 +441,6 @@ static int remove_nodes(const struct overlay_track *tracker)
 
         dt_dprintk("Removing node: %s\n", overlay_node->full_name);
 
-        write_lock(&dt_host_lock);
-
         rc = dt_overlay_remove_node(overlay_node);
         if ( rc )
         {
-- 
2.34.1


