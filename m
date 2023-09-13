Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B25B79E48C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 12:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601157.937086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMki-0004ZJ-Bm; Wed, 13 Sep 2023 10:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601157.937086; Wed, 13 Sep 2023 10:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgMki-0004WX-8o; Wed, 13 Sep 2023 10:05:44 +0000
Received: by outflank-mailman (input) for mailman id 601157;
 Wed, 13 Sep 2023 10:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qgMkg-0004WR-1n
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 10:05:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7d00::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17e231e4-521d-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 12:05:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7269.eurprd04.prod.outlook.com (2603:10a6:10:1a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 10:05:38 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 10:05:38 +0000
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
X-Inumbo-ID: 17e231e4-521d-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nq7HBpIkHhNNpzMeuA7zCfFZIttYbxP8gtsrpH0cS58wu/FyeYTF9+og7RiktynPDc6OSODGh5pjWa1isZvVqn6tH9l1DEhsVN/BR50/QShbJA20lJd+o64ZpFcPuDUa7K5yH4JzcT3qS7O1bZx8amnBYne0gS/s+v20eUMcHFVzdU7ZxZHWMltHsBjw5I54+h3fRMdD1fwoJ7ZVllQH2er7TE4bEU2WilokgjLMkEa59qgfvhxaTTVB8cntQQUVi71keYGwQRgmfTpNjLOiINURRS17DzuWXs7aBrHxzouNIgAZLbpkuvxXndbTtTif3Xvs6mzQLR0m9PfwakrOlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OinQoExWZMlPc7L6eagJNL3rh8WBAkMS4xivQnrIhDI=;
 b=euqjFC6alU/Oq7OIDEEKIpsPgpEep72M06xpR7rWq7p6gIER2ppFfwGssbqbWIwbeohgA/Q0j/J6IaC3MwPfu6vsGe6T56Pu8OrbfceKaJEk3y0VqKP+rNVlPsNnkWZYwwtv+IEdoZFBMP6NY7xjumop0gHuX4gQVaX7h3FMJIDqdZfS1uWnsUvLR1/ecRrRRt7xA6wSweoAX8V8ntmLJFz2m5fxuW3U8Jbqv0+VehLo3nCXWTYXZcMSWVI/SgtLl7YxtJtqFlqXA/bTA+fiXIQx2DZT+hpWfecxM8ox37GOiTh3EuJrphg8V8OwYwmqlzvywho9a3raZM6QpukgKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OinQoExWZMlPc7L6eagJNL3rh8WBAkMS4xivQnrIhDI=;
 b=IWiMPlB4qKGNtVWJqtpzbE/VqMylrfRtFU/x6n+mlkGlxB8K0M7zbXpv7G/59ddQhg1vwtErIsneDrVbK6pyY8RRnnjp3jkJcFidDPe76G3NA299VPjJ4/SQ48UdQEp9wEc/hRpl6MN6BPc/4/MiiHjmmrFLLF6IbatZBiji82ws/+6GvHFw+5RD+cZzKBhhwqFq395LCll2pw0JBcr+ruqEJNUa5UFdwkEc/0SquTQBxt46DYvkTsC1CuKWnjD3/F7utqfHD84cX9bL0uhV7VWayw4coMSh6b/FSCHeXmw6aBi1ADQYYhALJ8S39hE44ZUGr+CR1HW5AoftFKoccg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea6686a2-dfe3-4a6f-5d3c-a729f95520d1@suse.com>
Date: Wed, 13 Sep 2023 12:05:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] timer: fix NR_CPUS=1 build with gcc13
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <a17ba988-2850-fced-d225-97e1d11f6576@suse.com>
 <CA+zSX=aCwR5gxk3jyPDoWRvoFAAjORWigtrbaO9ow5EvmT_tZg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=aCwR5gxk3jyPDoWRvoFAAjORWigtrbaO9ow5EvmT_tZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7269:EE_
