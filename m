Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FDF72582F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 10:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544511.850349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6olP-0005iO-7s; Wed, 07 Jun 2023 08:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544511.850349; Wed, 07 Jun 2023 08:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6olP-0005gC-57; Wed, 07 Jun 2023 08:43:31 +0000
Received: by outflank-mailman (input) for mailman id 544511;
 Wed, 07 Jun 2023 08:43:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6olN-0005fZ-JD
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 08:43:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f9b5016-050f-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 10:43:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Wed, 7 Jun
 2023 08:43:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 08:43:25 +0000
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
X-Inumbo-ID: 5f9b5016-050f-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwttrdGXP4ryM47Pyn9wZgpM+YIPziAT8u6T/ovtx26mbTR4TGESh10D71C3QlCOBs/1mvQCceXKurrHMfn8sSiNvFkVyCtP06YQ3I9X8q00Ku5Wc5w4pIvjvYsURr2ptcTTglqWt1X8RH03vXnPtMQWf9cA2L5aP3r8xVZ1tGOxnbtq6fmnW3Wwdb7OyOveELztgaKBXYwQv0vt528LHphaJPR3KQlMKWj5cF0Tg3W+ch9XT6BIbWPGAHys91woF5fYQSYJAF5qIMVxTJaZqSX6o1yxn1dhAostVItCnX/bU+xvYLIF1fz6vR6OIUTrfhr8xsaZ0KxCamRvFcK+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7eco710r6tGuzSiyWgsV5R06gelpMJu85kIuwVKIyc=;
 b=ZXYZbTxr0zBOPsOIBSYzSJIwsVJA6wIM5u1sw1O07Ssdt7/5VnflrHHcKZJz6p1KDqFxy6z8Oh194VkyxShWCNFHGtX3UQ/Jr+6DTLbPIjDRYEP532tCwRJa1fhdp4b4XfsXTlIeNlMC8IrgOgAL2GCWhIRPrqGWORfydKJ0xMFlfCrWEYctGvNDNTeUUlJ4Mq8OaBeKgeE5CMnkdaQrCZUeVfVtMdd62GZC0u/vhQSAVE4+Px9RMIhTwRKGqa7gDvUVlKSZDY1ZXP/6PGjp74Nmyko3s7YFhMuw2IPWngZhihpRrqMnJ6ueviYLb/QjDX8bhuEVVhOgVqBJXjypeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7eco710r6tGuzSiyWgsV5R06gelpMJu85kIuwVKIyc=;
 b=RGlJP8UvXXUOIm6zoSUhYkTJyU4GAW1lRWCkafoWUt4QBbxLPE0YG1GTX87OK+cX1Bf2tJJ7RJs/B1grKxSUPP36A0lJQ/e0zkyu9rvSmK/YT7NHRidiKi4R9tPoPH/mDG8jLUm0T8HOm1NDeKadixaHx/ABpYYNFChpSO/o6W23t/Pa80UF3YlfL1KbytK4PT8428nz3rvgNTD3hsdtEDp+pXlp3RKX4W4KFuA56armuu+RUG54XO+XvgkZKWw/2gfbONZShf8Dk6+HniUFt5F4M5hShAz2R6vMQpFaOG/yPCuc7c2IEk9E1nFfMt1Km0lYtltLeU+6dJvmL4Kaww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a34e419-ce1d-e452-47e8-fe220d600ab6@suse.com>
