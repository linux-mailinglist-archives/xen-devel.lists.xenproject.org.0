Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE13826C5E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:16:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663387.1033257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnc7-0001cH-4q; Mon, 08 Jan 2024 11:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663387.1033257; Mon, 08 Jan 2024 11:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnc7-0001aD-20; Mon, 08 Jan 2024 11:16:15 +0000
Received: by outflank-mailman (input) for mailman id 663387;
 Mon, 08 Jan 2024 11:16:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O4yG=IS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rMnc5-0001a7-Ax
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:16:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fe8dc72-ae17-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 12:16:04 +0100 (CET)
Received: from [192.168.1.15] (host-79-44-205-232.retail.telecomitalia.it
 [79.44.205.232])
 by support.bugseng.com (Postfix) with ESMTPSA id DDB614EE0741;
 Mon,  8 Jan 2024 12:16:03 +0100 (CET)
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
X-Inumbo-ID: 4fe8dc72-ae17-11ee-98ef-6d05b1d4d9a1
Message-ID: <8fa1f868-c7de-4a46-a827-a75c38513f6f@bugseng.com>
Date: Mon, 8 Jan 2024 12:16:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC] x86/uaccess: remove __{put,get}_user_bad()
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
References: <9cf852da1c03b614bf5010132c58a18adc2a4161.1703155225.git.federico.serafini@bugseng.com>
 <a2050ac1-e205-4d7f-b9b1-aa625136e63a@suse.com>
 <0c5bbfde-4cf0-4878-b1ee-ccc8eb775464@citrix.com>
 <eb53449bd6595ea0931460e62dd57b9c@bugseng.com>
 <1330c757-1ca3-4b07-898b-799cbfa67e8a@suse.com>
 <6a39fe3e-524f-4e39-81bc-ffb3d48ba306@bugseng.com>
 <192c393a-3702-4cc3-af60-e2711098ec6d@suse.com>
Content-Language: en-US, it
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <192c393a-3702-4cc3-af60-e2711098ec6d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/01/24 09:02, Jan Beulich wrote:
> On 05.01.2024 17:19, Federico Serafini wrote:
>> Hello everyone,
>>
>> On 21/12/23 13:41, Jan Beulich wrote:
>>> On 21.12.2023 13:01, Nicola Vetrini wrote:
>>>> Hi Andrew,
>>>>
>>>> On 2023-12-21 12:03, Andrew Cooper wrote:
>>>>> On 21/12/2023 10:58 am, Jan Beulich wrote:
>>>>>> On 21.12.2023 11:53, Federico Serafini wrote:
>>>>>>> Remove declarations of __put_user_bad() and __get_user_bad()
>>>>>>> since they have no definition.
>>>>>>> Replace their uses with a break statement to address violations of
>>>>>>> MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
>>>>>>> terminate every switch-clause").
>>>>>>> No functional change.
>>>>>>>
>>>>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>>>>> ---
>>>>>>> Several violations of Rule 16.3 come from uses of macros
>>>>>>> get_unsafe_size() and put_unsafe_size().
>>>>>>> Looking at the macro definitions I found __get_user_bad() and
>>>>>>> __put_user_bad().
>>>>>>> I was wondering if instead of just adding the break statement I can
>>>>>>> also remove
>>>>>>> such functions which seem to not have a definition.
>>>>>> No, you can't. Try introducing a caller which "accidentally" uses the
>>>>>> wrong size. Without your change you'll observe the build failing (in
>>>>>> a somewhat obscure way, but still), while with your change bad code
>>>>>> will silently be generated.
>>>>>
>>>>> The construct here is deliberate.  It's a build time assertion that bad
>>>>> sizes aren't used.
>>>>>
>>>>> __bitop_bad_size() and __xsm_action_mismatch_detected() are the same
>>>>> pattern in other areas of code too, with the latter being more explicit
>>>>> because of how it's wrapped by LINKER_BUG_ON().
>>>>>
>>>>>
>>>>> It is slightly horrible, and not the most obvious construct for
>>>>> newcomers.  If there's an alternative way to get a build assertion, we
>>>>> could consider switching to a new pattern.
>>>>
>>>> would you be in favour of a solution with a BUILD_BUG_ON in the default
>>>> branch followed by a break?
>>>>
>>>> default:
>>>>        BUILD_BUG_ON(!size || size >=8 || (size & (size - 1)));
>>>>        break;
>>>
>>> I don't think this would compile - BUILD_BUG_ON() wants a compile-time
>>> constant passed.
>>
>> What do you think about adding the following macro to compiler.h:
>>
>> #define static_assert_unreachable(identifier) \
>>       asm("unreachable " #identifier " reached")
>>
>> It expands to an invalid assembly instruction that will lead to a
>> customizable error message generated by the assembler instead of the
>> linker (anticipating the error detection).
>>
>> The use of this macro will indicate a program point considered
>> unreachable (and as such removed) by the static analysis performed by
>> the compiler, even at an optimization level -O0.
>>
>> An example of use is in the default case of put_unsafe_size():
>>
>> default: static_assert_unreachable(default);
>>
>> In case a wrong size will be used, the following message will be
>> generated:
>>
>> ./arch/x86/include/asm/uaccess.h: Assembler messages:
>> ./arch/x86/include/asm/uaccess.h:257: Error: no such instruction:
>> `unreachable default reached'
> 
> Nice idea. To take it one step further, why not simply use the .error
> assembler directive then?

It seems good.

> 
>> Note that adopting the macro and discussing its definition are two
>> separate things:
>> I think we can all agree on the fact that the use of such macro improves
>> readability, so I would suggest its adoption.
>> Whereas for its definition, if you don't like the invalid asm
>> instruction, we could discuss for a different solution, for example,
>> the following is something similar to what you are doing now:
>>
>> #define static_assert_unreachable(identifier) \
>>       extern void identifier(void);             \
>>       identifier()
>>
>>
>> Note also that the problem of the missing break statement (that violates
>> Rule 16.3) is still present, it could be addressed by adding the break
>> or deviating for such special cases, do you have any preferences?
> 
> Amend the new macro's expansion by unreachable()?

It would work only if we also add macro unreachable() to the allowed
statements that can terminate a switch-clause.

I'll take this opportunity to clarify the Rule 16.3 and the deviation
system of ECLAIR for this rule (adding Julien in CC, he might be
interested in this).
The rationale of 16.3 is the avoidance of unintentional fall through.
To do this, the rule says to put an unconditional break statement at
the end of every switch-clause.

Nothing is said about the semantics of the code within the
switch-clause, e.g., the rule does not take into account if the fall
through cannot happen because the code returns in every feasible path.
The reason behind this is to keep the rule as simple as possible and
above all, keep the rule to be decidable.

Given the fact that 16.3 is a purely syntactic (and hence decidable)
rule, the deviations that can be configured within ECLAIR are
consequently purely syntactic.
Currently, we configured the tool to allow also unconditional return,
unconditional goto and unconditional continue as terminating statements.
This means that, if you want also to deviate switch-clauses terminating
with:

if ( cond ) return x; else return y;

then we need to explicitly configure the tool to consider also
an if statement having this particular shape as allowed terminal
statement (which is something I would not suggest since a rewriting
would address the violation).

The same applies to unreachable().
No semantics checks are performed for Rule 16.3,
hence we will need to add it to the allowed terminal statements.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

