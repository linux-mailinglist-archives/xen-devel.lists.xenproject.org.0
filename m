Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF2DB0FCB5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 00:27:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054821.1423457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uehvO-0002KJ-7Y; Wed, 23 Jul 2025 22:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054821.1423457; Wed, 23 Jul 2025 22:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uehvO-0002In-36; Wed, 23 Jul 2025 22:26:58 +0000
Received: by outflank-mailman (input) for mailman id 1054821;
 Wed, 23 Jul 2025 22:26:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I4v=2E=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uehvM-0002Ih-CD
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 22:26:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2412::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2267625e-6814-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 00:26:54 +0200 (CEST)
Received: from BYAPR08CA0072.namprd08.prod.outlook.com (2603:10b6:a03:117::49)
 by SJ5PPF6375781D1.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::995) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 23 Jul
 2025 22:26:49 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:a03:117:cafe::34) by BYAPR08CA0072.outlook.office365.com
 (2603:10b6:a03:117::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 22:26:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 22:26:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 17:26:47 -0500
Received: from [172.25.61.180] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 17:26:47 -0500
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
X-Inumbo-ID: 2267625e-6814-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=un5lsvK7pQfwWQXyk95C+WRhL4z2O1FywWbGZpotW4jYlv2Gfyul79Rkqk0Ly7G4b089uKau/XXQ0r/MptpaXZ11MMszNSXMozFhyHe4lMSVaqHHpL7jTNzdp24k224GVRezn3VAolt5huTReL0y4m24XHYEmX3BNk3Rv12oq9u4BsQhcLCkacj7cRP/1TWHcgwJ2CpQ3qusAoQ92wPF2LqQ2vs0Lrt54Vh92TduvYy11U89+84UfAp8T2y2BH2IPCZJCvsc3jz1UWZhX+DGlkrSEkfu94JpdZnZg+dR+V6Nwl2arrGY6ynjkbS1qZeMHGICokhShIN7D6ESh7mcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0M++WxeHxfQ9lbyczn33hS2gtBkeR/8m8aY23YRPBBI=;
 b=rxJa5MkaLn02E3AZskxIS+mQ8X82R1U8a0ZkwisLAEEstIum3FiErfu4Fq/R2ekyMw6xgFT4+g9dYTfX+ZqsGTFRgXYb8P6j66kXoA0DRyhiWXzeRJy/dfqadasDWemypEWuAddqYzji6NrWdQ+h8Ah3G+ktYB3E4Jlk6EBx8QuQMEktIJVQ0LisUT4UO10LTwJEHCN/bqF8FfgWMhO8xBJgUPq6AA35CyYdrK6ly8ZzxlY24zqBD5qxjhNMuAfIHnFAfldo+K7eQzKmRQWPxtwRRFwOKVlqWzrYEAQpLNPNNHstEYBZAetsqEFnIACjbiPPJV5SDkGIyg0RiFr4BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0M++WxeHxfQ9lbyczn33hS2gtBkeR/8m8aY23YRPBBI=;
 b=e4VAB4XPoU4wUInu4qBLr3ftg+y3UMGP6Csh4rorUWAm+RStphKGo11/Q1ILExbMyitHBxukQ6kJfCVtGnNgZWlsL0mwmWrxggqsABM3EN0duBy3PMLcLP4W5CebcR9P3Q83BxVW4vw/9mRPqcuFUIRcmM2MqsdkwalB+tBIGlI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3736acf0-5808-4195-9a8d-e271f6791969@amd.com>
Date: Wed, 23 Jul 2025 18:26:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
References: <20250613154847.317979-1-stewart.hildebrand@amd.com>
 <1ab5d13e-f482-42e4-aae2-7276c6ea4654@suse.com>
 <3518a202-c664-4564-b59c-194f954b232e@amd.com>
 <c281035f-f347-4af9-a24e-6d0db6cb3ba0@suse.com>
 <256def05-4fcc-4c55-b409-d5ad63ac39d4@amd.com>
Content-Language: en-US
In-Reply-To: <256def05-4fcc-4c55-b409-d5ad63ac39d4@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|SJ5PPF6375781D1:EE_
X-MS-Office365-Filtering-Correlation-Id: 19286b0b-798c-4d0b-ec87-08ddca3803b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NU4vY3VoMTlUczBFMkRaangzZEptTDV3OFZmWjdEbXpUQUVITTdrQW9QN2Fs?=
 =?utf-8?B?VUZjZDU0NThxc1VSVE9ncFdhZlVjVWNDZWZMb1lOaTJuUlFLazFZUjB4bGtl?=
 =?utf-8?B?UXJ3VXAvaEVLbG5yM0tBOGV5Vzh6NVg0VG5UenRFY0IyQzNNdXNHdnpmaWhp?=
 =?utf-8?B?N3hzZTZodGxZUmwxckVURnBJTkFkVWxBdjFZd3A1TUVvcWxDZ05HeEFyODVu?=
 =?utf-8?B?dld0NHRMWFR0V1dZMXV5ZFlhWG14MVFQTUU1Z3dXQ2hxRVFLeGt5Ymt3U2VQ?=
 =?utf-8?B?c0NsbWRjcVBkR0VrVzJ0RFcxc1dIR3JWMmk0WXNFOEU5M3pVZnl2L1Q3bUhv?=
 =?utf-8?B?UmtBNXhqVjEvaDFWZFF6cHpMMS9CM081OHNlZ1pZYzlSWCttWFZnWUxDa1NK?=
 =?utf-8?B?T01ha1hBQ1VMN3EycHorckVHcTlMTmRrV3locFprWDBmKzMxSERLYUY1Rkg5?=
 =?utf-8?B?dzlkc1dRQTNxSkwwbVBma3VrbXYyK3ZTeENGbFRVcWhDbU0yRUxNOHdmcmRD?=
 =?utf-8?B?Q0ZsdDRaNW5CZ1cxN0tNWEFtckRVektzN20xdUtneUsrTUdMZzV0TnEzL2g3?=
 =?utf-8?B?N0llcFlrTzRmRUU0UnhSU1ZEZ3AvNGpZVlNWL3FEOFErcXQzSWMvZktRSXhh?=
 =?utf-8?B?aDViQ0lrbTc5WUVteTRIRGNTeWpJbk5WOThhbStqdjFMMzVISEw1VVpLSnBD?=
 =?utf-8?B?alQ4amMvS0pEb3pqdE14ZDZpdFlZMWZxZmd1bHdkbCtwaUJ6TitHSzdOaHJK?=
 =?utf-8?B?bnRGbTdKV05lbHYrL05sQm1hNEFRcThIOGROSkxMQ2dobUp1YitwR1VEbHdm?=
 =?utf-8?B?K2U0Q3Y5c1hFa0NmWW96VTFTNVIvYWowQnIyV1krRStwU0NYVzhVWTZaenk5?=
 =?utf-8?B?clhjQlJpWGtleGthL0dnTEo1RzU4RzMrZjc1d202QTlKNk85YndqcUZiQThC?=
 =?utf-8?B?UTlKSE9KdStkUlZFM2R2ZUx2ajQvUG44NWQ2c3IwQVRKV0hyazRUSWVKT1BO?=
 =?utf-8?B?aHNuRkRsMnJZVmJlVGxjbGFXZmd6UGJGa1RGNHpKeFo1bFdwSGhQNGRtRUEy?=
 =?utf-8?B?dVgvb080ZEhNN2lqQVBNYVRlQTdMMXFFVGN0bTNpZ0YydWNXbGl2bXFlZjgv?=
 =?utf-8?B?eW91TnRMRjJzV09EaGllZ1lHN0phWWNNQ0NQMWtWK1ZmU3Y5S3FRaGoxL25N?=
 =?utf-8?B?Z2tkS002VkcyK2Nuc09QclJpQUVCY3pUK0NaRENRSHAwbWg1RUxwR2tMc1pm?=
 =?utf-8?B?cXBPU1dNTnJWVjFsRS9BWERNNU1mOGpIcFJQekJmR1F2b1EwUCt2MEdXU2xy?=
 =?utf-8?B?K3g4RkU3REx3WExEWVVXcGpXOWpVRTczTlhETVh4MG40U2hDdDVRRkFVSXp0?=
 =?utf-8?B?V2l5RGhiZnhWMTNjYkFmS2lXbG9XaFIzU1VLa05qaUxoazBxbWJ4c0Y1WERY?=
 =?utf-8?B?Y2loOGdKRUFCWFhBOHc3UVZLUnVDWldQTmt6ZSthZkJNSkxTQS9hZ0MwblVh?=
 =?utf-8?B?WUZNUjZTOG1CRXExcFY4SnhFTjRZT3R1RjV3QkRNN251QlNobFpwekx0ekl3?=
 =?utf-8?B?OG1UaWhubXZCOWsxd2xmUUFTTkJQckIvMGRXb3RYd1lEenJpUUVxM3RpK01U?=
 =?utf-8?B?WWxGV05iMUsxVVpBVnFFdE00N3dwclcwRGMxZlYrSnhzNzJOc3h3L1liTWRo?=
 =?utf-8?B?WkhzRFpJSUZFZzdIVStOeE5ITmxkOUxWNzVCRFJoS0FwSy9HMTNSOFRic05p?=
 =?utf-8?B?TDI2M052RlpncWovMXU3WWxFSGFOK0xZcUREZ3owYmlDOWM3eGtwRG5qWjdH?=
 =?utf-8?B?V2Y3cmZrQUt4elRsbHVTZEtlNlIza2hMVHVhQ0pwd3dVVXRGRlc3Q2dvNFZ5?=
 =?utf-8?B?d2tNREpHb1VsMElUN1I3NFYvZUFqaVRmWVVvQUg0dVkweUpqdkZ2WlVwTEF4?=
 =?utf-8?B?aFJTMzZiSkFJQytsM3BrbktIZ2NDTERnanFWZ3VVOGkrU1NCMTZYZ2hEd2Ir?=
 =?utf-8?B?aG1Kdy9MQlk3NzI0VktCUGR6ejIrQWE5NExsRUVQYWh3VFg0cGxYbmRzcUVH?=
 =?utf-8?Q?O/eyRx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 22:26:48.5252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19286b0b-798c-4d0b-ec87-08ddca3803b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6375781D1

On 7/23/25 18:16, Stewart Hildebrand wrote:
> On 7/23/25 10:59, Jan Beulich wrote:
>> On 23.07.2025 16:26, Stewart Hildebrand wrote:
>>> On 7/23/25 06:18, Jan Beulich wrote:
>>>> On 13.06.2025 17:17, Stewart Hildebrand wrote:
>>>>> --- a/xen/arch/arm/Kconfig
>>>>> +++ b/xen/arch/arm/Kconfig
>>>>> @@ -8,6 +8,8 @@ config ARM_64
>>>>>  	depends on !ARM_32
>>>>>  	select 64BIT
>>>>>  	select HAS_FAST_MULTIPLY
>>>>> +	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
>>>>> +	select HAS_PASSTHROUGH if PCI_PASSTHROUGH
>>>>
>>>> As I just learned, this change (or maybe it was the "select HAS_PCI"
>>>> further down) has exposed the quarantining Kconfig option prompt, which
>>>> (aiui) is entirely meaningless on Arm. IOW I think further adjustments
>>>> are necessary.
>>>
>>> Not entirely meaningless - the choice between "none" and "basic" still
>>> seems relevant. Just "scratch page" quarantining hasn't been implemented
>>> in any of the Arm iommu drivers.
>>
>> Is there support for "basic"? For x86, most of the involved code lives
>> in the vendor-specific drivers, and I can't find anything related in
>> Arm's. Note in particular the hook iommu_quarantine_dev_init() calls,
>> which isn't provided by any of the Arm drivers afaict.
> 
> Quoting xen/drivers/passthrough/Kconfig IOMMU_QUARANTINE_* help text:
> 
> "... basic form, all in-flight DMA will simply be forced to encounter
> IOMMU faults."
> 
> My understanding of "basic" is that after destruction of a domU with a
> PCI device assigned, the PCI device gets assigned to domIO. We have
> special casing for ( d == dom_io ) in some instances, but otherwise it
> has relatively little to do with the individual iommu drivers. I believe
> assigning to domIO should be enough for the Arm iommus to generate
> faults, since the iommu identifies the PCI device's DMA via sideband
> information (AXI stream ID).

Oh, and also note the commit messages in
63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices support for SMMUv3")
and
ca8f6ffeb6e3 ("xen/arm: smmuv2: Add PCI devices support for SMMUv2")
"Implement basic quarantining."

