Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5063D474
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 12:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449817.706783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0LG2-0005yU-Hz; Wed, 30 Nov 2022 11:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449817.706783; Wed, 30 Nov 2022 11:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0LG2-0005vm-F1; Wed, 30 Nov 2022 11:28:06 +0000
Received: by outflank-mailman (input) for mailman id 449817;
 Wed, 30 Nov 2022 11:28:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bCy/=36=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p0LG1-0005vg-SF
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 11:28:06 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d65c895-70a2-11ed-91b6-6bf2151ebd3b;
 Wed, 30 Nov 2022 12:28:03 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA1PR12MB6065.namprd12.prod.outlook.com (2603:10b6:208:3ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 11:28:00 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::62cc:47ae:a750:8f57%4]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 11:28:00 +0000
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
X-Inumbo-ID: 0d65c895-70a2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=leRHd6ivGq+Y8YSu2PL7E826dMf9xZYlIq/DxgWwgbD+blGAHB/gGNbT3Tr4jFjAWLrk5jyJsr9oEWKAZ2Ns19qsxCElsILiGkc9dO7DgPdIjjOIjkcKlQzZnyGTUJW3ADYd9oOJ/TBMZhr9IUvSJtucsFLhTpu6QobVLWpQDNMPcn47fIhKu6/7YTDQlqxBS0tXRIDSi9ds+e2lZKVjGi6s3T+/l0rcS5oGzz9x1StVBWbcZ3jTEEl4zEV9sYrkjJyg6K7UkMFlMhLCOmuo/U2hW0cVtNjjaRw5/dcGn3bfRhSCFr5ervNpnTZyxhm/SE14egWxubBBgCLHky7yJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xrXrsj/7NgSQSbDpJMBlak7v0PWein6jZNCxYllDEY=;
 b=cfyaQliPkid6I2soaI+bsDh0ataN0j/ece79x+maTOWM4RWsiwRwPUC0aMcALZsIH0sLy7UInQi9KEbdzBupBgv5fc/tIsdKOXqdtk17SuSVHDhn8JqzLUp3VhjDpyJbL7fpEOOH4iIAsIcEAPGW+KyWb4SwVBhztWGhidTDpHsWQxJRmi8YHLjQQ8LyywuruNGNNdhg/MztOXOCGrkSAVH2iZAno7Kud2PuDkjsHxfn6Uk4bYLwrI7gsYGFizvu5oPKulVvc4XleqgY4oxmCL0R2n2iFKtNMXAuhV7QQUhuviB7hiOUT/4qT8eHxkx6hxhMt4J4mtTey1Kyl9yXGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xrXrsj/7NgSQSbDpJMBlak7v0PWein6jZNCxYllDEY=;
 b=wPDagYF6s/ZzMmMAq/1w8xazfVYy/UhhEgpAd0l15Kl8O6mdb31jdSykPaMqUUKLlBkDFIfbEMbXj027TqP/zpJj4cEKwqdgfaQH/6bqlAWlCUX7UurrEbZc31NkZvrfpLyJy84pMUAycG9n4LkaZv6IDcO3VIpUrmVwwqi50/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <21ae8452-167c-88d3-1604-162018408ea6@amd.com>
