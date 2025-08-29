Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75634B3B2A3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 07:44:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100525.1453920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urrtf-00006R-Qs; Fri, 29 Aug 2025 05:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100525.1453920; Fri, 29 Aug 2025 05:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urrtf-0008Vl-NZ; Fri, 29 Aug 2025 05:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1100525;
 Fri, 29 Aug 2025 05:43:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cTkY=3J=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1urrte-0008Ve-Gu
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 05:43:34 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18769459-849b-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 07:43:31 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 507D24EE3C0D;
 Fri, 29 Aug 2025 07:43:30 +0200 (CEST)
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
X-Inumbo-ID: 18769459-849b-11f0-8adc-4578a1afcccb
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1756446210;
	b=EwU7H6flSghzegfLGZHs5Vq2FY4kNnwfHhrwrEdONgE+V5ofXl0AncipZTFPXvTZ9qa6
	 4V5oiy16H47bM/UYoShUT28XjrEddCccIMAAEXwwixK32rmvM/Yg5TmA4eslFxksNdWRb
	 HXexzXzJLWwWAQyvBACNl/T36ugM9F+uUXGUuxvBRmg+KVTAelLkas2GDoFyZ/H3RyEfW
	 CTMEk3gpmfFJVPxGkBC+Uw5rK3j3k0snPhwYG/Gt1hApmPkvW6tW7BNm0/FLYgyijOQti
	 ZAFjy0gU1hgTcP9blAUuOgjHKLymyAVcMR9FNV3/oSf3WEeeBhFKA+mzcrE7df795TVMh
	 xa9jiLlk81aFVo34Mv2ka8J/d+kwLpEupZKEssscOxv0q0I/r8QGzRQ8l8y/CD/1NKP5H
	 D0QeEj2kfhCqMWDy5kU9Hhi6TAoX9sg9n52dBL1mmyLwBOoRkIAh+rvSWeeiKxMZu18MW
	 4YjirWtwr97GuNPh1c8p/RwW5AFIAh7nRQsCh4ojfZ/OfQvLXWTHduJi2dHECCqpj62N3
	 zyFLyX4zbbLC1KU8pXbCJVml7S+ykg8fwwwjrqPEW6KCsFh/oobMuO4VDDnxemGaWZAsK
	 1aQAXCvq92QJFyCBIEGTASN/esvGLgY8NTry7QTFR7iZedqUvYcAdloApiG9fgg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1756446210;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=M/pl1D0HoTbrkXKeJQRj59Agn1yMB9bXAaWmtMKEvP8=;
	b=vFYqWJWdur5SvqriAlXxydxD3xaZBSwIhEL8GKtCxLGaHXDx+zQY1cneK9aCTSNFsTLU
	 H24BGWXHXr0m2zpw9zhlm8sLQbULGgcJVwKmYCOuD6R+3+eLODzuX9ot89P9RVNAPF9pb
	 YQCuB0QM67HE8B1x/UX4WayDkrd9MTnhdwhd17GCLa2dVAASAL2X7lm9646AoCt/O6uG4
	 PN8qXr3qia3gQWDnLTg/gBjSa8RUWh5uNf2/O14iVds2v8LqrR0WMYdr/7wpIdfR6Iojw
	 5L9wvF2nHh9OlGnbv+jwe4TvudcUlhyrZZMUMGRhcZkXcjJf5cmdbJkeHM7DLeg5Gdowc
	 hQDW/t83u3eobwsccyPAVyG+sfl6mhKOnN3xlI0W7xoCI1XGTCd+cXEr0kfYvtMFShjYN
	 pCIwzRKmwlWn7bCvoBTMxFBo9MxB33kYhqmXpZzNirikTBXqR402mdEDns78t3PCueDmA
	 qvjAgJcDN2pLL3+H7otQJZRBn22/PweGt25WLQb4NvbAVeKEFZWxGBhLLQ+Bh/xdu4MsT
	 yP3pBDdL8Dy1Ph+FBiUxc+6/iek6Vu2jMe5wU+E+mXsucpGRRMF+0PPctjWA0BIa/pxx1
	 FOhTY8YyHcQ/++nzKsNsivkfcX1XxBoFHRD0TfM/hz6lhTPoiD/+Jk0vCWo9XvY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1756446210; bh=mq9By8w3RXOlXXE/R+h9P91Ws8FEjFBTt3DP5K6PTVU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rhFWAHfbb5Sqc6qpt4hFsym7DWOoqp9/Pk4pU/GtQU9U+AwnastOnhnc5NBCvRG+H
	 jCQU46EjKHK6NfiLDpzfsV3xJvmlEjNp1Uw6TMQBZPxdXASlzSafZq3xGuljwDFsVn
	 MNPoD97tYPjeJURcuFlXjF2MiEUYYjUHb7dyMscZy73uAUcczGez2HDZ0j3WtflG5P
	 NGdvJeALa6/rHeaLot6fRoeNwResQfOC2hEiBhM0UWDb/n0h5Zcj+bmT0gJ4in/eQg
	 tCtt1PlDywxN1C3vX4XEKyMzhO28Jt+HE1EMmaTvIuEy+rlPf/FOM4A1v1dN/58JRo
	 taMtLmlc3VJ4w==
