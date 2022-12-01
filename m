Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A8263F036
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 13:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450672.708051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0iQj-0001kK-QX; Thu, 01 Dec 2022 12:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450672.708051; Thu, 01 Dec 2022 12:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0iQj-0001hU-Nb; Thu, 01 Dec 2022 12:12:41 +0000
Received: by outflank-mailman (input) for mailman id 450672;
 Thu, 01 Dec 2022 12:12:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ywn3=37=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p0iQh-0001hO-Dp
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 12:12:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eab::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90fdf1ba-7170-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 13:06:21 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY8PR12MB8299.namprd12.prod.outlook.com (2603:10b6:930:6c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 12:12:32 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 12:12:32 +0000
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
X-Inumbo-ID: 90fdf1ba-7170-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9B4nQC5ppu4fTWE5+qEts5jqijvxj30BL7ZlOm5rHR0puINEV9C0bIt00ujqiVpyz4xocyAEgBJdxg9h+5JDvaD487WVFLk3Mmgks2SQD/TMMrxO4suhwgDziC80OXQdd5glLKIRjrvA8YmiFaEZEnM2/pp4S96shK+RuB0En2WUDQYPJWgvSAuw6gvyQEOmVSkipbA1peGvNETxKwUjfFFAySRVf+lwahEbOsEykXghED+utqMm9aNjHw77R84s3rBPTXb6dre2fHY0eDKvh3/nAhro755hKQXQw1Gm2QpfSybOLUC3OBQvs+osVKrWnFeEdgVgRPwv4vBarQ33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JlJGf8/dwhVPeW3uIbz8qek1CDO1pQa04wEt2CH/S6Y=;
 b=QA2Ov3HCdVjUn1vkuCEdOma7qqxv+nLz6XFIRZvGDcBgQHLp+2JmXbN32TbkIHWLqFpu8HA8lAORronGBxsEZwY2g5S1htJzSHU5N4bFUR5PspOPnxwtwsAfR248DU0O7mdnNm0k5HcJ/5D+4JASC6s7tVXRSQhmiO8LTPgIsdFWFmVWWtU1Ef3ovj2AWLTbxipN03i781g0EwFC3t2iMfPzkBQn/twmMSANT7OCAw36T9EdEE1XPuxWFQbsQcdXh2sHoXAAXZV4zW7ZD9WxSWu7mhvyyayK0pkS8940liwLfsJ7HeV5YQWD5lMCa7s6h0nlJhpIv42/i/CoMtdTYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JlJGf8/dwhVPeW3uIbz8qek1CDO1pQa04wEt2CH/S6Y=;
 b=ZDm99/sBBKv0L60g+J5Uc3pLxkBfv0N/VBKthiJsAh0Gko9w+j8aL2pH8S7AyKShakFvi+qerxGagvrd9wz05wDTgqpME6s2DADFG0Y3PJMrE65ygcJ+pqCT4f5vyBs891zNqsy2vSEYQkrZnZ8e1LgVKhVHR99VD6nr+C3tY5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f44a10ff-06a4-c2e9-930d-a10423026d2c@amd.com>
Date: Thu, 1 Dec 2022 12:12:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [XEN v1] Xen: Enable compilation when PADDR_BITS == BITS_PER_LONG
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, jbeulich@suse.com, bobbyeshleman@gmail.com,
 alistair.francis@wdc.com, connojdavis@gmail.com, wl@xen.org
References: <20221201100309.2385-1-ayan.kumar.halder@amd.com>
 <c89992bb-065b-e7e4-3f5f-1c70754e4635@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c89992bb-065b-e7e4-3f5f-1c70754e4635@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0661.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY8PR12MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: a01020d0-5464-4662-119b-08dad39552f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B5nQktWZcj0bZoEcX1mBELTOrl2K7+NshwgCQ0hXlzXpovh+Rm34TOx/JyYDXL3XDn8gQikcrbr0ZQRHjWkCA6zssmxV4ZoasrDNtY4ARDr0FHKVEhnG2+HLbrCfyuYHgDzvm9cpaCQTQrjwSNhXPJ/QBZnZc1dGzWfcjXTDr6liGurr5qrKpyvQhiq+T0EBvzXzjbOQShrcgo8RaFN5hzXry4Pa9MZvWcCGYcw+yniXXDjz55IXKeMk4BszTZjU+nSvF0/HGNGkOLD4FCu+VL+IE8iZun2j3xQcY5dsw2vRMzp7aJmjv4u3PZmD9F9k2N/gr1S5G/EFKekagWTJf55E2qtZWjJniG7ngTo1uP7BUtEFCFab6JlrNcBaqtwi/bVplHOtyhujg2okF1Y/wu3r5CYsZvNHMxsKpbCEl9dSRumdmKyOzfTi7JT9XhO62oIsbjd+lNG6Qhq3az7o8t1VNp209+9KPJFlrfENZ8Yler+8EdMmlfWx6OyOxQ71deeBgcXTRy8DvPaR1My8MxUv45I3BJZDrvhSL22B//ldQ6uw7XJSkyeG+K7PykJKaY+YXVXHZJLUsgoaq/wOe8xMxY5fxf6QxStRu+u/GeX91q76TpA9E5I23U9bc/9Tm62mG0nDvLR2d3y+ssf5Md+QCihBM+oFSgM4o0aSkhV5DN7QST2kwGDEFDAU4qLRIDpZlZyUOp7SUf6twGiGxEKVHyuv4+BDzCfxkM1dULU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199015)(36756003)(31696002)(110136005)(6486002)(316002)(5660300002)(4326008)(8676002)(66946007)(7416002)(478600001)(41300700001)(66476007)(8936002)(66556008)(6666004)(83380400001)(38100700002)(2906002)(26005)(6512007)(53546011)(186003)(6506007)(31686004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlU1WTBBOHdPeGpHRndseGVFMUhpM2FITXJxRjVGRDNTc0FKYUZQVTJrNXBu?=
 =?utf-8?B?bnVYMlZ2VGp3RlFWdTVGcmkwMW8zRzFiUjVzdVZlR1FaZHBnVm92dGNIRzdw?=
 =?utf-8?B?Um9tUlpNSjNZWm5mb0VKSmFLUWFRam5GQkozcU8vUkJOeHN5dlE2YktQUU0x?=
 =?utf-8?B?TWJidjd5d1FRRmI1VDZkVE5kdEgzU05UY3c4QlJxYkV6Vm0wa2M5R3ovbG05?=
 =?utf-8?B?dDJFeXhNdmp2VjRJbmpnWFlzWGFWWG1CdTFTU1dYQUJhRjFiUi9GQnkrOHIr?=
 =?utf-8?B?bWhLZjdPUEZUeTdRaS83cEtuNm9xWjNrZi9UZlR5VnRsS2NOZWdXajRjM1h5?=
 =?utf-8?B?MVdiL1h2ZnNGMjF4YlN6OUJMQyttV01Ba0M5SW9BaFZUbjM2MlRIWGVaQWlF?=
 =?utf-8?B?bi80WFF5Y0tUTDlwSnpLUExOOW5YK1RBT3Y2Q3dKS3BCbjE0L3JLaXNBTlZn?=
 =?utf-8?B?ZDArLzRybFUxb1BKTW5qalpYQ2I5L3Y5NW1idXVZbTdML2gzUEhMcE9Relht?=
 =?utf-8?B?TmtseDJ1enMxVlAzT2NhZEVGSkFVMStFRWVMcXBzUVNmUnJmaHlOdWRhZ0lu?=
 =?utf-8?B?eVlwVnNzSlUvSUs5ckZKZUpyaFZmUWpsOUg3Z2c4NXFIcnN1N25vTjQ4TnVB?=
 =?utf-8?B?elBzZVM4MWZrOTByMjV5eUFHMS82SnZWdS81cWx0d0tGaTV2MTE1c1R3aUor?=
 =?utf-8?B?b29yUWRyenQ2aEdrb3NneW0xdzJDTmRsYy9GMmdmempiUy8zWGdEWG9mKzRR?=
 =?utf-8?B?RWlGSXJxOVdOLzNxVGpGWksyZStkbzIyL3VVVTJaeWltL25BMCtuWDVQbG9i?=
 =?utf-8?B?cWN1Zkg3bExScWxoYXBjdzFjVDJlTUpGRWY1dlpvck9qSUJ2Y2pPdUlmcUZL?=
 =?utf-8?B?MG96ME9ma1ZjOWlpRWNqM1IzazRpUVdzZERBVmtwQi9wWUR2TE41aUt3RzZC?=
 =?utf-8?B?SlBwYUd0dXpPeWlla2l5K3FOeFZnU0xFd0YxWGg0cklZbGJ5MmtzY3NKUGpx?=
 =?utf-8?B?M2F0cHhRRVhIcndKU01QZFV0UENTWHNIa0FwQXh5cGo5RTIxaHIxUHl4ZU1O?=
 =?utf-8?B?ajR6VW95U3BKQWl0SnVIcTNLVnVSRFk2R1JQTUYxUzVYdFlZYW1KVFMxdzhD?=
 =?utf-8?B?ZzFWQmtQSWlGK05vR1lTYWFLUmdoMVBEMWdmSi9QbVgxNlR1czFudzhHMG9O?=
 =?utf-8?B?aWc4cEFKYStDSlg2UjJ6QXhITFZYREo3QkZlaWNySEV5QWxpcWM0RWxybVhp?=
 =?utf-8?B?VDJyQzFjcXFqUnNUOTBZcFUzZGV6OTU0NUFnMCtzTzJKMzlBNnhMYUZ0Qm91?=
 =?utf-8?B?RWhNY1MwSVRGTDN1ZU1yRmtEejhvT2hlS09GcStvdEFyeWlDZ3RKZGE4dlVH?=
 =?utf-8?B?RTB4QnhEN0dqMmZXVk5QYU5Pbm1ERkREbnQ3VythcVhCR0FBR1JCTEUxc3dr?=
 =?utf-8?B?MVJ1NWdsdUhUREF6VXQrbXh0RDVCNUdCaXJCaFRXTTlPK0dxWXVtR044TldR?=
 =?utf-8?B?NzhhdlQ0dUFjSWFJOFpqTGpINEFjTHZyM1RlRExFWWJHTXNXRDRSWjhRQjBh?=
 =?utf-8?B?T0pNZCtFTWtKdGMxQVk4dEFqM2MxSmphaUVNY2VoSFlEMEljNnRSd1l4UTVX?=
 =?utf-8?B?SUtFS3pvOWdEZ0gwaFd4UUVtNmlsdzZEeE9QL281WXI0Si9rd1pZL0dPUnEy?=
 =?utf-8?B?aDlBQ1Y0OXVOTFNqQUhFdC9wRjdYY3RsbmQ2TVZIeU8rQUlJQWQ4d3M5RXJs?=
 =?utf-8?B?bVVYbTFTemZvbFdvalRiR05IVlBScWJ6WVJHNThkcE1Ud0RXenlvcnF4UmhQ?=
 =?utf-8?B?QTFpdzBmMWxDb3VweVZNa3hPcnBzUlRWNFkySG52YTJDOXBsY3ZqY3NUUG5o?=
 =?utf-8?B?MTZ4WUlqcWdGMXdDZWNhczUrUmpjeUxzWTQxbmN2bWtJd0Z5cUVMeDBnb29F?=
 =?utf-8?B?YTExOXp2V3IxWXRGNVdHNUVHT0hIZE1ZRnhzbWJBUUtaeFBLeUZrRUJuNFZy?=
 =?utf-8?B?SThQT2E3MVZQTnR6cmZ5RHc1WlRVYzN2Yitqa1cwTjZoYkFWK2Rxbm9xOTVx?=
 =?utf-8?B?ZGl6STdxWTBiS2R1Ync5RVVJTllheDZmSHFRcGt3bU9TUDBKUVZrenJDcVlZ?=
 =?utf-8?Q?7UnBxHqRdE3wOmM3vTXfYdsE7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a01020d0-5464-4662-119b-08dad39552f7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 12:12:32.4201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZrbeeUUpLbjwgGOOkZPRAxNuha5DZL6Qjiz/+5DTwvJor+ouIspUcLtPQoS0MLQGoOcnM05Frr1s75nANdeBGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8299


On 01/12/2022 10:26, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

I have a question.

>
> On 01/12/2022 10:03, Ayan Kumar Halder wrote:
>> It is possible for a pointer to represent physical memory of the same 
>> size.
>> In other words, a 32 bit pointer can represent 32 bit addressable 
>> physical
>> memory.
>> Thus, issue a compilation failure only when the count of physical 
>> address bits
>> is greater than BITS_PER_LONG (ie count of bits in void*).
>
> I am having difficult to understand how this description is related to 
> the BUILD_BUG_ON(). AFAIU, it is used to check that xenheap_bits can 
> be used in shift.
>
> If the unsigned long is 32-bit, then a shift of 32 could be undefined. 
> Looking at the current use, the shift are used with "xenheap_bits - 
> PAGE_SHIFT". So as long as PAGE_SHIFT is not 0, you would be fine.
Ack
>
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Currently this change will not have any impact on the existing 
>> architectures.
>> The following table illustrates PADDR_BITS vs BITS_PER_LONG of 
>> different archs
>>
>> ------------------------------------------------
>> | Arch      |   PADDR_BITS    |   BITS_PER_LONG |
>> ------------------------------------------------
>> | Arm_64    |   48            |   64            |
>> | Arm_32    |   40            |   32            |
>> | RISCV_64  |   Don't know    |   64            |
>> | x86       |   52            |   64            |
>> -------------------------------------------------
>
> The Arm_32 line is a bit confusing because one would wonder why we 
> haven't seen this issue yet. So I think you want to clarify that the 
> code path is not used by Arm32.

Do you want this clarification and the above/below explanation to be a 
part of the commit message ?

I will then send out a v2 with the fix.

- Ayan

>
>>
>> However, this will change when we introduce a platform (For eg 
>> Cortex-R52) which
>> supports 32 bit physical address and BITS_PER_LONG.
>> Thus, I have introduced this change as I don't see it causing a 
>> regression on
>> any of the supported platforms.
>>
>>   xen/common/page_alloc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index 62afb07bc6..cd390a0956 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -2245,7 +2245,7 @@ void __init xenheap_max_mfn(unsigned long mfn)
>>   {
>>       ASSERT(!first_node_initialised);
>>       ASSERT(!xenheap_bits);
>> -    BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
>> +    BUILD_BUG_ON(PADDR_BITS > BITS_PER_LONG);
>
> Based on the above, I think this wants to be "(PADDR_BITS - 
> PAGE_SHIFT) >= BITS_PER_LONG)".
Ack
>
>>       xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);
>>       printk(XENLOG_INFO "Xen heap: %u bits\n", xenheap_bits);
>>   }
>
> Cheers,
>

