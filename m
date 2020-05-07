Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E501C8C7A
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 15:36:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWggg-0003nV-AD; Thu, 07 May 2020 13:35:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWgge-0003nQ-Uu
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 13:35:40 +0000
X-Inumbo-ID: a3b4bd4c-9067-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3b4bd4c-9067-11ea-ae69-bc764e2007e4;
 Thu, 07 May 2020 13:35:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 428A0ACFA;
 Thu,  7 May 2020 13:35:41 +0000 (UTC)
Subject: Re: [PATCH 12/16] x86/extable: Adjust extable handling to be shadow
 stack compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-13-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e80c672-9308-f7ad-67ea-69d83d69bc03@suse.com>
Date: Thu, 7 May 2020 15:35:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200501225838.9866-13-andrew.cooper3@citrix.com>
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

On 02.05.2020 00:58, Andrew Cooper wrote:
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -778,6 +778,28 @@ static bool exception_fixup(struct cpu_user_regs *regs, bool print)
>                 vec_name(regs->entry_vector), regs->error_code,
>                 _p(regs->rip), _p(regs->rip), _p(fixup));
>  
> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
> +    {
> +        unsigned long ssp;
> +
> +        asm ("rdsspq %0" : "=r" (ssp) : "0" (1) );
> +        if ( ssp != 1 )
> +        {
> +            unsigned long *ptr = _p(ssp);
> +
> +            /* Search for %rip in the shadow stack, ... */
> +            while ( *ptr != regs->rip )
> +                ptr++;

Wouldn't it be better to bound the loop, as it shouldn't search past
(strictly speaking not even to) the next page boundary? Also you
don't care about the top of the stack (being the to be restored SSP),
do you? I.e. maybe

            while ( *++ptr != regs->rip )
                ;

?

And then - isn't searching for a specific RIP value alone prone to
error, in case a it matches an ordinary return address? I.e.
wouldn't you better search for a matching RIP accompanied by a
suitable pointer into the shadow stack and a matching CS value?
Otherwise, ...

> +            ASSERT(ptr[1] == __HYPERVISOR_CS);

... also assert that ptr[-1] points into the shadow stack?

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
> +.L_exn_shstk_done:
> +#endif

Again avoid the conditional jump by using alternatives patching?

Jan

