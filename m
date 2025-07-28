Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA39FB14275
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 21:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061903.1427502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugTLS-0001Ze-Nd; Mon, 28 Jul 2025 19:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061903.1427502; Mon, 28 Jul 2025 19:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugTLS-0001Xp-Kc; Mon, 28 Jul 2025 19:17:10 +0000
Received: by outflank-mailman (input) for mailman id 1061903;
 Mon, 28 Jul 2025 19:17:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s93S=2J=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ugTLQ-0001Xj-8p
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 19:17:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 725ef470-6be7-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 21:17:05 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 7AE6B4EE3BFE;
 Mon, 28 Jul 2025 21:17:03 +0200 (CEST)
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
X-Inumbo-ID: 725ef470-6be7-11f0-b895-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1753730223;
	b=UNlA7xqCRK0ZhrAkv9jZEllWy49++lX6wKn0Lp2QFA+05HOjvksFXnTXLaoBZzZIdOar
	 L2B6TcmiG+cPT6FTGZWu1EJ7D5zaFthRuBuOYeEfkT0aO04aFf5xr0LBGXdxtAwdvl3LB
	 QDgUFI1jQ+CH5dyUhHlFXsO1tTzHmdgBxDuqQukkeqBlwb3cpUn/hsGKSspLo1tgi27gC
	 X8z2dfgf9chmzPzMwmB2yQ2bAFs96OKjkzuIGgWEwGE4M8g9AjKcoEKUhOXs26fMUguqN
	 dZ4y2G5NkbPdUp5HvO6fBbVOu9zMo7AMZHIKTjhB0YQlWy9W7NAHke92iaDzME2H9+iPK
	 ZJIHsy80Fk9YALhNDRgBH/LPHZWCjWCozTTrPIxrhVPLxIQbfNEwAV5WXdR2j4g7MlXiw
	 ZASLmA+IZffzyjeOQx4dvwIYfS4cRLmimLIqH2wSyutKZzjm/5WEkchSDYdF3YWPxd3DU
	 U9bhYXpdS/Kxu2q9VLaORy1gihtupC5TKpFouGfHSd0zf+2CQzIme7CAvc8mWvvvhmUYh
	 tiOlNGbikVNso+l3P6Bv/r6bjDed+8/qcuIWb5u+eeTFQSPb5k5ksvyK2j/gqE+o2ZUO3
	 DBFESoDlFMsLVdOY3wiBpaPO9vSR2E+G+IK8eUiPnF6c1fpCukRQ3au7DTUBYqc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1753730223;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ft3jutpObgrGvToJX4AsCETiWBHjNg9rGG95Yvcz4rQ=;
	b=AEl+GVPFT7nq39oaPr0E6dhb1uWvkFKJI01cagcqLvO58tLHG0EjqHXJbv+IrhknbrfA
	 NzMcLn8SMavV2j3Jc9Bhhl7zsiyNjt6oTLVLC8C9Mtfsoj568wBfEdwSKKNw16+jbGz9q
	 2Oo8D8jCtzs2KE2HmRPcqfwfXxYErB6U5msh5I5cij/QlGGDBwrnBrNduzV/A2v+tarx5
	 Fq7fowGlOxoqti4T8JKioaHvr+yOWZ6E+57FUKG3P9JDzvhlYWWFyUJi4DMO4H9s4BU1s
	 EM4NkHkU6sWV5yWhuLsx6k09ohmuA9itTBTq4H9HP9uVfP8xpixpIdvXwfOD2rvj5QF7/
	 aQzII5n3E2l0l/gv9p7qbdXVCfl0hHlsT/DBezYoC88QjkJt7JIeSFBuio5J9RCgOFHNy
	 GQ94vMQQUszAAAEtWRy9dmOI76uGdl2tgtC5DaEvpwfO2zUiThWiDe+LnOh1gPbL5Pf0c
	 iQgybj91Iautdg+CdJn6pr5s6VO0RRMSEHelviN+0LxSUZ5O7VVlW0Cxk4p0c5FwjRZTy
	 Xb7HxlLWzeMZAardPIp7DpaeOejtOqyR8fCF1ynuccKs8fMEQZWR5oPSmcWjrS8+o9iiW
	 MP/UEcpmVLjDSnvYT01NrOaBovYNW/Fe1SUa2qqe3UrKLkjBAdpmQaN+jHD+p5o=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1753730223; bh=2kuGjppsE2GZMrCENTZ+gUPPSkG4atua1FCWdV4fUY8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iQk557BKrAYPFGLvrIcoGyckjj05NyIHFf8AK7kizq2ANJGaKHr5WqoaUPFH5Wzik
	 74hYVtmzAbwzP4lVyb1rMKwzecgvhkcRAUlnTNEerBQZO3/X7JdlEWYOz0uxIPh8G7
	 AHbAq35ChriuKwTWrE0miHd4oWlr/7r+GeJbbZTJ3BUg4kywQqA/8p2mPwAs4nmYT9
	 x8Fx7CvW3bsat8lro43umQVhJ8pWgatQ+XyEoNNky+AQf00lzqryaOe5Rp3bbE0OPM
	 FRIK9n1LKn7La1ZP05umu4iSi+4qWMJnsSz0aXU4NMGIdBkRitJWEmu3TULN/7SUw6
	 sqd1Nx2fK3HrQ==
