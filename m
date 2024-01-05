Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9BD825355
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 13:26:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662171.1032117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLjGh-0000Yu-Cx; Fri, 05 Jan 2024 12:25:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662171.1032117; Fri, 05 Jan 2024 12:25:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLjGh-0000Vo-9f; Fri, 05 Jan 2024 12:25:43 +0000
Received: by outflank-mailman (input) for mailman id 662171;
 Fri, 05 Jan 2024 12:25:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v9dN=IP=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1rLjGf-0000VW-Eq
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 12:25:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88f433d5-abc5-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 13:25:39 +0100 (CET)
Received: from [192.168.1.219] (unknown [151.29.148.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 6C9404EE073F;
 Fri,  5 Jan 2024 13:25:38 +0100 (CET)
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
X-Inumbo-ID: 88f433d5-abc5-11ee-9b0f-b553b5be7939
Message-ID: <7497be2d-744e-4c37-9107-79c289799135@bugseng.com>
Date: Fri, 5 Jan 2024 13:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use -Wuninitialized and -Winit-self
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20231228193907.3052681-1-andrew.cooper3@citrix.com>
 <1248487f-4852-41f5-9ffd-d4d12897a622@suse.com>
 <7d35a648-a69b-4dfb-bf4f-d30272df5e9b@citrix.com>
 <d1d43877-912c-4f83-aa9b-bc28be418a0c@bugseng.com>
 <6406b9d4-b5e2-41eb-9cce-93a27086fb8a@suse.com>
Content-Language: en-US
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <6406b9d4-b5e2-41eb-9cce-93a27086fb8a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-01-05 07:56, Jan Beulich wrote:
> On 04.01.2024 21:43, Roberto Bagnara wrote:
>> On 2024-01-04 15:33, Andrew Cooper wrote:
>>> On 04/01/2024 1:41 pm, Jan Beulich wrote:
>>>> On 28.12.2023 20:39, Andrew Cooper wrote:
>>>>> The use of uninitialised data is undefined behaviour.  At -O2 with trivial
>>>>> examples, both Clang and GCC delete the variable, and in the case of a
>>>>> function return, the caller gets whatever was stale in %rax prior to the call.
>>>>>
>>>>> Clang includes -Wuninitialized within -Wall, but GCC only includes it in
>>>>> -Wextra, which is not used by Xen at this time.
>>>>>
>>>>> Furthermore, the specific pattern of assigning a variable to itself in its
>>>>> declaration is only diagnosed by GCC with -Winit-self.  Clang does diagnoise
>>>>> simple forms of this pattern with a plain -Wuninitialized, but it fails to
>>>>> diagnose the instances in Xen that GCC manages to find.
>>>>>
>>>>> GCC, with -Wuninitialized and -Winit-self notices:
>>>>>
>>>>>     arch/x86/time.c: In function ‘read_pt_and_tsc’:
>>>>>     arch/x86/time.c:297:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
>>>>>       297 |     uint32_t best = best;
>>>>>           |              ^~~~
>>>>>     arch/x86/time.c: In function ‘read_pt_and_tmcct’:
>>>>>     arch/x86/time.c:1022:14: error: ‘best’ is used uninitialized in this function [-Werror=uninitialized]
>>>>>      1022 |     uint64_t best = best;
>>>>>           |              ^~~~
>>>>>
>>>>> and both have logic paths where best can be returned while uninitalised.
>>>> I disagree. In both cases the variables are reliably set during the first
>>>> loop iteration.
>>>
>>> I suggest you pay attention to the precision of the integers.
>>>
>>> It is hard (likely prohibitively hard) to avoid entering the if(), but
>>> it is not impossible.
>>>
>>> The compiler really has emitted logic paths where stack rubble is returned.
>>>
>>>> Furthermore this initialize-to-self is a well known pattern to suppress the
>>>> -Wuninitialized induced warnings, originally used by Linux'es
>>>> uninitialized_var().
>>>
>>> I'm glad you cited this, because it proves my point.
>>>
>>> Notice how it was purged from Linux slowly over the course of 8 years
>>> because it had been shown to create real bugs, by hiding real uses of
>>> uninitialised variables.
>>
>> There is a worse problem for initialize-to-self: it is undefined behavior
>> per se.  If this is done to suppress a warning, then what happens is
>> paradoxical: in order to suppress a warning about a potential undefined
>> behavior (the variable might indeed be always written before being read)
>> one introduces a definite undefined behavior.
> 
> I don't think so - aiui this is another of the many gcc extensions to the
> language (no code is generated for this type of initialization, iirc).

Well, it is undefined behavior for the C Standard: "undefined behavior"
is a technical term (see, e.g., C18 3.4.3p1) that is not dependent on
any compiler or any implementation technique for the C language.
Any implementation can deal with undefined behavior with absolute
freedom, which includes, among infinite other possibilities, doing what
you believe it does (iyrc ;-)

In addition, the compiler is typically not the only element of the toolchain
that needs to reliably interpret and process C code: so, even if we could reach
absolute certainty about what a specific version of one compiler does in response
to one instance of undefined behavior (and I think we cannot), then we would
need to obtain similar guarantees for other tools.

