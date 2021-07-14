Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9B53C87D2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 17:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156088.288018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3gvK-0005WH-Hn; Wed, 14 Jul 2021 15:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156088.288018; Wed, 14 Jul 2021 15:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3gvK-0005Tf-Dx; Wed, 14 Jul 2021 15:35:46 +0000
Received: by outflank-mailman (input) for mailman id 156088;
 Wed, 14 Jul 2021 15:35:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM3W=MG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3gvI-0005TW-EA
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 15:35:44 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 085e39dc-c89c-4f5a-88c3-746076012738;
 Wed, 14 Jul 2021 15:35:42 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2055.outbound.protection.outlook.com [104.47.13.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-4ru8fW6JO9mBN_MKcg86jQ-1; Wed, 14 Jul 2021 17:35:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3536.eurprd04.prod.outlook.com (2603:10a6:803:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 14 Jul
 2021 15:35:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Wed, 14 Jul 2021
 15:35:38 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P250CA0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:102:57::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Wed, 14 Jul 2021 15:35:38 +0000
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
X-Inumbo-ID: 085e39dc-c89c-4f5a-88c3-746076012738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626276941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pegp8Irz1OROPOni0AM8BAGfGr9mi2RFlugcUiMNSXg=;
	b=TtZU83HMzcvsXZkRk/u3irtOe1fQYlhr96rYpu2vVAmBHLFefoU9cbqLMCHTh+wM3+YSfb
	Z9kLjFrHCA270c4inUDzVSDm+S8O+U6ruq1ql7UCuOewy4IGF6a454J2tcXrVRLbkMtyA+
	jNstyka4/KJKEoPSL9WpCCTY01yTvvE=
X-MC-Unique: 4ru8fW6JO9mBN_MKcg86jQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEEXzybuDolW7lVcYe89MxoAJgdNh5OO7XIrdM1qa5OAnXGu+snprY3G9TFoCCwYT4/1SKKV6Zn4RZGblB8bKd6SUKnyOq9Q5QOm6xpEEz0j+Yfgy435cir3ne8iP8YwzfrK+nxmf8/l7ol3hQO2KoXA+IcktMBbCuImplprZMxzCYBU+5IMGkljO3riPH+FAFBsuJt/2nJX1aS1Muud4+1aQEt4VjDKFeAwElhO0jIGXb0v01s3Fa7aJXgvCh+BV9Jk8a43MM+FOSDRobinDTzDlZFwBh6ZQJTTjrn9nJg8X2c5SU0aNt9bJPqgCjhLEL1RWxtaR159Kp3fFxFglg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pegp8Irz1OROPOni0AM8BAGfGr9mi2RFlugcUiMNSXg=;
 b=Lupcv6OIGS0xLctWfCLVe7IrG48bfgUVXwFc1NShTEutcRDoS8jjdsvrVYr/Xzrc+AmUvgU3KgqOxUafxCBCPo+3j0OYm62wdD/dzMAxxm0v1vV01kJYOW8ZuOs28RiT6apeuL0S1VqvgclVwgoDxi8I9c5Z9r/w6+3gnZOrdHiZTpToy5klLLDbcx+ms4AV+uniUYavKaqoGxb5vZ0c/MbEiKiyhAcaj9QCMynV8cPtFqAB/oRUaIFP4En8Ypc/Gv4CTMFORwDCJ1xTp8KIFGsKWzo7dct4XSHCgQNmjNKu/vDZHj+K5dONf3p9Z4LdsHQjHpKu503AsFeLMs+Fzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 01/10] xen: Implement xen/alternative-call.h for use in
 common code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20210712203233.20289-1-dpsmith@apertussolutions.com>
 <20210712203233.20289-2-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4b7f476-2c89-2416-5a24-06abaaf1d048@suse.com>
Date: Wed, 14 Jul 2021 17:35:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210712203233.20289-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P250CA0011.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:102:57::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69543da8-a2bc-492d-e7ae-08d946dd07f8
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3536:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35369B1C65B7078A3A64248DB3139@VI1PR0402MB3536.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ccipuh+O0UP8lotkaJ6S6CWf55OgpijP2KcM6U3d9kUKpiyWRNsz/zmK2ZvG9fIo7iJGA5/gKydh6bd8OqEjQ3MG09chK1tMPr8LGbCxuGErP45WlxfwNl36ktKYjuN+eoPKAljXR5I/BO4ISi7EDXkwoOM67QHZ2/21G3FuCDQPBlc6E2iORoKrjoplcDp5ak+MSMEWtuz1PPLV36E8wiMIHdVj8Fj4o+V2R41ZmoXrmfC3DtL8iktQVtC0NG3VPh1gc6/kz++hVhylanRQkIv3On/fSH5Uak+P8/geaGjIkj+Sn9rD+XS8CEdP7Pp7GP6fjj9KSvfwzl9ZMrDjd2b3uigku4NgvKgx19CWUelRyPzx2eWDYhKzHcspOb4gicpUNpKtXc3sqCJ+eSoGKd0CjYUvzCtsQHTAhyHrZqAK0ABbgEyZ2Ypp9HWjqBl9BDD5zOjywR/CJA1/UgNVij03GESjzT/poIaW1s9VpUAT3DsP2zsv7EuHKGEYWbwx0y6c83vwPVPPprjyjMJ5goFP0vpbO+2LF8F1EmUPNtIm3R5+RlsV8gOq8d3wd9qwc0QCqT/3R0ixjqiSWOZWoIvL/aVgDPLw1J/5+vT9NfMUAGUA9gC/YyuzYd3CodfZFYEjB9AGlK9XhS/8NGCi05Z4vV4N+sWgFPDSQvtw9Ll+RE2xBQAh58gcV4w2VXCm56GcxFLHUAs12KQ3ziKI9BdAG45Ogw3v2+siYQwcaDj8rFM0Du4mCamhEwbcQZDU0t2OePLEeVxbexNW/c3tpw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(376002)(366004)(346002)(396003)(316002)(53546011)(31686004)(2616005)(86362001)(956004)(66476007)(38100700002)(5660300002)(26005)(66946007)(31696002)(16576012)(186003)(66556008)(54906003)(36756003)(6916009)(8676002)(6486002)(478600001)(4326008)(8936002)(2906002)(83380400001)(87944003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MzZvVUNmZGI1THlaVUFSYlQreVlkSVN0OTF2SWNGS2pXSTVqWDkwVFZHeEc5?=
 =?utf-8?B?UFpwQWpXZ2N1REdvRHEwbXpaMmU0WkQ3YTkzY2xQZWsxQWV5NWd5UzBCOVRT?=
 =?utf-8?B?aTl2MkR1MmhqQ09VS3RhVC9YQi91amRJTEd3WUhuOG5vSkR4Z3NmUlNkUGNM?=
 =?utf-8?B?dWJ6WnpwQVRSM2o1Q2wyUlBVSDh1NHg2Y2VnTVUxZ1VJT0ZYVjlMbVFSSkty?=
 =?utf-8?B?NXc5M2FyKzdoWjZ5RlF2aXplMTRFOUJ0WE9oSjVrVXFXcEdLY2tuWU9nNzVQ?=
 =?utf-8?B?ZVM5QlRob0JYNnZyVkJEbzhibDdQNlFpZVpNL0VvSER2VnpRS21FMTRFN0RI?=
 =?utf-8?B?aFJ0U2tYZCt3em96bGd2UEJ1RmFuQUVTbnVHR3VKVnNZU0VnNmJmSi81L3RI?=
 =?utf-8?B?dk5BOXpldUh6RERTT0RuYmZYQUowMEJCblhHekxzWWJ6V3c2U3dRVElBZDRt?=
 =?utf-8?B?Z1VmZkJDUVdZSzVkVTR4MGE5OUsrZXBCVzhxc1hwQzR6WE43QXdtZVB3WXNa?=
 =?utf-8?B?S0loR256dzJneHJydXMxaHNqdTdqanZ5R2ZvZ2Z0ZmFySTUvT2hub2xncldq?=
 =?utf-8?B?ejJHMDZJUy9LcndtaVJHS2k0NzRBQzVSeTBWTFNzV3NwNFBQWm1iQmFQVDZv?=
 =?utf-8?B?SFgwRGtkaUJIYUVkMkVGcERuTzNjUGc0dzEzWWMyY3VYVDJUWlVlWHphOGRW?=
 =?utf-8?B?bUxBOGZ2VFdtelVwSHhuQVJvSHBoWUI3bzUrSzlqdDJ6bmZQWHdkVnBqc01i?=
 =?utf-8?B?MitEWjdDMTg5SDRIdjhuV0JuVXNwOEs3V0RXbHgzRk5WS0dEM21uSTd2MkxS?=
 =?utf-8?B?SHFFTGdSM0IvRmZxbTlDQXI1SzYyZW1SQS9PVkRucGw3RFlnZmhVaGhZRUE3?=
 =?utf-8?B?R2lFaFU3cFpiOVlBNmlOSE9UbVNWdlNjRFUrK2dvS2Z3cDdTdjhCQlRCRVNY?=
 =?utf-8?B?RTI2dU93dkc3Njk5bEg4eUFkaVdpeWJZNFRJalJheG1UL1F2SXRHTVpHNDRz?=
 =?utf-8?B?TWtrMTFGUFgxR3laRzdxcG9jM3U5VFBOVkFXMjRVN3QvQXZyU3pSTXZFa2dD?=
 =?utf-8?B?aUVoSjMzSnFaTVFuUkNJNUpPRE13czVVVDNneU9tNUswRWc5dTYzOE15dkRT?=
 =?utf-8?B?MzJHUERSL2UrMUJ4ZFh1MzE5ZDRESVgwbUNsODZ0MFdFUVNTdkgrTXlreldu?=
 =?utf-8?B?S1ZHWW0rN1NnOEE5S0FCK0IwT0VzeDZPVDhnNGJ2dHlnR2hUd3ZKZ2lmNkxj?=
 =?utf-8?B?Zi9QSnBBQnJ6OUdJL3lMdVFjUlhNRTVLbGprMTdNMkZiNDdmRXFPR3k4NWQ0?=
 =?utf-8?B?TVZIZDR5b2xQbmpUdlduR1dZUCs5NE1tQzRDbkUrMU5TNW9IOVNoWlFVZW9h?=
 =?utf-8?B?ZnhicTQrY0hLOVB3czVpRlNTZ1Y3cVlyNEZoc09uSE0rendPakFLMXg0M3g2?=
 =?utf-8?B?UEhQWlBhTUNWbmVXNGFmUGNwaUNhbVZJZGpvVkE1U3NHOHpKeDZDYXdPbFZN?=
 =?utf-8?B?WjJxR2haZDZlemtNeHQzMVNBTE55NFhBbnd0Rm5lSVYwT0kzaklMbkh2WUJq?=
 =?utf-8?B?UkR1OG85WHpNc0hpSHJ1dnh4dlJ4Q24wWTNMaDVRdm5ZdXlSWEttdndNenIy?=
 =?utf-8?B?T1JSSWUvak5WMUZSdkpYVnhCMGJMcHh2SmlXMkt6amErNVFZN3ludEVwYmxW?=
 =?utf-8?B?bHZkcWpIWTdOV0N6R1ZBamoyK1NWWFRFdDNVYUVmOVl0S0Uxb1M4S1BPUUpS?=
 =?utf-8?Q?1/MtWchEubrHfDrZb8f3ej3xyEcWOmA8iJtYUl/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69543da8-a2bc-492d-e7ae-08d946dd07f8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 15:35:38.6244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VH66AM998FWOPqSWUZ3EMPRr4nufOF6eFcS1CchoBWhn+RNLxC0VgS20+Wba7bE/xp+0aKQZaM3v8QpwEk1TeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3536

On 12.07.2021 22:32, Daniel P. Smith wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -9,6 +9,7 @@ config X86
>  	select ARCH_SUPPORTS_INT128
>  	select CORE_PARKING
>  	select HAS_ALTERNATIVE
> +	select ALTERNATIVE_CALL
>  	select HAS_COMPAT
>  	select HAS_CPUFREQ
>  	select HAS_EHCI

Please respect the (at least largely) alphabetical ordering here and ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -25,6 +25,9 @@ config GRANT_TABLE
>  config HAS_ALTERNATIVE
>  	bool
>  
> +config ALTERNATIVE_CALL
> +	bool
> +
>  config HAS_COMPAT
>  	bool

... maybe also here.

> --- /dev/null
> +++ b/xen/include/xen/alternative-call.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef XEN_ALTERNATIVE_CALL
> +#define XEN_ALTERNATIVE_CALL
> +
> +/*
> + * Some subsystems in Xen may have multiple implementions, which can be
> + * resolved to a single implementation at boot time.  By default, this will
> + * result in the use of function pointers.
> + *
> + * Some architectures may have mechanisms for dynamically modifying .text.
> + * Using this mechnaism, function pointers can be converted to direct calls
> + * which are typically more efficient at runtime.
> + *
> + * For architectures to support:
> + *
> + * - Implement alternative_{,v}call() in asm/alternative.h.  Code generation
> + *   requirements are to emit a function pointer call at build time, and stash
> + *   enough metadata to simplify the call at boot once the implementation has
> + *   been resolved.
> + * - Select ALTERNATIVE_CALL in Kconfig.
> + *
> + * To use:
> + *
> + * Consider the following simplified example.
> + *
> + *  1) struct foo_ops __alt_call_maybe_initdata ops;
> + *
> + *  2) struct foo_ops __alt_call_maybe_initconst foo_a_ops = { ... };
> + *     struct foo_ops __alt_call_maybe_initconst foo_b_ops = { ... };
> + *
> + *     void foo_init(void)
> + *     {
> + *         ...
> + *         if ( use_impl_a )
> + *             ops = *foo_a_ops;
> + *         else if ( use_impl_b )
> + *             ops = *foo_b_ops;
> + *         ...
> + *     }
> + *
> + *  3) alternative_call(ops.bar, ...);
> + *
> + * There needs to a single ops object (1) which will eventually contain the
> + * function pointers.  This should be populated in foo's init() function (2)
> + * by one of the available implementations.  To call functions, use
> + * alternative_{,v}call() referencing the main ops object (3).
> + */

May be worth adding a sentence about the section annotations, the
more that (as you did point out in an earlier reply) there are
pre-existing cases differing from the general goal here?

> +#ifdef CONFIG_ALTERNATIVE_CALL
> +
> +#include <asm/alternative.h>
> +
> +#define __alt_call_maybe_initdata  __initdata
> +#define __alt_call_maybe_initconst __initconst

As indicated elsewhere, I think this wants to be __initconstrel,
as the function pointers to place in the structures will
definitely involve relocations. Otoh, given your initial reply,
__alt_call_maybe_initdata may be all that's actually needed.

> +#else
> +
> +#define alternative_call(func, args...)  (func)(args)
> +#define alternative_vcall(func, args...) (func)(args)
> +
> +#define __alt_call_maybe_initdata
> +#define __alt_call_maybe_initconst
> +
> +#endif /* !CONFIG_ALTERNATIVE_CALL */
> +#endif /* XEN_ALTERNATIVE_CALL */

I'm surprised you have no "Local variables:" footer comment here.
Not that I need it for anything, but I thought you and others are
quite interested in it to be there.

Jan


