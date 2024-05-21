Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B348CA76E
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 06:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726499.1130805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEU-0007E9-EG; Tue, 21 May 2024 04:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726499.1130805; Tue, 21 May 2024 04:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEU-0007C3-Av; Tue, 21 May 2024 04:36:14 +0000
Received: by outflank-mailman (input) for mailman id 726499;
 Tue, 21 May 2024 04:36:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H+om=MY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9HES-0006eS-MX
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 04:36:12 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a52348c6-172b-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 06:36:10 +0200 (CEST)
Received: from SA9PR13CA0045.namprd13.prod.outlook.com (2603:10b6:806:22::20)
 by CH3PR12MB7499.namprd12.prod.outlook.com (2603:10b6:610:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 04:36:05 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::22) by SA9PR13CA0045.outlook.office365.com
 (2603:10b6:806:22::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17 via Frontend
 Transport; Tue, 21 May 2024 04:36:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 04:36:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 23:36:02 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 23:36:01 -0500
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
X-Inumbo-ID: a52348c6-172b-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbHT8CJrUUQY5hs5537SOck+tLTRvrprlKSawMwfvSCMiwpbiKfn4KsvUGkEpLx2W1oIbUuZ5AI2j8ISgrJB/an5qViiNdtVfH6smVhqZg3ai4jEGiXcIQU+0yuwLX7B4TmT/RF7gh0CiT1Z9bNuYwJvaovfKt8wOIbugPkfP5KHAzeyuPhFvo6iXZ5bYGUXMi2JEzSfIjMcANzygWeWtobzrqzt7aYjVkN0EV6Ucv3nX2Xat/vot1DWcmjdfEUw1PBSR4xvhVvPyuYrnxS3kQrOAdUpcYTULPxc82Lp2bS+C6o9iEcbnCL4RCts4ymVn6XYMJr67meK1SO7sE2ZTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBS9p4N9tMcJAJGNweW/eDIIQQk4+w4cUu2XcNfNYwg=;
 b=TQjlVF8XqVN7gQWYuaMlIM1P77lTW2lHcGKf0XbJPvH4jXv/fj4gatbk+VED5CKR0+2y5icmSeMx1MOLBv5JG8802TAizCgomcwrIjw1EYJtlHhqFcFDHoYrshWGbNFFGfZUbeaTlfp7MY/KO7XCycRbivGYUduvRvIHX0Gsta4HeV2m3IvaoTpSOALCL6y7OnYkgMnCzgEikMxv4qxks2ji8X5sbeDLNtveC6h64h37rcqzxFQfBBW4UdhtUiEnYpQSGBzJcmM8pTAbB8VEemTNPNM0xhIH/DMeArrASVXvsxLAPG8sjHb46B0GOx3SrokwlqpD12KONnsPgQKdRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBS9p4N9tMcJAJGNweW/eDIIQQk4+w4cUu2XcNfNYwg=;
 b=m6XNOcaiydaSRylGgFvLSPAujP/G2QNPXWxNeL3XajMYzEgztIjAJH8Kyhbs+xQQdl+K2KRwNycmM2n4Afsa/hBk9nbepNG2ATUcgiqW1oJNUt3egpyRd8MY3/fLp71qEyZxkQJejQA9yrwf6YogMrVgP13ENgDFDhqCi4UIJbQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Henry Wang <xin.wang2@amd.com>, Julien Grall
	<jgrall@amazon.com>
Subject: [PATCH v3 1/8] xen/common/dt-overlay: Fix lock issue when add/remove the device
Date: Tue, 21 May 2024 12:35:50 +0800
Message-ID: <20240521043557.1580753-2-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521043557.1580753-1-xin.wang2@amd.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|CH3PR12MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 227e150c-a10e-4550-9bf4-08dc794f86b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sQqQ87UkyLKxgaGUSQWaQotMsMysHeA3ERrkt1ttq82ARRub86jbMIa+TVab?=
 =?us-ascii?Q?KFatSTw5BrVfMfr9n0Ltym/gB0tTd+Gs7INIkUKy5bQ8pglJlQoxqK/h+e8v?=
 =?us-ascii?Q?PrA+ilqa2/pVqjlbaecjvHKZDxf04RqvYJLvEEwYegxob7UrJaWHNlNvu7b1?=
 =?us-ascii?Q?cZ+bIhGPLYWjFNJmwDscAqZ44lHVehD0Qg5u6faqtPa6DoFG229+xpjuHQ7I?=
 =?us-ascii?Q?DRUp3oKaJiy9/hNEHQ2Yar5ee88HEMndUAC/gNMAVtglv9dYRU9ZDrGIO+D3?=
 =?us-ascii?Q?KYEjlk1UDoczh03+P+YGs2agmLqd7rb2JWRCk90/zxWZ7ROBLk0vk7vvdu95?=
 =?us-ascii?Q?UQhpyUUP2KICR0FSpZfRPDCCDs/9xEvXBHwmwmj+v6fzVeIFy+LZ3aEZIJ8g?=
 =?us-ascii?Q?xBKWkFryIKECPWiGN0+LREGja6FCEojX5EX0VZ8klQWCfBIUYv1F9HB6WV7B?=
 =?us-ascii?Q?/SaS7bnjZBGrnt0ETeAQ0ScNYO53TXD/lFQtrW7EXCeV0kgVzwAmCrSTtp2y?=
 =?us-ascii?Q?tLDIV9TcxAMZCigcY7BufVol5IEhw+VDwQIYZcHtDQPCPsE7/gOQ5Wo0pm9b?=
 =?us-ascii?Q?JHFZ/wjKCAS+SiQtwIyQhWfXQ58ji0Xx2EEc7bKxQZfrVyMKh0ECcUDw1XP3?=
 =?us-ascii?Q?3ijGP+UBJ2TqpIqbSPM5Yyvn+VL356p1HRx60EL4DRlNbDg6ZA7H9g6n31yW?=
 =?us-ascii?Q?QI3mxEnH+R5zJJiLXSjXLN4kXbSURda/dCeFyosOsW7yQmohT7Fo+67IeK5/?=
 =?us-ascii?Q?oH2GMdpSpEMFqJlv1K3k5CYvKNvoW6Okse6w5fG17Z+I09MXkgmxKVayftjK?=
 =?us-ascii?Q?V96xrYbiaUjmYUWLcoA+uiQG0s1CbBr8PHcFYeH7FxtCxRD8/Wd2nJssHtgS?=
 =?us-ascii?Q?s9oUpHJarssSVQztRxSBLhtEF1QNT+KgDwgei6XUxCSIRCX5rGAt6TFdTq31?=
 =?us-ascii?Q?H+ihqMGN8e01g/bLIPNRtg7OSWcsn8ec5FVesqJPfqcJPobQleSBBoUOXIzu?=
 =?us-ascii?Q?yhj3hAq+yU9hdeaEp5MUrTPUNJpw8yHbSZefevJ9RLNS6ToAXL1aqCHrjU+5?=
 =?us-ascii?Q?tFIyzHBE7kHK5O1PCDnOvvGKyGJsCDgkFed+9BpcgVkILPHpTiK0Qq7EoAaA?=
 =?us-ascii?Q?+fL3+M9VCS1wnotFL3oSSRSd9fj0nAxgQE1/1KXUkWW7FbH9ZGSKL6CS+4Ee?=
 =?us-ascii?Q?MzilOnwp8CLZkTujlMrIrHa0umRlK3wsfu91Qn2FYfT7B9yl/J6lrcmSukZr?=
 =?us-ascii?Q?KnTaZh7ddQiVtmMsJakV+wwXDDTi0IoDP+xdFAhTA8zL/wZ5n4pI0UQkCePz?=
 =?us-ascii?Q?JON7qmwpkjOnDXj8lROUSrrMm3tlZEnX2xx1nawnK9ZPR9K5IKYe6SPcvOWJ?=
 =?us-ascii?Q?ejlapFo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 04:36:04.8790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 227e150c-a10e-4550-9bf4-08dc794f86b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7499

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
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v3:
- Add Julien's Reviewed-by tag.
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


