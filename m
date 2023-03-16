Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0436BC6FD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 08:24:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510324.787790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pchy9-0006qi-TU; Thu, 16 Mar 2023 07:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510324.787790; Thu, 16 Mar 2023 07:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pchy9-0006oF-Qd; Thu, 16 Mar 2023 07:24:13 +0000
Received: by outflank-mailman (input) for mailman id 510324;
 Thu, 16 Mar 2023 07:24:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pchy8-0006o7-Bh
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 07:24:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bd2913b-c3cb-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 08:24:11 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8156.eurprd04.prod.outlook.com (2603:10a6:10:246::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 07:24:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 07:24:09 +0000
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
X-Inumbo-ID: 8bd2913b-c3cb-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8gCHDbL9kYQiafsrCZQVyyRcpoZfK0KINEcSKKDktn2JidxQ67ZD+I7De8mfrg3K9PRPb1jRGq/r8GB8rp59w2H0FC1BGApzZrLGCtUMsSUUjYW9Wg+L2wSwd6AdF/1aLFllAj7Tb8Reapu+++pXpM5C9fK++trLTKqbW7JeMXzxrdKlgx4qwYG6l1hzz+/nHIjQsJJTDmFO6QmVW2MFrzeOqGO4kIEwMY4+ZeWfECCnKiNh95KtnRcQQuvhT2maj01JNGMPMPntJ2F4EPctuhi5esN6dFG9YCgP95CP2PutxirYz5/HMfYxkaDDdtJO5ewVNBiCYWK3iLFF3hIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Njzcm8gby7pm4KQp4Ucp9K0Nq613zsr6lw6RO9A/4uo=;
 b=VtdGNF4OYizk0I7e8aTEZci9K8/mapngxqhCCGYeYCQ6IDD6LEor9VmE1I5jDdnDa/Ywyw+HoEKAWR+VqHq3uJsPWpMBo1oq0uxFD6o+B4z2OGnqoxgpBlZTQsgS5TuBKrippSCEQ4mudlBrWJqxZ+Y4bP7tDi4kcdgehJ+KLwE633EMvoJWadgI/FF0AvBOWkQk/VR2WnLApMsSPHBVkTEz2+hjUXWteL6iXrrG860RdQqzcBSYBse3a2hPrlUXax6CvFdKV2Pwz/rcdhqMf/EdkcgH+XzVQ6E2cPsQg4WBs1WI3j9MPPyWWC1RaQsJB8kwpcd0m3PeZnIiLognvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Njzcm8gby7pm4KQp4Ucp9K0Nq613zsr6lw6RO9A/4uo=;
 b=1Ibc/AX1SNNuz0JUAAevkFPlAoWmDmUOaZF/XpMcd7nXJE6NKequktzIhCR+fLw4FZXaBiyJz76ffKsiwXdc/eysBikn16qiy3vqHMMuWRyA9dJuo5dUX6kYHHlnnWwoKULKvgSvfnYN2QTvMZtJcM9qAm/+GgL5fZ3BUbUGxJK5p3DKY/UtAPc/T4FqPYIkkFoX+2O7EYReBhYdDjii1sqgkWpYk3Kx0XHXEqAPr4EsDWJlM9pOGk3/M6o0+vCD2I9ihnATDvPUhYIGyEs1PPu25BmObwgDtpk/Ei7bb9/CqzhNejt/RE6tlKLSiKWbprovheTr1I9l9Z+rzoceVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1c174a17-0860-358b-5593-a7d45cdad00f@suse.com>
Date: Thu, 16 Mar 2023 08:24:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/console: Handle true dom0less case when switching
 serial input
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Michal Orzel <michal.orzel@amd.com>
References: <20230314142749.8845-1-michal.orzel@amd.com>
 <da7db77f-3ab8-edd1-bc69-460ca3e2ce25@suse.com>
 <7676cba9-6f92-0c97-dac3-372ca47be34b@amd.com>
 <737fec84-42da-3b9b-6cb5-d18406925403@suse.com>
 <d67aeb95-1631-74c0-cefa-a0cc88512b84@amd.com>
 <alpine.DEB.2.22.394.2303151844530.3462@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2303151844530.3462@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8156:EE_
X-MS-Office365-Filtering-Correlation-Id: 36da6cb4-10e7-42a7-f6ff-08db25ef6e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mZS5A42Ml2mR7jxBjekbV1E/aGLjuiV1UUex8tozbgX7TIFPX3KWOJU0G2dOX3rQlwMzXPEWlTajImeThhtQN8BnKif/6RwkDjEeLeRQh3R24Wtu3qjFXjStxcc8bYTKiFl8+iUUR+94M1yycADoW0UHTV5lstN2Z3DZaSxku12Va9oQGiGHhO8llJcAqFozCR1WqZLl1euL0rXpCEawP4iV5qNWulpxRk7njlzzN6g8AOUqYJXNnHraTtOTQ0POSlCTSx1e0koCrOIg2+QayPtmL4DGZ23YZd0c/PhhSqDc9Qfh6gwIqF/M6lPP8CXUYMoGu7ac4G9YEbI7DjeypPyJnLXTmAg2x2O5JoHMYFqFS1G8oSWD/PAsWZ1WFyADxIUCtUodtL5ea1k1b53i8oVplbHitGljmXJI2spcOEXGYYwQB1bJSSlabpXdfSnglchluEvlPo/lK5HA1H8ZJHSaS+Z+qUg8RdvwIjVjZ78o0FzrEPeXMXb0M2nGHsMxmAR6ZdJkp7RQ/nHenz9CrkS7s9Hmuv3QemkST9yxFspHovM/kUlsR5UE8MhKOR0yxLKd2hSvWAn7+pIST9WVVFnVLPkYGyuvHRJtQ14+QbTcAkCbmxGHwLyVM2BC4QjbyBfXR+8OPzVBPsPtdbnL8gT5WXSM2OyU7gyLR8r+c1Hbaidp7HJGtSEMhZMBKzlWug2E8ks1Vx2NXn5T478QMndSxcR7QSEnoUMIIlke85qrO9d4mmZHugL46z/AYhH5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199018)(36756003)(86362001)(31696002)(38100700002)(2906002)(41300700001)(5660300002)(8936002)(4326008)(2616005)(26005)(6512007)(6506007)(186003)(53546011)(83380400001)(316002)(54906003)(8676002)(6916009)(66946007)(66476007)(6486002)(6666004)(478600001)(66556008)(31686004)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXphWlBBYVFSMThUamtCSFJBQVlITVJZWTVzSlFobHczYWFHV0wydkFUYldO?=
 =?utf-8?B?RmFFVitPd29VZkMybmpwRWxVN1lMN09UWm9TdkQ4V2dqREdPcW5NeFVKN01M?=
 =?utf-8?B?OUh3TU1abDRSZzA5UnM0dDFwLzRpSi93dnRmd3NGZHl3Qm1hYzRXc00zMUx6?=
 =?utf-8?B?QXlYaE1BRGR0aW5HUUhqUVk5N1c2bWY5eWlpY3BKUko0alJqSlRYK1U5b2tI?=
 =?utf-8?B?ckQvQWNKLzFRSWo0YSt1azl2YmE1TnBHdFZZTHRjeWpmZ1lDWXZRZG44TWJk?=
 =?utf-8?B?VVZzTGxBRVRtTHdOa1lwYm9sZDU2YTQrY3pLdVpLV3k5Q0dDcS9mNDZ5dFFy?=
 =?utf-8?B?d2F3OXIvbjl2SUxXWlMxRFhKcTRHRHoydVFBTEdhZ2d2SkFTSm5Ucy9oVmdC?=
 =?utf-8?B?VzJBeTBKTWVjS0lyN200RzQxS003T3dtVHZGUHVEUU1SV1VkTnRyM2I4cjVJ?=
 =?utf-8?B?bnRUZzJWNTM1UWxPTXY5YXpCV1hBbk42dnZ0NlI4MlpDTHkwbUtzaGVpYy9s?=
 =?utf-8?B?WkxxMERpenBuZDNtdkFBY2ZGTVhQTHVUK0YxNVBIeWtoNDQwR0JLOFI5bHlC?=
 =?utf-8?B?a2pudC92TEFiQU5TcnRSN0w4SFlFWUZra3FnNDE2SE4ycFRnT051MlhrRUQ3?=
 =?utf-8?B?T0FvSGIwck54cm9rWDRmSTJkM2t4QkJzbjA5TUtvOUtvU2dzV0dtemJEaEhv?=
 =?utf-8?B?WVFDdWZicEltVkd3bGg3Zkt3M0NVSURYb2hJZit3L2xtUStQcmsrZk1NcWdP?=
 =?utf-8?B?NWhieDBzMG5FSEgySnNUc1A2YmVGWEl4b1kydms3T25NMW9NWXpmNDFETzNI?=
 =?utf-8?B?R2lONldoN2N1dnVjakVpbC9xYXpHTUY5d1hGdS9MMDFPbWZSdlBxcUtUbE5H?=
 =?utf-8?B?cHFPdk5VckxQeGZIOG9iZmZObWhVWjZXRzlaOWRBRllWRk1wc1FSZHIyaVBM?=
 =?utf-8?B?MVgweDd2b2JTbVVqdnJXajQzcVBqZUFKOWxaM1cxd1RjMTl4TnFoanJ0b3Y5?=
 =?utf-8?B?L2p6azhaQWxXWXUzdEw5a3ZnZFV5UVp2MGVaU3RNRTVSSTYyRnFHOXd2QzJU?=
 =?utf-8?B?V1AzTkhTOE5Vc25yMG4rdmYrQi9jVnFuSzJNNUxZZzY4dVBKWGpidlVjYVlO?=
 =?utf-8?B?cXk4TzBkc3FGc1VobGd6bVduckZ1czBWTFZ5MkF4NWt5dGdOM1dOQ3Vzd2VY?=
 =?utf-8?B?akl4OWJ5MElTWHl2VVVyMlY4Rm1nM1E0Nlg0aVBHcXJweW1GUk9zMmN3TGJw?=
 =?utf-8?B?cU5TdmlHdURWTW05anRPdE9xclA2L09TTkRyTzdGZ2Vtckd4M3kxWFRpZDJS?=
 =?utf-8?B?aG5MbVlOSlovU0NtMHYyRDY0M3d3UnVVWHA4L2p0SnRhUk9NVmorMy9odkE5?=
 =?utf-8?B?S0cvNzRUaEJRNkR5T3l2eTVCZU5lK1VXTGhwVXZtT0Ric1NsK1FQUm94VElO?=
 =?utf-8?B?VkVSeE9MdGhLVTRHMXk5YWVuTnR3V2dFZHRMcW5nNUxCSnNUa1hMN0lYbEEw?=
 =?utf-8?B?bGFneXhya00zSnB6eDZLRlkvL0dkelZJVWtjRGNnL3UrQjBoTTdCL1BWVis3?=
 =?utf-8?B?d05MZDFzc1kwbTVSV1V5OU5CTHVwWmJ4VVhkZTdVTUZENng1SXd2dXVqOW1t?=
 =?utf-8?B?a0JraGtkMDBXdHBoM1luc3gvSHFFWXIrQWQ5cEZDL3FUT21YL1FKa3VCanV6?=
 =?utf-8?B?aUU2bG0yOTczUDNFazRrSTdPQU1FaDl0U0RYbmF3UVdjemkySXNRZ0JhVmgr?=
 =?utf-8?B?Z3RrVGlNS1h1SUM0MjB1bm1ObU5IejBmRE9YR2JLQmE3Mm5CTGpFZGxkSnlM?=
 =?utf-8?B?TUJxWnlJZ2lrdy83dTh2aVU4RVJ3cVZYTDVJMmhTSlZ6Qk9uVm5WQmZUTHB4?=
 =?utf-8?B?RWp4RytFWDNrdG5xYlBybCtVOXBKSE1GcHRabXk5Vzh4NUlvdFFCK0ZjU05k?=
 =?utf-8?B?Tko5QlhxYi94V3hFZGI5WVNocTExck5zZnZvbkQ1b1IyVURma1JicVB3ZVZB?=
 =?utf-8?B?N0tZb25XZ1JCTkFMZkJHT0JIbEpGdmVieXQ5Y2JuSGpNbm9xc0R0ZHVnaWti?=
 =?utf-8?B?RG1FbkU1YjJKdnAwNzZpK0NKNXg3eStiRnZnTnRVRms2a3NwS3ozUFJGQXJY?=
 =?utf-8?Q?ipWY2EOKWb/KI/1d+ylG44Fv8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36da6cb4-10e7-42a7-f6ff-08db25ef6e9f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 07:24:08.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5C0zsQiNFDwakOPnFd3svux5F/59JGpGspFvRIjvvRv/+TWfwHRmB9+tKAPzW3IFoIa95jsg+Rbl5aor8OtnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8156

