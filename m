Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326E6D42DB
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 13:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517377.802606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjHy1-00063G-EL; Mon, 03 Apr 2023 11:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517377.802606; Mon, 03 Apr 2023 11:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjHy1-0005zw-AL; Mon, 03 Apr 2023 11:03:17 +0000
Received: by outflank-mailman (input) for mailman id 517377;
 Mon, 03 Apr 2023 11:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjHxz-0005zo-Ow
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 11:03:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f9f8b19-d20f-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 13:03:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8457.eurprd04.prod.outlook.com (2603:10a6:102:1d8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 11:03:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 11:03:09 +0000
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
X-Inumbo-ID: 1f9f8b19-d20f-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTxWN8JN1/kZw5Cftr7clthGSLpLFjA0BKR50jnkAp4WRPxKXTbguD6xtJIvekBYNcEY1j6iiX/0JQ+R3Ccc0PFaz1MlcLyiCfITKkzFcWU+AxrgClZhz7Jp5HUnM+HaPGw+dw92JmYIKfR5I/HC6vf5KPjVqT6MN6lBwNrTQMu+sQoOlo4bLd0xeTXlP/B2nwpo85rM3dU1YLPPJ1cnnB5B7BhTRuQTpT/mIFK30dUp3PKk13XgBh7luU5thWGYeubuBIKPVxgDBh/cQVqgoiLuvU06Neiw5SrEAsz8Mx8CmXXmxoS6A6p71Xbwt4FmxdNxojIfoe073SBEXdxjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stlEyM17FXGz/0HvkYCKDBzaDmPVE+3EdmWVSIMQhbI=;
 b=bNG1yLlsmEZQOIGZ6sERDnD5C856fqnwm+sJ1B55y/S1uQoIk68BURMyBtHiXz7AWkBNdknl6e0znLVrV6SOKhMMt6S2WBqOYnmkIWm+K26uZc/KINhh1/Ma9Iq3jHzOkoBDueCIJTLophgDrl1z9Yv8qC4afoKw36qb6nUPPokOhiLiqZrTP2hnLMgs8Bv23UYhWCawhVxOfTiFg7A5mO89grGlfR87o4l2kSVp4i4mB9tTMaSqHOqOZeoqJ7xSiwJw9c4c6IsTggvOuw3waAjPUPxsZawTYpd5PlTU6oNXfZdrU/6t/Cb0KDwGcDqcXoNR7oRmTSNS8FZG+nxDrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stlEyM17FXGz/0HvkYCKDBzaDmPVE+3EdmWVSIMQhbI=;
 b=3kwxwvug9kGJfRYWGcwUtIvDOiEgr5YRPUCMvOuapZU8104YGYjfvKAQ+T134IQ7jhyFJkeuVOG6a0VV0KkX4aNCRpfyK7cSbgqwaNcZBEKLEOu/Lt2TM3pjJezCRDIA65MXIdTNbL5NpD4Lb4yqMmozatnD8JwFNYuQLhjfkyTZxigznCLEvlUZ2fmlh4HoFrUb2EE0qwIKosvupn1qbdrY1oIfrm9iD0sURqm6x4WHu4UGaq5SN7hP32iPbcsZd/NxSOI6PsIDZ8vrhNbHjlLj09UTcJuU2Rv+gJJVBB5EUU8JzMGDfHyPtgOU8SNVmsN9b5RFVCLtMK3DhJC6wA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d05f606b-6a74-dcd6-2ea3-7ca28aad7284@suse.com>
Date: Mon, 3 Apr 2023 13:03:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/5] efi: only set a console mode if the current one is
 invalid
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: marmarek@invisiblethingslab.com, xen-devel@lists.xenproject.org
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-3-roger.pau@citrix.com>
 <c62446e1-8e47-5fa9-1c7b-a441d38711e6@suse.com>
 <ZCWuYjP7L4obvXt9@Air-de-Roger>
 <50fe2ff9-9633-1cbb-4afb-b577778d3edd@suse.com>
 <ZCW2IHKP4GHNmBuk@Air-de-Roger>
 <6dcc187a-5e81-2f36-4104-d9caac148cdd@suse.com>
 <ZCaNwp6dJg5MhRpP@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCaNwp6dJg5MhRpP@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8457:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b503a8-60bd-49df-14ae-08db343302b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FRzZlu1H3q+FkKkcUoaOpL8rQjE6qxbubGgf83xtwvUaPMYY5AALnvbykQAUj6acIDnEzaZ7PdKQEHQYkWzGw39ZGy+YreMQxCiE47Tg7Ox6DQ6w9X8CkCe9FgDG1BvnuJBnkmkqEWapqFrW+5VSFjXy21dLVbf1QKQVyGa+b/5rWZLBQzM7DWGC66klefCCOWprPd9l4XKF+mqUmgdhqaNIEG018oIGiBJc4Tudm7WYD/cgV2ukKtFoZ0x+J9tB6EY8erjRK7+f8WLq3V1MOOQy5IrTuBJs7jjo+uQ1VSrYXEnJ8y1Iv4y5kzjAB8u/6XV/OeSsh2zbuQgsB5Lar97HrvTU93nmysbzmcxqFYL8y4WDQ/UR0lk8gbZ0W8xjJbmhMvsDI4s1PS4mjRiaFTEntOKcFhK42JmAXcIii6wzs29XTs+NCOVCWwXALO19bYDNc8cV3ZpnMbkyuCOwTiNclxcPOErK/udZSnihzOSBug9JMz7MVKqd3TO/0BKnlnWIs08o/PWwILgYXqHndrW91EbIJUabh4NmYPZocGJDlamD8zxuFSFREEQ16DQpAgq2uAzBN65moMczZBjoPrN2O10jcsyWi5QzFPydwEISHa0DTPmU4JN5z7IdhozeJo/gKCC3pHS8P5/MB/1LFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199021)(8676002)(66476007)(6916009)(4326008)(66556008)(66946007)(478600001)(316002)(8936002)(41300700001)(38100700002)(5660300002)(53546011)(186003)(83380400001)(2616005)(6486002)(26005)(6506007)(6512007)(31696002)(86362001)(36756003)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3krVGhEZDZMQ1B1a1BuUitXRlBxRzc4RWpMK1JncFNDellpTzFtMlpQNlhx?=
 =?utf-8?B?S2doMWZFVjlFaW1rdnh0VndpLzZLYkZibkt0TmpmZkpMUHZUSzJ2MTc4TTNs?=
 =?utf-8?B?cWwvRWZQRHN2RkZIbURoUk5IbW1jTzNvdHE4M1ZyY0VBbDVKSDhDQS9LN3hx?=
 =?utf-8?B?WU8zdVVrcTR6K1FydGVhTXVENFViSU5Pd3l1QWJzYTQ4VmYyZlRlYmZvaCs2?=
 =?utf-8?B?eUpFLzAreXk3cWhvYXNJZ3FpRnNmQ0h4bzJoN0VQSG9wb0t0YlJ6MSs1bzha?=
 =?utf-8?B?T3lxY0pvQ2NTUnY5SDJEL1lpMkl2VTI4bXgyaDdMeWdpN0pSK3N0RWtROUZo?=
 =?utf-8?B?eTRqbmpYMi9DLzVqNWw1a0lPOElEcUM0YkNENEtETlhxQnhuQmJHRVVLSEJs?=
 =?utf-8?B?Ny9iMHRnRTQ0V1MwU3E1ejIvL0kzRUpIZTA5SGFlZGl0SXYydVI4bTNXaDEw?=
 =?utf-8?B?b2RWUXZJMGJGbG9qTGM4WW9ncmN2NlRicVJ2N1RLa0FQZzBxT2FHaUpOMEgw?=
 =?utf-8?B?VHI3S0VFenkwcElPZkN0VUcvdmM0NlphTjV4L3RFeXIxVUZob05MTVNRUEty?=
 =?utf-8?B?VHpCWGRLQVNhdUFsNHhTYzJ4L2JrWDcxV3pmNHNuOTBwRklyaVJwM3ZlVEdw?=
 =?utf-8?B?cDFXY3NFaUZKckdHNjVzRjlwUFpCUU9MMHdWRWpUcVRsSGVUUXNFMFBCSS8x?=
 =?utf-8?B?aTNsSlVXaEQyZ3JrZWpSTTRXU1lFL2ZySjhUK2N0K0tFUFdvR0Q2bVR0WEVo?=
 =?utf-8?B?c2FFUnJUNHJSOVZHKzYrdUV1M1J4bVE5eFE5eEdVZTFFOWtYZmwwMGR6Vld4?=
 =?utf-8?B?TG9zeDFvV2N4eTdCajJwNUIyS2ZsQytjYk1KdmtKQ0FzNXAzR0N5R3dwcHBQ?=
 =?utf-8?B?UW55cE56b3RNQ0JNekxzZ0xPV0RoNkErcEtoL21YeXlSaWpsc0hWSnorRFJG?=
 =?utf-8?B?Q3Rjeno0bzZhT1pMYTFJMFdZVVdENTZ6bnZGOHo0ZXkwMVFPNGg5WGxHdE00?=
 =?utf-8?B?MmI4REdNMVBkMC9JdXRHdEtXc1BOWVlkdG1Wd1FYcXhXY2RSaitITk1EZXZl?=
 =?utf-8?B?dFFjd2ZIbzU5cmgrWWswRXRkd3RtaXg5WW1aT1pvNnJjeU9OVE5lUm5jL2pz?=
 =?utf-8?B?ZHJXQmk3ODhHVjMxTG5RKzlwNEJab0ZBZzJOQWZ3TmZiaGVjeXRzWDgwcVcw?=
 =?utf-8?B?N3lweDdCK0JlZW5obTlNWTNuSHFlL3RETXQxVFp4MEVHQ29QK1N4dU5lQy9F?=
 =?utf-8?B?R3FFd244U2cwWUVIbE1pYXBlQ0RLaGZOeUw2ZUJhcHMyMEYwcVpBZTFpTVdU?=
 =?utf-8?B?K1RiM25UUHhYUUlPa2JNTUorTW53cXVKZWZhcjQ2T3JPcjZCSmwvVTZpWVBi?=
 =?utf-8?B?Y2NWOUpnY3ZraDlsMVB0RDRkQ1dQZWtyYytPY3A5TitKNldrd1BXbFQzZFlX?=
 =?utf-8?B?d2VtR2RLU0lBZUlzZEkwV1Q0dGJlaVg1VkNmVGpyb2F4TGZ5Zm9QOGNscW9T?=
 =?utf-8?B?K1EzKzVPUzhteW9uaVV3QWF6VndVQ284VWJtWkRpL2NVVVdFNkdTWnhJVkwx?=
 =?utf-8?B?d1N6cTZxVjVYZ2dyK2pFTWp6aE1uV1ZjMnBXQThGL2NvT2JxOE41Mms0L0tV?=
 =?utf-8?B?b0laVmtLVXBwWmJsdVBlNkZWQ0hucGFCMzZ2NmVpb1BZR08ydXV6dkhuOHY4?=
 =?utf-8?B?bmQzSEUyVWNHdjFENTRVeHBQa3llRlNOQ1k1Qld5bGZtdVN0ZXM0empMTXBM?=
 =?utf-8?B?MEJyYS9lOVRpR1BUMWZUalBXM0swMkdjVDhCdUtzbHp6dE1aUFVhNnp5blFL?=
 =?utf-8?B?SWpMQjVpRVZIekVhMHVmbERWOEVQS1JxUUU1TEdTSDNSRjVqS0xvVGNRRVhk?=
 =?utf-8?B?M25KYVhQdDY2ZUlSaVBZcnlTaU1XWFRKd2YxRmpwQkViQVZjektVaTZaYkxY?=
 =?utf-8?B?ZFFpaXFLakx1V3JobGltbHk4bVVQdjI0ZjZVakd0NDljZ3BsQ3NQQmVsRFhC?=
 =?utf-8?B?OWhsMVZIVkVqRVZ3NFlRbjdyQk5DYVRvS3JLTnJrV3pmOW9mK0xjSzAvNVNa?=
 =?utf-8?B?c3ZlV1VETnNqdWhPalQwdjYvQzlqanBIVjRNODNpb2l0N0psdVp1ZlhnYXVW?=
 =?utf-8?Q?BPVPehI+B3cwqgT86rcLuki/f?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b503a8-60bd-49df-14ae-08db343302b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 11:03:09.7992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkXWOw90cf/XFu9WZvwt9RYmliXX8ZBwXj+/fAkHQzw73zrExqYIx+EQK+WOZMNQ0Ur60Vk12QD3c28xkAEqNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8457

