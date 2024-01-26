Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8DF83E191
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 19:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672468.1046528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQy9-0003ru-Q0; Fri, 26 Jan 2024 18:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672468.1046528; Fri, 26 Jan 2024 18:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTQy9-0003q6-Mm; Fri, 26 Jan 2024 18:30:25 +0000
Received: by outflank-mailman (input) for mailman id 672468;
 Fri, 26 Jan 2024 18:30:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rTQy7-0003q0-Ro
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 18:30:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTQy6-0002G5-7F; Fri, 26 Jan 2024 18:30:22 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.150.130]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTQy5-0006Sv-VX; Fri, 26 Jan 2024 18:30:22 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=DMqJcEQQc8vNOCxLJjY+I9w5i6sv3ny7DBsDu2y+UDg=; b=ykTjer/dA5N+SwVDVqg5cLmzuG
	mXe7qgAhBvUehlQkfcSuEgoBMDSjE//jaREQgonM6VGjumdLl69MkAom2XjoHQKrI3Qnud3HmZjJB
	qZ8pOHQPVDS8vQ+Fv4s2I8ePXMQ7AeIvYSolYvRAQMMm0SSceGvYFtPXc3uhuMuqfLC0=;
Message-ID: <07660850-5b7a-4811-997e-8237e575f429@xen.org>
Date: Fri, 26 Jan 2024 18:30:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/9] x86/boot: choose AP stack based on APIC ID
Content-Language: en-GB
To: Krystian Hebel <krystian.hebel@3mdeb.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <0e7dd957b6f26fa7b752bdce1ef6ebe97c825903.1699982111.git.krystian.hebel@3mdeb.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0e7dd957b6f26fa7b752bdce1ef6ebe97c825903.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am not too familiary with the x86 boot code. But I will give a try to 
review :).

On 14/11/2023 17:49, Krystian Hebel wrote:
> This is made as first step of making parallel AP bring-up possible. It
> should be enough for pre-C code.
> 
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> ---
>   xen/arch/x86/boot/trampoline.S | 20 ++++++++++++++++++++
>   xen/arch/x86/boot/x86_64.S     | 28 +++++++++++++++++++++++++++-
>   xen/arch/x86/setup.c           |  7 +++++++
>   3 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
> index b8ab0ffdcbb0..ec254125016d 100644
> --- a/xen/arch/x86/boot/trampoline.S
> +++ b/xen/arch/x86/boot/trampoline.S
> @@ -72,6 +72,26 @@ trampoline_protmode_entry:
>           mov     $X86_CR4_PAE,%ecx
>           mov     %ecx,%cr4
>   
> +        /*
> +         * Get APIC ID while we're in non-paged mode. Start by checking if
> +         * x2APIC is enabled.
> +         */
> +        mov     $MSR_APIC_BASE, %ecx
> +        rdmsr
> +        and     $APIC_BASE_EXTD, %eax
> +        jnz     .Lx2apic
> +
> +        /* Not x2APIC, read from MMIO */
> +        mov     0xfee00020, %esp
> +        shr     $24, %esp
> +        jmp     1f
> +
> +.Lx2apic:
> +        mov     $(MSR_X2APIC_FIRST + (0x20 >> 4)), %ecx
> +        rdmsr
> +        mov     %eax, %esp
> +1:
> +
>           /* Load pagetable base register. */
>           mov     $sym_offs(idle_pg_table),%eax
>           add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
> diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
> index 04bb62ae8680..b85b47b5c1a0 100644
> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -15,7 +15,33 @@ ENTRY(__high_start)
>           mov     $XEN_MINIMAL_CR4,%rcx
>           mov     %rcx,%cr4
>   
> -        mov     stack_start(%rip),%rsp
> +        test    %ebx,%ebx
> +        cmovz   stack_start(%rip), %rsp
> +        jz      .L_stack_set
> +
> +        /* APs only: get stack base from APIC ID saved in %esp. */
> +        mov     $-1, %rax
> +        lea     x86_cpu_to_apicid(%rip), %rcx
I would consider to move this patch after #2 and #3, so the logic is not 
modified again. This would help the review.

> +1:
> +        add     $1, %rax
> +        cmp     $NR_CPUS, %eax
> +        jb      2f
I think we can get rid of this jump by reworking the loop so %eax is 
tested as the end of the loop. But this is boot code, so it is possibly 
not worth it. I will leave the x86 maintainers commenting.

> +        hlt
> +2:
> +        cmp     %esp, (%rcx, %rax, 4)
> +        jne     1b
> +
> +        /* %eax is now Xen CPU index. */
> +        lea     stack_base(%rip), %rcx
> +        mov     (%rcx, %rax, 8), %rsp
> +
> +        test    %rsp,%rsp
> +        jnz     1f
> +        hlt
> +1:
NIT: Can you use 3? This makes the code easier to read and less prone to 
error (you have two very close 1).

> +        add     $(STACK_SIZE - CPUINFO_sizeof), %rsp
> +
> +.L_stack_set:
>   
>           /* Reset EFLAGS (subsumes CLI and CLD). */
>           pushq   $0
> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index a3d3f797bb1e..1285969901e0 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1951,6 +1951,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>        */
>       if ( !pv_shim )
>       {
> +        /* Separate loop to make parallel AP bringup possible. */

The loop split seems to be unrelated to this patch. Actually, I was 
expecting that only the assembly code would be modified.

>           for_each_present_cpu ( i )
>           {
>               /* Set up cpu_to_node[]. */
> @@ -1958,6 +1959,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>               /* Set up node_to_cpumask based on cpu_to_node[]. */
>               numa_add_cpu(i);
>   
> +            if ( stack_base[i] == NULL )
> +                stack_base[i] = cpu_alloc_stack(i);

I don't quite understand this change at least in the context of this 
patch. AFAICT the stack will be currently allocated in 
cpu_smpboot_callback() which is called while the CPU is prepared. So you 
should not need this allocation right now.

Looking at the rest of the series, it seems you allocate the stack 
earlier so you start the CPU bring-up earlier. But they will still be 
held in assembly code until cpu_up() is called.

So effectively, part of the C part of the CPUs bring-up is still 
serialized. Did I understand the logic correctly?

If so, I would suggest to clarify it in the series because this wasn't 
obvious to me (I was expecting start_secondary() would also run in 
parallell).

Regarding the change in setup.c, I think it would make more sense in 
patch #9.

Cheers,

-- 
Julien Grall