MIME-Version: 1.0
Date: Mon, 28 Jul 2025 21:17:03 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] misra: deviate explicit cast for Rule 11.1
In-Reply-To: <efcda932-633b-4140-b869-e22d552b3aea@epam.com>
References: <181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro_prokopchuk1@epam.com>
 <093601d7-691a-48ee-a0f4-2e86a0f2015e@suse.com>
 <43bea8dd-fbd3-4a64-ad9c-aac5813c15a9@citrix.com>
 <f1fa4da171fd7b6dbfed06cff3d4771b@bugseng.com>
 <a5781ddf-d353-470b-a072-1e0b4e6931dd@epam.com>
 <efcda932-633b-4140-b869-e22d552b3aea@epam.com>
Message-ID: <aa6c034443b495fdf13eaf88487a94b1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-07-28 20:58, Dmytro Prokopchuk1 wrote:
> On 7/28/25 21:03, Dmytro Prokopchuk wrote:
>> 
>> 
>> On 7/28/25 20:43, Nicola Vetrini wrote:
>>> On 2025-07-28 12:49, Andrew Cooper wrote:
>>>> On 28/07/2025 10:56 am, Jan Beulich wrote:
>>>>> On 27.07.2025 22:27, Dmytro Prokopchuk1 wrote:
>>>>>> Explicitly cast 'halt_this_cpu' when passing it
>>>>>> to 'smp_call_function' to match the required
>>>>>> function pointer type '(void (*)(void *info))'.
>>>>>> 
>>>>>> Document and justify a MISRA C R11.1 deviation
>>>>>> (explicit cast).
>>>>>> 
>>>>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>>>> All you talk about is the rule that you violate by adding a cast.
>>>>> But what is
>>>>> the problem you're actually trying to resolve by adding a cast?
>>>>> 
>>>>>> --- a/xen/arch/arm/shutdown.c
>>>>>> +++ b/xen/arch/arm/shutdown.c
>>>>>> @@ -25,7 +25,8 @@ void machine_halt(void)
>>>>>>      watchdog_disable();
>>>>>>      console_start_sync();
>>>>>>      local_irq_enable();
>>>>>> -    smp_call_function(halt_this_cpu, NULL, 0);
>>>>>> +    /* SAF-15-safe */
>>>>>> +    smp_call_function((void (*)(void *))halt_this_cpu, NULL, 0);
>>>>> Now this is the kind of cast that is very dangerous. The function's
>>>>> signature
>>>>> changing will go entirely unnoticed (by the compiler) with such a
>>>>> cast in place.
>>>> 
>>>> I agree.  This code is *far* safer in practice without the cast, 
>>>> than
>>>> with it.
>>>> 
>>>>> If Misra / Eclair are unhappy about such an extra (benign here)
>>>>> attribute, I'd
>>>>> be interested to know what their suggestion is to deal with the
>>>>> situation
>>>>> without making the code worse (as in: more risky). I first thought
>>>>> about having
>>>>> a new helper function that then simply chains to halt_this_cpu(),
>>>>> yet that
>>>>> would result in a function which can't return, but has no noreturn
>>>>> attribute.
>>>> 
>>>> I guess that Eclair cannot know what an arbitrary attribute does and
>>>> whether it impacts the ABI, but it would be lovely if Eclair could 
>>>> be
>>>> told "noreturn is a safe attribute to differ on"?
>>>> 
>>> 
>>> I'm convinced it can do that. Perhaps something like
>>> 
>>> -config=MC3A2.R11.1,casts+={safe,
>>> "kind(bitcast)&&to(type(pointer(inner(return(builtin(void))&&all_param(1, 
>>> pointer(builtin(void)))))))&&from(expr(skip(!syntactic(), 
>>> ref(property(noreturn)))))"}
>>> 
>>> which is a mess but decodes to that, more or less.
>>> 
>>> I haven't tested it yet, though, but on a toy example [1] it works.
>>> 
>>> [1]
>>> void __attribute__((noreturn)) f(void *p) {
>>>    __builtin_abort();
>>> }
>>> 
>>> void g(int x, void (*fp)(void *p)) {
>>>    if (x < 3) {
>>>      f((void*)x);
>>>    }
>>> }
>>> 
>>> int main(int argc, char **argv) {
>>>    g(argc, f);
>>>    return 0;
>>> }
>>> 
>> Thanks, Nicola.
>> I will check this.
>> 
>> Dmytro.
> It works.
> The violation "non-compliant cast: implicit cast from `void(*)(void*)'
> to `void(*)(void*)'" is gone.
> 

Great. Now what would be really useful is a way to abstract this more 
nicely (I was able to write this only by looking at the AST). However 
noreturn is probably about the only attribute that has a repercussion on 
the decl and is safe to cast away, unless I'm mistaken.

Thanks,
  Nicola

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

