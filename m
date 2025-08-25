Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A14B3401C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 14:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093143.1448707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqWhq-0001Gm-6Z; Mon, 25 Aug 2025 12:53:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093143.1448707; Mon, 25 Aug 2025 12:53:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqWhq-0001Dg-1J; Mon, 25 Aug 2025 12:53:50 +0000
Received: by outflank-mailman (input) for mailman id 1093143;
 Mon, 25 Aug 2025 12:53:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KF0Q=3F=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uqWhn-0001Da-U6
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 12:53:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8762836b-81b2-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 14:53:42 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 8F91F4EEBC47;
 Mon, 25 Aug 2025 14:53:41 +0200 (CEST)
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
X-Inumbo-ID: 8762836b-81b2-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1756126421;
	b=hvCl2HpqOtbKs6UjiHEToaGiQC1LwtIl8a6oFH1MP4xNaQW+S0ZYx8OivKDcsJdyUfjD
	 62u7z6piuq6RrzOgswzpvkQoJ4WT+qti8kYBGy+Ryr5a63gy1ntYajKAQbG93MdfbS6N1
	 3ncQ0vO+CfbFUCfch+NOjHzSgmBpV1Qkxup1MABdQGUGzxQBTaegntSQxUJKqgAEl9TdK
	 EU2UNBk1FfWlr72FCIrJrQXrRYMj3mUj3JVCMSY+0xQQeUoq9jnolGRmnUpadSAq89aYW
	 fYLK1biFVpDW0I+0sYxxQTlGeU4PJ7bNIREXT5rSQsaqqZ3DaBYLFtj2sRREjOhuRNlHp
	 1j7u7G3xoPCCChwOcjzzBKmF6TLEvXgdXVil23n57taXIwvr0xP5/5RDLCStPQ6iBebIn
	 3hLZ5FJJ3BKzRtd8n6dW71DFwoAUNywCrZcmZZvnG418X5ZsbqYI+qGmf2tLIo4LrK713
	 GuVWli4FmLIZmnJgkkDRFQzzAvhaDi1anrd+yEclDzVlw2RtC8xUH+vSiHmGDd/nXbmut
	 7aWMMEvUcJPSQfV0Eejwu+aHVKAPM2JTRreYJISYSGYQQXIHS8S+QOjCx9A1W7jyq2sRC
	 uC2lB+I8lFb+MhUuLqLhq2PzWEWqnJFs/14jcccTsyVkTxro72ghogBVUJZA878=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1756126421;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=NooWRAUvWfucIFkhhxHUk2cEIO4DVIs7fRzZRF99NfM=;
	b=BSqYVVgc88g3ovEbcKSyDQv2yY4YrM5cUB3kNx3j5xkqp2RyEoduo/8lAM8qg3uPfdym
	 668qP4PRv6myAClf+msvzNdAjo/OpzrLMbg2GNYhgUqOUlfebhR0MS2edMWpUZ8ZKyX6x
	 OHYrL7+9muUFvr9swDyMkL12HsJtqNzineAKwKH5xrFhHrfSQeNBLSG2u8SENXrQEgqyJ
	 v/3JfvrDRWX/aw0ocp1x+WdIxHv78HTbGH+iqMuTFPshxVsac3ZjN9dG6bhayb7cHLGic
	 U9/leS9a9b75hEnJVccMRe4y/AzyumUj6ToSD927wyP9ESYFhMsILaYyNHYRnfgoqn8lv
	 Wl/BEvnN4Lkl3nhb0aJdyHv6ob6avriWc1+a/6NriNZx+5NGuwxW/hFCm7WHQSoOg8roJ
	 nH76a75ST69g3HciPmgacyccJrkAFiS817Dy4U8mNPyE3lw97c7CV9Ne2lFeNxgmyLfYs
	 lAPuzqfqvHNiAHIasl0WnILJVXTk/lIE3rQsRDdwGVhz/YmIjYxNvFnFy0z/7Jg/QLMPO
	 s5SZsLU6FJ/ADcAItG6+az67B5uxDR7xeB9cLr0Sjh4NTQo7ln3JEGfLqxVcqBBkrleT4
	 LgTrKWH2d2hlkR+Tta4anyVdyYWvjKwMX/4nSi0pmwJlZDrF8TM+q5gMf9U+ZnY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1756126421; bh=+jo+pmmNwnKAq4YFLs9Za3Ni2ZlO3Dn17Li94inB7Pc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IM/hlWHkk+wMQ6lH+ECp/+IkcmxMlJaw02/zzXxv6YRfDPACRh84QEMcT1E9ZaW+k
	 yetaqVnPUbGlZVjiick4OUX9uCcoe6ATVgMb4q0ad+PwRUkX+naOHXvRQI9G0JnVgw
	 ipOtwgQLabWaTJrsAQpes/08XAkkJU8cQZIF6vlc7mhwjUpmbvbeaaK7MO2EFv6oKe
	 VGTmmY8s1gMSat/0p0iFhtH1HARBaULVEyd8JOotd7b4u8XUra+kDrwlLlgITLeIFz
	 HtB2xGJyk/zX8Lg+qwiHbPyqCKtlSXHw7Q3tRZBws9clyj33a5+sybnTNfuy44a9b0
	 i6fGGMoCBwfQw==
