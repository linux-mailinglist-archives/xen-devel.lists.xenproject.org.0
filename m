Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB44772222B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 11:29:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543590.848687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q66WE-0001vg-5X; Mon, 05 Jun 2023 09:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543590.848687; Mon, 05 Jun 2023 09:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q66WE-0001tv-2f; Mon, 05 Jun 2023 09:28:54 +0000
Received: by outflank-mailman (input) for mailman id 543590;
 Mon, 05 Jun 2023 09:28:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+s6H=BZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q66WC-0001tp-CN
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 09:28:52 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6118eea8-0383-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 11:28:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7076.eurprd04.prod.outlook.com (2603:10a6:208:19a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 09:28:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 09:28:46 +0000
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
X-Inumbo-ID: 6118eea8-0383-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aS2/7WPYOM+bODYwE+u8AsHnWmYES3p+Jz6aUQw7xueQcuf1MfH4gO4tgr1O1d6bB6eGWNmGqZVjWmtgdTCcN/uFahQRamV3QPhSKx8LkH4hRWp0j/oULBQucGs+DVWTxZYQEkQx6eQYcBnPJdY78clNEG74cs5XEMjeBcOHxBD3BwOlFdMHOD1IACzxlHHcbGLJoX3x3xDQat6JK2I1r5WCYnFvmDio1vp9/RtGqGvA9x4uIpCgZebu1YsjUOYQql4lX8rXYlV84RmhG9Xvp1PHKXhP5pA9IsGBXJvaR+Byd30yZdUiuU0/69wXU3bmov3oa/RGlND90B929ePE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zK49AS9TtoLuMjRX87gEASPRRJauTEAmF1OzHPnLP38=;
 b=TKKEBYWf/nJrgGGrzrbYlm7ah0T394IgWGP8LSgegUUDjrfdfu/m1J6NhPtfU4MedPYPdPgH462i6r+WUEXOK8/E9G9Rn0Wi+qlooGIiW1L4n1cnFjaJgBuvw2aLmTzAZASth9ZNT7RKSw9Xuj2RhBuJmea3rESdD8/Zql1UGWI/vLewFhNd9ZJpxx4iw/6PYLhmIgk3Pr7AQWL69y/9FWWmbQkDeQ/i/m6AyRkqXmUY1SQo5xux1OB+2mB3uJu+xd97CgALSqJOj6hxApEW+aRWjjG2KWmApLVk4AEH72IGJNyJRXgK3N5Zwcvcg9YhgsO6/IO+XjTWzWb480HRdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zK49AS9TtoLuMjRX87gEASPRRJauTEAmF1OzHPnLP38=;
 b=TA3cSkb8Rpw9FaDdPkz8HJ0vOE4ZRwAU0OZo84ktkNCHP6Vb3wL18Uq18hOkuy6zKAWi7sv7oxR0apJN/FWLUzf4Qgb0sYAp4upymuo8neniKZ8Ai7K1S3eChS8rZA11DmlvXP26s+eC2tP/5qBmKANq1nCYxkRXHX6+1uvUZUwbg+AylSZDpT4c/b0rRQXvHlPb9Mxr4oE0iSCOOhlsw4cp87LKhfd1ZjkPy8R5fjDGpR6TyHvYGQP1fEEgItK7nMk70F5ayEpzfMJaV8oShcOen18Z3pvOWhKmjVFyY4bx8CecceYpqCLchZuFDHQuG3Nj2SmLFCEHESZP1JtgKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8314e0fc-4ead-40fa-ef7b-4da8ce0655b4@suse.com>
Date: Mon, 5 Jun 2023 11:28:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 78831ce8-2601-4287-e8cc-08db65a742f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G7IzfzJOo8OljnBd79cVtB3U7YsoaRaSok2P+H7tJrK56Wpp0G82tiFvw17stYTomymcX3dnCcdTmKpL0ih7lmxPwbsauZjaqKGno6LAdED8xlEU1xszkIhyRKunV6tdqO+guxQeHEAQXAKMk9OyMT9nZU/8ljjZSLDpKnJSohWY9x7Qciig+tRueZL8EF0OQVPfq5o/WoGL0/McWuS9NNsb0+OkzPJ2RrhuE4f6uYMI8yEhvhtkBuOsjffm2Twg7V0esGHJihc3+vLTcXRIlYf+m9byKEsbYRZfZcEFq/soMG1ClEFstJoc1GiCAIPbfu2FlKZ+Mg0Vf3+ZA6y1kJEWVmgKYvaNs0PhxniDTeXVlUZ5/UAz+wV3G5T5Br6WUr5JeHPHd/WgehNHooKqJfVRVlu1YXE0sliepkemf9nNQnBISWMS9F9N8j1aIF17Q5tFkbq20GtfXR5SfITq0HOaWzHU0pcNpf+a6xRj5K0YZQLJ4qFXM7Ye0hPnKgZ+JAGtW3l/311BLfsaxqnzYXkPdTXuufoaxUFQphu2/4o2DWWBjP7hj1sYBHanPy0bjkK9MS3XTj2nKcz+hLsMiAoKXECn0MN0TuFP4n70FB/sbPahD/nqdgkdasy0okzNPo2bvi3LcezTRJwxCobfEg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(36756003)(54906003)(2906002)(31696002)(478600001)(86362001)(38100700002)(41300700001)(8936002)(8676002)(5660300002)(316002)(4326008)(6916009)(66556008)(66476007)(66946007)(31686004)(83380400001)(6506007)(6512007)(53546011)(2616005)(26005)(186003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnA5Nk15MnQyMVdCY1ZSbEJaN1IyVzd6YnAzd0F3R3ROcWhQS2VaWnplbTBr?=
 =?utf-8?B?aWQvbmFUbENKTzZLVzdZaUhob1R0NSs1RWF6dm1hNEFDeGx3NjVuYlJvYU5a?=
 =?utf-8?B?VGppeklkSUhxcU1EMEpXQk5IWmpIenNzeVk0dEEwT092bk5DdE01c1BFV3hz?=
 =?utf-8?B?d0FGQ1FkSFh5SVBDU2FBeEpMdUJpeGNiSThWZFdvZks4VmFadit5c09Ca010?=
 =?utf-8?B?bHpvS2Yyb3JJNGFJUTdxSS9OWEZJOFpvd3ZjTkpoWmM3bnd5U1BQdnhJYXRM?=
 =?utf-8?B?WXZwU1lxR0VRQVc3dHNrU01OUU9sSGlOR1NNYXVFTG0zQnNtazFxRGJlS0g0?=
 =?utf-8?B?SEpURWdiQmZSL0xXajhzU3E2dTdBRDAxMmtMT2ZKKzZnQzlrMmRJYW15WFB5?=
 =?utf-8?B?MkpHMFZhTUdBOWJGS1BCdzhOKzVybWpjUG9oZ01wRW9yRTk4Mkgxc3VsK2Fu?=
 =?utf-8?B?dEFhVkp5aVd0VnJQK3M4ampWditsZUlVSWRiTjM3dEg0NjQ2NXJWUWZnVHA2?=
 =?utf-8?B?eDFKcHFMejRWVFFsUGtpbUVEelgrMjhJQkVWUUxTWkladEw2RTJmLy8vZzVn?=
 =?utf-8?B?ZEZCaHhwVFlPY3BrQStQekxGSUVwdVNLeVQwYjExUVhlQUFFQjdpRVcwQlhM?=
 =?utf-8?B?bFZvNHVaWjIya2pxcVhRSDFmWktPQzRRMEhEMHpKWmpkWUd1bTc2ZWxDK1kv?=
 =?utf-8?B?czJzdE5lK20wMXN0TVpCVjl5dnJkbXE4SnZBK28vOWVTWGszNzFDbnBRTlFh?=
 =?utf-8?B?RzhKSERPN1FhaW8zeWJ2Tk1mNVkrWE1Nc1ZDa21adHVia0Z4NlV5TGR3S1dm?=
 =?utf-8?B?M21EVCsxUDVKbjRPWEZmL0g5VHpxUWZJMmplZjY1MGl3L0dha05hSmFzcC9s?=
 =?utf-8?B?cWtXUTRCQStDckpTdms5MS9Ua1YxYnVWcDZndkNXR0JrSUFMdjhKMmtTZzky?=
 =?utf-8?B?a2c5RmRxT0xrNDlGZU5vQmZrS21GZUdpdG9mRFNaSGM1dXRjUkdiNDNlcWZw?=
 =?utf-8?B?RFZDV0RyR1VlSFp2b2tNSXRsdVJKb2crMWVMQ1ZTNEh1VTdpSVRTQ0x4WVdC?=
 =?utf-8?B?Vjk4UTJxc2pES2IyMUgzWXQzdmpOeTM4M3MrQzhiSVJvNE1sMTYrRXRqd2tQ?=
 =?utf-8?B?VVdrY3RkQVpkNHpJcVpySk9HUzBOendTdENNU2xiVVY0NlRDRHI0SExmOVdS?=
 =?utf-8?B?eUlKaWNNMGdXZm9PQzRpU2tURUR0bHVObndFQXFzbnhlczJNUkZlMzNtYnF1?=
 =?utf-8?B?V24xcVFLejNPeFV4NktBOEZka3Q4L3gydVlLQnlrek8yODdHYms2M29IS1V4?=
 =?utf-8?B?cVlaQm5uVzZsZTVzbnUzWDJ0OVkyVy9pekRDRUJNYlJOcVhMTmdXcUpMQjM1?=
 =?utf-8?B?NmVsQ0hWZDJCYnQ3NjhsMWRFZ2N0dFNGN3lnVlBTbkMvMDhSeGtCT0dSM3RW?=
 =?utf-8?B?dkhLUkNLcHMwZGRVZkhsUDM2WkJiZWdYbjNMV2JkMWJWKzMzYVE4elRZVXlB?=
 =?utf-8?B?Ry8vKzV2aVhydHJIQ2xtZ28wUHJ4Nzl4VzBJaDRFWE5kd0diTkhTSzBlRmxL?=
 =?utf-8?B?Skh0OGRDUHBHYll0RnNPRHBETEFkd0ZERFdSWVpXMHdsZDZyc0JybnlZZGN6?=
 =?utf-8?B?d3RXeUc0MEZRWGVpOXhuNFU1TTJ3cGwvMVg3QXBGUE9VanlrRk1pU1kvYmt4?=
 =?utf-8?B?WGFIQ1VVUkIvL0ZuZDZteVozVHlqMVdQdEI1NGlJcjVDNm9ZRDd2WG1ndFlv?=
 =?utf-8?B?TC9abDJuQ1J3K2w3NHNxdy9ZLzJ5NEozZVE4YVpxWDNNbW1Zd0Z3MjJZQXBY?=
 =?utf-8?B?OVR2YmYrRE82cVJ6NmVhR1AyenBpTER4MkRMSTdhcm9KUlF6Zy90SE4yK0ti?=
 =?utf-8?B?MytOTHY0aW5zNXNsWXNrYTVyckd3L2NDdFZKalNEbEZtZFpKbFNsRitiZzJI?=
 =?utf-8?B?OFg4WkN6UjdvMHhrejI1SnRDU3NlbjVrV3NXSjdvVlkzRXV3czZzM0J5RnUr?=
 =?utf-8?B?YjFHU3B6azNnclZyWTBGK0ZpMUh2cE9GanRUVEhJNG1WaHhsRndoa2VYbk9k?=
 =?utf-8?B?RWFxNm4wK0F3VEZkR1pLQldYUVZuRW9GbGRpV0tTQjFzMUhwTmdSM3p3S2lL?=
 =?utf-8?Q?ygp5IYbAB/T2PSyZLQw8EkL61?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78831ce8-2601-4287-e8cc-08db65a742f9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 09:28:46.3822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNJ/oG/3dwseCzG4nYi8BQehsQ6tBZ+gvX4OV7G3i+l9YkrTKof2GRXm5gHhiM3MNV70M66+kYD8bBW51sP0Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7076

On 05.06.2023 07:28, Roberto Bagnara wrote:
> It appears Xen uses lots of GCC features that are outside the C99
> standard.  Some of them are documented GNU extensions to the language.
> Some of them seem not to be documented, so they do not qualify
> as language extensions (at least, not as far as the spirit and letter
> of functional-safety standards are concerned).
> 
> Language extensions come with two problems:
> 
> a) They limit portability.

Sure, it was (I think) always clear that by using extensions we limit
what other compilers Xen may be possible to be built with.

> b) They significantly increase the cost of compiler qualification
>     (commercial C compiler validation suites do not cover the extensions,
>     and the cost of the extra validation effort will have to be born
>     by whomever wants to use Xen for safety-related development).
> 
> Said that, maybe the use of certain extensions is intentional, but for
> others it may be unintentional.  The purpose of this message is to
> distinguish the ones from the others.  In the following, when I mention
> the C99 standard, I refer to compiler uses with -std=c99 or -std=gnu99.
> 
> Let us start from the (as far as I can tell) undocumented extensions:

I'd like to mention that many "smaller" extensions are either not
mentioned anywhere, or are part of "bigger" extension doc. See e.g. near
the end of 6.20 "Arrays of Variable Length" (gcc 13.1.0 doc), explaining
parameter forward declarations as "another GNU extension". (Sadly that
pattern doesn't have further matches when searching for it.)

> U1) Use of _Static_assert in C99 mode.
> 
> U2) Empty initialization lists, both in C99 mode (ARM64 and X86_64)
>      and C18 mode (only X86_64).
> 
> U3) Returning void expressions.

As per above, tiny extensions like these are, I think, unlikely to be
mentioned anywhere explicitly (or more than in passing). For the last of
the three it may further be that it pre-dates when gcc started to
properly document extensions. Oh, actually - U3 is documented along with
-Wreturn-type.

Uses are generally intentional afaik, but eliminating cases of U2 and U3
would likely be possible with just slight overall impact.

As to U2, it's not clear why you distinguish C99 and C18 mode. Throughout
this summary of yours it would likely have been helpful if an example was
provided for the behavior your describing, when the wording doesn't make
it crystal clear (e.g. no example needed for U1 and U3 above).

As to U1, I'm afraid this statement very early in gcc's section
documenting C extensions simply hasn't been properly updated for newer
versions of the standard: "Some features that are in ISO C99 but not C90
or C++ are also, as extensions, accepted by GCC in C90 mode and in C++."
A somewhat similar statement in the middle of 2.1 "C Language" is
slightly better, thus covering at least the specific case of
_Static_assert.

