Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBEF67737E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 00:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482579.748161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjvD-0002Ae-Bk; Sun, 22 Jan 2023 23:38:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482579.748161; Sun, 22 Jan 2023 23:38:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJjvD-00028f-7j; Sun, 22 Jan 2023 23:38:47 +0000
Received: by outflank-mailman (input) for mailman id 482579;
 Sun, 22 Jan 2023 23:38:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zCZZ=5T=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pJjvB-00028Z-NA
 for xen-devel@lists.xenproject.org; Sun, 22 Jan 2023 23:38:45 +0000
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [2607:f8b0:4864:20::e2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7d6aaad-9aad-11ed-b8d1-410ff93cb8f0;
 Mon, 23 Jan 2023 00:38:43 +0100 (CET)
Received: by mail-vs1-xe2b.google.com with SMTP id t10so11250424vsr.3
 for <xen-devel@lists.xenproject.org>; Sun, 22 Jan 2023 15:38:43 -0800 (PST)
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
X-Inumbo-ID: e7d6aaad-9aad-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0+n8WCk2piafcS3CKFwbx+35Wbh6MxUloWhZg9ttqs=;
        b=o6lWfIXEe4G0/q3owFt+GPZqawAj0vbPQ1ZL3cIhch0ZWtWemC7a7DVSJ3sUGrP8lI
         /x9jLTtpzX6w21aJJw5dUOdpFpcZkRz1zq6uE3C9PUJhPs3xxHfwKcghDbmBPQRNTD6f
         MR61NjaoQJ4FSD3LGlhkCefCMk0cmX5ggJ6Lp4GLt85e7dzKSDZ9LatFU5vylNOzFTbD
         YGlHAjVpCdJH+LqJMunotc+oM+mx7m4si4I5EkBadhvIS+t6Po0N0D3qiD7xXpaZwzTd
         C9Ybl/McNIJLw5jQQgiSe4BE6lQA0cmLMjrEYEdSzPpJqsA6MfMro7tIAMEzvRUgWg1j
         0cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0+n8WCk2piafcS3CKFwbx+35Wbh6MxUloWhZg9ttqs=;
        b=Z5d0OoElcHOfoULcBjsd/B9LegBRjwNqxFjFOOHCeoeCDvE72VLjo3HPLu6iO5oTVx
         8y56BEE2L0M8TlKlSzZbKi4Dh8QmiZ2h841QcCVBzKMFKpfkQpQREiCMFNAtUEIi3ZvG
         Jp21AXm1ebcP/vNvEMel+fISkGbTZVhl7rWsDwWTxj/xgqP3/DCw1USi27nqQZ7j7w9y
         1ZQ3gi1xOwWH5+GvFYz6ghN1phhs6/u2kjqTHieyxcdhkMVmIN2rrYasfkMxgZhtWJTY
         1XyGILGzCQgN8NQhMiQTd+kJw/3wT6BppKLKCGyEYeiqynr9Z+7PFXonOvUdtd6fDspB
         E04Q==
X-Gm-Message-State: AFqh2krlud9fYWEa03htr/Bj6Pt9DXDagyn5V94BE1noEHQnlHtlnII5
	IBLB0XlWdxxSy2DXTtbnyGq7wpEdrfExdgEq77Q=
X-Google-Smtp-Source: AMrXdXumw40FQoqv7C9vBN0/rmP8HQvs/aztc+bNst3qUzE2l00mkDREXUV2q/wu7Zj1C9+3ceA7Xmc/PcQLcUJ6S5g=
X-Received: by 2002:a05:6102:f98:b0:3d3:c7d9:7b62 with SMTP id
 e24-20020a0561020f9800b003d3c7d97b62mr2711392vsv.72.1674430722408; Sun, 22
 Jan 2023 15:38:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674226563.git.oleksii.kurochko@gmail.com> <c798832ec19cb94c0a27e8cff8f5bd6d1aa6ae7e.1674226563.git.oleksii.kurochko@gmail.com>
In-Reply-To: <c798832ec19cb94c0a27e8cff8f5bd6d1aa6ae7e.1674226563.git.oleksii.kurochko@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 23 Jan 2023 09:38:16 +1000
Message-ID: <CAKmqyKNkO27JqujvNF7t_ewX-oS+=8hhp7E5ZcZRz9cYA-czhg@mail.gmail.com>
Subject: Re: [PATCH v1 08/14] xen/riscv: introduce decode_cause() stuff
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 21, 2023 at 1:00 AM Oleksii Kurochko
<oleksii.kurochko@gmail.com> wrote:
>
> The patch introduces stuff needed to decode a reason of an
> exception.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  xen/arch/riscv/traps.c | 88 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
>
> diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
> index 3201b851ef..dd64f053a5 100644
> --- a/xen/arch/riscv/traps.c
> +++ b/xen/arch/riscv/traps.c
> @@ -4,8 +4,96 @@
>   *
>   * RISC-V Trap handlers
>   */
> +#include <asm/csr.h>
> +#include <asm/early_printk.h>
>  #include <asm/processor.h>
>  #include <asm/traps.h>
> +#include <xen/errno.h>
> +
> +const char *decode_trap_cause(unsigned long cause)
> +{
> +    switch ( cause )
> +    {
> +    case CAUSE_MISALIGNED_FETCH:
> +        return "Instruction Address Misaligned";
> +    case CAUSE_FETCH_ACCESS:
> +        return "Instruction Access Fault";
> +    case CAUSE_ILLEGAL_INSTRUCTION:
> +        return "Illegal Instruction";
> +    case CAUSE_BREAKPOINT:
> +        return "Breakpoint";
> +    case CAUSE_MISALIGNED_LOAD:
> +        return "Load Address Misaligned";
> +    case CAUSE_LOAD_ACCESS:
> +        return "Load Access Fault";
> +    case CAUSE_MISALIGNED_STORE:
> +        return "Store/AMO Address Misaligned";
> +    case CAUSE_STORE_ACCESS:
> +        return "Store/AMO Access Fault";
> +    case CAUSE_USER_ECALL:
> +        return "Environment Call from U-Mode";
> +    case CAUSE_SUPERVISOR_ECALL:
> +        return "Environment Call from S-Mode";
> +    case CAUSE_MACHINE_ECALL:
> +        return "Environment Call from M-Mode";
> +    case CAUSE_FETCH_PAGE_FAULT:
> +        return "Instruction Page Fault";
> +    case CAUSE_LOAD_PAGE_FAULT:
> +        return "Load Page Fault";
> +    case CAUSE_STORE_PAGE_FAULT:
> +        return "Store/AMO Page Fault";
> +    case CAUSE_FETCH_GUEST_PAGE_FAULT:
> +        return "Instruction Guest Page Fault";
> +    case CAUSE_LOAD_GUEST_PAGE_FAULT:
> +        return "Load Guest Page Fault";
> +    case CAUSE_VIRTUAL_INST_FAULT:
> +        return "Virtualized Instruction Fault";
> +    case CAUSE_STORE_GUEST_PAGE_FAULT:
> +        return "Guest Store/AMO Page Fault";
> +    default:
> +        return "UNKNOWN";
> +    }
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
>
>  void __handle_exception(struct cpu_user_regs *cpu_regs)
>  {
> --
> 2.39.0
>
>

