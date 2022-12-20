Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D326523A2
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 16:25:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467139.726155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7eU0-0007dB-H0; Tue, 20 Dec 2022 15:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467139.726155; Tue, 20 Dec 2022 15:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7eU0-0007am-ED; Tue, 20 Dec 2022 15:24:44 +0000
Received: by outflank-mailman (input) for mailman id 467139;
 Tue, 20 Dec 2022 15:24:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gzLQ=4S=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p7eTy-0007ag-DY
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 15:24:42 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b2c4e2a-807a-11ed-91b6-6bf2151ebd3b;
 Tue, 20 Dec 2022 16:24:40 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4339.namprd12.prod.outlook.com (2603:10b6:5:2af::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 15:24:37 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 15:24:37 +0000
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
X-Inumbo-ID: 6b2c4e2a-807a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9V+UbulkWl5D1D6zVUEBbsiiYnxt8CAYq6CGv2UFySMcALX5K1zA9M3F6BqryY6urI7cPnMLjyxMYsFQvRn8XQZAmHL4N5Uxi/OVNPCUBW1hIaCAJXrEPr6oCFYWptczU69/pwVf6Z7Xz+N8rC0hXkdNXIN+Ob6Bw9Vt6NyPfvZrPTfDLUA9XnojdfcZ+khMYQNQ8GicCxZNd+mbUvfUOiZMV9sKiru4X2gB1YKoQGJuLm8qQLUyk94BFKfkKsgppPK7ObaTv5YQ9p33pEysXhZwUV1Jm/k4G09VB2+dOdd9V84A/gF3mpjIuG+zvoNibWcgb+3euGiyriXwu11dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BDJiP5lCiYytCNOS9NI6P5NRlXISJc7MLzheQYU9M4=;
 b=Yt7mKaFx3OCqnEuQaQx6U/Hf2TnY7MJQ+idzWCbbocxtZyp2yfIS3U6hgq3H9aTmE5KYRshhAOom7gunz7r59jMazGfA3Jk9YFNfyQUObbpT0zkxJBJdnty8B3WRy5AVluV8+pDtya2UyleI7t992M2S+kG06GYGIs1tAM6HYNmitFgI5XzEZmsUU8Y0CFrpFK36ptYS2QQg4g/lU8k2FULfFRr+5txsw0vMLfA2EobMvKLPw7QHFBmB/WF9K2ZRtV5UXujVDeCawOghsPlFEAlWdKYoZIifiP8Ahk6q4xFXodATcMlO/l5HTLQqqpbF/nsraRNk9YTmT+qCGuQWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BDJiP5lCiYytCNOS9NI6P5NRlXISJc7MLzheQYU9M4=;
 b=Ryxcu3LMW/PfsLik6viHiM3fmCce1OuLV/FiNx4TxJO0r+xY2OHWQj1HIJTxZ51u2vrdoJgtBT/muWXjNWrL5+t7X6+LBHAszkIeJ5t6mNDnn7HqWAoXc6twPuxBYRP2p7nkGaTE/JfXq48OlduAgpK+7yksUZyRuctHRc3GoAw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <41b5c4f5-aa95-5dec-55c8-4e1f1654f8a1@amd.com>
Date: Tue, 20 Dec 2022 15:24:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v1 8/9] xen/arm: Other adaptations required to support 32bit
 paddr
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-9-ayan.kumar.halder@amd.com>
 <45f897bc-3700-d3f0-4f4b-43598c0b8560@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <45f897bc-3700-d3f0-4f4b-43598c0b8560@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::16) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4339:EE_
