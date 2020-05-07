Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821EE1C8BEE
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 15:18:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWgP2-0001sW-T5; Thu, 07 May 2020 13:17:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWgP1-0001sN-2p
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 13:17:27 +0000
X-Inumbo-ID: 17f75d52-9065-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17f75d52-9065-11ea-b07b-bc764e2007e4;
 Thu, 07 May 2020 13:17:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6CA0BB01C;
 Thu,  7 May 2020 13:17:27 +0000 (UTC)
Subject: Re: [PATCH 10/16] x86/cpu: Adjust reset_stack_and_jump() to be shadow
 stack compatible
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-11-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c0dfd8f-38c0-ca32-886d-94cb4698e63b@suse.com>
Date: Thu, 7 May 2020 15:17:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200501225838.9866-11-andrew.cooper3@citrix.com>
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

On 02.05.2020 00:58, Andrew Cooper wrote:
> We need to unwind up to the supervisor token.  See the comment for details.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/include/asm-x86/current.h | 42 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/asm-x86/current.h b/xen/include/asm-x86/current.h
> index 99b66a0087..2a7b728b1e 100644
> --- a/xen/include/asm-x86/current.h
> +++ b/xen/include/asm-x86/current.h
> @@ -124,13 +124,49 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>  # define CHECK_FOR_LIVEPATCH_WORK ""
>  #endif
>  
> +#ifdef CONFIG_XEN_SHSTK
> +/*
> + * We need to unwind the primary shadow stack to its supervisor token, located
> + * at 0x5ff8 from the base of the stack blocks.
> + *
> + * Read the shadow stack pointer, subtract it from 0x5ff8, divide by 8 to get
> + * the number of slots needing popping.
> + *
> + * INCSSPQ can't pop more than 255 entries.  We shouldn't ever need to pop
> + * that many entries, and getting this wrong will cause us to #DF later.
> + */
> +# define SHADOW_STACK_WORK                      \
> +    "mov $1, %[ssp];"                           \
> +    "rdsspd %[ssp];"                            \
> +    "cmp $1, %[ssp];"                           \
> +    "je 1f;" /* CET not active?  Skip. */       \
> +    "mov $"STR(0x5ff8)", %[val];"               \

As per comments on earlier patches, I think it would be nice if
this wasn't a literal number here, but tied to actual stack
layout via some suitable expression. An option might be to use
0xff8 (or the constant to be introduced for it in the earlier
patch) here and ...

> +    "and $"STR(STACK_SIZE - 1)", %[ssp];"       \

... PAGE_SIZE here.

> +    "sub %[ssp], %[val];"                       \
> +    "shr $3, %[val];"                           \
> +    "cmp $255, %[val];"                         \
> +    "jle 2f;"                                   \

Perhaps better "jbe", treating the unsigned values as such?

> +    "ud2a;"                                     \
> +    "2: incsspq %q[val];"                       \
> +    "1:"
> +#else
> +# define SHADOW_STACK_WORK ""
> +#endif
> +
>  #define switch_stack_and_jump(fn, instr)                                \
>      ({                                                                  \
> +        unsigned int tmp;                                               \
>          __asm__ __volatile__ (                                          \
> -            "mov %0,%%"__OP"sp;"                                        \
> +            "cmc;"                                                      \
> +            SHADOW_STACK_WORK                                           \
> +            "mov %[stk], %%rsp;"                                        \
>              instr                                                       \
> -             "jmp %c1"                                                  \
> -            : : "r" (guest_cpu_user_regs()), "i" (fn) : "memory" );     \
> +            "jmp %c[fun];"                                              \
> +            : [val] "=&r" (tmp),                                        \
> +              [ssp] "=&r" (tmp)                                         \

See my concern on the earlier similar construct.

Jan

