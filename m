Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9259C67825B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 17:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483135.749101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK07B-0001X2-Nk; Mon, 23 Jan 2023 16:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483135.749101; Mon, 23 Jan 2023 16:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK07B-0001Up-KT; Mon, 23 Jan 2023 16:56:13 +0000
Received: by outflank-mailman (input) for mailman id 483135;
 Mon, 23 Jan 2023 16:56:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pK07A-0001Uj-5R
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 16:56:12 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2084.outbound.protection.outlook.com [40.107.241.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d39a7748-9b3e-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 17:56:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8208.eurprd04.prod.outlook.com (2603:10a6:102:1c7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 16:56:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 16:56:04 +0000
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
X-Inumbo-ID: d39a7748-9b3e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U02u1RSaCduk9uRQnkssbLc+JM1FKivTlXOXMMUIYTq+zm+1d2C19WdZpMzkZSJuXVLEIJ1r/pMLD8rJYGYdhxH932GvyzsFzWslIPgCY062yg8hVC/i7k6mHDMcG3m3wh/pXqI1RFoBOmKT4Ex1+BvAnDWyFs+RzpganTrKNKVULzKq4hZgOg4JDqu1VHGfcPN8OJnQYxMD02i+3B6F4Go3RYlqEp6XWSUfn9re/giYb8qP5clT/ZRGXqX2TvECUyjtmwtPXNmr38YeMYXCxEWgMfn8TL0JpRIR1D5o7ay6mUt5D3h1idDyppt1KwFavEWVJzLA1+i64sN+HW2zYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zk4umC/FbFRIvgxIz3OY95Fco9mLJGiywi6HudqEr78=;
 b=fg7qDtxyHPHu0N8eOsCSIBKzXzfl9jcxJikfeSMAe9CSp7HEI4PvsfXhDbXIO1+2varLpqq7nLQacOTTB2qZeIX2NendIhBDH6M+9Er9vRm5LrBxir7BNfyg2mLhGN/5k6HQi2Linr8eGBtaGk9P6NEvMH1dQ39P2nmBm9nmMOxTQZoMCkygN5LlfeuLRRQtSlA2nTXXQxnIkDq6WMkcosMN/4VDVMkLpzIRX3mmUt+BOahLsQ8dMYXtUq5WcHKSxvRR7uTsciBTE4bcQDQUSpCdm9jmokWjDqDPw4fIPivHUshA3HCQORCP5c5QIZfJD/EFCFYO7T2X+tBHyb8Akg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zk4umC/FbFRIvgxIz3OY95Fco9mLJGiywi6HudqEr78=;
 b=5pi/7P8x8cGAdw16BhwNexriWERvojVGP7HVVjZM6hJtCrFPd+EBappKzFdLf//T/KP+ScJKKZ8arF7ZIE+7ygcTIuTHeumCNMLro+8ZXXarBRGGfiBMiVv4Sf77eMHazlPfxHSMGleXbETp95r4tkvDvCyC04lHmDl9nvO4g4ZIFug6qVdlRqIqn91cnInnXtJkLwQbadcnfgmNWQoJ3GP9boOjkbWzgZVu1/8ScDDRjfiqRS8YPZ7ZmOrpKFD/8SEwulEbZOfOCF08SkbUUScKEeITaDSCzx2yqmVEv/n8ih072VwacCNMLdffQA3GWOlVr3cXQRtMayqulUWPaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9073354-cc8f-8496-1fb6-d53ff5879ccf@suse.com>
Date: Mon, 23 Jan 2023 17:56:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86/shadow: sh_type_to_size[] needs L2H entry when
 HVM+PV32
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <942e1164-5ed0-bdda-424f-90134b0e22c5@suse.com>
 <79420a4f-358a-f404-7965-e5f215234ba9@citrix.com>
 <2ec2a36e-4264-6c12-c2e6-1af85c91f1f6@suse.com>
 <04f5c9ba-24aa-c9be-e8de-a867c897835a@citrix.com>
 <12bcdc9b-52bf-ad10-a3ec-286d00372be0@suse.com>
In-Reply-To: <12bcdc9b-52bf-ad10-a3ec-286d00372be0@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f1dfe4-8bd6-4b25-4f8d-08dafd62b661
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M6KHcvx/Coe8dUjMRXWZ0B/7mFlc9s7Ac1lXBU+dAxLw6lEO47TEaYTlgeDncPpzlwWZHMKNPdKcVVtqgd30T/xF0m+PZfosfrqB+YbueQy/XX3QXifWkWjU4KW781qSVo2BphZWgGidiIYtd1/NzA1zPLYN+saJclGfbs67/6ePY1sg6ac/alFPyU/tXROqIQGpGPZ84O1HrBORa2vip2/+lbhetUAzqYRu6Y1ZOZ+uhUJ0lm3T4AccIWbhJ+T+OkTiULQ0SZF9PLccGcU8tkRKoKQMok0oYMH451id7JaBZhaMcZGiirsU6j7aQdX0jClJXdi0kYho9CmiwiBaGgwhGzvM8GgAVYhJ/H8QE2mHkYiIXnTiwthd7+L8RWJXUV10U/K1qavhviCR9AFSnXQCNqWsjrAV++rHrIb05t9EcDDMME1oFaJwza3QyjXnZh11PbrU5eEZQkKeSlratYdthdlnt95RFMKjZeItubfEGaoORCF+jUvp33kkc6leAKl2v3oMLXxKaqZtenbbFMHelLCuWb5Y/wMNohjEpue3KLQHHemy0eD2jlqSe3KYdNfDxBa8oRYhzgcJmOkSAoQ5RvGTAJR0jiyGq7RAyS7QIVApuD+MohyPNllfpOJjc7MWSCvfIn19dbUyN9HpTGVcbkAKgl2vLtm4uCIiZo2tNjcbP66odkFfYh9yorJigS0zpbcAqFdqgMur2JCXI8n6xIxb2LVB8B2aIeRFIJU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(366004)(39850400004)(136003)(376002)(396003)(451199015)(36756003)(2906002)(5660300002)(38100700002)(8936002)(4326008)(41300700001)(31696002)(86362001)(66476007)(6486002)(478600001)(31686004)(6916009)(6512007)(6506007)(53546011)(186003)(26005)(8676002)(2616005)(316002)(66946007)(66556008)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVhyVW9FTTQwZThIOU02Q3RnbW5XNVhNNGxGdTBjejQ3RndVbFljQmRPVWh2?=
 =?utf-8?B?Mm9xQUQzcW9LUXJDQ0hIOVlvQVI4YzQ0L2lEUGFOVEJMdmYyMjJKY2NSOWJR?=
 =?utf-8?B?NW4yMmxaSWRhRzZIalhSUU13MHpZT09yL3dGMGVEeStMZUVwWWppcUxJb2Qz?=
 =?utf-8?B?QUFxTk15TlY0YTc3RFRqaysxRFlNVEZYczNrK09xQUMvTko1NUJWWHZxMzY0?=
 =?utf-8?B?NDh2ZTJQOGU5M0Zjc2pUUVJNbHptVS9CViswY0F4d0hmdFdNN1BhdHNFVGk2?=
 =?utf-8?B?ZnkvUW5Vd2xUVGtMNEdSNGZGMFMxR3lxUjZOMitNZ1hMcXRiOUlpVkpxNUNa?=
 =?utf-8?B?NFNrMUhUemxHejU0QituQytlM0pNK09xRFRIbjN5eUhIYWRVWXNQOVhVQVdw?=
 =?utf-8?B?WjRPR3pWVkxGcEg4OFErR1VFT0kwS2ZFMnBxS2FwUDVPTkgrYWV6UUlNdE1M?=
 =?utf-8?B?aTV0TDVrc25MUHMyZDBCOWFJaDBXK0JhQWVJMkVwTGxHWElOWWNxM3J0WUw5?=
 =?utf-8?B?bkRoUTE2OXRmSXZmRmViR3J2VlJpZGVlUkluTTlMZVV0NGQ0cnlVMzh1eWdU?=
 =?utf-8?B?bjhzNm1tVXMzNHN4cStyQkNJeEtMTnpDOUNXV0lpMDhKVzU3dXM4endldGhn?=
 =?utf-8?B?TVVvQWM0cEVCYm0rUUNWckhTMVpnL0pmdkxpNkN4a0dyRkJ1bjhTWDMzMGdk?=
 =?utf-8?B?d1dCZ1ZuK2xiUGVIdnAyZ2taNWRKYlhublNDVFpOcXhCR0llOGJKcHRZMTA4?=
 =?utf-8?B?NFhHekV6TENBTFlsai95RGV0MjdyZXA4UGM1QXlzRDVDc001NXdGODhubzhk?=
 =?utf-8?B?djdicEJmSmRBclpyaTNwSm12bUtKU2Q3NC90NkJGVFM5di9rZGpiYS9hLzFT?=
 =?utf-8?B?S1F1SEY4VlBUQ2xKdW1HOWZBSVhqU1BVYksrN0VWd3BCV3kyQ2ttbTNnZDZB?=
 =?utf-8?B?L2dHUVdhMHBSdUd4WGhzc0ZKUUZMQUhJSGF1Mm5sMVYzV0ZCRHNKdEk3RGFq?=
 =?utf-8?B?TUNiNCsxYWN2a1oyRVNBQWhrRnFBbStuTmpjR20vZTZwd3lyWndHcjg2cXlx?=
 =?utf-8?B?TkVBNjJNWU9iNGI2MlMrOTJZUStSQkxwR3l4dXI1VzJFeXpSLzhaYU5mWE9J?=
 =?utf-8?B?aWxZdy9YY21lZG5YV3JFeHplbXRpSGg4Um5RbGdTNERBdlorSUNHOXNEQXdV?=
 =?utf-8?B?QU1WZ28yRHF3amR6WngxUzRnR2xLNEo1UkN6R0I1Sm02Rkoya2VpY0U3OXNr?=
 =?utf-8?B?d1QyUkt0WmJGK3lBY0tUVE9qNVRLaFF4UnBIS0R0cUI1N2ZTejJCUHJXWk1T?=
 =?utf-8?B?bWFFczMvZzBycUMzU3pBWmlwY2c2Ny9KdE1LREozbk0rdFNjL3JrckI2K1I5?=
 =?utf-8?B?OVV4TmlWVG9VV0p0aEh5cXp2aC9WQWpWTnBwNTlCRXVjazFOV0tibFRKSDhE?=
 =?utf-8?B?TzV4eGNzRyswd0NmU0QwUS90dWVVZzRtQkNnT2NoS2lBdVRONHJmbzRDM3pN?=
 =?utf-8?B?dWpzTjZ0WXNRTGllWlRxbmtkQ3FLNzA0c2xHQlFaelFrMlMzUHJQMHRGMVk1?=
 =?utf-8?B?NjFHbFd4a3g1TmVsNGovSmd5eHRHMEcyUXJTZHBLMFo5UzFlVVcycGRjaWtP?=
 =?utf-8?B?TlUzK0hPbjZnSVNjaHhQZS9zWitYUWVkRlIydllWd1JxTGtTbFFWN0VhcFVx?=
 =?utf-8?B?Y2h0Y0JvK0ZXay9rY0ExTVF2QmV5aEs3ZjdicklMc0dNYUsrSmVSU2ZXRnVG?=
 =?utf-8?B?c3FuTVdSS2w1MmdRN0VXbENxT2YxcFlPQ1NhY0RVQ1lZQnFDTTJLbXR5ZVJ2?=
 =?utf-8?B?OWRkRk1GTkNEOUwzV2VtVkRWUEwxazFYMGFjQU0wUnE4bm5tT3hnNWV4RXNJ?=
 =?utf-8?B?VUxuNXVUTVo4YmxQSHNNRHdNbDlZN3NYQW9TbGhBOTExaWVGc1dDT3haWTF3?=
 =?utf-8?B?YWw1VGMreTNXRUdFeWZlT1d5T1VoRHF0dHBoWXZ6RHU3OVFaN1FuaVEvMDJv?=
 =?utf-8?B?TURBWU5vR0FaMXVEM0hBNlViWURDL1J4N0pqZVZHcElkVWxPS0JrYkNpUnEy?=
 =?utf-8?B?SmtTcW9ScXM2cldtY29HVWQ0NEZidEZWbi9EQWxTbUtPdExheXZsbmxPcUpD?=
 =?utf-8?Q?fe/PSE9fRBcVntlssuiA+Qj7D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f1dfe4-8bd6-4b25-4f8d-08dafd62b661
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 16:56:03.6518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40bfHUTuVArF536D89ArqVM/s+LuXygtdzk8+jtMer7VIqB7yP3tU3Y5cWvzJAgal7c1YPUcChoEpG6RpEwIiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8208

On 23.01.2023 13:49, Jan Beulich wrote:
> On 23.01.2023 13:30, Andrew Cooper wrote:
>> On 23/01/2023 10:47 am, Jan Beulich wrote:
>>> On 23.01.2023 11:43, Andrew Cooper wrote:
>>>> On 23/01/2023 8:12 am, Jan Beulich wrote:
>>>>> While the table is used only when HVM=y, the table entry of course needs
>>>>> to be properly populated when also PV32=y. Fully removing the table
>>>>> entry we therefore wrong.
>>>>>
>>>>> Fixes: 1894049fa283 ("x86/shadow: L2H shadow type is PV32-only")
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> Erm, why?
>>>>
>>>> The safety justification for the original patch was that this is HVM
>>>> only code.

Coming back to this: There was no such claim. There was a claim about
the type in question being PV32-only, and there was a comparison with
other types which are HVM-only.

>>>>  And it really is HVM only code - it's genuinely compiled out
>>>> for !HVM builds.
>>> Right, and we have logic taking care of the !HVM case. But that same
>>> logic uses this "HVM-only" table when HVM=y also for all PV types.
>>
>> Ok - this is what needs fixing then.
>>
>> This is a layering violation which has successfully tricked you into
>> making a buggy patch.
>>
>> I'm unwilling to bet this will be the final time either...  "this file
>> is HVM-only, therefore no PV paths enter it" is a reasonable
>> expectation, and should be true.
> 
> Nice abstract consideration, but would mind pointing out how you envision
> shadow_size() to look like meeting your constraints _and_ meeting my
> demand of no excess #ifdef-ary? The way I'm reading your reply is that
> you ask to special case L2H _right in_ shadow_size(). Then again see also
> my remark in the original (now known faulty) patch regarding such special
> casing. I could of course follow that route, regardless of HVM (i.e.
> unlike said there not just for the #else part) ...

Actually no, that remark was about the opposite (!PV32) case, so if I
took both together, this would result:

static inline unsigned int
shadow_size(unsigned int shadow_type)
{
#ifdef CONFIG_HVM
#ifdef CONFIG_PV32
    if ( shadow_type == SH_type_l2h_64_shadow )
        return 1;
#endif
    ASSERT(shadow_type < ARRAY_SIZE(sh_type_to_size));
    return sh_type_to_size[shadow_type];
#else
#ifndef CONFIG_PV32
    if ( shadow_type == SH_type_l2h_64_shadow )
        return 0;
#endif
    ASSERT(shadow_type < SH_type_unused);
    return shadow_type != SH_type_none;
#endif
}

I think that's quite a bit worse than using sh_type_to_size[] for all
kinds of guest uniformly when HVM=y. This

static inline unsigned int
shadow_size(unsigned int shadow_type)
{
    if ( shadow_type == SH_type_l2h_64_shadow )
        return IS_ENABLED(CONFIG_PV32);
#ifdef CONFIG_HVM
    ASSERT(shadow_type < ARRAY_SIZE(sh_type_to_size));
    return sh_type_to_size[shadow_type];
#else
    ASSERT(shadow_type < SH_type_unused);
    return shadow_type != SH_type_none;
#endif
}

is also only marginally better, as we really would better avoid any
such open-coding.

Jan

