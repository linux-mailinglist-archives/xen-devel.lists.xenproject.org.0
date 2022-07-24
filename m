Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B37B57F61F
	for <lists+xen-devel@lfdr.de>; Sun, 24 Jul 2022 19:20:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374195.606303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFfH6-0001Y1-IO; Sun, 24 Jul 2022 17:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374195.606303; Sun, 24 Jul 2022 17:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFfH6-0001Vf-Fn; Sun, 24 Jul 2022 17:20:16 +0000
Received: by outflank-mailman (input) for mailman id 374195;
 Sun, 24 Jul 2022 17:20:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JfQL=X5=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oFfH4-0001VZ-Vy
 for xen-devel@lists.xenproject.org; Sun, 24 Jul 2022 17:20:15 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0f6a3a6-0b74-11ed-bd2d-47488cf2e6aa;
 Sun, 24 Jul 2022 19:20:13 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id sz17so16639985ejc.9
 for <xen-devel@lists.xenproject.org>; Sun, 24 Jul 2022 10:20:13 -0700 (PDT)
Received: from [192.168.8.105] (adsl-30.37.6.163.tellas.gr. [37.6.163.30])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a056402111200b0043bb892a86csm5822853edv.69.2022.07.24.10.20.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 10:20:12 -0700 (PDT)
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
X-Inumbo-ID: e0f6a3a6-0b74-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1jFB94iK6Ya6i/rotTW4zhaqD4q99vuq9m6m8IMQHjg=;
        b=eb/Fg6ID2KMg2vXbTay+5005a6SUfJLoNmW9RbkRJ5b4CQ3jbsgJgLm6QezrMTft+A
         BJUfOdWBT1WTPmxgVQSYCQ+eeNZGJpmJa1L4ZxUPTPe+ey3NmBNHY7hapV6/NSsGaiKP
         GBnjZ8qRxp+hLHqDgi8b7cCG7R/2FSjlDH7AqkW/UAbJ/Kk4/zwo5u8UhN76CovMbVsV
         KKzm1WuJ9R4zCX5LLGxzssPZucr+aaEAKnWOeSwwtw8tRFMMKn03ptsUk4H2+0m4SX91
         0nOy+8X4cwcgEFTWTT3KwhIYruWyzPD4l43dG7UyMqwBYgVrDp7yaq3tQJV58Fwpn+tT
         WOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1jFB94iK6Ya6i/rotTW4zhaqD4q99vuq9m6m8IMQHjg=;
        b=sEIMnhjprQfjQzbEl1ZqCVS3ADUIvG5tpPrwJchz514tzwGem/s14P8Nw/cOkCKP2S
         yA4KA1wfT135YqobJt0hQm8w0Ct4VAGwipVY80nvIvKtIV4QnRvXj9o9rbdQNBHgraLn
         SXe8JjEkDdC3cE0EyJpGh5PskNYB6aI7WzcnyWaYBTxqhyITl3GChyrzUgNKC0QVxG9/
         4IT4uaw7qgOIbaGYbVIcTAXio7iFHXWYIDqM5G4+AjOixvOW4CmQFRhGe4Shp595+qoX
         s315fef+kD68Uk3+vIDM4T4TcfEsR0LURjx6+ABybx8UKyzvCEV9cDtvqlBUt/II3mJb
         BiWg==
X-Gm-Message-State: AJIora+aA6XnN0WYi8UGKbfn1+qWusnCf+QuQ2bGVZL/fTg/2uFyhCFj
	cNvjCxW/dH8/VvsqZzfZuuINv/38HwQ=
X-Google-Smtp-Source: AGRyM1vAJiAarmqInubULpKbVkHgo1ZczYrpfXC+F7vma9xFqmiauskhZ55RSRqsiFxggOuAdPoo3g==
X-Received: by 2002:a17:907:a061:b0:72f:1dde:fac0 with SMTP id ia1-20020a170907a06100b0072f1ddefac0mr6923284ejc.310.1658683213238;
        Sun, 24 Jul 2022 10:20:13 -0700 (PDT)
