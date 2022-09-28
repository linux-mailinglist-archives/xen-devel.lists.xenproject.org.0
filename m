Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9355EDE7F
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 16:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413353.656947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odXmf-0000UH-40; Wed, 28 Sep 2022 14:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413353.656947; Wed, 28 Sep 2022 14:11:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odXmf-0000SA-1O; Wed, 28 Sep 2022 14:11:33 +0000
Received: by outflank-mailman (input) for mailman id 413353;
 Wed, 28 Sep 2022 14:11:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e/gS=Z7=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1odXmd-0000S3-1u
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 14:11:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 678fe21a-3f37-11ed-9374-c1cf23e5d27e;
 Wed, 28 Sep 2022 16:11:11 +0200 (CEST)
Received: from [192.168.1.219] (unknown [151.29.53.149])
 by support.bugseng.com (Postfix) with ESMTPSA id 0572D4EE0785;
 Wed, 28 Sep 2022 16:11:24 +0200 (CEST)
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
X-Inumbo-ID: 678fe21a-3f37-11ed-9374-c1cf23e5d27e
Message-ID: <fa9f0067-e1ca-cd02-a7ee-9184f7c59ff9@bugseng.com>
Date: Wed, 28 Sep 2022 16:11:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.12) Gecko/20050929
 Thunderbird/1.0.7 Fedora/1.0.7-1.1.fc4 Mnenhy/0.7.3.0
Subject: Re: [PATCH 0/7] Fix MISRA C 2012 Rule 20.7 violations
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
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
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <12c95841-027b-ae02-1945-b0d232ffb17d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Xenia.  Please see below.

On 9/26/22 10:50, Xenia Ragiadakou wrote:
> On 9/18/22 16:02, Roberto Bagnara wrote:
>>> The question is on the interpretation of Rule 20.7. Are parenthesis
>>> required by Rule 20.7 in the following cases:
>>>
>>> - macro parameters used as function arguments
>>  > [...]
>>  > - macro parameter used as lhs in assignment
>>
>> You can obtain different semantics depending on whether parentheses
>> are or are not used (in the macro call and/or macro expansion
>> depending on the case):
>>
>>
>> #include <stdio.h>
>>
>> void g(int v) {
>>    printf("%d\n", v);
>> }
>>
>> #define m1(x, y, ...) g(y)
>>
>> void f1(int x, int y, ...) {
>>    g(y);
>> }
>>
>> #define p 0, 1
>>
>> void test1() {
>>    m1(p, 2);
>>    f1(p, 2);
>> }
>>
> 
> In the example above something bothers me. Let me explain.
> 
> Running the above example gives:
> 2
> 1
> 
> The results differ mainly because m1() is substituted before p.
> Thus, adding parentheses around the macro parameter 'y' of m1() i.e
> #define m1(x, y, ...) g((y))
> has no impact.
> 
> If the example is changed into the following:
> 
> #include <stdio.h>
> 
> void g(int v) {
>     printf("%d\n", v);
> }
> 
> #define m1(y, ...) g(y)
> 
> void f1(int y, ...) {
>     g(y);
> }
> 
> #define p 0, 1
> 
> void test1() {
>      m1(p, 2);
>      f1(p, 2);
> }
> 
> if no parentheses are added around 'y' in the definition of m1(), the compiler complains with "too many arguments to function g".
> If parentheses are added around 'y', the compiler does not complain but the behavior will still differ and the result will be
> 1
> 0
> 
> This happens because in the case of m1(), p is interpreted as an expression (due to the parentheses added there) and the comma is evaluated as a comma operator, while in f1(), p is interpreted as a list of expressions and the comma is evaluated as a comma separator.
> 
> Hence, in my opinion, parentheses should not be added around macro parameters used as function arguments because they can hide a bug due to missing parentheses around the entire macro definition.
> Since macro 'p' is supposed to represent an expression, and the semantics of the comma token are those of a comma operator and not a comma separator, then parentheses need to be placed around the entire macro definition i.e
> #define p (0, 1)

Your analysis is correct: the example was meant only to show that
the use of a macro or a function with the same actual parameters
and apparently equivalent bodies can make a difference and that the
addition of parentheses (around the body of p, as you suggest, or around
the occurrence of p in the call to f1()) can avoid this problem.
All this, however, is outside the scope of Rule 20.7, so the example
may have been confusing: sorry about that.

> AFAIK, there is no requirement in MISRA C guidelines to add parentheses around the entire macro definition when it is used as an expression and this is something I cannot understand.
> Unless I got it all wrong I guess ...

Yes, this is known and it is has also been brought to the attention of
the MISRA C working group.

> Can a deviation being added in the basis of C99 standard since according to the standard, E1[E2] is identical to (*((E1)+(E2))), and therefore, macro parameters used as subscript expressions are implicitly
> parenthesized and can be exempted from the rule.

Sure, you can always deviate any non-mandatory guideline: just be ware
of the fact that complying is often cheaper than deviating.

