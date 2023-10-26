Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7BF7D82C0
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 14:36:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623789.971972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzak-0003Gj-V8; Thu, 26 Oct 2023 12:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623789.971972; Thu, 26 Oct 2023 12:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvzak-0003DM-SR; Thu, 26 Oct 2023 12:36:02 +0000
Received: by outflank-mailman (input) for mailman id 623789;
 Thu, 26 Oct 2023 12:36:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvzaj-0002m7-Ul
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 12:36:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37de5b70-73fc-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 14:36:00 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9205.eurprd04.prod.outlook.com (2603:10a6:20b:44c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.8; Thu, 26 Oct
 2023 12:35:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.008; Thu, 26 Oct 2023
 12:35:55 +0000
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
X-Inumbo-ID: 37de5b70-73fc-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5RSs00vJU8XVqFU9SQr4gHcqHjCgciZEHrhIrHu44Y/L7+zKJerNKwCoE+0Ot7u4jw2QkrfXUtC7/hv7k9XnekFv4dR8e5IZhh7m6NWgNDtkd1euEuoDwLSDug6JJZ3UMupZnETlSkZFlwY3D8emScrdzYo3/eZ0wkry7lldh69hiwekiJhducUrxH0T5aWv0vhHjKYBChKA7qrrWAzFC3C2n5DldIeuKtYSwB7P46Wt12mjimzOvutRUeBMKyutTYUPMNqNAVzALHNf68Ay2aIuAFuyP4hx98Em+xJwWEUPgCL90UPQHKybkTYQFtJyRBo6TL/1OBZpxp/dJQFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CovbX6FkWqZncw0b+mTNGWotV201iZbpBaYZ7ZFm/FA=;
 b=lXBIhmRUAAv00Af54BiaObRNLvsRoZDLT5EWrMidgy/gLVQzB8WsnkG3nOiuRTUFfMKTWA025QS21cbXuS+UuD31PGzPL4cB1PJ3eR1Ma1+gKMYyi1Bv2czd/Yhu7Vr+Q7fhtQ3/3AZiM1EHqFw1J/a+XfL0T+KLOhvPUlqcD3zn6zK0izXwldImIIjG6xr5Sv2I7xeLUiG59Z2OniK0J1UqIMZYL02bHMLUgwDR5mkHLoh3JsLWaTw9DW75GjRCvMTZnhxW9mpdXYbZO2XhjzOUrUdahan4fEJycbgD9uACN7mRv2JrvdxDMxjkNJ/SpUl6LzXqLJumQQV1YueVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CovbX6FkWqZncw0b+mTNGWotV201iZbpBaYZ7ZFm/FA=;
 b=CCojE2mn/dIgy4e4bni+RXgQyHSkeZXmszyTWhPZaH2ifPjjLbpWY5qu1KZdvVTV7gPIH9wFcT6ewLcrMImIMZ+xt7+BMkVtzutkD7wbH310iASk/hTdw+Qjv51pCi4bhiyodqJSOJpiRvjIUvanK89nK5rkFvPabaMa6vVOjRnUeLtahFvvMmsxKYHY02Sy+z/RjBHe4sWAuryT56vrQ2/7/ohYVkG0ehlioGs5ayUyvMTaLC3Jie+ynFoLAs8HiBku59ohQHXRopfwsbFYH/FugoL/W5BxbZ/WEP9S9BAzGQ2QuyfD03UzCerA4DgMLnkhNTLGraEpuZJOOb/f9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b8bfd04a-d32d-8495-9014-a8953ae8a39d@suse.com>
Date: Thu, 26 Oct 2023 14:35:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-US
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
 <cc4c6681-a788-4069-8470-730969018fd0@citrix.com>
 <84b6679c-1956-4c6d-1fbd-b72846b69d1a@suse.com>
 <a4d4cac5-3987-4891-8aac-c5f559a02b59@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a4d4cac5-3987-4891-8aac-c5f559a02b59@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9205:EE_
X-MS-Office365-Filtering-Correlation-Id: ccdfc767-f08f-4850-8580-08dbd62018e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PBHxcwUkgve6Zt+2FeJp7E5RinsWwMTkvkeAMf+h+sTO0dL3nnm8MrrhW/4mTChBFf7oxxnqnbDMYdB3SqOdsYZOYWOxt10O8cf7LTZFP0EjG6dLzCKUc0N8nj2UjL6sAHv1JYx6UmGGZFfF0xAnSFY/TeZ8GCuaUu3iC2LiQae3JlMeP9LB7QeUIiTvLUY5a103B6gC1Ql3GUTzP2CEj+X/3pkAQ/qNTMQ/PdQ+LxM6M/nluinyV0yhCZ7wna33qZq0r1j64qpLzTvVT2h7R02f/PIKKdK7eRBF7QFgm1XmypnTseiVQb0mJP6HT+7e8aVBPcaoF4PLpLkShCT4dxgnWrPWGkxQgfrGPiZPnRqVxhcNusUqAcuoEVcg0rHGk7+cH88upNDxFrHDeCN2TsbisWd74Gf27UjHA5kzc0ulsPnRtyERcj+G2dSnof3s+dl6rT+CMXJAFQqvp05Ej5sT8cexEoU+BGTSNgeYiHxTIpQbS+QfEejkikKHgFrS+cJpXxv8sKIawesOLut6W+BVpZnjqwBpgDESoZI+Rd3rMoW4kHSepEab3NMMEw8+KZ5CXtvJurc7JVZAJZv+CZWpt+GyQK6L0QujFcNjT0yizO+sO4dM7Qzpu40/RcQIv/L+Gq1wnFagIW80wSYYgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(366004)(136003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(2906002)(41300700001)(31696002)(83380400001)(478600001)(4326008)(8936002)(8676002)(6486002)(66946007)(5660300002)(86362001)(31686004)(316002)(6916009)(54906003)(66476007)(66556008)(53546011)(2616005)(38100700002)(6506007)(26005)(36756003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkZDZitxVmpaeGdkZzlpeXZhL2djRVExenBIakdxREh5TUxsUngydHBFMC9l?=
 =?utf-8?B?K0lYaERQWnF1cGpaSm53TXVudEMyU2JMM3dMaGw1ZEZpb09ZdGtUK3FLaUxs?=
 =?utf-8?B?RmN5Z2lYMUExT1RxcC84c1B5S21tNHZwL3VKZkRBUzRiTHpjZ2VRTU1WN3lp?=
 =?utf-8?B?dnBNV2NzWGh1QVFPbk50QVR1OTNJRUV6eHJJazVUa3Q2bFdZT2F4NVU4cGs4?=
 =?utf-8?B?UVZyOUNHSkxzUmkxUDd0WUtqV1Y1T2p1azMrUURRSDBXWUlHTnhBdGlCRStl?=
 =?utf-8?B?cDFJZ3p1NC8xTy9sakRFOWo1YkdNL1BkSEhmUng0OVN2RE9ORU9ISGJieUlF?=
 =?utf-8?B?cjN5Q1VMV205eFNKM3h5dUZsaEhBdFEvQXhNWlVsUXlJZkV2TDd6c05RWDBv?=
 =?utf-8?B?Q2dHME5BWWNTRlREWlRaVDQ3RnEvaXdWU3JjMW1nZEkzM3A3OFR0RmJ2Z05M?=
 =?utf-8?B?Z1dJNjBMM3lzOVZzTVZYNGFRakpuc05SRnEwQUhKVjlkcDIyZG5WaXE0QXpH?=
 =?utf-8?B?bmpJREFPeld2YzM5dVR5K0o5cVFYakxHeUdSakQzZFQyOFJKNUN4YWdhVDJH?=
 =?utf-8?B?dW5EUGliOGR0d1hmL01kemVlMlcyUGw4czRzTHlvdXBZNkttczlFZlpqbEE5?=
 =?utf-8?B?aHh5WURoay9pQmRIdCtuVkVGaUhOa3YrY1ZWQzFPYXdzL090RjZMMHZkczRl?=
 =?utf-8?B?TXRSTkp0QjlLTXE3SUgzek41eFdmempkQnFMa09TUnF6emFXSlhXSSs3Wmoz?=
 =?utf-8?B?VTRRNmFsb0R1ZTJ5Z2sxdTJ0b0E4ejhaWERaTUNKcXRXdXRRYjdkaVc3V0ZJ?=
 =?utf-8?B?aEpVOTZYOWhYR1BqTmVFMnBTZnVNKzJZdEdiaFpqSmtoVG5sT3lHdDFuUjJP?=
 =?utf-8?B?R1Nua3h3NE11WFlQMnpuV2UxVVhxYzh3ckVNQ1VzaE42WE95UzRUMnFyZlVO?=
 =?utf-8?B?VTdxbHhlamMzbWJiZW5sVUxYeFkzVGtUdnVqbG51czVKUGRUcXN0Mk9ieWlw?=
 =?utf-8?B?NzYzZzdkQy9yN0N2ckFBeFNVUVpaWU9UdnBoajVzekNxSXhzVk0zY3RRaVZT?=
 =?utf-8?B?YUNlL25ucVhrbXJHd3p1NUtqYTNtQkhZSHA5bEFiOEtkbkpqNVFIMnFyelpm?=
 =?utf-8?B?b09FcW1OQWlBcGNVM2NJT1ZrTXVOWmE0N25uMXN0dFQzRURMS1FucjNJbTRD?=
 =?utf-8?B?NmFkU3o0VDZGLzI4aW8yVlAyZUcraDZlYWJhaGlwTUEwbU5RZVo5eERRTmtI?=
 =?utf-8?B?S0Fsblo4TXA2SkVVOWs2clBLYnFhcTg3aTdsU0RrdVhGem1OTGlKZTdNZURw?=
 =?utf-8?B?aHJ0Vy85c2Y2NC9rd1AzM3poZHIrcjZpaUtSN3h0L3ZWSWV6Q1hlZTRpMk1C?=
 =?utf-8?B?WndaRXRNVUVGeTVVSCtXalFUbmhJdlV5YjBHMFZaNlZNcUdpLzVKUG5XcWNU?=
 =?utf-8?B?VUhocnF1MHNESzUrTEZMMCs5TXhwUER4Vmo2ZHBoMVBYWnlkYlV5VjZnQ2ll?=
 =?utf-8?B?RnJJc1BLYU1reHJ6K0cxRUtUcXU2aDlXR0FpNHBkV28wRzk1aVJTY1dNaVhC?=
 =?utf-8?B?QjlrM2JOenVlaUM3WHE5a0dpVkRzQ2VtcUhVaEFwOG5qZmpLY3JhSFE3SVlW?=
 =?utf-8?B?Z1JHamlmSkoyMEVaNUtzZ29uTmVIQ01xb0wxWTZsOGdvT3pWTGNtZ3gxWmkr?=
 =?utf-8?B?QU1XT242ZlY3aC91dTlqZzV5cS9xaXBaQ3AvMlphTFZYclJLenpqU3BNWEtI?=
 =?utf-8?B?L1ZFa2hqL204amVaZHJ2c1F4cEl5aVMvcG9laTl0Q2ErS0VtZ3krbVZtTmh5?=
 =?utf-8?B?WHMrVUcvaVJYWldUTVY1bmg4b1lkMHVrL210WjBueWVaNlc5TjZTMVFMZDNO?=
 =?utf-8?B?MXpzbC9sVGUwWGRNTXlHTDFEbktqeGs1M1ltNXYxd0ZOdFdTWXpqaHhJazNB?=
 =?utf-8?B?eVphczY5UnIrUHZrZlYwS2pCd0kweXk5VVFkOTZUOFdsSnNpOGUrOTIzQWZX?=
 =?utf-8?B?L01PV0RaeDEzMCtrM3NPaVhreDVmc25HdzZoektYc3dqazJmRzR1RWl1YlNr?=
 =?utf-8?B?WnZFQnlWY1ZRRm9vTnZDOWFFMlVhSE1DZEdnQW1oQWxxYlpQOXZnV1VrS1pC?=
 =?utf-8?Q?nypdfGKDwpBvwTuAEEKbbhdNT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccdfc767-f08f-4850-8580-08dbd62018e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 12:35:54.9367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPmI0VEEjmB/R4vcCC+2I7Etk3TAI0C506vuujuBUlc9k1TcAKLJMuSTRxjUmOLyrdQpoete6qN2ZDYvpIN3eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9205

On 26.10.2023 14:09, Xenia Ragiadakou wrote:
> On 26/10/23 14:41, Jan Beulich wrote:
>> On 26.10.2023 12:31, Andrew Cooper wrote:
>>> On 26/10/2023 9:34 am, Xenia Ragiadakou wrote:
>>>> On 26/10/23 10:35, Jan Beulich wrote:
>>>>> On 26.10.2023 08:45, Xenia Ragiadakou wrote:
>>>>>> Given that start < kernel_end and end > kernel_start, the logic that
>>>>>> determines the best placement for dom0 initrd and metadata, does not
>>>>>> take into account the two cases below:
>>>>>> (1) start > kernel_start && end > kernel_end
>>>>>> (2) start < kernel_start && end < kernel_end
>>>>>>
>>>>>> In case (1), the evaluation will result in end = kernel_start
>>>>>> i.e. end < start, and will load initrd in the middle of the kernel.
>>>>>> In case (2), the evaluation will result in start = kernel_end
>>>>>> i.e. end < start, and will load initrd at kernel_end, that is out
>>>>>> of the memory region under evaluation.
>>>>> I agree there is a problem if the kernel range overlaps but is not fully
>>>>> contained in the E820 range under inspection. I'd like to ask though
>>>>> under what conditions that can happen, as it seems suspicious for the
>>>>> kernel range to span multiple E820 ranges.
>>>> We tried to boot Zephyr as pvh dom0 and its load address was under 1MB.
>>>>
>>>> I know ... that maybe shouldn't have been permitted at all, but
>>>> nevertheless we hit this issue.
>>>
>>> Zephyr is linked to run at 4k.  That's what the ELF Headers say, and the
>>> entrypoint is not position-independent.
>> Very interesting. What size is their kernel? And, Xenia, can you provide
>> the E820 map that you were finding the collision with?
> 
> Sure.
> 
> Xen-e820 RAM map:
> 
>   [0000000000000000, 000000000009fbff] (usable)
>   [000000000009fc00, 000000000009ffff] (reserved)
>   [00000000000f0000, 00000000000fffff] (reserved)
>   [0000000000100000, 000000007ffdefff] (usable)
>   [000000007ffdf000, 000000007fffffff] (reserved)
>   [00000000b0000000, 00000000bfffffff] (reserved)
>   [00000000fed1c000, 00000000fed1ffff] (reserved)
>   [00000000fffc0000, 00000000ffffffff] (reserved)
>   [0000000100000000, 000000027fffffff] (usable)
> 
> (XEN) ELF: phdr: paddr=0x1000 memsz=0x8000
> (XEN) ELF: phdr: paddr=0x100000 memsz=0x28a90
> (XEN) ELF: phdr: paddr=0x128aa0 memsz=0x7560
> (XEN) ELF: memory: 0x1000 -> 0x130000

Oh, so it's not any particular range that crosses any E820 boundaries,
but merely the total range including all holes which does. That
raises the (only somewhat related) question what we would do with a
kernel having a really large hole somewhere.

Jan

