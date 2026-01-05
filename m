Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A554CF4938
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:05:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195547.1513479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcn59-0002lg-IO; Mon, 05 Jan 2026 16:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195547.1513479; Mon, 05 Jan 2026 16:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcn59-0002jB-FT; Mon, 05 Jan 2026 16:05:23 +0000
Received: by outflank-mailman (input) for mailman id 1195547;
 Mon, 05 Jan 2026 16:05:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lzVw=7K=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1vcn58-0002j5-AF
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:05:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 552a1d18-ea50-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 17:05:19 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 6F0744EE0742;
 Mon,  5 Jan 2026 17:05:18 +0100 (CET)
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
X-Inumbo-ID: 552a1d18-ea50-11f0-9ccf-f158ae23cfc8
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1767629118;
	b=hXo1sje6fM85B94ysb59PqeMFmZBbinx1abgJ3j69neoV0yELzv0yVoUkDeTKvMEwI3P
	 UJ1a9oxozR/gTxx14SjVy8MOykbjgaGFepGRdewHxGSzr94sQFqHj6kiG9/2II4qOz5VN
	 Qawcq4gQqTG3rT6X5JUfgMod+wHLiiXOuDJRuGigD/qsj6nQh/DgJ7B3/m7XSgcdmXaP1
	 mKkK99d+7eLq9EJtLqJv2nbK0UjzM9TNO5sdZy4M2lgBaydxctahHFAR0lDbVbEK73p70
	 tsmks6zFbjeevmiRP+ghY5LVyycY9SUEas2MD6jl1jByFncBiPQaKmH2WDqG2wCWQBCZg
	 rd7/t2U4GL1Ij/MYHpv4dWzIUxsZnT7zedaLOV8Qm162UpuJIcQChSdJNHZCMTjApLBr6
	 P+uDYEWXkvARjtSO5WAE1t8EDZIUFAdeM/bLd3oGwX+irmjHFaRuBtXZmu7F214k8h2uz
	 gPxHN7dcNURIAJHjt5RcEFb7QNaLwISfYDaJ1C5rZRhSlS4eFJKUMKRHv8artAD0Fsx7x
	 6dCzOFX0ULvcnkwsNqi3810qwGFeob8nlKwb1BMFJCcmsGLRTs0Y6MFzbvVfVW4xetB0F
	 9qjBRYECcd+qoy00PSoqB+pj5kLDIlLBv5kcbl3bqDEvTy+eY2cVopqzy3EjBPg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1767629118;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=IefPlY65k/C/hJSwkaU7F/jJ6zlOnXHTUK57BtlC6Lo=;
	b=qIT4kF9VcamDP1D5d/HvzltpkyS6BpvTXMdz8qK6vbcVg6HutJ2yLyEJSZzp5IgqANVd
	 z1+JZ+sHp15n3nDcPp14LnVI2SPxmjNfk9ruteGD3LJBxfynhuFPTzRGJ75Ox5TFgMucq
	 TU3jAH+TfzsCaoOdy4L+p11eM50rvcRWY3xmuWRw/G9TndWb4HRJwbE1KayTK6wI5jbSC
	 qbbJeFb8hzdO1lg/7KEGBHvHPLQG/qJEHkCyQVlX9Bzvq34cbkmcoTRmd4jCEPtFunyHG
	 abZTwlfH0kObSPayYrKXaSOXkFoCHwvJ8krgCtRhdiVW181+uqvYNqEVLn6D6eZlsb92M
	 LqDGVBDUfbFHNZA8XxNZKvOUGuYQGvlsQPpzox1Ew5i8OfQN4Ap5vvBYdLfElMd9be9jp
	 sUy9K9ivOHUZ9o9RIKiaHWWgobNFtpUFgzHtBS3xTfugcyxhrEhmx+xJdbFz+K5PPlGXB
	 8KYrjtKErWHWGRPACMCdoJLgD1aonIQA49KKf9pEcio4pp9p2uUmfGCVzCaLw7CCBEzvb
	 kxjWisEpSALQgpizBBiMiwBZR3Il+6qVJ9O1uNUZgRhkL9r94kgklk0MYXVDq0aIWyT5W
	 gJpT7qn3rWGQMJIZSm4tCru4FA2oz15PKXBVe0NVxnz0oVZ3DUQIk0wgOL+PlmM=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Mon, 05 Jan 2026 17:05:18 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 consulting@bugseng.com, Doug Goldstein <cardoe@cardoe.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH] xen: rework deviation to address varargs MISRA
 violations
