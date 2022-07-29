Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48613584C4B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 09:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377359.610548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHK0S-00039X-I6; Fri, 29 Jul 2022 07:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377359.610548; Fri, 29 Jul 2022 07:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHK0S-00036G-FH; Fri, 29 Jul 2022 07:01:56 +0000
Received: by outflank-mailman (input) for mailman id 377359;
 Fri, 29 Jul 2022 07:01:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3XD=YC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oHK0Q-00036A-EH
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 07:01:54 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 537f00ca-0f0c-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 09:01:53 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id fy29so6894909ejc.12
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 00:01:53 -0700 (PDT)
Received: from [192.168.1.93] (adsl-69.109.242.233.tellas.gr. [109.242.233.69])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a1709062f1700b0072ff4515792sm1309698eji.54.2022.07.29.00.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 00:01:51 -0700 (PDT)
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
X-Inumbo-ID: 537f00ca-0f0c-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IJjFAZu2ir9Pr1gOKiYaW7TEd/Xm4SJX6gQhG2aRDrg=;
        b=eRwJc26zfMzo75iGLND9jLccQudHEKCkaYjgwWJaVRjCuHo0ivqm5D1gDEtIkxUAMK
         p71wqXBfc7CArVk4q/kvneeVGpYnjsCnj1Kfa9rWFTUX7lvZkBkJfvVFWaWVzzupk6OS
         OuLkSjNNHo274tbTYH1mRTmUFlNLX400/l80qZtfC8eqeSF9NJ7EdywCQr1t/hJblzQh
         bMa6WqrBaypfDuS4w/ofoWy/AqeMqNC80W4RmR12K3FAb3GhQA5pm3Tk8sYVLxWnPl6e
         dIdPOtR9tc+zKVyBXW8/exRmbctwJB7DQGUKiRun3Z4Er+eCSXiIz9c/bFNKIJ0qDQv+
         IhRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IJjFAZu2ir9Pr1gOKiYaW7TEd/Xm4SJX6gQhG2aRDrg=;
        b=4kjqjlSV7XrCJ59eOGRVmLP7v14CBD2N/YruanHjLdO8p1bFkIbDiLVpGgkv1aCgdB
         IfwmK044J5nhz6N0xfGIjTfTeXcvfeTEl0IU1yRyI8JvAfA35bP0FqIny5AaiqXlrqOq
         ORVDl5wGHLoUGkBc6oBUS02QwohIWOXGq0j0WQWVtG0vNq8uBwUUoYmSy6rFwZw/KPKT
         L3Q2Vn2ftpx79ElF++8D0SYLCP6YgT7Rd+642OBHeO04UnQn/TuA+UtZP0/+w8joULzI
         /okRrk/KA44m/GS97Xg7jZQnAp1Ti0lLgOMReLTnyrfAbq0d2CG+7XtJElyJfID2N7Nk
         ywUQ==
X-Gm-Message-State: AJIora/Q4vqteKvO6ZRBR9UX8NIsmFlOgSPWSG862AxvNADC7OsB4aYR
	N9UkKdWjoBGPDv6VoqWYyEM=
X-Google-Smtp-Source: AGRyM1uzpnBXB7Gh4YU/mstWj17/bWxDibgLFX29Q5NxqTyJi7ZnvacRxl/VNjS7Hm57I6p4WPOk5w==
X-Received: by 2002:a17:907:6da9:b0:72b:58ca:e3a8 with SMTP id sb41-20020a1709076da900b0072b58cae3a8mr1895847ejc.342.1659078112392;
        Fri, 29 Jul 2022 00:01:52 -0700 (PDT)
Message-ID: <69942917-f2e9-718e-094d-9b01aea16a4a@gmail.com>
Date: Fri, 29 Jul 2022 10:01:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20220728134943.1185621-1-burzalodowa@gmail.com>
 <0a8ff178-280d-717f-dacb-4eb9f57a24eb@xen.org>
 <83c17bf6-b9b2-a297-6f7f-dd08231d0f90@suse.com>
 <c71c9522-2df5-35a3-d39c-706d5c9d5263@xen.org>
 <alpine.DEB.2.22.394.2207281551140.4648@ubuntu-linux-20-04-desktop>
 <ec89b2e1-a18a-9ef7-1ca8-edd19e737d4f@gmail.com>
 <c55b9ad0-bfa8-f0b1-6c4e-a794afd75e7c@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <c55b9ad0-bfa8-f0b1-6c4e-a794afd75e7c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 7/29/22 09:16, Jan Beulich wrote:
> On 29.07.2022 07:23, Xenia Ragiadakou wrote:
>> Hi Stefano,
>>
>> On 7/29/22 01:56, Stefano Stabellini wrote:
>>> On Thu, 28 Jul 2022, Julien Grall wrote:
>>>> On 28/07/2022 15:20, Jan Beulich wrote:
>>>>> On 28.07.2022 15:56, Julien Grall wrote:
>>>>>> On 28/07/2022 14:49, Xenia Ragiadakou wrote:
>>>>>>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>>>>>>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>>>>>>> @@ -461,7 +461,7 @@
>>>>>>>      /* Access to system registers */
>>>>>>>         #define WRITE_SYSREG64(v, name) do {                    \
>>>>>>> -    uint64_t _r = v;                                    \
>>>>>>> +    uint64_t _r = (v);                                              \
>>>>>>
>>>>>> I am failing to see why the parentheses are necessary here. Could you
>>>>>> give an example where the lack of them would end up to different code?
>>>>>
>>>>> I think it is merely good practice to parenthesize the right sides of =.
>>>>> Indeed with assignment operators having second to lowest precedence, and
>>>>> with comma (the lowest precedence one) requiring parenthesization at the
>>>>> macro invocation site, there should be no real need for parentheses here.
>>>>
>>>> I am not really happy with adding those parentheses because they are
>>>> pointless. But if there are a consensus to use it, then the commit message
>>>> should be updated to clarify this is just here to please MISRA (to me "need"
>>>> implies it would be bug).
>>>
>>> Let me premise that I don't know if this counts as a MISRA violation or
>>> not. (Also I haven't checked if cppcheck/eclair report it as violation.)
>>>
>>> But I think the reason for making the change would be to follow our
>>> coding style / coding practices. It makes the code simpler to figure out
>>> that it is correct, to review and maintain if we always add the
>>> parenthesis even in cases like this one where they are not strictly
>>> necessary. We are going to save our future selves some mental cycles.
>>>
>>> So the explanation on the commit message could be along those lines.
>>
>> First, the rule 20.7 states "Expressions resulting from the expansion of
>> macro parameters shall
>>    be enclosed in parentheses". So, here it is a clear violation of the
>> rule because the right side of the assignment operator is an expression.
>>
>> Second, as I stated in a previous email, if v is not enclosed in
>> parentheses, I could write the story of my life in there and compile it
>> :) So, it would be a bug.
>>
>> So, I recommend the title and the explanation i.e
>> "xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
>>
>> The macro parameter 'v' is used as an expression and needs to be enclosed in
>>    parentheses."
>> to remain as is because they are accurate.
> 
> I'm afraid you're following the MISRA wording too much to the latter.
> Earlier on you agreed that when macro parameters are used as function
> arguments, the parentheses can be omitted. Yet by what you say above
> those are also expressions. 

Yes, those are also expressions (that's why I added parentheses 
initially) and I agreed with you that the parentheses there may not be 
necessary because I could not think of an example that will produce 
different behaviors with and without the parentheses. This will need a 
formal deviation I imagine or maybe a MISRA C expert could provide a 
justification regarding why parentheses are needed around function 
arguments that we may have not think of.

> As indicated before - I think parentheses
> are wanted here, but it's strictly "wanted", and hence the title
> better wouldn't say "fix" (but e.g. "improve") and the description
> also should be "softened".
> 

Regarding the latter, are you saying that the parentheses are not needed?
In my opinion they are needed to prevent the bug described in the 
previous email i.e passing multiple statements to the macro.

By whom are they wanted? I 'm afraid I cannot understand.
Also, are you proposing to change the title into "Improve MISRA C 2012 
Rule 20.7 violation" ?

-- 
Xenia

