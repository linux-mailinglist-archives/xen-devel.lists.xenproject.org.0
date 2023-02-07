Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C1468DD1F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 16:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491309.760379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPQ02-0002sF-4b; Tue, 07 Feb 2023 15:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491309.760379; Tue, 07 Feb 2023 15:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPQ02-0002qK-1U; Tue, 07 Feb 2023 15:35:14 +0000
Received: by outflank-mailman (input) for mailman id 491309;
 Tue, 07 Feb 2023 15:35:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dGaM=6D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPPzz-0002jd-U0
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 15:35:12 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe59::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff86cec0-a6fc-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 16:35:08 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BL3PR12MB6644.namprd12.prod.outlook.com (2603:10b6:208:3b1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Tue, 7 Feb
 2023 15:35:03 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6064.032; Tue, 7 Feb 2023
 15:35:03 +0000
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
X-Inumbo-ID: ff86cec0-a6fc-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxRKCk+SoFxfQ4kO3zXvTjt5yhG0+CL4CJhbsC4RnEa+ZB8/+yPeJWPNSUnJvu1F/HHzpMUTYcHR+4NovWzfOi+QJXLcOO3B44ihVTTb/ArCjeoq2pvQS6SM0J/nobZuJAW6CwvGuB/61/u5Sj/7R/lPeAHLjqgmmlCyLQ71AcoMD4Mi4MDKbuZVJDd3MlBrxFDbgG7tORacEXVxKIwFk4Rd3RiSxMF59oTL4EHKcLT8/l+yWprpWQduH8b5xWpUr1R3XxH4WveIf8aDQJ3ff+v7xtqtInx92E1zuGI34nFUZWsONMon6GtrEeSuoFyAyUhbQzwfhAXt7gdqZVie6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZfXDTBW7e3Ody7K6nafRVS7FjVu2tDf+oF5XqRnlu4=;
 b=EofM/gJpxg4q1V+IBQSr4CK0tHru/VyNBcz9tkqm31/+KINjur91HqKC4fcBceaJF8+xpxJfxMavejXmRVGabqASq3ahs1xBq1/VgYPgZI9AzWEFd7aiwv6iYDQZiaMzYGk5q+4j4kyr9S7JgIawONtqcN4YM4UHdKwX4PDJ4P8m0mSzRhx9wsZOnnoOkL2YZjnp+4XeXmJzi4rz3J7zGAzpjapuyE37Gi+asvrpxomUA4tSw1m/ceVUdBM0/UKMVLszun7nKypki3fd25gsXQ2LRteLtZ05Hntvlt4kmLWIUlvUfdkfjD//6y3jcJ6ZR/1gVZOj5OK2Gg6viYVg1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZfXDTBW7e3Ody7K6nafRVS7FjVu2tDf+oF5XqRnlu4=;
 b=CmeDGs/Ylto0Z/oH2vbBVhQuaZxl9cnbXylskuUhVGj9lQeOkGiF8SeHMfiDwae3Z7fFgJ16Mq2dV21/TNn4tBfXxlMgPE6tNazlBfdidRgHV1zm0KY5fGenwT9ZolH9nomrOL4GpYUIt9xa25Lepi4hP5psOXFkjAawKkeh4yo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <eb4d4da7-0251-6efc-1311-6b236fdca6c4@amd.com>
Date: Tue, 7 Feb 2023 15:34:56 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 11/11] xen/arm: p2m: Enable support for 32bit IPA
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-12-ayan.kumar.halder@amd.com>
 <ae501ac3-af2d-c4cb-3ea9-04dd946cdc51@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ae501ac3-af2d-c4cb-3ea9-04dd946cdc51@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0254.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::18) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BL3PR12MB6644:EE_
