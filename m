Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B8D332916
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 15:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95528.180384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdhQ-0004Ni-QD; Tue, 09 Mar 2021 14:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95528.180384; Tue, 09 Mar 2021 14:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdhQ-0004NJ-Mm; Tue, 09 Mar 2021 14:51:04 +0000
Received: by outflank-mailman (input) for mailman id 95528;
 Tue, 09 Mar 2021 14:51:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bv84=IH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJdhO-0004N1-LS
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:51:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56b08059-258d-4c55-b35c-320591a42418;
 Tue, 09 Mar 2021 14:51:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4CCD6AE15;
 Tue,  9 Mar 2021 14:51:00 +0000 (UTC)
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
X-Inumbo-ID: 56b08059-258d-4c55-b35c-320591a42418
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615301460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7rs5hfiApm/mJkK935Bglhgf5+CumLEim2hP+wR7r4=;
	b=HbXPXip4nFH3c/ZlZCwA7C+HmS8bo+vhvSFmNZRGm0uubGx+D/bbq/7P9hQOCS6gKgZk2Y
	5iOwOuvY459vBkqWUTF6oGTR8S2f779AbqSeSAuWLXMJ/NA0B9acYrfHzMRpLa0YFX2649
	STtPoi6WGgEtEOyIHnKfB5nV/5NjWWE=
Subject: Re: [PATCH v2 1/2][4.15] x86/PV: conditionally avoid raising #GP for
 early guest MSR reads
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <d794bbee-a5e5-6632-3d1f-acd8164b7171@suse.com>
 <YEXmvp02UvvY8Fve@Air-de-Roger>
 <1f19ced7-183b-8f08-3a90-c06039e053a6@suse.com>
 <YEYUbGw5J1VMnuxd@Air-de-Roger>
 <b8ab7ac3-036b-d226-dc82-c61bf42f13d6@suse.com>
 <YEdLO04upNrxNTmI@Air-de-Roger>
 <204d73ec-a46a-6cef-9bc4-4219a7d00350@suse.com>
 <YEd6GTXJqRIjijl6@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6dd26887-4246-8c5d-bf94-de03657230c1@suse.com>
