Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44B1C59F3
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:48:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVysJ-0005T8-Ct; Tue, 05 May 2020 14:48:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVysH-0005T3-Uu
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:48:45 +0000
X-Inumbo-ID: 84e55e00-8edf-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84e55e00-8edf-11ea-b9cf-bc764e2007e4;
 Tue, 05 May 2020 14:48:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 96118AB3D;
 Tue,  5 May 2020 14:48:46 +0000 (UTC)
Subject: Re: [PATCH 09/16] x86/cpu: Adjust enable_nmis() to be shadow stack
 compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-10-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <478340f1-4238-1419-eeb7-c8c2ed7103a6@suse.com>
Date: Tue, 5 May 2020 16:48:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200501225838.9866-10-andrew.cooper3@citrix.com>
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
> When executing an IRET-to-self, the shadow stack must agree with the regular
> stack.  We can't manipulate SSP directly, so have to fake a shadow IRET frame
> by executing 3 CALLs, then editing the result to look correct.
> 
> This is not a fastpath, is called on the BSP long before CET can be set up,
> and may be called on the crash path after CET is disabled.  Use the fact that
> INCSSP is allocated from the hint nop space to construct a test for CET being
> active which is safe on all processors.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with a question which may make a further change necessary:

> --- a/xen/include/asm-x86/processor.h
> +++ b/xen/include/asm-x86/processor.h
> @@ -544,17 +544,40 @@ static inline void enable_nmis(void)
>  {
>      unsigned long tmp;
>  
> -    asm volatile ( "mov %%rsp, %[tmp]     \n\t"
> -                   "push %[ss]            \n\t"
> -                   "push %[tmp]           \n\t"
> -                   "pushf                 \n\t"
> -                   "push %[cs]            \n\t"
> -                   "lea 1f(%%rip), %[tmp] \n\t"
> -                   "push %[tmp]           \n\t"
> -                   "iretq; 1:             \n\t"
> -                   : [tmp] "=&r" (tmp)
> +    asm volatile ( "mov     %%rsp, %[rsp]        \n\t"
> +                   "lea    .Ldone(%%rip), %[rip] \n\t"
> +#ifdef CONFIG_XEN_SHSTK
> +                   /* Check for CET-SS being active. */
> +                   "mov    $1, %k[ssp]           \n\t"
> +                   "rdsspq %[ssp]                \n\t"
> +                   "cmp    $1, %k[ssp]           \n\t"
> +                   "je     .Lshstk_done          \n\t"
> +
> +                   /* Push 3 words on the shadow stack */
> +                   ".rept 3                      \n\t"
> +                   "call 1f; nop; 1:             \n\t"
> +                   ".endr                        \n\t"
> +
> +                   /* Fixup to be an IRET shadow stack frame */
> +                   "wrssq  %q[cs], -1*8(%[ssp])  \n\t"
> +                   "wrssq  %[rip], -2*8(%[ssp])  \n\t"
> +                   "wrssq  %[ssp], -3*8(%[ssp])  \n\t"
> +
> +                   ".Lshstk_done:"
> +#endif
> +                   /* Write an IRET regular frame */
> +                   "push   %[ss]                 \n\t"
> +                   "push   %[rsp]                \n\t"
> +                   "pushf                        \n\t"
> +                   "push   %q[cs]                \n\t"
> +                   "push   %[rip]                \n\t"
> +                   "iretq                        \n\t"
> +                   ".Ldone:                      \n\t"
> +                   : [rip] "=&r" (tmp),
> +                     [rsp] "=&r" (tmp),
> +                     [ssp] "=&r" (tmp)

Even after an hour of reading and searching through the gcc docs
I can't convince myself that this utilizes defined behavior. We
do tie multiple outputs to the same C variable elsewhere, yes,
but only in cases where we don't really care about the register,
or where the register is a fixed one anyway. What I can't find
is a clear statement that gcc wouldn't ever, now or in the
future, use the same register for all three outputs. I think one
can deduce this in certain ways, and experimentation also seems
to confirm it, but still.

Jan

