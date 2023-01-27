Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B3667E6CD
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 14:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485571.752890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLOpm-0005aN-Ur; Fri, 27 Jan 2023 13:32:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485571.752890; Fri, 27 Jan 2023 13:32:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLOpm-0005Xs-RN; Fri, 27 Jan 2023 13:32:02 +0000
Received: by outflank-mailman (input) for mailman id 485571;
 Fri, 27 Jan 2023 13:32:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N8iV=5Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pLOpk-0005Xm-Uz
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 13:32:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f866da8e-9e46-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 14:31:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8347.eurprd04.prod.outlook.com (2603:10a6:10:245::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23; Fri, 27 Jan
 2023 13:31:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Fri, 27 Jan 2023
 13:31:55 +0000
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
X-Inumbo-ID: f866da8e-9e46-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZiZhqwosoYZEWLRLD8aoVJF3qUSpbC9qedAJ8R+hHyAcQAS0Zbb9o548HKARLOUDq2C9QRF7ANIBo0YJoDGd4yfPu0AWs9dU4B1GDBOQ3NFfddrk+0MmpR3+4XbRJm6r0jL3P3YOF9ECzbxp2UCi0p81IC1dQdZwWlwsd9CzRzmrG7uPL5ihN6grlE0WvAEMVmWWSYU2gU0TEekfqUcofzbk8cLc9XX3Qi9fpoN4qgbmqEDyMB9BI52Lum95fogJ/X0gPYhrX+pHH2D7LD6+NNXQb9v8keyPBHCVA+XQ3l/EYpoyu5Ojb59nVUwtw3/0P6DOES8/ohXPGInMwHmYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1FFysP9RrthLav+DJU++YkJ6BUwe3JJ8HzNqAXWhM8=;
 b=b4BqureZo3+AOTS3IMLU9JsfjCcCeuuJi6thUbNHx2D5A3yn4Hi68zFPU+YWn71RlhcF8HYTnSaOd4exCi0vCRGUFFIW7vHGTc5c5Iv1rX5+hA6Y2ZhabdowlY8LPgjRpbAQJfB6rm0uqliw0D7o/xqsDuAN51ry/u/tCJuDmor9BxbQDnMMlilxIo8dgaJbCmkn6SFs0CeyX/vPTrhXZvECy960uLsY7BROh6e9iJnyhWPStI7ynqlLmAwSq6D7OYuXJDsdP8lvlYQnz4JrF2FRukhAFhtG2YuApmNHE0lQv1X67GQj16pGLXlm7azMQjs+cpG9hO/Lu0Uce4j/rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1FFysP9RrthLav+DJU++YkJ6BUwe3JJ8HzNqAXWhM8=;
 b=LGSlRphLLX3xqdO6w1NIHGnNmTnf0PbjgCz0Li7bomdhCDiw7T95QPJYcP5tYTGF/6Y+24pp5+h+jEO84xT8cUL6+JUioDVo4cCd1DlFzO73ZZSLPxMu+a1zo3SoPx7BSv4aeORj7/AMPG3wM5R+S5WYK8j4G2bL9IN1flE1a1ecUbL56Z12ZYGXIdzqcQQvTFNDAhKKDASoWvhVkEysoWycaSeJErOt5Qv+djVXSAF5R45G1h4TqS2CvUGIXrRJJj7lT1C0/Z1Mq5JADEGWbf5kblg3jRxD78LDQgwyjKmKsTMLKrSkvcUWshtOzKBzPEB7X8hMdLnOv32abToNrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c843b031-52f7-056d-e8c0-75fe9c426343@suse.com>
Date: Fri, 27 Jan 2023 14:31:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 07/11] xen: add cache coloring allocator for domains
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-8-carlo.nonato@minervasys.tech>
 <21f1e368-5d44-b689-0bb7-164a53e5ffd7@suse.com>
 <CAG+AhRXvKi4HmPoOL7cLToCgOPf3-evvcdvSzYGZ6fLc+mBvtQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG+AhRXvKi4HmPoOL7cLToCgOPf3-evvcdvSzYGZ6fLc+mBvtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 2745055e-edf4-4e5d-6454-08db006adb75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6fQASB5syyCLthh9GEAleSF028xCSFZVMJduQLDvKlEgoILm86Q5fKn7w7W3oVFw4eYEL/O5PBnqn3kaKAOYNoXbkeqsnr3qzR9/o1Yz7t1MM7W/vJOn4RKHNKnv1cZCj6hyHfHlKR/YdiRJFiO8UHk3OwAYKbanHGy/20iLC3i4gxnutBxk0SxLQrA01d8L7ZVbNDwVMFjhXDqSjpVJmQU4yl5CzpFgSXOWgwIEotnxhIXitwib1KpNbEvGGmP14fDsgROewW4KE6L6v4/NgmUUKWEHKkKU9eWu/UYhFeKTDrPsLQYUWbN48rwd1zbLy82Dw/6wEkACMThMQIpH+nNFWQubNjFDFMoSI9a69aqMpUFQTqnF3DHsxJS34Fv6p3rFSDAg+6OCWXYxE9I290Jp4lxoDWDpDk/IIK7OTy/3Z6ld8AbYT9IGaL0UHsAii7EAzqYnN/pscntekh6/a6FxkdfpI4912YOU5Oyzm+mfAh7WReYDHPwydEEoR0vCHCV3TAt1EjU92/YJD/ipVw/qN7rK6ykkF8+RiLxfjQ7IIH5FoGytzm+WZ42PbavXIZt8WZxpviUHKbSUc6DBk/aiztgZHwfqjio0m5hB3Z71fQI/6zyfJqcF7QEjzGSMt/ASpZkH/a48MHdYc9hXBqaS5IkVH8PSkCmQhpugKr3R8yPGihXy9Kt3bOywSl3TbBwDR7mdcZU4LO8d8ZS6M6c0BdlNdMHlQT2y3a5/uaQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199018)(2906002)(5660300002)(8936002)(41300700001)(7416002)(4326008)(6486002)(478600001)(26005)(186003)(8676002)(31686004)(6512007)(53546011)(6506007)(86362001)(2616005)(66899018)(66556008)(83380400001)(38100700002)(66476007)(6916009)(66946007)(31696002)(54906003)(316002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUlBRmphZm9ZcUV2RlZwN0FBcFhUQllVYWtoY0dLUWs4b1ZTMWZ5K0tuUGtF?=
 =?utf-8?B?bUFNcTczNjE5MjNSY29FM21mdVVLNmxCa3doQmVMY0tJcHZCSkFkdFdlSTVt?=
 =?utf-8?B?SDBVQkNtdjBocUFMMHp2Y2RzVFhacEhOU3AxQ0x2TU0wZS9qdXFjRkZGZUpT?=
 =?utf-8?B?TmlTWnJsQkZZd3dxeUVZdi9Mek10WmU5MWMyVmFuaUs1NW9raWthakdvK1d6?=
 =?utf-8?B?Tkc4eHhKRWgrUXJUdDdyYmRxMGRwU2pMTzhKaEg1R3pCWXRuR2FOQXZGVFdS?=
 =?utf-8?B?SGlUY2wzNTJlb01GT3RWak5nV2V1a0MxcUFKdUFpUjE5UW5ZUnpoRDIvekR0?=
 =?utf-8?B?Qlp0eVJaOWl5SWpQWUNGalRTQVgrMGVqbkZwcENmc0Vzb1pWM2tNWEF3VHFy?=
 =?utf-8?B?MDNNcmc0ZUpMNHZpV1dTa2g2Z3ZhWVJTcUZSTHZtdC9EYzc1L3hnZkRiNW1I?=
 =?utf-8?B?aU9JNUVJcmtVbytMVHYrd3NXbFdCN0hHSXg3a1d0MTZaRkJibVVwbmFTcm1k?=
 =?utf-8?B?M0p2UlQ0Wjd5ZEplWGNiajdpcllrZ24yZ25Uei85bVlVSjhrU1pyMG5PR2pa?=
 =?utf-8?B?dWVLZVE0MlNxQmk0elhWWnYvQ1piWEkzelA1ZXBpL0hlLzBnd2grc0JiUjdP?=
 =?utf-8?B?T1BPUXkyOUsrZEo2a0ZmTVI4bGVCOTdzbkhYa0FuVnFraG9xUmVzcGkyYmE2?=
 =?utf-8?B?d29PbG1yZTdBdXRPd3lERGtWVUhId1huSEU2dVJReExvd1cwRTh3TTUrSStY?=
 =?utf-8?B?b3JMVHUvZk4veGljZzdzZ1hPQ3V5QTBUY3VRdXBKQXZXenpVRVVQek5ObVhG?=
 =?utf-8?B?dldCQmdjSVh4NkFWNjhGUWxQMEptTHRLNThweGNBb1NFV0RxSWdIS01iUjht?=
 =?utf-8?B?YjZlUklvZG1nckplMUkyUnBhTDFZeDRSM0J4bFJSRjVtYUR5YzZjLzJUdDYr?=
 =?utf-8?B?UW00cVJyOHg5TGlzMDhlZnBhNk1XN2xkWWlSMFQ1M0wzeTQrZE5Oa0Z2UDNn?=
 =?utf-8?B?TnFjQ0ZUWEVCRytJblB1YzlGZDVPR1IwTnZLZktaWWlPa0FGSHlSUEdVSVp1?=
 =?utf-8?B?OEhCQmtNdmliSWtMVlhxZEd1ZThuemVsNUszT0dvUENSaENCTlVtMmR2NXZB?=
 =?utf-8?B?RjdEVGJmVGw1T2Y3R3lFdE9EeW5GakxWdE9nZVU4NTdaZlp2ak0vc2lxcmdn?=
 =?utf-8?B?WE5PdXI0M2Uxelc5TlBSZzBXMGo4cURBbGpUcGhMTDlSbTlaRjV3c09WL21i?=
 =?utf-8?B?QkMwM0ZOTGcvZ1JiM0RJRGFrWDFTZEllQm5TSHd0aitWTTU1Z3J2Nmd5SWhO?=
 =?utf-8?B?b000VzhMZkVJcnVkWlladDkweHlYQmlMN1k1cTd0cjVRdzFrZk1QWFNjWE9l?=
 =?utf-8?B?d3JPYkh2NTFkVHd0azh5c09ndThwR2hITmoyOUVYcUlqY2owSlFDT3hYQ1VU?=
 =?utf-8?B?UGVTQTJMTStER3QzOGpJL3lTY2hvM2Jab1JwSkk1aXRoV1lkbFFzb2xQdTN4?=
 =?utf-8?B?MzVJb1FMcUtXME9JZldxVHRPY0RqQWNRWHREVTM0dXJtaU9DNDA0aEM2dncy?=
 =?utf-8?B?NGMxY2F5RmcyZmN5T2o0TGp3YlR0TDdBMmFwMmdhUDY1dkltN0ZNeXVCM0ps?=
 =?utf-8?B?cjQzeHU3UERpdXVzejJwRU1NdG16Q2xGWGJiQ3JhenYvbXdRRURGeUttbVRM?=
 =?utf-8?B?L1U0c1JJenBUT2NjdlN5cGdUSDZ6amdKYTJQam9ZWUhWYjExM0RQbmRQNFRB?=
 =?utf-8?B?cGMzL0hhbFJJUmJYTWh4dEVmSVFnT1JXNStWMHBGZ2kxRUFFRnNIamZBZU9p?=
 =?utf-8?B?blBkTHJldzZ5ZW5sMUJiWjYvbk8wam0zNGtyNW41cmIwNHZBazlVZG5YVDRQ?=
 =?utf-8?B?VzVkdlY0WW9nWnNlSVIrOUFuMEFhcDlFREFuVTBJSGdrK2hPTFdmLzd0L1lB?=
 =?utf-8?B?cURLaVM2dUdNU1lGeFFnRzZibWprc1BnazRVMjAxWmV5K1doSXJrMjh3UENC?=
 =?utf-8?B?VEVkYVdQRi8zN2JOWXQrWWtUcWRpOGhmNTgxbDQxL3JZWWZ5MXFvNlRYS0lM?=
 =?utf-8?B?N1REbTB5SU0zangxVkpWVlFUc0dhaWl3SHB4V0hlemUyb3RURklQMHBJR3Vx?=
 =?utf-8?Q?7HLzD4dL268iepIK5fMJGKX+6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2745055e-edf4-4e5d-6454-08db006adb75
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 13:31:55.2900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Xcr8u+HiRQVZsdxWs436lMiECN7wcC3iOJLIxRGvSIrvsTHQXhz8isH0HIoGlTIP+Rc4aUfrmvD5s+oaPg1Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8347

On 27.01.2023 11:17, Carlo Nonato wrote:
> On Thu, Jan 26, 2023 at 5:29 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.01.2023 16:47, Carlo Nonato wrote:
>>> --- a/xen/arch/arm/include/asm/mm.h
>>> +++ b/xen/arch/arm/include/asm/mm.h
>>> @@ -128,6 +128,9 @@ struct page_info
>>>  #else
>>>  #define PGC_static     0
>>>  #endif
>>> +/* Page is cache colored */
>>> +#define _PGC_colored      PG_shift(4)
>>> +#define PGC_colored       PG_mask(1, 4)
>>
>> Is there a reason you don't follow the conditional approach we've taken
>> for PGC_static?
> 
> Nope, fixed that.

And btw, if at all possible please avoid the #else part. page_alloc.c
already deals with that case, so it would be needed only if you have a
use of this constant somewhere else.

>>> @@ -1488,7 +1497,7 @@ static void free_heap_pages(
>>>              /* Merge with predecessor block? */
>>>              if ( !mfn_valid(page_to_mfn(predecessor)) ||
>>>                   !page_state_is(predecessor, free) ||
>>> -                 (predecessor->count_info & PGC_static) ||
>>> +                 (predecessor->count_info & (PGC_static | PGC_colored)) ||
>>>                   (PFN_ORDER(predecessor) != order) ||
>>>                   (page_to_nid(predecessor) != node) )
>>>                  break;
>>> @@ -1512,7 +1521,7 @@ static void free_heap_pages(
>>>              /* Merge with successor block? */
>>>              if ( !mfn_valid(page_to_mfn(successor)) ||
>>>                   !page_state_is(successor, free) ||
>>> -                 (successor->count_info & PGC_static) ||
>>> +                 (successor->count_info & (PGC_static | PGC_colored)) ||
>>>                   (PFN_ORDER(successor) != order) ||
>>>                   (page_to_nid(successor) != node) )
>>>                  break;
>>
>> This, especially without being mentioned in the description (only in the
>> revision log), could likely also be split out (and then also be properly
>> justified).
> 
> You mean to make it a prereq patch or putting it after this patch?

A prereq, for ...

> In the second case it would be like a fix for the previous patch, something
> that is to be avoided, right?

... precisely this reason. Elsewhere you make a constant from
PGC_extra | PGC_static | PGC_colored. Maybe that could become a file scope
one, which you could then use here as well. Then the change wouldn't even
depend on you already having introduced PGC_colored (but otherwise just
having the stub #define earlier in the file would suffice as well for this
to compile fine independent of the bulk of the changes).

(FTAOD PGC_extra would be meaningless / benign here, for only ever being
set on allocated pages.)

>>> +static void free_color_heap_page(struct page_info *pg)
>>> +{
>>> +    unsigned int color = page_to_llc_color(pg), nr_colors = get_nr_llc_colors();
>>> +    unsigned long pdx = page_to_pdx(pg);
>>> +    colored_pages_t *head = color_heap(color);
>>> +    struct page_info *prev = pdx >= nr_colors ? pg - nr_colors : NULL;
>>> +    struct page_info *next = pdx + nr_colors < FRAMETABLE_NR ? pg + nr_colors
>>> +                                                             : NULL;
>>
>> Are these two calculations safe? At least on x86 parts of frame_table[] may
>> not be populated, so de-referencing prev and/or next might fault.
> 
> I have to admit I've not taken this into consideration. I'll check that.
> 
>>> +    spin_lock(&heap_lock);
>>> +
>>> +    if ( is_free_colored_page(prev) )
>>> +        next = page_list_next(prev, head);
>>> +    else if ( !is_free_colored_page(next) )
>>> +    {
>>> +        /*
>>> +         * FIXME: linear search is slow, but also note that the frametable is
>>> +         * used to find free pages in the immediate neighborhood of pg in
>>> +         * constant time. When freeing contiguous pages, the insert position of
>>> +         * most of them is found without the linear search.
>>> +         */
>>> +        page_list_for_each( next, head )
>>> +        {
>>> +            if ( page_to_maddr(next) > page_to_maddr(pg) )
>>> +                break;
>>> +        }
>>> +    }
>>> +
>>> +    mark_page_free(pg, page_to_mfn(pg));
>>> +    pg->count_info |= PGC_colored;
>>> +    free_colored_pages[color]++;
>>> +    page_list_add_prev(pg, next, head);
>>> +
>>> +    spin_unlock(&heap_lock);
>>> +}
>>
>> There's no scrubbing here at all, and no mention of the lack thereof in
>> the description.
> 
> This comes from the very first version (which I'm not an author of).
> Can you explain to me briefly what is it and if I need it? Or can you give
> me pointers?

Did you look for occurrences of the word "scrub" elsewhere in the file?
You want to avoid pages holding information from one guest to become
visible unchanged to another one.

>>> +static void __init init_color_heap_pages(struct page_info *pg,
>>> +                                         unsigned long nr_pages)
>>> +{
>>> +    unsigned int i;
>>> +
>>> +    if ( buddy_alloc_size )
>>> +    {
>>> +        unsigned long buddy_pages = min(PFN_DOWN(buddy_alloc_size), nr_pages);
>>> +
>>> +        init_heap_pages(pg, buddy_pages);
>>> +        nr_pages -= buddy_pages;
>>> +        buddy_alloc_size -= buddy_pages << PAGE_SHIFT;
>>> +        pg += buddy_pages;
>>> +    }
>>
>> I think you want to bail here if nr_pages is now zero, not the least to avoid
>> crashing ...
>>
>>> +    if ( !_color_heap )
>>> +    {
>>> +        unsigned int nr_colors = get_nr_llc_colors();
>>> +
>>> +        _color_heap = xmalloc_array(colored_pages_t, nr_colors);
>>> +        BUG_ON(!_color_heap);
>>> +        free_colored_pages = xzalloc_array(unsigned long, nr_colors);
>>> +        BUG_ON(!free_colored_pages);
>>
>> ... here in case the amount that was freed was really tiny.
> 
> Here the array is allocated with nr_colors not nr_pages. nr_colors can't be 0.
> And if nr_pages is 0 it just means that all pages went to the buddy. I see no
> crash in this case.

Aren't the two BUG_ON() not very clear crash causes? My comment wasn't
about nr_pages == 0 being an issue further down (I think I had convinced
myself that this case was handled correctly), but about the buddy
allocator still having too little memory to satisfy the two allocations
here (which also you don't need yet if there's no memory to go to the
colored allocator in the first place).

>>> --- a/xen/include/xen/mm.h
>>> +++ b/xen/include/xen/mm.h
>>> @@ -299,6 +299,33 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
>>>      }
>>>      head->tail = page;
>>>  }
>>> +static inline void
>>> +_page_list_add(struct page_info *page, struct page_info *prev,
>>> +               struct page_info *next)
>>> +{
>>> +    page->list.prev = page_to_pdx(prev);
>>> +    page->list.next = page_to_pdx(next);
>>> +    prev->list.next = page_to_pdx(page);
>>> +    next->list.prev = page_to_pdx(page);
>>> +}
>>> +static inline void
>>> +page_list_add_prev(struct page_info *page, struct page_info *next,
>>> +                   struct page_list_head *head)
>>> +{
>>> +    struct page_info *prev;
>>> +
>>> +    if ( !next )
>>> +    {
>>> +        page_list_add_tail(page, head);
>>> +        return;
>>> +    }
>>
>> !next is ambiguous in its meaning, so a comment towards the intended
>> behavior here would be helpful. It could be that the tail insertion is
>> necessary behavior, but it also could be that insertion anywhere would
>> actually be okay, and tail insertion is merely the variant you ended up
>> picking.
> 
> This makes it possible to call the function when next has been used to iterate
> over a list. If there's no next we are at the end of the list, so add to the
> tail. The other way is to handle the case outside this function.
> 
>> Then again ...
>>
>>> +    prev = page_list_prev(next, head);
>>> +    if ( !prev )
>>> +        page_list_add(page, head);
>>> +    else
>>> +        _page_list_add(page, prev, next);
>>> +}
>>>  static inline bool_t
>>>  __page_list_del_head(struct page_info *page, struct page_list_head *head,
>>>                       struct page_info *next, struct page_info *prev)
>>> @@ -451,6 +478,12 @@ page_list_add_tail(struct page_info *page, struct page_list_head *head)
>>>      list_add_tail(&page->list, head);
>>>  }
>>>  static inline void
>>> +page_list_add_prev(struct page_info *page, struct page_info *next,
>>> +                   struct page_list_head *head)
>>> +{
>>> +    list_add_tail(&page->list, &next->list);
>>
>> ... you don't care about !next here at all?
> 
> I did it this way since *page is never checked for NULL as well. Also, this
> other type of list isn't NULL terminated.

I see. In which case properly explaining the intended behavior and use case
in the earlier function should hopefully eliminate the need for anything
special here. I have to admit though that I consider this a little fragile
for a seemingly generic helper function; I wonder whether the special case
wouldn't better be handled in the caller instead.

Jan

