Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401D4A487F5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 19:40:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898366.1306936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnina-0001P8-O7; Thu, 27 Feb 2025 18:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898366.1306936; Thu, 27 Feb 2025 18:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnina-0001MZ-Kx; Thu, 27 Feb 2025 18:39:54 +0000
Received: by outflank-mailman (input) for mailman id 898366;
 Thu, 27 Feb 2025 18:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymMN=VS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tninZ-0001MT-6K
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 18:39:53 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20621.outbound.protection.outlook.com
 [2a01:111:f403:2406::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 396e326e-f53a-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 19:39:50 +0100 (CET)
Received: from BN0PR03CA0043.namprd03.prod.outlook.com (2603:10b6:408:e7::18)
 by SA1PR12MB6704.namprd12.prod.outlook.com (2603:10b6:806:254::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 18:39:44 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:e7:cafe::56) by BN0PR03CA0043.outlook.office365.com
 (2603:10b6:408:e7::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Thu,
 27 Feb 2025 18:39:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 18:39:44 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 12:39:40 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 12:39:39 -0600
Received: from [172.31.223.240] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Feb 2025 12:39:39 -0600
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
X-Inumbo-ID: 396e326e-f53a-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKKUhoX8EAwBl242eTnmPSAthN5XNUx6hBMGYp9U9zDx7T0mlUX6ERRgDouc6BysPc7AGzZcAG3eTB3G7Iy7tEwhsgckXQuQyrvI/N9QkFDqhdQZi6XKBPV6a64nhRoQdRN+XAOiHLXcnujv3QcR6ENdTLb4jDVONA9xoNk3JViQV7cZCq94vJGcSdTfWcfSNKmEm82wKhXyBVzFhJa3ftxiFRwkY2il46eMBnpnCnL+tCHFME2I14SnAe5uiX9KX2OCiI+ZlSqXs2sfpXf9U2Ork/8hwHnLEzh+FWgGbL+IhwL9wxKXlHjsOQiC7Y0SLNbf5wC+rsp0WUXyyRxFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuFfY2K01+A7zvdZeZCjo2zPmtH6U219ohSvJCiRTV0=;
 b=C6OPj3vce1xx0LWgNNzmOCn2PW6FAszsUHDqVxGlb8TnaEQYJpakvXA/saNHWPryluXQ9Q1BrxxSftE18epXbafRx6mWZWTkfByJGnBG7bSrBC5g0DBZEgXBFK3WH3WHyBwqBUu9xUqeq9ZGMgz9B/KSGY4nVPO+nnvC+exnFxMi/sPWbKcTVGL9QFFc/pek9BaCw/2IhDhbL75drS2/VOpxJbmcnA5STJWm9Qvk0szhBpcyiHJbt1HX210TdZiwc2I8Un0bpJKbNyhHu9jUoWJMl+6juFonNdIRsd4ge7ZdWQEIa5JNtzyGc89fbiiKaFW6uZyLa1HeTnfeRUXuVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuFfY2K01+A7zvdZeZCjo2zPmtH6U219ohSvJCiRTV0=;
 b=4GEFuwTTXNSVXZJdPBsStgUym5ojrClIfnGkfx7Mvlqh0O7AZ+CiecpVN2qyqgpEgWv2fr1Vr4RIbcw4pdkYRi7dzLxTMQ5rgsiY6tRG4mjrkGl90Kh+9LPgzrJw2d0fzKqBBW22eAdsDQUgl09Lp9XCbeWslp1Hf4R8gXoaqW8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9be05453-ab39-4b70-9675-b9df47e870b2@amd.com>
Date: Thu, 27 Feb 2025 13:28:11 -0500
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
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <Z8A9LYjgr92IignP@macbook.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|SA1PR12MB6704:EE_
X-MS-Office365-Filtering-Correlation-Id: 4521c36c-a79d-4af6-206f-08dd575e1acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnFtbmNVSUdhYWkrTldmQkF1aW1uMjBUTXFka1ZrRnQ5Wllwd3hPb3hFYXJn?=
 =?utf-8?B?UmVrTUNndEsxdFF0dzFkTXNFaEJOVldYQXJLNmpZMytxOVFldTJMYXpobjhu?=
 =?utf-8?B?elpJcy9YRnJ2VHJNTzFoM1c4Y2tXMDQrbXArSkRIcmdpNTI0blltais5ajlp?=
 =?utf-8?B?dmtweFhKVnhYbFRNVExJZGhnUHNIeU9uVkRGODZRWEk1Z2psblczNm9jUW4x?=
 =?utf-8?B?N3E0bmVwMWtPUFR4TURrNW1Pc1dUdEZsR0J5OTZZUXhNTGUvYjlLeXZZRHd4?=
 =?utf-8?B?b1lBaExZeUdGWE1nTTNtcS9yYlhyN0NpRWtVYjdMMUptb2xJekZGQjdaVEN0?=
 =?utf-8?B?VnV1THpNdE40eVRJR20vbGRvLzgyVU5mNFRvY3d4ZnRsTnUzVER6V3ZxVDJn?=
 =?utf-8?B?Y2hNRjRrMTRPem0xaUQxZ3N4MGMrNVhnVnR2MTNtalR1TnNLOVFsbmk4K0th?=
 =?utf-8?B?K3hGT3ppbEdrNytnL2lsaGtWaVdwTVNaTTZzMStoZ0RqczBqNEdHYmNtT3Mx?=
 =?utf-8?B?bFloU0dISDM5aGR6MnhsbHdCcHhSdURRZTB1TStlelRKWjh3M0IwQ0hyU1Nk?=
 =?utf-8?B?eElXekhiTU1Hb2t4aTYxcEQ0M0c2UjZIc0w2TktXV1hwR2h4M2xIUHdJSXNa?=
 =?utf-8?B?MzlsMVFITGthRW1jS0NPakFFQUVLZ1RudmNheVRrSlFCVUpFREZPaXZSRHpM?=
 =?utf-8?B?K3JlN0ljdVpYT3JucVVQTit6a1JhZUdiUUkwYXZ4M2E4NlZSRDkzWUl0RmZk?=
 =?utf-8?B?UHNhS2dWVGRONVNuSTFVOHhWbitlZWlnRFpSUTM1TEltQ0JMOHRZYUxLTjFG?=
 =?utf-8?B?RHMzZ29TRVVRbHBCWk9lbjBEOGFSaHl5Q01HRWNBRXpnR2RXUnFpT1JRT3JN?=
 =?utf-8?B?SklxbHA4bWJJa0pBMWNUTzNYbzZDTUx1TllkajQvU2FNRlJGU0d5OUlnZDFO?=
 =?utf-8?B?UkFNdjRFRTFOVXI0Yld6WC96b0tLY2w2K2Yva0k2UitJQ2JDMUZubzM0TWtF?=
 =?utf-8?B?VVptc1gwUE82bmpRVzFxbVJWUDN3Ui9Ncjh5VVNNN0N0QzhQUTJmQXNHbzVk?=
 =?utf-8?B?MjdZZnRoY2J6b3NXSkxCcGlFc3BjWXFoZGdkU3d5ckQ4L2h3SmZ6MXRWWnBB?=
 =?utf-8?B?SlltTEhhZjc4TkIzWFNXcUJvQWNWOHVoNjZ2WHVVL3FrTTNuSzM2WENqZFFL?=
 =?utf-8?B?WndtMkdFcEhRNlZyeUE2dzNhZjFqRDdxNjJ1SmVIVFllMUZnVWhXaVRlLyt0?=
 =?utf-8?B?eUhGZGsxNUFBcXdlWEQ4RWVOeWpsa2RqL2VFdnZ5amdmOHRYQXVScEhXVXRF?=
 =?utf-8?B?MGtOTDRZUFl3QzJSUGd2TElybHQ0Q0FPQ3FEWGtTcmp3dU91ejhCbVRlcjk4?=
 =?utf-8?B?bnZ0M3Nld1FuaURidGFvS1pyQ0cxOGtYZHdJUityVndzZnlLckgvZzNmbGFj?=
 =?utf-8?B?VXgwMldrelNvZGNuSGREdWdUZXc2VjZaV2tOSEFGVndlWGNFeFgwMjViMjdH?=
 =?utf-8?B?SmI1cHB0WXVwdHZ3ZEo5TE84ZnQ2WlBxMkZjVUdFMFQ3NTc3Nzdjb0J2TGVS?=
 =?utf-8?B?VnRhdnlxRmxKaVhJQUo4b0M0c0U3QjRyWndMM1dmUnByYnYzclF5OEFSOWp6?=
 =?utf-8?B?VXhYMmxVYVI3cHlWS0hnMzU0YW5BeTl5YjNCbkpZRllQMmtBVFpLdHgvenNU?=
 =?utf-8?B?OE8vUWhyaGxSRTRxdUVBU3oyL1VMQTBTVkFOQnNqQytCL2F5WGE4RXF5OTQ0?=
 =?utf-8?B?YTVqT2JCY3NQSkY2emt2RWpwYVdDRElsWHR2NjdNUzM1NGdIZHJKdWg5ZWtF?=
 =?utf-8?B?MTB3QmpMcHJBbW80YlZXVis0TWMvbjJxZDJwYUVvVU1HbHVXY1RUaWx1OFZW?=
 =?utf-8?B?bHBRT2RyKy9qUzlsS3c3enZxQnNnRkNVS25lR2k0OWlrTzZXVkdFL3htdTRx?=
 =?utf-8?B?SEE1RGpHVWtQR1F3Y2IvQWMxYUtUR3prOUhGaE5HMEcza0VsdTFqVk9pZGRq?=
 =?utf-8?Q?x7dYM4k1ePfsUsmGxCdKK289MPFXhA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 18:39:44.3915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4521c36c-a79d-4af6-206f-08dd575e1acb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6704

On 2025-02-27 05:23, Roger Pau Monné wrote:
> On Wed, Feb 26, 2025 at 04:11:25PM -0500, Jason Andryuk wrote:
>> Sometimes we have to quirk the PCI IRTE to use a non-zero remap_index
>> corresponding to the guest's view of the MSI data register.  The MSI
>> data guest vector equals interrupt remapping table index.
> 
> I think you need some introduction before making this statement about
> remapping indexes and IRTEs.

I can drop or move later.

>> The ath11k wifi device does unusual things with MSIs.  The driver lets
>> Linux program the MSI capability.  Linux internally caches the MSI data
>> it thinks it programmed.  It sets its affinity to CPU0.  The ath11k
>> driver then reads the MSI address from the PCI configuration space.  The
>> MSI address and cached data are then passed to other components on the
>> same card to generate MSI interrupts.
>>
>> With Xen, vPCI and QEMU PCI passthrough have a guest idea of the MSI
>> address and data.  But Xen programs the actual hardware with its own
>> address and data.  With per-device IRT, xen uses index 0.
> 
> By "Xen uses index 0" I think you mean that when using per-device
> interrupt remapping table indexes start at 0 for every device, instead
> of all devices sharing the same index address space.

Yes.

>> When the
>> ath11k driver passes the guest address and data to the hardware, it
>> generates faults when there is no IRTE for the guest data (~0x25).
> 
> What does ~0x25 mean in this context?

It was supposed to be an example of the observed MSI data in the range 
0x25-0x28.  Maybe I should just state non-zero.

>> To work around this, we can, for per-device IRTs, program the hardware
>> to use the guest data & associated IRTE.  The address doesn't matter
>> since the IRTE handles that, and the Xen address & vector can be used as
>> expected.
> 
> All this work on AMD because when interrupt remapping is enabled all
> MSIs are handled by the remapping table, while on Intel there's still
> a bit in the MSI address field to signal whether the MSI is using a
> remapping entry, or is using the "compatibility" format (iow: no
> remapping).

So, on Intel, if the guest hands the device the MSI address, it can 
decided to bypass remapping?

Thanks for providing insight into the Intel inner workings.  That's why 
I am asking.

>>
>> For vPCI, the guest MSI data is available at the time of initial MSI
>> setup, but that is not the case for HVM.  With HVM, the initial MSI
>> setup is done when PHYSDEVOP_map_pirq is called, but the guest vector is
>> only available later when XEN_DOMCTL_bind_pt_irq is called.  In that
>> case, we need to tear down and create a new IRTE.  This later location
>> can also handle vPCI.
>>
>> Add pirq_guest_bind_gvec to plumb down the gvec without modifying all
>> call sites.  Use msi_desc->gvec to pass through the desired value.
> 
> So basically the solution is to use the guest selected MSI vector as
> the interrupt remapping table index, as then the guest can use the MSI
> data and address fields without requiring Xen translation.
> 
> What about the guest using the same vector across multiple vCPUs?  So
> MSI entries having the same vector field, but different target
> destination CPUs?  That won't work correctly as all those MSIs will
> attempt to use the same IRTE?
> 
> Note that when interrupt remapping support was introduced on AMD-Vi it
> was indeed the vector that was used as index into the interrupt
> remapping table, this was changed in:
> 
> 2ca9fbd739b8 AMD IOMMU: allocate IRTE entries instead of using a static mapping
> 
>> Only tested with AMD-Vi.  Requires per-device IRT.  With AMD-Vi, the
>> number of MSIs is passed in, but a minimum of a page is allocated for
>> the table.  The vector is 8 bits giving indices 0-255.  Even with 128bit
>> IRTEs, 16 bytes, 1 page 4096 / 16 = 256 entries, so we don't have to
>> worry about overflow.  N MSIs can only have the last one at 255, so the
>> guest can't expect to have N vectors starting above 255 - N.
> 
> While this seems like a possible quirk for AMD, what about Intel?
> 
> And what about PV?  I think PV mostly works because the migration of
> interrupts across CPUs doesn't cause the IRT index to change, but we
> should somehow add checks to this regard if this is now a requirement
> for such kind of quirky devices.

I didn't try, but PV dom0 worked with the device with multiple MSI.

>>
>> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> Is something like this feasible for inclusion upstream?  I'm asking
>> before I look into what it would take to support Intel.
> 
> Intel would be more complicated, as there the usage of the IRT is
> explicitly signaled in the MSI address field.  Otherwise it's
> considered a "compatibility" (iow: non-translated) MSI.

Hmmm, ok.

>> e.g. Replace amd_iommu_perdev_intremap with something generic.
>>
>> The ath11k device supports and tries to enable 32 MSIs.  Linux in PVH
>> dom0 and HVM domU fails enabling 32 and falls back to just 1, so that is
>> all that has been tested.
> 
> DYK why it fails to enable 32?

Not exactly - someone else had the card.  msi_capability_init() failed. 
If it ends up in arch_setup_msi_irqs(), only 1 MSI is supported.  But 
precisely where the mutiple nvecs was denied was not tracked down.

>> Using msi_desc->gvec should be okay since with posted interrupts - the
>> gvec is expected to match.
>>
>> hvm_pi_update_irte() changes the IRTE but not the MSI data in the PCI
>> capability, so that isn't suitable by itself.
>> ---
>>   xen/arch/x86/include/asm/msi.h           |  3 ++-
>>   xen/arch/x86/irq.c                       | 13 +++++++++++-
>>   xen/arch/x86/msi.c                       |  1 +
>>   xen/drivers/passthrough/amd/iommu_intr.c | 25 ++++++++++++++++++++++++
>>   xen/drivers/passthrough/pci.c            | 24 +++++++++++++++++++++++
>>   xen/drivers/passthrough/x86/hvm.c        |  3 ++-
>>   xen/include/xen/irq.h                    |  2 ++
>>   xen/include/xen/pci.h                    |  2 ++
>>   8 files changed, 70 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
>> index 378b85ee94..ea1004af14 100644
>> --- a/xen/arch/x86/include/asm/msi.h
>> +++ b/xen/arch/x86/include/asm/msi.h
>> @@ -107,7 +107,8 @@ struct msi_desc {
>>       } msi_attrib;
>>   
>>       bool irte_initialized;
>> -    uint8_t gvec;            /* guest vector. valid when pi_desc isn't NULL */
>> +    uint8_t gvec;            /* guest vector. valid when pi_desc isn't NULL or
>> +                                when pci_dev gvec_as_irte_idx is true */
> 
> Missing capital 'V' after full stop.
> 
> Nit: multi-line comments should be:
> 
> /*
>   * guest vector. Valid when pi_desc isn't NULL or
>   * when pci_dev gvec_as_irte_idx is true
>   */
> 
> I would probably move the whole comment ahead of the field
> declaration:
> 
>      /*
>       * Guest vector.  Valid when pi_desc isn't NULL or when pci_dev
>       * gvec_as_irte_idx is true.
>       */
>      uint8_t gvec;

Sounds good.

>>       const struct pi_desc *pi_desc; /* pointer to posted descriptor */
>>   
>>       struct list_head list;
>> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
>> index ff3ac832f4..3fc73feaea 100644
>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -1600,7 +1600,8 @@ int pirq_shared(struct domain *d, int pirq)
>>       return shared;
>>   }
>>   
>> -int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>> +int pirq_guest_bind_gvec(struct vcpu *v, struct pirq *pirq, int will_share,
> 
> I think you could take the opportunity to convert will_share to a
> boolean.

Ok.

>> +                         uint8_t gvec)
>>   {
>>       struct irq_desc         *desc;
>>       irq_guest_action_t *action, *newaction = NULL;
>> @@ -1674,7 +1675,12 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>>                                             &cpu_online_map) )
>>                   affinity = desc->affinity;
>>               if ( affinity )
>> +            {
>> +                if ( gvec && desc->msi_desc )
>> +                    desc->msi_desc->gvec = gvec;
> 
> Hm, this feels a bit out of place.  Shouldn't the field better be set
> by pt_irq_create_bind() when irq_type == PT_IRQ_TYPE_MSI and the
> quirk is enabled for the device?

I can look again, but I put it here for simplicity. 
pt_irq_create_bind() has the gvec, but not the irq_desc.  Passing gvec 
into pirq_guest_bind() was the easiest way to get the gvec into the 
msi_desc.

The gvec is in pirq_dpci, so maybe that can just be looked up lower down 
closer to programming the hardware.

>> +
>>                   desc->handler->set_affinity(desc, affinity);
>> +            }
>>           }
>>   
>>           desc->status &= ~IRQ_DISABLED;
>> @@ -1730,6 +1736,11 @@ int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>>       return rc;
>>   }
>>   
>> +int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
>> +{
>> +    return pirq_guest_bind_gvec(v, pirq, will_share, 0);
>> +}
> 
> Could this be a static inline in some header?

