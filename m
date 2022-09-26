Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5255E9C79
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 10:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411509.654452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocjp9-0000Bd-Tx; Mon, 26 Sep 2022 08:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411509.654452; Mon, 26 Sep 2022 08:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocjp9-00008E-Pw; Mon, 26 Sep 2022 08:50:47 +0000
Received: by outflank-mailman (input) for mailman id 411509;
 Mon, 26 Sep 2022 08:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cgUl=Z5=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1ocjp8-000088-6j
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 08:50:46 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47debb80-3d78-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 10:50:33 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id z13so12535940ejp.6
 for <xen-devel@lists.xenproject.org>; Mon, 26 Sep 2022 01:50:44 -0700 (PDT)
Received: from [192.168.1.93] (adsl-75.176.58.241.tellas.gr. [176.58.241.75])
 by smtp.gmail.com with ESMTPSA id
 bp24-20020a170907919800b0073c74bee6eesm7741593ejb.201.2022.09.26.01.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 01:50:43 -0700 (PDT)
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
X-Inumbo-ID: 47debb80-3d78-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=A0qgMDFYsoa78aA3RsU1HvtNp2lW2GL4Em7N6j4qBc4=;
        b=X0QK+lUFovTPaojtKjqx5bk6BFUz//9pOxKjK1AHurcZNPBVop/odOew3rKj7XSwkJ
         SQml1FB6JVmSeypmp1LLp66+cDodVmrK13J3N9VkcA4J9O/43ATOPM9b8du8IzHPtSJ9
         Dibyhz0GXizUPt2KxZg0IcCXykKY27YwnQqNedSiXajbwrGqJCX2yuN6/Ofayq71Z6FP
         3k9FybM4OoGQuF8QTVnUnEXrEtaimorqOysbQCzSA3bA71JFOk96pxowE0qw60UiB8C7
         CT7r+wmkCC8d8SnUspAx0XNNaYFQ+mcmm0uqBliaWoUvpOOfJ8xOcgpSxfiPFGCdZ2Pz
         vzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=A0qgMDFYsoa78aA3RsU1HvtNp2lW2GL4Em7N6j4qBc4=;
        b=fLKIOKZJY93x4/8HaHewaL4e9dCyDoTRAdYzxd1WA/xehxQ7699jjWqSF2rL007nJs
         ApN5bnQ9hWX1jxtjutyjI/ij83Wl1U7Br433PIi5404YHnGlU6Ib8sg5a2ZCHFdQLvjx
         Kef2e0/ISeKrL8GdN3j7TXd6KJU9uu80i9fdy45zdgxElBgSRxQAQUOdtiWynvftgTCs
         OwQHdyhngHZBlNTDy8a6AWJaMJrGbLTRCr4vt2bariaeU7nPluoVmFSA/axz00K9t/OG
         /wqvzD98zL6PrlyyyMjOI5G5C+qMx3h5Hl4PYv5+FaRwmQ+FUXksDlvFXC8F/PDFc/HP
         ut9w==
X-Gm-Message-State: ACrzQf0HBHsqldlBH+uyr/mzt0VnPA4X64sVK92xXwoz4/kaXRsDb13P
	NSSqfIQJHWewE+zvFJFvxb+Zt5oyrqk=
X-Google-Smtp-Source: AMsMyM4JCj0OnnfH1fU1gRqo5WR8xr4Bpfpd8DOHSyzQ/hTJobMdtWcAoz1SWVQ0rDYuGZ1xk/hscg==
X-Received: by 2002:a17:907:7245:b0:782:331b:60f4 with SMTP id ds5-20020a170907724500b00782331b60f4mr17724303ejc.594.1664182243719;
        Mon, 26 Sep 2022 01:50:43 -0700 (PDT)
Message-ID: <12c95841-027b-ae02-1945-b0d232ffb17d@gmail.com>
Date: Mon, 26 Sep 2022 11:50:41 +0300
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
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <e2046144-48ec-2d8e-62d4-88ca1cb3aeb4@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roberto,

