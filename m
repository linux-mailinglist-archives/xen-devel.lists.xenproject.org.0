Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 592FC6F7D67
	for <lists+xen-devel@lfdr.de>; Fri,  5 May 2023 09:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530236.825726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pupRa-0001og-2l; Fri, 05 May 2023 07:01:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530236.825726; Fri, 05 May 2023 07:01:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pupRZ-0001mk-VG; Fri, 05 May 2023 07:01:29 +0000
Received: by outflank-mailman (input) for mailman id 530236;
 Fri, 05 May 2023 07:01:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pupRY-0001md-I8
 for xen-devel@lists.xenproject.org; Fri, 05 May 2023 07:01:28 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7d00::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6c9b49d-eb12-11ed-b226-6b7b168915f2;
 Fri, 05 May 2023 09:01:26 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAWPR04MB9744.eurprd04.prod.outlook.com (2603:10a6:102:383::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Fri, 5 May
 2023 07:01:23 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 07:01:23 +0000
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
X-Inumbo-ID: a6c9b49d-eb12-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGTTk7dAmbA7yDjmZxie2UWRpiddIQRcyd1hM5q5LDhDTd8Buecs31o0zTFqgFmAKsgrxNKFU1BQxXsn2R1X5SZ5QxaRbtZybwpaajhm+Yuwb+ezg2g9fhREZLX7rmwBjCZikOif/QMi39fKOCLpm7oRVKZEwoemLiweV3WDERHoLBKF+VtueVjpxa7ctJyrhU4F5JVSszZGl6vnJDW4jqvSvQol8O1fGMbSZS+e57OMz5/BIRDlrmePxm0DKfeTaKNdpINiCwBmTbE3S01xEb5u6krtCCYq3iauKosGvIv1wjszeMYhPbHpAatYiDFhDR9AKFF6ATDM6vGJwE+3CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgP644fB4vQGDoxQzCaXmXM8Dvzoplud5+uNJrnPxAM=;
 b=MJnXEs6Bs09sbi6ZRm93LO/eiNTB3R4bL8smWQvG+tTP/Oi44J7x2d7XXme87mRaSQW0oY4BIprB9AQwqlPeySjKx4NQ/1w3/Cvzc/qgtYVZRoBf6MTV4iQULgpsgVtv4A+OhWntELRJ8gMZgnLkSX/IeiMp4kUUl4opHTkrvgvrs09HtMFKr7SwE3pXnqDwCgDXyaF535hGwGxS7/RRG+QAGzJRhQx51MpX9NnVVrtyYf1/PslXsfxhDW5c9CzzFe3sLUdK8mhqAORS6vvfQQIztB+n7oxcgb6PEov72KXh1EiYhRBExHZnbT0ztjfA2Jb/d51qn5v5YejXVtPuXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgP644fB4vQGDoxQzCaXmXM8Dvzoplud5+uNJrnPxAM=;
 b=n1vBKnr64oUrQuwADTAKxY0FOemGeECZ0dCwWaLX+HrCFacSQ4I3l9IjZ5ZBoSEL0gZYqHNblN4j4Ax3DXpTCow0NCWGOOihWDMKCFwEL6kJmfZvqyruNgbBzGJbDSh03i7/3+8je41PkoZarXIVzafOT0QW9f+hK+Fh5NA7HXgFsWCYSpEAY/5Zo8QNMjK12eOz+ktrVrvBSJ+uD78fnpZX5bk0myWivhjV574rDNHm3WXX9gfZwLyAQkEjqRoiCRaRKnUfktEB6QE7h2vugfRfJo691YfOmIwnIBI+UPezTdUncnASCTjKayt3flTkNrAcPugW3U1ZqBFApXIpIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7921d24d-7d4d-8829-44bf-b8c2ecd001c8@suse.com>
Date: Fri, 5 May 2023 09:01:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 04/14 RESEND] cpufreq: Add Hardware P-State (HWP)
 driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-5-jandryuk@gmail.com>
 <43c519f7-577d-f657-a4b1-1a31bf7f093a@suse.com>
 <CAKf6xpuzk6vLjbNAHzEmVpq8sDAO8O-cRFVStQxNqyD5ERr+Yg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpuzk6vLjbNAHzEmVpq8sDAO8O-cRFVStQxNqyD5ERr+Yg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0169.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::10) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAWPR04MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: f51735bd-96b2-46ea-5470-08db4d36893e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wImjxmVGKfJiO4dA0/jq1lkNIZKtYTyc55znVYGDc2hucEWorMPg1KPda9nG5W2PEOsMTAjWtonQk3R7NIOGThVJapkAtW2hg63iwQrbWoQopTTl3bZIVlIvEgVZYijTDkRRPJ7w3g/gmUUA/HNX2jwLZU5BzCH2OGMQR+xQj+3fC6/X0Hvye0cjh0DUsGsfKkpi6t87s5o1gMNQkLWbRYZD7zxXo5FEMgSUNsqaGy/9CSsOyud1hTRnUmPkxlrgRawartQMYX9CB6xBNtXVCnfTg86NtIkq7wZR6f8PULAqWvlnRMyXOY+eADZoAbwjLPnlye1IVzHitAuWpmVOQiNkYEqlMxA385lmNUVk4s02MbYHR0h2EViH+EQdYXZmD0Zx4swfFiMjIQTMNfGQlnyGS4COHiLKMVFYbAUP9exTK7d5rW+dboo2MfRpZOTRpiqMyu3VlcUHQkIvC2qTLGqCHWQ3sqZRzgRBAmRFNJfkQ2aqTx91cGjrBuHfBgx0fqZKFbpHS9x1oPciVvYD08F1V07uZ6X2gzjXdQa+Ds5nkkceEHdIxYY4kLls2hq3fRdu9Czctt9SiFJiWOaBqudAnE7X4hzm8RIYxI/uqJkpwnq+Ww9em2dF2Yw8L0Ovuvvn7aJVfzT6hRF9rWjTSQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(366004)(396003)(376002)(136003)(451199021)(186003)(2616005)(6916009)(6506007)(6486002)(478600001)(30864003)(41300700001)(26005)(53546011)(6512007)(54906003)(83380400001)(2906002)(36756003)(38100700002)(5660300002)(66476007)(66946007)(66556008)(4326008)(8936002)(31696002)(8676002)(316002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekhQdFYyOC9nMEhyY0VWRmZmY1pMNnlHV1Z5OG1GWWxKZnovVU50Z0U3bmVi?=
 =?utf-8?B?QWVqbytiYjFFaXZTcUxaeVYrNFM5Vk1sWWlIOFZzN091N25mMWowMWY1ZG5S?=
 =?utf-8?B?QnhmT1REQnVaK2dqTmVTOE9DR2hLdUJuQmViVW9XaU0yb1QvVjBUZWRBVmNL?=
 =?utf-8?B?MWtWQ2M2eC9qTFowS1FZM1dTSS9CbUIxQ1JXeTk4Qkw3TTlIUGZsQVJxRG5k?=
 =?utf-8?B?Ykt0MDVzeWVnQ0oyR0dDbUl4ZEdBMkh4MmMyMEg3MEJMbCszQlRjSzllV0Zy?=
 =?utf-8?B?bVZHTkV5TUdVUWJHY1VwVmltRGFTaHVTV2RUcjBqNm1IWkF2WU9UVXpSTWpl?=
 =?utf-8?B?d3RQWk83TUxjZnlhUndtUVVTY0I0MXlRQ2drWTZVL2F1dXRiUzA3SzdYME5U?=
 =?utf-8?B?TXN3MGMybEtremx2b3JtNDhvL0ltYlQ3bEhxOS82TUpzWXFXQXU1ckpIN1N5?=
 =?utf-8?B?MVRnSkRJTVpxRFppODJ0bVNWTGUycnZBWW9iZ0pyS3FlOW15NFNOTE4rWFBD?=
 =?utf-8?B?SjZ0RTVPYmZWaThuUXh4b21hU1FUWUwrdFN0K1hzekY3WWEveVBLci93akd1?=
 =?utf-8?B?UkhPajVDS2JhcGRtN0xheDMyZEVwRU8rR1dNSVJDUkdRdjY2M1Z3VjdtcHlz?=
 =?utf-8?B?R1FHUjlBZFpmcEFFZytCckFKMUhlcll1d0k1VnFnVGFPNHRoQk02SFA1M3RL?=
 =?utf-8?B?Rys5cjFjMW5zWTdEOWdKTXZPR3AwNC84UFc1akdrdUV3MTVLQTNKVmlUVXBI?=
 =?utf-8?B?TVQyeWNiems3MWZORmZ5MnlneUtqdW9QSlBLMlZ5NVJodElqZkErYURBWDFN?=
 =?utf-8?B?ckg5M01YYVBTZUt0THg5NmFGZHI5eTFabkhUZ3NacmFPTGlTaTl5SUlaU2Y1?=
 =?utf-8?B?bVhiWkduM3UyTzR0K1RxdURkb3VvSkVKQlhCNHFFM0RIcE9TUW5HSFZESGVu?=
 =?utf-8?B?TEVyWllvTlZ5ak9XdG1Ybm9GWmNVR3NaTWZaTTRNZW4zSUxlSXJzTnN3cWs5?=
 =?utf-8?B?c0dER0hlK0tpZ01TenVoY1dFNVVKdmxsV2lhY0NtOHVZeCtuVmVkaEVMMy9z?=
 =?utf-8?B?YWMrSExrQ2RLNWRLK1NwQ1BVVlZnaTUzRmloMEdpY0N0QVdRZUxHWW5IQlVu?=
 =?utf-8?B?NW1WTVpqV09qNlpJU293MTlyYklBNEs1UkVFTDVIamdic1pJY1hKWFdwVzJj?=
 =?utf-8?B?OEJmQTRzdDRVSERyVGRvbWZLcE80SWhxalVvS0x5YkxNSFZSWDFLMlBmOEpD?=
 =?utf-8?B?MkptZFFMTE1hMzhSdzdsZnpROUsvR200MzdyVmxEQnNDUWdWRGJ5ZXpxdFBC?=
 =?utf-8?B?NFQwc3RzZk1JQ2hES0JVbTNWWERuU0szRjlsWHErdzdGUU5UL2QvcTBNYjIx?=
 =?utf-8?B?TzBtd1pzQTRaaFRzRGx2eDBkRHE3Q2NwT1VDcEZvelFKYy83bm9nMUNRS0Zj?=
 =?utf-8?B?a3RPWmtsQWN2OWFNK2RHS0ZWVkdjVllUbWpZODVZaWRyeVNTMjhUQkRwM1Rn?=
 =?utf-8?B?dlBVd3RKaFBtVE1PekduVEkwY016T0RjWnU2TUlLUXY2U1VYUHVVemh5Sndt?=
 =?utf-8?B?TTNnbzFRSkRIMGk1SjRFL0x6OE1JdUFDSnliYzk1eno1VG9pMmlicDFXMUhT?=
 =?utf-8?B?Y0RtcERiTCsvL2RGVGVjM2N1NzNCamlGNWxRR0NSbytZM1hCYjNuSkgxWis2?=
 =?utf-8?B?ZysvOGRqeUJXTjE5THZWN0w1NUJJanRVdVI0VGJJTE5BRWYvZEFzOHdTRlV5?=
 =?utf-8?B?dks0TUJpREp1RW90K21oVGkwR2JPZWZVSk5wWHZNVXhYK09heUsyOWFFaDBi?=
 =?utf-8?B?ekFTeTZWSVc2bnF1MVY2WFpNOWlCN2EvaGhVVEJrZjl3OE9XRHdGcW0rZjYx?=
 =?utf-8?B?Z2l2MWdwMWk0K1RVWlBMbmVJSFhpNGpVU0FrN3laRGlDNGMvK3ljNnRCVU90?=
 =?utf-8?B?MEdsakJDSk9ERjM4NWN5U2dEQXppQ1RONVN3UUNiWnk3WmxzTU43cjFRQ3NG?=
 =?utf-8?B?YTlBdXlOWVVYd1NHWnpDczlNVDFvbkxNbStYMWhGWGhKWk9aT2xkUjhqL2V1?=
 =?utf-8?B?REcybDBFWk10aDhQOUM1WjkvV3I2d3RuWCtxdnRWbHVzOHVsQ3dDV0xZdkNy?=
 =?utf-8?Q?ctU/AawuOmetgGm8fbv1Qjse9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f51735bd-96b2-46ea-5470-08db4d36893e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 07:01:23.0142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqMHjUq133NACOGQE9ETWfrW7xkt2/aOYF7tocWtR5BCksiPFwD9sGsNITGKhti9w3lhAMbRZX4V++jOjurUvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9744

On 04.05.2023 18:56, Jason Andryuk wrote:
> On Thu, May 4, 2023 at 9:11 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 01.05.2023 21:30, Jason Andryuk wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -499,7 +499,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
>>>  available support.
>>>
>>>  ### cpufreq
>>> -> `= none | {{ <boolean> | xen } [:[powersave|performance|ondemand|userspace][,<maxfreq>][,[<minfreq>][,[verbose]]]]} | dom0-kernel`
>>> +> `= none | {{ <boolean> | xen } [:[powersave|performance|ondemand|userspace][,<hdc>][,[<hwp>]][,[<maxfreq>]][,[<minfreq>]][,[verbose]]]} | dom0-kernel`
>>
>> Considering you use a special internal governor, the 4 governor alternatives are
>> meaningless for hwp. Hence at the command line level recognizing "hwp" as if it
>> was another governor name would seem better to me. This would then also get rid
>> of one of the two special "no-" prefix parsing cases (which I'm not overly
>> happy about).
>>
>> Even if not done that way I'm puzzled by the way you spell out the interaction
>> of "hwp" and "hdc": As you say in the description, "hdc" is meaningful only when
>> "hwp" was specified, so even if not merged with the governors group "hwp" should
>> come first, and "hdc" ought to be rejected if "hwp" wasn't first specified. (The
>> way you've spelled it out it actually looks to be kind of the other way around.)
> 
> I placed them in alphabetical order, but, yes, it doesn't make sense.
> 
>> Strictly speaking "maxfreq" and "minfreq" also should be objected to when "hwp"
>> was specified.
>>
>> Overall I'm getting the impression that beyond your "verbose" related adjustment
>> more is needed, if you're meaning to get things closer to how we parse the
>> option (splitting across multiple lines to help see what I mean):
>>
>> `= none
>>  | {{ <boolean> | xen } [:{powersave|performance|ondemand|userspace}
>>                           [{,hwp[,hdc]|[,maxfreq=<maxfreq>[,minfreq=<minfreq>]}]
>>                           [,verbose]]}
>>  | dom0-kernel`
>>
>> (We're still parsing in a more relaxed way, e.g. minfreq may come ahead of
>> maxfreq, but better be more tight in the doc than too relaxed.)
>>
>> Furthermore while max/min freq don't apply directly, there are still two MSRs
>> controlling bounds at the package and logical processor levels.
> 
> Well, we only program the logical processor level MSRs because we
> don't have a good idea of the packages to know when we can skip
> writing an MSR.
> 
> How about this:
> `= none
>  | {{ <boolean> | xen } {
> [:{powersave|performance|ondemand|userspace}[,maxfreq=<maxfreq>[,minfreq=<minfreq>]]
>                         | [:hwp[,hdc]] }
>                           [,verbose]]}
>  | dom0-kernel`

Looks right, yes.

>>> --- /dev/null
>>> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
>>> @@ -0,0 +1,506 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * hwp.c cpufreq driver to run Intel Hardware P-States (HWP)
>>> + *
>>> + * Copyright (C) 2021 Jason Andryuk <jandryuk@gmail.com>
>>> + */
>>> +
>>> +#include <xen/cpumask.h>
>>> +#include <xen/init.h>
>>> +#include <xen/param.h>
>>> +#include <xen/xmalloc.h>
>>> +#include <asm/io.h>
>>> +#include <asm/msr.h>
>>> +#include <acpi/cpufreq/cpufreq.h>
>>> +
>>> +static bool feature_hwp;
>>> +static bool feature_hwp_notification;
>>> +static bool feature_hwp_activity_window;
>>> +static bool feature_hwp_energy_perf;
>>> +static bool feature_hwp_pkg_level_ctl;
>>> +static bool feature_hwp_peci;
>>> +
>>> +static bool feature_hdc;
>>
>> Most (all?) of these want to be __ro_after_init, I expect.
> 
> I think you are correct.  (This pre-dates __ro_after_init and I didn't
> update it.)

Yet even then they should have used __read_mostly.

>>> +union hwp_request
>>> +{
>>> +    struct
>>> +    {
>>> +        uint64_t min_perf:8;
>>> +        uint64_t max_perf:8;
>>> +        uint64_t desired:8;
>>> +        uint64_t energy_perf:8;
>>> +        uint64_t activity_window:10;
>>> +        uint64_t package_control:1;
>>> +        uint64_t reserved:16;
>>> +        uint64_t activity_window_valid:1;
>>> +        uint64_t energy_perf_valid:1;
>>> +        uint64_t desired_valid:1;
>>> +        uint64_t max_perf_valid:1;
>>> +        uint64_t min_perf_valid:1;
>>
>> The boolean fields here would probably better be of type "bool". I also
>> don't see the need for using uint64_t for any of the other fields -
>> unsigned int will be quite fine, I think. Only ...
> 
> This is the hardware MSR format, so it seemed natural to use uint64_t
> and the bit fields.  To me, uint64_t foo:$bits; better shows that we
> are dividing up a single hardware register using bit fields.
> Honestly, I'm unfamiliar with the finer points of laying out bitfields
> with bool.  And the 10 bits of activity window throws off aligning to
> standard types.
> 
> This seems to have the correct layout:
> struct
> {
>         unsigned char min_perf;
>         unsigned char max_perf;
>         unsigned char desired;
>         unsigned char energy_perf;
>         unsigned int activity_window:10;
>         bool package_control:1;
>         unsigned int reserved:16;
>         bool activity_window_valid:1;
>         bool energy_perf_valid:1;
>         bool desired_valid:1;
>         bool max_perf_valid:1;
>         bool min_perf_valid:1;
> } ;
> 
> Or would you prefer the first 8 bit ones to be unsigned int
> min_perf:8?

Personally I think using bitfields uniformly would be better. What you
definitely cannot use if not using a bitfield is "unsigned char", it
ought to by uint8_t then. If using a bitfield, as said, I think it's
best to stick to unsigned int and bool, unless field width goes
beyond 32 bits or fields cross a 32-bit boundary.

>  The bools seem to need :1, which doesn't seem to be
> gaining us much, IMO.  I'd strongly prefer just keeping it as I have
> it, but I will change it however you like.

It's not so much how I like it, but to follow (a) existing practice
(for the boolean fields) and (b) ./CODING_STYLE (for the selection of
types).

>>> +    };
>>> +    uint64_t raw;
>>
>> ... this wants to keep this type. (Same again below then.)
> 
> For "below", do you want:
> 
>         struct
>         {
>             unsigned char highest;
>             unsigned char guaranteed;
>             unsigned char most_efficient;
>             unsigned char lowest;
>             unsigned int reserved;
>         } hw;
> ?

No - it can only be bitfields or fixed-width types here.

>>> +bool __init hwp_available(void)
>>> +{
>>> +    unsigned int eax, ecx, unused;
>>> +    bool use_hwp;
>>> +
>>> +    if ( boot_cpu_data.cpuid_level < CPUID_PM_LEAF )
>>> +    {
>>> +        hwp_verbose("cpuid_level (%#x) lacks HWP support\n",
>>> +                    boot_cpu_data.cpuid_level);
>>> +        return false;
>>> +    }
>>> +
>>> +    if ( boot_cpu_data.cpuid_level < 0x16 )
>>> +    {
>>> +        hwp_info("HWP disabled: cpuid_level %#x < 0x16 lacks CPU freq info\n",
>>> +                 boot_cpu_data.cpuid_level);
>>> +        return false;
>>> +    }
>>> +
>>> +    cpuid(CPUID_PM_LEAF, &eax, &unused, &ecx, &unused);
>>> +
>>> +    if ( !(eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE) &&
>>> +         !(ecx & CPUID6_ECX_IA32_ENERGY_PERF_BIAS) )
>>> +    {
>>> +        hwp_verbose("HWP disabled: No energy/performance preference available");
>>> +        return false;
>>> +    }
>>> +
>>> +    feature_hwp                 = eax & CPUID6_EAX_HWP;
>>> +    feature_hwp_notification    = eax & CPUID6_EAX_HWP_NOTIFICATION;
>>> +    feature_hwp_activity_window = eax & CPUID6_EAX_HWP_ACTIVITY_WINDOW;
>>> +    feature_hwp_energy_perf     =
>>> +        eax & CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE;
>>> +    feature_hwp_pkg_level_ctl   = eax & CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST;
>>> +    feature_hwp_peci            = eax & CPUID6_EAX_HWP_PECI;
>>> +
>>> +    hwp_verbose("HWP: %d notify: %d act-window: %d energy-perf: %d pkg-level: %d peci: %d\n",
>>> +                feature_hwp, feature_hwp_notification,
>>> +                feature_hwp_activity_window, feature_hwp_energy_perf,
>>> +                feature_hwp_pkg_level_ctl, feature_hwp_peci);
>>> +
>>> +    if ( !feature_hwp )
>>> +        return false;
>>> +
>>> +    feature_hdc = eax & CPUID6_EAX_HDC;
>>> +
>>> +    hwp_verbose("HWP: Hardware Duty Cycling (HDC) %ssupported%s\n",
>>> +                feature_hdc ? "" : "not ",
>>> +                feature_hdc ? opt_cpufreq_hdc ? ", enabled" : ", disabled"
>>> +                            : "");
>>> +
>>> +    feature_hdc = feature_hdc && opt_cpufreq_hdc;
>>> +
>>> +    hwp_verbose("HWP: HW_FEEDBACK %ssupported\n",
>>> +                (eax & CPUID6_EAX_HW_FEEDBACK) ? "" : "not ");
>>
>> You report this, but you don't really use it?
> 
> Correct.  I needed to know what capabilities my processors have.
> 
> feature_hwp_pkg_level_ctl and feature_hwp_peci can also be dropped
> since they aren't used beyond printing their values.  I'd still lean
> toward keeping their printing under verbose since otherwise there
> isn't a convenient way to know if they are available without
> recompiling.

That's fine, but wants mentioning in the description. Also respective
variables would want to be __initdata then, be local to the function,
or be dropped altogether. Plus you'd want to be consistent - either
you use a helper variable for all print-only features, or you don't.

>>> +static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
>>> +{
>>> +    uint32_t base_khz, max_khz, bus_khz, edx;
>>> +
>>> +    cpuid(0x16, &base_khz, &max_khz, &bus_khz, &edx);
>>> +
>>> +    /* aperf/mperf scales base. */
>>> +    policy->cpuinfo.perf_freq = base_khz * 1000;
>>> +    policy->cpuinfo.min_freq = base_khz * 1000;
>>> +    policy->cpuinfo.max_freq = max_khz * 1000;
>>> +    policy->min = base_khz * 1000;
>>> +    policy->max = max_khz * 1000;
>>> +    policy->cur = 0;
>>
>> What is the comment intended to be telling me here?
> 
> When I was surprised to discover that I needed to pass in the base
> frequency for proper aperf/mperf scaling, it seemed relevant at the
> time as it's the opposite of ACPI cpufreq.  It can be dropped now.

Well, I'm not insisting on dropping the comment. It could also be left,
but then extended so it can be understood what is meant.

>>> +static void cf_check hwp_init_msrs(void *info)
>>> +{
>>> +    struct cpufreq_policy *policy = info;
>>> +    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
>>> +    uint64_t val;
>>> +
>>> +    /*
>>> +     * Package level MSR, but we don't have a good idea of packages here, so
>>> +     * just do it everytime.
>>> +     */
>>> +    if ( rdmsr_safe(MSR_IA32_PM_ENABLE, val) )
>>> +    {
>>> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_PM_ENABLE)\n", policy->cpu);
>>> +        data->curr_req.raw = -1;
>>> +        return;
>>> +    }
>>> +
>>> +    /* Ensure we don't generate interrupts */
>>> +    if ( feature_hwp_notification )
>>> +        wrmsr_safe(MSR_IA32_HWP_INTERRUPT, 0);
>>> +
>>> +    hwp_verbose("CPU%u: MSR_IA32_PM_ENABLE: %016lx\n", policy->cpu, val);
>>> +    if ( !(val & IA32_PM_ENABLE_HWP_ENABLE) )
>>> +    {
>>> +        val |= IA32_PM_ENABLE_HWP_ENABLE;
>>> +        if ( wrmsr_safe(MSR_IA32_PM_ENABLE, val) )
>>> +        {
>>> +            hwp_err("CPU%u: error wrmsr_safe(MSR_IA32_PM_ENABLE, %lx)\n",
>>> +                    policy->cpu, val);
>>> +            data->curr_req.raw = -1;
>>> +            return;
>>> +        }
>>> +    }
>>> +
>>> +    if ( rdmsr_safe(MSR_IA32_HWP_CAPABILITIES, data->hwp_caps) )
>>> +    {
>>> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_CAPABILITIES)\n",
>>> +                policy->cpu);
>>> +        data->curr_req.raw = -1;
>>> +        return;
>>> +    }
>>> +
>>> +    if ( rdmsr_safe(MSR_IA32_HWP_REQUEST, data->curr_req.raw) )
>>> +    {
>>> +        hwp_err("CPU%u: error rdmsr_safe(MSR_IA32_HWP_REQUEST)\n", policy->cpu);
>>> +        data->curr_req.raw = -1;
>>> +        return;
>>> +    }
>>> +
>>> +    if ( !feature_hwp_energy_perf ) {
>>
>> Nit: Brace placement.
>>
>>> +        if ( rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS, val) )
>>> +        {
>>> +            hwp_err("error rdmsr_safe(MSR_IA32_ENERGY_PERF_BIAS)\n");
>>> +            data->curr_req.raw = -1;
>>> +
>>> +            return;
>>> +        }
>>> +
>>> +        data->energy_perf = val & IA32_ENERGY_BIAS_MASK;
>>> +    }
>>
>> In order to not need to undo the "enable" you've already done, maybe that
>> should move down here?
> 
> HWP needs to be enabled before the Capabilities and Request MSRs can
> be read.

I must have missed this aspect in the SDM. Do you have a pointer?

>  Reading them shouldn't fail, but it seems safer to use
> rdmsr_safe in case something goes wrong.

Sure. But then the "enable" will need undoing in the unlikely event of
failure.

>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>>> @@ -46,8 +46,17 @@ extern struct cpuinfo_x86 boot_cpu_data;
>>>  #define cpu_has(c, bit)              test_bit(bit, (c)->x86_capability)
>>>  #define boot_cpu_has(bit)    test_bit(bit, boot_cpu_data.x86_capability)
>>>
>>> -#define CPUID_PM_LEAF                    6
>>> -#define CPUID6_ECX_APERFMPERF_CAPABILITY 0x1
>>> +#define CPUID_PM_LEAF                                6
>>> +#define CPUID6_EAX_HWP                               (_AC(1, U) <<  7)
>>> +#define CPUID6_EAX_HWP_NOTIFICATION                  (_AC(1, U) <<  8)
>>> +#define CPUID6_EAX_HWP_ACTIVITY_WINDOW               (_AC(1, U) <<  9)
>>> +#define CPUID6_EAX_HWP_ENERGY_PERFORMANCE_PREFERENCE (_AC(1, U) << 10)
>>> +#define CPUID6_EAX_HWP_PACKAGE_LEVEL_REQUEST         (_AC(1, U) << 11)
>>> +#define CPUID6_EAX_HDC                               (_AC(1, U) << 13)
>>> +#define CPUID6_EAX_HWP_PECI                          (_AC(1, U) << 16)
>>> +#define CPUID6_EAX_HW_FEEDBACK                       (_AC(1, U) << 19)
>>
>> Perhaps better without open-coding BIT()?
> 
> Ok.
> 
>> I also find it a little odd that e.g. bit 17 is left out here despite you
>> declaring the 5 "valid" bits in union hwp_request (which are qualified by
>> this CPUID bit afaict).
> 
> Well, I thought I wasn't supposed to introduce unused defines, so I
> didn't add one for 17.  For union hwp_request, the "valid" bits are
> part of the register structure, so it makes sense to include them
> instead of an incomplete definition.  IIRC, at some point I set the
> "valid" bits when I wasn't supposed to, and they caused the wrmsr
> calls to fail.  That might have been because my test machines don't
> have package-level HWP.
> 
> (I was confused when the CPUID section stated "Bit 17: Flexible HWP is
> supported if set.", but there are no further references to "Flexible
> HWP" in the SDM.)

A not uncommon issue with the SDM. At least there is a place where bit
17's purpose is described in the HWP section.

>>> @@ -165,6 +172,11 @@
>>>  #define  PASID_PASID_MASK                   0x000fffff
>>>  #define  PASID_VALID                        (_AC(1, ULL) << 31)
>>>
>>> +#define MSR_IA32_PKG_HDC_CTL                0x00000db0
>>> +#define  IA32_PKG_HDC_CTL_HDC_PKG_ENABLE    (_AC(1, ULL) <<  0)
>>
>> The name has two redundant infixes, which looks odd, but then I can't
>> suggest any better without going too much out of sync with the SDM.
> 
> Yes, it's not a good name, but I was trying to keep close to the SDM.
> FAOD, these should drop IA32_ to become:
> MSR_PKG_HDC_CTL
> PKG_HDC_CTL_HDC_PKG_ENABLE
> ?

Right.

> Thank you for taking the time to review this.

Well, it has taken me awfully long to get back to this.

Jan