On 16.03.2023 02:49, Stefano Stabellini wrote:
> On Wed, 15 Mar 2023, Michal Orzel wrote:
>> On 15/03/2023 14:11, Jan Beulich wrote:
>>> On 15.03.2023 13:34, Michal Orzel wrote:
>>>> On 14/03/2023 16:17, Jan Beulich wrote:
>>>>> On 14.03.2023 15:27, Michal Orzel wrote:
>>>>>> --- a/xen/drivers/char/console.c
>>>>>> +++ b/xen/drivers/char/console.c
>>>>>> @@ -491,6 +491,14 @@ static void switch_serial_input(void)
>>>>>>      else
>>>>>>      {
>>>>>>          console_rx++;
>>>>>> +
>>>>>> +        /*
>>>>>> +         * Skip switching serial input to hardware domain if it does not exist
>>>>>> +         * (i.e. true dom0less mode).
>>>>>> +         */
>>>>>> +        if ( !hardware_domain && (console_rx == 1) )
>>>>>> +            console_rx++;
>>>>>
>>>>> The consumers of this variable aren't really serialized with this
>>>>> updating. That's probably okay-ish prior to your change, but now
>>>>> there can be two updates in rapid succession. I think it would be
>>>>> better if the variable was written only once here.
>>>> ok, makes sense.
>>>>
>>>>>
>>>>>>          printk("*** Serial input to DOM%d", console_rx - 1);
>>>>>
>>>>> When invoked from console_endboot() this will now switch to Dom1,
>>>>> i.e. that domain becomes kind of "preferred", which I think is
>>>>> wrong. Instead I think in such a case we should direct input to
>>>>> Xen by default.
>>>> Switching serial input to the first usable domain is the major motivation behind this patch.
>>>> The number of times I got pinged by users with *apparent* Xen issue on true dom0less
>>>> just because input was directed to dom0 which was not there (not everyone seems to read the
>>>> boot logs) forced me to create this patch and manifests that this is not the behavior user wants.
>>>> Switching to Xen console would not help at all. Also, we already have a way to set switch code to 'x'
>>>> to default serial input to Xen.
>>>> So I think what I did (switching to the first existing domain) should be the default behavior (just like it was done for dom0).
>>>
>>> Well, I'm not going to stand in the way, but if one of several supposedly
>>> equal domains is to be "preferred" in some way, then I for one would
>>> expect justification for doing so. If that's the route to go, then the
>>> patch snippet you provided looks good to me.
>> Well, the explanation is that we are directing input to the first existing domain
>> which also is the first domain created (this is what users expect at least by default).
>> This for now creates simplest/cleanest solution that matches the current behavior
>> with dom0 and solves the users inconveniences I mentioned earlier.
>> There is no other real preference apart from being first domain created and to help keep the order simple.
> 
> My two cents. Given the feedback we are getting from users, I think it
> is important that the input goes to a real valid domain (not Xen, not
> Dom0 that doesn't exist). "Which dom0less domain?" is a valid question,
> and I don't know what would be the best answer. But any of those domains
> would be better than what we have today.

Could boot time configuration perhaps indicate which domain to "prefer"?
Otherwise I'm pretty inclined to suggest to make it actually random ...

Jan

