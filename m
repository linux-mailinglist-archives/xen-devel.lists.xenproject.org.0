Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA856583509
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 00:03:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376498.609314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGp6n-00046R-Sz; Wed, 27 Jul 2022 22:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376498.609314; Wed, 27 Jul 2022 22:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGp6n-00043u-Pl; Wed, 27 Jul 2022 22:02:25 +0000
Received: by outflank-mailman (input) for mailman id 376498;
 Wed, 27 Jul 2022 22:02:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTNG=YA=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oGp6l-00043o-Me
 for xen-devel@lists.xenproject.org; Wed, 27 Jul 2022 22:02:23 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9641831-0df7-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 00:02:20 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id fy29so33723470ejc.12
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jul 2022 15:02:20 -0700 (PDT)
Received: from [192.168.1.93] (adsl-141.176.58.136.tellas.gr. [176.58.136.141])
 by smtp.gmail.com with ESMTPSA id
 j15-20020aa7de8f000000b0043be16f5f4csm7423304edv.52.2022.07.27.15.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 15:02:19 -0700 (PDT)
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
X-Inumbo-ID: c9641831-0df7-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1KecFxKnpsM2MDCQw+NB1wExFKOHJH7W6XV6HWWmZ6s=;
        b=eJjh6oruyfl4UFpEkqnZdqGdw7CQ7pg4pWpkccw/yEv/2bCEhvN1i2Q/NMDq6jBKnd
         D3iu+8WQFFK5hSi1igXi1KCyLdUXyk12Fux1oMDDxlEmO1n5f9ttpFq58iYz66O90D+P
         +Yfj8+VG2unqUNM7OVpjaRh3lWXN9VctpirBk98JDrvxdZIzXb4Kg404eN4xDMy7VjXf
         85b8H8KPQwPK1Po89Flp+I/SX0ExywHqYxB2HroRRd5BGYfvf5X/twFXdL89ibW9YAlC
         H4miMOUAELawLJO2DBIt/gIXxdVKrM6ZczjURpg9MZePkwZvc037IAp/E9yLdiJ0qUTH
         u0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1KecFxKnpsM2MDCQw+NB1wExFKOHJH7W6XV6HWWmZ6s=;
        b=s0KfUxfA+PmKntsQE4BJHLjw1kalRBXKV58uJxpAohJDd3noRhzGw/v36XZWbJUGqF
         8H6AFN0noMlzHlyXeJJHQPwC95W912gcFTod6kIqtzO6SjstG7RngYBSCODuAECryb0a
         fGnJnkV0UnQYqzFvjNU9Dr1cC32g6xU8gZ4V3yUIOxKo3SA1LNBLny+APjlj4YcCkAZC
         qxNbRT/QXECcofXa+titAZUdcy7daaHlvgRoHUZkOcuRAU/li0LpGTxC0Bs8TgO0lUV5
         /qJV5UYx1X2uJ5XoUaL7jPvnNYpdnZ3weaHcGd3RYYNS7czGrx8gLfbcNMQJ3VpnlEpO
         yaFg==
X-Gm-Message-State: AJIora88NwkrHTz75aokqUcFxeKLGSuQGaek9fIersV13TFqlzNSYyus
	r45wsa5TtzdI0qMc/Nhfzw8=
X-Google-Smtp-Source: AGRyM1v6RMSc85PiICLT8i4w284srzSrO432Uz/M+C8aRZ5CiILsx7Z10snRib69c4c966dy50gRTw==
X-Received: by 2002:a17:906:84e1:b0:72b:b109:7636 with SMTP id zp1-20020a17090684e100b0072bb1097636mr20585560ejb.10.1658959339936;
        Wed, 27 Jul 2022 15:02:19 -0700 (PDT)
Message-ID: <68c7f43c-221a-299e-ee5b-3262dcf10fca@gmail.com>
Date: Thu, 28 Jul 2022 01:02:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
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
 <649c2902-0d36-bfc7-43a8-98e6c38b6ecd@gmail.com>
 <alpine.DEB.2.22.394.2207271325210.4648@ubuntu-linux-20-04-desktop>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2207271325210.4648@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 7/27/22 23:26, Stefano Stabellini wrote:
