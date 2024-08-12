Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F5094F1A6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 17:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775660.1185887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdWxL-0000Yk-MV; Mon, 12 Aug 2024 15:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775660.1185887; Mon, 12 Aug 2024 15:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdWxL-0000W0-Jf; Mon, 12 Aug 2024 15:27:35 +0000
Received: by outflank-mailman (input) for mailman id 775660;
 Mon, 12 Aug 2024 15:27:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y4aN=PL=bugseng.com=roberto.bagnara@srs-se1.protection.inumbo.net>)
 id 1sdWxJ-0000Vu-GB
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 15:27:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63d8c3e6-58bf-11ef-8776-851b0ebba9a2;
 Mon, 12 Aug 2024 17:27:31 +0200 (CEST)
Received: from [192.168.68.54] (unknown [78.211.194.87])
 by support.bugseng.com (Postfix) with ESMTPSA id ED2E24EE0757;
 Mon, 12 Aug 2024 17:27:28 +0200 (CEST)
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
X-Inumbo-ID: 63d8c3e6-58bf-11ef-8776-851b0ebba9a2
Message-ID: <8fe9413e-aa79-4ace-a322-7504c1c3e43d@bugseng.com>
Date: Mon, 12 Aug 2024 17:27:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen: Remove -Wdeclaration-after-statement
To: Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>
References: <20240809130418.10431-1-alejandro.vallejo@cloud.com>
 <alpine.DEB.2.22.394.2408091217370.200407@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Roberto Bagnara <roberto.bagnara@bugseng.com>
In-Reply-To: <alpine.DEB.2.22.394.2408091217370.200407@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/24 21:25, Stefano Stabellini wrote:
> Adding Roberto
> 
> Does MISRA have a view on this? I seem to remember this is discouraged?

As far as I know, there is nothing in MISRA C against or in favor of
mixing declaration with statements.  The only (slightly) relevant
guideline is advisory Rule 8.9 (An object should be declared at block
scope if its identifier only appears in a single function), which advises
to declare objects at function scope when this is possible.
The rationale of the same rule says, among other things:

   Within a function, whether objects are declared at the outermost
   or innermost block is largely a matter of style.

On the other hand, MISRA C recognizes that reduction of scope
is, all other things being equal, to be preferred, but there
are no guidelines similar to  -Wdeclaration-after-statement.
Rather, the point is "declare it at block scope, if you can;
otherwise declare it at file scope, if you can; otherwise,
declare it at global scope, if you must."
Kind regards,

    Roberto

> On Fri, 9 Aug 2024, Alejandro Vallejo wrote:
>> This warning only makes sense when developing using a compiler with C99
>> support on a codebase meant to be built with C89 compilers too, and
>> that's no longer the case (nor should it be, as it's been 25 years since
>> C99 came out already).
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>> Yes, I'm opening this can of worms. I'd like to hear others people's
>> thoughts on this and whether this is something MISRA has views on. If
>> there's an ulterior non-obvious reason besides stylistic preference I
>> think it should be documented somewhere, but I haven't seen such an
>> explanation.
>>
>> IMO, the presence of this warning causes several undesirable effects:
>>
>>    1. Small functions are hampered by the preclusion of check+declare
>>       patterns that improve readability via concision. e.g: Consider a
>>       silly example like:
>>
>>       /* with warning */                     /* without warning */
>>       void foo(uint8_t *p)                   void foo(uint8_t *p)
>>       {                                      {
>>           uint8_t  tmp1;                         if ( !p )
>>           uint16_t tmp2;                             return;
>>           uint32_t tmp3;
>>                                                  uint8_t  tmp1 = OFFSET1 + *p;
>>           if ( !p )                              uint16_t tmp2 = OFFSET2 + *p;
>>               return;                            uint32_t tmp3 = OFFSET3 + *p;
>>
>>           tmp1 = OFFSET1 + *p;                   /* Lots of uses of `tmpX` */
>>           tmp2 = OFFSET2 + *p;               }
>>           tmp2 = OFFSET2 + *p;
>>
>>           /* Lots of uses of tmpX */
>>       }
>>
>>    2. Promotes scope-creep. On small functions it doesn't matter much,
>>       but on bigger ones to prevent declaring halfway through the body
>>       needlessly increases variable scope to the full scope in which they
>>       are defined rather than the subscope of point-of-declaration to
>>       end-of-current-scope. In cases in which they can be trivially
>>       defined at that point, it also means they can be trivially misused
>>       before they are meant to. i.e: On the example in (1) assume the
>>       conditional in "with warning" is actually a large switch statement.
>>
>>    3. It facilitates a disconnect between time-of-declaration and
>>       time-of-use that lead very easily to "use-before-init" bugs.
>>       While a modern compiler can alleviate the most egregious cases of
>>       this, there's cases it simply cannot cover. A conditional
>>       initialization on anything with external linkage combined with a
>>       conditional use on something else with external linkage will squash
>>       the warning of using an uninitialised variable. Things are worse
>>       where the variable in question is preinitialised to something
>>       credible (e.g: a pointer to NULL), as then that can be misused
>>       between its declaration and its original point of intended use.
>>
>> So... thoughts? yay or nay?
> 
> In my opinion, there are some instances where mixing declarations and
> statements would enhance the code, but these are uncommon. Given the
> choice between:
> 
> 1) declarations always first
> 2) declarations always mixed with statements
> 
> I would choose 1).
> 
> One could say that mixing declarations with statements should be done
> only when appropriate, but the challenge lies in the subjective nature
> of "when appropriate." Different individuals have varying
> interpretations of this, which could lead to unnecessary bikeshedding.
> 
> For these reasons, I do not support mixing declarations and statements.
> 

