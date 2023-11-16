Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D897EDE18
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 11:02:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634107.989343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ZCk-0007yj-Nk; Thu, 16 Nov 2023 10:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634107.989343; Thu, 16 Nov 2023 10:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ZCk-0007wN-KI; Thu, 16 Nov 2023 10:02:34 +0000
Received: by outflank-mailman (input) for mailman id 634107;
 Thu, 16 Nov 2023 10:02:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RqoQ=G5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r3ZCj-0007wH-BM
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 10:02:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41398586-8467-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 11:02:30 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 306694EE0741;
 Thu, 16 Nov 2023 11:02:30 +0100 (CET)
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
X-Inumbo-ID: 41398586-8467-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Thu, 16 Nov 2023 11:02:30 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
In-Reply-To: <392566d1-109b-413c-b904-0e4cb4007263@suse.com>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
 <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com>
 <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com>
 <alpine.DEB.2.22.394.2310301536390.1625118@ubuntu-linux-20-04-desktop>
 <7c26fb70-6a8c-58a3-6a1d-300dd57b5827@suse.com>
 <817fab34432c854ce585aba80db77f7c@bugseng.com>
 <8b4e0da82930375b2a95387a9031c73f@bugseng.com>
 <1178b79c-d6a3-a46c-5556-3fb5964dc051@suse.com>
 <392566d1-109b-413c-b904-0e4cb4007263@suse.com>
Message-ID: <6b6f051130b724ee6a813235e049354c@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-16 09:26, Jan Beulich wrote:
> On 31.10.2023 11:20, Jan Beulich wrote:
>> On 31.10.2023 11:03, Nicola Vetrini wrote:
>>> On 2023-10-31 09:28, Nicola Vetrini wrote:
>>>> On 2023-10-31 08:43, Jan Beulich wrote:
>>>>> On 30.10.2023 23:44, Stefano Stabellini wrote:
>>>>>> On Mon, 30 Oct 2023, Jan Beulich wrote:
>>>>>>> On 27.10.2023 15:34, Nicola Vetrini wrote:
>>>>>>>> --- a/xen/include/xen/macros.h
>>>>>>>> +++ b/xen/include/xen/macros.h
>>>>>>>> @@ -8,8 +8,14 @@
>>>>>>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>>>>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>>>>>> 
>>>>>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>>>>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>>>>>>> +/*
>>>>>>>> + * Given an unsigned integer argument, expands to a mask where
>>>>>>>> just the least
>>>>>>>> + * significant nonzero bit of the argument is set, or 0 if no 
>>>>>>>> bits
>>>>>>>> are set.
>>>>>>>> + */
>>>>>>>> +#define ISOLATE_LOW_BIT(x) ((x) & -(x))
>>>>>>> 
>>>>>>> Not even considering future Misra changes (which aiui may require
>>>>>>> that
>>>>>>> anyway), this generalization of the macro imo demands that its
>>>>>>> argument
>>>>>>> now be evaluated only once.
>>>>>> 
>>>>>> Fur sure that would be an improvement, but I don't see a trivial 
>>>>>> way
>>>>>> to
>>>>>> do it and this issue is also present today before the patch.
>>>>> 
>>>>> This was an issue here for MASK_EXTR() and MASK_INSR(), yes, but 
>>>>> the
>>>>> new
>>>>> macro has wider use, and there was no issue elsewhere so far.
>>>>> 
>>>>>> I think it
>>>>>> would be better to avoid scope-creeping this patch as we are 
>>>>>> already
>>>>>> at
>>>>>> v4 for something that was expected to be a trivial mechanical 
>>>>>> change.
>>>>>> I
>>>>>> would rather review the fix as a separate patch, maybe sent by you 
>>>>>> as
>>>>>> you probably have a specific implementation in mind?
>>>>> 
>>>>> #define ISOLATE_LOW_BIT(x) ({ \
>>>>>     typeof(x) x_ = (x); \
>>>>>     x_ & -x_; \
>>>>> })
>>>>> 
>>>>> Hard to see the scope creep here. What I would consider scope creep 
>>>>> I
>>>>> specifically didn't even ask for: I'd like this macro to be
>>>>> overridable
>>>>> by an arch. Specifically (see my earlier naming hint) I'd like to 
>>>>> use
>>>>> x86's BMI insn BLSI in the context of "x86: allow Kconfig control 
>>>>> over
>>>>> psABI level", when ABI v2 or higher is in use.
>>>> 
>>>> I appreciate you suggesting an implementation; I'll send a v5
>>>> incorporating it.
>>> 
>>> There's an issue with this approach, though: since the macro is used
>>> indirectly
>>> in expressions that are e.g. case labels or array sizes, the build 
>>> fails
>>> (see [1] for instance).
>>> Perhaps it's best to leave it as is?
>> 
>> Hmm. I'm afraid it's not an option to "leave as is", not the least 
>> because
>> - as said - I'm under the impression that another Misra rule requires
>> macro arguments to be evaluated exactly once. Best I can think of 
>> right
>> away is to have a macro for limited use (to address such build issues)
>> plus an inline function (for general use). But yes, maybe that then 
>> indeed
>> needs to be a 2nd step.
> 
> While I've committed this patch (hoping that I got the necessary 
> context
> adjustment right for the 
> automation/eclair_analysis/ECLAIR/deviations.ecl
> change), I'd like to come back to this before going further with users 
> of
> the new macro: I still think we ought to try to get to the single
> evaluation wherever possible. The macro would then be used only in 
> cases
> where the alternative construct (perhaps an isolate_lsb() macro, living
> perhaps in xen/bitops.h) cannot be used. ISOLATE_LSB() would then want 
> to
> gain a comment directing people to the "better" sibling. Thoughts?
> 

Having the users in place would help me estimate the remaining work that 
needs to be done on this rule and see if my local counts match up with 
the counts in staging.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