Date: Tue, 9 Mar 2021 15:50:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEd6GTXJqRIjijl6@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.03.2021 14:37, Roger Pau Monné wrote:
> On Tue, Mar 09, 2021 at 12:16:49PM +0100, Jan Beulich wrote:
>> On 09.03.2021 11:17, Roger Pau Monné wrote:
>>> On Mon, Mar 08, 2021 at 02:49:19PM +0100, Jan Beulich wrote:
>>>> On 08.03.2021 13:11, Roger Pau Monné wrote:
>>>>> On Mon, Mar 08, 2021 at 10:33:12AM +0100, Jan Beulich wrote:
>>>>>> On 08.03.2021 09:56, Roger Pau Monné wrote:
>>>>>>> On Fri, Mar 05, 2021 at 10:50:34AM +0100, Jan Beulich wrote:
>>>>>>>> --- a/xen/arch/x86/pv/emul-priv-op.c
>>>>>>>> +++ b/xen/arch/x86/pv/emul-priv-op.c
>>>>>>>> @@ -874,7 +874,7 @@ static int read_msr(unsigned int reg, ui
>>>>>>>>      struct vcpu *curr = current;
>>>>>>>>      const struct domain *currd = curr->domain;
>>>>>>>>      const struct cpuid_policy *cp = currd->arch.cpuid;
>>>>>>>> -    bool vpmu_msr = false;
>>>>>>>> +    bool vpmu_msr = false, warn = false;
>>>>>>>>      int ret;
>>>>>>>>  
>>>>>>>>      if ( (ret = guest_rdmsr(curr, reg, val)) != X86EMUL_UNHANDLEABLE )
>>>>>>>> @@ -882,7 +882,7 @@ static int read_msr(unsigned int reg, ui
>>>>>>>>          if ( ret == X86EMUL_EXCEPTION )
>>>>>>>>              x86_emul_hw_exception(TRAP_gp_fault, 0, ctxt);
>>>>>>>>  
>>>>>>>> -        return ret;
>>>>>>>> +        goto done;
>>>>>>>>      }
>>>>>>>>  
>>>>>>>>      switch ( reg )
>>>>>>>> @@ -986,7 +986,7 @@ static int read_msr(unsigned int reg, ui
>>>>>>>>          }
>>>>>>>>          /* fall through */
>>>>>>>>      default:
>>>>>>>> -        gdprintk(XENLOG_WARNING, "RDMSR 0x%08x unimplemented\n", reg);
>>>>>>>> +        warn = true;
>>>>>>>>          break;
>>>>>>>>  
>>>>>>>>      normal:
>>>>>>>> @@ -995,7 +995,19 @@ static int read_msr(unsigned int reg, ui
>>>>>>>>          return X86EMUL_OKAY;
>>>>>>>>      }
>>>>>>>>  
>>>>>>>> -    return X86EMUL_UNHANDLEABLE;
>>>>>>>> + done:
>>>>>>>
>>>>>>> Won't this handling be better placed in the 'default' switch case
>>>>>>> above?
>>>>>>
>>>>>> No - see the "goto done" added near the top of the function.
>>>>>
>>>>> Yes, I'm not sure of that. If guest_rdmsr returns anything different
>>>>> than X86EMUL_UNHANDLEABLE it means it has handled the MSR in some way,
>>>>> and hence we shouldn't check whether the #GP handler is set or not.
>>>>>
>>>>> This is not the behavior of older Xen versions, so I'm unsure whether
>>>>> we should introduce a policy that's even less strict than the previous
>>>>> one in regard to whether a #GP is injected or not.
>>>>>
>>>>> I know injecting a #GP when the handler is not set is not helpful for
>>>>> the guest, but we should limit the workaround to kind of restoring the
>>>>> previous behavior for making buggy guests happy, not expanding it
>>>>> anymore.
>>>>
>>>> Yet then we risk breaking guests with any subsequent addition to
>>>> guest_rdmsr() which, under whatever extra conditions, wants to
>>>> raise #GP.
>>>
>>> But it's always been like that AFAICT? Additions to guest_{rd/wr}msr
>>> preventing taking the default path in the {read/write}_msr PV
>>> handlers.
>>
>> Yes, but the impact so far and the impact going forward are different.
> 
> OK, I assume this is because we plan to handle more MSRs in
> guest_{rd/wr}msr?

Yes.

> In which case those newly added handlers are not likely to inject a
> #GP?

Kind of the opposite - because it's not impossible that some
addition there may want to raise #GP.

>>> If #GP signaled by guest_{rd/wr}msr are no longer injected when the guest
>>> #GP handler is not set we might as well drop the rdmsr_safe check and
>>> just don't try to inject any #GP at all from MSR accesses unless the
>>> handler is setup?
>>
>> Well, that's what I had initially. You asked me to change to what I
>> have now.
>>
>>> I feel this is likely going too far. I agree we should attempt to
>>> restore something compatible with the previous behavior for unhandled
>>> MSRs, but also not injecting the #GPs signaled by guest_{rd/wr}msr
>>> seems to go beyond that.
>>
>> I understand this is a downside. Yet as said - the downside of _not_
>> doing so is that every further raising of #GP will risk breaking a
>> random guest kernel variant.
> 
> Right. So given this awkward position Xen is in, we should maybe make
> the lack of #GP injection as a result of an MSR access when no handler
> is set formally part of the ABI and written down somewhere?
> 
> It's not ideal, but at the end of day PV is 'our' own architecture,
> and given that this workaround will be enabled by default, and that we
> won't be able to turn it off we should have it written down as part of
> the ABI.
> 
> If you agree with this I'm fine with not injecting a #GP at all unless
> the handler is set for PV, like you proposed in your first patch. IMO
> it's not ideal, but it's better if it's a consistent behavior and
> clearly written down in the public headers (likely next to the
> hypercall used to setup the #GP handler).
> 
> I know this can be seen as broken behavior from an x86 perspective,
> but again PV is already different from x86.

I'm certainly not opposed to spelling this out somewhere; iirc you
said the other day that you couldn't spot a good place. I can't think
of a good place either. Furthermore before we spell out anything we
(which specifically includes Andrew) need to settle on the precise
behavior we want. I did suggest earlier that I could see us tighten
the condition, and there are many possible variations. For example we
could record whether a #GP handler was ever installed, so we wouldn't
return back to the relaxed behavior in case a guest zapped its handler
again. But for behavior like this the immediate question is going to
be what effect migration (or saving/restoring) of the guest ought to
have.

Jan

