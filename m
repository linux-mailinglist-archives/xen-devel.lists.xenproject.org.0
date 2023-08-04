Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98509770223
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 15:46:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577155.904075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRv89-0003N5-8o; Fri, 04 Aug 2023 13:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577155.904075; Fri, 04 Aug 2023 13:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRv89-0003LF-5x; Fri, 04 Aug 2023 13:46:13 +0000
Received: by outflank-mailman (input) for mailman id 577155;
 Fri, 04 Aug 2023 13:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8k3D=DV=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1qRv88-0003L9-35
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 13:46:12 +0000
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [2607:f8b0:4864:20::e34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 448676d5-32cd-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 15:46:10 +0200 (CEST)
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-447be69ae43so710811137.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Aug 2023 06:46:10 -0700 (PDT)
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
X-Inumbo-ID: 448676d5-32cd-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691156769; x=1691761569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi4eaJ2vpzaX+Spz9WGK8TZDFcHCvCNIhMhjxeulaI8=;
        b=cLZeFLi4JMupkNax5zgWZHcjretVbeLE0i9fM5rezo1B0tS/9j5KNK4fjA26XO+5Pf
         M5hhQN49P0FU3EI1L846YSuD5OdGxO/UO4LqQVuT5NgaLvA2vT+5Hnc2n3wPc5QNwEsU
         oMAl3L5urEHLmk4lkbJTzve33sI683DePMl4t71fyov/CmJFHWVtXhryOMWNMu8+y0L1
         ncZorZFRNZ5VU9mHdZmf/qyR2iPf3yhQmGsZsmz6S8z6OIqGRdkYZAqPA3Ane+z2aRK3
         FUCrTS/HnDJI1WHhwHtopYxp+3LvSmM5eJ9dcl61/zEz1E6pfloDcs92Wnok4Civ5RPz
         77yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691156769; x=1691761569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hi4eaJ2vpzaX+Spz9WGK8TZDFcHCvCNIhMhjxeulaI8=;
        b=c/N0KxQrFR87dMqTEBDH2C0Mu1a+sbdKeeb005gvZETFzMGUwOZOBgtUyedoK6RXZo
         umMMD6Gm+qx48BD3WkVoCBTSCc6MeiOh4pdS0kKAh8suJdHh1IkM00ts0AfgUDKk/GR9
         mY2jVUSnFMJWEGis3b9sc0N2mhidQDClwIZSaaTUWjZ9p08+dNwnnJ+wd59yMaskQAdX
         ot5gbqYWI4xvtXCifwoCvlTC2WCTR4w3BCN4Vep/JIj9ah6vYzDQujFC1sejk5rIAiwZ
         08/vhGlzHuj171fqBsA9YK99KSmi4p43JUMD9j8YIM/e7ruKUaEAX8JuC9uCuQn5xhYR
         2Ayg==
X-Gm-Message-State: AOJu0YyG/AoL7bbdtYLs8StdZ4i5gmYDvwmy+nyd3yRRTfst7e6adLbj
	N6nx3a+k4kGhbRCmUmhAqruwAltV4MzZtpS8FSo=
X-Google-Smtp-Source: AGHT+IGOrwkfCEq4jEUT41SaWRtQUdfYUEPzt65drdneh6zWr8ZwRx6zevCbps4SG3roK8JS3t2BeZ+YLa9KtWQZ+J8=
X-Received: by 2002:a67:f95a:0:b0:443:78dd:447 with SMTP id
 u26-20020a67f95a000000b0044378dd0447mr689109vsq.3.1691156768698; Fri, 04 Aug
 2023 06:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691063432.git.oleksii.kurochko@gmail.com> <25e8e5c5826199ad6f91fb5106472917765d8260.1691063432.git.oleksii.kurochko@gmail.com>
In-Reply-To: <25e8e5c5826199ad6f91fb5106472917765d8260.1691063432.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 4 Aug 2023 09:45:42 -0400
Message-ID: <CAKmqyKMr7tQVz2TmbK2wE9UdY6Ldzxe-+1g4AaQdypv6n-4rEg@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] xen/riscv: introduce decode_cause() stuff
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 8:05=E2=80=AFAM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The patch introduces stuff needed to decode a reason of an
> exception.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V7:
>  - Nothing changed. Only rebase.
> ---
> Changes in V6:
>  - Remove usage of LINK_TO_LOAD() due to the MMU being enabled first.
>  - Change early_printk() to printk()
> ---
> Changes in V5:
>   - Remove <xen/error.h> from riscv/traps/c as nothing would require
>     inclusion.
>   - decode_reserved_interrupt_cause(), decode_interrupt_cause(), decode_c=
ause, do_unexpected_trap()
>     were made as static they are expected to be used only in traps.c
>   - use LINK_TO_LOAD() for addresses which can be linker time relative.
> ---
> Changes in V4:
>   - fix string in decode_reserved_interrupt_cause()
> ---
> Changes in V3:
>   - Nothing changed
> ---
> Changes in V2:
>   - Make decode_trap_cause() more optimization friendly.
>   - Merge the pathc which introduces do_unexpected_trap() to the current =
one.
> ---
>  xen/arch/riscv/traps.c | 84 +++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 83 insertions(+), 1 deletion(-)
>
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> index ccd3593f5a..ea1012e83e 100644
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -4,10 +4,92 @@
>   *
>   * RISC-V Trap handlers
>   */
> +
> +#include <xen/lib.h>
> +
> +#include <asm/csr.h>
> +#include <asm/early_printk.h>
>  #include <asm/processor.h>
>  #include <asm/traps.h>
>
> -void do_trap(struct cpu_user_regs *cpu_regs)
> +static const char *decode_trap_cause(unsigned long cause)
> +{
> +    static const char *const trap_causes[] =3D {
> +        [CAUSE_MISALIGNED_FETCH] =3D "Instruction Address Misaligned",
> +        [CAUSE_FETCH_ACCESS] =3D "Instruction Access Fault",
> +        [CAUSE_ILLEGAL_INSTRUCTION] =3D "Illegal Instruction",
> +        [CAUSE_BREAKPOINT] =3D "Breakpoint",
> +        [CAUSE_MISALIGNED_LOAD] =3D "Load Address Misaligned",
> +        [CAUSE_LOAD_ACCESS] =3D "Load Access Fault",
> +        [CAUSE_MISALIGNED_STORE] =3D "Store/AMO Address Misaligned",
> +        [CAUSE_STORE_ACCESS] =3D "Store/AMO Access Fault",
> +        [CAUSE_USER_ECALL] =3D "Environment Call from U-Mode",
> +        [CAUSE_SUPERVISOR_ECALL] =3D "Environment Call from S-Mode",
> +        [CAUSE_MACHINE_ECALL] =3D "Environment Call from M-Mode",
> +        [CAUSE_FETCH_PAGE_FAULT] =3D "Instruction Page Fault",
> +        [CAUSE_LOAD_PAGE_FAULT] =3D "Load Page Fault",
> +        [CAUSE_STORE_PAGE_FAULT] =3D "Store/AMO Page Fault",
> +        [CAUSE_FETCH_GUEST_PAGE_FAULT] =3D "Instruction Guest Page Fault=
",
> +        [CAUSE_LOAD_GUEST_PAGE_FAULT] =3D "Load Guest Page Fault",
> +        [CAUSE_VIRTUAL_INST_FAULT] =3D "Virtualized Instruction Fault",
> +        [CAUSE_STORE_GUEST_PAGE_FAULT] =3D "Guest Store/AMO Page Fault",
> +    };
> +
> +    if ( cause < ARRAY_SIZE(trap_causes) && trap_causes[cause] )
> +        return trap_causes[cause];
> +    return "UNKNOWN";
> +}
> +
> +static const char *decode_reserved_interrupt_cause(unsigned long irq_cau=
se)
> +{
> +    switch ( irq_cause )
> +    {
> +    case IRQ_M_SOFT:
> +        return "M-mode Software Interrupt";
> +    case IRQ_M_TIMER:
> +        return "M-mode TIMER Interrupt";

TIMER doesn't need to be all caps, otherwise:

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> +    case IRQ_M_EXT:
> +        return "M-mode External Interrupt";
> +    default:
> +        return "UNKNOWN IRQ type";
> +    }
> +}
> +
> +static const char *decode_interrupt_cause(unsigned long cause)
> +{
> +    unsigned long irq_cause =3D cause & ~CAUSE_IRQ_FLAG;
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
>  {
> +    unsigned long cause =3D csr_read(CSR_SCAUSE);
> +
> +    printk("Unhandled exception: %s\n", decode_cause(cause));
> +
>      die();
>  }
> +
> +void do_trap(struct cpu_user_regs *cpu_regs)
> +{
> +    do_unexpected_trap(cpu_regs);
> +}
> --
> 2.41.0
>
>

