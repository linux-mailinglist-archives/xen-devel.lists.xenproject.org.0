Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 371891E6737
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 18:16:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeLBz-0007t4-37; Thu, 28 May 2020 16:15:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jeLBy-0007sz-Cf
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 16:15:38 +0000
X-Inumbo-ID: 76fe2372-a0fe-11ea-a806-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76fe2372-a0fe-11ea-a806-12813bfff9fa;
 Thu, 28 May 2020 16:15:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A451B1B4;
 Thu, 28 May 2020 16:15:35 +0000 (UTC)
Subject: Re: [PATCH v2 10/14] x86/extable: Adjust extable handling to be
 shadow stack compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-11-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b36b5868-0b7c-2b45-a994-0ff5ea170433@suse.com>
Date: Thu, 28 May 2020 18:15:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527191847.17207-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 27.05.2020 21:18, Andrew Cooper wrote:
> @@ -400,6 +400,18 @@ unsigned long get_stack_trace_bottom(unsigned long sp)
>      }
>  }
>  
> +static unsigned long get_shstk_bottom(unsigned long sp)
> +{
> +    switch ( get_stack_page(sp) )
> +    {
> +#ifdef CONFIG_XEN_SHSTK
> +    case 0:  return ROUNDUP(sp, IST_SHSTK_SIZE) - sizeof(unsigned long);
> +    case 5:  return ROUNDUP(sp, PAGE_SIZE)      - sizeof(unsigned long);

PRIMARY_SHSTK_SLOT please and, if introduced as suggested for the
earlier patch, IST_SHSTK_SLOT in the earlier line.

> @@ -763,6 +775,56 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
>            trapnr, vec_name(trapnr), regs->error_code);
>  }
>  
> +static void extable_shstk_fixup(struct cpu_user_regs *regs, unsigned long fixup)
> +{
> +    unsigned long ssp, *ptr, *base;
> +
> +    asm ( "rdsspq %0" : "=r" (ssp) : "0" (1) );
> +    if ( ssp == 1 )
> +        return;
> +
> +    ptr = _p(ssp);
> +    base = _p(get_shstk_bottom(ssp));
> +
> +    for ( ; ptr < base; ++ptr )
> +    {
> +        /*
> +         * Search for %rip.  The shstk currently looks like this:
> +         *
> +         *   ...  [Likely pointed to by SSP]
> +         *   %cs  [== regs->cs]
> +         *   %rip [== regs->rip]
> +         *   SSP  [Likely points to 3 slots higher, above %cs]
> +         *   ...  [call tree to this function, likely 2/3 slots]
> +         *
> +         * and we want to overwrite %rip with fixup.  There are two
> +         * complications:
> +         *   1) We cant depend on SSP values, because they won't differ by 3
> +         *      slots if the exception is taken on an IST stack.
> +         *   2) There are synthetic (unrealistic but not impossible) scenarios
> +         *      where %rip can end up in the call tree to this function, so we
> +         *      can't check against regs->rip alone.
> +         *
> +         * Check for both reg->rip and regs->cs matching.

Nit: regs->rip

> +         */
> +
> +        if ( ptr[0] == regs->rip && ptr[1] == regs->cs )
> +        {
> +            asm ( "wrssq %[fix], %[stk]"
> +                  : [stk] "=m" (*ptr)

Could this be ptr[0], to match the if()?

Considering how important it is that we don't fix up the wrong stack
location here, I continue to wonder if we wouldn't better also
include the SSP value on the stack in the checking, at the very
least by way of an ASSERT() or BUG_ON(). Since, with how the code is
currently written, this would require a somewhat odd looking ptr[-1]
I also wonder whether "while ( ++ptr < base )" as the loop header
wouldn't be better. The first entry on the stack can't be the RIP
we look for anyway, can it?

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -708,7 +708,16 @@ exception_with_ints_disabled:
>          call  search_pre_exception_table
>          testq %rax,%rax                 # no fixup code for faulting EIP?
>          jz    1b
> -        movq  %rax,UREGS_rip(%rsp)
> +        movq  %rax,UREGS_rip(%rsp)      # fixup regular stack
> +
> +#ifdef CONFIG_XEN_SHSTK
> +        mov    $1, %edi
> +        rdsspq %rdi
> +        cmp    $1, %edi
> +        je     .L_exn_shstk_done
> +        wrssq  %rax, (%rdi)             # fixup shadow stack

According to the comment in extable_shstk_fixup(), isn't the value
to be replaced at 8(%rdi)?

Jan

