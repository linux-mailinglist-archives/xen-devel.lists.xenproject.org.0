Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B697B0226
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 12:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608880.947659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlS3a-00021V-BQ; Wed, 27 Sep 2023 10:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608880.947659; Wed, 27 Sep 2023 10:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlS3a-0001yr-8A; Wed, 27 Sep 2023 10:46:14 +0000
Received: by outflank-mailman (input) for mailman id 608880;
 Wed, 27 Sep 2023 10:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlS3Y-0001yl-Bx
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 10:46:12 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1264b495-5d23-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 12:46:11 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB8875.eurprd04.prod.outlook.com (2603:10a6:20b:40a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 10:46:09 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 10:46:09 +0000
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
X-Inumbo-ID: 1264b495-5d23-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaw0Z8kbD7wRbwhXOR2k47JS9r05ocVVPWGOetg3YEg0LTASFJzo/kRSehAbPfx6WlPWyYgusknbsRuS2H0cqvwVeBgtW7FfdUg/m3TyWxMS3VK/nd3o49mE/sv8XVZb4+7QauG1qKC0g8dNKUKVvLv0fGsjl2/kuNJkJdLfizyxnRvrGLX03ArE7bFRos3dtq3yfgEWaPLXDZsB435pRYYqfYHSFqxg+FZK944uQy2knYpNRekYtmdDdJR0O58zOco1k36mfoXKVx/bQCr7hlCcvbC9cNk8Qdg37W4PALX1imqWOt4rPFUt90rObT4rA2dlGTgR3+hPN8G4KdnmyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAbnNI3Uwd/CcUPWgQ6Jmcm6lNFK9Lp38qZYaUCTxIw=;
 b=Hw/iIbcCTCP1RZu68CSOLWOpLWdAKWICgUOUxnu7NDpYHfWC6NZuy5pYBoszCuElC0P0+9hMwzrm2JPNppw5fIOWe1t7Q6mMxYTy2EdRgLyBUeT4rOXv3lJ/XD8ydUng3MDOlc26v7yTDvGLH0M70PhFnGcCL0sTac5+e4Gy+QKon0bQ99fveC2FTRSrVp+7dZfzLpNIoVr+YzuRX+DrpnfgOzEy1QbTxZJOtc/U8tKzUypGPho1lY3U3QzACjBHs7MKDtyVHUSD03skvZz8KYACL4VlF2ueIYSnl6C2hP6mawJhg/xCKzQZnCY/edcEqEvPQKvEwkjdIBC/7wyjmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAbnNI3Uwd/CcUPWgQ6Jmcm6lNFK9Lp38qZYaUCTxIw=;
 b=wlD7sy6Q0Z/gH3R50J9PN6E0AW98LmKrWxNGLQO5vjDa5ya1kyG5Nq7cUOtekJdbmGYWffpOByCdFqyBoTGWzZhDH+ZlqEHUTjxbb3k5SUrgCdAk0ZZtJ5Aeb6sxlc0XJMKurl6TH3kKq6FCRv55jnxevX/bfxedVFRImaudNQfCj7dUNBRWvCOclqei9VMcbMUlhNJlEq+FB97cvhpORdUl470JN0W8J+qw7s5KeOalsZglsJccX/bgV0i11jacX/IMZm+Tn1XF1JpNR7+rfE7TgT4qSG/gKNDN84SzEpxJNjwKWjjak1KJmlAXGyUKVPwI4BLrCZTnbsluQqRnIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0080de0-d64d-8b38-40e3-5bd779651ee6@suse.com>
Date: Wed, 27 Sep 2023 12:46:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/8] domain: GADDR based shared guest area registration
 alternative - teardown
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <68cdb299-c41c-b6a5-c9ce-bd915508ecf2@suse.com>
 <ZRPtI9UfgpCfQ4HU@MacBookPdeRoger>
 <4e1e0b28-bb0b-03f9-d62e-dd04846dd2e4@suse.com>
 <ZRQHA0u5wPXkuILV@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRQHA0u5wPXkuILV@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::12) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: b2812909-8ca7-4537-5ac4-08dbbf46f591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b3LYE1mXftp8Fcx2X3x2CVfqg2oUr6X2/psAHdw/+GTcyWy0wZ9TExX6VLq+jUIwcBE3MFZF32iQO2iGWtsXXv/0UPuVmP0AWbzBc6hAF/L1sJYZ5WCIlUNO2Tq3WEp3+hv+ElCRDFr4ukRwk+lzY7y09KldaHf0Yeyfr5MM6FSYeXlWbvJPJbFE8+fEgqLqw+TcE+fYT1Hy5jV79SNX9NmDU0e/Hyqey/6Xo/rPX/YyRhSycyiqPYTJ91CI4B9DZp4/n+qBXS4Ip7OPsYoVJ3nGD/0lnL+Iea4wvFH4rIi8V1oSv1aXRzgxqzAAX1WdNVMNdTMYuVX5fs/C/nu4T3y/jUdCNVOtjGt77X8kL7V+rZnPXqORceRQpFk2J6CSu5LarlzPSHKNjPwWaaZkal8wgkRPyXaEnlqSyOId/TGItemaH/pJMhhZbUPQYPHZFfQ+49U++wvW1UIqygfQ3aJNQLtQCpys3yJ1EDQGE3YxITj3pj5w0Zznu8gA2+dqO+1sHL0BTrkKkhvOh22ozmsYtRyDytbwKCGZa1PAGMA0y1UYTZgedNKZQY/Qxh+1XIbufcQ1rbfKt5EvlD8hBEuGXtWhaI/RvViEWyop8kJCYFwmex4y6/JB/u77PEfgqiECHb/i+SieogQ7ci6IPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(366004)(396003)(230922051799003)(451199024)(1800799009)(186009)(478600001)(8676002)(8936002)(31686004)(26005)(4326008)(2906002)(66946007)(66476007)(66556008)(6916009)(54906003)(316002)(41300700001)(5660300002)(6506007)(6486002)(53546011)(6512007)(36756003)(2616005)(83380400001)(31696002)(86362001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVBGVVcyQW1NVElyZFFRb00rRk40MVg3Lzk4Q3JGaVhnUENDU1BKMS9QbktY?=
 =?utf-8?B?OGdyYjA3ME56NnhUNWlMald6dlk2bjNWNEU2WTZQMUNYTjMyY1F6RUtQUlhS?=
 =?utf-8?B?VSt1UmdkM1hiQWp0OW9TT2NCRGMvbk5ZQ1c4Ym56a2lBdUEyY3djZkpvUEVW?=
 =?utf-8?B?QnFCM0dXazdaYkZTQWVIeThOZFhSYVpCVjl1WDVxdFNzWU1vNWc4Nm1SVGN3?=
 =?utf-8?B?VnFLSkxISElleFFJTkNZYlphOVB5M0hnaTBYU0NsdDNxNjhMeGkrRmlpMVpR?=
 =?utf-8?B?Q1FDUUVjN1lGVHFvU3BLYnpXclg1dXYrOElCR0IyUTVqaEZRa1ZOc1NGSEVL?=
 =?utf-8?B?SDZ3WWc4SWszNVlWWmo5SEMyRHp4aUZpYjl4bHVNM3I0bVRwd0hKdE1sYkNJ?=
 =?utf-8?B?aDgzQVdyV0t2VnMzdWhhRlliL1BEWEtGOElGVVFTeWluWlRJZXZPeG44VWxm?=
 =?utf-8?B?cWNJeUNueXZXbnB2cHBpTW1VOW5MUHA5Mmg5ZFp1bEV0Vm9lbngwNDJnUCsz?=
 =?utf-8?B?eFBsUlB1WGlYRHNoZmZTc0p3S2hpVCtuYkVBQ1F4clMvUEN3a2t3cmhpNE92?=
 =?utf-8?B?c3F2QzM2NGFQNDdHejJLbHQ2eUt1RUY5UGQ4YWlUcFBpY1NSOE1leHYrRElq?=
 =?utf-8?B?VjNLNnlvZ0pnNHhFMytwenFKd01BeUFDV05yTE44Z2taNnA5SzlocC9tdnV2?=
 =?utf-8?B?M3JKQnZXaFlXMWl2RHZrWHA1UXlWWGo0RUQxNCtCWDRuYWxVajZkS09PK1Bq?=
 =?utf-8?B?SHArc25uSmlPTGp2c2xkc3RjSkIrMVRUdHBtRzV5UTkwOExZdjQ5K2MyTFZv?=
 =?utf-8?B?Q2gzSm5wbUtnYURKY3Mrd2ZnT2xRQnVab0lQdGNZK0J2U0VlREdMSDUzTzIw?=
 =?utf-8?B?VjlCVHJwUlA1dkw1czRUdmJ2aWRyaUpIN05MS2NhQ2s3eGZzc3BjeC9Wc21k?=
 =?utf-8?B?ZWtDdDZ6aVVYVjU1NEs3NGk4djd2RlQ1RDFkRFRlYW16YTE0MU80WjJpM1Fh?=
 =?utf-8?B?c1RTMUVNMUhmQVdyWm8raXVVZXVBVldrRGxmVTh3eHZNNnN4dy93bUtkOVgx?=
 =?utf-8?B?QW1zNnJJYzRYRGdheEVwVkMxZUl6MzFYR3Bod1JyVVZuY1ZsYUhyTW5pUHJI?=
 =?utf-8?B?Y1pYK3F0aDJ0bnBsQk9yVnV1WXpQcjVTVzRtWm41eTVUYkJadDllZ0tzYmFE?=
 =?utf-8?B?WGRXa28vUm0ybkhvRTdhcFM3TUFzT3JXeWUzYWh3WnI4L3hETUZNL1hCZDVW?=
 =?utf-8?B?WXNkK0VkVUxVK3JxcEVmS3VHWnFWcTZPSFhWV2VPV3ZxUFBQTW5Bd2c1bG4x?=
 =?utf-8?B?bmVYVGdTNVovaExqTDNQZ01FMkdqODJNKzNBY01FWjZhSDczamppMENvR0N6?=
 =?utf-8?B?MEhycWdoVFJKOE5xT0pUNTQ0ZkcvZU1aZjRqMDVvOVZDZGo0b0dmWjArYldr?=
 =?utf-8?B?Q0FERFJ6REQxMmgyMmovSldIdFdnb0hUNENST1Y3ZXZjUHZuUExvODFBZzU4?=
 =?utf-8?B?TG1JWitpQ0JuSmV2N3MyaHAwL2V3NzlMNTRVdmVWVkM4WmtXcGhVQVpZY0l4?=
 =?utf-8?B?bmlQSCtWbGdaZndmU3BJSWlRdXlFWnZFUTV2M1YrSzd5UjRRTjZoMmhLUzIy?=
 =?utf-8?B?NXhacjlEMUFrZU43UDE5R1FaMFNQb2p2MFBVQ2o4SEpNdFkzeFc4cThmOVht?=
 =?utf-8?B?bXFIWFpMbWtUNk5kcUNUSTJwVUhnRWplVTQ4R1JXeG0yUEtEemZHbURwdGpr?=
 =?utf-8?B?cVlzRENDalFnNWNEbExkVnk5TzVMbjNRTmcyTU5YM0xReGRGYkd6RlNjK083?=
 =?utf-8?B?dlJjeDVkbGFXbkNMbUg3UjJLNVRkRjU2dXQ3L0NVUUpvVXUxcFFKcGlhVEdY?=
 =?utf-8?B?T2VoVXhFVWdZRDhXMU5pOGJsUEJLZUJoV0NnT2VMRisrdlQ5RnVrMllZZGNo?=
 =?utf-8?B?cngraW9FQ2x3U05aMXYwdFlaQUdLZktKMnUrSTYvSkQ3R3BIdG9MRTR1ZFBx?=
 =?utf-8?B?dW5hbDYrc3NFd1BoQ0tXcThuSis4cG5mQzVFaTV5cnlha1R6Z2RTZkdaYnF1?=
 =?utf-8?B?UjVzU1NHUERmWnBmN2xpTkRrK2hqNHpyQ1poY0hES1NOK3FacVVoM3czZVMy?=
 =?utf-8?Q?+uxTWXUwF4qnZqfdhM3OB1LAX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2812909-8ca7-4537-5ac4-08dbbf46f591
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:46:09.2713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4tPi5nrLtngAGICbGB+jUzVyXtodQzmTavYQSYnjZqy9nUjxintQF06MAvtoSgNrXdF/0SNwCuRKRJ1+1nhcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8875

On 27.09.2023 12:42, Roger Pau Monné wrote:
> On Wed, Sep 27, 2023 at 11:55:19AM +0200, Jan Beulich wrote:
>> On 27.09.2023 10:51, Roger Pau Monné wrote:
>>> On Wed, May 03, 2023 at 05:54:47PM +0200, Jan Beulich wrote:
>>> I guess we should also zap the runstate handlers, or else we might
>>> corrupt guest state.
>>
>> So you think the guest might re-register a different area post resume?
>> I can certainly add another patch to zap the handles; I don't think it
>> should be done right here, not the least because if we see room for
>> such behavior, that change may even want backporting.
> 
> For correctness it would be good to zap them, but there's no rush, as
> I do think guests will set to the same address on resume.

Well, I've already added a new patch coming ahead of this one.

>>>> @@ -1568,6 +1572,19 @@ void unmap_vcpu_info(struct vcpu *v)
>>>>      put_page_and_type(mfn_to_page(mfn));
>>>>  }
>>>>  
>>>> +/*
>>>> + * This is only intended to be used for domain cleanup (or more generally only
>>>> + * with at least the respective vCPU, if it's not the current one, reliably
>>>> + * paused).
>>>> + */
>>>> +void unmap_guest_area(struct vcpu *v, struct guest_area *area)
>>>
>>> vcpu param could be const given the current code, but I assume this
>>> will be changed by future patches.  Same could be said about
>>> guest_area but I'm confident that will change.
>>
>> True for both.
>>
>>>> +{
>>>> +    struct domain *d = v->domain;
>>>> +
>>>> +    if ( v != current )
>>>> +        ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));
>>>
>>> Isn't this racy?
>>
>> It is, yes.
>>
>>>  What guarantees that the vcpu won't be kicked just
>>> after the check has been performed?
>>
>> Nothing. This check isn't any better than assertions towards an ordinary
>> spinlock being held. I assume you realize that we've got a number of such
>> assertions elsewhere already.
> 
> Right, but different from spinlock assertions, the code here could be
> made safe just by pausing the vCPU?

That's what the assertion is checking (see also the comment ahead of the
function). It's just that the assertions cannot be made more strict, at
least from all I can tell.

Jan

