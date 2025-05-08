Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F61AAF7F0
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 12:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979249.1365925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCyac-0003lr-H0; Thu, 08 May 2025 10:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979249.1365925; Thu, 08 May 2025 10:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCyac-0003kK-EK; Thu, 08 May 2025 10:34:54 +0000
Received: by outflank-mailman (input) for mailman id 979249;
 Thu, 08 May 2025 10:34:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqQS=XY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uCyaa-0003k2-BD
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 10:34:52 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2413::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11b8ab6b-2bf8-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 12:34:49 +0200 (CEST)
Received: from MW4PR04CA0197.namprd04.prod.outlook.com (2603:10b6:303:86::22)
 by DS0PR12MB7725.namprd12.prod.outlook.com (2603:10b6:8:136::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 10:34:42 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:303:86:cafe::a5) by MW4PR04CA0197.outlook.office365.com
 (2603:10b6:303:86::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Thu,
 8 May 2025 10:34:41 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 10:34:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 05:34:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 05:34:40 -0500
Received: from [172.31.225.170] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 05:34:39 -0500
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
X-Inumbo-ID: 11b8ab6b-2bf8-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PZAy30jCbunrvrgW0ozYWResiItqkdAgmTql1WgyCA0tRIKqxdLw0XBw1hJwtbckQdze49eFJeDf0Iwp0mCJeT3cc+1W7DwB/3vRcsomCjv5zRiUBuQpVa5cia1SCje4Y0XeJVX7fjLKTbyuiMl7o4O6/4pbTyk8DtgVU9J36jqf9WgxdwfidOHlHRejSNynZ3EHkZ5PDklFr8ZofTJmHesygf7wTL6z8AcUCgRGsl8cQ3XfAvr51ETWliio4yslFLOGIX12VsuUiKY8p6fsUlkFrLTboy4RPzUjYkzc9hYqBdPyQH+arluD0/jSDAUXzfV15N679lSbu3vkuD8Itg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i12JiDrnO37DYnmXkyBbAwamtQar5VJ2G6xuK0rQwYQ=;
 b=IT9GstKHAiVAcT7Omp7JaVVifSHbtAB5OjU2tAGqmdL8ROpoDTFoQjsj9rC7+uGUEcfLQPP1jBg5B4hbwOUv8SBNjskZczNsiWiGvpA773Iz8eMYArxBWjdQD4Wd4gmOxI51ukH4gVrCf0pjUq2ggduVieh7HLZ1DMSJUVWJ4R/0t5oeUDmiz/vh2FMQcUdwQffoOUqgGS9bRA95Oz9f3VTas0mHgsHGRAdr7I2LwQB3eSh44PrfKKG8YF7ssz72/VrFe2oZ34iqeq6lqnq9ER5UsahzCzXYFsP/jWOlAYl9kCKAXjdi3BfQ/Bze6Ib6/v5M619bMvu12k//eClTYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i12JiDrnO37DYnmXkyBbAwamtQar5VJ2G6xuK0rQwYQ=;
 b=TgRMVw3MUWPbD+GZ8j0wzWe1ilvyxakJX3aydbpTB4ujJkRc0Y+A62kegpPmMyz3LbuOXOindjr1G2q6fb6kiYMVzMXPmWvn1z227/BBBNT21poLQng4YXldxvL+A9d1gG9ZG6L4hdDj9Wk51NT5ugL/OgMU05MAUqO9tWAZwAs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b955ff21-13ac-46a9-980a-fb7fbc369723@amd.com>
Date: Thu, 8 May 2025 06:34:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 2/2] vpci: translate virtual PCI bus topology for
 guests
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>, Oleksandr
 Andrushchenko <oleksandr_andrushchenko@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiqian Chen <Jiqian.Chen@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
