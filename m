Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C3457FA75
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 09:48:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374429.606476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFsoH-00060S-Kp; Mon, 25 Jul 2022 07:47:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374429.606476; Mon, 25 Jul 2022 07:47:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFsoH-0005ye-HF; Mon, 25 Jul 2022 07:47:25 +0000
Received: by outflank-mailman (input) for mailman id 374429;
 Mon, 25 Jul 2022 07:47:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2rs0=X6=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oFsoF-0005yY-K3
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 07:47:23 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04092fe9-0bee-11ed-bd2d-47488cf2e6aa;
 Mon, 25 Jul 2022 09:47:21 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id g2so6678581wru.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Jul 2022 00:47:21 -0700 (PDT)
Received: from [192.168.43.143] ([62.74.23.66])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c430200b003a2e89d1fb5sm16464108wme.42.2022.07.25.00.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 00:47:20 -0700 (PDT)
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
X-Inumbo-ID: 04092fe9-0bee-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dtzdpk25rNaEKVZul+zahBkB4hSradURMLN7UgwUAWc=;
        b=IeEgJ0aSXsfO11vOdryARyp3kb5ZKmJSUclzCtCRU+OO6sgqNk78RiPtERuwW/DiAI
         pxWvH+9UUjMXvCh8lU+DKCS63j/iYCLK+LnJg57zXcbaGang/0OEifmixSxcV3ZmkXUz
         iA5zZtPE/XDwhBe+lXzCqL/Iyo2tkF5wx5x7Y0hVvDLIgZJn7wPoQxXddK7OVG2zXgDX
         yeiVl0jeutWrdZi7B4sEas1G5b68xXQtZ3OqUEvt+WHHd0qX9HBwztFUN0jehajKPBi+
         C7LTGoGoDnByrkzwZDPzpEW3hgwrGg3TE8TYDHenEG4gGjDb4EmOnS2zXs9ioiyiZsEu
         dLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dtzdpk25rNaEKVZul+zahBkB4hSradURMLN7UgwUAWc=;
        b=NqHZHckS/i0rnN9SbpSZzao2QknHJTzVPTP7kY65+U5h3QAmob+enQZKTwvYul6Bmd
         2fFCfCT9U0MtH9O9z8IQDJ+qkmoCovBAF9039FP/vA81sa54AZ2IZxLIUW4jxwZs5xTJ
         CI9pbpG9+N7hjxnuRXHhV8o/cPk68rP6bgQuqIjevx1X62tFnCHdUvK4ivzfpT6lufMP
         z8uMgfoKFcZPOnRwAO/xt4POK1ADhq7QH+gyynXwUaopboaoPkk6/++07inho0TsX3V7
         KeBMWai3kEM6vOJPfUq8jO8gZO0qDb9/FmUvwzoUE9hxc6HxnkLzQi84uteOxtuOvJOt
         ieQQ==
X-Gm-Message-State: AJIora+UX6zUuxlN+f0j0sKl8UTVuO3qoNDKI060Am/x69PuIEigL4d5
	mC0qEQZAHuglc1wnxEvDFLE=
X-Google-Smtp-Source: AGRyM1tr19kvj1fkKv84s8bZVxyI0/vxWzO6e1GtWCCUkLSVS2hEtDvZR4QuPh+H+0VvqF/u9t9hLQ==
X-Received: by 2002:a05:6000:508:b0:21d:4105:caf9 with SMTP id a8-20020a056000050800b0021d4105caf9mr7076202wrf.699.1658735241230;
        Mon, 25 Jul 2022 00:47:21 -0700 (PDT)
