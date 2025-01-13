Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C622A0BED6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2025 18:28:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870807.1281885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXOEB-0002b1-MP; Mon, 13 Jan 2025 17:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870807.1281885; Mon, 13 Jan 2025 17:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXOEB-0002Xv-Iz; Mon, 13 Jan 2025 17:27:51 +0000
Received: by outflank-mailman (input) for mailman id 870807;
 Mon, 13 Jan 2025 17:27:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jUGj=UF=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tXOE9-0002Xp-Mp
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2025 17:27:49 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:2418::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b421c815-d1d3-11ef-a0e1-8be0dac302b0;
 Mon, 13 Jan 2025 18:27:47 +0100 (CET)
Received: from MN0PR05CA0019.namprd05.prod.outlook.com (2603:10b6:208:52c::26)
 by DS7PR12MB8347.namprd12.prod.outlook.com (2603:10b6:8:e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 17:27:39 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:208:52c:cafe::49) by MN0PR05CA0019.outlook.office365.com
 (2603:10b6:208:52c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.10 via Frontend Transport; Mon,
 13 Jan 2025 17:27:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.0 via Frontend Transport; Mon, 13 Jan 2025 17:27:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 13 Jan
 2025 11:27:39 -0600
Received: from [172.23.250.255] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 13 Jan 2025 11:27:37 -0600
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
X-Inumbo-ID: b421c815-d1d3-11ef-a0e1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqbBmEXJy1AVnqM40pq3eXJjLqEahAvsBksAS5S19eAyHlWrH/IHPmjNUzX6xryUfBw50QmRYDwxn+bo7tmVoi++4lunrNv8aMMLF1B2zxWeZjIGZC7ab4sOFvKg0GnZENZU6fjT8e7RA17awaA7VdEcOBBkYNGU37vIQRQ6sKXX61qIro96oYNmda0Z4NAJIQMsm691CcgND19GqhSfPNRH5j0KhQsU8dgRFYLvWpwoCesubgomkyAfH6o6da+E1YBBg/lqVrtE9Y5w9Hx2Uc2uAOqNyATLC2ngiZHUq/VKl/2X4R+M/8VOaNd3MvkVk3T41ggTH+2kY6XngtaP2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPF4uZoNZ80Bz21eZPEr3dPX2ojLe9SksvXBnu2Sr2E=;
 b=EBHCKZNbLE6dMNjcVla7w0MDMnKReXhHw73R/1inaPYflgGx5aj6lG4E5dbljMZ5n+X7eIaLMLGu2iMIycFahJUffogOR/9ylntSeAOWv+RB98DuYff/xuiSjgGLQ4MUcO+Ogv+4qicKHLfgRr19CZRmnE1TDSszJ1xIQIvEhFCWYWZfO5qo4+9XjK/7Vb9jEJ1SpD7Fs6TdqdQkh0dSj4YXoqvrBGlErT6oDizsM42um1MPeOQpNISOnnQo69FfR4h8JbB3u2fZ4SiGd/Dc4V/4jTwKlP1E/Cuc7KgUfNhnazpjTo98mBshhiObfJKuF++TcCP9v4fHRRyyq8BGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPF4uZoNZ80Bz21eZPEr3dPX2ojLe9SksvXBnu2Sr2E=;
 b=n6mJZuel2Ly/MVz0yxmI9OZgIw6wfohC7m62cMVRVH1JIfMCmYbDvILeqtQE4YxeUsnUlYlPpLt1YnS42BZ5IyQPxOgps2004hdCVx221sU70j/+OB6qurGut/l6S1uQQEqLIaxG4VBsTttnZqlNeFHQSs4cEVD4uCmH5OruaXQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c455dbd8-7393-46b1-b887-f3ecf5839530@amd.com>
Date: Mon, 13 Jan 2025 12:27:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/9] SMMU handling for PCIe Passthrough on ARM
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Jan
 Beulich" <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
 <9b2740a0-7347-4b91-a687-1e8e4c120288@epam.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <9b2740a0-7347-4b91-a687-1e8e4c120288@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|DS7PR12MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7ffe9a-8123-4539-9c05-08dd33f7947a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDA3SWQ2ZEx5TkJVMlVBc2JLelJNOHpPK2o4NE5pb1VMVnF6cEt1VlgvNUky?=
 =?utf-8?B?N05tTTNrU1gxaUt0TWpwbEhXTzBvOUV5QWxmQmVlQ0NoQTluMGU5dTlzOVJU?=
 =?utf-8?B?aFA4aHpKN1JEaUlqUU96TC9BZU9oMW5ZaU03SnhSeEkrNE9NRGNaOHlyZlJz?=
 =?utf-8?B?VHpZR0pvVnF4NzQ1UitsYjhWZldHNHRSMk5UM2RNeDhGdmYya2hFUE81a1lV?=
 =?utf-8?B?MEZtOVJMVHpDbUJkUER0VDJ5TzZ3UHhhK29OdVd1OFZaNmszbzB6eVE2a25Z?=
 =?utf-8?B?V2dXZm9YMUo5RGtoUnovV0tscEUyYmJHb3FIMUE2b0MvYTQ3b0U0aW5PYllh?=
 =?utf-8?B?R295VEhxcWJTazNOdUFFdnpPYU5nM1JQNC95QlI5R2xkT0xPZ1Mza3lhWUkv?=
 =?utf-8?B?bFFaQWFHN3ZuTk5WelhmUUdWWmJOTDg2YVNDQkpBQ2NEdlphd2YyR0RmbU4y?=
 =?utf-8?B?WUNTaUpRUW5ZL2l6bTNFWTdIY0xRWHBoSmdYZU1FWW9BUE1DWmtKeERCVFhu?=
 =?utf-8?B?R2d5Sm5EYVBickdFT1BBM0N6aXFET1NkZVNSZU5SZmxhdEZxbFRxRGZYZktD?=
 =?utf-8?B?cFJzZmFWUXJKbTdGVnpqRXB3NkNXUlZYRFBZR21TUjhVMktkdGUrMzcrZExM?=
 =?utf-8?B?NUlmM2o1ems1SXBkZUp3VXBTQzR3c1h2WldVNzZUVkVROEpsSkdpWEV3Nkh4?=
 =?utf-8?B?LzI2RzNDZmo5SkhJZU5ZaVpLdFhxcytYTTNlTmdOeDI3VDhpNE1kQ2pKU3B2?=
 =?utf-8?B?TkFIZnppUW1DTjZvNHBrZG81aEFUTU1FZ3A4RWttcGZPbzFDdHpaanAxK2ZU?=
 =?utf-8?B?eU1Za0NmVTRTYU5vMnBISEpudXREN2o4eVFrWkJVbnUzREQ2bVVWUUxxR09G?=
 =?utf-8?B?WDNYQ2ZreEUyNVJXMVBhM21vQjFONmhnSVhLbEFVeHdJYXVDenpQbUhOanJS?=
 =?utf-8?B?akNPT3ZGOTI5UlRsa1ZtVHQ1RW5BVDR0K3NEeE5CWkhrVHh1d0VSR2Urb0Zq?=
 =?utf-8?B?bElyeE9pS2pIdWFSOHVuYW1OVm1vcC94RTRKbktJQWVaeEFQczBuaXlLWVUv?=
 =?utf-8?B?Z25mT2o0cHoyQU9rS2RoaDBlb2NoVmRuUkxuMGt3dXdZdjVCRmlCa0F1UTF3?=
 =?utf-8?B?ZmpEUEJGYVlBY2xCQ2Z4Z1FqREdqb3dGMzVzUkkyVjVnbVQ3RG9UeDI2bGtU?=
 =?utf-8?B?b2U0d3l3bkhrcysrY0ZtUEYvOXFCVWozU2Y1WVIxMjJYOGM1eEJ0eENDRnlh?=
 =?utf-8?B?RlBHczRJaGZ2OHlVamprdWJ1cWlxdlV3eEtMVFR1cFp6elR2alZnNmxYdWdw?=
 =?utf-8?B?UEFSWHdEMTR4Qk0yRGgxU1NTUDZBQUtqL2luWGZ4akFKamMxemgxVi8xcEtu?=
 =?utf-8?B?UCttNTlhTytyK3VLY3FyY1h2QXNTZm8xdC9qQ2dMRllvTURtNXZ3bVdSNWFw?=
 =?utf-8?B?dUhOUnl2M1lPNnBvRTF0eGFrQmRJSFlyVmFKeEV0RGZlSkwyMFhhMHlaaDY2?=
 =?utf-8?B?VDlic0tkWkxqWHQxcy95dGQ2STdRN0VBRWdBOE9CcWZwYk5CYmZiaEV5UUpL?=
 =?utf-8?B?RnBvVWRtNlEzTkVyUnVxbjhyYlN5cmlrYThFNkRBOFZMTzRpUTZvTkI3T0s3?=
 =?utf-8?B?ZGN5UUM2MTZ0eEFVeWVFdmhudlJJeTlIQlpaUzdKVlJlWmdTSnJkWk1yNnVC?=
 =?utf-8?B?aHVCejBPeEpZbUtqT2lkZmlnNXBPRUJNTktOOGFac0ZkRVB5THc5M3V6RjJr?=
 =?utf-8?B?UXVhMDhGeHJvbnZKNEEwdloyNlVMd3RMRUU3dlhmU3ZiWEY2dTdSMm5sQ2lp?=
 =?utf-8?B?WE1XZEV2eUF4eVR2UFFvK3dFWExwWDJQZ2ZYdEs5SUJ3UUlYV3pveVZQWDRh?=
 =?utf-8?B?S0dYVzNVLzlXQVVTdzhJMlBUdXBZMmt3dUVsd0dkSFpIaEcvbjQ5NXN6RGJ4?=
 =?utf-8?Q?EWAqb/cqzdg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 17:27:39.6753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7ffe9a-8123-4539-9c05-08dd33f7947a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8347

