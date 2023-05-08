Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797336FA001
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 08:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531255.826818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvuRA-00024g-Fx; Mon, 08 May 2023 06:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531255.826818; Mon, 08 May 2023 06:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvuRA-00022o-Cy; Mon, 08 May 2023 06:33:32 +0000
Received: by outflank-mailman (input) for mailman id 531255;
 Mon, 08 May 2023 06:33:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tnRg=A5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pvuR9-00021T-3a
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 06:33:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f187d1a-ed6a-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 08:33:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7399.eurprd04.prod.outlook.com (2603:10a6:10:1a8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 06:33:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 06:33:28 +0000
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
X-Inumbo-ID: 3f187d1a-ed6a-11ed-b226-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWJ/AxrNZ0y+upsEEMLi6SG/3eIDfw+64OzzdTCKJuhAiH/dEwrIH2b1JT88ScPGyh7JbKPLVJh69W9ev0Qw544r+bFGZCbgVMdQyNuPZu/4Yb5gblwb+oFIgqXHzk9DY04xAH1Z6fe/FLtu9l/znsfWZFq/c6Btq1KbI6xk5NeTU3uA9wKySSy4LEMLmz+rv9tqAtQDIDePsHZU+MxD7Ud4GEaetHQ3oOQqxMDMa0st/6+w+o0bz4DmzROOPm50ccP3hKbjLlU470lv24rLthiSn1Vp847166PNQVx7wqMu38vXgpiOi4xh9MaD6mC1LVJfRpnePxAShqXMz18m8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c5O7KY9QSWascfGNjL6Q66F/DwxuFFAclnLFTBRS6Q=;
 b=axo79+BPAmJFVE4KYOd3e1IHJhDfFCWX/lBlAMTi4cvWIgggpnwhb6u30/S6WHWDoqSJuLgdU6Oevbmh7oCWOCKuF7OZYevXpI/y4rkxqlCNA1VNXSfQzXRzw5VTnv1qHvwqUyKaLSZEywFv9B/gl3w694AlQ7FLQixTSxdeUHIJT3LBVJZlVIym63POBVb/Fllw4KEyw9cKyPZcwylPwD1woKb/eUXzoEhzu3xpsIgAXcQ134cKBnl/LXUNaSy0B+06WsRnZ1pAEt5oPYeQI54j054pCyeXCClrr18nzZWXv18iNUH4tGiA7jssqVYAIwXZ2gOFCcK9G613urHdvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9c5O7KY9QSWascfGNjL6Q66F/DwxuFFAclnLFTBRS6Q=;
 b=a2dG1uxhVIT0MSURjh9a+JmR83A/8TFzfMeY1DSdsHlG8UgJMO26Ji2ND72SEH2c7bz2mAB9/o7TsdC15vkzWuO3NypQ+m9H2WlvrFfHTM6tehFoq75fVwd9BkO38zHLNTolxNm0dAkAraWmin2t/YHGkgTXaqOi4ZrtbohEMsVb/uXCszd6xc412xrGQsrSp4r8u5gRub+4+pwPIQjuGFOMtRxD/sVWNtbayl9r3+D0Ti3IuQdhriv0l1JnJ425M347KgqHhaF6XfmlKR5McnBtDeFf62EGez5InBXEVp3fGUgEQL6I0P9lkqkufZbuiGnaXA+naB6HAFxWMvwu5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4bf60ae8-7757-7440-1a4c-95260c0f0578@suse.com>
Date: Mon, 8 May 2023 08:33:18 +0200
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
 <7921d24d-7d4d-8829-44bf-b8c2ecd001c8@suse.com>
 <CAKf6xpt0n2GO1PuqeaiWi6iOoeBt0ULoKJ4xgeiTZo2Rh67kVg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpt0n2GO1PuqeaiWi6iOoeBt0ULoKJ4xgeiTZo2Rh67kVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0043.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7399:EE_
X-MS-Office365-Filtering-Correlation-Id: 28a6ff3c-ef62-4532-8175-08db4f8e224b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YD+lO2PjHBs9ZsWhTnLA1UyK91pClsJqNHVPwnSulhSA8+pBImeapAuLKtJyGDELsnbhvrrt5n82Aj6sPl3V2AYxt44bvpq4uX7mHBe2+KId4ISkO5ZnONvTbrJXsKOHK2y0HSk+rHuFhlJRP9l7WJm21hKExXg+F7RJm4r2Gxykz4sa9B6/r8Kq3nL58EAucJv16xwyeSgQ201QGeKIj7niGjMK0p+onZEnoCy6nEjH13/1hjMpsXKh8uVjRTdDpFQ2DRsLHSmTib0YlClLG2qYOj9tuMt/ybYfo2hlPZ56/xPhBiJV6/sBvwRRWDYCy9DSJrCc2aWcPJr+qRRC8LWBZxn40NYCV1s0MKeXuErX5fxzfcFx/tkrgDhqYopmHbPDZR138QzGDz4QHgSGM9VReFOtMv9gQR/hN8YsvhZ1RVi1IawrZaBKPAO5jFYksulgmfWlmATVP3AMJFw46iZs4BN5kmCYnlNZsKfvxiOe5K/LAju9qGWy0TI40uf2jqr2i5CHJhIgcvxiWOaFgkMQIsFPhbNUogs6ZP/1VUymbWR4IUGogKpJssOGmtt3IijuvFFzCGSsfpoTq+LY5IuwWrgoE7UjpCim0UsQpC7MV56UilW67wAdM1kJgHjtHBjVktNsJYPpeoC5g8jWPQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(39850400004)(346002)(396003)(451199021)(31686004)(478600001)(54906003)(2906002)(8936002)(8676002)(316002)(66476007)(66556008)(6916009)(4326008)(5660300002)(41300700001)(6666004)(66946007)(6486002)(6512007)(6506007)(53546011)(26005)(186003)(2616005)(36756003)(83380400001)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2NEN3A2c1VnVmxaQlJCWTJVWWwrSjU4MEJqckxsN2h6cnB6TGJQRnBndXFn?=
 =?utf-8?B?ZFJXQzVDdDU3ZVV4YjYwVkJhbERPYjY4a1FDanpxOTA0SkJ1N0V3b2VGZWRn?=
 =?utf-8?B?K2RSb1Y4VEJDWjV5eXp6V3JYU3JwNVNocGdEdmtXaTZUMUFwQ0tsNlVKd0Jx?=
 =?utf-8?B?emtqbzBQUU5hZ1RNcytJS3UxMWZsclg3VGtBRkFEUnUyUDBSK0FWR3RwRzJ6?=
 =?utf-8?B?VzhiRlU5RUpxVWFBMWhwYkFDWFVnR2ZmQWF6MlpkWU13S2hMZ2JuZDAraUV1?=
 =?utf-8?B?aEpIaG5teUN6REpoVFN0L09oeFduV2psNHc3TW03VFNrR1hDb1hDaWhreW1j?=
 =?utf-8?B?U2xaUXBWazZEa2t6Y0F2bkVlNi9Ycy96em44ZnRIMnBZdVA1c2krWEtScEN0?=
 =?utf-8?B?cHVVRGxVVU9oVngrT3lYdHhLUU8yS0lFQTZNT2NnY0JRQ3hIMW5hRytwY0ta?=
 =?utf-8?B?TnVOVFZNN2pqTXZVMDZZREFucXhUdnROK0VNL1ZyWnIzbVNkK1Z0a2p5am1J?=
 =?utf-8?B?RTAwdkg5RDFCRHBqczBaUkUyM01rcVlmYzZtNm9FdkxjamJEc1RPMnVLdlpp?=
 =?utf-8?B?YXlKY3YyYWQzSUtScnNHR3ZleGhMRytrZlNmdzhkUzIxVjVnUmpheHVROWp4?=
 =?utf-8?B?OVhLKzJwZFJLZGc1ZzNBN0ZtZ2xRTW1oNFV4Z0MzQ2VSYmd0WmFRN2tLQklG?=
 =?utf-8?B?TkZOOUsvSEliU1RqVGR2ajcvdkhrL1hNM0hIUzc5bnNvMUJhRy8wQ2FpdnFq?=
 =?utf-8?B?eXN1MzROcUduWHVvSFhzYmV0cndQWDN6QUVhUWQ2dllTNzhQU25TQlRpWkhN?=
 =?utf-8?B?UmE2d205aDFGa3U2UGNnYXZEeDFzT1RhQ2FRbEdwRG1tZzg4cHVRS2JtWlVx?=
 =?utf-8?B?RGdrVllWOWZBTVRyR3VMSFdhdDdkaXdHeXI5ejFqVitzM2xtQWkrTlFZNzFB?=
 =?utf-8?B?dmQwTUVwRE14WVBrcXZJS0hSWnh2ajlkV21ITjE4UmpGSnlzMXVCZ0Qra0N6?=
 =?utf-8?B?UEsxSi9CU051Kzd6NFpJazM0SHlIb2NPWGR3WHVMSWw2WWN3STBzZ3BHQjVR?=
 =?utf-8?B?Wk9LSTd6dEtUNitHTFpqTGJFM1plVDdtUHJNMVphMEMreUVTclR1SXNMcDJP?=
 =?utf-8?B?a1lqMURlNnZhUnFpQm00OFlwY3Jqd3A2ZDdYa2tIc1hqR0dHU1YzME5vSThx?=
 =?utf-8?B?TXFsb2hqb3R3a2lzTlFacEN4dlVTeEQvU05WN004SkVkUHpyRnBLN1N5UEUx?=
 =?utf-8?B?bDlqOHF1T0VMMXFoeTloYTZBeFlpQ1Zzb2RCOGt4cmd6N2xVM0l0MWtqK1M2?=
 =?utf-8?B?cEJqMXBMcWI2OWJMejh2aHhlOVF0dGtsVm1yM3lCb2ZrUlhhcUZCOC9pbDV3?=
 =?utf-8?B?bVFJMlFuRngvSkl2KzFtdFlsa2JOeklkZzhkeTAwajlHekEvdVBrdktrTk02?=
 =?utf-8?B?aTl3b1V5WmphS3d5UHZhYzd4MVZuYVA2akZtUU10MnJyOGFueFdNSEZDS1Y1?=
 =?utf-8?B?bHNESURMTG1QTU1jRTBWbkRZWGZBZ1hQM3BFdWZLdFAzdWhPQTlZRWpxendJ?=
 =?utf-8?B?Rnc3eDlBZjRMb1lCazY2NTVqeEFwbWEvYlBzWW02emFoSmlVTnJ4bGxCZmE4?=
 =?utf-8?B?UWJhdHNxYXU2dlhvSDJ6S0N3UjN2aXFXVFVPa0hodElZYThjemd6QVI1VEJh?=
 =?utf-8?B?Ti9CRERDRTd3MU9NQk45MHFYQmYyRHYrUlF4K2d0UlBZMEJQc1RVRWJVRVpV?=
 =?utf-8?B?NWNnUExyWVh5M1diZzdkU1hlTThiLzQyTXhHNk1YUmQ2V2IrOXFTcUVGM2Fs?=
 =?utf-8?B?TVNNYzFINHFDREYvWk5hbFR3bHYxY0FXR0U3TFQvcWZiYUo4bEM2U1FHWTB0?=
 =?utf-8?B?dFZId05XV09lQXRsdTNPNmhtOVVxTjRIUGRVdS9iOWMxdVFiS2xWU2JwdDZX?=
 =?utf-8?B?Z28yTlVSOW1mZC8wYU5xNHplSHlVU1pGeGtQUnNud2pXSWhTN0x6UjVqNW52?=
 =?utf-8?B?Nlp4U2xVM2NnVDZMVHkyNmt2Yng0MW5ZMmo1ZytHNUZwN2FWMEk5WmJSZmYr?=
 =?utf-8?B?dGtTZE5yMmVCbmVjNFN2d09ycEdHUzBkNSsyaXFGWEVSNzZGcmc2NzFTZXdT?=
 =?utf-8?Q?U7V6ayHzUQIjQ5qVq2tPY7gMy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28a6ff3c-ef62-4532-8175-08db4f8e224b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 06:33:28.4321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMCw4J6PcPUFk4QI3R5EdliN2OwHAYkJFex9Hvwn0FJM/wgW+8Xkxc41C4JWWBlNM4ttY4rfpmNumB26m+3zGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7399

On 05.05.2023 17:35, Jason Andryuk wrote:
> On Fri, May 5, 2023 at 3:01 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 04.05.2023 18:56, Jason Andryuk wrote:
>>> On Thu, May 4, 2023 at 9:11 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 01.05.2023 21:30, Jason Andryuk wrote:
>>>>> --- a/docs/misc/xen-command-line.pandoc
>>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>>> @@ -499,7 +499,7 @@ If set, force use of the performance counters for oprofile, rather than detectin
>>>>>  available support.
>>>>>
>>>>>  ### cpufreq
>>>>> -> `= none | {{ <boolean> | xen } [:[powersave|performance|ondemand|userspace][,<maxfreq>][,[<minfreq>][,[verbose]]]]} | dom0-kernel`
>>>>> +> `= none | {{ <boolean> | xen } [:[powersave|performance|ondemand|userspace][,<hdc>][,[<hwp>]][,[<maxfreq>]][,[<minfreq>]][,[verbose]]]} | dom0-kernel`
>>>>
>>>> Considering you use a special internal governor, the 4 governor alternatives are
>>>> meaningless for hwp. Hence at the command line level recognizing "hwp" as if it
>>>> was another governor name would seem better to me. This would then also get rid
>>>> of one of the two special "no-" prefix parsing cases (which I'm not overly
>>>> happy about).
>>>>
>>>> Even if not done that way I'm puzzled by the way you spell out the interaction
>>>> of "hwp" and "hdc": As you say in the description, "hdc" is meaningful only when
>>>> "hwp" was specified, so even if not merged with the governors group "hwp" should
>>>> come first, and "hdc" ought to be rejected if "hwp" wasn't first specified. (The
>>>> way you've spelled it out it actually looks to be kind of the other way around.)
>>>
>>> I placed them in alphabetical order, but, yes, it doesn't make sense.
>>>
>>>> Strictly speaking "maxfreq" and "minfreq" also should be objected to when "hwp"
>>>> was specified.
>>>>
>>>> Overall I'm getting the impression that beyond your "verbose" related adjustment
>>>> more is needed, if you're meaning to get things closer to how we parse the
>>>> option (splitting across multiple lines to help see what I mean):
>>>>
>>>> `= none
>>>>  | {{ <boolean> | xen } [:{powersave|performance|ondemand|userspace}
>>>>                           [{,hwp[,hdc]|[,maxfreq=<maxfreq>[,minfreq=<minfreq>]}]
>>>>                           [,verbose]]}
>>>>  | dom0-kernel`
>>>>
>>>> (We're still parsing in a more relaxed way, e.g. minfreq may come ahead of
>>>> maxfreq, but better be more tight in the doc than too relaxed.)
>>>>
>>>> Furthermore while max/min freq don't apply directly, there are still two MSRs
>>>> controlling bounds at the package and logical processor levels.
>>>
>>> Well, we only program the logical processor level MSRs because we
>>> don't have a good idea of the packages to know when we can skip
>>> writing an MSR.
>>>
>>> How about this:
>>> `= none
>>>  | {{ <boolean> | xen } {
>>> [:{powersave|performance|ondemand|userspace}[,maxfreq=<maxfreq>[,minfreq=<minfreq>]]
>>>                         | [:hwp[,hdc]] }
>>>                           [,verbose]]}
>>>  | dom0-kernel`
>>
>> Looks right, yes.
> 
> There is a wrinkle to using the hwp governor.  The hwp governor was
> named "hwp-internal", so it needs to be renamed to "hwp" for use with
> command line parsing.  That means the checking for "-internal" needs
> to change to just "hwp" which removes the generality of the original
> implementation.

I'm afraid I don't see why this would strictly be necessary or a
consequence.

> The other issue is that if you select "hwp" as the governor, but HWP
> hardware support is not available, then hwp_available() needs to reset
> the governor back to the default.  This feels like a layering
> violation.

Layering violation - yes. But why would the governor need resetting in
this case? If HWP was asked for but isn't available, I don't think any
other cpufreq handling (and hence governor) should be put in place.
And turning off cpufreq altogether (if necessary in the first place)
wouldn't, to me, feel as much like a layering violation.

> I'm still investigating, but promoting hwp to a top level option -
> cpufreq=hwp - might be a better arrangement.

Might be an alternative, yes.

Jan