> On Wed, 27 Jul 2022, Xenia Ragiadakou wrote:
>> On 7/27/22 03:10, Stefano Stabellini wrote:
>>> On Tue, 26 Jul 2022, Jan Beulich wrote:
>>>> On 26.07.2022 02:33, Stefano Stabellini wrote:
>>>>> On Mon, 25 Jul 2022, Xenia Ragiadakou wrote:
>>>>>> On 7/25/22 09:32, Jan Beulich wrote:
>>>>>>> On 24.07.2022 19:20, Xenia Ragiadakou wrote:
>>>>>>>> On 7/7/22 10:55, Jan Beulich wrote:
>>>>>>>>> On 07.07.2022 09:27, Xenia Ragiadakou wrote:
>>>>>>>>>> On 7/6/22 11:51, Jan Beulich wrote:
>>>>>>>>>>> On 06.07.2022 10:43, Xenia Ragiadakou wrote:
>>>>>>>>>>>> On 7/6/22 10:10, Jan Beulich wrote:
>>>>>>>>>>>>> On 05.07.2022 23:02, Xenia Ragiadakou wrote:
>>>>>>>>>>>>>> The function idle_loop() is referenced only in
>>>>>>>>>>>>>> domain.c.
>>>>>>>>>>>>>> Change its linkage from external to internal by adding
>>>>>>>>>>>>>> the
>>>>>>>>>>>>>> storage-class
>>>>>>>>>>>>>> specifier static to its definitions.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Since idle_loop() is referenced only in inline
>>>>>>>>>>>>>> assembly, add
>>>>>>>>>>>>>> the 'used'
>>>>>>>>>>>>>> attribute to suppress unused-function compiler
>>>>>>>>>>>>>> warning.
>>>>>>>>>>>>>
>>>>>>>>>>>>> While I see that Julien has already acked the patch, I'd
>>>>>>>>>>>>> like to
>>>>>>>>>>>>> point
>>>>>>>>>>>>> out that using __used here is somewhat bogus. Imo the
>>>>>>>>>>>>> better
>>>>>>>>>>>>> approach
>>>>>>>>>>>>> is to properly make visible to the compiler that the
>>>>>>>>>>>>> symbol is
>>>>>>>>>>>>> used by
>>>>>>>>>>>>> the asm(), by adding a fake(?) input.
>>>>>>>>>>>>
>>>>>>>>>>>> I 'm afraid I do not understand what do you mean by
>>>>>>>>>>>> "adding a
>>>>>>>>>>>> fake(?)
>>>>>>>>>>>> input". Can you please elaborate a little on your
>>>>>>>>>>>> suggestion?
>>>>>>>>>>>
>>>>>>>>>>> Once the asm() in question takes the function as an input,
>>>>>>>>>>> the
>>>>>>>>>>> compiler
>>>>>>>>>>> will know that the function has a user (unless, of course,
>>>>>>>>>>> it finds
>>>>>>>>>>> a
>>>>>>>>>>> way to elide the asm() itself). The "fake(?)" was because
>>>>>>>>>>> I'm not
>>>>>>>>>>> deeply
>>>>>>>>>>> enough into Arm inline assembly to know whether the input
>>>>>>>>>>> could then
>>>>>>>>>>> also be used as an instruction operand (which imo would be
>>>>>>>>>>> preferable) -
>>>>>>>>>>> if it can't (e.g. because there's no suitable constraint or
>>>>>>>>>>> operand
>>>>>>>>>>> modifier), it still can be an input just to inform the
>>>>>>>>>>> compiler.
>>>>>>>>>>
>>>>>>>>>> According to the following statement, your approach is the
>>>>>>>>>> recommended
>>>>>>>>>> one:
>>>>>>>>>> "To prevent the compiler from removing global data or
>>>>>>>>>> functions which
>>>>>>>>>> are referenced from inline assembly statements, you can:
>>>>>>>>>> -use __attribute__((used)) with the global data or functions.
>>>>>>>>>> -pass the reference to global data or functions as operands to
>>>>>>>>>> inline
>>>>>>>>>> assembly statements.
>>>>>>>>>> Arm recommends passing the reference to global data or
>>>>>>>>>> functions as
>>>>>>>>>> operands to inline assembly statements so that if the final
>>>>>>>>>> image does
>>>>>>>>>> not require the inline assembly statements and the referenced
>>>>>>>>>> global
>>>>>>>>>> data or function, then they can be removed."
>>>>>>>>>>
>>>>>>>>>> IIUC, you are suggesting to change
>>>>>>>>>> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) :
>>>>>>>>>> "memory" )
>>>>>>>>>> into
>>>>>>>>>> asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) :
>>>>>>>>>> "memory"
>>>>>>>>>> );
>>>>>>>>>
>>>>>>>>> Yes, except that I can't judge about the "S" constraint.
>>>>>>>>>
>>>>>>>>
>>>>>>>> This constraint does not work for arm32. Any other thoughts?
>>>>>>>>
>>>>>>>> Another way, as Jan suggested, is to pass the function as a 'fake'
>>>>>>>> (unused) input.
>>>>>>>> I 'm suspecting something like the following could work
>>>>>>>> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) :
>>>>>>>> "memory")
>>>>>>>> What do you think?
>>>>>>>
>>>>>>> Well, yes, X should always be a fallback option. But I said already
>>>>>>> when
>>>>>>> you suggested S that I can't judge about its use, so I guess I'm the
>>>>>>> wrong one to ask. Even more so that you only say "does not work",
>>>>>>> without
>>>>>>> any details ...
>>>>>>>
>>>>>>
>>>>>> The question is addressed to anyone familiar with arm inline assembly.
>>>>>> I added the arm maintainers as primary recipients to this email to
>>>>>> make this
>>>>>> perfectly clear.
>>>>>>
>>>>>> When cross-compiling Xen on x86 for arm32 with
>>>>>> asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory"
>>>>>> );
>>>>>> compilation fails with the error: impossible constraint in ‘asm'
>>>>>
>>>>> Unfortunately looking at the GCC manual pages [1], it doesn't seem to be
>>>>> possible. The problem is that the definition of "S" changes between
>>>>> aarch64 and arm (the 32-bit version).
>>>>>
>>>>> For aarch64:
>>>>>
>>>>> S   An absolute symbolic address or a label reference
>>>>>
>>>>> This is what we want. For arm instead:
>>>>>
>>>>> S   A symbol in the text segment of the current file
>>>>>
>>>>> This is not useful for what we need to do here. As far as I can tell,
>>>>> there is no other way in GCC assembly inline for arm to do this.
>>>>>
>>>>> So we have 2 choices: we use the __used keyword as Xenia did in this
>>>>> patch. Or we move the implementation of switch_stack_and_jump in
>>>>> assembly. I attempted a prototype of the latter to see how it would come
>>>>> out, see below.
>>>>>
>>>>> I don't like it very much. I prefer the version with __used that Xenia
>>>>> had in this patch. But I am OK either way.
>>>>
>>>> You forgot the imo better intermediate option of using the "X" constraint.
>>>
>>> I couldn't get "X" to compile in any way (not even for arm64). Do you
>>> have a concrete example that you think should work using "X" as
>>> constraint?
>>
>> I proposed the X constraint for the case that the function is used as a fake
>> (unused) input operand to the inline asm.
>> For instance, in the example below, the function is listed in the input
>> operands but there is not corresponding reference to it.
>>
>> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory" );
> 
> 
> Also replying to Jan, yes, this doesn't build for me, not even for
> arm64. The error is below.
> 
> 
> arch/arm/domain.c: In function ‘continue_new_vcpu’:
> arch/arm/domain.c:345:30: error: ‘return_to_new_vcpu32’ undeclared (first use in this function)
>    345 |         reset_stack_and_jump(return_to_new_vcpu32);
>        |                              ^~~~~~~~~~~~~~~~~~~~
> ./arch/arm/include/asm/current.h:48:65: note: in definition of macro ‘switch_stack_and_jump’
>     48 |     asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory" ); \
>        |                                                                 ^~
> arch/arm/domain.c:345:9: note: in expansion of macro ‘reset_stack_and_jump’
>    345 |         reset_stack_and_jump(return_to_new_vcpu32);
>        |         ^~~~~~~~~~~~~~~~~~~~
> arch/arm/domain.c:345:30: note: each undeclared identifier is reported only once for each function it appears in
>    345 |         reset_stack_and_jump(return_to_new_vcpu32);
>        |                              ^~~~~~~~~~~~~~~~~~~~
> ./arch/arm/include/asm/current.h:48:65: note: in definition of macro ‘switch_stack_and_jump’
>     48 |     asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory" ); \
>        |                                                                 ^~
> arch/arm/domain.c:345:9: note: in expansion of macro ‘reset_stack_and_jump’
>    345 |         reset_stack_and_jump(return_to_new_vcpu32);
>        |         ^~~~~~~~~~~~~~~~~~~~
>    CC      arch/arm/domain_build.o
> arch/arm/domain.c:348:30: error: ‘return_to_new_vcpu64’ undeclared (first use in this function)
>    348 |         reset_stack_and_jump(return_to_new_vcpu64);
>        |                              ^~~~~~~~~~~~~~~~~~~~
> ./arch/arm/include/asm/current.h:48:65: note: in definition of macro ‘switch_stack_and_jump’
>     48 |     asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory" ); \
>        |                                                                 ^~
> arch/arm/domain.c:348:9: note: in expansion of macro ‘reset_stack_and_jump’
>    348 |         reset_stack_and_jump(return_to_new_vcpu64);
>        |         ^~~~~~~~~~~~~~~~~~~~
> make[2]: *** [Rules.mk:246: arch/arm/domain.o] Error 1

With this change, the compiler becomes aware that the functions 
idle_loop, return_to_new_vcpu32 and return_to_new_vcpu64 are used by the 
inline assembly.
For idle loop, there is a previous declaration but for the other two 
there is not and when the compiler encounters their references complains.
So, for this to compile, it is also required to declare
return_to_new_vcpu32 and return_to_new_vcpu64.

-- 
Xenia

