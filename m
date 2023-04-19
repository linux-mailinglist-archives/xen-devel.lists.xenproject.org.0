Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC9E6E7CF9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 16:39:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523537.813674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8xh-000818-Ni; Wed, 19 Apr 2023 14:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523537.813674; Wed, 19 Apr 2023 14:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp8xh-0007yi-KF; Wed, 19 Apr 2023 14:39:09 +0000
Received: by outflank-mailman (input) for mailman id 523537;
 Wed, 19 Apr 2023 14:39:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp8xf-0007ya-GE
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 14:39:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe02::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef061e91-debf-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 16:39:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 14:39:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 14:39:03 +0000
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
X-Inumbo-ID: ef061e91-debf-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3BdDt+8H0P+DlCngnec5CxLrDQoqcY7XkZzTZhYcYALpsXie0L+jXpgXgwWae+WStiLuoLpG/VdMru0mXCxPHdGjtuqOvBvtvengd5qkR3M5/iLysGh52QsEx6M7Mp4b5TgW9x9NxJ6cGkgpE1ieueU+KC9CAFdsCl+fS0fpN77j/Kddx6Kpf+Vnm3EfATOcDi9HtehPeb9ss0QK/FpFCqAPHQbmV5U+LIxSRitzNzm/ptiIlwPddA10DOKYugVl0qAriLHOoU8YhLJXZToM/b2Mb0+hHskqNxzSRFstRbmYYRuGLQWTQXADBmKmYS0qj/nKUKHaCBoSEJ2A1HONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xssnYWGobsNkq1BAfJb2W+65MdVPlriedpNJgVRsLzY=;
 b=inx2ovpC0xM6jkwYNlUsWB1ITSYOiX0HYvqVhImwzYtT/6Z/XXoMR8814p8DlF0DJxv/8Wen3rMQF5Uj1S154Y8tCwuz0/WNPU/PihmjQJEOQZC74tSiSmzOkr2Hkx1ATPOTnClxFYXO6XdLhnJ87R38xhA2Va9JfIUE5NE7aYY4++SK3rpq9VUm8eM7pjC74YPnBdPlCuqROQGLtrsW5IPOGRnsOT/pco82pGcm+vCiQOIp4nXM7vzSUCJ0UbhCEBO9Bolvaskp1bKBbZ+8wBbnLS+cXD4/fSRWESuyUr/XkXd6vVxUWLzyuHaTSXEsW1bDJv+6JJqu20+z94b6pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xssnYWGobsNkq1BAfJb2W+65MdVPlriedpNJgVRsLzY=;
 b=KYBhsXZob4jW3/7srTptVFpx1CpAyNEpoOmYDg+TgxVRojtUTJRYZI9soLLSMAX3lGeE2KCWbHQAdMM0wxnLhyc2jeHQ7EIVMKFzL93LHQ2XlEHv40a+8OkVthz57ui3717OA6FHLolFIndIB6qkZtpEjkbqIiguTsj5lknJfS2ukxGBDJZ2yjJPlYohs8fQEOcvhyXHSbO08oXrXlYuKrR1WG93WpfmfBpuSu16Urq24k6i2Yb0uNJG7F6ikaldTstvjLTZOAFt/1VVkpUjWTjrtTR45qqxQHBYdKd4OzJNk0HAhHTe4ZB4GN/1W8xmaTCw4iScXsq7puW7+yuFow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cfcaed2-21e9-a794-86b4-97f9b350c0d4@suse.com>
