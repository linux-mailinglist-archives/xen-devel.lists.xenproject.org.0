Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAD975744E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 08:36:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.564948.882741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLeJo-0001R2-26; Tue, 18 Jul 2023 06:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 564948.882741; Tue, 18 Jul 2023 06:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLeJn-0001Og-VX; Tue, 18 Jul 2023 06:36:19 +0000
Received: by outflank-mailman (input) for mailman id 564948;
 Tue, 18 Jul 2023 06:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLeJm-0001OK-7A
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 06:36:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe02::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64e088d4-2535-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 08:36:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9829.eurprd04.prod.outlook.com (2603:10a6:150:116::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 06:36:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 06:36:10 +0000
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
X-Inumbo-ID: 64e088d4-2535-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfrdtbL9b7iiKP3estehZXeBILrvsqsX6aelgIcUItX4ao06b66tJTJiQddrnmnPnHkGr8KSXJHvnnjWQanBtbCiAYHeZZ9fc1ebpqyAXNQub4MuKyX8PQctWrcTJY3wsldB64Nal4SftA1QNQsaa+M84DKLV3LX/3Bfh5wgIlfCMO59n18hYH8GXpE1Ak0N7lShnzq7pxBo/XKTs5tNLfKIf0JuNdYhlXp5TIU692jpsdIYOrZw/N2ylk3365kY+wXZyMJ8WyjDg0AviK8v51SW3Ypwkm0LVH2cm9ePnX6/jGW0TfxZDC8pdzlsF41bWXheKwEfGOiLXBU/2sgz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQ/+bUmx2536GniYyG6eaVXeGjg5PPAQtO81R1U27r8=;
 b=LzKhiFyBZQ04h6FSJKCKPWbQ6ZuNWlr2Wk/8YQrMUDrWMsrqqOeLnCiOMI5JFBb6pkoKh/tImNHySyr8pHDxheeMNNMXL0VLC0ZMM5ULE2YApTqWYqwtxaqNclv7WYvcA/hi8ilQfDfp/9e3Z90a/bq9+POAwt3XKP1asVbc76acE7gGWNxXIrCTK1b2CMuJgmemvUWsGlSeQurhFiW7A/hN5a/VhPZX/l+/V7MDSQgP5zqUtVQ9wEgMLVil6LuCZA3K8dadKHrsCASli0z/xvwCOSSq9P4/P437PUI8uf+zm9iFRencKOcCOPptdXIfL0ycS283Buuteau69HWjow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQ/+bUmx2536GniYyG6eaVXeGjg5PPAQtO81R1U27r8=;
 b=NtTzx3oByg7gpDzGsx8twK8mqJhTv3UTcnv6R521og/vH8QZe76nFNdifhyXnsOIEqu/jHid+98NPSomXXmf9FtIea4XUBCpusc6ArvUOrDZuFez38LiwEkHQxOnZeBNG1b22Efd/lcDN0f8eJYzkJpEUgTCuDnXajrRzhUndpzAHRX9jzhjYzaXH8ZBtqGfCxYuaH4El9HPXs04hiB3P94Jd8kLL032l+OP3eETdaqyotOMYYR+XzwKXTXcTX0Bzw0rcQu4J7c4SqbpV/tgaCTWLWHFU3ApVcvO1PjZtUeJBbN7ppLRkadRu96JED3iYg+by5hcfN7ZkYaUJ1mLRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2976d08f-3b09-a999-b5ea-817f8175c599@suse.com>
Date: Tue, 18 Jul 2023 08:36:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/3] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1688670018.git.sanastasio@raptorengineering.com>
 <85172d385a730e196999b366207e2b2e8a261906.1688670018.git.sanastasio@raptorengineering.com>
 <aa58706f-5033-ef33-5202-bcc418bedb86@suse.com>
 <2fa2837d-37f4-aa28-6ca8-2e28b6f44181@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2fa2837d-37f4-aa28-6ca8-2e28b6f44181@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9829:EE_
