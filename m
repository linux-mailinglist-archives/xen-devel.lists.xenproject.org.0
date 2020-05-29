Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BAE1E8199
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 17:20:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegnh-0005lk-JM; Fri, 29 May 2020 15:20:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jegng-0005lf-Fb
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 15:20:00 +0000
X-Inumbo-ID: dc24cbc2-a1bf-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc24cbc2-a1bf-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 15:19:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A480FB07D;
 Fri, 29 May 2020 15:19:58 +0000 (UTC)
Subject: Re: [PATCH v10 1/9] x86emul: address x86_insn_is_mem_{access, write}()
 omissions
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <d2375ecb-f662-99d8-84c2-e9f9c5cf7b9e@suse.com>
 <f41a4f27-bbe2-6450-38c1-6c4e23f2b07b@suse.com>
 <8e976b4b-60f2-bf94-843d-0fe0ba57087c@citrix.com>
 <5e46ec9b-2ae0-3d28-01c8-794356532456@suse.com>
 <56a4b478-6b3e-1eea-12b6-560dcb2776f2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1c030ba3-b1e0-62b6-b048-f907acade662@suse.com>
Date: Fri, 29 May 2020 17:19:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <56a4b478-6b3e-1eea-12b6-560dcb2776f2@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 17:03, Andrew Cooper wrote:
> On 29/05/2020 14:29, Jan Beulich wrote:
>> On 29.05.2020 14:18, Andrew Cooper wrote:
>>> On 25/05/2020 15:26, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/x86_emulate/x86_emulate.c
>>>> +++ b/xen/arch/x86/x86_emulate/x86_emulate.c
>>>> @@ -11474,25 +11474,87 @@ x86_insn_operand_ea(const struct x86_emu
>>>>      return state->ea.mem.off;
>>>>  }
>>>>  
>>>> +/*
>>>> + * This function means to return 'true' for all supported insns with explicit
>>>> + * accesses to memory.  This means also insns which don't have an explicit
>>>> + * memory operand (like POP), but it does not mean e.g. segment selector
>>>> + * loads, where the descriptor table access is considered an implicit one.
>>>> + */
>>>>  bool
>>>>  x86_insn_is_mem_access(const struct x86_emulate_state *state,
>>>>                         const struct x86_emulate_ctxt *ctxt)
>>>>  {
>>>> +    if ( mode_64bit() && state->not_64bit )
>>>> +        return false;
>>> Is this path actually used?
>> Yes, it is. It's only x86_emulate() which has
>>
>>     generate_exception_if(state->not_64bit && mode_64bit(), EXC_UD);
>>
>> right now.
> 
> Oh.  That is a bit awkward.
> 
>>> state->not_64bit ought to fail instruction
>>> decode, at which point we wouldn't have a valid state to be used here.
>> x86_decode() currently doesn't have much raising of #UD at all, I
>> think. If it wasn't like this, the not_64bit field wouldn't be
>> needed - it's used only to communicate from decode to execute.
>> We're not entirely consistent with this though, seeing in
>> x86_decode_onebyte(), a few lines below the block of case labels
>> setting that field,
>>
>>     case 0x9a: /* call (far, absolute) */
>>     case 0xea: /* jmp (far, absolute) */
>>         generate_exception_if(mode_64bit(), EXC_UD);
> 
> This is because there is no legitimate way to determine the end of the
> instruction.
> 
> Most of the not_64bit instructions do have a well-defined end, even if
> they aren't permitted for use.

I wouldn't bet on that. Just look at the re-use of opcode D6
(salc in 32-bit) by L1OM for an extreme example. There's nothing
we can say on how any of the reserved opcodes may get re-used.
Prior to AVX / AVX512 we'd have estimated C4, C5, and 62 wrongly
as well (but that's true independent of execution mode).

>> We could certainly drop the field and raise #UD during decode
>> already, but don't you think we then should do so for all
>> encodings that ultimately lead to #UD, e.g. also for AVX insns
>> without AVX available to the guest? This would make
>> x86_decode() quite a bit larger, as it would then also need to
>> have a giant switch() (or something else that's suitable to
>> cover all cases).
> 
> I think there is a semantic difference between "we can't parse the
> instruction", and "we can parse it, but it's not legitimate in this
> context".
> 
> I don't think our exact split is correct, but I don't think moving all
> #UD checking into x86_decode() is correct either.

Do you have any clear, sufficiently simple rule in mind for where
we could draw the boundary?

Jan

