Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1415A9F33F7
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 16:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858248.1270499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCdn-0006aE-F4; Mon, 16 Dec 2024 15:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858248.1270499; Mon, 16 Dec 2024 15:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNCdn-0006Yl-CI; Mon, 16 Dec 2024 15:04:11 +0000
Received: by outflank-mailman (input) for mailman id 858248;
 Mon, 16 Dec 2024 15:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1wQJ=TJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNCdl-0005uN-Ld
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 15:04:09 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 000dd43d-bbbf-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 16:04:08 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4361d5dcf5bso46353205e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 07:04:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625706595sm144543735e9.33.2024.12.16.07.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 07:04:07 -0800 (PST)
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
X-Inumbo-ID: 000dd43d-bbbf-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734361448; x=1734966248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nvnjmLw43p1KWuoTBVdL9LiP00PV4rKQ/YSw55O7Xpo=;
        b=C2KCOpX/HrPrRXCp0HaJkC/ASvzKjwm5ie2N2wfKww9yOanNo10X8zTtnA8aEKJROX
         NqQTjYf4MEP1TdmoEok2L36n1bTJFJ8nLTtIt/efvp8X63DpqXGn8Ty5iHs4n+C5Ip9K
         fUwpCQ81eBqxCj5HQa545137YV/bypspfDCHLIY0vi5tH8y7IURDUPVU48s0SuNwy+xq
         rY+LKhKbHJ65vMkDbC5eTZHdOHPD7DIfNphCKnN9FX5D0LyiO9DsFtskto5wQQBFIjyk
         /+zt5I6hn4SDvXTAqXWRhZTKdw2vQXytSq4aIlPi7osX/ZWk6fo4dyU5JWKTL5e74mLV
         7yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734361448; x=1734966248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvnjmLw43p1KWuoTBVdL9LiP00PV4rKQ/YSw55O7Xpo=;
        b=dnr9MzFe5Q0CdFiF4AolkHGNgyXbN5dwV8OaphePU+j7mY8tKi+NH6hLwWKq/vfQIz
         +aFOYRmK/kOK0TDtn6wbf6wp4QuCyqGddfBPxbPIk3BsM6yBtuC7HvFntaSF75BYJMCA
         WVZSa0Ni94rY21mMr9p5WRpROSpCt1BF8CuIiDGHQmaRb/g7iHwYWh7tFjZ7sDDbsJdR
         3xXVBHjCUfMLMokb/wnigq107nuEW6e18jArZ1Uzd2A3q526ucr7n3PM4QsRuUb6MBwJ
         v+P+AH/eLEr0h2LDCYAD0ihOqlqlPS5ybiqI8qqm+bXOT7wVmdQSkH1idkLzluwMw+ZC
         G4aw==
X-Forwarded-Encrypted: i=1; AJvYcCWxtCjTca58UNqcA34euCk6H70wUQARn2daDf/MuIU5QoohtnTur/dsVaVLdOMzNshIlwfK/9Jf+mk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywd3mFK4RJH2A22+g2Vuhh59VER20079St521g/g+5C6iPY8/28
	s1hrtST9w9JAcUIqo6IpnwTzIL6QTrnmEb+EEjABSB45N5Ums/MQL0iPM6znOn72r/PzstMzSkM
	=
X-Gm-Gg: ASbGncs6m4uUPjld/daTaCJyHfsuHsFmr7VV4Nyp3gCK2h0+Nud0B3W0ZKNwfxhQU0J
	tDL6v1XlGWO5ygNtew0G2okzZKgl+03hMxDa4SbqmzKREqEMvvK3CUghOQGWCQW4li1JzvXVhIb
	G4oXbLAnV2+ltvShRXbStOHezNauhc9m+PiUGcvLenQwT9ytRi3CNfX+f7I67Ak5YTeNxT98hrp
	vcl8GI/B2ekNZCZW25W2X1hPPpIWzci1PNhOkW1n6Qhir7ZaDzZxJIM0ilnvK+CPIR84OzIqAId
	XLWxI8eGj2a3+tNdSTrNQDujWhyBisESNdqUJoCyNw==
