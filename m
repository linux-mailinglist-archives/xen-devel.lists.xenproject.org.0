Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF1780C9F5
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 13:36:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651751.1017557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCfWW-0001d5-Sd; Mon, 11 Dec 2023 12:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651751.1017557; Mon, 11 Dec 2023 12:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCfWW-0001aa-Pc; Mon, 11 Dec 2023 12:36:36 +0000
Received: by outflank-mailman (input) for mailman id 651751;
 Mon, 11 Dec 2023 12:36:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rCfWV-0001aU-VL
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 12:36:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCfWU-00044I-Rp; Mon, 11 Dec 2023 12:36:34 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[10.95.158.169]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rCfWU-0001z1-L7; Mon, 11 Dec 2023 12:36:34 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=EJy6cs2n5b8tAIp35/8E/2urinzj/e4mDKA61wAq8No=; b=UnfYjX/1YVWPIih0X3Us5RkKNF
	rVKPhGKvrA8cfiddSqiI+u540FJqTEixFjufdXUfFNvqPaUwgbza/FA+UE/Bl4qfvkA/QPeAzSu6c
	OfCAGHmwQvLy6o4+CEr9THGLfoEjSlMKZIu5QGdRXGcy/zU8NvqQPmfXcV75A5Euckls=;
Message-ID: <d7d195e0-46c6-4be1-9711-4228b3b77eac@xen.org>
Date: Mon, 11 Dec 2023 12:36:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 16.3
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <4fa08aaed77d2b68db39ce51beef29820f1ba9b0.1701940034.git.federico.serafini@bugseng.com>
 <866ae09f-8e21-4f1b-a82e-8b72cc0f34e8@xen.org>
 <alpine.DEB.2.22.394.2312071628130.1265976@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2312071628130.1265976@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 08/12/2023 00:30, Stefano Stabellini wrote:
> On Thu, 7 Dec 2023, Julien Grall wrote:
>> Hi Federico,
>>
>> On 07/12/2023 09:08, Federico Serafini wrote:
>>> MISRA C:2012 Rule 16.3 states that an unconditional break statement
>>> shall terminate every switch-clause.
>>>
>>> Update ECLAIR configuration to take into account:
>>> - continue, goto, return statements;
>>> - functions and macros that do not give the control back;
>>> - fallthrough comments and pseudo-keywords.
>>>
>>> Update docs/misra/deviations.rst accordingly.
>>>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> ---
>>>    .../eclair_analysis/ECLAIR/deviations.ecl     | 18 ++++++++++++++
>>>    docs/misra/deviations.rst                     | 24 +++++++++++++++++++
>>>    2 files changed, 42 insertions(+)
>>
>> It would be good that this is depending on to be accepted:
>>
>> https://lore.kernel.org/alpine.DEB.2.22.394.2312051859440.110490@ubuntu-linux-20-04-desktop.
>>
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index b0c79741b5..df0b58a010 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -321,6 +321,24 @@ statements are deliberate"
>>>    -config=MC3R1.R14.3,statements={deliberate ,
>>> "wrapped(any(),node(if_stmt))" }
>>>    -doc_end
>>>    +#
>>> +# Series 16.
>>> +#
>>> +
>>> +-doc_begin="Switch clauses ending with continue, goto, return statements
>>> are safe."
>>> +-config=MC3R1.R16.3,terminals+={safe,
>>> "node(continue_stmt||goto_stmt||return_stmt)"}
>>> +-doc_end
>>> +
>>> +-doc_begin="Switch clauses not ending with the break statement are safe if
>>> a function/macro that does not give the control back is present."
>>> +-config=MC3R1.R16.3,terminals+={safe,
>>> "call(decl(name(__builtin_unreachable||do_unexpected_trap||fatal_trap||machine_halt||machine_restart||maybe_reboot||panic)))"}
>>> +-config=MC3R1.R16.3,terminals+={safe,"macro(name(BUG||BUG_ON))"}
>>> +-doc_end
>>> +
>>> +-doc_begin="Switch clauses not ending with the break statement are safe if
>>> an explicit comment or pseudo-keyword indicating the fallthrough intention
>>> is present."
>>> +-config=MC3R1.R16.3,reports+={safe,
>>> "any_area(any_loc(any_exp(text(^(?s).*([fF]all[- ]?[tT]hrough|FALL[-
>>> ]?THROUGH).*$,0..1))))"}
>>> +-config=MC3R1.R16.3,reports+={safe, "any_area(text(^(?s).*([fF]all[-
>>> ]?[tT]hrough|FALL[- ]?THROUGH).*$,0..1))"}
>>
>> This is not trivial to read. Can you document the exhaustive list of keywords
>> you are actually trying to deviate on? Also, did you consider to harmonize to
>> only a few?
>>
>>> +-doc_end
>>> +
>>>    #
>>>    # Series 20.
>>>    #
>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>> index 6e7c4f25b8..fecd2bae8e 100644
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -270,6 +270,30 @@ Deviations related to MISRA C:2012 Rules:
>>>           statements are deliberate.
>>>         - Project-wide deviation; tagged as `disapplied` for ECLAIR.
>>>    +   * - R16.3
>>> +     - Switch clauses ending with continue, goto, return statements are
>>> safe.
>>> +     - Tagged as `safe` for ECLAIR.
>>> +
>>> +   * - R16.3
>>> +     - Switch clauses not ending with the break statement are safe if a
>>> +       function/macro that does not give the control back is present.
>>> +     - Tagged as `safe` for ECLAIR, such functions/macros are:
>>> +        - __builtin_unreachable
>>> +        - do_unexpected_trap
>>> +        - fatal_trap
>>> +        - machine_halt
>>> +        - machine_restart
>>> +        - maybe_reboot
>>> +        - panic
>>> +        - BUG
>>
>> To me, it seems to be odd to deviate R16.3 by function. Some of those have an
>> attribute noreboot. Can this be used?
> 
> Just to clarify, I think Julien meant "noreturn" which is defined as
> __attribute__((__noreturn__))

Whoops yes.

> 
> I think we need to deviate by function, rather than using SAF, because
> we would have to use SAF in every switch rather than at the declaration
> of panic and friends. But if we could use noreturn, that would be
> awesome.

In general, I really dislike deviate by name because this is assuming 
that the functions name are uniq across all the architecture. For 
instance, fatal_trap() is x86 specific whilst do_unexpected_trap() is 
arm specific.

In this case, the name of the function clearly indicates that they are 
never expected to return. So we are ok.

But I would strongly prefer if we rely on property attribute rather than 
names whenever it is possible.

Cheers,

-- 
Julien Grall

