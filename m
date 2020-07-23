Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C8A22AD69
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 13:16:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyZCi-0003FR-ER; Thu, 23 Jul 2020 11:16:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyZCg-0003FK-Ra
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 11:15:58 +0000
X-Inumbo-ID: e19a3e34-ccd5-11ea-a27f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e19a3e34-ccd5-11ea-a27f-12813bfff9fa;
 Thu, 23 Jul 2020 11:15:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1D23ABCF;
 Thu, 23 Jul 2020 11:16:04 +0000 (UTC)
Subject: Re: [PATCH] x86/msr: Unify the real {rd,wr}msr() paths in
 guest_{rd,wr}msr()
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200722105529.12177-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e5f1d63-5f22-a43d-e025-21aa34345092@suse.com>
Date: Thu, 23 Jul 2020 13:15:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722105529.12177-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.07.2020 12:55, Andrew Cooper wrote:
> Both the read and write side have commonalities which can be abstracted away.
> This also allows for additional safety in release builds, and slightly more
> helpful diagnostics in debug builds.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> I'm not a massive fan of the global scope want_rdmsr_safe boolean, but I can't
> think of a reasonable way to fix it without starting to use other
> flexibiltiies offered to us by C99.

I can't seem to be able to guess what C99 feature(s) you mean.
If there are any that would help, why not use them?

> @@ -204,10 +205,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>           */
>          if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
>               !(boot_cpu_data.x86_vendor &
> -               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
> -             rdmsr_safe(MSR_AMD_PATCHLEVEL, *val) )
> +               (X86_VENDOR_INTEL | X86_VENDOR_AMD)) )
>              goto gp_fault;
> -        break;
> +        goto read_from_hw_safe;

Above from here is a read from MSR_IA32_PLATFORM_ID - any reason
it doesn't also get folded?

> @@ -278,7 +278,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>           */
>  #ifdef CONFIG_HVM
>          if ( v == current && is_hvm_domain(d) && v->arch.hvm.flag_dr_dirty )
> -            rdmsrl(msr, *val);
> +            goto read_from_hw;

In the write path you also abstract out the check for v being current.
Wouldn't this better be abstracted out here, too, as reading an actual
MSR when not current isn't generally very helpful?

> @@ -493,8 +506,8 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>                                 ? 0 : (msr - MSR_AMD64_DR1_ADDRESS_MASK + 1),
>                                 ARRAY_SIZE(msrs->dr_mask))] = val;
>  
> -        if ( v == curr && (curr->arch.dr7 & DR7_ACTIVE_MASK) )
> -            wrmsrl(msr, val);
> +        if ( curr->arch.dr7 & DR7_ACTIVE_MASK )
> +            goto maybe_write_to_hw;
>          break;

I have to admit that I'd find it more logical if v was now used
here instead of curr.

> @@ -509,6 +522,23 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
>  
>      return ret;
>  
> + maybe_write_to_hw:
> +    /*
> +     * All paths potentially updating a value in hardware need to check
> +     * whether the call is in current context or not, so the logic is
> +     * implemented here.  Remote context need do nothing more.
> +     */
> +    if ( v != curr || !wrmsr_safe(msr, val) )
> +        return X86EMUL_OKAY;
> +
> +    /*
> +     * Paths which end up here took a #GP fault in wrmsr_safe().  Something is
> +     * broken with the logic above, so make it obvious in debug builds, and
> +     * fail safe by handing #GP back to the guests in release builds.
> +     */
> +    gprintk(XENLOG_ERR, "Bad wrmsr %#x val %016"PRIx64"\n", msr, val);

Didn't you indicate more than once that you dislike mixing 0x-
prefixed and non-prefixed hex values in a single message?
(Personally I'd simple drop the #, but I expect you to prefer it
the other way around.)

Also both here and in the read path I'm unconvinced of the
"by handing #GP back" wording: When v != curr, no #GP fault can
typically be handed anywhere. And even when v == curr it's still
up to the caller to decide what to do. IOW how about "by
suggesting to hand back #GP" or some such?

Jan