X-Google-Smtp-Source: AGHT+IF+8wEq6qscHxROqvtqQilfBJBpY3muvrid1HP/mlz7JGhw7wHKBJbEW5g1JWo5dMlj5rcP2g==
X-Received: by 2002:a05:600c:524c:b0:434:f396:525e with SMTP id 5b1f17b1804b1-4362aa28541mr123138535e9.9.1734361447475;
        Mon, 16 Dec 2024 07:04:07 -0800 (PST)
Message-ID: <3be247cc-900b-48f3-98f3-0d97532ede76@suse.com>
Date: Mon, 16 Dec 2024 16:04:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/35] x86/hvm: introduce NS8250 UART emulator
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-31-e9aa923127eb@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20241205-vuart-ns8250-v1-31-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:42, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Add initial in-hypervisor emulator for NS8250/NS16x50-compatible UARTs under
> CONFIG_HAS_VUART_NS8250.
> 
> In parallel domain creation scenario (hyperlaunch), NS8520 emulator helps
> early guest OS bringup debugging, because it eliminates dependency on the
> external emulator being operational by the time domains are created. Also,
> there's no early console facility similar to vpl011 to support x86 guest OS
> bring up.
> 
> By default, CONFIG_HAS_VUART_NS8250 enables emulatio of NS8250 at I/O port
> 0x3f8, IRQ#4 in guest OS.
> 
> Limitations:
> - Only x86;
> - Only Linux guest tested so far;
> - Only legacy COM{1,2,3,4} resources, no customization;
> - Only Xen console as a backend, no inter-domain communication (similar to
>   vpl011 on Arm);
> - Only 8-bit characters;
> - Baud rate is not emulated;
> - FIFO-less mode is not emulated properly;

With in particular this, why would it be called 8250 emulation in the first
place? The driver Xen uses for itself is in ns16550.c; I'd suggest to call
the child here ns16550 emulation right away, using vns16550.c as the file
name.

> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -61,3 +61,17 @@ config HVM_FEP
>  	  for use in production.
>  
>  	  If unsure, say N.
> +
> +config HAS_VUART_NS8250
> +	bool "NS8250-compatible UART Emulation"

HAS_* options may not have prompts; they merely declare something to the
rest of the build system.

> +	depends on HVM && HAS_IOPORTS

Why HAS_IOPORTS?

> +	default n

No need for this.

> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -29,3 +29,4 @@ obj-y += vm_event.o
>  obj-y += vmsi.o
>  obj-y += vpic.o
>  obj-y += vpt.o
> +obj-$(CONFIG_HAS_VUART_NS8250) += vuart_ns8250.o

If the vuart name pretix is to remain, then please avoid underscores in
the names of new files, in favor of dashes.

