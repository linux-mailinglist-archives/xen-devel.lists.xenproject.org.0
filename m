Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EF770D9E4
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 12:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538380.838268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Otd-0001Sn-Nb; Tue, 23 May 2023 10:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538380.838268; Tue, 23 May 2023 10:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1Otd-0001Pw-KA; Tue, 23 May 2023 10:05:37 +0000
Received: by outflank-mailman (input) for mailman id 538380;
 Tue, 23 May 2023 10:05:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q1Otc-0001Pq-NS
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 10:05:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c259ec4-f951-11ed-b22d-6b7b168915f2;
 Tue, 23 May 2023 12:05:35 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 10:05:33 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 10:05:33 +0000
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
X-Inumbo-ID: 5c259ec4-f951-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0IALyCFrvrdXsEKd4hF6iXOAA3CqKvNsQEqLZSVIDloLsBMbJ1EJdGcWRnjFzqAbuqyQ9jIdnm4jiuNBAVtRs4j4AKBdGILoO4VjdQVQMtkKj04pDbM0lQl2j3yk9pEgpJja3jUMDiloqC387gLsdY1iDyeotHULwEm7tGlxK38cXfMj0sADtI9tSBq1d7LiI3XyU93u3NOBHF5733vqCpFqj956XV0yYFijwRVD8kRRThtw78NSJeqB5zDqjUmzkke1aA2WypCScBdtN9D4NLmVcgrqY6xLJmg+FYCl0OsY9mAjrHHlkkVsne0xpH3EstPvXi4WriadhQ0PcGt+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdrJmdYMqPVXF1FwEgoRlCA0N+jmgwBMq/66TIo8VPI=;
 b=MSzFaFQ0S9su4JgfjrLvmGOHbgBHtr6fskTKe8eorw+et17cSaS4VqGmL0sjiTcNBUaxyXaqLKxqHJNjMvFoIqSE63YrJ17Ry9M4eoIbhcyp4KuhraXoA9CWCI8iao9WdSg5g3gZlWLGzYr06rO5ZJ0s7WnT8fuSF+KrrzHj3I1HMBwWz54DkZEq+Tbtq2juTsCQ8zhCR4Zm1UEAAQ6glhDU8vj9XFU3c2HXM8ojq5m+zSYqfhdllPTVs0bMlT7rmkABdl3F8vTf5USacovugHQpLS9gYAsUPoLgLCAY7CtxCl5tZio3P0lA7k3JpDxD8t8bwbEOotQkp3jC4CyoPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdrJmdYMqPVXF1FwEgoRlCA0N+jmgwBMq/66TIo8VPI=;
 b=VL2ry5d0O17gxBzzeilQi9P/nzxVFCBo83rTu6a4bWLhiRzG4x/Kz/TnYnh2EnOAE3kL5hWV4kOUwt5eK9DpIjkZRAgQ9ThLxXF9UJFtE7WlACnqvixM/6feO3dEouCCfGtdH+GL92ZgAFaPfKsgfpiBoJKxKnPy+J+OGsRPPV7qohp48YlTk7r6YHgEG73Y+zFt2AvWCa26X8N3hhyk8sDqf7pNQT2p8kHroM846VHcpo2Eph5SlD/ABaLDAymSC6n0b2hp8tRWm+nCEDr+YkKJeg7fywBCrZ/qHAXjoi5uXQasXO1hjfW5ykXM5ja0XUJC/DEBIGxnqdVEm4tbVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f01db34-3256-0c79-018b-f081863f2599@suse.com>
Date: Tue, 23 May 2023 12:05:30 +0200
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
 <79859cfb-ab60-8661-e1ec-75fac74531b4@suse.com>
 <AS8PR08MB7991C727E0A90875055DA1D492409@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991C727E0A90875055DA1D492409@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8633:EE_