MIME-Version: 1.0
Date: Mon, 25 Aug 2025 14:53:41 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] misra: consider conversion from UL or (void*) to function
 pointer as safe
In-Reply-To: <6b912698-b871-4819-ac30-14325d0be146@epam.com>
References: <9e5e4ff2c7ba0a90a6ac403e2de9318e18949274.1755628705.git.dmytro_prokopchuk1@epam.com>
 <90fb95a3-4b32-4785-a77c-373e5b9da6ed@suse.com>
 <e1e2abdf0ef8708097aa78440eeb7147@bugseng.com>
 <6b912698-b871-4819-ac30-14325d0be146@epam.com>
Message-ID: <498f9629d2dda3f305c11512908b1325@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-22 18:34, Dmytro Prokopchuk1 wrote:
> On 8/21/25 11:25, Nicola Vetrini wrote:
>> On 2025-08-21 10:01, Jan Beulich wrote:
>>> On 19.08.2025 20:55, Dmytro Prokopchuk1 wrote:
>>>> Rule 11.1 states as following: "Conversions shall not be performed
>>>> between a pointer to a function and any other type."
>>>> 
>>>> The conversion from unsigned long or (void *) to a function pointer
>>>> is safe in Xen because the architectures it supports (e.g., x86 and
>>>> ARM) guarantee compatible representations between these types.
>>> 
>>> I think we need to be as precise as possible here. The architectures
>>> guarantee nothing, they only offer necessary fundamentals. In the
>>> Windows x86 ABI, for example, you can't convert pointers to/from 
>>> longs
>>> without losing data. What we build upon is what respective ABIs say,
>>> possibly in combination of implementation specifics left to 
>>> compilers.
>>> 
>> 
>> +1, a mention of the compilers and targets this deviation relies upon 
>> is
>> needed.
> 
> Maybe with this wording:
> 
> This deviation is based on the guarantees provided by the specific ABIs
> (e.g., ARM AAPCS) and compilers (e.g., GCC) supported in Xen. These 
> ABIs

s/supported in/supported by/

> guarantee compatible representations for 'void *', 'unsigned long' and
> function pointers for the supported target platforms. This behavior is

It's not just about the guarantees of the ABIs: it's the behavior of the 
compiler for those ABIs that makes this safe or unsafe. If present, such 
documentation should be included

> architecture-specific and may not be portable outside of supported
> environments.
> 
>> 
>>>> --- a/docs/misra/deviations.rst
>>>> +++ b/docs/misra/deviations.rst
>>>> @@ -370,6 +370,16 @@ Deviations related to MISRA C:2012 Rules:
>>>>         to store it.
>>>>       - Tagged as `safe` for ECLAIR.
>>>> 
>>>> +   * - R11.1
>>>> +     - The conversion from unsigned long or (void \*) to a function
>>>> pointer does
>>>> +       not lose any information or violate type safety assumptions
>>>> if unsigned
>>>> +       long or (void \*) type is guaranteed to be the same bit size
>>>> as a
>>>> +       function pointer. This ensures that the function pointer can
>>>> be fully
>>>> +       represented without truncation or corruption. The macro
>>>> BUILD_BUG_ON is
>>>> +       integrated into xen/common/version.c to confirm conversion
>>>> compatibility
>>>> +       across all target platforms.
>>>> +     - Tagged as `safe` for ECLAIR.
>>> 
>>> Why the escaping of * here, when ...
>>> 
>>>> --- a/docs/misra/rules.rst
>>>> +++ b/docs/misra/rules.rst
>>>> @@ -431,7 +431,13 @@ maintainers if you want to suggest a change.
>>>>       - All conversions to integer types are permitted if the
>>>> destination
>>>>         type has enough bits to hold the entire value. Conversions 
>>>> to
>>>> bool
>>>>         and void* are permitted. Conversions from 'void noreturn (*)
>>>> (...)'
>>>> -       to 'void (*)(...)' are permitted.
>>>> +       to 'void (*)(...)' are permitted. Conversions from unsigned
>>>> long or
>>>> +       (void \*) to a function pointer are permitted if the source
>>>> type has
>>>> +       enough bits to restore function pointer without truncation 
>>>> or
>>>> corruption.
>>>> +       Example::
>>>> +
>>>> +           unsigned long func_addr = (unsigned long)&some_function;
>>>> +           void (*restored_func)(void) = (void (*)(void))func_addr;
>>> 
>>> ... context here suggests they work fine un-escaped, and you even add
>>> some un-
>>> escaped instances as well. Perhaps I'm simply unaware of some
>>> peculiarity?
>>> 
>> 
>> This is a literal rst block, while the other is not (* acts as a 
>> bullet
>> point in rst iirc)
> 
> This is how "sphinx-build" tool interprets this.
> 1. * inside single quotes '' -> looks normal, e.g. ‘void (*)(…)’
> 2. * without quotes -> warning
> deviations.rst:369: WARNING: Inline emphasis start-string without
> end-string. [docutils]
> 3. \* -> looks normal, e.g. (void *)
> 
> Because that we need such format: \*
> 
> Dmytro.
> 
>> 
>>> Jan
>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

