Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEAD3F2917
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 11:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169353.309341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0nb-0005lV-8B; Fri, 20 Aug 2021 09:26:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169353.309341; Fri, 20 Aug 2021 09:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0nb-0005jh-4z; Fri, 20 Aug 2021 09:26:51 +0000
Received: by outflank-mailman (input) for mailman id 169353;
 Fri, 20 Aug 2021 09:26:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mH0nZ-0005jZ-3p
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 09:26:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdc59ba4-0198-11ec-a694-12813bfff9fa;
 Fri, 20 Aug 2021 09:26:48 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-5qUVp9DyON-GkyIN8_5Igw-1; Fri, 20 Aug 2021 11:26:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 09:26:43 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4436.021; Fri, 20 Aug 2021
 09:26:43 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0215.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 09:26:43 +0000
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
X-Inumbo-ID: bdc59ba4-0198-11ec-a694-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629451607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c6Ngl6G/H+bbBF5/kB7yd9zOphGopfeeluoVFAbzolA=;
	b=gQ31BYKzpb7Knb1VF6xR6/U3b+2peaLiHXtubonVWCuv37yhBUPL66dyux+vJxjnJwznZ/
	ecXHoZsPMhfcyixCEPC6jEu4WOaD38hSyJhDrnHBYO1MFRpluHreQ1KiS4UcTbKPTZZ4T3
	6pU4YLWpTewhY7mJcnu7Xm32Ygx9Vlw=
X-MC-Unique: 5qUVp9DyON-GkyIN8_5Igw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jysJT6ndrnGPPeZXLm8lV951JInUP5wStMHINbw/9gMokmWwO76hXaGx4n9a8ktvtTlkP+7v7gl16IVAcCrAHHqghsC5NPkcSIMlZxBoX9cTiV8tBopvUAn1+jsPKnabrh2Cu0PUAOIbqlyvD6WvqNF3N/EU4tGbVjrrqwtCP91xDqvkTseb1RD/VpDqWHvhhwj5hKDJ7t6a1onu92XMev+enXOqNuHmj1c6emydmVFxQbLevjfxxoJ1d5NnBvnOrH17rhHX5d/SBj3ovdqYe+bV3nS+7Yk9KMjyUH7UJ5UpQBksPzVDpZgtkoyFfmiWX1m6U87koFr+qalnFBFWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6Ngl6G/H+bbBF5/kB7yd9zOphGopfeeluoVFAbzolA=;
 b=dC4t8vZzVjm9Z3KbGBMUKaprFMszTiOcLHYOTZub3lBxFtdyFlIrd8Q8cjexrF38iAgKDNk+pQ1KObiIWYCLddsGMiZ3AxpQbCsoNu8UGMl6BDEqDsQ8V7/ojzaslTlc+XY7kUtYlykrID2rHvvX5x8vKP4HmgXeZCE+1QTKUyI6EFxSakoXsZJyJFQpfjjCn1dYXAhLsMhaAYKpm7ot38e3UDxquiDRGUMEsk+1VqpSO6X2xLsWo+LTMTYUw/7HK79xofJdk9Oahr3TpmqfSpzCGExx/9hRa3x35totHcTWl4wTdXR+opQEZkTSjtEjln2rxDwW0sqZvb36oAFkNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: cs.pub.ro; dkim=none (message not signed)
 header.d=none;cs.pub.ro; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 1/4] public: Add page related definitions for accessing
 guests memory
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Costin Lupu <costin.lupu@cs.pub.ro>
References: <cover.1629395092.git.costin.lupu@cs.pub.ro>
 <1d9338102d2013addfabc0cf9275ef156fd5080f.1629395092.git.costin.lupu@cs.pub.ro>
 <69747133-3d42-4179-2606-12b1d1a9c8a6@suse.com>
 <c942c080-183a-ddb2-f523-dd3354f5b4a0@cs.pub.ro>
 <a2d0be78-f53e-a100-838a-5af2a8ef1459@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ed65d58-2547-d4cf-0db7-74a2ab114a71@suse.com>