X-MS-Office365-Filtering-Correlation-Id: d715a433-6505-42ce-6cea-08dae29e4e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8LekT7mysQra1X9Qt2/U5OV1EI5KxzSEcZHVgjOpP8SwHK9otgSe/LLxTk8LQ1P/wwkzcMzIyyittrdIcHWps7IDzS6ZHHWshHr/xrMGIvpHsczQs69nUpcwa3tPlNHYFGZ2UfOKnmC9Ad4Jy2FLv/sc4OwZLqyEe4dJI/RSvfIBYQuySKsjblof3wMFZdq8QdwTnaXLUPTGGbEsl8oGsLofcRpxUr4hHWPxL9es3V4W9CrBkZ2Uvsjles4dv5hDtaZFTG0klNhUyYjDWRns3dc/5TEA15BMGeEn9/W00750hJpJS7Jmz0xWyIkPbrOqv2sjPbOJRLAWZQKAF0ep0X7LaIVhC+Hj98XlBH7rqQjLaRRb9ADBZ88wHE0qe+R5CtjB6P+bu7pWKaRheFnM19ATnD6ierVNamUwlck8beiW+x72mr2K4eOWTt8QjKnk2sRj8cSF7Dl4PZh+4DhAXLFNC4kO62vJSNwzdO9lfw6OLHxV6oPVND9Z4lZAJohrpxJz4YW4648gFEmy63UKpGlqq0N6582lGpSWVZNkZjc5KG7KcS/t4E2fm1mOQ2mUr8t6D8zf9EkIzBXj0MkL6Ai/GSQEIqonqVRuFk0S744qZHPDSk75WGulcAZYl9/TsnPvtFMvzixMEZGyu26Xveq55puJVUQEEZ6ItknHWdEpHpc8pUIzdSNlyajNgz+ja4A2ZxXEit5Q8IpJUijo+uwpmYaZJjtDe34OM1wMDW8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199015)(6506007)(53546011)(478600001)(2906002)(6486002)(31686004)(26005)(186003)(6512007)(6666004)(66946007)(316002)(110136005)(36756003)(66556008)(66476007)(2616005)(4326008)(8676002)(41300700001)(8936002)(5660300002)(83380400001)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmMxMDlMeGtxNmE5RVk0aDc0TDVpM1RKdU41UGRZLzlFeEMzdU5WSERWM3h3?=
 =?utf-8?B?d3JqdDNkd1NUbVhiWS95cjhSY09HTGNUd2FzcHRaRUVXQVhQSm0vNHpmUzhT?=
 =?utf-8?B?WGwzWm9pejlGNS9xY1djN1FTYnFtL1I0UzlrZ3N6ZjRYQ3U4cHNidXQ3V091?=
 =?utf-8?B?ZlUyVUxsN1o4cURjdkVyT09KVC9TT29xK0NuS21KbjhtM2ozZUcvYUhSMUt2?=
 =?utf-8?B?TmR0NjRHRzl3bWx2K3FQcC9WQVJkT3NCcGFvekVKeGlQbXpLVTI0UGtvNWhn?=
 =?utf-8?B?ZzRBQlRhMEtEL08yUzk4dVQrelpEOGozR1VENzYyZzVrZzFJelo4TzRMeGtQ?=
 =?utf-8?B?RnpQSGFmV0R0TmZ3di9Hd1dJWkVRUzVib3BsMUlUZzk3dXBoQy9CV0VveFVD?=
 =?utf-8?B?UlJxTXgvb1VoWStHU2hoQTJ3SXRGSnUvYllKRzhjVCtPbEtGZEtHcEY2TjJq?=
 =?utf-8?B?clVVRFpVQzlGa2o0U3A1UnZ1bTZYcGRUdlcybndqMFF4RWlUek5iWXFjeC9Y?=
 =?utf-8?B?SkZybVVLVWlnRzB0c1VxTkdjTzc3Q1ZId3J0WVg2SHRtTHNSZmZuY1BzeTZF?=
 =?utf-8?B?QjdoSU1hTitnWHJNSllPRUx5L3RrOVZ6VFE5M0kxeno2anpza3JoTWs1S2N3?=
 =?utf-8?B?WlhNbGUraGNuVmpMZDRZaTVIVmVkR3JHaE5pVmd3ZkRJbHFnOUFrcjdqaG9O?=
 =?utf-8?B?bFhuZFhQZWNvQmZOUGJndzZCbTFKT2lKcW5jVE91M1RxZ0QvdGx5SzBWbk5s?=
 =?utf-8?B?QWNsY21pQ1l6VlVoM0VNaVIzbmNZamw4M2V1Y1hROTRHSFJBZnFTZ0xlMVl4?=
 =?utf-8?B?cHZFQ0hyZjZDZ1MzK0RvU2h0RUpvM1lDYWVWdkU2OTR6a1AzTkQ1STJobzdU?=
 =?utf-8?B?M0JzL2V1ejYzbllmQUNNazN5RVEyb2duWmprcG5wTTgvZ2NKTHFVUHczUFBi?=
 =?utf-8?B?djFyVWVqQnBJQzQvVThld0VsVWNxaVowak5XMkR4NnRvNEVsZFI0bFYwVVpu?=
 =?utf-8?B?ME9Tc2pwaEtRYUszblVkR2dEZTRuQ1FBQ1hXQ2ZNdzJOV1RlQU9EenhqQ0p1?=
 =?utf-8?B?Ym5tSk94bFZjUG9seUFtV2MwY01tWE52UllTQWV4STlTL05OaUZkWlZsOTdL?=
 =?utf-8?B?ZEJCOFFJUjZPQW00YThYMXhzbW5aQUNPWmM0RVZ2SDVVNDJ3M2FwaWdNRUth?=
 =?utf-8?B?blp6MGdWeHF6cUNoSnkyM0E1dk85Nzh5T0tMdEtXQmE5ZXJGQlpJM0pJSTRv?=
 =?utf-8?B?WDc4ZlozU25yWGlYWVY1VmFac213MGIvR3hKc2VNc3VSZnBxNnRSS2JkQmd5?=
 =?utf-8?B?NWx2RlUvVHg2dXU3UXk5UExmczJQWGRlamJuVkFPNFdjY1dNNFI2M0RhNXZx?=
 =?utf-8?B?b3J1ZmExWEt0Q25lUFovSENvcEhUOXNvTHFIU2lheUwrMXliNnBZWVZiSmlx?=
 =?utf-8?B?YVZCbitQS2o2Z2N0eDZ0VFMyUEI5UElLd25XQlA4RU1UU0U3SC81bmNmNFYz?=
 =?utf-8?B?aUpzeUR6TXFBbFdiT28vZFZvdlgwTnU0OHdiSENQeUdMbWdFeFQ4K0I3MnE2?=
 =?utf-8?B?Qk05emljalBITUI5REZ2VDJyOFkwNkZJQWNZQWs2S3g2Wkc1R1J3bEEvZUdS?=
 =?utf-8?B?QWlQOHg5RzNqUlNvZ2NHZjczbWtqS0o4S3N1d2Qrcy9rdGtxVExqRW5Xdzdn?=
 =?utf-8?B?ZlFZRmwrQmdjZVBYS08weGRoT1l3NEhMTUZaRGVLNUUxclc2ZUdwTWk2eVN2?=
 =?utf-8?B?WXE1SFRnYThERnpXTS9iZWowREozTGFoV09KdEFTWWcrek1TT0pNU0lWRi9i?=
 =?utf-8?B?Z0gvUUtsR2wzdzczOVFKMVl4TUdISjBCREQwblIxWUhqVGRmZzFQaWw0QUxW?=
 =?utf-8?B?ckU0cDQ4SnQzYjF0QTZLMm1lcjdkdlE5M0RuWjMwR3BvOTBVb2ErZVRlVUtP?=
 =?utf-8?B?UU1ZSm9qZUlhWWRJeUtaVlVUcEdKTDlyZTkzdmN1YkdhYXlJTkJRQ1IwYjlK?=
 =?utf-8?B?a2NhRG44RlZNMm9HbTBCU08vRXN3cDJHOGNQVmdXTFJINGczN1BiMUl0TGNM?=
 =?utf-8?B?bFJpeHVycjNjYkpFbFQ2V25rYmg3elNLcmVyVE1rSnE4a3IxYTNFdGtTcmZz?=
 =?utf-8?Q?WlAl1NMq1tqGqEr8fH1LXPcQ0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d715a433-6505-42ce-6cea-08dae29e4e3a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 15:24:37.3539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ennVs6jxDzcpb0qFDicLtLEWN+a39s+wL9WluIxvrTkHrRpUrGe6NWA4QbBw17dVgGUC3kKmxAHTRu8teVv+Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4339


