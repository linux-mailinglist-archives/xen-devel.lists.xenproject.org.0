Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7865A37FD9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:21:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890084.1299147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyEx-0007S5-9T; Mon, 17 Feb 2025 10:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890084.1299147; Mon, 17 Feb 2025 10:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyEx-0007QU-6t; Mon, 17 Feb 2025 10:20:39 +0000
Received: by outflank-mailman (input) for mailman id 890084;
 Mon, 17 Feb 2025 10:20:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjyEv-0007QO-U3
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:20:37 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d35756da-ed18-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 11:20:35 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5debbced002so7855194a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 02:20:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dece288e38sm6966496a12.79.2025.02.17.02.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 02:20:34 -0800 (PST)
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
X-Inumbo-ID: d35756da-ed18-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739787635; x=1740392435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MdzZDLuMUSdtKutzCUz7acVghial3JSZaUsNZftyGho=;
        b=BOXB9hblndXYg5ntkC3157Ze75jgzCXXVrN2+iw61zRuI5+B/1MZVMhajFO1S1s/lB
         0XnSDJrYD3NM8T973W1ML5uo+i2tYrky+DaYvmEizYjVKYRWjqt71i7o6LOjQOXNFFsQ
         sg+Snp3JKaqxQFjhMv1ejyTJmDIwAKxHI7COkmMaMGWg7bHou2GdOUr+XxFcNVvb7rvX
         8jFhX1l5dTw6T4k46dSpMEfbCwybRvqpne7HeVPxLk4znYS9yJ17qTrOfxNs04ToFB7E
         71RM/7ai8JVCzT079bizhD7FrCpZkVN7NqPYRwTLNGP6KYHVlY+rDy5rG/ENaywKKm1o
         tovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787635; x=1740392435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdzZDLuMUSdtKutzCUz7acVghial3JSZaUsNZftyGho=;
        b=R4C6Vs/wJnRE8Ks/asrRyBLedyNAjoC+C6uRF1x0j/OnQqBcCfX5CYyYrcBDE34H8e
         PIV3SrWSOz7wcyUma7Vs4NhwTGZwZYqNXlUcfdG9+oeOYLUIyKweD6Hzel1xA3VjVjvp
         CydH/LDcK6GzhuC9AFnfKfL9m9yjICYfP3mBPlLF1iBCj3+w81RIdujRvCaUtHsqjWgC
         YbZsEV2H9iUMtpcX4n8RYBfPUnOPj6TwGzwPxtKr5qSYlj/7HiPa2Uh5Bokp6vmOh8Rz
         gZMxUYu07MhpQkjMZ7zfCbyU+UhRa5DvPPAGknS6Rx4ZhqVMX+g6RuGE63TjcFW1Xazd
         3Wuw==
X-Forwarded-Encrypted: i=1; AJvYcCVmrqJKAD1UhL4o71/fRH5t/m3O0sDCXzjx0OMWtl9r7uFElYdeOU3UqqUuAojIa0vVm7OzmSmr5EY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFarCDnaZoNDNmcO/Hgr615bHXTWoG2zG0lKd6EYCE71c9iOcY
	MwgYu+e1kKPDO/tc9Ouy2uzAfGujejBGwIXYJnr6mi6JSaG4UL52cbK/J0s+ik4f6xjHzqqQH0c
	=
X-Gm-Gg: ASbGncu65uWZe2rhx7e+uMFbCTJz8VdLyjaO7WScjwrnCvZxpoW9a475k/Scogg6/nR
	BrM8QTv9QhhmuG1tSIGvOX5exH/LLqFeJaDnvn44WXzsiIKEPwVXzVrIkrU/RpX8KSNzzRvcqLk
	i4rAK/p9y9WQwt1TNoTdOt3riM7pveiohDYs6Nd1aVqEVq79lym5Uv2GZpx6Ce1g8zXBbWTjzku
	17MMd8i2s31D2N8WvlfvUHAF5OOWRQcThXqhupmyk/i2+3rgtHZ8oMUuKBQdF1YQ+G0CiiotMm4
	s18g6Y2lQlNaAPjjLHEvEa8j9Pu1Do5SrFlooLsf+9xvcm3jAKzqy2LgFlxgZ65yC9RhgPErqC9
	z