Message-ID: <e0b98949-8bb4-5c58-1e96-0675a144694e@gmail.com>
Date: Sun, 24 Jul 2022 20:20:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-4-burzalodowa@gmail.com>
 <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com>
 <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com>
 <910119aa-69c6-6736-49f1-3b51da1c4fb0@suse.com>
 <e0a05c63-dc0a-6898-3e73-c327ff7514e2@gmail.com>
 <d4002ba3-e5b2-b732-66fb-ad6d674afe25@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <d4002ba3-e5b2-b732-66fb-ad6d674afe25@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/7/22 10:55, Jan Beulich wrote:
> On 07.07.2022 09:27, Xenia Ragiadakou wrote:
>> On 7/6/22 11:51, Jan Beulich wrote:
>>> On 06.07.2022 10:43, Xenia Ragiadakou wrote:
>>>> On 7/6/22 10:10, Jan Beulich wrote:
>>>>> On 05.07.2022 23:02, Xenia Ragiadakou wrote:
>>>>>> The function idle_loop() is referenced only in domain.c.
>>>>>> Change its linkage from external to internal by adding the storage-class
>>>>>> specifier static to its definitions.
>>>>>>
>>>>>> Since idle_loop() is referenced only in inline assembly, add the 'used'
>>>>>> attribute to suppress unused-function compiler warning.
>>>>>
>>>>> While I see that Julien has already acked the patch, I'd like to point
>>>>> out that using __used here is somewhat bogus. Imo the better approach
>>>>> is to properly make visible to the compiler that the symbol is used by
>>>>> the asm(), by adding a fake(?) input.
>>>>
>>>> I 'm afraid I do not understand what do you mean by "adding a fake(?)
>>>> input". Can you please elaborate a little on your suggestion?
>>>
>>> Once the asm() in question takes the function as an input, the compiler
>>> will know that the function has a user (unless, of course, it finds a
>>> way to elide the asm() itself). The "fake(?)" was because I'm not deeply
>>> enough into Arm inline assembly to know whether the input could then
>>> also be used as an instruction operand (which imo would be preferable) -
>>> if it can't (e.g. because there's no suitable constraint or operand
>>> modifier), it still can be an input just to inform the compiler.
>>
>> According to the following statement, your approach is the recommended one:
>> "To prevent the compiler from removing global data or functions which
>> are referenced from inline assembly statements, you can:
>> -use __attribute__((used)) with the global data or functions.
>> -pass the reference to global data or functions as operands to inline
>> assembly statements.
>> Arm recommends passing the reference to global data or functions as
>> operands to inline assembly statements so that if the final image does
>> not require the inline assembly statements and the referenced global
>> data or function, then they can be removed."
>>
>> IIUC, you are suggesting to change
>> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" )
>> into
>> asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory" );
> 
> Yes, except that I can't judge about the "S" constraint.
> 

This constraint does not work for arm32. Any other thoughts?

Another way, as Jan suggested, is to pass the function as a 'fake' 
(unused) input.
I 'm suspecting something like the following could work
asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory")
What do you think?

>> This gives, respectively:
>> reset_stack_and_jump(idle_loop);
>>
>>        460:	9100001f 	mov	sp, x0
>>
>>        464:	14000007 	b	480 <idle_loop>
>>
>>
>> reset_stack_and_jump(idle_loop);
>>
>>        460:	9100001f 	mov	sp, x0
>>
>>        464:	14000000 	b	600 <idle_loop>
>>
>>
>> With this change, the functions return_to_new_vcpu32 and
>> return_to_new_vcpu64, implemented in assembly and called in the same way
>> as idle_loop(), need to be declared.
> 
> Which imo is a good thing - these probably shouldn't have lived entirely
> behind the back of the compiler.
> 
> Jan

-- 
Xenia

