Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B00B11C8E1A
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 16:13:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWhG6-0007Or-8q; Thu, 07 May 2020 14:12:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWhG4-0007Om-NU
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 14:12:16 +0000
X-Inumbo-ID: c001bfc4-906c-11ea-9f22-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c001bfc4-906c-11ea-9f22-12813bfff9fa;
 Thu, 07 May 2020 14:12:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E0F11AA7C;
 Thu,  7 May 2020 14:12:16 +0000 (UTC)
Subject: Re: [PATCH 15/16] x86/entry: Adjust guest paths to be shadow stack
 compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-16-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2df78612-2c24-32de-186a-c402e188478c@suse.com>
Date: Thu, 7 May 2020 16:12:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200501225838.9866-16-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.05.2020 00:58, Andrew Cooper wrote:
> The SYSCALL/SYSEXIT paths need to use {SET,CLR}SSBSY.

I take it you mean SYSRET, not SYSEXIT. I do think though that you
also need to deal with the SYSENTER entry point we have.

> --- a/xen/arch/x86/x86_64/compat/entry.S
> +++ b/xen/arch/x86/x86_64/compat/entry.S
> @@ -198,7 +198,7 @@ ENTRY(cr4_pv32_restore)
>  
>  /* See lstar_enter for entry register state. */
>  ENTRY(cstar_enter)
> -        /* sti could live here when we don't switch page tables below. */
> +        ALTERNATIVE "", "setssbsy", X86_FEATURE_XEN_SHSTK

I don't see why you delete the comment here (or elsewhere). While
I recall you not really wanting them there, I still think they're
useful to have, and they shouldn't be deleted as a side effect of
an entirely unrelated change. Of course they need to live after
your insertions then.

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -194,6 +194,15 @@ restore_all_guest:
>          movq  8(%rsp),%rcx            # RIP
>          ja    iret_exit_to_guest
>  
> +        /* Clear the supervisor shadow stack token busy bit. */
> +.macro rag_clrssbsy
> +        push %rax
> +        rdsspq %rax
> +        clrssbsy (%rax)
> +        pop %rax
> +.endm
> +        ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK

In principle you could get away without spilling %rax:

        cmpl  $1,%ecx
        ja    iret_exit_to_guest

        /* Clear the supervisor shadow stack token busy bit. */
.macro rag_clrssbsy
        rdsspq %rcx
        clrssbsy (%rcx)
.endm
        ALTERNATIVE "", rag_clrssbsy, X86_FEATURE_XEN_SHSTK
        movq  8(%rsp),%rcx            # RIP
        cmpw  $FLAT_USER_CS32,16(%rsp)# CS
        movq  32(%rsp),%rsp           # RSP
        je    1f
        sysretq
1:      sysretl

        ALIGN
/* No special register assumptions. */
iret_exit_to_guest:
        movq  8(%rsp),%rcx            # RIP
        andl  $~(X86_EFLAGS_IOPL|X86_EFLAGS_NT|X86_EFLAGS_VM),24(%rsp)
        ...

Also - what about CLRSSBSY failing? It would seem easier to diagnose
this right here than when getting presumably #DF upon next entry into
Xen. At the very least I think it deserves a comment if an error case
does not get handled.

Somewhat similar for SETSSBSY, except there things get complicated by
it raising #CP instead of setting EFLAGS.CF: Aiui it would require us
to handle #CP on an IST stack in order to avoid #DF there.

> @@ -877,6 +886,14 @@ handle_ist_exception:
>          movl  $UREGS_kernel_sizeof/8,%ecx
>          movq  %rdi,%rsp
>          rep   movsq
> +
> +        /* Switch Shadow Stacks */
> +.macro ist_switch_shstk
> +        rdsspq %rdi
> +        clrssbsy (%rdi)
> +        setssbsy
> +.endm

Could you extend the comment to mention the caveat that you point
out in the description?

Jan

