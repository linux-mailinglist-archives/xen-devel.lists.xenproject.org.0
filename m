Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238A3677BA1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 13:49:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482832.748560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJwG7-0006AR-Hn; Mon, 23 Jan 2023 12:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482832.748560; Mon, 23 Jan 2023 12:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJwG7-00068W-E0; Mon, 23 Jan 2023 12:49:11 +0000
Received: by outflank-mailman (input) for mailman id 482832;
 Mon, 23 Jan 2023 12:49:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJwG5-00068Q-Q2
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 12:49:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2077.outbound.protection.outlook.com [40.107.6.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53666f20-9b1c-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 13:49:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7598.eurprd04.prod.outlook.com (2603:10a6:102:e9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 12:49:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 12:49:06 +0000
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
X-Inumbo-ID: 53666f20-9b1c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n2K4+7lzsKKG7out+uDb0cWMV0BwBMtCo2bozkcYEcv2xSN0ylzQfd1URC27WwlLNavO/1LZH+i1X+gRTB6G5O6z5GENAW7dhuZarU3X2jXJndLPnTppuKSqyxsI7gIlicQyAqXW44NzjXOZ2GaneK86aidoh04wijxs8LjuUJia8iPpnpgh0jO9wUf+W2N/cOKIOJeDh4oxUhurcijxijG3Su0ST5VV8L3oDwZxFLndyUQl37y/Z1SycZOoehGSZM9uoWz6bhNz3AUKMa4rq2TqswEz9qk26dPEmkL50PIfy2HcTDGxZg7xYUUQO0DPC2+fy7PdB3VQqKWlvGVBYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zz/xQac6VCNHR4A8oHGYM40baouxvQANK/LS3SvfatQ=;
 b=hijDVFyEndQOS4fqwGL8IYk2ShPq2GMlU2FGhstP/u1gCLDljTar97dLt3q9C6uKKKbIpEvem05rnsjx+/YJCOzpPr0LEXBt8MMbP3CPVaHQzRVvg61BRYi6Ca9hKpBdlK870/gLEqZ+2wt7khJ+7tM32eAhuADYa7cmUEsFPaI2hGK/BMJD2tyb5lB88wyXwi3MDSN3yQXyG2+/1ySNepGTKP3sk+yQmdW8aCC/LVQOM7+p+WyoPxCnwKBz4FFM9tRPUBeEr6phtS4CGEMuiEy6p6BNm0yulDZPyPbRM8WaRssckTH45T+e4ghK1xs8rq5S8F+WRT2H7TwSbIaz2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zz/xQac6VCNHR4A8oHGYM40baouxvQANK/LS3SvfatQ=;
 b=F2O+Tf3jQzSvC/gNiDOrc82ODuUSqn11F+m+PG3Z8x4jj7QkrVYPn6p5KIn8t0K4AlaNApFcbYfPSn4Dcz7KEtrgAmyykaIUvXi5+AhpYtD57XmjzdX7s96SwPsK4TAZpW/1CPXKsHzbz2/0hP9Xf/cAfryBO8osK5H7csOCdt/0C0lNgxHdc4RR5FYtakzmqXF6UVzb325YgS+jlmjRskq1TT0ltVSOon5Y+wv1yEDFwvS3sundWnAG+Yh9hrqi3DFXNCOrieTPK+V4TPiNzYBWpejEb9ZxZ0UOpSJfbYkwl88+zfgf1gr+WMP8kNwCHrbvqoyEsSOnLTTnMCEJuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <12bcdc9b-52bf-ad10-a3ec-286d00372be0@suse.com>
Date: Mon, 23 Jan 2023 13:49:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86/shadow: sh_type_to_size[] needs L2H entry when
 HVM+PV32
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <942e1164-5ed0-bdda-424f-90134b0e22c5@suse.com>
 <79420a4f-358a-f404-7965-e5f215234ba9@citrix.com>
 <2ec2a36e-4264-6c12-c2e6-1af85c91f1f6@suse.com>
 <04f5c9ba-24aa-c9be-e8de-a867c897835a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <04f5c9ba-24aa-c9be-e8de-a867c897835a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: eaccf24a-3c73-4c84-eca2-08dafd40366c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T3Tsz/k3ds7xFjxlQyKR4t6ElW9wcPT4GxW/WjkTHd9x2sabYiJ8SN3YL/igKN9Rt9KwMPtMItggIsR8J2I6F6NqUQkt/w7itqlS+VlipfJbLgyLHqbGW1dhx3hkeAp91x8UX30uFf6uVn6vOABm+I4LxyixxVebjxA5TF30pjnSfKDmcQ/WApWvkou9CRvZ0lx93R6pY7LoKBkRWFa8N3DGfaYIQJziQqPCjJgiTTq0+nPyezBEYiUvsSM6HzoY4sOkfSQ9g8lC5c55C9N/hzzoQCn0C8tA9ibvy09e9PnMBxfo0pKzC6bVbc0lLbHclln5KNvNC5t9Bl+fZZygjtwOl076JBuzT1rFXl1p8e19RQkwU83SJ/eOIzp+sL8dlg8hyfy59JPUwYNlW7HdiXaqzbXe1edrUzenHC+Xm8n1pNmgVbJzCPgOEKcg7oARBLPBpgFRLR6chBwSl0HOe4aJGHGo8e5E4Ysi6409qTlh22BlJy5XLld7kM4MsuFV8cJwupLO0PORQmwwWjwfzeN37t7VzJ6UGFC7Z8HCdYcuNOZHDvSx52Np5ZEyJ+s4Tyo5HhPojZbKgAVGc8e0XoKis6s0p3lkSt2z4koamJceB0YgdTmUR3ltnxXcsY4aGyR+CRZFfIMwkixJJv5MJ5zxtq+JIW1p8Im9DVjMzC+Rj3RaSxLmv/z+ZvQTXfrHKxz45LjstvuBV8c4wdejAidSNvDSi21X6U9sayZPTUY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(346002)(366004)(39860400002)(396003)(451199015)(36756003)(31696002)(41300700001)(86362001)(5660300002)(8936002)(4326008)(2906002)(38100700002)(6486002)(478600001)(31686004)(6916009)(8676002)(26005)(53546011)(186003)(6512007)(6506007)(316002)(66556008)(66946007)(2616005)(54906003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVMxMzZHN09NZEYyT3lIVzFrNEhCREt1TVhpSEtVdVo3TXNNZngzdGJpYTNO?=
 =?utf-8?B?cFNVMUZRcUVuZzNZeHlpZHFsemxIN1RkZ1ZFOG9DVjY2S1BTMENNcENRYm1X?=
 =?utf-8?B?UUNnRUpwdFBaR0ZlY1VRWTJ4VlZZZSs0Z1hPUit1UGxPWkZGeVp4UjFpNmtV?=
 =?utf-8?B?UGdnSlJmZm5kcjhqdXBJNWdXMldIWm5ZaUFYV2tmUFNHNFluNmxpZWhHWTdR?=
 =?utf-8?B?endoMDNOWkF3SmVrb3B5ZzNDOEMrbWQrNVJJaFF2VzdxendQeXJCNTlwZUJR?=
 =?utf-8?B?QmZrRm1HVWdzYWZDNWJMbUozVlh1VVVmRCt1dzc4MHpsUDkwT3FGS3dzaVFw?=
 =?utf-8?B?b2dMbnVqc016N0ZzU2x4aVA5bXpGRTJXQlB1MnBwZGN6b2Zja0g1Z016TnBw?=
 =?utf-8?B?MmJteDlDV1Ryb3dPR0JhSFhyZTdSSXJpcGJmVGw0SDVqMTdrUTdYQXhpaGtJ?=
 =?utf-8?B?WWJtOG1FaUxCMWZJU0IvSE1vUmpmOWwzZE4rOGs5dytIc0R0Z1kxcFAzVzJT?=
 =?utf-8?B?T3ZNZFpZSUZ4ZUJROU5oTHFCbFd2cVFHdGJZeUd6aXVNWGNFZjE3Z05scy9W?=
 =?utf-8?B?Q0lSTGlNNTRacXVuRWlTRW5ZQlhCdFMydENKS2xEZ0J5U3hHTlpJMDZkaVFR?=
 =?utf-8?B?bFN5R3VlZ0FacXltZmY2STlFNldoOGlXMnM0di9BVHBJTTNEbGRTY1dDK1lj?=
 =?utf-8?B?U3FjVGFaNEZHMG1tK0dqaTZXWW9DaCtrRVVRdmltU0E5aFpWd2p5Qy9ISGUv?=
 =?utf-8?B?VWFTeG9abGpVTS9KMThxZVA4QlA3T05td3NFYWcxdCtkbjBEZDZpb2prcm56?=
 =?utf-8?B?T1VCdTJhT2tETHA5U3FBUS9KQTh3VmhXQWNjc3VublpEYU0vaUZ2cFlUYm05?=
 =?utf-8?B?NHBucnZSUnQ2Mm5UZ2NJeHJtTDQrOXNkTGU4MHNLbUkyZU9SeHBkQXpwMlRj?=
 =?utf-8?B?VXpjbCtOSVBJVGlJaXN1V0tYZ0JhMTl5Uk1CbDV1NWsycW9vc0N2TVRaTHFM?=
 =?utf-8?B?eVR1MlBJRTdINFFkWGgrYmthWVhrb2ZNbjdlV2VaMlFqaGZOUExlbWNldlNB?=
 =?utf-8?B?OTF2U0dhRDdKZ0NDQVgwQ1hJTFFSVHV1WlhPRkpVdzVwd1B1U3U4ZUl5NFN3?=
 =?utf-8?B?TVlaK09kdGExN3lsVlV0WEhER1FLSWFZM1NRdVJDZVNPaHc2MU9ROFBwUHpM?=
 =?utf-8?B?bEZaNDk0dlFXM3FZZ3llOEFXYXQwYVNMdUUzZ2VKS2xHbEhtT3JOdG5hQmVU?=
 =?utf-8?B?T2Y2TGhHRmpKcEM2NlhHN2tFV0lBdkxMQWcvM2N3RVQ0NWxURGRPQW9uT1ZQ?=
 =?utf-8?B?c1VPcjFFcU1KMm56Nno1L253RlBQMHlHcmZhb3AxOHNSdzMzTjVuS2ZVRGpw?=
 =?utf-8?B?Rlh1L2oyL0wxWjdMNnI1VlBXWlNKWEZvVWo3M3R4c2p4ajYxNHFiWHBQUGk5?=
 =?utf-8?B?OGRmMVdVc3JITXpHYzRJNzhBWmliYmhERm5qT1lGYlFKd1dUd1N4ZEk1TlhQ?=
 =?utf-8?B?VndaWHkzTEt3MUdHQXdJOTV4SmF0NjN0Ty83RzVxZXc2dm9oN0RjcFNrem5h?=
 =?utf-8?B?WFdQci82Q09zNFd2MmxNR05aeEhhREgzZmpzSUtWZnlvSjdVNnZHRHc1bWk1?=
 =?utf-8?B?cVd2STd3bTU1ZkZvNFltOVZLS3VsWTFOSUpxS2NxNzIxdm1KUFA1L01ubmtK?=
 =?utf-8?B?Y2g4MEQxcWVMQ2Rzc01YRTlaNm4vUmc0Um1rTDJ4VCtkcVVIbVZ6Sk95RDQy?=
 =?utf-8?B?QjE5UHhua1hPNkdWTHAyUnU5NENha3NPb0dQUHNSekxnRGxnNUxuYWorakE1?=
 =?utf-8?B?NDVVTHZyc3dPaGd1YTFTR1hhdVU3MVR4Vks0ZzN0K25DOGJRd3F2aHJ2dE5X?=
 =?utf-8?B?cDJ0dFJ1M2c5R2VtbFZ3eCsyamlka2dXblo0bkhPeEJ4S0R3QitVZ2t0dVc0?=
 =?utf-8?B?QU9EbXJVQ1lhZFRSL1gyUVZEU2owVEVJSURqQ3F0d0F5NTN4K0NVU1hRK3lI?=
 =?utf-8?B?N2UyYWljeVFULy92ZDV6cCtJekRQN3EwQzN6bVk4WGo1bW1Oc3NHNzZaUHFJ?=
 =?utf-8?B?MVcvWUJJbVlrcmdwY2YwMUpRVnM3TmFrUm1TdUtRVFVEQ2dKVzBTS3Job0RL?=
 =?utf-8?Q?slpFl8/S6/pjcqljZtDp0ivcv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaccf24a-3c73-4c84-eca2-08dafd40366c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 12:49:06.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFoQd4swoegMkk/AAB6tnw5v0MjbI4/oare5eTBJmo9NafHEoMlDDVWzGXWsT0TWIBqVtlVQ4ndK2OJvXJP9yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7598

On 23.01.2023 13:30, Andrew Cooper wrote:
> On 23/01/2023 10:47 am, Jan Beulich wrote:
>> On 23.01.2023 11:43, Andrew Cooper wrote:
>>> On 23/01/2023 8:12 am, Jan Beulich wrote:
>>>> While the table is used only when HVM=y, the table entry of course needs
>>>> to be properly populated when also PV32=y. Fully removing the table
>>>> entry we therefore wrong.
>>>>
>>>> Fixes: 1894049fa283 ("x86/shadow: L2H shadow type is PV32-only")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Erm, why?
>>>
>>> The safety justification for the original patch was that this is HVM
>>> only code.  And it really is HVM only code - it's genuinely compiled out
>>> for !HVM builds.
>> Right, and we have logic taking care of the !HVM case. But that same
>> logic uses this "HVM-only" table when HVM=y also for all PV types.
> 
> Ok - this is what needs fixing then.
> 
> This is a layering violation which has successfully tricked you into
> making a buggy patch.
> 
> I'm unwilling to bet this will be the final time either...  "this file
> is HVM-only, therefore no PV paths enter it" is a reasonable
> expectation, and should be true.

Nice abstract consideration, but would mind pointing out how you envision
shadow_size() to look like meeting your constraints _and_ meeting my
demand of no excess #ifdef-ary? The way I'm reading your reply is that
you ask to special case L2H _right in_ shadow_size(). Then again see also
my remark in the original (now known faulty) patch regarding such special
casing. I could of course follow that route, regardless of HVM (i.e.
unlike said there not just for the #else part) ...

Jan

