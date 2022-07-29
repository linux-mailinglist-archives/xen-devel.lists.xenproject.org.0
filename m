Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F94584D0A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 09:59:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377383.610582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHKt8-0002Fm-Bm; Fri, 29 Jul 2022 07:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377383.610582; Fri, 29 Jul 2022 07:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHKt8-0002Dy-8x; Fri, 29 Jul 2022 07:58:26 +0000
Received: by outflank-mailman (input) for mailman id 377383;
 Fri, 29 Jul 2022 07:58:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3XD=YC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oHKt7-0002Ds-06
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 07:58:25 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3824d77f-0f14-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 09:58:23 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id ez10so7110972ejc.13
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 00:58:23 -0700 (PDT)
Received: from [192.168.1.93] (adsl-69.109.242.233.tellas.gr. [109.242.233.69])
 by smtp.gmail.com with ESMTPSA id
 d6-20020aa7ce06000000b0043ba24a26casm1958198edv.23.2022.07.29.00.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 00:58:22 -0700 (PDT)
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
X-Inumbo-ID: 3824d77f-0f14-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cGhgx67Cv1IrEHlzR0A+NYH5DRlnzxJroQfU8BZuYIE=;
        b=QvGfFYqlJZFG3anjNQdHvKfaEYAKlEVZb4kg0o0hbjUToE7gGpZ1hOwDWsfq/dZfBz
         kA69vw/lWahVNZ5UuoEkSOaxTHc/3ShiPrQZ/Hw7Cj4/9N/YEUhk1PGbE40U7zF9kcPD
         ixmr6p9+COMlx8Jby0YD0ocT9cdZCwYq0/TySHZnEPn5QrmEc+nYdLXEu7AQVmhvOr8p
         JQ4oFXyt35/m2BwZeA22igXTFGegU5z8nL6+ztKWt+12CTio7HcBLFDpBYM4fYZ52TVI
         ThzezzUXPrYchdnhGn7bqXR48848u5jWjFQqc4/IcM77jC2pZn23u0kus67XRLDSnHDJ
         qthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cGhgx67Cv1IrEHlzR0A+NYH5DRlnzxJroQfU8BZuYIE=;
        b=B+bIkmH6oxlblKu/0jHNLIcKc6aTo1aMvjliF49h6LTfv8bpYoxcshvVNvinkcuYVr
         4RVfGQIBqYtqjEpcYsk5ZFS7lHOhc2uRBykjBzORRFniA0v8plfJITFpFhBgl2yS0AlE
         pqemlmOzRWrXkdfyOwqXXvXnQi0gvX2vH8xcNcrIFmhuftDXaUvwxzZXyB5jLyn09+Hh
         qZUESCLBSYP51m4gSFDH3gQ4Tmf2lKrE5Lir+vBpmaQIY2YzeWpeTzY0dp7ZXOoNznvB
         KHUVcvUaHuE+z7u7tvYCMpjqYkeoLEulbVFgN8nFL9GywiFtpOL+CE88GuQsdjzfwK/c
         kY+Q==
X-Gm-Message-State: AJIora8A7TZnBV3Bhi+FhdATg06zCbBhYE1+4UWx9pD52Ld6XD8FXLfg
	IgeDwjkN5KkOKTYM5b4Lxo0=
X-Google-Smtp-Source: AGRyM1tqBgZl3WZGn9/JVW6UV+aTQ2ogKW2LrD/jH0a3JZea2qmChtKNU7joAP45hSQL2DWN1B3ZCA==
X-Received: by 2002:a17:906:8a5b:b0:72b:50a1:a72c with SMTP id gx27-20020a1709068a5b00b0072b50a1a72cmr2032306ejc.152.1659081502684;
        Fri, 29 Jul 2022 00:58:22 -0700 (PDT)
Message-ID: <a9a9ed21-9321-b432-3ca4-294f08b086d1@gmail.com>
Date: Fri, 29 Jul 2022 10:58:20 +0300
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

I would argue that any such use should be rejected by the compiler.

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

In that case, first it should be mentioned in the coding style document 
and then make reference to it in commit messages.

>> Also, are you proposing to change the title into "Improve MISRA C 2012
>> Rule 20.7 violation" ?
> 
> Obviously not. I was thinking of "improve to avoid ...".
> 

-- 
Xenia