> --- /dev/null
> +++ b/xen/arch/x86/hvm/vuart_ns8250.c
> @@ -0,0 +1,886 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * NS8250-compatible UART Emulator.
> + *
> + * Limitations:
> + * - Only x86;
> + * - Only Linux guest tested so far;
> + * - Only legacy COM{1,2,3,4} resources, no customization;
> + * - Only Xen console as a backend, no inter-domain communication (similar to
> + *   vpl011 on Arm);
> + * - Only 8-bit characters;
> + * - Baud rate is not emulated;
> + * - FIFO-less mode is not emulated properly;
> + * - RX FIFO interrupt moderation (FCR) is not emulated properly, TL16C750
> + *   has special FCR handling;
> + * - No integration w/ VM snapshotting (HVM_REGISTER_SAVE_RESTORE() and
> + *   friends);
> + * - Assumes no ISA-device IRQ sharing;
> + * - MMIO-based UART is not supported;
> + * - PCI UART is not supported.
> + */
> +
> +#define pr_fmt(fmt)         "ns8250: " fmt
> +#define pr_log_level        hvm_ns8250_log_level
> +
> +/* Development debugging */
> +#define NS8250_LOG_LEVEL    0
> +
> +#include <xen/types.h>
> +#include <xen/event.h>
> +#include <xen/lib.h>
> +#include <xen/errno.h>
> +#include <xen/sched.h>
> +#include <xen/trace.h>
> +#include <xen/resource.h>
> +#include <xen/ctype.h>
> +#include <xen/param.h>
> +#include <xen/console.h> /* console_input_domid() */
> +#include <asm/setup.h>   /* max_init_domid */
> +#include <asm/iocap.h>
> +#include <asm/hvm/hvm.h>
> +#include <asm/hvm/io.h>
> +#include <asm/hvm/vuart_ns8250.h>
> +
> +#if !defined(pr_fmt)
> +#define pr_fmt(fmt) fmt
> +#endif
> +
> +#if !defined(pr_log_level)
> +#define pr_log_level 0
> +#endif
> +
> +#define pr_err(fmt, args...) \
> +    gprintk(KERN_ERR, pr_fmt(fmt), ## args)
> +#define pr_warn(fmt, args...) \
> +    if (pr_log_level) gprintk(KERN_WARNING, pr_fmt(fmt), ## args)
> +#define pr_info(fmt, args...) \
> +    if (pr_log_level) gprintk(KERN_INFO, pr_fmt(fmt), ## args)
> +#define pr_debug(fmt, args...) \
> +    if (pr_log_level) gprintk(KERN_DEBUG, pr_fmt(fmt), ## args)

On top of Roger's remark here: _If_ you use such wrapper macros, then
please arrange for them to be usable in arbitrary context. Think of

    if ( condition )
        pr_info(...);
    else
        ...

> +/*
> + * NS8250 emulator state machine logging (development only)
> + * FIXME: use similar to parse_guest_loglvl()
> + */
> +static unsigned int __read_mostly hvm_ns8250_log_level = NS8250_LOG_LEVEL;
> +integer_param("hvm.ns8250.log_level", hvm_ns8250_log_level);

How can this be a command line option, when there may be many domains
making use of the in-Xen driver? This and ...

> +/*
> + * Default emulated NS8250 resources.
> + * If not specified, COM1 (I/O port 0x3f8, IRQ#4) is emulated.
> + * FIXME: follow Linux'es console= syntax or re-use
> + * ns16550_parse_port_config().
> + */
> +static char __read_mostly hvm_ns8250_console[64];
> +string_param("hvm.ns8250.console", hvm_ns8250_console);

... this need to be per-domain settings; a command line option may be
applicable to Dom0 alone.

> +/* I/O access mask */
> +static const uint32_t io_access_mask[] = {
> +    [0] = 0X00000000U,
> +    [1] = 0X000000FFU,
> +    [2] = 0X0000FFFFU,
> +    [4] = 0XFFFFFFFFU,
> +};

I don't think this is needed; we're doing similar port I/O emulation in
various other places, without resorting to such arrays.

> +/*
> + * Legacy IBM PC NS8250 resources.
> + * There are only 4 I/O port ranges, hardcoding all of them here.
> + */
> +static const struct {
> +    const char *name;
> +    const struct resource *res;
> +} ns8250_x86_legacy_uarts[4] = {
> +    [0] = {
> +        .name = "com1",
> +        .res = (const struct resource[]){
> +            { .type = IORESOURCE_IO,  .addr = 0x3F8, .size = UART_MAX },

Considering this, ...

> +static int ns8250_io_write8(
> +    struct vuart_ns8250 *vdev, uint32_t reg, uint8_t *data)
> +{
> +    uint8_t val;
> +    int rc = 0;
> +
> +    val = *data;
> +
> +    switch ( reg )
> +    {
> +    /* DLAB=0 */
> +    case UART_THR:
> +        if ( vdev->regs[UART_MCR] & UART_MCR_LOOP )
> +        {
> +            ns8250_fifo_rx_putchar(vdev, val);
> +            vdev->regs[UART_LSR] |= UART_LSR_OE;
> +        }
> +        else
> +            ns8250_fifo_tx_putchar(vdev, val);
> +
> +        vdev->flags |= NS8250_IRQ_THRE_PENDING;
> +
> +        break;
> +
> +    case UART_IER:
> +        if ( val & vdev->regs[UART_IER] & UART_IER_ETHREI )
> +            vdev->flags |= NS8250_IRQ_THRE_PENDING;
> +
> +        vdev->regs[UART_IER] = val & UART_IER_MASK;
> +
> +        break;
> +
> +    case UART_FCR: /* WO */
> +        if ( val & UART_FCR_CLRX )
> +            ns8250_fifo_rx_reset(vdev);
> +
> +        if ( val & UART_FCR_CLTX )
> +            ns8250_fifo_tx_reset(vdev);
> +
> +        if ( !(val & UART_FCR_ENABLE) )
> +            val = 0;
> +
> +        vdev->regs[UART_FCR] = val & (UART_FCR_ENABLE |
> +                                      UART_FCR_DMA |
> +                                      UART_FCR_TRG_MASK);
> +
> +        break;
> +
> +    case UART_LCR:
> +        vdev->regs[UART_LCR] = val;
> +        break;
> +
> +    case UART_MCR: {
> +        uint8_t msr_curr, msr_next, msr_delta;
> +
> +        msr_curr = vdev->regs[UART_MSR];
> +        msr_next = 0;
> +        msr_delta = 0;
> +
> +        /* Set modem status */
> +        if ( val & UART_MCR_LOOP )
> +        {
> +            if ( val & UART_MCR_DTR )
> +                msr_next |= UART_MSR_DSR;
> +            if ( val & UART_MCR_RTS )
> +                msr_next |= UART_MSR_CTS;
> +            if ( val & UART_MCR_OUT1 )
> +                msr_next |= UART_MSR_RI;
> +            if ( val & UART_MCR_OUT2 )
> +                msr_next |= UART_MSR_DCD;
> +        }
> +        else
> +            msr_next |= UART_MSR_DCD | UART_MSR_DSR | UART_MSR_CTS;
> +
> +        /* Calculate changes in modem status */
> +        if ( (msr_curr & UART_MSR_CTS) ^ (msr_next & UART_MSR_CTS) )
> +            msr_delta |= UART_MSR_DCTS;
> +        if ( (msr_curr & UART_MCR_RTS) ^ (msr_next & UART_MCR_RTS) )
> +            msr_delta |= UART_MSR_DDSR;
> +        if ( (msr_curr & UART_MSR_RI)  & (msr_next & UART_MSR_RI) )
> +            msr_delta |= UART_MSR_TERI;
> +        if ( (msr_curr & UART_MSR_DCD) ^ (msr_next & UART_MSR_DCD) )
> +            msr_delta |= UART_MSR_DDCD;
> +
> +        vdev->regs[UART_MCR] = val & UART_MCR_MASK;
> +        vdev->regs[UART_MSR] = msr_next | msr_delta;
> +
> +        break;
> +    }
> +
> +    case UART_LSR: /* RO */
> +    case UART_MSR: /* RO */
> +        rc = -EINVAL;
> +        break;
> +
> +    /*
> +     * NB: Firmware like OVMF rely on SCR presence to initialize the ns8250
> +     * driver.
> +     */
> +    case UART_SCR:
> +        vdev->regs[UART_SCR] = val;
> +        break;
> +
> +    /* DLAB=1 */
> +    case UART_MAX + UART_DLL:

... how can you go at or past UART_MAX here and ...

> +        vdev->dl = (vdev->dl & 0xFF00U) | val;
> +        break;
> +
> +    case UART_MAX + UART_DLM:

... here? I notice a caller up the tree sets things up like this, but this
feels pretty fragile. How would one easily spot all producers and consumers
without also hitting all other uses of UART_MAX?

> +static int cf_check ns8250_io_handle(
> +    int dir, unsigned int addr, unsigned int size, uint32_t *data)
> +{
> +#define op(dir)     (((dir) == IOREQ_WRITE) ? 'W' : 'R')
> +    struct domain *d = rcu_lock_current_domain();
> +    struct vuart_ns8250 *vdev = &d->arch.hvm.vuart;
> +    uint32_t offset, reg;
> +    int rc;
> +
> +    spin_lock(&vdev->lock);
> +
> +    BUG_ON( vdev->owner != d );
> +
> +    if ( !(vdev->flags & NS8250_READY) )
> +    {
> +        pr_err("%c io 0x%04x %d 0x%08"PRIx32": propagate to external I/O emulator\n",
> +                op(dir), addr, size, *data);
> +        rc = X86EMUL_UNHANDLEABLE;
> +        goto out;
> +    }
> +
> +    reg = addr - vdev->io_addr;
> +    BUG_ON( reg >= UART_MAX );
> +    if ( reg % size != 0 )
> +    {
> +        pr_err("%c 0x%04x %d 0x%08"PRIx32": unaligned access\n",
> +                op(dir), addr, size, *data & io_access_mask[size]);
> +        rc = X86EMUL_OKAY;
> +        goto out;
> +    }
> +
> +    /* Redirect access to divisor latch registers */
> +    if ( !!(vdev->regs[UART_LCR] & UART_LCR_DLAB)
> +            && (reg == UART_DLL || reg == UART_DLM) )
> +        offset = UART_MAX + reg;
> +    else
> +        offset = reg;
> +
> +    if ( dir == IOREQ_WRITE )
> +    {
> +        pr_debug("%c 0x%04x %d 0x%08"PRIx32" %s[0x%02"PRIx32"]\n",
> +                op(dir), addr, size,
> +                *data & io_access_mask[size],
> +                ns8250_regname(vdev, offset, dir), reg);
> +        rc = ns8250_io_write(vdev, offset, size, data);
> +    }
> +    else
> +    {
> +        rc = ns8250_io_read(vdev, offset, size, data);
> +        pr_debug("%c 0x%04x %d 0x%08"PRIx32" %s[0x%02"PRIx32"]\n",
> +                op(dir), addr, size,
> +                *data & io_access_mask[size],
> +                ns8250_regname(vdev, offset, dir), reg);
> +    }
> +    if ( rc )
> +        pr_err("%c 0x%04x %d 0x%08"PRIx32": unsupported access\n",
> +                op(dir), addr, size, *data & io_access_mask[size]);
> +    rc = X86EMUL_OKAY;
> +
> +out:

Nit: Missing indentation (see ./CODING_STYLE). Also elsewhere.

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/hvm/vuart_ns8250.h
> @@ -0,0 +1,75 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * NS8250-compatible UART Emulator.
> + */
> +#if !defined(HVM__VUART_NS8250_H)
> +#define HVM__VUART_NS8250_H
> +
> +#include <xen/spinlock.h>
> +#include <xen/8250-uart.h>
> +#include <public/io/console.h> /* xencons_interface */

I assume you mean ...

> +/*
> + * NS8250 emulator operational flags.
> + */
> +enum {
> +    /* Emulator is ready */
> +    NS8250_READY                = BIT(0, U),
> +    /* Trigger re-delivery of THRE interrupt */
> +    NS8250_IRQ_THRE_PENDING     = BIT(1, U),
> +};
> +
> +/*
> + * Virtual NS8250 device state.
> + */
> +struct vuart_ns8250 {
> +    uint16_t dl;                    /* Divisor Latch */
> +    uint8_t regs[UART_MAX];         /* Registers */
> +    uint32_t flags;                 /* Virtual device flags */
> +    uint64_t io_addr;               /* Guest I/O region base address */
> +    uint64_t io_size;               /* Guest I/O region size */
> +    int irq;                        /* Guest IRQ# */
> +    struct xencons_interface *cons; /* Emulated RX/TX FIFOs */

... this use, but that doesn't even require a forward decl of the struct
in C (in C++ such a forward decl would be all that's needed).

Jan

