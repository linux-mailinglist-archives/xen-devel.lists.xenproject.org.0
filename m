Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BC9758FA1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 09:53:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565621.883931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM206-0004i5-8U; Wed, 19 Jul 2023 07:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565621.883931; Wed, 19 Jul 2023 07:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM206-0004en-5Z; Wed, 19 Jul 2023 07:53:34 +0000
Received: by outflank-mailman (input) for mailman id 565621;
 Wed, 19 Jul 2023 07:53:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qM204-0004eh-7m
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 07:53:32 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a6931b3-2609-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 09:53:31 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7625.eurprd04.prod.outlook.com (2603:10a6:10:202::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 07:53:28 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 07:53:28 +0000
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
X-Inumbo-ID: 5a6931b3-2609-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivWAknSe4nB1a2dpp4NG48Lg0FoxB/GH7X3aZBqaP6Besclkq5a0t9rW1j/Lf03jIC9SbineXgllYwg3XhlcUjpk5BZbXK/QlRDbmU99AKlpGiA3co/2r+zALweMD+nhkO7SN1imgs/kYFmH3Zx9pc6CrFq4bU0tHv69tb+WlpXRy92Bel4IHp9qo4sFPR867HPXuDSLfPsBT3Q+9/Gcf7SY0t9r7xzQamvaPCPY8vOigKlcYCf7Sdv19CWYthXkg1V4TjsyK/067d5S2r8rbfsXhaaJ8N+/7qAe4ufbrZvQAoMCX13vVunzfQNiKpVaJzWrXWwXPBu9s+6N3G00OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g83LjZ1bG8j32x90eKP6T4t7w8TZhBkjeY42mGTpuds=;
 b=JhBS41ZgWoROoud4NRU5DQ+wG/SSQ5T+P3VmJ8b7prybihen3JgzScdhmNk8Od/qCdEGK7DzyM35veI3Lk3CRWT4/6IJrzInQ3vPLrJdP8WmG0INtcEv7L2PVYQN27muEtNTzvihesMOFvM0w2lFjladM92pzHhav50m68TD2HMNJm9GDOmBLRXiGjbVjfC/sUPVj/kX8kuTtBzUp7u5MvQ0fV+sWmw4h+sfO+B93baeZQk0UrtaLVS0vpHj4z6vbuAu9V/ROQrU1EVbIUOSXR3kK/kfrWEirXMkDswBCkM58jJnVmgmJCem2zMduA4VcpeAHp304CSW1tXnuPdMBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g83LjZ1bG8j32x90eKP6T4t7w8TZhBkjeY42mGTpuds=;
 b=YDgxTt9UFK0jDxiKHeTx40dUsznnzmjiEBqARpHDyib3iF+3WsbdmgeHeybJDeCMSRupjUQMAGXxzr6YoK0dgJ2mh8TSkDeEVOgGDlpZl51JW1PThxRH7+CyvF/0iPdyabPBwHIqUIN2q965bZYDR22/B4EMVPMatPeXqALv0Vw9/1xJpUl/YM82guqHPPgYKWbdKzRLDkznzEaImbw7wQpV55rAEGzBFOXlPr7yi29McatWeyPP4Nj4MZRgLf+o3mmslCvpt468U92FdwXtnDw1GdgpAdtQlufkKs8fYO9fIm3/eRO5HCIVboH0KlOrmT+F076p8CLq4ys0n+cqpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <528ab0ac-de98-3e18-a9d3-e88a707ea2c7@suse.com>
Date: Wed, 19 Jul 2023 09:53:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] x86/idle: Get PC{8..10} counters for Tiger and Alder
 Lake
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20230718132334.2087-1-simon@invisiblethingslab.com>
 <aa23a090-1883-008b-e395-2a3bca709258@suse.com>
 <2be631d2-95f3-0d7f-ad84-eb9e16d1a39a@invisiblethingslab.com>
 <b6365b9d-47a1-8ab4-37eb-0b821257dbd2@suse.com>
 <683e73d8-037a-5e38-745d-ae1c0e18fc79@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <683e73d8-037a-5e38-745d-ae1c0e18fc79@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0177.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7625:EE_