X-MS-Office365-Filtering-Correlation-Id: e002cb13-150b-483c-d359-08dbb440fab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j3B+bHamTxTmfXwchXz544iTU5wwcerrf6536KaEMffCEJpozIypEtxnp0PpHMFrvuNwEtRfERFYIkVt0Ls7wH9UFRXmtp+vW7ZDMuYrFco6pYUE8+Xve98Hwde+W4fnJjwCIQvYO9dBH5vxmY+U4J+46a833iInt11VMQm6yyOVxHqmmiP6vLopA0FeVH7+1Lm71ck7cH2+tvhdSTjiO1yUCqRv9XA8giaeyw1NgxglbtOJzByeJaD2U4pTiJlvRZwA766OUt1Wbi8xcSPtrjxHyIi4sYY1/M6jlkxUmCKBnd1iN8jzti64f1PvBjSz40R4YjWsLvgCCmIjT8dV7qYSZTbm8eWth19ne1M2pxonmyg2gYOUUAx4Iio649WoBxx0/eyq9l1oX71NXaUjcZOhW9lVSUHY4cQ+gHO1EP3AgRXLq/GXm7TmKmddolimdVI4qb2SEDquhZpO8YmikaTV4ZVDn0pX+6yxNCtmSpoozj9wEaOv21y9Dxiu7jdP6MoW8XcKzoWXgpOZkYpXEZwUjFkYStur0K7FszKnEh1wqr5rhA2T68KEB8F2LoAxqV3J3eSsHFC2JIvGYyGswVhVF6iGYnPdR9e+P2nJrC9xY49XehcBsDOim1hnggeOCsiV7mWJIOAlmdp67BYOqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(396003)(39850400004)(376002)(451199024)(1800799009)(186009)(31686004)(2906002)(5660300002)(41300700001)(8676002)(8936002)(4326008)(66476007)(66556008)(54906003)(6916009)(26005)(66946007)(316002)(478600001)(53546011)(6486002)(6666004)(6506007)(6512007)(83380400001)(2616005)(36756003)(86362001)(38100700002)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0VxUitQbi9KekJLMTJsTE43M1NudWVpRnZ4V0NsbDBoRlJYbmp6eGNsZlkv?=
 =?utf-8?B?aG9reWozbEtaL21HOHRMYzM5Wm4ydkU1VEZ2ak9OSzZFUkt3MVN5SkJPb2Fk?=
 =?utf-8?B?NHF0bDRFaFl3TU5zYk5oV0tTdnAwS1IybytBSVhiSHh1U0twZTJsVEgwZ0k0?=
 =?utf-8?B?Qi9JdkZEZVhSb0JwZi9KcmV4K1JNME1OblN3Uk9hZ25pRFJCbHNjS1hlQ0Zy?=
 =?utf-8?B?VGJpMVRDOWZPQnVYdEZGbmFxSm1RNTRmY2RpY0tPQ2IyaVcwdHA4T294ZVlE?=
 =?utf-8?B?cWFNTi9WUkhDY0VvR0FleGVHUGhxZW9saGlZMklyK2tPTmdmeER6cXRITHFK?=
 =?utf-8?B?UlN3bitiOEx1bFQ0TzVWb0wwb1ZMVnlmSHVhNnhJTGJaNkl1aHc2Ym5NNmwx?=
 =?utf-8?B?Z2NSaXlRT0x6Sy92YWRrWlk3eE12cnk5OUM1NVlURVJaZ3RXQndWZ2t2MTFz?=
 =?utf-8?B?SzNtNlhveExWVzZUNzZrajdxNFJsNTl6Yk1iaUlOMGNFSkxiQ2hRczA5MVZK?=
 =?utf-8?B?U3JGL3hOenhEZnQwU3pWeTJFZGtqM2J6UE9vb2FtaDRseVFOV1RtQXBvbHNJ?=
 =?utf-8?B?NVYvWUd2bGd6bmJjWTEwSXdha2lEcHczM3FMQlNFZWhUYWJNRzdjenJXVVA1?=
 =?utf-8?B?RndoeVdUMkNvTTJaMTY3MFpmRFN6YTRQb2oyTW1SVUtnalI0b2pBVmt1cXd5?=
 =?utf-8?B?bi9jY2k1Mk14WXptdDZjUWVUWGhQSkxoQVNNcHNvamV3cUZCNnNsUlZxbWI1?=
 =?utf-8?B?OGZ0M3hnd25ZZ2pMMzQySUxvU2ZJMGxOSHpSZXVkNWVXY2dnV0FuWmt1bFk5?=
 =?utf-8?B?UG1UOVYrQ0M5QWNBSEVoZ1RJRG9WQnJIWlJWVHNTWlBVTGxRU0trd3NwVjVz?=
 =?utf-8?B?MjAxTmpydSsvUDNCTHBNODJCOHByczRYbno0b3NsZ0NCakJ2Z3ZPdHlTb0w5?=
 =?utf-8?B?aFRUV0FGK0hqKzdIK21TdnU1M1VCZUZIS2NmM1MxaFNTamh5N2dLT2dwSC9E?=
 =?utf-8?B?elhYQjIxTENQUHRsT0lDc01QNDNnUkZVU2pqZEpieWRWei84RTJkMklaRFkv?=
 =?utf-8?B?K1A0aVBJY3FuVHJJOHdpZWNFY2pjTnJyWFZPa0lyd0RzenhnWEt1eVFZeEpu?=
 =?utf-8?B?MmRML3VyVE1RZndZU0d4QmJkMlhpdzd4N0dDelVFSEFiaG8vYkkrRWZHNU1H?=
 =?utf-8?B?UGhlNTFxNSsxSTZwSi9oNjMydWZSZ3lReWdFUWxXUWd0M3dtRHRMS3c3WmZN?=
 =?utf-8?B?REJxbXhGN1U4d3cwN3JwYnAwZ1BITTZaQXd1N0VMcStaUklSRmRPUmRBNUQ1?=
 =?utf-8?B?MFV0RFdIMHVGdmZSbUpkUE5nNDUzemozL0cxNGdtYyszaE1qOER1emh5dnVp?=
 =?utf-8?B?d1Rva0Q3ZFBKd01lVzg2ZnI2WGNkR0tFdklRRW8xWkZiZjJQUEcvYWJPblE5?=
 =?utf-8?B?TmZHaUx6UHlDT3VLTHhWS0RaTVA4SVcwUGZlVFlqMG1lRmVjcXdtRkRpcVJN?=
 =?utf-8?B?TlEwMm55SHBhaFlXU0p3ZXYxeWRVS24wQ1ZtakZxeUUwOWt1MS9FbUJjL09t?=
 =?utf-8?B?WGM2akJEOERXTUhxb0JCZ2hxRHk3QlQ0QXFhK0FDUEpVazdpQy9TRVd2OG1W?=
 =?utf-8?B?MDN1b0lQVTBHWVZsS1Aycy9kS1Q0S1YrZUhHUDhnMHFDQnp1Yy9hSTVFYzFn?=
 =?utf-8?B?TWpCa2Y1NjR0QUV6M1FWK1Q1cmxna1RNOGNyS0VyMi9OOTdkblUwMUJXUWk5?=
 =?utf-8?B?aFY3Q3AydTBzcFJvaTJ5TUZIeVVJNnNiNFVYdGFxbE83NDgvNEtFWTNGcmty?=
 =?utf-8?B?bjBuZ3VjUG1qYWtYc3NoNEpONER3SE1hWHlQNXZpVGpJczQ2S3N2Q1RIWUNV?=
 =?utf-8?B?eEFOdUgwUFVpT05rclIzb0toRVRtNzdVa1Y3M0FzZ2R4RGpWUkUvUnlpangv?=
 =?utf-8?B?S0tSSStPdHdCWkpBbDVjc2dRK1c0S3Bya0R1cFp0ZjB4NFUyWUVQNk55WjdH?=
 =?utf-8?B?a0YxNkwxUVJBU3B3OTkzNTVmMkM2Z2l0cCtyM3g4b3hXWkMyRUFnYW1NeDRt?=
 =?utf-8?B?VUIwQ0RsSWpEYktOUXVoZGhwQWxJTEt6UnNJalZDbVNDTGlybk9RS0dLdE1M?=
 =?utf-8?Q?3vqmuV1wjOh/VBKl/qDIMe+yO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e002cb13-150b-483c-d359-08dbb440fab6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 10:05:38.1729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ql3hcYU/3eO2e+JthEyXp0l/2CppQGSPcyU/XcIa55WLq4ljhuWQE2H1OThRv2zZaKS+8st66HZOquqXzF+CyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7269