On 16/12/2022 10:23, Julien Grall wrote:
> Hi,
Hi Julien,
>
> Each adaptations are distinct, so I would prefer if they are in in 
> separate patch.
>
> This will also make clear which components you touched because I would 
> be surprised if this is really the only place where we need 
> adaptation. Maybe that's because you didn't compile everything (which 
> is fine).
>
> On 15/12/2022 19:32, Ayan Kumar Halder wrote:
>> 1. Supersections are supported only for paddr greater than 32 bits.
>
> Two questions:
>  * Can you outline why we can't keep the code around?

For PA_32, the following bitoperation will overflow :-

             *ipa |= (paddr_t)(pte.supersec.extbase1) << 
L1DESC_SUPERSECTION_EXT_BASE1_SHIFT;
             *ipa |= (paddr_t)(pte.supersec.extbase2) << 
L1DESC_SUPERSECTION_EXT_BASE2_SHIFT;

Also, pte.supersec.extbase1 and pte.supersec.extbase2 are not valid for 
PA_32. Refer xen/arch/arm/include/asm/short-desc.h

unsigned int extbase2:4;    /* Extended base address, PA[39:36] */

unsigned int extbase1:4;    /* Extended base address, PA[35:32] */

>  * Can you give a pointer to the Arm Arm that says supersection is not 
> supported?

