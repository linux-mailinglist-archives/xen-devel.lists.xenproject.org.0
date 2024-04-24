Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2848AFFC1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:35:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711015.1110635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTPZ-0002Sv-GE; Wed, 24 Apr 2024 03:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711015.1110635; Wed, 24 Apr 2024 03:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTPZ-0002ME-Cx; Wed, 24 Apr 2024 03:35:09 +0000
Received: by outflank-mailman (input) for mailman id 711015;
 Wed, 24 Apr 2024 03:35:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTPY-0002In-KE
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:35:08 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a506c8fc-01eb-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 05:35:07 +0200 (CEST)
Received: from MN2PR08CA0027.namprd08.prod.outlook.com (2603:10b6:208:239::32)
 by PH7PR12MB6883.namprd12.prod.outlook.com (2603:10b6:510:1b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 03:35:02 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::23) by MN2PR08CA0027.outlook.office365.com
 (2603:10b6:208:239::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Wed, 24 Apr 2024 03:35:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:35:02 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:35:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 20:35:01 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:35:00 -0500
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
X-Inumbo-ID: a506c8fc-01eb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKcmzpVfrV0OOl/Xn5jD86M501YCBgGcvdy/QkucbZP0WwkqcA8JZeft7D+m7hF85uDPpS9RG0ckJX+I+3MqzjfdIPljPCwKBbcMBFEUh3bMySFY+Q3F9Z3K6lmxk3KnLJSALP8ZmRL1y8qMHW5uZ09HIXviT3j+fp6mi+AH1gGQmMJdLS4vIAXc+GUZijgGhvkFfxGTRnF0jIG3Nblk911f4J/lqDTyiaURFEyEc5z2Td/kpkV2R1xgu68Nwc56Z6UA/Uj1Xky6of7uXGGY2s7XoiriADo+8J9rIGFePf9excNzq93AbqmBG7y4mzvOUlA19cxz4bqxdOzHPE+Klw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKgf7DQIPcUhTaQ2T+Lk3ZgLl1QF9wZZ5t5/Zbs5z1s=;
 b=ZL4lOzx9nTXHP6vtm48w89FS4esaZDN0RNUSVmxOzRSV9yFk/ioJvhQFz97l8SMwb7yAQ2YNbu8qM/ZC7Fi8jUNRmdVCy+ZIzxpzgbQ6yRFlbXE08sMQRoHreCE8SKDn3IIrLiV9aeDWYxbMxS0TbHiUdxWN9LHeL0x3NggwY+waJ6j5en87sjJ35eDgCaDGQEABFm9gz3M3jlvk5/1V7SHEFcc/OHv3sVZIGGrg8yQMBRR64cj+jp4Av4RmZB52dVTX7WN0BNIeky2kbk1246qlQ+hv3O3E6A9yIR7EGx2q4Q6hNInAWSZAWmo7L68h045shtF365IutRt9eP/pQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKgf7DQIPcUhTaQ2T+Lk3ZgLl1QF9wZZ5t5/Zbs5z1s=;
 b=JzIOuo2GWZrZvbIr8LC3wec425bA6pdUsqYx3m6GIBKRrY25729GkWhMDge39hTGP+OsH1ONRFlvFw7kxFANhAfHwTU+zfT4n5fT83MMQ8nzRm2wK5uh5/+gPIRoTR8T+xSOSGf25B8OUfnC7cX51A/2YrkWFqTkfv7GqOVgxs4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: [PATCH 01/15] xen/commom/dt-overlay: Fix missing lock when remove the device
Date: Wed, 24 Apr 2024 11:34:35 +0800
Message-ID: <20240424033449.168398-2-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|PH7PR12MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e1d811-7580-4ca9-142e-08dc640f8672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVBLSERGK0R6VnRMbXlFWEZTRVNTbkJXUjJST0lpMGE2YjJQelNHYXl3bWRQ?=
 =?utf-8?B?K01zOG1NWXpTM2sxK3Y2bzNNZG9kSkNIbm5IdzI5ZGFsZmhzU0c2NlI0ay9B?=
 =?utf-8?B?N05uZzZJREt4anAwZlplM1BTVmQ5cVNzRFZ1c1BZZGZ2c3I0WFVpeTgveXda?=
 =?utf-8?B?bDBicWEyaUJnai9STVN0SWVHRkdIVEZFcTVtNzFBR3VyTmdOVWJsN3hnZTVY?=
 =?utf-8?B?SXphdVNFdHNpdWZKZ09OVVFIcWRaV0pXTE8xQlhoaUdqODRXVERTWTNJVjd3?=
 =?utf-8?B?bnRQWE1ITDZMZWRRYXU4bFFVSDQzeE9HVzRIeGI4VDZJMDVlRUZFQ3h1OXNR?=
 =?utf-8?B?VkQ0ZWRtR2NXaldXWUJ3RjU1MGppODk0bW9iV21Uak9NdFd6MktobXJjTnd3?=
 =?utf-8?B?TjlBOGNEVGg3dnYzZTRzWTZ6YUNzWm9JNjZKdm9TWWxPamhqcHhLR2VDUmFD?=
 =?utf-8?B?Q2IzT3h1bGU0bDVteE1hNTBxRWx0TkpIejU0RytwalBkZDU1SkdPcHVQU2NM?=
 =?utf-8?B?WmNWNCtyKzNhN3YwNVptcnZVVUg2SDRoMENBMSsvQ3BPVzh5YnM3c2Q1bkhR?=
 =?utf-8?B?R01QeVFZTUJBVFpucU92alZiVFVpbklxZ0dndGQ3SzRjcmJRMEo0c2NUWXpT?=
 =?utf-8?B?ek9DeUpMZ0NvNHlMNFJFallidXk2dG1ySEIwenVkTzV2Vmg3aWhkUmF1N2N4?=
 =?utf-8?B?REY0TkZHU1hmaEsvMktFQ1dmaFhXbytBV214bmVtZ2pyYWlBOWRQRzhkQlVD?=
 =?utf-8?B?NmFHSm1TNktjRHZiSkErcVNCSGZ6eXVDZE9XY1U3TVpCOFZtN3MzeDk2aGFF?=
 =?utf-8?B?bkpWeS9ZM04rOFdSQXhkQWltWG10eEJNV3BEdTUyTjM1eTF1YXhQdTlFbDR1?=
 =?utf-8?B?eVBvcDV5V2wzMlo1YTZuVWo1NEx2NWI3QnFUc2NPUzNxZlhBZ2hVZkU3NG1m?=
 =?utf-8?B?emVFZ3hXWmRlcWVLV29XdUF6OGRIbnB1TWxlbExmNmIwUmE5OHVYOVQ4bEJn?=
 =?utf-8?B?OXE5aWdwYXRMSkZ1bmhoeTdtdUZ3cDJqWVJBUGdRL2JZa2E0em1LU3NYTTBP?=
 =?utf-8?B?TS9IbkpXWjdJSHJZZFQ2elJNK1JBbExvSkdBb2xnWnIwQW5TUjQyZlNjWG9B?=
 =?utf-8?B?RHk1eElrY0Q3a29OWTNwZW9DVTYzbXFaT2tKYk11NUhxUnQ1M3piaThhZ1Fx?=
 =?utf-8?B?S0pXZnJlNVRQaGFqZjl4cWN3enpmL3R3dGNMTngzQlhEMlNtSGtiblJReFF1?=
 =?utf-8?B?eTJ1OVpNbDBFR3JXWE5idnVGaWJ5aW5qeVdpcEJVeUdRaHRWMFkyR3R2eDVE?=
 =?utf-8?B?cUE5T3ZqYWFVdEYvakJJK1NJbm56c09VS2lRK1cyS1ZKLzhueFcwNUgxZVVt?=
 =?utf-8?B?UWZNYlNxVW9jMXQvQURRQjRyQTBNeU5JT3FDWXFISmI5ZjNQaUdFbzlUanhS?=
 =?utf-8?B?WVBkWnFvRDJSemJqZHpSTFpDZGZyT21ZamR0OW1Eblk4cU9mTW13OUdQTmdO?=
 =?utf-8?B?WU5GYTJ2QVFnWEw0bHdWUmRjVEZ4RmdHSDljS3BSNUlITTdzVnl5WmZpMjBU?=
 =?utf-8?B?My95SFlUdWdNdmkyb1RReVpuNlBFbE5nSVY5OC9wZ2RvOThpdFFRMGo4emNL?=
 =?utf-8?B?SVAxMHZlTDhoTzN6TjNCTEZGUWNRVEcxVTVwN3VMRnJLR2lyY0o4TmZTU1Jn?=
 =?utf-8?B?SnZmMWtXM0x1WVp5a1ppOERLZzZabkp5WGVtNG1BS1h6YWoyMFNVRXRzSXpD?=
 =?utf-8?B?TTFCZEhwdG0zWHpNdTRFNXlnUEZUS1pTUTcvWTgxRkg0Q2RMQ1A3bHhhVmt3?=
 =?utf-8?B?bjE3UmtzaDRLaE1JODVjUi9oelpLUjZQdVo5UE4wejVzVXNMTWhhS05NSjJJ?=
 =?utf-8?Q?KwuzDDC65p66t?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:35:02.2209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e1d811-7580-4ca9-142e-08dc640f8672
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6883

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
 xen/common/dt-overlay.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
index 1b197381f6..39e4ba59dd 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/dt-overlay.c
@@ -381,9 +381,14 @@ static int remove_node_resources(struct dt_device_node *device_node)
     {
         if ( dt_device_is_protected(device_node) )
         {
+            write_lock(&dt_host_lock);
             rc = iommu_remove_dt_device(device_node);
             if ( rc < 0 )
+            {
+                write_unlock(&dt_host_lock);
                 return rc;
+            }
+            write_unlock(&dt_host_lock);
         }
     }
 
-- 
2.34.1


