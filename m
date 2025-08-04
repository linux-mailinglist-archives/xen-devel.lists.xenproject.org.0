Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B2B19FA6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 12:23:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069046.1432889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uisLw-0006cL-ND; Mon, 04 Aug 2025 10:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069046.1432889; Mon, 04 Aug 2025 10:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uisLw-0006as-Iq; Mon, 04 Aug 2025 10:23:36 +0000
Received: by outflank-mailman (input) for mailman id 1069046;
 Mon, 04 Aug 2025 10:23:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uisLv-0006ab-Iz
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 10:23:35 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13060253-711d-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 12:23:33 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af8f5e38a9fso725037266b.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 03:23:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a07643asm714519866b.15.2025.08.04.03.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 03:23:32 -0700 (PDT)
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
X-Inumbo-ID: 13060253-711d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754303013; x=1754907813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U4/17IAWRi9p7molx6IEgMqCYH29SaH9YLUZcXW9ikI=;
        b=CPXZKvmcqbmtgMXrWErJ84QkaDhRZV97irSCRoloG5TpBy3nwxcOLq4xcfPxxXnPMw
         0V5rIowjR9Z3+kOp+61qGjVjAS2BNVbnvgPMwPNFuRPdD022AQcQn5Je2bL57XAQe4/m
         +zJGUSbdJNcPfdCJ/gQ6+zuZ6IPXYTix2xONYqkihqK+/bBXVaiNxTRKev9eDSwIy1iY
         nXnYBUmz8MdthTIgw8zVrO1pPA4rFmQ5ikO4ja9D7O6nXRIqUFbjGIgfXM0s8uiOssOL
         wkUe+RZ7ybB14u9tUiVG9efTUTE1iSA8moqmmTvbXFKll1KFVQe20QXq+JgNToQN9Cnx
         xQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754303013; x=1754907813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4/17IAWRi9p7molx6IEgMqCYH29SaH9YLUZcXW9ikI=;
        b=IL+sv5Qx9hr2NWI5970Q8FPHPzimf5tdmB8ViN+Z1SwIlmrexcGXQZo3aJOWqdo8xb
         TYyoFFsvbhZjigf4XiR/XUFMDJs8iOn4NSlI4kKqeKlQ50lxyzRmIyf9v0qFdTQIYM7A
         iDzkg1DyISyhGzcUHbqvuFImj5yaRp9481KOt1JY2SSjmZhPMOSwSaCvpuX+w+mMuJ+b
         qmopUjLU2qJAJShNrw1BuXZlb8DuhXtYmcjyG8Xmreuc1BWMT/0MwNVqckG47UUH90Y+
         JIHvNonwaiJldVPxPY+LKIdtAlvJlaeSylo1uEQixusNx33O0dQbjDESBR2kaUGMduev
         AfVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3EBXgRRLJCJk2gX+OIxwjC/qtzk2I4S78+BUZ9NKYp89oYpW9L8aHFBIv02pFMPWVjVpvfc1lzm4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxcSbWxj8ztI0cH2hVg3PKK8YGYOLqmMmOhz7JI23nAAYwnpwDU
	W9bzPU1hQXtKHDggk58DW8xW61ufSDfp3Lb+xSNqA7rW78zZmCMQLCQbF02uiTNa2g==
X-Gm-Gg: ASbGncsSz8fyGvU/ei3pau7L2cBQmIjNKFx0scxQL2bFqE/D4gWbupS6FPUila1crcu
	VJO669ZUtP3nP7+gPp16M0zPIrk9QznX4B1wu3hnGLOktIQs5nmOtZPxUTUhYdwvIRz7InfQ27K
	kUeO1MJpq56RNQcpDOenjRKrvphNu9kDOhFOISvHElSGJKJmvVGcILVJeNHeSESXtln+M9jyfH4
	cK/7j7rYUUAr/kEHQ9JpOHpMgn1xwRZQoNxtc9AikgiWPJPtJa/OKzQlVMXAiqndeKjSv5Uypp4
	VnAVTY/Tj2EYS3/UBnG/qlnG+zGS9za1APioAJQRi6OnjnBpljQ8PHG+qnFYiY70PYjBnvckWAQ
	rQrmjwTAPI2uonPYfxzCibUtqrAVRlnQYe9dZy53L1qtjc9CA136vUcBVHV+TljWzsNLcnYMlnr
	oKvRghTSGIAF5up9F63g==
X-Google-Smtp-Source: AGHT+IGAQwVMmL2ok3cQ9Djkh/UxhIOXjTupYD9FwM5Br73TQwm/JdbI+2SwNW9FBSI0FM3Sg/U8ng==
X-Received: by 2002:a17:906:1d47:b0:af9:5260:9ed6 with SMTP id a640c23a62f3a-af95260aa04mr610482866b.3.1754303013032;
        Mon, 04 Aug 2025 03:23:33 -0700 (PDT)
Message-ID: <b207d809-bd2a-43fb-9592-58e8c37de31a@suse.com>
Date: Mon, 4 Aug 2025 12:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] xen/8250-uart: update definitions
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250731192130.3948419-1-dmukhin@ford.com>
 <20250731192130.3948419-5-dmukhin@ford.com>
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
In-Reply-To: <20250731192130.3948419-5-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 21:22, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Added missing definitions needed for NS16550 UART emulator.
> 
> Newly introduced MSR definitions re-used in the existing ns16550 driver.
> 
> Also, corrected FCR DMA definition bit#3 (0x08) as per:
>   https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
> See "7.7.2 FIFO Control Register (FCR)".
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v3:
> - feedback addressed
> - made use of new UART_MCR_XXX bits in ns16550 driver
> - Link to v3: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-19-c5d36b31d66c@ford.com/
> ---
>  xen/drivers/char/ns16550.c  |  6 ++---
>  xen/include/xen/8250-uart.h | 50 ++++++++++++++++++++++++++++++-------
>  2 files changed, 44 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
> index df7fff7f81df..a899711e2a8b 100644
> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -739,9 +739,9 @@ static int __init check_existence(struct ns16550 *uart)
>       * Check to see if a UART is really there.
>       * Use loopback test mode.
>       */
> -    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | 0x0A);
> -    status = ns_read_reg(uart, UART_MSR) & 0xF0;
> -    return (status == 0x90);
> +    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | UART_MCR_RTS | UART_MCR_OUT2);
> +    status = ns_read_reg(uart, UART_MSR) & UART_MSR_STATUS;
> +    return (status == (UART_MSR_CTS | UART_MSR_DCD));
>  }
>  
>  #ifdef CONFIG_HAS_PCI
> diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
> index d13352940c13..bc11cdc376c9 100644
> --- a/xen/include/xen/8250-uart.h
> +++ b/xen/include/xen/8250-uart.h
> @@ -32,6 +32,7 @@
>  #define UART_MCR          0x04    /* Modem control        */
>  #define UART_LSR          0x05    /* line status          */
>  #define UART_MSR          0x06    /* Modem status         */
> +#define UART_SCR          0x07    /* Scratch pad          */
>  #define UART_USR          0x1f    /* Status register (DW) */
>  #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=1) */
>  #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=1) */
> @@ -42,6 +43,8 @@
>  #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
>  #define UART_IER_ELSI     0x04    /* rx line status       */
>  #define UART_IER_EMSI     0x08    /* MODEM status         */
> +#define UART_IER_MASK \
> +    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)

At the example of this: It having no users here, how are we to know it'll
gain some (and hence be useful)? Adding missing base definitions is imo
fine without immediate users, but for derived ones it's less clear.

Jan