Sure.

>> +
>>   static irq_guest_action_t *__pirq_guest_unbind(
>>       struct domain *d, struct pirq *pirq, struct irq_desc *desc)
>>   {
>> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
>> index bf5b71822e..cef2987038 100644
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -487,6 +487,7 @@ static struct msi_desc *alloc_msi_entry(unsigned int nr)
>>           entry[nr].remap_index = -1;
>>           entry[nr].pi_desc = NULL;
>>           entry[nr].irte_initialized = false;
>> +        entry[nr].gvec = 0;
> 
> We should rather use xzalloc_array() instead of xmalloc_array() here,
> as that would avoid all this manual setting to NULL, 0 and false.
> 
> It would be good to do this as a pre-patch, so that you can avoid the
> change here.

Sounds good.

>>       }
>>   
>>       return entry;
>> diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
>> index c0273059cb..2e228d2c21 100644
>> --- a/xen/drivers/passthrough/amd/iommu_intr.c
>> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
>> @@ -543,6 +543,31 @@ int cf_check amd_iommu_msi_msg_update_ire(
>>       if ( !msg )
>>           return 0;
>>   
>> +    if ( pdev->gvec_as_irte_idx && amd_iommu_perdev_intremap )
>> +    {
>> +        int new_remap_index = 0;
> 
> Newline.  You could make this unsigned also by the looks of it?
> 
>> +        if ( msi_desc->gvec )
>> +        {
>> +            printk("%pp: gvec remap_index %#x -> %#x\n", &pdev->sbdf,
>> +                   msi_desc->remap_index, msi_desc->gvec);
> 
> gprintk(XENLOG_DEBUG, ...

>> +            new_remap_index = msi_desc->gvec;
>> +        }
>> +
>> +        if ( new_remap_index && new_remap_index != msi_desc->remap_index &&
>> +             msi_desc->remap_index != -1 )
>> +        {
>> +            /* Clear any existing entries */
>> +            update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>> +                                               &msi_desc->remap_index,
>> +                                               NULL, NULL);
> 
> Why do you need to clear any entries?  This will cause a window where
> MSI entries targeting this IRTEs to generate faults because the
> entries are not setup.
> 
> Just re-use them, update_intremap_entry_from_msi_msg() will update the
> IRTE atomically so that there's no window where the entries would be
> invalid, and thus to faults will be generated.

I see your point about the window.  I was trying to keep it clean as 
different indices get populated.  Initially, IRT[0..n-1] is populated. 
Later, when the gvec is available, we want IRT[gvec..gvec+n-1] 
populated.  I guess the new gvec ones could be added, and then 
0...gvec-1 removed.  Or don't bother?

I considered leaving IRTE[0] and adding IRTE[gvec].  I think that could 
work, but would be more hacky.

I was trying to keep the irte accounting bitmap correct, but it doesn't 
really matter for per-device IRT.

>> +
>> +            for ( i = 0; i < nr; ++i )
>> +                msi_desc[i].remap_index = -1;
>> +
>> +            msi_desc->remap_index = new_remap_index;
>> +        }
>> +    }
>> +
>>       rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
>>                                               &msi_desc->remap_index,
>>                                               msg, &data);
> 
> To be on the safe side, I would add a check here that ensures that
> update_intremap_entry_from_msi_msg() doesn't change the IRT index
> (unless it's -1).

Ok

> 
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>> index e1a09344df..7031aedb94 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -306,6 +306,17 @@ static void apply_quirks(struct pci_dev *pdev)
>>           { PCI_VENDOR_ID_INTEL, 0x6fa0 },
>>           { PCI_VENDOR_ID_INTEL, 0x6fc0 },
>>       };
>> +    static const struct {
>> +        uint16_t vendor, device;
>> +    } hide_irt[] = {
> 
> Nit: hide_irt is not very descriptive, I would rather use
> force_gvec_as_irti or something similar.

Ok.

>> +#define PCI_VENDOR_ID_QCOM		0x17cb
>> +#define QCA6390_DEVICE_ID		0x1101
>> +#define QCN9074_DEVICE_ID		0x1104
>> +#define WCN6855_DEVICE_ID		0x1103
> 
> There are some hard tabs in the defines above which should instead be
> spaces.

Ok.  Will probably go away with Jan's suggestion to remove the defines.

>> +        { PCI_VENDOR_ID_QCOM, QCA6390_DEVICE_ID },
>> +        { PCI_VENDOR_ID_QCOM, QCN9074_DEVICE_ID },
>> +        { PCI_VENDOR_ID_QCOM, WCN6855_DEVICE_ID },
>> +    };
>>       unsigned int i;
>>   
>>       for ( i = 0; i < ARRAY_SIZE(ignore_bars); i++)
>> @@ -316,6 +327,19 @@ static void apply_quirks(struct pci_dev *pdev)
>>                * from trying to size the BARs or add handlers to trap accesses.
>>                */
>>               pdev->ignore_bars = true;
>> +
>> +    for ( i = 0; i < ARRAY_SIZE(hide_irt); i++)
>                                                   ^ missing space.