>> For instance, if you noticed Rule 20.7 reports given by
>> ECLAIR and not by cppcheck, then maybe line
>>
>> Rule 20.7              FP
>>
>> should be
>>
>> Rule 20.7              FN+FP
>>
>> If you can let me have an indication of the code that
>> ECLAIR is flagging for Rule 20.7 and cppcheck does not
>> flag, I will be happy to double-check.
> 
> ECLAIR flags as violations of Rule 20.7 the cases where unparenthesized macro parameters are used as (1) function arguments or (2) array indexes, while cppcheck does not.
> 
> For instance:
> (1) in xen/arch/arm/include/asm/atomic.h
> #define read_atomic(p) ({                                               \
>      union { typeof(*(p)) val; char c[0]; } x_;                          \
>      read_atomic_size(p, x_.c, sizeof(*(p)));                            \
>      x_.val;                                                             \
> })
> ECLAIR flags as violations missing parentheses around 'p', when used as an argument of read_atomic_size().

ECLAIR is right in reporting these violations of Rule 20.7;
these are false negatives of cppcheck.

> (2) in xen/arch/arm/arm64/cpufeature.c
> #define SANITIZE_REG(field, num, reg)  \
>      sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
>                   #reg, ftr_##reg)
> ECLAIR flags as violations missing parentheses around 'num'.

Same as above.

I am probably repeating myself, but the MISRA guidelines are the result
of carefully-chosen compromises between the simplicity of the guideline
and its ability to protect against the targeted bad thing.  As Rule 20.7
is required, any violation will have to be deviated by projects that
have MISRA-compliance among their objectives.
Kind regards,

   Roberto

>>> On Fri, 2 Sep 2022, Xenia Ragiadakou wrote:
>>>> On 9/2/22 05:07, Stefano Stabellini wrote:
>>>>> On Thu, 1 Sep 2022, Bertrand Marquis wrote:
>>>>>> Hi Xenia,
>>>>>>
>>>>>>> On 1 Sep 2022, at 10:27, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 9/1/22 01:35, Stefano Stabellini wrote:
>>>>>>>> Patches 1, 4, and 6 are already committed. I plan to commit patches 2,
>>>>>>>> 3
>>>>>>>> and 5 in the next couple of days.
>>>>>>>> Patch 7 needs further discussions and it is best addressed during the
>>>>>>>> next MISRA C sync-up.
>>>>>>>
>>>>>>> I would like to share here, before the next MISRA C sync, my
>>>>>>> understandings that will hopefully resolve a wrong impression of mine,
>>>>>>> that I may have spread around, regarding this rule.
>>>>>>> There was a misunderstanding regarding the rule 20.7 from my part and I
>>>>>>> think that Jan is absolutely right that parenthesizing macro parameters
>>>>>>> used as function arguments is not required by the rule.
>>>>>>>
>>>>>>> The rule 20.7 states "Expressions resulting from the expansion of macro
>>>>>>> parameters shall be enclosed in parentheses" and in the rationale of the
>>>>>>> rule states "If a macro parameter is not being used as an expression
>>>>>>> then the parentheses are not necessary because no operators are
>>>>>>> involved.".
>>>>>>>
>>>>>>> Initially, based on the title, my understanding was that it requires for
>>>>>>> the expression resulting from the expansion of the macro to be enclosed
>>>>>>> in parentheses. Then, based on the rule explanation and the examples
>>>>>>> given,  my understanding was that it requires the macro parameters that
>>>>>>> are used as expressions to be enclosed in parentheses.
>>>>>>> But, after re-thinking about it, the most probable and what makes more
>>>>>>> sense, is that it require parentheses around the macro parameters that
>>>>>>> are part of an expression and not around those that are used as
>>>>>>> expressions.
>>>>>>>
>>>>>>> Therefore, macro parameters being used as function arguments are not
>>>>>>> required to be enclosed in parentheses, because the function arguments
>>>>>>> are part of an expression list, not of an expression (comma is evaluated
>>>>>>> as separator, not as operator).
>>>>>>> While, macro parameters used as rhs and lhs expressions of the
>>>>>>> assignment operator are required to be enclosed in parentheses because
>>>>>>> they are part of an assignment expression.
>>>>>>>
>>>>>>> I verified that the violation reported by cppcheck is not due to missing
>>>>>>> parentheses around the function argument (though still I have not
>>>>>>> understood the origin of the warning). Also, Eclair does not report it.
>>>>>>>
>>>>>>> Hence, it was a misunderstanding of mine and there is no inconsistency,
>>>>>>> with respect to this rule, in adding parentheses around macro parameters
>>>>>>> used as rhs of assignments. The rule does not require adding parentheses
>>>>>>> around macro parameters used as function arguments and neither cppcheck
>>>>>>> nor Eclair report violation for missing parentheses around macro
>>>>>>> parameters used as function arguments.
>>>>>>
>>>>>>
>>>>>> Thanks a lot for the detailed explanation :-)
>>>>>>
>>>>>> What you say does make sense and I agree with your analysis here, only
>>>>>> protect when part of an expression and not use as a subsequent parameter
>>>>>> (for a function or an other macro).
>>>>>
>>>>> Yeah I also agree with your analysis, and many thanks for
>>>>> double-checking the cppcheck and Eclair's reports.
>>>>
>>>> Unfortunately in the specific case that I checked, it was not reported because
>>>> it was actually an argument to a macro, not a function.
>>>> Eclair does report as violations of Rule 20.7 the macro parameters that are
>>>> used as function arguments and are not enclosed in parentheses.
>>>>
>>>> So, one tool reports it as violation and the other one not.
>>>>
>>>> The same goes, also, for the case where a macro parameter is used as index to
>>>> an array. Eclair reports it as violation while cppcheck does not.
>>>
> 

