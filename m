Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF889EEA03
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 16:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856138.1268864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLkn0-0000uL-Mx; Thu, 12 Dec 2024 15:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856138.1268864; Thu, 12 Dec 2024 15:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLkn0-0000sA-Jc; Thu, 12 Dec 2024 15:07:42 +0000
Received: by outflank-mailman (input) for mailman id 856138;
 Thu, 12 Dec 2024 15:07:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLkmz-0000rw-9X
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 15:07:41 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d46e0c81-b89a-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 16:07:40 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so2386435e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 07:07:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362559ef5bsm19028805e9.24.2024.12.12.07.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 07:07:37 -0800 (PST)
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
X-Inumbo-ID: d46e0c81-b89a-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734016060; x=1734620860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ym8/EVixyFMihplOZa+TuRa9VkEPjJ16liKFp/tRpDo=;
        b=BD7d5O7dcRkRg77FYab30TsKSjtDRszJZ8xOLGShKN2O5c2YZ2NEq0Erk4aXvRqwal
         z5Zs0JzxKWmLGK91AOuWUsCbHQkNiICeyHRZo35JBU2B23m1VC/ElnnX6PMWeCuNWYTr
         MP39dj+LFE0cyrXq05D66nHZW/NrxrE93AxarEcHlBgANU3q7chuUYEv0b9lWzpEjFAK
         ES0H+A+wcmA0QYC+St1Z0f7sEP6m+78VErnniatOtiaBLHCW3+RoKFRg80JWNn0VKu2D
         A1eQO8BaSgyv9+eeHARYmH3GBBPiE7YjwGeWvQuK9IIyNRODlha/Z72UhAuff0VN+Hu0
         9bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016060; x=1734620860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ym8/EVixyFMihplOZa+TuRa9VkEPjJ16liKFp/tRpDo=;
        b=UVtAOqLUeiwhenglujqi0mOMBUWT+RLlN1gzYGK9Lsb6HHSuaJKHCkwSUHlLlJztkU
         xaIgqhhwrO+YM/yAWdDdkgU9+uDEj3Qv1zpD1SDs8D3sELhOibDYN/RJ5eiMOxYzxLq4
         lEdNJv778VbbnJWxnU3yY8gHMItmUHc4L7affGkiXtokEtL04MCCVdmafBlIrxuZTXdP
         AcZ+N3kOwxawvUM+NPKHAkRI4gEJt1NTl/d1Ruyh58FBM5ly1NIrlf2CSU1MaGRGkRIx
         BAjST3xf2Y2Um7kFPefgAqWi0B94m/S5oDUaebY0N0evbSTPfMOAeoqzRh4yLdq/xkEw
         fqCg==
X-Forwarded-Encrypted: i=1; AJvYcCVOp8OTip+SPnH0oTNTHXQnEDYmv8kUE49p7BM5N5OnBYRX+GUFviy6CvAncBSmOrxWDFBk/2ItQ3I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9ju8aL+/douhbtpjBmZA6rckhy2uhHQALO3cueik5EACKsvHx
	8V7cM5z3nqCrTg7/Y47gJHz84AYwXXUosfWxq8Yb49SdHjsXHpuapkEizA7azVGZwIy3E3zDpy4
	=
X-Gm-Gg: ASbGncv3Yj5DiToMb6j50LbXMu+ICme3LAbAi7PnLCwz9IzZY9CDVHh6e2Kw/kO/EzB
	iavf5HzcxqtbbTrOFtt9SHbM5i6RV9oSVZhyWcXTQoSCFJcL825g5KIFmhN/VWYKqzylBnRJIQm
	CT7f5qWpwGZaAupaef82fq89ExrLKqVqTQDLkIWVmfColTAzpvI2ErKmEtD+3z3scXtaMVdEtAw
	4EZ2/8qgd//TI9hHJuQ9ZT4zKoNGHizFu20ls6/Ed7iBVxqLbdN005RF7yKT3n1KnjXsgb3RMkY
	GRY8Mk6e2qtaHcu0LKLMgc5q37TvHMuuecLizP0ZnQ==