On 9/18/22 16:02, Roberto Bagnara wrote:
> On 03/09/22 02:52, Stefano Stabellini wrote:
>> +Roberto
>>
>> I think we need Roberto's advice on Rule 20.7. (Full thread below.)
> 
> Hi there, sorry for the delay: I missed this message.
> Please see below, where I took the freedom of rearranging the
> cases.
> 
>> The question is on the interpretation of Rule 20.7. Are parenthesis
>> required by Rule 20.7 in the following cases:
>>
>> - macro parameters used as function arguments
>  > [...]
>  > - macro parameter used as lhs in assignment
> 
> You can obtain different semantics depending on whether parentheses
> are or are not used (in the macro call and/or macro expansion
> depending on the case):
> 
> 
> #include <stdio.h>
> 
> void g(int v) {
>    printf("%d\n", v);
> }
> 
> #define m1(x, y, ...) g(y)
> 
> void f1(int x, int y, ...) {
>    g(y);
> }
> 
> #define p 0, 1
> 
> void test1() {
>    m1(p, 2);
>    f1(p, 2);
> }
> 

In the example above something bothers me. Let me explain.

Running the above example gives:
2
1

The results differ mainly because m1() is substituted before p.
Thus, adding parentheses around the macro parameter 'y' of m1() i.e
#define m1(x, y, ...) g((y))
has no impact.

If the example is changed into the following:

#include <stdio.h>

void g(int v) {
    printf("%d\n", v);
}

#define m1(y, ...) g(y)

void f1(int y, ...) {
    g(y);
}

#define p 0, 1

void test1() {
     m1(p, 2);
     f1(p, 2);
}

if no parentheses are added around 'y' in the definition of m1(), the 
compiler complains with "too many arguments to function g".
If parentheses are added around 'y', the compiler does not complain but 
the behavior will still differ and the result will be
1
0

This happens because in the case of m1(), p is interpreted as an 
expression (due to the parentheses added there) and the comma is 
evaluated as a comma operator, while in f1(), p is interpreted as a list 
of expressions and the comma is evaluated as a comma separator.

Hence, in my opinion, parentheses should not be added around macro 
parameters used as function arguments because they can hide a bug due to 
missing parentheses around the entire macro definition.
Since macro 'p' is supposed to represent an expression, and the 
semantics of the comma token are those of a comma operator and not a 
comma separator, then parentheses need to be placed around the entire 
macro definition i.e
#define p (0, 1)

AFAIK, there is no requirement in MISRA C guidelines to add parentheses 
around the entire macro definition when it is used as an expression and 
this is something I cannot understand.
Unless I got it all wrong I guess ...

> #define m4(x) x = 4
> 
> void f4(int &x) {
>    x = 4;
> }
> 
> 
> void test4() {
>    int y;
>    int z;
>    z = 3;
>    m4(y = z);
>    printf("%d\n", z);
>    z = 3;
>    f4(y = z);
>    printf("%d\n", z);
> }
> 
> int main() {
>    test1();
>    test4();
> }
> 
>> - macro parameters used as macro arguments
> 
> Please note that Rule 20.7 depends on the final expansion:
> so whether parentheses are or are not used in a certain
> macro body is irrelevant, the point being that, at the
> end of all expansions, expressions resulting from the
> expansion of macro parameters are enclosed in parentheses.
> 
>> - macro parameter used as array index
> 
> This is safe today, but my understanding is that in C++23
> the [] operator will accept more than one expression.
> A similar change might (who knows?) be considered for C26
> or even offered before (intentionally or by mistake) by some
> C compiler.
> 

Can a deviation being added in the basis of C99 standard since according 
to the standard, E1[E2] is identical to (*((E1)+(E2))), and therefore, 
macro parameters used as subscript expressions are implicitly
parenthesized and can be exempted from the rule.


