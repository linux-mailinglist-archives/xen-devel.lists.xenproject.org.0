Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 321CB691671
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 03:01:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493052.762871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQIik-0003lR-Be; Fri, 10 Feb 2023 02:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493052.762871; Fri, 10 Feb 2023 02:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQIik-0003i4-8v; Fri, 10 Feb 2023 02:01:02 +0000
Received: by outflank-mailman (input) for mailman id 493052;
 Fri, 10 Feb 2023 02:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uYSr=6G=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pQIii-0003hy-LD
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 02:01:00 +0000
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com
 [2607:f8b0:4864:20::a29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c29b9de0-a8e6-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 03:00:58 +0100 (CET)
Received: by mail-vk1-xa29.google.com with SMTP id v81so1964618vkv.5
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 18:00:58 -0800 (PST)
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
X-Inumbo-ID: c29b9de0-a8e6-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w1+QKU5JvS4tdko2OIBLzePqxsG9Ng28xzz9v2ybgZM=;
        b=cpV6YvfeKrFwSlOopNZQzXMfcl3OlzEu+nqJ6F/HpYOUQtAHyJGEpZ58qW4wKHbrcc
         emVZ/awCpsxspRmn+SELLZmYiPyZRZQngjYzkCwUVkwWKo/mQyydjr66ASE3SoJgBMzW
         RVFk54kZBBxTZUGOXRL19Gj3EX/OTyaY8hlzlObQ76vB0BZ9Q2wEJzAKKtbASz96DLSg
         c4Otyk5baMZUSYEioKLRVYwdjqsHIqjRO28Yb7JSFtBpE9IQiq7s/d5R3o1BZ29F3L5z
         OG9IpN13IirjTHNmKp5Ljjq9IIR9cA8QRq4B9Rup8Hn7AJ9IzkGY1Jw4GNTQKFTl5qmU
         FL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1+QKU5JvS4tdko2OIBLzePqxsG9Ng28xzz9v2ybgZM=;
        b=JsFkqGrA8w7A0G+CcAbObcL8ZdbUM6CHZ2yCEP/Z/B2hoh0lI5fUujTwuCnIzxcn3r
         WHCh/S4eqQ0qPvEeIAvQU/AJdhHOQ8S9s2fM1bHsZ96IOEbVAHFFHnrhBuPN/aWWWoZP
         +Be3jJyXsqARIdLHORh49/l0l0sad7MoX7eFQREujSouH7JKAlsnCYESuWrq5fFBrt8U
         zKN47pX7SJMkH3yFE0/+KTd6Mds8m1hG/V9MTjFwH3R3EH+BxVG3XTtSx9hj2fpAMRe2
         nC19OFi2bL8mP52R4bYfu3JZ5sBsb9FoJ9Clkr0vgpdPTHHhMlZHhMZz4yq0BoTYz9tE
         WHxg==
X-Gm-Message-State: AO0yUKUAVOqoEz4Qu2CIbDU9P7rlBC+Ph3M5POwwD5WMmsANlYf2arbI
	Oagfodi/R8Yk0fbunBVjP+NIGLrQgTIR4SYzAVk=
X-Google-Smtp-Source: AK7set86rFd0+/xoEiZ29FbQH7dGuAaHOUEUkumV3pl9keMcuJL5TjH+YqPW+8QWMbfvEvwm+TjpH6ANGBw6Kriv9gM=
X-Received: by 2002:a1f:2414:0:b0:3ea:3dee:4545 with SMTP id
 k20-20020a1f2414000000b003ea3dee4545mr2653666vkk.26.1675994457534; Thu, 09
 Feb 2023 18:00:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675779308.git.oleksii.kurochko@gmail.com> <0198e2a5b572b9031eafe7cd1c85c6f9537b704c.1675779308.git.oleksii.kurochko@gmail.com>
In-Reply-To: <0198e2a5b572b9031eafe7cd1c85c6f9537b704c.1675779308.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Feb 2023 12:00:31 +1000
Message-ID: <CAKmqyKNDZgrXZrXg9ttqFdxP8aZKAfiAEcNHn-VjqWhqDqUhpQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] xen/riscv: introduce decode_cause() stuff
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 8, 2023 at 12:48 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The patch introduces stuff needed to decode a reason of an
> exception.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>   - Nothing changed
> ---
> Changes in V2:
>   - Make decode_trap_cause() more optimization friendly.
>   - Merge the pathc which introduces do_unexpected_trap() to the current one.
> ---
>  xen/arch/riscv/traps.c | 85 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 84 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> index ccd3593f5a..f2a1e1ffcf 100644
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -4,10 +4,93 @@
>   *
>   * RISC-V Trap handlers
>   */
> +#include <asm/csr.h>
> +#include <asm/early_printk.h>
>  #include <asm/processor.h>
>  #include <asm/traps.h>
> +#include <xen/errno.h>
> +#include <xen/lib.h>
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
> +const char *decode_reserved_interrupt_cause(unsigned long irq_cause)
> +{
> +    switch ( irq_cause )
> +    {
> +    case IRQ_M_SOFT:
> +        return "M-mode Software Interrupt";
> +    case IRQ_M_TIMER:
> +        return "M-mode TIMER Interrupt";
> +    case IRQ_M_EXT:
> +        return "M-mode TIMER Interrupt";

Wrong string here

Alistair

> +    default:
> +        return "UNKNOWN IRQ type";
> +    }
> +}
> +
> +const char *decode_interrupt_cause(unsigned long cause)
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
> +const char *decode_cause(unsigned long cause)
> +{
> +    if ( cause & CAUSE_IRQ_FLAG )
> +        return decode_interrupt_cause(cause);
> +
> +    return decode_trap_cause(cause);
> +}
> +
> +static void do_unexpected_trap(const struct cpu_user_regs *regs)
>  {
> +    unsigned long cause = csr_read(CSR_SCAUSE);
> +
> +    early_printk("Unhandled exception: ");
> +    early_printk(decode_cause(cause));
> +    early_printk("\n");
> +
>      die();
>  }
> +
> +void do_trap(struct cpu_user_regs *cpu_regs)
> +{
> +    do_unexpected_trap(cpu_regs);
> +}
> --
> 2.39.0
>
>

