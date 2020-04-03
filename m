Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48B119D1F1
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 10:15:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKHU1-0006Gc-25; Fri, 03 Apr 2020 08:15:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qJwk=5T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jKHTy-0006GX-Vj
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 08:15:18 +0000
X-Inumbo-ID: 40bf3c8e-7583-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40bf3c8e-7583-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 08:15:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BA4E1AC1D;
 Fri,  3 Apr 2020 08:15:16 +0000 (UTC)
Subject: Re: [PATCH v2] x86/PV: remove unnecessary toggle_guest_pt() overhead
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <47cf43bb-9643-011f-45c2-7cb63c422c3f@suse.com>
 <61b00d2c-f862-2500-d958-7ff8e8823409@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6188a128-ac6e-8e89-a3d5-75caea8cf753@suse.com>
Date: Fri, 3 Apr 2020 10:15:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <61b00d2c-f862-2500-d958-7ff8e8823409@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.04.2020 21:27, Andrew Cooper wrote:
> On 20/12/2019 14:06, Jan Beulich wrote:
>> While the mere updating of ->pv_cr3 and ->root_pgt_changed aren't overly
>> expensive (but still needed only for the toggle_guest_mode() path), the
>> effect of the latter on the exit-to-guest path is not insignificant.
>> Move the logic into toggle_guest_mode(), on the basis that
>> toggle_guest_pt() will always be invoked in pairs, yet we can't safely
>> undo the setting of root_pgt_changed during the second of these
>> invocations.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Ohhhhh.
> 
> I think this is the first time I've actually understood the "overhead"
> you're talking about here, but honestly, I still had to work very hard
> to figure it out.
> 
> If I were writing the commit message, it would be something like this:
> 
> Logic such as guest_io_okay() and guest_get_eff_kern_l1e() calls
> toggle_guest_pt() in pairs to pull a value out of guest kernel memory,
> then return to the previous pagetable context.
> 
> This is transparent and doesn't modify the pagetables, so there is no
> need to undergo an expensive resync on the return-to-guest path
> triggered by setting cpu_info->root_pgt_changed.
> 
> Move the logic from _toggle_guest_pt() to toggle_guest_mode(), which is
> intending to return to guest context in a different pagetable context.

Well, I think all of what you say is also being said by my variant,
just in a different way. I'd prefer to stick to my version, but I
could live with using yours if this helps finally getting this in.

>> --- a/xen/arch/x86/pv/domain.c
>> +++ b/xen/arch/x86/pv/domain.c
>> @@ -365,18 +365,10 @@ bool __init xpti_pcid_enabled(void)
>>  
>>  static void _toggle_guest_pt(struct vcpu *v)
>>  {
>> -    const struct domain *d = v->domain;
>> -    struct cpu_info *cpu_info = get_cpu_info();
>>      unsigned long cr3;
>>  
>>      v->arch.flags ^= TF_kernel_mode;
>>      update_cr3(v);
>> -    if ( d->arch.pv.xpti )
>> -    {
>> -        cpu_info->root_pgt_changed = true;
>> -        cpu_info->pv_cr3 = __pa(this_cpu(root_pgt)) |
>> -                           (d->arch.pv.pcid ? get_pcid_bits(v, true) : 0);
>> -    }
>>  
>>      /*
>>       * Don't flush user global mappings from the TLB. Don't tick TLB clock.
>> @@ -384,15 +376,11 @@ static void _toggle_guest_pt(struct vcpu
>>       * In shadow mode, though, update_cr3() may need to be accompanied by a
>>       * TLB flush (for just the incoming PCID), as the top level page table may
>>       * have changed behind our backs. To be on the safe side, suppress the
>> -     * no-flush unconditionally in this case. The XPTI CR3 write, if enabled,
>> -     * will then need to be a flushing one too.
>> +     * no-flush unconditionally in this case.
>>       */
>>      cr3 = v->arch.cr3;
>> -    if ( shadow_mode_enabled(d) )
>> -    {
>> +    if ( shadow_mode_enabled(v->domain) )
>>          cr3 &= ~X86_CR3_NOFLUSH;
>> -        cpu_info->pv_cr3 &= ~X86_CR3_NOFLUSH;
>> -    }
>>      write_cr3(cr3);
>>  
>>      if ( !(v->arch.flags & TF_kernel_mode) )
>> @@ -408,6 +396,8 @@ static void _toggle_guest_pt(struct vcpu
>>  
>>  void toggle_guest_mode(struct vcpu *v)
>>  {
>> +    const struct domain *d = v->domain;
>> +
>>      ASSERT(!is_pv_32bit_vcpu(v));
>>  
>>      /* %fs/%gs bases can only be stale if WR{FS,GS}BASE are usable. */
>> @@ -421,6 +411,21 @@ void toggle_guest_mode(struct vcpu *v)
>>      asm volatile ( "swapgs" );
>>  
>>      _toggle_guest_pt(v);
>> +
>> +    if ( d->arch.pv.xpti )
>> +    {
>> +        struct cpu_info *cpu_info = get_cpu_info();
>> +
>> +        cpu_info->root_pgt_changed = true;
>> +        cpu_info->pv_cr3 = __pa(this_cpu(root_pgt)) |
>> +                           (d->arch.pv.pcid ? get_pcid_bits(v, true) : 0);
>> +        /*
>> +         * As in _toggle_guest_pt() the XPTI CR3 write needs to be a TLB-
>> +         * flushing one too for shadow mode guests.
>> +         */
>> +        if ( shadow_mode_enabled(d) )
>> +            cpu_info->pv_cr3 &= ~X86_CR3_NOFLUSH;
>> +    }
>>  }
>>  
> 
> I think this wants a note for anyone trying to follow the logic.
> 
> /* Must be called in matching pairs without returning to guest context
> inbetween. */
> 
>>  void toggle_guest_pt(struct vcpu *v)

Despite your comment being ahead of it, I understand you mean
it to apply to this line? I'm certainly fine to add this comment,
but it's unrelated to the change at hand - the requirement has
been there before afaict.

> If the callers were more complicated than they are, or we might credibly
> gain more users, I would suggest it would be worth trying to assert the
> "called in pairs" aspect.
> 
> However, I can't think of any trivial way to check this, and I don't
> think it is worth a complicated check.

Indeed I've been trying to think of some reasonable way of doing
so years ago.

Jan