Date: Wed, 19 Apr 2023 16:39:01 +0200
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
 <5c476b65-0340-2a0e-e436-46368d3236b7@suse.com>
 <ZD/UMyeckvCq0ivf@Air-de-Roger>
 <86823b76-6be1-da65-7608-af391ff48978@suse.com>
 <ZD/uX1VqYchQ4GgT@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZD/uX1VqYchQ4GgT@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 000d9b4f-a9be-4fde-0d2e-08db40e3d22b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H/6/ERKnqDZrlUykk+rLTfM/5aBdvTTK7FwoTfRVK2KXlFV/8tLsmSdf/+hFz+MPsAXzwhTXA27u5i0TfKWUIHXZdsUlubRc1d9W5/sMfqDQvANelkPHprxJ/GK/lq6GQw592MgcbpxYs4p7k+aFyoPPa9HlXNA/fU2Uxwc3Z6iWolhBALzKL8CKpaND9Wfjvpkxl2l4IpASOgZPtv/trHzhCg9+Dnzry3SD5nuLl2yamOH4oAyu10qctMJkFCNA8V1G6TkjRbhvVPZt0Ps5ob2MMBddk0nB32m8MIT5cAmO4Lj7enYAnGZX33Srh2f5Lcq1pU5EXnMwsvSgCF7wnywjkxVLlkSQFbayIvBUupnInR63pWnr8m5EVX2qJl27KP4winjSSprbpkOLPSSDRZuo/7CDLTg1M6WaDlUSGVEjkVkVA9xeqxM9PwK0rUTzqYpf2jQkILSWh11bl96SqM1EEi0iE+UbMxGVIRy8Wo8NCb8GgPoq/5m8Nr9pWwzzNHakuJvvemxNDw2T93vHw/VdNCpE2np3QwiQoW1MZX/3KOp1ASWkcsBF3VtPjbkqRZLWP0BDVpQZ/r7LLehau2QajvKMEyZBAmcN9+zISCbCjZz4gPyU/TUomRk7E4cmNuqg6J/c4xF4A5ML0HhBXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199021)(36756003)(86362001)(31696002)(38100700002)(478600001)(26005)(6506007)(6512007)(966005)(6486002)(5660300002)(41300700001)(66556008)(4326008)(316002)(8676002)(54906003)(8936002)(2906002)(6916009)(66476007)(66946007)(31686004)(83380400001)(66899021)(2616005)(53546011)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXMvWkROMU5MVTZ4dmxNNi9talo1T0pxUkE1c3BYREIvYjVMaVB0cW5WakV6?=
 =?utf-8?B?YjRZS1ZieldrcTVlNXRuSTRCc2N0VzNLdnpVU28xejI4MFVueFBsOWR0Ulkr?=
 =?utf-8?B?V3ZEUUZCSnM1ZDZUQUpLT2lPalc1MTduenNGeVJmWlhjSFhQZEM5TnlLSENR?=
 =?utf-8?B?VXVsRDl1OGpzVEJ0UHVsUVZkVlFQRnl1aHU1dEdJdHMrbUZYUzUrWGZXNWpB?=
 =?utf-8?B?RnlEY1MxVEVZRkpXMCswRk5lanFvemV2RTU5SFhqbGk2TVRTMjFyeW5WYTFu?=
 =?utf-8?B?Qy9vRGYwYmdzQUhCUFNwSEdNZmF0ZUNWcnJ5YjR6amtTN1NLWFlMdnFtN1J6?=
 =?utf-8?B?eWlNbnIzQytNVUtYOS9QRk4yY2VWOTNvL2c0WW5idXpqcGgvZDUxT2R5ZHNj?=
 =?utf-8?B?UUx3dXRjVHBVNU0rZG9mWk5vMUUwbTRVRXlTbE5RNUkvbWZZbmZIS1BkMmNr?=
 =?utf-8?B?Y2o5YlhaaDgxWXY1L3dVUWRKSXFOV01NV0FzM0xlbXQ0T2xvMWh5b1NYS3VI?=
 =?utf-8?B?MytoUERSK3BnS0ZLcDJtUWNoV3dqVThYaU5haGhlZTBxOFVoTG5hL01VMjE0?=
 =?utf-8?B?WU4vV1Z3UHQvTXVNdzVpOUtJTWliWjFTL2N6WlkxMlM1Y1hTK3ZzTWZaYlNW?=
 =?utf-8?B?SWVWbUViOGhITVlKL1ozZ3hNRUl1V0pCRHZFa1J1TTBNOFFpMkFLN1FsMTZy?=
 =?utf-8?B?OWFiQ0VvNnJqMzlDbmI0THV3a1lJUis4MTZ1NUpTVW1KSWZ5b0pQd2g4aHZ2?=
 =?utf-8?B?RjJsUy8yWW5teU1zQTF5UG5WVUdsTjZzS20rVld5anNqOWgwaFVtYUJ1T1lD?=
 =?utf-8?B?YXJPQ25kRGVpWlNTbFEvRm1aQXRpdmhPUjlEOTRKbVdjd0N5dGc0STY3WVRM?=
 =?utf-8?B?aCs2SWhodXhZeEs0Y3NjQzRtNitDMkJYck9HUkQ1dWQ4UkV6U1Z4WU5INkI5?=
 =?utf-8?B?OWFjajYybE9UMTZZeC9ralJJVmpXaHBzZDl0TEQ3TTZHZ1pCUlM4VTI3azVO?=
 =?utf-8?B?UHcxOXNQVDYybGtpMC8rUlB6cWJsL1JxaFVzSWJGUEJGUHBIaWxucHN5cktP?=
 =?utf-8?B?S0tQM2NWNlJnTnF0MkhRR2Z6U1FqODhLWjR3bXByeFZ0cCszUzdtczZROHVz?=
 =?utf-8?B?aENrQUFvam1Cb0E1ZGVsVXRaSEI0V3ZZbVp5enZ2UXdoYS9iblRSbVJqY25F?=
 =?utf-8?B?ZHVJcUxDVjJES3NWMWNTKy95Y3RueGVaNUVieEhPZnI1RUxwUWlPNVRwUHR6?=
 =?utf-8?B?bGlqUkd0NkVUUHd1VHgvY2RiaWt2NWFJNVFJdlVwUG9CRHVnUlJOcm5RQWl0?=
 =?utf-8?B?VjkwRUZUcmxoR20wMmQyOFhZTWlyRitzY0JMUGFyYmxQLytMbVhUWTNIVGR1?=
 =?utf-8?B?dXE3WFQxWW9UWmNUUG5sVTdZeGg4SlRkQ2pUdktmSDNtM0xjb05NUDZCSUI2?=
 =?utf-8?B?SUYxTU5TMDNlVEtXODJzSThEc1M1ZFZrQ28vQVpENGNYRmxISHRWUXpaa1o4?=
 =?utf-8?B?MXVNcVkwbi9RL1lwVGlzYmNxMUFtdmFZbEFPeWZNTHlEVjJPb1MvQjJTVERP?=
 =?utf-8?B?MzRXbVAyQ0l2QXkwWm0wRDV3eFpsb2s2elRMR0UwanU5cXdOOUwxTVJLV3Ay?=
 =?utf-8?B?ZzFiZllDcjB4NjcrUEZNN1I0Y0g1MzRnWjdwNzhOeWlsempxNWRXcWZYQzZ0?=
 =?utf-8?B?dFIxNzRnUUxXYW5TYU1XOWdscUtxZVFScUhQZURyTndWSVRrN3lqYnBSdzdl?=
 =?utf-8?B?VkZ4VVlKT3hiN0R4MTU4WkViNTlUbFcvdUZvVysybEhTbm1rV2RGZ010OWhY?=
 =?utf-8?B?d2FXcExHbUwzelVzRlo3cHR1K1BFN3ErVmdkVGVYbWVxQU9Yb1pXNFQ0TmVo?=
 =?utf-8?B?TVVUOEJ3OGtVQVVDaVRsK0w3cVhaNjhtR3JaYXYxYjZadEM3T0R1SCtQUVR1?=
 =?utf-8?B?czVJNVlOWUJwQTBzY0Z0Qkt0bytZYS9WRFFxTmNKVWhKNmk4ZlNSUlltYVg1?=
 =?utf-8?B?VlRXQVJtcm5xMHRjdkZ6YkdYcWJDUk9TSFh4ajQxeE02R1BVU0hVd1IwNGVm?=
 =?utf-8?B?dlQ2TDJaS3FZK28rSmZmTDV6UkFoQVRReElRclBleVQxYzlDYy9QcGp2dWhx?=
 =?utf-8?Q?El1c4OC9R5S/IV7l1RZcCH3H+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000d9b4f-a9be-4fde-0d2e-08db40e3d22b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 14:39:03.2269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAzlJQC8XB34porN/UNXvQnI3XNtwoPwR5FcdNKjhRncWkQ7ubbV1kJ4TxAz2J8tBRtYvyhErFNxx4014WLsIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735

