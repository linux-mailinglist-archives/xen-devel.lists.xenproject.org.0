Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD6C6C3843
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:34:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512917.793323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefrQ-0002oh-UR; Tue, 21 Mar 2023 17:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512917.793323; Tue, 21 Mar 2023 17:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefrQ-0002ln-R7; Tue, 21 Mar 2023 17:33:24 +0000
Received: by outflank-mailman (input) for mailman id 512917;
 Tue, 21 Mar 2023 17:33:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pefrP-0002lh-1F
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:33:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pefrN-00038I-N9; Tue, 21 Mar 2023 17:33:21 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pefrN-0005yF-GY; Tue, 21 Mar 2023 17:33:21 +0000
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
	bh=HfCLoWMuf8B55rZTkUj91ltsOpTx+7jXwQ5Zm1Ezhx0=; b=f+6iNqh69IevGRYB0IoxMIc7+q
	VxftfO2/OwJkl+VLFRczC4NATtCrk8zYNtBS6PMmahawew7AaD9j28XSAZQy4tDQWVbcYFl8rxCO2
	8smN1qFGElwnzW/Ocl85EgzRFg3fGMHaSgoyV5wqEVwaQBbLit8nCE1JrF+OQ4RQeoCo=;
Message-ID: <0b94be57-b8fb-6c38-9ed8-dc8482694153@xen.org>
Date: Tue, 21 Mar 2023 17:33:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v5 4/7] xen/riscv: introduce decode_cause() stuff
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
 <8c7b4a5d328be8b1cd2aa99c8d9a7883e4969600.1678976127.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8c7b4a5d328be8b1cd2aa99c8d9a7883e4969600.1678976127.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 16/03/2023 14:39, Oleksii Kurochko wrote:
> The patch introduces stuff needed to decode a reason of an
> exception.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V5:
>    - Remove <xen/error.h> from riscv/traps/c as nothing would require
>      inclusion.
>    - decode_reserved_interrupt_cause(), decode_interrupt_cause(), decode_cause, do_unexpected_trap()
>      were made as static they are expected to be used only in traps.c
>    - use LINK_TO_LOAD() for addresses which can be linker time relative.
> ---
> Changes in V4:
>    - fix string in decode_reserved_interrupt_cause()
> ---
> Changes in V3:
>    - Nothing changed
> ---
> Changes in V2:
>    - Make decode_trap_cause() more optimization friendly.
>    - Merge the pathc which introduces do_unexpected_trap() to the current one.
> ---
>   xen/arch/riscv/traps.c | 87 +++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 86 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> index ccd3593f5a..8a1529e0c5 100644
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -4,10 +4,95 @@
>    *
>    * RISC-V Trap handlers
>    */
> +
> +#include <xen/lib.h>
> +
> +#include <asm/boot-info.h>
> +#include <asm/csr.h>
> +#include <asm/early_printk.h>
>   #include <asm/processor.h>
>   #include <asm/traps.h>
>   
> -void do_trap(struct cpu_user_regs *cpu_regs)
> +static const char *decode_trap_cause(unsigned long cause)
> +{
> +    static const char *const trap_causes[] = {
> +        [CAUSE_MISALIGNED_FETCH] = "Instruction Address Misaligned",
> +        [CAUSE_FETCH_ACCESS] = "Instruction Access Fault",
> +        [CAUSE_ILLEGAL_INSTRUCTION] = "Illegal Instruction",
> +        [CAUSE_BREAKPOINT] = "Breakpoint",
> +        [CAUSE_MISALIGNED_LOAD] = "Load Address Misaligned",
> +        [CAUSE_LOAD_ACCESS] = "Load Access Fault",
> +        [CAUSE_MISALIGNED_STORE] = "Store/AMO Address Misaligned",
> +        [CAUSE_STORE_ACCESS] = "Store/AMO Access Fault",
> +        [CAUSE_USER_ECALL] = "Environment Call from U-Mode",
> +        [CAUSE_SUPERVISOR_ECALL] = "Environment Call from S-Mode",
> +        [CAUSE_MACHINE_ECALL] = "Environment Call from M-Mode",
> +        [CAUSE_FETCH_PAGE_FAULT] = "Instruction Page Fault",
> +        [CAUSE_LOAD_PAGE_FAULT] = "Load Page Fault",
> +        [CAUSE_STORE_PAGE_FAULT] = "Store/AMO Page Fault",
> +        [CAUSE_FETCH_GUEST_PAGE_FAULT] = "Instruction Guest Page Fault",
> +        [CAUSE_LOAD_GUEST_PAGE_FAULT] = "Load Guest Page Fault",
> +        [CAUSE_VIRTUAL_INST_FAULT] = "Virtualized Instruction Fault",
> +        [CAUSE_STORE_GUEST_PAGE_FAULT] = "Guest Store/AMO Page Fault",
> +    };
> +
> +    if ( cause < ARRAY_SIZE(trap_causes) && trap_causes[cause] )
> +        return trap_causes[cause];
> +    return "UNKNOWN";
> +}
> +
> +static const char *decode_reserved_interrupt_cause(unsigned long irq_cause)
> +{
> +    switch ( irq_cause )
> +    {
> +    case IRQ_M_SOFT:
> +        return "M-mode Software Interrupt";
> +    case IRQ_M_TIMER:
> +        return "M-mode TIMER Interrupt";
> +    case IRQ_M_EXT:
> +        return "M-mode External Interrupt";
> +    default:
> +        return "UNKNOWN IRQ type";
> +    }
> +}
> +
> +static const char *decode_interrupt_cause(unsigned long cause)
> +{
> +    unsigned long irq_cause = cause & ~CAUSE_IRQ_FLAG;
> +
> +    switch ( irq_cause )
> +    {
> +    case IRQ_S_SOFT:
> +        return "Supervisor Software Interrupt";
> +    case IRQ_S_TIMER:
> +        return "Supervisor Timer Interrupt";
> +    case IRQ_S_EXT:
> +        return "Supervisor External Interrupt";
> +    default:
> +        return decode_reserved_interrupt_cause(irq_cause);
> +    }
> +}
> +
> +static const char *decode_cause(unsigned long cause)
> +{
> +    if ( cause & CAUSE_IRQ_FLAG )
> +        return decode_interrupt_cause(cause);
> +
> +    return decode_trap_cause(cause);
> +}
> +
> +static void do_unexpected_trap(const struct cpu_user_regs *regs)
>   {
> +    unsigned long cause = csr_read(CSR_SCAUSE);
> +
> +    early_printk("Unhandled exception: ");
> +    early_printk(LINK_TO_LOAD(decode_cause(cause)));

The use of LINK_TO_LOAD is the sort of things that is worth documenting 
because this would raise quite a few questions.

The comment on top of LINK_TO_LOAD suggests the macro can only be used 
while the MMU is off. But I would expect do_unexpected_trap() to be used 
also after the MMU is on. Isn't it going to be the case?

Furthermore, AFAICT LINK_TO_LOAD() assumes that a runtime address is 
given. While I believe this could be true for pointer returned by 
decode_trap_cause() (I remember seen on Arm that an array of string 
would store the runtime address), I am not convinced this is the case 
for pointer returned by decode_interrupt_cause().

Lastly, I think you will want to document what functions can be used 
when the MMU is off and possibly splitting the code. So it is easier for 
someone to figure out in which context the function and if this is safe 
to use.

Cheers,

-- 
Julien Grall