Date: Wed, 30 Nov 2022 11:27:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: Arm: AArch32: Need suggestions to support 32 bit physical
 addresses
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Vladimir Murzin
 <vladimir.murzin@arm.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <70651dbc-085d-706d-17d0-a419086a0700@amd.com>
 <a352eb18-0ae6-a1f3-08e6-87f53494ad8a@xen.org>
 <65891843-db28-e5dd-6e9e-3fb003fcabc5@amd.com>
 <ddeb7a03-cab3-2a26-7f64-3a1b5f0882d6@xen.org>
 <105a0d45-5b3d-7986-92c1-9a13eb803bd8@amd.com>
 <22d28805-8889-25e9-6d18-c868bf5e51bb@suse.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <22d28805-8889-25e9-6d18-c868bf5e51bb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0309.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::8) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA1PR12MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: c4937a55-5f3c-4599-e1de-08dad2c5efef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6Lfq+aAwmoADXIoq2Mmc4l2QQrhFXG23ZXe0LRSQnTkr9TMx5pA+hkAJzG9WdHhGb/htS7W57prl0p1NdT2U6rwhOEBAAUDsIJmLY6Cw0GxnIEtXmhyf3wZGHMQy4JRTD2rCysvk9bvthAxRw/ax6peB4bqmNQPPcIQfLKkIgi8nB+UCb73KOIqBd+mfHlZR8CXxxYrrfHQCBgkn1h0DlgH0ednbicQzF2XxLVdJBrT3HuRz2FK5bijFxiIhK9zbI7i+BeFRXRAaDilNi+NA3w6+UYwTARVpLhxjEt9HwIk6CQrbI9mTSfO38QSUJQ7Fr82MSWzwul4E33STDgTGOLXhR5+++Rk8O7K4qmf3nZyimVazKQ+IZVvGLFyIg8LoUSRiLyBsVTAzxkP2pO+E8A6OIgFmBrm9k71hnZqQrJOsf3dbje/lWYBYMYZwcAmXbIGIposmeddiM1TLYtSJOBmv+CU84U24T6NiDExZb6rc9z7/6oHsi4dy6HUW33Z8iBUg6D36MIxi0BadSVrZBkvuhnCqlfru97KqefiTlhnUiTfxuwxBoG7KbmcL/0jD8X3fmvRchCu49BT1LnbLfhA7q6lVdy+VAD9uWFIVBeIkRTFfnaq4vP9g+spmGUNOa58poYcUZ2TyAbMXLXCfuPakpwx3fvsQcVmyT7N5NIpdkKKWX2s4MizqS68In1AQn72jpPDkhYYUaQZ2Yd5NLHAXloutxlC4aiACF9ZvnZE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(31696002)(66556008)(6512007)(66946007)(26005)(8936002)(4326008)(8676002)(478600001)(6486002)(6666004)(6506007)(2616005)(316002)(38100700002)(5660300002)(2906002)(83380400001)(54906003)(53546011)(66476007)(41300700001)(6916009)(31686004)(66899015)(186003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDNUVmpBWUJoMGlsTWFoZzNKOGhqSnd4VUQwWWtvK2tOQ2JsTll5UUVTaCtq?=
 =?utf-8?B?cjFmcnpXZW9zOFJlcndkOTI4akh0MEIvVTVaYzhYbktFamZaOExSSVFCeGpu?=
 =?utf-8?B?Z0xZQXlmRlR6ZFlLMjgxM0g1TmFTYkpkUkxCNUdWN2lQR2xHemN5dE1Pd2c5?=
 =?utf-8?B?bVNjczFzTE1tMFNDajdwQTV4c3lDZTRlNG5uV3d6Wk5CTm1obDc3UVFuVkgr?=
 =?utf-8?B?SWJ2bkszTHdhQnF6OGhUMDYxS0RVWVNwdlU2Q1VtMmFoUjFzZUw0MFlqMzN1?=
 =?utf-8?B?aVFLdUlhUElVNTBPeUFwUDNuanlsVFdaZ1B3SnNWa0dPMkVRV3RGbFVSUG9i?=
 =?utf-8?B?MXBwcFpuYW4xWVZFRmM4V1JFVXBsamRKM1lkakFzRW1JVUpIL0d1bXRUYkMr?=
 =?utf-8?B?cjZoTGZzeTQva3gzb21XdjhKQXVjQjdWVHJCK0IvTk1wLzYvdVhRQVhsMVVS?=
 =?utf-8?B?dVlIWSszZVJsdytuRHdxelV0aGp2WU1NVjdmWFlMdjVOUk1CRUtjelN2MWhz?=
 =?utf-8?B?REwzZWhkVTA2ZGM5V3N4bVVhWGVkSFJ6NHUrcUE0VzFuaHVDNWZSZjVsZGFQ?=
 =?utf-8?B?R3JkeklEZ0VoeTN5VEQ1T1ZNbTNNaVBCTzBXMCtLYW5YdHN5SmlaZGVjWlJl?=
 =?utf-8?B?QmJjMnFGNUhaMkk3eWJtYmUwU1lOd2lKOXFXTEVmdGcwWXM1QTFvdlJDM3Fv?=
 =?utf-8?B?SWM0bnpCTkREcklUWWV1ZCtSYlpVUU5ja3p4V2tuNW15TkRGUkkxMXpmb0hE?=
 =?utf-8?B?RkgzVllNbVpwTytVUHNOY0QvMFZyczJhZzFKQjRIWnBMam5qeXoyUXl2YWV4?=
 =?utf-8?B?RDhUZlU2bFJ4V25qblBqa1MyMk5rT0ljemxSRlU5aEMxeXhjYUl5Q3d3ZnRC?=
 =?utf-8?B?Si9kd2wrN0tPV1ptZmFLeDNIMjR5LzFWQWJEaTZyMlVrRWcveWNaZTArZFhr?=
 =?utf-8?B?VUpUTnJGUnM0Qiszd0FwZjRrOXNBVTVoSFJEWWR4U2tIUkdqdzdyMXVnUjEw?=
 =?utf-8?B?QjlBeHFMbURMYmVJaktvc0FJRmtkaEI2RkZwR0NyT3NSS3AreGZ5SzVCUk54?=
 =?utf-8?B?Y1REb29sckFrRUdlekt6Q0J4dy9jL3VTU1loN1ZiNlMrRFFraEhLWDRwTHc1?=
 =?utf-8?B?ZlRQSmlSTTdUOFBPZmRvV3BmaDJma1lZMlJxVG5ic1V5SnhlYjQyNU1Gd2RZ?=
 =?utf-8?B?S21Yamo4bjZtd1pOdXJBNms3T1Vma0VLU1FNdUNZTDhTdThIK0s2QXZ4VTZB?=
 =?utf-8?B?ZlBnU05EWFJjdUZPbklybVBxQmVjY3RlYmFzTS9LZENjWU9RNmZvdXAwTktv?=
 =?utf-8?B?YXRoeDlFMGJOSjZINEtPNU9KR2NIaVdhcmp2L29QTVFkZnd3MVptdGx1dTU1?=
 =?utf-8?B?NitBZFJtZGFoV1VDeXZ2MDB4anlCKyszYjl4SjBabmJYeUc5SVREYy83SFJ3?=
 =?utf-8?B?M3oxZm1WbHExY2FZL1VSQmNWa3FEaGc4UXk0ejBTVlVYbGRkSExEMlVwNG90?=
 =?utf-8?B?R0lqUlhlWHd3UGJxMGdpYmVIUDNoZHdHYXZSc0MzeGlQS2JHTW9WMk1XL0li?=
 =?utf-8?B?QkpOQUZiRmdTNHZMaGpvY1l4eHJSZ05kSlk2RUVSQjZyY3NIOWdtVllBUGov?=
 =?utf-8?B?VlVkd29IUmZueFAyM3FQaUNLbTJTbmNZUUNmS0E5N29MTldjbDFIMFFSMjky?=
 =?utf-8?B?Y21TYldzQUp1Z3UwMGFQWEdpVDAvVkpwekNFL2g3OGl1UmFiYVVoS2JSN2Zm?=
 =?utf-8?B?aDdrWmMrRUViRWRwSnRyUzVPQy9jNzhTdC9QQ3dJL0IxODZVWHBYOVhVaVNO?=
 =?utf-8?B?V2hVOEEyTmxZQkduanQ4ckpWc0ZYQzk5emZVYVFST3BrQzBmOHJjWm1rNVh5?=
 =?utf-8?B?MDNQTmh1V0pqWmhiSjdWQ0JFK3hrcU1qeWlCUm9ab3lvRHh6bCtoTklqNklS?=
 =?utf-8?B?a1RNTFoxcW1vT3FNdjU0ZFdKOUVoSE5UbGhhd2Vhb1JVTHVkT0wra3J3dFdy?=
 =?utf-8?B?SzV0Nmx1c0lYZFNvdXRxbE9YcW5La0ZBRUxnWFZiYmY5d2xYNTZneWxMSGRN?=
 =?utf-8?B?d2hmYWJwc3l5WDVHQTlZa0JwcjY3OUovbjR3aG8xTUJZWDB0RzdHdmcrcEJa?=
 =?utf-8?Q?ccOoqBa9RZLu3Z39SefMovkVR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4937a55-5f3c-4599-e1de-08dad2c5efef
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 11:28:00.4555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MaxMDdU5Mtni78sDIiWe4SzMzkMukRaaL0gH4DNInGD0rg/75H77Rkt6o79wpY1kjMU0U3H7HbSHAAzatAvfJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6065


On 30/11/2022 07:09, Jan Beulich wrote:
> On 29.11.2022 19:18, Ayan Kumar Halder wrote:
>> On 29/11/2022 15:52, Julien Grall wrote:
>>> On 29/11/2022 16:23, Ayan Kumar Halder wrote:
>>>> On 29/11/2022 14:52, Julien Grall wrote:
>>>>> On 29/11/2022 14:57, Ayan Kumar Halder wrote:
>>>> --- a/xen/common/page_alloc.c
>>>> +++ b/xen/common/page_alloc.c
>>>> @@ -2245,7 +2245,9 @@ void __init xenheap_max_mfn(unsigned long mfn)
>>>>    {
>>>>        ASSERT(!first_node_initialised);
>>>>        ASSERT(!xenheap_bits);
>>>> +#ifndef CONFIG_AARCH32_V8R
>>>>        BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG);
>>>> +#endif
>>> BUILD_BUG_ON() are used to indicate that the code would fall over the
>>> check pass. I can't find the justification for this change in the
>>> commit message.
>> I had a look at the following commit which introduced this, but I
>> couldn't get the explaination for this.
>>
>> commit 88e3ed61642bb393458acc7a9bd2f96edc337190
>> Author: Jan Beulich <jbeulich@suse.com>
>> Date:   Tue Sep 1 14:02:57 2015 +0200
>>
>> @Jan :- Do you know why BUILD_BUG_ON() was introduced ?
> You've cut too much context - the next line explains this all by itself,
> I think:
>
>      xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);
>
> Clearly addresses used for the Xen heap need to be representable in an
> unsigned long (which we assume to be the same size as void *).
>
> But I'm afraid there's further context missing for your question: Why
> would that construct be a problem in your case? Is it just that you'd
> need it to be > rather than the >= that's used presently?

In my case (for Cortex-R52 build) :-

PADDR_BITS = 32

BITS_PER_LONG = 32

Thus, "BUILD_BUG_ON(PADDR_BITS >= BITS_PER_LONG)" gets triggered.

I think the physical adresses are representable using "unsigned long".

Yes, using "BUILD_BUG_ON(PADDR_BITS > BITS_PER_LONG)" looks correct to me.

> If so, why
> do you add an #ifdef rather than dealing with the (apparent) off-by-1?
> (I say "apparent" because I haven't checked whether the >= is really
> depended upon anywhere.)

The only callers of xenheap_max_mfn() are from xen/arch/x86/setup.c as 
follows :-

1. xenheap_max_mfn(PFN_DOWN(highmem_start - 1));

2. xenheap_max_mfn(limit);

Looking at "min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);", I do not 
understand the reason for "... -1" (ie subtracting by 1).

Do you know the reason ?

- Ayan

>
> Jan

