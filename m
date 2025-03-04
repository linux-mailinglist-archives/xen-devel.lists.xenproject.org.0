Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13147A4E2B2
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 16:16:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901224.1309211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpTzc-0003wz-1r; Tue, 04 Mar 2025 15:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901224.1309211; Tue, 04 Mar 2025 15:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpTzb-0003ug-VJ; Tue, 04 Mar 2025 15:15:35 +0000
Received: by outflank-mailman (input) for mailman id 901224;
 Tue, 04 Mar 2025 15:15:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z8BO=VX=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tpTza-0003uV-1N
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 15:15:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2415::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 828f88d7-f90b-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 16:15:31 +0100 (CET)
Received: from SJ0PR03CA0291.namprd03.prod.outlook.com (2603:10b6:a03:39e::26)
 by LV2PR12MB5872.namprd12.prod.outlook.com (2603:10b6:408:173::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 15:15:26 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::9) by SJ0PR03CA0291.outlook.office365.com
 (2603:10b6:a03:39e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Tue,
 4 Mar 2025 15:15:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Tue, 4 Mar 2025 15:15:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 09:15:25 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 09:15:25 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 4 Mar 2025 09:15:24 -0600
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
X-Inumbo-ID: 828f88d7-f90b-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaKCndLDHbcIsgLbai8SVJ62os4eIdd8eCkw8BEcvZnhZlb/Y4POGylJVL1RxXSkm+nFAfE/dIMlTJXjrYqmO+OAuwvjGp6I3voFnercrz7CXTyg6S4IkUAi+aRDiR5x1+HxbpOBXMQhcH+/XWfdimvG1dpKAdBuK1Hw6bXAhMgUMj4vt+FGOS4UANMb/H3Z7e+Tq9cBgxCLHD9qVerUCdIcwxykOyeNcgPfGb+8tYCffyJIPvtMe2qSIcvB8IVPwtq8Zjvsx6RbAtCQcQvv9ZM+GRlC4t9ygiTYpUJ0pVmF7VFWRMn34a2O/FCNkdY7JdZ/OHYhAsvlI6/Ehx0QPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpYXwbW/MRJyeCGe8Aa5FfV8ndEzR64zHG0MfGybBo4=;
 b=N+L7ad631C10VoWiN7geX02+8VNw6ck1C9gVhDBaXOC1HTtH7odXuVVfVmQYLEpuRpj/46qvjhzrXRugoZlpcbcanghI4s/sn+YhgfMrZxmBB5k+ZhFkkXpDShHpVZcLSlo3XyyM9gn60Yd0So2w8oNMeyW6qh7bGX/Qi6Q6WpMzrkbgzQZcLco7wR39HNWBkBVueyaNJ8abUYQLLP9By/7dN9jNjzGnAimHVIMrP8IqRmw+ed6lgsSGTVBDUh7BaD4Jy22LpwcCw8gIsuEbdAlaDI5XEe47IOUOLfnNWJFpBAJTv184LXbGZRfNFUEGMSSF5Y6fXQUDG9He0Kyilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QpYXwbW/MRJyeCGe8Aa5FfV8ndEzR64zHG0MfGybBo4=;
 b=1Q2eGJBRrHp1Wk1zuscQtJL5GX7kxA2cdY4sKSoyK8LsM4A+rW0IPtw1SZC4ijEygiTIjy/ifc8NqPqCwd0iQNvZQMr5A7aq9lFotoxr9mxtIZQCyeTNH/ovxbTyXr3fnVLICOUDVpkMsmZADPctPLDO9QISjLnnBa0CxksUuvs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3bd7ff2b-5f26-496b-a067-c6c1f79e7515@amd.com>
Date: Tue, 4 Mar 2025 10:15:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/amd-iommu: Add interrupt remapping quirk for
 ath11k
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Xenia
 Ragiadakou" <xenia.ragiadakou@amd.com>
References: <20250226211125.43625-1-jason.andryuk@amd.com>
 <Z8A9LYjgr92IignP@macbook.local>
 <9be05453-ab39-4b70-9675-b9df47e870b2@amd.com>
 <Z8GDpJ8G8qMz4uYD@macbook.local>
 <09a8e9dd-2839-49d5-9fff-d2c12c0dd3ed@amd.com>
 <Z8bUqTKSJ8rpMX8R@macbook.local>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <Z8bUqTKSJ8rpMX8R@macbook.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|LV2PR12MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: d9df7c74-bca4-4692-7e41-08dd5b2f6468
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bmFOQUJhajRDdEZoeDh4bmw1VHgydVJaTEtnYUdhekJzTmFFR3dxOTVENGF5?=
 =?utf-8?B?SUVBYU5FY1FEWkZ4M1gvNVpIVGUvdzhKc2hReTN1S252QVpkcndnSDdRdDB0?=
 =?utf-8?B?YzdQR1ZYbjcvVVFaL3BGbjZlYXAzNHhVQXh4V0x0QmRTV2YwaTVlaWZ3ckRx?=
 =?utf-8?B?KzhaSVo3U3NGRTRYU2tmcmlUQ0o2WnVHVzBkUHBSS2FCNWhsYk1jMmYrcitl?=
 =?utf-8?B?OUlvL3VGT3N0Mzg3VGpVaFBzK1RkdXF5SjdtdzMvVlFPMFRrSnRvcERsdHlm?=
 =?utf-8?B?R1JyUWJoSldRVTZtOUEwamVDV2RHdmtTMEZBQ0t6a3gwd0dLYUhsWUp3UkQv?=
 =?utf-8?B?ekVzTExUSVJUTkFQbGY1VkZhelFITCtOVkc1VEJ3aFdodXQzOE5uVU1UZTcw?=
 =?utf-8?B?aWVFZjNMMmFtalV3UFhCZ2MzSnZ0S1hYMExjNjNyUm13TVpoaXFRb0EwelpE?=
 =?utf-8?B?VDBoaW9aOGltNlhwVWlzQU9hWmcwQVFieHhEZFhJbm1UR3ovMSt4UDBTYXhu?=
 =?utf-8?B?dnlyazl6cVZaVVQxSGM2OVBTQnJubkNWTTcrWXUzdGJqUlM0ZDdMcUFPcjFh?=
 =?utf-8?B?NDhGMi8xeHA5QmxMUTQwdHdFMC8xUzdXK3RTRnMrbGFzNk4rLzRid3VUUTVB?=
 =?utf-8?B?YmU3ckU0NERmdjV1R2F5bERmVlBsVnpUa3cxVCttOEZLU1hqN2h3d1hsT0sv?=
 =?utf-8?B?TEVxNGllUi9FSHF5RFVjK1g2MkVYZDZYY0FjZzZkdDFubW94RWxFN2RwRDht?=
 =?utf-8?B?VkpjTURpWlFIRzFGYWRxazE5NEZLd1NJdlJYOCtkdy9UUVRpbXUyc0gzMytH?=
 =?utf-8?B?UWF1VVY2Sk9XaW1yN2lLQ0gwc21oekxqN3FaSG9QVmpYdDhWUDlFUHQ0UE5n?=
 =?utf-8?B?czI1WXg4OUw2VW1EbzZ4T1RQVnp6a3pmSmpQaGd4blVqenlUTmIrejlHL0l6?=
 =?utf-8?B?bW9hbWhHa3ZGK2NLTUNnWGpqT01tNllnckFCWXdGRjZvREVpNlo5cjBiWXM5?=
 =?utf-8?B?SjhaSitjMXV1UFpnaDQvVDYrMitMYWNmby9GNUlyblBqY2s5LzBMdTFNdjI1?=
 =?utf-8?B?aG81ZWhvbkMwenZTWWNTWUErNjBqVWtONjQ4WWd4dzZEQlVXVTZHOU4yaXFa?=
 =?utf-8?B?OFAydXJrVC90UXZ1N3puU1U0R3NtS3VST2wrSVFSbEljWkZKblcwai9ZQWpu?=
 =?utf-8?B?MlI5alVVdHFsVDFQOGh6M3Bla1RDM09vYW5HSGtUNU9oZlhnaUNnR2NtWUxD?=
 =?utf-8?B?eWI5elZOTStmY3FUVGJYaVd1eGVjK0xQQldWWEZpQldVcVJlNnhiTXpsRnBn?=
 =?utf-8?B?RXd4ZVBSTy9aRU1LYXF3WHNhbTc1ODYyV0lNd0RGcXhzUExJcjB6SXpRbTU1?=
 =?utf-8?B?WERvSWlYTFBqU1ZYUWJDaDUra2dnU09wZWgxL29tbDdmNVlMaTE5ckhWMGlL?=
 =?utf-8?B?aEpEVlFaQmlnMWo2SkoyV2s5d09OT0dZR09vRjV4WDRmUlplMFV3ZmVYQ1JC?=
 =?utf-8?B?RTZ3Q204NFR6U3k2dGlOakJYU294RklaTmZham1Ob1JNZ291Sjkxb1BTc1NK?=
 =?utf-8?B?d0RJN0ZKZ1dPMDBtOTg4NTF1dDlsSnc2MURQQVhOZXBTcGYxZXh4K1JHaFRP?=
 =?utf-8?B?QkFzd1FiTjlvUzlheUxtakQvUm1JdkVnZmU1N003YnY4dHU2MEVUY2lYcDVn?=
 =?utf-8?B?VTRRUlE4ZUpSazh2ZEl3cU9ZOE5aWERab1htd2RiaDEvS1JFR3BMNENIRzhr?=
 =?utf-8?B?aHdBOFYyTFFHcGZHUW9aZEdUYks2LzBKeElkd29sdEo3WTFMUXM1bUR4NUFX?=
 =?utf-8?B?a21zeGppc25tWnlhbG9xTUhHbGJZUWxrR0x5Z2lKQUhyVGRhTUxVdThTYnRo?=
 =?utf-8?B?R2JQZzVYMW5BV2Y4dTh4ZnZiOFVOY2ViZUhRa3QvZC9JRkpML2lwSzd3WW55?=
 =?utf-8?B?VU1GTVNGSzBITGJmODVYOGEyUElNSFlwVkZNaktVTVpEL3Fja1V6UzJ2cUtw?=
 =?utf-8?Q?XzmSCPpPMP0qXL+WErqWdzd8FS2T80=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:15:26.1076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9df7c74-bca4-4692-7e41-08dd5b2f6468
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5872

On 2025-03-04 05:23, Roger Pau Monné wrote:
> On Fri, Feb 28, 2025 at 03:25:52PM -0500, Jason Andryuk wrote:
>> On 2025-02-28 04:36, Roger Pau Monné wrote:
>>> On Thu, Feb 27, 2025 at 01:28:11PM -0500, Jason Andryuk wrote:
>>>> On 2025-02-27 05:23, Roger Pau Monné wrote:
>>>>> On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
>>>>>> To work around this, we can, for per-device IRTs, program the hardware
>>>>>> to use the guest data & associated IRTE.  The address doesn't matter
>>>>>> since the IRTE handles that, and the Xen address & vector can be used as
>>>>>> expected.
>>>>>
>>>>> All this work on AMD because when interrupt remapping is enabled all
>>>>> MSIs are handled by the remapping table, while on Intel there's still
>>>>> a bit in the MSI address field to signal whether the MSI is using a
>>>>> remapping entry, or is using the "compatibility" format (iow: no
>>>>> remapping).
>>>>
>>>> So, on Intel, if the guest hands the device the MSI address, it can decided
>>>> to bypass remapping?
>>>>
>>>> Thanks for providing insight into the Intel inner workings.  That's why I am
>>>> asking.
>>>
>>> Yes, sorry, I'm afraid I don't have any good solution for Intel, at
>>> least not anything similar to what you propose to do on AMD-Vi.  I
>>> guess we could take a partial solution for AMD-Vi only, but it's
>>> sub-optimal from Xen perspective to have a piece of hardware working
>>> fine on AMD and not on Intel.
>>
>> I only need AMD to work ;)
>>
>> But yeah, I thought I should make an effort to get both working.
> 
> Kind of tangential to this approach.  Do you know which register(s)
> are used to store the non-architectural MSI address and data fields?
> 
> I'm wondering if it simply would be easier to introduce a quirk for
> this device in vPCI (and possibly QEMU?) that intercepts writes to the
> out of band MSI registers.  That should work for both Intel and AMD,
> but would have the side effect that Xen would need to intercept
> accesses to at least a full page, and possibly forward accesses to
> adjacent registers.

 From the QEMU part of the vfio hack:
* We therefore come up with a really crude quirk that looks for values
* written to the ATH11K_PCI_WINDOW (defined in Linux driver as starting
* at 0x80000 with an 18-bit mask, ie. 256k) that match the guest MSI
* address.  When found we replace the data with the host physical
* address and set a cookie to match the MSI data write, again replacing
* with the host value and clearing the cookie.

https://lore.kernel.org/ath11k/20240812170045.1584000-1-alex.williamson@redhat.com/

This is inside BAR0, AIUI.  I'm guessing, but I think the driver puts 
them into a command ring, so it's not a fixed location.  The large area, 
and since we won't normally intercept BAR access, made me not want to 
pursue this.

>>>>>> e.g. Replace amd_iommu_perdev_intremap with something generic.
>>>>>>
>>>>>> The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
>>>>>> dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
>>>>>> all that has been tested.
>>>>>
>>>>> DYK why it fails to enable 32?
>>>>
>>>> Not exactly - someone else had the card.  msi_capability_init() failed. If
>>>> it ends up in arch_setup_msi_irqs(), only 1 MSI is supported.  But precisely
>>>> where the mutiple nvecs was denied was not tracked down.
>>>
>>> Does it also fail on native?  I'm mostly asking because it would be
>>> good to get to the bottom of this, so that we don't come up with a
>>> partial solution that will break if multi-msi is used later in Linux.
>>
>> My understanding is native and PV dom0 work with 32, and it's Linux deciding
>> not to use multiple MSI.
>>
>> It might be this:
>> static int xen_hvm_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
>> {
>>          int irq, pirq;
>>          struct msi_desc *msidesc;
>>          struct msi_msg msg;
>>
>>          if (type == PCI_CAP_ID_MSI && nvec > 1)
>>                  return 1;
>>
>> I'll have to look into this more.
> 
> That shouldn't apply to PVH because it never exposes
> XENFEAT_hvm_pirqs, and I would expect xen_hvm_setup_msi_irqs() to not
> get used (otherwise we have a bug somewhere).

Okay.  Yeah, this doesn't seem to get called.  I asked internally, and 
no one tracked down precisely why multi-msi is denied.  I still need to 
get around to that.

Thanks,
Jason

