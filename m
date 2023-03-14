Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7BE6B900D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 11:32:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509538.785459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1wZ-0007F9-4b; Tue, 14 Mar 2023 10:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509538.785459; Tue, 14 Mar 2023 10:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1wZ-0007DD-1j; Tue, 14 Mar 2023 10:31:47 +0000
Received: by outflank-mailman (input) for mailman id 509538;
 Tue, 14 Mar 2023 10:31:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc1wY-0007D7-24
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 10:31:46 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061a.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69e5e54d-c253-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 11:31:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9795.eurprd04.prod.outlook.com (2603:10a6:10:4e3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 10:31:42 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 10:31:42 +0000
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
X-Inumbo-ID: 69e5e54d-c253-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP7tSMex5/JKFmwunC9Q/t/DzexNIIi1eEicKwlUhpT4Lm5Ffd7nql9TA41hZ960ZJdBUIoA78q2gTqPAi7VOk4ovgIxbFgTw2tDJhp4Wm5oZ4qqovbAXQM4ruTkEpkEh4X4b56cbR62tYytaECiL7UvhdQi1m9hkCQ+GEPJhP21q3bFAMTvw0DdpG37p+ixw4vGsfseL/1Jml6YiBYRhpPII5touPd3hc4KCOHBCsgJ4quATW4qe0i6489WBRyH7yuVpnvVsw/zf3k7RWPGoQXSssOTLWaGp+enFdoiTzgsAk0ecSHSe+j6yWtPhF1wFMoamvDdrW5QTknX/muzew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivOHoHI7tK6g1BR7xw9Fn2WaRzfToSvO/HB7IxNts1A=;
 b=AQ3uiHpCQ6pAzOGHKUdEwMR6jYXOHoSuQEUiht37o3lJBq7GXHwFiEAQzvsTRkDD3Q5OLCZW8L3SAWvJHZuq4MNvHpXSgQpvZgFHJu/Lb5cRSsEvDF5a9BQcRla2iglUMFR9vD9W4KdtmRQr/QBYeoQ4SVPnxgB2wZgb35wUvlVqpmuGtnb58YTbZ4Cm5BthCuQJOSRyo5KRHmfQimrE+Ex37m2MkNDejw55rensAReJ0x+IpbmtJwuv7I5g9LLsKmPZ3SixZtgdsbW+5JCQZRzexGHkTIP95hLqmMNTgjmqdnlERyOWIoDiENlonnawirGAhw4ewKElHdVe7gZJPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivOHoHI7tK6g1BR7xw9Fn2WaRzfToSvO/HB7IxNts1A=;
 b=IXJjNFIaV/8nbJJ/wBk8hY6lTIDk+xPjJ202eJVz25zlZ/W20TVosUM872EfqYOO2GGT/ry8g4Tq8VrLJXX3JWIkDMO8k2+m3zW3lLhjnjW3w4Y8O38hi0ygBmgkoTx/N2GBE08jMO3QZvXZXsax1TNFtFcvSxLozhbPtvWmT2mQNfuy2ZNQqdP5xF7biDWfHw6+lHQoMT4zfoc24OpDwnP/df2XPyTaCULzqQ8ijYcEgMTx5d8ChmPyRIHbrvK0yWu3QtJV0K1KoZUrCHZAkpUTUdWkRpKRijyBgUoc2j77/x6v/fW1+BMy3dkkKDDakHttw5/GqV6HZqKl2mjHBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <94c37e21-8e46-0775-052d-3a30e54d13bf@suse.com>
Date: Tue, 14 Mar 2023 11:31:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/grants: repurpose command line max options
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230313121632.86789-1-roger.pau@citrix.com>
 <2bcd9829-498b-228a-2a86-67f8c6e859aa@suse.com>
 <ZBA8yORIxXRM3RkO@Air-de-Roger>
 <04bfee08-53e5-49f2-3fb9-440b6861e3f7@suse.com>
 <ZBBLlQZLfkRltI9R@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBBLlQZLfkRltI9R@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9795:EE_
X-MS-Office365-Filtering-Correlation-Id: 3db1d40a-ca74-4518-9117-08db24774d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	io6+XxjtupUlXin2yXxWumYNl3/spcm2UiGcy0UzqdMfKwuHznKQUDceF+7SABYzb/0NuYLmU6Js0fh9GWNuUG6mEP2Kwb/EraKfl9lu8BIsnEjav4nKQLgbSDRpqn2cJSPkPraah/vZvZG6X5hHpX8zA1v7OEt22OKL2wXjwbyB5Kfpb38LsxXGuwn9ojgfA7CdZf9NozfsE8ZCILtnHylm1X/EHlyZhrGy42a2bXbKlpVKyl0PU/9NQTrq25QBqVR4aTPElDNKIVFiOQcSIqVuo/aHi6uZeUK2hSQblNF4cPWCqZ0cCuI58hfM+jQjUgHeRfsexmsZzdocXklXl49maRN7diNYOo/ATkDYnMrRbpB7r1BHXkuQrFaFm2rQBLYm70/p3iZX7AW1yI/wzu1qkzhfTS6coS5rGZL3Dh7OgijAGs8ZC0+X+pUxdXWcXhfFiXce02C4V9QAgrMGcJ8ixPnjntrmzgb2fVD3XGNgctKohMB37Wul36ZEm8xVt3BJp9Nh9c5CWuOmPAD14+vDxsLFjo5FGEgH8weGK5lgXkeoVDxwymGwTVQ8vVUHW/bepVZ2mb1MFY+7iCETUh2ZVgb8rEO5BfEHgqDgm+nQqp6UuwjeDGW/WbMWr4CTQYu6t6nEaFGg3AZ6Y8NE3SIlFfRiaH+yjSiMr1x7cLcD0558nmhYpHMYmtErOkTAZqvcbHQpF+7ElRFSUAdzpmP503dDPblWSg6wenybwIo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199018)(66946007)(8676002)(66556008)(4326008)(6916009)(66476007)(83380400001)(86362001)(186003)(2616005)(38100700002)(31696002)(54906003)(36756003)(478600001)(316002)(6506007)(6512007)(26005)(53546011)(6486002)(5660300002)(8936002)(31686004)(2906002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0QvRFhQQ1V1MEtuT2dKOVREVmdxRnI2YTNrU3hNWmcxRzdqeWJQV3NOOUEz?=
 =?utf-8?B?MG5yckFzRTR4S1AxRm8yTVdTLzYyeTNWSjFnWjh5YUhqVUMvR24xY0h6Syta?=
 =?utf-8?B?cEIraTdUVzZuRjZwcjlaUTJWcG5Oa0MxOEUveW9Bc0FUbnhVWWNvMWtCUU5K?=
 =?utf-8?B?RW5ZbzFobThnM1plTWNzbTY4QjVadk84VHVVUUo3cW9mU1A0ZXZlT2NVWk5U?=
 =?utf-8?B?bVJTSXFFQ2RqeFhVRUN0SkZjUTRlbDJxUkg4TkRXNVd2aFUybzViYkE3TVVv?=
 =?utf-8?B?UklnRkJiaW5tR2h5TFJyMFdpQytzQWxDdWNxRkR6aGRxV3NDa2pxcU9xY05L?=
 =?utf-8?B?MHVINUF0QlNiSjNwSGZZU085TTdXa0ljZElzQjZNRGtsNzY2blp4bkFNaVRB?=
 =?utf-8?B?dmNSaFVNTnloVDNCcjRvQUZZTmt1UFFCTUd2QWFPZDcvdGdIUTlRNkZ4NllC?=
 =?utf-8?B?dGt6WTRrSCtqV3NabGpveDNIOTdNR3pPRE9hcGxINFZwZVhucnE3WVQvY2VC?=
 =?utf-8?B?RGpSUVloVkpsdzQ2cmdicEdTS0NXaUw1TXM0V2pGUnc4Q0cxNXFyUVgrTTYx?=
 =?utf-8?B?SVNseVFUbU5CZ0xNcmdvZ1hoendwa2drL3VQcUFFUGhHVy9ueGpBblVKMkxn?=
 =?utf-8?B?S3VJWE9pZS90bkxmbTBUL3NmTnExU1Z0cXZXUUI4elJXK2lMYWlSWVFoNU94?=
 =?utf-8?B?NklFdHYvTUFIdGNJMUhwUmRCS1BJZHQwMlZKMVVsY3JuVHl5bzUzS296MHYz?=
 =?utf-8?B?Q3hJNG9xelIxU2xIVVdNQmEzZDFhZ1ZDeWZxMG5wR1F2emg4cTFEYzNQVFhS?=
 =?utf-8?B?M1JFUmx6QnVXZ3h4K2FCWGlMV1RHcG9VdVNmWkNibHc1VHZaWERLaEdMWUEy?=
 =?utf-8?B?YURRWGhBbVJtb0hOVTFqMmJ1R0pOOW9tMVU1SzkxWnZvODFadnQzVEgrNXRt?=
 =?utf-8?B?VU1NbmVrMEN1Zy9QQW52bC9YbDVKMk9nSGRuRTlBNTkxMUZwOXdSbDFueTBG?=
 =?utf-8?B?NllOVWVUbVQwQXVUMnVXdU84UlRPWTVrZG5uNnBGUlAxTDJUci9EYWZHaU1k?=
 =?utf-8?B?Ui9paFZLc3lML2hvaWN0bGxVYVl4QUhBL0NCTUJRTmJka1l3MVAzSDBHQ3Iy?=
 =?utf-8?B?R3U5QjM1M0x0dzNkUHBwY3BjMVpDaFhQVG5mYUFJUmVoN1cxSTNLclBRMkl1?=
 =?utf-8?B?RFY0LzQ3UHVkcmhCUGtMYjVpT2hoU21uenMwWjJmNmcwMzhrRlJkYmpGR3dB?=
 =?utf-8?B?K0d6LzUzRHk0NWFvZnB2VkhycVhBVUoyRzdiWWJhUXd2ZUlEbmFXdWNoQ0pV?=
 =?utf-8?B?UHl4azlxb29lbUszYzA4S092U2NtYVdFbGxiMmlHb3l6NkZDZTBrc0tRYjdW?=
 =?utf-8?B?cXhTY0hYYTNYYWFzZldDY0pqMm9VWCs2dDY3TFI2N0l1c2g2dm9RWmhydWp3?=
 =?utf-8?B?RGhvaTJJNkpuZTVEeW40djJSSTEweHREcHpKTWVMQnY2d2tsSTA1N21lQnp5?=
 =?utf-8?B?bHNhVlRnTHhqbkdpTTRaZzByUmNOUE42czRuZDFPOENta2czVHhFdXdnQ0c2?=
 =?utf-8?B?MTJvbVZCcG8xc1R4WkFMOHBTS1lJOFM2ZCt4NThaKzQ2SGlEdFczazBmamVl?=
 =?utf-8?B?S0I1L2VUdzh1MXZtRkhJUnJ0V3FkTUtTRW1JUWh0cXlqNnZDMDZ1RGZ4d0xH?=
 =?utf-8?B?bXZ0Z0VDdVRWdWlFWnFnL25RUmt6enYrdjVDekN3UDAyMjFzWnVPMzFyeHlp?=
 =?utf-8?B?WEdVRXZ4NW5rL0FudnI4ZUlQS1VmdG9PL1BPcWxxeFRPelVnQXZDdDdnM0JM?=
 =?utf-8?B?MFJwRlowWi9zNWNjRTYrN25QMUZZSmFWVitmdk1sZXpPdy9OWSt4R1NFRTBW?=
 =?utf-8?B?dVVVbTlWdC9rSWVHaXZxN2Q3Z2tzbEZET3NHUjBmNXRwZ1RmbHJBaGlhUm51?=
 =?utf-8?B?UmdyZnAveFlJYzVSS2F0L0plZysxbStBK0R1NFBlc0F3WFkrM0MxOXpQK1hW?=
 =?utf-8?B?U3E0RVh4UzBLTXFTeGUyTkpyZ0tYbjZCcUdFSzBlaU8xK3BzMnlaeWF1cVBz?=
 =?utf-8?B?OUhuTk1lWWQ0ZlMrcWdhRFVkT3dRUnVYd2lqTWJ1SFZoSkEvSWtTK0huTW5i?=
 =?utf-8?Q?p1UovwuHx5tZesu8TRguIS8UD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db1d40a-ca74-4518-9117-08db24774d36
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 10:31:42.0374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C4/t1GwbeCPz0ISoo3UOkczQWgmZs4IZL6cuJQ/KWb5wRQEyql9GJnETFLk9IzabYEAmXOhLZkK4FGcuKCEEAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9795

On 14.03.2023 11:25, Roger Pau Monné wrote:
> On Tue, Mar 14, 2023 at 11:04:21AM +0100, Jan Beulich wrote:
>> On 14.03.2023 10:22, Roger Pau Monné wrote:
>>> On Mon, Mar 13, 2023 at 05:55:09PM +0100, Jan Beulich wrote:
>>>> On 13.03.2023 13:16, Roger Pau Monne wrote:
>>>>> --- a/docs/misc/xen-command-line.pandoc
>>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>>> @@ -1232,9 +1232,8 @@ The usage of gnttab v2 is not security supported on ARM platforms.
>>>>>  
>>>>>  > Can be modified at runtime
>>>>>  
>>>>> -Specify the maximum number of frames which any domain may use as part
>>>>> -of its grant table. This value is an upper boundary of the per-domain
>>>>> -value settable via Xen tools.
>>>>> +Specify the default maximum number of frames which any domain may use as part
>>>>> +of its grant table unless a different value is specified at domain creation.
>>>>>  
>>>>>  Dom0 is using this value for sizing its grant table.
>>>>
>>>> dom0less DomU-s do as well, at the very least, also ...
>>>>
>>>>> @@ -1245,9 +1244,10 @@ Dom0 is using this value for sizing its grant table.
>>>>>  
>>>>>  > Can be modified at runtime
>>>>>  
>>>>> -Specify the maximum number of frames to use as part of a domains
>>>>> -maptrack array. This value is an upper boundary of the per-domain
>>>>> -value settable via Xen tools.
>>>>> +Specify the default maximum number of frames to use as part of a domains
>>>>> +maptrack array unless a different value is specified at domain creation.
>>>>> +
>>>>> +Dom0 is using this value for sizing its maptrack array.
>>>>
>>>> ... here. And even ordinary DomU-s appear to default to that in the
>>>> absence of a specific value in the guest config. IOW at the very least
>>>> the info you add should not be misleading. Better would be if the pre-
>>>> existing info was adjusted at the same time.
>>>
>>> Aren't domUs already clearly covered by the sentence:
>>>
>>> "Specify the default maximum number of frames to use as part of a domains..."
>>
>> Hmm, yes, my attention was caught too much by the Dom0 statement. While ...
>>
>>> IMO dom0 needs to be explicitly mentioned because in that case the
>>> value provided is not the one used by default, but rather the one that
>>> gets used.
>>
>> ... explicitly mentioning Dom0 is fine, I still think this needs wording
>> differently here, because Dom0 doesn't actively do anything with this
>> value (and, as said, it can't even obtain it other than by probing how
>> many mappings it can create).
>>
>>>> I also wonder about the specific wording down here: While the max grant
>>>> table size can indeed be queried, this isn't the case for the maptrack
>>>> array. A domain also doesn't need to know its size, so maybe "This value
>>>> is used to size all domains' maptrack arrays, unless overridden by their
>>>> guest config"?
>>>
>>> I think the wording I've added already conveys this meaning:
>>>
>>> "Specify the default maximum number of frames to use as part of a domains
>>> maptrack array unless a different value is specified at domain creation."
>>
>> Well, I mean specifically the Dom0 related statement.
>>
>> Also to me "default maximum" reads odd (and slightly ambiguous). Would
>> "default upper bound on the number of ..." perhaps be a little better?
> 
> So what about using:
> 
> "Specify the default upper bound on the number of frames which any
> domain may use as part of its grant table unless a different value is
> specified at domain creation.
> 
> Note this value is the enforced upper bound for dom0."
> 
> And similar for the maptrack option.

SGTM. (Maybe soften a little by using "effective" instead of "enforced",
but only if you don't mean to emphasize the "enforce" aspect.)

Jan

