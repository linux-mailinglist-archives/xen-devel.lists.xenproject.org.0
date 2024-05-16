Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 823A78C745C
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:04:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722991.1127466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxi-0005Z9-Jo; Thu, 16 May 2024 10:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722991.1127466; Thu, 16 May 2024 10:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxi-0005VE-FH; Thu, 16 May 2024 10:03:46 +0000
Received: by outflank-mailman (input) for mailman id 722991;
 Thu, 16 May 2024 10:03:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MS9v=MT=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7Xxh-0005ER-3k
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:03:45 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9305f67a-136b-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 12:03:42 +0200 (CEST)
Received: from BYAPR02CA0030.namprd02.prod.outlook.com (2603:10b6:a02:ee::43)
 by SA1PR12MB8161.namprd12.prod.outlook.com (2603:10b6:806:330::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 10:03:39 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::94) by BYAPR02CA0030.outlook.office365.com
 (2603:10b6:a02:ee::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Thu, 16 May 2024 10:03:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 10:03:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:35 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 05:03:34 -0500
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
X-Inumbo-ID: 9305f67a-136b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Skzxkw/gc/elR/dfcS6eEaw8+V/2BeVfRfuS34yE2wgg11K3Hag3bZQ3xPAA53zgBBRDY4YD6xI/RKOgUbsEsXVwLZ/F7/lXlhTYW092/5woUx9b2DKD39pTdnk6LQGpaPrGPbWgrqY2Gar/yckqpW44OBFTSfiOrwsG9GFPYPguDXFAx6KbbtSonRJ6ld7ZswgwT3Q4ihJ4yxcXKxvoDFaH1RInF2OzAkTsSkqiH6yYWxHJaWfik7Esy6ezB4ugHRBEBj4p2RxGbBj/mu9mivT5wLKPgkACL+yaUUMI7BXRw3nCNyE27L8NKEE5oUNx8fBKp/YKYgWshzyRDYgu5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSVZTcTs9mm7sB/dXnHKN/ALb10cEIdfRSBxLdDzF1s=;
 b=O2EvHeSWLPSXIXPaLyI7eBpUdXuVw2Jd/qQZXZX2GIhEYqQMu8jBHyiY+lj+6sgSTtsxxHPDvGdE6nfcYAEshhuIf8R7rsnvQ/TR4PBtJ/MNnz/mPUaKgLRy0DrlW8dZS+54nnEPVUG1LZjAksNFXwrIBp/SxghPJ34uf5iwNH2vHnWHDcJsvtwKn+Svh8BJbLXOnD2sI+WG1+rvcaaPW2vZAvDN9KaTIL+bQd2EcAxIcamLZSVIj0QFjqLroKmL5x4nj2kuxCq6OujW88bkqa7nbpeXdSwBncTcX13vg+GY0dx1cmFRQrscoUMJ2A7bzzY2LptFuGCDUmb7LnqmRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSVZTcTs9mm7sB/dXnHKN/ALb10cEIdfRSBxLdDzF1s=;
 b=138iIMtSB3GcV36u1I678e6tFnqagssZLIsNdtqr73aBpUCJUalMvKui+0tguH0+lfwBwz/UTP+WoM4/UZvBCk8OhD7Fn4QUNf9wrmwwe62xUJOjXHlS1KpPc63rfPvYsCtuPcHbjOCNsfo+VHLdcd+knGzNtuE9yXGkHr+rkuA=
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
Subject: [PATCH v2 1/8] xen/common/dt-overlay: Fix lock issue when add/remove the device
Date: Thu, 16 May 2024 18:03:23 +0800
Message-ID: <20240516100330.1433265-2-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516100330.1433265-1-xin.wang2@amd.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SA1PR12MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: ade187ed-93ef-4405-8e54-08dc758f73df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2oMr5RY6wH5/euGsSa4U+iE4PAOvkIApsUxYg9XGiyXP4jQaTqpI37HJC0p4?=
 =?us-ascii?Q?ya9dSamv2eHhJMzp/w5V39/4GlFxZxY/7JnscBIOjPCb/WuRKVmrnQO0FVth?=
 =?us-ascii?Q?/4dDo6XXhKPJC/NnZHE5uUwjAT6gWEznNb1nXcdw7K1OGQ8jryuQWBxlZs9j?=
 =?us-ascii?Q?MTs/s6hqwJDJCC1tfwtCcnkI5VKTSomjBGaFC5RWFtyiPLqxWcxXKVlVzKEN?=
 =?us-ascii?Q?Juy5bTyu6+cZFdgs2b50pDkyTr/PdEa9xQD+5EJycjhDkGiXKua1oxEWsEZk?=
 =?us-ascii?Q?z5K0H4QI11wHcUwR+a0G71T7aIckJ+jmcPUh2O2HI/YlMf3B+WQmsaLSNHhP?=
 =?us-ascii?Q?BvruTb3RbwtzWpWbZSO9oiNj6L8G71RnAEUS894cP5jTgRWTKtJWdQ2PH4de?=
 =?us-ascii?Q?hGZK+Qn5zqUYanBsyffucJtvOznI0VYFig3DWX9OiJrVn71gBewQcIl8gtcI?=
 =?us-ascii?Q?CmoCBYMEN9KRqKmi/oRPTfAPXPpTo0yvVFjA1jpql3dwDqpJVA7dMlWozuxi?=
 =?us-ascii?Q?J0MThH56zaffFLAQAgibqyi8FVNEBMWotK1LqYGDDIwjZhlx+LRsAu5bg2vy?=
 =?us-ascii?Q?EYcUcYFSjtw/lrmvc64y0rDL5PNY8bs+Ct8TaOQKXENRSj9w7deAtpfiP9MD?=
 =?us-ascii?Q?gS8gdNpOtBeliqtUGm2CWcS73CINvujyhIEJV0k+XY1kyR7xe19oIN0Osyqj?=
 =?us-ascii?Q?cCqDphgmyUk6Y6/MjHxrkIiDmx2cJi9jmnuMVSdGMdNOH2Q0miuCqqHsX0YH?=
 =?us-ascii?Q?GBZvpjhoKoOMbZ00hM80jpZApKQAHvBFGhzfmIUW23uRydtLMGTg7LWZBLPw?=
 =?us-ascii?Q?+LVpLX5RKToNBYkLp9w3P5jV/5jNHCRKcoBYV6fEUVRsTBtZHODcjEHdPn0r?=
 =?us-ascii?Q?nJ3rrroc7QOi9hEfka4iUn+K8FCxmduKaMdBnNtaG2FhQgIFrXMkXwQWgcA7?=
 =?us-ascii?Q?hXP4KUHbZr27+YUW1/EXmP40HIR+P2H7us53pAspGjSg03yChtqS2o0iVryo?=
 =?us-ascii?Q?QVBYAU7DoIbk0ik+L7AQgC8a8SfNDcvCZIKBgYUprEije0zNk6Tiy9UjHb/p?=
 =?us-ascii?Q?CR9VfEe7QN4fGDfSLINauD6P1sU9W+Mb6CENhuzKbSJKA7B9W9wLrZw9FhSf?=
 =?us-ascii?Q?sS7j07hj2mVpl9kNwcdTOAvcGTMrYQ71MNtai3WxecOVEfk+eWb1wQ3mA6av?=
 =?us-ascii?Q?FDTtgpLQChhBnsdqom7ttVMfDFPCz+Jngb8fq9Idni+8h8QkHyRvfewljS5E?=
 =?us-ascii?Q?dIw5lYpyBuZffaEaADRXPpqg8jeZLUKNpE2kCQ14SY68Ba5g9m8ulNEFUob9?=
 =?us-ascii?Q?Hai4R9g8pK/+BSt22yUWjY+/uzrBUbKqlSgy4kxJGPTyaJYhPr6boLUzm/Ch?=
 =?us-ascii?Q?Om8ACnM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:03:36.3165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ade187ed-93ef-4405-8e54-08dc758f73df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8161

If CONFIG_DEBUG=y, below assertion will be triggered:
(XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at drivers/passthrough/device_tree.c:146
(XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Not tainted ]----
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
disappear behind back. So fix the issue by taking the lock as soon as
getting hold of overlay_node.

Similar issue will be observed in adding the dtbo:
(XEN) Assertion 'system_state < SYS_STATE_active || rw_is_locked(&dt_host_lock)'
failed at xen-source/xen/drivers/passthrough/device_tree.c:192
(XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Not tainted ]----
[...]
(XEN) Xen call trace:
(XEN)    [<00000a00002594f4>] iommu_add_dt_device+0x7c/0x17c (PC)
(XEN)    [<00000a0000259494>] iommu_add_dt_device+0x1c/0x17c (LR)
(XEN)    [<00000a0000267db4>] handle_device+0x68/0x1e8
(XEN)    [<00000a0000208ba8>] dt_overlay_sysctl+0x9d4/0xb84
(XEN)    [<00000a000027342c>] arch_do_sysctl+0x24/0x38
(XEN)    [<00000a0000231ac8>] do_sysctl+0x9ac/0xa34
(XEN)    [<00000a0000274b70>] traps.c#do_trap_hypercall+0x230/0x2dc
(XEN)    [<00000a0000276330>] do_trap_guest_sync+0x478/0x688
(XEN)    [<00000a000025e480>] entry.o#guest_sync_slowpath+0xa8/0xd8

This is because the lock is released too early. So fix the issue by
releasing the lock after handle_device().

Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- Take the lock as soon as getting hold of overlay_node. Also
  release the lock after handle_device() when adding dtbo.
v1.1:
- Move the unlock position before the check of rc.
---
 xen/common/dt-overlay.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 1b197381f6..9cece79067 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -429,18 +429,24 @@ static int remove_nodes(const struct overlay_track *tracker)
         if ( overlay_node == NULL )
             return -EINVAL;
 
+        write_lock(&dt_host_lock);
+
         rc = remove_descendant_nodes_resources(overlay_node);
         if ( rc )
+        {
+            write_unlock(&dt_host_lock);
             return rc;
+        }
 
         rc = remove_node_resources(overlay_node);
         if ( rc )
+        {
+            write_unlock(&dt_host_lock);
             return rc;
+        }
 
         dt_dprintk("Removing node: %s\n", overlay_node->full_name);
 
-        write_lock(&dt_host_lock);
-
         rc = dt_overlay_remove_node(overlay_node);
         if ( rc )
         {
@@ -604,8 +610,6 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
             return rc;
         }
 
-        write_unlock(&dt_host_lock);
-
         prev_node->allnext = next_node;
 
         overlay_node = dt_find_node_by_path(overlay_node->full_name);
@@ -619,6 +623,7 @@ static long add_nodes(struct overlay_track *tr, char **nodes_full_path)
         rc = handle_device(hardware_domain, overlay_node, p2m_mmio_direct_c,
                            tr->iomem_ranges,
                            tr->irq_ranges);
+        write_unlock(&dt_host_lock);
         if ( rc )
         {
             printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
-- 
2.34.1


