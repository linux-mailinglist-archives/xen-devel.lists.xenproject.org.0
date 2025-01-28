Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B622BA20F65
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 18:06:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878713.1288907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcp2g-0006xF-0y; Tue, 28 Jan 2025 17:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878713.1288907; Tue, 28 Jan 2025 17:06:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcp2f-0006vg-US; Tue, 28 Jan 2025 17:06:25 +0000
Received: by outflank-mailman (input) for mailman id 878713;
 Tue, 28 Jan 2025 17:06:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcp2e-0006va-QQ
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 17:06:24 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32ea7681-dd9a-11ef-a0e6-8be0dac302b0;
 Tue, 28 Jan 2025 18:06:22 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so1165245566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 09:06:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186d8b2csm7405936a12.76.2025.01.28.09.06.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 09:06:19 -0800 (PST)
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
X-Inumbo-ID: 32ea7681-dd9a-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738083982; x=1738688782; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e5X663P4en3YR5ZbXxt+29IcazmwoosY2ySdVtlKhQU=;
        b=J9CbkG1p9sfQzl33eDAybybTp06BoKo2+ZWPTvrS5NlReudLuMOaSw5WSYOJI7uPe0
         vjpKD71JpMmDZQc/Qgx8qVV0raQ4oOtn6XZl4J7tGmZpKouj+YelHOXjMqr5or0ZgS7J
         oA4kHQozAISvDoN0TITGe4PHx+Asa8NIzEZCdfEQ9IFrSXXs9LrMPZeHqK4lR7ey/4nw
         ieVgknUduxBa0XFUCplFI6OgsBkJ2cerLVlZzW+LkjJxHgpDJQPCg+z4V1IpgaqRBZMU
         JrZimCstcPPxd/LQLlty9Caj3VIFZBysp/pdR0seAVls31FeNuq+C7nXeIjtHCCtUtOY
         Jn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738083982; x=1738688782;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5X663P4en3YR5ZbXxt+29IcazmwoosY2ySdVtlKhQU=;
        b=etz3emeJ8ojRWg4J58+WMEXeRRaJAaqLxHtfb7Ka0ZNDSmvPOiIvggD/ASWPjfvbm4
         avLt3VZcaES9qz19l5SJmhGKlJdqnoOTzIHaJVUPWfO/rv08/TQIpy2IshpLdd+zyX/u
         rAz+DVpO9QiNY5quBTERKisltgx518JzAg51/FszHxS5pAbgoqd8KYdiWksmc0kTVkZI
         mcHRwSzbJ/YaXJxP4jcayImTxPP2+C4KlE5va8onlXPXXrmeDXajdpr/csU5kMrzbCwz
         OPTDUc6I9U+geiQr0ht0CjmaatdMM7EBLMpLgf98KUMcFnMBOSnVfo4op/z/UIzwY+ml
         B9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCU03chWnc1gMBSzGLy8hpF18kjyMIZzac9o5iLR4Azt3c2x7PskQH18o/XJcAuZSSlPJJAyvgMlObI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcqUTsjZ2kH1tqW4ypBpinz0HFFJKmd9OLhaXzqwN9FENrvPC0
	1Pw7lRyHdgBsDzV+YjSs1HWFLui+knK2Ba45cqfeFacypbB5zM7mX1x9hUcnbg==
X-Gm-Gg: ASbGncukwUjklVxzacFeQNm/ab1xpS348BbFFUR2EaseLrZ6SceYYr9EDKcEu4rsbJB
	ydz3TozZ88CaVNfkjj9f3iYN6dNJYLbupeRU5HXS7uSdAkWDhmSITNnXfi/WoD1Fw6jVdEM0vIc
	KNQDWV+fevzh9GHUourndR9l8zMVdSJQr/+F1S5u7QeP+uwgRIAlMrmtwAIflFJ4VkFkR8RTe/r
	LeZfWMPxN7F1R5NhVnoOtj1cvblAMis1jcUyBxele+OjYTiSjwJSGOD1M41GSj28xFilzVI0k+v
	tqlBJ26PqRQ+buNFKPrXmTf8klkGLOb539jMDBDystUFtxcmdBg7o5dN4/RhRtPSKXOYW0cOfas
	uhd1dmGXUtDY=
X-Google-Smtp-Source: AGHT+IHfiCDvIODhw0y4B5tZznVO2YVbxwwgWs4Q8B+oXLHrj3lADlrGJQgimmmiVFkWRE2RdzUdRw==
X-Received: by 2002:a17:907:1c0a:b0:aa6:5eae:7ece with SMTP id a640c23a62f3a-ab38b42e649mr4046044466b.43.1738083980265;
        Tue, 28 Jan 2025 09:06:20 -0800 (PST)
Message-ID: <475cd06a-f659-4921-8910-4b6033a4c95b@suse.com>
Date: Tue, 28 Jan 2025 18:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/24] xen/8250-uart: add missing definitions
To: dmukhin@ford.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
 <20250103-vuart-ns8250-v3-v1-19-c5d36b31d66c@ford.com>
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
In-Reply-To: <20250103-vuart-ns8250-v3-v1-19-c5d36b31d66c@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 02:58, Denis Mukhin via B4 Relay wrote:
> @@ -51,12 +54,19 @@
>  #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
>  #define UART_IIR_MSI      0x00    /*  - MODEM status      */
>  #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
> +#define UART_IIR_FE       0xC0    /* FIFO enabled (2 bits) */

Please can you use lower case hex digits?

> @@ -64,17 +74,17 @@
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

What is this change about? All I can see is that the table heading no
longer aligns with table contents.

> @@ -96,11 +106,33 @@
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

I find it odd for a bit to be reserved and also not reserved.

> +#define UART_MCR_RESERVED2      BIT(7, U)   /* Reserved #2 */
> +#define UART_MCR_MASK \
> +    (UART_MCR_DTR | UART_MCR_RTS | \
> +     UART_MCR_OUT1 | UART_MCR_OUT2 | \
> +     UART_MCR_LOOP)

Yet then not including UART_MCR_TCRTLR?

> @@ -111,6 +143,7 @@
>  #define UART_LSR_THRE     0x20    /* Xmit hold reg empty  */
>  #define UART_LSR_TEMT     0x40    /* Xmitter empty        */
>  #define UART_LSR_ERR      0x80    /* Error                */
> +#define UART_LSR_MASK     (UART_LSR_OE | UART_LSR_BI)

On what basis were these two bits chose and the others left out?

Jan

