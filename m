Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEED35C9C9
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 17:24:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109300.208672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyQf-00062i-CW; Mon, 12 Apr 2021 15:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109300.208672; Mon, 12 Apr 2021 15:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyQf-00062L-8g; Mon, 12 Apr 2021 15:24:45 +0000
Received: by outflank-mailman (input) for mailman id 109300;
 Mon, 12 Apr 2021 15:24:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVyQe-00062C-D4
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 15:24:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a3719c9-272e-4287-9154-ef0119fed60d;
 Mon, 12 Apr 2021 15:24:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64196B1CA;
 Mon, 12 Apr 2021 15:24:42 +0000 (UTC)
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
X-Inumbo-ID: 3a3719c9-272e-4287-9154-ef0119fed60d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618241082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzKNstwtao6bu+QnqacRWzlp/7DstOknCs4SF0PDZDg=;
	b=ArpHE5TFhfnOn8jlJtLEw+Nt/E3G+wY9eDqo3mhNfFW+FjmTNBrjsXzWt0bEtW167tCGJJ
	PkCQalLtVwAki+ebMgUJqUhaOxOOTdn4VmMfpDgl6zB87j7pqzQoWe6X1hj0OoICKPsxuS
	m8e+LzDLZ2/Ksl3ZijFykTLu4DMs3mk=
Subject: Re: [PATCH 1/2] x86: correct is_pv_domain() when !CONFIG_PV
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
 <54013074-1fc4-1047-0d00-2762fcbc9ade@suse.com>
 <YHQUJw8H2tgNy5iY@Air-de-Roger>
 <169d6a5b-81ec-f347-8edc-60ba6ab0864f@suse.com>
 <YHReAkwZPnnh2itL@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9571d2ac-e8ae-4105-5f92-0a81728f44d2@suse.com>