Yes, thanks.

>> +    {
>> +        if ( vendor == hide_irt[i].vendor &&
>> +             device == hide_irt[i].device )
>> +        {
>> +            pdev->gvec_as_irte_idx = true;
>> +            printk("%pp %04x:%04x quirk gvec as intr remap index\n",
>> +                   &pdev->sbdf, hide_irt[i].vendor, hide_irt[i].device);
>> +            if ( !amd_iommu_perdev_intremap )
>> +                printk("gvec quirk requires per-device intr remap!\n");
> 
> I think pdev->gvec_as_irte_idx should not be set if there's no perdev
> IRT support.  You should also limit the quirk to AMD-Vi systems, note
> that amd_iommu_perdev_intremap is defined as:
> 
> bool __ro_after_init amd_iommu_perdev_intremap = true;
> 
> And hence would unconditionally be true on Intel systems.

Thanks.  I didn't immediately see a way to check which iommu 
implementation was in use.

>> +        }
>> +    }
>>   }
>>   
>>   static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)

>> diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
>> index 95034c0d6b..96109d6ebe 100644
>> --- a/xen/include/xen/irq.h
>> +++ b/xen/include/xen/irq.h
>> @@ -192,6 +192,8 @@ extern void pirq_guest_eoi(struct pirq *pirq);
>>   extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
>>   extern int pirq_guest_unmask(struct domain *d);
>>   extern int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share);
>> +extern int pirq_guest_bind_gvec(struct vcpu *v, struct pirq *pirq,
>> +                                int will_share, uint8_t gvec);
> 
> Hm, it seems like a layering violation to put a x86 specific function
> in a common header.