MIME-Version: 1.0
Date: Fri, 29 Aug 2025 07:43:30 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: consider conversion from UL or (void*) to function
 pointer as safe
In-Reply-To: <63a8e9f8-61c7-4443-a114-82db08c45f69@epam.com>
References: <9e5e4ff2c7ba0a90a6ac403e2de9318e18949274.1755628705.git.dmytro_prokopchuk1@epam.com>
 <90fb95a3-4b32-4785-a77c-373e5b9da6ed@suse.com>
 <e1e2abdf0ef8708097aa78440eeb7147@bugseng.com>
 <6b912698-b871-4819-ac30-14325d0be146@epam.com>
 <498f9629d2dda3f305c11512908b1325@bugseng.com>
 <d1fd1bbc474aad5a6a9841a8c109126a@bugseng.com>
 <63a8e9f8-61c7-4443-a114-82db08c45f69@epam.com>
Message-ID: <965bef5c7cc9d50493916bb6ef1e3678@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-28 17:54, Dmytro Prokopchuk1 wrote:
> On 8/25/25 16:08, Nicola Vetrini wrote:
>> On 2025-08-25 14:53, Nicola Vetrini wrote:
>>> On 2025-08-22 18:34, Dmytro Prokopchuk1 wrote:
>>>> On 8/21/25 11:25, Nicola Vetrini wrote:
>>>>> On 2025-08-21 10:01, Jan Beulich wrote:
>>>>>> On 19.08.2025 20:55, Dmytro Prokopchuk1 wrote:
>>>>>>> Rule 11.1 states as following: "Conversions shall not be 
>>>>>>> performed
>>>>>>> between a pointer to a function and any other type."
>>>>>>> 
>>>>>>> The conversion from unsigned long or (void *) to a function 
>>>>>>> pointer
>>>>>>> is safe in Xen because the architectures it supports (e.g., x86 
>>>>>>> and
>>>>>>> ARM) guarantee compatible representations between these types.
>>>>>> 
>>>>>> I think we need to be as precise as possible here. The 
>>>>>> architectures
>>>>>> guarantee nothing, they only offer necessary fundamentals. In the
>>>>>> Windows x86 ABI, for example, you can't convert pointers to/from 
>>>>>> longs
>>>>>> without losing data. What we build upon is what respective ABIs 
>>>>>> say,
>>>>>> possibly in combination of implementation specifics left to 
>>>>>> compilers.
>>>>>> 
>>>>> 
>>>>> +1, a mention of the compilers and targets this deviation relies
>>>>> upon is
>>>>> needed.
>>>> 
>>>> Maybe with this wording:
>>>> 
>>>> This deviation is based on the guarantees provided by the specific 
>>>> ABIs
>>>> (e.g., ARM AAPCS) and compilers (e.g., GCC) supported in Xen. These 
>>>> ABIs
>>> 
>>> s/supported in/supported by/
>>> 
>>>> guarantee compatible representations for 'void *', 'unsigned long' 
>>>> and
>>>> function pointers for the supported target platforms. This behavior 
>>>> is
>>> 
>>> It's not just about the guarantees of the ABIs: it's the behavior of
>>> the compiler for those ABIs that makes this safe or unsafe. If
>>> present, such documentation should be included
>>> 
>> 
>> In any case, provided that the wording can be adjusted:
>> 
>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Updated wording:
> 
> This deviation from Rule 11.1 relies on both ABI definitions and 
> compiler
> implementations supported by Xen. The System V x86_64 ABI and the 
> AArch64
> ELF ABI define consistent and compatible representations (i.e., having
> the same size and memory layout) for 'void *', 'unsigned long', and 
> function
> pointers, enabling safe conversions between these types without data 
> loss
> or corruption. Additionally, GCC and Clang, faithfully implement the 
> ABI
> specifications, ensuring that the generated machine code conforms to 
> these
> guarantees. Developers must note that this behavior is not universal 
> and
> depends on platform-specific ABIs and compiler implementations.
> 