Date: Mon, 12 Apr 2021 17:24:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHReAkwZPnnh2itL@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.04.2021 16:49, Roger Pau Monné wrote:
> On Mon, Apr 12, 2021 at 12:07:12PM +0200, Jan Beulich wrote:
>> On 12.04.2021 11:34, Roger Pau Monné wrote:
>>> On Fri, Nov 27, 2020 at 05:54:57PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/dom0_build.c
>>>> +++ b/xen/arch/x86/dom0_build.c
>>>> @@ -568,7 +568,7 @@ int __init construct_dom0(struct domain
>>>>  
>>>>      if ( is_hvm_domain(d) )
>>>>          rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
>>>> -    else if ( is_pv_domain(d) )
>>>> +    else if ( is_pv_64bit_domain(d) || is_pv_32bit_domain(d) )
>>>
>>> Urg, that's very confusing IMO, as I'm sure I would ask someone to
>>> just use is_pv_domain without realizing. It needs at least a comment,
>>> but even then I'm not sure I like it.
>>
>> I can add a comment, sure, but I think this is as confusing (or not)
>> as ...
>>
>>> So that I understand it, the point to use those expressions instead of
>>> is_pv_domain is to avoid calling dom0_construct_pv when CONFIG_PV is
>>> not enabled?
>>>
>>> Maybe it wold be better to instead use:
>>>
>>> if ( IS_ENABLED(CONFIG_PV) && is_pv_domain(d) )
>>
>> ... this.
>>
>>> In any case I wonder if we should maybe aim to introduce a new type
>>> for system domains, that's neither PV or HVM, in order to avoid having
>>> system domains qualified as PV even when PV is compiled out.
>>
>> This was my first thought, too, but would come with a much higher
>> price tag: We'd need to audit all uses for whether they're meant
>> to include the special domains. And this includes auditing of cases
>> where !is_hvm_*() may be inferred to mean is_pv_*().
> 
> What about we provide a dummy dom0_construct_pv that returns
> -EOPNOTSUPP when !CONFIG_PV and take rc into account for the panic
> call in construct_dom0 ie:
> 
>     if ( is_hvm_domain(d) )
>         rc = dom0_construct_pvh(d, image, image_headroom, initrd, cmdline);
>     else
>         rc = dom0_construct_pv(d, image, image_headroom, initrd, cmdline);
> 
>     if ( rc == -EOPNOTSUPP )
>         panic("Cannot construct Dom0. No guest interface available\n");
>     if ( rc )
>         return rc;
> 
> I think that's likely less confusing that the alternatives.

This could certainly be made work, but see below (i.e. it would
help the situation right here, but not the general issue - the
case in arch_do_domctl() may look less confusing, but really
suffers the same problem).

>>>> --- a/xen/arch/x86/domain.c
>>>> +++ b/xen/arch/x86/domain.c
>>>> @@ -1544,6 +1544,7 @@ arch_do_vcpu_op(
>>>>   */
>>>>  static void load_segments(struct vcpu *n)
>>>>  {
>>>> +#ifdef CONFIG_PV
>>>>      struct cpu_user_regs *uregs = &n->arch.user_regs;
>>>>      unsigned long gsb = 0, gss = 0;
>>>>      bool compat = is_pv_32bit_vcpu(n);
>>>> @@ -1709,6 +1710,7 @@ static void load_segments(struct vcpu *n
>>>>          regs->cs            = FLAT_KERNEL_CS;
>>>>          regs->rip           = pv->failsafe_callback_eip;
>>>>      }
>>>> +#endif
>>>>  }
>>>>  
>>>>  /*
>>>> @@ -1723,6 +1725,7 @@ static void load_segments(struct vcpu *n
>>>>   */
>>>>  static void save_segments(struct vcpu *v)
>>>>  {
>>>> +#ifdef CONFIG_PV
>>>>      struct cpu_user_regs *regs = &v->arch.user_regs;
>>>>  
>>>>      read_sregs(regs);
>>>> @@ -1748,6 +1751,7 @@ static void save_segments(struct vcpu *v
>>>>          else
>>>>              v->arch.pv.gs_base_user = gs_base;
>>>>      }
>>>> +#endif
>>>>  }
>>>
>>> Could you move {load,save}_segments to pv/domain.c and rename to
>>> pv_{load,save}_segments and provide a dummy handler for !CONFIG_PV in
>>> pv/domain.h?
>>>
>>> Sorry it's slightly more work, but I think it's cleaner overall.
>>
>> Doing so was my first thought too, but we'd lose the present inlining
>> of the functions. For save_segments() this could be dealt with by
>> moving paravirt_ctxt_switch_from() as well, but load_segments() would
>> remain.
> 
> I see, maybe worth marking as inline then or adding a note about why
> they are not moved to pv/domain.c?

We try to avoid marking functions inline outside of headers. Adding
a note is an option, but I'm not sure something to be done here.

> As an aside, why do we need to call load_segments with interrupts
> enabled? Could we move it to paravirt_ctxt_switch_to?

load_segments() can raise faults, and faults with interrupts
disabled are, with (intentionally) very few exceptions, fatal.

>>>> --- a/xen/include/xen/sched.h
>>>> +++ b/xen/include/xen/sched.h
>>>> @@ -985,7 +985,7 @@ static always_inline bool is_control_dom
>>>>  
>>>>  static always_inline bool is_pv_domain(const struct domain *d)
>>>>  {
>>>> -    return IS_ENABLED(CONFIG_PV) &&
>>>> +    return IS_ENABLED(CONFIG_X86) &&
>>>>          evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
>>>>  }
>>>>  
>>>> @@ -1011,7 +1011,7 @@ static always_inline bool is_pv_32bit_vc
>>>>  
>>>>  static always_inline bool is_pv_64bit_domain(const struct domain *d)
>>>>  {
>>>> -    if ( !is_pv_domain(d) )
>>>> +    if ( !IS_ENABLED(CONFIG_PV) || !is_pv_domain(d) )
>>>>          return false;
>>>
>>> I think overall is confusing to have a domain that returns true for
>>> is_pv_domain but false for both is_pv_{64,32}bit_domain checks.
>>>
>>> I know those are only the system domains, but it feels confusing and
>>> could cause mistakes in the future IMO, as then we would have to
>>> carefully think where to use ( is_pv_64bit_domain(d)
>>> || is_pv_32bit_domain(d) ) vs just using is_pv_domain(d), or
>>> IS_ENABLED(CONFIG_PV) && is_pv_domain(d)
>>
>> Imo it's not "then we would have to carefully think where to use ..."
>> but instead this patch is an indication that we should have been for
>> quite some time. For this reason (coming back to your first comment
>> at the top) I'm not sure adding a comment _there_ is actually useful.
>> Every use of is_pv_*() needs carefully considering which domains are
>> really meant.
> 
> Maybe we shouldn't have used is_pv_domain as a way to hide code from
> the compiler and instead always provide dummy functions, as even with
> PV support compiled out we still need some of it for system domains.
> 
> I'm not sure I have a good proposal to make, but it seems wrong to me
> that is_pv_domain(d) could be different than is_pv_64bit_domain(d) ||
> is_pv_32bit_domain(d).

Hmm, so we're of opposite opinions - not sure what to do. Short of
having / introducing is_system_domain() or some such (with all the
needed auditing) I can't see how assuming the two would mean the
same could ever have been true. With what we have is_pv_domain() is
legitimately true for them, and both is_pv_{32,64}bit_domain() ought
to be false (as there's no specific bitness associated with them)
imo _at least_ when !PV.

Jan