On 19.04.2023 15:36, Roger Pau Monné wrote:
> On Wed, Apr 19, 2023 at 02:00:38PM +0200, Jan Beulich wrote:
>> On 19.04.2023 13:44, Roger Pau Monné wrote:
>>> On Wed, Apr 19, 2023 at 10:43:22AM +0200, Jan Beulich wrote:
>>>> On 19.04.2023 10:25, Roger Pau Monné wrote:
>>>>> On Wed, Apr 19, 2023 at 08:17:45AM +0200, Jan Beulich wrote:
>>>>>> On 18.04.2023 15:06, Roger Pau Monné wrote:
>>>>>>> On Tue, Apr 18, 2023 at 01:00:53PM +0200, Jan Beulich wrote:
>>>>>>>> On 18.04.2023 11:24, Roger Pau Monne wrote:
>>>>>>>>> --- a/xen/arch/x86/include/asm/config.h
>>>>>>>>> +++ b/xen/arch/x86/include/asm/config.h
>>>>>>>>> @@ -44,6 +44,20 @@
>>>>>>>>>  /* Linkage for x86 */
>>>>>>>>>  #ifdef __ASSEMBLY__
>>>>>>>>>  #define ALIGN .align 16,0x90
>>>>>>>>> +#ifdef CONFIG_LIVEPATCH
>>>>>>>>> +#define START_LP(name)                          \
>>>>>>>>> +  jmp name;                                     \
>>>>>>>>> +  .pushsection .text.name, "ax", @progbits;     \
>>>>>>>>> +  name:
>>>>>>>>> +#define END_LP(name)                            \
>>>>>>>>> +  .size name, . - name;                         \
>>>>>>>>> +  .type name, @function;                        \
>>>>>>>>> +  .popsection
>>>>>>>>> +#else
>>>>>>>>> +#define START_LP(name)                          \
>>>>>>>>> +  name:
>>>>>>>>> +#define END_LP(name)
>>>>>>>>> +#endif
>>>>>>>>>  #define ENTRY(name)                             \
>>>>>>>>>    .globl name;                                  \
>>>>>>>>>    ALIGN;                                        \
>>>>>>>>
>>>>>>>> Couldn't END_LP() set type and size unconditionally? (But see also
>>>>>>>> below.)
>>>>>>>
>>>>>>> I see, so that we could also use it for debug purposes.  I guess at
>>>>>>> that point it might be better to use {START,END}_FUNC() to note that
>>>>>>> the macros also have an effect beyond that of livepatching.
>>>>>>>
>>>>>>> Maybe also introduce a START_ENTRY() that replaces ENTRY()?  Albeit I
>>>>>>> find START_ENTRY a weird name.
>>>>>>
>>>>>> So do I. {START,END}_FUNC() or whatever else are in principle fine, but
>>>>>> I take it that you're aware that we meanwhile have two or even three
>>>>>> concurring proposals on a general scheme of such annotations, and we
>>>>>> don't seem to be able to agree on one. (I guess I'll make a design
>>>>>> session proposal on this topic for Prague.)
>>>>>
>>>>> Oh, I wasn't aware we had other proposals, I've been away on an off
>>>>> quite a lot recently, and haven't been able to keep up with all
>>>>> xen-devel email.  Do you have any references at hand?
>>>>
>>>> Andrew said he had posted something long ago, but I didn't recall and
>>>> hence have no reference. My posting from about a year ago is
>>>> https://lists.xen.org/archives/html/xen-devel/2022-04/msg00876.html
>>>> Subsequently Jane went kind of the Linux route:
>>>> https://lists.xen.org/archives/html/xen-devel/2022-08/msg00236.html
>>>>
>>>>>> One thing needs to be clear though: Macros doing things solely needed
>>>>>> for LP need to not have extra effects with it disabled, and such
>>>>>> macros also better wouldn't e.g. insert stray JMP when not really
>>>>>> needed. Hence I expect we still want (some) LP-specific macros besides
>>>>>> whatever we settle on as the generic ones.
>>>>>
>>>>> The stray jmp can be inserted only in the livepatch case, if we end up
>>>>> having to add it.
>>>>>
>>>>> Maybe we should just go with Linux names, so initially I would like to
>>>>> use:
>>>>>
>>>>> SYM_FUNC_START{_NOALIGN}(name)
>>>>> SYM_FUNC_START_LOCAL{_NOALIGN}(name)
>>>>> SYM_FUNC_END(name)
>>>>
>>>> As said in replies on the earlier threads, I think these are overly
>>>> verbose and come in overly many variations.
>>>
>>> Right, I would only introduce the ones above and as lonog as I have at
>>> least one user for them. I don't think there's much value in importing
>>> the file wholesale if we have no use case for a lot of the imported
>>> macros.
>>>
>>> The main issue with ENTRY() and ENDPROC() / ENDDATA() is that we still
>>> need a tag for local function-like entry point labels, would you then
>>> use PROC() for those? ENTRY_LOCAL()?
>>>
>>> I have to admit I prefer the FUNC_START{_LOCAL} for that purpose as I
>>> think it's clearer.  I would agree on dropping the SYM_ prefix from
>>> the Linux ones if there's consensus.
>>
>> Okay, I'm glad we can agree on no SYM_. But what value does START have?
>> And why would the type be (re)specified via ..._END()? FUNC(), DATA(),
>> and END() ought to be all we need.
> 
> Does it imply that we would then drop ENTRY()? (seems so, would just
> like to confirm).