X-Google-Smtp-Source: AGHT+IGnjbwPJwC28ggFb8EZ2F/SvVksGkhTqX34wwf4OuE916PK3D/nA8YkHFL4pz1+FcPqDSejpw==
X-Received: by 2002:a05:6402:234a:b0:5de:a972:8c7 with SMTP id 4fb4d7f45d1cf-5e03722345amr8051740a12.5.1739787635099;
        Mon, 17 Feb 2025 02:20:35 -0800 (PST)
Message-ID: <5ed54fcf-d4fd-4ec0-8c40-1e50d9b16ae2@suse.com>
Date: Mon, 17 Feb 2025 11:20:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] code style: Format ns16550 driver
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: sstabellini@kernel.org, Artem_Mygaiev@epam.com, Luca.Fancellu@arm.com,
 roger.pau@citrix.com, marmarek@invisiblethingslab.com,
 andrew.cooper3@citrix.com, anthony.perard@vates.tech,
 xen-devel@lists.xenproject.org
References: <20250216102108.2665222-1-andr2000@gmail.com>
 <20250216102108.2665222-2-andr2000@gmail.com>
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
In-Reply-To: <20250216102108.2665222-2-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.02.2025 11:21, Oleksandr Andrushchenko wrote:
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -14,7 +14,7 @@
>   * abstracted.
>   */
>  #if defined(CONFIG_HAS_PCI) && defined(CONFIG_X86)
> -# define NS16550_PCI
> +#define NS16550_PCI
>  #endif

Hmm. Either form ought to be okay, so the line would want leaving untouched.

> @@ -43,12 +43,12 @@
>  
>  static struct ns16550 {
>      int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
> -    u64 io_base;   /* I/O port or memory-mapped I/O address. */
> +    u64 io_base; /* I/O port or memory-mapped I/O address. */
>      u64 io_size;
>      int reg_shift; /* Bits to shift register offset by */

Breaking alignment between comments (also in the immediately following hunk),
while at the same time ...

>      int reg_width; /* Size of access to use, the registers
>                      * themselves are still bytes */

... not taking care of the comment style violation here?

> @@ -63,8 +63,8 @@ static struct ns16550 {
>      bool dw_usr_bsy;
>  #ifdef NS16550_PCI
>      /* PCI card parameters. */
> -    bool pb_bdf_enable;     /* if =1, pb-bdf effective, port behind bridge */
> -    bool ps_bdf_enable;     /* if =1, ps_bdf effective, port on pci card */
> +    bool pb_bdf_enable; /* if =1, pb-bdf effective, port behind bridge */
> +    bool ps_bdf_enable; /* if =1, ps_bdf effective, port on pci card */

(Just leaving this here for context of the earlier comment.)

> @@ -248,8 +249,9 @@ static int cf_check ns16550_tx_ready(struct serial_port *port)
>      if ( ns16550_ioport_invalid(uart) )
>          return -EIO;
>  
> -    return ( (ns_read_reg(uart, UART_LSR) &
> -              uart->lsr_mask ) == uart->lsr_mask ) ? uart->fifo_size : 0;
> +    return ((ns_read_reg(uart, UART_LSR) & uart->lsr_mask) == uart->lsr_mask)
> +               ? uart->fifo_size
> +               : 0;

Indentation of the ? and : lines is clearly wrong here? What is the tool
doing?

> @@ -275,9 +277,10 @@ static void pci_serial_early_init(struct ns16550 *uart)
>  #ifdef NS16550_PCI
>      if ( uart->bar && uart->io_base >= 0x10000 )
>      {
> -        pci_conf_write16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
> -                                  uart->ps_bdf[2]),
> -                         PCI_COMMAND, PCI_COMMAND_MEMORY);
> +        pci_conf_write16(
> +            PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1], uart->ps_bdf[2]),
> +            PCI_COMMAND,
> +            PCI_COMMAND_MEMORY);
>          return;
>      }

Hmm, transforming a well-formed block into another well-formed one. No
gain? (Same again further down.)