>> Some of these cases are interesting because they should function
>> correctly even without parenthesis, hence the discussion. In particular
>> parenthesis don't seem necessary at least for the function argument
>> case.
> 
> This is not the right spirit for MISRA compliance: why would you want
> splitting hairs when inserting a pair of parentheses is so easy?
> C and C++ are very complex languages, and the MISRA coding standards
> are the result of a (very difficult!) compromise between simplicity
> and effectiveness: rules that are exactly targeted to all and only all
> the problematic instances would be very difficult to express and to 
> remember.
> So, yes: in many cases you might spend time to demonstrate that a 
> particular
> (real) MISRA violation does not imply the existence of a real issue,
> but this time is not well spent.  Critical code must be boring and 
> obviously
> right, in the sense that whomever is reading the code should not be
> distracted by thoughts like "there are no parentheses here: am I sure
> nothing bad can happen?"
> 
>> Regardless of the MISRA C interpretation, Xenia noticed that Eclair
>> reports violations on these cases (cppcheck does not, I don't know other
>> checkers).
> 
> I am not aware of any false positives (or flse negatives) for the
> current version of ECLAIR on Rule 20.7.  Nonetheless, ECLAIR can
> be configured to selectively deviate on each of the cases mentioned
> above by means of checker configuration.  However, as I said,
> it only makes sense deviating the rule in the cases where you are
> not allowed to add the parentheses (e.g., because both the macro
> definition and the macro invocations are in legacy code you are
> not allowed to touch).
> 
> In contrast, cppcheck is no more than a toy when MISRA compliance
> is concerned.  It claims to support 153 out of 175 MISRA C:2012 guidelines.
> For 103 of those 153 it has a significant number of false negatives (FN)
> and false positives (FP).  I recently participated to an evaluation
> of cppcheck 2.8 and here is a summary I can disclose:
> 
> Rule 1.3               FP
> Rule 2.1               FN
> Rule 2.2               FN+FP
> Rule 2.4               FN+FP
> Rule 2.5               FP
> Rule 2.7               FP
> Rule 3.2               FN
> Rule 4.2               FN
> Rule 5.1               FP
> Rule 5.3               FN
> Rule 5.6               FN+FP
> Rule 5.7               FN+FP
> Rule 5.8               FN+FP
> Rule 5.9               FN+FP
> Rule 6.1               FN+FP
> Rule 7.1               FN
> Rule 7.3               FN
> Rule 7.4               FN+FP
> Rule 8.1               FN
> Rule 8.2               FN+FP
> Rule 8.3               FN
> Rule 8.4               FP
> Rule 8.5               FN+FP
> Rule 8.6               FP
> Rule 8.7               FN
> Rule 8.8               FN
> Rule 8.9               FN
> Rule 8.10              FN
> Rule 8.13              FN
> Rule 8.14              FP
> Rule 9.1               FN+FP
> Rule 9.3               FN
> Rule 10.1              FN
> Rule 10.2              FN
> Rule 10.3              FN+FP
> Rule 10.4              FP
> Rule 10.5              FN+FP
> Rule 10.6              FP
> Rule 10.7              FN+FP
> Rule 10.8              FP
> Rule 11.1              FN+FP
> Rule 11.2              FN
> Rule 11.3              FN+FP
> Rule 11.4              FP
> Rule 11.5              FP
> Rule 11.7              FN
> Rule 11.8              FN+FP
> Rule 11.9              FN
> Rule 12.1              FN
> Rule 12.2              FP
> Rule 12.3              FP
> Rule 13.1              FN
> Rule 13.2              FN
> Rule 13.4              FP
> Rule 13.5              FN
> Rule 13.6              FP
> Rule 14.2              FN
> Rule 14.3              FN
> Rule 15.5              FN+FP
> Rule 15.6              FN+FP
> Rule 16.1              FN
> Rule 16.3              FN
> Rule 16.6              FP
> Rule 16.7              FP
> Rule 17.1              FP
> Rule 17.2              FN+FP
> Rule 17.4              FN
> Rule 17.5              FN
> Rule 17.7              FP
> Rule 18.1              FN
> Rule 18.3              FN
> Rule 18.4              FP
> Rule 19.1              FN
> Rule 19.2              FP
> Rule 20.2              FN
> Rule 20.4              FP
> Rule 20.5              FN
> Rule 20.7              FP
> Rule 20.9              FN
> Rule 20.10             FP
> Rule 20.12             FP
> Rule 21.1              FN+FP
> Rule 21.2              FN
> Rule 21.3              FP
> Rule 21.6              FP
> Rule 21.8              FN+FP
> Rule 21.12             FN
> Rule 21.13             FP
> Rule 21.14             FN
> Rule 21.15             FN
> Rule 21.16             FN+FP
> Rule 21.17             FN
> Rule 21.18             FN
> Rule 21.19             FN
> Rule 21.20             FN
> Rule 22.1              FP
> Rule 22.2              FN+FP
> Rule 22.5              FN
> Rule 22.6              FN
> Rule 22.7              FN
> Rule 22.8              FN+FP
> Rule 22.9              FN+FP
> Rule 22.10             FP
> 
> These results are clearly relative to the testsuite employed:
> while very large, it cannot of course reach 100% coverage.
> For instance, if you noticed Rule 20.7 reports given by
> ECLAIR and not by cppcheck, then maybe line
> 
> Rule 20.7              FP
> 
> should be
> 
> Rule 20.7              FN+FP
> 
> If you can let me have an indication of the code that
> ECLAIR is flagging for Rule 20.7 and cppcheck does not
> flag, I will be happy to double-check.