References: <20250418185840.335816-1-stewart.hildebrand@amd.com>
 <20250418185840.335816-3-stewart.hildebrand@amd.com>
 <aBnvlY3Dfc_Wpljw@macbook.lan> <3693f1ef-e305-4a6b-bb4e-3b842418387f@amd.com>
 <aBsPbyqL0XpjEdeo@macbook.lan> <eee6811b-36da-41be-83b0-21ec99d3b829@amd.com>
 <aBucENdwFYacsQAX@macbook.lan> <47ee8b59-7b6a-4248-a4bd-f5be9f00f562@amd.com>
 <aBxsNypPugcu2wZ0@macbook.lan>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aBxsNypPugcu2wZ0@macbook.lan>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|DS0PR12MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: ab3c1fbf-13c9-4c56-c814-08dd8e1bf0fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHVMaXk0YVVDU2RhaDIyc3ZNSjZYVjE0TnNkQ3ZiU3JyNmluWXpqV1R6Tm96?=
 =?utf-8?B?UExINVJyTk9QU2didHk4NEE4SzlyUy9wWHBDVFRhRzVzZHJVWWVNcGIyM1lS?=
 =?utf-8?B?eW1JOVlQYkEwVU1MV1dIbVJxM0ZlRU1zVzEyaW5ZK25nRVdoWVZudWxEK1pE?=
 =?utf-8?B?WDZPWFJ3L2tDeGh3TURDYUVzZUZia0t6ZnVJdVN5YTl5NDhTYUFraFBwUmUy?=
 =?utf-8?B?aDR2RnBUVzl5WWtnbzQxSUtYQUpjanF6djBaY09XenpMbFVVYU91dVZXaEFL?=
 =?utf-8?B?aGZMSkJKZGh0T1dkK25oY0lKUkh4aFRvTVNjc1JaNUpqb0VjbUdPZElVdXBF?=
 =?utf-8?B?ZlpuYjgxSjhoZnpwZnl5Tm1JZDFRWG9wOVNRaHpoRVhNUFZZM1hwYkc4QlA4?=
 =?utf-8?B?MUlFWmJGUjZuOGRtYzIyUWphODhRVGp1YVQyVEtZSkZTazV0YU1pbGt6cXZR?=
 =?utf-8?B?cFF1ekhLNU1NUGxSem5ycm94MG1ERXlMTGRtV0xGUUpKdUYwRFVvTEorZWd5?=
 =?utf-8?B?bVByWjdvL1A2TFVMVUtmWG9mV2RrNExoakFMc1piT280eEVibnovOERlT0R6?=
 =?utf-8?B?OU9JTnRlQjJyRm80Qi9ydTRkK2FhSi95QklSL0RnTHY0Y2d2cHpEem1hbkZv?=
 =?utf-8?B?YWlUckNPVE5hZUQvb0d4ZHlVekI3OVVwSGlvOUpPNEUyY0NDRDhrdkZPTmdD?=
 =?utf-8?B?VmhhdmlQR1hkbFVQV0tETjl0elEyeFZLVVNVNEdaUEpWN2Q4d0JsMHcwTXZq?=
 =?utf-8?B?MFF3OW1NeWhpRnJZa1lKU1BtTzQwOTZoMlV0NkRraWl1UGdHS3hkN2RXdkk5?=
 =?utf-8?B?b1lUMnp0eWEzU0k1cGh6UDBGUG1YUzNHeTFUa2N4dEZRdTBwdC8vbUZlb1da?=
 =?utf-8?B?SWJxeENFMGFiVW5odkRNTjhtRld4cXA3TXFyYjFIRmVvck1ZWU5qWVNDcCtj?=
 =?utf-8?B?eEJlRE42OEdYVEt1dGY5OU4zRGRrK1o0UCsxa1BZOHh2N0lIeTBxSlV4NVVP?=
 =?utf-8?B?S2dOcTRQTUVyQmNrVmtXZzgyNkRWNjRwZ090ZkxETjgvRGdUMnNnS29kdFd2?=
 =?utf-8?B?ZVFSVWd2amtWd2REUGJqQkdhaHRLdG9tM2QwN0FBbURwcnhFZFhVT0t4QUNX?=
 =?utf-8?B?OWFDYUpBTzRCazJaV3o3djRjaURQaGNqaGZ6MjVheU13dHFEL3hjM3ZoYkVL?=
 =?utf-8?B?aXVWY2R2bVFrb0doVlhTS1FxYUUydFEzUk0zOHBFSE1iV2xWWWZSeUtEcmFj?=
 =?utf-8?B?czVhaHg2amdXSko2cHVCckNrV3Z4TWZ5bG12bmVML3QrdzltK0hobE0rOE1R?=
 =?utf-8?B?TDFYWDBHSTNRWmZyN1FMc3o4WWVUaEUzN1JKRlBlVnlnSW5HcXZ5RjJuT3NO?=
 =?utf-8?B?aGpKUE1PSUNrZ256UU5GVFNMYmdSaEplcFlzY3VpanFmdVRGKzVQaE5JY0c5?=
 =?utf-8?B?YzdKcWdoV3lYNEtoMHZ1NEJCclVWTXc0NVlKaFl2R1orU0h3cUNRVkM5RkxW?=
 =?utf-8?B?YzBCdUFIWnhmR1VFS1JmYzIrSDZEL2lOQS95VTNCelkxZkdDaWNwVmNSZENV?=
 =?utf-8?B?N2pLL0dlMjRMSkw1b21mYWxydzZxekphSkVtWnZEakg4MmxkWDJCeUI5eXhR?=
 =?utf-8?B?U2tJelN1N3Q4QzRzaUhxZDNhVUI2dVRSN2FMTlh5VG1LMW8zUThlclFHT1ZU?=
 =?utf-8?B?cFZQcEFzd3FyZElIbE12azZjZ1E2UE9tUE9Ic1NxUHdvQ213Z2owbGNJcFNa?=
 =?utf-8?B?T3NkNXR5ZGMxWVd4NU9VNStPeFdrQkk2d1FiNGhRWU43bWxhSVliNU1aTkJZ?=
 =?utf-8?B?Q3BuTUVNUmRBM0pNQTN5K0JjRWNKdFJqNW5PdUg4U1Rtbnc5YVVMMk9HTmZI?=
 =?utf-8?B?RlBYa1VucnZRd3VhbHJiSFZpQlVQQTdyZEt4b2E3TDEzdXE2WjFGclY4WGhT?=
 =?utf-8?B?VDgrZzZSZ2I0T3puQnZkbUc1bVpDSCtITm1RQ2ZGY3hZMVZ5b04ybGZ2bnk5?=
 =?utf-8?Q?7XUnloQtp5Qa8vkJV08aNCR6hzj3H4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 10:34:41.3283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3c1fbf-13c9-4c56-c814-08dd8e1bf0fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7725