X-MS-Office365-Filtering-Correlation-Id: e113521e-f324-459d-f006-08db87594650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fshr9vMDVmw5/wJKRCsGLcEwdgcA89IP+KKrBaQDstcNZ9N5ezhyLA0EmPquVilXIeFQ4GjLxDA5X7cXuV2g2nkca98hxilYA0qAjzbtvs4N5LM7Vflua1lx7DB3FTU+P+s89wVPKYCK4woLzzZUbK8bNSl7SXwKApeSPIV0H1pETiamYs/7aOp9aTXIlu7BDHJEYw1ofHGKGyqNlzyhedxqeMNpIacITPsZwynUEAwfzYO6/HDVE0TEuqVSiWAYU8KmGdeBd8p7dt6QHS9kEFdCO+OJxICXFITWB1qxeAq0u6/4nd6O5r9RvHclPE1NwKNZRTyzxiKHzxBW5OSOKiE6B/5PTfcQ/OT4teV6sGmNPCvbYPR8IPD6NYhEIWBPZRym+KoA7tPv+X7FZ6+GByU+9oT2exunDdy1R+aVj9O0S4VFZ/IRBt6OG4rIh1D2YwLsYqzso0/6vHDzlcL+1VLCZvfiRPVRR/hYdcdeUrbF4Arl7FvQBQVdF8+r54EkQHyQRuKz9hkV9/p8e7ESDRFVIwkNd+h3IP6i50tOd/5pt/mHKZBywSIyIx+xi3wQ7afY4+VjGniasU0+jmu47JzkfafYt1E2tjUA6ZIZtbbvdJEQ3t4N4dp9s+BKOHZrh7viio0CRQwUdeN8kJCQwQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(136003)(39860400002)(346002)(451199021)(86362001)(8936002)(316002)(66556008)(5660300002)(4326008)(8676002)(31686004)(66946007)(41300700001)(2906002)(478600001)(6486002)(26005)(6512007)(54906003)(6506007)(53546011)(186003)(6916009)(83380400001)(2616005)(66476007)(38100700002)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGN4bkdscGd2Vzd6Z1h3MlE3cWlFSkwwZVpRYW1MTHZpM0VNUHBVVTA3b2NN?=
 =?utf-8?B?dVBHc0dNUmZqVTVsWWJtbFZ0Sm16Y0Q4d3cybzJxenFJQ1piWngwL21iQW5i?=
 =?utf-8?B?MnNtMkpJdU52Rm55YXdwRTRzS3Fpd3FQeVQ3OE5SZjY3YmdMYm1EMnIzZFRM?=
 =?utf-8?B?M0c4cjZnWVdUNGVkRml6MVgyRmp6VUd5c25XMytyVWNaRHhyaU0xSFowcWdr?=
 =?utf-8?B?M0hjU3ZCQWJuTWxkckJnR0hzYjNKempWQnVTQXlQTjZBWDA4djUvTm9GQ2ll?=
 =?utf-8?B?TGFJZWYzK1NxTm5GZ0lNTFJIemlqWTBQMGcrNGVCNm83bm5pcWNvMlRpbFVi?=
 =?utf-8?B?bnVjNDJ0T3ZXM2RteWNab0YxNUdLalh2OG0wMVFMU2R2Y0llWUZYdHlTVHFG?=
 =?utf-8?B?SGVjZ3J5T29xM3dhR0dDSHBhTE1CR2lXa3A1SEs1bFRrYjFyd3ViNTdZa3l2?=
 =?utf-8?B?V1paTDhQZXlYbzV5Zjd2UHplOGRBbVR6ZWxpZTZsb1ZiczVvNjl3TVFhLzBs?=
 =?utf-8?B?NHl0TnNMME1oUCs1UFVNb3RUZlNVVm9kc0R0RkF4OVZ5dDQ0T0E0b1hyZ3FY?=
 =?utf-8?B?VUZ4ZkdTVEF5dDBLRUdoS2xQaUNXS0hoRW1YbW9iV1NQS1V1dXBETU1YNVVj?=
 =?utf-8?B?RlBUYkVWSVU1c1BkbnlpVlRqc1NlZFoya3k4ZHdmalRrVTFxSWhXeW9rY0RG?=
 =?utf-8?B?SzJ5WjhsVEx5MDVlTWdETGhSbHhBd0JBelliZTU3MkErZUxqQ040YUxLWnh1?=
 =?utf-8?B?dzFlMVZNZFVCYktjZ0Y4dWVmMGh5R050blR3K1k0cEVWWWZZRGFlRlM0dFVu?=
 =?utf-8?B?aEErSW4wM094ckQ5bUNuanViWWVSQmJ0UDJKblcrRGp0Tk5BS2hyMlJ6N3Rv?=
 =?utf-8?B?ZEJyMTcyYVlCVS9sUUxVMkhSMFNsOGEzUCswcnM1MDdxZWV0MVgvRktuL1RR?=
 =?utf-8?B?NlBYOGFBa0xJQzUwY2hqLzI2YllYemgvRVVOd1NVaFF2VTIxOGpEQWVHZnlZ?=
 =?utf-8?B?cGRwNWJBZzlLMEsxUE8rZXFIZHdRaEhjWkhMRU1EWUljT0R0SXhHMncrT2JC?=
 =?utf-8?B?czRiV2duTmdTQmd4MUtVK3hVTGVIQzUwY0g5VzBtbTNnYkp4dTVScUZuY0R5?=
 =?utf-8?B?M1ROR1VCTGlYY0QrTSs1YlBwUmVISDlkVFVIUmhsVjlUbEdWU3M0NkRLTG13?=
 =?utf-8?B?amNsWG81bHBrOGZqSXJxMG9TNTkySkNvOTJzWksrVGcwV21xa3J0c0c1SVRQ?=
 =?utf-8?B?QVNEbnAxUXVHblFjakxFdnV4a2JoaTFuMUFBaE5GMjlIaUs3VHk2Zkl6Rml4?=
 =?utf-8?B?K1h1MWF5cmlrczFOaEVBazMvRHN1OTZtRG9iV1E0bm15RW10WVlSQ0dvbnlz?=
 =?utf-8?B?Z1RZU3R5TUpyRHo1cHNIRE1ibUljaHlMS3o3dVU0MGs0MmxwNW03dFlhMjJz?=
 =?utf-8?B?WXBOaWU2L1FRTGwyNk1wNmZ4QVZtUTVzUGVBRmdTcnYxcXgvVHl3aXRYcVFi?=
 =?utf-8?B?MkcrYnNYRnhxcHFQVVEyWnZtaTdMUCtFQTJBUE9ydHg1bTRjQUs3Z0RTaUdF?=
 =?utf-8?B?cXp3WUUyWitxWG0yS0w0OW9xbkU0TGU3SjM4ak9WaG5veGxsSEwxWlFGVXdO?=
 =?utf-8?B?UHFvc0ZmRng5TlZhYnUzOUwyRDhtVlJud1Y3b2pvcVN5RlF5UjVVbWptSE9E?=
 =?utf-8?B?MEV4cTlUT2paRjExWWdlZTVRUmFUUThlKzk0Sk9FZnFITlQzVWNQUW1VVDFD?=
 =?utf-8?B?NCtPRUordWttVEZDTmlEaE1VSzBBWU04MEkzWHg1bGw0K1VXSFVSa2NuSkhL?=
 =?utf-8?B?RUc0eDdudDFCM1ZUVVZXWmlzNnZkUXRUa2ZmWnFuUjBoODE1VWdxUzZqVGhD?=
 =?utf-8?B?VVh4Z0N6UlgrYkQ4aVF2SnVaeEpUaVRtcFNSUGVZUVVENitxbEx4dzFQYnhN?=
 =?utf-8?B?YmtpWCtlVjFaTkZFVnUwcU5xUkZEVW0wNkFjYnJBZFcvZndkamxudm55S0tM?=
 =?utf-8?B?QkVOWGwwcURJV2wwTkg0UVVRbWp1TU9seTBmOXQzTlpwQTRuaWUwekZ6QVRN?=
 =?utf-8?B?WFUvbXFpRFZrNnZkNHoyaWFydlk3ZWE2Z2hLY1JxRDRQenNvT2lNQ05ldThV?=
 =?utf-8?Q?Ydn9Fd/E/wIz/X8wvzrvFIJ02?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e113521e-f324-459d-f006-08db87594650
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 06:36:10.6082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ok5JUr8B+ChRqDtGvLBOVRX5PQ/XsXYUHqxSVoWSzPgm8aM8yT3lfLgtd3+VG1yjkRTTFG77P2inSHi+G0WQKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9829