X-MS-Office365-Filtering-Correlation-Id: 8901b209-51ce-47a3-0886-08db0920e165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q89N5UkIGR9+SS8P3IvVCMXh49Z3IxZQscrpYHGm896r6ls+7qMMJYgk8dBXNBix0l4cYHDxpbILwgwSqkWcJI+kKaNMFuuNuc+roC+BujbZHSz9V/brpWkVnTXs6a2t/AhcHavZEx/VaHDpAC9n2ijMtQnk+IWZpOxROirm8BHIqMlhwYNqfe+QdvpAH2AOWTgA9YukwGj/zQqTAvYxkBkP9OpJu78ipqeUsjb1fCqsZJrcBBlw7RGe8d2LCNfm9DPuUXB/+1E9kgfCzhaPi9jR1BPlGd4sLq+c1Mh+oydQHo5h3hf0+TzIzDa7GIS7J37+QTSOp0onM3vdfGXhRxNnv0hf9dYKAmZxwJ20j6glbgQxnq19xo1JEoBnYpe29Zds/IZIg5om5cqzCt3U2KQPnJXeABSW11aF+wxbjIyFmheLqq+Kk1odbQ1RtOgofAjoOjzu/wCDs+moPrGznNh0dG8uipDwThF/Aec+2zDoKXfEpPMjDPytq/WCBgV6IYeTQzugppuHgTGaUUVMlbjUAbK9lM2F+vTfgdHvRGZWqSqrI63cgxjiGH6fSV4XWEdY+B5wds8YN9nfRuHJFtywFyyIiy5dOJr6Dz8iJZlEbekarZl88TX6Z87DC87ufZzTDzULsQ4h6VRqpeIRkd/ZgGriG26gw3JLp0UPzIwfA0xVctbLoCdAmrlIIuPTZgS7TI6zbyLAjk2LqAHhodxe7cB0oghKbCYLXui0DMc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(451199018)(5660300002)(31696002)(31686004)(2906002)(36756003)(41300700001)(8936002)(186003)(26005)(110136005)(38100700002)(66556008)(6512007)(66476007)(66946007)(8676002)(478600001)(4326008)(2616005)(6486002)(6666004)(316002)(83380400001)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjdPdTFrVHAyTDBYUlFISm03L2lzemt2cTVIcDhaM3daUnAwK3lGYmgvVk9K?=
 =?utf-8?B?VDYzRnJCZjNHRjNDU3dvbDlDdzZRcndmOEtZdmlCSkdFcml2Z29nV2FaMXRC?=
 =?utf-8?B?WEtDOEFGYjlaNDNPaUtDZjQvNUpEK1owcnVoWW9WL2JGRU9EQ3BLVzhucncz?=
 =?utf-8?B?UHNkNE1UdGlUWFJ2YWJiYmxjbE12TWozbWVKV3Q0RWRTUHQ5dTRCUWkrbDFD?=
 =?utf-8?B?bHRrbkZFcE4zaFRkaUpZZWJoQVJyQlpDdE0wazJLZlNhVUVET2t0aS9DK1Ns?=
 =?utf-8?B?OGxKVDUwYnRETGswVVU2aDZEcWZ3TlZUYkxZNzNSVi9wSEVEckIzWGxzQnJa?=
 =?utf-8?B?aHRkRFZDdEUrU2dlODZ6R0I1T2tkVmhLVzN2NjhiZ1ZGQkVJbXlrdzBWU1pw?=
 =?utf-8?B?T2hFd0dpY3R2MnptUTR3QlpVSmlwTVFqVkVLNG9FVnc3MXEvdTNZdWw4SHJt?=
 =?utf-8?B?ZGx2YmQ1bkhxT3haSGRRM0hHY0kxcW1uZXNwOHJERWNMT28yaGdCU1hhWnpi?=
 =?utf-8?B?bCtPQlNJUm03THRuMTBhc3Y3ZzdJak1CQ2lxTW5GYXI5cDlnR3JjRjZzVFVu?=
 =?utf-8?B?Vjc2dU1UOEJwYW93NSs5eEU2S0JBNnpDMzJjT1dCZnR1ajFuNkIwY0YrdVA1?=
 =?utf-8?B?L1pPMWxmUk1EdElMczdMN1RZTEhpRmpBbUJpaC85ait2ZFB3UnV4L3puM3Uy?=
 =?utf-8?B?NDNtT2NUS1N5a3l4NXZ0bXZWVjI4QU50QmszWS9CWWNRSU4xcHpkSUZvZVd6?=
 =?utf-8?B?d2V4VStBTUl1ZU1HUzJGdGI5NEdRbWQ2MDhxZnd5eXpBaDd2ZTR1QnI0N3NR?=
 =?utf-8?B?TWZiSVd6NDhHdlpTWTIxa1poVmtvRzBGOElsS0I4bEhZejlwcTNQUUU2N0Q5?=
 =?utf-8?B?RElLaUZPQjZrbkNXbUNzcnlrZVpHNkt0eEljem9jNVc0akl5S1BIY2grUlRT?=
 =?utf-8?B?ZjY0THg1aTUyZkNXMlg4NWFJemUzR0Y1V28yQm5PcVhUa2FXczlMNHJxc3BZ?=
 =?utf-8?B?ZmhQem1UZU1Gd3AzekQ0cWRHaldrbVhCYmZ1YlhucERFb3RVMEZHSTRXWmhM?=
 =?utf-8?B?bUo3YUZDN2kzMVU5OERnT1BFcW00QmJkOTV6d0JhNmFITzBmenY2Nnp1MHBr?=
 =?utf-8?B?b1NXNVltU0UvZks5MHl6UVQyS2JUMTBDZmJlaUVrdEdnRTFvSGcvK0gwNzR1?=
 =?utf-8?B?T05HQ3lkT2xzUHgxUmgzNXllWEtsWXJoWlA0U2Z5STZ1QnVXR2VKeEhpejRJ?=
 =?utf-8?B?c1YrRmRUNEJTWWwrZDNSNk1MUGpRdkduWmNlYXpXUkE0UG5Vb2RhZEFLVGdC?=
 =?utf-8?B?QWJFMEF6UGJpNXJIZzFLTlpMVzNHbU1YVGFxbVVhRGtlM3p6UWk3TGVWM1Zj?=
 =?utf-8?B?M1RBT3RjMnE0TTY5ODFYQ290V2hxTG0xanN3VDJQbEluWmRFT2tyV1BUR2dQ?=
 =?utf-8?B?Y2gyNUdmRGdpMTl1UklmSlVXS2xMRVdYRllqZlFHTnVMOVozTWgwYVJHbFky?=
 =?utf-8?B?Y290RElYMG12SmU0QytwOVhVK0NPdmFXbkEyTmQzUDkyVHlKbkt0Qkx0OGFR?=
 =?utf-8?B?YjdxYjMrZk5ZbVV6OWtHS2dMQTBxMDVRaWRMQmdZb1UweERXNlFOZTl2aDFX?=
 =?utf-8?B?bGIramFHTUg1TU5SRk5DdFJpblVsR1hkVXF0YlU5UG1PTFlkdzFWWWZTM0Fu?=
 =?utf-8?B?MGxxUTFGRFNCVWV3V3NCNDUvWGR3ZHJndG8wYmwwRzRaVXc4N0RRQlgvd2Vi?=
 =?utf-8?B?VCtvZWloNkhpN1NNc0ZCOEthQXpZVUI4WDU4L2Ntd1N4SE42WW1KT1dralZ4?=
 =?utf-8?B?bkdsR1BWRlloK1FwZXg5TGdNK0FQVXF5Y05aSFJKQlJEVG9qa0Y0MlFIdU1y?=
 =?utf-8?B?ZXlCS294UE96WXdUOHdhV1p4YVVod3MvU3ZuZHJtTEpweDV1S2pabmUvWExM?=
 =?utf-8?B?Qk9mWlA3R092eEx0SGlxTnVXNUhuZ1FZMWR3REdhWEcrdVdWbFgyVGdTaFVm?=
 =?utf-8?B?a3ZGQ0taV0I0dUlKamx3RVR4N2ZyWDZ5Y3dYa2Q1M2pFLzA2VlhNZXo2eEVT?=
 =?utf-8?B?MHpYaFgvdVVMQUNYS1pBQlphTXR6aHZJbmpxQXJXUlh3WHlqaWU4bk5JOFZF?=
 =?utf-8?Q?xAQzuB+UeI5w+2VnxRyITQP7Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8901b209-51ce-47a3-0886-08db0920e165
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 15:35:03.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Re+uDZNgPAhArNkBN9IPZFZ/KEVre5+lOxQZmLoqdDLeADA0VTo8VQljW627jFKVou751zJuKz2Dje94YwI+3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6644