Yes. ENTRY() may not go away immediately, but I'd expect it to be
phased out.

>> The type would be set by the entry
>> point macros, and the size by END(). To cover local vs global I could
>> live with _LOCAL suffixes, but personally would prefer e.g. LFUNC()
>> and GFUNC(). We could also limit ourselves to FUNC() plus DATA(), and
>> have (non-)global expressed by END() and e.g. LEND() or END_LOCAL().
>> One less macro, but maybe slightly odd to have the .global directives
>> then at the end rather than at the beginning.
> 
> Hm, yes, I do find it odd to have the .global at the end.  FUNC and
> FUNC_LOCAL would be my preference, I do find {L,G}FUNC a bit
> confusing.

Well, yes, I was expecting this to be the case. Hence why I said I could
live with _LOCAL suffixes, even if they aren't my preference. What we
may want to keep in mind is that sooner or later we may want to have
non-aligning variants of these. That'll again make for larger names,
unless we went with e.g. an optional 2nd parameter which, if absent,
means default alignment, while if present it would specify the alignment
(which then can be used to effectively specify no alignment). E.g.

#define ALIGN(algn...) .balign algn

#define GLOBAL(name)                \
    .globl name;                    \
    .hidden name;                   \
    name:

#define FUNC(name, algn...)         \
    ALIGN(LAST(16, ## algn), 0x90); \
    GLOBAL(name);                   \
    .type name, @function

with these helpers (and count_args() as we already have it), or ideally
something yet more simple (which right now I can't seem to be able to
think of):

#define ARG1_(x, y...) (x)
#define ARG2_(x, y...) (y)

#define LAST__(nr) ARG ## nr ## _
#define LAST_(nr)  LAST__(nr)
#define LAST(x, y...) LAST_(count_args(x, ## y))(x, ## y)

Jan

