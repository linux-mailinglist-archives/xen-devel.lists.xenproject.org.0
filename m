Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 361ED5EF632
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 15:14:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413777.657662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtMo-0002NM-Fg; Thu, 29 Sep 2022 13:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413777.657662; Thu, 29 Sep 2022 13:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odtMo-0002Kv-Cj; Thu, 29 Sep 2022 13:14:18 +0000
Received: by outflank-mailman (input) for mailman id 413777;
 Thu, 29 Sep 2022 13:14:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oNWE=2A=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1odtMm-0002Kk-Qv
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 13:14:17 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dd91064-3ff8-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 15:14:15 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id a13so1961656edj.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Sep 2022 06:14:15 -0700 (PDT)
Received: from [192.168.1.93] (adsl-75.176.58.241.tellas.gr. [176.58.241.75])
 by smtp.gmail.com with ESMTPSA id
 d23-20020aa7d697000000b00456ff7d4283sm1556637edr.5.2022.09.29.06.14.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 06:14:14 -0700 (PDT)
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
X-Inumbo-ID: 9dd91064-3ff8-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=y4mGqivhiQmUV8ipfVZW3SYpSuTWtk+iojxfx05uBbA=;
        b=FeE41N8AaAWMAXhdBjoSeQOcB8/xkRu6HTMlCOkbSfaYahZIwIKAkLcasU247vxR3M
         Z41oGs452qlua62bLO7xGiKH7ZL6zJc9w+7Qp/maRR/soZ6vrRxoTrrptI28WjWfQhbM
         /SiHNJygLFybZehB9gLtSm3ylOPXKojFMoXX9Po5iyDJzi3EToz/Mb03EGOjs/WPbEiW
         ug7yHZNtRpRJg+B3Bw9TWmEPOvpt6kcT5nNCrMY5lXPVCokyZD77oBY8ng1U4yS3hYKw
         4N6LbvDb902I01pXgCbsu+Hlsq1IslL4/KR3B4B8GLZN9fveo6dDRr4yKceAQS+4OPCp
         jtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=y4mGqivhiQmUV8ipfVZW3SYpSuTWtk+iojxfx05uBbA=;
        b=cIxmDrVzKB8kq1FjquVmR/kB86vGUkLn24D5h3FeNBNrNROjIwLTolZZ+94MIyYnmo
         leU6OL9mvU4HRFRfBB/wwlYwHKAc+XwbrxlAFMMe53xLj/71KDAKA3ewFylOTDW6hBTn
         1tN8pL/8RaivUR6PnYkb2t6fR7T6unS808j+DklgjgfnjS7vqNH+CtvKbpGBVdTn4j4C
         9Udepr96c1te6MdkDco21g9d33Bbg79lD8PfBVxifrTNVA4oj2R9cXMx5ZHnCDc+Ksyg
         9aS+eM1SRfGK9nFincBJK7SFGlOXozOgYOwL6jE7W8BNvSGjV4u2Ncg/UQxZFyNPxLUb
         rTOg==
X-Gm-Message-State: ACrzQf0P/IetgAkHULjYqTljD/4N4dQ+H/fuilT2wCE7YUkztI4wqjkY
	wbVA4g6qs/8axIGCoTHhTrM=
X-Google-Smtp-Source: AMsMyM7hB9flUAQunU1fNM6208XFtFZd5WDG0e5dt8N/E7ctFXeaztsdgmE66YaVlZj7zVHwlzUIWA==
X-Received: by 2002:a05:6402:1e8d:b0:441:58db:b6a2 with SMTP id f13-20020a0564021e8d00b0044158dbb6a2mr3203163edf.277.1664457254593;
        Thu, 29 Sep 2022 06:14:14 -0700 (PDT)
Message-ID: <4336e65e-23a7-9b8e-3548-55b06d0203ec@gmail.com>
Date: Thu, 29 Sep 2022 16:14:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/7] Fix MISRA C 2012 Rule 20.7 violations
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2208311534070.2375071@ubuntu-linux-20-04-desktop>
 <44eb89f1-67db-6232-e28f-ab380e71b9fc@gmail.com>
 <6A69A0CA-087F-4260-9371-8EEEAD3926A3@arm.com>
 <alpine.DEB.2.22.394.2209011904571.3931@ubuntu-linux-20-04-desktop>
 <422ad42f-8bfa-55a9-2e70-4ae857632a94@gmail.com>
 <alpine.DEB.2.22.394.2209021743150.3931@ubuntu-linux-20-04-desktop>
 <e2046144-48ec-2d8e-62d4-88ca1cb3aeb4@bugseng.com>
 <12c95841-027b-ae02-1945-b0d232ffb17d@gmail.com>
 <fa9f0067-e1ca-cd02-a7ee-9184f7c59ff9@bugseng.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <fa9f0067-e1ca-cd02-a7ee-9184f7c59ff9@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roberto,