X-MS-Office365-Filtering-Correlation-Id: 66df6b0d-d941-4713-492a-08db5b753f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jZdwa0km9nvJeHDTlafUHFLLDaT6aBpugBxfqEcIRmK0cXoVKebbRDoAbrNy4tJX8pM5nSqM7ET4l9hhFYY2NKct0VipLqvngxiu0Q37dTzfpkyteorq+j86/mRz8053h7VoLArXEh5105Ko0ANy4+Gd82+1oZQZqHfrqiVwYj631Lm8K2kguMKaKQEmqSm/P84nWW1AqGDcoZoy8kbGIIZXZzvtxOxxiHkGZpm1qiWhDYe5M4N0oYtswjdgBcmrQXb9SaOKUwBn5OPQiqzhvxCVf8ZNmcntVEhz1v5IUp1tT3Lh1iENxAkvn2oyovUhFzsxibSN8VRg3wzYU5MpZCjPnosAmKbswyC0tVXNVoVOuwjYrom6EEV4QDh94Y8aRYPvLCWY8zsKVx75asyrYNlom7zT26OA967K54ORXFVZBXeCplilfBeTHWIR/7bl9bctRTJ++g9RoN613PDEFHyAqwfKq8znA2NsTuBIhFKkev4GCR+V0MYi8W6GMYdwpK2ZKmNSM6r4/zMIPG7IBoKhystWMMl60Qogk6/tEzx5AfijbWWDMNS60j6vaOLYcvWpz7v+typXS8dlmzdAkeTdBgyRCsWyMyNzgUQR5QKvetD7qSDxNzVdvXEv0YAnG04xY2DzFMDveYFZI0tuXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(366004)(39860400002)(376002)(451199021)(5660300002)(8936002)(8676002)(86362001)(31696002)(2906002)(53546011)(6506007)(26005)(6512007)(83380400001)(36756003)(2616005)(186003)(38100700002)(66556008)(31686004)(66476007)(66946007)(6916009)(4326008)(54906003)(316002)(478600001)(6486002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGhLSWl1eHM0R0J1SFF0K1VPL0hTenlGMCtkWEJOd0lsc3VwQlp0NDI0em5C?=
 =?utf-8?B?a0QzdkxOcGZkeVNqWHRYbkpvNzZlMjQraWpQSXlsZlRIeUlUbnJMVFhrYlJo?=
 =?utf-8?B?UFo5NlBDK2lpcDgzNHFyWjV6bTdPMW11Vk5GQmZZL05FeDFpbFhsSUUyNzFX?=
 =?utf-8?B?VEVkYngyeFZSUjlKMUZ2SkJqV3RBYmdBVGlwTE90TkJ5WVB2WUJxNm9Fb1JM?=
 =?utf-8?B?UXBvSHY5Q1JqclFSKy8rajNLbm5sVWRVZ2JmWE1PRldVWWFHWjhLbzZDTVdN?=
 =?utf-8?B?bUlhRTQ2UmFZKys5N1loTk1yMEt6aGdKNEZGZndUMjJFNzc4TkU4K1p4ZGZJ?=
 =?utf-8?B?Y25abG5lM1dXd0I1QVJqdUJOcTZ4eEZOOWI5c1YvL1NuV2VxeVdNang1Nms3?=
 =?utf-8?B?ZUh5em9EcjVsVmRpbkhaallYd2JDaTdKcGFTbHc2bkUvWHZHcXdoZzFPRVQ5?=
 =?utf-8?B?S3VIbVBOV2JiRStOVGNTN2MwSTcrNGJEOU1PbXgzYk1iZUhoRm5UY0V0Tlg3?=
 =?utf-8?B?eXFiWjU4Qmt6c3RsUHRoMTA2bmdSSGliMXVEMThYYUZuS25vTGx6S1c4L0Rk?=
 =?utf-8?B?OG9JYVBMWWE3aDYwU2Jab0hwV0FzWmV1dnlLb3VqZDFDOTJDWGJTOUgwRUNL?=
 =?utf-8?B?bkFIN1BycGVyVHQ0Q0hPRkhLU0xWTG5rLzU5VUxTejVWV3JZQjVzcUhROHJB?=
 =?utf-8?B?NFBuSHcwTDBWa0xLNklLOWtMMkdwdE9TWUFNc0hvci9oZWRkTndpWVVKcit5?=
 =?utf-8?B?V2JlbVZpV1pDUlJJZHJ1MXdGeFpSRzRoQlAzWUtQL0hvbGJKVWl6OHJIM2hy?=
 =?utf-8?B?dWkrMyt4QmJIS3lNTXFZaUVtZzNsd2pSTWVjOEpFY1dPbjNxR0dEMXVaeGV3?=
 =?utf-8?B?UzQ0Ym5tRjB2UU9GU2hTcWhNZzd1QnhIUFY0QTB3T3ZZWVJURjdtTU5zeGoy?=
 =?utf-8?B?ajFERHo2WnU2dSt5cTVweVhVQm5BMDJQdGliOUxTekEyWlVUNGM4bjJ5YWNk?=
 =?utf-8?B?MFlISmMrSUZLcHM5Q1R3UWtDMWJianFhWUI3TDMzZGE2SkRsZ21lSXRtbTN6?=
 =?utf-8?B?ZjhPYkMxOGN4aVRGZFZHYVVSdHgyam5wNUdBUkgrK2tmYXVYdGd2VTlGSktm?=
 =?utf-8?B?ak10VzRLQ1krLzl1Rzk2cmNWWVhmbnRXelBwZlVqWURrc3AzYTE5Zkd1WlFS?=
 =?utf-8?B?TWZaangxbXFXMVk2Q0xiTmhnaUhZbTYrMEMrTnNuTXI5ZzEzNzAySFFqS2Y2?=
 =?utf-8?B?S1lsZVFFOXJsRm1TZEJkRzdlTlp0ZlViQmY3U2NxNG5JditaUlFmN0c2eTBh?=
 =?utf-8?B?MnNnZmQ0MUtPWjdTT2E1N0MySVhVdDg0Y1BWaXB5K0ZNamVkYnRhUkpORmd0?=
 =?utf-8?B?SFdFSDV4MVNNS1p0eGUvMGszNCtYMW9yaUZNRFlrUGlnNCszMTJoL3VKYzY1?=
 =?utf-8?B?aWJjdTlKTS85Q0oybjEyZGExN1cvUGVMaVMwa2c1SndhcHB2bTBYRTNZYmI4?=
 =?utf-8?B?ZWlQQ09aTFdURDdIbHFjVTBibGlIMTM4TmJEZ0lYZDVNcmhudmRkbHpIVWJ3?=
 =?utf-8?B?MlYvWWt4UU5ieTFtWGZmditDYXdEYXptVUNHRlA5KzdYVllGWUUvYzg1TUM4?=
 =?utf-8?B?MGVRbGQ3MTNUSWlUSlArcVlrYVgyTk9pUHNZY0VkUnZFQlRpK3F1TFVjdWxF?=
 =?utf-8?B?L0h1engrQk5MbmxpVyszRUsvQ1ZkTGJGN3Bkand5UG9xOGMwTTRzVkpoSmtQ?=
 =?utf-8?B?MU1KMUR0NE1Kc2JrTmt3SnVaeEZadGVFeDcxcEM1T0pqZWhXMk5IcTZUMmNt?=
 =?utf-8?B?MnVjSzI3SmtiUzB4UFlpRVkyUjNOV2R2VkhxTWlHcG5WbDFFMllyNlFsOVJn?=
 =?utf-8?B?bkFJVFRLQmhJcUN4TUd4b0k4SWJ2M0ZjYURydVdpMy9TNTNNQ0ZGdkVuMFJi?=
 =?utf-8?B?WXFHejN0U3ZpNXFIc3ZIbWgxY2tpMGNNTlNFbHNZd3E1bGJDRWljMDdoYXBk?=
 =?utf-8?B?c2QvZjZtR1lteEJpNTRQcGRHYzY1bmZkVW9vcWhmY1k2cEFkVXpzVW85MWwz?=
 =?utf-8?B?VElDN0hUUmVwT056aFJseThTUDVIdzhabEhMS3U2TmZiWVc4bGhieDR3a0l2?=
 =?utf-8?Q?oOi8BmCrSwTUM/qXSDqwLzlA8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66df6b0d-d941-4713-492a-08db5b753f46
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 10:05:33.5978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EM6Bd3utKZgtUhvubAb+Y7Tf52dC+d7FLLdZpW34vBAYA0IQmcd/pVTABLUvhRB9EDQTtKzlwlIj3KJXqHhAFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

On 23.05.2023 09:32, Henry Wang wrote:
>> -----Original Message-----
>> Subject: Re: [PATCH v4 09/17] xen/arm: introduce a helper to parse device
>> tree NUMA distance map
>>
>>>>>> The [2] link you provided discusses NUMA_LOCAL_DISTANCE.
>>>>>
>>>>> I inferred the discussion as "we should try to keep consistent between the
>>>> value
>>>>> used in device tree and ACPI tables". Maybe my inference is wrong.
>>>>>
>>>>>> Looking at
>>>>>> Linux'es Documentation/devicetree/numa.txt, there's no mention of an
>>>>>> upper bound on the distance values. It only says that on the diagonal
>>>>>> entries should be 10 (i.e. matching ACPI, without really saying so).
>>>>>
>>>>> I agree that the NUMA device tree binding is a little bit vague. So I cannot
>>>>> say the case that you provided is not valid. I would like to ask Arm
>>>> maintainers
>>>>> (putting them into To:) opinion on this as I think I am not the one to
>> decide
>>>> the
>>>>> expected behavior on Arm.
>>>>>
>>>>> Bertrand/Julien/Stefano: Would you please kindly share your opinion on
>>>> which
>>>>> value should be used as the default value of the node distance map? Do
>>>> you
>>>>> think reusing the "unreachable" distance, i.e. 0xFF, as the default node
>>>> distance
>>>>> is acceptable here? Thanks!
>>>>
>>>> My suggestion would be to, rather than rejecting values >= 0xff, to saturate
>>>> at 0xfe, while keeping 0xff for NUMA_NO_DISTANCE (and overall keeping
>>>> things
>>>> consistent with ACPI).
>>>
>>> Since it has been a while and there were no feedback from Arm
>> maintainers,
>>> I would like to follow your suggestions for v5. However while I was writing
>> the
>>> code for the "saturation", i.e., adding below snippet in
>> numa_set_distance():
>>> ```
>>> if ( distance > NUMA_NO_DISTANCE )
>>>         distance = NUMA_MAX_DISTANCE;
>>> ```
>>> I noticed an issue which needs your clarification:
>>> Currently, the default value of the distance map is NUMA_NO_DISTANCE,
>>> which indicates the nodes are not reachable. IMHO, if in device tree, we do
>>> saturations like above for ACPI invalid distances (distances >= 0xff), by
>> saturating
>>> the distance to 0xfe, we are making the unreachable nodes to reachable. I
>> am
>>> not sure if this will lead to problems. Do you have any more thoughts?
>> Thanks!
>>
>> I can only answer this with a question back: How is "unreachable"
>> represented
>> in DT? 
> 
> Exactly, that is also what we I am trying to find but failed. My understanding
> is that, the spec of NUMA is defined in the ACPI, and the DT NUMA binding
> only specifies how users can use DT to represent the same set of ACPI data,
> instead of define another standard.
> 
> By looking into the existing implementation of NUMA for DT,
> in Linux, from drivers/base/arch_numa.c: numa_set_distance(), there is a
> "if ((u8)distance != distance)" then return. So I think at least in Linux the
> distance value is consistent with the ACPI spec. 

Can we simply gain a similar check (suitably commented), eliminating the
need for saturation?

Jan

>> Or is "unreachable" simply expressed by the absence of any data?
> 
> Maybe I am wrong but I don't think so, as in the Linux implementation,
> drivers/of/of_numa.c: of_numa_parse_distance_map_v1(), the for loop
> "for (i = 0; i + 2 < entry_count; i += 3)" basically implies no fields should
> be omitted in the distance map entry.
> 
> Kind regards,
> Henry


