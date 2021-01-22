Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516A930037A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 13:52:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72747.131016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2vuK-0000nc-Pc; Fri, 22 Jan 2021 12:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72747.131016; Fri, 22 Jan 2021 12:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2vuK-0000nG-Lz; Fri, 22 Jan 2021 12:51:20 +0000
Received: by outflank-mailman (input) for mailman id 72747;
 Fri, 22 Jan 2021 12:51:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=83/a=GZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2vuJ-0000nB-UJ
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 12:51:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a49f024-19f5-4613-947b-38961ac40f6c;
 Fri, 22 Jan 2021 12:51:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 742AAB27F;
 Fri, 22 Jan 2021 12:51:17 +0000 (UTC)
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
X-Inumbo-ID: 9a49f024-19f5-4613-947b-38961ac40f6c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611319877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7C4Y0HpO+DiTAPofhEmCgDdeb61EaI6HdErwozgCz+8=;
	b=bCVqUsWjPTMVOZTAdPyc1IacVA8pBd/qUQ2qjiAb6kdmKeY3lb+N/XjKJQSHduOas529Tj
	HvSzCnfZHGQzFcrhB/vgzD30sie/GsG4k0YwPGSwgFGguEPi6f4KzzvEV9CpRNvON85hHu
	ul/4uek/IykJl+MbLHZg32SktSgleyE=
Subject: Re: [PATCH v2 3/4] x86: Allow non-faulting accesses to non-emulated
 MSRs if policy permits this
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, jun.nakajima@intel.com,
 kevin.tian@intel.com, xen-devel@lists.xenproject.org
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9ee36ca-e19d-0408-d137-8dcee4110ef3@suse.com>
Date: Fri, 22 Jan 2021 13:51:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1611182952-9941-4-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.01.2021 23:49, Boris Ostrovsky wrote:
> --- a/xen/arch/x86/msr.c
> +++ b/xen/arch/x86/msr.c
> @@ -164,6 +164,34 @@ int init_vcpu_msr_policy(struct vcpu *v)
>      return 0;
>  }
>  
> +/* Returns true if policy requires #GP to the guest. */
> +bool guest_unhandled_msr(const struct vcpu *v, uint32_t msr, uint64_t *val,
> +                         bool is_write, bool is_guest_msr_access)

Would you mind dropping the "_msr" infix from the last
parameter's name? We're anyway aware we're talking about MSR
accesses here, from the function name.

As a nit - while I'm okay with the uint64_t *, I think the
uint32_t would better be unsigned int - see ./CODING_STYLE.

Finally, this being a policy function and policy being per-
domain here, I think the first parameter wants to be const
struct domain *.

> +{
> +    u8 ignore_msrs = v->domain->arch.msr->ignore_msrs;

uint8_t please or, as per above, even better unsigned int.

> +
> +    /*
> +     * Accesses to unimplemented MSRs as part of emulation of instructions
> +     * other than guest's RDMSR/WRMSR should never succeed.
> +     */
> +    if ( !is_guest_msr_access )
> +        ignore_msrs = MSR_UNHANDLED_NEVER;

Wouldn't you better "return true" here? Such accesses also
shouldn't be logged imo (albeit I agree that's a change from
current behavior).

> +    if ( unlikely(ignore_msrs != MSR_UNHANDLED_NEVER) )
> +        *val = 0;

I don't understand the conditional here, even more so with
the respective changelog entry. In any event you don't
want to clobber the value ahead of ...

> +    if ( likely(ignore_msrs != MSR_UNHANDLED_SILENT) )
> +    {
> +        if ( is_write )
> +            gdprintk(XENLOG_WARNING, "WRMSR 0x%08x val 0x%016"PRIx64
> +                    " unimplemented\n", msr, *val);

... logging it.

> --- a/xen/arch/x86/x86_emulate/x86_emulate.h
> +++ b/xen/arch/x86/x86_emulate/x86_emulate.h
> @@ -850,4 +850,10 @@ static inline void x86_emul_reset_event(struct x86_emulate_ctxt *ctxt)
>      ctxt->event = (struct x86_event){};
>  }
>  
> +static inline bool x86_emul_guest_msr_access(struct x86_emulate_ctxt *ctxt)

The parameter wants to be pointer-to-const. In addition I wonder
whether this wouldn't better be a sibling to
x86_insn_is_cr_access() (without a "state" parameter, which
would be unused and unavailable to the callers), which may end
up finding further uses down the road.

> +{
> +    return ctxt->opcode == X86EMUL_OPC(0x0f, 0x32) ||  /* RDMSR */
> +           ctxt->opcode == X86EMUL_OPC(0x0f, 0x30);    /* WRMSR */
> +}

Personally I'd prefer if this was a single comparison:

    return (ctxt->opcode | 2) == X86EMUL_OPC(0x0f, 0x32);

But maybe nowadays' compilers are capable of this
transformation?

I notice you use this function only from PV priv-op emulation.
What about the call paths through hvmemul_{read,write}_msr()?
(It's also questionable whether the write paths need this -
the only MSR written outside of WRMSR emulation is
MSR_SHADOW_GS_BASE, which can't possibly reach the "unhandled"
logic anywhere. But maybe better to be future proof here in
case new MSR writes appear in the emulator, down the road.)

Jan

