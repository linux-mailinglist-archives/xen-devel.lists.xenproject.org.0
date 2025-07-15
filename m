Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50124B063A1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 17:59:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044517.1414601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubi3P-0002QN-UF; Tue, 15 Jul 2025 15:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044517.1414601; Tue, 15 Jul 2025 15:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubi3P-0002NG-QY; Tue, 15 Jul 2025 15:58:51 +0000
Received: by outflank-mailman (input) for mailman id 1044517;
 Tue, 15 Jul 2025 15:58:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+j=Z4=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ubi3O-0002NA-J8
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 15:58:50 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20612.outbound.protection.outlook.com
 [2a01:111:f403:2405::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97c12e45-6194-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 17:58:48 +0200 (CEST)
Received: from SJ0PR03CA0068.namprd03.prod.outlook.com (2603:10b6:a03:331::13)
 by DM4PR12MB6374.namprd12.prod.outlook.com (2603:10b6:8:a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Tue, 15 Jul
 2025 15:58:44 +0000
Received: from SN1PEPF00036F43.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::ad) by SJ0PR03CA0068.outlook.office365.com
 (2603:10b6:a03:331::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.33 via Frontend Transport; Tue,
 15 Jul 2025 15:58:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F43.mail.protection.outlook.com (10.167.248.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 15:58:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 10:58:42 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 15 Jul 2025 10:58:41 -0500
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
X-Inumbo-ID: 97c12e45-6194-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTRZY3Wjln8NTOXsFPbuurW2N3abcaoXp01KQf6G3yD9FbgBqgYwxSj3r9XWi7aJyuz4FrjQPpJdceewuLqj91hKdgS5AwtCDEX5VcD+cZed/GBWrYkqaAIrOHVhBm/ntTXIG9OR4uCGybx4Kwc6H7Vzn0WXUo/xnOh+Iewdj3S6AByB0xqsFz2DmVHHZ5aH6iMA7zuvjDkYcGx4zgKhinjUiROK8LAkU6O1Nl1t61ijULJx5wiG/GlB30xj+8TADoT8YRSaocOVMJ7UcSut75nScRw+zzm6VosU3sDzIrA7yjd5ZQ+dvDumULHaYyCObhe4pdAniqtRlZ7BuQ85vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uccx0Afc/D9Dk4xq98JNA5+dFfIRK0hYwXd7HIT4Gw=;
 b=x+TNJr5q1kWp8gmRCxOc3MX2YH0CqgKvW2nd2UfVIz2sm7WIarwBsxnM/vwFqpL19D+0R5/+yc/G9dzzoV8C7qjT9sqwsPyoPeig2GhXumFP3T+RuRW8GOQ1zIan7HIcBUaOKpalrrCI+9sFghKcWcV/Qb1Wq/dsD+3ItCs0U5XC91nELu/hTVqHqR2mM5uP22gUaNPg8m77hMnKl6GuaFfXd6vkikI9iparyNAiQK1uHqNjGpX7hsgP5ZNp8pKhd7Wjx3prNoRwzqCo7Q1xaRM6x0Nsalam2S/VVAa3wYZFnDtPXLSzeG2eBEOhfNqMIVPVHwk24hgnzHqi1c5uWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uccx0Afc/D9Dk4xq98JNA5+dFfIRK0hYwXd7HIT4Gw=;
 b=h+lcNHMW2WChJ2f+avY7BKJVjJYhVjA9upKoaz+nKOLvKvg1JS1SrLs2OAp9ICY3WjUFBYJzmdjSHm1cIcshq6RKuo/3zisoGNXZYVUC8+thhLA5nffd0udOf+XudbTp3y1WSV+N0FmbHc0ktTaWz0UshtgGTF7H8yFefhF3Pa8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2e2f3a53-15a9-439d-af57-1fdf881b7e8b@amd.com>
Date: Tue, 15 Jul 2025 11:58:36 -0400
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
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <b17f56d8-9021-4220-8c39-8c073fe5e281@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F43:EE_|DM4PR12MB6374:EE_
X-MS-Office365-Filtering-Correlation-Id: 163ebdd4-1b67-44be-2902-08ddc3b87967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1YrbUhZNkdaL05BNHNIdm5FNkFqYkdEYVVqejdVNFpscFU2RU11QXR4MjFR?=
 =?utf-8?B?ZWFUVUhEQnUyS255amY4UFM3c3JaOEorelVBWlc5bkd1VjRqN3piWmZ4ei9P?=
 =?utf-8?B?QXlkVVJMQTR6dDFoSDAwTHhPQUdXdmFZZEJlcVFKVW5SVVRnaGxmUThkZTB0?=
 =?utf-8?B?TUVLUHVuT3p3all0YkFmamFBc0FrNnc2UXZHTlNXU2JRYkMxSmdSWnUrZ3dl?=
 =?utf-8?B?cktlMkczUmh0dnczdkdxbXRyT1piZ3FEVldWTkJqQzJTMHROYVhlekhwbHhr?=
 =?utf-8?B?VjBCdElneU5YTDZLNUk1bFdIZXorc0NYY0FpOHB3VU13cjdCOW1hTm1uT09W?=
 =?utf-8?B?eW12d20xbkJRL0FNR00wdklVbDZabmZmdzFGd3ltdEdWVGF4VFc0b2RDMVZm?=
 =?utf-8?B?K3F3bEd6Y3l2N0hBMmdmK0xWa3JyTzlKdUMyb0hWeERKRUtsTzFzYTEzczd0?=
 =?utf-8?B?M3dPSllwSEdYRWNlTXJrZDZDZ3B0cTVCeGY0aDdyQVk2TE1ldi84ZUwvSlZu?=
 =?utf-8?B?eWk3R01ydVhKWit0R29CeTNGN01hUFdtR3JFcHFlVENZZDdWZjZscXhHZjVo?=
 =?utf-8?B?clVTN3VscmlqeXVrMUJQM3JpSlBYeHVLMTZSdTZCMjFpZVdHenphK0JFVEFr?=
 =?utf-8?B?dFQrR3h5MFNOMTVDV1p2K1NIa3ZQbnJjcWptZUwxUVVvUmo3aktFUDVicHdv?=
 =?utf-8?B?dm9YSzJ3N2tUQzhqVzk5eGNwZ1pJaStsekNBc1J3RnVMUzg3alRDZUZXZm9U?=
 =?utf-8?B?ams5OTNNZVUvajZKT1Bnb20rREN4ZUQrN1FqV21WUHdsL01DS3EzNFlOMktm?=
 =?utf-8?B?Y241V0pUVUNTbHlySEUyU2NwRVY2NGFFYmhDSFBoRDZhM0UzNzF5Yk9uQWxC?=
 =?utf-8?B?M1FsOG1jYzN1ZFQ4SkxtR2hZaVdyZkVLd25xOGxsZWFOLzg4MnU0UWZRUDYw?=
 =?utf-8?B?cUlFajl1b0FaYTRXSnh3RCtPNmwzd1hNTkNoZHJHZjNHbmxRd0lxcjI1TWZI?=
 =?utf-8?B?WWswUVA5QVBpVWF3NGxUdmRDNXk3QzZrWGlWdS9tS2VrQWphWmcwYVU2SFov?=
 =?utf-8?B?T090NlFwOUdSMXFPQ3paRkdjZUR6dEJMUWZjaUp6dXI2UExWaHg5M3VadzJ3?=
 =?utf-8?B?OFNwN3Iva3QwUDNKN0UyTjg5WTVzMzQ2a1NPNnNCbDVEbDZTNjRXZFArMkp5?=
 =?utf-8?B?c0huK3Y2a2sveXlXSFk1MnZPYXRyNGNGazNSRjNHS2wvNHZTQysrZ3BUcGdT?=
 =?utf-8?B?ZjdsckcrTlp4bkRtbnJHb2d4WXlmUXAxNEdGR0JDbXgyWnNHWVdJcUZxM2xW?=
 =?utf-8?B?Qis4ejlWeDRRMHJJNkgyM2QvWTZuQnlYZFkxMU1Rd09XWEtaaE9OMnVzdk8r?=
 =?utf-8?B?UmR3cE1MMTBNSFRDejZMcDIrN2FYWm8yQkNZT29qNGJJVkF0N20xZXhHSHMx?=
 =?utf-8?B?cm1jbVJkSStBbk9FOGI1S3I4bzVqV0JRN1p4dWJuZUpRb1hSOFJ5dDVuaWhQ?=
 =?utf-8?B?MTJNNndhL3l2SW1VU0loNGNlOVpZY3pnMkwxdHVPRVNvZ1RmL3FuRldGYVZk?=
 =?utf-8?B?cGVyVXZBVHowNjRoT1BhZjl3UERpcHlBeEVXMWgrVnppOWtPOXovOWVFQ291?=
 =?utf-8?B?VFk3MGtKTnF2N292Q0MrWnJUZEZKMERkT0Ziek5LN1A4U3IvUy9lQVF4ZzBI?=
 =?utf-8?B?QnNpSkJwa09IbHlZdmtpRHRZUHQ5UVVWSm5GemFOeXJwcWRzQlJlOG02UFFG?=
 =?utf-8?B?U1o1aUhPc0ZzM2VGYk54RXRVQmVpZ21uRlFPU3pVUFdTblh4bm5RZWgwUUg3?=
 =?utf-8?B?aVhQTkUvaHNwZmtuQ0JqSnpUbkZEampnOHNGSkpKZXVCa3IxeWcxa0VMa2J3?=
 =?utf-8?B?Sk1VNVdQZXZBOXdFSFNMbmtOY2RHSmUzY05jT1dtNCtLUmh1aWhrZktURWtn?=
 =?utf-8?B?UTJPM3lFMTdjQW1hQW1tVHdBRTRqbVNaVHAvSXMvMm0waXFCNGNJYmZDcnd6?=
 =?utf-8?B?NDI5bXZGY2RzblRhY0w5M3NCZFBQUXU2QWNoRlRDL1QrZndiTTVqNUtIU2pM?=
 =?utf-8?Q?44mL9E?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:58:43.3935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 163ebdd4-1b67-44be-2902-08ddc3b87967
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F43.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6374

On 7/14/25 18:47, Julien Grall wrote:
> Hi Stewards,
> 
> On 14/07/2025 22:12, Stewart Hildebrand wrote:
>> On 7/12/25 06:08, Julien Grall wrote:
>>> Hi Stefano,
>>>
>>> On 11/07/2025 01:25, Stefano Stabellini wrote:
>>>> diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
>>>> index 5cb1987481..dae5fc0caa 100644
>>>> --- a/xen/drivers/passthrough/arm/iommu_helpers.c
>>>> +++ b/xen/drivers/passthrough/arm/iommu_helpers.c
>>>> @@ -36,17 +36,6 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
>>>>    {
>>>>        p2m_type_t t;
>>>>   -    /*
>>>> -     * Grant mappings can be used for DMA requests. The dev_bus_addr
>>>> -     * returned by the hypercall is the MFN (not the IPA). For device
>>>> -     * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
>>>> -     * p2m to allow DMA request to work.
>>>> -     * This is only valid when the domain is directed mapped. Hence this
>>>> -     * function should only be used by gnttab code with gfn == mfn == dfn.
>>>> -     */
>>>> -    BUG_ON(!is_domain_direct_mapped(d));
>>>> -    BUG_ON(mfn_x(mfn) != dfn_x(dfn));
>>>> -
>>>
>>> Shouldn't arm_iommu_unmap_page() also be updated? It would not result to a crash, but we would not be able to
>>> remove the mapping.
>>
>> f9f6b22abf1d didn't add any calls to iommu_unmap(). As this is still
>> only hwdom for now, hwdom is not expected to be destroyed, so the
>> mapping is not expected to be removed for now.
> 
> I already gathered that by looking at the fixes tag in my previous answer. Maybe I should have been clearer at that point. Even though iommu_unmap() is not called today, this is meant to be the reverse of what was done by iommu_map(). So it looks very odd to update one but not the other.
> 
> Furthermore, AFAIU, this patch is going a bit further than just fixing the bug introduced by f9f6b22abf1d. At which point, we should properly
> fix it in the same patch rather than hoping that someone else will remember that this needed be updated.

I'd like to suggest splitting this into two patches then, so we don't
let preparation for future work get in the way of fixing the reported
issue:

Patch #1 to fix the reported issue with a simple
s/is_domain_direct_mapped/domain_use_host_layout/ in both
arm_iommu_map_page() and arm_iommu_unmap_page().

Patch #2 to allow translated mappings in preparation for future work.

>>
>> With that said, in the future when we expose vITS to domU, you'd be
>> right. In the xlnx downstream we have something like this:
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index ef8bd4b6ab33..2f5b79279ff9 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -133,7 +133,8 @@ static inline int p2m_remove_mapping(struct domain *d,
>>           mfn_t mfn_return = p2m_get_entry(p2m, gfn_add(start_gfn, i), &t, NULL,
>>                                            &cur_order, NULL);
>>   -        if ( p2m_is_any_ram(t) &&
>> +        if ( !mfn_eq(mfn, INVALID_MFN) &&
>> +             p2m_is_any_ram(t) &&
> 
> I don't quite understand why you need to update this function. Can you clarify?

Since arm_iommu_unmap_page() doesn't have the mfn, we needed a way to
remove a p2m mapping without the mfn available. INVALID_MFN is a
sentinel/placeholder in lieu of the missing mfn.

>>                (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)) )
>>           {
>>               rc = -EILSEQ;
>> diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
>> index 04b7e98e4aae..d59a9cf5a48b 100644
>> --- a/xen/drivers/passthrough/arm/iommu_helpers.c
>> +++ b/xen/drivers/passthrough/arm/iommu_helpers.c
>> @@ -63,14 +63,7 @@ int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
>>                                         unsigned int order,
>>                                         unsigned int *flush_flags)
>>   {
>> -    /*
>> -     * This function should only be used by gnttab code when the domain
>> -     * is direct mapped (i.e. gfn == mfn == dfn).
>> -     */
>> -    if ( !is_domain_direct_mapped(d) )
>> -        return -EINVAL;
>> -
>> -    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
>> +    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), INVALID_MFN,
>>                                        order);
>>   }
> 
> Cheers,
> 