I could not find any sentence in Arm Arm which says supersection is 
**not** supported on 32 bit PA.

However,

Refer"ARM DDI 0487I.a ID081822", G5.4 "The VMSAv8-32 Short-descriptor 
translation table format", G5-9163

"Support for Supersections is **optional**, except that an 
implementation that supports more than 32 bits of PA must also support 
Supersections to provide access to the entire PA space."

Also, G5.1.3 "Address spaces in VMSAv8-32", G5-9149

"AArch32 defines two translation table formats. The Long-descriptor 
format gives access to the full 40-bit IPA or PA space at a granularity 
of 4KB. The Short-descriptor format:
    Gives access to a 32-bit PA space at 4KB granularity.
    Gives access to a 40-bit PA space, but only at 16MB granularity, by 
the use of Supersections."

from the above 2 snippets, I inferred that supersections are only 
supported for PAs greater than 32 bits.
I could not find any evidence of supersections supported for 32 bit PA.

- Ayan

>
>> 2. Use 0 wherever physical addresses are right shifted for 32 bit > 
>> 3. Use PRIx64 to print u64
> It would be good to explain that the current use was buggy because we 
> are printing a PTE and not a physical address.
>
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/guest_walk.c          | 2 ++
>>   xen/arch/arm/mm.c                  | 2 +-
>>   xen/drivers/passthrough/arm/smmu.c | 5 +++++
>>   3 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
>> index 43d3215304..4384068285 100644
>> --- a/xen/arch/arm/guest_walk.c
>> +++ b/xen/arch/arm/guest_walk.c
>> @@ -149,6 +149,7 @@ static bool guest_walk_sd(const struct vcpu *v,
>>               mask = (1ULL << L1DESC_SECTION_SHIFT) - 1;
>>               *ipa = ((paddr_t)pte.sec.base << L1DESC_SECTION_SHIFT) 
>> | (gva & mask);
>>           }
>> +#ifndef CONFIG_ARM_PA_32
>
> A "malicious" guest can still set that bit. So now, you will return 
> from guest_walk_sd() with 'ipa' not set at all.
>
> If this is effectively not supported, then we should return 'false' 
> rather than claiming the translation was successful.
>
>>           else /* Supersection */
>>           {
>>               mask = (1ULL << L1DESC_SUPERSECTION_SHIFT) - 1;
>> @@ -157,6 +158,7 @@ static bool guest_walk_sd(const struct vcpu *v,
>>               *ipa |= (paddr_t)(pte.supersec.extbase1) << 
>> L1DESC_SUPERSECTION_EXT_BASE1_SHIFT;
>>               *ipa |= (paddr_t)(pte.supersec.extbase2) << 
>> L1DESC_SUPERSECTION_EXT_BASE2_SHIFT;
>>           }
>> +#endif
>>             /* Set permissions so that the caller can check the flags 
>> by herself. */
>>           if ( !pte.sec.ro )
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index be939fb106..3bc9894008 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -229,7 +229,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>>             pte = mapping[offsets[level]];
>>   -        printk("%s[0x%03x] = 0x%"PRIpaddr"\n",
>> +        printk("%s[0x%03x] = 0x%"PRIx64"\n",
>>                  level_strs[level], offsets[level], pte.bits);
>>             if ( level == 3 || !pte.walk.valid || !pte.walk.table )
>> diff --git a/xen/drivers/passthrough/arm/smmu.c 
>> b/xen/drivers/passthrough/arm/smmu.c
>> index 5ae180a4cc..522a478ccf 100644
>> --- a/xen/drivers/passthrough/arm/smmu.c
>> +++ b/xen/drivers/passthrough/arm/smmu.c
>> @@ -1184,7 +1184,12 @@ static void arm_smmu_init_context_bank(struct 
>> arm_smmu_domain *smmu_domain)
>>         reg = (p2maddr & ((1ULL << 32) - 1));
>>       writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_LO);
>> +
>> +#ifndef CONFIG_ARM_PA_32
>>       reg = (p2maddr >> 32);
>> +#else
>> +    reg = 0;
>> +#endif
>
> I think it would be better if we implement writeq(). This will also 
> avoid the now strange ((1ULL << 32) - 1) when p2maddr is a paddr_t.
>
>>       if (stage1)
>>           reg |= ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_ASID_SHIFT;
>>       writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_HI);
>
> Cheers,
>

