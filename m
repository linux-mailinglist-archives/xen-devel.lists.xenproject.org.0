Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C1F1AB9A1
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 09:20:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOyoM-0000Oi-HD; Thu, 16 Apr 2020 07:19:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jOyoL-0000OZ-8i
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 07:19:45 +0000
X-Inumbo-ID: a472003e-7fb2-11ea-8b5c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a472003e-7fb2-11ea-8b5c-12813bfff9fa;
 Thu, 16 Apr 2020 07:19:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BD113AD4B;
 Thu, 16 Apr 2020 07:19:41 +0000 (UTC)
Subject: Re: [PATCH] x86/boot: Fix early exception handling with
 CONFIG_PERF_COUNTERS
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200415173911.13286-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <72b35bfa-e795-72c0-d925-924ca18711df@suse.com>
Date: Thu, 16 Apr 2020 09:19:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415173911.13286-1-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 19:39, Andrew Cooper wrote:
> The PERFC_INCR() macro uses current->processor, but current is not valid
> during early boot.  This causes the following crash to occur if
> e.g. rdmsr_safe() has to recover from a #GP fault.
> 
>   (XEN) Early fatal page fault at e008:ffff82d0803b1a39 (cr2=0000000000000004, ec=0000)
>   (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
>   (XEN) CPU:    0
>   (XEN) RIP:    e008:[<ffff82d0803b1a39>] x86_64/entry.S#handle_exception_saved+0x64/0xb8
>   ...
>   (XEN) Xen call trace:
>   (XEN)    [<ffff82d0803b1a39>] R x86_64/entry.S#handle_exception_saved+0x64/0xb8
>   (XEN)    [<ffff82d0806394fe>] F __start_xen+0x2cd/0x2980
>   (XEN)    [<ffff82d0802000ec>] F __high_start+0x4c/0x4e
> 
> Furthermore, the PERFC_INCR() macro is wildly inefficient.  There has been a
> single caller for many releases now, so inline it and delete the macro
> completely.
> 
> For the assembly, move entry_vector from %eax into %ecx.  There is no encoding
> benefit for movzbl, and it frees up %eax to be used inside the
> CONFIG_PERF_COUNTERS block where there is an encoding benefit.

I don't mind the change in register use, but I'd certainly like to
understand the supposed "encoding benefit". Afaics ...

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -677,10 +677,14 @@ handle_exception_saved:
>  #endif /* CONFIG_PV */
>          sti
>  1:      movq  %rsp,%rdi
> -        movzbl UREGS_entry_vector(%rsp),%eax
> +        movzbl UREGS_entry_vector(%rsp), %ecx
>          leaq  exception_table(%rip),%rdx
> -        PERFC_INCR(exceptions, %rax, %rbx)
> -        mov   (%rdx, %rax, 8), %rdx
> +#ifdef CONFIG_PERF_COUNTERS
> +        lea   per_cpu__perfcounters(%rip), %rax
> +        add   STACK_CPUINFO_FIELD(per_cpu_offset)(%r14), %rax
> +        incl  ASM_PERFC_exceptions * 4(%rax, %rcx, 4)
> +#endif

... all insns inside the block use a ModR/M byte, and there's also
no special SIB encoding form used (i.e. one where the disp size
would increase because of register choice).

With this clarified, i.e. possibly the commit message updated
accordingly, and possibly even code churn reduced by undoing the
change of register used,
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