X-Google-Smtp-Source: AGHT+IEvrLNnvMAGkxcEuXSO77UYxwNXfTUXhG84+AXug8LYRee3sinsr7vZ2FQwTZVC+r+3CP9y0g==
X-Received: by 2002:a05:600c:1c10:b0:434:a91e:c709 with SMTP id 5b1f17b1804b1-43622864830mr26897575e9.28.1734016058070;
        Thu, 12 Dec 2024 07:07:38 -0800 (PST)
Message-ID: <e10255e4-c5e5-4cc7-9665-6852252e93cc@suse.com>
Date: Thu, 12 Dec 2024 16:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 28/35] xen/8250-uart: add missing definitions
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-28-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-28-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> --- a/xen/include/xen/8250-uart.h
> +++ b/xen/include/xen/8250-uart.h
> @@ -32,16 +32,22 @@
>  #define UART_MCR          0x04    /* Modem control        */
>  #define UART_LSR          0x05    /* line status          */
>  #define UART_MSR          0x06    /* Modem status         */
> +#define UART_SCR          0x07    /* Scratch pad          */
>  #define UART_USR          0x1f    /* Status register (DW) */
>  #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=1) */
>  #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=1) */
>  #define UART_XR_EFR       0x09    /* Enhanced function register (Exar) */
>  
> +/* ns8250 emulator: range of emulated registers [0..UART_MAX-1] */
> +#define UART_MAX          (UART_SCR + 1)

There are two issues here: "max" means "highest within range", yet
you define it as "first invalid", i.e. something we'd normally call
"_NR" or "_NUM". And then, as the comment says, this is a limit the
emulation is going to expose, not something generally applicable to
UARTs of this kind. Hence the UART_ prefix alone isn't quite correct
either.

> @@ -51,12 +57,21 @@
>  #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
>  #define UART_IIR_MSI      0x00    /*  - MODEM status      */
>  #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
> +#define UART_IIR_FE0      BIT(6, U) /* FIFO enable #0 */
> +#define UART_IIR_FE1      BIT(7, U) /* FIFO enable #1 */
> +#define UART_IIR_FE_MASK  (UART_IIR_FE0 | UART_IIR_FE1)

Much like BSY is a 3-bit field, aiui this is a 2-bit one.

>  /* FIFO Control Register */
> -#define UART_FCR_ENABLE   0x01    /* enable FIFO          */
> -#define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
> -#define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
> -#define UART_FCR_DMA      0x10    /* enter DMA mode       */
> +#define UART_FCR_ENABLE     BIT(0, U)   /* enable FIFO          */
> +#define UART_FCR_CLRX       BIT(1, U)   /* clear Rx FIFO        */
> +#define UART_FCR_CLTX       BIT(2, U)   /* clear Tx FIFO        */
> +#define UART_FCR_DMA        BIT(3, U)   /* enter DMA mode       */
> +#define UART_FCR_RESERVED0  BIT(4, U)   /* reserved; always 0   */
> +#define UART_FCR_RESERVED1  BIT(5, U)   /* reserved; always 0   */
> +#define UART_FCR_RTB0       BIT(6, U)   /* receiver trigger bit #0 */
> +#define UART_FCR_RTB1       BIT(7, U)   /* receiver trigger bit #1 */
> +#define UART_FCR_TRG_MASK   (UART_FCR_RTB0 | UART_FCR_RTB1)

Much like the top two bits here are, and - as Roger has said - the
reserved bits probably also should be.

