Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01EC6224E3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 08:49:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440699.694826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osfpQ-0000vq-89; Wed, 09 Nov 2022 07:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440699.694826; Wed, 09 Nov 2022 07:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osfpQ-0000u4-58; Wed, 09 Nov 2022 07:48:56 +0000
Received: by outflank-mailman (input) for mailman id 440699;
 Wed, 09 Nov 2022 07:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osfpO-0000tu-8R
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 07:48:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f443a077-6002-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 08:48:52 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8090.eurprd04.prod.outlook.com (2603:10a6:10:240::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Wed, 9 Nov
 2022 07:48:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 07:48:50 +0000
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
X-Inumbo-ID: f443a077-6002-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVlHck2UVaESfLjYARVDzZdYNnrWF3cOs4viRac9yMHi2/xYIDzC9GhGZ0pXNn/GRUL6aSLnzC5Dj9KVtLtlP5n2Mg+2nIeXA2HR5qdrrwazvI+JhNBpNj4VfKV3zL0prC4QTIQGxBiwb3wl/I9ztZnxHmCXRrfA6E9TJiTBrJn37E663wqkrzM9Ustei844rsPMZUYEtCjcFBvHQhfRzyeq14DDirf6y5cOlGvV/N3cInrj4iPnYeGs7KxyljTAmAgr0fVGnMbyk0NWkNxxjOg90GyvY9VTIkqYRc9Xys00N2LafS7TBx+ebMVCAy4LvQRIe/YT7/VUlqH1HkSDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKH4JaUgRKCwicJiM/krBpGdA1YlWxuELBpvJnmru8c=;
 b=N6e6vN+8GF4Dsq+/sYzERjmyJfOXiSAZqxEf+yiLyGbsw4waohirFbD9eXn+NLgXM88DUrYRxyUeuSQRWs0MKpdiwUobM26XYlrMeZK7HYSUoaW9COOAd5wG8T74nDlHQe+4+4Ig3CBYIpWy3LtDicAz9PjuYShB7oIU6F+VjaGbJ9uiG21m+Yhxm9n76dAEeJbgFvXBW0ESsXT8GvQ0qpVZblMx/aaTILZM0HjUPGuU8IzvO+gfo+Sv/3mnkaPY4l9Sm7o3E+ufSJ4ejdW4HfSzDlfueo1aBKtHboC0f9m03K65B1caq+JJzRRynKFw5WDkwdNRN85PcXmia/flCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKH4JaUgRKCwicJiM/krBpGdA1YlWxuELBpvJnmru8c=;
 b=JlgMKQdKau78Vh+STLTb45C67r5ZstJCdP5F01nlSr9iR4D0eKmow8qMCRORwQwN/opWdgA4ZyuqhBTybs0lsy6uHkQcunWsMbe9/jv0YrGM/+KXdCKG9SzANeQVUIt+DJHozvxkdaiAP8O81Hbg+jEQUpqAn9+dJ+Mal9YHhGoM3IMySFfzj2Eb/JD2jspI/KdIrAC9NBRk0hL5oE6bV/jjbiyomRppk2bV2Jtj97Zo1dcSLoS8BHq4CltKFSXSCmcB18ijjAV2p4y/5LZAgKLFNxYxlZ8H5bTy9c1qW09ZADeQr0+32d/KEj6pmHWcZoWKoffYuzCnZI/KK6K9JA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76cde159-088a-3351-56e2-0cf14e9c8116@suse.com>
Date: Wed, 9 Nov 2022 08:48:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
 <Y2qHOfemg/wrc07N@Air-de-Roger>
 <58d5e890-e052-47df-42bb-6cc84aedd4a9@suse.com>
 <Y2qOtSyuM43RfwAx@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y2qOtSyuM43RfwAx@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8090:EE_
X-MS-Office365-Filtering-Correlation-Id: 033537fb-c29b-401c-d9d9-08dac226d754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KtTnKtRocHajTQ5nuIAXq4KR3iJA5bcX6EtBT4zLpgbyrdVXNoscpbpD3lk63nfnGuudwUvC1LSQzU5Js8CaaNQMXdnLJC4JoSefD5XvZbJRVFlwoyQ/8VovHR6YxdkH01z29YHu7CRCCJgoJq/iU/rBA8MaAIOJQhVijETN1CmoyaSH+6lgU+22OwHkQ6k01fofCHAaCSAFUqgDuEIOi7UueGw/VlPSfR1oMAT40u7l8lUjdhaAZXnLXQWFw0xq4YY7SOW0X/BXCm4HAGa549hdlaUaT7f4O7D1EdrQvgJkXkfIRnTfVk6LgLXLCb97syDmaX7VpV4xwAXToYOUbo2hTts/sgC44/lp2pccP5fyYbkvqdP5g+hVTv+VzB9K6BZqJL357IT1oJCIfB5SF8e8FyohVPeQGtHFXzL6RXZAWqw8/082wzW4RWdur9dF+Eog0EBr1oSW/Nf9Nh706WB/zGjI671ZLIxsBdzB5eYgi3B5ohKGDpnVy/6PYGyvefjFypLUABYQ9SK5UaK3ToTqytRG7lSFrs25G6bpl85FNzLAXOdElH1pWeQxTNCoiTW4aRo5uuv34O3J6yVlSbJIK2LzJgglhVlKVVY2Fy8znGORivfuZG8xAlGyK0xVUScaM/l8gVSikr5mthhX/5eAy2bynXXfNCehx5Axcu6URKMGhBaDaioNtQBd/vTf3hoqp44NW824yP6YaIXjrL2xj+Dw0qSLjG8vFcXqw0DWawWFNG/0XWcbgIVkfCZrCpqZDY+9oO6inmjLUSGLeNNOKdHmbcgGVd/qtvNyL74=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(39860400002)(376002)(346002)(451199015)(36756003)(31686004)(31696002)(86362001)(66556008)(2906002)(26005)(5660300002)(38100700002)(83380400001)(186003)(6512007)(2616005)(6506007)(53546011)(8676002)(41300700001)(66476007)(4326008)(316002)(6486002)(8936002)(66946007)(6916009)(54906003)(478600001)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTFHYVU1d3EvcXVaWGpnNjVqZmgwNGdHNzlFZ1ZSN2puZ00rSi9LbTNORlV0?=
 =?utf-8?B?d1VvOWk0WkxNMDJBTVJXOElGZlNKUGpXOWlhUGNXam50QWJqTG5NdENoWmVS?=
 =?utf-8?B?YTNTLzBacjQ1Q3V0TkY2RUQxN1RFVC9iMmNKQUM2NkFjV3ZJc2s0U2ZycnEv?=
 =?utf-8?B?djNVQTdVcTJPRkU3ZFd4R1lRbTRKTTRFWVV3L00wQ0huTWx0YUZRS2pOcXNR?=
 =?utf-8?B?TDVXSGN5ay9PcG1hYUFTZUdKOEFvV2lwbjRCTWJRRXVuQ0hUYzFxQkZUcWF0?=
 =?utf-8?B?S2trU2NUWWVFRVJrcTN1bTB2QWU2M0xkUGFxQnVvWTNVcUhjSEF2K3NkUWJ6?=
 =?utf-8?B?TFB0WTJBZjBFVGw2c3BuWGlwYzltVFkxMzZzQUZkbExyMnZvUWJIMm9Lcyt5?=
 =?utf-8?B?emZnSVhHUDhPNnp5RjNRUWwvWStCeGFpaThsNjBzSDdHVXN5WmRMWCszRXNT?=
 =?utf-8?B?a3B3VDZwVUI4T3FBRzJOUFAvT1V0OFlvRmpZVEFrNjdhYkxBamZwbVBvVzh5?=
 =?utf-8?B?cytMRVNRS2s2aUNTVjd2QjN0ZEZOSWZQbVcwOTdnTXV5U3U2V1diS3lYWi9W?=
 =?utf-8?B?Yjd1amt5UGxIUDhZMGpiUXZOZHZabWNjVkVRN3NvK2drOTMyZDJ4Z01yMEk4?=
 =?utf-8?B?ZytaYXBXaFBBb2RpemJEYU1XOEJIWmR5OEpnVHJhMHhGMUwwSU52aXVJUXBT?=
 =?utf-8?B?Z1FRcks3UHE0RXhKeWVoQVV3UHJmR2VJWVB2T3ArclhrYmxrQ2FlWkxvS0pQ?=
 =?utf-8?B?SUlISHVQTjVWa0FNV1pkWnhYMWsxdGk1OVZ1MFpLNGxxTXRMOCt3TVBaOVFS?=
 =?utf-8?B?dmEyOEVmNVNkT1RoSjE4Q0dZM2QzbTlLMUUrSUxXWitHcmhKYWVWQmk2SDdI?=
 =?utf-8?B?UWR5eWN2Nno0N1h4SjYwSENrZ0YzVFV6SmY5Q1k4RGEvaGNGbWxidjZUVmpX?=
 =?utf-8?B?cmpxKzQ0Vy9xQTNYUGlCTkR6eWg1enBMWTM4cW9FS3hlaHZVRlhwNDBMSVZa?=
 =?utf-8?B?bFc4b3NMTllmak9tNkNLUTVIbzVtT0RzQ1N6ZnQzeGliNVBld0lvK0xXMTI5?=
 =?utf-8?B?SE8vQ0RUUCtvOG1kaEtlbndwUEhjMGx2S2tsM1dyc2FRRndldEhvTGhjNFNZ?=
 =?utf-8?B?M3ZRd0JMUlIrVVRzei9SaStYT1pXRzdnU3NoZzA0V0U3aW16VmcyQno5VEVi?=
 =?utf-8?B?SkZnQmhyS1kvTllGWnIrQTU4V3RlbW15RVV5LzdJb2dtKzJScVVDZCtrWENz?=
 =?utf-8?B?NTMzVEpJRmxnODErSnVtZGdOTElPbkJUS29OSHVvS3BBd3RqQmd5N25Xbmhr?=
 =?utf-8?B?Vk0xOGE5WDhGSm13WC9PbHNxSlhlUU1zeXF0L1VvbVcvQnpSd0V0RzAvdjY3?=
 =?utf-8?B?dlRObkIxVHUrSXZqVllGcjlCdThHd1RSbE1RdVVvakRtNEpEVmVrR0ZXYVhU?=
 =?utf-8?B?c1cwU0w0SEYxUG9heVVjZitqRjlic1phejE4YmFpVjlQNk9ZaENHOC9uN1kv?=
 =?utf-8?B?MXhDc2RKd2tOaHhPYWpObkg0VzFqVDVRREJWalJsZytSb3R5Uis3dVN0UVV2?=
 =?utf-8?B?cVdnUGVtWUx3b1cvRTlPN1hNdDhOZEZPbFQyT2NPakY1UEhkNFppZ1B4Zjln?=
 =?utf-8?B?aHQxblJzU0wwamJmS0Uwa05BOFo2NzJBK3h2Ynk5ZjRlTG1KSlR3a3pNSGo3?=
 =?utf-8?B?QkExUS9oT3lUQUNpeTdpdFY5bHdoL3dFOFduUDRKUkJkVkdXeGh3aDd6Ymhv?=
 =?utf-8?B?aHErbFlxYy9oOHpEaUc1UG5WNitZbFA3UkZzSmFheEZnRWJpK2MvV3UrTEJW?=
 =?utf-8?B?WnY2WWNtZnpxTmxQOXZrR0JEUnVXMUtZN2hNQ2htdVlZQlhXVXJsUERoL2lO?=
 =?utf-8?B?K1h0UG9HbXVxS3V5UUxvRklSRUpSY0xPdExNRTZUWjJMRzc1T1ljaGtlQ1Jt?=
 =?utf-8?B?bkNZTVBrdFNDTlErYWRDc01CMDFVcER2NkdOZjdkT016dEpYRWQ0VEwrb1lx?=
 =?utf-8?B?dVo3dVRKWlRBcjFVbmd0bUkyTUpyb2pBa0V0Sjg0TVRuWWh4N0drYjNuS2tv?=
 =?utf-8?B?RlUwZThSbGl5SURRTkQzOE1meUFSS1Q5UThMdDJaOEkyTWJkM1NQSTJwQ0dG?=
 =?utf-8?Q?1O9Zmmevi9fmsNou2GRLHUV2+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033537fb-c29b-401c-d9d9-08dac226d754
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 07:48:50.4960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCuWVH2L0DXyRQny6/apiSeNdzmJRWoYG9OoHZXZt+dkGdnWSY7v7TTYjIyolVvlWWUGliScWWcBJvr7sg/KWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8090

On 08.11.2022 18:15, Roger Pau Monné wrote:
> On Tue, Nov 08, 2022 at 06:03:54PM +0100, Jan Beulich wrote:
>> On 08.11.2022 17:43, Roger Pau Monné wrote:
>>> On Tue, Nov 08, 2022 at 05:14:40PM +0100, Jan Beulich wrote:
>>>> On 08.11.2022 12:38, Roger Pau Monne wrote:
>>>>> Like on the Arm side, return -EINVAL when attempting to do a p2m
>>>>> operation on dying domains.
>>>>>
>>>>> The current logic returns 0 and leaves the domctl parameter
>>>>> uninitialized for any parameter fetching operations (like the
>>>>> GET_ALLOCATION operation), which is not helpful from a toolstack point
>>>>> of view, because there's no indication that the data hasn't been
>>>>> fetched.
>>>>
>>>> While I can see how the present behavior is problematic when it comes
>>>> to consuming supposedly returned data, ...
>>>>
>>>>> --- a/xen/arch/x86/mm/paging.c
>>>>> +++ b/xen/arch/x86/mm/paging.c
>>>>> @@ -694,9 +694,10 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
>>>>>  
>>>>>      if ( unlikely(d->is_dying) )
>>>>>      {
>>>>> -        gdprintk(XENLOG_INFO, "Ignoring paging op on dying domain %u\n",
>>>>> +        gdprintk(XENLOG_INFO,
>>>>> +                 "Tried to do a paging domctl op on dying domain %u\n",
>>>>>                   d->domain_id);
>>>>> -        return 0;
>>>>> +        return -EINVAL;
>>>>>      }
>>>>
>>>> ... going from "success" to "failure" here has a meaningful risk of
>>>> regressing callers. It is my understanding that it was deliberate to
>>>> mimic success in this case (without meaning to assign "good" or "bad"
>>>> to that decision).
>>>
>>> I would assume that was the original intention, yes, albeit the commit
>>> message doesn't go into details about why mimicking success is
>>> required, it's very well possible the code relying on this was xend.
>>
>> Quite possible, but you never know who else has cloned code from there.
>>
>>>> Can you instead fill the data to be returned in
>>>> some simple enough way? I assume a mere memset() isn't going to be
>>>> good enough, though (albeit public/domctl.h doesn't explicitly name
>>>> any input-only fields, so it may not be necessary to preserve
>>>> anything). Maybe zeroing ->mb and ->stats would do?
>>>
>>> Hm, it still feels kind of wrong.  We do return errors elsewhere for
>>> operations attempted against dying domains, and that seems all fine,
>>> not sure why paging operations need to be different in this regard.
>>> Arm does also return -EINVAL in that case.
>>>
>>> So what about postponing this change to 4.18 in order to avoid
>>> surprises, but then taking it in its current form at the start of the
>>> development window, as to have time to detect any issues?
>>
>> Maybe, but to be honest I'm not convinced. Arm can't really be taken
>> for comparison, since the op is pretty new there iirc.
> 
> Indeed, but the tools code paths are likely shared between x86 and
> Arm, as the hypercalls are the same.

On x86 we have both xc_shadow_control() and (functional)
xc_logdirty_control(); on Arm only the former is used, while the latter
would also be impacted by your change. Plus you're not accounting for
external tool stacks (like xend would be if anyone had cared to forward
port it, when - as you said earlier - the suspicion is that the original
change was made to "please" xend).

> This is a domctl interface, so we are fine to do such changes.

We're fine to make changes to domctl which are either binary compatible
with earlier versions or which are associated with a bump of the
interface version. The latter wouldn't help in this case, while the
former is simply not true here. For Andrew's proposed new paging pool
interface the behavior suggested here would of course be fully
appropriate, demanding that tool stack either don't issue such requests
against dying domains or that they be prepared to get back errors.

Thinking about it again I'm also not convinced EINVAL is an appropriate
error code to use here. The operation isn't necessarily invalid; we
only prefer to not carry out any such anymore. EOPNOTSUPP, EPERM, or
EACCES would all seem more appropriate. Or, for ease of recognition, a
rarely used one, e.g. ENODATA, EILSEQ, or EROFS.

Finally I'm not convinced of the usefulness of this dying check in the
first place: is_dying may become set immediately after the check was
done.

Jan

>  I
> understand that we want to avoid such interface changes as much as
> possible, but I think we need to fix the hypercall to return error
> codes rather than implementing workarounds to try to cope with a wrong
> interface behavior in the first place.  Or else we could be
> accumulation workarounds here in order to fool caller into thinking
> the hypercall has somehow succeed, and provide kind of suitable
> looking data for the output parameters.