Oh, yes, this could be internal to x86.

> Did you consider hiding the need to use the guest vector as the IRT
> index in struct arch_pirq?

With sufficient pointer following, the gvec can probably be found. 
Passing gvec to pirq_guest_bind_gvec() was just the easiest way to 
bridge the gap.

>>   extern void pirq_guest_unbind(struct domain *d, struct pirq *pirq);
>>   extern void pirq_set_affinity(struct domain *d, int pirq,
>>                                 const cpumask_t *mask);
>> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
>> index 4f12bcf089..14afd78f75 100644
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -127,6 +127,8 @@ struct pci_dev {
>>       /* Device with errata, ignore the BARs. */
>>       bool ignore_bars;
>>   
>> +    bool gvec_as_irte_idx;
> 
> A small comment might be helpful here:
> 
> /* Quirk: force the use of the MSI vector as the IRT index. */

Sounds good.

> Overall I'm a little at unease for allowing domains to control the IRT
> index address space.  I haven't looked closely enough to see if a
> guest could cause some kind of clashes or the triggering of internal
> Xen state checks by for example forcing multiple MSI entries to use
> the same vector.

I was thinking that with per-device intremap, and the fact that it is 
only a single MSI capability for the device, the change is fairly 
contained.  It's just changing the indices.  Xen is still controlling 
the contents of the IRTEs, so that seems okay to me.

Thanks for taking a look.

Regards,
Jason

