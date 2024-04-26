Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E418B2E7C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 03:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712356.1112996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Aop-0001Co-AQ; Fri, 26 Apr 2024 01:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712356.1112996; Fri, 26 Apr 2024 01:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Aop-0001A1-7Q; Fri, 26 Apr 2024 01:56:07 +0000
Received: by outflank-mailman (input) for mailman id 712356;
 Fri, 26 Apr 2024 01:56:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9cwh=L7=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s0Aoo-00019v-30
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 01:56:06 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23be879b-0370-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 03:56:04 +0200 (CEST)
Received: from PH7PR17CA0003.namprd17.prod.outlook.com (2603:10b6:510:324::23)
 by SA3PR12MB9177.namprd12.prod.outlook.com (2603:10b6:806:39d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 01:56:00 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:510:324:cafe::bf) by PH7PR17CA0003.outlook.office365.com
 (2603:10b6:510:324::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.27 via Frontend
 Transport; Fri, 26 Apr 2024 01:56:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 01:55:59 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 20:55:54 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 18:55:54 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 20:55:52 -0500
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
X-Inumbo-ID: 23be879b-0370-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDbeOIZyY6AHXnYCM3Xd3UGDh3UrLpU582JKAwH/YYNCr2nlffNLbrrmsj+xCf2GbAiVaOm9ru6JNoes0/aBWQT/HQ+wf3Of+kLGc4FhF65X4OhZriU1oO0YIkeRMb0nmZWWbAJMfF6kDovbUS9Gbtk9xX2c9N+UuAC0uBtq2GNjc4C6lCnle4snCu1gdhQdqTpMDKvc6TZeWU8ReWSEW/Dm+TTWA8CVb65FA2MnrGmX9ugbrLwgvyE0cxBpoGdzt8FIY6eed/F2Nh3O6XFEvrAj4bo7wOG2bMI2o86WRAscNbowYPKG9q7WuBPV+tH7JiOt9zUUfstFZxHVwah87A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncTiIy97K7mW7DNVqgFPuUNCyiiR2lkDTo36MJ2PKYc=;
 b=INaNItHW8MYjg4btkwQknc2/poPcnfDqZobt5dREBQq5lDj/HwMKwZKr6Cg59HQmNB8fS5JmWJ+6ygGqyLGOpk9RLFEf593ALRvQkmFJxGwgz/OsuZiO1zlhgYb9Zti4sN11QiCox2tOLnAU5siDzBWU9pcv+HNOB4/uUjqL7LEttaTwimEg5+dpmQ/cIItj1I3bOGk3LJ145oQ8SSHYnRUv7sfz2yxXuJoUk9qKETYQUcLWac/UJA9MpcH7qEWu3F/MYzniVo+o/DvB/MAdaij6vhGzzSYIDskOfdCeNrWiSLI5hf/fBx49pz1Z3cnpHMiAW9ej76i4fXdLn2tBiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncTiIy97K7mW7DNVqgFPuUNCyiiR2lkDTo36MJ2PKYc=;
 b=nYxL8veZZECQqRsNhOFAUCTMjPClNs1WcP62X2shKIuI/VyhOjf1AzNd5GibJ8OYRZPnzeXNCehDXlKxiQ+hPiIOQvJJV79qy/ioHRtnHXjTllkqo4nQfQUKjx8Y4o7a0vRcQhNwkAB1wkqZECF2TGVgZ+rB0CsmlKb5dwQ4ARI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v1.1] xen/commom/dt-overlay: Fix missing lock when remove the device