On 9/28/22 17:11, Roberto Bagnara wrote:
> On 9/26/22 10:50, Xenia Ragiadakou wrote:
>> On 9/18/22 16:02, Roberto Bagnara wrote:
>>>> The question is on the interpretation of Rule 20.7. Are parenthesis
>>>> required by Rule 20.7 in the following cases:
>>>>
>>>> - macro parameters used as function arguments
>>>  > [...]
>>>  > - macro parameter used as lhs in assignment
>>>
>>> You can obtain different semantics depending on whether parentheses
>>> are or are not used (in the macro call and/or macro expansion
>>> depending on the case):
>>>
>>>
>>> #include <stdio.h>
>>>
>>> void g(int v) {
>>>    printf("%d\n", v);
>>> }
>>>
>>> #define m1(x, y, ...) g(y)
>>>
>>> void f1(int x, int y, ...) {
>>>    g(y);
>>> }
>>>
>>> #define p 0, 1
>>>
>>> void test1() {
>>>    m1(p, 2);
>>>    f1(p, 2);
>>> }
>>>
>>
>> In the example above something bothers me. Let me explain.
>>
>> Running the above example gives:
>> 2
>> 1
>>
>> The results differ mainly because m1() is substituted before p.
>> Thus, adding parentheses around the macro parameter 'y' of m1() i.e
>> #define m1(x, y, ...) g((y))
>> has no impact.
>>
>> If the example is changed into the following:
>>
>> #include <stdio.h>
>>
>> void g(int v) {
>>     printf("%d\n", v);
>> }
>>
>> #define m1(y, ...) g(y)
>>
>> void f1(int y, ...) {
>>     g(y);
>> }
>>
>> #define p 0, 1
>>
>> void test1() {
>>      m1(p, 2);
>>      f1(p, 2);
>> }
>>
>> if no parentheses are added around 'y' in the definition of m1(), the 
>> compiler complains with "too many arguments to function g".
>> If parentheses are added around 'y', the compiler does not complain 
>> but the behavior will still differ and the result will be
>> 1
>> 0
>>
>> This happens because in the case of m1(), p is interpreted as an 
>> expression (due to the parentheses added there) and the comma is 
>> evaluated as a comma operator, while in f1(), p is interpreted as a 
>> list of expressions and the comma is evaluated as a comma separator.
>>
>> Hence, in my opinion, parentheses should not be added around macro 
>> parameters used as function arguments because they can hide a bug due 
>> to missing parentheses around the entire macro definition.
>> Since macro 'p' is supposed to represent an expression, and the 
>> semantics of the comma token are those of a comma operator and not a 
>> comma separator, then parentheses need to be placed around the entire 
>> macro definition i.e
>> #define p (0, 1)
> 
> Your analysis is correct: the example was meant only to show that
> the use of a macro or a function with the same actual parameters
> and apparently equivalent bodies can make a difference and that the
> addition of parentheses (around the body of p, as you suggest, or around
> the occurrence of p in the call to f1()) can avoid this problem.
> All this, however, is outside the scope of Rule 20.7, so the example
> may have been confusing: sorry about that.
> 
>> AFAIK, there is no requirement in MISRA C guidelines to add 
>> parentheses around the entire macro definition when it is used as an 
>> expression and this is something I cannot understand.
>> Unless I got it all wrong I guess ...
> 
> Yes, this is known and it is has also been brought to the attention of
> the MISRA C working group.
> 
>> Can a deviation being added in the basis of C99 standard since 
>> according to the standard, E1[E2] is identical to (*((E1)+(E2))), and 
>> therefore, macro parameters used as subscript expressions are implicitly
>> parenthesized and can be exempted from the rule.
> 
> Sure, you can always deviate any non-mandatory guideline: just be ware
> of the fact that complying is often cheaper than deviating.
> 
>>> For instance, if you noticed Rule 20.7 reports given by
>>> ECLAIR and not by cppcheck, then maybe line
>>>
>>> Rule 20.7              FP
>>>
>>> should be
>>>
>>> Rule 20.7              FN+FP
>>>
>>> If you can let me have an indication of the code that
>>> ECLAIR is flagging for Rule 20.7 and cppcheck does not
>>> flag, I will be happy to double-check.
>>
>> ECLAIR flags as violations of Rule 20.7 the cases where 
>> unparenthesized macro parameters are used as (1) function arguments or 
>> (2) array indexes, while cppcheck does not.
>>
>> For instance:
>> (1) in xen/arch/arm/include/asm/atomic.h
>> #define read_atomic(p) ({                                               \
>>      union { typeof(*(p)) val; char c[0]; } 
>> x_;                          \
>>      read_atomic_size(p, x_.c, 
>> sizeof(*(p)));                            \
>>      
>> x_.val;                                                             \
>> })
>> ECLAIR flags as violations missing parentheses around 'p', when used 
>> as an argument of read_atomic_size().
> 
> ECLAIR is right in reporting these violations of Rule 20.7;
> these are false negatives of cppcheck.
>