Date: Wed, 7 Jun 2023 10:43:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] x86: Introduce arch_domain_teardown()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>
References: <20230605144331.1819452-1-andrew.cooper3@citrix.com>
 <20230605144331.1819452-2-andrew.cooper3@citrix.com>
 <ZH39EGVyUBIwWQ5t@Air-de-Roger>
 <18a46079-8fa5-5e43-9296-56a8c6457133@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <18a46079-8fa5-5e43-9296-56a8c6457133@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5c5a99-05a0-441d-b7de-08db67334187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fmahuaWXC9MgZoeu7RqkQZypoaNntZCwMe0tJX88aqENd5+sRLlxgoeyiNZxZHRPXXDRfX5Tz/Bv4aSbuYOWx004PxvcT9Px8AOyysXi2QH6iWd+g2o1gP1keQztqVrMRB8+MBJCTgcFb59g0hr4GMqBEC2089+MF5qmCZI2kMXcSLEU4ptfg0FlhOxkBG4WblCx5ImSCBYoWvfTNUzQ34GjV5tmMMmz1+Tr17hEsGscBbBjb5oZmEN4/VVoPhke3JK/i0NIJjMADtQL7yZGQtwi7d7DYOiq2t18I9Rxv6eiVGUcCl2uCBtJbWdpIteZEWqz9Hu4p6xNhuDlzUP/0hqKGLdF+3mTr5C8Y85N1sh0iVT4XZHfaaSY2Q/66+RaC/uv3K7XpXh6FKDEQ5F+DiI8Kdo5MHQqDgDS6Z1Dv//xU74vFCeNeDHTJg0ufydK+gpG6qFs/+t2mbSdsaCezZoAS6TQwf5ostU/Ge34lHpAwyC9xcRq2FfFF0erkVc5lVtsFTbHwntSqgzoxc9ItHc9HFwjU19ml3YlvUThoa9iyiUYXCDReMu/D3tBjPouLXkZ2LS3G64ZijWy5zUf6sqWzU8u0f7ABDPc9zCPTacC3g9ZVDAbg0yLl1mUCtz81f49D4kYs57ulNwSkzxIdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(366004)(396003)(39860400002)(451199021)(31686004)(26005)(6512007)(186003)(41300700001)(5660300002)(6506007)(53546011)(36756003)(4326008)(316002)(66946007)(66556008)(66476007)(8676002)(8936002)(2616005)(478600001)(110136005)(54906003)(86362001)(31696002)(2906002)(6486002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MXlVMUtBZW1HMS9kYkZHLzZSN1o5RkJ1ZUF4a2ZoaWU5ZFRoM2htOWY0T3do?=
 =?utf-8?B?ME1WYzBMY3lSSHJiYllrZE1CemxJMmNNSXFEQ0M4bVpaQTNYekJhRmdadndQ?=
 =?utf-8?B?NEMvZlhkd0JwT1NPTDJkYmovTElYdmdXc1VTWEJBRlN2UzJlZzFzazdidTJp?=
 =?utf-8?B?bFg0SjZjS1hjNk1YdERCZFQ5dDM0ZzlLWUlRZU1tNEpJZTVFdEEyeVNMRnFL?=
 =?utf-8?B?d25nd1N2YnVwRXRneEpRbG5MMTVSUVRwVExHcGtDOVN4VElodDVNekxVNlNE?=
 =?utf-8?B?V0NDMGREL3JQa0FRY0Uxc0w3N0M5b0dBOUZIdkhRUEJ1L1o2aktHLytOa3lx?=
 =?utf-8?B?QVhaSjhDRUNSUjVodjBNL2RuNkViem52V0huQWRTVFlNMTROOU16UUdTcmhV?=
 =?utf-8?B?SHJwUWtILzhYOGFzYkYva1N1RHNTT0ovYVVGZ0NJTENCWU54Q2EzdThaZlhz?=
 =?utf-8?B?TFJ5QS9yWnBJMGd0S3llclBtVFFsdm51bmovYWx1R1B0NnY3ZXU1SDQxTjhi?=
 =?utf-8?B?MGxNQXp1L0RWR0hTMU5SR0pKUVowQ09wRU9Jc0ZlYWhpMTNZdktKZzZzTVp5?=
 =?utf-8?B?K2xIdHZLaENpNlpoSi8wYVdHNk5RRjVvSWNLR3ovSEx4Z1hGZUJFOGowUHBn?=
 =?utf-8?B?bC9kT1R0c3h4NDNWdnBOM3J0emRUQy9aVFNMSlk5a0hOV2VuclZRU3NnVFlw?=
 =?utf-8?B?SGxuNkZLczkxZmhhSlNFQ2xwT2Fxb2VlUG9xdmE0S1l5ZFphc0FOdUlCNFZq?=
 =?utf-8?B?Y25ueDdtcVhCc2F3OTdpUUN4ZVZNci9EZm1DT1V2YXl1bXhDTlFiT0t0SkhG?=
 =?utf-8?B?Q25IczUyWTMyWGNvTlZZM2tZYk9PTHpld3NESS91dWIxZ1BzMkV4Vzk1aThV?=
 =?utf-8?B?YTFzTjl1RGx2VjVXUDIwbjIvVDBCOUQ4TGNMc2NqVUtGekF5dE1hd0FyVElo?=
 =?utf-8?B?UHNtRHNlbytreWxPcUl5YnhiVGt5VktYYUx5a1pMWmYyNkdWdUorQXl0aU4x?=
 =?utf-8?B?WFZ1MElDU2E3NEZaZU5DcURwWS9LTG1iZTdLM1RtMUt1b2paWVoyOU9uanNR?=
 =?utf-8?B?QlR1SkV0UVlROTFGbVNQRnZqSlRqZzNacU9wWVhEelJnZ0pXMGZGSUR5NDQv?=
 =?utf-8?B?YkZqZWRCdllVQXJpaG5JYTBXbkJ4bExKUkRpWHBaMDYxMkJWSS9tK0kyVkJT?=
 =?utf-8?B?RHVrd1h1ZmprRFNTaUM5RDFmUkpXOFQzdWlsbWlMbk5zWlRxM3VqVzR0MS9R?=
 =?utf-8?B?ZFM5ZFVMSU5JVjJ4cWNvTmdxVWR1SEk4cTNyNmJqdTFaRWJiNXN5cHc0ZUpG?=
 =?utf-8?B?NzFjUnBhV1plbEwvOUkvSXNlRGh6eEN1NHNNSWFZR1ZxeVNCcENVTW0wVjdQ?=
 =?utf-8?B?ay9RRDFKVkNiQzZtQ25vaWZjSmtuWUhCeC82R3B1VEhwL1ZBTEhLNndkRVB6?=
 =?utf-8?B?UGVhY1JKVHJrajYzblNlREdhSldjdFcwUkZKWTFhZllOdWlGVk92bDZhNDhD?=
 =?utf-8?B?cktIRVhEK0JhQ3ZjdElGOHFya3RZVWs5WGE3cVJZMjVESStCMFNBbFVoQ2tG?=
 =?utf-8?B?UnA3bDhkVXN1RDFzcHdGczMxbTl3L3U0V2t0T1N5Y1NXV2tUcEF5SHFqYXFv?=
 =?utf-8?B?Tm4zQlUxWlQwYlhUK2EvTVNqa2pKMnFobGJHL1B5cmxEQUtQbzBXQ0FnSjhS?=
 =?utf-8?B?cmNqQ3J5ZFJEUGU3b3o2VUdMckRyOCsrSllxdEsrYlV5QU5WL1JGd2xSRGZk?=
 =?utf-8?B?M2lJR3M1SmNlc0JzNWpKcExBZmpmdCthVjNIcXVDYWRNTXdjaFluRmlkcVRZ?=
 =?utf-8?B?L05wUGRkUm1IWUlrNDFNT1dWV3hZd2pXN3NMdGRUd2lTL2VQVWpod3ZGc1Ir?=
 =?utf-8?B?UmY2cWtJK1diRGx4QndSUHQ4OWwzTk5EdlQyTFFzMHo1d1BZb0J2WW1wMWdk?=
 =?utf-8?B?VVZlN1Q4RUYyN3dvY1VwYVVRRlRSMS9EOEdVWWlGSjc2WjFRTHJleWRVRi96?=
 =?utf-8?B?elYvQlhLTmhmdElnalRSemJocW0xTHJsY0ZKWjREWlRUWlVOeVpRU1IySGdH?=
 =?utf-8?B?dFBleDJiMnlhQ092QTlvM0YrVUhqUnhOSDhTMmlndXpVdjZTVWpTdndGNXpG?=
 =?utf-8?Q?hpAqqpWi4tMJ64aCZfErw6pmy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5c5a99-05a0-441d-b7de-08db67334187
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:43:24.5716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OC/mIS+rrXGf2+O6oDNyW0hiGhZpF7cav7/b49U9+Gg7wSR/irzUWd9Vl0kw1yjpGEQOiIveo/VzKc4qdhEVhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

On 05.06.2023 17:23, Andrew Cooper wrote:
> On 05/06/2023 4:19 pm, Roger Pau Monné wrote:
>> On Mon, Jun 05, 2023 at 03:43:30PM +0100, Andrew Cooper wrote:
>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>>> index 85242a73d374..854f3e32c00e 100644
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -589,6 +589,7 @@ struct domain
>>>       */
>>>      struct {
>>>          unsigned int val;
>>> +        unsigned int arch_val;
>> While I haven't looked at patch 2, wouldn't such continuation
>> information better be encoded in arch_domain in whatever way is more
>> suitable for each architecture?
> 
> Well, it's filling a hole here on 64bit builds, which it couldn't do in
> arch_domain.
> 
> And it's contained inside teardown{} which already signals it as fairly
> magic.

Plus why have each architecture duplicate the field? I expect none of
the arch_domain_teardown() instances will remain without an actual
use of the new field, mid to long term.

I don't want to override Roger's concern, but from my pov
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

