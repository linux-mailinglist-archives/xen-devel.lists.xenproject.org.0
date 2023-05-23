Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 694C070D411
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 08:37:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538237.838049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1LeO-0001xY-Rr; Tue, 23 May 2023 06:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538237.838049; Tue, 23 May 2023 06:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1LeO-0001uh-OT; Tue, 23 May 2023 06:37:40 +0000
Received: by outflank-mailman (input) for mailman id 538237;
 Tue, 23 May 2023 06:37:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1LeN-0001ub-SC
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 06:37:39 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe16::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f815fe5-f934-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 08:37:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6917.eurprd04.prod.outlook.com (2603:10a6:20b:109::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 06:37:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 06:37:36 +0000
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
X-Inumbo-ID: 4f815fe5-f934-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVqYGVueVKHm2FdpUCHNe5c6s7G2UGojoPJb4K54SPWNKUBge+IxhPHhRoeFNo9OjFPhnMHuMU1fWg3Jw8PpeQqC1qHz9S6twTTyW8scj63JzME6V0MNusfkFjcqvng3SMvuIoNkS585pN6/9T+4Fl9UCLLsyV9rH1VpJgDTXMv/BtnOA4vSE51nlD7PtHG+1OOK9nweijhNdQheijasatVIk3PGDhchlDx23SXnUYNURM2HIxFOZ8Soe7d5uhczeH7Vxu6PeapSB7iSSzzXwmmnYWCv35zLsrGYHO9XBMH73R/qRT/bgsTM+bHJgZdptHkkfkHTRaNHKqWY4RXnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJXjn+rwTUfp/opgXzwXVIYfaFyj1aIFXa4K5yGG6qc=;
 b=E3gQeR0505+O+UxypblUZBULyj3Vrf/0yj+Rg8H1noE37BqF9iZRrhF4lTBymdN3aqd7B1aHqw4XW520apKCzRzxbbNMlCIsGziFjEsbx+dbRPBXMaRvSMXpK8V9CS3MHHrYiP98KEOi12qzwf1PgegI+4c19kHcoTmYLypq39ZFq3zjp30T02D2NJRzQ+ufztcm17J0Kse38zOq22CbRWp4g5EatsDQFVtUYeTlbEQnSDN2gTH5JPjkrDfNPr0m/DSTLFalbKmoblNboEOQ0R+5btKQ1nMc+VdfHOClP3PuXd099aHA13IpmFgBNvr7jaXBAZjeafmw9ovTLc/kEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJXjn+rwTUfp/opgXzwXVIYfaFyj1aIFXa4K5yGG6qc=;
 b=NNQTQmcoSW1EjJ18O9FFbMjxhFdEufWUle0uw7plEkWgH5wsNFJTo+lFy/xIy3ITae/yKY3OyUUKlFzvLz/vPUjXbOe+Ruza+091HCyM7LIDS7WavOEBrve8ViCfRYpxUi//Exf7HNj9wfK339V51llOeu8HTSO18Y89N6CKMVFbzZNQ80ik6dix8Mq3YGe5ncF47i2ALBYvEBxu9Q14nnm8YL+MybGcO/rx3GRpgUhmqzFvR8yA5GYsVnRbPcOElg95uFOVX7KnQPic1tBzAllCU5EGgeK/9b3j7RfwnjJO97AVVDAIQcfMaYtMLA2moTgceSrmeMNN6u0YCgdwqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <79859cfb-ab60-8661-e1ec-75fac74531b4@suse.com>
Date: Tue, 23 May 2023 08:37:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
 <e03bbb52-1a19-7d18-4abe-75bbef8a0aee@suse.com>
 <AS8PR08MB799117EDD6BAB892CAB870A192659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <13635377-e296-370d-121b-5b617dc210bc@suse.com>
 <AS8PR08MB7991DCE0DFC850FEA920BF8C92659@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c195ef53-1151-1fb2-0cf9-f6f47d20b75e@suse.com>
 <AS8PR08MB79919CD7C233345113F8D5C992409@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79919CD7C233345113F8D5C992409@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0219.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a5d677-36b4-46e8-eb04-08db5b583282
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ygw5Funxd/0OGx6caZPoLFaNADjfxRJXr+gCrx4YIKiUcND/ueNm+dJmuWBTmDw2sSe3Jr78hJXQxpv1zOPh3Tmz+CMvOqKQ93Yku6z1qaEb3Vj1ZRRqcQ5/r0dRhdW2L7UjAyK9tjKEGAyk++V74vjjhBaE5F/EVHeJQoObiQwtTXTx8wD1mur/fcNfDA6JbhAZpKPA1vKb70y7kOJM1QnboTk8yCZ5DvO6uUwfv7tf/+jKyAwCsSnZ8iHDSh33mXsIMGqXg2mKcmGWHz9wCAt2tRoy+kCc6txNocF2Zekt1a7/jDSI4pZTbhgKdhYFAV7V5rdjjjtzViyE8MKlQPG8KZRczLVJo2vtINIY3haf3raSJfVt2u34f6kP7FcUBjHcnkK9VdzS6Ez82LDJtASikX1Ll9K7/T7/4uwBvXnGBBT4kSpDzrxDMvjSrf3AzadYkyTQeAm9eyxbpAjfwWWBJRLl8KzoeHF89ybfhLLs0sHpeRHXJ5YhaFck5gTwZKkuQaTcKMs+zxuwxG3SPr2wjXA0nHyZq5aI9hDdXNU5vtu278yH9VkRhXT5hJ9p6dDhP1n8y0ayXtGyYCtV+RICu9SbL7Yzl6r7eUhoiuBhQb+V9DGgz+sKadk+Afay7cGTERLhNR9vbeN2pY8acQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(396003)(346002)(366004)(376002)(136003)(451199021)(8676002)(8936002)(5660300002)(86362001)(31696002)(2906002)(53546011)(6512007)(6506007)(26005)(83380400001)(36756003)(2616005)(186003)(4326008)(6916009)(66476007)(66556008)(66946007)(316002)(54906003)(31686004)(38100700002)(478600001)(6486002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MllCMEUwdEVXQm9GK1lNS2VocEpHSzMzbVkrbFUyc0FCWmhjL1I4RVQrUkVP?=
 =?utf-8?B?dWdpUzF2OTNRUUt5TElpZHY5U0tvWENwSmt3cXVVL3NLdUxSZFRMeDBoM1RB?=
 =?utf-8?B?S3hPbGtwR2hpOEY0RDdSWGlHazNpV1VuUWgyN0o2aDNXV2pXSUYvSHZkdjZa?=
 =?utf-8?B?M2NxcDlwYzl0NTdhMk8zZS9wV2FFVHFLYzA2YkF1b2p6d2l1ZGJUcnUwQzl3?=
 =?utf-8?B?cnVtRno1R3d1enhxR2REdjhOWjBOU0dyM1BnN2lrSnhwTk5BUWlINXdkMWtv?=
 =?utf-8?B?bWcxVU04ZDF0VVNsQ1VVcVowdnhSVThTZGdGS2pKcVllN0FCWWxuMElQclFq?=
 =?utf-8?B?d3lsenFiQk53bU9LVnZMeHE5dmJESERkVFhKM3lyRk9KZUtpSWRvbjBzcVBR?=
 =?utf-8?B?c1Z6dHM3V21tdGp6RXhiMDE1VjIrOTVJd0hnSm8yL24xdE5sZjNvZzFiTnBR?=
 =?utf-8?B?bisrZ3dLWW5MZTJGdHUxZ2xRc2pTSnBCVEZ4dkhreWluT2pLZXJjQnZwekh1?=
 =?utf-8?B?YTArdjl4ZXZWNXh0TDJpYzVMdytJRFRFZzNydG9FaEJSbktiY3kwVzhCSUM3?=
 =?utf-8?B?N1A2anBud3Ntd3BLZG9CNnNzYm9QV2tuZ05oUi8yQnJpSitaV3NHU2FZMFFN?=
 =?utf-8?B?ZUtuam50YkVnSEkvL25JelJKMzFzekFSbnBMTHMvZEdRV21kWlFZeVEySDRG?=
 =?utf-8?B?RnIvTmh0VDh2cHFjUm1PNmkwR3F0OE82bzc0ZURiS0RoSUsxdTFaOW8zUXNv?=
 =?utf-8?B?NmF1Lzk3K28wQmV2bzlaaWxMQXZsWWl6NEcwRERjUWxIeTdNd040NEFIN0hF?=
 =?utf-8?B?dkh1L0Y5aUdWeTFsMWk0WGpONTNnWm9DYnZSeHFCbDdIZGpyTmFDUFVZVFd5?=
 =?utf-8?B?aDlOMitMUXJBNVZLazdsSE9VV2tTSWZESkNzdjdlSjN5UzlzOTlLZGRkUGRq?=
 =?utf-8?B?Ym40TWE4VkVLWTVnemQ2WUpTMFVBWWgvNVU4TFBpM3R5WFNIRFRyNWJBbkp3?=
 =?utf-8?B?dFMvaElVR2dwd2kyTkYraktVOS9RZnBsUXNDOGp3bjJLL3hRR0VLS3V4ODdX?=
 =?utf-8?B?MGdYbjJiWm9TSW9NbWY2T2RxdEp0V3pJSWJ2SE1jZ2s3cVk1cHQwMDV6Y2Rx?=
 =?utf-8?B?aUlWNWtuSXRZZ1hGSGl3R1FhYTQwTk1rSHphMnpWRXJ2dzAxQ0FhV3BUbk9s?=
 =?utf-8?B?Qmt3Sy9pQ0xNdE8rV2xNZ2U5YzR6NkFxWWRwZkI0bzQySldhQUYxUUpLcGhB?=
 =?utf-8?B?ZmJsQUFYQmNHeVJBR05aT1hyMk5ETXhkVjBrWUUyUGVnejNaQk54bnFoMlN6?=
 =?utf-8?B?WDV2UlV1TkQ4LzJJb3VtU21EOEU1bHFVZ2hDREFBMks3RlF4Zzd0UzM4YWZS?=
 =?utf-8?B?QWphQXdoZEt6bTFGeWhGNkI3NVBtWFJWL3VQa3ZremFuZXY4b0JLQm5LRFc1?=
 =?utf-8?B?b2Iza1plbWJpbGVKWWpQSlZoVnF5Z1VuYTVTeDRXOWpCYk5WQUI1NmFHZ0ZU?=
 =?utf-8?B?NXo5SU40cG95WS9MVi9xZVdYc2xheFMzRVY4cFdlSFRYQnk4S2FBY29ic1k5?=
 =?utf-8?B?czRZSGdCVW8yTDNEalJLVytQZlNIalZGcTJDNmhNYzRQUUJWcHdMLzlVVnM0?=
 =?utf-8?B?eGt6SGdTVzZUVXNQRFVad2VuY2R4TXlVTXlDNS9KbVRqTjZKQVVlUE4za0dx?=
 =?utf-8?B?QmIvOVFqMXcxbEVjSGNONWlJWkJHY3d3ZlgyNTR1NysrbXpUeG9LL1NkQUt6?=
 =?utf-8?B?dVkrVVY0RUsyUDA2aTJQdXRpVGwrSEtuUjJSNjVLODFPQzRHeVdON1J1QWZz?=
 =?utf-8?B?U0RkSzVYVnJHVE1Zd3ZPM2p2MUNESlQvbjFBRW1ZWmQ4RVpncTBxdTZERjZM?=
 =?utf-8?B?VEpRTkovMldBOUduWE1xL095WHpVaWJjczI2aFpSYmJRRXRjb2IxaFNxYy8y?=
 =?utf-8?B?d1hnNDdITFA1THNMZGJRTGE3SUI3S0ZXOEd2bGljdkR1YzE4dnJhdWR4eXhY?=
 =?utf-8?B?bHdRSDlJa2F4ejF2UFgzQjRma2pjc2dheVhDOGs0cnlINUZWbzQyUzhYdnFv?=
 =?utf-8?B?QkNTOGovdElnd1dBZU8rSEprSFlpeXRLWldaanY5dkU2VTF5V2tTejg3b2hz?=
 =?utf-8?Q?eHqkhK+Qmc6H8WRyqYKCWpKA1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a5d677-36b4-46e8-eb04-08db5b583282
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 06:37:36.7197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVvlkm/PH7Ym+aTjUaUfr5/DZo1Q8JICSGxzb3DS+IUEmrgBogSTPKu0xWlbqZnxZfwk2T9q3AFpSdrmadWvfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6917

On 23.05.2023 08:31, Henry Wang wrote:
>> -----Original Message-----
>> Subject: Re: [PATCH v4 09/17] xen/arm: introduce a helper to parse device
>> tree NUMA distance map
>>
>>>>>>> +        /* The default value in node_distance_map is
>>>> NUMA_NO_DISTANCE
>>>>>> */
>>>>>>> +        if ( opposite == NUMA_NO_DISTANCE )
>>>>>>
>>>>>> And the matrix you're reading from can't hold NUMA_NO_DISTANCE
>>>> entries?
>>>>>> I ask because you don't check this above; you only check against
>>>>>> NUMA_LOCAL_DISTANCE.
>>>>>
>>>>> My understanding for the purpose of this part of code is to check if the
>>>> opposite
>>>>> way distance has already been set, so we need to compare the opposite
>>>> way
>>>>> distance with the default value NUMA_NO_DISTANCE here.
>>>>>
>>>>> Back to your question, I can see your point of the question. However I
>> don't
>>>> think
>>>>> NUMA_NO_DISTANCE is a valid value to describe the node distance in the
>>>> device
>>>>> tree. This is because I hunted down the previous discussions and found
>> [2]
>>>> about
>>>>> we should try to keep consistent between the value used in device tree
>> and
>>>> ACPI
>>>>> tables. From the ACPI spec, 0xFF, i.e. NUMA_NO_DISTANCE means
>>>> unreachable.
>>>>> I think this is also the reason why NUMA_NO_DISTANCE can be used as
>> the
>>>> default
>>>>> value of the distance map, otherwise we won't have any value to use.
>>>>
>>>> The [2] link you provided discusses NUMA_LOCAL_DISTANCE.
>>>
>>> I inferred the discussion as "we should try to keep consistent between the
>> value
>>> used in device tree and ACPI tables". Maybe my inference is wrong.
>>>
>>>> Looking at
>>>> Linux'es Documentation/devicetree/numa.txt, there's no mention of an
>>>> upper bound on the distance values. It only says that on the diagonal
>>>> entries should be 10 (i.e. matching ACPI, without really saying so).
>>>
>>> I agree that the NUMA device tree binding is a little bit vague. So I cannot
>>> say the case that you provided is not valid. I would like to ask Arm
>> maintainers
>>> (putting them into To:) opinion on this as I think I am not the one to decide
>> the
>>> expected behavior on Arm.
>>>
>>> Bertrand/Julien/Stefano: Would you please kindly share your opinion on
>> which
>>> value should be used as the default value of the node distance map? Do
>> you
>>> think reusing the "unreachable" distance, i.e. 0xFF, as the default node
>> distance
>>> is acceptable here? Thanks!
>>
>> My suggestion would be to, rather than rejecting values >= 0xff, to saturate
>> at 0xfe, while keeping 0xff for NUMA_NO_DISTANCE (and overall keeping
>> things
>> consistent with ACPI).
> 
> Since it has been a while and there were no feedback from Arm maintainers,
> I would like to follow your suggestions for v5. However while I was writing the
> code for the "saturation", i.e., adding below snippet in numa_set_distance():
> ```
> if ( distance > NUMA_NO_DISTANCE )
>         distance = NUMA_MAX_DISTANCE;
> ```
> I noticed an issue which needs your clarification:
> Currently, the default value of the distance map is NUMA_NO_DISTANCE,
> which indicates the nodes are not reachable. IMHO, if in device tree, we do
> saturations like above for ACPI invalid distances (distances >= 0xff), by saturating
> the distance to 0xfe, we are making the unreachable nodes to reachable. I am
> not sure if this will lead to problems. Do you have any more thoughts? Thanks!

I can only answer this with a question back: How is "unreachable" represented
in DT? Or is "unreachable" simply expressed by the absence of any data?

Jan