Date: Fri, 26 Apr 2024 09:55:50 +0800
Message-ID: <20240426015550.577986-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SA3PR12MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: f641936b-28e4-44f4-464c-08dc65940554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnBXNnAvYnM4ODIySjhMTnA0dTRUK25VM3d3V3duQy96dVpVNTZnbDVEcUwz?=
 =?utf-8?B?SW1wTnk2bWtaN1BwanpOQVhkYlRXcXZ2QnJIbUdQZytaRlJ2QmRUZGhNMW1m?=
 =?utf-8?B?MW13WGExNVBjdmYzRVFPV09XV2NocStoci8yQjUyTXJ6bngveHhOODR0SlM0?=
 =?utf-8?B?WUFYVmJGeEZqcDNxYmVmOEpKT0tENmRpZlg1VWNVRWRDYzRXcW8yQzN2eGVm?=
 =?utf-8?B?c1dnWGFQK010eXMwOW0vRWxjYzdVQ1NPMFF0Z0NsY1dCR3AyMS8vUGRyaVZ2?=
 =?utf-8?B?WkF2aHFpWjZrK3RhZkZ6OG9XdTlMY1Y2ZzlqUStvblk0RFN0NFZIelpkV3RO?=
 =?utf-8?B?eXhESXJvd1BuVjlxcE1Lb25QcWRwRGx6SXdqNnVKQmdXSVMyV0FPUkc3MkR2?=
 =?utf-8?B?cjlJeS84ZFZVQ2E2Mjl2WGFSYW9nWStFMWU2cTV2N3dEeXMrU1hYNGZDcDc2?=
 =?utf-8?B?Q01taGNra25LV0ZiT3JZSmRnSEZGc1BnSi85by9nS3NEb2piQ3BPY0NEK0N6?=
 =?utf-8?B?d095R25Hb2lGQUxUdERVLzZzem16akw0b1NiYXB0VGpPaDRUL3JYZGRTZ2s0?=
 =?utf-8?B?RXIzRFp2WmtaOEo0WGZrTDBxcjUxR3J5MU0xbUVYcVE5MEFlUE1WdUYvZ0Fs?=
 =?utf-8?B?bEtCdDJjS3pqcktSOVFsczdIQmU5OVVsSlZsc3FXVTFxWkprZEtFdENJYnNJ?=
 =?utf-8?B?VnlNaFc3WEpmV2pMR1c5TkkvYUVUZkNyRDcvRnVLYjZNZ0orc1NwazdjUnVu?=
 =?utf-8?B?RlFDNHlscGoyQjV0ZHpuRGlyZGRtNW45WjhSTkowSGdnampoZml4bUdxWGxl?=
 =?utf-8?B?aGovcTdoNzlCWUlTL2xYeXZVQ0w2MzYvR3ZCZ0hIY3ZMcDB2VEsrQXB2NUxF?=
 =?utf-8?B?UjdJY05kVU16UHNFM1U5d0sxQURCOURQR1NmSmlIN0hCdjFZR1ZtS0FXVjR6?=
 =?utf-8?B?RU8zbThFVjZHRitLbUJVN1loNGYxM1BtZVAra2I2a3UzNUJDSWR1VTZjQUFM?=
 =?utf-8?B?TW9ZQXdoQU5HMjVxdEdPSzB0RnRhN0NXS3JZQXQrVUJpcUQyeUd5NHpoeUhm?=
 =?utf-8?B?UXRLcEoyQXFzMUpjMzdyeEdsV0MvMW1xNTcyRENtMDV3WU1uUWk3VkVxMDdG?=
 =?utf-8?B?bzNYTFdYbFEyaWlHZklYWmx4U09wTStkMitTdWFxT0lWVWtoNUFqeXd4akFv?=
 =?utf-8?B?ZkdWRjBUY3FEK0lYYlptN1Mra0Y5NFlQd1VBaE9OYy9vWVhPdGY1a0Foek9z?=
 =?utf-8?B?bmZhYUdaOVY2TzE2RDFMSDFrcE5MaHBXc29UU1BqN3VseUw5c1lNUXZMclVy?=
 =?utf-8?B?d2FhWnd1MmdSTWMyRnRNdE9Dclo3ckZ4bW1OZFVQUTNFdHF0NjY4V3RDb3BF?=
 =?utf-8?B?VkZsVG1TakxuNENUM1hIb3ExdG1qOUpPU3RNcVNLdVlaU3lVQzZiZ25nQ2E4?=
 =?utf-8?B?L200L05tbnR1d1Y2TEJxbStaaWpYOEVLYnBBU0tzbkF0Sk9xRDhuZ3JNUDFo?=
 =?utf-8?B?QThCUUxqWkl4VE1QNnR3ZHhSQnUrdmMrcGJNeDZINjgyMDYzY2xnbGpDNW5q?=
 =?utf-8?B?SUpMU1ZDTzQ0akZPMGNYVGROTlAwTGVuUklmZmdUYk84WlRFb0trdjcxOUpF?=
 =?utf-8?B?NE5EUzZocVJOTFFIWWtEMzY0V2Z2T3p5NUxBNzhMdDY2Y0xjbDg2TjRjbHNj?=
 =?utf-8?B?Ym1IQzlCUWYvbEJXdmt4c21SL1VVYmRiNE1qV0NuSnZTUVZ3bnhpNm5Fb3d4?=
 =?utf-8?B?UlRXVlRGVUNXRDRQV1g3WWdCRVlmUk8vU0lXVTE5RmVRdnF5NXdnSE9sNUJm?=
 =?utf-8?B?WUR3RzdOS3IwUWxNNXgvZGpZWHo3S3lJc3o2dEVmcU1OMGMzWVZsOG05MHpP?=
 =?utf-8?Q?Ypu3lfjj0c8D5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 01:55:59.8117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f641936b-28e4-44f4-464c-08dc65940554
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9177