On 13.09.2023 11:44, George Dunlap wrote:
> On Wed, Sep 13, 2023 at 8:32 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Gcc13 apparently infers from "if ( old_cpu < new_cpu )" that "new_cpu"
>> is >= 1, and then (on x86) complains about "per_cpu(timers, new_cpu)"
>> exceeding __per_cpu_offset[]'s bounds (being an array of 1 in such a
>> configuration). Make the code conditional upon there being at least 2
>> CPUs configured (otherwise there simply is nothing to migrate [to]).
> 
> Hmm, without digging into it, migrate_timer() doesn't seem like very
> robust code: It doesn't check to make sure that new_cpu is valid, nor
> does it give the option of returning an error if anything fails.

Question is - what do you expect the callers to do upon getting back
failure?

> Making migrate_timer() just do nothing on 1-cpu systems seems will
> remove the warning, but not really make things safer.
> 
> Is this a super hot path?

I don't think it is.

>  Would it make more sense to add `||
> (new_cpu > CONFIG_NR_CPUS)` to the early-return  conditional at the
> top of the first `for (; ; )` loop?

But that would mean not doing what was requested without any indication
to the caller. An out-of-range CPU passed in is generally very likely
to result in a crash, I think.

> I guess if we don't expect it ever to be called, it might be better to
> get rid of the code entirely; but maybe in that case we should add
> something like the following?
> 
> ```
> #else
>     WARN_ONCE("migrate_timer: Request to move to %u on a single-core
> system!", new_cpu);
>     ASSERT_UNREACHABLE();
> #endif
> ```

With the old_cpu == new_cpu case explicitly permitted (and that being
the only legal case when NR_CPUS=1, which arguably is an aspect which
makes gcc's diagnostic questionable), perhaps only

#else
    old_cpu = ...;
    if ( old_cpu != TIMER_CPU_status_killed )
        WARN_ON(new_cpu != old_cpu);
#endif

(I'm afraid we have no WARN_ON_ONCE() yet, nor WARN_ONCE())?

Jan

