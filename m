Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 775FE266048
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 15:29:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGj6k-0003Ot-LS; Fri, 11 Sep 2020 13:28:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGj6j-0003On-Ou
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 13:28:53 +0000
X-Inumbo-ID: 6c666695-0759-4406-bd41-b7cae33dce10
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c666695-0759-4406-bd41-b7cae33dce10;
 Fri, 11 Sep 2020 13:28:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38185ACF2;
 Fri, 11 Sep 2020 13:29:07 +0000 (UTC)
Subject: Re: [PATCH 4/5] x86/pv: Optimise to the segment context switching
 paths
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
 <20200909095920.25495-5-andrew.cooper3@citrix.com>
 <34206c45-5dfb-a3de-716a-5365db3be1c5@suse.com>
 <2ab95b98-9bee-f85c-20a8-83d7eb09d62e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b2d65a3-b914-69cb-66c7-33465f9beee1@suse.com>
Date: Fri, 11 Sep 2020 15:28:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2ab95b98-9bee-f85c-20a8-83d7eb09d62e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.09.2020 14:53, Andrew Cooper wrote:
> On 11/09/2020 10:49, Jan Beulich wrote:
>> On 09.09.2020 11:59, Andrew Cooper wrote:
>>> Save the segment selectors with explicit asm, rather than with read_sreg().
>>> This permits the use of MOV's m16 encoding, which avoids indirecting the
>>> selector value through a register.
>> Instead of this, how about making read_sreg() look like
>>
>> #define read_sreg(val, name) ({                                  \
>>     if ( sizeof(val) == 2 )                                      \
>>         asm volatile ( "mov %%" STR(name) ",%0" : "=m" (val) );  \
>>     else                                                         \
>>         asm volatile ( "mov %%" STR(name) ",%k0" : "=r" (val) ); \
>> })
>>
>> which then also covers read_registers()? I have a full patch
>> ready to send, if you agree.
> 
> That will go wrong for
> 
> uint16_t ds; read_sreg(ds, ds);
> 
> as it will force the variable to be spilled onto the stack.


Let me quote the main part of the description of the patch then:

"Under the assumption that standalone variables preferably wouldn't be
 of uint16_t (or unsigned short) type, build in a heuristic to do a
 store to memory when the output expression is two bytes wide. In the
 register variant, add a 'k' modifier to avoid assemblers possibly
 generating operand size of REX prefixes."

A local variable has no reason to be uint16_t; nowadays even
./CODING_STYLE says so.

> I don't think this is a clever move.
> 
> 
> Furthermore, it is bad enough that read_sreg() already takes one magic
> parameter which doesn't follow normal C rules - renaming to READ_SREG()
> would be an improvement - but this is now adding a second which is a
> capture by name.

I was expecting this to be a possible objection from you. I wouldn't
mind upper-casing the name, but ...

> I'm afraid that is a firm no from me.

... looks like you prefer the open-coding, while I'd like to avoid it
whenever reasonably possible.

> There is one other place where we read all segment registers at once. 
> Maybe having a static inline save_sregs(struct cpu_user_regs *) hiding
> the asm block, but I'm not necessarily convinced of this plan either. 
> At least it would cleanly separate the "I've obviously got a memory
> operand" and "I almost certainly want it in a register anyway" logic.

I could live with this as a compromise.

>>> @@ -1556,18 +1557,24 @@ static void load_segments(struct vcpu *n)
>>>                     : [ok] "+r" (all_segs_okay)          \
>>>                     : [_val] "rm" (val) )
>>>  
>>> -#ifdef CONFIG_HVM
>>> -    if ( cpu_has_svm && !compat && (uregs->fs | uregs->gs) <= 3 )
>>> +    if ( !compat )
>>>      {
>>> -        unsigned long gsb = n->arch.flags & TF_kernel_mode
>>> -            ? n->arch.pv.gs_base_kernel : n->arch.pv.gs_base_user;
>>> -        unsigned long gss = n->arch.flags & TF_kernel_mode
>>> -            ? n->arch.pv.gs_base_user : n->arch.pv.gs_base_kernel;
>>> +        gsb = n->arch.pv.gs_base_kernel;
>>> +        gss = n->arch.pv.gs_base_user;
>>> +
>>> +        /*
>>> +         * Figure out which way around gsb/gss want to be.  gsb needs to be
>>> +         * the active context, and gss needs to be the inactive context.
>>> +         */
>>> +        if ( !(n->arch.flags & TF_kernel_mode) )
>>> +            SWAP(gsb, gss);
>>>  
>>> -        fs_gs_done = svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_START(n),
>>> -                                   n->arch.pv.fs_base, gsb, gss);
>>> +        if ( IS_ENABLED(CONFIG_HVM) && cpu_has_svm &&
>> The change from #ifdef to IS_ENABLED() wants mirroring to the
>> prefetching site imo. I wonder though whether the adjustment is a
>> good idea: The declaration lives in svm.h, and I would view it as
>> quite reasonable for that header to not get included in !HVM builds
>> (there may be a lot of disentangling to do to get there, but still).
> 
> I'm not overly fussed, but there will absolutely have to be HVM stubs
> for normal code.  I don't see why we should special case svm_load_segs()
> to not have a stub.

I don't see why they "absolutely" have to exist. With our relying on DCE
I don't think there'll need to be ones consistently for _every_ HVM
function used from more generic code. I also don't view this as "special
casing" - there are already various functions not having stubs, but
merely declarations. The special thing here is that, by their placement,
these declarations may not be in scope long term. Which is because we're
deliberately breaking proper layering here by using a HVM feature for PV.

Jan