AFAIU, the rationale of Rule 20.7 is to ensure that the precedence of 
the expression, produced after the macro parameter expansion, will be 
higher (a parenthesized expression is a primary expression and has the 
highest precedence) than the precedence of any operator performed on 
that expression after the substitution.
These two examples refer to cases where either no operator is applied to 
the expression or the applied operator precedence is the lowest possible 
(comma operator) and for this reason the rationale of the guideline may 
be considered insufficient to justify the need of parentheses.
I guess, that ECLAIR flags the above as violations because there is no 
formal exemption in the body of the rule.
Cppcheck intentionally considers those cases compliant but unfortunately 
there is no justification in the commit messages of the respective changes.

>> (2) in xen/arch/arm/arm64/cpufeature.c
>> #define SANITIZE_REG(field, num, reg)  \
>>      sanitize_reg(&system_cpuinfo.field.bits[num], 
>> new->field.bits[num], \
>>                   #reg, ftr_##reg)
>> ECLAIR flags as violations missing parentheses around 'num'.
> 
> Same as above.
> 
> I am probably repeating myself, but the MISRA guidelines are the result
> of carefully-chosen compromises between the simplicity of the guideline
> and its ability to protect against the targeted bad thing.As Rule 20.7
> is required, any violation will have to be deviated by projects that
> have MISRA-compliance among their objectives.

There are two things that have come to my attention and may cause 
confusion around Rule 20.7. They may have also been brought to the 
attention of the MISRA C working group.

1) Rule 12.1 (Advisory), which suggests the use of parentheses to make 
operator precedence explicit, does not require the operands of a comma 
operator/separator to be parenthesized because it recognizes that 
overuse of parentheses can clutter the code.
Since both Rules 20.7 and 12.1 aim to address basically the same issue, 
why they are not aligned?

2) Rule 20.7 maps to the CERT-C Rule PRE01 which has a formal exemption 
(PRE01-C-EX1) for the above case. Maybe this sounds irrelevant but it 
struck me as odd.

I forgot in my previous email to thank you for your help that it's 
really much appreciated and needed. Thanks a lot.