Date: Fri, 20 Aug 2021 11:26:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a2d0be78-f53e-a100-838a-5af2a8ef1459@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0215.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24d4dc4b-28f6-4a1a-bb2d-08d963bc9fca
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68610E2CE9F989B079CDA851B3C19@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x8NB+r8V2ShNbBZV4e4bbLCZtvMC6/WOiIaNbp9cfVzKfOw5hGLreb44Y+MIKA4l/qNGWG+/f1HjIBdD/5lYbqZWN946VqGc6yj7q6Sbt8IpSoA5TnixENTyg8bHAYR+DZurjzH1tQbAIBJq6gPQheSXY83qr5yANQoV0AiVOCLY2R2ThBj49hX8IguH3oxR0+3RMtGZewn9xHkfkKLTslCTdb749alrT/cLh0O1nKosdc4kI4D6nyntUsXzI9PTCfv+Jo4eROPmUHuA9+8T+ECZX1zz7aqyv9uY8zBT63Bx64RASlSKc3D2NLA9uvqM43mzp+iEvmX+sjFuuc/cg1F6yeIeAAQOdxsZ0b5VeITwS8C6bR1Qk5pM2D5bYSMBQayLCcRy8PtpezlFlaXEFiKBv8EVj4+DwXvJo/USVh72LcgN+7eM4s1rdqe2onpLk46P/ESZ+gh3X1VoQLfTHAv0X7UONn9AFLq276sh+BHuG7VZXQQtmDqsQva03HuQF5q/hZ7ecQ1lkdxtrTMfMSW25rVcLqA74JeUvmDd3lOXjKJj5BR4rtWBPCwbUz8RilVEoAU7YE9ykfEGEqDv0MnpZn+jXtPMs7kpV9Xrtss9ELGCIeHCyuM+RGLZKFAJkWeZpIjOt2rfqrZuSt5yOG/a3Ad70VZfxTXHUvVofMFu8b5sPZEtcDYQNMvPwcgm+18AexJpAMxne+N91XpSFzh274/ko/nZXYIfQvhTEcU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39850400004)(366004)(136003)(346002)(956004)(2616005)(6486002)(38100700002)(8936002)(8676002)(478600001)(6916009)(2906002)(83380400001)(66556008)(66476007)(66946007)(36756003)(53546011)(5660300002)(16576012)(54906003)(31686004)(316002)(86362001)(26005)(4326008)(31696002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjN4L0xxN3lYNU5YQzNyczAxS1VzMUczMmxoRUtKWVZRczRscmxCQ29nQ2RG?=
 =?utf-8?B?Zmd6OVo3UTVsRmJISWpHcFpsVFRsd0VoWUVYVVpzVlFMMXk2M3Y0a0FiWitC?=
 =?utf-8?B?ZEVOQ3pYNEljNC82cFNZTXJiRGk0cWxrYW9hWExCaENOcmorMnhoN0x3N1Vx?=
 =?utf-8?B?NzB3bnFYV1g4bGVod2NvTm44b1J4d0N6bjN3ZEh5aXdhODdtakRUV2ZaNHpr?=
 =?utf-8?B?YjUxTGYxdjQvbkt6UWZzaEdBNThVVFo5U01HYjdpd2pTVVNWSmZqNHFML1ZE?=
 =?utf-8?B?OVRwU0xkYWIwaWtIVFZLdUlwRnJ1cGJkcTFYMzJSb3prSzJYNHFNVVVpS3Ru?=
 =?utf-8?B?YWdVVjA0ZkJnSDNBN3JOVjY0NndwWXlBZDhpZmw3Nmw4NDZxVUU3RDRJVmh3?=
 =?utf-8?B?M2NZRFhVbThVQlZ5enVUby9DVVpPWWxuNUw2MTAwY3V2aEdtdG1SU3BERHdI?=
 =?utf-8?B?ZDZ3UkFMYmd1aDlrajlTV1RlVk8rWndKYkluMlN0Y1QxUE85S1RhS1AvOUVL?=
 =?utf-8?B?WnI4dWdBRHQwdEZDb3VlSWNhV1JwaWFmQzNLVW5LTFo1Sk5TSW4wd3pzNUpS?=
 =?utf-8?B?V2xkRFRBcE00Tk0xamdsU1h0aDhMdTdpdnFEZ0E4cUNuelovQVFERkxKcTEw?=
 =?utf-8?B?UU54N0xlZHhlWEdNV3BNNDVkTU0zS3dGdk1NUTJOMXBzSFFsc2Y5UTAyZFpU?=
 =?utf-8?B?TEZtNlliZTRYUzNIU0dIVWFnZUx2d3F4aERsSEdpZXJoODh3QkpQS3pGRlBX?=
 =?utf-8?B?QVo5VzdTTENlK2RObnA0TTZMdU1EdjViMkt0RnVWQzR1eE84Sml3WURPdnZB?=
 =?utf-8?B?UGJNSVBxMjNzV2hYenBJcWZuNVRvbEZITEFSR2VXRC80RERibVVKUzFBV3FC?=
 =?utf-8?B?cktKQmg0aU02Y3NTL3BjdzkyNHJlQUpickU0Y3BrNGN0TEJFYzduaG9qckVS?=
 =?utf-8?B?VlZwRWZ6Zyt5Sytwc29udUxEdkM2WnArR2dTUmx3bG40ZTVyMmtUUkZaUDVY?=
 =?utf-8?B?RjQrNU1aUVZRUUVHSitIc1N0VU5yQzZZcDM5blR5SjYrQnFEQ2JNVURKOS9y?=
 =?utf-8?B?cXVvRDc3WVhuS3IwYzVkMFpSdlQxWHE5Ti9uYlNFeFdNWUFobzgrWjhOVVo3?=
 =?utf-8?B?Q0grcVdEQzcxTlAxL1VELzlJZlJVMlhPWnJoVjJtangxNTF1ck5CTHZqZ2ZT?=
 =?utf-8?B?aWJJajBPTzduMFYzbGlVT2dpcTNkVkNyVnRCalE0SnpCYVVwVFhuWXZ1R3M4?=
 =?utf-8?B?bFdjTGd6NGZSdWhFdnFIck0xMS83aUcxS1A2R2MrbFlBOTJvWHVOcis1STdq?=
 =?utf-8?B?Mm91a0FFemRSeDU1OVZ0L2krSDExakRqN2FWOG9TcXN2WlJwYlFtK2MxSHZE?=
 =?utf-8?B?VjlQQTdpQzB2RkhLaURYejM2bWhnYStvckxyanBRQ2FHZWIwbFUySndmSXJv?=
 =?utf-8?B?M3NEUXpzUU9ubFpjK1k5VG0xR1hCck5CU09XUDhhd21OTmEvdmRZakFXSjlp?=
 =?utf-8?B?SW1odCsrWXdyUnl4SmhnV1h6QzRNYUt2NXUraU9Xd2NpQjlHZVZmUU5vVEV2?=
 =?utf-8?B?QlhYczl0WjE3QWdscUdranQ5YW95dmZVZXNzWnZGMTZDcThWSlJ6Yyt5Z2o0?=
 =?utf-8?B?bHJDb0Nad2VTa0JQTHZiVlZaSllhNko0dzdDM3pwYTFzR2pyWUlidWlIRUFM?=
 =?utf-8?B?cEgzWFVRazM3N3k3cVFFTXdubGVQeEdOZlYyTnpmdlpDNVJmSEMrV0gxTXUz?=
 =?utf-8?Q?61PLq19qzBJD3UpJTCLvAD/5IAtjpJ85V2/qhII?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d4dc4b-28f6-4a1a-bb2d-08d963bc9fca
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 09:26:43.6890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39HucaIC/r2JQFVnpRiT4XtHZs1JYWSEOqe1ky35redJ27pc64ADFd4i8Du2zSFUCtTuvW7j6UiO0SsMOn3WxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 20.08.2021 11:08, Julien Grall wrote:
> On 20/08/2021 08:44, Costin Lupu wrote:
>> On 8/20/21 9:52 AM, Jan Beulich wrote:
>>>> --- /dev/null
>>>> +++ b/xen/include/public/page.h
>>>> @@ -0,0 +1,36 @@
>>>> +/******************************************************************************
>>>> + * page.h
>>>> + *
>>>> + * Page definitions for accessing guests memory
>>>> + *
>>>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>>>> + * of this software and associated documentation files (the "Software"), to
>>>> + * deal in the Software without restriction, including without limitation the
>>>> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
>>>> + * sell copies of the Software, and to permit persons to whom the Software is
>>>> + * furnished to do so, subject to the following conditions:
>>>> + *
>>>> + * The above copyright notice and this permission notice shall be included in
>>>> + * all copies or substantial portions of the Software.
>>>> + *
>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>>>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>>>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>>> + * DEALINGS IN THE SOFTWARE.
>>>> + *
>>>> + * Copyright (c) 2021, Costin Lupu
>>>> + */
>>>> +
>>>> +#ifndef __XEN_PUBLIC_PAGE_H__
>>>> +#define __XEN_PUBLIC_PAGE_H__
>>>> +
>>>> +#include "xen.h"
>>>> +
>>>> +#define XEN_PAGE_SHIFT           12
>>>> +#define XEN_PAGE_SIZE            (xen_mk_long(1) << XEN_PAGE_SHIFT)
> 
> This will use UL whereas on Arm a page frame should always be 64-bit 
> regardless the bitness. Shouldn't this be converted to use xen_ulong_t 
> instead?

As pointed out on v1, XEN_PAGE_SIZE would better not end up as a
value of signed type, for ...

>>>> +#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))

... this to suitably sign-extend to wider types is necessary.

Also unless you expect someone to use typeof(XEN_PAGE_SIZE) I'm
afraid I don't see where the constant being long vs xen_long_t
(if such existed) might matter. Otoh perhaps xen_mk_ulong() would
better have produced a xen_ulong_t typed values in the first
place, but I'm afraid we can't alter the existing macro.

>>> Thinking of which - with exposing this as a stable ABI (not just the
>>> abstraction, but the specific values and the fact that they're
>>> invariable become part of the stable ABI this way), what is the plan
>>> for supporting 64k(?) page size on Arm in the future? At that point
>>> you _cannot_ simply remove or replace the #define you add here. As
>>> the immediate need is by the tool stack, enclosing in
> 
> I would like to get support for 64KB and 16KB pages in Xen (we already 
> support in guests). But there is not much we can do with the current ABI 
> as guests assume this is 4KB (that would break if Xen was using 64KB).
> 
>>>
>>> #if defined(__XEN__) || defined(__XEN_TOOLS__)
>>>
>>> might be an option, with the downside of having stable libraries
>>> (foreignmemory and gnttab) depend on an unstable hypervisor interface
>>> (again). I can't seem to be able to think of anything better ...
> I am not sure why you write (again) here. The two libraries always 
> assumed the hypervisor was using 4KB page granularity. But until 
> recently it was also assuming that the OS page granularity matched.

Assuming 4k page size was a plain assumption imo, not reliance on
a stable hypervisor interface. Just like is assuming OS and
hypervisor page sizes would match.

I wrote "(again)" because at least the foreignmemory code was, iirc,
split off of libxc at some point, i.e. used to be unstable and hence
was "fine" to rely on unstable hypervisor interfaces.

> Our stable ABI has not been designed with multiple page granularity in 
> mind. We could introduce a hypercall to query the page size used by the 
> ABI. But then, I don't think we have the full picture of how this is 
> going to pan out (I haven't try to use another page size on Xen yet).
> 
> I think we have three choices here:
>    1) Stick with the existing definition in the tools
>    2) Move the definition in the public headers and only expose them to 
> the tools.
>    3) Query the page size via a new hypervisor
> 
> As I wrote above, 3) is going to take some time to get it right. So the 
> question here is whether 2) is temporarily better than 1).

Because I understand 3) is some way out, and because I think 2) is
better than 1), I wrote "might be an option" for what you call 2).
But I could see people (Andrew for example) to take a different
position and object to such a temporary measure.

Jan