If CONFIG_DEBUG=y, below assertion will be triggered:
(XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at drivers/passthrough/device_tree.c:146
(XEN) ----[ Xen-4.19-unstable  arm64  debug=y  Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     00000a0000257418 iommu_remove_dt_device+0x8c/0xd4
(XEN) LR:     00000a00002573a0
(XEN) SP:     00008000fff7fb30
(XEN) CPSR:   0000000000000249 MODE:64-bit EL2h (Hypervisor, handler)
[...]

(XEN) Xen call trace:
(XEN)    [<00000a0000257418>] iommu_remove_dt_device+0x8c/0xd4 (PC)
(XEN)    [<00000a00002573a0>] iommu_remove_dt_device+0x14/0xd4 (LR)
(XEN)    [<00000a000020797c>] dt-overlay.c#remove_node_resources+0x8c/0x90
(XEN)    [<00000a0000207f14>] dt-overlay.c#remove_nodes+0x524/0x648
(XEN)    [<00000a0000208460>] dt_overlay_sysctl+0x428/0xc68
(XEN)    [<00000a00002707f8>] arch_do_sysctl+0x1c/0x2c
(XEN)    [<00000a0000230b40>] do_sysctl+0x96c/0x9ec
(XEN)    [<00000a0000271e08>] traps.c#do_trap_hypercall+0x1e8/0x288
(XEN)    [<00000a0000273490>] do_trap_guest_sync+0x448/0x63c
(XEN)    [<00000a000025c480>] entry.o#guest_sync_slowpath+0xa8/0xd8
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'rw_is_locked(&dt_host_lock)' failed at drivers/passthrough/device_tree.c:146
(XEN) ****************************************

This is because iommu_remove_dt_device() is called without taking the
dt_host_lock. Fix the issue by taking and releasing the lock properly.

Fixes: 7e5c4a8b86f1 ("xen/arm: Implement device tree node removal functionalities")
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v1.1:
- Move the unlock position before the check of rc.
---
 xen/common/dt-overlay.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 1b197381f6..ab8f43aea2 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -381,7 +381,9 @@ static int remove_node_resources(struct dt_device_node *device_node)
     {
         if ( dt_device_is_protected(device_node) )
         {
+            write_lock(&dt_host_lock);
             rc = iommu_remove_dt_device(device_node);
+            write_unlock(&dt_host_lock);
             if ( rc < 0 )
                 return rc;
         }
-- 
2.34.1


