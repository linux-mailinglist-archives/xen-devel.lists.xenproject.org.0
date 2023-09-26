Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B65E67AE6F8
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 09:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608303.946696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2d2-0008MJ-6R; Tue, 26 Sep 2023 07:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608303.946696; Tue, 26 Sep 2023 07:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ql2d2-0008KL-2P; Tue, 26 Sep 2023 07:37:08 +0000
Received: by outflank-mailman (input) for mailman id 608303;
 Tue, 26 Sep 2023 07:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JCSl=FK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ql2d0-0008KD-63
 for xen-devel@lists.xenproject.org; Tue, 26 Sep 2023 07:37:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d49ae91-5c3f-11ee-878a-cb3800f73035;
 Tue, 26 Sep 2023 09:37:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 07:37:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 07:37:01 +0000
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
X-Inumbo-ID: 7d49ae91-5c3f-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auCCB/rXJlnOuAbceL4LPNFNlinqT2w4Hoxym3+Ta2iqrGOQA9Yk+zn5u6CqIiHp+w7EU6ZeBVg8rbFojftJ9o6uma2DmUFI+kj7Jxh8sxLlNGxVlrCreCE2PdAP5WM+fYXyNkiAa0UscpBXp4A2iUKmTlaZV5R/ui5ET6QZx8qKd62JzV89eYL5oG2l80Thm/Sa0lgdrOEqPrZc3gid8EoWeIj9frMdZVfhhvu1zyZwQ+dfg202sECeS4m96X1DQHYkLyTBmF4NacuDisPcs4O4w1xVmVdTdb8Ez1n999xNvdGCYl5YsCLKoCsPZKngF5Gnj9SgcXTZ5sajsyTM1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMGChRXatFv19aPSq+AYc7mOaZLe2KktImoXX6jxMMk=;
 b=jnOoev5bOOx+xM8uLo7Yk8Yr/ByTIkfkeePCArXpc3V5wYY+RfLBv6KLlnolwkC8a1uAkQyyzJaUFZFDTPONKu+SUKhYokXFM7mQztbMcYzfe+Yb98aHh7FbKy6s1nSzz8j/ydrvCMiTd3J0Owqh/9bfFR2u5hmrxcXrteLOwFd3HHRRNEi1lnKfHXbnHQPxqwBq7CUqZBsuWqpkB//pW8l58Zf5jIt9666Oq3sIrRTbZN81+3DCZHVgfAlWlSj3B9uP1TsjkQDsHsjqSwiUPc5dd0opmlOC/o89kWjVifNzCu6T4d3/NWmhCzLpSHlhhIv9Nd52ImZxNFgr1ssx1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMGChRXatFv19aPSq+AYc7mOaZLe2KktImoXX6jxMMk=;
 b=KyMaS15jQdxmCoTAVh3mRAScd3SUzyYU3HErUjokg1bOmBgY5REkdy27nEGbtI3Ne5MlThiWeJ7gKKSaT+bigNlaETa/e5qINpZ2sYRQlUhBb5EhF+DNEr28s3WdvqyWPq4VqjusNKUcUiKdu7tu0eFYG3MYYLcjKLCguvkk0LgIOAz0DnDEcxkR2SNRXtRYdEAlWWkY/aYj1vnP6duiiIq5exHNmTzhOd6pHugWBwR4vzmme9FxAk08ExRlmafwf/gDocCqTKL2O0A1LqqfVWgk7cC9NkYqI8oY3stX5gjYX+v1+xvXiLDDoG0vOxqwQyLuaPo0YxJMtRWnuRqHCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee485a9e-631c-e535-28d8-36456f9f3214@suse.com>
Date: Tue, 26 Sep 2023 09:36:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/3] xen/common: Add NUMA node id bounds check to
 page_alloc.c/node_to_scrub
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1695681330.git.sanastasio@raptorengineering.com>
 <a47962a573eab38991a8aa3e09ca6b8bd3193b6c.1695681330.git.sanastasio@raptorengineering.com>
 <1e74d0b4-c2bf-46c2-b3df-515f6934cda1@suse.com>
