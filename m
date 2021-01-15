Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23972F7006
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 02:36:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67603.120775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0E1p-0007sQ-9J; Fri, 15 Jan 2021 01:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67603.120775; Fri, 15 Jan 2021 01:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0E1p-0007s4-3S; Fri, 15 Jan 2021 01:35:53 +0000
Received: by outflank-mailman (input) for mailman id 67603;
 Fri, 15 Jan 2021 01:35:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yB8v=GS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l0E1n-0007ry-S1
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 01:35:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c281fd1-703f-4814-8e54-dd278a0417d8;
 Fri, 15 Jan 2021 01:35:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E59A23A57;
 Fri, 15 Jan 2021 01:35:50 +0000 (UTC)
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
X-Inumbo-ID: 0c281fd1-703f-4814-8e54-dd278a0417d8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610674550;
	bh=/1NnCIiEkxYh6TcthrSOMNETLVB/8DRK+9tPW3QX9O8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=X/z9UMLwMd0KLcDI6o8yzYWlspyU7hiAF2vEu8Utfd4lTy+k7fo2SUTU9ISPRxaLV
	 ZHoPt0hjL0FrzfEeFYjf6aInTWBoJxsE1BLx4B8zOSp7ayDbXYhMV7IY5WMiue9Q6i
	 hiQ3iKxxpFldvWD5iZVPgB6pId3HOXrPRyrf6xqzHz6zEBkWRELzY4rFcMPhXbgJgl
	 67Af7vtZfybM1upAD0nvrD7pi3hpZu4kx5de7yHBYIRAJ88G7BRAubuKDMm8yD7hmq
	 6Q92yV+lDoC3aiVIrnXlrVRtliEaDQzyY5cH4g3tjnM8al3YYCTtdmcWXMZZZ5MKFs
	 w9EZYussbOhoA==
Date: Thu, 14 Jan 2021 17:35:49 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH V4 19/24] xen/arm: io: Abstract sign-extension
In-Reply-To: <1610488352-18494-20-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2101141735410.31265@sstabellini-ThinkPad-T480s>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-20-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Jan 2021, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> In order to avoid code duplication (both handle_read() and
> handle_ioserv() contain the same code for the sign-extension)
> put this code to a common helper to be used for both.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes V1 -> V2:
>    - new patch
> 
> Changes V2 -> V3:
>    - no changes
> 
> Changes V3 -> V4:
>    - no changes here, but in new patch:
>      "xen/arm: io: Harden sign extension check"
> ---
>  xen/arch/arm/io.c           | 18 ++----------------
>  xen/arch/arm/ioreq.c        | 17 +----------------
>  xen/include/asm-arm/traps.h | 24 ++++++++++++++++++++++++
>  3 files changed, 27 insertions(+), 32 deletions(-)
> 
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index 9814481..307c521 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -24,6 +24,7 @@
>  #include <asm/cpuerrata.h>
>  #include <asm/current.h>
>  #include <asm/mmio.h>
> +#include <asm/traps.h>
>  #include <asm/hvm/ioreq.h>
>  
>  #include "decode.h"
> @@ -40,26 +41,11 @@ static enum io_state handle_read(const struct mmio_handler *handler,
>       * setting r).
>       */
>      register_t r = 0;
> -    uint8_t size = (1 << dabt.size) * 8;
>  
>      if ( !handler->ops->read(v, info, &r, handler->priv) )
>          return IO_ABORT;
>  
> -    /*
> -     * Sign extend if required.
> -     * Note that we expect the read handler to have zeroed the bits
> -     * outside the requested access size.
> -     */
> -    if ( dabt.sign && (r & (1UL << (size - 1))) )
> -    {
> -        /*
> -         * We are relying on register_t using the same as
> -         * an unsigned long in order to keep the 32-bit assembly
> -         * code smaller.
> -         */
> -        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
> -        r |= (~0UL) << size;
> -    }
> +    r = sign_extend(dabt, r);
>  
>      set_user_reg(regs, dabt.reg, r);
>  
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index 3c4a24d..40b9e59 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -28,7 +28,6 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>      const union hsr hsr = { .bits = regs->hsr };
>      const struct hsr_dabt dabt = hsr.dabt;
>      /* Code is similar to handle_read */
> -    uint8_t size = (1 << dabt.size) * 8;
>      register_t r = v->io.req.data;
>  
>      /* We are done with the IO */
> @@ -37,21 +36,7 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
>      if ( dabt.write )
>          return IO_HANDLED;
>  
> -    /*
> -     * Sign extend if required.
> -     * Note that we expect the read handler to have zeroed the bits
> -     * outside the requested access size.
> -     */
> -    if ( dabt.sign && (r & (1UL << (size - 1))) )
> -    {
> -        /*
> -         * We are relying on register_t using the same as
> -         * an unsigned long in order to keep the 32-bit assembly
> -         * code smaller.
> -         */
> -        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
> -        r |= (~0UL) << size;
> -    }
> +    r = sign_extend(dabt, r);
>  
>      set_user_reg(regs, dabt.reg, r);
>  
> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
> index 997c378..e301c44 100644
> --- a/xen/include/asm-arm/traps.h
> +++ b/xen/include/asm-arm/traps.h
> @@ -83,6 +83,30 @@ static inline bool VABORT_GEN_BY_GUEST(const struct cpu_user_regs *regs)
>          (unsigned long)abort_guest_exit_end == regs->pc;
>  }
>  
> +/* Check whether the sign extension is required and perform it */
> +static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
> +{
> +    uint8_t size = (1 << dabt.size) * 8;
> +
> +    /*
> +     * Sign extend if required.
> +     * Note that we expect the read handler to have zeroed the bits
> +     * outside the requested access size.
> +     */
> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
> +    {
> +        /*
> +         * We are relying on register_t using the same as
> +         * an unsigned long in order to keep the 32-bit assembly
> +         * code smaller.
> +         */
> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
> +        r |= (~0UL) << size;
> +    }
> +
> +    return r;
> +}
> +
>  #endif /* __ASM_ARM_TRAPS__ */
>  /*
>   * Local variables:
> -- 
> 2.7.4
> 

