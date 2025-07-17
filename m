Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726C6B0923F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 18:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047158.1417597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucRqL-00089v-EV; Thu, 17 Jul 2025 16:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047158.1417597; Thu, 17 Jul 2025 16:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucRqL-00087B-Ay; Thu, 17 Jul 2025 16:52:25 +0000
Received: by outflank-mailman (input) for mailman id 1047158;
 Thu, 17 Jul 2025 16:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=68ni=Z6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ucRqJ-000875-Gf
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 16:52:23 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20620.outbound.protection.outlook.com
 [2a01:111:f403:2415::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6781d7de-632e-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 18:52:21 +0200 (CEST)
Received: from SJ0P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::34)
 by MW4PR12MB6998.namprd12.prod.outlook.com (2603:10b6:303:20a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.36; Thu, 17 Jul
 2025 16:52:17 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:41b:cafe::d5) by SJ0P220CA0003.outlook.office365.com
 (2603:10b6:a03:41b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via Frontend Transport; Thu,
 17 Jul 2025 16:52:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 16:52:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 11:52:10 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Jul 2025 11:52:09 -0500
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
X-Inumbo-ID: 6781d7de-632e-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laxLMABEbrO6miA7DeYzDoP554xnAhyz0k1Rj5nTS479TS0yW3zY8rvsczjl2PdS14HeoWWpCYvK94MxsZoepwnHIpz6fMm0D+uSK2NFoo+gU7PX0XK2J5fi2Z4h3PedEcyR9+jcNO/6orMJFMXjkoQIpVw6OSzTvBCFtn45T33WfAlEj7AmqxCKuEGGSPTvryGdBWUsXFmJ2ul1U5YSZhZZCxlsLM77bK2c7cb/GP1AuJIjYIm1lmjVrrUk41VXJi0ThnwQbLMuTMm/p7h5LNO3vKFH6U9AwavnUzacgFbzgHLzVa+apyvFa0nphluI96egJHQ9G+WiLzU0JKAjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bi3BuegjuyGqGBu46oGSNwqeeW1iII/8AGVYTkEWrhM=;
 b=npLB0xuDpcKFvnaO4txhR0A1GojrLLWqnvo8omqgBkLhNQHjCGJ70u2AughVIidzgJd9s81jLgFFEOO5L/g0j6LNizl2OGZ7/ZWTcee7cMhnCIOwiTAofZlihV/OReHStX4icNUlscjdc9Bq9yY8T2ekTbx74418Nr0ox+k3TPlti4IMy+NAG/oMiNkA5/lHmZ3dzVt+blbvNVSpUFncGEzQCifTBA6Ows+OS2qL0G+P6I3bQYzyTbk3Ln2tzEKkn2yzq9GTubnSj7ANG2fJkJz36GbX4o0jSKlWx2vr1lRB96/sdwgZseqfEY0qFuFzILw0RgTENP8vRVVb7Rtdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bi3BuegjuyGqGBu46oGSNwqeeW1iII/8AGVYTkEWrhM=;
 b=EDlHfv7SghMEnCRr13a0iz/miP/zP2vWW5TEDEJYqs/FvG3TmRCLmjEqknGBaJEB+DAW+rDEgzEoZolj3+8FXlBsbO74CYVhQ/BFgB+/VFFPN0pD8hwYHZQRE5Z+9RaFPYcwdPk292PYGVcXhFBbGJ7iSoYhKFnBVU+NIxHqPx4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e6aec41b-4578-4d4e-9965-0082a39c796c@amd.com>
Date: Thu, 17 Jul 2025 12:52:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: fix arm_iommu_map_page after f9f6b22ab
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Rahul Singh" <rahul.singh@arm.com>, <jason.andryuk@amd.com>
References: <alpine.DEB.2.22.394.2507101724180.605088@ubuntu-linux-20-04-desktop>
 <d62f045d-86ae-4ef8-bee5-225b8fa6594d@xen.org>
 <e3a03602-656e-4efb-b9b6-3a6d33781ca0@amd.com>
 <b17f56d8-9021-4220-8c39-8c073fe5e281@xen.org>
 <2e2f3a53-15a9-439d-af57-1fdf881b7e8b@amd.com>
 <be21ce7b-4d9f-4a8a-b96c-6c0eb76bf9cf@xen.org>
 <5cc13cbf-bb66-42e1-8b20-604b282fdfa4@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <5cc13cbf-bb66-42e1-8b20-604b282fdfa4@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|MW4PR12MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: d184d8a6-05af-4ecb-4b9d-08ddc552491e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ni9xTEMrK2JsU1I4UStHUFh2dmc5QkFQZlArZVV4VDYzSU9pTGt4WFNFTm5p?=
 =?utf-8?B?QUV2OFZIRzZqSHRyUmlzUWgvOTNPdjNzTFJ3Q1dzWmM2SUgrNEdrYmdjS1cr?=
 =?utf-8?B?emF6cWx6UGlmbVJoMVA5TkxvYjh1MHJOdW9VMkpxN3N3VXo1QU9pQkd0N3Ji?=
 =?utf-8?B?c2tUNElLckdtZ045SXdwTlZZZmpnWVdkNzk4dHJHYyt0bFNxZlhLVVZIeHZU?=
 =?utf-8?B?cURMQlg5ejdaM2VQN25uNjltNEM2OU1zOGdnQkpXYUZTcHhDM2xUYkRNMkli?=
 =?utf-8?B?MDJVOVZVWmRaVEJ4ZVF4dGRsWmowYm5yaW15UnpuWVZxazFsdzMwMDMzZFI2?=
 =?utf-8?B?MzdYczJxaGJ4aGoxN2h2SXFjamdGWWU2ZVN0RW8wdkhHTU8xdGN3a0FvNlB2?=
 =?utf-8?B?SmhYczVMeExiRnRDbEVkbDg4bG01UjRXdlVBREcycWJMdXJrcXRhVXRuVjRX?=
 =?utf-8?B?YTlyRVFRMXVYbGEvTEdxYWdVYVZkOXRTSEpxRCtXZzFISENGTmthOTluNHpz?=
 =?utf-8?B?d1NZWkoxM09rd0VyTHRmeS9ob2dRNU1CemxXUHpjUkY3cmo1NkhPZXd5ejlj?=
 =?utf-8?B?SjhTNmpTbWdlbktSRHBxc3F5eHh2V2I3cXoyc2dCaGc5QXZ3eVhsSWlKb3V1?=
 =?utf-8?B?WDRJSkloeklSeEJtL1ZHU250MWtpY0t4T0JJcHlxdExrbUdiUi9oVEp6Q2xR?=
 =?utf-8?B?eVo1R2VucVNPNzVuNTZqck80UDlrVENDSWtvZ0NzVmsxWk8zUzltTnJGa2Vm?=
 =?utf-8?B?OGx3Y0tnNVBwaWRoUTAvM1lGUStNbCtQRUs1ckRJd1JGRmVVS0F0MTFDczMv?=
 =?utf-8?B?SmJtb2pZRm5ESlhTb3JLWlUyZXZMV3hDcm41UmRId1hUK1RpNlZZdUw0emla?=
 =?utf-8?B?aFM3YW5TVHBpRVQxNkVyQ2pud1JyUUVPKzA3a01xcVRNbHR1K3g3bDdhZ0lR?=
 =?utf-8?B?NnpXSDZkU3dwT054dmpvcGdwRVV4YVNLZmhZT3lRVnZEdkY3ODZNdnRUWmI4?=
 =?utf-8?B?eU5LVTJaWnl4OFJzdGFlTzV4d0xOb1NPbkxLTm5HZ29lTWEwaE1OS1pLWXBD?=
 =?utf-8?B?T2RKbWMzSmRtRloySFBXeHpZdW4yb2M0TE1LcDlPMzQxKzB0Ny83ZUw0Wi9J?=
 =?utf-8?B?OXFJTkdvODZmTnMxVHVIY0NxM2pCTFQycWFXTEViUHp2TnV1bXNRa0IxTUNP?=
 =?utf-8?B?QTNjbFFnMTVmaEQrZ1cvQTczallRVjlrOXhnZFFocXJKNU9lQWN2TzkrT0E1?=
 =?utf-8?B?SThYTTA0U2liT1NBMTFzUXo2bXMzUnNSQ2FVNERsVysrUnd2cEowTnBFa1Y0?=
 =?utf-8?B?b0hWSUFubDQ0alNqQ24xS21KL256bkRBb3pjVmlyWFYyamcyd1BEWHhLQndP?=
 =?utf-8?B?SmpKTUJOa09aMVo2dk5zZVZ1VkdxQWsvYTZOTExBTTFpRWVhczBJenVYYUNx?=
 =?utf-8?B?Y2haWXh6QVBoUWc3am81d1V4Z0g2QXZ3VXFWa2wrcWVjMVVLc1RHa0QwbTNz?=
 =?utf-8?B?SmZFQUxFUTh6d29SbDRReWl4a3czakI5aVlWTTVKSlNrRDhRd1llS2plZkhz?=
 =?utf-8?B?TFkzMWdNVnlMdVlPNERiTjVlZUZzaHdrUmYzRWVxUVorRXk0azBCOXA3em8y?=
 =?utf-8?B?cG5vRTFTZk40Rzg5TzRDNzg1ZEo0OEkyRzBEV25UcWsrYlBwTFBnQmxuTnVs?=
 =?utf-8?B?eG5kRnY5dnJZY1BBS1RMS20rWGxpTDNlQzJkZGhVQ2kwa24zaENERTdkTG05?=
 =?utf-8?B?cnhNa3dYSzh5ditiZTZVaFo0ZkNvMXBxY3dqZkp4K0RSOE9WWWt1Y290YW55?=
 =?utf-8?B?OSs0NkZsWFJHMmZqZ3RrK0xzbjJTWXg0UXVMTG1UTXZFbHdpYmU3dzVSK2hG?=
 =?utf-8?B?MmpwOHU4Z1k4V3hvOFhtTXlubTNzMzZuQkZ5eVZoTGJjUlpoZ1MrbncxWm9i?=
 =?utf-8?B?dk4zK0VYOG5QaU9yemZ1dGdrNE40M3Z1dzJWV2k1OGswNG5zT3JXYmUxNkpu?=
 =?utf-8?B?QW9yaERpbnB1T2ZVVmNoUmZmdDVyQzVDekthRWhiU0M5aHVEbkFFWGRBZXZB?=
 =?utf-8?Q?kjS2te?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 16:52:15.9827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d184d8a6-05af-4ecb-4b9d-08ddc552491e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6998

On 7/16/25 05:59, Julien Grall wrote:
> On 16/07/2025 10:56, Julien Grall wrote:
>> On 15/07/2025 16:58, Stewart Hildebrand wrote:
>>> On 7/14/25 18:47, Julien Grall wrote:
>>>> Hi Stewards,
>>>>
>>>> On 14/07/2025 22:12, Stewart Hildebrand wrote:
>>>>> On 7/12/25 06:08, Julien Grall wrote:
>>>>>> Hi Stefano,
>>>>>>
>>>>>> On 11/07/2025 01:25, Stefano Stabellini wrote:
>>>>>>> diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/ drivers/passthrough/arm/iommu_helpers.c
>>>>>>> index 5cb1987481..dae5fc0caa 100644
>>>>>>> --- a/xen/drivers/passthrough/arm/iommu_helpers.c
>>>>>>> +++ b/xen/drivers/passthrough/arm/iommu_helpers.c
>>>>>>> @@ -36,17 +36,6 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
>>>>>>>     {
>>>>>>>         p2m_type_t t;
>>>>>>>    -    /*
>>>>>>> -     * Grant mappings can be used for DMA requests. The dev_bus_addr
>>>>>>> -     * returned by the hypercall is the MFN (not the IPA). For device
>>>>>>> -     * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
>>>>>>> -     * p2m to allow DMA request to work.
>>>>>>> -     * This is only valid when the domain is directed mapped. Hence this
>>>>>>> -     * function should only be used by gnttab code with gfn == mfn == dfn.
>>>>>>> -     */
>>>>>>> -    BUG_ON(!is_domain_direct_mapped(d));
>>>>>>> -    BUG_ON(mfn_x(mfn) != dfn_x(dfn));
>>>>>>> -
>>>>>>
>>>>>> Shouldn't arm_iommu_unmap_page() also be updated? It would not result to a crash, but we would not be able to
>>>>>> remove the mapping.
>>>>>
>>>>> f9f6b22abf1d didn't add any calls to iommu_unmap(). As this is still
>>>>> only hwdom for now, hwdom is not expected to be destroyed, so the
>>>>> mapping is not expected to be removed for now.
>>>>
>>>> I already gathered that by looking at the fixes tag in my previous answer. Maybe I should have been clearer at that point. Even though iommu_unmap() is not called today, this is meant to be the reverse of what was done by iommu_map(). So it looks very odd to update one but not the other.
>>>>
>>>> Furthermore, AFAIU, this patch is going a bit further than just fixing the bug introduced by f9f6b22abf1d. At which point, we should properly
>>>> fix it in the same patch rather than hoping that someone else will remember that this needed be updated.
>>>
>>> I'd like to suggest splitting this into two patches then, so we don't
>>> let preparation for future work get in the way of fixing the reported
>>> issue:
>>>
>>> Patch #1 to fix the reported issue with a simple
>>> s/is_domain_direct_mapped/domain_use_host_layout/ in both
>>> arm_iommu_map_page() and arm_iommu_unmap_page().
>>>
>>> Patch #2 to allow translated mappings in preparation for future work.
>>
>> This sounds good to me.
>>
>>>
>>>>>
>>>>> With that said, in the future when we expose vITS to domU, you'd be
>>>>> right. In the xlnx downstream we have something like this:
>>>>>
>>>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>>>> index ef8bd4b6ab33..2f5b79279ff9 100644
>>>>> --- a/xen/arch/arm/p2m.c
>>>>> +++ b/xen/arch/arm/p2m.c
>>>>> @@ -133,7 +133,8 @@ static inline int p2m_remove_mapping(struct domain *d,
>>>>>            mfn_t mfn_return = p2m_get_entry(p2m, gfn_add(start_gfn, i), &t, NULL,
>>>>>                                             &cur_order, NULL);
>>>>>    -        if ( p2m_is_any_ram(t) &&
>>>>> +        if ( !mfn_eq(mfn, INVALID_MFN) &&
>>>>> +             p2m_is_any_ram(t) &&
>>>>
>>>> I don't quite understand why you need to update this function. Can you clarify?
>>>
>>> Since arm_iommu_unmap_page() doesn't have the mfn, we needed a way to
>>> remove a p2m mapping without the mfn available. INVALID_MFN is a
>>> sentinel/placeholder in lieu of the missing mfn.
>>
>> Ah, I didn't spot you changed the MFN passed in guest_physmap_remove_page() below. Hmmm... The code in p2m_remove_mapping() is checking MFN to avoid any race. IIRC this is to close a race in the grant-table mapping.
>>
>> So I am a bit uncomfortable to allow bypassing the check when INVALID_MFN is passed. Looking at the code, I see the check is also gated with p2m_is_any_ram(). I would argue that none of the IOMMU mapping we are creating should be considered as RAM (the grant mapping is arguable, but definitely not the doorbell). So I think it would be better to use a different p2m type for the IOMMU mapping.
> 
> Actually, looking at the code, IOMMU mapping will use p2m_iommu_map_{rw,ro}. If I am not mistaken, neither of them are included in p2m_is_any_ram(). So I don't see why this check is needed in upstream.
> 
> Did I miss anything? Do you happen to have downstream change?

Ah, no, I think you're right. Since the p2m_is_any_ram() check does not
include p2m_iommu_map_{rw,ro}, no change to p2m_remove_mapping() should
be needed. This was an oversight in our downstream.