LGTM.

> References:
> - System V x86_64 ABI:
> https://gitlab.com/x86-psABIs/x86-64-ABI/-/jobs/artifacts/master/raw/x86-64-ABI/abi.pdf?job=build
> - AArch64 ELF ABI: https://github.com/ARM-software/abi-aa/releases
> - GCC: https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html
> - Clang: https://clang.llvm.org/docs/CrossCompilation.html
> 
> Thanks,
> Dmytro.
>> 
>>>> architecture-specific and may not be portable outside of supported
>>>> environments.
>>>> 
>>>>> 
>>>>>>> --- a/docs/misra/deviations.rst
>>>>>>> +++ b/docs/misra/deviations.rst
>>>>>>> @@ -370,6 +370,16 @@ Deviations related to MISRA C:2012 Rules:
>>>>>>>         to store it.
>>>>>>>       - Tagged as `safe` for ECLAIR.
>>>>>>> 
>>>>>>> +   * - R11.1
>>>>>>> +     - The conversion from unsigned long or (void \*) to a 
>>>>>>> function
>>>>>>> pointer does
>>>>>>> +       not lose any information or violate type safety 
>>>>>>> assumptions
>>>>>>> if unsigned
>>>>>>> +       long or (void \*) type is guaranteed to be the same bit 
>>>>>>> size
>>>>>>> as a
>>>>>>> +       function pointer. This ensures that the function pointer 
>>>>>>> can
>>>>>>> be fully
>>>>>>> +       represented without truncation or corruption. The macro
>>>>>>> BUILD_BUG_ON is
>>>>>>> +       integrated into xen/common/version.c to confirm 
>>>>>>> conversion
>>>>>>> compatibility
>>>>>>> +       across all target platforms.
>>>>>>> +     - Tagged as `safe` for ECLAIR.
>>>>>> 
>>>>>> Why the escaping of * here, when ...
>>>>>> 
>>>>>>> --- a/docs/misra/rules.rst
>>>>>>> +++ b/docs/misra/rules.rst
>>>>>>> @@ -431,7 +431,13 @@ maintainers if you want to suggest a change.
>>>>>>>       - All conversions to integer types are permitted if the
>>>>>>> destination
>>>>>>>         type has enough bits to hold the entire value. 
>>>>>>> Conversions to
>>>>>>> bool
>>>>>>>         and void* are permitted. Conversions from 'void noreturn 
>>>>>>> (*)
>>>>>>> (...)'
>>>>>>> -       to 'void (*)(...)' are permitted.
>>>>>>> +       to 'void (*)(...)' are permitted. Conversions from 
>>>>>>> unsigned
>>>>>>> long or
>>>>>>> +       (void \*) to a function pointer are permitted if the 
>>>>>>> source
>>>>>>> type has
>>>>>>> +       enough bits to restore function pointer without 
>>>>>>> truncation or
>>>>>>> corruption.
>>>>>>> +       Example::
>>>>>>> +
>>>>>>> +           unsigned long func_addr = (unsigned 
>>>>>>> long)&some_function;
>>>>>>> +           void (*restored_func)(void) = (void 
>>>>>>> (*)(void))func_addr;
>>>>>> 
>>>>>> ... context here suggests they work fine un-escaped, and you even 
>>>>>> add
>>>>>> some un-
>>>>>> escaped instances as well. Perhaps I'm simply unaware of some
>>>>>> peculiarity?
>>>>>> 
>>>>> 
>>>>> This is a literal rst block, while the other is not (* acts as a 
>>>>> bullet
>>>>> point in rst iirc)
>>>> 
>>>> This is how "sphinx-build" tool interprets this.
>>>> 1. * inside single quotes '' -> looks normal, e.g. ‘void (*)(…)’
>>>> 2. * without quotes -> warning
>>>> deviations.rst:369: WARNING: Inline emphasis start-string without
>>>> end-string. [docutils]
>>>> 3. \* -> looks normal, e.g. (void *)
>>>> 
>>>> Because that we need such format: \*
>>>> 
>>>> Dmytro.
>>>> 
>>>>> 
>>>>>> Jan
>>>>> 
>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

