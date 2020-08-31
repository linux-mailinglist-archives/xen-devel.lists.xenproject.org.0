Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CD225793B
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 14:30:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCivt-0005T3-UF; Mon, 31 Aug 2020 12:29:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kCivt-0005Sy-1Y
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 12:29:09 +0000
X-Inumbo-ID: 05ad85bc-5273-4434-aa7d-3a69a6cac3a9
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05ad85bc-5273-4434-aa7d-3a69a6cac3a9;
 Mon, 31 Aug 2020 12:29:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB04FB7E1;
 Mon, 31 Aug 2020 12:29:06 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Fix multiple bugs with SEGBASE_GS_USER_SEL
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andy Lutomirski <luto@kernel.org>
References: <20200831111832.25275-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b31767db-3b91-7799-92a1-44c7600af8de@suse.com>
Date: Mon, 31 Aug 2020 14:29:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200831111832.25275-1-andrew.cooper3@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.08.2020 13:18, Andrew Cooper wrote:
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -1059,16 +1059,52 @@ long do_set_segment_base(unsigned int which, unsigned long base)
>          break;
>  
>      case SEGBASE_GS_USER_SEL:
> -        __asm__ __volatile__ (
> -            "     swapgs              \n"
> -            "1:   movl %k0,%%gs       \n"
> -            "    "safe_swapgs"        \n"
> -            ".section .fixup,\"ax\"   \n"
> -            "2:   xorl %k0,%k0        \n"
> -            "     jmp  1b             \n"
> -            ".previous                \n"
> -            _ASM_EXTABLE(1b, 2b)
> -            : "+r" (base) );
> +        /*
> +         * We wish to update the user %gs from the GDT/LDT.  Currently, the
> +         * guest kernel's GS_BASE is in context.
> +         */
> +        asm volatile ( "swapgs" );
> +
> +        if ( base <= 3 )

Either !(base & 0xfffc) or you want to truncate the input to
uint16_t first. The upper 48 bits have always been ignored. With
this addressed one way or another
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Yet two more minor comments:

> +        {
> +            /* Work around NUL segment behaviour on AMD hardware. */
> +            if ( boot_cpu_data.x86_vendor &
> +                 (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
> +                asm volatile ( "mov %[sel], %%gs"
> +                               :: [sel] "rm" (FLAT_USER_DS32) );
> +        }
> +        else
> +            /* Fix up RPL. */
> +            base |= 3;

For a fair part of this block you could save a level of indentation
by inverting the initial condition and using "else if" later on.

> +        /*
> +         * Load the chosen selector, with fault handling.
> +         *
> +         * Errors ought to fail the hypercall, but that was never built in
> +         * originally, and Linux will BUG() if this call fails.
> +         *
> +         * NUL the selector in the case of an error.  This too needs to deal
> +         * with the AMD NUL segment behaviour, but it is already a slowpath in
> +         * #GP context so perform the flat load unconditionally to avoid
> +         * complicated logic.
> +         *
> +         * Anyone wanting to check for errors from this hypercall should
> +         * re-read %gs and compare against the input 'base' selector.
> +         */
> +        asm volatile ( "1: mov %k[sel], %%gs\n\t"
> +                       ".section .fixup, \"ax\", @progbits\n\t"
> +                       "2: mov %k[flat], %%gs\n\t"
> +                       "   xor %k[sel], %k[sel]\n\t"
> +                       "   jmp 1b\n\t"
> +                       ".previous\n\t"
> +                       _ASM_EXTABLE(1b, 2b)
> +                       : [sel] "+r" (base)
> +                       : [flat] "rm" (FLAT_USER_DS32) );

"m" is pointless to specify here - the compiler won't instantiate a
memory variable when the value is an immediate. This can be observed
best when you specify _just_ "m" here.

Jan