On 31.03.2023 09:37, Roger Pau Monné wrote:
> On Fri, Mar 31, 2023 at 08:51:46AM +0200, Jan Beulich wrote:
>> On 30.03.2023 18:17, Roger Pau Monné wrote:
>>> On Thu, Mar 30, 2023 at 06:07:57PM +0200, Jan Beulich wrote:
>>>> On 30.03.2023 17:44, Roger Pau Monné wrote:
>>>>> I guess I'm slightly confused by the usage of both GOP and StdOut, I
>>>>> would assume if we have a gop, and can correctly initialize it there's
>>>>> no need to fiddle with StdOut also?
>>>>
>>>> Setting the GOP mode is done last before exiting boot services; this
>>>> may be a graphics mode which doesn't support a text output protocol.
>>>
>>> Right, that's what I was missing.  I assumed that all modes available
>>> in GOP would be compatible with the ConOut mode.
>>>
>>> Would you be OK with leaving StdOut as-is when booted from multiboot2,
>>> or there's a chance of things not being properly setup?
>>
>> On modern UEFI it may be unlikely, but I think it's not impossible (see
>> below).
>>
>>> IMO it's not very friendly to change the StdOut mode if not explicitly
>>> requested, as in the multiboot2 case that gets setup by the
>>> bootloader.
>>
>> May get set up, that is. If it was set up, then yes, we probably should
>> leave it alone unless told to use another mode. I.e. no vga= or
>> vga=current should minimally result in no further mode change. Aiui we
>> can't easily honor vga=gfx-... in that case, so leaving the mode alone
>> there may also be better than trying to guess a mode. The only time
>> where I would think it would be nice to switch by default even in the
>> xen.gz case is if the boot loader handed us the screen in some text
>> mode.
> 
> How would you detect such case?
> 
> ConOut is always text-mode like because it's a
> EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL interface.
> 
> Would it be a matter of checking whether the current GOP mode is
> valid, and if so leave it as-is unless told otherwise by a command
> line parameter?

I think so, yes.

> I would also like to avoid the unconditional resizing of the ConOut
> interface that's done in efi_console_set_mode(), as that has the size
> effect of changing the GOP mode, so I would only call
> efi_console_set_mode() is there's no gop.

Or maybe when the set mode isn't text-output capable.

> Not sure it's meaningful to change the ConOut number of cols/rows if
> there's no GOP, maybe it's possible to have some kind of screen that's
> usable for EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL but not as a GOP?

Of course there is. As said, earlier on screens started in 80x25 mode.
Even going to 80x50 or 80x60 is already an improvement. Plus there are
systems which support wider-than-80-cols text modes.

Jan