ECLAIR flags as violations of Rule 20.7 the cases where unparenthesized 
macro parameters are used as (1) function arguments or (2) array 
indexes, while cppcheck does not.

For instance:
(1) in xen/arch/arm/include/asm/atomic.h
#define read_atomic(p) ({                                               \
     union { typeof(*(p)) val; char c[0]; } x_;                          \
     read_atomic_size(p, x_.c, sizeof(*(p)));                            \
     x_.val;                                                             \
})
ECLAIR flags as violations missing parentheses around 'p', when used as 
an argument of read_atomic_size().

(2) in xen/arch/arm/arm64/cpufeature.c
#define SANITIZE_REG(field, num, reg)  \
	sanitize_reg(&system_cpuinfo.field.bits[num], new->field.bits[num], \
				 #reg, ftr_##reg)
ECLAIR flags as violations missing parentheses around 'num'.

> 
> While the sheer amount of false negatives of cppcheck 2.8 precludes
> its use for safety-related development, the many false positives
> are also a big problem: people will waste time investigating
> them and, unless they have been properly trained on the
> MISRA guidelines so as to be able to recognize false positives,
> they might be tempted to change the code when there is no
> reason to do so.  When the latter thing happens, code quality
> will typically decrease.
> 
> Kind regards,
> 
>     Roberto
> 
>> On Fri, 2 Sep 2022, Xenia Ragiadakou wrote:
>>> On 9/2/22 05:07, Stefano Stabellini wrote:
>>>> On Thu, 1 Sep 2022, Bertrand Marquis wrote:
>>>>> Hi Xenia,
>>>>>
>>>>>> On 1 Sep 2022, at 10:27, Xenia Ragiadakou <burzalodowa@gmail.com> 
>>>>>> wrote:
>>>>>>
>>>>>>
>>>>>> On 9/1/22 01:35, Stefano Stabellini wrote:
>>>>>>> Patches 1, 4, and 6 are already committed. I plan to commit 
>>>>>>> patches 2,
>>>>>>> 3
>>>>>>> and 5 in the next couple of days.
>>>>>>> Patch 7 needs further discussions and it is best addressed during 
>>>>>>> the
>>>>>>> next MISRA C sync-up.
>>>>>>
>>>>>> I would like to share here, before the next MISRA C sync, my
>>>>>> understandings that will hopefully resolve a wrong impression of 
>>>>>> mine,
>>>>>> that I may have spread around, regarding this rule.
>>>>>> There was a misunderstanding regarding the rule 20.7 from my part 
>>>>>> and I
>>>>>> think that Jan is absolutely right that parenthesizing macro 
>>>>>> parameters
>>>>>> used as function arguments is not required by the rule.
>>>>>>
>>>>>> The rule 20.7 states "Expressions resulting from the expansion of 
>>>>>> macro
>>>>>> parameters shall be enclosed in parentheses" and in the rationale 
>>>>>> of the
>>>>>> rule states "If a macro parameter is not being used as an expression
>>>>>> then the parentheses are not necessary because no operators are
>>>>>> involved.".
>>>>>>
>>>>>> Initially, based on the title, my understanding was that it 
>>>>>> requires for
>>>>>> the expression resulting from the expansion of the macro to be 
>>>>>> enclosed
>>>>>> in parentheses. Then, based on the rule explanation and the examples
>>>>>> given,  my understanding was that it requires the macro parameters 
>>>>>> that
>>>>>> are used as expressions to be enclosed in parentheses.
>>>>>> But, after re-thinking about it, the most probable and what makes 
>>>>>> more
>>>>>> sense, is that it require parentheses around the macro parameters 
>>>>>> that
>>>>>> are part of an expression and not around those that are used as
>>>>>> expressions.
>>>>>>
>>>>>> Therefore, macro parameters being used as function arguments are not
>>>>>> required to be enclosed in parentheses, because the function 
>>>>>> arguments
>>>>>> are part of an expression list, not of an expression (comma is 
>>>>>> evaluated
>>>>>> as separator, not as operator).
>>>>>> While, macro parameters used as rhs and lhs expressions of the
>>>>>> assignment operator are required to be enclosed in parentheses 
>>>>>> because
>>>>>> they are part of an assignment expression.
>>>>>>
>>>>>> I verified that the violation reported by cppcheck is not due to 
>>>>>> missing
>>>>>> parentheses around the function argument (though still I have not
>>>>>> understood the origin of the warning). Also, Eclair does not 
>>>>>> report it.
>>>>>>
>>>>>> Hence, it was a misunderstanding of mine and there is no 
>>>>>> inconsistency,
>>>>>> with respect to this rule, in adding parentheses around macro 
>>>>>> parameters
>>>>>> used as rhs of assignments. The rule does not require adding 
>>>>>> parentheses
>>>>>> around macro parameters used as function arguments and neither 
>>>>>> cppcheck
>>>>>> nor Eclair report violation for missing parentheses around macro
>>>>>> parameters used as function arguments.
>>>>>
>>>>>
>>>>> Thanks a lot for the detailed explanation :-)
>>>>>
>>>>> What you say does make sense and I agree with your analysis here, only
>>>>> protect when part of an expression and not use as a subsequent 
>>>>> parameter
>>>>> (for a function or an other macro).
>>>>
>>>> Yeah I also agree with your analysis, and many thanks for
>>>> double-checking the cppcheck and Eclair's reports.
>>>
>>> Unfortunately in the specific case that I checked, it was not 
>>> reported because
>>> it was actually an argument to a macro, not a function.
>>> Eclair does report as violations of Rule 20.7 the macro parameters 
>>> that are
>>> used as function arguments and are not enclosed in parentheses.
>>>
>>> So, one tool reports it as violation and the other one not.
>>>
>>> The same goes, also, for the case where a macro parameter is used as 
>>> index to
>>> an array. Eclair reports it as violation while cppcheck does not.
>>

-- 
Xenia

