Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7B9581E5E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jul 2022 05:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375864.608314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGY3h-00068j-SA; Wed, 27 Jul 2022 03:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375864.608314; Wed, 27 Jul 2022 03:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGY3h-00065H-Nn; Wed, 27 Jul 2022 03:50:05 +0000
Received: by outflank-mailman (input) for mailman id 375864;
 Wed, 27 Jul 2022 03:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTNG=YA=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGY3f-0005jl-Pa
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 03:50:03 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31240def-0d5f-11ed-bd2d-47488cf2e6aa;
 Wed, 27 Jul 2022 05:50:02 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id j22so29393625ejs.2
 for <xen-devel@lists.xenproject.org>; Tue, 26 Jul 2022 20:50:01 -0700 (PDT)
Received: from [192.168.1.93] (adsl-69.109.242.233.tellas.gr. [109.242.233.69])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a1709061e9000b0072b4da1ed9asm7040338ejj.225.2022.07.26.20.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 20:50:00 -0700 (PDT)
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
X-Inumbo-ID: 31240def-0d5f-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=boGGPKrt7e0pNKjASz0sLnC9Bi3HtxzAQW/9tbujYKg=;
        b=OMdwfSr45Tr+BcTjX3JL8pUeRHM/BPXX6mmU12xHUSSHvyPODwVG+Nu/FGHwF/g7O8
         NvhelgWGRk487pQPiN8SC4l7KgE8KxlXjw0iw3AmfJfjLlbHGvvFlOyUMQ7Zv+ceAYh9
         eUIMPydp63IbbtEPU683E6H+HOs7BSX8ctubTlUlt2XyH2gz+OwQlZeh5AUnpqITfT+C
         RDCSbWzVV5H36knQuGTjEpv9xZnZWAne3cJUMyLNeF9OmHvuX/HfU86YRfFNTRd+fdqp
         rFwUqWdqi4i6alo7QPvxTbrFvtg3yGjo54CzkrNpR7pwB3tJxFQVeal07hHDbSrQkhZ4
         93dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=boGGPKrt7e0pNKjASz0sLnC9Bi3HtxzAQW/9tbujYKg=;
        b=o5Psc/BJQn9+Jlhiamlnp4jtd2mZisfHHmqqDpPAbS5qpNT8JoiML0GZAD23Htkw+X
         09404nbCVJLQNdQ4h6Zj/K+p9iFNxnroK2cGQ3vHEFHWxShHWzqaeXvVfM43+bPfm/AW
         2Z6c/SXR42p9b2EXuA3QBxaxsvQIdl9t9Fzf08Lvd3u0N5q8ccj98fzK9Ht7EbIg4osN
         obSli0/hXpek14GAwDf6K8ujo2y55pb61yzeiR55mwANATQ/nZ8WXx4HC1B01HfwrnBk
         OcsVSGD/DDQvUJpjgoemcdzSxE4NpLOIXh7rRRbhLsOATXCpeHxvLpnmtOLFok05+HF7
         YjNA==
X-Gm-Message-State: AJIora/4yImBqiq9YPXG3/mcDCzjAtP3I2WKotU5k294WIaVdIhFsLi0
	9+2/fSUvK/VeQxgW7FiEcig=
X-Google-Smtp-Source: AGRyM1th2IaGOqsHNKXlQaz2oB5qGxUwRO+ey34OHYumpCL+y4T9TybmvnvDBc+Dh3Y2Kq6Sw+OTbg==
X-Received: by 2002:a17:907:3daa:b0:72b:7656:d4d2 with SMTP id he42-20020a1709073daa00b0072b7656d4d2mr16277528ejc.166.1658893801201;
        Tue, 26 Jul 2022 20:50:01 -0700 (PDT)
Message-ID: <649c2902-0d36-bfc7-43a8-98e6c38b6ecd@gmail.com>
Date: Wed, 27 Jul 2022 06:49:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-4-burzalodowa@gmail.com>
 <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com>
 <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com>
 <910119aa-69c6-6736-49f1-3b51da1c4fb0@suse.com>
 <e0a05c63-dc0a-6898-3e73-c327ff7514e2@gmail.com>
 <d4002ba3-e5b2-b732-66fb-ad6d674afe25@suse.com>
 <e0b98949-8bb4-5c58-1e96-0675a144694e@gmail.com>
 <99d585dc-9bee-b0a1-7f5b-db67b2ea0944@suse.com>
 <8522a9aa-e7f5-9b8a-5a8f-4c6d1403317b@gmail.com>
 <alpine.DEB.2.22.394.2207251727470.4648@ubuntu-linux-20-04-desktop>
 <981e2fb9-6f99-2113-86ab-f3da860b74b9@suse.com>
 <alpine.DEB.2.22.394.2207261704400.4648@ubuntu-linux-20-04-desktop>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2207261704400.4648@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/27/22 03:10, Stefano Stabellini wrote:
> On Tue, 26 Jul 2022, Jan Beulich wrote:
>> On 26.07.2022 02:33, Stefano Stabellini wrote:
>>> On Mon, 25 Jul 2022, Xenia Ragiadakou wrote:
>>>> On 7/25/22 09:32, Jan Beulich wrote:
>>>>> On 24.07.2022 19:20, Xenia Ragiadakou wrote:
>>>>>> On 7/7/22 10:55, Jan Beulich wrote:
>>>>>>> On 07.07.2022 09:27, Xenia Ragiadakou wrote:
>>>>>>>> On 7/6/22 11:51, Jan Beulich wrote:
>>>>>>>>> On 06.07.2022 10:43, Xenia Ragiadakou wrote:
>>>>>>>>>> On 7/6/22 10:10, Jan Beulich wrote:
>>>>>>>>>>> On 05.07.2022 23:02, Xenia Ragiadakou wrote:
>>>>>>>>>>>> The function idle_loop() is referenced only in domain.c.
>>>>>>>>>>>> Change its linkage from external to internal by adding the
>>>>>>>>>>>> storage-class
>>>>>>>>>>>> specifier static to its definitions.
>>>>>>>>>>>>
>>>>>>>>>>>> Since idle_loop() is referenced only in inline assembly, add
>>>>>>>>>>>> the 'used'
>>>>>>>>>>>> attribute to suppress unused-function compiler warning.
>>>>>>>>>>>
>>>>>>>>>>> While I see that Julien has already acked the patch, I'd like to
>>>>>>>>>>> point
>>>>>>>>>>> out that using __used here is somewhat bogus. Imo the better
>>>>>>>>>>> approach
>>>>>>>>>>> is to properly make visible to the compiler that the symbol is
>>>>>>>>>>> used by
>>>>>>>>>>> the asm(), by adding a fake(?) input.
>>>>>>>>>>
>>>>>>>>>> I 'm afraid I do not understand what do you mean by "adding a
>>>>>>>>>> fake(?)
>>>>>>>>>> input". Can you please elaborate a little on your suggestion?
>>>>>>>>>
>>>>>>>>> Once the asm() in question takes the function as an input, the
>>>>>>>>> compiler
>>>>>>>>> will know that the function has a user (unless, of course, it finds
>>>>>>>>> a
>>>>>>>>> way to elide the asm() itself). The "fake(?)" was because I'm not
>>>>>>>>> deeply
>>>>>>>>> enough into Arm inline assembly to know whether the input could then
>>>>>>>>> also be used as an instruction operand (which imo would be
>>>>>>>>> preferable) -
>>>>>>>>> if it can't (e.g. because there's no suitable constraint or operand
>>>>>>>>> modifier), it still can be an input just to inform the compiler.
>>>>>>>>
>>>>>>>> According to the following statement, your approach is the recommended
>>>>>>>> one:
>>>>>>>> "To prevent the compiler from removing global data or functions which
>>>>>>>> are referenced from inline assembly statements, you can:
>>>>>>>> -use __attribute__((used)) with the global data or functions.
>>>>>>>> -pass the reference to global data or functions as operands to inline
>>>>>>>> assembly statements.
>>>>>>>> Arm recommends passing the reference to global data or functions as
>>>>>>>> operands to inline assembly statements so that if the final image does
>>>>>>>> not require the inline assembly statements and the referenced global
>>>>>>>> data or function, then they can be removed."
>>>>>>>>
>>>>>>>> IIUC, you are suggesting to change
>>>>>>>> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" )
>>>>>>>> into
>>>>>>>> asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory"
>>>>>>>> );
>>>>>>>
>>>>>>> Yes, except that I can't judge about the "S" constraint.
>>>>>>>
>>>>>>
>>>>>> This constraint does not work for arm32. Any other thoughts?
>>>>>>
>>>>>> Another way, as Jan suggested, is to pass the function as a 'fake'
>>>>>> (unused) input.
>>>>>> I 'm suspecting something like the following could work
>>>>>> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) :
>>>>>> "memory")
>>>>>> What do you think?
>>>>>
>>>>> Well, yes, X should always be a fallback option. But I said already when
>>>>> you suggested S that I can't judge about its use, so I guess I'm the
>>>>> wrong one to ask. Even more so that you only say "does not work", without
>>>>> any details ...
>>>>>
>>>>
>>>> The question is addressed to anyone familiar with arm inline assembly.
>>>> I added the arm maintainers as primary recipients to this email to make this
>>>> perfectly clear.
>>>>
>>>> When cross-compiling Xen on x86 for arm32 with
>>>> asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory" );
>>>> compilation fails with the error: impossible constraint in ‘asm'
>>>
>>> Unfortunately looking at the GCC manual pages [1], it doesn't seem to be
>>> possible. The problem is that the definition of "S" changes between
>>> aarch64 and arm (the 32-bit version).
>>>
>>> For aarch64:
>>>
>>> S   An absolute symbolic address or a label reference
>>>
>>> This is what we want. For arm instead:
>>>
>>> S   A symbol in the text segment of the current file
>>>
>>> This is not useful for what we need to do here. As far as I can tell,
>>> there is no other way in GCC assembly inline for arm to do this.
>>>
>>> So we have 2 choices: we use the __used keyword as Xenia did in this
>>> patch. Or we move the implementation of switch_stack_and_jump in
>>> assembly. I attempted a prototype of the latter to see how it would come
>>> out, see below.
>>>
>>> I don't like it very much. I prefer the version with __used that Xenia
>>> had in this patch. But I am OK either way.
>>
>> You forgot the imo better intermediate option of using the "X" constraint.
> 
> I couldn't get "X" to compile in any way (not even for arm64). Do you
> have a concrete example that you think should work using "X" as
> constraint?

I proposed the X constraint for the case that the function is used as a 
fake (unused) input operand to the inline asm.
For instance, in the example below, the function is listed in the input 
operands but there is not corresponding reference to it.

asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : 
"memory" );

-- 
Xenia