In-Reply-To: <1e74d0b4-c2bf-46c2-b3df-515f6934cda1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c77a2b-def7-4894-023d-08dbbe635f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0MK4xUsWR+mpecXMCUQljajTKv9T3cDseA3bIiB6eBK24E90Qdi7fDD+GpV1RbmduMxn/toDS6LZ9gSOyRaY12qK2G3CSMT1pckJJ/RpDa/INERLFu17GIbn9BxB4oe1q4qSC+sXvoFOZ6txFhKeocFBj9UAS6y79u4hn821eTWr1ADxXS345ovmhYAVBi/VVNk4UvPAMIy5L7IOaVfGUhK4rHbV/d7SgS1t/kjMNGaaeaz6EZ6Q19oSW27UVcmki5LHnzKMpMzW1WpRcdZc2quxFHLHYNiFtWmXPIf6d6bzhs8rUkVBt/p/4n/DsRIMA7jrAwmyD4HO5QbvjqshDVJJXiBfTPXiZKDpccFa/Hv9hSc2t6sTHM5aW+bIc+2l0DGFSRDaufbFfOOQXXh5pXLsymeXEtDd6yFZkI1EJlqOblVEXpucjJSnds9jm2zksNbPbj7XtbacUbTgSmqyZUKqIk39GERvU3QjMA2/nCHAu6tkBafGPzxkSQbeNdzVpJ9XUBzbEWuGh2KOq9iWaYXSMQNgnuSozChNYE7sFXECN6kwPWx6RoolB0i5SIyM4qM5I4DmHtkKA1eRX7XMMJ8ZWgPzQOfKeNu9U1gnfIQS25CfhaGOtRh+QyC12HR194lGkQu/AbXdB/AcWBnmVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(66899024)(2906002)(86362001)(31696002)(36756003)(38100700002)(2616005)(26005)(316002)(478600001)(53546011)(6916009)(41300700001)(6512007)(31686004)(54906003)(66476007)(66556008)(6486002)(6506007)(4326008)(8936002)(66946007)(8676002)(83380400001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2ZXQjRoK0g1TGR4a04ra0MrMktmVmZ3V2xtK0lBWkJ4RDlLOVlydDJ6S01k?=
 =?utf-8?B?QmppTXFvR1VuRWFGNC9kenZ6c2t4TFVkbGwxL2h4Q2x2cWN1TTFUSzNJc2FO?=
 =?utf-8?B?ZGtHM0dqRW5kcGYzTE1MdEVyNTZCK0ZJZHhRdWRxbzRlZXJ6clpqUnU2NXor?=
 =?utf-8?B?UncvRjhzSk5LS2ZTTUFKTE5BeWc2OTRtWUNBRFlDK3J4M0RkQ2Vya0J5dWhO?=
 =?utf-8?B?cWlDeGVKZmRTL2NIYjZQU2FxRU9rbG8rVDNId0dMbmhhQTJ3b0xWQVYxdmc5?=
 =?utf-8?B?RmhhRzR2Y01QVU10NzFyOEg4dnhWUFR6UkpueUlqb0gybS9uWXN6c3dRYXpR?=
 =?utf-8?B?MGt4QkRFRFhwRDJOaldBU21nMnY1Y2RMQ29DcmllYWEvVGN0b1pqUUZSSEh0?=
 =?utf-8?B?ei9OSERVQ0RRRWREbnR2RzQ3cHovdng2V3VaSzBMSGJ6M3NVdEJkZ1c0c255?=
 =?utf-8?B?MnpqWTVPK0tqVk5EUlJObDZDYUZjZ3ArY0J1TVVSVytzbG8wRVV2QWFVNlhF?=
 =?utf-8?B?QWZNQjlzcWk5bUlLNGtEYjdQc2RLTVpwZkFtY1VZTGs2a3hWdzVpQnRZSGhO?=
 =?utf-8?B?U1BjUlhMaDFDbHc3UFZTZGVSTjZMWDc3RWEyMCtScm9qK1pBWTBoZ01nTllD?=
 =?utf-8?B?NG9KajZxaE43eXI5Wkg5V1pMYkpreFZWTHJwTkQ2Q1dHdGQ5N1VYQWR5NjIy?=
 =?utf-8?B?TjRRTzBCWi9ZRkN3TUdqdmNqb04vemx4Rkd1RnFwZFU2b2l3QUJrQ2pqRUM3?=
 =?utf-8?B?aGNROG12U3RzWUVJOEdjN3NNZWV6eGk2bFVaU0RwMnlMeUp4NCsvQWZnRzBX?=
 =?utf-8?B?RnYrKzB5WkhEdHVyV1FmZk1LdnZnQlUvbHZmdGJOY2piU1ZKZm1rOVpaN0ZG?=
 =?utf-8?B?alNsRFFPRUVFUlE4Vll0VTI4ejJmRGFEV2xEWHFmeXpQRk9kS0Zxd2NxbHhZ?=
 =?utf-8?B?eEtTRXZrdldvcTR3emYybkhhOWVpT2JHTHE3VllBRm84NFRSN0Z0cFRNaFZF?=
 =?utf-8?B?b2xncDhBZUg4LzBQdHFyTkVEa0t5My9LWHJ4b3dncnlXODlzU3g5TVYzR213?=
 =?utf-8?B?VUlyNjQ1dFU2dW5obEZ6Y1RMY3VPWHA3cWN4clcvQTNkMzluTkVLclB2REFh?=
 =?utf-8?B?SmFvdGRKNCtOcmxXWUdDeUd5RklIUVRzc2hSOHNNcEF3N2lhWHdjVG80QWx5?=
 =?utf-8?B?SEhaNDV1VUZxcUt5a1NvdmU2aGwrWGJKVEt4cmpmWmtPaU0zNktSZVg3NXdH?=
 =?utf-8?B?eDJjaTJsTUNWNWhUNElhZkxGZ1laZkdUNzR5M2lVeHR1dXAyV2V0RzYwV3dp?=
 =?utf-8?B?cEQzUUo4UnNpVloyUG9mRnFrbnJJQXRENk9lazFqOGo5ZEFIaktLKzVTdXhI?=
 =?utf-8?B?cDZwZTMvVVZKdS9QY2pla05pTlV0OEMyT3J3SWxUMHZkQi9Kc2w0MHNKZlpW?=
 =?utf-8?B?aFdLL1hPS0hNZXpROW40Z01CcytXMDZFM2l3QW1PWE40M3JJc3I2UGc3Q2xt?=
 =?utf-8?B?ODNibHFzRzBJZ2V5NHljOW0zUzhnYUJrUUFTR1dPRlBYYVgrRWJzM0xtQXgv?=
 =?utf-8?B?MGh1REErY0drTUQvSWp4T2srNk1SQjJMSExkTlAvbmxhQnF2aFB4QkRwbGNM?=
 =?utf-8?B?UVpIeUEzd2NiaHBkVERUa1FZSmNDVFBsUUV3RkZZL0NuK1BtOGg3ZW50Ulll?=
 =?utf-8?B?QkFNTW5DV3ZPZERCVW5pNng5MS9UNDd6TlNuL01PYS9iMTZjMzdIYjhzdEVV?=
 =?utf-8?B?VkFWYzhXMnp1bE9sZHk4SG1vMjN5K3dvL25CejlVb2hUdHh0YkVpNTJmRmFK?=
 =?utf-8?B?cE1panZxMVAvTmVFNnZwMjBLUEphUjg3UmtwbGJlSldwV2xhMlljVjFCSGtY?=
 =?utf-8?B?THMxTUhGU3FHV2hLNWlVTGlHOWRwaXNjUmIySTgxVTcva1pJK0pLd25sREFO?=
 =?utf-8?B?TENXNTRiZ2ZzcVgyY01ZWHl3YVY3c2pGNThIa1EvNnJ1Z1BRdHlzSGJoQVdi?=
 =?utf-8?B?ZStBMEpTa09hUmJZYzh0eUFDcEhvTDBKcExJS3N6bXIxOWtuVWgxK1V0K0di?=
 =?utf-8?B?TExnWlM3b0FFRnNhYzJGajBoZ3ZWbGFSaDNMSHdpU0hPUGtFeGxWSS83Zkhm?=
 =?utf-8?Q?+0fj7qimwUm3cCqigRNR2NH9w?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c77a2b-def7-4894-023d-08dbbe635f82
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 07:37:01.7442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxfniYvMr7vKhIDdkxpM4k7oJYoZX5Te3hnPifDeawcAt1n81cS0GQpNeqiuMcmMMuwV0UCLP1Q7s668ug+EbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312

On 26.09.2023 09:32, Jan Beulich wrote:
> On 26.09.2023 00:42, Shawn Anastasio wrote:
>> When building for Power with CONFIG_DEBUG unset,

Hmm, depending on what gcc versions are used in CI, the above may be the
reason why ...

>> a compiler error gets
>> raised inside page_alloc.c's node_to_scrub function, likely due to the
>> increased optimization level:
>>
>> common/page_alloc.c: In function 'node_to_scrub.part.0':
>> common/page_alloc.c:1217:29: error: array subscript 1 is above array
>>             bounds of 'long unsigned int[1]' [-Werror=array-bounds]
>>  1217 |         if ( node_need_scrub[node] )
> 
> That's gcc13?
> 
>> It appears that this is a false positive, given that in practice
>> cycle_node should never return a node ID >= MAX_NUMNODES as long as the
>> architecture's node_online_map is properly defined and initialized, so
>> this additional bounds check is only to satisfy GCC.
> 
> Looks very similar to the situation that c890499871cc ("timer: fix
> NR_CPUS=1 build with gcc13") was dealing with, just that here it's
> MAX_NUMNODES. I'd therefore prefer a solution similar to the one
> taken there, i.e. make code conditional rather than add yet more
> code.
> 
> Otherwise, ...
> 
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -1211,6 +1211,9 @@ static unsigned int node_to_scrub(bool get_node)
>>          } while ( !cpumask_empty(&node_to_cpumask(node)) &&
>>                    (node != local_node) );
>>
>> +        if ( node >= MAX_NUMNODES )
>> +            break;
> 
> ... this clearly redundant check would need to gain a comment.
> 
> What I'm puzzled by is that on Arm we had no reports of a similar
> problem, despite NUMA also not getting selected there (yet).

... this wasn't observed, yet. As far as I'm concerned, all my Arm builds
are debug ones (which I may need to change).

Jan