In-Reply-To: <cc95886d-1ca9-4780-9438-d9be8317de80@citrix.com>
References: <d2ba22d6a36a4f2b952a80712aac2cfe632e8609.1767174251.git.nicola.vetrini@bugseng.com>
 <24aefd91-18ef-4ac2-a1b2-6098aa31e716@citrix.com>
 <6a0d6249997997a1b152d860932f68bc@bugseng.com>
 <cc95886d-1ca9-4780-9438-d9be8317de80@citrix.com>
Message-ID: <009ef0575d867bf81fcf399b664491a9@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-05 12:54, Andrew Cooper wrote:
> On 02/01/2026 11:53 am, Nicola Vetrini wrote:
>> On 2026-01-02 10:42, Andrew Cooper wrote:
>>> On 31/12/2025 11:22 am, Nicola Vetrini wrote:
>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> index 219ba6993b90..7dee4a488d45 100644
>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>> @@ -570,13 +570,11 @@ safe."
>>>>  # Series 17.
>>>>  #
>>>> 
>>>> --doc_begin="printf()-like functions are allowed to use the variadic
>>>> features provided by stdarg.h."
>>>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printk\\(.*\\)$)))"}
>>>> 
>>>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(^.*printf\\(.*\\)$)))"}
>>>> 
>>>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(panic)&&kind(function))))"}
>>>> 
>>>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(elf_call_log_callback)&&kind(function))))"}
>>>> 
>>>> --config=MC3A2.R17.1,reports+={deliberate,"any_area(^.*va_list.*$&&context(ancestor_or_self(name(vprintk_common)&&kind(function))))"}
>>>> 
>>>> --config=MC3A2.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
>>>> +-doc_begin="printf()-like or scanf()-like functions are allowed to
>>>> use the variadic features provided by stdarg.h,
>>>> +provided that they are declared using the `format' attribute."
>>>> +-decl_selector+={format_attr, "property(format)"}
>>>> +-config=MC3A2.R17.1,reports+={deliberate,
>>>> "any_area(^.*va_list.*$&&context(ancestor_or_self(format_attr)))"}
>>>> +-config=MC3A2.R17.1,macros+={deliberate , 
>>>> "^va_(arg|start|copy|end)$"}
>>>>  -doc_end
>>>> 
>>>>  -doc_begin="Not using the return value of a function does not
>>>> endanger safety if it coincides with an actual argument."
>>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>>> index b3431ef24e26..584907b048ec 100644
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -570,8 +570,8 @@ Deviations related to MISRA C:2012 Rules:
>>>>       - Tagged as `deliberate` for ECLAIR.
>>>> 
>>>>     * - R17.1
>>>> -     - printf()-like functions  are allowed to use the variadic
>>>> features provided
>>>> -       by `stdarg.h`.
>>>> +     - printf()-like or scanf()-like functions are allowed to use
>>>> the variadic
>>>> +       features provided by `stdarg.h`.
>>>>       - Tagged as `deliberate` for ECLAIR.
>>> 
>>> Much nicer.  But don't we want to repeat the part about
>>> __attribute__((format(...))) here?  After all, that is the 
>>> justification
>>> of why it's safer than nothing.
>>> 
>> 
>> Ok, that would be more accurate for sure. I didn't do that to preserve
>> the original intention of the deviation, but they are practically
>> equivalent with the current codebase, so changing the text makes
>> little difference. I'll tweak that.
> 
> I can adjust on commit, if you're happy?  Everything else is fine 
> AFAICT.
> 
> In fact, this fixes the x86_64-allcode complaint for
> vmcoreinfo_append_str() which is already annotated, and
> debugtrace_printk() too (not yet enabled in *-allcode).
> 
> ~Andrew

Yes, sorry for the delay. I forgot I had to respin the patch here.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