On 20/01/2023 11:06, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 17/01/2023 17:43, Ayan Kumar Halder wrote:
>> VTCR.T0SZ should be set as 0x20 to support 32bit IPA.
>> Refer ARM DDI 0487I.a ID081822, G8-9824, G8.2.171, VTCR,
>> "Virtualization Translation Control Register" for the bit descriptions.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from -
>>
>> v1 - New patch.
>>
>>   xen/arch/arm/p2m.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index 948f199d84..cfdea55e71 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -2266,13 +2266,17 @@ void __init setup_virt_paging(void)
>>       register_t val = 
>> VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>>     #ifdef CONFIG_ARM_32
>> -    if ( p2m_ipa_bits < 40 )
>> +    if ( p2m_ipa_bits < PADDR_BITS )
>>           panic("P2M: Not able to support %u-bit IPA at the moment\n",
>>                 p2m_ipa_bits);
>>   -    printk("P2M: 40-bit IPA\n");
>> -    p2m_ipa_bits = 40;
>> +    printk("P2M: %u-bit IPA\n",PADDR_BITS);
>> +    p2m_ipa_bits = PADDR_BITS;
>> +#ifdef CONFIG_ARM_PA_32
>> +    val |= VTCR_T0SZ(0x20); /* 32 bit IPA */
>> +#else
>>       val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
>> +#endif
>
> I am wondering whether this is right time to switch to an array like 
> the arm64 code? This would allow to use 32-bit IPA also when Xen 
> support 64-bit physical address.

In AArch64, we use ID_AA64MMFR0_EL1.PARange to determine the physical 
address range supported at runtime. This is then used as an index into 
pa_range_info[] to determine t0sz, root_order, etc.

However, for AArch32 I do not see an equivalent register (similar to 
ID_AA64MMFR0_EL1) or any register to determine the physical address 
range. Thus, I will prefer to keep the code as it is unless you suggest 
any alternative.

- Ayan

>
> Cheers,
>

