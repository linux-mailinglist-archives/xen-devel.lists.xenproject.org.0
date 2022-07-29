Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3769A584E15
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 11:34:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377438.610648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHMNk-0000H7-8B; Fri, 29 Jul 2022 09:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377438.610648; Fri, 29 Jul 2022 09:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHMNk-0000EN-5F; Fri, 29 Jul 2022 09:34:08 +0000
Received: by outflank-mailman (input) for mailman id 377438;
 Fri, 29 Jul 2022 09:34:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3XD=YC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oHMNj-0000EH-1V
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 09:34:07 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96c1771b-0f21-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 11:34:05 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id os14so7542199ejb.4
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 02:34:05 -0700 (PDT)
Received: from [192.168.1.93] (adsl-237.176.58.138.tellas.gr. [176.58.138.237])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0072af2460cd6sm1468903ejt.30.2022.07.29.02.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 02:34:04 -0700 (PDT)
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
X-Inumbo-ID: 96c1771b-0f21-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Y2Wz/fGSfC4Yndoab6IP3Nuu1Cre9LOqctbIL8IkPSo=;
        b=N8F6JWLrQhsC8BYB6Be2BoGV2CAvKG4VABAU1PqgR3+mUIXdb/sQh9s0wTazMSJq9N
         1I5x4Ots1m1gAFp4awJZtNZDDzZyZ7oK4/UUm001kRaLf6VIC0g/bm/9HI2P1lcNYBVI
         au32br08imT480ka+R94JzHfpb1qwitjw+fn+50sWPg6affQfb4L8SqgzxiZ0n6rnLSB
         wSq8U3flvTLqXvrkbNOwt5JHpzfDghZBGgWCidQVMRXKIw382M7BhwNQB6Z8LZVVwvfE
         nJBEd1C2VmtWREtHGnUORBxADq6f6jY/2PXwtl5FYS+nXfwIWEtQSHmfA3K76igt1+0W
         kGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Y2Wz/fGSfC4Yndoab6IP3Nuu1Cre9LOqctbIL8IkPSo=;
        b=Y/OYysAldtqsTU9zZx+WxdZogwR6pJqFA8S529IXNX3eMS+VjUyZj+RHIHaiboUsSt
         PJZzE4MRWz/86iD91dWtRBswdm63jkSxcunFtuGvWOCTg7qKzxRhNka7//23KXMhf04u
         gRveuUDMVaOqqjuuQqP50zcOqBt+BkXo5NvRSkkdCDL0neBOuJ1KTPDE4QOsTEfV6mwB
         0sLIzD8AGXofw9gAFbsD/M0TwaE+BEJ1yipn1DjdgQRtTtOWk17b1raZUcU7oI3DZWQX
         e4KKe4wr8q5vOUbYOz+LMcLNAt9BCAMQiEYhyryVd5dZ67rTKk0z8Jo5SoUyzvLf3uVj
         6R6g==
X-Gm-Message-State: AJIora+W1IkED2jupRsZS1OEPq7v0l8Uqi9i81s6h4ilFJemE7D69gBg
	E8uVrL1qrwfSKMQttFsidAA=
X-Google-Smtp-Source: AGRyM1sQkT4slRmoUqT6YMrban3LsJFRYjldRuvIMN1OvyJt2Ey2Iddaf2F4y0TByswOgJhJUxh0hA==
X-Received: by 2002:a17:907:3f27:b0:72b:838e:f104 with SMTP id hq39-20020a1709073f2700b0072b838ef104mr2250272ejc.63.1659087244766;
        Fri, 29 Jul 2022 02:34:04 -0700 (PDT)
Message-ID: <6b239efa-14ff-2a5e-0828-7f62c82487e6@gmail.com>
Date: Fri, 29 Jul 2022 12:34:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
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
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <a9cddfc6-235f-a42f-b522-04ae87990b47@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/29/22 10:22, Jan Beulich wrote:
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

With the example that Jan provided I just realized, if function 
arguments are not parenthesized, somebody could alter the rest of the 
arguments with which a function is called via an intermediate macro ... 
a rather far fetched example but still ...

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
> 
> While this would result in an unused variable warning, it's surely
> misleading (and less certain to be noticed during review) - which
> is what Misra wants to avoid. Let's see what Julien thinks.
> 
>> By whom are they wanted? I 'm afraid I cannot understand.
> 
> By us as a community: This can be viewed as one of many agreements we
> have on coding style. (As such it may want to be written down somewhere.)
> 
>> Also, are you proposing to change the title into "Improve MISRA C 2012
>> Rule 20.7 violation" ?
> 
> Obviously not. I was thinking of "improve to avoid ...".
> 
> Jan

-- 
Xenia

