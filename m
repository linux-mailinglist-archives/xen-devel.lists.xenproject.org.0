Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB720AFEE1E
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 17:53:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038451.1410910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZX6u-00064y-PA; Wed, 09 Jul 2025 15:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038451.1410910; Wed, 09 Jul 2025 15:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZX6u-00062J-Lx; Wed, 09 Jul 2025 15:53:28 +0000
Received: by outflank-mailman (input) for mailman id 1038451;
 Wed, 09 Jul 2025 15:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xc5R=ZW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uZX6t-00062D-Da
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 15:53:27 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:2417::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d801c2f3-5cdc-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 17:53:24 +0200 (CEST)
Received: from BN0PR04CA0073.namprd04.prod.outlook.com (2603:10b6:408:ea::18)
 by IA1PR12MB9062.namprd12.prod.outlook.com (2603:10b6:208:3aa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Wed, 9 Jul
 2025 15:53:21 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:408:ea:cafe::e2) by BN0PR04CA0073.outlook.office365.com
 (2603:10b6:408:ea::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Wed,
 9 Jul 2025 15:53:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Wed, 9 Jul 2025 15:53:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 10:53:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 10:53:20 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 9 Jul 2025 10:53:19 -0500
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
X-Inumbo-ID: d801c2f3-5cdc-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmhOcppUe7rR1Wbc1N+boprZ7cxAK9OBkc7esYiXxWMDOnl0qWgXxfAQDRySu1iuD/OeIpf4OGEId4BM0Y0Cw0tK5qpohOA+AKCaXAP3hlHBUW+27rNvu/N474PIbeMkPr993h1CcIe8vGoq4njGWvOvkAMQLdTwvbseLVOJfOUvANZpa7PCrYaD/p+Ie4RJVDKTRmjqIrs0Vn29aLAWACzrPZ5z64KnLruZ1xwlMGLjWVJeYXL/YKiFeQvosKzv6LjL5bm/JQgK/T5JL4NyFpY19EyTEhw62BbtJiSyo79RYBT1iCSmQjy6aV22p/x8ZvgG6vC4ax0MqyyZCdLR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btJMxtv71gZkTbi84YyZ7lOo3DnOgCPEB0p0IDCgzMc=;
 b=GqDs+lXEx45C0pLKF0j+lVAVL16pnY/o5juoFLmGlX3BoI4xZvCZiuPQLkVDnzJkqkjL48ZmWvFnqA3ZkPoHy+wIdXfxE9z9PzAjmiQxqrWz5p8Zg3pbHSswCX8DSij7QNNHBBSZyXPU1rRKFV28G6FdCwY8ustFplfDiBoOTSDJZVj7lT2XnYaAzpRE6+mQRdTVkK2t78PQGQ2HNbrH3eGAYahdxAXsxfsWzKzmLtfo55lU0o/CV7xbSJgef0Ep42Fe2O8L1kOPRKleRiKADp9n1rKS9CHOorLmLEHzFWjliM2EaTY+U0viSMCNoz1kasr8Yw5Yk6ZCrPhGZmbCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btJMxtv71gZkTbi84YyZ7lOo3DnOgCPEB0p0IDCgzMc=;
 b=otMibzQ0liIGzbr1TpJUYmu3Ja15dGfGA9W3HfHjWJpM2KJ1bKWceJ60HG8jCWxY6jAkRFsmrOObM2CdfDOrZqRh2d/Fhz2MmO7kezIzm1q3Q6qim21HrMi4EhPdofdsTjRsxfPjmYYdrvDWkNFTN3iQJoiidqSi5q93NB50VK0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cc342404-825a-4666-af75-72870aa29fb4@amd.com>
Date: Wed, 9 Jul 2025 11:53:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG during vgic3 ITS mapping
To: Jason Andryuk <jason.andryuk@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: <Mykyta_Poturai@epam.com>, <rahul.singh@arm.com>
References: <28789fb6-b5fd-4e90-b7cb-431734aa0ea9@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <28789fb6-b5fd-4e90-b7cb-431734aa0ea9@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|IA1PR12MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: dab016b7-d070-412f-c52b-08ddbf00ba96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SERSVGI3dzhMZllpcTNjdFZSYnRxYnc0emIrT3dQK0VtcVFtRkE1cUU5NmtB?=
 =?utf-8?B?MndVcGQ1cXpuTFNwd1Z4MUU1R21UQ1h2T3cxNFY5bkpsYnZpM1c0aWFNVCtQ?=
 =?utf-8?B?MUlTUFdpL1E2eHE0ZHIwL1VZaGZ5MmwzaUdOdnVEVFZJRlo2MkhsYVdQckNk?=
 =?utf-8?B?enRWT250SEpPU29ZMS9TaGRKR1J4clphSVhnR243dXl0Ny83TnVCajRzbFZp?=
 =?utf-8?B?VlYrYjVWdlRGVXJ4Yitnc3NLWkt0VFRYVmFVZ0FIdkRodVNDWnBOaUw5Vkxi?=
 =?utf-8?B?TFhSTHpZUUREZlhpVExlVEJxU1R4V3FReHFMc1Q4WEN4Um1ONVp3ZmdmNG5y?=
 =?utf-8?B?ZFFVY0ZPOUc0eVM0QWRpR3lDUzZiRDJqNE1GQjc5YVZseGc0aS8vUmVJMFF4?=
 =?utf-8?B?WFpNeGdCUmxPNkZHL3VncTVmQzFrS1dRMFErdStieEFDYVlWV2ZDYVZZbGpF?=
 =?utf-8?B?ZTZ4aHBidHZnUXh1V0lVQmZqK05oMEExSXUxOGo5WDJ2RE1JRS8wTUV3Ti9Z?=
 =?utf-8?B?Zzc1NDBoRklTbGFhVlVJdnpLTHJqNEM0L1BmZkdGSVE2TE9uVm9LaVliRU8x?=
 =?utf-8?B?M3NRcTZ5WmJUOXNmME80TGgxK09hSEROcE5GSkVPb0VqYlJHdXZ5VXk3akpT?=
 =?utf-8?B?TlE1dG5rK3kxNGJYa2FFMGQ4OFE5VWhaZkFsUi83SWVmWVVteDJSU3pOVXE3?=
 =?utf-8?B?ejEvYUtobzBveXNtQi9xaW9uQUR4ZWJxY2s5bDdoRFBHdmNRSW1Sc1pJcDVR?=
 =?utf-8?B?Qm9ZcUk4YzlUMCtwbjk2Rk1UU3VTdkwzSTFpNnMrM3lLVGJuck1PQ2NKUTF1?=
 =?utf-8?B?ZTV2VU5IZmZsY2RCeXExNXlHMEhxN0NDS0d6TkpGRkRLSlU5UktSelErMWNv?=
 =?utf-8?B?MGZscVZNWG9uRDJrNXJrY0hWeXJDdnpYYmh1alRmNkhKUTBHNEJGbU5UTjVY?=
 =?utf-8?B?bkZScU9jVUtucHJiUkFXeVpSQnJpWUY0TnBWdjZhWFZtcWdEM1ZGWElPR2p5?=
 =?utf-8?B?cmZId2YvRUh2aEpVQmt5aURkNjl4ODF3Q1FRYkJlL2syeGVCcEdjaElTZ3Qr?=
 =?utf-8?B?YnU5Z3ZvYmdxRUZNUGRiajlmZFJXZFhMTGlFM0tVWVJqbHdyS1lzaDJwb2NK?=
 =?utf-8?B?bHBNOFh0bzdHNVVNR1VDcGxENGhDSWRSNmFiN3hZaVhVQkxQM2Y2NGJ0R1Ba?=
 =?utf-8?B?RXM0ZURqVHlmQkFVUmhNTEN1bGI3akNvN2o5Q1hiVC9aMTFUMWJ1Mnl2Vkph?=
 =?utf-8?B?Slh4WGxnaXVuSHlEcTMzT2pvdThwWjNqeFJVM1Y0UG8yN291aDBvejNxZ0dq?=
 =?utf-8?B?Z0JEbG5qaEdhczJOYmRZSXo2OEVnSGV0aEphSzM5RWxkOHJnSUxDcU5WYm5M?=
 =?utf-8?B?aytKdXhHMndJRE5Ub3VranpRSW5QbkFDSEMrRm9DclhNbW1PQ3lkcnJFUWJ4?=
 =?utf-8?B?b202ZTU4T3NqaUN4eXFXYnh5Vm0zSGJpV3hLcGpObEhVZ1A4YVUrUUVuMGhk?=
 =?utf-8?B?TG9ZNThIanQyMzZIcE9pejlXWFVGaXhFcnpYQkVSL3FGdk9VZ0VrMldjbXU4?=
 =?utf-8?B?bDQ4VlZ0OXd6LzZlaWdoaEplbjdvYkFLZ1RHNUNFUTZWQWsvcXAwbjdjbDRT?=
 =?utf-8?B?M0hCL3pWQ2hnbWJGUEdzemtOWW9OTjQ0K2wyN0lBbmFPTWh3UjNycWxMOGJU?=
 =?utf-8?B?SDQxd3Q3UEs4dHNoaEUzK0RnUzRUVk5RYVJXK0crcEZ4YmQrNG5KSVZqbnVx?=
 =?utf-8?B?YzZEUzZ6aTVUOStWdHFhWDVFMWt4SXBCaEdFOC9DaG9uV21WQnhPVzk3ekFk?=
 =?utf-8?B?RUY2Z2J6MVVpQ0VFY0tUOHArOU4vWVZrVlhkTjliV1N5ekl1a3BjdkR1elZ4?=
 =?utf-8?B?UGw4b3dnYTVQWjQ3TGRvVHF6YXRRMWE1SE5tUWphb3pVWlltZ29uTlNmcDZ0?=
 =?utf-8?B?WERjaXRWQXN4SWFiQzk0NnRoWlZSM1BrY0hoTVVkNGFadDFiVFRrckdPMmlw?=
 =?utf-8?B?MVR6cHM4eFB2WjF4ZjAvd2ZFSlhEUDJmM0tEUG5tNTRhRXc4MmtXMGl6Nno2?=
 =?utf-8?B?RnBocVNIaVdKdTcwUXJ5MUVjemJMa2hBTXF6QT09?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 15:53:20.7393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab016b7-d070-412f-c52b-08ddbf00ba96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9062

On 7/9/25 11:16, Jason Andryuk wrote:
> Hi,
> 
> I'm running Xen in QEMU with vgic3 and started hitting:
> 
> (XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49
> 
>     BUG_ON(!is_domain_direct_mapped(d));
> 
> I'm using dmo0less to create a split hardware and control domains.  That means hwdom is not direct mapped, but is_iommu_enabled() is true.  It looks to be caused by the new call to iommu_map() in:
> 
> commit f9f6b22abf1d8d88c97fbc9925b274c0bb4ac881
> Author: Rahul Singh <rahul.singh@arm.com>
> Date:   Wed Jul 2 07:10:03 2025 +0000
> 
>     xen/arm: Map ITS doorbell register to IOMMU page tables
> 
> Thoughts on how to address this?

I think the BUG_ON in question wants changing to:

-    BUG_ON(!is_domain_direct_mapped(d));
+    BUG_ON(!domain_use_host_layout(d));

... along with an appropriate update of the comment prior to this line.

I suspect a cache colored hwdom/dom0 would also stumble here.

In the future when we will support vITS for domUs, we may want to remove
the BUG_ON entirely [1], but for now the ITS doorbell mapping is still
expected to be DFN == MFN.

[1] https://github.com/Xilinx/xen/commit/d814f9d13a51625bdaca9299d36272ee393e7ddc

> Thanks,
> Jason
> 
> (XEN) Loading d1 initrd from 0000000045800000 to 0x0000000048200000-0x000000004bdcd615
> (XEN) Loading d1 DTB to 0x0000000048000000-0x00000000480005c4
> (XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49
> (XEN) ----[ Xen-4.21-unstable  arm64  debug=y  Tainted: I      ]----
> (XEN) CPU:    0
> (XEN) PC:     00000a000024c758 arm_iommu_map_page+0x80/0x90
> (XEN) LR:     00000a000024c750
> (XEN) SP:     00000a000032fb70
> (XEN) CPSR:   0000000080000249 MODE:64-bit EL2h (Hypervisor, handler)
> ...
> (XEN) Xen call trace:
> (XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
> (XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
> (XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
> (XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
> (XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
> (XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
> (XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
> (XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
> (XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
> (XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
> (XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...


