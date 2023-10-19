Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADB47CF27E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 10:26:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618983.963392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOMC-00034U-Ra; Thu, 19 Oct 2023 08:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618983.963392; Thu, 19 Oct 2023 08:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtOMC-00031J-OC; Thu, 19 Oct 2023 08:26:16 +0000
Received: by outflank-mailman (input) for mailman id 618983;
 Thu, 19 Oct 2023 08:26:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtOMB-00031D-4y
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 08:26:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtOMA-00013A-0M; Thu, 19 Oct 2023 08:26:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtOM9-0000cH-PP; Thu, 19 Oct 2023 08:26:13 +0000
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
	bh=d7NgqNXKBQu48u2+dzduwyE1jBlNNBFERbPD1JcpCX4=; b=568ECHyoCsPBqhzFYtCYNnuJYr
	K4XtQ0TTqVfOLc+iT+EQ/6etEwr9lEcrCnnlJID0wNxNxWXG2k6tS9uMbprmYM74rP3wF68tkDL4d
	ldtFplHuyjjcTcp51gIjzGo4MS1uwfdq4xb40aC2VodMlLAEAatKNxQ7YmwwaMWmI4Os=;
Message-ID: <578e282c-0b66-60c1-895f-197a859a1df4@xen.org>
Date: Thu, 19 Oct 2023 09:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 2/4] automation/eclair: add deviations and call
 properties.
To: Simone Ballarin <simone.ballarin@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <8f426cc761c734d457a74416dd5b83fd10128c26.1697638210.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2310181756410.965337@ubuntu-linux-20-04-desktop>
 <a31140c6-4c2f-4c86-affd-baf0a51a0bb7@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a31140c6-4c2f-4c86-affd-baf0a51a0bb7@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Simone,

On 19/10/2023 08:44, Simone Ballarin wrote:
> On 19/10/23 02:57, Stefano Stabellini wrote:
>> On Wed, 18 Oct 2023, Simone Ballarin wrote:
>>> Deviate violations of MISRA C:2012 Rule 13.1 caused by
>>> functions vcpu_runnable and __bad_atomic_size. These functions
>>> contain side-effects such as debugging logs, assertions and
>>> failures that cannot cause unexpected behaviors.
>>>
>>> Add "noeffect" call property to functions read_u.*_atomic and
>>> get_cycles.
>>>
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>
>> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> However one comment below
>>
>>
>>> ---
>>>   .../eclair_analysis/ECLAIR/call_properties.ecl      | 10 ++++++++++
>>>   automation/eclair_analysis/ECLAIR/deviations.ecl    | 13 +++++++++++++
>>>   docs/misra/deviations.rst                           | 11 +++++++++++
>>>   3 files changed, 34 insertions(+)
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/call_properties.ecl 
>>> b/automation/eclair_analysis/ECLAIR/call_properties.ecl
>>> index 3f7794bf8b..f410a6aa58 100644
>>> --- a/automation/eclair_analysis/ECLAIR/call_properties.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/call_properties.ecl
>>> @@ -104,3 +104,13 @@ Furthermore, their uses do initialize the 
>>> involved variables as needed by futher
>>>   
>>> -call_properties+={"macro(^(__)?(raw_)?copy_from_(paddr|guest|compat)(_offset)?$)", {"pointee_write(1=always)", "pointee_read(1=never)", "taken()"}}
>>>   
>>> -call_properties+={"macro(^(__)?copy_to_(guest|compat)(_offset)?$)", 
>>> {"pointee_write(2=always)", "pointee_read(2=never)", "taken()"}}
>>>   -doc_end
>>> +
>>> +-doc_begin="Functions generated by build_atomic_read cannot be 
>>> considered pure
>>> +since the input pointer is volatile."
>>> +-call_properties+={"^read_u(8|16|32|64|int)_atomic.*$", {"noeffect"}}
>>> +-doc_end
>>> +
>>> +-doc_begin="get_cycles does not perform visible side-effects "
>>> +-call_property+={"name(get_cycles)", {"noeffect"}}
>>> +-doc_end
>>> +
>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> index fa56e5c00a..b80ccea7bc 100644
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -233,6 +233,19 @@ this."
>>>   -config=MC3R1.R10.1,etypes+={safe,
>>>     
>>> "stmt(operator(and||or||xor||not||and_assign||or_assign||xor_assign))",
>>>     "any()"}
>>> +#
>>> +# Series 13.
>>> +#
>>> +
>>> +-doc_begin="Function __bad_atomic_size is intended to generate a 
>>> linkage error
>>> +if invoked. Calling it in intentionally unreachable switch cases is 
>>> safe even
>>> +in a initializer list."
>>> +-config=MC3R1.R13.1,reports+={safe, 
>>> "first_area(^.*__bad_atomic_size.*$)"}
>>> +-doc_end
>>> +
>>> +-doc_begin="Function vcpu_runnable contains pragmas and other 
>>> side-effects for
>>> +debugging purposes, their invocation is safe even in a initializer 
>>> list."
>>> +-config=MC3R1.R13.1,reports+={safe, "first_area(^.*vcpu_runnable.*$)"}
>>>   -doc_end
>>>   -doc_begin="See Section \"4.5 Integers\" of \"GCC_MANUAL\", where 
>>> it says that
>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>> index 8511a18925..2fcdb8da58 100644
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -192,6 +192,17 @@ Deviations related to MISRA C:2012 Rules:
>>>          See automation/eclair_analysis/deviations.ecl for the full 
>>> explanation.
>>>        - Tagged as `safe` for ECLAIR.
>>> +   * - R13.1
>>> +     - Function __bad_atomic_size is intended to generate a linkage 
>>> error if
>>> +       invoked. Calling it in intentionally unreachable switch cases is
>>> +       safe even in a initializer list.
>>> +     - Tagged as `safe` for ECLAIR.
>>> +
>>> +   * - R13.1
>>> +     - Function vcpu_runnable contains pragmas and other 
>>> side-effects for
>>> +       debugging purposes, their invocation is safe even in a 
>>> initializer list.
>>> +     - Tagged as `safe` for ECLAIR.
>>
>>
>> Would it be possible to use SAF instead? If not, this is fine.
> 
> Yes, but I do not suggest using SAF comments in these cases.

There are not many use of __bad_atomic_size() and I don't expect much 
more. So I think SAF- makes more sense.

For vcpu_runnable(), I don't quite understand the argument. I can't find 
any pragma around the function and I can't find any side-effects in it. 
Can you clarify?

Cheers,

-- 
Julien Grall