X-MS-Office365-Filtering-Correlation-Id: 869f3a13-ed56-4833-0cf3-08db882d3cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CmRcPmX6n7DwwpiFB5bAZK6izOU7877Jn+q2Zy0naoog6CO/k4QNY2cWQv0LFsSaQehaHzt8mqj/wwH0TY2URtS65fQt75BsGL8eh9N7shN4s9QB8EfCIEKFW/5wdIn8vRw2gMHyYbZIwkTHylhDHTm53OYqwrZsgKTx2D0M2GYnQlYk5011OFGer99kEqExJYsfROev3wGUd4/m0PULEGxuBzgwN64Fbx33pdBykV+NztTcssvuviP0CmAWE30eQF8aVFv+2iWhj610WAuoslIzFtFY4DUpadh9OodKdpbXA5cPr/1sl21kJCHDNCkcVWh5Fzb43BM5DvFiMwUDP6h3BYV3JowVFAeXfiYj+GaWiE1qbx5DtTufqXTPzux8SY+Jtq7QK4B+P2lYARvNd8We2T5BZ5b0FprsSrueSZscNPjK53jITCYkSU8nknPLsWxoF2WqhiPgmQvDODfLqi0P+WUe6UvSXdARyE0c7WnKFzBbtBLwOX9p7SKfHMz5z7v+lldl7oVX21spDxWDUTszzF3qvbZKM5Y1QFWKfWl30rOUVgwNgYCNXvPR+sae7Sc+9GmGKA+wGjfmMK+p/3tKxGzA8BDkCdzYpwUY1qq58pqt37/onBPD/EJHYbOXaKEdh7B47TCh+2+hisF0icfN89qn64/DjInpl+lQOTs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199021)(31696002)(86362001)(2906002)(36756003)(31686004)(186003)(83380400001)(6506007)(26005)(53546011)(38100700002)(54906003)(6486002)(66946007)(6512007)(4326008)(66476007)(966005)(66556008)(2616005)(316002)(6916009)(478600001)(41300700001)(8936002)(5660300002)(8676002)(101420200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVNGcXZidHZnNDI0K2JJcVQ5Nmk4VC8xTkJsbVZCOGFQWm9ZNHA0cVFtaUR6?=
 =?utf-8?B?Nm1MNlhrVW1YWjc0Q0RqRjlPU1pPMUI2NTlEZXRxUDlBK3hEQnFlelJhZUxy?=
 =?utf-8?B?eEFGVWd2dWUzc3BCa0FJaWVndkVDdVd2TGFGM1kzVk96azBFV1lLdmk0cDBJ?=
 =?utf-8?B?UEFNMjhFdHRSM0ozUDRwaVdUTllpQVltWXh0TC9DUmhZWUNtN3RMckJ5NjVa?=
 =?utf-8?B?V0puRzI0bGt4Yml3YU9odm5YQ2sreTg4YlFHWVVoVTZsQmRRZ005NTFDamFI?=
 =?utf-8?B?cTlZdUhPV1FraVBFcnVSWFUxWW9iNWFTN2llcGtpd1BFNHZnZXlwcGZrMElC?=
 =?utf-8?B?Q1Qxb1VVdGdyN0x3TW1qdG9GdUxXQjFVSkxQVCtSUCtCWFlxV3FxVG1VTEtw?=
 =?utf-8?B?emRqNVlqVHVuOFh5clE0czVaNUxYdGd2YVRLTDVmVU5Ub1ZEL3NqbHV4cllu?=
 =?utf-8?B?NEZzOEhaaTJtSk4ycTBoRzdZMUNycU5EU1NIcEVuRlUyTGtxYWVSZXNKWnpU?=
 =?utf-8?B?WmtSa0hYTGV3VlNNdk14RTgrYkZ0aFJrU1cyVnhsamNGMjM2Z2RtYVY3REZJ?=
 =?utf-8?B?djlEQzhPQkdIcHNHK1R5VzE4TkJ1Rk1CZkNoRmxMV2NZMVdUdFJsQzR3bFdm?=
 =?utf-8?B?V1VkV1RaaDdIT04vblhTSWN0dStITmRodEVPNlZJeDg1bzcvaGhDQW1wOFV2?=
 =?utf-8?B?dVRvNk41N1J4TkRnWVM3cDBMamtqN2doNVFqZXVhVXR5SCtDMnViaVBOcGdl?=
 =?utf-8?B?aTd5cHBNWHgvcGgzYWlVUlcyNmNKMGJiQ0x0LzJWWnlheTh1bVVlUGNuU015?=
 =?utf-8?B?RnovL01OM1FrUExObTM4K1ZPTjdiTkIzQjdNRDNYelFyK3M4bWttQ1lFYVUy?=
 =?utf-8?B?ck5VM2ZPSCs0a09ENVl3WE5WaTdwY3Q5YWNaZmprYS9hOVNwNkJMM0hLODdY?=
 =?utf-8?B?RnI2RVAzbmhheS8wem5wTG03MXc0MEwydVNhaHlXODJKRVdIc1ZXQUtYV095?=
 =?utf-8?B?dExUd0ZyVGs2RjFZNXh4WkJ5cUZMZ2hPa0ZYaEgxS1NwekY0bSt0ektwa05m?=
 =?utf-8?B?bDYvaDRJcXg2N3Y3UzdMUSswdVQwcjVqeTVJTC9BSklpN1UwLzFTeTMwSUpj?=
 =?utf-8?B?ZDRac3RsZlpxdlk5eUt3aURydllqbHhocEo0ZnpaUzIxOW1sdEpuaFNhc0pE?=
 =?utf-8?B?bjh1S2dra1ZTTjQ5emRHekU0cHJTZkJyeGdLSkcyeDd4VDNReDh5SUhrRjN5?=
 =?utf-8?B?MlRKY1gzcE1RVHlKL01FWmNzcXo0QWh5Y00zMXFpQkFFUmphc0tUcFN6Q0NN?=
 =?utf-8?B?Kys5eWF1YkVSZkV6YVVQS0hDSlNqZk0xNFo0ZjZ0WkNiYVhRNE1hZlhhSzlS?=
 =?utf-8?B?SEpUd1BKOUJzbnI5WHc5bW1SdFhTTU1uMG9SM00vOGNkZXg0V3RzSi9HRFNW?=
 =?utf-8?B?cFRQQVJmSk9ET3VLenlLSHdLZTg2enIyTVlGZHU1dytDc1Y4QnhHZ3pRZU14?=
 =?utf-8?B?c0xpYzN5ekc2M1VOQWJPSFJtaWFFcTIvYUVub2xXbmtDcHd5QnlYZ2dWYlBs?=
 =?utf-8?B?L2VsMUl3ZGZEd2xDZmhlL1luQ2NteWdGRlVZeHJQWlZDUXMxVUphcGxZUzl3?=
 =?utf-8?B?K1ZLeG9Idk5iSkRJZjdReVRNWHh0dTl2WGNaYlBmbmNPUElZa3ZlTXd0UHI1?=
 =?utf-8?B?SytwS2RsQWJVSHlYN1FuQi9YbU4vVEF3ZUVTc3J5Vms4QXE0WndMVkdoNWZ3?=
 =?utf-8?B?RzNEQnhRTUJ6RWZBdzVxZ3BOZm9wMzhLUnM3MUJKRjdkajY5Mlp5TSt1a0Fm?=
 =?utf-8?B?b01wNW9XZDE5azM5Q21MZGZyUWpEVitLVDFuaW9uNVpBYk0zUTkweDNvclBD?=
 =?utf-8?B?aGZjRkwwMEhBb1ZzVGUwT2plSklpV0Vabi9UTnRPMXZEMitBYW5mWGxoOEJQ?=
 =?utf-8?B?ZjVKM2VYaGF0TzU5elBXUzBQUXJyd3c3NFBVZGczMDFNRFhnT3ZuR2w3R29q?=
 =?utf-8?B?amp2YWwvZ2NpY2VqSTlDd0FaMFdYMWV6VzVwL29TM3NQbG5sbGJPaHMyY001?=
 =?utf-8?B?dlBFQk5vYUNyNjYzZE5MUGxNZ1hTSkpQNTkvajlWV21KS25ZNEQzM2I3dWFU?=
 =?utf-8?Q?GlQvIw+M8uHdS4q4G99r/xcYP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 869f3a13-ed56-4833-0cf3-08db882d3cf2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 07:53:28.2054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4UZi6h/uOzOV2tUnBEK/aGC3+aoVsJLOqutGAiuv5nKIQ/2t8d5UbNgAq6DF58N+0P/9v18RIXYf3nooY+eiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7625

On 18.07.2023 22:17, Simon Gaiser wrote:
> Jan Beulich:
>> On 18.07.2023 15:46, Simon Gaiser wrote:
>>> Jan Beulich:
>>>> On 18.07.2023 15:23, Simon Gaiser wrote:
>>>>> ---
>>>>>  xen/arch/x86/acpi/cpu_idle.c | 9 ++++++---
>>>>>  1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> This lacks both S-o-b and a proper description. The latter in
>>>> particular because you ...
>>>
>>> Yeah, I also noticed in the meantime, sorry. Will be fixed in v2.
>>>
>>>>> --- a/xen/arch/x86/acpi/cpu_idle.c
>>>>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>>>>> @@ -155,6 +155,12 @@ static void cf_check do_get_hw_residencies(void *arg)
>>>>>  
>>>>>      switch ( c->x86_model )
>>>>>      {
>>>>> +    /* Tiger Lake */
>>>>> +    case 0x8C:
>>>>> +    case 0x8D:
>>>>> +    /* Alder Lake */
>>>>> +    case 0x97:
>>>>> +    case 0x9A:
>>>>>      /* 4th generation Intel Core (Haswell) */
>>>>>      case 0x45:
>>>>>          GET_PC8_RES(hw_res->pc8);

One note here: Please follow what we do later in this switch and
maintain roughly time-wise ordering between the case blocks. IOW
you want to insert below the Haswell entry, not above.

>>>>> @@ -185,9 +191,6 @@ static void cf_check do_get_hw_residencies(void *arg)
>>>>>      case 0x6C:
>>>>>      case 0x7D:
>>>>>      case 0x7E:
>>>>> -    /* Tiger Lake */
>>>>> -    case 0x8C:
>>>>> -    case 0x8D:
>>>>>      /* Kaby Lake */
>>>>>      case 0x8E:
>>>>>      case 0x9E:
>>>>
>>>> ... don't just add new case labels, but you actually move two. It
>>>> wants explaining whether this was outright wrong, or what else
>>>> causes the movement.
>>>
>>> Yes, as the commit message says it get those PC{8..10} counters for
>>> Tiger and Alder Lake.
>>
>> But that's the problem - there was no commit message.
> 
> I'm used to that in git "commit message" refers to the whole thing,
> including the "title" (everything till the first blank line. Usually
> only a single line. Put into the Subject header by format-patch). And
> there it says exactly this, which I considered enough when drafting it.
> Will send a v2 with a more verbose description.
> 
>>> The former already had a label, therefore the
>>> move. I assume that when Tiger Lake was added it was an oversight to not
>>> also read those package C-state counters.
>>
>> Or the SDM wasn't clear, and we needed to err on the safe side.
> 
> The SDM [1] seems to be indeed a mess regarding
> MSR_PKG_C{8..10}_RESIDENCY. If I didn't missed something in that huge
> document it lists PC8 and PC9 only for Intel Core 4th gen with CPUID
> 06_45H (table 2-31). For PC10 it additionally list Atoms starting with
> Goldmont (table 2-12 and references to it).
> 
> But it already contradicts itself by listing on page 5002/5003 06_4Fh
> (some Xeons) as another model that supports those MSRs. It refers to
> table 2-38 there, but that table doesn't contain those MSRs.
> 
> Linux' pmc_core [2] and turbostat [3] both use those MSRs on Tiger and
> Alder Lake. And on my Tiger Lake test system I get useful data from
> there.
> 
> Is the code in Linux a good enough reference?

Well, the SDM has to be the primary reference. Linux can be used, sure,
if the respective commits look trustworthy. Note though that if we were
to follow Linux, yet more changes than what you propose would want
doing, afaics.

Note also that personally I wouldn't accept references to a user space
tool (i.e. turbostat) as justification.

Jan

> [1]:
> I looked at what's currently linked on Intel's website. "325462-080US"
> from "June 2023"
> https://cdrdv2.intel.com/v1/dl/getContent/671200
> 
> [2]:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/intel/pmc/core.c?h=v6.4#n44
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/intel/pmc/tgl.c?h=v6.4#n188
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/intel/pmc/adl.c?h=v6.4#n291
> 
> [3]:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/power/x86/turbostat/turbostat.c?h=v6.4#n5763
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/power/x86/turbostat/turbostat.c?h=v6.4#n5074
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/power/x86/turbostat/turbostat.c?h=v6.4#n5409