> U4) Static functions or variables used in inline functions with external
>      linkage.

There's not a lot of "extern inline" that we've accumulated so far, I
think. The only ones I'm aware of are sort() and bsearch(), and there
the use is precisely for allowing the compiler to optimize away function
calls.

The documentation of this functionality is that of the gnu_inline
function attribute, afaict. That would be 6.33.1 "Common Function
Attributes" in 13.1.0 doc.

> U5) Enumerator values outside the range of `int'.
> 
> U6) Empty declarations.

For these two I'm surprised you say we have any. The former would need
inspecting, but it's hard to see why the latter shouldn't simply allow
purging. Provided I understand correctly why you mean by "empty", not
the least because ...

> U7) Empty enum definitions.

... here I wonder whether instead you mean forward declaration of enums
(i.e. what the standard allows for structures and unions only).

> U8) Conversion between incompatible pointer types.

Do we have any uses that aren't, by using casts, documenting that the
conversions are deliberate? Otherwise I would expect the compiler to
warn, and hence the build to fail due to -Werror. Then again I'm sure
we have ample uses of casts left which are actually bogus.

> U9) Conversion between function pointers and object pointers.

Uses I'm readily aware of are deliberate. Plus isn't this shorthand
for going through uintptr_t intermediately only anyway?

> U10) \m escape sequence.
>       Is this an undocumented GCC extension or just a typo?

Where did you find such? The only instances I can spot are in
assembler-only constructs, where 'm' really starts the name of an
assembler macro argument. Iirc when the compiler pre-processes
assembly files (identified by being named *.S or use of the option
"-x assembler"), it applies relaxed handling of \ found inside
double quotes.

Then again I find it unlikely that you would have meant those, as
they're inside #ifdef __ASSEMBLY__ (or alike) guarded sections, and
hence shouldn't pop out when analysis tools are run on the tree.

> Here is a list of extensions that are documented in the GCC manual:

I suppose that this list wasn't meant to be complete? The most
prominent example is probably asm().

Jan

