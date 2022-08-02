Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2102588112
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 19:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379437.612894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIvl7-00057N-DZ; Tue, 02 Aug 2022 17:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379437.612894; Tue, 02 Aug 2022 17:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIvl7-00054S-A0; Tue, 02 Aug 2022 17:32:45 +0000
Received: by outflank-mailman (input) for mailman id 379437;
 Tue, 02 Aug 2022 17:32:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oIvl5-00054M-PT
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 17:32:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oIvl2-0003E4-8X; Tue, 02 Aug 2022 17:32:40 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.4.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oIvl2-0005SD-1L; Tue, 02 Aug 2022 17:32:40 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=P3qwG54J1uW4xd3phpj55f+ISV6yq+rh0qbNxcIG0uM=; b=3Axyo6Uf7BwVEzEu5831JeHj17
	AYUmu1D1DcKkU39d1JXGK1FXN9JNnG3Wnl9myp66BJQ8EvEhqIWi0cezmpNYgEk7/qwVgxpdZjiR8
	Dr3ZIp1ETovAP4b311DZH/RczWPCjLwyx4Glyn8ZzhCIFmDIiNyJb7vFc3ERWJCLWXl8=;
Message-ID: <b2f2d1e7-0c18-206f-5e9d-d0115e398840@xen.org>
Date: Tue, 2 Aug 2022 18:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20220728134943.1185621-1-burzalodowa@gmail.com>
 <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org>
 <83c17bf6-b9b2-a297-6f7f-dd08231d0f90@suse.com>
 <c71c9522-2df5-35a3-d39c-706d5c9d5263@xen.org>
 <alpine.DEB.2.22.394.2207281551140.4648@ubuntu-linux-20-04-desktop>
 <ec89b2e1-a18a-9ef7-1ca8-edd19e737d4f@gmail.com>
 <c55b9ad0-bfa8-f0b1-6c4e-a794afd75e7c@suse.com>
 <69942917-f2e9-718e-094d-9b01aea16a4a@gmail.com>
 <a9cddfc6-235f-a42f-b522-04ae87990b47@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a9cddfc6-235f-a42f-b522-04ae87990b47@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/07/2022 08:22, Jan Beulich wrote:
> On 29.07.2022 09:01, Xenia Ragiadakou wrote:
>> On 7/29/22 09:16, Jan Beulich wrote:
>>> On 29.07.2022 07:23, Xenia Ragiadakou wrote:
>>>> On 7/29/22 01:56, Stefano Stabellini wrote:
>>>>> On Thu, 28 Jul 2022, Julien Grall wrote:
>>>>>> On 28/07/2022 15:20, Jan Beulich wrote:
>>>>>>> On 28.07.2022 15:56, Julien Grall wrote:
>>>>>>>> On 28/07/2022 14:49, Xenia Ragiadakou wrote:
>>>>>>>>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>>>>>>>>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>>>>>>>>> @@ -461,7 +461,7 @@
>>>>>>>>>       /* Access to system registers */
>>>>>>>>>          #define WRITE_SYSREG64(v, name) do {                    \
>>>>>>>>> -    uint64_t _r = v;                                    \
>>>>>>>>> +    uint64_t _r = (v);                                              \
>>>>>>>>
>>>>>>>> I am failing to see why the parentheses are necessary here. Could you
>>>>>>>> give an example where the lack of them would end up to different code?
>>>>>>>
>>>>>>> I think it is merely good practice to parenthesize the right sides of =.
>>>>>>> Indeed with assignment operators having second to lowest precedence, and
>>>>>>> with comma (the lowest precedence one) requiring parenthesization at the
>>>>>>> macro invocation site, there should be no real need for parentheses here.
>>>>>>
>>>>>> I am not really happy with adding those parentheses because they are
>>>>>> pointless. But if there are a consensus to use it, then the commit message
>>>>>> should be updated to clarify this is just here to please MISRA (to me "need"
>>>>>> implies it would be bug).
>>>>>
>>>>> Let me premise that I don't know if this counts as a MISRA violation or
>>>>> not. (Also I haven't checked if cppcheck/eclair report it as violation.)
>>>>>
>>>>> But I think the reason for making the change would be to follow our
>>>>> coding style / coding practices. It makes the code simpler to figure out
>>>>> that it is correct, to review and maintain if we always add the
>>>>> parenthesis even in cases like this one where they are not strictly
>>>>> necessary. We are going to save our future selves some mental cycles.
>>>>>
>>>>> So the explanation on the commit message could be along those lines.
>>>>
>>>> First, the rule 20.7 states "Expressions resulting from the expansion of
>>>> macro parameters shall
>>>>     be enclosed in parentheses". So, here it is a clear violation of the
>>>> rule because the right side of the assignment operator is an expression.
>>>>
>>>> Second, as I stated in a previous email, if v is not enclosed in
>>>> parentheses, I could write the story of my life in there and compile it
>>>> :) So, it would be a bug.
>>>>
>>>> So, I recommend the title and the explanation i.e
>>>> "xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
>>>>
>>>> The macro parameter 'v' is used as an expression and needs to be enclosed in
>>>>     parentheses."
>>>> to remain as is because they are accurate.
>>>
>>> I'm afraid you're following the MISRA wording too much to the latter.
>>> Earlier on you agreed that when macro parameters are used as function
>>> arguments, the parentheses can be omitted. Yet by what you say above
>>> those are also expressions.
>>
>> Yes, those are also expressions (that's why I added parentheses
>> initially) and I agreed with you that the parentheses there may not be
>> necessary because I could not think of an example that will produce
>> different behaviors with and without the parentheses. This will need a
>> formal deviation I imagine or maybe a MISRA C expert could provide a
>> justification regarding why parentheses are needed around function
>> arguments that we may have not think of.
>>
>>> As indicated before - I think parentheses
>>> are wanted here, but it's strictly "wanted", and hence the title
>>> better wouldn't say "fix" (but e.g. "improve") and the description
>>> also should be "softened".
>>>
>>
>> Regarding the latter, are you saying that the parentheses are not needed?
>> In my opinion they are needed to prevent the bug described in the
>> previous email i.e passing multiple statements to the macro.
> 
> Any such use would be rejected during review, I'm sure.
> 
> However I think there's another case which might indeed make this
> more than just a "want" (and then responses further down are to be
> viewed only in the context of earlier discussion):
> 
> #define wr(v) ({ \
> 	unsigned r_ = v; \
> 	asm("" :: "r" (r_)); \
> })
> 
> #define M x, y
> 
> void test(unsigned x) {
> 	wr(M);
> }

Interesting. I would have expected the pre-processor to first expand M 
and then consider wr() is called with 2 parameters.

> 
> While this would result in an unused variable warning,

FWIW, in our case, the compiler is going to throw an error.

> it's surely
> misleading (and less certain to be noticed during review) - which
My expectation is we would notice that M is missing the parentheses. If 
it is really wanted, the name of the macro should be obvious.

> is what Misra wants to avoid. Let's see what Julien thinks.
I am struggling to see how this is different from:

#define wr(v) printf("%u\n", v)

If I am not mistaken, you have been arguing against adding the 
parentheses here. So, AFAIU, this means we will need to rely on the 
compiler to notice the extra parameters.

Anyway, I am not against adding the parentheses in your example. 
However, I think we should be consistent how we use them.

Cheers,

-- 
Julien Grall

