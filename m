Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74536E7591
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 10:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523256.813136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp3PW-0003iH-T3; Wed, 19 Apr 2023 08:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523256.813136; Wed, 19 Apr 2023 08:43:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp3PW-0003fj-QE; Wed, 19 Apr 2023 08:43:30 +0000
Received: by outflank-mailman (input) for mailman id 523256;
 Wed, 19 Apr 2023 08:43:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp3PU-0003fd-Nz
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 08:43:28 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 408ec0af-de8e-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 10:43:27 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9233.eurprd04.prod.outlook.com (2603:10a6:10:373::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 19 Apr
 2023 08:43:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
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
X-Inumbo-ID: 408ec0af-de8e-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brzGicrkeWC+Uk/hYHMoY6FCkRAzFlOfBmMrDtjmjnRnGomk5gNT0yjjUxm6BFjrFgFd7pMxfEYc9Rtt1vs64rLr5Va73C+fXU6ppMH03wZnT9vcQtjSdyCfbj4xmvleV1MofJAuaY1QwVg1yLA66q5imEIOur+TOBdzf26J54Qx9P5gv+5VnOvcx/vm2/QjZ5dMR1dYaVqbNHY70xP6nslvALkISiUtHqXpcBfWulG3JyTXGaCaOh5FWjl/r7zeH3kRLe1KJcRlPjxsxxoT+ER5xyleLJ3B28u1JdQG9TGVsjBfly/hy2RSgN09/wZMPVXh0UNAfay+H+ytNTO/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoYmZuNKrOJHcyU0jChPjGkQDD4RtKGmQ6SJUHNkmaY=;
 b=nDTZxByrtdZjIFRxgNwgr3WCg97QoUSp14WvVjqDjorV2F3RNE69FKnXLQvSpjLIDQmUo2/IsysbtoHgfhrONNwitPPBGvYCmBRwz+0I/U2IlmIXjmZFguuYQbUIG1WrQ7KgzYYIVIytmeZwGK0OrFv91vgTZWQGOXMLqtI+nvQWIWNBct+KUm7DZGSrYx12lFulz+XN/DgW5QKeVTe2gY8kVwtX0RZN7ZUF7FxPISLKGlong+wKDsxDlWNDW0p2WYDVRe0p7kLZm5B1c3tWhlQGMutU5G14F2Gwo0CO3vswYnoOgNSIOzL7CpiVLuIptSKMVL8JjpUEDmsCvH4Kow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoYmZuNKrOJHcyU0jChPjGkQDD4RtKGmQ6SJUHNkmaY=;
 b=GGiUs4DIbDfAkOpoKhcyFLXz6oiv4TA/Nr3ZK27grjkued4bL8F5ZqFLliefYIfKfdPsR2UYfRJoZYJQ9/Ay25BQvXzy74PhwO4TMlR+NBuHADIN2inUffmCvx5Df/qF8wf6g//cUPBevOBva+Lx1C5FTgLTPNa6lMx6LyWsW+8sHBY7UMkX0P54kDtzgHXRJuFAK03/hON27yMH0DYMUOIhEXZRNaKrlkG9J8c6D4u9u2pV9T38ywbHbFSj9GSeyZrxr5JzFj+qwDTEKj9IED3vk+R58l890WH+n6jnH4ZVNbJ05RsnSVhrN97u6ALbgJGmTilCzmZyYFImMG4IsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5c476b65-0340-2a0e-e436-46368d3236b7@suse.com>
Date: Wed, 19 Apr 2023 10:43:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230418092458.15253-1-roger.pau@citrix.com>
 <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
 <ZD6V0wzw/VS/MMw/@Air-de-Roger>
 <d301e110-f840-a032-c406-2f7404752783@suse.com>
 <ZD+ljXSEPCmPMAtN@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD+ljXSEPCmPMAtN@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9233:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c2ebf1-bd8e-4035-2dd2-08db40b22361
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KVqMU7d1lxajYxDM9QN5LIoWA4OxSK1N3RFqjm4AqtbiSoi7RvPRn1R3pjHWYbYmeE79omYeg8+f578uWZNtCXSBwWbcWqUl5t+mVvJKy1zZqN2uVyWR5LnuR+SNahmyEeRqqvuH/ZuHfqBBd+rwsrYnE+0TtdXEF1BRu4lkO7iC+KRnO/d6B/WOBkFU4p6iSajl/JygTEZKG1RXdhNkK3AthUAzNfdSsDK0xX4eBT9qQNPdai/28+lEo03esGO6a4nGf83sUh5nzbgdHP/EACw8RGg9RkSt5LNjcqoEoe1R95NwCMUktByiZsT/2ypPA0KnN0KhEjmL9ZCIK/S3ZuNKYW+Qp4n7xB7UhzwfNY+URE+EzctEJjGpvAI6IPOJYHbWvdldDwViT5Cde67Tf5dPus9nMqCSqrreehikOhtxMDhOvDz3vg4150Bx7DwesJJDNFqQZxIjEVP3PoJfTMbDfhJ1h6rulaclkGKl6LNWKHLrsZe75lQtqAxyVZvCS53VMYcBHWJcGCi+8uR5VlyDPEFWg2wVFKb1amqTOP0dADcLeG/hE3eOvMKiVVNzDLfIDxqVaMahjBKY7wKABxIxzXnwLWUMu62wF+MpkWK0vPP2e9ZZSGuMBVEij77HOlbJP6YuGKgIoyC8ApymtA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199021)(86362001)(54906003)(478600001)(316002)(41300700001)(8676002)(8936002)(38100700002)(5660300002)(66556008)(6512007)(31696002)(53546011)(6506007)(36756003)(26005)(31686004)(186003)(66476007)(4326008)(6916009)(66946007)(83380400001)(966005)(6666004)(2906002)(6486002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b042MEhJanBQVDJyWVNxRDdzcGE1d0YvMk1aWU5USVZLT1lJU2UxeUJkaEk5?=
 =?utf-8?B?WTVNVXRjbUREbTZ2V2JkVnZXaVRRNXlBdEprbHdTVDA0d1hGVHpObW9rc3lY?=
 =?utf-8?B?bEVkVk9ET2doU0IwaTJVais1WjR3NXBTZWo3NW9VcWd5Z2lJcHlGREd3STk4?=
 =?utf-8?B?RUFweHFQakV4OStBYVZvbS9WMk5kakRwT2lXdkpxZi9KSlpnKzRBT0sweFYr?=
 =?utf-8?B?eU83Y3oxYk1RNEhoV0pWMjNQTFB1aDF1VkF1WlZzUU9POEV3RW0xaE1qZXJR?=
 =?utf-8?B?c1BmL1dRRTF2bUdYOGVab2dDTHc3Yi9DMkhHY1M2ZmRuUW1iR3M1Nmt0d3p4?=
 =?utf-8?B?czBZYzMxMUhMWUhxSVcrODNCb1Rwb1FSQU5jWmxHSll1YkFLMG4vOTFhUjZ3?=
 =?utf-8?B?dG5wU3FBUllvb0hMRktyZXU0ejZKM1RURXVqdjdMcnBkWDYzd1Q1VitoRUVn?=
 =?utf-8?B?cjJsYmJDWm5sTWhuRlNhcXhzNmUrY3UzOWFRUml5MVI5ZjdPRExRQkFQWm5s?=
 =?utf-8?B?cHp5UEp2S2hERy9BRGF5NWlveVZQeVlkdzllK0p0RWttRnhtaVB3ZTZ0RWUx?=
 =?utf-8?B?TUNaK2dGK2Q4YnU2WDlZczFoTTF6ci9URXlKK0NvTkR4MDNxWW8xMUpwS2My?=
 =?utf-8?B?VllLVEVpYWY5RmlKNEx0UWdxMG5YNkN6OTRubUVhbzlzeUJTQk5RWXc2Y1ZF?=
 =?utf-8?B?ZWRNVDJFY25SeVBXT2ZXL1RVeDJSQkFDQjZIcUYyWGdiaDlRWnFPOEwrRkNs?=
 =?utf-8?B?TmNWMlYxMnExdmhrWGhWRDNEMFhRNUYvWnJxWFhlRlViT0JKYnZ4SGNybS9h?=
 =?utf-8?B?bzlFNlBxWWhNT0JnUmhpTU92Y2tWMEpQT3lhNldicGViNjZjdmhNN1FHWndD?=
 =?utf-8?B?THJaRVI1ak13MkxjVW5vbUFGV0FwNGU3MkJHZTlKOTJrVXg3VUk4SG5qeDB0?=
 =?utf-8?B?RGsvYnRpOXl4ZWhpakM2bWlPRVZYV1loa2Y2NUlhK29OK0djc2JUUzZFeEIx?=
 =?utf-8?B?Vm1kVWNlcHZtcW9kSEVZdFJNSUwvWnQxbXhOWE5nWUw0SHp4YlNabG8zQXpv?=
 =?utf-8?B?dEFpbDZqSWJnSGJJMUVHNmJQZnRrZkV6eWt3M2dwc2g2QVVMUmM1eGxVb1Y2?=
 =?utf-8?B?SjFkRkwybVFpOGc0aUhHSDkrZHJRdHRUclQ0c2huM2FXaUV6UExPWFdFblpx?=
 =?utf-8?B?V2dYSHhCb0Q4ZnNMMDRqR1E2Zko5N2k5QlA1K2RTT2dlbUl1NWpoWjY1RWZD?=
 =?utf-8?B?UWhBNkdoRko5dUwrbTZjMzU2QW1vZDBETTNXK0VRODRxbmx5dkVkVDF4Q09G?=
 =?utf-8?B?TFVCRGhRcUdUc3Rlak5iMkEydGZsK2R1N21yUUo1aDJlcklSU2l6MUdKaWdZ?=
 =?utf-8?B?WmtSaExmWFg1dnBqcklXSFpja1B3dFNOeVZudTM4K0s0QnZBV0ZLTndaMldN?=
 =?utf-8?B?RHNkcDNwOHUweHB3ZnpDQ0ViNjAzUGRwRFhsNlFzTjBhZ3gzb25obTRpeHAz?=
 =?utf-8?B?WWRidDRlSW5wNE02VzAwRUJCSFNVeHZSSTNJcWFlK3VsUnAzR1BYNHZ1MkFu?=
 =?utf-8?B?MWYzWTljUkVYNUdwK0w1ajIwdWp5QUc2QSt2Uk4ycjFRK1NzbEMxSEJ0QnRy?=
 =?utf-8?B?cTM5TEVlR3dQdzVzRjVUS2huditBTTlxQi9HMGJTOUlaQVBzT0tjbjRRbjg0?=
 =?utf-8?B?SVVRWUdEWmQ1NXpNWmM3RUxpeWdsZUFTMEl6ZEZmOVlzQm5RMU01WlFwSWJU?=
 =?utf-8?B?bWlvYTc1ZVN6SEhlNWlBV3FpMSt2cDBKR0pkZkxvMk1EcDlOc0I2dDdralpT?=
 =?utf-8?B?MG1kdlRHRk1RTGpzRFBFYldwVnBsVklOZHRwRUVtSjNubzBuNjd2SU5FQTZ6?=
 =?utf-8?B?NDV1MlYvcmxMcFRIRXptN1Yya0xTSEViM09LV2FVY0dRc0kvWUxUZ3FRRlpR?=
 =?utf-8?B?TTlLL2RTSDZ4czJIVmV3djdoMlg1aVlUV25GKzhwSUI0eTg3Q3krcCt3cFhZ?=
 =?utf-8?B?V3FMRitRc0VURVpqbldiaHluWE5xSHVBSXZDZTFjeWNDTWp0Y0EwSjk3SGI4?=
 =?utf-8?B?T3F2YVkxNmRETjVoemljcjY3YStnRGNkQlhVemltTWl2Q3orZkMrc2tUc1E0?=
 =?utf-8?Q?uIpv6nYVcncqoMYMa8dOB7UEa?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c2ebf1-bd8e-4035-2dd2-08db40b22361
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 08:43:24.9890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sUao5K9hv4+yQQVNzQJbFZuoCLjelY9qTQFGj1QwsMCj/bHthI4a5bhNqO4qvuVncHbRnKTAyOFz/rgvh1i2qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9233

On 19.04.2023 10:25, Roger Pau Monné wrote:
> On Wed, Apr 19, 2023 at 08:17:45AM +0200, Jan Beulich wrote:
>> On 18.04.2023 15:06, Roger Pau Monné wrote:
>>> On Tue, Apr 18, 2023 at 01:00:53PM +0200, Jan Beulich wrote:
>>>> On 18.04.2023 11:24, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/include/asm/config.h
>>>>> +++ b/xen/arch/x86/include/asm/config.h
>>>>> @@ -44,6 +44,20 @@
>>>>>  /* Linkage for x86 */
>>>>>  #ifdef __ASSEMBLY__
>>>>>  #define ALIGN .align 16,0x90
>>>>> +#ifdef CONFIG_LIVEPATCH
>>>>> +#define START_LP(name)                          \
>>>>> +  jmp name;                                     \
>>>>> +  .pushsection .text.name, "ax", @progbits;     \
>>>>> +  name:
>>>>> +#define END_LP(name)                            \
>>>>> +  .size name, . - name;                         \
>>>>> +  .type name, @function;                        \
>>>>> +  .popsection
>>>>> +#else
>>>>> +#define START_LP(name)                          \
>>>>> +  name:
>>>>> +#define END_LP(name)
>>>>> +#endif
>>>>>  #define ENTRY(name)                             \
>>>>>    .globl name;                                  \
>>>>>    ALIGN;                                        \
>>>>
>>>> Couldn't END_LP() set type and size unconditionally? (But see also
>>>> below.)
>>>
>>> I see, so that we could also use it for debug purposes.  I guess at
>>> that point it might be better to use {START,END}_FUNC() to note that
>>> the macros also have an effect beyond that of livepatching.
>>>
>>> Maybe also introduce a START_ENTRY() that replaces ENTRY()?  Albeit I
>>> find START_ENTRY a weird name.
>>
>> So do I. {START,END}_FUNC() or whatever else are in principle fine, but
>> I take it that you're aware that we meanwhile have two or even three
>> concurring proposals on a general scheme of such annotations, and we
>> don't seem to be able to agree on one. (I guess I'll make a design
>> session proposal on this topic for Prague.)
> 
> Oh, I wasn't aware we had other proposals, I've been away on an off
> quite a lot recently, and haven't been able to keep up with all
> xen-devel email.  Do you have any references at hand?

Andrew said he had posted something long ago, but I didn't recall and
hence have no reference. My posting from about a year ago is
https://lists.xen.org/archives/html/xen-devel/2022-04/msg00876.html
Subsequently Jane went kind of the Linux route:
https://lists.xen.org/archives/html/xen-devel/2022-08/msg00236.html

>> One thing needs to be clear though: Macros doing things solely needed
>> for LP need to not have extra effects with it disabled, and such
>> macros also better wouldn't e.g. insert stray JMP when not really
>> needed. Hence I expect we still want (some) LP-specific macros besides
>> whatever we settle on as the generic ones.
> 
> The stray jmp can be inserted only in the livepatch case, if we end up
> having to add it.
> 
> Maybe we should just go with Linux names, so initially I would like to
> use:
> 
> SYM_FUNC_START{_NOALIGN}(name)
> SYM_FUNC_START_LOCAL{_NOALIGN}(name)
> SYM_FUNC_END(name)

As said in replies on the earlier threads, I think these are overly
verbose and come in overly many variations.

Jan