On 17.07.2023 20:32, Shawn Anastasio wrote:
> On 7/17/23 11:17 AM, Jan Beulich wrote:
>> On 06.07.2023 21:04, Shawn Anastasio wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/boot-of.c
>>> @@ -0,0 +1,100 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +/*
>>> + * Copyright IBM Corp. 2005, 2006, 2007
>>
>> Judging from the years the file was taken from somewhere. Is the license
>> there permitting "2.0 or later"? (For files [partly] taken from somewhere,
>> a clarification as to the originals' licenses would be helpful to have in
>> the description, or maybe in the post-commit-message area.)
> 
> The original license of the file that this was derived from
> (xen/arch/powerpc/boot_of.c from Xen 3.2) is GPL v2.0 or later.
> 
> In any case where I'm deriving code from existing files, I'm always
> using the original license of the derived code. Should I still clarify
> this in the header comment?

I think it would be good to mention explicitly, as 2.0-only is the
common expectation.

>>> +/* OF entrypoint*/
>>> +static unsigned long __initdata of_vec;
>>> +
>>> +/* OF device handles*/
>>> +static int __initdata bof_chosen;
>>> +static int __initdata of_out;
>>> +
>>> +static int __init of_call(const char *service, uint32_t nargs, uint32_t nrets,
>>> +                   int32_t rets[], ...)
>>
>> Nit: Indentation.
> 
> Will fix.
> 
>>> +{
>>> +    int rc;
>>> +    va_list args;
>>> +    int i;
>>
>> unsigned int?
> 
> I might as well change it to uint32_t to be in line with nargs.

Please don't. See ./CODING_STYLE for when it is okay to use fixed-
width types.

>>> +    va_start(args, rets);
>>> +
>>> +    for ( i = 0; i < nargs; i++ )
>>> +        s.ofs_args[i] = cpu_to_be32(va_arg(args, uint32_t));
>>> +
>>> +    va_end(args);
>>> +
>>> +    rc = enter_of(&s, of_vec);
>>> +
>>> +    /* copy all return values to the output rets array */
>>> +    for ( i = 0; i < nrets; i++ )
>>> +        rets[i] = be32_to_cpu(s.ofs_args[i + nargs]);
>>> +
>>> +    return rc;
>>> +}
>>> +
>>> +static int __init of_finddevice(const char *devspec)
>>> +{
>>> +    int rets[1] = { OF_FAILURE };
>>
>> Hmm, of_call() uses int32_t. Again below several times.
> 
> Good catch. I'll switch all of these to int32_t for consistency.

Here, for example, it is (because of being used to interface with
firmware).

>>> --- /dev/null
>>> +++ b/xen/arch/ppc/early_printk.c
>>> @@ -0,0 +1,28 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#include <xen/init.h>
>>> +#include <asm/boot.h>
>>> +
>>> +static void (*putchar_func)(char);
>>
>> __initdata? (Connected to the question of building into .init.o.)
> 
> Since I'm going to change this to build to .init.o, would this
> automatically be put into the correct .init section? Would it still be
> preferable style-wise to mark it as __initdata?

No, it would complain that .data or .bss is non-empty. Automatic
conversion occurs only for things you can't control at the source
level, e.g. string literals.

Jan

