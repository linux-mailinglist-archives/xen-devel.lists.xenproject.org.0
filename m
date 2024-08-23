Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2195D18E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 17:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782425.1191915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shWKI-0000sn-9X; Fri, 23 Aug 2024 15:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782425.1191915; Fri, 23 Aug 2024 15:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shWKI-0000qT-6t; Fri, 23 Aug 2024 15:35:46 +0000
Received: by outflank-mailman (input) for mailman id 782425;
 Fri, 23 Aug 2024 15:35:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RGR=PW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1shWKG-0000qN-6N
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 15:35:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b7e4b52-6165-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 17:35:43 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 180BA4EE0798;
 Fri, 23 Aug 2024 17:35:42 +0200 (CEST)
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
X-Inumbo-ID: 5b7e4b52-6165-11ef-a50a-bb4a2ccca743
MIME-Version: 1.0
Date: Fri, 23 Aug 2024 17:35:42 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 9/9] x86/bitops: Use the POPCNT instruction when available
In-Reply-To: <20240822230635.954557-10-andrew.cooper3@citrix.com>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-10-andrew.cooper3@citrix.com>
Message-ID: <e303115f11e70fbb5c290cf29e65159d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2024-08-23 01:06, Andrew Cooper wrote:
> It has existed in x86 CPUs since 2008, so we're only 16 years late 
> adding
> support.  With all the other scafolding in place, implement 
> arch_hweightl()
> for x86.
> 
> The only complication is that the call to arch_generic_hweightl() is 
> behind
> the compilers back.  Address this by writing it in ASM and ensure that 
> it
> preserves all registers.
> 
> Copy the code generation from generic_hweightl().  It's not a 
> complicated
> algorithm, and is easy to regenerate if needs be, but cover it with the 
> same
> unit tests as test_generic_hweightl() just for piece of mind.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> A few RFC points.
> 
>  * I throught we had an x86 general lib-y but I can't find one, hence 
> why it's
>    still in xen/lib/ for now.
> 
>  * When we up the minimum toolchain to GCC 7 / Clang 5, we can use a
>    __attribute__((no_caller_saved_registers)) and can forgo writing 
> this in asm.
> 
>    GCC seems to need extra help, and wants -mgeneral-regs-only too.  It 
> has a
>    habit of complaining about incompatible instructions even when it's 
> not
>    emitting them.
> ---

> diff --git a/xen/lib/arch-generic-hweightl.S 
> b/xen/lib/arch-generic-hweightl.S
> new file mode 100644
> index 000000000000..15c6e3394845
> --- /dev/null
> +++ b/xen/lib/arch-generic-hweightl.S
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +        .file __FILE__
> +
> +#include <xen/linkage.h>
> +
> +/*
> + * An implementation of generic_hweightl() used on hardware without 
> the POPCNT
> + * instruction.
> + *
> + * This function is called from within an ALTERNATIVE in 
> arch_hweightl().
> + * i.e. behind the back of the compiler.  Therefore all registers are 
> callee
> + * preserved.
> + *
> + * The ASM is what GCC-12 emits for generic_hweightl() in a release 
> build of
> + * Xen, with spilling of %rdi/%rdx to preserve the callers registers.
> + */
> +FUNC(arch_generic_hweightl)
> +        push   %rdi
> +        push   %rdx
> +
> +        movabs $0x5555555555555555, %rdx
> +        mov    %rdi, %rax
> +        shr    $1, %rax
> +        and    %rdx, %rax
> +        sub    %rax, %rdi
> +        movabs $0x3333333333333333, %rax
> +        mov    %rdi, %rdx
> +        shr    $0x2, %rdi
> +        and    %rax, %rdx
> +        and    %rax, %rdi
> +        add    %rdi, %rdx
> +        mov    %rdx, %rax
> +        shr    $0x4, %rax
> +        add    %rdx, %rax
> +        movabs $0xf0f0f0f0f0f0f0f, %rdx
> +        and    %rdx, %rax
> +        movabs $0x101010101010101, %rdx
> +        imul   %rdx, %rax
> +        shr    $0x38, %rax
> +
> +        pop    %rdx
> +        pop    %rdi
> +
> +        ret
> +END(arch_generic_hweightl)
> diff --git a/xen/lib/generic-hweightl.c b/xen/lib/generic-hweightl.c
> index fa4bbec273ab..4b39dd84de5e 100644
> --- a/xen/lib/generic-hweightl.c
> +++ b/xen/lib/generic-hweightl.c
> @@ -43,4 +43,19 @@ static void __init __constructor 
> test_generic_hweightl(void)
>      RUNTIME_CHECK(generic_hweightl, 1 | (1UL << (BITS_PER_LONG - 1)), 
> 2);
>      RUNTIME_CHECK(generic_hweightl, -1UL, BITS_PER_LONG);
>  }
> +
> +#ifdef CONFIG_X86
> +unsigned int arch_generic_hweightl(unsigned long);

Hi Andrew,

do you mind putting a parameter name here, as the current form 
introduces a violation of MISRA Rule 8.2 [1] (even if unnecessary, given 
its implementation)?

Thanks,
  Nicola

[1] 
https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/patchew/xen/ECLAIR_normal/patchew/20240822230635.954557-1-andrew.cooper3@citrix.com/X86_64/7647484702/PROJECT.ecd;/by_service/MC3R1.R8.2.html

> +static void __init __constructor test_arch_generic_hweightl(void)
> +{
> +    RUNTIME_CHECK(arch_generic_hweightl, 0, 0);
> +    RUNTIME_CHECK(arch_generic_hweightl, 1, 1);
> +    RUNTIME_CHECK(arch_generic_hweightl, 3, 2);
> +    RUNTIME_CHECK(arch_generic_hweightl, 7, 3);
> +    RUNTIME_CHECK(arch_generic_hweightl, 0xff, 8);
> +
> +    RUNTIME_CHECK(arch_generic_hweightl, 1 | (1UL << (BITS_PER_LONG - 
> 1)), 2);
> +    RUNTIME_CHECK(arch_generic_hweightl, -1UL, BITS_PER_LONG);
> +}
> +#endif /* CONFIG_X86 */
>  #endif /* CONFIG_SELF_TESTS */

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