> @@ -64,17 +79,17 @@
>  
>  /*
>   * Note: The FIFO trigger levels are chip specific:
> - *	RX:76 = 00  01  10  11	TX:54 = 00  01  10  11
> - * PC16550D:	 1   4   8  14		xx  xx  xx  xx
> - * TI16C550A:	 1   4   8  14          xx  xx  xx  xx
> - * TI16C550C:	 1   4   8  14          xx  xx  xx  xx
> - * ST16C550:	 1   4   8  14		xx  xx  xx  xx
> - * ST16C650:	 8  16  24  28		16   8  24  30	PORT_16650V2
> - * NS16C552:	 1   4   8  14		xx  xx  xx  xx
> - * ST16C654:	 8  16  56  60		 8  16  32  56	PORT_16654
> - * TI16C750:	 1  16  32  56		xx  xx  xx  xx	PORT_16750
> - * TI16C752:	 8  16  56  60		 8  16  32  56
> - * Tegra:	 1   4   8  14		16   8   4   1	PORT_TEGRA
> + *  RX:76 = 00  01  10  11  TX:54 = 00  01  10  11
> + * PC16550D:     1   4   8  14      xx  xx  xx  xx
> + * TI16C550A:    1   4   8  14      xx  xx  xx  xx
> + * TI16C550C:    1   4   8  14      xx  xx  xx  xx
> + * ST16C550:     1   4   8  14      xx  xx  xx  xx
> + * ST16C650:     8  16  24  28      16   8  24  30  PORT_16650V2
> + * NS16C552:     1   4   8  14      xx  xx  xx  xx
> + * ST16C654:     8  16  56  60       8  16  32  56  PORT_16654
> + * TI16C750:     1  16  32  56      xx  xx  xx  xx  PORT_16750
> + * TI16C752:     8  16  56  60       8  16  32  56
> + * Tegra:        1   4   8  14      16   8   4   1  PORT_TEGRA
>   */

While perhaps okay, the adjustment of this table still looks unrelated.
It wants at least mentioning in the description, to clarify it's an
intentional change (as opposed to e.g. being an effect of how your
editor is configured).

> @@ -96,11 +111,31 @@
>  #define UART_LCR_CONF_MODE_B	0xBF		/* Configuration mode B */
>  
>  /* Modem Control Register */
> -#define UART_MCR_DTR      0x01    /* Data Terminal Ready  */
> -#define UART_MCR_RTS      0x02    /* Request to Send      */
> -#define UART_MCR_OUT2     0x08    /* OUT2: interrupt mask */
> -#define UART_MCR_LOOP     0x10    /* Enable loopback test mode */
> -#define UART_MCR_TCRTLR   0x40    /* Access TCR/TLR (TI16C752, EFR[4]=1) */
> +#define UART_MCR_DTR            BIT(0, U)   /* Data Terminal Ready  */
> +#define UART_MCR_RTS            BIT(1, U)   /* Request to Send      */
> +#define UART_MCR_OUT1           BIT(2, U)   /* OUT1: interrupt mask */
> +#define UART_MCR_OUT2           BIT(3, U)   /* OUT2: interrupt mask */
> +#define UART_MCR_LOOP           BIT(4, U)   /* Enable loopback test mode */
> +#define UART_MCR_RESERVED0      BIT(5, U)   /* Reserved #0 */
> +#define UART_MCR_RESERVED1      BIT(6, U)   /* Reserved #1 */
> +#define UART_MCR_TCRTLR         BIT(6, U)   /* Access TCR/TLR (TI16C752, EFR[4]=1) */
> +#define UART_MCR_RESERVED2      BIT(7, U)   /* Reserved #2 */
> +#define UART_MCR_MASK \
> +    (UART_MCR_DTR | UART_MCR_RTS | \
> +     UART_MCR_OUT1 | UART_MCR_OUT2 | \
> +     UART_MCR_LOOP)
> +
> +/* Modem Status Register */
> +#define UART_MSR_DCTS           BIT(0, U)   /* Change in CTS */
> +#define UART_MSR_DDSR           BIT(1, U)   /* Change in DSR */
> +#define UART_MSR_TERI           BIT(2, U)   /* Change in RI */
> +#define UART_MSR_DDCD           BIT(3, U)   /* Change in CTS */
> +#define UART_MSR_CTS            BIT(4, U)
> +#define UART_MSR_DSR            BIT(5, U)
> +#define UART_MSR_RI             BIT(6, U)
> +#define UART_MSR_DCD            BIT(7, U)

As you introduce these constants, I think you also want to switch the sole
MSR read we have to actually use them.

Jan