> @@ -335,14 +338,14 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>      else
>      {
>          /* Baud rate already set: read it out from the divisor latch. */
> -        divisor  = ns_read_reg(uart, UART_DLL);
> +        divisor = ns_read_reg(uart, UART_DLL);
>          divisor |= ns_read_reg(uart, UART_DLM) << 8;

An example where tabulation is being broken. There are quite a bit worse
ones further down.

> @@ -350,8 +353,10 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
>      ns_write_reg(uart, UART_MCR, UART_MCR_DTR | UART_MCR_RTS);
>  
>      /* Enable and clear the FIFOs. Set a large trigger threshold. */
> -    ns_write_reg(uart, UART_FCR,
> -                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
> +    ns_write_reg(uart,
> +                 UART_FCR,
> +                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
> +                     UART_FCR_TRG14);

What's the underlying indentation rule here? The way it's re-formatted
certainly looks odd to me. What we occasionally do in such cases is add
parentheses:

    ns_write_reg(uart,
                 UART_FCR,
                 (UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
                  UART_FCR_TRG14));

Also - does the format they apply demand one argument per line? Else
why not

    ns_write_reg(uart, UART_FCR,
                 (UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
                  UART_FCR_TRG14));

Plus what's their criteria to choose between this style of function calls
and the one in context higher up for calls to pci_conf_write16()?

> @@ -424,31 +430,37 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
>  
>      /* Calculate time to fill RX FIFO and/or empty TX FIFO for polling. */
>      bits = uart->data_bits + uart->stop_bits + !!uart->parity;
> -    uart->timeout_ms = max_t(
> -        unsigned int, 1, (bits * uart->fifo_size * 1000) / uart->baud);
> +    uart->timeout_ms =
> +        max_t(unsigned int, 1, (bits * uart->fifo_size * 1000) / uart->baud);

Again both forms look conforming to me. I think there's a general issue
with the tool making transformations when none are needed. I won't
further point out any such.

> @@ -1197,7 +1174,9 @@ pci_uart_config(struct ns16550 *uart, bool skip_amt, unsigned int idx)
>  
>                  nextf = (f || (pci_conf_read16(PCI_SBDF(0, b, d, f),
>                                                 PCI_HEADER_TYPE) &
> -                               0x80)) ? f + 1 : 8;
> +                               0x80))
> +                            ? f + 1
> +                            : 8;

Again the odd indentation of ? and :.

> @@ -1422,19 +1409,19 @@ struct serial_param_var {
>   * com_console_options for serial port com1 and com2.
>   */
>  static const struct serial_param_var __initconst sp_vars[] = {
> -    {"baud", baud_rate},
> -    {"clock-hz", clock_hz},
> -    {"data-bits", data_bits},
> -    {"io-base", io_base},
> -    {"irq", irq},
> -    {"parity", parity},
> -    {"reg-shift", reg_shift},
> -    {"reg-width", reg_width},
> -    {"stop-bits", stop_bits},
> +    { "baud",      baud_rate  },
> +    { "clock-hz",  clock_hz   },
> +    { "data-bits", data_bits  },
> +    { "io-base",   io_base    },
> +    { "irq",       irq        },
> +    { "parity",    parity     },
> +    { "reg-shift", reg_shift  },
> +    { "reg-width", reg_width  },
> +    { "stop-bits", stop_bits  },
>  #ifdef CONFIG_HAS_PCI
> -    {"bridge", bridge_bdf},
> -    {"dev", device},
> -    {"port", port_bdf},
> +    { "bridge",    bridge_bdf },
> +    { "dev",       device     },
> +    { "port",      port_bdf   },
>  #endif
>  };

Interesting - here tabulation is being introduced.

> @@ -1706,7 +1704,7 @@ static void __init ns16550_parse_port_config(
>      if ( !parse_namevalue_pairs(str, uart) )
>          return;
>  
> - config_parsed:
> +config_parsed:

This is a no-go - ./CODING_STYLE specifically says why this isn't appropriate.

All of the remarks aside, there are also a lot of good changes that are being
made.

Jan