> Kind regards,
> 
>    Roberto
> 
>>>> On Fri, 2 Sep 2022, Xenia Ragiadakou wrote:
>>>>> On 9/2/22 05:07, Stefano Stabellini wrote:
>>>>>> On Thu, 1 Sep 2022, Bertrand Marquis wrote:
>>>>>>> Hi Xenia,
>>>>>>>
>>>>>>>> On 1 Sep 2022, at 10:27, Xenia Ragiadakou 
>>>>>>>> <burzalodowa@gmail.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 9/1/22 01:35, Stefano Stabellini wrote:
>>>>>>>>> Patches 1, 4, and 6 are already committed. I plan to commit 
>>>>>>>>> patches 2,
>>>>>>>>> 3
>>>>>>>>> and 5 in the next couple of days.
>>>>>>>>> Patch 7 needs further discussions and it is best addressed 
>>>>>>>>> during the
>>>>>>>>> next MISRA C sync-up.
>>>>>>>>
>>>>>>>> I would like to share here, before the next MISRA C sync, my
>>>>>>>> understandings that will hopefully resolve a wrong impression of 
>>>>>>>> mine,
>>>>>>>> that I may have spread around, regarding this rule.
>>>>>>>> There was a misunderstanding regarding the rule 20.7 from my 
>>>>>>>> part and I
>>>>>>>> think that Jan is absolutely right that parenthesizing macro 
>>>>>>>> parameters
>>>>>>>> used as function arguments is not required by the rule.
>>>>>>>>
>>>>>>>> The rule 20.7 states "Expressions resulting from the expansion 
>>>>>>>> of macro
>>>>>>>> parameters shall be enclosed in parentheses" and in the 
>>>>>>>> rationale of the
>>>>>>>> rule states "If a macro parameter is not being used as an 
>>>>>>>> expression
>>>>>>>> then the parentheses are not necessary because no operators are
>>>>>>>> involved.".
>>>>>>>>
>>>>>>>> Initially, based on the title, my understanding was that it 
>>>>>>>> requires for
>>>>>>>> the expression resulting from the expansion of the macro to be 
>>>>>>>> enclosed
>>>>>>>> in parentheses. Then, based on the rule explanation and the 
>>>>>>>> examples
>>>>>>>> given,  my understanding was that it requires the macro 
>>>>>>>> parameters that
>>>>>>>> are used as expressions to be enclosed in parentheses.
>>>>>>>> But, after re-thinking about it, the most probable and what 
>>>>>>>> makes more
>>>>>>>> sense, is that it require parentheses around the macro 
>>>>>>>> parameters that
>>>>>>>> are part of an expression and not around those that are used as
>>>>>>>> expressions.
>>>>>>>>
>>>>>>>> Therefore, macro parameters being used as function arguments are 
>>>>>>>> not
>>>>>>>> required to be enclosed in parentheses, because the function 
>>>>>>>> arguments
>>>>>>>> are part of an expression list, not of an expression (comma is 
>>>>>>>> evaluated
>>>>>>>> as separator, not as operator).
>>>>>>>> While, macro parameters used as rhs and lhs expressions of the
>>>>>>>> assignment operator are required to be enclosed in parentheses 
>>>>>>>> because
>>>>>>>> they are part of an assignment expression.
>>>>>>>>
>>>>>>>> I verified that the violation reported by cppcheck is not due to 
>>>>>>>> missing
>>>>>>>> parentheses around the function argument (though still I have not
>>>>>>>> understood the origin of the warning). Also, Eclair does not 
>>>>>>>> report it.
>>>>>>>>
>>>>>>>> Hence, it was a misunderstanding of mine and there is no 
>>>>>>>> inconsistency,
>>>>>>>> with respect to this rule, in adding parentheses around macro 
>>>>>>>> parameters
>>>>>>>> used as rhs of assignments. The rule does not require adding 
>>>>>>>> parentheses
>>>>>>>> around macro parameters used as function arguments and neither 
>>>>>>>> cppcheck
>>>>>>>> nor Eclair report violation for missing parentheses around macro
>>>>>>>> parameters used as function arguments.
>>>>>>>
>>>>>>>
>>>>>>> Thanks a lot for the detailed explanation :-)
>>>>>>>
>>>>>>> What you say does make sense and I agree with your analysis here, 
>>>>>>> only
>>>>>>> protect when part of an expression and not use as a subsequent 
>>>>>>> parameter
>>>>>>> (for a function or an other macro).
>>>>>>
>>>>>> Yeah I also agree with your analysis, and many thanks for
>>>>>> double-checking the cppcheck and Eclair's reports.
>>>>>
>>>>> Unfortunately in the specific case that I checked, it was not 
>>>>> reported because
>>>>> it was actually an argument to a macro, not a function.
>>>>> Eclair does report as violations of Rule 20.7 the macro parameters 
>>>>> that are
>>>>> used as function arguments and are not enclosed in parentheses.
>>>>>
>>>>> So, one tool reports it as violation and the other one not.
>>>>>
>>>>> The same goes, also, for the case where a macro parameter is used 
>>>>> as index to
>>>>> an array. Eclair reports it as violation while cppcheck does not.
>>>>
>>

-- 
Xenia