On 5/8/25 04:32, Roger Pau Monné wrote:
> On Wed, May 07, 2025 at 05:17:58PM -0400, Stewart Hildebrand wrote:
>> On 5/7/25 13:44, Roger Pau Monné wrote:
>>> On Wed, May 07, 2025 at 09:38:51AM -0400, Stewart Hildebrand wrote:
>>>> On 5/7/25 03:44, Roger Pau Monné wrote:
>>>>> On Tue, May 06, 2025 at 11:05:13PM -0400, Stewart Hildebrand wrote:
>>>>>> On 5/6/25 07:16, Roger Pau Monné wrote:
>>>>>>> On Fri, Apr 18, 2025 at 02:58:37PM -0400, Stewart Hildebrand wrote:
>>>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>>>>  static int vpci_register_cmp(const struct vpci_register *r1,
>>>>>>>>                               const struct vpci_register *r2)
>>>>>>>>  {
>>>>>>>> @@ -438,7 +473,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>>>>>>>>      const struct pci_dev *pdev;
>>>>>>>>      const struct vpci_register *r;
>>>>>>>>      unsigned int data_offset = 0;
>>>>>>>> -    uint32_t data = ~(uint32_t)0;
>>>>>>>> +    uint32_t data = 0xffffffffU >> (32 - 8 * size);
>>>>>>>
>>>>>>> This seems kind of unrelated to the rest of the code in the patch,
>>>>>>> why is this needed?  Isn't it always fine to return all ones, and let
>>>>>>> the caller truncate to the required size?
>>>>>>>
>>>>>>> Otherwise the code in vpci_read_hw() also needs to be adjusted.
>>>>>>
>>>>>> On Arm, since 9a5e22b64266 ("xen/arm: check read handler behavior") we
>>>>>> assert that the read handlers don't set any bits above the access size.
>>>>>
>>>>> I see.  That kind of diverges from x86 behavior, that AFAICT (see
>>>>> memcpy() at tail of hvmemul_do_io()) instead truncates the memcpy to
>>>>> the size of the access.
>>>>>
>>>>> Maybe it would be better to instead of asserting just truncate the
>>>>> returned value to the given size, as that would allow to just return
>>>>> ~0 from handlers without having to care about the specific access
>>>>> size.
>>>>
>>>> The impression I get from [0] is that that on Arm, there's no benefit to
>>>> performing truncation in xen/arch/arm/io.c. Doing so would needlessly
>>>> affect other Arm internal read handlers (e.g. vGIC).
>>>
>>> But isn't this truncation desirable in order to avoid possibly setting
>>> bits outside of the access size?
>>
>> On Arm we expect the read handlers to have the bits above the access
>> size zeroed. If a read handler sets bits above the access size, it could
>> indicate a bug in the read handler. As a reminder, this was already
>> discussed at [0] and a patch was already committed 9a5e22b64266
>> ("xen/arm: check read handler behavior"). Perhaps we could both keep the
>> ASSERT (for debug builds) and perform truncation (for release builds) in
>> xen/arch/arm/io.c:handle_read(), but that's patch for another day.
>>
>> [0] https://lore.kernel.org/xen-devel/20240522225927.77398-1-stewart.hildebrand@amd.com/T/#t
> 
> Oh, I see.  I already expressed concerns on that thread about forcing
> the truncation to be done by handler implementations vs truncating in
> a generic place ahead of propagating to the registers.
> 
> My main concern is when returning ~0, as it seems cumbersome to have
> to truncate that, and I think we do blindly return ~0 on more than one
> x86 IO handler.
> 
>>>> For vPCI
>>>> specifically, however, we could potentially perform truncation in
>>>> xen/arch/arm/vpci.c. So I guess it's a question of whether we want to
>>>> give special treatment to vPCI compared to all other read handlers on
>>>> Arm?
>>>
>>> I would think doing the truncation uniformly for all reads would be
>>> better, as we then ensure the value propagated to the registers always
>>> matches the access size?
>>>
>>> I'm not expert on ARM, but it seems cumbersome to force this to all
>>> internal handlers, instead of just truncating the value in a single
>>> place.
>>
>> To move this forward, I suggest performing this truncation in
>> xen/arch/arm/vpci.c:vpci_mmio_read(). This will be a single place to
>> perform truncation for Arm vPCI, and will not affect other Arm internal
>> mmio handlers.
> 
> You already have the mask there, so it should be easy to do:
> 
> *r = data & invalid;
> 
> To truncate the value.  Could you send that as a separate patch with a
> Fixes tag?

Yes, will do