Message-ID: <8522a9aa-e7f5-9b8a-5a8f-4c6d1403317b@gmail.com>
Date: Mon, 25 Jul 2022 10:47:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/4] xen/arm: domain: Fix MISRA C 2012 Rule 8.7 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: xen-devel@lists.xenproject.org
References: <20220705210218.483854-1-burzalodowa@gmail.com>
 <20220705210218.483854-4-burzalodowa@gmail.com>
 <115c89bc-259e-8ca1-5533-49c98f637a0d@suse.com>
 <3f4c9270-56e5-f9fe-6de8-01c997ad2ddb@gmail.com>
 <910119aa-69c6-6736-49f1-3b51da1c4fb0@suse.com>
 <e0a05c63-dc0a-6898-3e73-c327ff7514e2@gmail.com>
 <d4002ba3-e5b2-b732-66fb-ad6d674afe25@suse.com>
 <e0b98949-8bb4-5c58-1e96-0675a144694e@gmail.com>
 <99d585dc-9bee-b0a1-7f5b-db67b2ea0944@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <99d585dc-9bee-b0a1-7f5b-db67b2ea0944@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/25/22 09:32, Jan Beulich wrote:
> On 24.07.2022 19:20, Xenia Ragiadakou wrote:
>> On 7/7/22 10:55, Jan Beulich wrote:
>>> On 07.07.2022 09:27, Xenia Ragiadakou wrote:
>>>> On 7/6/22 11:51, Jan Beulich wrote:
>>>>> On 06.07.2022 10:43, Xenia Ragiadakou wrote:
>>>>>> On 7/6/22 10:10, Jan Beulich wrote:
>>>>>>> On 05.07.2022 23:02, Xenia Ragiadakou wrote:
>>>>>>>> The function idle_loop() is referenced only in domain.c.
>>>>>>>> Change its linkage from external to internal by adding the storage-class
>>>>>>>> specifier static to its definitions.
>>>>>>>>
>>>>>>>> Since idle_loop() is referenced only in inline assembly, add the 'used'
>>>>>>>> attribute to suppress unused-function compiler warning.
>>>>>>>
>>>>>>> While I see that Julien has already acked the patch, I'd like to point
>>>>>>> out that using __used here is somewhat bogus. Imo the better approach
>>>>>>> is to properly make visible to the compiler that the symbol is used by
>>>>>>> the asm(), by adding a fake(?) input.
>>>>>>
>>>>>> I 'm afraid I do not understand what do you mean by "adding a fake(?)
>>>>>> input". Can you please elaborate a little on your suggestion?
>>>>>
>>>>> Once the asm() in question takes the function as an input, the compiler
>>>>> will know that the function has a user (unless, of course, it finds a
>>>>> way to elide the asm() itself). The "fake(?)" was because I'm not deeply
>>>>> enough into Arm inline assembly to know whether the input could then
>>>>> also be used as an instruction operand (which imo would be preferable) -
>>>>> if it can't (e.g. because there's no suitable constraint or operand
>>>>> modifier), it still can be an input just to inform the compiler.
>>>>
>>>> According to the following statement, your approach is the recommended one:
>>>> "To prevent the compiler from removing global data or functions which
>>>> are referenced from inline assembly statements, you can:
>>>> -use __attribute__((used)) with the global data or functions.
>>>> -pass the reference to global data or functions as operands to inline
>>>> assembly statements.
>>>> Arm recommends passing the reference to global data or functions as
>>>> operands to inline assembly statements so that if the final image does
>>>> not require the inline assembly statements and the referenced global
>>>> data or function, then they can be removed."
>>>>
>>>> IIUC, you are suggesting to change
>>>> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack) : "memory" )
>>>> into
>>>> asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory" );
>>>
>>> Yes, except that I can't judge about the "S" constraint.
>>>
>>
>> This constraint does not work for arm32. Any other thoughts?
>>
>> Another way, as Jan suggested, is to pass the function as a 'fake'
>> (unused) input.
>> I 'm suspecting something like the following could work
>> asm volatile ("mov sp,%0; b " STR(fn) : : "r" (stack), "X" (fn) : "memory")
>> What do you think?
> 
> Well, yes, X should always be a fallback option. But I said already when
> you suggested S that I can't judge about its use, so I guess I'm the
> wrong one to ask. Even more so that you only say "does not work", without
> any details ...
> 

The question is addressed to anyone familiar with arm inline assembly.
I added the arm maintainers as primary recipients to this email to make 
this perfectly clear.

When cross-compiling Xen on x86 for arm32 with
asm volatile ("mov sp,%0; b %1" : : "r" (stack), "S" (fn) : "memory" );
compilation fails with the error: impossible constraint in ‘asm'

-- 
Xenia