On 1/13/25 06:17, Mykyta Poturai wrote:
> On 09.11.23 20:27, Stewart Hildebrand wrote:
>> This series introduces SMMU handling for PCIe passthrough on ARM. These patches
>> should be able to be upstreamed independently from the vPCI series [1]. See [2]
>> for notes about test cases.
>>
>> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.html
>> [2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.html
>>
>> v5->v6:
>> * don't revert ("xen/arm: Add cmdline boot option "pci-passthrough = <boolean>"")
>> * add ("xen/arm: enable dom0 to use PCI devices with pci-passthrough=no")
>>
>> v4->v5:
>> * drop ("xen/arm: Improve readability of check for registered devices")
>> * drop ("xen/arm: Move is_protected flag to struct device")
>> * add ("xen/arm: don't pass iommu properties to hwdom for iommu-map")
>> * add ("xen/arm: Fix mapping for PCI bridge mmio region")
>> * revert ("xen/arm: Add cmdline boot option "pci-passthrough = <boolean>"")
>> * add ("xen/arm: Map ITS doorbell register to IOMMU page tables.")
>> * fix test case #1 with PCI device in dom0
>>
>> v3->v4:
>> * split a change from ("xen/arm: Move is_protected flag to struct device") into
>>    a new separate patch
>> * see individual patches for further details
>>
>> v2->v3:
>> * drop "pci/arm: Use iommu_add_dt_pci_device()"
>> * drop "RFC: pci/arm: don't do iommu call for phantom functions"
>> * move invocation of sideband ID mapping function to add_device()
>>    platform_ops/iommu_ops hook
>>
>> v1->v2:
>> * phantom device handling
>> * shuffle around iommu_add_dt_pci_device()
>>
>> Oleksandr Andrushchenko (1):
>>    xen/arm: smmuv2: Add PCI devices support for SMMUv2
>>
>> Oleksandr Tyshchenko (2):
>>    iommu/arm: Add iommu_dt_xlate()
>>    iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API
>>
>> Rahul Singh (3):
>>    xen/arm: smmuv3: Add PCI devices support for SMMUv3
>>    xen/arm: Fix mapping for PCI bridge mmio region
>>    xen/arm: Map ITS doorbell register to IOMMU page tables
>>
>> Stewart Hildebrand (3):
>>    xen/arm: don't pass iommu properties to hwdom for iommu-map
>>    iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling
>>    xen/arm: enable dom0 to use PCI devices with pci-passthrough=no
>>
>>   xen/arch/arm/device.c                 |   2 +-
>>   xen/arch/arm/domain_build.c           |   2 +
>>   xen/arch/arm/pci/pci.c                |   3 +-
>>   xen/arch/arm/vgic-v3-its.c            |  15 ++
>>   xen/common/device_tree.c              |  91 ++++++++++++
>>   xen/drivers/passthrough/arm/smmu-v3.c | 131 +++++++++++++++--
>>   xen/drivers/passthrough/arm/smmu.c    | 199 ++++++++++++++++++++++----
>>   xen/drivers/passthrough/device_tree.c |  97 ++++++++++---
>>   xen/drivers/pci/physdev.c             |   6 -
>>   xen/include/xen/device_tree.h         |  23 +++
>>   xen/include/xen/iommu.h               |  26 +++-
>>   11 files changed, 528 insertions(+), 67 deletions(-)
>>
>>
>> base-commit: bede1c7e3b790b63f1ff3ea3ee4e476b012fdf2c
> 
> Hi Stewart,
> I noticed there was no activity for this series for some time. Are you 
> still working on this or would it be okay if I take this over and start 
> preparing the V7?
> 

Hi Mykyta,

Go ahead, please feel free to take it over. Your help is very much
appreciated. I made a couple of updates, but the feedback still needs to
be addressed. Please see my latest working branch here:
https://github.com/stewdk/xen/tree/pcie-passthrough-smmu-v7

